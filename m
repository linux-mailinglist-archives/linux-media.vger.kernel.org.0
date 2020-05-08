Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B4B171CA17D
	for <lists+linux-media@lfdr.de>; Fri,  8 May 2020 05:29:22 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726767AbgEHD3V (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 7 May 2020 23:29:21 -0400
Received: from mailgw02.mediatek.com ([1.203.163.81]:1160 "EHLO
        mailgw02.mediatek.com" rhost-flags-OK-FAIL-OK-FAIL) by vger.kernel.org
        with ESMTP id S1726661AbgEHD3U (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Thu, 7 May 2020 23:29:20 -0400
X-UUID: b5541d3237224ddf99342840c4f8bd8e-20200508
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
        h=Content-Transfer-Encoding:MIME-Version:Content-Type:References:In-Reply-To:Date:CC:To:From:Subject:Message-ID; bh=icQs5PDsZ+HS7pah9d3Y69qQhITqVAyFXAMdCV9xDH0=;
        b=JVpCOLuepmicZ7CBIH9hzfjhvoq7fRYxshR2rqieGCH8di9BTFZeltj87UdIEfQDPtLJYyx/7VdDBKNActnVPXY87+BO1BQ5A/QCEs6rIQxnQvgXuUVqAVnEnyp5kBRXqX8a3HFCivDMLt5XsEXo0l5XPQ6tSwuCT4YMe3CFGaA=;
X-UUID: b5541d3237224ddf99342840c4f8bd8e-20200508
Received: from mtkcas32.mediatek.inc [(172.27.4.253)] by mailgw02.mediatek.com
        (envelope-from <dongchun.zhu@mediatek.com>)
        (mailgw01.mediatek.com ESMTP with TLS)
        with ESMTP id 651244020; Fri, 08 May 2020 11:29:07 +0800
Received: from MTKCAS36.mediatek.inc (172.27.4.186) by MTKMBS31N1.mediatek.inc
 (172.27.4.69) with Microsoft SMTP Server (TLS) id 15.0.1497.2; Fri, 8 May
 2020 11:29:07 +0800
Received: from [10.17.3.153] (10.17.3.153) by MTKCAS36.mediatek.inc
 (172.27.4.170) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Fri, 8 May 2020 11:29:04 +0800
Message-ID: <1588908477.8804.201.camel@mhfsdcap03>
Subject: Re: [V5, 2/2] media: i2c: dw9768: Add DW9768 VCM driver
From:   Dongchun Zhu <dongchun.zhu@mediatek.com>
To:     Sakari Ailus <sakari.ailus@linux.intel.com>
CC:     Tomasz Figa <tfiga@chromium.org>,
        Linus Walleij <linus.walleij@linaro.org>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        <dongchun.zhu@mediatek.com>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Rob Herring <robh+dt@kernel.org>,
        "Mark Rutland" <mark.rutland@arm.com>,
        Nicolas Boichat <drinkcat@chromium.org>,
        Matthias Brugger <matthias.bgg@gmail.com>,
        Cao Bing Bu <bingbu.cao@intel.com>,
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
Date:   Fri, 8 May 2020 11:27:57 +0800
In-Reply-To: <20200507135959.GD9190@paasikivi.fi.intel.com>
References: <20200502161727.30463-1-dongchun.zhu@mediatek.com>
         <20200502161727.30463-3-dongchun.zhu@mediatek.com>
         <20200506151352.GZ9190@paasikivi.fi.intel.com>
         <1588855524.8804.168.camel@mhfsdcap03>
         <20200507131220.GC9190@paasikivi.fi.intel.com>
         <CAAFQd5DO9FGx9OF2RpcSprg0oLiVuS90w2qLAHCOSc3w6tKUWw@mail.gmail.com>
         <20200507135959.GD9190@paasikivi.fi.intel.com>
Content-Type: text/plain; charset="UTF-8"
X-Mailer: Evolution 3.10.4-0ubuntu2 
MIME-Version: 1.0
X-TM-SNTS-SMTP: B9B8DF3FDB241D7AE7B00BB849706813FFC5DFCAF7C46C704BD9235CB8F51AE52000:8
X-MTK:  N
Content-Transfer-Encoding: base64
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

SGkgU2FrYXJpLA0KDQpUaGFua3MgZm9yIHRoZSByZXZpZXcuDQoNCk9uIFRodSwgMjAyMC0wNS0w
NyBhdCAxNzowMCArMDMwMCwgU2FrYXJpIEFpbHVzIHdyb3RlOg0KPiBIaSBUb21hc3osDQo+IA0K
PiBPbiBUaHUsIE1heSAwNywgMjAyMCBhdCAwMzo0NjozMVBNICswMjAwLCBUb21hc3ogRmlnYSB3
cm90ZToNCj4gPiBIaSBTYWthcmksIERvbmdjaHVuLA0KPiA+IA0KPiA+IE9uIFRodSwgTWF5IDcs
IDIwMjAgYXQgMzoxMiBQTSBTYWthcmkgQWlsdXMNCj4gPiA8c2FrYXJpLmFpbHVzQGxpbnV4Lmlu
dGVsLmNvbT4gd3JvdGU6DQo+ID4gPg0KPiA+ID4gSEkgRG9uZ2NodW4sDQo+ID4gPg0KPiA+ID4g
T24gVGh1LCBNYXkgMDcsIDIwMjAgYXQgMDg6NDU6MjRQTSArMDgwMCwgRG9uZ2NodW4gWmh1IHdy
b3RlOg0KPiA+ID4gPiBIaSBTYWthcmksDQo+ID4gPiA+DQo+ID4gPiA+IFRoYW5rcyBmb3IgdGhl
IHJldmlldy4NCj4gPiA+ID4NCj4gPiA+ID4gT24gV2VkLCAyMDIwLTA1LTA2IGF0IDE4OjEzICsw
MzAwLCBTYWthcmkgQWlsdXMgd3JvdGU6DQo+ID4gPiA+ID4gSGkgRG9uZ2NodW4sDQo+ID4gPiA+
ID4NCj4gPiA+ID4gPiBPbiBTdW4sIE1heSAwMywgMjAyMCBhdCAxMjoxNzoyN0FNICswODAwLCBE
b25nY2h1biBaaHUgd3JvdGU6DQo+ID4gPiA+ID4gPiBBZGQgYSBWNEwyIHN1Yi1kZXZpY2UgZHJp
dmVyIGZvciBEVzk3Njggdm9pY2UgY29pbCBtb3RvciwgcHJvdmlkaW5nDQo+ID4gPiA+ID4gPiBj
b250cm9sIHRvIHNldCB0aGUgZGVzaXJlZCBmb2N1cyB2aWEgSUlDIHNlcmlhbCBpbnRlcmZhY2Uu
DQo+ID4gPiA+ID4gPg0KPiA+ID4gPiA+ID4gU2lnbmVkLW9mZi1ieTogRG9uZ2NodW4gWmh1IDxk
b25nY2h1bi56aHVAbWVkaWF0ZWsuY29tPg0KPiA+ID4gPiA+ID4gLS0tDQo+ID4gPiA+ID4gPiAg
TUFJTlRBSU5FUlMgICAgICAgICAgICAgICAgfCAgIDEgKw0KPiA+ID4gPiA+ID4gIGRyaXZlcnMv
bWVkaWEvaTJjL0tjb25maWcgIHwgIDExICsrDQo+ID4gPiA+ID4gPiAgZHJpdmVycy9tZWRpYS9p
MmMvTWFrZWZpbGUgfCAgIDEgKw0KPiA+ID4gPiA+ID4gIGRyaXZlcnMvbWVkaWEvaTJjL2R3OTc2
OC5jIHwgNDQwICsrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKw0K
PiA+ID4gPiA+ID4gIDQgZmlsZXMgY2hhbmdlZCwgNDUzIGluc2VydGlvbnMoKykNCj4gPiA+ID4g
PiA+ICBjcmVhdGUgbW9kZSAxMDA2NDQgZHJpdmVycy9tZWRpYS9pMmMvZHc5NzY4LmMNCj4gPiA+
ID4gPiA+DQo+ID4gPiA+ID4gPiBkaWZmIC0tZ2l0IGEvTUFJTlRBSU5FUlMgYi9NQUlOVEFJTkVS
Uw0KPiA+ID4gPiA+ID4gaW5kZXggOGQ3MmM0MS4uYzkyZGM5OSAxMDA2NDQNCj4gPiA+ID4gPiA+
IC0tLSBhL01BSU5UQUlORVJTDQo+ID4gPiA+ID4gPiArKysgYi9NQUlOVEFJTkVSUw0KPiA+ID4g
PiA+ID4gQEAgLTUxNTcsNiArNTE1Nyw3IEBAIEw6ICBsaW51eC1tZWRpYUB2Z2VyLmtlcm5lbC5v
cmcNCj4gPiA+ID4gPiA+ICBTOiAgICAgICBNYWludGFpbmVkDQo+ID4gPiA+ID4gPiAgVDogICAg
ICAgZ2l0IGdpdDovL2xpbnV4dHYub3JnL21lZGlhX3RyZWUuZ2l0DQo+ID4gPiA+ID4gPiAgRjog
ICAgICAgRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL21lZGlhL2kyYy9kb25nd29v
bixkdzk3NjgueWFtbA0KPiA+ID4gPiA+ID4gK0Y6ICAgICAgIGRyaXZlcnMvbWVkaWEvaTJjL2R3
OTc2OC5jDQo+ID4gPiA+ID4gPg0KPiA+ID4gPiA+ID4gIERPTkdXT09OIERXOTgwNyBMRU5TIFZP
SUNFIENPSUwgRFJJVkVSDQo+ID4gPiA+ID4gPiAgTTogICAgICAgU2FrYXJpIEFpbHVzIDxzYWth
cmkuYWlsdXNAbGludXguaW50ZWwuY29tPg0KPiA+ID4gPiA+ID4gZGlmZiAtLWdpdCBhL2RyaXZl
cnMvbWVkaWEvaTJjL0tjb25maWcgYi9kcml2ZXJzL21lZGlhL2kyYy9LY29uZmlnDQo+ID4gPiA+
ID4gPiBpbmRleCAxMjVkNTk2Li42YTNmOWRhIDEwMDY0NA0KPiA+ID4gPiA+ID4gLS0tIGEvZHJp
dmVycy9tZWRpYS9pMmMvS2NvbmZpZw0KPiA+ID4gPiA+ID4gKysrIGIvZHJpdmVycy9tZWRpYS9p
MmMvS2NvbmZpZw0KPiA+ID4gPiA+ID4gQEAgLTEwNDAsNiArMTA0MCwxNyBAQCBjb25maWcgVklE
RU9fRFc5NzE0DQo+ID4gPiA+ID4gPiAgICAgY2FwYWJpbGl0eS4gVGhpcyBpcyBkZXNpZ25lZCBm
b3IgbGluZWFyIGNvbnRyb2wgb2YNCj4gPiA+ID4gPiA+ICAgICB2b2ljZSBjb2lsIG1vdG9ycywg
Y29udHJvbGxlZCB2aWEgSTJDIHNlcmlhbCBpbnRlcmZhY2UuDQo+ID4gPiA+ID4gPg0KPiA+ID4g
PiA+ID4gK2NvbmZpZyBWSURFT19EVzk3NjgNCj4gPiA+ID4gPiA+ICsgdHJpc3RhdGUgIkRXOTc2
OCBsZW5zIHZvaWNlIGNvaWwgc3VwcG9ydCINCj4gPiA+ID4gPiA+ICsgZGVwZW5kcyBvbiBJMkMg
JiYgVklERU9fVjRMMiAmJiBNRURJQV9DT05UUk9MTEVSDQo+ID4gPiA+ID4gPiArIGRlcGVuZHMg
b24gVklERU9fVjRMMl9TVUJERVZfQVBJDQo+ID4gPiA+ID4NCj4gPiA+ID4gPiBQbGVhc2UgY2hl
Y2sgaG93IHRoaXMgd29ya3MgaW4gdGhlIG1lZGlhIHRyZWUgbWFzdGVyIGJyYW5jaCBub3cgLS0t
IGl0J3MNCj4gPiA+ID4gPiBsYXJnZWx5IHNlbGVjdCBiYXNlZC4NCj4gPiA+ID4gPg0KPiA+ID4g
Pg0KPiA+ID4gPiBUaGUgYWN0dWF0b3IgZHJpdmVyIHVzZXMgc29tZSBzdHJ1Y3R1cmVzIHRoYXQg
cmVxdWlyZSB0aGUNCj4gPiA+ID4gVklERU9fVjRMMl9TVUJERVZfQVBJIGNvZGUsIHNvIGhlcmUg
d2UgYWRkIFZJREVPX1Y0TDJfU1VCREVWX0FQSQ0KPiA+ID4gPiBkZXBlbmRlbmN5IHRvIGF2b2lk
IHBvc3NpYmxlIGJ1aWxkIGVycm9yIHdoZW4gaXQncyBub3QgZW5hYmxlZC4NCj4gPiA+DQo+ID4g
PiBQbGVhc2UgbWFrZSBzdXJlIHRoaXMgd29ya3Mgd2l0aCBjdXJyZW50IG1lZGlhIHRyZWUgbWFz
dGVyLiBSaWdodCBub3cgaXQNCj4gPiA+IGRvZXMgbm90Lg0KPiA+ID4NCj4gPiANCj4gPiBEb25n
Y2h1biwgYXMgU2FrYXJpIHNhaWQsIHBsZWFzZSBtYWtlIHN1cmUgdG8gYmFzZSB0aGUgcGF0Y2hl
cyBvbiB0aGUNCj4gPiBtYXN0ZXIgYnJhbmNoIG9mIHRoZSBtZWRpYSB0cmVlLg0KPiA+IChodHRw
czovL2dpdC5saW51eHR2Lm9yZy9tZWRpYV90cmVlLmdpdC8pLiBUaGUgYXBwcm9hY2ggZm9yIEtj
b25maWcNCj4gPiBkZXBlbmRlbmN5IHNlbGVjdGlvbiB0aGVyZSBzZWVtcyB0byBoYXZlIGNoYW5n
ZWQgcmVjZW50bHkuDQo+ID4gDQo+ID4gPiA+DQo+ID4gPiA+ID4gSW4gZ2VuZXJhbCB0aGUgcGF0
Y2ggc2VlbXMgZmluZSB0byBtZSwgYnV0IHBsZWFzZSBzZWUgdGhlIG90aGVyIGNvbW1lbnRzDQo+
ID4gPiA+ID4gYmVsb3csIHRvby4NCj4gPiA+ID4gPg0KPiA+ID4gPiA+ID4gKyBkZXBlbmRzIG9u
IFBNDQo+ID4gPiA+ID4gPiArIGhlbHANCj4gPiA+ID4gPiA+ICsgICBUaGlzIGlzIGEgZHJpdmVy
IGZvciB0aGUgRFc5NzY4IGNhbWVyYSBsZW5zIHZvaWNlIGNvaWwuDQo+ID4gPiA+ID4gPiArICAg
RFc5NzY4IGlzIGEgMTAgYml0IERBQyB3aXRoIDEwMG1BIG91dHB1dCBjdXJyZW50IHNpbmsNCj4g
PiA+ID4gPiA+ICsgICBjYXBhYmlsaXR5LiBUaGlzIGlzIGRlc2lnbmVkIGZvciBsaW5lYXIgY29u
dHJvbCBvZg0KPiA+ID4gPiA+ID4gKyAgIHZvaWNlIGNvaWwgbW90b3JzLCBjb250cm9sbGVkIHZp
YSBJMkMgc2VyaWFsIGludGVyZmFjZS4NCj4gPiA+ID4gPiA+ICsNCj4gPiA+ID4gPiA+ICBjb25m
aWcgVklERU9fRFc5ODA3X1ZDTQ0KPiA+ID4gPiA+ID4gICB0cmlzdGF0ZSAiRFc5ODA3IGxlbnMg
dm9pY2UgY29pbCBzdXBwb3J0Ig0KPiA+ID4gPiA+ID4gICBkZXBlbmRzIG9uIEkyQyAmJiBWSURF
T19WNEwyICYmIE1FRElBX0NPTlRST0xMRVINCj4gPiA+ID4gPiA+IGRpZmYgLS1naXQgYS9kcml2
ZXJzL21lZGlhL2kyYy9NYWtlZmlsZSBiL2RyaXZlcnMvbWVkaWEvaTJjL01ha2VmaWxlDQo+ID4g
PiA+ID4gPiBpbmRleCA3N2JmN2QwLi40MDU3NDc2IDEwMDY0NA0KPiA+ID4gPiA+ID4gLS0tIGEv
ZHJpdmVycy9tZWRpYS9pMmMvTWFrZWZpbGUNCj4gPiA+ID4gPiA+ICsrKyBiL2RyaXZlcnMvbWVk
aWEvaTJjL01ha2VmaWxlDQo+ID4gPiA+ID4gPiBAQCAtMjQsNiArMjQsNyBAQCBvYmotJChDT05G
SUdfVklERU9fU0FBNjc1MkhTKSArPSBzYWE2NzUyaHMubw0KPiA+ID4gPiA+ID4gIG9iai0kKENP
TkZJR19WSURFT19BRDU4MjApICArPSBhZDU4MjAubw0KPiA+ID4gPiA+ID4gIG9iai0kKENPTkZJ
R19WSURFT19BSzczNzUpICArPSBhazczNzUubw0KPiA+ID4gPiA+ID4gIG9iai0kKENPTkZJR19W
SURFT19EVzk3MTQpICArPSBkdzk3MTQubw0KPiA+ID4gPiA+ID4gK29iai0kKENPTkZJR19WSURF
T19EVzk3NjgpICArPSBkdzk3Njgubw0KPiA+ID4gPiA+ID4gIG9iai0kKENPTkZJR19WSURFT19E
Vzk4MDdfVkNNKSAgKz0gZHc5ODA3LXZjbS5vDQo+ID4gPiA+ID4gPiAgb2JqLSQoQ09ORklHX1ZJ
REVPX0FEVjcxNzApICs9IGFkdjcxNzAubw0KPiA+ID4gPiA+ID4gIG9iai0kKENPTkZJR19WSURF
T19BRFY3MTc1KSArPSBhZHY3MTc1Lm8NCj4gPiA+ID4gPiA+IGRpZmYgLS1naXQgYS9kcml2ZXJz
L21lZGlhL2kyYy9kdzk3NjguYyBiL2RyaXZlcnMvbWVkaWEvaTJjL2R3OTc2OC5jDQo+ID4gPiA+
ID4gPiBuZXcgZmlsZSBtb2RlIDEwMDY0NA0KPiA+ID4gPiA+ID4gaW5kZXggMDAwMDAwMC4uZGQ2
ODUzNA0KPiA+ID4gPiA+ID4gLS0tIC9kZXYvbnVsbA0KPiA+ID4gPiA+ID4gKysrIGIvZHJpdmVy
cy9tZWRpYS9pMmMvZHc5NzY4LmMNCj4gPiA+ID4gPiA+IEBAIC0wLDAgKzEsNDQwIEBADQo+ID4g
PiA+ID4gPiArLy8gU1BEWC1MaWNlbnNlLUlkZW50aWZpZXI6IEdQTC0yLjANCj4gPiA+ID4gPiA+
ICsvLyBDb3B5cmlnaHQgKGMpIDIwMjAgTWVkaWFUZWsgSW5jLg0KPiA+ID4gPiA+ID4gKw0KPiA+
ID4gPiA+ID4gKyNpbmNsdWRlIDxsaW51eC9kZWxheS5oPg0KPiA+ID4gPiA+ID4gKyNpbmNsdWRl
IDxsaW51eC9pMmMuaD4NCj4gPiA+ID4gPiA+ICsjaW5jbHVkZSA8bGludXgvbW9kdWxlLmg+DQo+
ID4gPiA+ID4gPiArI2luY2x1ZGUgPGxpbnV4L3BtX3J1bnRpbWUuaD4NCj4gPiA+ID4gPiA+ICsj
aW5jbHVkZSA8bGludXgvcmVndWxhdG9yL2NvbnN1bWVyLmg+DQo+ID4gPiA+ID4gPiArI2luY2x1
ZGUgPG1lZGlhL3Y0bDItYXN5bmMuaD4NCj4gPiA+ID4gPiA+ICsjaW5jbHVkZSA8bWVkaWEvdjRs
Mi1jdHJscy5oPg0KPiA+ID4gPiA+ID4gKyNpbmNsdWRlIDxtZWRpYS92NGwyLWRldmljZS5oPg0K
PiA+ID4gPiA+ID4gKyNpbmNsdWRlIDxtZWRpYS92NGwyLXN1YmRldi5oPg0KPiA+ID4gPiA+ID4g
Kw0KPiA+ID4gPiA+ID4gKyNkZWZpbmUgRFc5NzY4X05BTUUgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAiZHc5NzY4Ig0KPiA+ID4gPiA+ID4gKyNkZWZpbmUgRFc5NzY4X01BWF9GT0NVU19Q
T1MgICAgICAgICAgICAgICAgICAgICAoMTAyNCAtIDEpDQo+ID4gPiA+ID4gPiArLyoNCj4gPiA+
ID4gPiA+ICsgKiBUaGlzIHNldHMgdGhlIG1pbmltdW0gZ3JhbnVsYXJpdHkgZm9yIHRoZSBmb2N1
cyBwb3NpdGlvbnMuDQo+ID4gPiA+ID4gPiArICogQSB2YWx1ZSBvZiAxIGdpdmVzIG1heGltdW0g
YWNjdXJhY3kgZm9yIGEgZGVzaXJlZCBmb2N1cyBwb3NpdGlvbg0KPiA+ID4gPiA+ID4gKyAqLw0K
PiA+ID4gPiA+ID4gKyNkZWZpbmUgRFc5NzY4X0ZPQ1VTX1NURVBTICAgICAgICAgICAgICAgICAg
ICAgICAxDQo+ID4gPiA+ID4gPiArDQo+ID4gPiA+ID4gPiArLyoNCj4gPiA+ID4gPiA+ICsgKiBS
aW5nIGNvbnRyb2wgYW5kIFBvd2VyIGNvbnRyb2wgcmVnaXN0ZXINCj4gPiA+ID4gPiA+ICsgKiBC
aXRbMV0gUklOR19FTg0KPiA+ID4gPiA+ID4gKyAqIDA6IERpcmVjdCBtb2RlDQo+ID4gPiA+ID4g
PiArICogMTogQUFDIG1vZGUgKHJpbmdpbmcgY29udHJvbCBtb2RlKQ0KPiA+ID4gPiA+ID4gKyAq
IEJpdFswXSBQRA0KPiA+ID4gPiA+ID4gKyAqIDA6IE5vcm1hbCBvcGVyYXRpb24gbW9kZQ0KPiA+
ID4gPiA+ID4gKyAqIDE6IFBvd2VyIGRvd24gbW9kZQ0KPiA+ID4gPiA+ID4gKyAqIERXOTc2OCBy
ZXF1aXJlcyB3YWl0aW5nIHRpbWUgb2YgVG9wciBhZnRlciBQRCByZXNldCB0YWtlcyBwbGFjZS4N
Cj4gPiA+ID4gPiA+ICsgKi8NCj4gPiA+ID4gPiA+ICsjZGVmaW5lIERXOTc2OF9SSU5HX1BEX0NP
TlRST0xfUkVHICAgICAgICAgICAgICAgMHgwMg0KPiA+ID4gPiA+ID4gKyNkZWZpbmUgRFc5NzY4
X1BEX01PREVfT0ZGICAgICAgICAgICAgICAgICAgICAgICAweDAwDQo+ID4gPiA+ID4gPiArI2Rl
ZmluZSBEVzk3NjhfUERfTU9ERV9FTiAgICAgICAgICAgICAgICAgICAgICAgIEJJVCgwKQ0KPiA+
ID4gPiA+ID4gKyNkZWZpbmUgRFc5NzY4X0FBQ19NT0RFX0VOICAgICAgICAgICAgICAgICAgICAg
ICBCSVQoMSkNCj4gPiA+ID4gPiA+ICsNCj4gPiA+ID4gPiA+ICsvKg0KPiA+ID4gPiA+ID4gKyAq
IERXOTc2OCBzZXBhcmF0ZXMgdHdvIHJlZ2lzdGVycyB0byBjb250cm9sIHRoZSBWQ00gcG9zaXRp
b24uDQo+ID4gPiA+ID4gPiArICogT25lIGZvciBNU0IgdmFsdWUsIGFub3RoZXIgaXMgTFNCIHZh
bHVlLg0KPiA+ID4gPiA+ID4gKyAqIERBQ19NU0I6IERbOTo4XSAoQUREOiAweDAzKQ0KPiA+ID4g
PiA+ID4gKyAqIERBQ19MU0I6IERbNzowXSAoQUREOiAweDA0KQ0KPiA+ID4gPiA+ID4gKyAqIERb
OTowXSBEQUMgZGF0YSBpbnB1dDogcG9zaXRpdmUgb3V0cHV0IGN1cnJlbnQgPSBEWzk6MF0gLyAx
MDIzICogMTAwW21BXQ0KPiA+ID4gPiA+ID4gKyAqLw0KPiA+ID4gPiA+ID4gKyNkZWZpbmUgRFc5
NzY4X01TQl9BRERSICAgICAgICAgICAgICAgICAgICAgICAgICAweDAzDQo+ID4gPiA+ID4gPiAr
I2RlZmluZSBEVzk3NjhfTFNCX0FERFIgICAgICAgICAgICAgICAgICAgICAgICAgIDB4MDQNCj4g
PiA+ID4gPiA+ICsjZGVmaW5lIERXOTc2OF9TVEFUVVNfQUREUiAgICAgICAgICAgICAgICAgICAg
ICAgMHgwNQ0KPiA+ID4gPiA+ID4gKw0KPiA+ID4gPiA+ID4gKy8qDQo+ID4gPiA+ID4gPiArICog
QUFDIG1vZGUgY29udHJvbCAmIHByZXNjYWxlIHJlZ2lzdGVyDQo+ID4gPiA+ID4gPiArICogQml0
Wzc6NV0gTmFtZWx5IEFDWzI6MF0sIGRlY2lkZSB0aGUgVkNNIG1vZGUgYW5kIG9wZXJhdGlvbiB0
aW1lLg0KPiA+ID4gPiA+ID4gKyAqIDAwMCBEaXJlY3QoZGVmYXVsdCkNCj4gPiA+ID4gPiA+ICsg
KiAwMDEgQUFDMiAwLjQ4eFR2aWINCj4gPiA+ID4gPiA+ICsgKiAwMTAgQUFDMyAwLjcweFR2aWIN
Cj4gPiA+ID4gPiA+ICsgKiAwMTEgQUFDNCAwLjc1eFR2aWINCj4gPiA+ID4gPiA+ICsgKiAxMDAg
UmVzZXJ2ZWQNCj4gPiA+ID4gPiA+ICsgKiAxMDEgQUFDOCAxLjEzeFR2aWINCj4gPiA+ID4gPiA+
ICsgKiAxMTAgUmVzZXJ2ZWQNCj4gPiA+ID4gPiA+ICsgKiAxMTEgUmVzZXJ2ZWQNCj4gPiA+ID4g
PiA+ICsgKiBCaXRbMjowXSBOYW1lbHkgUFJFU0NbMjowXSwgc2V0IHRoZSBpbnRlcm5hbCBjbG9j
ayBkaXZpZGluZyByYXRlIGFzIGZvbGxvdy4NCj4gPiA+ID4gPiA+ICsgKiAwMDAgMg0KPiA+ID4g
PiA+ID4gKyAqIDAwMSAxKGRlZmF1bHQpDQo+ID4gPiA+ID4gPiArICogMDEwIDEvMg0KPiA+ID4g
PiA+ID4gKyAqIDAxMSAxLzQNCj4gPiA+ID4gPiA+ICsgKiAxMDAgOA0KPiA+ID4gPiA+ID4gKyAq
IDEwMSA0DQo+ID4gPiA+ID4gPiArICogMTEwIFJlc2VydmVkDQo+ID4gPiA+ID4gPiArICogMTEx
IFJlc2VydmVkDQo+ID4gPiA+ID4gPiArICovDQo+ID4gPiA+ID4gPiArI2RlZmluZSBEVzk3Njhf
QUFDX1BSRVNDX1JFRyAgICAgICAgICAgICAgICAgICAgIDB4MDYNCj4gPiA+ID4gPiA+ICsjZGVm
aW5lIERXOTc2OF9BQUMzX1NFTEVDVF9ESVZJRElOR19SQVRFXzEgICAgICAgMHg0MQ0KPiA+ID4g
PiA+DQo+ID4gPiA+ID4gSSBndWVzcyB3ZSBjYW4gc3RhcnQgd2l0aCB0aGVzZSB2YWx1ZXMuIEJ1
dCBJIGNhbid0IHRoaW5rIG9mIGFub3RoZXIgb3B0aW9uDQo+ID4gPiA+ID4gdGhhbiBwdXR0aW5n
IHRoZW0gaW50byBEVCBpZiB0aGVyZSBhcmUgZGlmZmVyZW5jZXMgYmV0d2VlbiB3aGF0IGhhcmR3
YXJlDQo+ID4gPiA+ID4gcGxhdGZvcm1zIHJlcXVpcmUuDQo+ID4gPiA+ID4NCj4gPiA+ID4NCj4g
PiA+ID4gTGV0J3MgaGF2ZSBhIGRpc2N1c3Npb24gYWJvdXQgdGhpcy4NCj4gPiA+ID4gTm93IHRo
ZXNlIG5vbi1kZWZhdWx0IHJlZ2lzdGVyIHNldHRpbmdzIHJlcHJlc2VudCBvbmUgQUFDIG9wZXJh
dGlvbg0KPiA+ID4gPiBtb2RlLCB0aGlzIGlzIG9uZSBvcHRpb24gYW5kIHdvcmtzIGZvciBhIGdp
dmVuIGxlbnMgb3IgYSBtb2R1bGUuDQo+ID4gPiA+IElmIHNvbWV0aW1lIGluIHRoZSBmdXR1cmUg
aGFyZHdhcmUgcGxhdGZvcm1zIHJlcXVpcmUgYW5vdGhlciBkaWZmZXJlbnQNCj4gPiA+ID4gc2V0
dGluZ3MsIHRoZW4gRFQgcHJvcGVydGllcyBtYXkgbmVlZCB0byBiZSBjcmVhdGVkLg0KPiA+ID4N
Cj4gPiA+IElmIHRoZXNlIHZhbHVlcyBpbmRlZWQgYXJlIHNwZWNpZmljIHRvIGEgZ2l2ZW4gbGVu
cyAoYW5kIHByZXN1bWFibHkgYWxzbyBhDQo+ID4gPiBzcHJpbmcpLCB0aGVuIEknZCBwdXQgdGhl
bSB0byBEVCByaWdodCBub3cgLS0tIHdlIGRvbid0IGhhdmUgZHJpdmVycyBmb3INCj4gPiA+IHRo
ZXNlIGNvbXBvbmVudHMgdGhlIGRyaXZlcnMgb2Ygd2hpY2ggY291bGQgaG9sZCB0aGlzIGluZm9y
bWF0aW9uLCBub3IgaXQNCj4gPiA+IG1ha2VzIHNlbnNlIHRvIGFkZCB0aGVtIGp1c3QgZm9yIHRo
YXQuDQo+ID4gPg0KPiA+IA0KPiA+IEkgdGVuZCB0byBzdGF5IG9uIHRoZSBjb25zZXJ2YXRpdmUg
c2lkZSBhbmQgb25seSBhZGQgRFQgcHJvcGVydGllcw0KPiA+IG9uY2UgdGhlcmUgaXMgcmVhbGx5
IGEgbmVlZCB0byBkbyBzby4gUmlnaHQgbm93IHdlIGhhdmVuJ3Qgc2VlbiBhbnkNCj4gPiBzeXN0
ZW0gd2hpY2ggd291bGQgdXNlIGRpZmZlcmVudCB2YWx1ZXMgb2YgdGhlc2UgcGFyYW1ldGVycy4N
Cj4gDQo+IEkgdGhpbmsgaXQncyBhbHNvIGNvbnNlcnZhdGl2ZSB0byBwdXQgdGhpbmdzIHRoYXQg
YXJlIHN5c3RlbSBzcGVjaWZpYyB0bw0KPiBEVC4gOi0pDQo+IA0KPiBJbiBwcmFjdGljZSB3ZSBo
YXZlbid0IHB1dCBsZW5zIHNwZWNpZmljIHBhcmFtZXRlcnMgdG8gRFQgYmVmb3JlLCBidXQNCj4g
dGhhdCdzIGJlY2F1c2UgMSkgZGV2aWNlcyB0aGF0IG5lZWQgdGhlbSBhcmUgb2xkLCBhbmQgc28g
YXJlIHRoZSBkcml2ZXJzDQo+IGFuZCB0aGUgbWF0dGVyIHdhcyBub3QgcmVjb2duaXNlZCBhdCB0
aGUgdGltZSB0aGV5IHdlcmUgbWVyZ2VkIGFuZCAyKSBhIGxvdA0KPiBvZiBkZXZpY2VzIHRoZXNl
IGRheXMgZG9uJ3QgaGF2ZSBzdWNoIGNvbmZpZ3VyYXRpb24gcmVnaXN0ZXJzLg0KPiANCj4gVGhh
dCBzYWlkLCBJIGRvbid0IGhhdmUgYSBzdHJvbmcgb3BpbmlvbiBvbiB0aGlzIG9uZSwgYnV0IEkg
dGhpbmsgcHV0dGluZw0KPiB0aGlzIHRvIERUIHdvdWxkIGJlIGEgc2FmZXIgYmV0IGluIHRoZSBs
b25nIHJ1biBhcyB0aGlzIGlzIHNwZWNpZmljIHRvIHRoZQ0KPiBib2FyZCwgbm90IHRoZSBkZXZp
Y2UgaXRzZWxmLg0KPiANCg0KSW4gdGhlb3J5LCBsZW5zIHBhcmFtZXRlciBzZXR0aW5ncyB0ZW5k
IHRvIGJlIHNpbWlsYXIgYXMgc2Vuc29yIG1vZGUuDQpDdXJyZW50IHNldHRpbmdzIHNob3VsZCBi
ZSBjb21tb24gYW5kIGl0IGlzIG5vdCBib2FyZCBzcGVjaWZpYywNCmF0IGxlYXN0IGZvciBvdXIg
MiBwcm9qZWN0cy9ib2FyZHMgaW4gaGFuZC4NCg0KSW4gcHJhY3RpY2UsIGZvciBvbmUgc2V0IG9m
IGxlbnMgcGFyYW1ldGVycywgaXQgd291bGQgYmUgc29tZQ0KY29tcGxpY2F0ZWQgdG8gY3JlYXRl
IERUIHByb3BlcnRpZXMgYXMgdGhlIGRyaXZlciBpbmRlZWQgZG9lc24ndCB1c2UNCnZhcmlvdXMg
dmFsdWVzIG9mIHRoZXNlIHBhcmFtZXRlcnMuDQoNCg==

