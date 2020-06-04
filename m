Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 5CFE31EDB23
	for <lists+linux-media@lfdr.de>; Thu,  4 Jun 2020 04:22:17 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726844AbgFDCWP (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 3 Jun 2020 22:22:15 -0400
Received: from Mailgw01.mediatek.com ([1.203.163.78]:53621 "EHLO
        mailgw01.mediatek.com" rhost-flags-OK-FAIL-OK-FAIL) by vger.kernel.org
        with ESMTP id S1726260AbgFDCWP (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Wed, 3 Jun 2020 22:22:15 -0400
X-UUID: 03f9a75a92434386a4f8dbc761a7b6ca-20200604
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
        h=Content-Transfer-Encoding:MIME-Version:Content-Type:References:In-Reply-To:Date:CC:To:From:Subject:Message-ID; bh=E8q9qxxEPk8KKeZxjPDbo/SXRMzqkGo4vmd/SLjLzZw=;
        b=g6hfFBXZnrSZ+EDSS8SZU2RJQkvwqUSQ31YpdYwBfMKupK8ptfPlmvUwBKJfIhGrwXOKIRycLX+l4ps1s6yO8t47WYEe222X3v3o+EAiK2xqoAvaaMHEKM/GvXj1BA8sU+NzvuXCkuxX9XysImQPFkfxt7yZTP0rTl417FjAPbA=;
X-UUID: 03f9a75a92434386a4f8dbc761a7b6ca-20200604
Received: from mtkcas35.mediatek.inc [(172.27.4.253)] by mailgw01.mediatek.com
        (envelope-from <dongchun.zhu@mediatek.com>)
        (mailgw01.mediatek.com ESMTP with TLS)
        with ESMTP id 247294784; Thu, 04 Jun 2020 10:22:08 +0800
Received: from MTKCAS36.mediatek.inc (172.27.4.186) by MTKMBS31N2.mediatek.inc
 (172.27.4.87) with Microsoft SMTP Server (TLS) id 15.0.1497.2; Thu, 4 Jun
 2020 10:22:06 +0800
Received: from [10.17.3.153] (10.17.3.153) by MTKCAS36.mediatek.inc
 (172.27.4.170) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Thu, 4 Jun 2020 10:22:06 +0800
Message-ID: <1591237204.8804.550.camel@mhfsdcap03>
Subject: Re: [V9, 1/2] media: dt-bindings: media: i2c: Document OV02A10
 bindings
From:   Dongchun Zhu <dongchun.zhu@mediatek.com>
To:     Sakari Ailus <sakari.ailus@linux.intel.com>
CC:     Tomasz Figa <tfiga@chromium.org>, Rob Herring <robh@kernel.org>,
        "Linus Walleij" <linus.walleij@linaro.org>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Mark Rutland <mark.rutland@arm.com>,
        Nicolas Boichat <drinkcat@chromium.org>,
        "Matthias Brugger" <matthias.bgg@gmail.com>,
        Cao Bing Bu <bingbu.cao@intel.com>,
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
Date:   Thu, 4 Jun 2020 10:20:04 +0800
In-Reply-To: <20200602095654.GD29325@paasikivi.fi.intel.com>
References: <1590569355.8804.448.camel@mhfsdcap03>
         <CAL_Jsq+sN0SVidTrY0ODXEkzkxYFvG1FTnL0oRQBSKf=ynLdyQ@mail.gmail.com>
         <20200527211628.GT7618@paasikivi.fi.intel.com>
         <1590636882.8804.474.camel@mhfsdcap03>
         <20200528072332.GW7618@paasikivi.fi.intel.com>
         <1590653082.8804.517.camel@mhfsdcap03>
         <CAAFQd5AuHDpQN8xZsWgnAt6m2reAYJbs9nBp0+mBo7_FS81LbQ@mail.gmail.com>
         <1590978816.8804.523.camel@mhfsdcap03>
         <CAAFQd5AY9gejoiwxojvvG0FaVfEAf8gCqOddvo-dxemQWFksVw@mail.gmail.com>
         <1591078501.8804.539.camel@mhfsdcap03>
         <20200602095654.GD29325@paasikivi.fi.intel.com>
Content-Type: text/plain; charset="UTF-8"
X-Mailer: Evolution 3.10.4-0ubuntu2 
MIME-Version: 1.0
X-TM-SNTS-SMTP: FC5061473807FB5FAEA43220556C92A855E1739EDF7A0C65A336E13C0824ECB32000:8
X-MTK:  N
Content-Transfer-Encoding: base64
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

SGkgU2FrYXJpLA0KDQpPbiBUdWUsIDIwMjAtMDYtMDIgYXQgMTI6NTYgKzAzMDAsIFNha2FyaSBB
aWx1cyB3cm90ZToNCj4gSGkgRG9uZ2NodW4sDQo+IA0KPiBPbiBUdWUsIEp1biAwMiwgMjAyMCBh
dCAwMjoxNTowMVBNICswODAwLCBEb25nY2h1biBaaHUgd3JvdGU6DQo+ID4gSGkgVG9tYXN6LCBT
YWthcmksDQo+ID4gDQo+ID4gT24gTW9uLCAyMDIwLTA2LTAxIGF0IDIwOjE4ICswMjAwLCBUb21h
c3ogRmlnYSB3cm90ZToNCj4gPiA+IE9uIE1vbiwgSnVuIDEsIDIwMjAgYXQgNDozNSBBTSBEb25n
Y2h1biBaaHUgPGRvbmdjaHVuLnpodUBtZWRpYXRlay5jb20+IHdyb3RlOg0KPiA+ID4gPg0KPiA+
ID4gPiBIaSBUb21hc3osDQo+ID4gPiA+DQo+ID4gPiA+IE9uIEZyaSwgMjAyMC0wNS0yOSBhdCAx
NTo0MyArMDIwMCwgVG9tYXN6IEZpZ2Egd3JvdGU6DQo+ID4gPiA+ID4gT24gVGh1LCBNYXkgMjgs
IDIwMjAgYXQgMTA6MDYgQU0gRG9uZ2NodW4gWmh1IDxkb25nY2h1bi56aHVAbWVkaWF0ZWsuY29t
PiB3cm90ZToNCj4gPiA+ID4gPiA+DQo+ID4gPiA+ID4gPiBIaSBTYWthcmksDQo+ID4gPiA+ID4g
Pg0KPiA+ID4gPiA+ID4gT24gVGh1LCAyMDIwLTA1LTI4IGF0IDEwOjIzICswMzAwLCBTYWthcmkg
QWlsdXMgd3JvdGU6DQo+ID4gPiA+ID4gPiA+IEhpIERvbmdjaHVuLA0KPiA+ID4gPiA+ID4gPg0K
PiA+ID4gPiA+ID4gPiBPbiBUaHUsIE1heSAyOCwgMjAyMCBhdCAxMTozNDo0MkFNICswODAwLCBE
b25nY2h1biBaaHUgd3JvdGU6DQo+ID4gPiA+ID4gPiA+ID4gSGkgU2FrYXJpLCBSb2IsDQo+ID4g
PiA+ID4gPiA+ID4NCj4gPiA+ID4gPiA+ID4gPiBPbiBUaHUsIDIwMjAtMDUtMjggYXQgMDA6MTYg
KzAzMDAsIFNha2FyaSBBaWx1cyB3cm90ZToNCj4gPiA+ID4gPiA+ID4gPiA+IEhpIFJvYiwgRG9u
Z2NodW4sDQo+ID4gPiA+ID4gPiA+ID4gPg0KPiA+ID4gPiA+ID4gPiA+ID4gT24gV2VkLCBNYXkg
MjcsIDIwMjAgYXQgMDk6Mjc6MjJBTSAtMDYwMCwgUm9iIEhlcnJpbmcgd3JvdGU6DQo+ID4gPiA+
ID4gPiA+ID4gPiA+ID4gPiA+ICsgICAgcHJvcGVydGllczoNCj4gPiA+ID4gPiA+ID4gPiA+ID4g
PiA+ID4gKyAgICAgIGVuZHBvaW50Og0KPiA+ID4gPiA+ID4gPiA+ID4gPiA+ID4gPiArICAgICAg
ICB0eXBlOiBvYmplY3QNCj4gPiA+ID4gPiA+ID4gPiA+ID4gPiA+ID4gKyAgICAgICAgYWRkaXRp
b25hbFByb3BlcnRpZXM6IGZhbHNlDQo+ID4gPiA+ID4gPiA+ID4gPiA+ID4gPiA+ICsNCj4gPiA+
ID4gPiA+ID4gPiA+ID4gPiA+ID4gKyAgICAgICAgcHJvcGVydGllczoNCj4gPiA+ID4gPiA+ID4g
PiA+ID4gPg0KPiA+ID4gPiA+ID4gPiA+ID4gPiA+IEFjdHVhbGx5IEkgd29uZGVyIHdoZXRoZXIg
d2UgbmVlZCB0byBkZWNsYXJlICdjbG9jay1sYW5lcycgaGVyZT8NCj4gPiA+ID4gPiA+ID4gPiA+
ID4NCj4gPiA+ID4gPiA+ID4gPiA+ID4gWWVzLCBpZiB5b3UgYXJlIHVzaW5nIGl0Lg0KPiA+ID4g
PiA+ID4gPiA+ID4NCj4gPiA+ID4gPiA+ID4gPiA+IERvbmdjaHVuLCBjYW4geW91IGNvbmZpcm0g
dGhlIGNoaXAgaGFzIGEgc2luZ2xlIGRhdGEgYW5kIGEgc2luZ2xlIGNsb2NrDQo+ID4gPiA+ID4g
PiA+ID4gPiBsYW5lIGFuZCB0aGF0IGl0IGRvZXMgbm90IHN1cHBvcnQgbGFuZSByZW9yZGVyaW5n
Pw0KPiA+ID4gPiA+ID4gPiA+ID4NCj4gPiA+ID4gPiA+ID4gPg0KPiA+ID4gPiA+ID4gPiA+IEZy
b20gdGhlIGRhdGFzaGVldCwgJ01JUEkgaW5zaWRlIHRoZSBPVjAyQTEwIHByb3ZpZGVzIG9uZSBz
aW5nbGUNCj4gPiA+ID4gPiA+ID4gPiB1bmktZGlyZWN0aW9uYWwgY2xvY2sgbGFuZSBhbmQgb25l
IGJpLWRpcmVjdGlvbmFsIGRhdGEgbGFuZSBzb2x1dGlvbiBmb3INCj4gPiA+ID4gPiA+ID4gPiBj
b21tdW5pY2F0aW9uIGxpbmtzIGJldHdlZW4gY29tcG9uZW50cyBpbnNpZGUgYSBtb2JpbGUgZGV2
aWNlLg0KPiA+ID4gPiA+ID4gPiA+IFRoZSBkYXRhIGxhbmUgaGFzIGZ1bGwgc3VwcG9ydCBmb3Ig
SFModW5pLWRpcmVjdGlvbmFsKSBhbmQNCj4gPiA+ID4gPiA+ID4gPiBMUChiaS1kaXJlY3Rpb25h
bCkgZGF0YSB0cmFuc2ZlciBtb2RlLicNCj4gPiA+ID4gPiA+ID4gPg0KPiA+ID4gPiA+ID4gPiA+
IFRoZSBzZW5zb3IgZG9lc24ndCBzdXBwb3J0IGxhbmUgcmVvcmRlcmluZywgc28gJ2Nsb2NrLWxh
bmVzJyBwcm9wZXJ0eQ0KPiA+ID4gPiA+ID4gPiA+IHdvdWxkIG5vdCBiZSBhZGRlZCBpbiBuZXh0
IHJlbGVhc2UuDQo+ID4gPiA+ID4gPiA+ID4NCj4gPiA+ID4gPiA+ID4gPiA+IFNvIGlmIHRoZXJl
J3Mgbm90aGluZyB0byBjb252ZXkgdG8gdGhlIGRyaXZlciwgYWxzbyB0aGUgZGF0YS1sYW5lcyBz
aG91bGQNCj4gPiA+ID4gPiA+ID4gPiA+IGJlIHJlbW92ZWQgSU1PLg0KPiA+ID4gPiA+ID4gPiA+
ID4NCj4gPiA+ID4gPiA+ID4gPg0KPiA+ID4gPiA+ID4gPiA+IEhvd2V2ZXIsICdkYXRhLWxhbmVz
JyBwcm9wZXJ0eSBtYXkgc3RpbGwgYmUgcmVxdWlyZWQuDQo+ID4gPiA+ID4gPiA+ID4gSXQgaXMg
a25vd24gdGhhdCBlaXRoZXIgZGF0YS1sYW5lcyBvciBjbG9jay1sYW5lcyBpcyBhbiBhcnJheSBv
Zg0KPiA+ID4gPiA+ID4gPiA+IHBoeXNpY2FsIGRhdGEgbGFuZSBpbmRleGVzLiBQb3NpdGlvbiBv
ZiBhbiBlbnRyeSBkZXRlcm1pbmVzIHRoZSBsb2dpY2FsDQo+ID4gPiA+ID4gPiA+ID4gbGFuZSBu
dW1iZXIsIHdoaWxlIHRoZSB2YWx1ZSBvZiBhbiBlbnRyeSBpbmRpY2F0ZXMgcGh5c2ljYWwgbGFu
ZSwgZS5nLiwNCj4gPiA+ID4gPiA+ID4gPiBmb3IgMS1sYW5lIE1JUEkgQ1NJLTIgYnVzIHdlIGNv
dWxkIGhhdmUgImRhdGEtbGFuZXMgPSA8MT47IiwgYXNzdW1pbmcNCj4gPiA+ID4gPiA+ID4gPiB0
aGUgY2xvY2sgbGFuZSBpcyBvbiBoYXJkd2FyZSBsYW5lIDAuDQo+ID4gPiA+ID4gPiA+ID4NCj4g
PiA+ID4gPiA+ID4gPiBBcyBtZW50aW9uZWQgZWFybGllciwgdGhlIE9WMDJBMTAgc2Vuc29yIHN1
cHBvcnRzIG9ubHkgMUMxRCBhbmQgZG9lcyBub3QNCj4gPiA+ID4gPiA+ID4gPiBzdXBwb3J0IGxh
bmUgcmVvcmRlcmluZywgc28gaGVyZSB3ZSBzaGFsbCB1c2UgJ2RhdGEtbGFuZXMgPSA8MT4nIGFz
DQo+ID4gPiA+ID4gPiA+ID4gdGhlcmUgaXMgb25seSBhIGNsb2NrIGxhbmUgZm9yIE9WMDJBMTAu
DQo+ID4gPiA+ID4gPiA+ID4NCj4gPiA+ID4gPiA+ID4gPiBSZW1pbmRlcjoNCj4gPiA+ID4gPiA+
ID4gPiBJZiAnZGF0YS1sYW5lcycgcHJvcGVydHkgaXMgbm90IHByZXNlbnQsIHRoZSBkcml2ZXIg
d291bGQgYXNzdW1lDQo+ID4gPiA+ID4gPiA+ID4gZm91ci1sYW5lIG9wZXJhdGlvbi4gVGhpcyBt
ZWFucyBmb3Igb25lLWxhbmUgb3IgdHdvLWxhbmUgb3BlcmF0aW9uLCB0aGlzDQo+ID4gPiA+ID4g
PiA+ID4gcHJvcGVydHkgbXVzdCBiZSBwcmVzZW50IGFuZCBzZXQgdG8gdGhlIHJpZ2h0IHBoeXNp
Y2FsIGxhbmUgaW5kZXhlcy4NCj4gPiA+ID4gPiA+ID4gPiBJZiB0aGUgaGFyZHdhcmUgZG9lcyBu
b3Qgc3VwcG9ydCBsYW5lIHJlb3JkZXJpbmcsIG1vbm90b25pY2FsbHkNCj4gPiA+ID4gPiA+ID4g
PiBpbmNyZW1lbnRlZCB2YWx1ZXMgc2hhbGwgYmUgdXNlZCBmcm9tIDAgb3IgMSBvbndhcmRzLCBk
ZXBlbmRpbmcgb24NCj4gPiA+ID4gPiA+ID4gPiB3aGV0aGVyIG9yIG5vdCB0aGVyZSBpcyBhbHNv
IGEgY2xvY2sgbGFuZS4NCj4gPiA+ID4gPiA+ID4NCj4gPiA+ID4gPiA+ID4gSG93IGNhbiB0aGUg
ZHJpdmVyIHVzZSBmb3VyIGxhbmVzLCBjb25zaWRlcmluZyB0aGUgZGV2aWNlIG9ubHkgc3VwcG9y
dHMgYQ0KPiA+ID4gPiA+ID4gPiBzaW5nbGUgbGFuZT8/DQo+ID4gPiA+ID4gPiA+DQo+ID4gPiA+
ID4gPg0KPiA+ID4gPiA+ID4gSSB1bmRlcnN0b29kIHlvdXIgbWVhbmluZy4NCj4gPiA+ID4gPiA+
IElmIHdlIG9taXQgdGhlIHByb3BlcnR5ICdkYXRhLWxhbmVzJywgdGhlIHNlbnNvciBzaG91bGQg
d29yayBzdGlsbC4NCj4gPiA+ID4gPiA+IEJ1dCB0aGVuIHdoYXQncyB0aGUgbWVhbmluZyBvZiB0
aGUgZXhpc3RlbmNlIG9mICdkYXRhLWxhbmVzJz8NCj4gPiA+ID4gPiA+IElmIHRoaXMgcHJvcGVy
dHkgJ2RhdGEtbGFuZXMnIGlzIGFsd2F5cyBvcHRpb25hbCwgdGhlbiB3aHkgZHQtYmluZGluZ3MN
Cj4gPiA+ID4gPiA+IHByb3ZpZGUgdGhlIGludGVyZmFjZT8NCj4gPiA+ID4gPiA+DQo+ID4gPiA+
ID4gPiBJbiB0aGUgbWVhbnRpbWUsIGlmIG9taXR0aW5nICdkYXRhLWxhbmVzJyBmb3Igb25lIHNl
bnNvcih0cmFuc21pdHRlcikNCj4gPiA+ID4gPiA+IHRoYXQgaGFzIG9ubHkgb25lIHBoeXNpY2Fs
IGRhdGEgbGFuZSwgTUlQSSByZWNlaXZlcihlLmcuLCBNSVBJIENTSS0yKQ0KPiA+ID4gPiA+ID4g
c2hhbGwgZW5hYmxlIGZvdXItbGFuZSBjb25maWd1cmF0aW9uLCB3aGljaCBtYXkgaW5jcmVhc2Ug
Y29uc3VtcHRpb24gb2YNCj4gPiA+ID4gPiA+IGJvdGggcG93ZXIgYW5kIHJlc291cmNlIGluIHRo
ZSBwcm9jZXNzIG9mIElJQyBjb21tdW5pY2F0aW9uLg0KPiA+ID4gPiA+DQo+ID4gPiA+ID4gV291
bGRuJ3QgdGhlIHJlY2VpdmVyIHN0aWxsIGhhdmUgdGhlIGRhdGEtbGFuZXMgcHJvcGVydHkgdW5k
ZXIgaXRzDQo+ID4gPiA+ID4gZW5kcG9pbnQgbm9kZSwgdGVsbGluZyBpdCBob3cgbWFueSBsYW5l
cyBhbmQgaW4gd2hpY2ggb3JkZXIgc2hvdWxkIGJlDQo+ID4gPiA+ID4gdXNlZD8NCj4gPiA+ID4g
Pg0KPiA+ID4gPg0KPiA+ID4gPiBUaGUgTUlQSSByZWNlaXZlcihSWCkgc2hhbGwgdXNlDQo+ID4g
PiA+IHY0bDJfYXN5bmNfbm90aWZpZXJfYWRkX2Z3bm9kZV9yZW1vdGVfc3ViZGV2KCkgQVBJIHRv
IHBhcnNlIHRoZSBwcm9wZXJ0eQ0KPiA+ID4gPiAiZGF0YS1sYW5lcyIgdW5kZXIgc2Vuc29yIG91
dHB1dCBwb3J0Lg0KPiA+ID4gDQo+ID4gPiBUaGF0J3Mgbm90IHRydWUuIFRoZSBNSVBJIHJlY2Vp
dmVyIGRyaXZlciBwYXJzZXMgaXRzIG93biBwb3J0IG5vZGUNCj4gPiA+IGNvcnJlc3BvbmRpbmcg
dG8gdGhlIHNlbnNvci4gQWxzbyBxdW90aW5nIHRoZSBkb2N1bWVudGF0aW9uIFsxXToNCj4gPiA+
IA0KPiA+ID4gIkFuIGVuZHBvaW50IHN1Ym5vZGUgb2YgYSBkZXZpY2UgY29udGFpbnMgYWxsIHBy
b3BlcnRpZXMgbmVlZGVkIGZvcg0KPiA+ID4gX2NvbmZpZ3VyYXRpb24gb2YgdGhpcyBkZXZpY2Vf
IGZvciBkYXRhIGV4Y2hhbmdlIHdpdGggb3RoZXIgZGV2aWNlLiBJbiBtb3N0DQo+ID4gPiBjYXNl
cyBwcm9wZXJ0aWVzIGF0IHRoZSBwZWVyICdlbmRwb2ludCcgbm9kZXMgd2lsbCBiZSBpZGVudGlj
YWwsIGhvd2V2ZXIgdGhleQ0KPiA+ID4gbWlnaHQgbmVlZCB0byBiZSBkaWZmZXJlbnQgd2hlbiB0
aGVyZSBpcyBhbnkgc2lnbmFsIG1vZGlmaWNhdGlvbnMgb24gdGhlIGJ1cw0KPiA+ID4gYmV0d2Vl
biB0d28gZGV2aWNlcywgZS5nLiB0aGVyZSBhcmUgbG9naWMgc2lnbmFsIGludmVydGVycyBvbiB0
aGUgbGluZXMuIg0KPiA+ID4gDQo+ID4gPiBJbiB0aGlzIGNhc2UsIHRoZXJlIGlzIHN1Y2ggYSBz
aWduYWwgbW9kaWZpY2F0aW9uIGlmIHRoZSBzZW5zb3IgaGFzIGENCj4gPiA+IDEtbGFuZSBidXMg
YW5kIHRoZSByZWNlaXZlciBtb3JlIGxpbmVzLCBzbyB0aGUgZGF0YS1sYW5lcyBwcm9wZXJ0aWVz
DQo+ID4gPiB3b3VsZCBiZSBkaWZmZXJlbnQgb24gYm90aCBzaWRlcy4NCj4gPiA+IA0KPiA+ID4g
WzFdIGh0dHBzOi8vZWxpeGlyLmJvb3RsaW4uY29tL2xpbnV4L3Y1Ljcvc291cmNlL0RvY3VtZW50
YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy9tZWRpYS92aWRlby1pbnRlcmZhY2VzLnR4dA0KPiA+
ID4gDQo+ID4gDQo+ID4gU29ycnkgZm9yIHRoZSBtaXN1bmRlcnN0YW5kaW5nLg0KPiA+IEFmdGVy
IGRvaW5nIHNvbWUgZXhwZXJpbWVudHMgYWJvdXQgdGhlIGRhdGEtbGFuZXMgcHJvcGVydHkgdW5k
ZXIgc2Vuc29yDQo+ID4gaTJjIG5vZGUsIHdlIGZvdW5kIHRoZSBBUEkNCj4gPiB2NGwyX2FzeW5j
X25vdGlmaWVyX2FkZF9md25vZGVfcmVtb3RlX3N1YmRldigpIHRoYXQgTUlQSSByZWNlaXZlciBk
cml2ZXINCj4gPiB1c2VkIGluZGVlZCBwYXJzZXMgdGhlIGRhdGEtbGFuZXMgdW5kZXIgaXRzIG93
biBwb3J0IG5vZGUuDQo+ID4gDQo+ID4gU29ycnkgbWFrZSBhIG1pc3Rha2UgZm9yIHRoZSB1c2Ug
Y2FzZSBvZiBzZW5zb3IgZGF0YS1sYW5lcyBwcmV2aW91c2x5Lg0KPiA+IE5vdyBXZSBtYXkgZW5j
b3VudGVyIG9uZSBuZXcgcXVlc3Rpb24gZm9yIHRoaXMgcGF0Y2guDQo+ID4gSW4gcHJhY3RpY2Ug
d2UgaGF2ZW4ndCB1c2VkIHRoZSBkYXRhLWxhbmVzIHVuZGVyIHNlbnNvciBpMmMgbm9kZQ0KPiA+
IGFueXdoZXJlLCBpZiBzZW5zb3IgZHJpdmVyIGl0c2VsZiBkb2Vzbid0IHBhcnNlIHRoYXQuDQo+
ID4gDQo+ID4gQnV0IHRoZXJlIGlzIHN0aWxsIG9uZSByZWFzb24gdG8ga2VlcCB0aGUgZXhhY3Rs
eSByaWdodCBkYXRhLWxhbmVzIGluDQo+ID4gRFQuIFRoYXQgaXMsIHRoZSBkYXRhLWxhbmVzIHVu
ZGVyIHNlbnNvciBpMmMgbm9kZSBjb3VsZCBiZSB1c2VkIGFzIGENCj4gPiByZWZlcmVuY2UgZm9y
IE1JUEkgcmVjZWl2ZXIgZHJpdmVyLg0KPiA+IEp1c3QgYXMgVG9tYXN6IHNhaWQsICdUaGUgTUlQ
SSByZWNlaXZlciBkcml2ZXIgcGFyc2VzIGl0cyBvd24gcG9ydCBub2RlDQo+ID4gY29ycmVzcG9u
ZGluZyB0byB0aGUgc2Vuc29yJy4NCj4gPiANCj4gPiBTYWthcmksIFRvbWFzeiwgd2hhdCdzIHlv
dXIgb3BpbmlvbnMgYWJvdXQgdGhlIHByZXNlbnQgb2YgZGF0YS1sYW5lcw0KPiA+IHVuZGVyIHNl
bnNvciBub2RlIG9yIG5vdD8NCj4gDQo+IFRoZSByZWNlaXZlciBkcml2ZXIgZG9lc24ndCBwYXJz
ZSB0aGUgcHJvcGVydGllcyBpbiB0aGUgc2Vuc29yDQo+ICh0cmFuc21pdHRlcikgZGV2aWNlJ3Mg
ZW5kcG9pbnQuIElmIHRoYXQgcHJvcGVydHkgcHJvdmlkZXMgbm8gaW5mb3JtYXRpb24NCj4gdG8g
dGhlIHJlY2VpdmVyLCBhcyBpcyB0aGUgY2FzZSBoZXJlLCBpdCBzaG91bGQgYmUgb21pdHRlZC4N
Cj4gDQoNClVuZGVyc3Rvb2QuDQpGaXhlZCBpbiBuZXh0IHJlbGVhc2UuDQoNCg==

