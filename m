Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id EC0511E5A5F
	for <lists+linux-media@lfdr.de>; Thu, 28 May 2020 10:06:43 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726354AbgE1IGm (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 28 May 2020 04:06:42 -0400
Received: from mailgw02.mediatek.com ([1.203.163.81]:47752 "EHLO
        mailgw02.mediatek.com" rhost-flags-OK-FAIL-OK-FAIL) by vger.kernel.org
        with ESMTP id S1725859AbgE1IGm (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 28 May 2020 04:06:42 -0400
X-UUID: 0a855f739526435198e75b7b2b12af42-20200528
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
        h=Content-Transfer-Encoding:MIME-Version:Content-Type:References:In-Reply-To:Date:CC:To:From:Subject:Message-ID; bh=vdtwpDh+BfZcY9fDqODOL1gT1h9erHJDlZqiyVdKXQw=;
        b=IDMRoK7fCZBli2i3w6DRX53TBA8Vt+bgLN79INQdHYH6mykU28MIKvMszxnQoWFWJ37clhUb9qYosQ2nnC4SpSZikGTDunFCTqv3kGrdyTnlfJW/C4GaoXh8DmF3GN5cu+qs3zDCa0SaOO7DYuMh+fFhdFXa+eVqonnf8YfP7Io=;
X-UUID: 0a855f739526435198e75b7b2b12af42-20200528
Received: from mtkcas36.mediatek.inc [(172.27.4.253)] by mailgw02.mediatek.com
        (envelope-from <dongchun.zhu@mediatek.com>)
        (mailgw01.mediatek.com ESMTP with TLS)
        with ESMTP id 1314655395; Thu, 28 May 2020 16:06:32 +0800
Received: from MTKCAS36.mediatek.inc (172.27.4.186) by MTKMBS31N2.mediatek.inc
 (172.27.4.87) with Microsoft SMTP Server (TLS) id 15.0.1497.2; Thu, 28 May
 2020 16:06:29 +0800
Received: from [10.17.3.153] (10.17.3.153) by MTKCAS36.mediatek.inc
 (172.27.4.170) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Thu, 28 May 2020 16:06:30 +0800
Message-ID: <1590653082.8804.517.camel@mhfsdcap03>
Subject: Re: [V9, 1/2] media: dt-bindings: media: i2c: Document OV02A10
 bindings
From:   Dongchun Zhu <dongchun.zhu@mediatek.com>
To:     Sakari Ailus <sakari.ailus@linux.intel.com>
CC:     Rob Herring <robh@kernel.org>,
        Linus Walleij <linus.walleij@linaro.org>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Mark Rutland <mark.rutland@arm.com>,
        Nicolas Boichat <drinkcat@chromium.org>,
        Tomasz Figa <tfiga@chromium.org>,
        Matthias Brugger <matthias.bgg@gmail.com>,
        Cao Bing Bu <bingbu.cao@intel.com>,
        srv_heupstream <srv_heupstream@mediatek.com>,
        "moderated list:ARM/Mediatek SoC support" 
        <linux-mediatek@lists.infradead.org>,
        "moderated list:ARM/FREESCALE IMX / MXC ARM ARCHITECTURE" 
        <linux-arm-kernel@lists.infradead.org>,
        Sj Huang <sj.huang@mediatek.com>,
        Linux Media Mailing List <linux-media@vger.kernel.org>,
        <devicetree@vger.kernel.org>, Louis Kuo <louis.kuo@mediatek.com>,
        "Shengnan Wang =?UTF-8?Q?=28=E7=8E=8B=E5=9C=A3=E7=94=B7=29?=" 
        <shengnan.wang@mediatek.com>
Date:   Thu, 28 May 2020 16:04:42 +0800
In-Reply-To: <20200528072332.GW7618@paasikivi.fi.intel.com>
References: <20200523084103.31276-1-dongchun.zhu@mediatek.com>
         <20200523084103.31276-2-dongchun.zhu@mediatek.com>
         <20200526182847.GA92449@bogus> <1590569355.8804.448.camel@mhfsdcap03>
         <CAL_Jsq+sN0SVidTrY0ODXEkzkxYFvG1FTnL0oRQBSKf=ynLdyQ@mail.gmail.com>
         <20200527211628.GT7618@paasikivi.fi.intel.com>
         <1590636882.8804.474.camel@mhfsdcap03>
         <20200528072332.GW7618@paasikivi.fi.intel.com>
Content-Type: text/plain; charset="UTF-8"
X-Mailer: Evolution 3.10.4-0ubuntu2 
MIME-Version: 1.0
X-TM-SNTS-SMTP: 40A29D3792692DD8CE5B51233948BE224921176E99DFDF64883FC26B2B3119662000:8
X-MTK:  N
Content-Transfer-Encoding: base64
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

SGkgU2FrYXJpLA0KDQpPbiBUaHUsIDIwMjAtMDUtMjggYXQgMTA6MjMgKzAzMDAsIFNha2FyaSBB
aWx1cyB3cm90ZToNCj4gSGkgRG9uZ2NodW4sDQo+IA0KPiBPbiBUaHUsIE1heSAyOCwgMjAyMCBh
dCAxMTozNDo0MkFNICswODAwLCBEb25nY2h1biBaaHUgd3JvdGU6DQo+ID4gSGkgU2FrYXJpLCBS
b2IsDQo+ID4gDQo+ID4gT24gVGh1LCAyMDIwLTA1LTI4IGF0IDAwOjE2ICswMzAwLCBTYWthcmkg
QWlsdXMgd3JvdGU6DQo+ID4gPiBIaSBSb2IsIERvbmdjaHVuLA0KPiA+ID4gDQo+ID4gPiBPbiBX
ZWQsIE1heSAyNywgMjAyMCBhdCAwOToyNzoyMkFNIC0wNjAwLCBSb2IgSGVycmluZyB3cm90ZToN
Cj4gPiA+ID4gPiA+ID4gKyAgICBwcm9wZXJ0aWVzOg0KPiA+ID4gPiA+ID4gPiArICAgICAgZW5k
cG9pbnQ6DQo+ID4gPiA+ID4gPiA+ICsgICAgICAgIHR5cGU6IG9iamVjdA0KPiA+ID4gPiA+ID4g
PiArICAgICAgICBhZGRpdGlvbmFsUHJvcGVydGllczogZmFsc2UNCj4gPiA+ID4gPiA+ID4gKw0K
PiA+ID4gPiA+ID4gPiArICAgICAgICBwcm9wZXJ0aWVzOg0KPiA+ID4gPiA+DQo+ID4gPiA+ID4g
QWN0dWFsbHkgSSB3b25kZXIgd2hldGhlciB3ZSBuZWVkIHRvIGRlY2xhcmUgJ2Nsb2NrLWxhbmVz
JyBoZXJlPw0KPiA+ID4gPiANCj4gPiA+ID4gWWVzLCBpZiB5b3UgYXJlIHVzaW5nIGl0Lg0KPiA+
ID4gDQo+ID4gPiBEb25nY2h1biwgY2FuIHlvdSBjb25maXJtIHRoZSBjaGlwIGhhcyBhIHNpbmds
ZSBkYXRhIGFuZCBhIHNpbmdsZSBjbG9jaw0KPiA+ID4gbGFuZSBhbmQgdGhhdCBpdCBkb2VzIG5v
dCBzdXBwb3J0IGxhbmUgcmVvcmRlcmluZz8NCj4gPiA+IA0KPiA+IA0KPiA+IEZyb20gdGhlIGRh
dGFzaGVldCwgJ01JUEkgaW5zaWRlIHRoZSBPVjAyQTEwIHByb3ZpZGVzIG9uZSBzaW5nbGUNCj4g
PiB1bmktZGlyZWN0aW9uYWwgY2xvY2sgbGFuZSBhbmQgb25lIGJpLWRpcmVjdGlvbmFsIGRhdGEg
bGFuZSBzb2x1dGlvbiBmb3INCj4gPiBjb21tdW5pY2F0aW9uIGxpbmtzIGJldHdlZW4gY29tcG9u
ZW50cyBpbnNpZGUgYSBtb2JpbGUgZGV2aWNlLg0KPiA+IFRoZSBkYXRhIGxhbmUgaGFzIGZ1bGwg
c3VwcG9ydCBmb3IgSFModW5pLWRpcmVjdGlvbmFsKSBhbmQNCj4gPiBMUChiaS1kaXJlY3Rpb25h
bCkgZGF0YSB0cmFuc2ZlciBtb2RlLicNCj4gPiANCj4gPiBUaGUgc2Vuc29yIGRvZXNuJ3Qgc3Vw
cG9ydCBsYW5lIHJlb3JkZXJpbmcsIHNvICdjbG9jay1sYW5lcycgcHJvcGVydHkNCj4gPiB3b3Vs
ZCBub3QgYmUgYWRkZWQgaW4gbmV4dCByZWxlYXNlLg0KPiA+IA0KPiA+ID4gU28gaWYgdGhlcmUn
cyBub3RoaW5nIHRvIGNvbnZleSB0byB0aGUgZHJpdmVyLCBhbHNvIHRoZSBkYXRhLWxhbmVzIHNo
b3VsZA0KPiA+ID4gYmUgcmVtb3ZlZCBJTU8uDQo+ID4gPiANCj4gPiANCj4gPiBIb3dldmVyLCAn
ZGF0YS1sYW5lcycgcHJvcGVydHkgbWF5IHN0aWxsIGJlIHJlcXVpcmVkLg0KPiA+IEl0IGlzIGtu
b3duIHRoYXQgZWl0aGVyIGRhdGEtbGFuZXMgb3IgY2xvY2stbGFuZXMgaXMgYW4gYXJyYXkgb2YN
Cj4gPiBwaHlzaWNhbCBkYXRhIGxhbmUgaW5kZXhlcy4gUG9zaXRpb24gb2YgYW4gZW50cnkgZGV0
ZXJtaW5lcyB0aGUgbG9naWNhbA0KPiA+IGxhbmUgbnVtYmVyLCB3aGlsZSB0aGUgdmFsdWUgb2Yg
YW4gZW50cnkgaW5kaWNhdGVzIHBoeXNpY2FsIGxhbmUsIGUuZy4sDQo+ID4gZm9yIDEtbGFuZSBN
SVBJIENTSS0yIGJ1cyB3ZSBjb3VsZCBoYXZlICJkYXRhLWxhbmVzID0gPDE+OyIsIGFzc3VtaW5n
DQo+ID4gdGhlIGNsb2NrIGxhbmUgaXMgb24gaGFyZHdhcmUgbGFuZSAwLg0KPiA+IA0KPiA+IEFz
IG1lbnRpb25lZCBlYXJsaWVyLCB0aGUgT1YwMkExMCBzZW5zb3Igc3VwcG9ydHMgb25seSAxQzFE
IGFuZCBkb2VzIG5vdA0KPiA+IHN1cHBvcnQgbGFuZSByZW9yZGVyaW5nLCBzbyBoZXJlIHdlIHNo
YWxsIHVzZSAnZGF0YS1sYW5lcyA9IDwxPicgYXMNCj4gPiB0aGVyZSBpcyBvbmx5IGEgY2xvY2sg
bGFuZSBmb3IgT1YwMkExMC4NCj4gPiANCj4gPiBSZW1pbmRlcjoNCj4gPiBJZiAnZGF0YS1sYW5l
cycgcHJvcGVydHkgaXMgbm90IHByZXNlbnQsIHRoZSBkcml2ZXIgd291bGQgYXNzdW1lDQo+ID4g
Zm91ci1sYW5lIG9wZXJhdGlvbi4gVGhpcyBtZWFucyBmb3Igb25lLWxhbmUgb3IgdHdvLWxhbmUg
b3BlcmF0aW9uLCB0aGlzDQo+ID4gcHJvcGVydHkgbXVzdCBiZSBwcmVzZW50IGFuZCBzZXQgdG8g
dGhlIHJpZ2h0IHBoeXNpY2FsIGxhbmUgaW5kZXhlcy4NCj4gPiBJZiB0aGUgaGFyZHdhcmUgZG9l
cyBub3Qgc3VwcG9ydCBsYW5lIHJlb3JkZXJpbmcsIG1vbm90b25pY2FsbHkNCj4gPiBpbmNyZW1l
bnRlZCB2YWx1ZXMgc2hhbGwgYmUgdXNlZCBmcm9tIDAgb3IgMSBvbndhcmRzLCBkZXBlbmRpbmcg
b24NCj4gPiB3aGV0aGVyIG9yIG5vdCB0aGVyZSBpcyBhbHNvIGEgY2xvY2sgbGFuZS4NCj4gDQo+
IEhvdyBjYW4gdGhlIGRyaXZlciB1c2UgZm91ciBsYW5lcywgY29uc2lkZXJpbmcgdGhlIGRldmlj
ZSBvbmx5IHN1cHBvcnRzIGENCj4gc2luZ2xlIGxhbmU/Pw0KPiANCg0KSSB1bmRlcnN0b29kIHlv
dXIgbWVhbmluZy4NCklmIHdlIG9taXQgdGhlIHByb3BlcnR5ICdkYXRhLWxhbmVzJywgdGhlIHNl
bnNvciBzaG91bGQgd29yayBzdGlsbC4NCkJ1dCB0aGVuIHdoYXQncyB0aGUgbWVhbmluZyBvZiB0
aGUgZXhpc3RlbmNlIG9mICdkYXRhLWxhbmVzJz8NCklmIHRoaXMgcHJvcGVydHkgJ2RhdGEtbGFu
ZXMnIGlzIGFsd2F5cyBvcHRpb25hbCwgdGhlbiB3aHkgZHQtYmluZGluZ3MNCnByb3ZpZGUgdGhl
IGludGVyZmFjZT8NCg0KSW4gdGhlIG1lYW50aW1lLCBpZiBvbWl0dGluZyAnZGF0YS1sYW5lcycg
Zm9yIG9uZSBzZW5zb3IodHJhbnNtaXR0ZXIpDQp0aGF0IGhhcyBvbmx5IG9uZSBwaHlzaWNhbCBk
YXRhIGxhbmUsIE1JUEkgcmVjZWl2ZXIoZS5nLiwgTUlQSSBDU0ktMikNCnNoYWxsIGVuYWJsZSBm
b3VyLWxhbmUgY29uZmlndXJhdGlvbiwgd2hpY2ggbWF5IGluY3JlYXNlIGNvbnN1bXB0aW9uIG9m
DQpib3RoIHBvd2VyIGFuZCByZXNvdXJjZSBpbiB0aGUgcHJvY2VzcyBvZiBJSUMgY29tbXVuaWNh
dGlvbi4NCg==

