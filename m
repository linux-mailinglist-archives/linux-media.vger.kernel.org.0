Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E68881EB5BA
	for <lists+linux-media@lfdr.de>; Tue,  2 Jun 2020 08:17:18 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726023AbgFBGRR (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 2 Jun 2020 02:17:17 -0400
Received: from mailgw02.mediatek.com ([1.203.163.81]:13915 "EHLO
        mailgw02.mediatek.com" rhost-flags-OK-FAIL-OK-FAIL) by vger.kernel.org
        with ESMTP id S1725616AbgFBGRQ (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Tue, 2 Jun 2020 02:17:16 -0400
X-UUID: 35810b81d32b4c2fb83d64a736cbb0b8-20200602
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
        h=Content-Transfer-Encoding:MIME-Version:Content-Type:References:In-Reply-To:Date:CC:To:From:Subject:Message-ID; bh=52LMWjXgcgHTMdeFN/WLfv0/xMo/B6WtU8uG4FMZzUc=;
        b=Ta3IVYkhnmB/dVSEfHPTNiYKF9P8zXqeF/tI3Ea3MARnUCKYy1e6V5AxsSPrLfO/AlLNfY+0uuiMjzGtid6Iyzt8s6J2Of3kWNSMZI2dMxCSBxvi5Jmmdzf58qbdWlirOBbPNCtcjcQKiPofwSU74x4Jt7EnW028Qhv4BC6VSRs=;
X-UUID: 35810b81d32b4c2fb83d64a736cbb0b8-20200602
Received: from mtkcas35.mediatek.inc [(172.27.4.253)] by mailgw02.mediatek.com
        (envelope-from <dongchun.zhu@mediatek.com>)
        (mailgw01.mediatek.com ESMTP with TLS)
        with ESMTP id 1590037980; Tue, 02 Jun 2020 14:17:01 +0800
Received: from MTKCAS32.mediatek.inc (172.27.4.184) by MTKMBS31N2.mediatek.inc
 (172.27.4.87) with Microsoft SMTP Server (TLS) id 15.0.1497.2; Tue, 2 Jun
 2020 14:16:59 +0800
Received: from [10.17.3.153] (10.17.3.153) by MTKCAS32.mediatek.inc
 (172.27.4.170) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Tue, 2 Jun 2020 14:16:58 +0800
Message-ID: <1591078501.8804.539.camel@mhfsdcap03>
Subject: Re: [V9, 1/2] media: dt-bindings: media: i2c: Document OV02A10
 bindings
From:   Dongchun Zhu <dongchun.zhu@mediatek.com>
To:     Tomasz Figa <tfiga@chromium.org>
CC:     Sakari Ailus <sakari.ailus@linux.intel.com>,
        Rob Herring <robh@kernel.org>,
        Linus Walleij <linus.walleij@linaro.org>,
        "Bartosz Golaszewski" <bgolaszewski@baylibre.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Mark Rutland <mark.rutland@arm.com>,
        Nicolas Boichat <drinkcat@chromium.org>,
        Matthias Brugger <matthias.bgg@gmail.com>,
        "Cao Bing Bu" <bingbu.cao@intel.com>,
        srv_heupstream <srv_heupstream@mediatek.com>,
        "moderated list:ARM/Mediatek SoC support" 
        <linux-mediatek@lists.infradead.org>,
        "moderated list:ARM/FREESCALE IMX / MXC ARM ARCHITECTURE" 
        <linux-arm-kernel@lists.infradead.org>,
        Sj Huang <sj.huang@mediatek.com>,
        Linux Media Mailing List <linux-media@vger.kernel.org>,
        linux-devicetree <devicetree@vger.kernel.org>,
        Louis Kuo <louis.kuo@mediatek.com>,
        "Shengnan Wang =?UTF-8?Q?=28=E7=8E=8B=E5=9C=A3=E7=94=B7=29?=" 
        <shengnan.wang@mediatek.com>
Date:   Tue, 2 Jun 2020 14:15:01 +0800
In-Reply-To: <CAAFQd5AY9gejoiwxojvvG0FaVfEAf8gCqOddvo-dxemQWFksVw@mail.gmail.com>
References: <20200523084103.31276-1-dongchun.zhu@mediatek.com>
         <20200523084103.31276-2-dongchun.zhu@mediatek.com>
         <20200526182847.GA92449@bogus> <1590569355.8804.448.camel@mhfsdcap03>
         <CAL_Jsq+sN0SVidTrY0ODXEkzkxYFvG1FTnL0oRQBSKf=ynLdyQ@mail.gmail.com>
         <20200527211628.GT7618@paasikivi.fi.intel.com>
         <1590636882.8804.474.camel@mhfsdcap03>
         <20200528072332.GW7618@paasikivi.fi.intel.com>
         <1590653082.8804.517.camel@mhfsdcap03>
         <CAAFQd5AuHDpQN8xZsWgnAt6m2reAYJbs9nBp0+mBo7_FS81LbQ@mail.gmail.com>
         <1590978816.8804.523.camel@mhfsdcap03>
         <CAAFQd5AY9gejoiwxojvvG0FaVfEAf8gCqOddvo-dxemQWFksVw@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"
X-Mailer: Evolution 3.10.4-0ubuntu2 
MIME-Version: 1.0
X-TM-SNTS-SMTP: A9AC065C4A1F08B9E7B8B0326C91B759B13EEBC728E9C857B02494DBE22A12912000:8
X-MTK:  N
Content-Transfer-Encoding: base64
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

SGkgVG9tYXN6LCBTYWthcmksDQoNCk9uIE1vbiwgMjAyMC0wNi0wMSBhdCAyMDoxOCArMDIwMCwg
VG9tYXN6IEZpZ2Egd3JvdGU6DQo+IE9uIE1vbiwgSnVuIDEsIDIwMjAgYXQgNDozNSBBTSBEb25n
Y2h1biBaaHUgPGRvbmdjaHVuLnpodUBtZWRpYXRlay5jb20+IHdyb3RlOg0KPiA+DQo+ID4gSGkg
VG9tYXN6LA0KPiA+DQo+ID4gT24gRnJpLCAyMDIwLTA1LTI5IGF0IDE1OjQzICswMjAwLCBUb21h
c3ogRmlnYSB3cm90ZToNCj4gPiA+IE9uIFRodSwgTWF5IDI4LCAyMDIwIGF0IDEwOjA2IEFNIERv
bmdjaHVuIFpodSA8ZG9uZ2NodW4uemh1QG1lZGlhdGVrLmNvbT4gd3JvdGU6DQo+ID4gPiA+DQo+
ID4gPiA+IEhpIFNha2FyaSwNCj4gPiA+ID4NCj4gPiA+ID4gT24gVGh1LCAyMDIwLTA1LTI4IGF0
IDEwOjIzICswMzAwLCBTYWthcmkgQWlsdXMgd3JvdGU6DQo+ID4gPiA+ID4gSGkgRG9uZ2NodW4s
DQo+ID4gPiA+ID4NCj4gPiA+ID4gPiBPbiBUaHUsIE1heSAyOCwgMjAyMCBhdCAxMTozNDo0MkFN
ICswODAwLCBEb25nY2h1biBaaHUgd3JvdGU6DQo+ID4gPiA+ID4gPiBIaSBTYWthcmksIFJvYiwN
Cj4gPiA+ID4gPiA+DQo+ID4gPiA+ID4gPiBPbiBUaHUsIDIwMjAtMDUtMjggYXQgMDA6MTYgKzAz
MDAsIFNha2FyaSBBaWx1cyB3cm90ZToNCj4gPiA+ID4gPiA+ID4gSGkgUm9iLCBEb25nY2h1biwN
Cj4gPiA+ID4gPiA+ID4NCj4gPiA+ID4gPiA+ID4gT24gV2VkLCBNYXkgMjcsIDIwMjAgYXQgMDk6
Mjc6MjJBTSAtMDYwMCwgUm9iIEhlcnJpbmcgd3JvdGU6DQo+ID4gPiA+ID4gPiA+ID4gPiA+ID4g
KyAgICBwcm9wZXJ0aWVzOg0KPiA+ID4gPiA+ID4gPiA+ID4gPiA+ICsgICAgICBlbmRwb2ludDoN
Cj4gPiA+ID4gPiA+ID4gPiA+ID4gPiArICAgICAgICB0eXBlOiBvYmplY3QNCj4gPiA+ID4gPiA+
ID4gPiA+ID4gPiArICAgICAgICBhZGRpdGlvbmFsUHJvcGVydGllczogZmFsc2UNCj4gPiA+ID4g
PiA+ID4gPiA+ID4gPiArDQo+ID4gPiA+ID4gPiA+ID4gPiA+ID4gKyAgICAgICAgcHJvcGVydGll
czoNCj4gPiA+ID4gPiA+ID4gPiA+DQo+ID4gPiA+ID4gPiA+ID4gPiBBY3R1YWxseSBJIHdvbmRl
ciB3aGV0aGVyIHdlIG5lZWQgdG8gZGVjbGFyZSAnY2xvY2stbGFuZXMnIGhlcmU/DQo+ID4gPiA+
ID4gPiA+ID4NCj4gPiA+ID4gPiA+ID4gPiBZZXMsIGlmIHlvdSBhcmUgdXNpbmcgaXQuDQo+ID4g
PiA+ID4gPiA+DQo+ID4gPiA+ID4gPiA+IERvbmdjaHVuLCBjYW4geW91IGNvbmZpcm0gdGhlIGNo
aXAgaGFzIGEgc2luZ2xlIGRhdGEgYW5kIGEgc2luZ2xlIGNsb2NrDQo+ID4gPiA+ID4gPiA+IGxh
bmUgYW5kIHRoYXQgaXQgZG9lcyBub3Qgc3VwcG9ydCBsYW5lIHJlb3JkZXJpbmc/DQo+ID4gPiA+
ID4gPiA+DQo+ID4gPiA+ID4gPg0KPiA+ID4gPiA+ID4gRnJvbSB0aGUgZGF0YXNoZWV0LCAnTUlQ
SSBpbnNpZGUgdGhlIE9WMDJBMTAgcHJvdmlkZXMgb25lIHNpbmdsZQ0KPiA+ID4gPiA+ID4gdW5p
LWRpcmVjdGlvbmFsIGNsb2NrIGxhbmUgYW5kIG9uZSBiaS1kaXJlY3Rpb25hbCBkYXRhIGxhbmUg
c29sdXRpb24gZm9yDQo+ID4gPiA+ID4gPiBjb21tdW5pY2F0aW9uIGxpbmtzIGJldHdlZW4gY29t
cG9uZW50cyBpbnNpZGUgYSBtb2JpbGUgZGV2aWNlLg0KPiA+ID4gPiA+ID4gVGhlIGRhdGEgbGFu
ZSBoYXMgZnVsbCBzdXBwb3J0IGZvciBIUyh1bmktZGlyZWN0aW9uYWwpIGFuZA0KPiA+ID4gPiA+
ID4gTFAoYmktZGlyZWN0aW9uYWwpIGRhdGEgdHJhbnNmZXIgbW9kZS4nDQo+ID4gPiA+ID4gPg0K
PiA+ID4gPiA+ID4gVGhlIHNlbnNvciBkb2Vzbid0IHN1cHBvcnQgbGFuZSByZW9yZGVyaW5nLCBz
byAnY2xvY2stbGFuZXMnIHByb3BlcnR5DQo+ID4gPiA+ID4gPiB3b3VsZCBub3QgYmUgYWRkZWQg
aW4gbmV4dCByZWxlYXNlLg0KPiA+ID4gPiA+ID4NCj4gPiA+ID4gPiA+ID4gU28gaWYgdGhlcmUn
cyBub3RoaW5nIHRvIGNvbnZleSB0byB0aGUgZHJpdmVyLCBhbHNvIHRoZSBkYXRhLWxhbmVzIHNo
b3VsZA0KPiA+ID4gPiA+ID4gPiBiZSByZW1vdmVkIElNTy4NCj4gPiA+ID4gPiA+ID4NCj4gPiA+
ID4gPiA+DQo+ID4gPiA+ID4gPiBIb3dldmVyLCAnZGF0YS1sYW5lcycgcHJvcGVydHkgbWF5IHN0
aWxsIGJlIHJlcXVpcmVkLg0KPiA+ID4gPiA+ID4gSXQgaXMga25vd24gdGhhdCBlaXRoZXIgZGF0
YS1sYW5lcyBvciBjbG9jay1sYW5lcyBpcyBhbiBhcnJheSBvZg0KPiA+ID4gPiA+ID4gcGh5c2lj
YWwgZGF0YSBsYW5lIGluZGV4ZXMuIFBvc2l0aW9uIG9mIGFuIGVudHJ5IGRldGVybWluZXMgdGhl
IGxvZ2ljYWwNCj4gPiA+ID4gPiA+IGxhbmUgbnVtYmVyLCB3aGlsZSB0aGUgdmFsdWUgb2YgYW4g
ZW50cnkgaW5kaWNhdGVzIHBoeXNpY2FsIGxhbmUsIGUuZy4sDQo+ID4gPiA+ID4gPiBmb3IgMS1s
YW5lIE1JUEkgQ1NJLTIgYnVzIHdlIGNvdWxkIGhhdmUgImRhdGEtbGFuZXMgPSA8MT47IiwgYXNz
dW1pbmcNCj4gPiA+ID4gPiA+IHRoZSBjbG9jayBsYW5lIGlzIG9uIGhhcmR3YXJlIGxhbmUgMC4N
Cj4gPiA+ID4gPiA+DQo+ID4gPiA+ID4gPiBBcyBtZW50aW9uZWQgZWFybGllciwgdGhlIE9WMDJB
MTAgc2Vuc29yIHN1cHBvcnRzIG9ubHkgMUMxRCBhbmQgZG9lcyBub3QNCj4gPiA+ID4gPiA+IHN1
cHBvcnQgbGFuZSByZW9yZGVyaW5nLCBzbyBoZXJlIHdlIHNoYWxsIHVzZSAnZGF0YS1sYW5lcyA9
IDwxPicgYXMNCj4gPiA+ID4gPiA+IHRoZXJlIGlzIG9ubHkgYSBjbG9jayBsYW5lIGZvciBPVjAy
QTEwLg0KPiA+ID4gPiA+ID4NCj4gPiA+ID4gPiA+IFJlbWluZGVyOg0KPiA+ID4gPiA+ID4gSWYg
J2RhdGEtbGFuZXMnIHByb3BlcnR5IGlzIG5vdCBwcmVzZW50LCB0aGUgZHJpdmVyIHdvdWxkIGFz
c3VtZQ0KPiA+ID4gPiA+ID4gZm91ci1sYW5lIG9wZXJhdGlvbi4gVGhpcyBtZWFucyBmb3Igb25l
LWxhbmUgb3IgdHdvLWxhbmUgb3BlcmF0aW9uLCB0aGlzDQo+ID4gPiA+ID4gPiBwcm9wZXJ0eSBt
dXN0IGJlIHByZXNlbnQgYW5kIHNldCB0byB0aGUgcmlnaHQgcGh5c2ljYWwgbGFuZSBpbmRleGVz
Lg0KPiA+ID4gPiA+ID4gSWYgdGhlIGhhcmR3YXJlIGRvZXMgbm90IHN1cHBvcnQgbGFuZSByZW9y
ZGVyaW5nLCBtb25vdG9uaWNhbGx5DQo+ID4gPiA+ID4gPiBpbmNyZW1lbnRlZCB2YWx1ZXMgc2hh
bGwgYmUgdXNlZCBmcm9tIDAgb3IgMSBvbndhcmRzLCBkZXBlbmRpbmcgb24NCj4gPiA+ID4gPiA+
IHdoZXRoZXIgb3Igbm90IHRoZXJlIGlzIGFsc28gYSBjbG9jayBsYW5lLg0KPiA+ID4gPiA+DQo+
ID4gPiA+ID4gSG93IGNhbiB0aGUgZHJpdmVyIHVzZSBmb3VyIGxhbmVzLCBjb25zaWRlcmluZyB0
aGUgZGV2aWNlIG9ubHkgc3VwcG9ydHMgYQ0KPiA+ID4gPiA+IHNpbmdsZSBsYW5lPz8NCj4gPiA+
ID4gPg0KPiA+ID4gPg0KPiA+ID4gPiBJIHVuZGVyc3Rvb2QgeW91ciBtZWFuaW5nLg0KPiA+ID4g
PiBJZiB3ZSBvbWl0IHRoZSBwcm9wZXJ0eSAnZGF0YS1sYW5lcycsIHRoZSBzZW5zb3Igc2hvdWxk
IHdvcmsgc3RpbGwuDQo+ID4gPiA+IEJ1dCB0aGVuIHdoYXQncyB0aGUgbWVhbmluZyBvZiB0aGUg
ZXhpc3RlbmNlIG9mICdkYXRhLWxhbmVzJz8NCj4gPiA+ID4gSWYgdGhpcyBwcm9wZXJ0eSAnZGF0
YS1sYW5lcycgaXMgYWx3YXlzIG9wdGlvbmFsLCB0aGVuIHdoeSBkdC1iaW5kaW5ncw0KPiA+ID4g
PiBwcm92aWRlIHRoZSBpbnRlcmZhY2U/DQo+ID4gPiA+DQo+ID4gPiA+IEluIHRoZSBtZWFudGlt
ZSwgaWYgb21pdHRpbmcgJ2RhdGEtbGFuZXMnIGZvciBvbmUgc2Vuc29yKHRyYW5zbWl0dGVyKQ0K
PiA+ID4gPiB0aGF0IGhhcyBvbmx5IG9uZSBwaHlzaWNhbCBkYXRhIGxhbmUsIE1JUEkgcmVjZWl2
ZXIoZS5nLiwgTUlQSSBDU0ktMikNCj4gPiA+ID4gc2hhbGwgZW5hYmxlIGZvdXItbGFuZSBjb25m
aWd1cmF0aW9uLCB3aGljaCBtYXkgaW5jcmVhc2UgY29uc3VtcHRpb24gb2YNCj4gPiA+ID4gYm90
aCBwb3dlciBhbmQgcmVzb3VyY2UgaW4gdGhlIHByb2Nlc3Mgb2YgSUlDIGNvbW11bmljYXRpb24u
DQo+ID4gPg0KPiA+ID4gV291bGRuJ3QgdGhlIHJlY2VpdmVyIHN0aWxsIGhhdmUgdGhlIGRhdGEt
bGFuZXMgcHJvcGVydHkgdW5kZXIgaXRzDQo+ID4gPiBlbmRwb2ludCBub2RlLCB0ZWxsaW5nIGl0
IGhvdyBtYW55IGxhbmVzIGFuZCBpbiB3aGljaCBvcmRlciBzaG91bGQgYmUNCj4gPiA+IHVzZWQ/
DQo+ID4gPg0KPiA+DQo+ID4gVGhlIE1JUEkgcmVjZWl2ZXIoUlgpIHNoYWxsIHVzZQ0KPiA+IHY0
bDJfYXN5bmNfbm90aWZpZXJfYWRkX2Z3bm9kZV9yZW1vdGVfc3ViZGV2KCkgQVBJIHRvIHBhcnNl
IHRoZSBwcm9wZXJ0eQ0KPiA+ICJkYXRhLWxhbmVzIiB1bmRlciBzZW5zb3Igb3V0cHV0IHBvcnQu
DQo+IA0KPiBUaGF0J3Mgbm90IHRydWUuIFRoZSBNSVBJIHJlY2VpdmVyIGRyaXZlciBwYXJzZXMg
aXRzIG93biBwb3J0IG5vZGUNCj4gY29ycmVzcG9uZGluZyB0byB0aGUgc2Vuc29yLiBBbHNvIHF1
b3RpbmcgdGhlIGRvY3VtZW50YXRpb24gWzFdOg0KPiANCj4gIkFuIGVuZHBvaW50IHN1Ym5vZGUg
b2YgYSBkZXZpY2UgY29udGFpbnMgYWxsIHByb3BlcnRpZXMgbmVlZGVkIGZvcg0KPiBfY29uZmln
dXJhdGlvbiBvZiB0aGlzIGRldmljZV8gZm9yIGRhdGEgZXhjaGFuZ2Ugd2l0aCBvdGhlciBkZXZp
Y2UuIEluIG1vc3QNCj4gY2FzZXMgcHJvcGVydGllcyBhdCB0aGUgcGVlciAnZW5kcG9pbnQnIG5v
ZGVzIHdpbGwgYmUgaWRlbnRpY2FsLCBob3dldmVyIHRoZXkNCj4gbWlnaHQgbmVlZCB0byBiZSBk
aWZmZXJlbnQgd2hlbiB0aGVyZSBpcyBhbnkgc2lnbmFsIG1vZGlmaWNhdGlvbnMgb24gdGhlIGJ1
cw0KPiBiZXR3ZWVuIHR3byBkZXZpY2VzLCBlLmcuIHRoZXJlIGFyZSBsb2dpYyBzaWduYWwgaW52
ZXJ0ZXJzIG9uIHRoZSBsaW5lcy4iDQo+IA0KPiBJbiB0aGlzIGNhc2UsIHRoZXJlIGlzIHN1Y2gg
YSBzaWduYWwgbW9kaWZpY2F0aW9uIGlmIHRoZSBzZW5zb3IgaGFzIGENCj4gMS1sYW5lIGJ1cyBh
bmQgdGhlIHJlY2VpdmVyIG1vcmUgbGluZXMsIHNvIHRoZSBkYXRhLWxhbmVzIHByb3BlcnRpZXMN
Cj4gd291bGQgYmUgZGlmZmVyZW50IG9uIGJvdGggc2lkZXMuDQo+IA0KPiBbMV0gaHR0cHM6Ly9l
bGl4aXIuYm9vdGxpbi5jb20vbGludXgvdjUuNy9zb3VyY2UvRG9jdW1lbnRhdGlvbi9kZXZpY2V0
cmVlL2JpbmRpbmdzL21lZGlhL3ZpZGVvLWludGVyZmFjZXMudHh0DQo+IA0KDQpTb3JyeSBmb3Ig
dGhlIG1pc3VuZGVyc3RhbmRpbmcuDQpBZnRlciBkb2luZyBzb21lIGV4cGVyaW1lbnRzIGFib3V0
IHRoZSBkYXRhLWxhbmVzIHByb3BlcnR5IHVuZGVyIHNlbnNvcg0KaTJjIG5vZGUsIHdlIGZvdW5k
IHRoZSBBUEkNCnY0bDJfYXN5bmNfbm90aWZpZXJfYWRkX2Z3bm9kZV9yZW1vdGVfc3ViZGV2KCkg
dGhhdCBNSVBJIHJlY2VpdmVyIGRyaXZlcg0KdXNlZCBpbmRlZWQgcGFyc2VzIHRoZSBkYXRhLWxh
bmVzIHVuZGVyIGl0cyBvd24gcG9ydCBub2RlLg0KDQpTb3JyeSBtYWtlIGEgbWlzdGFrZSBmb3Ig
dGhlIHVzZSBjYXNlIG9mIHNlbnNvciBkYXRhLWxhbmVzIHByZXZpb3VzbHkuDQpOb3cgV2UgbWF5
IGVuY291bnRlciBvbmUgbmV3IHF1ZXN0aW9uIGZvciB0aGlzIHBhdGNoLg0KSW4gcHJhY3RpY2Ug
d2UgaGF2ZW4ndCB1c2VkIHRoZSBkYXRhLWxhbmVzIHVuZGVyIHNlbnNvciBpMmMgbm9kZQ0KYW55
d2hlcmUsIGlmIHNlbnNvciBkcml2ZXIgaXRzZWxmIGRvZXNuJ3QgcGFyc2UgdGhhdC4NCg0KQnV0
IHRoZXJlIGlzIHN0aWxsIG9uZSByZWFzb24gdG8ga2VlcCB0aGUgZXhhY3RseSByaWdodCBkYXRh
LWxhbmVzIGluDQpEVC4gVGhhdCBpcywgdGhlIGRhdGEtbGFuZXMgdW5kZXIgc2Vuc29yIGkyYyBu
b2RlIGNvdWxkIGJlIHVzZWQgYXMgYQ0KcmVmZXJlbmNlIGZvciBNSVBJIHJlY2VpdmVyIGRyaXZl
ci4NCkp1c3QgYXMgVG9tYXN6IHNhaWQsICdUaGUgTUlQSSByZWNlaXZlciBkcml2ZXIgcGFyc2Vz
IGl0cyBvd24gcG9ydCBub2RlDQpjb3JyZXNwb25kaW5nIHRvIHRoZSBzZW5zb3InLg0KDQpTYWth
cmksIFRvbWFzeiwgd2hhdCdzIHlvdXIgb3BpbmlvbnMgYWJvdXQgdGhlIHByZXNlbnQgb2YgZGF0
YS1sYW5lcw0KdW5kZXIgc2Vuc29yIG5vZGUgb3Igbm90Pw0KDQo+IEJlc3QgcmVnYXJkcywNCj4g
VG9tYXN6DQoNCg==

