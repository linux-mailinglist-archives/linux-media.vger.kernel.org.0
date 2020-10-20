Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 4B8422944BC
	for <lists+linux-media@lfdr.de>; Tue, 20 Oct 2020 23:53:16 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2392268AbgJTVxK (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 20 Oct 2020 17:53:10 -0400
Received: from eu-smtp-delivery-151.mimecast.com ([185.58.86.151]:27587 "EHLO
        eu-smtp-delivery-151.mimecast.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S2392250AbgJTVxK (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 20 Oct 2020 17:53:10 -0400
Received: from AcuMS.aculab.com (156.67.243.126 [156.67.243.126]) (Using
 TLS) by relay.mimecast.com with ESMTP id
 uk-mta-213-FDpc4XWSONmUnr5iOVCXlw-1; Tue, 20 Oct 2020 22:53:05 +0100
X-MC-Unique: FDpc4XWSONmUnr5iOVCXlw-1
Received: from AcuMS.Aculab.com (fd9f:af1c:a25b:0:43c:695e:880f:8750) by
 AcuMS.aculab.com (fd9f:af1c:a25b:0:43c:695e:880f:8750) with Microsoft SMTP
 Server (TLS) id 15.0.1347.2; Tue, 20 Oct 2020 22:53:04 +0100
Received: from AcuMS.Aculab.com ([fe80::43c:695e:880f:8750]) by
 AcuMS.aculab.com ([fe80::43c:695e:880f:8750%12]) with mapi id 15.00.1347.000;
 Tue, 20 Oct 2020 22:53:04 +0100
From:   David Laight <David.Laight@ACULAB.COM>
To:     'Dafna Hirschfeld' <dafna.hirschfeld@collabora.com>,
        'Colin King' <colin.king@canonical.com>,
        Helen Koike <helen.koike@collabora.com>,
        "Mauro Carvalho Chehab" <mchehab@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        "linux-media@vger.kernel.org" <linux-media@vger.kernel.org>,
        "devel@driverdev.osuosl.org" <devel@driverdev.osuosl.org>
CC:     "kernel-janitors@vger.kernel.org" <kernel-janitors@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Subject: RE: [PATCH] media: staging: rkisp1: rsz: make const array static,
 makes object smaller
Thread-Topic: [PATCH] media: staging: rkisp1: rsz: make const array static,
 makes object smaller
Thread-Index: AQHWpu/g1aA4z1vvvE6vSt76+nNaDamgnL6wgAAMVoCAAF2rAA==
Date:   Tue, 20 Oct 2020 21:53:04 +0000
Message-ID: <c4cc1bd62e52419eb00631e539a6e703@AcuMS.aculab.com>
References: <20201020144655.53251-1-colin.king@canonical.com>
 <d5663dec063440129bf6c373aa252d51@AcuMS.aculab.com>
 <cec23fd3-15c1-8e52-3f4d-300d6149d89c@collabora.com>
In-Reply-To: <cec23fd3-15c1-8e52-3f4d-300d6149d89c@collabora.com>
Accept-Language: en-GB, en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-exchange-transport-fromentityheader: Hosted
x-originating-ip: [10.202.205.107]
MIME-Version: 1.0
Authentication-Results: relay.mimecast.com;
        auth=pass smtp.auth=C51A453 smtp.mailfrom=david.laight@aculab.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: aculab.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: base64
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

RnJvbTogRGFmbmEgSGlyc2NoZmVsZA0KPiBTZW50OiAyMCBPY3RvYmVyIDIwMjAgMTg6MTANCj4g
DQo+IEFtIDIwLjEwLjIwIHVtIDE3OjI5IHNjaHJpZWIgRGF2aWQgTGFpZ2h0Og0KPiA+IEZyb206
IENvbGluIEtpbmcNCj4gPj4gU2VudDogMjAgT2N0b2JlciAyMDIwIDE1OjQ3DQo+ID4+DQo+ID4+
IEZyb206IENvbGluIElhbiBLaW5nIDxjb2xpbi5raW5nQGNhbm9uaWNhbC5jb20+DQo+ID4+DQou
Li4NCj4gPj4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvc3RhZ2luZy9tZWRpYS9ya2lzcDEvcmtpc3Ax
LXJlc2l6ZXIuYyBiL2RyaXZlcnMvc3RhZ2luZy9tZWRpYS9ya2lzcDEvcmtpc3AxLQ0KPiA+PiBy
ZXNpemVyLmMNCj4gPj4gaW5kZXggMTY4N2Q4MmU2YzY4Li43Y2E1YjQ3YzViZjUgMTAwNjQ0DQo+
ID4+IC0tLSBhL2RyaXZlcnMvc3RhZ2luZy9tZWRpYS9ya2lzcDEvcmtpc3AxLXJlc2l6ZXIuYw0K
PiA+PiArKysgYi9kcml2ZXJzL3N0YWdpbmcvbWVkaWEvcmtpc3AxL3JraXNwMS1yZXNpemVyLmMN
Cj4gPj4gQEAgLTc2Myw4ICs3NjMsMTAgQEAgc3RhdGljIHZvaWQgcmtpc3AxX3Jzel91bnJlZ2lz
dGVyKHN0cnVjdCBya2lzcDFfcmVzaXplciAqcnN6KQ0KPiA+Pg0KPiA+PiAgIHN0YXRpYyBpbnQg
cmtpc3AxX3Jzel9yZWdpc3RlcihzdHJ1Y3Qgcmtpc3AxX3Jlc2l6ZXIgKnJzeikNCj4gPj4gICB7
DQo+ID4+IC0JY29uc3QgY2hhciAqIGNvbnN0IGRldl9uYW1lc1tdID0ge1JLSVNQMV9SU1pfTVBf
REVWX05BTUUsDQo+ID4+IC0JCQkJCSAgUktJU1AxX1JTWl9TUF9ERVZfTkFNRX07DQo+ID4+ICsJ
c3RhdGljIGNvbnN0IGNoYXIgKiBjb25zdCBkZXZfbmFtZXNbXSA9IHsNCj4gPj4gKwkJUktJU1Ax
X1JTWl9NUF9ERVZfTkFNRSwNCj4gPj4gKwkJUktJU1AxX1JTWl9TUF9ERVZfTkFNRQ0KPiA+PiAr
CX07DQo+ID4+ICAgCXN0cnVjdCBtZWRpYV9wYWQgKnBhZHMgPSByc3otPnBhZHM7DQo+ID4+ICAg
CXN0cnVjdCB2NGwyX3N1YmRldiAqc2QgPSAmcnN6LT5zZDsNCj4gPj4gICAJaW50IHJldDsNCj4g
Pg0KPiA+IERvbid0IGxvb2sgYXQgd2hhdCB0aGF0IGNvZGUgaXMgYWN0dWFsbHkgZG9pbmcuLi4u
DQo+ID4gSXQgaXMgcmF0aGVyIGhvcnJpZC4NCj4gPiBya2lzcDFfcnN6X3JlZ2lzdGVyKCkgaXMg
Y2FsbGVkIGZvciBlYWNoIGVudHJ5IGluIGFuIGFycmF5ICh0d2ljZSkuDQo+ID4gVGhlIGFycmF5
IGluZGV4IGlzIHdyaXR0ZW4gaW50byByc3otPmlkLg0KPiA+IFRoZSB2YWx1ZSBpcyB0aGVuIHVz
ZWQgdG8gc2VsZWN0IG9uZSBvZiB0aGUgdHdvIHN0cmluZ3MuDQo+ID4gQnV0IHJzei0+aWQgaXMg
YWN0dWFsbHkgYW4gZW51bSB0eXBlLg0KPiANCj4gSGksDQo+IElzIGl0IHRoYXQgYmFkIHRvIHVz
ZSBlbnVtIGFzIGFuIGFycmF5IGluZGV4Pw0KPiB3ZSB1c2UgaXQgaW4gbWFueSBwbGFjZXMgaW4g
dGhlIGRyaXZlci4NCg0KWW91J2Qgbm9ybWFsbHkgdXNlIGEgY29uc3RhbnQgZnJvbSB0aGUgZW51
bSB0byBzaXplIHRoZSBhcnJheSBkZWZpbml0aW9uLg0KSW4gdGhpcyBjYXNlIHlvdSd2ZSBhbiBl
bnVtLCBhbiBhcnJheSBbMl0gYW5kIHRoZSBkZXZfbmFtZXNbXQ0KYWxsIG9mIHdoaWNoIGhhdmUg
dG8gbWF0Y2ggJ2J5IG1hZ2ljJy4NCg0KVGhlcmUgaXMgYSBsb29wIHRoYXQgaGFsZiBpbXBsaWVz
IHlvdSBtaWdodCBhZGQgYSB0aGlyZCB0eXBlLg0KYnV0IHRoZW4gdGhlIGZvbGxvd2luZyBjb2Rl
IG9ubHkgd29ya3MgZm9yIHRoZSB0d28gdHlwZXMuDQpZb3UndmUgY29tcGxleCBlcnJvciByZWNv
dmVyeSBpbiBjYXNlIG9uZSBvZiB0aGUgY2FsbHMgdG8gDQpya2lzcDFfcnN6X3JlZ2lzdGVyKCkg
ZmFpbHMgLSBidXQgc2luY2UgdGhlcmUgY2FuIG9ubHkgZXZlcg0KYmUgdHdvIGNhbGxzIHRoZSBj
b2RlIGNvdWxkIGJlIG11Y2ggc2ltcGxlci4NCg0KCURhdmlkDQoNCi0NClJlZ2lzdGVyZWQgQWRk
cmVzcyBMYWtlc2lkZSwgQnJhbWxleSBSb2FkLCBNb3VudCBGYXJtLCBNaWx0b24gS2V5bmVzLCBN
SzEgMVBULCBVSw0KUmVnaXN0cmF0aW9uIE5vOiAxMzk3Mzg2IChXYWxlcykNCg==

