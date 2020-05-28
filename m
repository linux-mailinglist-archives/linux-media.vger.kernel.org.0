Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 729641E5719
	for <lists+linux-media@lfdr.de>; Thu, 28 May 2020 07:56:41 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727088AbgE1F4k (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 28 May 2020 01:56:40 -0400
Received: from mailgw02.mediatek.com ([1.203.163.81]:1141 "EHLO
        mailgw02.mediatek.com" rhost-flags-OK-FAIL-OK-FAIL) by vger.kernel.org
        with ESMTP id S1725789AbgE1F4k (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 28 May 2020 01:56:40 -0400
X-UUID: b040d94b729b4d89974c3bebf92758f6-20200528
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
        h=Content-Transfer-Encoding:MIME-Version:Content-Type:References:In-Reply-To:Date:CC:To:From:Subject:Message-ID; bh=GKJ7cZiMqfb2VfBlip933OA74rr18gz1+qPKGEU9fns=;
        b=BfSBRQ1z1Z25V66fzmjLDGCqXjHhJ2q2q6iFyLHloXhlUsHR6tgSbPz3mAMceEWikFqjpnmlfFpGOli2JESG9irvENpvbu6xdWOz32TBISeEVQXyV8pnqDCIwM7y3GjVjQ/ZCt0Yn3DNfWhZm0jLbGqYIQ7aXdcdSUvpQAtXH9U=;
X-UUID: b040d94b729b4d89974c3bebf92758f6-20200528
Received: from mtkcas32.mediatek.inc [(172.27.4.253)] by mailgw02.mediatek.com
        (envelope-from <dongchun.zhu@mediatek.com>)
        (mailgw01.mediatek.com ESMTP with TLS)
        with ESMTP id 524423193; Thu, 28 May 2020 13:55:55 +0800
Received: from MTKCAS32.mediatek.inc (172.27.4.184) by MTKMBS31DR.mediatek.inc
 (172.27.6.102) with Microsoft SMTP Server (TLS) id 15.0.1497.2; Thu, 28 May
 2020 13:55:50 +0800
Received: from [10.17.3.153] (10.17.3.153) by MTKCAS32.mediatek.inc
 (172.27.4.170) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Thu, 28 May 2020 13:55:31 +0800
Message-ID: <1590645223.8804.498.camel@mhfsdcap03>
Subject: Re: [V9, 1/2] media: dt-bindings: media: i2c: Document OV02A10
 bindings
From:   Dongchun Zhu <dongchun.zhu@mediatek.com>
To:     Rob Herring <robh@kernel.org>
CC:     Linus Walleij <linus.walleij@linaro.org>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Mark Rutland <mark.rutland@arm.com>,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
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
        Shengnan Wang =?UTF-8?Q?=28=E7=8E=8B=E5=9C=A3=E7=94=B7=29?= 
        <shengnan.wang@mediatek.com>, <dongchun.zhu@medaitek.com>
Date:   Thu, 28 May 2020 13:53:43 +0800
In-Reply-To: <CAL_Jsq+sN0SVidTrY0ODXEkzkxYFvG1FTnL0oRQBSKf=ynLdyQ@mail.gmail.com>
References: <20200523084103.31276-1-dongchun.zhu@mediatek.com>
         <20200523084103.31276-2-dongchun.zhu@mediatek.com>
         <20200526182847.GA92449@bogus> <1590569355.8804.448.camel@mhfsdcap03>
         <CAL_Jsq+sN0SVidTrY0ODXEkzkxYFvG1FTnL0oRQBSKf=ynLdyQ@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"
X-Mailer: Evolution 3.10.4-0ubuntu2 
MIME-Version: 1.0
X-TM-SNTS-SMTP: 5202DC9C4A6DAD8E5332356556DAFB0DC31C7CBC60798AF4CE88C6F8C832C7CA2000:8
X-MTK:  N
Content-Transfer-Encoding: base64
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

SGkgUm9iLA0KDQpPbiBXZWQsIDIwMjAtMDUtMjcgYXQgMDk6MjcgLTA2MDAsIFJvYiBIZXJyaW5n
IHdyb3RlOg0KPiBPbiBXZWQsIE1heSAyNywgMjAyMCBhdCAyOjUxIEFNIERvbmdjaHVuIFpodSA8
ZG9uZ2NodW4uemh1QG1lZGlhdGVrLmNvbT4gd3JvdGU6DQo+ID4NCj4gPiBIaSBSb2IsDQo+ID4N
Cj4gPiBUaGFua3MgZm9yIHRoZSByZXZpZXcuIFBsZWFzZSBzZWUgbXkgcmVwbGllcyBiZWxvdy4N
Cj4gPg0KPiA+IE9uIFR1ZSwgMjAyMC0wNS0yNiBhdCAxMjoyOCAtMDYwMCwgUm9iIEhlcnJpbmcg
d3JvdGU6DQo+ID4gPiBPbiBTYXQsIE1heSAyMywgMjAyMCBhdCAwNDo0MTowMlBNICswODAwLCBE
b25nY2h1biBaaHUgd3JvdGU6DQo+ID4gPiA+IEFkZCBEVCBiaW5kaW5ncyBkb2N1bWVudGF0aW9u
IGZvciBPbW5pdmlzaW9uIE9WMDJBMTAgaW1hZ2Ugc2Vuc29yLg0KPiA+ID4gPg0KPiA+ID4gPiBT
aWduZWQtb2ZmLWJ5OiBEb25nY2h1biBaaHUgPGRvbmdjaHVuLnpodUBtZWRpYXRlay5jb20+DQo+
ID4gPiA+IC0tLQ0KPiA+ID4gPiAgLi4uL2JpbmRpbmdzL21lZGlhL2kyYy9vdnRpLG92MDJhMTAu
eWFtbCAgICAgICAgICAgfCAxNzIgKysrKysrKysrKysrKysrKysrKysrDQo+ID4gPiA+ICBNQUlO
VEFJTkVSUyAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICB8ICAgNyArDQo+
ID4gPiA+ICAyIGZpbGVzIGNoYW5nZWQsIDE3OSBpbnNlcnRpb25zKCspDQo+ID4gPiA+ICBjcmVh
dGUgbW9kZSAxMDA2NDQgRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL21lZGlhL2ky
Yy9vdnRpLG92MDJhMTAueWFtbA0KPiA+ID4gPg0KPiA+ID4gPiBkaWZmIC0tZ2l0IGEvRG9jdW1l
bnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL21lZGlhL2kyYy9vdnRpLG92MDJhMTAueWFtbCBi
L0RvY3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy9tZWRpYS9pMmMvb3Z0aSxvdjAyYTEw
LnlhbWwNCj4gPiA+ID4gbmV3IGZpbGUgbW9kZSAxMDA2NDQNCj4gPiA+ID4gaW5kZXggMDAwMDAw
MC4uNTZmMzFiNQ0KPiA+ID4gPiAtLS0gL2Rldi9udWxsDQo+ID4gPiA+ICsrKyBiL0RvY3VtZW50
YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy9tZWRpYS9pMmMvb3Z0aSxvdjAyYTEwLnlhbWwNCj4g
PiA+ID4gQEAgLTAsMCArMSwxNzIgQEANCj4gPiA+ID4gKyMgU1BEWC1MaWNlbnNlLUlkZW50aWZp
ZXI6IChHUEwtMi4wIE9SIEJTRC0yLUNsYXVzZSkNCj4gPiA+ID4gKyMgQ29weXJpZ2h0IChjKSAy
MDIwIE1lZGlhVGVrIEluYy4NCj4gPiA+ID4gKyVZQU1MIDEuMg0KPiA+ID4gPiArLS0tDQo+ID4g
PiA+ICskaWQ6IGh0dHA6Ly9kZXZpY2V0cmVlLm9yZy9zY2hlbWFzL21lZGlhL2kyYy9vdnRpLG92
MDJhMTAueWFtbCMNCj4gPiA+ID4gKyRzY2hlbWE6IGh0dHA6Ly9kZXZpY2V0cmVlLm9yZy9tZXRh
LXNjaGVtYXMvY29yZS55YW1sIw0KPiA+ID4gPiArDQo+ID4gPiA+ICt0aXRsZTogT21uaXZpc2lv
biBPVjAyQTEwIENNT1MgU2Vuc29yIERldmljZSBUcmVlIEJpbmRpbmdzDQo+ID4gPiA+ICsNCj4g
PiA+ID4gK21haW50YWluZXJzOg0KPiA+ID4gPiArICAtIERvbmdjaHVuIFpodSA8ZG9uZ2NodW4u
emh1QG1lZGlhdGVrLmNvbT4NCj4gPiA+ID4gKw0KPiA+ID4gPiArZGVzY3JpcHRpb246IHwtDQo+
ID4gPiA+ICsgIFRoZSBPbW5pdmlzaW9uIE9WMDJBMTAgaXMgYSBsb3ctY29zdCwgaGlnaCBwZXJm
b3JtYW5jZSwgMS81LWluY2gsIDIgbWVnYXBpeGVsDQo+ID4gPiA+ICsgIGltYWdlIHNlbnNvciwg
d2hpY2ggaXMgdGhlIGxhdGVzdCBwcm9kdWN0aW9uIGRlcml2ZWQgZnJvbSBPbW5pdmlzaW9uJ3Mg
Q01PUw0KPiA+ID4gPiArICBpbWFnZSBzZW5zb3IgdGVjaG5vbG9neS4gSWhpcyBjaGlwIHN1cHBv
cnRzIGhpZ2ggZnJhbWUgcmF0ZSBzcGVlZHMgdXAgdG8gMzBmcHMNCj4gPiA+ID4gKyAgQCAxNjAw
eDEyMDAgKFVYR0EpIHJlc29sdXRpb24gdHJhbnNmZXJyZWQgb3ZlciBhIDEtbGFuZSBNSVBJIGlu
dGVyZmFjZS4gVGhlDQo+ID4gPiA+ICsgIHNlbnNvciBvdXRwdXQgaXMgYXZhaWxhYmxlIHZpYSBD
U0ktMiBzZXJpYWwgZGF0YSBvdXRwdXQuDQo+ID4gPiA+ICsNCj4gPiA+ID4gK3Byb3BlcnRpZXM6
DQo+ID4gPiA+ICsgIGNvbXBhdGlibGU6DQo+ID4gPiA+ICsgICAgY29uc3Q6IG92dGksb3YwMmEx
MA0KPiA+ID4gPiArDQo+ID4gPiA+ICsgIHJlZzoNCj4gPiA+ID4gKyAgICBtYXhJdGVtczogMQ0K
PiA+ID4gPiArDQo+ID4gPiA+ICsgIGNsb2NrczoNCj4gPiA+ID4gKyAgICBpdGVtczoNCj4gPiA+
ID4gKyAgICAgIC0gZGVzY3JpcHRpb246IHRvcCBtdXggY2FtdGcgY2xvY2sNCj4gPiA+ID4gKyAg
ICAgIC0gZGVzY3JpcHRpb246IGRpdmlkZXIgY2xvY2sNCj4gPiA+ID4gKw0KPiA+ID4gPiArICBj
bG9jay1uYW1lczoNCj4gPiA+ID4gKyAgICBpdGVtczoNCj4gPiA+ID4gKyAgICAgIC0gY29uc3Q6
IGVjbGsNCj4gPiA+ID4gKyAgICAgIC0gY29uc3Q6IGZyZXFfbXV4DQo+ID4gPiA+ICsNCj4gPiA+
ID4gKyAgY2xvY2stZnJlcXVlbmN5Og0KPiA+ID4gPiArICAgIGRlc2NyaXB0aW9uOg0KPiA+ID4g
PiArICAgICAgRnJlcXVlbmN5IG9mIHRoZSBlY2xrIGNsb2NrIGluIEhlcnR6Lg0KPiA+ID4gPiAr
DQo+ID4NCj4gPiBSb2IsIHNoYWxsIHdlIHVzZSAnbWF4SXRlbXM6IDEnIHRvIGNvbnN0cmFpbiBw
cm9wZXJ0eTogY2xvY2stZnJlcXVlbmN5Pw0KPiANCj4gTm8sIGJlY2F1c2UgaXQgaXMgYSBzY2Fs
YXIsIG5vdCBhbiBhcnJheS4NCj4gDQoNCkdvdCBpdC4NCg0KPiA+IE9yIGNvdWxkIHdlIGFkb3B0
ICdjbG9jay1mcmVxdWVuY3k6IHRydWUnIGRpcmVjdGx5IGhlcmU/DQo+IA0KPiBBcy1pcyBpcyBm
aW5lLg0KPiANCg0KVW5kZXJzdG9vZC4NCg0KPiA+ID4gPiArICBkb3ZkZC1zdXBwbHk6DQo+ID4g
PiA+ICsgICAgZGVzY3JpcHRpb246DQo+ID4gPiA+ICsgICAgICBEZWZpbml0aW9uIG9mIHRoZSBy
ZWd1bGF0b3IgdXNlZCBhcyBEaWdpdGFsIEkvTyB2b2x0YWdlIHN1cHBseS4NCj4gPiA+ID4gKw0K
PiA+DQo+ID4gU2hhbGwgd2UgYWRkICdtYXhJdGVtczogMScgaGVyZT8NCj4gDQo+IE5vLCBzdXBw
bGllcyBhcmUgYWx3YXlzIHNpbmd1bGFyLg0KPiANCg0KRmluZS4NCg0KPiA+DQo+ID4gPiA+ICsg
IGF2ZGQtc3VwcGx5Og0KPiA+ID4gPiArICAgIGRlc2NyaXB0aW9uOg0KPiA+ID4gPiArICAgICAg
RGVmaW5pdGlvbiBvZiB0aGUgcmVndWxhdG9yIHVzZWQgYXMgQW5hbG9nIHZvbHRhZ2Ugc3VwcGx5
Lg0KPiA+ID4gPiArDQo+ID4NCj4gPiBEaXR0by4NCj4gPg0KPiA+ID4gPiArICBkdmRkLXN1cHBs
eToNCj4gPiA+ID4gKyAgICBkZXNjcmlwdGlvbjoNCj4gPiA+ID4gKyAgICAgIERlZmluaXRpb24g
b2YgdGhlIHJlZ3VsYXRvciB1c2VkIGFzIERpZ2l0YWwgY29yZSB2b2x0YWdlIHN1cHBseS4NCj4g
PiA+ID4gKw0KPiA+DQo+ID4gRGl0dG8uDQo+ID4NCj4gPiA+ID4gKyAgcG93ZXJkb3duLWdwaW9z
Og0KPiA+ID4gPiArICAgIGRlc2NyaXB0aW9uOg0KPiA+ID4gPiArICAgICAgTXVzdCBiZSB0aGUg
ZGV2aWNlIHRyZWUgaWRlbnRpZmllciBvZiB0aGUgR1BJTyBjb25uZWN0ZWQgdG8gdGhlDQo+ID4g
PiA+ICsgICAgICBQRF9QQUQgcGluLiBUaGlzIHBpbiBpcyB1c2VkIHRvIHBsYWNlIHRoZSBPVjAy
QTEwIGludG8gU3RhbmRieSBtb2RlDQo+ID4gPiA+ICsgICAgICBvciBTaHV0ZG93biBtb2RlLiBB
cyB0aGUgbGluZSBpcyBhY3RpdmUgbG93LCBpdCBzaG91bGQgYmUNCj4gPiA+ID4gKyAgICAgIG1h
cmtlZCBHUElPX0FDVElWRV9MT1cuDQo+ID4gPg0KPiA+ID4gTmVlZCB0byBkZWZpbmUgaG93IG1h
bnkgR1BJT3MgKCdtYXhJdGVtczogMScpDQo+ID4gPg0KPiA+DQo+ID4gSXQgd291bGQgYmUgZml4
ZWQgbGlrZSB0aGlzIGluIG5leHQgcmVsZWFzZS4NCj4gPiBwb3dlcmRvd24tZ3Bpb3M6DQo+ID4g
ICBtYXhJdGVtczogMQ0KPiA+ICAgZGVzY3JpcHRpb246DQo+ID4gICAgIE11c3QgYmUgdGhlIGRl
dmljZSB0cmVlIGlkZW50aWZpZXIgb2YgdGhlIEdQSU8gY29ubmVjdGVkIHRvIHRoZQ0KPiA+ICAg
ICBQRF9QQUQgcGluLiBUaGlzIHBpbiBpcyB1c2VkIHRvIHBsYWNlIHRoZSBPVjAyQTEwIGludG8g
U3RhbmRieSBtb2RlDQo+ID4gICAgIG9yIFNodXRkb3duIG1vZGUuIEFzIHRoZSBsaW5lIGlzIGFj
dGl2ZSBsb3csIGl0IHNob3VsZCBiZQ0KPiA+ICAgICBtYXJrZWQgR1BJT19BQ1RJVkVfTE9XLg0K
PiA+DQoNClRvbWFzeiwgSSBkb24ndCBrbm93IHdoZXRoZXIgeW91IG5vdGljZWQgdGhpcyBkZXNj
cmlwdGlvbi4NCkhlcmUgSSBzaW1wbHkgZGVmaW5lZCBvbmUgbmVjZXNzYXJ5IEdQSU8gcG9sYXJp
dHkgaW4gRFQgd2hpY2ggZHJpdmVyDQpzZXR0aW5ncyBuZWVkIHRvIGZvbGxvdy4NCg0KPiA+ID4g
PiArDQo+ID4gPiA+ICsgIHJlc2V0LWdwaW9zOg0KPiA+ID4gPiArICAgIGRlc2NyaXB0aW9uOg0K
PiA+ID4gPiArICAgICAgTXVzdCBiZSB0aGUgZGV2aWNlIHRyZWUgaWRlbnRpZmllciBvZiB0aGUg
R1BJTyBjb25uZWN0ZWQgdG8gdGhlDQo+ID4gPiA+ICsgICAgICBSU1RfUEQgcGluLiBJZiBzcGVj
aWZpZWQsIGl0IHdpbGwgYmUgYXNzZXJ0ZWQgZHVyaW5nIGRyaXZlciBwcm9iZS4NCj4gPiA+ID4g
KyAgICAgIEFzIHRoZSBsaW5lIGlzIGFjdGl2ZSBoaWdoLCBpdCBzaG91bGQgYmUgbWFya2VkIEdQ
SU9fQUNUSVZFX0hJR0guDQo+ID4gPg0KPiA+ID4gSGVyZSB0b28uDQo+ID4gPg0KPiA+DQo+ID4g
U2ltaWxhciBhcyAncG93ZXJkb3duLWdwaW9zJy4NCj4gPiBGaXhlZCBpbiBuZXh0IHJlbGVhc2Uu
DQo+ID4NCj4gPiA+ID4gKw0KPiA+ID4gPiArICByb3RhdGlvbjoNCj4gPiA+ID4gKyAgICBkZXNj
cmlwdGlvbjoNCj4gPiA+ID4gKyAgICAgIERlZmluaXRpb24gb2YgdGhlIHNlbnNvcidzIHBsYWNl
bWVudC4NCj4gPiA+ID4gKyAgICBhbGxPZjoNCj4gPiA+ID4gKyAgICAgIC0gJHJlZjogIi9zY2hl
bWFzL3R5cGVzLnlhbWwjL2RlZmluaXRpb25zL3VpbnQzMiINCj4gPiA+ID4gKyAgICAgIC0gZW51
bToNCj4gPiA+ID4gKyAgICAgICAgICAtIDAgICAgIyBTZW5zb3IgTW91bnRlZCBVcHJpZ2h0DQo+
ID4gPiA+ICsgICAgICAgICAgLSAxODAgICMgU2Vuc29yIE1vdW50ZWQgVXBzaWRlIERvd24NCj4g
PiA+ID4gKyAgICAgICAgZGVmYXVsdDogMA0KPiA+ID4gPiArDQo+ID4gPiA+ICsgIG92dGksbWlw
aS10eC1zcGVlZDoNCj4gPiA+ID4gKyAgICBkZXNjcmlwdGlvbjoNCj4gPiA+ID4gKyAgICAgIElu
ZGljYXRpb24gb2YgTUlQSSB0cmFuc21pc3Npb24gc3BlZWQgc2VsZWN0LCB3aGljaCBpcyB0byBj
b250cm9sIEQtUEhZDQo+ID4gPiA+ICsgICAgICB0aW1pbmcgc2V0dGluZyBieSBhZGp1c3Rpbmcg
TUlQSSBjbG9jayB2b2x0YWdlIHRvIGltcHJvdmUgdGhlIGNsb2NrDQo+ID4gPiA+ICsgICAgICBk
cml2ZXIgY2FwYWJpbGl0eS4NCj4gPiA+ID4gKyAgICBhbGxPZjoNCj4gPiA+ID4gKyAgICAgIC0g
JHJlZjogIi9zY2hlbWFzL3R5cGVzLnlhbWwjL2RlZmluaXRpb25zL3VpbnQzMiINCj4gPiA+ID4g
KyAgICAgIC0gZW51bToNCj4gPiA+ID4gKyAgICAgICAgICAtIDAgICAgIyAgMjBNSHogLSAgMzBN
SHoNCj4gPiA+ID4gKyAgICAgICAgICAtIDEgICAgIyAgMzBNSHogLSAgNTBNSHoNCj4gPiA+ID4g
KyAgICAgICAgICAtIDIgICAgIyAgNTBNSHogLSAgNzVNSHoNCj4gPiA+ID4gKyAgICAgICAgICAt
IDMgICAgIyAgNzVNSHogLSAxMDBNSHoNCj4gPiA+ID4gKyAgICAgICAgICAtIDQgICAgIyAxMDBN
SHogLSAxMzBNSHoNCj4gPiA+ID4gKyAgICAgICAgZGVmYXVsdDogMw0KPiA+ID4gPiArDQo+ID4g
PiA+ICsgICMgU2VlIC4uL3ZpZGVvLWludGVyZmFjZXMudHh0IGZvciBkZXRhaWxzDQo+ID4gPiA+
ICsgIHBvcnQ6DQo+ID4gPiA+ICsgICAgdHlwZTogb2JqZWN0DQo+ID4gPiA+ICsgICAgYWRkaXRp
b25hbFByb3BlcnRpZXM6IGZhbHNlDQo+ID4gPg0KPiA+ID4gU2hvdWxkIGhhdmUgYSBkZXNjcmlw
dGlvbiBvZiB3aGF0IGRhdGEgdGhlIHBvcnQgaGFzLg0KPiA+ID4NCj4gPg0KPiA+IEl0IHdvdWxk
IGJlIHVwZGF0ZWQgYXMgYmVsb3cgaW4gbmV4dCByZWxlYXNlLg0KPiA+IHBvcnQ6DQo+ID4gICB0
eXBlOiBvYmplY3QNCj4gPiAgIGFkZGl0aW9uYWxQcm9wZXJ0aWVzOiBmYWxzZQ0KPiA+ICAgZGVz
Y3JpcHRpb246DQo+ID4gICAgIElucHV0IHBvcnQgbm9kZSwgc2luZ2xlIGVuZHBvaW50IGRlc2Ny
aWJpbmcgdGhlIENTSS0yIHRyYW5zbWl0dGVyLg0KPiANCj4gT3V0cHV0Pw0KPiANCg0KU29ycnkg
Zm9yIHRoZSB0eXBvLg0KWWVzLCB0aGlzIHNob3VsZCBiZSBvdXRwdXQgcG9ydCBub2RlLg0KDQo+
ID4NCj4gPiA+ID4gKw0KPiA+ID4gPiArICAgIHByb3BlcnRpZXM6DQo+ID4gPiA+ICsgICAgICBl
bmRwb2ludDoNCj4gPiA+ID4gKyAgICAgICAgdHlwZTogb2JqZWN0DQo+ID4gPiA+ICsgICAgICAg
IGFkZGl0aW9uYWxQcm9wZXJ0aWVzOiBmYWxzZQ0KPiA+ID4gPiArDQo+ID4gPiA+ICsgICAgICAg
IHByb3BlcnRpZXM6DQo+ID4NCj4gPiBBY3R1YWxseSBJIHdvbmRlciB3aGV0aGVyIHdlIG5lZWQg
dG8gZGVjbGFyZSAnY2xvY2stbGFuZXMnIGhlcmU/DQo+IA0KPiBZZXMsIGlmIHlvdSBhcmUgdXNp
bmcgaXQuDQo+IA0KDQpMb29raW5nIGJhY2sgdG8gdGhlIHVwc3RyZWFtZWQgcGF0Y2hlcywgaXQg
c2VlbXMgdGhhdCB0aGVyZSBpcyBhIGRlZXANCmRpdmlkZSBpbiB0aGUgc2V0dGluZyBvZiAnY2xv
Y2stbGFuZXMnIHByb3BlcnR5Lg0KDQpBcyB0aGUgbGFzdCBjb21tZW50IEkganVzdCBwb3NlZCwg
Zm9yIE9WMDJBMTAsICdjbG9jay1sYW5lcycgc2hvdWxkIGJlDQpzZXQgdG8gPDA+IChjbG9jayBs
YW5lIG9uIGhhcmR3YXJlIGxhbmUgMCkuDQpCdXQgaGVyZSB3ZSBtYXkgZm9sbG93IElNWDIxOSBw
YXRjaCwgd2hpY2ggcmVtb3ZlZCAnY2xvY2stbGFuZXMnDQpwcm9wZXJ0eSBkdWUgdG8gdGhlIGZh
Y3QgdGhhdCBzZW5zb3IgaGFyZHdhcmUgZG9lcyBub3Qgc3VwcG9ydCBsYW5lDQpyZW9yZGVyaW5n
Lg0KDQpSb2IsIFNha2FyaSwgd2hhdCdzIHlvdXIgb3BpbmlvbnM/DQoNCj4gUm9iDQoNCg==

