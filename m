Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 9D4B02106AB
	for <lists+linux-media@lfdr.de>; Wed,  1 Jul 2020 10:48:05 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728848AbgGAIry (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 1 Jul 2020 04:47:54 -0400
Received: from Mailgw01.mediatek.com ([1.203.163.78]:21673 "EHLO
        mailgw01.mediatek.com" rhost-flags-OK-FAIL-OK-FAIL) by vger.kernel.org
        with ESMTP id S1728813AbgGAIrw (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Wed, 1 Jul 2020 04:47:52 -0400
X-UUID: eb80607b05104bf2adddc2fb22d9db9c-20200701
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
        h=Content-Transfer-Encoding:MIME-Version:Content-Type:References:In-Reply-To:Date:CC:To:From:Subject:Message-ID; bh=SDn5+tQnbteYq/qm4PoeIfk0TU0/1SzsqgINczT+k7o=;
        b=eBS5eSnT44i1wuDO2eKZLeoIDz8HaKq7ry/mB9Nm9FvA/qCPqfVcPoFkzuNGJ5wEs5FEsaKUoJSH3326njWiPpCqOOtmtKWPRgHDHsgRUp46c9njg7+f1cRC4yfj7nSTkgWSESRWJaYXF1hXLdA68/XWtawxy34uLp+fmle6nt0=;
X-UUID: eb80607b05104bf2adddc2fb22d9db9c-20200701
Received: from mtkcas34.mediatek.inc [(172.27.4.253)] by mailgw01.mediatek.com
        (envelope-from <dongchun.zhu@mediatek.com>)
        (mailgw01.mediatek.com ESMTP with TLS)
        with ESMTP id 1333359127; Wed, 01 Jul 2020 16:47:45 +0800
Received: from MTKCAS32.mediatek.inc (172.27.4.184) by MTKMBS31DR.mediatek.inc
 (172.27.6.102) with Microsoft SMTP Server (TLS) id 15.0.1497.2; Wed, 1 Jul
 2020 16:47:45 +0800
Received: from [10.17.3.153] (10.17.3.153) by MTKCAS32.mediatek.inc
 (172.27.4.170) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Wed, 1 Jul 2020 16:47:42 +0800
Message-ID: <1593593242.17166.48.camel@mhfsdcap03>
Subject: Re: [PATCH V11 2/2] media: i2c: ov02a10: Add OV02A10 image sensor
 driver
From:   Dongchun Zhu <dongchun.zhu@mediatek.com>
To:     Sakari Ailus <sakari.ailus@linux.intel.com>
CC:     Tomasz Figa <tfiga@chromium.org>, <linus.walleij@linaro.org>,
        <bgolaszewski@baylibre.com>, <mchehab@kernel.org>,
        <andriy.shevchenko@linux.intel.com>, <robh+dt@kernel.org>,
        <mark.rutland@arm.com>, <drinkcat@chromium.org>,
        <matthias.bgg@gmail.com>, <bingbu.cao@intel.com>,
        <srv_heupstream@mediatek.com>,
        <linux-mediatek@lists.infradead.org>,
        <linux-arm-kernel@lists.infradead.org>, <sj.huang@mediatek.com>,
        <linux-media@vger.kernel.org>, <devicetree@vger.kernel.org>,
        <louis.kuo@mediatek.com>, <shengnan.wang@mediatek.com>,
        <dongchun.zhu@mediatek.com>
Date:   Wed, 1 Jul 2020 16:47:22 +0800
In-Reply-To: <20200630184702.GH16711@paasikivi.fi.intel.com>
References: <20200630024942.20891-1-dongchun.zhu@mediatek.com>
         <20200630024942.20891-3-dongchun.zhu@mediatek.com>
         <20200630170746.GD1212092@chromium.org>
         <20200630184702.GH16711@paasikivi.fi.intel.com>
Content-Type: text/plain; charset="UTF-8"
X-Mailer: Evolution 3.10.4-0ubuntu2 
MIME-Version: 1.0
X-TM-SNTS-SMTP: B41849E7468EBFC9B60FC92E7E7E845B75FAEEA141398C78B5F99E380EA612E52000:8
X-MTK:  N
Content-Transfer-Encoding: base64
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

SGkgVG9tYXN6LCBTYWthcmksDQoNClRoYW5rcyBmb3IgdGhlIHJldmlldy4NCg0KT24gVHVlLCAy
MDIwLTA2LTMwIGF0IDIxOjQ3ICswMzAwLCBTYWthcmkgQWlsdXMgd3JvdGU6DQo+IE9uIFR1ZSwg
SnVuIDMwLCAyMDIwIGF0IDA1OjA3OjQ2UE0gKzAwMDAsIFRvbWFzeiBGaWdhIHdyb3RlOg0KPiA+
IEhpIERvbmdjaHVuLA0KPiA+IA0KPiA+IE9uIFR1ZSwgSnVuIDMwLCAyMDIwIGF0IDEwOjQ5OjQy
QU0gKzA4MDAsIERvbmdjaHVuIFpodSB3cm90ZToNCj4gPiA+IEFkZCBhIFY0TDIgc3ViLWRldmlj
ZSBkcml2ZXIgZm9yIE9WMDJBMTAgaW1hZ2Ugc2Vuc29yLg0KPiA+ID4gDQo+ID4gPiBTaWduZWQt
b2ZmLWJ5OiBEb25nY2h1biBaaHUgPGRvbmdjaHVuLnpodUBtZWRpYXRlay5jb20+DQo+ID4gPiAt
LS0NCj4gPiA+ICBNQUlOVEFJTkVSUyAgICAgICAgICAgICAgICAgfCAgICAxICsNCj4gPiA+ICBk
cml2ZXJzL21lZGlhL2kyYy9LY29uZmlnICAgfCAgIDEzICsNCj4gPiA+ICBkcml2ZXJzL21lZGlh
L2kyYy9NYWtlZmlsZSAgfCAgICAxICsNCj4gPiA+ICBkcml2ZXJzL21lZGlhL2kyYy9vdjAyYTEw
LmMgfCAxMDUyICsrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysNCj4g
PiA+ICA0IGZpbGVzIGNoYW5nZWQsIDEwNjcgaW5zZXJ0aW9ucygrKQ0KPiA+ID4gIGNyZWF0ZSBt
b2RlIDEwMDY0NCBkcml2ZXJzL21lZGlhL2kyYy9vdjAyYTEwLmMNCj4gPiANCj4gPiBUaGFuayB5
b3UgZm9yIHRoZSBwYXRjaC4gUGxlYXNlIHNlZSBteSBjb21tZW50cyBpbmxpbmUuDQo+ID4gDQo+
ID4gW3NuaXBdDQo+ID4gPiArc3RhdGljIGludCBvdjAyYTEwX2VudGl0eV9pbml0X2NmZyhzdHJ1
Y3QgdjRsMl9zdWJkZXYgKnNkLA0KPiA+ID4gKwkJCQkgICBzdHJ1Y3QgdjRsMl9zdWJkZXZfcGFk
X2NvbmZpZyAqY2ZnKQ0KPiA+ID4gK3sNCj4gPiA+ICsJc3RydWN0IHY0bDJfc3ViZGV2X2Zvcm1h
dCBmbXQgPSB7DQo+ID4gPiArCQkud2hpY2ggPSBjZmcgPyBWNEwyX1NVQkRFVl9GT1JNQVRfVFJZ
IDogVjRMMl9TVUJERVZfRk9STUFUX0FDVElWRSwNCj4gPiANCj4gPiBBcyB3ZSBkaXNjdXNzZWQg
YmVmb3JlLCB0aGlzIGZ1bmN0aW9uIGlzIG5ldmVyIGNhbGxlZCB3aXRoIGNmZyA9PSBOVUxMLg0K
PiA+IFBlcmhhcHMgd2hhdCB3ZSBuZWVkIGhlcmUgaXMgdG8gY2FsbCBvdjAyYTEwX3NldF9mbXQo
KSB0d2ljZSwgb25jZSBmb3INCj4gPiBWNEwyX1NVQkRFVl9GT1JNQVRfQUNUSVZFIGFuZCB0aGVu
IGZvciBWNEwyX1NVQkRFVl9GT1JNQVRfVFJZPw0KPiA+IA0KPiA+IFNha2FyaSwgd291bGQgdGhh
dCBiZSBhIHByb3BlciBpbXBsZW1lbnRhdGlvbiBvZiB0aGlzIGZ1bmN0aW9uPw0KPiANCj4gSXQn
cyBmaW5lIHRvIHRlc3QgZm10LCBidXQgaXQgc2hvdWxkIGJlIG9ubHkgZG9uZSBpZiB0aGUgZHJp
dmVyIGNhbGxzIHRoZQ0KPiBmdW5jdGlvbiB3aXRoIEFDVElWRSBmb3JtYXQuIEkuZS4gaXQgY2Fu
IGJlIHJlbW92ZWQgaGVyZSwgYW5kIGFsd2F5cyB1c2UNCj4gVFJZLg0KPiANCg0KU29ycnkgZm9y
IG15IGxhdGUgY29taW5nLg0KVGhlIGltcGxlbWVudGF0aW9uIG9mIHRoaXMgZnVuY3Rpb24gc2hv
dWxkIGJlIGNvbW1vbihzaW1pbGFyIHRvDQpPVjI2ODAvT1Y1NjQ1KS4NCklmIGl0IG5lZWRzIHRv
IHVwZGF0ZSB0byBiZSBtb3JlIHByb3BlciBvciBjbGVhciwgYXMgdXNlciBhbHdheXMgc2V0cw0K
Zm9ybWF0LndoaWNoIHRvIEFDVElWRSB3aGVuIGNhbGxpbmcgc2V0X2ZtdCwgd2UgY291bGQgb25s
eSByZXNlcnZlIHRoZQ0KVFJZIGZvcm1hdCBpbiBpbml0X2NmZyBsaWtlIHRoaXM6DQpzdHJ1Y3Qg
djRsMl9zdWJkZXZfZm9ybWF0IGZtdCA9IHsNCgl3aGljaCA9IFY0TDJfU1VCREVWX0ZPUk1BVF9U
UlksDQoNCj4gPiANCj4gPiA+ICsJCS5mb3JtYXQgPSB7DQo+ID4gPiArCQkJLndpZHRoID0gMTYw
MCwNCj4gPiA+ICsJCQkuaGVpZ2h0ID0gMTIwMCwNCj4gPiA+ICsJCX0NCj4gPiA+ICsJfTsNCj4g
PiA+ICsNCj4gPiA+ICsJb3YwMmExMF9zZXRfZm10KHNkLCBjZmcsICZmbXQpOw0KPiA+ID4gKw0K
PiA+ID4gKwlyZXR1cm4gMDsNCj4gPiBbc25pcF0NCj4gPiANCj4gPiBXaXRoIHRoaXMgYW5kIFNh
a2FyaSdzIGNvbW1lbnQgYWJvdXQgdGhlIGluaXRpYWwgc3RhdGUgb2YgdGhlIHJlc2V0IHBpbg0K
PiA+IGZpeGVkLCBmZWVsIGZyZWUgdG8gYWRkIG15DQo+ID4gDQo+ID4gUmV2aWV3ZWQtYnk6IFRv
bWFzeiBGaWdhIDx0ZmlnYUBjaHJvbWl1bS5vcmc+DQo+ID4gDQo+ID4gQmVzdCByZWdhcmRzLA0K
PiA+IFRvbWFzeg0KPiANCg0K

