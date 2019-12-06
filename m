Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 9221D114D2D
	for <lists+linux-media@lfdr.de>; Fri,  6 Dec 2019 09:06:55 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726809AbfLFIGv (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 6 Dec 2019 03:06:51 -0500
Received: from mailgw02.mediatek.com ([210.61.82.184]:48767 "EHLO
        mailgw02.mediatek.com" rhost-flags-OK-FAIL-OK-FAIL) by vger.kernel.org
        with ESMTP id S1725858AbfLFIGv (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Fri, 6 Dec 2019 03:06:51 -0500
X-UUID: b64d99dd417f4897b5fe8611d274e3ad-20191206
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
        h=Content-Transfer-Encoding:MIME-Version:Content-Type:References:In-Reply-To:Date:CC:To:From:Subject:Message-ID; bh=lVZrCUbqLoiMSbjwNFA0HHxnz+mVQqg4nD2qHvV3jxo=;
        b=JjUwosIigrqrNMSo7X6lD2hG7u//9qAdGptzrFB1HR5x5i/8Vrtn4N2MtvfZqos0DbRR+sbMH/orYW7Y8JlRJP7yO/eWSJclBQQZJUB0L7t2qvtnMksOR808INHTsraWKnMNMH4j6dUPVqpI5qX5Ry9ZruwNSnz2jHFEaBqcIbE=;
X-UUID: b64d99dd417f4897b5fe8611d274e3ad-20191206
Received: from mtkcas07.mediatek.inc [(172.21.101.84)] by mailgw02.mediatek.com
        (envelope-from <xia.jiang@mediatek.com>)
        (Cellopoint E-mail Firewall v4.1.10 Build 0809 with TLS)
        with ESMTP id 1908250467; Fri, 06 Dec 2019 16:06:47 +0800
Received: from mtkcas09.mediatek.inc (172.21.101.178) by
 mtkmbs07n2.mediatek.inc (172.21.101.141) with Microsoft SMTP Server (TLS) id
 15.0.1395.4; Fri, 6 Dec 2019 16:06:33 +0800
Received: from [10.17.3.153] (10.17.3.153) by mtkcas09.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1395.4 via Frontend
 Transport; Fri, 6 Dec 2019 16:06:32 +0800
Message-ID: <1575619605.17879.3.camel@mhfsdcap03>
Subject: Re: [PATCH v4 5/5] media: platform: Add jpeg dec/enc feature
From:   Xia Jiang <xia.jiang@mediatek.com>
To:     Hans Verkuil <hverkuil-cisco@xs4all.nl>
CC:     Mauro Carvalho Chehab <mchehab+samsung@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Matthias Brugger <matthias.bgg@gmail.com>,
        Rick Chang <Rick.Chang@mediatek.com>,
        "linux-media@vger.kernel.org" <linux-media@vger.kernel.org>,
        "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        "linux-arm-kernel@lists.infradead.org" 
        <linux-arm-kernel@lists.infradead.org>,
        "linux-mediatek@lists.infradead.org" 
        <linux-mediatek@lists.infradead.org>,
        Marek Szyprowski <m.szyprowski@samsung.com>,
        Tomasz Figa <tfiga@chromium.org>,
        srv_heupstream <srv_heupstream@mediatek.com>
Date:   Fri, 6 Dec 2019 16:06:45 +0800
In-Reply-To: <a2e66e05-3248-de84-85d5-b0c7e5a080f1@xs4all.nl>
References: <20191017084033.28299-1-xia.jiang@mediatek.com>
         <20191017084033.28299-6-xia.jiang@mediatek.com>
         <a2e66e05-3248-de84-85d5-b0c7e5a080f1@xs4all.nl>
Content-Type: text/plain; charset="UTF-8"
X-Mailer: Evolution 3.10.4-0ubuntu2 
MIME-Version: 1.0
X-MTK:  N
Content-Transfer-Encoding: base64
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

T24gTW9uLCAyMDE5LTEwLTIxIGF0IDE3OjIzICswODAwLCBIYW5zIFZlcmt1aWwgd3JvdGU6DQo+
IEhpIFhpYSwNCj4gDQo+IFNvbWUgY29tbWVudHMgYWJvdXQgdGhlIHNlbGVjdGlvbiBjb2RlOg0K
PiANCj4gT24gMTAvMTcvMTkgMTA6NDAgQU0sIFhpYSBKaWFuZyB3cm90ZToNCj4gPiBBZGQgbXRr
IGpwZWcgZW5jb2RlIHY0bDIgZHJpdmVyIGJhc2VkIG9uIGpwZWcgZGVjb2RlLCBiZWNhdXNlIHRo
YXQganBlZw0KPiA+IGRlY29kZSBhbmQgZW5jb2RlIGhhdmUgZ3JlYXQgc2ltaWxhcml0aWVzIHdp
dGggZnVuY3Rpb24gb3BlcmF0aW9uLg0KPiA+IA0KPiA+IFNpZ25lZC1vZmYtYnk6IFhpYSBKaWFu
ZyA8eGlhLmppYW5nQG1lZGlhdGVrLmNvbT4NCj4gPiAtLS0NCj4gPiB2NDogc3BsaXQgbXRrX2pw
ZWdfdHJ5X2ZtdF9tcGxhbmUoKSB0byB0d28gZnVuY3Rpb25zLCBvbmUgZm9yIGVuY29kZXIsDQo+
ID4gICAgIG9uZSBmb3IgZGVjb2Rlci4NCj4gPiAgICAgc3BsaXQgbXRrX2pwZWdfc2V0X2RlZmF1
bHRfcGFyYW1zKCkgdG8gdHdvIGZ1bmN0aW9ucywgb25lIGZvcg0KPiA+ICAgICBlbmNvZGVyLCBv
bmUgZm9yIGRlY29kZXIuDQo+ID4gICAgIGFkZCBjcm9wcGluZyBzdXBwb3J0IGZvciBlbmNvZGVy
IGluIGcvc19zZWxlY3Rpb24gaW9jdGxzLg0KPiA+ICAgICBjaGFuZ2UgZXhpZiBtb2RlIHN1cHBv
cnQgYnkgdXNpbmcgVjRMMl9KUEVHX0FDVElWRV9NQVJLRVJfQVBQMS4NCj4gPiAgICAgY2hhbmdl
IE1US19KUEVHX01BWF9XSURUSC9NVEtfSlBFR19NQVhfSEVJR0ggZnJvbSA4MTkyIHRvIDY1NTM1
IGJ5DQo+ID4gICAgIHNwZWNpZmljYXRpb24uDQo+ID4gICAgIG1vdmUgd2lkdGggc2hpZnRpbmcg
b3BlcmF0aW9uIGJlaGluZCBhbGlnbmluZyBvcGVyYXRpb24gaW4NCj4gPiAgICAgbXRrX2pwZWdf
dHJ5X2VuY19mbXRfbXBsYW5lKCkgZm9yIGJ1ZyBmaXguDQo+ID4gICAgIGZpeCB1c2VyIGFidXNl
aW5nIGRhdGFfb2Zmc2V0IGlzc3VlIGZvciBETUFCVUYgaW4NCj4gPiAgICAgbXRrX2pwZWdfc2V0
X2VuY19zcmMoKS4NCj4gPiAgICAgZml4IGtidWlsZCB3YXJpbmdzOiBjaGFuZ2UgTVRLX0pQRUdf
TUlOX0hFSUdIVC9NVEtfSlBFR19NQVhfSEVJR0hUDQo+ID4gICAgICAgICAgICAgICAgICAgICAg
ICAgYW5kIE1US19KUEVHX01JTl9XSURUSC9NVEtfSlBFR19NQVhfV0lEVEggZnJvbQ0KPiA+ICAg
ICAgICAgICAgICAgICAgICAgICAgICdpbnQnIHR5cGUgdG8gJ3Vuc2lnbmVkIGludCcgdHlwZS4N
Cj4gPiAgICAgICAgICAgICAgICAgICAgICAgICBmaXggbXNsZWFkaW5nbHkgaW5kZW50ZWQgb2Yg
J2Vsc2UnLg0KPiA+IA0KPiA+IHYzOiBkZWxldGUgQ2hhbmdlLUlkLg0KPiA+ICAgICBvbmx5IHRl
c3Qgb25jZSBoYW5kbGVyLT5lcnJvciBhZnRlciB0aGUgbGFzdCB2NGwyX2N0cmxfbmV3X3N0ZCgp
Lg0KPiA+ICAgICBzZXBlcmF0ZSBjaGFuZ2VzIG9mIHY0bDItY3RybHMuYyBhbmQgdjRsMi1jb250
cm9scy5oIHRvIG5ldyBwYXRjaC4NCj4gPiANCj4gPiB2MjogZml4IGNvbXBsaWFuY2UgdGVzdCBm
YWlsLCBjaGVjayBjcmVhdGVkIGJ1ZmZlciBzaXplIGluIGRyaXZlci4NCj4gPiAtLS0NCj4gPiAg
ZHJpdmVycy9tZWRpYS9wbGF0Zm9ybS9tdGstanBlZy9NYWtlZmlsZSAgICAgIHwgICA1ICstDQo+
ID4gIC4uLi9tZWRpYS9wbGF0Zm9ybS9tdGstanBlZy9tdGtfanBlZ19jb3JlLmMgICB8IDczMSAr
KysrKysrKysrKysrKystLS0NCj4gPiAgLi4uL21lZGlhL3BsYXRmb3JtL210ay1qcGVnL210a19q
cGVnX2NvcmUuaCAgIHwgMTIzICsrLQ0KPiA+ICAuLi4vbWVkaWEvcGxhdGZvcm0vbXRrLWpwZWcv
bXRrX2pwZWdfZGVjX2h3LmggfCAgIDcgKy0NCj4gPiAgLi4uL21lZGlhL3BsYXRmb3JtL210ay1q
cGVnL210a19qcGVnX2VuY19ody5jIHwgMTc1ICsrKysrDQo+ID4gIC4uLi9tZWRpYS9wbGF0Zm9y
bS9tdGstanBlZy9tdGtfanBlZ19lbmNfaHcuaCB8ICA2MCArKw0KPiA+ICAuLi4vcGxhdGZvcm0v
bXRrLWpwZWcvbXRrX2pwZWdfZW5jX3JlZy5oICAgICAgfCAgNDkgKysNCj4gPiAgNyBmaWxlcyBj
aGFuZ2VkLCAxMDA0IGluc2VydGlvbnMoKyksIDE0NiBkZWxldGlvbnMoLSkNCj4gPiAgY3JlYXRl
IG1vZGUgMTAwNjQ0IGRyaXZlcnMvbWVkaWEvcGxhdGZvcm0vbXRrLWpwZWcvbXRrX2pwZWdfZW5j
X2h3LmMNCj4gPiAgY3JlYXRlIG1vZGUgMTAwNjQ0IGRyaXZlcnMvbWVkaWEvcGxhdGZvcm0vbXRr
LWpwZWcvbXRrX2pwZWdfZW5jX2h3LmgNCj4gPiAgY3JlYXRlIG1vZGUgMTAwNjQ0IGRyaXZlcnMv
bWVkaWEvcGxhdGZvcm0vbXRrLWpwZWcvbXRrX2pwZWdfZW5jX3JlZy5oDQo+ID4gDQo+IA0KPiA8
c25pcD4NCj4gDQo+ID4gQEAgLTQ1NSwxMSArNjc5LDE5IEBAIHN0YXRpYyBpbnQgbXRrX2pwZWdf
Z19zZWxlY3Rpb24oc3RydWN0IGZpbGUgKmZpbGUsIHZvaWQgKnByaXYsDQo+ID4gIAkJCQlzdHJ1
Y3QgdjRsMl9zZWxlY3Rpb24gKnMpDQo+ID4gIHsNCj4gPiAgCXN0cnVjdCBtdGtfanBlZ19jdHgg
KmN0eCA9IG10a19qcGVnX2ZoX3RvX2N0eChwcml2KTsNCj4gPiArCXN0cnVjdCBtdGtfanBlZ19k
ZXYgKmpwZWcgPSBjdHgtPmpwZWc7DQo+ID4gIA0KPiA+IC0JaWYgKHMtPnR5cGUgIT0gVjRMMl9C
VUZfVFlQRV9WSURFT19DQVBUVVJFKQ0KPiA+ICsJaWYgKGpwZWctPm1vZGUgPT0gTVRLX0pQRUdf
RU5DICYmIHMtPnR5cGUgIT0gVjRMMl9CVUZfVFlQRV9WSURFT19PVVRQVVQpDQo+ID4gKwkJcmV0
dXJuIC1FSU5WQUw7DQo+ID4gKw0KPiA+ICsJaWYgKGpwZWctPm1vZGUgPT0gTVRLX0pQRUdfREVD
ICYmDQo+ID4gKwkgICAgcy0+dHlwZSAhPSBWNEwyX0JVRl9UWVBFX1ZJREVPX0NBUFRVUkUpDQo+
ID4gIAkJcmV0dXJuIC1FSU5WQUw7DQo+ID4gIA0KPiA+ICAJc3dpdGNoIChzLT50YXJnZXQpIHsN
Cj4gPiArCWNhc2UgVjRMMl9TRUxfVEdUX0NST1A6DQo+ID4gKwljYXNlIFY0TDJfU0VMX1RHVF9D
Uk9QX0JPVU5EUzoNCj4gPiArCWNhc2UgVjRMMl9TRUxfVEdUX0NST1BfREVGQVVMVDoNCj4gDQo+
IFRoaXMgaXMgd3JvbmcuLi4NCj4gDQo+ID4gIAljYXNlIFY0TDJfU0VMX1RHVF9DT01QT1NFOg0K
PiA+ICAJY2FzZSBWNEwyX1NFTF9UR1RfQ09NUE9TRV9ERUZBVUxUOg0KPiA+ICAJCXMtPnIud2lk
dGggPSBjdHgtPm91dF9xLnc7DQo+ID4gQEAgLTQ4NCwxMSArNzE2LDE3IEBAIHN0YXRpYyBpbnQg
bXRrX2pwZWdfc19zZWxlY3Rpb24oc3RydWN0IGZpbGUgKmZpbGUsIHZvaWQgKnByaXYsDQo+ID4g
IAkJCQlzdHJ1Y3QgdjRsMl9zZWxlY3Rpb24gKnMpDQo+ID4gIHsNCj4gPiAgCXN0cnVjdCBtdGtf
anBlZ19jdHggKmN0eCA9IG10a19qcGVnX2ZoX3RvX2N0eChwcml2KTsNCj4gPiArCXN0cnVjdCBt
dGtfanBlZ19kZXYgKmpwZWcgPSBjdHgtPmpwZWc7DQo+ID4gIA0KPiA+IC0JaWYgKHMtPnR5cGUg
IT0gVjRMMl9CVUZfVFlQRV9WSURFT19DQVBUVVJFKQ0KPiA+ICsJaWYgKGpwZWctPm1vZGUgPT0g
TVRLX0pQRUdfRU5DICYmIHMtPnR5cGUgIT0gVjRMMl9CVUZfVFlQRV9WSURFT19PVVRQVVQpDQo+
ID4gKwkJcmV0dXJuIC1FSU5WQUw7DQo+ID4gKw0KPiA+ICsJaWYgKGpwZWctPm1vZGUgPT0gTVRL
X0pQRUdfREVDICYmDQo+ID4gKwkgICAgcy0+dHlwZSAhPSBWNEwyX0JVRl9UWVBFX1ZJREVPX0NB
UFRVUkUpDQo+ID4gIAkJcmV0dXJuIC1FSU5WQUw7DQo+ID4gIA0KPiA+ICAJc3dpdGNoIChzLT50
YXJnZXQpIHsNCj4gPiArCWNhc2UgVjRMMl9TRUxfVEdUX0NST1A6DQo+IA0KPiAuLi5hbmQgc28g
aXMgdGhpcy4NCj4gDQo+IFRoZSBkZWNvZGVyIG9ubHkgc3VwcG9ydHMgQ09NUE9TRSwgdGhlIGVu
Y29kZXIgb25seSBzdXBwb3J0cyBDUk9QLg0KPiANCj4gVGhpcyBzaWduYWxzIHN1cHBvcnQgZm9y
IGJvdGggY3JvcHBpbmcgYW5kIGNvbXBvc2l0aW9uIGZvciBib3RoIGVuY29kZXIgYW5kDQo+IGRl
Y29kZXIsIGFuZCB0aGF0J3Mgd3JvbmcuIFlvdSBjYW4gc2VlIHRoaXMgaW4gdGhlIGNvbXBsaWFu
Y2Ugb3V0cHV0IGFzIHdlbGw6DQo+IGl0IHNheXMgdGhhdCBib3RoIGNyb3BwaW5nIGFuZCBjb21w
b3NpdGlvbiBhcmUgJ09LJywgbWVhbmluZyB0aGF0IGJvdGggZmVhdHVyZXMNCj4gYXJlIGltcGxl
bWVudGVkLg0KPiANCj4gSXQgYWxzbyBjbGFpbXMgdGhhdCB0aGUgZGVjb2RlciBzdXBwb3J0cyBz
Y2FsaW5nLiBJcyB0aGF0IGNvcnJlY3Q/IElzIHRoZXJlIGENCj4gc2NhbGVyIGluIHRoZSBKUEVH
IGRlY29kZXI/IFVzdWFsbHkgY29kZWNzIGRvIG5vdCBoYXZlIGEgc2NhbGVyLg0KPiANCj4gUmVn
YXJkcywNCj4gDQo+IAlIYW5zDQpEZWFyIEhhbnMsDQpDcm9wIG9ubHkgZm9yIGVuY29kZXIgYW5k
IGNvbXBvc2Ugb25seSBmb3IgZGVjb2RlciBpbiB0aGUgbGF0ZXN0IHZlc2lvbi4NCg0KQmVzdCBS
ZWdhcmRzLA0KWGlhIEppYW5nDQo+IA0KPiA+ICAJY2FzZSBWNEwyX1NFTF9UR1RfQ09NUE9TRToN
Cj4gPiAgCQlzLT5yLmxlZnQgPSAwOw0KPiA+ICAJCXMtPnIudG9wID0gMDsNCj4gPiBAQCAtNjU4
LDEwICs4OTYsOTIgQEAgc3RhdGljIHZvaWQgbXRrX2pwZWdfc2V0X3F1ZXVlX2RhdGEoc3RydWN0
IG10a19qcGVnX2N0eCAqY3R4LA0KPiA+ICAJCSBwYXJhbS0+ZGVjX3csIHBhcmFtLT5kZWNfaCk7
DQo+ID4gIH0NCj4gDQo+IA0KDQo=

