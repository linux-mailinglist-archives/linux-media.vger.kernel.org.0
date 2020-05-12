Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 241601CEB88
	for <lists+linux-media@lfdr.de>; Tue, 12 May 2020 05:34:53 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728408AbgELDev (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 11 May 2020 23:34:51 -0400
Received: from Mailgw01.mediatek.com ([1.203.163.78]:38643 "EHLO
        mailgw01.mediatek.com" rhost-flags-OK-FAIL-OK-FAIL) by vger.kernel.org
        with ESMTP id S1727942AbgELDev (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 11 May 2020 23:34:51 -0400
X-UUID: 11db1a90d6964c5785ccf8a9fd13537e-20200512
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
        h=Content-Transfer-Encoding:MIME-Version:Content-Type:References:In-Reply-To:Date:CC:To:From:Subject:Message-ID; bh=gzRrirgWI6RFHcvKQwsR25zvfvdlxabazbvPiYB63TY=;
        b=OWnKeS1IuniH6iUGGStDMP61SjfpnTfZpAXZVbECF3r9f0lahR3k5nLDka2tXK2g4KBmDmjsPAdhQCB7C4sHBRCHmLf8W6kQ2GBVX50n/QPLDujrylUmPxEEKa01L04GpT4Adm91yjTErM24m+UDrAB+7QZS+czAKfa09zJXLGQ=;
X-UUID: 11db1a90d6964c5785ccf8a9fd13537e-20200512
Received: from mtkcas35.mediatek.inc [(172.27.4.253)] by mailgw01.mediatek.com
        (envelope-from <dongchun.zhu@mediatek.com>)
        (mailgw01.mediatek.com ESMTP with TLS)
        with ESMTP id 1439724666; Tue, 12 May 2020 11:34:40 +0800
Received: from MTKCAS32.mediatek.inc (172.27.4.184) by MTKMBS31DR.mediatek.inc
 (172.27.6.102) with Microsoft SMTP Server (TLS) id 15.0.1497.2; Tue, 12 May
 2020 11:34:38 +0800
Received: from [10.17.3.153] (10.17.3.153) by MTKCAS32.mediatek.inc
 (172.27.4.170) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Tue, 12 May 2020 11:34:37 +0800
Message-ID: <1589254403.8804.306.camel@mhfsdcap03>
Subject: Re: [V5, 2/2] media: i2c: dw9768: Add DW9768 VCM driver
From:   Dongchun Zhu <dongchun.zhu@mediatek.com>
To:     Tomasz Figa <tfiga@chromium.org>
CC:     Sakari Ailus <sakari.ailus@linux.intel.com>,
        Linus Walleij <linus.walleij@linaro.org>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        Nicolas Boichat <drinkcat@chromium.org>,
        Matthias Brugger <matthias.bgg@gmail.com>,
        "Cao Bing Bu" <bingbu.cao@intel.com>,
        srv_heupstream <srv_heupstream@mediatek.com>,
        "moderated list:ARM/Mediatek SoC support" 
        <linux-mediatek@lists.infradead.org>,
        "list@263.net:IOMMU DRIVERS <iommu@lists.linux-foundation.org>, Joerg 
        Roedel <joro@8bytes.org>," <linux-arm-kernel@lists.infradead.org>,
        Sj Huang <sj.huang@mediatek.com>,
        Linux Media Mailing List <linux-media@vger.kernel.org>,
        linux-devicetree <devicetree@vger.kernel.org>,
        Louis Kuo <louis.kuo@mediatek.com>,
        "Shengnan Wang =?UTF-8?Q?=28=E7=8E=8B=E5=9C=A3=E7=94=B7=29?=" 
        <shengnan.wang@mediatek.com>
Date:   Tue, 12 May 2020 11:33:23 +0800
In-Reply-To: <CAAFQd5DZBEUJUq65WT7i_QjAtgxjhxmfdsjQoyG2UZy8zBih+A@mail.gmail.com>
References: <20200502161727.30463-1-dongchun.zhu@mediatek.com>
         <20200502161727.30463-3-dongchun.zhu@mediatek.com>
         <20200506151352.GZ9190@paasikivi.fi.intel.com>
         <1588855524.8804.168.camel@mhfsdcap03>
         <20200507131220.GC9190@paasikivi.fi.intel.com>
         <CAAFQd5DO9FGx9OF2RpcSprg0oLiVuS90w2qLAHCOSc3w6tKUWw@mail.gmail.com>
         <1588907288.8804.188.camel@mhfsdcap03>
         <20200508211319.GJ9190@paasikivi.fi.intel.com>
         <1588991026.8804.235.camel@mhfsdcap03>
         <CAAFQd5DZBEUJUq65WT7i_QjAtgxjhxmfdsjQoyG2UZy8zBih+A@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"
X-Mailer: Evolution 3.10.4-0ubuntu2 
MIME-Version: 1.0
X-TM-SNTS-SMTP: DA68AA50845AF29D2688D88BB4FD0C4D483C870F8F7DCE4E80D492F383CA908E2000:8
X-MTK:  N
Content-Transfer-Encoding: base64
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

SGkgVG9tYXN6LA0KDQpPbiBNb24sIDIwMjAtMDUtMTEgYXQgMjA6MjAgKzAyMDAsIFRvbWFzeiBG
aWdhIHdyb3RlOg0KPiBIaSBEb25nY2h1biwNCj4gDQo+IE9uIFNhdCwgTWF5IDksIDIwMjAgYXQg
NDoyNSBBTSBEb25nY2h1biBaaHUgPGRvbmdjaHVuLnpodUBtZWRpYXRlay5jb20+IHdyb3RlOg0K
PiA+DQo+ID4gSGkgU2FrYXJpLA0KPiA+DQo+ID4gT24gU2F0LCAyMDIwLTA1LTA5IGF0IDAwOjEz
ICswMzAwLCBTYWthcmkgQWlsdXMgd3JvdGU6DQo+ID4gPiBIaSBEb25nY2h1biwNCj4gPiA+DQo+
ID4gPiBPbiBGcmksIE1heSAwOCwgMjAyMCBhdCAxMTowODowOEFNICswODAwLCBEb25nY2h1biBa
aHUgd3JvdGU6DQo+ID4gPiA+IEhpIFNha2FyaSwgVG9tYXN6LA0KPiA+ID4gPg0KPiA+ID4gPiBU
aGFua3MgZm9yIHRoZSByZXZpZXcuDQo+ID4gPiA+DQo+ID4gPiA+IE9uIFRodSwgMjAyMC0wNS0w
NyBhdCAxNTo0NiArMDIwMCwgVG9tYXN6IEZpZ2Egd3JvdGU6DQo+ID4gPiA+ID4gSGkgU2FrYXJp
LCBEb25nY2h1biwNCj4gPiA+ID4gPg0KPiA+ID4gPiA+IE9uIFRodSwgTWF5IDcsIDIwMjAgYXQg
MzoxMiBQTSBTYWthcmkgQWlsdXMNCj4gPiA+ID4gPiA8c2FrYXJpLmFpbHVzQGxpbnV4LmludGVs
LmNvbT4gd3JvdGU6DQo+ID4gPiA+ID4gPg0KPiA+ID4gPiA+ID4gSEkgRG9uZ2NodW4sDQo+ID4g
PiA+ID4gPg0KPiA+ID4gPiA+ID4gT24gVGh1LCBNYXkgMDcsIDIwMjAgYXQgMDg6NDU6MjRQTSAr
MDgwMCwgRG9uZ2NodW4gWmh1IHdyb3RlOg0KPiA+ID4gPiA+ID4gPiBIaSBTYWthcmksDQo+ID4g
PiA+ID4gPiA+DQo+ID4gPiA+ID4gPiA+IFRoYW5rcyBmb3IgdGhlIHJldmlldy4NCj4gPiA+ID4g
PiA+ID4NCj4gPiA+ID4gPiA+ID4gT24gV2VkLCAyMDIwLTA1LTA2IGF0IDE4OjEzICswMzAwLCBT
YWthcmkgQWlsdXMgd3JvdGU6DQo+ID4gPiA+ID4gPiA+ID4gSGkgRG9uZ2NodW4sDQo+ID4gPiA+
ID4gPiA+ID4NCj4gPiA+ID4gPiA+ID4gPiBPbiBTdW4sIE1heSAwMywgMjAyMCBhdCAxMjoxNzoy
N0FNICswODAwLCBEb25nY2h1biBaaHUgd3JvdGU6DQo+ID4gPiA+ID4gPiA+ID4gPiBBZGQgYSBW
NEwyIHN1Yi1kZXZpY2UgZHJpdmVyIGZvciBEVzk3Njggdm9pY2UgY29pbCBtb3RvciwgcHJvdmlk
aW5nDQo+ID4gPiA+ID4gPiA+ID4gPiBjb250cm9sIHRvIHNldCB0aGUgZGVzaXJlZCBmb2N1cyB2
aWEgSUlDIHNlcmlhbCBpbnRlcmZhY2UuDQo+ID4gPiA+ID4gPiA+ID4gPg0KPiA+ID4gPiA+ID4g
PiA+ID4gU2lnbmVkLW9mZi1ieTogRG9uZ2NodW4gWmh1IDxkb25nY2h1bi56aHVAbWVkaWF0ZWsu
Y29tPg0KPiA+ID4gPiA+ID4gPiA+ID4gLS0tDQo+ID4gPiA+ID4gPiA+ID4gPiAgTUFJTlRBSU5F
UlMgICAgICAgICAgICAgICAgfCAgIDEgKw0KPiA+ID4gPiA+ID4gPiA+ID4gIGRyaXZlcnMvbWVk
aWEvaTJjL0tjb25maWcgIHwgIDExICsrDQo+ID4gPiA+ID4gPiA+ID4gPiAgZHJpdmVycy9tZWRp
YS9pMmMvTWFrZWZpbGUgfCAgIDEgKw0KPiA+ID4gPiA+ID4gPiA+ID4gIGRyaXZlcnMvbWVkaWEv
aTJjL2R3OTc2OC5jIHwgNDQwICsrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysr
KysrKysrKw0KPiA+ID4gPiA+ID4gPiA+ID4gIDQgZmlsZXMgY2hhbmdlZCwgNDUzIGluc2VydGlv
bnMoKykNCj4gPiA+ID4gPiA+ID4gPiA+ICBjcmVhdGUgbW9kZSAxMDA2NDQgZHJpdmVycy9tZWRp
YS9pMmMvZHc5NzY4LmMNCj4gPiA+ID4gPiA+ID4gPiA+DQo+ID4gPiA+ID4gPiA+ID4gPiBkaWZm
IC0tZ2l0IGEvTUFJTlRBSU5FUlMgYi9NQUlOVEFJTkVSUw0KPiA+ID4gPiA+ID4gPiA+ID4gaW5k
ZXggOGQ3MmM0MS4uYzkyZGM5OSAxMDA2NDQNCj4gPiA+ID4gPiA+ID4gPiA+IC0tLSBhL01BSU5U
QUlORVJTDQo+ID4gPiA+ID4gPiA+ID4gPiArKysgYi9NQUlOVEFJTkVSUw0KPiA+ID4gPiA+ID4g
PiA+ID4gQEAgLTUxNTcsNiArNTE1Nyw3IEBAIEw6ICBsaW51eC1tZWRpYUB2Z2VyLmtlcm5lbC5v
cmcNCj4gPiA+ID4gPiA+ID4gPiA+ICBTOiAgICAgICBNYWludGFpbmVkDQo+ID4gPiA+ID4gPiA+
ID4gPiAgVDogICAgICAgZ2l0IGdpdDovL2xpbnV4dHYub3JnL21lZGlhX3RyZWUuZ2l0DQo+ID4g
PiA+ID4gPiA+ID4gPiAgRjogICAgICAgRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdz
L21lZGlhL2kyYy9kb25nd29vbixkdzk3NjgueWFtbA0KPiA+ID4gPiA+ID4gPiA+ID4gK0Y6ICAg
ICAgIGRyaXZlcnMvbWVkaWEvaTJjL2R3OTc2OC5jDQo+ID4gPiA+ID4gPiA+ID4gPg0KPiA+ID4g
PiA+ID4gPiA+ID4gIERPTkdXT09OIERXOTgwNyBMRU5TIFZPSUNFIENPSUwgRFJJVkVSDQo+ID4g
PiA+ID4gPiA+ID4gPiAgTTogICAgICAgU2FrYXJpIEFpbHVzIDxzYWthcmkuYWlsdXNAbGludXgu
aW50ZWwuY29tPg0KPiA+ID4gPiA+ID4gPiA+ID4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvbWVkaWEv
aTJjL0tjb25maWcgYi9kcml2ZXJzL21lZGlhL2kyYy9LY29uZmlnDQo+ID4gPiA+ID4gPiA+ID4g
PiBpbmRleCAxMjVkNTk2Li42YTNmOWRhIDEwMDY0NA0KPiA+ID4gPiA+ID4gPiA+ID4gLS0tIGEv
ZHJpdmVycy9tZWRpYS9pMmMvS2NvbmZpZw0KPiA+ID4gPiA+ID4gPiA+ID4gKysrIGIvZHJpdmVy
cy9tZWRpYS9pMmMvS2NvbmZpZw0KPiA+ID4gPiA+ID4gPiA+ID4gQEAgLTEwNDAsNiArMTA0MCwx
NyBAQCBjb25maWcgVklERU9fRFc5NzE0DQo+ID4gPiA+ID4gPiA+ID4gPiAgICAgY2FwYWJpbGl0
eS4gVGhpcyBpcyBkZXNpZ25lZCBmb3IgbGluZWFyIGNvbnRyb2wgb2YNCj4gPiA+ID4gPiA+ID4g
PiA+ICAgICB2b2ljZSBjb2lsIG1vdG9ycywgY29udHJvbGxlZCB2aWEgSTJDIHNlcmlhbCBpbnRl
cmZhY2UuDQo+ID4gPiA+ID4gPiA+ID4gPg0KPiA+ID4gPiA+ID4gPiA+ID4gK2NvbmZpZyBWSURF
T19EVzk3NjgNCj4gPiA+ID4gPiA+ID4gPiA+ICsgdHJpc3RhdGUgIkRXOTc2OCBsZW5zIHZvaWNl
IGNvaWwgc3VwcG9ydCINCj4gPiA+ID4gPiA+ID4gPiA+ICsgZGVwZW5kcyBvbiBJMkMgJiYgVklE
RU9fVjRMMiAmJiBNRURJQV9DT05UUk9MTEVSDQo+ID4gPiA+ID4gPiA+ID4gPiArIGRlcGVuZHMg
b24gVklERU9fVjRMMl9TVUJERVZfQVBJDQo+ID4gPiA+ID4gPiA+ID4NCj4gPiA+ID4gPiA+ID4g
PiBQbGVhc2UgY2hlY2sgaG93IHRoaXMgd29ya3MgaW4gdGhlIG1lZGlhIHRyZWUgbWFzdGVyIGJy
YW5jaCBub3cgLS0tIGl0J3MNCj4gPiA+ID4gPiA+ID4gPiBsYXJnZWx5IHNlbGVjdCBiYXNlZC4N
Cj4gPiA+ID4gPiA+ID4gPg0KPiA+ID4gPiA+ID4gPg0KPiA+ID4gPiA+ID4gPiBUaGUgYWN0dWF0
b3IgZHJpdmVyIHVzZXMgc29tZSBzdHJ1Y3R1cmVzIHRoYXQgcmVxdWlyZSB0aGUNCj4gPiA+ID4g
PiA+ID4gVklERU9fVjRMMl9TVUJERVZfQVBJIGNvZGUsIHNvIGhlcmUgd2UgYWRkIFZJREVPX1Y0
TDJfU1VCREVWX0FQSQ0KPiA+ID4gPiA+ID4gPiBkZXBlbmRlbmN5IHRvIGF2b2lkIHBvc3NpYmxl
IGJ1aWxkIGVycm9yIHdoZW4gaXQncyBub3QgZW5hYmxlZC4NCj4gPiA+ID4gPiA+DQo+ID4gPiA+
ID4gPiBQbGVhc2UgbWFrZSBzdXJlIHRoaXMgd29ya3Mgd2l0aCBjdXJyZW50IG1lZGlhIHRyZWUg
bWFzdGVyLiBSaWdodCBub3cgaXQNCj4gPiA+ID4gPiA+IGRvZXMgbm90Lg0KPiA+ID4gPiA+ID4N
Cj4gPiA+ID4gPg0KPiA+ID4gPiA+IERvbmdjaHVuLCBhcyBTYWthcmkgc2FpZCwgcGxlYXNlIG1h
a2Ugc3VyZSB0byBiYXNlIHRoZSBwYXRjaGVzIG9uIHRoZQ0KPiA+ID4gPiA+IG1hc3RlciBicmFu
Y2ggb2YgdGhlIG1lZGlhIHRyZWUuDQo+ID4gPiA+ID4gKGh0dHBzOi8vZ2l0LmxpbnV4dHYub3Jn
L21lZGlhX3RyZWUuZ2l0LykuIFRoZSBhcHByb2FjaCBmb3IgS2NvbmZpZw0KPiA+ID4gPiA+IGRl
cGVuZGVuY3kgc2VsZWN0aW9uIHRoZXJlIHNlZW1zIHRvIGhhdmUgY2hhbmdlZCByZWNlbnRseS4N
Cj4gPiA+ID4gPg0KPiA+ID4gPg0KPiA+ID4gPiBJIHNlYXJjaGVkIHRoZSBwYXRjaGVzIG9uIHRo
ZSBtZWRpYSB0cmVlIG1hc3RlciBicmFuY2guDQo+ID4gPiA+IEl0IHNlZW1zIHRoYXQgd2UgbmVl
ZCB0byByZW1vdmUgdGhlIFZJREVPX1Y0TDJfU1VCREVWX0FQSSBkZXBlbmRlbmN5IGluDQo+ID4g
PiA+IEtjb25maWcsIGFuZCBhZGQgI2lmZGVmIENPTkZJR19WSURFT19WNEwyX1NVQkRFVl9BUEkg
dG8gaW5jbHVkZQ0KPiA+ID4gPiB2NGwyLXN1YmRldiBjb2RlLg0KPiA+ID4gPiBUaGUgY2hhbmdl
IG1haW5seSBpcyB0byBtYWtlIGJ1aWxkIHBhc3MsIGFuZCBkb24ndCByZXR1cm4gRU5PVFRZIGlm
DQo+ID4gPiA+IFNVQkRFVl9BUEkgaXMgbm90IHNldC4NCj4gPiA+ID4gQW0gSSByaWdodD8NCj4g
PiA+DQo+ID4gPiBQbGVhc2Ugc2VlIEtjb25maWcgZW50cmllcyBmb3Igb3RoZXIgc2ltaWxhciBk
cml2ZXJzIGZyb20gRG9uZ3dvb24uDQo+ID4gPg0KPiA+DQo+ID4gU29ycnkgZm9yIHRoZSBtaXN0
YWtlIDotKQ0KPiA+IEp1c3QgZm91bmQgdGhlIGN1cnJlbnQgbWVkaWEgdHJlZSBtYXN0ZXIgYnJh
bmNoIGNvZGUuLi4NCj4gPiBJIHdvdWxkIHVwZGF0ZSBLY29uZmlnIGVudHJpZXMgaW4gbmV4dCBy
ZWxlYXNlIGJ5IHJlZmVycmluZyB0bzoNCj4gPiBodHRwczovL2dpdC5saW51eHR2Lm9yZy9tZWRp
YV90cmVlLmdpdC90cmVlL2RyaXZlcnMvbWVkaWEvaTJjL0tjb25maWcNCj4gDQo+IFNvcnJ5IGZv
ciBsYXN0IG1pbnV0ZSBjb21tZW50cyBhZ2Fpbi4gV2UgaGFkIGEgc2hvcnQgZGlzY3Vzc2lvbg0K
PiBvZmZsaW5lIHdpdGggU2FrYXJpIGFuZCB3ZSB0aGluayB0aGVyZSBhcmUgc29tZSBjaGFuZ2Vz
IG5lZWRlZCB0byB0aGlzDQo+IGRyaXZlciwgbmFtZWx5Og0KPiANCj4gMSkgVGhlIGhhcmR3YXJl
IGJlaW5nIGRyaXZlbiBpbiBvdXIgY2FzZSBpcyBhIGd0OTc2OSwgd2hpY2ggY291bGQgYmUNCj4g
Y29tcGF0aWJsZSB3aXRoIGR3OTc2OCwgYnV0IGl0J3Mgc3RpbGwgYSBkaWZmZXJlbnQgaW1wbGVt
ZW50YXRpb24gYW5kDQo+IGNvdWxkIGhhdmUgc2xpZ2h0bHkgZGlmZmVyZW50IGNoYXJhY3Rlcmlz
dGljcy4gVGh1cyB3ZSB0aGluayB0aGUNCj4gZHJpdmVyIG5hbWUgYW5kIGNvbXBhdGlibGUgc3Ry
aW5ncyBzaG91bGQgYmUgcmVuYW1lZCBmcm9tDQo+IGRvbmd3b29uLGR3OTc2OCB0byBnaWFudGVj
LGd0OTc2OS4gSW4gdGhlIGZ1dHVyZSwgaWYgdGhlcmUgaXMgYSBkZXZpY2UNCj4gd2l0aCBleGFj
dGx5IGEgZHc5NzY4IGNoaXAsIHRoZSBzYW1lIGRyaXZlciBjb3VsZCBiZSByZXVzZWQgYnkgYWRk
aW5nDQo+IGEgZG9uZ3dvb24sZHc5NzY4IGNvbXBhdGlibGUgc3RyaW5nLg0KPiANCj4gMikgVGhl
IGNoaXAgaGFzIHNvbWUgZGVmYXVsdCBjb25maWd1cmF0aW9uLCB3aGljaCBpcyBsb3N0IGJlY2F1
c2UgdGhlDQo+IGRyaXZlciBvdmVycmlkZXMgaXQgd2l0aCBpdHMgb3duIHZhbHVlcy4gRm9yIHVz
ZSBjYXNlcyB3aGVyZSBvbmUgd291bGQNCj4gd2FudCB0byBrZWVwIHRoZSBkZWZhdWx0IHZhbHVl
cywgd2Ugc2hvdWxkIG1ha2UgaXQgcG9zc2libGUgdG8gcHJldmVudA0KPiB0aGUgZHJpdmVyIGZy
b20gb3ZlcnJpZGluZyB0aGVtLiBXZSBjb3VsZCBhY2hpZXZlIHRoaXMgYnkgYWRkaW5nDQo+IG9w
dGlvbmFsIERUIHByb3BlcnRpZXMgZm9yIHRoZSBjdXN0b20gcGFyYW1ldGVycyBhbmQgaWYgdGhl
eSBhcmUgbm90DQo+IHByZXNlbnQsIGRlZmF1bHRzIHdvdWxkIGJlIHVzZWQuDQo+IA0KPiBEbyB5
b3UgdGhpbmsgdGhhdCBpcyBkb2FibGU/IFRoYW5rcyENCj4gDQo+IEJlc3QgcmVnYXJkcywNCj4g
VG9tYXN6DQoNCkZvciB0aGUgcmVuYW1pbmcsIEkgY2Fubm90IGFncmVlIHdpdGggeW91IG1vcmUu
DQpJIHdvdWxkIHRyeSB0byBhZGp1c3QgaXQgaW4gbmV4dCByZWxlYXNlLg0KDQpGb3IgYWN0dWF0
b3IgZHJpdmVyLCBpdCBzZWVtcyBvdXIgaW5pdGlhbCBpZGVhIGlzIHRoYXQgZHJpdmVyIHJlZ2lz
dGVycw0Kc2hvdWxkIGFsd2F5cyB1c2UgdGhlIGRlZmF1bHQgb3IgcmVzZXJ2ZWQgdmFsdWVzLg0K
SW5kZWVkLCBub3dhZGF5cyBsZW5zIGRyaXZlcnMgb24gdGhlIGNvbW11bml0eSBkb24ndCBoYXZl
IHN1Y2gNCmNvbmZpZ3VyYXRpb24gcmVnaXN0ZXJzLg0KQWxiZWl0IEkgZG9uJ3QgcXVpdGUgc3Vy
ZSB3aGV0aGVyIGl0IGlzIHJlYXNvbmFibGUgZm9yIHRoaXMgc3VtbWFyeS4NCg0KQXMgeW91IGRp
c2N1c3NlZCwgZm9yIHRoZSBjdXJyZW50IGtlcm5lbCwgaXQgd291bGQgYmUgbmljZSB0byBrZWVw
IHRoZQ0Kc2FtZSB3aXRoIHRoZSB0cmFkaXRpb25hbCBzdHlsZS4NCg0K

