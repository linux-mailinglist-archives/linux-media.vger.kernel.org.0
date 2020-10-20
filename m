Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id BD689293F95
	for <lists+linux-media@lfdr.de>; Tue, 20 Oct 2020 17:29:56 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2408673AbgJTP3w (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 20 Oct 2020 11:29:52 -0400
Received: from eu-smtp-delivery-151.mimecast.com ([207.82.80.151]:37234 "EHLO
        eu-smtp-delivery-151.mimecast.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S2394457AbgJTP3w (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 20 Oct 2020 11:29:52 -0400
Received: from AcuMS.aculab.com (156.67.243.126 [156.67.243.126]) (Using
 TLS) by relay.mimecast.com with ESMTP id
 uk-mta-90-Cn_Z6BHWNUmFgv53TMgdvw-1; Tue, 20 Oct 2020 16:29:47 +0100
X-MC-Unique: Cn_Z6BHWNUmFgv53TMgdvw-1
Received: from AcuMS.Aculab.com (fd9f:af1c:a25b:0:43c:695e:880f:8750) by
 AcuMS.aculab.com (fd9f:af1c:a25b:0:43c:695e:880f:8750) with Microsoft SMTP
 Server (TLS) id 15.0.1347.2; Tue, 20 Oct 2020 16:29:46 +0100
Received: from AcuMS.Aculab.com ([fe80::43c:695e:880f:8750]) by
 AcuMS.aculab.com ([fe80::43c:695e:880f:8750%12]) with mapi id 15.00.1347.000;
 Tue, 20 Oct 2020 16:29:46 +0100
From:   David Laight <David.Laight@ACULAB.COM>
To:     'Colin King' <colin.king@canonical.com>,
        Helen Koike <helen.koike@collabora.com>,
        Dafna Hirschfeld <dafna.hirschfeld@collabora.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        "linux-media@vger.kernel.org" <linux-media@vger.kernel.org>,
        "devel@driverdev.osuosl.org" <devel@driverdev.osuosl.org>
CC:     "kernel-janitors@vger.kernel.org" <kernel-janitors@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Subject: RE: [PATCH] media: staging: rkisp1: rsz: make const array static,
 makes object smaller
Thread-Topic: [PATCH] media: staging: rkisp1: rsz: make const array static,
 makes object smaller
Thread-Index: AQHWpu/g1aA4z1vvvE6vSt76+nNaDamgnL6w
Date:   Tue, 20 Oct 2020 15:29:46 +0000
Message-ID: <d5663dec063440129bf6c373aa252d51@AcuMS.aculab.com>
References: <20201020144655.53251-1-colin.king@canonical.com>
In-Reply-To: <20201020144655.53251-1-colin.king@canonical.com>
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

RnJvbTogQ29saW4gS2luZw0KPiBTZW50OiAyMCBPY3RvYmVyIDIwMjAgMTU6NDcNCj4gDQo+IEZy
b206IENvbGluIElhbiBLaW5nIDxjb2xpbi5raW5nQGNhbm9uaWNhbC5jb20+DQo+IA0KPiBEb24n
dCBwb3B1bGF0ZSB0aGUgY29uc3QgYXJyYXkgZGV2X25hbWVzIG9uIHRoZSBzdGFjayBidXQgaW5z
dGVhZCBpdA0KPiBzdGF0aWMuIE1ha2VzIHRoZSBvYmplY3QgY29kZSBzbWFsbGVyIGJ5IDE1IGJ5
dGVzLg0KPiANCj4gQmVmb3JlOg0KPiAgICB0ZXh0CSAgIGRhdGEJICAgIGJzcwkgICAgZGVjCSAg
ICBoZXgJZmlsZW5hbWUNCj4gICAxNzA5MQkgICAyNjQ4CSAgICAgNjQJICAxOTgwMwkgICA0ZDVi
CW1lZGlhL3JraXNwMS9ya2lzcDEtcmVzaXplci5vDQo+IA0KPiBBZnRlcjoNCj4gICAgdGV4dAkg
ICBkYXRhCSAgICBic3MJICAgIGRlYwkgICAgaGV4CWZpbGVuYW1lDQo+ICAgMTcwMTIJICAgMjcx
MgkgICAgIDY0CSAgMTk3ODgJICAgNGQ0YwltZWRpYS9ya2lzcDEvcmtpc3AxLXJlc2l6ZXIubw0K
PiANCj4gKGdjYyB2ZXJzaW9uIDEwLjIuMCkNCj4gDQo+IFNpZ25lZC1vZmYtYnk6IENvbGluIElh
biBLaW5nIDxjb2xpbi5raW5nQGNhbm9uaWNhbC5jb20+DQo+IC0tLQ0KPiAgZHJpdmVycy9zdGFn
aW5nL21lZGlhL3JraXNwMS9ya2lzcDEtcmVzaXplci5jIHwgNiArKysrLS0NCj4gIDEgZmlsZSBj
aGFuZ2VkLCA0IGluc2VydGlvbnMoKyksIDIgZGVsZXRpb25zKC0pDQo+IA0KPiBkaWZmIC0tZ2l0
IGEvZHJpdmVycy9zdGFnaW5nL21lZGlhL3JraXNwMS9ya2lzcDEtcmVzaXplci5jIGIvZHJpdmVy
cy9zdGFnaW5nL21lZGlhL3JraXNwMS9ya2lzcDEtDQo+IHJlc2l6ZXIuYw0KPiBpbmRleCAxNjg3
ZDgyZTZjNjguLjdjYTViNDdjNWJmNSAxMDA2NDQNCj4gLS0tIGEvZHJpdmVycy9zdGFnaW5nL21l
ZGlhL3JraXNwMS9ya2lzcDEtcmVzaXplci5jDQo+ICsrKyBiL2RyaXZlcnMvc3RhZ2luZy9tZWRp
YS9ya2lzcDEvcmtpc3AxLXJlc2l6ZXIuYw0KPiBAQCAtNzYzLDggKzc2MywxMCBAQCBzdGF0aWMg
dm9pZCBya2lzcDFfcnN6X3VucmVnaXN0ZXIoc3RydWN0IHJraXNwMV9yZXNpemVyICpyc3opDQo+
IA0KPiAgc3RhdGljIGludCBya2lzcDFfcnN6X3JlZ2lzdGVyKHN0cnVjdCBya2lzcDFfcmVzaXpl
ciAqcnN6KQ0KPiAgew0KPiAtCWNvbnN0IGNoYXIgKiBjb25zdCBkZXZfbmFtZXNbXSA9IHtSS0lT
UDFfUlNaX01QX0RFVl9OQU1FLA0KPiAtCQkJCQkgIFJLSVNQMV9SU1pfU1BfREVWX05BTUV9Ow0K
PiArCXN0YXRpYyBjb25zdCBjaGFyICogY29uc3QgZGV2X25hbWVzW10gPSB7DQo+ICsJCVJLSVNQ
MV9SU1pfTVBfREVWX05BTUUsDQo+ICsJCVJLSVNQMV9SU1pfU1BfREVWX05BTUUNCj4gKwl9Ow0K
PiAgCXN0cnVjdCBtZWRpYV9wYWQgKnBhZHMgPSByc3otPnBhZHM7DQo+ICAJc3RydWN0IHY0bDJf
c3ViZGV2ICpzZCA9ICZyc3otPnNkOw0KPiAgCWludCByZXQ7DQoNCkRvbid0IGxvb2sgYXQgd2hh
dCB0aGF0IGNvZGUgaXMgYWN0dWFsbHkgZG9pbmcuLi4uDQpJdCBpcyByYXRoZXIgaG9ycmlkLg0K
cmtpc3AxX3Jzel9yZWdpc3RlcigpIGlzIGNhbGxlZCBmb3IgZWFjaCBlbnRyeSBpbiBhbiBhcnJh
eSAodHdpY2UpLg0KVGhlIGFycmF5IGluZGV4IGlzIHdyaXR0ZW4gaW50byByc3otPmlkLg0KVGhl
IHZhbHVlIGlzIHRoZW4gdXNlZCB0byBzZWxlY3Qgb25lIG9mIHRoZSB0d28gc3RyaW5ncy4NCkJ1
dCByc3otPmlkIGlzIGFjdHVhbGx5IGFuIGVudW0gdHlwZS4NCg0Kcmtpc3AxX3Jzel9yZWdpc3Rl
cigpIHNob3VsZCBwcm9iYWJseSBqdXN0IGJlIGNhbGxlZCB0d2ljZSB3aXRoIHNvbWUNCmV4dHJh
IHBhcmFtZXRlcnMuDQoNCglEYXZpZA0KDQotDQpSZWdpc3RlcmVkIEFkZHJlc3MgTGFrZXNpZGUs
IEJyYW1sZXkgUm9hZCwgTW91bnQgRmFybSwgTWlsdG9uIEtleW5lcywgTUsxIDFQVCwgVUsNClJl
Z2lzdHJhdGlvbiBObzogMTM5NzM4NiAoV2FsZXMpDQo=

