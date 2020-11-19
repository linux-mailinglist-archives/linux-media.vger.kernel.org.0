Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 277762B9311
	for <lists+linux-media@lfdr.de>; Thu, 19 Nov 2020 14:07:46 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727160AbgKSNGy (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 19 Nov 2020 08:06:54 -0500
Received: from Mailgw01.mediatek.com ([1.203.163.78]:61345 "EHLO
        mailgw01.mediatek.com" rhost-flags-OK-FAIL-OK-FAIL) by vger.kernel.org
        with ESMTP id S1726474AbgKSNGx (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 19 Nov 2020 08:06:53 -0500
X-UUID: 35b06853489d43aca805e5f4765c6b07-20201119
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
        h=Content-Transfer-Encoding:MIME-Version:Content-Type:References:In-Reply-To:Date:CC:To:From:Subject:Message-ID; bh=12lxvwfey+8nddLZ+ZoT8HbHqOzwkHuwsOhoD85K9Cg=;
        b=mXlB++9nqp2P7V0CMz3zl6EHRz+3FxzOb3QldHur8JDi/TG+UIiAtdN2bLhlZYIViLJr0TTO0xUTuvmKKSzPKlQrEBHfm7IZ2AfPnGMTBDqOoK9PThw0+P9A49cmcQsWHPnV0BK9jv6ZPSrHG+PWucbTz8Dab0j7pjVg4yX22QU=;
X-UUID: 35b06853489d43aca805e5f4765c6b07-20201119
Received: from mtkcas34.mediatek.inc [(172.27.4.253)] by mailgw01.mediatek.com
        (envelope-from <dongchun.zhu@mediatek.com>)
        (mailgw01.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
        with ESMTP id 534292277; Thu, 19 Nov 2020 21:06:44 +0800
Received: from MTKCAS32.mediatek.inc (172.27.4.184) by MTKMBS31DR.mediatek.inc
 (172.27.6.102) with Microsoft SMTP Server (TLS) id 15.0.1497.2; Thu, 19 Nov
 2020 21:06:41 +0800
Received: from [10.17.3.153] (10.17.3.153) by MTKCAS32.mediatek.inc
 (172.27.4.170) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Thu, 19 Nov 2020 21:06:40 +0800
Message-ID: <1605791201.4733.114.camel@mhfsdcap03>
Subject: Re: [PATCH v15 2/2] media: i2c: Add OV02A10 image sensor driver
From:   Dongchun Zhu <dongchun.zhu@mediatek.com>
To:     Andy Shevchenko <andriy.shevchenko@linux.intel.com>
CC:     <mchehab@kernel.org>, <robh+dt@kernel.org>, <mark.rutland@arm.com>,
        <sakari.ailus@linux.intel.com>, <drinkcat@chromium.org>,
        <tfiga@chromium.org>, <matthias.bgg@gmail.com>,
        <bingbu.cao@intel.com>, <srv_heupstream@mediatek.com>,
        <linux-mediatek@lists.infradead.org>,
        <linux-arm-kernel@lists.infradead.org>, <sj.huang@mediatek.com>,
        <linux-media@vger.kernel.org>, <devicetree@vger.kernel.org>,
        <louis.kuo@mediatek.com>, <shengnan.wang@mediatek.com>,
        <dongchun.zhu@mediatek.com>
Date:   Thu, 19 Nov 2020 21:06:41 +0800
In-Reply-To: <20201023143156.GX4077@smile.fi.intel.com>
References: <20201013130503.2412-1-dongchun.zhu@mediatek.com>
         <20201013130503.2412-3-dongchun.zhu@mediatek.com>
         <20201023143156.GX4077@smile.fi.intel.com>
Content-Type: text/plain; charset="UTF-8"
X-Mailer: Evolution 3.10.4-0ubuntu2 
MIME-Version: 1.0
X-TM-SNTS-SMTP: C846AD7DB098136D27C99F550A830DFF88D98FA0B6CAD3A5ABB190F0FE9C2D672000:8
X-MTK:  N
Content-Transfer-Encoding: base64
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

SGkgQW5keSwNCg0KT24gRnJpLCAyMDIwLTEwLTIzIGF0IDE3OjMxICswMzAwLCBBbmR5IFNoZXZj
aGVua28gd3JvdGU6DQo+IE9uIFR1ZSwgT2N0IDEzLCAyMDIwIGF0IDA5OjA1OjAzUE0gKzA4MDAs
IERvbmdjaHVuIFpodSB3cm90ZToNCj4gPiBBZGQgYSBWNEwyIHN1Yi1kZXZpY2UgZHJpdmVyIGZv
ciBPbW5pVmlzaW9uIE9WMDJBMTAgaW1hZ2Ugc2Vuc29yLg0KPiANCj4gLi4uDQo+IA0KPiA+ICsj
ZGVmaW5lIE9WMDJBMTBfSURfTUFTSwkJCQkJMHhmZmZmDQo+IA0KPiBHRU5NQVNLKCkNCj4gDQo+
IChBbmQgaW5jbHVkZSBiaXRzLmggZm9yIHRoYXQpDQo+IA0KDQpJdCBzZWVtcyBjb3VsZCBidWls
ZCBwYXNzIHdpdGhvdXQgaW5jbHVkaW5nIGJpdHMuaCwgYXMgRFc5NzY4IG9uY2UgdXNlZC4NCg0K
PiAuLi4NCj4gDQo+ID4gK3N0YXRpYyBpbnQgX19vdjAyYTEwX3N0YXJ0X3N0cmVhbShzdHJ1Y3Qg
b3YwMmExMCAqb3YwMmExMCkNCj4gPiArew0KPiA+ICsJc3RydWN0IGkyY19jbGllbnQgKmNsaWVu
dCA9IHY0bDJfZ2V0X3N1YmRldmRhdGEoJm92MDJhMTAtPnN1YmRldik7DQo+ID4gKwljb25zdCBz
dHJ1Y3Qgb3YwMmExMF9yZWdfbGlzdCAqcmVnX2xpc3Q7DQo+ID4gKwlpbnQgcmV0Ow0KPiA+ICsN
Cj4gPiArCS8qIEFwcGx5IGRlZmF1bHQgdmFsdWVzIG9mIGN1cnJlbnQgbW9kZSAqLw0KPiA+ICsJ
cmVnX2xpc3QgPSAmb3YwMmExMC0+Y3VyX21vZGUtPnJlZ19saXN0Ow0KPiA+ICsJcmV0ID0gb3Yw
MmExMF93cml0ZV9hcnJheShvdjAyYTEwLCByZWdfbGlzdCk7DQo+ID4gKwlpZiAocmV0KQ0KPiA+
ICsJCXJldHVybiByZXQ7DQo+ID4gKw0KPiA+ICsJLyogQXBwbHkgY3VzdG9taXplZCB2YWx1ZXMg
ZnJvbSB1c2VyICovDQo+ID4gKwlyZXQgPSBfX3Y0bDJfY3RybF9oYW5kbGVyX3NldHVwKG92MDJh
MTAtPnN1YmRldi5jdHJsX2hhbmRsZXIpOw0KPiA+ICsJaWYgKHJldCkNCj4gPiArCQlyZXR1cm4g
cmV0Ow0KPiA+ICsNCj4gPiArCS8qIFNldCBvcmllbnRhdGlvbiB0byAxODAgZGVncmVlICovDQo+
ID4gKwlpZiAob3YwMmExMC0+dXBzaWRlX2Rvd24pIHsNCj4gPiArCQlyZXQgPSBpMmNfc21idXNf
d3JpdGVfYnl0ZV9kYXRhKGNsaWVudCwgUkVHX01JUlJPUl9GTElQX0NPTlRST0wsDQo+ID4gKwkJ
CQkJCVJFR19NSVJST1JfRkxJUF9FTkFCTEUpOw0KPiA+ICsJCWlmIChyZXQpIHsNCj4gDQo+IFNo
b3VsZG4ndCB5b3UgdXNlICdyZXQgPCAwJyBoZXJlIGFzIHdlbGw/DQo+IA0KDQpGaXhlZCBpbiBu
ZXh0IHJlbGVhc2UuDQoNCj4gPiArCQkJZGV2X2VycigmY2xpZW50LT5kZXYsICJmYWlsZWQgdG8g
c2V0IG9yaWVudGF0aW9uXG4iKTsNCj4gPiArCQkJcmV0dXJuIHJldDsNCj4gPiArCQl9DQo+ID4g
KwkJcmV0ID0gaTJjX3NtYnVzX3dyaXRlX2J5dGVfZGF0YShjbGllbnQsIFJFR19HTE9CQUxfRUZG
RUNUSVZFLA0KPiA+ICsJCQkJCQlSRUdfRU5BQkxFKTsNCj4gPiArCQlpZiAocmV0IDwgMCkNCj4g
PiArCQkJcmV0dXJuIHJldDsNCj4gPiArCX0NCj4gPiArDQo+ID4gKwkvKiBTZXQgTUlQSSBUWCBz
cGVlZCBhY2NvcmRpbmcgdG8gRFQgcHJvcGVydHkgKi8NCj4gPiArCWlmIChvdjAyYTEwLT5taXBp
X2Nsb2NrX3ZvbHRhZ2UgIT0gT1YwMkExMF9NSVBJX1RYX1NQRUVEX0RFRkFVTFQpIHsNCj4gPiAr
CQlyZXQgPSBpMmNfc21idXNfd3JpdGVfYnl0ZV9kYXRhKGNsaWVudCwgVFhfU1BFRURfQVJFQV9T
RUwsDQo+ID4gKwkJCQkJCW92MDJhMTAtPm1pcGlfY2xvY2tfdm9sdGFnZSk7DQo+ID4gKwkJaWYg
KHJldCA8IDApDQo+ID4gKwkJCXJldHVybiByZXQ7DQo+ID4gKwl9DQo+ID4gKw0KPiA+ICsJLyog
U2V0IHN0cmVhbSBvbiByZWdpc3RlciAqLw0KPiA+ICsJcmV0dXJuIGkyY19zbWJ1c193cml0ZV9i
eXRlX2RhdGEoY2xpZW50LCBSRUdfU0NfQ1RSTF9NT0RFLA0KPiA+ICsJCQkJCSBTQ19DVFJMX01P
REVfU1RSRUFNSU5HKTsNCj4gPiArfQ0KPiANCj4gLi4uDQo+IA0KPiA+ICsvKg0KPiANCj4gV2Fz
IHlvdXIgaW50ZW50aW9uIHRvIGRlY2xhcmUgaXQgYXMgYSBrZXJuZWwgZG9jPw0KPiANCg0KUmVt
b3ZlZCBpbiBuZXh0IHJlbGVhc2UuDQoNCj4gPiArICogb3YwMmExMF9zZXRfZXhwb3N1cmUgLSBG
dW5jdGlvbiBjYWxsZWQgd2hlbiBzZXR0aW5nIGV4cG9zdXJlIHRpbWUNCj4gPiArICogQHByaXY6
IFBvaW50ZXIgdG8gZGV2aWNlIHN0cnVjdHVyZQ0KPiA+ICsgKiBAdmFsOiBWYXJpYWJsZSBmb3Ig
ZXhwb3N1cmUgdGltZSwgaW4gdGhlIHVuaXQgb2YgbWljcm8tc2Vjb25kDQo+ID4gKyAqDQo+ID4g
KyAqIFNldCBleHBvc3VyZSB0aW1lIGJhc2VkIG9uIGlucHV0IHZhbHVlLg0KPiA+ICsgKg0KPiA+
ICsgKiBSZXR1cm46IDAgb24gc3VjY2Vzcw0KPiA+ICsgKi8NCj4gPiArc3RhdGljIGludCBvdjAy
YTEwX3NldF9leHBvc3VyZShzdHJ1Y3Qgb3YwMmExMCAqb3YwMmExMCwgaW50IHZhbCkNCj4gDQo+
IC4uLg0KPiANCj4gPiArc3RhdGljIGludCBvdjAyYTEwX2NoZWNrX2h3Y2ZnKHN0cnVjdCBkZXZp
Y2UgKmRldiwgc3RydWN0IG92MDJhMTAgKm92MDJhMTApDQo+ID4gK3sNCj4gPiArCXN0cnVjdCBm
d25vZGVfaGFuZGxlICplcDsNCj4gPiArCXN0cnVjdCBmd25vZGVfaGFuZGxlICpmd25vZGUgPSBk
ZXZfZndub2RlKGRldik7DQo+ID4gKwlzdHJ1Y3QgdjRsMl9md25vZGVfZW5kcG9pbnQgYnVzX2Nm
ZyA9IHsNCj4gPiArCQkuYnVzX3R5cGUgPSBWNEwyX01CVVNfQ1NJMl9EUEhZLA0KPiA+ICsJfTsN
Cj4gPiArCXVuc2lnbmVkIGludCBpLCBqOw0KPiA+ICsJaW50IHJldDsNCj4gDQo+ID4gKwlpZiAo
IWZ3bm9kZSkNCj4gPiArCQlyZXR1cm4gLUVJTlZBTDsNCj4gDQo+IEJhc2ljYWxseSB5b3UgY2Fu
IGF2b2lkIHRoaXMgY2hlY2ssIGJ1dCBpdCdzIHVwIHRvIHlvdS4NCj4gDQoNCkknZCBsaWtlIHRv
IGtlZXAgaXQuIFRoYW5rIHlvdS4NCg0KPiA+ICsJZXAgPSBmd25vZGVfZ3JhcGhfZ2V0X25leHRf
ZW5kcG9pbnQoZndub2RlLCBOVUxMKTsNCj4gPiArCWlmICghZXApDQo+ID4gKwkJcmV0dXJuIC1F
TlhJTzsNCj4gPiArDQo+ID4gKwlyZXQgPSB2NGwyX2Z3bm9kZV9lbmRwb2ludF9hbGxvY19wYXJz
ZShlcCwgJmJ1c19jZmcpOw0KPiA+ICsJZndub2RlX2hhbmRsZV9wdXQoZXApOw0KPiA+ICsJaWYg
KHJldCkNCj4gPiArCQlyZXR1cm4gcmV0Ow0KPiA+ICsNCj4gPiArCWZvciAoaSA9IDA7IGkgPCBB
UlJBWV9TSVpFKGxpbmtfZnJlcV9tZW51X2l0ZW1zKTsgaSsrKSB7DQo+ID4gKwkJZm9yIChqID0g
MDsgaiA8IGJ1c19jZmcubnJfb2ZfbGlua19mcmVxdWVuY2llczsgaisrKSB7DQo+ID4gKwkJCWlm
IChsaW5rX2ZyZXFfbWVudV9pdGVtc1tpXSA9PQ0KPiA+ICsJCQkJYnVzX2NmZy5saW5rX2ZyZXF1
ZW5jaWVzW2pdKSB7DQo+ID4gKwkJCQlvdjAyYTEwLT5mcmVxX2luZGV4ID0gaTsNCj4gPiArCQkJ
CWJyZWFrOw0KPiA+ICsJCQl9DQo+ID4gKwkJfQ0KPiA+ICsNCj4gPiArCQlpZiAoaiA9PSBidXNf
Y2ZnLm5yX29mX2xpbmtfZnJlcXVlbmNpZXMpIHsNCj4gPiArCQkJZGV2X2VycihkZXYsICJubyBs
aW5rIGZyZXF1ZW5jeSAlbGxkIHN1cHBvcnRlZFxuIiwNCj4gPiArCQkJCWxpbmtfZnJlcV9tZW51
X2l0ZW1zW2ldKTsNCj4gPiArCQkJcmV0ID0gLUVJTlZBTDsNCj4gPiArCQkJYnJlYWs7DQo+ID4g
KwkJfQ0KPiA+ICsJfQ0KPiA+ICsNCj4gPiArCXY0bDJfZndub2RlX2VuZHBvaW50X2ZyZWUoJmJ1
c19jZmcpOw0KPiA+ICsNCj4gPiArCXJldHVybiByZXQ7DQo+ID4gK30NCj4gDQo+IC4uLg0KPiAN
Cj4gPiArCWZ3bm9kZV9wcm9wZXJ0eV9yZWFkX3UzMihkZXZfZndub2RlKGRldiksICJyb3RhdGlv
biIsICZyb3RhdGlvbik7DQo+IA0KPiBTYW1lIFEgYXMgcGVyIHByZXZpb3VzIHJldmlld3MuIFdo
eSBkZXZpY2UgcHJvcGVydHkgQVBJIGNhbid0IGJlIHVzZWQgaGVyZT8NCj4gDQo+IEFuZCBldmVy
eXdoZXJlIGVsc2Ugd2hlbiB5b3UgaGF2ZQ0KPiAJIGZ3bm9kZV9wcm9wZXJ0eV9yZWFkXyooZGV2
X2Z3bm9kZShkZXYpLCAuLi4pDQo+IGNhbGxzLg0KPiANCg0KVGhhbmtzIGZvciB0aGUgcmVtaW5k
ZXIuDQonZndub2RlX3Byb3BlcnR5X3JlYWRfdTMyJyBhbmQgJ2Z3bm9kZV9wcm9wZXJ0eV9yZWFk
X3UzMl9hcnJheScgd291bGQgYmUNCnJlcGxhY2VkIGluIG5leHQgcmVsZWFzZSBpZiBsb2NhbCB0
ZXN0IHBhc3Nlcy4NCg0K

