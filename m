Return-Path: <linux-media+bounces-18750-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 253D29897F4
	for <lists+linux-media@lfdr.de>; Sun, 29 Sep 2024 23:35:11 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 2F7851C20C9C
	for <lists+linux-media@lfdr.de>; Sun, 29 Sep 2024 21:35:10 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6374D144D1A;
	Sun, 29 Sep 2024 21:35:04 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from eu-smtp-delivery-151.mimecast.com (eu-smtp-delivery-151.mimecast.com [185.58.86.151])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4FACA335BA
	for <linux-media@vger.kernel.org>; Sun, 29 Sep 2024 21:35:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.58.86.151
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727645704; cv=none; b=faafu+19bOL1A/ZEOVkhMpbncvNBLsZVIOHnT+npSQmMf7y3jyFA39dhl9Psz9q2sauDcQnfXMqw4635GeIM7ueQrQJBrI5far89yCUjXUZK2jSzTSPSsOqWqHHCTZ1RKxWgx76gEneuRfJ4hLkfONuR5H7ksFlvDOvq7VskbR0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727645704; c=relaxed/simple;
	bh=J+h+d+8xPf2wvb4k5AvkKyxAi3bwsNIaIzgp8kYXeSA=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 MIME-Version:Content-Type; b=g3w9xwQW0k15KHgsq5fjx63YQMxYkey6A/Gjvdup2bOS0g91OkQNSyX97Kx15XXFno4VVlelvNOqsFYvGkxJVWOmbRNrKwCfhnjT7BiYeUUFXls2Vqj56do3lqV5Y83pn/44XTpUYlMd75gkgfKba7++4VgHRPXMmShw0htWjno=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ACULAB.COM; spf=pass smtp.mailfrom=aculab.com; arc=none smtp.client-ip=185.58.86.151
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ACULAB.COM
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=aculab.com
Received: from AcuMS.aculab.com (156.67.243.121 [156.67.243.121]) by
 relay.mimecast.com with ESMTP with both STARTTLS and AUTH (version=TLSv1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 uk-mta-319-AjbKKCoXMA6_8vDN9HfDvg-1; Sun, 29 Sep 2024 22:34:59 +0100
X-MC-Unique: AjbKKCoXMA6_8vDN9HfDvg-1
Received: from AcuMS.Aculab.com (10.202.163.6) by AcuMS.aculab.com
 (10.202.163.6) with Microsoft SMTP Server (TLS) id 15.0.1497.48; Sun, 29 Sep
 2024 22:34:06 +0100
Received: from AcuMS.Aculab.com ([::1]) by AcuMS.aculab.com ([::1]) with mapi
 id 15.00.1497.048; Sun, 29 Sep 2024 22:34:06 +0100
From: David Laight <David.Laight@ACULAB.COM>
To: 'Ricardo Ribalda' <ribalda@chromium.org>, Benoit Parrot <bparrot@ti.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>, Sakari Ailus
	<sakari.ailus@linux.intel.com>, Bingbu Cao <bingbu.cao@intel.com>, "Tianshu
 Qiu" <tian.shu.qiu@intel.com>, Greg Kroah-Hartman
	<gregkh@linuxfoundation.org>, Hans de Goede <hdegoede@redhat.com>, "Andy
 Shevchenko" <andy@kernel.org>, Hans Verkuil <hverkuil-cisco@xs4all.nl>
CC: "linux-media@vger.kernel.org" <linux-media@vger.kernel.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	"linux-staging@lists.linux.dev" <linux-staging@lists.linux.dev>
Subject: RE: [PATCH 3/3] media: atomisp: Use max() macros
Thread-Topic: [PATCH 3/3] media: atomisp: Use max() macros
Thread-Index: AQHbEMGvj02Y6GvUVk6fhB2EdPxdmrJvSzjA
Date: Sun, 29 Sep 2024 21:34:05 +0000
Message-ID: <c183afe8986d444a8e777ae0b9bb9189@AcuMS.aculab.com>
References: <20240927-cocci-6-12-v1-0-a318d4e6a19d@chromium.org>
 <20240927-cocci-6-12-v1-3-a318d4e6a19d@chromium.org>
In-Reply-To: <20240927-cocci-6-12-v1-3-a318d4e6a19d@chromium.org>
Accept-Language: en-GB, en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-exchange-transport-fromentityheader: Hosted
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: aculab.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: base64

RnJvbTogUmljYXJkbyBSaWJhbGRhDQo+IFNlbnQ6IDI3IFNlcHRlbWJlciAyMDI0IDEwOjQyDQo+
IA0KPiBUaGUgbWF4KCkgbWFjcm8gcHJvZHVjZSBuaWNlciBjb2RlIGFuZCBhbHNvIGZpeGVzIHRo
ZSBmb2xsb3dpbmcgY29jY2kNCj4gZXJyb3JzOg0KPiANCj4gZHJpdmVycy9zdGFnaW5nL21lZGlh
L2F0b21pc3AvcGNpL3NoX2Nzc19mcmFjLmg6NDA6MTctMTg6IFdBUk5JTkcgb3Bwb3J0dW5pdHkg
Zm9yIG1heCgpDQo+IGRyaXZlcnMvc3RhZ2luZy9tZWRpYS9hdG9taXNwL3BjaS9zaF9jc3NfZnJh
Yy5oOjUwOjE3LTE4OiBXQVJOSU5HIG9wcG9ydHVuaXR5IGZvciBtYXgoKQ0KPiANCj4gU2lnbmVk
LW9mZi1ieTogUmljYXJkbyBSaWJhbGRhIDxyaWJhbGRhQGNocm9taXVtLm9yZz4NCj4gLS0tDQo+
ICBkcml2ZXJzL3N0YWdpbmcvbWVkaWEvYXRvbWlzcC9wY2kvc2hfY3NzX2ZyYWMuaCB8IDQgKyst
LQ0KPiAgMSBmaWxlIGNoYW5nZWQsIDIgaW5zZXJ0aW9ucygrKSwgMiBkZWxldGlvbnMoLSkNCj4g
DQo+IGRpZmYgLS1naXQgYS9kcml2ZXJzL3N0YWdpbmcvbWVkaWEvYXRvbWlzcC9wY2kvc2hfY3Nz
X2ZyYWMuaA0KPiBiL2RyaXZlcnMvc3RhZ2luZy9tZWRpYS9hdG9taXNwL3BjaS9zaF9jc3NfZnJh
Yy5oDQo+IGluZGV4IDhiYTY1MTYxZjdhOS4uOTY0MjUwNmQyMzg4IDEwMDY0NA0KPiAtLS0gYS9k
cml2ZXJzL3N0YWdpbmcvbWVkaWEvYXRvbWlzcC9wY2kvc2hfY3NzX2ZyYWMuaA0KPiArKysgYi9k
cml2ZXJzL3N0YWdpbmcvbWVkaWEvYXRvbWlzcC9wY2kvc2hfY3NzX2ZyYWMuaA0KPiBAQCAtMzcs
NyArMzcsNyBAQCBzdGF0aWMgaW5saW5lIGludCBzRElHSVRfRklUVElORyhpbnQgdiwgaW50IGEs
IGludCBiKQ0KPiAgCWludCBmaXRfc2hpZnQgPSBzRlJBQ1RJT05fQklUU19GSVRUSU5HKGEpIC0g
YjsNCj4gDQo+ICAJdiA+Pj0gc1NISUZUOw0KDQpJSVJDIHJpZ2h0IHNoaWZ0cyBvZiBzaWduZWQg
dmFsdWVzIGFyZSB1bmRlZmluZWQuDQooQyBkb2VzIG5vdCByZXF1aXJlIGEgY3B1IHRvIGhhdmUg
YSByaWdodCBzaGlmdCB0aGF0IHJlcGxpY2F0ZXMgdGhlDQpzaWduIGJpdC4pDQoNCj4gLQl2ID4+
PSBmaXRfc2hpZnQgPiAwID8gZml0X3NoaWZ0IDogMDsNCj4gKwl2ID4+PSBtYXgoZml0X3NoaWZ0
LCAwKTsNCg0KSWYgdGhlIHNoaWZ0IGlzbid0IGRvbmUgdGhlIHJldHVybiB2YWx1ZSBpcyBnYXJi
YWdlLg0KU28gdGhlIGNvZGUgYmV0dGVyIG5vdCBsZXQgaXQgaGFwcGVuLg0KSW4gd2hpY2ggY2Fz
ZSB5b3UgbWlnaHQgYXMgd2VsbCBsZXQgdGhlIGNwdSBnZW5lcmF0ZSBhIChkaWZmZXJlbnQpDQpy
YW5kb20gdmFsdWUgLSBzbyBkZWxldGUgdGhlIGNvbmRpdGlvbmFsLg0KDQo+IA0KPiAgCXJldHVy
biBjbGFtcF90KGludCwgdiwgc0lTUF9WQUxfTUlOLCBzSVNQX1ZBTF9NQVgpOw0KDQphbGwgdGhy
ZWUgdmFsdWVzIHNlZW0gdG8gYmUgJ2ludCcgLSBzbyBubyBuZWVkIGZvciB0aGUgX3QgdmFyaWFu
dA0KYW5kIGFsbCB0aGUgYXNzb2NpYXRlZCBjYXN0cy4NCg0KPiAgfQ0KPiBAQCAtNDcsNyArNDcs
NyBAQCBzdGF0aWMgaW5saW5lIHVuc2lnbmVkIGludCB1RElHSVRfRklUVElORyh1bnNpZ25lZCBp
bnQgdiwgaW50IGEsIGludCBiKQ0KPiAgCWludCBmaXRfc2hpZnQgPSB1RlJBQ1RJT05fQklUU19G
SVRUSU5HKGEpIC0gYjsNCj4gDQo+ICAJdiA+Pj0gdVNISUZUOw0KPiAtCXYgPj49IGZpdF9zaGlm
dCA+IDAgPyBmaXRfc2hpZnQgOiAwOw0KPiArCXYgPj49IG1heChmaXRfc2hpZnQsIDApOw0KPiAN
Cj4gIAlyZXR1cm4gY2xhbXBfdCh1bnNpZ25lZCBpbnQsIHYsIHVJU1BfVkFMX01JTiwgdUlTUF9W
QUxfTUFYKTsNCg0KYXMgYWJvdmUsIGJ1dCBpdCBpcyBqdXN0IG1pbih2LCBpSVNQX1ZBTF9NQVgp
DQoNCglEYXZpZA0KDQo+ICB9DQo+IA0KPiAtLQ0KPiAyLjQ2LjEuODI0LmdkODkyZGNkY2RkLWdv
b2cNCj4gDQoNCi0NClJlZ2lzdGVyZWQgQWRkcmVzcyBMYWtlc2lkZSwgQnJhbWxleSBSb2FkLCBN
b3VudCBGYXJtLCBNaWx0b24gS2V5bmVzLCBNSzEgMVBULCBVSw0KUmVnaXN0cmF0aW9uIE5vOiAx
Mzk3Mzg2IChXYWxlcykNCg==


