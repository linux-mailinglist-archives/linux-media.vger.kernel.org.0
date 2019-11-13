Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 298BAFAC1A
	for <lists+linux-media@lfdr.de>; Wed, 13 Nov 2019 09:31:19 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726983AbfKMIbP (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 13 Nov 2019 03:31:15 -0500
Received: from mx08-00178001.pphosted.com ([91.207.212.93]:56912 "EHLO
        mx07-00178001.pphosted.com" rhost-flags-OK-OK-OK-FAIL)
        by vger.kernel.org with ESMTP id S1725966AbfKMIbP (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 13 Nov 2019 03:31:15 -0500
Received: from pps.filterd (m0046661.ppops.net [127.0.0.1])
        by mx08-00178001.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id xAD8LxPo007414;
        Wed, 13 Nov 2019 09:31:09 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=st.com; h=from : to : cc : subject
 : date : message-id : references : in-reply-to : content-type : content-id
 : content-transfer-encoding : mime-version; s=STMicroelectronics;
 bh=tCwbuJ7ZZz84F+Cac8iOAH9+hr3GdXrbsKUSXJNB7YM=;
 b=rrZ+Xa90m4pT77radrMw/Nax5lGsdk24w7llmESCwPgbJiUrANEjskTPwLNLW8EdPyvC
 0kApV8Ec84Mm78cJg4i0NYzM/B4qib/2614UBlNw2WA7wnjbylHY49Fj7ptC/+0qmLlD
 8z7fj2WRYcV68orGbmFwEtSEAIi5o3TNVksFcPQAGsN0Wh/53VYF/rMr+HDUiefsN8SV
 2gKmzUFCbz2KKa8b/8HF394d7AJ9KLjLXTP23SAawtUWf9Eq77IgoEtOxwv6c2WVO8fK
 JIXU8nW7JzXLP3Zu1I8e7Um9ZM7W1bkt6BZfnA+4IOQiIiBhOvA1jwIvsRZJa9CDPZEM Jg== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
        by mx08-00178001.pphosted.com with ESMTP id 2w7pstxu8e-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Wed, 13 Nov 2019 09:31:09 +0100
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
        by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id C008710002A;
        Wed, 13 Nov 2019 09:31:08 +0100 (CET)
Received: from Webmail-eu.st.com (sfhdag5node1.st.com [10.75.127.13])
        by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id B35E02B187F;
        Wed, 13 Nov 2019 09:31:08 +0100 (CET)
Received: from SFHDAG5NODE3.st.com (10.75.127.15) by SFHDAG5NODE1.st.com
 (10.75.127.13) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Wed, 13 Nov
 2019 09:31:08 +0100
Received: from SFHDAG5NODE3.st.com ([fe80::7c09:5d6b:d2c7:5f47]) by
 SFHDAG5NODE3.st.com ([fe80::7c09:5d6b:d2c7:5f47%20]) with mapi id
 15.00.1473.003; Wed, 13 Nov 2019 09:31:08 +0100
From:   Fabien DESSENNE <fabien.dessenne@st.com>
To:     Chuhong Yuan <hslester96@gmail.com>
CC:     Mauro Carvalho Chehab <mchehab@kernel.org>,
        "linux-media@vger.kernel.org" <linux-media@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH] media: bdisp: add missed destroy_workqueue in remove and
 probe failure
Thread-Topic: [PATCH] media: bdisp: add missed destroy_workqueue in remove and
 probe failure
Thread-Index: AQHVmezcqeNG3nZyW0iK6S5WdicKn6eItMaA
Date:   Wed, 13 Nov 2019 08:31:08 +0000
Message-ID: <f4af41fc-f335-9973-1861-6635cc0e123e@st.com>
References: <20191113063730.8776-1-hslester96@gmail.com>
In-Reply-To: <20191113063730.8776-1-hslester96@gmail.com>
Accept-Language: fr-FR, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
x-ms-exchange-messagesentrepresentingtype: 1
x-ms-exchange-transport-fromentityheader: Hosted
x-originating-ip: [10.75.127.50]
Content-Type: text/plain; charset="utf-8"
Content-ID: <5124C79677A8A147981DD104BE59B0ED@st.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.95,18.0.572
 definitions=2019-11-13_01:2019-11-13,2019-11-13 signatures=0
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

SGkgQ2h1aG9uZywNCg0KDQpUaGFuayB5b3UgZm9yIHRoZSBwYXRjaC4NCg0KDQpPbiAxMy8xMS8y
MDE5IDc6MzcgQU0sIENodWhvbmcgWXVhbiB3cm90ZToNCj4gVGhlIGRyaXZlciBmb3JnZXRzIHRv
IGNhbGwgZGVzdHJveV93b3JrcXVldWUgd2hlbiByZW1vdmUgYW5kIHByb2JlIGZhaWxzLg0KPiBB
ZGQgdGhlIG1pc3NlZCBjYWxscyB0byBmaXggaXQuDQo+DQo+IFNpZ25lZC1vZmYtYnk6IENodWhv
bmcgWXVhbiA8aHNsZXN0ZXI5NkBnbWFpbC5jb20+DQoNClJldmlld2VkLWJ5OiBGYWJpZW4gRGVz
c2VubmUgPGZhYmllbi5kZXNzZW5uZUBzdC5jb20+DQoNCg0KPiAtLS0NCj4gICBkcml2ZXJzL21l
ZGlhL3BsYXRmb3JtL3N0aS9iZGlzcC9iZGlzcC12NGwyLmMgfCAxMyArKysrKysrKystLS0tDQo+
ICAgMSBmaWxlIGNoYW5nZWQsIDkgaW5zZXJ0aW9ucygrKSwgNCBkZWxldGlvbnMoLSkNCj4NCj4g
ZGlmZiAtLWdpdCBhL2RyaXZlcnMvbWVkaWEvcGxhdGZvcm0vc3RpL2JkaXNwL2JkaXNwLXY0bDIu
YyBiL2RyaXZlcnMvbWVkaWEvcGxhdGZvcm0vc3RpL2JkaXNwL2JkaXNwLXY0bDIuYw0KPiBpbmRl
eCBlOTBmMWJhMzA1NzQuLjRjMGIzNjIzNmEzOCAxMDA2NDQNCj4gLS0tIGEvZHJpdmVycy9tZWRp
YS9wbGF0Zm9ybS9zdGkvYmRpc3AvYmRpc3AtdjRsMi5jDQo+ICsrKyBiL2RyaXZlcnMvbWVkaWEv
cGxhdGZvcm0vc3RpL2JkaXNwL2JkaXNwLXY0bDIuYw0KPiBAQCAtMTI3NSw2ICsxMjc1LDggQEAg
c3RhdGljIGludCBiZGlzcF9yZW1vdmUoc3RydWN0IHBsYXRmb3JtX2RldmljZSAqcGRldikNCj4g
ICAJaWYgKCFJU19FUlIoYmRpc3AtPmNsb2NrKSkNCj4gICAJCWNsa191bnByZXBhcmUoYmRpc3At
PmNsb2NrKTsNCj4gICANCj4gKwlkZXN0cm95X3dvcmtxdWV1ZShiZGlzcC0+d29ya19xdWV1ZSk7
DQo+ICsNCj4gICAJZGV2X2RiZygmcGRldi0+ZGV2LCAiJXMgZHJpdmVyIHVubG9hZGVkXG4iLCBw
ZGV2LT5uYW1lKTsNCj4gICANCj4gICAJcmV0dXJuIDA7DQo+IEBAIC0xMzE4LDIwICsxMzIwLDIy
IEBAIHN0YXRpYyBpbnQgYmRpc3BfcHJvYmUoc3RydWN0IHBsYXRmb3JtX2RldmljZSAqcGRldikN
Cj4gICAJYmRpc3AtPnJlZ3MgPSBkZXZtX2lvcmVtYXBfcmVzb3VyY2UoZGV2LCByZXMpOw0KPiAg
IAlpZiAoSVNfRVJSKGJkaXNwLT5yZWdzKSkgew0KPiAgIAkJZGV2X2VycihkZXYsICJmYWlsZWQg
dG8gZ2V0IHJlZ3NcbiIpOw0KPiAtCQlyZXR1cm4gUFRSX0VSUihiZGlzcC0+cmVncyk7DQo+ICsJ
CXJldCA9IFBUUl9FUlIoYmRpc3AtPnJlZ3MpOw0KPiArCQlnb3RvIGVycl93cTsNCj4gICAJfQ0K
PiAgIA0KPiAgIAliZGlzcC0+Y2xvY2sgPSBkZXZtX2Nsa19nZXQoZGV2LCBCRElTUF9OQU1FKTsN
Cj4gICAJaWYgKElTX0VSUihiZGlzcC0+Y2xvY2spKSB7DQo+ICAgCQlkZXZfZXJyKGRldiwgImZh
aWxlZCB0byBnZXQgY2xvY2tcbiIpOw0KPiAtCQlyZXR1cm4gUFRSX0VSUihiZGlzcC0+Y2xvY2sp
Ow0KPiArCQlyZXQgPSBQVFJfRVJSKGJkaXNwLT5jbG9jayk7DQo+ICsJCWdvdG8gZXJyX3dxOw0K
PiAgIAl9DQo+ICAgDQo+ICAgCXJldCA9IGNsa19wcmVwYXJlKGJkaXNwLT5jbG9jayk7DQo+ICAg
CWlmIChyZXQgPCAwKSB7DQo+ICAgCQlkZXZfZXJyKGRldiwgImNsb2NrIHByZXBhcmUgZmFpbGVk
XG4iKTsNCj4gICAJCWJkaXNwLT5jbG9jayA9IEVSUl9QVFIoLUVJTlZBTCk7DQo+IC0JCXJldHVy
biByZXQ7DQo+ICsJCWdvdG8gZXJyX3dxOw0KPiAgIAl9DQo+ICAgDQo+ICAgCXJlcyA9IHBsYXRm
b3JtX2dldF9yZXNvdXJjZShwZGV2LCBJT1JFU09VUkNFX0lSUSwgMCk7DQo+IEBAIC0xNDAzLDcg
KzE0MDcsOCBAQCBzdGF0aWMgaW50IGJkaXNwX3Byb2JlKHN0cnVjdCBwbGF0Zm9ybV9kZXZpY2Ug
KnBkZXYpDQo+ICAgZXJyX2NsazoNCj4gICAJaWYgKCFJU19FUlIoYmRpc3AtPmNsb2NrKSkNCj4g
ICAJCWNsa191bnByZXBhcmUoYmRpc3AtPmNsb2NrKTsNCj4gLQ0KPiArZXJyX3dxOg0KPiArCWRl
c3Ryb3lfd29ya3F1ZXVlKGJkaXNwLT53b3JrX3F1ZXVlKTsNCj4gICAJcmV0dXJuIHJldDsNCj4g
ICB9DQo+ICAg
