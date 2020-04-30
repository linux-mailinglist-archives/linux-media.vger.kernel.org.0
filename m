Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 9C49E1BF526
	for <lists+linux-media@lfdr.de>; Thu, 30 Apr 2020 12:17:06 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726453AbgD3KRE (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 30 Apr 2020 06:17:04 -0400
Received: from Mailgw01.mediatek.com ([1.203.163.78]:63405 "EHLO
        mailgw01.mediatek.com" rhost-flags-OK-FAIL-OK-FAIL) by vger.kernel.org
        with ESMTP id S1726378AbgD3KRE (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 30 Apr 2020 06:17:04 -0400
X-UUID: 3fcaca0f1e134d52ab68661276f759cf-20200430
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
        h=Content-Transfer-Encoding:MIME-Version:Content-Type:References:In-Reply-To:Date:CC:To:From:Subject:Message-ID; bh=dRI9ChXKuMqabw/Te/cPQ+2PCrlGqt8wQrXGse9Am54=;
        b=EGr+XO0qReMFErflrv371vcvEDNSs4jLeXT0a9sL3hyJ6u7XrEzjAJ7YPsMBaRm8FuwgyammSfGmLwjhLU7rds1lkGVDTtN6ij3COeBmi7Rupv73pj8C/qMDFYbzllFrekpikbkdc7ocCXpL8Lq4dxKf4oW2GGKknlUAZdabWtM=;
X-UUID: 3fcaca0f1e134d52ab68661276f759cf-20200430
Received: from mtkcas34.mediatek.inc [(172.27.4.253)] by mailgw01.mediatek.com
        (envelope-from <dongchun.zhu@mediatek.com>)
        (mailgw01.mediatek.com ESMTP with TLS)
        with ESMTP id 310151531; Thu, 30 Apr 2020 18:16:45 +0800
Received: from MTKCAS36.mediatek.inc (172.27.4.186) by MTKMBS31N2.mediatek.inc
 (172.27.4.87) with Microsoft SMTP Server (TLS) id 15.0.1497.2; Thu, 30 Apr
 2020 18:16:43 +0800
Received: from [10.17.3.153] (10.17.3.153) by MTKCAS36.mediatek.inc
 (172.27.4.170) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Thu, 30 Apr 2020 18:16:43 +0800
Message-ID: <1588241753.8804.111.camel@mhfsdcap03>
Subject: Re: [V4, 2/2] media: i2c: Add DW9768 VCM driver
From:   Dongchun Zhu <dongchun.zhu@mediatek.com>
To:     Sakari Ailus <sakari.ailus@linux.intel.com>
CC:     <mchehab@kernel.org>, <andriy.shevchenko@linux.intel.com>,
        <robh+dt@kernel.org>, <mark.rutland@arm.com>,
        <drinkcat@chromium.org>, <tfiga@chromium.org>,
        <matthias.bgg@gmail.com>, <bingbu.cao@intel.com>,
        <srv_heupstream@mediatek.com>,
        <linux-mediatek@lists.infradead.org>,
        <linux-arm-kernel@lists.infradead.org>, <sj.huang@mediatek.com>,
        <linux-media@vger.kernel.org>, <devicetree@vger.kernel.org>,
        <louis.kuo@mediatek.com>, <shengnan.wang@mediatek.com>,
        <dongchun.zhu@mediatek.com>
Date:   Thu, 30 Apr 2020 18:15:53 +0800
In-Reply-To: <20200402123217.GD1522@kekkonen.localdomain>
References: <20200330123634.363-1-dongchun.zhu@mediatek.com>
         <20200330123634.363-3-dongchun.zhu@mediatek.com>
         <20200402123217.GD1522@kekkonen.localdomain>
Content-Type: text/plain; charset="UTF-8"
X-Mailer: Evolution 3.10.4-0ubuntu2 
MIME-Version: 1.0
X-TM-SNTS-SMTP: FE32C874FE2F4E7100536658B951B76480D18269800CC85DA929D5E4D6B2B6202000:8
X-MTK:  N
Content-Transfer-Encoding: base64
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

SGkgU2FrYXJpLA0KDQpUaGFua3MgZm9yIHRoZSByZXZpZXcuDQoNCk9uIFRodSwgMjAyMC0wNC0w
MiBhdCAxNTozMiArMDMwMCwgU2FrYXJpIEFpbHVzIHdyb3RlOg0KPiBIaSBEb25nY2h1biwNCj4g
DQo+IE9uIE1vbiwgTWFyIDMwLCAyMDIwIGF0IDA4OjM2OjM0UE0gKzA4MDAsIERvbmdjaHVuIFpo
dSB3cm90ZToNCj4gPiBUaGlzIHBhdGNoIGFkZHMgYSBWNEwyIHN1Yi1kZXZpY2UgZHJpdmVyIGZv
ciBEVzk3Njggdm9pY2UgY29pbCBtb3RlciwNCj4gPiBwcm92aWRpbmcgY29udHJvbCB0byBzZXQg
dGhlIGRlc2lyZWQgZm9jdXMgdmlhIEkyQyBzZXJpYWwgaW50ZXJmYWNlLg0KPiA+IA0KPiA+IFNp
Z25lZC1vZmYtYnk6IERvbmdjaHVuIFpodSA8ZG9uZ2NodW4uemh1QG1lZGlhdGVrLmNvbT4NCj4g
PiAtLS0NCj4gPiAgTUFJTlRBSU5FUlMgICAgICAgICAgICAgICAgfCAgIDEgKw0KPiA+ICBkcml2
ZXJzL21lZGlhL2kyYy9LY29uZmlnICB8ICAxMSArKw0KPiA+ICBkcml2ZXJzL21lZGlhL2kyYy9N
YWtlZmlsZSB8ICAgMSArDQo+ID4gIGRyaXZlcnMvbWVkaWEvaTJjL2R3OTc2OC5jIHwgNDMyICsr
KysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKw0KPiA+ICA0IGZpbGVz
IGNoYW5nZWQsIDQ0NSBpbnNlcnRpb25zKCspDQo+ID4gIGNyZWF0ZSBtb2RlIDEwMDY0NCBkcml2
ZXJzL21lZGlhL2kyYy9kdzk3NjguYw0KPiA+IA0KPiA+IGRpZmYgLS1naXQgYS9NQUlOVEFJTkVS
UyBiL01BSU5UQUlORVJTDQo+ID4gaW5kZXggNWUxMjRkMi4uZTAwN2ExYiAxMDA2NDQNCj4gPiAt
LS0gYS9NQUlOVEFJTkVSUw0KPiA+ICsrKyBiL01BSU5UQUlORVJTDQo+ID4gQEAgLTUxNDAsNiAr
NTE0MCw3IEBAIEw6CWxpbnV4LW1lZGlhQHZnZXIua2VybmVsLm9yZw0KPiA+ICBTOglNYWludGFp
bmVkDQo+ID4gIFQ6CWdpdCBnaXQ6Ly9saW51eHR2Lm9yZy9tZWRpYV90cmVlLmdpdA0KPiA+ICBG
OglEb2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3MvbWVkaWEvaTJjL2Rvbmd3b29uLGR3
OTc2OC55YW1sDQo+ID4gK0Y6CWRyaXZlcnMvbWVkaWEvaTJjL2R3OTc2OC5jDQo+ID4gIA0KPiA+
ICBET05HV09PTiBEVzk4MDcgTEVOUyBWT0lDRSBDT0lMIERSSVZFUg0KPiA+ICBNOglTYWthcmkg
QWlsdXMgPHNha2FyaS5haWx1c0BsaW51eC5pbnRlbC5jb20+DQo+ID4gZGlmZiAtLWdpdCBhL2Ry
aXZlcnMvbWVkaWEvaTJjL0tjb25maWcgYi9kcml2ZXJzL21lZGlhL2kyYy9LY29uZmlnDQo+ID4g
aW5kZXggYzY4ZTAwMi4uYjc1OWQzZCAxMDA2NDQNCj4gPiAtLS0gYS9kcml2ZXJzL21lZGlhL2ky
Yy9LY29uZmlnDQo+ID4gKysrIGIvZHJpdmVycy9tZWRpYS9pMmMvS2NvbmZpZw0KPiA+IEBAIC0x
MDI0LDYgKzEwMjQsMTcgQEAgY29uZmlnIFZJREVPX0RXOTcxNA0KPiA+ICAJICBjYXBhYmlsaXR5
LiBUaGlzIGlzIGRlc2lnbmVkIGZvciBsaW5lYXIgY29udHJvbCBvZg0KPiA+ICAJICB2b2ljZSBj
b2lsIG1vdG9ycywgY29udHJvbGxlZCB2aWEgSTJDIHNlcmlhbCBpbnRlcmZhY2UuDQo+ID4gIA0K
PiA+ICtjb25maWcgVklERU9fRFc5NzY4DQo+ID4gKwl0cmlzdGF0ZSAiRFc5NzY4IGxlbnMgdm9p
Y2UgY29pbCBzdXBwb3J0Ig0KPiA+ICsJZGVwZW5kcyBvbiBJMkMgJiYgVklERU9fVjRMMiAmJiBN
RURJQV9DT05UUk9MTEVSDQo+ID4gKwlkZXBlbmRzIG9uIFZJREVPX1Y0TDJfU1VCREVWX0FQSQ0K
PiA+ICsJZGVwZW5kcyBvbiBQTQ0KPiA+ICsJaGVscA0KPiA+ICsJICBUaGlzIGlzIGEgZHJpdmVy
IGZvciB0aGUgRFc5NzY4IGNhbWVyYSBsZW5zIHZvaWNlIGNvaWwuDQo+ID4gKwkgIERXOTc2OCBp
cyBhIDEwIGJpdCBEQUMgd2l0aCAxMDBtQSBvdXRwdXQgY3VycmVudCBzaW5rDQo+ID4gKwkgIGNh
cGFiaWxpdHkuIFRoaXMgaXMgZGVzaWduZWQgZm9yIGxpbmVhciBjb250cm9sIG9mDQo+ID4gKwkg
IHZvaWNlIGNvaWwgbW90b3JzLCBjb250cm9sbGVkIHZpYSBJMkMgc2VyaWFsIGludGVyZmFjZS4N
Cj4gPiArDQo+ID4gIGNvbmZpZyBWSURFT19EVzk4MDdfVkNNDQo+ID4gIAl0cmlzdGF0ZSAiRFc5
ODA3IGxlbnMgdm9pY2UgY29pbCBzdXBwb3J0Ig0KPiA+ICAJZGVwZW5kcyBvbiBJMkMgJiYgVklE
RU9fVjRMMiAmJiBNRURJQV9DT05UUk9MTEVSDQo+ID4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvbWVk
aWEvaTJjL01ha2VmaWxlIGIvZHJpdmVycy9tZWRpYS9pMmMvTWFrZWZpbGUNCj4gPiBpbmRleCBj
MTQ3YmI5Li5lYzk0NDM0IDEwMDY0NA0KPiA+IC0tLSBhL2RyaXZlcnMvbWVkaWEvaTJjL01ha2Vm
aWxlDQo+ID4gKysrIGIvZHJpdmVycy9tZWRpYS9pMmMvTWFrZWZpbGUNCj4gPiBAQCAtMjQsNiAr
MjQsNyBAQCBvYmotJChDT05GSUdfVklERU9fU0FBNjc1MkhTKSArPSBzYWE2NzUyaHMubw0KPiA+
ICBvYmotJChDT05GSUdfVklERU9fQUQ1ODIwKSAgKz0gYWQ1ODIwLm8NCj4gPiAgb2JqLSQoQ09O
RklHX1ZJREVPX0FLNzM3NSkgICs9IGFrNzM3NS5vDQo+ID4gIG9iai0kKENPTkZJR19WSURFT19E
Vzk3MTQpICArPSBkdzk3MTQubw0KPiA+ICtvYmotJChDT05GSUdfVklERU9fRFc5NzY4KSAgKz0g
ZHc5NzY4Lm8NCj4gPiAgb2JqLSQoQ09ORklHX1ZJREVPX0RXOTgwN19WQ00pICArPSBkdzk4MDct
dmNtLm8NCj4gPiAgb2JqLSQoQ09ORklHX1ZJREVPX0FEVjcxNzApICs9IGFkdjcxNzAubw0KPiA+
ICBvYmotJChDT05GSUdfVklERU9fQURWNzE3NSkgKz0gYWR2NzE3NS5vDQo+ID4gZGlmZiAtLWdp
dCBhL2RyaXZlcnMvbWVkaWEvaTJjL2R3OTc2OC5jIGIvZHJpdmVycy9tZWRpYS9pMmMvZHc5NzY4
LmMNCj4gPiBuZXcgZmlsZSBtb2RlIDEwMDY0NA0KPiA+IGluZGV4IDAwMDAwMDAuLmY2M2FmYTEN
Cj4gPiAtLS0gL2Rldi9udWxsDQo+ID4gKysrIGIvZHJpdmVycy9tZWRpYS9pMmMvZHc5NzY4LmMN
Cj4gPiBAQCAtMCwwICsxLDQzMiBAQA0KPiA+ICsvLyBTUERYLUxpY2Vuc2UtSWRlbnRpZmllcjog
R1BMLTIuMA0KPiA+ICsvLyBDb3B5cmlnaHQgKGMpIDIwMjAgTWVkaWFUZWsgSW5jLg0KPiA+ICsN
Cj4gPiArI2luY2x1ZGUgPGxpbnV4L2RlbGF5Lmg+DQo+ID4gKyNpbmNsdWRlIDxsaW51eC9pMmMu
aD4NCj4gPiArI2luY2x1ZGUgPGxpbnV4L21vZHVsZS5oPg0KPiA+ICsjaW5jbHVkZSA8bGludXgv
cG1fcnVudGltZS5oPg0KPiA+ICsjaW5jbHVkZSA8bGludXgvcmVndWxhdG9yL2NvbnN1bWVyLmg+
DQo+ID4gKyNpbmNsdWRlIDxtZWRpYS92NGwyLWFzeW5jLmg+DQo+ID4gKyNpbmNsdWRlIDxtZWRp
YS92NGwyLWN0cmxzLmg+DQo+ID4gKyNpbmNsdWRlIDxtZWRpYS92NGwyLWRldmljZS5oPg0KPiA+
ICsjaW5jbHVkZSA8bWVkaWEvdjRsMi1zdWJkZXYuaD4NCj4gPiArDQo+ID4gKyNkZWZpbmUgRFc5
NzY4X05BTUUJCQkJImR3OTc2OCINCj4gPiArI2RlZmluZSBEVzk3NjhfTUFYX0ZPQ1VTX1BPUwkJ
CSgxMDI0IC0gMSkNCj4gPiArLyoNCj4gPiArICogVGhpcyBzZXRzIHRoZSBtaW5pbXVtIGdyYW51
bGFyaXR5IGZvciB0aGUgZm9jdXMgcG9zaXRpb25zLg0KPiA+ICsgKiBBIHZhbHVlIG9mIDEgZ2l2
ZXMgbWF4aW11bSBhY2N1cmFjeSBmb3IgYSBkZXNpcmVkIGZvY3VzIHBvc2l0aW9uDQo+ID4gKyAq
Lw0KPiA+ICsjZGVmaW5lIERXOTc2OF9GT0NVU19TVEVQUwkJCTENCj4gPiArDQo+ID4gKy8qDQo+
ID4gKyAqIFJpbmcgY29udHJvbCBhbmQgUG93ZXIgY29udHJvbCByZWdpc3Rlcg0KPiA+ICsgKiBC
aXRbMV0gUklOR19FTg0KPiA+ICsgKiAwOiBEaXJlY3QgbW9kZQ0KPiA+ICsgKiAxOiBBQUMgbW9k
ZSAocmluZ2luZyBjb250cm9sIG1vZGUpDQo+ID4gKyAqIEJpdFswXSBQRA0KPiA+ICsgKiAwOiBO
b3JtYWwgb3BlcmF0aW9uIG1vZGUNCj4gPiArICogMTogUG93ZXIgZG93biBtb2RlDQo+ID4gKyAq
IERXOTc2OCByZXF1aXJlcyB3YWl0aW5nIHRpbWUgb2YgVG9wciBhZnRlciBQRCByZXNldCB0YWtl
cyBwbGFjZS4NCj4gPiArICovDQo+ID4gKyNkZWZpbmUgRFc5NzY4X1JJTkdfUERfQ09OVFJPTF9S
RUcJCTB4MDINCj4gPiArI2RlZmluZSBEVzk3NjhfUERfTU9ERV9PRkYJCQkweDAwDQo+ID4gKyNk
ZWZpbmUgRFc5NzY4X1BEX01PREVfRU4JCQlCSVQoMCkNCj4gPiArI2RlZmluZSBEVzk3NjhfQUFD
X01PREVfRU4JCQlCSVQoMSkNCj4gPiArDQo+ID4gKy8qDQo+ID4gKyAqIERXOTc2OCBzZXBhcmF0
ZXMgdHdvIHJlZ2lzdGVycyB0byBjb250cm9sIHRoZSBWQ00gcG9zaXRpb24uDQo+ID4gKyAqIE9u
ZSBmb3IgTVNCIHZhbHVlLCBhbm90aGVyIGlzIExTQiB2YWx1ZS4NCj4gPiArICogREFDX01TQjog
RFs5OjhdIChBREQ6IDB4MDMpDQo+ID4gKyAqIERBQ19MU0I6IERbNzowXSAoQUREOiAweDA0KQ0K
PiA+ICsgKiBEWzk6MF0gREFDIGRhdGEgaW5wdXQ6IHBvc2l0aXZlIG91dHB1dCBjdXJyZW50ID0g
RFs5OjBdIC8gMTAyMyAqIDEwMFttQV0NCj4gPiArICovDQo+ID4gKyNkZWZpbmUgRFc5NzY4X01T
Ql9BRERSCQkJCTB4MDMNCj4gPiArI2RlZmluZSBEVzk3NjhfTFNCX0FERFIJCQkJMHgwNA0KPiA+
ICsjZGVmaW5lIERXOTc2OF9TVEFUVVNfQUREUgkJCTB4MDUNCj4gPiArDQo+ID4gKy8qDQo+ID4g
KyAqIEFBQyBtb2RlIGNvbnRyb2wgJiBwcmVzY2FsZSByZWdpc3Rlcg0KPiA+ICsgKiBCaXRbNzo1
XSBOYW1lbHkgQUNbMjowXSwgZGVjaWRlIHRoZSBWQ00gbW9kZSBhbmQgb3BlcmF0aW9uIHRpbWUu
DQo+ID4gKyAqIDAwMCBEaXJlY3QoZGVmYXVsdCkNCj4gPiArICogMDAxIEFBQzIgMC40OHhUdmli
DQo+ID4gKyAqIDAxMCBBQUMzIDAuNzB4VHZpYg0KPiA+ICsgKiAwMTEgQUFDNCAwLjc1eFR2aWIN
Cj4gPiArICogMTAwIFJlc2VydmVkDQo+ID4gKyAqIDEwMSBBQUM4IDEuMTN4VHZpYg0KPiA+ICsg
KiAxMTAgUmVzZXJ2ZWQNCj4gPiArICogMTExIFJlc2VydmVkDQo+ID4gKyAqIEJpdFsyOjBdIE5h
bWVseSBQUkVTQ1syOjBdLCBzZXQgdGhlIGludGVybmFsIGNsb2NrIGRpdmlkaW5nIHJhdGUgYXMg
Zm9sbG93Lg0KPiA+ICsgKiAwMDAgMg0KPiA+ICsgKiAwMDEgMShkZWZhdWx0KQ0KPiA+ICsgKiAw
MTAgMS8yDQo+ID4gKyAqIDAxMSAxLzQNCj4gPiArICogMTAwIDgNCj4gPiArICogMTAxIDQNCj4g
PiArICogMTEwIFJlc2VydmVkDQo+ID4gKyAqIDExMSBSZXNlcnZlZA0KPiA+ICsgKi8NCj4gPiAr
I2RlZmluZSBEVzk3NjhfQUFDX1BSRVNDX1JFRwkJCTB4MDYNCj4gPiArI2RlZmluZSBEVzk3Njhf
QUFDM19TRUxFQ1RfRElWSURJTkdfUkFURV8xCTB4NDENCj4gPiArDQo+ID4gKy8qDQo+ID4gKyAq
IFZDTSBwZXJpb2Qgb2YgdmlicmF0aW9uIHJlZ2lzdGVyDQo+ID4gKyAqIEJpdFs1OjBdIERlZmlu
ZWQgYXMgVkNNIHJpc2luZyBwZXJpb2RpYyB0aW1lIChUdmliKSB0b2dldGhlciB3aXRoIFBSRVND
WzI6MF0NCj4gPiArICogVHZpYiA9ICg2LjNtcyArIEFBQ1RbNTowXSAqIDAuMW1zKSAqIERpdmlk
aW5nIFJhdGUNCj4gPiArICogRGl2aWRpbmcgUmF0ZSBpcyB0aGUgaW50ZXJuYWwgY2xvY2sgZGl2
aWRpbmcgcmF0ZSB0aGF0IGlzIGRlZmluZWQgYXQNCj4gPiArICogUFJFU0NBTEUgcmVnaXN0ZXIg
KEFERDogMHgwNikNCj4gPiArICovDQo+ID4gKyNkZWZpbmUgRFc5NzY4X0FBQ19USU1FX1JFRwkJ
CTB4MDcNCj4gPiArI2RlZmluZSBEVzk3NjhfQUFDVF9DTlQJCQkJMHgzOQ0KPiA+ICsNCj4gPiAr
LyoNCj4gPiArICogRFc5NzY4IHJlcXVpcmVzIHdhaXRpbmcgdGltZSAoZGVsYXkgdGltZSkgb2Yg
dF9PUFIgYWZ0ZXIgcG93ZXItdXAsDQo+ID4gKyAqIG9yIGluIHRoZSBjYXNlIG9mIFBEIHJlc2V0
IHRha2luZyBwbGFjZS4NCj4gPiArICovDQo+ID4gKyNkZWZpbmUgRFc5NzY4X1RfT1BSX1VTCQkJ
CTEwMDANCj4gPiArDQo+ID4gKy8qDQo+ID4gKyAqIFRoaXMgYWN0cyBhcyB0aGUgbWluaW11bSBn
cmFudWxhcml0eSBvZiBsZW5zIG1vdmVtZW50Lg0KPiA+ICsgKiBLZWVwIHRoaXMgdmFsdWUgcG93
ZXIgb2YgMiwgc28gdGhlIGNvbnRyb2wgc3RlcHMgY2FuIGJlDQo+ID4gKyAqIHVuaWZvcm1seSBh
ZGp1c3RlZCBmb3IgZ3JhZHVhbCBsZW5zIG1vdmVtZW50LCB3aXRoIGRlc2lyZWQNCj4gPiArICog
bnVtYmVyIG9mIGNvbnRyb2wgc3RlcHMuDQo+ID4gKyAqLw0KPiA+ICsjZGVmaW5lIERXOTc2OF9N
T1ZFX1NURVBTCQkJMTYNCj4gPiArDQo+ID4gKy8qDQo+ID4gKyAqIERXOTc2OF9BQUNfUFJFU0Nf
UkVHICYgRFc5NzY4X0FBQ19USU1FX1JFRyBkZXRlcm1pbmUgVkNNIG9wZXJhdGlvbiB0aW1lLg0K
PiA+ICsgKiBJZiBEVzk3NjhfQUFDX1BSRVNDX1JFRyBpcyAweDQxLCBhbmQgRFc5NzY4X0FBQ19U
SU1FX1JFRyBpcyAweDM5LCBWQ00gbW9kZQ0KPiA+ICsgKiB3b3VsZCBiZSBBQUMzLCBPcGVyYXRp
b24gVGltZSB3b3VsZCBiZSAwLjcweFR2aWIsIHRoYXQgaXMgOC40MG1zLg0KPiA+ICsgKi8NCj4g
PiArI2RlZmluZSBEVzk3NjhfTU9WRV9ERUxBWV9VUwkJCTg0MDANCj4gPiArI2RlZmluZSBEVzk3
NjhfU1RBQkxFX1RJTUVfVVMJCQkyMDAwMA0KPiA+ICsNCj4gPiArc3RhdGljIGNvbnN0IGNoYXIg
KiBjb25zdCBkdzk3Njhfc3VwcGx5X25hbWVzW10gPSB7DQo+ID4gKwkidmluIiwJLyogSTJDIEkv
TyBpbnRlcmZhY2UgcG93ZXIgKi8NCj4gPiArCSJ2ZGQiLAkvKiBWQ00gcG93ZXIgKi8NCj4gPiAr
fTsNCj4gPiArDQo+ID4gKy8qIGR3OTc2OCBkZXZpY2Ugc3RydWN0dXJlICovDQo+ID4gK3N0cnVj
dCBkdzk3Njggew0KPiA+ICsJc3RydWN0IHJlZ3VsYXRvcl9idWxrX2RhdGEgc3VwcGxpZXNbQVJS
QVlfU0laRShkdzk3Njhfc3VwcGx5X25hbWVzKV07DQo+ID4gKwlzdHJ1Y3QgdjRsMl9jdHJsX2hh
bmRsZXIgY3RybHM7DQo+ID4gKwlzdHJ1Y3QgdjRsMl9jdHJsICpmb2N1czsNCj4gPiArCXN0cnVj
dCB2NGwyX3N1YmRldiBzZDsNCj4gPiArfTsNCj4gPiArDQo+ID4gK3N0YXRpYyBpbmxpbmUgc3Ry
dWN0IGR3OTc2OCAqdG9fZHc5NzY4KHN0cnVjdCB2NGwyX2N0cmwgKmN0cmwpDQo+ID4gK3sNCj4g
PiArCXJldHVybiBjb250YWluZXJfb2YoY3RybC0+aGFuZGxlciwgc3RydWN0IGR3OTc2OCwgY3Ry
bHMpOw0KPiA+ICt9DQo+ID4gKw0KPiA+ICtzdGF0aWMgaW5saW5lIHN0cnVjdCBkdzk3NjggKnNk
X3RvX2R3OTc2OChzdHJ1Y3QgdjRsMl9zdWJkZXYgKnN1YmRldikNCj4gPiArew0KPiA+ICsJcmV0
dXJuIGNvbnRhaW5lcl9vZihzdWJkZXYsIHN0cnVjdCBkdzk3NjgsIHNkKTsNCj4gPiArfQ0KPiA+
ICsNCj4gPiArc3RydWN0IHJlZ3ZhbF9saXN0IHsNCj4gPiArCXU4IHJlZ19udW07DQo+ID4gKwl1
OCB2YWx1ZTsNCj4gPiArfTsNCj4gPiArDQo+ID4gK3N0YXRpYyBjb25zdCBzdHJ1Y3QgcmVndmFs
X2xpc3QgZHc5NzY4X2luaXRfcmVnc1tdID0gew0KPiA+ICsJe0RXOTc2OF9SSU5HX1BEX0NPTlRS
T0xfUkVHLCBEVzk3NjhfQUFDX01PREVfRU59LA0KPiA+ICsJe0RXOTc2OF9BQUNfUFJFU0NfUkVH
LCBEVzk3NjhfQUFDM19TRUxFQ1RfRElWSURJTkdfUkFURV8xfSwNCj4gPiArCXtEVzk3NjhfQUFD
X1RJTUVfUkVHLCBEVzk3NjhfQUFDVF9DTlR9LA0KPiANCj4gQXBvbG9naWVzIGZvciBtaXNzaW5n
IHRvIGZvbGxvdyB0aGUgZWFybGllciBkaXNjdXNzaW9uIHJlbGF0ZWQgdG8gdGhpcy4NCj4gDQo+
IEkgd29uZGVyIGlmIHRoZXNlIHZhbHVlcyBhcmUgc3BlY2lmaWMgdG8gYSBnaXZlbiBsZW5zIG9y
IGEgbW9kdWxlLg0KPiBQcmVzdW1hYmx5IHNvLCBhcyB0aGV5J3JlIGNoYW5nZWQgZnJvbSB0aGUg
ZGVmYXVsdHMuDQo+IA0KPiBJbiB0aGF0IGNhc2UgSSdkIHB1dCB0aGVtIHRvIERULg0KPiANCg0K
VGhlIGVhcmxpZXIgZGlzY3Vzc2lvbiByZWxhdGVkIHRvIHRoaXMgY291bGQgYmUgZm91bmQgaGVy
ZToNCmh0dHBzOi8vbG9yZS5rZXJuZWwub3JnL2xpbnV4LW1lZGlhLzE1ODQ1MjY4MjQuNTc4MS41
Ni5jYW1lbEBtaGZzZGNhcDAzLw0KDQpGb3Igb25lIHNwZWNpZmljIGRyaXZlciwgdGhlIHJlZ2lz
dGVyIHNldHRpbmdzIGFyZSBzdXBwb3NlZCB0byBiZQ0KYWRqdXN0ZWQgYWNjb3JkaW5nIHRvIGhh
cmR3YXJlIHNwZWNpZmljYXRpb24gb3IgdmVuZG9yJ3Mgc3VnZ2VzdGlvbi4NCg0KTGlrZSBPVjg4
NTYsIHdlIGFsc28gbmVlZCB0byBzZXQgc2VyaWVzIG9mIHJlZ2lzdGVycyBieSBjaGFuZ2luZyB0
aGUNCmRlZmF1bHQgdmFsdWVzLg0KDQpQZXJzb25hbGx5IERUIHByb3BlcnRpZXMgbWF5IG5lZWQg
dG8gYmUgY3JlYXRlZCBvbmNlIGEgbmV3IGJvYXJkDQpyZXF1aXJlcyBkaWZmZXJlbnQgdmFsdWVz
Lg0KDQpXaGF0IGRvIHlvdSB0aGluaz8NCg0KPiA+ICt9Ow0KPiA+ICsNCj4gPiArc3RhdGljIGlu
dCBkdzk3Njhfd3JpdGVfYXJyYXkoc3RydWN0IGR3OTc2OCAqZHc5NzY4LA0KPiA+ICsJCQkgICAg
ICBjb25zdCBzdHJ1Y3QgcmVndmFsX2xpc3QgKnZhbHMsIHNpemVfdCBsZW4pDQo+ID4gK3sNCj4g
PiArCXN0cnVjdCBpMmNfY2xpZW50ICpjbGllbnQgPSB2NGwyX2dldF9zdWJkZXZkYXRhKCZkdzk3
NjgtPnNkKTsNCj4gPiArCXVuc2lnbmVkIGludCBpOw0KPiA+ICsJaW50IHJldDsNCj4gPiArDQo+
ID4gKwlmb3IgKGkgPSAwOyBpIDwgbGVuOyBpKyspIHsNCj4gPiArCQlyZXQgPSBpMmNfc21idXNf
d3JpdGVfYnl0ZV9kYXRhKGNsaWVudCwgdmFsc1tpXS5yZWdfbnVtLA0KPiA+ICsJCQkJCQl2YWxz
W2ldLnZhbHVlKTsNCj4gPiArCQlpZiAocmV0IDwgMCkNCj4gPiArCQkJcmV0dXJuIHJldDsNCj4g
PiArCX0NCj4gPiArCXJldHVybiAwOw0KPiA+ICt9DQo+ID4gKw0KPiA+ICtzdGF0aWMgaW50IGR3
OTc2OF9zZXRfZGFjKHN0cnVjdCBkdzk3NjggKmR3OTc2OCwgdTE2IHZhbCkNCj4gPiArew0KPiA+
ICsJc3RydWN0IGkyY19jbGllbnQgKmNsaWVudCA9IHY0bDJfZ2V0X3N1YmRldmRhdGEoJmR3OTc2
OC0+c2QpOw0KPiA+ICsNCj4gPiArCS8qIFdyaXRlIFZDTSBwb3NpdGlvbiB0byByZWdpc3RlcnMg
Ki8NCj4gPiArCXJldHVybiBpMmNfc21idXNfd3JpdGVfd29yZF9zd2FwcGVkKGNsaWVudCwgRFc5
NzY4X01TQl9BRERSLCB2YWwpOw0KPiA+ICt9DQo+ID4gKw0KPiA+ICtzdGF0aWMgaW50IGR3OTc2
OF9pbml0KHN0cnVjdCBkdzk3NjggKmR3OTc2OCkNCj4gPiArew0KPiA+ICsJc3RydWN0IGkyY19j
bGllbnQgKmNsaWVudCA9IHY0bDJfZ2V0X3N1YmRldmRhdGEoJmR3OTc2OC0+c2QpOw0KPiA+ICsJ
aW50IHJldCwgdmFsOw0KPiA+ICsNCj4gPiArCS8qIFJlc2V0IERXOTc2OF9SSU5HX1BEX0NPTlRS
T0xfUkVHIHRvIGRlZmF1bHQgc3RhdHVzIDB4MDAgKi8NCj4gPiArCXJldCA9IGkyY19zbWJ1c193
cml0ZV9ieXRlX2RhdGEoY2xpZW50LCBEVzk3NjhfUklOR19QRF9DT05UUk9MX1JFRywNCj4gPiAr
CQkJCQlEVzk3NjhfUERfTU9ERV9PRkYpOw0KPiA+ICsJaWYgKHJldCA8IDApDQo+ID4gKwkJcmV0
dXJuIHJldDsNCj4gPiArDQo+ID4gKwkvKg0KPiA+ICsJICogRFc5NzY5IHJlcXVpcmVzIHdhaXRp
bmcgZGVsYXkgdGltZSBvZiB0X09QUg0KPiA+ICsJICogYWZ0ZXIgUEQgcmVzZXQgdGFrZXMgcGxh
Y2UuDQo+ID4gKwkgKi8NCj4gPiArCXVzbGVlcF9yYW5nZShEVzk3NjhfVF9PUFJfVVMsIERXOTc2
OF9UX09QUl9VUyArIDEwMCk7DQo+ID4gKw0KPiA+ICsJcmV0ID0gZHc5NzY4X3dyaXRlX2FycmF5
KGR3OTc2OCwgZHc5NzY4X2luaXRfcmVncywNCj4gPiArCQkJCSBBUlJBWV9TSVpFKGR3OTc2OF9p
bml0X3JlZ3MpKTsNCj4gPiArCWlmIChyZXQpDQo+ID4gKwkJcmV0dXJuIHJldDsNCj4gPiArDQo+
ID4gKwlmb3IgKHZhbCA9IGR3OTc2OC0+Zm9jdXMtPnZhbCAlIERXOTc2OF9NT1ZFX1NURVBTOw0K
PiA+ICsJICAgICB2YWwgPD0gZHc5NzY4LT5mb2N1cy0+dmFsOw0KPiA+ICsJICAgICB2YWwgKz0g
RFc5NzY4X01PVkVfU1RFUFMpIHsNCj4gPiArCQlyZXQgPSBkdzk3Njhfc2V0X2RhYyhkdzk3Njgs
IHZhbCk7DQo+ID4gKwkJaWYgKHJldCkgew0KPiA+ICsJCQlkZXZfZXJyKCZjbGllbnQtPmRldiwg
IkkyQyB3cml0ZSBmYWlsOiAlZCIsIHJldCk7DQo+ID4gKwkJCXJldHVybiByZXQ7DQo+ID4gKwkJ
fQ0KPiA+ICsJCXVzbGVlcF9yYW5nZShEVzk3NjhfTU9WRV9ERUxBWV9VUywgRFc5NzY4X01PVkVf
REVMQVlfVVMgKyAxMDAwKTsNCj4gPiArCX0NCj4gPiArDQo+ID4gKwlyZXR1cm4gMDsNCj4gPiAr
fQ0KPiA+ICsNCj4gPiArc3RhdGljIGludCBkdzk3NjhfcmVsZWFzZShzdHJ1Y3QgZHc5NzY4ICpk
dzk3NjgpDQo+ID4gK3sNCj4gPiArCXN0cnVjdCBpMmNfY2xpZW50ICpjbGllbnQgPSB2NGwyX2dl
dF9zdWJkZXZkYXRhKCZkdzk3NjgtPnNkKTsNCj4gPiArCWludCByZXQsIHZhbDsNCj4gPiArDQo+
ID4gKwl2YWwgPSByb3VuZF9kb3duKGR3OTc2OC0+Zm9jdXMtPnZhbCwgRFc5NzY4X01PVkVfU1RF
UFMpOw0KPiA+ICsJZm9yICggOyB2YWwgPj0gMDsgdmFsIC09IERXOTc2OF9NT1ZFX1NURVBTKSB7
DQo+ID4gKwkJcmV0ID0gZHc5NzY4X3NldF9kYWMoZHc5NzY4LCB2YWwpOw0KPiA+ICsJCWlmIChy
ZXQpIHsNCj4gPiArCQkJZGV2X2VycigmY2xpZW50LT5kZXYsICJJMkMgd3JpdGUgZmFpbDogJWQi
LCByZXQpOw0KPiA+ICsJCQlyZXR1cm4gcmV0Ow0KPiA+ICsJCX0NCj4gPiArCQl1c2xlZXBfcmFu
Z2UoRFc5NzY4X01PVkVfREVMQVlfVVMsIERXOTc2OF9NT1ZFX0RFTEFZX1VTICsgMTAwMCk7DQo+
ID4gKwl9DQo+ID4gKw0KPiA+ICsJLyoNCj4gPiArCSAqIFdhaXQgZm9yIHRoZSBtb3RvciB0byBz
dGFiaWxpemUgYWZ0ZXIgdGhlIGxhc3QgbW92ZW1lbnQNCj4gPiArCSAqIHRvIHByZXZlbnQgdGhl
IG1vdG9yIGZyb20gc2hha2luZy4NCj4gPiArCSAqLw0KPiA+ICsJdXNsZWVwX3JhbmdlKERXOTc2
OF9TVEFCTEVfVElNRV9VUyAtIERXOTc2OF9NT1ZFX0RFTEFZX1VTLA0KPiA+ICsJCSAgICAgRFc5
NzY4X1NUQUJMRV9USU1FX1VTIC0gRFc5NzY4X01PVkVfREVMQVlfVVMgKyAxMDAwKTsNCj4gPiAr
DQo+ID4gKwlyZXQgPSBpMmNfc21idXNfd3JpdGVfYnl0ZV9kYXRhKGNsaWVudCwgRFc5NzY4X1JJ
TkdfUERfQ09OVFJPTF9SRUcsDQo+ID4gKwkJCQkJRFc5NzY4X1BEX01PREVfRU4pOw0KPiA+ICsJ
aWYgKHJldCA8IDApDQo+ID4gKwkJcmV0dXJuIHJldDsNCj4gPiArDQo+ID4gKwkvKg0KPiA+ICsJ
ICogRFc5NzY5IHJlcXVpcmVzIHdhaXRpbmcgZGVsYXkgdGltZSBvZiB0X09QUg0KPiA+ICsJICog
YWZ0ZXIgUEQgcmVzZXQgdGFrZXMgcGxhY2UuDQo+ID4gKwkgKi8NCj4gPiArCXVzbGVlcF9yYW5n
ZShEVzk3NjhfVF9PUFJfVVMsIERXOTc2OF9UX09QUl9VUyArIDEwMCk7DQo+ID4gKw0KPiA+ICsJ
cmV0dXJuIDA7DQo+ID4gK30NCj4gPiArDQo+ID4gK3N0YXRpYyBpbnQgX19tYXliZV91bnVzZWQg
ZHc5NzY4X3J1bnRpbWVfc3VzcGVuZChzdHJ1Y3QgZGV2aWNlICpkZXYpDQo+ID4gK3sNCj4gPiAr
CXN0cnVjdCBpMmNfY2xpZW50ICpjbGllbnQgPSB0b19pMmNfY2xpZW50KGRldik7DQo+ID4gKwlz
dHJ1Y3QgdjRsMl9zdWJkZXYgKnNkID0gaTJjX2dldF9jbGllbnRkYXRhKGNsaWVudCk7DQo+ID4g
KwlzdHJ1Y3QgZHc5NzY4ICpkdzk3NjggPSBzZF90b19kdzk3Njgoc2QpOw0KPiA+ICsNCj4gPiAr
CWR3OTc2OF9yZWxlYXNlKGR3OTc2OCk7DQo+ID4gKwlyZWd1bGF0b3JfYnVsa19kaXNhYmxlKEFS
UkFZX1NJWkUoZHc5NzY4X3N1cHBseV9uYW1lcyksDQo+ID4gKwkJCSAgICAgICBkdzk3NjgtPnN1
cHBsaWVzKTsNCj4gPiArDQo+ID4gKwlyZXR1cm4gMDsNCj4gPiArfQ0KPiA+ICsNCj4gPiArc3Rh
dGljIGludCBfX21heWJlX3VudXNlZCBkdzk3NjhfcnVudGltZV9yZXN1bWUoc3RydWN0IGRldmlj
ZSAqZGV2KQ0KPiA+ICt7DQo+ID4gKwlzdHJ1Y3QgaTJjX2NsaWVudCAqY2xpZW50ID0gdG9faTJj
X2NsaWVudChkZXYpOw0KPiA+ICsJc3RydWN0IHY0bDJfc3ViZGV2ICpzZCA9IGkyY19nZXRfY2xp
ZW50ZGF0YShjbGllbnQpOw0KPiA+ICsJc3RydWN0IGR3OTc2OCAqZHc5NzY4ID0gc2RfdG9fZHc5
NzY4KHNkKTsNCj4gPiArCWludCByZXQ7DQo+ID4gKw0KPiA+ICsJcmV0ID0gcmVndWxhdG9yX2J1
bGtfZW5hYmxlKEFSUkFZX1NJWkUoZHc5NzY4X3N1cHBseV9uYW1lcyksDQo+ID4gKwkJCQkgICAg
ZHc5NzY4LT5zdXBwbGllcyk7DQo+ID4gKwlpZiAocmV0IDwgMCkgew0KPiA+ICsJCWRldl9lcnIo
ZGV2LCAiZmFpbGVkIHRvIGVuYWJsZSByZWd1bGF0b3JzXG4iKTsNCj4gPiArCQlyZXR1cm4gcmV0
Ow0KPiA+ICsJfQ0KPiA+ICsNCj4gPiArCS8qDQo+ID4gKwkgKiBUaGUgZGF0YXNoZWV0IHJlZmVy
cyB0byB0X09QUiB0aGF0IG5lZWRzIHRvIGJlIHdhaXRlZCBiZWZvcmUgc2VuZGluZw0KPiA+ICsJ
ICogSTJDIGNvbW1hbmRzIGFmdGVyIHBvd2VyLXVwLg0KPiA+ICsJICovDQo+ID4gKwl1c2xlZXBf
cmFuZ2UoRFc5NzY4X1RfT1BSX1VTLCBEVzk3NjhfVF9PUFJfVVMgKyAxMDApOw0KPiA+ICsNCj4g
PiArCXJldCA9IGR3OTc2OF9pbml0KGR3OTc2OCk7DQo+ID4gKwlpZiAocmV0IDwgMCkNCj4gPiAr
CQlnb3RvIGRpc2FibGVfcmVndWxhdG9yOw0KPiA+ICsNCj4gPiArCXJldHVybiAwOw0KPiA+ICsN
Cj4gPiArZGlzYWJsZV9yZWd1bGF0b3I6DQo+ID4gKwlyZWd1bGF0b3JfYnVsa19kaXNhYmxlKEFS
UkFZX1NJWkUoZHc5NzY4X3N1cHBseV9uYW1lcyksDQo+ID4gKwkJCSAgICAgICBkdzk3NjgtPnN1
cHBsaWVzKTsNCj4gPiArDQo+ID4gKwlyZXR1cm4gcmV0Ow0KPiA+ICt9DQo+ID4gKw0KPiA+ICtz
dGF0aWMgaW50IGR3OTc2OF9zZXRfY3RybChzdHJ1Y3QgdjRsMl9jdHJsICpjdHJsKQ0KPiA+ICt7
DQo+ID4gKwlzdHJ1Y3QgZHc5NzY4ICpkdzk3NjggPSB0b19kdzk3NjgoY3RybCk7DQo+ID4gKw0K
PiA+ICsJaWYgKGN0cmwtPmlkID09IFY0TDJfQ0lEX0ZPQ1VTX0FCU09MVVRFKQ0KPiA+ICsJCXJl
dHVybiBkdzk3Njhfc2V0X2RhYyhkdzk3NjgsIGN0cmwtPnZhbCk7DQo+ID4gKw0KPiA+ICsJcmV0
dXJuIDA7DQo+ID4gK30NCj4gPiArDQo+ID4gK3N0YXRpYyBjb25zdCBzdHJ1Y3QgdjRsMl9jdHJs
X29wcyBkdzk3NjhfY3RybF9vcHMgPSB7DQo+ID4gKwkuc19jdHJsID0gZHc5NzY4X3NldF9jdHJs
LA0KPiA+ICt9Ow0KPiA+ICsNCj4gPiArc3RhdGljIGludCBkdzk3Njhfb3BlbihzdHJ1Y3QgdjRs
Ml9zdWJkZXYgKnNkLCBzdHJ1Y3QgdjRsMl9zdWJkZXZfZmggKmZoKQ0KPiA+ICt7DQo+ID4gKwlp
bnQgcmV0Ow0KPiA+ICsNCj4gPiArCXJldCA9IHBtX3J1bnRpbWVfZ2V0X3N5bmMoc2QtPmRldik7
DQo+ID4gKwlpZiAocmV0IDwgMCkgew0KPiA+ICsJCXBtX3J1bnRpbWVfcHV0X25vaWRsZShzZC0+
ZGV2KTsNCj4gPiArCQlyZXR1cm4gcmV0Ow0KPiA+ICsJfQ0KPiA+ICsNCj4gPiArCXJldHVybiAw
Ow0KPiA+ICt9DQo+ID4gKw0KPiA+ICtzdGF0aWMgaW50IGR3OTc2OF9jbG9zZShzdHJ1Y3QgdjRs
Ml9zdWJkZXYgKnNkLCBzdHJ1Y3QgdjRsMl9zdWJkZXZfZmggKmZoKQ0KPiA+ICt7DQo+ID4gKwlw
bV9ydW50aW1lX3B1dChzZC0+ZGV2KTsNCj4gPiArDQo+ID4gKwlyZXR1cm4gMDsNCj4gPiArfQ0K
PiA+ICsNCj4gPiArc3RhdGljIGNvbnN0IHN0cnVjdCB2NGwyX3N1YmRldl9pbnRlcm5hbF9vcHMg
ZHc5NzY4X2ludF9vcHMgPSB7DQo+ID4gKwkub3BlbiA9IGR3OTc2OF9vcGVuLA0KPiA+ICsJLmNs
b3NlID0gZHc5NzY4X2Nsb3NlLA0KPiA+ICt9Ow0KPiA+ICsNCj4gPiArc3RhdGljIGNvbnN0IHN0
cnVjdCB2NGwyX3N1YmRldl9vcHMgZHc5NzY4X29wcyA9IHsgfTsNCj4gPiArDQo+ID4gK3N0YXRp
YyBpbnQgZHc5NzY4X2luaXRfY29udHJvbHMoc3RydWN0IGR3OTc2OCAqZHc5NzY4KQ0KPiA+ICt7
DQo+ID4gKwlzdHJ1Y3QgdjRsMl9jdHJsX2hhbmRsZXIgKmhkbCA9ICZkdzk3NjgtPmN0cmxzOw0K
PiA+ICsJY29uc3Qgc3RydWN0IHY0bDJfY3RybF9vcHMgKm9wcyA9ICZkdzk3NjhfY3RybF9vcHM7
DQo+ID4gKw0KPiA+ICsJdjRsMl9jdHJsX2hhbmRsZXJfaW5pdChoZGwsIDEpOw0KPiA+ICsNCj4g
PiArCWR3OTc2OC0+Zm9jdXMgPSB2NGwyX2N0cmxfbmV3X3N0ZChoZGwsIG9wcywgVjRMMl9DSURf
Rk9DVVNfQUJTT0xVVEUsIDAsDQo+ID4gKwkJCQkJICBEVzk3NjhfTUFYX0ZPQ1VTX1BPUywNCj4g
PiArCQkJCQkgIERXOTc2OF9GT0NVU19TVEVQUywgMCk7DQo+ID4gKw0KPiA+ICsJaWYgKGhkbC0+
ZXJyb3IpDQo+ID4gKwkJcmV0dXJuIGhkbC0+ZXJyb3I7DQo+ID4gKw0KPiA+ICsJZHc5NzY4LT5z
ZC5jdHJsX2hhbmRsZXIgPSBoZGw7DQo+ID4gKw0KPiA+ICsJcmV0dXJuIDA7DQo+ID4gK30NCj4g
PiArDQo+ID4gK3N0YXRpYyBpbnQgZHc5NzY4X3Byb2JlKHN0cnVjdCBpMmNfY2xpZW50ICpjbGll
bnQpDQo+ID4gK3sNCj4gPiArCXN0cnVjdCBkZXZpY2UgKmRldiA9ICZjbGllbnQtPmRldjsNCj4g
PiArCXN0cnVjdCBkdzk3NjggKmR3OTc2ODsNCj4gPiArCXVuc2lnbmVkIGludCBpOw0KPiA+ICsJ
aW50IHJldDsNCj4gPiArDQo+ID4gKwlkdzk3NjggPSBkZXZtX2t6YWxsb2MoZGV2LCBzaXplb2Yo
KmR3OTc2OCksIEdGUF9LRVJORUwpOw0KPiA+ICsJaWYgKCFkdzk3NjgpDQo+ID4gKwkJcmV0dXJu
IC1FTk9NRU07DQo+ID4gKw0KPiA+ICsJdjRsMl9pMmNfc3ViZGV2X2luaXQoJmR3OTc2OC0+c2Qs
IGNsaWVudCwgJmR3OTc2OF9vcHMpOw0KPiA+ICsNCj4gPiArCWZvciAoaSA9IDA7IGkgPCBBUlJB
WV9TSVpFKGR3OTc2OF9zdXBwbHlfbmFtZXMpOyBpKyspDQo+ID4gKwkJZHc5NzY4LT5zdXBwbGll
c1tpXS5zdXBwbHkgPSBkdzk3Njhfc3VwcGx5X25hbWVzW2ldOw0KPiA+ICsNCj4gPiArCXJldCA9
IGRldm1fcmVndWxhdG9yX2J1bGtfZ2V0KGRldiwgQVJSQVlfU0laRShkdzk3Njhfc3VwcGx5X25h
bWVzKSwNCj4gPiArCQkJCSAgICAgIGR3OTc2OC0+c3VwcGxpZXMpOw0KPiA+ICsJaWYgKHJldCkg
ew0KPiA+ICsJCWRldl9lcnIoZGV2LCAiZmFpbGVkIHRvIGdldCByZWd1bGF0b3JzXG4iKTsNCj4g
PiArCQlyZXR1cm4gcmV0Ow0KPiA+ICsJfQ0KPiA+ICsNCj4gPiArCXJldCA9IGR3OTc2OF9pbml0
X2NvbnRyb2xzKGR3OTc2OCk7DQo+ID4gKwlpZiAocmV0KQ0KPiA+ICsJCWdvdG8gZW50aXR5X2Ns
ZWFudXA7DQo+ID4gKw0KPiA+ICsJZHc5NzY4LT5zZC5mbGFncyB8PSBWNEwyX1NVQkRFVl9GTF9I
QVNfREVWTk9ERTsNCj4gPiArCWR3OTc2OC0+c2QuaW50ZXJuYWxfb3BzID0gJmR3OTc2OF9pbnRf
b3BzOw0KPiA+ICsNCj4gPiArCXJldCA9IG1lZGlhX2VudGl0eV9wYWRzX2luaXQoJmR3OTc2OC0+
c2QuZW50aXR5LCAwLCBOVUxMKTsNCj4gPiArCWlmIChyZXQgPCAwKQ0KPiA+ICsJCWdvdG8gZW50
aXR5X2NsZWFudXA7DQo+ID4gKw0KPiA+ICsJZHc5NzY4LT5zZC5lbnRpdHkuZnVuY3Rpb24gPSBN
RURJQV9FTlRfRl9MRU5TOw0KPiA+ICsNCj4gPiArCXJldCA9IHY0bDJfYXN5bmNfcmVnaXN0ZXJf
c3ViZGV2KCZkdzk3NjgtPnNkKTsNCj4gPiArCWlmIChyZXQgPCAwKQ0KPiA+ICsJCWdvdG8gZW50
aXR5X2NsZWFudXA7DQo+ID4gKw0KPiA+ICsJcG1fcnVudGltZV9lbmFibGUoZGV2KTsNCj4gDQo+
IE5vdGUgdGhhdCBoZXJlLCB0aGUgZGV2aWNlIG5vZGUgbWF5IGJlIGFscmVhZHkgY3JlYXRlZCBi
ZWZvcmUgcnVudGltZSBQTSBpcw0KPiBlbmFibGVkLg0KPiANCj4gQ291bGQgeW91IHJldmVyc2Ug
b3JkZXIgb2YgZW5hYmxpbmcgcnVudGltZSBQTSBhbmQgcmVnaXN0ZXJpbmcgdGhlIGFzeW5jDQo+
IHN1YmRldiB0byBmaXggdGhhdD8NCj4gDQoNCkdvdCBpdC4NCldlIHdvdWxkIGFsc28gYWRkIFBN
IGVuYWJsZWQgc3RhdHVzIGNoZWNrIGJ5IHVzaW5nDQpwbV9ydW50aW1lX2VuYWJsZWQoZGV2KSBp
biBuZXh0IHJlbGVhc2UuDQpTdWNoIGFzOg0KcG1fcnVudGltZV9lbmFibGUoZGV2KTsNCmlmICgh
cG1fcnVudGltZV9lbmFibGVkKGRldikpIHsNCglyZXQgPSBkdzk3NjhfcnVudGltZV9yZXN1bWUo
ZGV2KTsNCglpZiAocmV0IDwgMCApIHsNCgkJZGV2X2VycihkZXYsICJmYWlsZWQgdG8gcG93ZXIg
b246ICVkXG4iLCByZXQpOw0KCQlnb3RvIGVudGl0eV9jbGVhbnVwOw0KCX0NCn0NCg0KcmV0ID0g
djRsMl9hc3luY19yZWdpc3Rlcl9zdWJkZXYoJmR3OTc2OC0+c2QpOw0KaWYgKHJldCA8IDApDQoJ
Z290byBlbnRpdHlfY2xlYW51cDsNCg0KPiA+ICsNCj4gPiArCXJldHVybiAwOw0KPiA+ICsNCj4g
PiArZW50aXR5X2NsZWFudXA6DQo+ID4gKwl2NGwyX2N0cmxfaGFuZGxlcl9mcmVlKCZkdzk3Njgt
PmN0cmxzKTsNCj4gPiArCW1lZGlhX2VudGl0eV9jbGVhbnVwKCZkdzk3NjgtPnNkLmVudGl0eSk7
DQo+ID4gKwlyZXR1cm4gcmV0Ow0KPiA+ICt9DQo+ID4gKw0KPiA+ICtzdGF0aWMgaW50IGR3OTc2
OF9yZW1vdmUoc3RydWN0IGkyY19jbGllbnQgKmNsaWVudCkNCj4gPiArew0KPiA+ICsJc3RydWN0
IHY0bDJfc3ViZGV2ICpzZCA9IGkyY19nZXRfY2xpZW50ZGF0YShjbGllbnQpOw0KPiA+ICsJc3Ry
dWN0IGR3OTc2OCAqZHc5NzY4ID0gc2RfdG9fZHc5NzY4KHNkKTsNCj4gPiArDQo+ID4gKwlwbV9y
dW50aW1lX2Rpc2FibGUoJmNsaWVudC0+ZGV2KTsNCj4gPiArCXY0bDJfYXN5bmNfdW5yZWdpc3Rl
cl9zdWJkZXYoJmR3OTc2OC0+c2QpOw0KPiA+ICsJdjRsMl9jdHJsX2hhbmRsZXJfZnJlZSgmZHc5
NzY4LT5jdHJscyk7DQo+ID4gKwltZWRpYV9lbnRpdHlfY2xlYW51cCgmZHc5NzY4LT5zZC5lbnRp
dHkpOw0KPiA+ICsJaWYgKCFwbV9ydW50aW1lX3N0YXR1c19zdXNwZW5kZWQoJmNsaWVudC0+ZGV2
KSkNCj4gPiArCQlkdzk3NjhfcnVudGltZV9zdXNwZW5kKCZjbGllbnQtPmRldik7DQo+ID4gKwlw
bV9ydW50aW1lX3NldF9zdXNwZW5kZWQoJmNsaWVudC0+ZGV2KTsNCj4gPiArDQo+ID4gKwlyZXR1
cm4gMDsNCj4gPiArfQ0KPiA+ICsNCj4gPiArc3RhdGljIGNvbnN0IHN0cnVjdCBvZl9kZXZpY2Vf
aWQgZHc5NzY4X29mX3RhYmxlW10gPSB7DQo+ID4gKwl7IC5jb21wYXRpYmxlID0gImRvbmd3b29u
LGR3OTc2OCIgfSwNCj4gPiArCXt9DQo+ID4gK307DQo+ID4gK01PRFVMRV9ERVZJQ0VfVEFCTEUo
b2YsIGR3OTc2OF9vZl90YWJsZSk7DQo+ID4gKw0KPiA+ICtzdGF0aWMgY29uc3Qgc3RydWN0IGRl
dl9wbV9vcHMgZHc5NzY4X3BtX29wcyA9IHsNCj4gPiArCVNFVF9TWVNURU1fU0xFRVBfUE1fT1BT
KHBtX3J1bnRpbWVfZm9yY2Vfc3VzcGVuZCwNCj4gPiArCQkJCXBtX3J1bnRpbWVfZm9yY2VfcmVz
dW1lKQ0KPiA+ICsJU0VUX1JVTlRJTUVfUE1fT1BTKGR3OTc2OF9ydW50aW1lX3N1c3BlbmQsIGR3
OTc2OF9ydW50aW1lX3Jlc3VtZSwgTlVMTCkNCj4gPiArfTsNCj4gPiArDQo+ID4gK3N0YXRpYyBz
dHJ1Y3QgaTJjX2RyaXZlciBkdzk3NjhfaTJjX2RyaXZlciA9IHsNCj4gPiArCS5kcml2ZXIgPSB7
DQo+ID4gKwkJLm5hbWUgPSBEVzk3NjhfTkFNRSwNCj4gPiArCQkucG0gPSBJU19FTkFCTEVEKENP
TkZJR19QTSkgPyAmZHc5NzY4X3BtX29wcyA6IE5VTEwsDQo+IA0KPiBZb3UgY2FuIGRyb3AgdGhl
IGNvbmRpdGlvbiBhcyB0aGUgZHJpdmVyIGRlcGVuZHMgb24gQ09ORklHX1BNLg0KPiANCg0KVGhh
bmtzIGZvciB0aGUgcmVtaW5kZXIuDQpXZSdkIHJlbW92ZSB0aGF0IGluIG5leHQgcmVsZWFzZS4N
Cg0KPiA+ICsJCS5vZl9tYXRjaF90YWJsZSA9IGR3OTc2OF9vZl90YWJsZSwNCj4gPiArCX0sDQo+
ID4gKwkucHJvYmVfbmV3ICA9IGR3OTc2OF9wcm9iZSwNCj4gPiArCS5yZW1vdmUgPSBkdzk3Njhf
cmVtb3ZlLA0KPiA+ICt9Ow0KPiA+ICsNCj4gPiArbW9kdWxlX2kyY19kcml2ZXIoZHc5NzY4X2ky
Y19kcml2ZXIpOw0KPiA+ICsNCj4gPiArTU9EVUxFX0FVVEhPUigiRG9uZ2NodW4gWmh1IDxkb25n
Y2h1bi56aHVAbWVkaWF0ZWsuY29tPiIpOw0KPiA+ICtNT0RVTEVfREVTQ1JJUFRJT04oIkRXOTc2
OCBWQ00gZHJpdmVyIik7DQo+ID4gK01PRFVMRV9MSUNFTlNFKCJHUEwgdjIiKTsNCj4gDQoNCg==

