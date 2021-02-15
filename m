Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 6B83431BB56
	for <lists+linux-media@lfdr.de>; Mon, 15 Feb 2021 15:44:46 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230133AbhBOOnf (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 15 Feb 2021 09:43:35 -0500
Received: from eu-smtp-delivery-151.mimecast.com ([185.58.86.151]:34274 "EHLO
        eu-smtp-delivery-151.mimecast.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S229981AbhBOOne (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 15 Feb 2021 09:43:34 -0500
Received: from AcuMS.aculab.com (156.67.243.126 [156.67.243.126]) (Using
 TLS) by relay.mimecast.com with ESMTP id
 uk-mtapsc-1-3w3CI_4oMWS3JDUYMjvGuQ-1; Mon, 15 Feb 2021 14:41:54 +0000
X-MC-Unique: 3w3CI_4oMWS3JDUYMjvGuQ-1
Received: from AcuMS.Aculab.com (fd9f:af1c:a25b:0:43c:695e:880f:8750) by
 AcuMS.aculab.com (fd9f:af1c:a25b:0:43c:695e:880f:8750) with Microsoft SMTP
 Server (TLS) id 15.0.1347.2; Mon, 15 Feb 2021 14:41:52 +0000
Received: from AcuMS.Aculab.com ([fe80::43c:695e:880f:8750]) by
 AcuMS.aculab.com ([fe80::43c:695e:880f:8750%12]) with mapi id 15.00.1347.000;
 Mon, 15 Feb 2021 14:41:52 +0000
From:   David Laight <David.Laight@ACULAB.COM>
To:     =?utf-8?B?J0NocmlzdGlhbiBLw7ZuaWcn?= <christian.koenig@amd.com>,
        "Lucas Stach" <l.stach@pengutronix.de>,
        Simon Ser <contact@emersion.fr>
CC:     "linaro-mm-sig@lists.linaro.org" <linaro-mm-sig@lists.linaro.org>,
        "Sharma, Shashank" <Shashank.Sharma@amd.com>,
        lkml <linux-kernel@vger.kernel.org>,
        dri-devel <dri-devel@lists.freedesktop.org>,
        linux-media <linux-media@vger.kernel.org>
Subject: RE: DMA-buf and uncached system memory
Thread-Topic: DMA-buf and uncached system memory
Thread-Index: AQHXA5L/eppUoUE81k6k7v7UJlaBDapZRehQ
Date:   Mon, 15 Feb 2021 14:41:52 +0000
Message-ID: <fa3f6eefc0a940b38448b0efd4b3f4e3@AcuMS.aculab.com>
References: <91ff0bbb-ea3a-2663-3453-dea96ccd6dd8@amd.com>
 <GUuZYSQk2hxgykDhSxfB2GWo47lQlVrKBtWMwQUG7Ar2GAag5WQDxBI0zq6nDTooPBzTktyRpnu25Ju1UKE3FYD9yHbkNMAHcmSI96hoJhA=@emersion.fr>
 <da9edfa0-8a18-44a2-fa79-83b4177afd8e@amd.com>
 <8d23f1ca6fe76d8971365bf54ca71ba71698980d.camel@pengutronix.de>
 <7ecf008d-a1f5-ddff-c8ac-8e7bfaf9c680@amd.com>
In-Reply-To: <7ecf008d-a1f5-ddff-c8ac-8e7bfaf9c680@amd.com>
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

RnJvbTogQ2hyaXN0aWFuIEvDtm5pZw0KPiBTZW50OiAxNSBGZWJydWFyeSAyMDIxIDEyOjA1DQou
Li4NCj4gU25vb3BpbmcgdGhlIENQVSBjYWNoZXMgaW50cm9kdWNlcyBzb21lIGV4dHJhIGxhdGVu
Y3ksIHNvIHdoYXQgY2FuDQo+IGhhcHBlbiBpcyB0aGF0IHRoZSByZXNwb25zZSB0byB0aGUgUENJ
ZSByZWFkIGNvbWVzIHRvIGxhdGUgZm9yIHRoZQ0KPiBzY2Fub3V0LiBUaGUgcmVzdWx0IGlzIGFu
IHVuZGVyZmxvdyBhbmQgZmxpY2tlcmluZyB3aGVuZXZlciBzb21ldGhpbmcgaXMNCj4gaW4gdGhl
IGNhY2hlIHdoaWNoIG5lZWRzIHRvIGJlIGZsdXNoZWQgZmlyc3QuDQoNCkFyZW4ndCB5b3UgZ29p
bmcgdG8gZ2V0IHRoZSBzYW1lIHByb2JsZW0gaWYgYW55IG90aGVyIGVuZHBvaW50cyBhcmUNCmRv
aW5nIG1lbW9yeSByZWFkcz8NClBvc3NpYmx5IGV2ZW4gb25lcyB0aGF0IGRvbid0IHJlcXVpcmUg
YSBjYWNoZSBzbm9vcCBhbmQgZmx1c2guDQoNCldoYXQgYWJvdXQganVzdCB0aGUgY3B1IGRvaW5n
IGEgcmVhbCBtZW1vcnkgdHJhbnNmZXI/DQoNCk9yIGEgY29tYmluYXRpb24gb2YgdGhlIHR3byBh
Ym92ZSBoYXBwZW5pbmcganVzdCBiZWZvcmUgeW91ciByZXF1ZXN0Lg0KDQpJZiB5b3UgZG9uJ3Qg
aGF2ZSBhIGJpZyBlbm91Z2ggZmlmbyB5b3UnbGwgbG9zZS4NCg0KSSBkaWQgJ2ZpeCcgYSBzaW1p
bGFyKGlzaCkgaXNzdWUgd2l0aCB2aWRlbyBETUEgbGF0ZW5jeSBvbiBhbiBlbWJlZGRlZA0Kc3lz
dGVtIGJhc2VkIHRoZSBvbiBTQTExMDAvU0ExMTAxIGJ5IHNpZ25pZmljYW50bHkgcmVkdWNpbmcg
dGhlIGNsb2NrDQp0byB0aGUgVkdBIHBhbmVsIHdoZW5ldmVyIHRoZSBjcHUgd2FzIGRvaW5nICdz
bG93IGlvJy4NCihJbnRlcmxlYXZpbmcgYW4gdW5jYWNoZWQgY3B1IERSQU0gd3JpdGUgYmV0d2Vl
biB0aGUgc2xvdyBpbyBjeWNsZXMNCmFsc28gZml4ZWQgaXQuKQ0KQnV0IHRoZSB2aWRlbyB3YXMg
dGhlIG9ubHkgRE1BIGRldmljZSBhbmQgdGhhdCB3YXMgYW4gZW1iZWRkZWQgc3lzdGVtLg0KR2l2
ZW4gdGhlIGFwcGxpY2F0aW9uIG5vdGUgYWJvdXQgdmlkZW8gbGF0ZW5jeSBkaWRuJ3QgbWVudGlv
biB3aGF0IHdhcw0KYWN0dWFsbHkgaGFwcGVuaW5nLCBJJ20gbm90IHN1cmUgaG93IG1hbnkgcGVv
cGxlIGFjdHVhbGx5IGdvdCBpdCB3b3JraW5nIQ0KDQoJRGF2aWQNCg0KLQ0KUmVnaXN0ZXJlZCBB
ZGRyZXNzIExha2VzaWRlLCBCcmFtbGV5IFJvYWQsIE1vdW50IEZhcm0sIE1pbHRvbiBLZXluZXMs
IE1LMSAxUFQsIFVLDQpSZWdpc3RyYXRpb24gTm86IDEzOTczODYgKFdhbGVzKQ0K

