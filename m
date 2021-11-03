Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 8279D443DF5
	for <lists+linux-media@lfdr.de>; Wed,  3 Nov 2021 09:03:35 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231319AbhKCIGJ (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 3 Nov 2021 04:06:09 -0400
Received: from mailgw02.mediatek.com ([210.61.82.184]:58656 "EHLO
        mailgw02.mediatek.com" rhost-flags-OK-FAIL-OK-FAIL) by vger.kernel.org
        with ESMTP id S229504AbhKCIGJ (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Wed, 3 Nov 2021 04:06:09 -0400
X-UUID: 5c85692030744872b371dba8f43547ed-20211103
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
        h=Content-Transfer-Encoding:MIME-Version:Content-Type:References:In-Reply-To:Date:CC:To:From:Subject:Message-ID; bh=VYJwlQewBN6GJbnEUto0c9JoA556ekjEp/y7UAh+224=;
        b=bj0vc9j62aleMBBXSbenQ5oxkjw85uvy2HNkv4Qs90H3YZ8NiZNK1maFF47B317hf+z2zRHJqBCgnc0ZGNXEhh6i8JXEZHJkeN1R8Zx9qK1i4mvMwrYX9JYnMq79YvIMpSbVFDW35cf098SuzdIP73PdwFhs6Kp3EmZN7jrm2Gs=;
X-UUID: 5c85692030744872b371dba8f43547ed-20211103
Received: from mtkmbs10n2.mediatek.inc [(172.21.101.183)] by mailgw02.mediatek.com
        (envelope-from <houlong.wei@mediatek.com>)
        (Generic MTA with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
        with ESMTP id 1714250672; Wed, 03 Nov 2021 16:03:30 +0800
Received: from mtkmbs10n1.mediatek.inc (172.21.101.34) by
 mtkmbs10n2.mediatek.inc (172.21.101.183) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.792.3;
 Wed, 3 Nov 2021 16:03:29 +0800
Received: from mhfsdcap04 (10.17.3.154) by mtkmbs10n1.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.2.792.15 via Frontend
 Transport; Wed, 3 Nov 2021 16:03:28 +0800
Message-ID: <c01c2c6e2351c915fb6e55b025bf2ab5c449f045.camel@mediatek.com>
Subject: Re: [PATCH v4] media: mtk-vpu: Ensure alignment of 8 for DTCM buffer
From:   houlong wei <houlong.wei@mediatek.com>
To:     <Irui.wang@mediatek.com>,
        Dafna Hirschfeld <dafna.hirschfeld@collabora.com>,
        Alexandre Courbot <acourbot@chromium.org>,
        Hans Verkuil <hverkuil@xs4all.nl>
CC:     Linux Media Mailing List <linux-media@vger.kernel.org>,
        "moderated list:ARM/Mediatek SoC support" 
        <linux-mediatek@lists.infradead.org>,
        LKML <linux-kernel@vger.kernel.org>,
        "kernel@collabora.com" <kernel@collabora.com>,
        Enric Balletbo i Serra <enric.balletbo@collabora.com>,
        Dafna Hirschfeld <dafna3@gmail.com>,
        "Tiffany Lin =?UTF-8?Q?=28=E6=9E=97=E6=85=A7=E7=8F=8A=29?=" 
        <tiffany.lin@mediatek.com>,
        Andrew-CT Chen =?UTF-8?Q?=28=E9=99=B3=E6=99=BA=E8=BF=AA=29?= 
        <Andrew-CT.Chen@mediatek.com>,
        Minghsiu Tsai =?UTF-8?Q?=28=E8=94=A1=E6=98=8E=E4=BF=AE=29?= 
        <Minghsiu.Tsai@mediatek.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Matthias Brugger <matthias.bgg@gmail.com>,
        <houlong.wei@mediatek.com>
Date:   Wed, 3 Nov 2021 16:03:28 +0800
In-Reply-To: <9475ac5b-79fe-da0e-ed1c-a91275cad46e@collabora.com>
References: <20210920170408.1561-1-dafna.hirschfeld@collabora.com>
         <c59b7f40-d99e-370a-b797-5dc72979df46@xs4all.nl>
         <CAPBb6MW_i1_Lh2ZaF8jGjcV-4XBhjswtyKkZCk3HxKO7LX79Og@mail.gmail.com>
         <9475ac5b-79fe-da0e-ed1c-a91275cad46e@collabora.com>
Content-Type: text/plain; charset="UTF-8"
X-Mailer: Evolution 3.28.5-0ubuntu0.18.04.2 
MIME-Version: 1.0
X-MTK:  N
Content-Transfer-Encoding: base64
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

QWRkIG10ay12cHUgZHJpdmVyIGV4cGVydCBpcnVpLndhbmcgaW4gdGhlIGxvb3AuDQoNCk9uIE1v
biwgMjAyMS0xMC0xOCBhdCAxNTowNyArMDgwMCwgRGFmbmEgSGlyc2NoZmVsZCB3cm90ZToNCj4g
DQo+IE9uIDE4LjEwLjIxIDAzOjE2LCBBbGV4YW5kcmUgQ291cmJvdCB3cm90ZToNCj4gPiBIaSBI
YW5zIQ0KPiA+IA0KPiA+IE9uIE1vbiwgT2N0IDQsIDIwMjEgYXQgNjozNyBQTSBIYW5zIFZlcmt1
aWwgPGh2ZXJrdWlsQHhzNGFsbC5ubD4NCj4gPiB3cm90ZToNCj4gPiA+IA0KPiA+ID4gT24gMjAv
MDkvMjAyMSAxOTowNCwgRGFmbmEgSGlyc2NoZmVsZCB3cm90ZToNCj4gPiA+ID4gRnJvbTogQWxl
eGFuZHJlIENvdXJib3QgPGFjb3VyYm90QGNocm9taXVtLm9yZz4NCj4gPiA+ID4gDQo+ID4gPiA+
IFdoZW4gcnVubmluZyBtZW1jcHlfdG9pbzoNCj4gPiA+ID4gbWVtY3B5X3RvaW8oc2VuZF9vYmot
PnNoYXJlX2J1ZiwgYnVmLCBsZW4pOw0KPiA+ID4gPiBpdCB3YXMgZm91bmQgdGhhdCBlcnJvcnMg
YXBwZWFyIGlmIGxlbiBpcyBub3QgYSBtdWx0aXBsZSBvZiA4Og0KPiA+ID4gPiANCj4gPiA+ID4g
WzU4LjM1MDg0MV0gbXRrLW1kcCAxNDAwMTAwMC5yZG1hOiBwcm9jZXNzaW5nIGZhaWxlZDogLTIy
DQo+ID4gPiANCj4gPiA+IFdoeSBkbyBlcnJvcnMgYXBwZWFyPyBJcyB0aGF0IGR1ZSB0byBhIEhX
IGJ1Zz8gU29tZSBvdGhlciByZWFzb24/DQo+ID4gDQo+ID4gTVRLIGZvbGtzIHdvdWxkIGJlIHRo
ZSBiZXN0IHBsYWNlZCB0byBhbnN3ZXIgdGhpcywgYnV0IHNpbmNlIHRoZQ0KPiA+IGZhaWx1cmUg
aXMgcmVwb3J0ZWQgYnkgdGhlIGZpcm13YXJlIEknZCBzdXNwZWN0IGVpdGhlciBhIGZpcm13YXJl
DQo+ID4gb3INCj4gPiBoYXJkd2FyZSBsaW1pdGF0aW9uLg0KPiA+IA0KPiA+ID4gDQo+ID4gPiA+
IA0KPiA+ID4gPiBUaGlzIHBhdGNoIGVuc3VyZXMgdGhlIGNvcHkgb2YgYSBtdWx0aXBsZSBvZiA4
IHNpemUgYnkgY2FsbGluZw0KPiA+ID4gPiByb3VuZF91cChsZW4sIDgpIHdoZW4gY29weWluZw0K
PiA+ID4gPiANCj4gPiA+ID4gRml4ZXM6IGU2NTk5YWRmYWQzMCAoIm1lZGlhOiBtdGstdnB1OiBh
dm9pZCB1bmFsaWduZWQgYWNjZXNzIHRvDQo+ID4gPiA+IERUQ00gYnVmZmVyLiIpDQo+ID4gPiA+
IFNpZ25lZC1vZmYtYnk6IEFsZXhhbmRyZSBDb3VyYm90IDxhY291cmJvdEBjaHJvbWl1bS5vcmc+
DQo+ID4gPiA+IFNpZ25lZC1vZmYtYnk6IEVucmljIEJhbGxldGJvIGkgU2VycmEgPA0KPiA+ID4g
PiBlbnJpYy5iYWxsZXRib0Bjb2xsYWJvcmEuY29tPg0KPiA+ID4gPiBTaWduZWQtb2ZmLWJ5OiBE
YWZuYSBIaXJzY2hmZWxkIDxkYWZuYS5oaXJzY2hmZWxkQGNvbGxhYm9yYS5jb20NCj4gPiA+ID4g
Pg0KPiA+ID4gPiBSZXZpZXdlZC1ieTogSG91bG9uZyBXZWkgPGhvdWxvbmcud2VpQG1lZGlhdGVr
LmNvbT4NCj4gPiA+ID4gLS0tDQo+ID4gPiA+IGNoYW5nZXMgc2luY2UgdjM6DQo+ID4gPiA+IDEu
IG11bHRpbGUgLT4gbXVsdGlwbGUNCj4gPiA+ID4gMi4gYWRkIGlubGluZSBkb2MNCj4gPiA+ID4g
DQo+ID4gPiA+IGNoYW5nZXMgc2luY2UgdjI6DQo+ID4gPiA+IDEuIGRvIHRoZSBleHRyYSBjb3B5
IG9ubHkgaWYgbGVuIGlzIG5vdCBtdWx0aXBsZSBvZiA4DQo+ID4gPiA+IA0KPiA+ID4gPiBjaGFu
Z2VzIHNpbmNlIHYxOg0KPiA+ID4gPiAxLiBjaGFuZ2Ugc2lnbi1vZmYtYnkgdGFncw0KPiA+ID4g
PiAyLiBjaGFuZ2UgdmFsdWVzIHRvIG1lbXNldA0KPiA+ID4gPiANCj4gPiA+ID4gICBkcml2ZXJz
L21lZGlhL3BsYXRmb3JtL210ay12cHUvbXRrX3ZwdS5jIHwgMTUgKysrKysrKysrKysrKystDQo+
ID4gPiA+ICAgMSBmaWxlIGNoYW5nZWQsIDE0IGluc2VydGlvbnMoKyksIDEgZGVsZXRpb24oLSkN
Cj4gPiA+ID4gDQo+ID4gPiA+IGRpZmYgLS1naXQgYS9kcml2ZXJzL21lZGlhL3BsYXRmb3JtL210
ay12cHUvbXRrX3ZwdS5jDQo+ID4gPiA+IGIvZHJpdmVycy9tZWRpYS9wbGF0Zm9ybS9tdGstdnB1
L210a192cHUuYw0KPiA+ID4gPiBpbmRleCBlYzI5MGRkZTU5Y2YuLjFkZjAzMTcxNmM4ZiAxMDA2
NDQNCj4gPiA+ID4gLS0tIGEvZHJpdmVycy9tZWRpYS9wbGF0Zm9ybS9tdGstdnB1L210a192cHUu
Yw0KPiA+ID4gPiArKysgYi9kcml2ZXJzL21lZGlhL3BsYXRmb3JtL210ay12cHUvbXRrX3ZwdS5j
DQo+ID4gPiA+IEBAIC0zNDksNyArMzQ5LDIwIEBAIGludCB2cHVfaXBpX3NlbmQoc3RydWN0IHBs
YXRmb3JtX2RldmljZQ0KPiA+ID4gPiAqcGRldiwNCj4gPiA+ID4gICAgICAgICAgICAgICAgfQ0K
PiA+ID4gPiAgICAgICAgfSB3aGlsZSAodnB1X2NmZ19yZWFkbCh2cHUsIEhPU1RfVE9fVlBVKSk7
DQo+ID4gPiA+IA0KPiA+ID4gPiAtICAgICBtZW1jcHlfdG9pbyhzZW5kX29iai0+c2hhcmVfYnVm
LCBidWYsIGxlbik7DQo+ID4gPiA+ICsgICAgIC8qDQo+ID4gPiA+ICsgICAgICAqIHdoZW4gY29w
eWluZyBkYXRhIHRvIHRoZSB2cHUgaGFyZHdhcmUsIHRoZSBtZW1jcHlfdG9pbw0KPiA+ID4gPiBv
cGVyYXRpb24gbXVzdCBjb3B5DQo+ID4gPiA+ICsgICAgICAqIGEgbXVsdGlwbGUgb2YgOC4gT3Ro
ZXJ3aXNlIHRoZSBwcm9jZXNzaW5nIGZhaWxzDQo+ID4gPiANCj4gPiA+IFNhbWUgaGVyZTogaXQg
bmVlZHMgdG8gZXhwbGFpbiB3aHkgdGhlIHByb2Nlc3NpbmcgZmFpbHMuDQo+IA0KPiBJcyB3cml0
aW5nICdkdWUgdG8gaGFyZHdhcmUgb3IgZmlybXdhcmUgbGltaXRhdGlvbicgZW5vdWdoPw0KPiBJ
ZiBub3QsIHRoZW4gd2Ugc2hvdWxkIHdhaXQgZm9yIG1lZGlhdGVrIHBlb3BsZSdzIHJlc3BvbnNl
IHRvIGV4cGxhaW4NCj4gaWYgdGhleSBrbm93IG1vcmUNCj4gDQo+ID4gPiANCj4gPiA+ID4gKyAg
ICAgICovDQo+ID4gPiA+ICsgICAgIGlmIChsZW4gJSA4ICE9IDApIHsNCj4gPiA+ID4gKyAgICAg
ICAgICAgICB1bnNpZ25lZCBjaGFyIGRhdGFbU0hBUkVfQlVGX1NJWkVdOw0KPiA+ID4gDQo+ID4g
PiBXb3VsZG4ndCBpdCBiZSBtb3JlIHJvYnVzdCBpZiB5b3Ugc2F5Og0KPiA+ID4gDQo+ID4gPiAg
ICAgICAgICAgICAgICAgIHVuc2lnbmVkIGNoYXIgZGF0YVtzaXplb2Yoc2VuZF9vYmotPnNoYXJl
X2J1ZildOw0KPiA+IA0KPiA+IERlZmluaXRlbHkgeWVzLg0KPiANCj4gSSdsbCBzZW5kIHY1IGZp
eGluZyB0aGlzDQo+IA0KPiA+IA0KPiA+ID4gDQo+ID4gPiBJIGFsc28gdGhpbmsgdGhhdCB0aGUg
U0hBUkVfQlVGX1NJWkUgZGVmaW5lIG5lZWRzIGEgY29tbWVudA0KPiA+ID4gc3RhdGluZyB0aGF0
IGl0IG11c3QgYmUgYQ0KPiA+ID4gbXVsdGlwbGUgb2YgOCwgb3RoZXJ3aXNlIHVuZXhwZWN0ZWQg
dGhpbmdzIGNhbiBoYXBwZW4uDQo+ID4gPiANCj4gPiA+IFlvdSBhbHNvIG5vdGljZWQgdGhhdCB0
aGUgY3VycmVudCBTSEFSRV9CVUZfU0laRSBkZWZpbmUgaXMgdG9vDQo+ID4gPiBsb3csIGJ1dCBJ
IHNhdw0KPiA+ID4gbm8gcGF0Y2ggY29ycmVjdGluZyB0aGlzLiBTaG91bGRuJ3QgdGhhdCBiZSBm
aXhlZCBhcyB3ZWxsPw0KPiA+IA0KPiA+IEFGQUlDVCB0aGUgZmlybXdhcmUgZXhwZWN0cyB0aGlz
IGV4YWN0IHNpemUgb24gaXRzIGVuZCwgc28gSSBkb24ndA0KPiA+IGJlbGlldmUgaXQgY2FuIGJl
IGNoYW5nZWQgdGhhdCBlYXNpbHkuIEJ1dCBtYXliZSBzb21lb25lIGZyb20gTVRLDQo+ID4gY2Fu
DQo+ID4gcHJvdmUgbWUgd3JvbmcuDQo+ID4gDQo+IA0KPiBJIGxvb2tlZCBmdXJ0aGVyIGFuZCBu
b3RlZCB0aGF0IHRoZSBzdHJ1Y3RzIHRoYXQgYXJlIGxhcmdlciB0aGFuDQo+ICdTSEFSRV9CVUZf
U0laRScNCj4gKHZlbmNfYXBfaXBpX21zZ19lbmNfZXh0IHZlbmNfYXBfaXBpX21zZ19zZXRfcGFy
YW1fZXh0KQ0KPiBhcmUgdXNlZCBieSBkcml2ZXJzIHRoYXQgZG9uJ3QgdXNlIHRoaXMgdnB1IGFw
aSwgc28gYWN0dWFsbHkNCj4gU0hBUkVfQlVGX1NJWkUgaXMNCj4gbm90IHRvbyBsb3cgYW5kIGFz
IENvcnVyYm90IHdvcnRlIHByb2JhYmx5IG5vdCBjaGFuZ2VhYmxlLg0KPiANCj4gDQo+IFRoYW5r
cywNCj4gRGFmbmENCj4gDQo+ID4gQ2hlZXJzLA0KPiA+IEFsZXguDQo+ID4gDQo=

