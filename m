Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 9A1C11E9BBF
	for <lists+linux-media@lfdr.de>; Mon,  1 Jun 2020 04:35:48 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727013AbgFACfr (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sun, 31 May 2020 22:35:47 -0400
Received: from mailgw02.mediatek.com ([1.203.163.81]:31248 "EHLO
        mailgw02.mediatek.com" rhost-flags-OK-FAIL-OK-FAIL) by vger.kernel.org
        with ESMTP id S1726218AbgFACfq (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Sun, 31 May 2020 22:35:46 -0400
X-UUID: e5aecf64bacd48bca0677d00994bc663-20200601
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
        h=Content-Transfer-Encoding:MIME-Version:Content-Type:References:In-Reply-To:Date:CC:To:From:Subject:Message-ID; bh=8KXVcKiNS9g9+0ZRyD+sPi3/ylxB1CS4SKdXzmdFHCQ=;
        b=Chbdik9xjEftINHP/AKnbEcyhMCsgtuzeLOxHkTUf1m/HiNSOFMb7Xa6QIOA/3VisYbFTvpQF+DUXtyEk7ifphltHkmEB3JA4IjacW4XB6b68ge7o/w2T3BI0z+ps5PIuw6KhMThtMOmWavHNI/LlgLDRTOkXM/4IzMv5DekTzg=;
X-UUID: e5aecf64bacd48bca0677d00994bc663-20200601
Received: from mtkcas34.mediatek.inc [(172.27.4.253)] by mailgw02.mediatek.com
        (envelope-from <dongchun.zhu@mediatek.com>)
        (mailgw01.mediatek.com ESMTP with TLS)
        with ESMTP id 998980182; Mon, 01 Jun 2020 10:35:38 +0800
Received: from MTKCAS32.mediatek.inc (172.27.4.184) by MTKMBS31N2.mediatek.inc
 (172.27.4.87) with Microsoft SMTP Server (TLS) id 15.0.1497.2; Mon, 1 Jun
 2020 10:35:32 +0800
Received: from [10.17.3.153] (10.17.3.153) by MTKCAS32.mediatek.inc
 (172.27.4.170) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Mon, 1 Jun 2020 10:35:31 +0800
Message-ID: <1590978816.8804.523.camel@mhfsdcap03>
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
        <shengnan.wang@mediatek.com>, <dongchun.zhu@mediatek.com>
Date:   Mon, 1 Jun 2020 10:33:36 +0800
In-Reply-To: <CAAFQd5AuHDpQN8xZsWgnAt6m2reAYJbs9nBp0+mBo7_FS81LbQ@mail.gmail.com>
References: <20200523084103.31276-1-dongchun.zhu@mediatek.com>
         <20200523084103.31276-2-dongchun.zhu@mediatek.com>
         <20200526182847.GA92449@bogus> <1590569355.8804.448.camel@mhfsdcap03>
         <CAL_Jsq+sN0SVidTrY0ODXEkzkxYFvG1FTnL0oRQBSKf=ynLdyQ@mail.gmail.com>
         <20200527211628.GT7618@paasikivi.fi.intel.com>
         <1590636882.8804.474.camel@mhfsdcap03>
         <20200528072332.GW7618@paasikivi.fi.intel.com>
         <1590653082.8804.517.camel@mhfsdcap03>
         <CAAFQd5AuHDpQN8xZsWgnAt6m2reAYJbs9nBp0+mBo7_FS81LbQ@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"
X-Mailer: Evolution 3.10.4-0ubuntu2 
MIME-Version: 1.0
X-TM-SNTS-SMTP: DCC16DA201AA794175D589CDB204CA0D2D14521CE435DCDA57662523486617452000:8
X-MTK:  N
Content-Transfer-Encoding: base64
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

SGkgVG9tYXN6LA0KDQpPbiBGcmksIDIwMjAtMDUtMjkgYXQgMTU6NDMgKzAyMDAsIFRvbWFzeiBG
aWdhIHdyb3RlOg0KPiBPbiBUaHUsIE1heSAyOCwgMjAyMCBhdCAxMDowNiBBTSBEb25nY2h1biBa
aHUgPGRvbmdjaHVuLnpodUBtZWRpYXRlay5jb20+IHdyb3RlOg0KPiA+DQo+ID4gSGkgU2FrYXJp
LA0KPiA+DQo+ID4gT24gVGh1LCAyMDIwLTA1LTI4IGF0IDEwOjIzICswMzAwLCBTYWthcmkgQWls
dXMgd3JvdGU6DQo+ID4gPiBIaSBEb25nY2h1biwNCj4gPiA+DQo+ID4gPiBPbiBUaHUsIE1heSAy
OCwgMjAyMCBhdCAxMTozNDo0MkFNICswODAwLCBEb25nY2h1biBaaHUgd3JvdGU6DQo+ID4gPiA+
IEhpIFNha2FyaSwgUm9iLA0KPiA+ID4gPg0KPiA+ID4gPiBPbiBUaHUsIDIwMjAtMDUtMjggYXQg
MDA6MTYgKzAzMDAsIFNha2FyaSBBaWx1cyB3cm90ZToNCj4gPiA+ID4gPiBIaSBSb2IsIERvbmdj
aHVuLA0KPiA+ID4gPiA+DQo+ID4gPiA+ID4gT24gV2VkLCBNYXkgMjcsIDIwMjAgYXQgMDk6Mjc6
MjJBTSAtMDYwMCwgUm9iIEhlcnJpbmcgd3JvdGU6DQo+ID4gPiA+ID4gPiA+ID4gPiArICAgIHBy
b3BlcnRpZXM6DQo+ID4gPiA+ID4gPiA+ID4gPiArICAgICAgZW5kcG9pbnQ6DQo+ID4gPiA+ID4g
PiA+ID4gPiArICAgICAgICB0eXBlOiBvYmplY3QNCj4gPiA+ID4gPiA+ID4gPiA+ICsgICAgICAg
IGFkZGl0aW9uYWxQcm9wZXJ0aWVzOiBmYWxzZQ0KPiA+ID4gPiA+ID4gPiA+ID4gKw0KPiA+ID4g
PiA+ID4gPiA+ID4gKyAgICAgICAgcHJvcGVydGllczoNCj4gPiA+ID4gPiA+ID4NCj4gPiA+ID4g
PiA+ID4gQWN0dWFsbHkgSSB3b25kZXIgd2hldGhlciB3ZSBuZWVkIHRvIGRlY2xhcmUgJ2Nsb2Nr
LWxhbmVzJyBoZXJlPw0KPiA+ID4gPiA+ID4NCj4gPiA+ID4gPiA+IFllcywgaWYgeW91IGFyZSB1
c2luZyBpdC4NCj4gPiA+ID4gPg0KPiA+ID4gPiA+IERvbmdjaHVuLCBjYW4geW91IGNvbmZpcm0g
dGhlIGNoaXAgaGFzIGEgc2luZ2xlIGRhdGEgYW5kIGEgc2luZ2xlIGNsb2NrDQo+ID4gPiA+ID4g
bGFuZSBhbmQgdGhhdCBpdCBkb2VzIG5vdCBzdXBwb3J0IGxhbmUgcmVvcmRlcmluZz8NCj4gPiA+
ID4gPg0KPiA+ID4gPg0KPiA+ID4gPiBGcm9tIHRoZSBkYXRhc2hlZXQsICdNSVBJIGluc2lkZSB0
aGUgT1YwMkExMCBwcm92aWRlcyBvbmUgc2luZ2xlDQo+ID4gPiA+IHVuaS1kaXJlY3Rpb25hbCBj
bG9jayBsYW5lIGFuZCBvbmUgYmktZGlyZWN0aW9uYWwgZGF0YSBsYW5lIHNvbHV0aW9uIGZvcg0K
PiA+ID4gPiBjb21tdW5pY2F0aW9uIGxpbmtzIGJldHdlZW4gY29tcG9uZW50cyBpbnNpZGUgYSBt
b2JpbGUgZGV2aWNlLg0KPiA+ID4gPiBUaGUgZGF0YSBsYW5lIGhhcyBmdWxsIHN1cHBvcnQgZm9y
IEhTKHVuaS1kaXJlY3Rpb25hbCkgYW5kDQo+ID4gPiA+IExQKGJpLWRpcmVjdGlvbmFsKSBkYXRh
IHRyYW5zZmVyIG1vZGUuJw0KPiA+ID4gPg0KPiA+ID4gPiBUaGUgc2Vuc29yIGRvZXNuJ3Qgc3Vw
cG9ydCBsYW5lIHJlb3JkZXJpbmcsIHNvICdjbG9jay1sYW5lcycgcHJvcGVydHkNCj4gPiA+ID4g
d291bGQgbm90IGJlIGFkZGVkIGluIG5leHQgcmVsZWFzZS4NCj4gPiA+ID4NCj4gPiA+ID4gPiBT
byBpZiB0aGVyZSdzIG5vdGhpbmcgdG8gY29udmV5IHRvIHRoZSBkcml2ZXIsIGFsc28gdGhlIGRh
dGEtbGFuZXMgc2hvdWxkDQo+ID4gPiA+ID4gYmUgcmVtb3ZlZCBJTU8uDQo+ID4gPiA+ID4NCj4g
PiA+ID4NCj4gPiA+ID4gSG93ZXZlciwgJ2RhdGEtbGFuZXMnIHByb3BlcnR5IG1heSBzdGlsbCBi
ZSByZXF1aXJlZC4NCj4gPiA+ID4gSXQgaXMga25vd24gdGhhdCBlaXRoZXIgZGF0YS1sYW5lcyBv
ciBjbG9jay1sYW5lcyBpcyBhbiBhcnJheSBvZg0KPiA+ID4gPiBwaHlzaWNhbCBkYXRhIGxhbmUg
aW5kZXhlcy4gUG9zaXRpb24gb2YgYW4gZW50cnkgZGV0ZXJtaW5lcyB0aGUgbG9naWNhbA0KPiA+
ID4gPiBsYW5lIG51bWJlciwgd2hpbGUgdGhlIHZhbHVlIG9mIGFuIGVudHJ5IGluZGljYXRlcyBw
aHlzaWNhbCBsYW5lLCBlLmcuLA0KPiA+ID4gPiBmb3IgMS1sYW5lIE1JUEkgQ1NJLTIgYnVzIHdl
IGNvdWxkIGhhdmUgImRhdGEtbGFuZXMgPSA8MT47IiwgYXNzdW1pbmcNCj4gPiA+ID4gdGhlIGNs
b2NrIGxhbmUgaXMgb24gaGFyZHdhcmUgbGFuZSAwLg0KPiA+ID4gPg0KPiA+ID4gPiBBcyBtZW50
aW9uZWQgZWFybGllciwgdGhlIE9WMDJBMTAgc2Vuc29yIHN1cHBvcnRzIG9ubHkgMUMxRCBhbmQg
ZG9lcyBub3QNCj4gPiA+ID4gc3VwcG9ydCBsYW5lIHJlb3JkZXJpbmcsIHNvIGhlcmUgd2Ugc2hh
bGwgdXNlICdkYXRhLWxhbmVzID0gPDE+JyBhcw0KPiA+ID4gPiB0aGVyZSBpcyBvbmx5IGEgY2xv
Y2sgbGFuZSBmb3IgT1YwMkExMC4NCj4gPiA+ID4NCj4gPiA+ID4gUmVtaW5kZXI6DQo+ID4gPiA+
IElmICdkYXRhLWxhbmVzJyBwcm9wZXJ0eSBpcyBub3QgcHJlc2VudCwgdGhlIGRyaXZlciB3b3Vs
ZCBhc3N1bWUNCj4gPiA+ID4gZm91ci1sYW5lIG9wZXJhdGlvbi4gVGhpcyBtZWFucyBmb3Igb25l
LWxhbmUgb3IgdHdvLWxhbmUgb3BlcmF0aW9uLCB0aGlzDQo+ID4gPiA+IHByb3BlcnR5IG11c3Qg
YmUgcHJlc2VudCBhbmQgc2V0IHRvIHRoZSByaWdodCBwaHlzaWNhbCBsYW5lIGluZGV4ZXMuDQo+
ID4gPiA+IElmIHRoZSBoYXJkd2FyZSBkb2VzIG5vdCBzdXBwb3J0IGxhbmUgcmVvcmRlcmluZywg
bW9ub3RvbmljYWxseQ0KPiA+ID4gPiBpbmNyZW1lbnRlZCB2YWx1ZXMgc2hhbGwgYmUgdXNlZCBm
cm9tIDAgb3IgMSBvbndhcmRzLCBkZXBlbmRpbmcgb24NCj4gPiA+ID4gd2hldGhlciBvciBub3Qg
dGhlcmUgaXMgYWxzbyBhIGNsb2NrIGxhbmUuDQo+ID4gPg0KPiA+ID4gSG93IGNhbiB0aGUgZHJp
dmVyIHVzZSBmb3VyIGxhbmVzLCBjb25zaWRlcmluZyB0aGUgZGV2aWNlIG9ubHkgc3VwcG9ydHMg
YQ0KPiA+ID4gc2luZ2xlIGxhbmU/Pw0KPiA+ID4NCj4gPg0KPiA+IEkgdW5kZXJzdG9vZCB5b3Vy
IG1lYW5pbmcuDQo+ID4gSWYgd2Ugb21pdCB0aGUgcHJvcGVydHkgJ2RhdGEtbGFuZXMnLCB0aGUg
c2Vuc29yIHNob3VsZCB3b3JrIHN0aWxsLg0KPiA+IEJ1dCB0aGVuIHdoYXQncyB0aGUgbWVhbmlu
ZyBvZiB0aGUgZXhpc3RlbmNlIG9mICdkYXRhLWxhbmVzJz8NCj4gPiBJZiB0aGlzIHByb3BlcnR5
ICdkYXRhLWxhbmVzJyBpcyBhbHdheXMgb3B0aW9uYWwsIHRoZW4gd2h5IGR0LWJpbmRpbmdzDQo+
ID4gcHJvdmlkZSB0aGUgaW50ZXJmYWNlPw0KPiA+DQo+ID4gSW4gdGhlIG1lYW50aW1lLCBpZiBv
bWl0dGluZyAnZGF0YS1sYW5lcycgZm9yIG9uZSBzZW5zb3IodHJhbnNtaXR0ZXIpDQo+ID4gdGhh
dCBoYXMgb25seSBvbmUgcGh5c2ljYWwgZGF0YSBsYW5lLCBNSVBJIHJlY2VpdmVyKGUuZy4sIE1J
UEkgQ1NJLTIpDQo+ID4gc2hhbGwgZW5hYmxlIGZvdXItbGFuZSBjb25maWd1cmF0aW9uLCB3aGlj
aCBtYXkgaW5jcmVhc2UgY29uc3VtcHRpb24gb2YNCj4gPiBib3RoIHBvd2VyIGFuZCByZXNvdXJj
ZSBpbiB0aGUgcHJvY2VzcyBvZiBJSUMgY29tbXVuaWNhdGlvbi4NCj4gDQo+IFdvdWxkbid0IHRo
ZSByZWNlaXZlciBzdGlsbCBoYXZlIHRoZSBkYXRhLWxhbmVzIHByb3BlcnR5IHVuZGVyIGl0cw0K
PiBlbmRwb2ludCBub2RlLCB0ZWxsaW5nIGl0IGhvdyBtYW55IGxhbmVzIGFuZCBpbiB3aGljaCBv
cmRlciBzaG91bGQgYmUNCj4gdXNlZD8NCj4gDQoNClRoZSBNSVBJIHJlY2VpdmVyKFJYKSBzaGFs
bCB1c2UNCnY0bDJfYXN5bmNfbm90aWZpZXJfYWRkX2Z3bm9kZV9yZW1vdGVfc3ViZGV2KCkgQVBJ
IHRvIHBhcnNlIHRoZSBwcm9wZXJ0eQ0KImRhdGEtbGFuZXMiIHVuZGVyIHNlbnNvciBvdXRwdXQg
cG9ydC4NCg0KPiBCZXN0IHJlZ2FyZHMsDQo+IFRvbWFzeg0KDQo=

