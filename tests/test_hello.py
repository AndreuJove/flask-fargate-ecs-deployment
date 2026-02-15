
def test_index_is_success(client):
    response = client.get('/')
    assert response.status_code == 200
    assert response.json.get('status') == 'online'

def test_hello_page_is_success(client):
    response = client.get('/hello')
    assert response.status_code == 200
    assert response.get_data(as_text=True) == 'Hello, World'

def test_not_found(client):
    response = client.get('/does-not-exist')
    assert response.status_code == 404

def test_valentines_endpoint(client):
    response = client.get('/valentines')
    data = response.get_json()
    assert response.status_code == 200
    assert data["message"] == "Happy Valentine's Day"

def test_valentines_version_endpoint(client):
    response = client.get('/test')
    data = response.get_json()

    assert response.status_code == 200
    assert data["message"] == "test version 3.0.0"