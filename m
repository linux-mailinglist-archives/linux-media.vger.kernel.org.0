Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 826A71CBC71
	for <lists+linux-media@lfdr.de>; Sat,  9 May 2020 04:25:07 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728583AbgEICZF (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 8 May 2020 22:25:05 -0400
Received: from Mailgw01.mediatek.com ([1.203.163.78]:46730 "EHLO
        mailgw01.mediatek.com" rhost-flags-OK-FAIL-OK-FAIL) by vger.kernel.org
        with ESMTP id S1728158AbgEICZF (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Fri, 8 May 2020 22:25:05 -0400
X-UUID: 61921461918f4312bde53252be353eb5-20200509
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
        h=Content-Transfer-Encoding:MIME-Version:Content-Type:References:In-Reply-To:Date:CC:To:From:Subject:Message-ID; bh=e29juNg1HoLgK0xyBynVp9fscLLhjBSGEnzupie2VT4=;
        b=rhIBt31iLdtua2tySLIdKgbRcGoOVZ7Ou7vuN2PoLJXfmD1nM0gev8YqQYdZqTRZjzi/3JW88Yus9sbtBhdwBLD1vZSnC/t509jd7vi96Hl9wZfJ0b/QglHANm4SxeVCTOAKv6A1+6Y5jMKJagIJTQSMyBnyiOJqqSS5XZl8/7o=;
X-UUID: 61921461918f4312bde53252be353eb5-20200509
Received: from mtkcas32.mediatek.inc [(172.27.4.253)] by mailgw01.mediatek.com
        (envelope-from <dongchun.zhu@mediatek.com>)
        (mailgw01.mediatek.com ESMTP with TLS)
        with ESMTP id 198893934; Sat, 09 May 2020 10:25:01 +0800
Received: from MTKCAS36.mediatek.inc (172.27.4.186) by MTKMBS31DR.mediatek.inc
 (172.27.6.102) with Microsoft SMTP Server (TLS) id 15.0.1497.2; Sat, 9 May
 2020 10:24:55 +0800
Received: from [10.17.3.153] (10.17.3.153) by MTKCAS36.mediatek.inc
 (172.27.4.170) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Sat, 9 May 2020 10:24:54 +0800
Message-ID: <1588991026.8804.235.camel@mhfsdcap03>
Subject: Re: [V5, 2/2] media: i2c: dw9768: Add DW9768 VCM driver
From:   Dongchun Zhu <dongchun.zhu@mediatek.com>
To:     Sakari Ailus <sakari.ailus@linux.intel.com>
CC:     Tomasz Figa <tfiga@chromium.org>,
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
Date:   Sat, 9 May 2020 10:23:46 +0800
In-Reply-To: <20200508211319.GJ9190@paasikivi.fi.intel.com>
References: <20200502161727.30463-1-dongchun.zhu@mediatek.com>
         <20200502161727.30463-3-dongchun.zhu@mediatek.com>
         <20200506151352.GZ9190@paasikivi.fi.intel.com>
         <1588855524.8804.168.camel@mhfsdcap03>
         <20200507131220.GC9190@paasikivi.fi.intel.com>
         <CAAFQd5DO9FGx9OF2RpcSprg0oLiVuS90w2qLAHCOSc3w6tKUWw@mail.gmail.com>
         <1588907288.8804.188.camel@mhfsdcap03>
         <20200508211319.GJ9190@paasikivi.fi.intel.com>
Content-Type: text/plain; charset="UTF-8"
X-Mailer: Evolution 3.10.4-0ubuntu2 
MIME-Version: 1.0
X-TM-SNTS-SMTP: 3BBB81766EA864AEE615CDE2A4B27D9C91784377AC6494691DAE4A17F0C047FD2000:8
X-MTK:  N
Content-Transfer-Encoding: base64
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

SGkgU2FrYXJpLA0KDQpPbiBTYXQsIDIwMjAtMDUtMDkgYXQgMDA6MTMgKzAzMDAsIFNha2FyaSBB
aWx1cyB3cm90ZToNCj4gSGkgRG9uZ2NodW4sDQo+IA0KPiBPbiBGcmksIE1heSAwOCwgMjAyMCBh
dCAxMTowODowOEFNICswODAwLCBEb25nY2h1biBaaHUgd3JvdGU6DQo+ID4gSGkgU2FrYXJpLCBU
b21hc3osDQo+ID4gDQo+ID4gVGhhbmtzIGZvciB0aGUgcmV2aWV3Lg0KPiA+IA0KPiA+IE9uIFRo
dSwgMjAyMC0wNS0wNyBhdCAxNTo0NiArMDIwMCwgVG9tYXN6IEZpZ2Egd3JvdGU6DQo+ID4gPiBI
aSBTYWthcmksIERvbmdjaHVuLA0KPiA+ID4gDQo+ID4gPiBPbiBUaHUsIE1heSA3LCAyMDIwIGF0
IDM6MTIgUE0gU2FrYXJpIEFpbHVzDQo+ID4gPiA8c2FrYXJpLmFpbHVzQGxpbnV4LmludGVsLmNv
bT4gd3JvdGU6DQo+ID4gPiA+DQo+ID4gPiA+IEhJIERvbmdjaHVuLA0KPiA+ID4gPg0KPiA+ID4g
PiBPbiBUaHUsIE1heSAwNywgMjAyMCBhdCAwODo0NToyNFBNICswODAwLCBEb25nY2h1biBaaHUg
d3JvdGU6DQo+ID4gPiA+ID4gSGkgU2FrYXJpLA0KPiA+ID4gPiA+DQo+ID4gPiA+ID4gVGhhbmtz
IGZvciB0aGUgcmV2aWV3Lg0KPiA+ID4gPiA+DQo+ID4gPiA+ID4gT24gV2VkLCAyMDIwLTA1LTA2
IGF0IDE4OjEzICswMzAwLCBTYWthcmkgQWlsdXMgd3JvdGU6DQo+ID4gPiA+ID4gPiBIaSBEb25n
Y2h1biwNCj4gPiA+ID4gPiA+DQo+ID4gPiA+ID4gPiBPbiBTdW4sIE1heSAwMywgMjAyMCBhdCAx
MjoxNzoyN0FNICswODAwLCBEb25nY2h1biBaaHUgd3JvdGU6DQo+ID4gPiA+ID4gPiA+IEFkZCBh
IFY0TDIgc3ViLWRldmljZSBkcml2ZXIgZm9yIERXOTc2OCB2b2ljZSBjb2lsIG1vdG9yLCBwcm92
aWRpbmcNCj4gPiA+ID4gPiA+ID4gY29udHJvbCB0byBzZXQgdGhlIGRlc2lyZWQgZm9jdXMgdmlh
IElJQyBzZXJpYWwgaW50ZXJmYWNlLg0KPiA+ID4gPiA+ID4gPg0KPiA+ID4gPiA+ID4gPiBTaWdu
ZWQtb2ZmLWJ5OiBEb25nY2h1biBaaHUgPGRvbmdjaHVuLnpodUBtZWRpYXRlay5jb20+DQo+ID4g
PiA+ID4gPiA+IC0tLQ0KPiA+ID4gPiA+ID4gPiAgTUFJTlRBSU5FUlMgICAgICAgICAgICAgICAg
fCAgIDEgKw0KPiA+ID4gPiA+ID4gPiAgZHJpdmVycy9tZWRpYS9pMmMvS2NvbmZpZyAgfCAgMTEg
KysNCj4gPiA+ID4gPiA+ID4gIGRyaXZlcnMvbWVkaWEvaTJjL01ha2VmaWxlIHwgICAxICsNCj4g
PiA+ID4gPiA+ID4gIGRyaXZlcnMvbWVkaWEvaTJjL2R3OTc2OC5jIHwgNDQwICsrKysrKysrKysr
KysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKw0KPiA+ID4gPiA+ID4gPiAgNCBmaWxl
cyBjaGFuZ2VkLCA0NTMgaW5zZXJ0aW9ucygrKQ0KPiA+ID4gPiA+ID4gPiAgY3JlYXRlIG1vZGUg
MTAwNjQ0IGRyaXZlcnMvbWVkaWEvaTJjL2R3OTc2OC5jDQo+ID4gPiA+ID4gPiA+DQo+ID4gPiA+
ID4gPiA+IGRpZmYgLS1naXQgYS9NQUlOVEFJTkVSUyBiL01BSU5UQUlORVJTDQo+ID4gPiA+ID4g
PiA+IGluZGV4IDhkNzJjNDEuLmM5MmRjOTkgMTAwNjQ0DQo+ID4gPiA+ID4gPiA+IC0tLSBhL01B
SU5UQUlORVJTDQo+ID4gPiA+ID4gPiA+ICsrKyBiL01BSU5UQUlORVJTDQo+ID4gPiA+ID4gPiA+
IEBAIC01MTU3LDYgKzUxNTcsNyBAQCBMOiAgbGludXgtbWVkaWFAdmdlci5rZXJuZWwub3JnDQo+
ID4gPiA+ID4gPiA+ICBTOiAgICAgICBNYWludGFpbmVkDQo+ID4gPiA+ID4gPiA+ICBUOiAgICAg
ICBnaXQgZ2l0Oi8vbGludXh0di5vcmcvbWVkaWFfdHJlZS5naXQNCj4gPiA+ID4gPiA+ID4gIEY6
ICAgICAgIERvY3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy9tZWRpYS9pMmMvZG9uZ3dv
b24sZHc5NzY4LnlhbWwNCj4gPiA+ID4gPiA+ID4gK0Y6ICAgICAgIGRyaXZlcnMvbWVkaWEvaTJj
L2R3OTc2OC5jDQo+ID4gPiA+ID4gPiA+DQo+ID4gPiA+ID4gPiA+ICBET05HV09PTiBEVzk4MDcg
TEVOUyBWT0lDRSBDT0lMIERSSVZFUg0KPiA+ID4gPiA+ID4gPiAgTTogICAgICAgU2FrYXJpIEFp
bHVzIDxzYWthcmkuYWlsdXNAbGludXguaW50ZWwuY29tPg0KPiA+ID4gPiA+ID4gPiBkaWZmIC0t
Z2l0IGEvZHJpdmVycy9tZWRpYS9pMmMvS2NvbmZpZyBiL2RyaXZlcnMvbWVkaWEvaTJjL0tjb25m
aWcNCj4gPiA+ID4gPiA+ID4gaW5kZXggMTI1ZDU5Ni4uNmEzZjlkYSAxMDA2NDQNCj4gPiA+ID4g
PiA+ID4gLS0tIGEvZHJpdmVycy9tZWRpYS9pMmMvS2NvbmZpZw0KPiA+ID4gPiA+ID4gPiArKysg
Yi9kcml2ZXJzL21lZGlhL2kyYy9LY29uZmlnDQo+ID4gPiA+ID4gPiA+IEBAIC0xMDQwLDYgKzEw
NDAsMTcgQEAgY29uZmlnIFZJREVPX0RXOTcxNA0KPiA+ID4gPiA+ID4gPiAgICAgY2FwYWJpbGl0
eS4gVGhpcyBpcyBkZXNpZ25lZCBmb3IgbGluZWFyIGNvbnRyb2wgb2YNCj4gPiA+ID4gPiA+ID4g
ICAgIHZvaWNlIGNvaWwgbW90b3JzLCBjb250cm9sbGVkIHZpYSBJMkMgc2VyaWFsIGludGVyZmFj
ZS4NCj4gPiA+ID4gPiA+ID4NCj4gPiA+ID4gPiA+ID4gK2NvbmZpZyBWSURFT19EVzk3NjgNCj4g
PiA+ID4gPiA+ID4gKyB0cmlzdGF0ZSAiRFc5NzY4IGxlbnMgdm9pY2UgY29pbCBzdXBwb3J0Ig0K
PiA+ID4gPiA+ID4gPiArIGRlcGVuZHMgb24gSTJDICYmIFZJREVPX1Y0TDIgJiYgTUVESUFfQ09O
VFJPTExFUg0KPiA+ID4gPiA+ID4gPiArIGRlcGVuZHMgb24gVklERU9fVjRMMl9TVUJERVZfQVBJ
DQo+ID4gPiA+ID4gPg0KPiA+ID4gPiA+ID4gUGxlYXNlIGNoZWNrIGhvdyB0aGlzIHdvcmtzIGlu
IHRoZSBtZWRpYSB0cmVlIG1hc3RlciBicmFuY2ggbm93IC0tLSBpdCdzDQo+ID4gPiA+ID4gPiBs
YXJnZWx5IHNlbGVjdCBiYXNlZC4NCj4gPiA+ID4gPiA+DQo+ID4gPiA+ID4NCj4gPiA+ID4gPiBU
aGUgYWN0dWF0b3IgZHJpdmVyIHVzZXMgc29tZSBzdHJ1Y3R1cmVzIHRoYXQgcmVxdWlyZSB0aGUN
Cj4gPiA+ID4gPiBWSURFT19WNEwyX1NVQkRFVl9BUEkgY29kZSwgc28gaGVyZSB3ZSBhZGQgVklE
RU9fVjRMMl9TVUJERVZfQVBJDQo+ID4gPiA+ID4gZGVwZW5kZW5jeSB0byBhdm9pZCBwb3NzaWJs
ZSBidWlsZCBlcnJvciB3aGVuIGl0J3Mgbm90IGVuYWJsZWQuDQo+ID4gPiA+DQo+ID4gPiA+IFBs
ZWFzZSBtYWtlIHN1cmUgdGhpcyB3b3JrcyB3aXRoIGN1cnJlbnQgbWVkaWEgdHJlZSBtYXN0ZXIu
IFJpZ2h0IG5vdyBpdA0KPiA+ID4gPiBkb2VzIG5vdC4NCj4gPiA+ID4NCj4gPiA+IA0KPiA+ID4g
RG9uZ2NodW4sIGFzIFNha2FyaSBzYWlkLCBwbGVhc2UgbWFrZSBzdXJlIHRvIGJhc2UgdGhlIHBh
dGNoZXMgb24gdGhlDQo+ID4gPiBtYXN0ZXIgYnJhbmNoIG9mIHRoZSBtZWRpYSB0cmVlLg0KPiA+
ID4gKGh0dHBzOi8vZ2l0LmxpbnV4dHYub3JnL21lZGlhX3RyZWUuZ2l0LykuIFRoZSBhcHByb2Fj
aCBmb3IgS2NvbmZpZw0KPiA+ID4gZGVwZW5kZW5jeSBzZWxlY3Rpb24gdGhlcmUgc2VlbXMgdG8g
aGF2ZSBjaGFuZ2VkIHJlY2VudGx5Lg0KPiA+ID4gDQo+ID4gDQo+ID4gSSBzZWFyY2hlZCB0aGUg
cGF0Y2hlcyBvbiB0aGUgbWVkaWEgdHJlZSBtYXN0ZXIgYnJhbmNoLg0KPiA+IEl0IHNlZW1zIHRo
YXQgd2UgbmVlZCB0byByZW1vdmUgdGhlIFZJREVPX1Y0TDJfU1VCREVWX0FQSSBkZXBlbmRlbmN5
IGluDQo+ID4gS2NvbmZpZywgYW5kIGFkZCAjaWZkZWYgQ09ORklHX1ZJREVPX1Y0TDJfU1VCREVW
X0FQSSB0byBpbmNsdWRlDQo+ID4gdjRsMi1zdWJkZXYgY29kZS4NCj4gPiBUaGUgY2hhbmdlIG1h
aW5seSBpcyB0byBtYWtlIGJ1aWxkIHBhc3MsIGFuZCBkb24ndCByZXR1cm4gRU5PVFRZIGlmDQo+
ID4gU1VCREVWX0FQSSBpcyBub3Qgc2V0Lg0KPiA+IEFtIEkgcmlnaHQ/DQo+IA0KPiBQbGVhc2Ug
c2VlIEtjb25maWcgZW50cmllcyBmb3Igb3RoZXIgc2ltaWxhciBkcml2ZXJzIGZyb20gRG9uZ3dv
b24uDQo+IA0KDQpTb3JyeSBmb3IgdGhlIG1pc3Rha2UgOi0pDQpKdXN0IGZvdW5kIHRoZSBjdXJy
ZW50IG1lZGlhIHRyZWUgbWFzdGVyIGJyYW5jaCBjb2RlLi4uDQpJIHdvdWxkIHVwZGF0ZSBLY29u
ZmlnIGVudHJpZXMgaW4gbmV4dCByZWxlYXNlIGJ5IHJlZmVycmluZyB0bzoNCmh0dHBzOi8vZ2l0
LmxpbnV4dHYub3JnL21lZGlhX3RyZWUuZ2l0L3RyZWUvZHJpdmVycy9tZWRpYS9pMmMvS2NvbmZp
Zw0KDQouLi4NCg0K

