Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 3BD90382CCB
	for <lists+linux-media@lfdr.de>; Mon, 17 May 2021 15:04:39 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234921AbhEQNFy (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 17 May 2021 09:05:54 -0400
Received: from eu-smtp-delivery-151.mimecast.com ([185.58.86.151]:52518 "EHLO
        eu-smtp-delivery-151.mimecast.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S233582AbhEQNFx (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 17 May 2021 09:05:53 -0400
Received: from AcuMS.aculab.com (156.67.243.121 [156.67.243.121]) (Using
 TLS) by relay.mimecast.com with ESMTP id
 uk-mta-269-SnWmW07CP9mRfzOX1xeU9g-1; Mon, 17 May 2021 14:04:34 +0100
X-MC-Unique: SnWmW07CP9mRfzOX1xeU9g-1
Received: from AcuMS.Aculab.com (fd9f:af1c:a25b:0:994c:f5c2:35d6:9b65) by
 AcuMS.aculab.com (fd9f:af1c:a25b:0:994c:f5c2:35d6:9b65) with Microsoft SMTP
 Server (TLS) id 15.0.1497.2; Mon, 17 May 2021 14:04:31 +0100
Received: from AcuMS.Aculab.com ([fe80::994c:f5c2:35d6:9b65]) by
 AcuMS.aculab.com ([fe80::994c:f5c2:35d6:9b65%12]) with mapi id
 15.00.1497.015; Mon, 17 May 2021 14:04:31 +0100
From:   David Laight <David.Laight@ACULAB.COM>
To:     'Andy Shevchenko' <andy.shevchenko@gmail.com>,
        Arnd Bergmann <arnd@kernel.org>
CC:     Mauro Carvalho Chehab <mchehab@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Arnd Bergmann <arnd@arndb.de>,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
        Hans Verkuil <hverkuil@xs4all.nl>,
        "Christoph Hellwig" <hch@lst.de>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        "Linux Media Mailing List" <linux-media@vger.kernel.org>,
        "linux-staging@lists.linux.dev" <linux-staging@lists.linux.dev>
Subject: RE: [PATCH] media: atomisp: remove compat_ioctl32 code
Thread-Topic: [PATCH] media: atomisp: remove compat_ioctl32 code
Thread-Index: AQHXSuu4+en14/uhzUazyYkeGYdKuKrno/nQ
Date:   Mon, 17 May 2021 13:04:31 +0000
Message-ID: <eb34029138bd4c02960a59c88009cc76@AcuMS.aculab.com>
References: <20210516204818.2967910-1-arnd@kernel.org>
 <CAHp75Ve7FZQwj-aO_TJ4ddYmhRMez+CapH4YUV7s3-6zVjdLnA@mail.gmail.com>
In-Reply-To: <CAHp75Ve7FZQwj-aO_TJ4ddYmhRMez+CapH4YUV7s3-6zVjdLnA@mail.gmail.com>
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

RnJvbTogQW5keSBTaGV2Y2hlbmtvDQo+IFNlbnQ6IDE3IE1heSAyMDIxIDA4OjEwDQo+IA0KPiBP
biBNb24sIE1heSAxNywgMjAyMSBhdCAzOjI3IEFNIEFybmQgQmVyZ21hbm4gPGFybmRAa2VybmVs
Lm9yZz4gd3JvdGU6DQo+ID4NCj4gPiBGcm9tOiBBcm5kIEJlcmdtYW5uIDxhcm5kQGFybmRiLmRl
Pg0KPiA+DQo+ID4gVGhpcyBpcyBvbmUgb2YgdGhlIGxhc3QgcmVtYWluaW5nIHVzZXJzIG9mIGNv
bXBhdF9hbGxvY191c2VyX3NwYWNlKCkNCj4gPiBhbmQgY29weV9pbl91c2VyKCksIHdoaWNoIGFy
ZSBpbiB0aGUgcHJvY2VzcyBvZiBnZXR0aW5nIHJlbW92ZWQuDQo+ID4NCj4gPiBBcyBvZiBjb21t
aXQgNTdlNmI2ZjIzMDNlICgibWVkaWE6IGF0b21pc3BfZm9wcy5jOiBkaXNhYmxlDQo+ID4gYXRv
bWlzcF9jb21wYXRfaW9jdGwzMiIpLCBub3RoaW5nIGluIHRoaXMgZmlsZSBpcyBhY3R1YWxseSBn
ZXR0aW5nIHVzZWQNCj4gPiBhcyB0aGUgb25seSByZWZlcmVuY2UgaGFzIGJlZW4gc3R1YmJlZCBv
dXQuDQo+ID4NCj4gPiBSZW1vdmUgdGhlIGVudGlyZSBmaWxlIC0tIGFueW9uZSB3aWxsaW5nIHRv
IHJlc3RvcmUgdGhlIGZ1bmN0aW9uYWxpdHkNCj4gPiBjYW4gZXF1YWxseSB3ZWxsIGp1c3QgbG9v
ayB1cCB0aGUgY29udGVudHMgaW4gdGhlIGdpdCBoaXN0b3J5IGlmIG5lZWRlZC4NCj4gDQo+IEV2
ZXJ5dGhpbmcgd2hpY2ggcmVtb3ZlcyB0b25zIG9mIExPQ3MgaW4gdGhpcyBkcml2ZXIgSSBsaWtl
IGJ5IGRlZmF1bHQsIHRoYW5rcyENCi4uLi4NCj4gPiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9zdGFn
aW5nL21lZGlhL2F0b21pc3AvcGNpL2F0b21pc3BfZm9wcy5jDQo+IGIvZHJpdmVycy9zdGFnaW5n
L21lZGlhL2F0b21pc3AvcGNpL2F0b21pc3BfZm9wcy5jDQo+ID4gaW5kZXggZjFlNmIyNTk3ODUz
Li5lMzgzZTE3YzUwNzIgMTAwNjQ0DQo+ID4gLS0tIGEvZHJpdmVycy9zdGFnaW5nL21lZGlhL2F0
b21pc3AvcGNpL2F0b21pc3BfZm9wcy5jDQo+ID4gKysrIGIvZHJpdmVycy9zdGFnaW5nL21lZGlh
L2F0b21pc3AvcGNpL2F0b21pc3BfZm9wcy5jDQo+ID4gQEAgLTEyODMsNyArMTI4Myw4IEBAIGNv
bnN0IHN0cnVjdCB2NGwyX2ZpbGVfb3BlcmF0aW9ucyBhdG9taXNwX2ZvcHMgPSB7DQo+ID4gICAg
ICAgICAudW5sb2NrZWRfaW9jdGwgPSB2aWRlb19pb2N0bDIsDQo+ID4gICNpZmRlZiBDT05GSUdf
Q09NUEFUDQo+ID4gICAgICAgICAvKg0KPiA+IC0gICAgICAgICogVGhlcmUgYXJlIHByb2JsZW1z
IHdpdGggdGhpcyBjb2RlLiBEaXNhYmxlIHRoaXMgZm9yIG5vdy4NCj4gPiArICAgICAgICAqIHRo
aXMgd2FzIHJlbW92ZWQgYmVjYXVzZSBvZiBidWdzLCB0aGUgaW50ZXJmYWNlDQo+ID4gKyAgICAg
ICAgKiBuZWVkcyB0byBiZSBtYWRlIHNhZmUgZm9yIGNvbXBhdCB0YXNrcyBpbnN0ZWFkLg0KPiA+
ICAgICAgICAgLmNvbXBhdF9pb2N0bDMyID0gYXRvbWlzcF9jb21wYXRfaW9jdGwzMiwNCj4gPiAg
ICAgICAgICAqLw0KPiA+ICAjZW5kaWYNCj4gPiBAQCAtMTI5NywxMCArMTI5OCw3IEBAIGNvbnN0
IHN0cnVjdCB2NGwyX2ZpbGVfb3BlcmF0aW9ucyBhdG9taXNwX2ZpbGVfZm9wcyA9IHsNCj4gPiAg
ICAgICAgIC5tbWFwID0gYXRvbWlzcF9maWxlX21tYXAsDQo+ID4gICAgICAgICAudW5sb2NrZWRf
aW9jdGwgPSB2aWRlb19pb2N0bDIsDQo+ID4gICNpZmRlZiBDT05GSUdfQ09NUEFUDQo+ID4gLSAg
ICAgICAvKg0KPiA+IC0gICAgICAgICogVGhlcmUgYXJlIHByb2JsZW1zIHdpdGggdGhpcyBjb2Rl
LiBEaXNhYmxlIHRoaXMgZm9yIG5vdy4NCj4gPiAtICAgICAgIC5jb21wYXRfaW9jdGwzMiA9IGF0
b21pc3BfY29tcGF0X2lvY3RsMzIsDQo+ID4gLSAgICAgICAgKi8NCj4gPiArICAgICAgIC8qIC5j
b21wYXRfaW9jdGwzMiA9IGF0b21pc3BfY29tcGF0X2lvY3RsMzIsICovDQo+ID4gICNlbmRpZg0K
PiA+ICAgICAgICAgLnBvbGwgPSBhdG9taXNwX3BvbGwsDQoNClNob3VsZG4ndCB0aGV5IGJlIHN0
dWJiZWQgd2l0aCBzb21ldGhpbmcgdGhhdCByZXR1cm5zIC1FTk9UVFkNCnJhdGhlciB0aGFuIGJs
aW5kbHkgY2FsbGluZyB0aGUgNjRiaXQgY29kZSB3aXRoIHRoZSB3cm9uZyBzdHJ1Y3R1cmU/DQoN
CglEYXZpZA0KDQotDQpSZWdpc3RlcmVkIEFkZHJlc3MgTGFrZXNpZGUsIEJyYW1sZXkgUm9hZCwg
TW91bnQgRmFybSwgTWlsdG9uIEtleW5lcywgTUsxIDFQVCwgVUsNClJlZ2lzdHJhdGlvbiBObzog
MTM5NzM4NiAoV2FsZXMpDQo=

