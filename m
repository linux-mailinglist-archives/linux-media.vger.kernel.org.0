Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 7851824D4D8
	for <lists+linux-media@lfdr.de>; Fri, 21 Aug 2020 14:21:20 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728573AbgHUMVM (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 21 Aug 2020 08:21:12 -0400
Received: from eu-smtp-delivery-151.mimecast.com ([207.82.80.151]:51839 "EHLO
        eu-smtp-delivery-151.mimecast.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1727824AbgHUMSf (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 21 Aug 2020 08:18:35 -0400
Received: from AcuMS.aculab.com (156.67.243.126 [156.67.243.126]) (Using
 TLS) by relay.mimecast.com with ESMTP id
 uk-mta-48-5tsXRHYdNKyZh1jxPg801Q-1; Fri, 21 Aug 2020 13:18:29 +0100
X-MC-Unique: 5tsXRHYdNKyZh1jxPg801Q-1
Received: from AcuMS.Aculab.com (fd9f:af1c:a25b:0:43c:695e:880f:8750) by
 AcuMS.aculab.com (fd9f:af1c:a25b:0:43c:695e:880f:8750) with Microsoft SMTP
 Server (TLS) id 15.0.1347.2; Fri, 21 Aug 2020 13:18:28 +0100
Received: from AcuMS.Aculab.com ([fe80::43c:695e:880f:8750]) by
 AcuMS.aculab.com ([fe80::43c:695e:880f:8750%12]) with mapi id 15.00.1347.000;
 Fri, 21 Aug 2020 13:18:28 +0100
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
Thread-Index: AQHWd1MRQFeXK2GIIEihfK8khxWsrqlCP3rwgAAMdQCAACDnQP//+vQAgAARUeA=
Date:   Fri, 21 Aug 2020 12:18:28 +0000
Message-ID: <6c5249afad274ce49e643d9b05706e3a@AcuMS.aculab.com>
References: <20200820170951.v4.1.Ia54fe801f246a0b0aee36fb1f3bfb0922a8842b0@changeid>
 <20200820170951.v4.3.I066d89f39023956c47fb0a42edf196b3950ffbf7@changeid>
 <20200820102347.15d2f610@oasis.local.home>
 <CANMq1KCoEZVj=sjxCqBhqLZKBab57+82=Rk_LN7fc3aCuNHMUw@mail.gmail.com>
 <20200820203601.4f70bf98@oasis.local.home>
 <21fae92da07c4566ba4eed3b5e1bce2d@AcuMS.aculab.com>
 <CANMq1KBvNqcdCsuDGGygYqS5+ZBw+qSVXTC+WWNycypG2=BRMQ@mail.gmail.com>
 <898c56e4b7ef4c3da1d634fdef5a8898@AcuMS.aculab.com>
 <CANMq1KDT+uecuqxXRsxv9-sMv0sGXk6ZQ3hWv0aK34dfzaJXyg@mail.gmail.com>
In-Reply-To: <CANMq1KDT+uecuqxXRsxv9-sMv0sGXk6ZQ3hWv0aK34dfzaJXyg@mail.gmail.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-exchange-transport-fromentityheader: Hosted
x-originating-ip: [10.202.205.107]
MIME-Version: 1.0
Authentication-Results: relay.mimecast.com;
        auth=pass smtp.auth=C51A453 smtp.mailfrom=david.laight@aculab.com
X-Mimecast-Spam-Score: 0.001
X-Mimecast-Originator: aculab.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: base64
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

RnJvbTogTmljb2xhcyBCb2ljaGF0DQo+IFNlbnQ6IDIxIEF1Z3VzdCAyMDIwIDEzOjA3DQouLi4N
Cj4gPiBZb3UgbWlnaHQgYWxzbyB3YW50IGEgI2RlZmluZSB0aGF0IGNhbiBzZXQgdGVtcG9yYXJp
bHkNCj4gPiB0byBlbmFibGUgdHJhY2VzIGluIGEgc3BlY2lmaWMgZmlsZS9tb2R1bGUgZXZlbiB0
aG91Z2gNCj4gPiBDT05GSUdfVFJBQ0U9bi4NCj4gDQo+IEkgZG9uJ3QgdW5kZXJzdGFuZCBob3cg
dHJhY2VzIGFyZSBzdXBwb3NlZCB0byB3b3JrIHdpdGggQ09ORklHX1RSQUNFPW4/DQoNClByb2Jh
Ymx5IGJlY2F1c2UgSSBtZWFudCBzb21ldGhpbmcgZGlmZmVyZW50IDotKQ0KDQpZb3Ugd2FudCB0
aGUga2VybmVsIGJ1aWx0IHNvIHRoYXQgdGhlcmUgYXJlIG5vIChleHBhbmRlZCkNCmNhbGxzIHRv
IHRyYWNlX3ByaW50ZigpIGJ1dCB3aXRoIHN1cHBvcnQgZm9yIG1vZHVsZXMgdGhhdA0KY29udGFp
biB0aGVtLg0KDQpUaGVuIEkgY2FuIGxvYWQgYSBtb2R1bGUgaW50byBhIGRpc3RybyBrZXJuZWwg
dGhhdA0KY29udGFpbnMgdHJhY2VfcHJpbnRmKCkgY2FsbHMgZm9yIGRlYnVnIHRlc3RpbmcuDQoN
CldoaWNoIGlzIHdoeSBJIHdhcyBzdWdnZXN0aW5nIGEgY29uZmlnIG9wdGlvbiB0aGF0DQpvbmx5
IHJhbmQtY29uZmlnIGJ1aWxkcyB3b3VsZCBldmVyIHNldCB0aGF0IHdvdWxkDQpjYXVzZSB0aGUg
Y2FsbHMgdG8gZ2VuZXJhdGUgY29tcGlsZS10aW1lIGVycm9ycy4NCg0KCURhdmlkDQoNCi0NClJl
Z2lzdGVyZWQgQWRkcmVzcyBMYWtlc2lkZSwgQnJhbWxleSBSb2FkLCBNb3VudCBGYXJtLCBNaWx0
b24gS2V5bmVzLCBNSzEgMVBULCBVSw0KUmVnaXN0cmF0aW9uIE5vOiAxMzk3Mzg2IChXYWxlcykN
Cg==

