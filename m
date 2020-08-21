Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 0ACAD24D402
	for <lists+linux-media@lfdr.de>; Fri, 21 Aug 2020 13:32:43 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727833AbgHULck (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 21 Aug 2020 07:32:40 -0400
Received: from eu-smtp-delivery-151.mimecast.com ([185.58.86.151]:27414 "EHLO
        eu-smtp-delivery-151.mimecast.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1725897AbgHULch (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 21 Aug 2020 07:32:37 -0400
Received: from AcuMS.aculab.com (156.67.243.126 [156.67.243.126]) (Using
 TLS) by relay.mimecast.com with ESMTP id
 uk-mta-11-1J3ZoqrQOEmS6aQC-7Fa_Q-1; Fri, 21 Aug 2020 12:32:30 +0100
X-MC-Unique: 1J3ZoqrQOEmS6aQC-7Fa_Q-1
Received: from AcuMS.Aculab.com (fd9f:af1c:a25b:0:43c:695e:880f:8750) by
 AcuMS.aculab.com (fd9f:af1c:a25b:0:43c:695e:880f:8750) with Microsoft SMTP
 Server (TLS) id 15.0.1347.2; Fri, 21 Aug 2020 12:32:29 +0100
Received: from AcuMS.Aculab.com ([fe80::43c:695e:880f:8750]) by
 AcuMS.aculab.com ([fe80::43c:695e:880f:8750%12]) with mapi id 15.00.1347.000;
 Fri, 21 Aug 2020 12:32:29 +0100
From:   David Laight <David.Laight@ACULAB.COM>
To:     'Nicolas Boichat' <drinkcat@chromium.org>
CC:     Steven Rostedt <rostedt@goodmis.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        "Andy Shevchenko" <andriy.shevchenko@linux.intel.com>,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
        "devel@driverdev.osuosl.org" <devel@driverdev.osuosl.org>,
        lkml <linux-kernel@vger.kernel.org>,
        "Linux Media Mailing List" <linux-media@vger.kernel.org>,
        Peter Zijlstra <peterz@infradead.org>,
        Thomas Gleixner <tglx@linutronix.de>,
        Josh Poimboeuf <jpoimboe@redhat.com>
Subject: RE: [PATCH v4 3/3] media: atomisp: Only use trace_printk if allowed
Thread-Topic: [PATCH v4 3/3] media: atomisp: Only use trace_printk if allowed
Thread-Index: AQHWd1MRQFeXK2GIIEihfK8khxWsrqlCP3rwgAAMdQCAACDnQA==
Date:   Fri, 21 Aug 2020 11:32:29 +0000
Message-ID: <898c56e4b7ef4c3da1d634fdef5a8898@AcuMS.aculab.com>
References: <20200820170951.v4.1.Ia54fe801f246a0b0aee36fb1f3bfb0922a8842b0@changeid>
 <20200820170951.v4.3.I066d89f39023956c47fb0a42edf196b3950ffbf7@changeid>
 <20200820102347.15d2f610@oasis.local.home>
 <CANMq1KCoEZVj=sjxCqBhqLZKBab57+82=Rk_LN7fc3aCuNHMUw@mail.gmail.com>
 <20200820203601.4f70bf98@oasis.local.home>
 <21fae92da07c4566ba4eed3b5e1bce2d@AcuMS.aculab.com>
 <CANMq1KBvNqcdCsuDGGygYqS5+ZBw+qSVXTC+WWNycypG2=BRMQ@mail.gmail.com>
In-Reply-To: <CANMq1KBvNqcdCsuDGGygYqS5+ZBw+qSVXTC+WWNycypG2=BRMQ@mail.gmail.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-exchange-transport-fromentityheader: Hosted
x-originating-ip: [10.202.205.107]
MIME-Version: 1.0
Authentication-Results: relay.mimecast.com;
        auth=pass smtp.auth=C51A453 smtp.mailfrom=david.laight@aculab.com
X-Mimecast-Spam-Score: 0.002
X-Mimecast-Originator: aculab.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: base64
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

RnJvbTogTmljb2xhcyBCb2ljaGF0DQo+IFNlbnQ6IDIxIEF1Z3VzdCAyMDIwIDExOjI4DQo+IA0K
PiBPbiBGcmksIEF1ZyAyMSwgMjAyMCBhdCA0OjQ4IFBNIERhdmlkIExhaWdodCA8RGF2aWQuTGFp
Z2h0QGFjdWxhYi5jb20+IHdyb3RlOg0KPiA+DQo+ID4gRnJvbTogU3RldmVuIFJvc3RlZHQNCj4g
PiA+IFNlbnQ6IDIxIEF1Z3VzdCAyMDIwIDAxOjM2DQo+ID4gPiBPbiBGcmksIDIxIEF1ZyAyMDIw
IDA4OjEzOjAwICswODAwDQo+ID4gPiBOaWNvbGFzIEJvaWNoYXQgPGRyaW5rY2F0QGNocm9taXVt
Lm9yZz4gd3JvdGU6DQo+ID4gPg0KPiA+ID4gPiBPbiBUaHUsIEF1ZyAyMCwgMjAyMCBhdCAxMDoy
MyBQTSBTdGV2ZW4gUm9zdGVkdCA8cm9zdGVkdEBnb29kbWlzLm9yZz4gd3JvdGU6DQo+ID4gPiA+
ID4NCj4gPiA+ID4gPiBPbiBUaHUsIDIwIEF1ZyAyMDIwIDE3OjE0OjEyICswODAwDQo+ID4gPiA+
ID4gTmljb2xhcyBCb2ljaGF0IDxkcmlua2NhdEBjaHJvbWl1bS5vcmc+IHdyb3RlOg0KPiA+ID4g
PiA+DQo+ID4gPiA+ID4gPiBUZWNobmljYWxseSwgd2UgY291bGQgb25seSBpbml0aWFsaXplIHRo
ZSB0cmFjZV9wcmludGsgYnVmZmVycw0KPiA+ID4gPiA+ID4gd2hlbiB0aGUgcHJpbnQgZW52IGlz
IHN3aXRjaGVkLCB0byBhdm9pZCB0aGUgYnVpbGQgZXJyb3IgYW5kDQo+ID4gPiA+ID4gPiB1bmNv
bmRpdGlvbmFsIGJvb3QtdGltZSB3YXJuaW5nLCBidXQgSSBhc3N1bWUgdGhpcyBwcmludGluZw0K
PiA+ID4gPiA+ID4gZnJhbWV3b3JrIHdpbGwgZXZlbnR1YWxseSBnZXQgcmVtb3ZlZCB3aGVuIHRo
ZSBkcml2ZXIgbW92ZXMgb3V0DQo+ID4gPiA+ID4gPiBvZiBzdGFnaW5nPw0KPiA+ID4gPiA+DQo+
ID4gPiA+ID4gUGVyaGFwcyB0aGlzIHNob3VsZCBiZSBjb252ZXJ0aW5nIGludG8gYSB0cmFjZSBl
dmVudC4gTG9vayBhdCB3aGF0IGJwZg0KPiA+ID4gPiA+IGRpZCBmb3IgdGhlaXIgYnBmX3RyYWNl
X3ByaW50aygpLg0KPiA+ID4gPiA+DQo+ID4gPiA+ID4gVGhlIG1vcmUgSSB0aGluayBhYm91dCBp
dCwgdGhlIGxlc3MgSSBsaWtlIHRoaXMgc2VyaWVzLg0KPiA+ID4gPg0KPiA+ID4gPiBUbyBtYWtl
IGl0IGNsZWFyLCB0aGUgcHJpbWFyeSBnb2FsIG9mIHRoaXMgc2VyaWVzIGlzIHRvIGdldCByaWQg
b2YNCj4gPiA+ID4gdHJhY2VfcHJpbnRrIHNwcmlua2xlZCBpbiB0aGUga2VybmVsIGJ5IG1ha2lu
ZyBzdXJlIHNvbWUgcmFuZGNvbmZpZw0KPiA+ID4gPiBidWlsZHMgZmFpbC4gU2luY2UgbXkgdjIs
IHRoZXJlIGFscmVhZHkgaGFzIGJlZW4gb25lIG1vcmUgYWRkZWQgKHRoZQ0KPiA+ID4gPiBvbmUg
dGhhdCB0aGlzIHBhdGNoIHJlbW92ZXMpLCBzbyBJJ2QgbGlrZSB0byBsYW5kIDIvMyBBU0FQIHRv
IHByZXZlbnQNCj4gPiA+ID4gZXZlbiBtb3JlIGZyb20gYmVpbmcgYWRkZWQuDQo+ID4gPiA+DQo+
ID4gPiA+IExvb2tpbmcgYXQgeW91ciByZXBseSBvbiAxLzMsIEkgdGhpbmsgd2UgYXJlIGFsaWdu
ZWQgb24gdGhhdCBnb2FsPyBJcw0KPiA+ID4gPiB0aGVyZSBzb21lIG90aGVyIGFwcHJvYWNoIHlv
dSdkIHJlY29tbWVuZD8NCj4gPiA+ID4NCj4gPiA+ID4gTm93LCBJJ20gbm90IHByZXRlbmRpbmcg
bXkgZml4ZXMgYXJlIHRoZSBiZXN0IHBvc3NpYmxlIG9uZXMsIGJ1dCBJDQo+ID4gPiA+IHdvdWxk
IG11Y2ggcmF0aGVyIGhhdmUgdGhlIGJ1cmRlbiBvZiBjb252ZXJ0aW5nIHRvIHRyYWNlIGV2ZW50
cyBvbiB0aGUNCj4gPiA+ID4gcmVzcGVjdGl2ZSBkcml2ZXIgbWFpbnRhaW5lcnMuIChidHcgaXMg
dGhlcmUgYSBzaG9ydA0KPiA+ID4gPiBkb2N1bWVudGF0aW9uL3R1dG9yaWFsIHRoYXQgSSBjb3Vs
ZCBsaW5rIHRvIGluIHRoZXNlIHBhdGNoZXMsIHRvIGhlbHANCj4gPiA+ID4gZGV2ZWxvcGVycyB1
bmRlcnN0YW5kIHdoYXQgaXMgdGhlIHJlY29tbWVuZGVkIHdheSBub3c/KQ0KPiA+ID4gPg0KPiA+
ID4NCj4gPiA+IEkgbGlrZSB0aGUgZ29hbCwgYnV0IEkgZ3Vlc3MgSSBuZXZlciBhcnRpY3VsYXRl
ZCB0aGUgcHJvYmxlbSBJIGhhdmUNCj4gPiA+IHdpdGggdGhlIG1ldGhvZG9sb2d5Lg0KPiA+ID4N
Cj4gPiA+IHRyYWNlX3ByaW50aygpIGlzIG1lYW50IHRvIGJlIGEgZGVidWdnaW5nIHRvb2wuIFNv
bWV0aGluZyB0aGF0IHBlb3BsZQ0KPiA+ID4gY2FuIGFuZCBkbyBzcHJpbmtsZSBhbGwgb3ZlciB0
aGUga2VybmVsIHRvIGhlbHAgdGhlbSBmaW5kIGEgYnVnIGluDQo+ID4gPiBhcmVhcyB0aGF0IGFy
ZSBjYWxsZWQgcXVpdGUgb2Z0ZW4gKHdoZXJlIHByaW50aygpIGlzIHdheSB0b28gc2xvdykuDQo+
ID4gPg0KPiA+ID4gVGhlIGxhc3QgdGhpbmcgSSB3YW50IHRoZW0gdG8gZGVhbCB3aXRoIGlzIGFk
ZGluZyBhIHRyYWNlX3ByaW50aygpIHdpdGgNCj4gPiA+IHRoZWlyIGRpc3RybydzIGNvbmZpZyAo
b3IgYSBjb25maWcgZnJvbSBzb21lb25lIHRoYXQgdHJpZ2dlcmVkIHRoZSBidWcpDQo+ID4gPiBv
bmx5IHRvIGhhdmUgdGhlIGJ1aWxkIHRvIGZhaWwsIGJlY2F1c2UgdGhleSBhbHNvIG5lZWQgdG8g
YWRkIGEgY29uZmlnDQo+ID4gPiB2YWx1ZS4NCj4gPiA+DQo+ID4gPiBJIGFkZCB0byB0aGUgQ2Mg
YSBmZXcgZGV2ZWxvcGVycyBJIGtub3cgdGhhdCB1c2UgdHJhY2VfcHJpbnRrKCkgaW4gdGhpcw0K
PiA+ID4gZmFzaGlvbi4gSSdkIGxpa2UgdG8gaGVhciB0aGVpciB2aWV3IG9uIGhhdmluZyB0byBh
ZGQgYSBjb25maWcgb3B0aW9uDQo+ID4gPiB0byBtYWtlIHRyYWNlX3ByaW50ayB3b3JrIGJlZm9y
ZSB0aGV5IHRlc3QgYSBjb25maWcgdGhhdCBpcyBzZW50IHRvDQo+ID4gPiB0aGVtLg0KPiA+DQo+
ID4gSXMgaXQgd29ydGggaGF2aW5nIHRocmVlIGNvbXBpbGUtdGltZSBvcHRpb25zOg0KPiA+IDEp
IHRyYWNlX3ByaW50aygpIGlnbm9yZWQuDQo+IA0KPiBDT05GSUdfVFJBQ0U9biAobm93KQ0KPiAN
Cj4gPiAyKSB0cmFjZV9wcmludGsoKSBlbmFibGVkLg0KPiANCj4gQ09ORklHX1RSQUNFPXkgKG5v
dykNCj4gDQo+ID4gMykgdHJhY2VfcHJpbnRrKCkgZ2VuZXJhdGVzIGEgY29tcGlsZSB0aW1lIGVy
cm9yLg0KPiANCj4gQ09ORklHX1RSQUNFPXkgYW5kIENPTkZJR19UUkFDSU5HX0FMTE9XX1BSSU5U
Sz1uIChteSBwYXRjaCkNCj4gDQo+ID4NCj4gPiBOb3JtYWwga2VybmVsIGJ1aWxkcyB3b3VsZCBp
Z25vcmUgY2FsbHMuDQo+ID4gRWl0aGVyIGEgY29uZmlnIG9wdGlvbiBvciBhIG1vZHVsZSBvcHRp
b24gKGV0Yykgd291bGQgZW5hYmxlIGl0Lg0KPiA+IEEgY29uZmlnIG9wdGlvbiB0aGF0ICdyYW5k
LWNvbmZpZycgYnVpbGRzIHdvdWxkIHR1cm4gb24gd291bGQNCj4gPiBnZW5lcmF0ZSBjb21waWxl
LXRpbWUgZXJyb3JzLg0KPiANCj4gWWVzLCBhIGNvbmZpZyBvcHRpb24gaXMgZXhhY3RseSB3aGF0
IG15IHBhdGNoIDIvMiBkb2VzLiBBbmQgc2VlDQo+IFN0ZXZlbidzIGFyZ3VtZW50Lg0KDQpCdXQg
eW91IHdlcmUgYWRkaW5nICNpZnMgdG8geW91IGNvZGUgdG8gZW5hYmxlIHRoZSB0cmFjZXMuDQpU
aGF0IGlzIGp1c3QgaG9ycmlkLg0KDQpXaGF0IHlvdSB3YW50IGlzIENPTkZJR19ISkhKVkxLSENW
S0lZVktJSVlWWUtJWVZMVUNMVUNMPXkgKGRlZmF1bHQgbikNCnRoYXQgd291bGQgb25seSBldmVy
IGdldCBzZXQgYnkgYSAncmFuZC1jb25maWcnIGJ1aWxkIGFuZCB3b3VsZA0KbmV2ZXIgYmUgdGVz
dGVkIGluIGFueSBzb3VyY2UgY29kZS4NCg0KWW91IG1pZ2h0IGFsc28gd2FudCBhICNkZWZpbmUg
dGhhdCBjYW4gc2V0IHRlbXBvcmFyaWx5DQp0byBlbmFibGUgdHJhY2VzIGluIGEgc3BlY2lmaWMg
ZmlsZS9tb2R1bGUgZXZlbiB0aG91Z2gNCkNPTkZJR19UUkFDRT1uLg0KKEJ1dCByYW5kLWNvbmZp
ZyBidWlsZHMgd291bGQgc3RpbGwgZmFpbCBpZiB0aGV5IGVuYWJsZWQgdGhlDQonc3BlY2lhbCcg
b3B0aW9uLikNCg0KCURhdmlkLg0KDQotDQpSZWdpc3RlcmVkIEFkZHJlc3MgTGFrZXNpZGUsIEJy
YW1sZXkgUm9hZCwgTW91bnQgRmFybSwgTWlsdG9uIEtleW5lcywgTUsxIDFQVCwgVUsNClJlZ2lz
dHJhdGlvbiBObzogMTM5NzM4NiAoV2FsZXMpDQo=

