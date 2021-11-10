Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C489F44BA8E
	for <lists+linux-media@lfdr.de>; Wed, 10 Nov 2021 04:11:47 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230081AbhKJDOb (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 9 Nov 2021 22:14:31 -0500
Received: from mailgw02.mediatek.com ([210.61.82.184]:54052 "EHLO
        mailgw02.mediatek.com" rhost-flags-OK-FAIL-OK-FAIL) by vger.kernel.org
        with ESMTP id S229445AbhKJDOa (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Tue, 9 Nov 2021 22:14:30 -0500
X-UUID: 9a8cd1a9d9264a3b941f29590b6feedd-20211110
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
        h=Content-Transfer-Encoding:MIME-Version:Content-Type:References:In-Reply-To:Date:CC:To:From:Subject:Message-ID; bh=FW4lI1nxmNtd/IT/tY+A90HGfKmb4Gx1XGsdWrcaA6c=;
        b=R0acouXnqanx4lKCd/5tPLPqmFPnxQB14944XAlVsSYbjs9A4eLEgPZH6qOEQNnS0UccZ8zAZA/SL4Ndg4e+gkRz8bF/H+9uzdL9LKp+nBgbYx/qg218yQN0d3k4D7FiDInCLaZumslNQPlgt2+9kSSYIfAMOYkjv+VpG7qcICU=;
X-UUID: 9a8cd1a9d9264a3b941f29590b6feedd-20211110
Received: from mtkexhb01.mediatek.inc [(172.21.101.102)] by mailgw02.mediatek.com
        (envelope-from <irui.wang@mediatek.com>)
        (Generic MTA with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
        with ESMTP id 1232866730; Wed, 10 Nov 2021 11:11:41 +0800
Received: from mtkmbs10n1.mediatek.inc (172.21.101.34) by
 mtkmbs10n1.mediatek.inc (172.21.101.34) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.792.15; Wed, 10 Nov 2021 11:11:31 +0800
Received: from mhfsdcap04 (10.17.3.154) by mtkmbs10n1.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.2.792.15 via Frontend
 Transport; Wed, 10 Nov 2021 11:11:31 +0800
Message-ID: <054260428d9d7718f630ecc1b2bdec34ecf1f799.camel@mediatek.com>
Subject: Re: [PATCH v4] media: mtk-vpu: Ensure alignment of 8 for DTCM buffer
From:   Irui Wang <irui.wang@mediatek.com>
To:     Dafna Hirschfeld <dafna.hirschfeld@collabora.com>,
        houlong wei <houlong.wei@mediatek.com>,
        Alexandre Courbot <acourbot@chromium.org>,
        "Hans Verkuil" <hverkuil@xs4all.nl>
CC:     Linux Media Mailing List <linux-media@vger.kernel.org>,
        "moderated list:ARM/Mediatek SoC support" 
        <linux-mediatek@lists.infradead.org>,
        LKML <linux-kernel@vger.kernel.org>,
        "kernel@collabora.com" <kernel@collabora.com>,
        Dafna Hirschfeld <dafna3@gmail.com>,
        Tiffany Lin =?UTF-8?Q?=28=E6=9E=97=E6=85=A7=E7=8F=8A=29?= 
        <tiffany.lin@mediatek.com>,
        Andrew-CT Chen =?UTF-8?Q?=28=E9=99=B3=E6=99=BA=E8=BF=AA=29?= 
        <Andrew-CT.Chen@mediatek.com>,
        Minghsiu Tsai =?UTF-8?Q?=28=E8=94=A1=E6=98=8E=E4=BF=AE=29?= 
        <Minghsiu.Tsai@mediatek.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Matthias Brugger <matthias.bgg@gmail.com>
Date:   Wed, 10 Nov 2021 11:11:30 +0800
In-Reply-To: <428f216d-cdff-e22d-b96e-f9dd9cc158e3@collabora.com>
References: <20210920170408.1561-1-dafna.hirschfeld@collabora.com>
         <c59b7f40-d99e-370a-b797-5dc72979df46@xs4all.nl>
         <CAPBb6MW_i1_Lh2ZaF8jGjcV-4XBhjswtyKkZCk3HxKO7LX79Og@mail.gmail.com>
         <9475ac5b-79fe-da0e-ed1c-a91275cad46e@collabora.com>
         <c01c2c6e2351c915fb6e55b025bf2ab5c449f045.camel@mediatek.com>
         <8dfc07306b853126e8109fc953fd6388b63c65d2.camel@mediatek.com>
         <4e7ff420-f67d-5d4a-8733-f4b83d80af13@collabora.com>
         <428f216d-cdff-e22d-b96e-f9dd9cc158e3@collabora.com>
Content-Type: text/plain; charset="UTF-8"
X-Mailer: Evolution 3.28.5-0ubuntu0.18.04.2 
MIME-Version: 1.0
X-MTK:  N
Content-Transfer-Encoding: base64
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

SGksIERhZm5hLA0KDQpUaGFua3MgZm9yIHRoZSBwYXRjaC4NCk9uIFR1ZSwgMjAyMS0xMS0wOSBh
dCAxMDo0NiArMDIwMCwgRGFmbmEgSGlyc2NoZmVsZCB3cm90ZToNCj4gDQo+IE9uIDAzLjExLjIx
IDEzOjA0LCBEYWZuYSBIaXJzY2hmZWxkIHdyb3RlOg0KPiA+IA0KPiA+IA0KPiA+IE9uIDAzLjEx
LjIxIDEwOjE5LCBJcnVpIFdhbmcgd3JvdGU6DQo+ID4gPiBIaSwNCj4gPiA+IA0KPiA+ID4gVGhl
ICJsZW4iIG9mIHNoYXJlX2J1ZiBjb3BpZWQgc2hvdWxkIGJlIGFsd2F5cyA4IGFsaWdubWVudDsN
Cj4gPiA+IGRvIHlvdSBoYXZlIG90aGVyIGxvZ3MgdG8gcHJvdmUgdGhlIGxlbiBpcyBub3QgOCBh
bGlnbm1lbnQgd2hlbg0KPiA+ID4gZXJyb3JzDQo+ID4gPiBhcHBlYXI/DQo+ID4gDQo+ID4gSGks
IEkgZm91bmQgb3V0IHRoYXQgInNpemVvZihtZHBfaXBpX2NvbW0pID0gMjAiDQo+ID4gdGhpcyBp
cyBkdWUgdG8gdGhlIG1hY3JvICNwcmFnbWEgcGFjayhwdXNoLCA0KSBpbiBtdGtfbWRwX2lwaS5o
DQo+ID4gDQo+ID4gc2VlIFsxXQ0KPiA+IA0KPiA+IFsxXSBodHRwOi8vbGttbC5pdS5lZHUvaHlw
ZXJtYWlsL2xpbnV4L2tlcm5lbC8yMTA5LjIvMDQ5NzguaHRtbA0KPiA+IA0KPiANCj4gSGkgSXJ1
aSBXYW5nLA0KPiBBbnkgdXBkYXRlIHJlZ2FyZGluZyB0aGF0IHBhdGNoPw0KPiBDYW4geW91IGdp
dmUgbW9yZSBleHBsYW5hdGlvbiBmb3IgdGhhdCBlcnJvcnMgdGhhdCB3ZSBzZWUNCj4gd2hlbiB0
aGUgYnVmZmVyIHNpemUgaXMgbm90IGEgbXVsdGlwbGUgb2YgOD8NCj4gDQo+IFRoYW5rcywNCj4g
RGFmbmENCg0Kc2hhcmVfYnVmIGlzIGEgbWFwcGVkIG1lbW9yeSBieSBpb3JlbWFwLCBpdCBzaG91
bGQgYmUgYmV0dGVyIHVzZQ0KbWVtY3B5X3RvL2Zyb21pbyBpbnN0ZWFkIG9mIG1lbWNweSBiZWNh
dXNlIG9mIGFsaWdubWVudC4NCg0KQXMgZm9yIG1lbWNweV90b2lvLCBpdCBtYXkgYWxzbyBoYXZl
IHJlcXVpcmVtZW50cyBmb3IgYWxpZ25tZW50LCB3ZSBjYW4NCmFsc28gZ2V0IHN1Y2ggaW5mb3Jt
YXRpb24gZnJvbToNCg0KaHR0cHM6Ly9lbGl4aXIuYm9vdGxpbi5jb20vbGludXgvdjUuMTUvc291
cmNlL2RyaXZlcnMvbXRkL3NwaS1ub3IvY29udHJvbGxlcnMvYXNwZWVkLXNtYy5jI0wyMDcNCi4N
Cg0KU28sIGl0J3Mgbm90IFZQVSBIVyBidWcgb3IgbGltaXRhdGlvbiwgaXQncyBtZW1jcHlfdG9p
byByZXF1aXJlbWVudHMsDQptYXliZSB3ZSBjYW4gbW9kaWZ5IElQSSBtZXNzYWdlIHRvIGRvIGFs
aWdubWVudCwgYnV0IGl0IG5lZWQgbW9kaWZ5DQpib3RoIGtlcm5lbCBhbmQgdnB1IGZpcm13YXJl
LCB3aGljaCB3aWxsIGJyZWFrIHVwc3RyZWFtIGJhY2t3YXJkDQpjb21wYXRpYmxlLCB3ZSB0aGlu
ayBpdCdzIHVuYWNjZXB0YWxlLg0KDQpJZiB0aGlzIHBhdGNoIGNhbiBzb2x2ZSB0aGUgaXNzdWUs
IHdlIHRoaW5rIGl0J3MgT0suDQoNClRoYW5rcw0KPiANCj4gPiBUaGFua3MsDQo+ID4gRGFmbmEN
Cj4gPiANCj4gPiA+ID4gPiBbNTguMzUwODQxXSBtdGstbWRwIDE0MDAxMDAwLnJkbWE6IHByb2Nl
c3NpbmcgZmFpbGVkOiAtMjINCj4gPiA+IA0KPiA+ID4gT24gV2VkLCAyMDIxLTExLTAzIGF0IDE2
OjAzICswODAwLCBob3Vsb25nIHdlaSB3cm90ZToNCj4gPiA+ID4gQWRkIG10ay12cHUgZHJpdmVy
IGV4cGVydCBpcnVpLndhbmcgaW4gdGhlIGxvb3AuDQo+ID4gPiA+IA0KPiA+ID4gPiBPbiBNb24s
IDIwMjEtMTAtMTggYXQgMTU6MDcgKzA4MDAsIERhZm5hIEhpcnNjaGZlbGQgd3JvdGU6DQo+ID4g
PiA+ID4gDQo+ID4gPiA+ID4gT24gMTguMTAuMjEgMDM6MTYsIEFsZXhhbmRyZSBDb3VyYm90IHdy
b3RlOg0KPiA+ID4gPiA+ID4gSGkgSGFucyENCj4gPiA+ID4gPiA+IA0KPiA+ID4gPiA+ID4gT24g
TW9uLCBPY3QgNCwgMjAyMSBhdCA2OjM3IFBNIEhhbnMgVmVya3VpbCA8DQo+ID4gPiA+ID4gPiBo
dmVya3VpbEB4czRhbGwubmw+DQo+ID4gPiA+ID4gPiB3cm90ZToNCj4gPiA+ID4gPiA+ID4gDQo+
ID4gPiA+ID4gPiA+IE9uIDIwLzA5LzIwMjEgMTk6MDQsIERhZm5hIEhpcnNjaGZlbGQgd3JvdGU6
DQo+ID4gPiA+ID4gPiA+ID4gRnJvbTogQWxleGFuZHJlIENvdXJib3QgPGFjb3VyYm90QGNocm9t
aXVtLm9yZz4NCj4gPiA+ID4gPiA+ID4gPiANCj4gPiA+ID4gPiA+ID4gPiBXaGVuIHJ1bm5pbmcg
bWVtY3B5X3RvaW86DQo+ID4gPiA+ID4gPiA+ID4gbWVtY3B5X3RvaW8oc2VuZF9vYmotPnNoYXJl
X2J1ZiwgYnVmLCBsZW4pOw0KPiA+ID4gPiA+ID4gPiA+IGl0IHdhcyBmb3VuZCB0aGF0IGVycm9y
cyBhcHBlYXIgaWYgbGVuIGlzIG5vdCBhDQo+ID4gPiA+ID4gPiA+ID4gbXVsdGlwbGUgb2YNCj4g
PiA+ID4gPiA+ID4gPiA4Og0KPiA+ID4gPiA+ID4gPiA+IA0KPiA+ID4gPiA+ID4gPiA+IFs1OC4z
NTA4NDFdIG10ay1tZHAgMTQwMDEwMDAucmRtYTogcHJvY2Vzc2luZyBmYWlsZWQ6DQo+ID4gPiA+
ID4gPiA+ID4gLTIyDQo+ID4gPiA+ID4gPiA+IA0KPiA+ID4gPiA+ID4gPiBXaHkgZG8gZXJyb3Jz
IGFwcGVhcj8gSXMgdGhhdCBkdWUgdG8gYSBIVyBidWc/IFNvbWUgb3RoZXINCj4gPiA+ID4gPiA+
ID4gcmVhc29uPw0KPiA+ID4gPiA+ID4gDQo+ID4gPiA+ID4gPiBNVEsgZm9sa3Mgd291bGQgYmUg
dGhlIGJlc3QgcGxhY2VkIHRvIGFuc3dlciB0aGlzLCBidXQNCj4gPiA+ID4gPiA+IHNpbmNlIHRo
ZQ0KPiA+ID4gPiA+ID4gZmFpbHVyZSBpcyByZXBvcnRlZCBieSB0aGUgZmlybXdhcmUgSSdkIHN1
c3BlY3QgZWl0aGVyIGENCj4gPiA+ID4gPiA+IGZpcm13YXJlDQo+ID4gPiA+ID4gPiBvcg0KPiA+
ID4gPiA+ID4gaGFyZHdhcmUgbGltaXRhdGlvbi4NCj4gPiA+ID4gPiA+IA0KPiA+ID4gPiA+ID4g
PiANCj4gPiA+ID4gPiA+ID4gPiANCj4gPiA+ID4gPiA+ID4gPiBUaGlzIHBhdGNoIGVuc3VyZXMg
dGhlIGNvcHkgb2YgYSBtdWx0aXBsZSBvZiA4IHNpemUgYnkNCj4gPiA+ID4gPiA+ID4gPiBjYWxs
aW5nDQo+ID4gPiA+ID4gPiA+ID4gcm91bmRfdXAobGVuLCA4KSB3aGVuIGNvcHlpbmcNCj4gPiA+
ID4gPiA+ID4gPiANCj4gPiA+ID4gPiA+ID4gPiBGaXhlczogZTY1OTlhZGZhZDMwICgibWVkaWE6
IG10ay12cHU6IGF2b2lkIHVuYWxpZ25lZA0KPiA+ID4gPiA+ID4gPiA+IGFjY2Vzcw0KPiA+ID4g
PiA+ID4gPiA+IHRvDQo+ID4gPiA+ID4gPiA+ID4gRFRDTSBidWZmZXIuIikNCj4gPiA+ID4gPiA+
ID4gPiBTaWduZWQtb2ZmLWJ5OiBBbGV4YW5kcmUgQ291cmJvdCA8YWNvdXJib3RAY2hyb21pdW0u
b3JnDQo+ID4gPiA+ID4gPiA+ID4gPg0KPiA+ID4gPiA+ID4gPiA+IFNpZ25lZC1vZmYtYnk6IEVu
cmljIEJhbGxldGJvIGkgU2VycmEgPA0KPiA+ID4gPiA+ID4gPiA+IGVucmljLmJhbGxldGJvQGNv
bGxhYm9yYS5jb20+DQo+ID4gPiA+ID4gPiA+ID4gU2lnbmVkLW9mZi1ieTogRGFmbmEgSGlyc2No
ZmVsZCA8DQo+ID4gPiA+ID4gPiA+ID4gZGFmbmEuaGlyc2NoZmVsZEBjb2xsYWJvcmEuY29tDQo+
ID4gPiA+ID4gPiA+ID4gPiANCj4gPiA+ID4gPiA+ID4gPiANCj4gPiA+ID4gPiA+ID4gPiBSZXZp
ZXdlZC1ieTogSG91bG9uZyBXZWkgPGhvdWxvbmcud2VpQG1lZGlhdGVrLmNvbT4NCj4gPiA+ID4g
PiA+ID4gPiAtLS0NCj4gPiA+ID4gPiA+ID4gPiBjaGFuZ2VzIHNpbmNlIHYzOg0KPiA+ID4gPiA+
ID4gPiA+IDEuIG11bHRpbGUgLT4gbXVsdGlwbGUNCj4gPiA+ID4gPiA+ID4gPiAyLiBhZGQgaW5s
aW5lIGRvYw0KPiA+ID4gPiA+ID4gPiA+IA0KPiA+ID4gPiA+ID4gPiA+IGNoYW5nZXMgc2luY2Ug
djI6DQo+ID4gPiA+ID4gPiA+ID4gMS4gZG8gdGhlIGV4dHJhIGNvcHkgb25seSBpZiBsZW4gaXMg
bm90IG11bHRpcGxlIG9mIDgNCj4gPiA+ID4gPiA+ID4gPiANCj4gPiA+ID4gPiA+ID4gPiBjaGFu
Z2VzIHNpbmNlIHYxOg0KPiA+ID4gPiA+ID4gPiA+IDEuIGNoYW5nZSBzaWduLW9mZi1ieSB0YWdz
DQo+ID4gPiA+ID4gPiA+ID4gMi4gY2hhbmdlIHZhbHVlcyB0byBtZW1zZXQNCj4gPiA+ID4gPiA+
ID4gPiANCj4gPiA+ID4gPiA+ID4gPiAgICBkcml2ZXJzL21lZGlhL3BsYXRmb3JtL210ay12cHUv
bXRrX3ZwdS5jIHwgMTUNCj4gPiA+ID4gPiA+ID4gPiArKysrKysrKysrKysrKy0NCj4gPiA+ID4g
PiA+ID4gPiAgICAxIGZpbGUgY2hhbmdlZCwgMTQgaW5zZXJ0aW9ucygrKSwgMSBkZWxldGlvbigt
KQ0KPiA+ID4gPiA+ID4gPiA+IA0KPiA+ID4gPiA+ID4gPiA+IGRpZmYgLS1naXQgYS9kcml2ZXJz
L21lZGlhL3BsYXRmb3JtL210ay12cHUvbXRrX3ZwdS5jDQo+ID4gPiA+ID4gPiA+ID4gYi9kcml2
ZXJzL21lZGlhL3BsYXRmb3JtL210ay12cHUvbXRrX3ZwdS5jDQo+ID4gPiA+ID4gPiA+ID4gaW5k
ZXggZWMyOTBkZGU1OWNmLi4xZGYwMzE3MTZjOGYgMTAwNjQ0DQo+ID4gPiA+ID4gPiA+ID4gLS0t
IGEvZHJpdmVycy9tZWRpYS9wbGF0Zm9ybS9tdGstdnB1L210a192cHUuYw0KPiA+ID4gPiA+ID4g
PiA+ICsrKyBiL2RyaXZlcnMvbWVkaWEvcGxhdGZvcm0vbXRrLXZwdS9tdGtfdnB1LmMNCj4gPiA+
ID4gPiA+ID4gPiBAQCAtMzQ5LDcgKzM0OSwyMCBAQCBpbnQgdnB1X2lwaV9zZW5kKHN0cnVjdA0K
PiA+ID4gPiA+ID4gPiA+IHBsYXRmb3JtX2RldmljZQ0KPiA+ID4gPiA+ID4gPiA+ICpwZGV2LA0K
PiA+ID4gPiA+ID4gPiA+ICAgICAgICAgICAgICAgICB9DQo+ID4gPiA+ID4gPiA+ID4gICAgICAg
ICB9IHdoaWxlICh2cHVfY2ZnX3JlYWRsKHZwdSwgSE9TVF9UT19WUFUpKTsNCj4gPiA+ID4gPiA+
ID4gPiANCj4gPiA+ID4gPiA+ID4gPiAtICAgICBtZW1jcHlfdG9pbyhzZW5kX29iai0+c2hhcmVf
YnVmLCBidWYsIGxlbik7DQo+ID4gPiA+ID4gPiA+ID4gKyAgICAgLyoNCj4gPiA+ID4gPiA+ID4g
PiArICAgICAgKiB3aGVuIGNvcHlpbmcgZGF0YSB0byB0aGUgdnB1IGhhcmR3YXJlLCB0aGUNCj4g
PiA+ID4gPiA+ID4gPiBtZW1jcHlfdG9pbw0KPiA+ID4gPiA+ID4gPiA+IG9wZXJhdGlvbiBtdXN0
IGNvcHkNCj4gPiA+ID4gPiA+ID4gPiArICAgICAgKiBhIG11bHRpcGxlIG9mIDguIE90aGVyd2lz
ZSB0aGUgcHJvY2Vzc2luZw0KPiA+ID4gPiA+ID4gPiA+IGZhaWxzDQo+ID4gPiA+ID4gPiA+IA0K
PiA+ID4gPiA+ID4gPiBTYW1lIGhlcmU6IGl0IG5lZWRzIHRvIGV4cGxhaW4gd2h5IHRoZSBwcm9j
ZXNzaW5nIGZhaWxzLg0KPiA+ID4gPiA+IA0KPiA+ID4gPiA+IElzIHdyaXRpbmcgJ2R1ZSB0byBo
YXJkd2FyZSBvciBmaXJtd2FyZSBsaW1pdGF0aW9uJyBlbm91Z2g/DQo+ID4gPiA+ID4gSWYgbm90
LCB0aGVuIHdlIHNob3VsZCB3YWl0IGZvciBtZWRpYXRlayBwZW9wbGUncyByZXNwb25zZSB0bw0K
PiA+ID4gPiA+IGV4cGxhaW4NCj4gPiA+ID4gPiBpZiB0aGV5IGtub3cgbW9yZQ0KPiA+ID4gPiA+
IA0KPiA+ID4gPiA+ID4gPiANCj4gPiA+ID4gPiA+ID4gPiArICAgICAgKi8NCj4gPiA+ID4gPiA+
ID4gPiArICAgICBpZiAobGVuICUgOCAhPSAwKSB7DQo+ID4gPiA+ID4gPiA+ID4gKyAgICAgICAg
ICAgICB1bnNpZ25lZCBjaGFyIGRhdGFbU0hBUkVfQlVGX1NJWkVdOw0KPiA+ID4gPiA+ID4gPiAN
Cj4gPiA+ID4gPiA+ID4gV291bGRuJ3QgaXQgYmUgbW9yZSByb2J1c3QgaWYgeW91IHNheToNCj4g
PiA+ID4gPiA+ID4gDQo+ID4gPiA+ID4gPiA+ICAgICAgICAgICAgICAgICAgIHVuc2lnbmVkIGNo
YXIgZGF0YVtzaXplb2Yoc2VuZF9vYmotDQo+ID4gPiA+ID4gPiA+ID4gc2hhcmVfYnVmKV07DQo+
ID4gPiA+ID4gPiANCj4gPiA+ID4gPiA+IERlZmluaXRlbHkgeWVzLg0KPiA+ID4gPiA+IA0KPiA+
ID4gPiA+IEknbGwgc2VuZCB2NSBmaXhpbmcgdGhpcw0KPiA+ID4gPiA+IA0KPiA+ID4gPiA+ID4g
DQo+ID4gPiA+ID4gPiA+IA0KPiA+ID4gPiA+ID4gPiBJIGFsc28gdGhpbmsgdGhhdCB0aGUgU0hB
UkVfQlVGX1NJWkUgZGVmaW5lIG5lZWRzIGENCj4gPiA+ID4gPiA+ID4gY29tbWVudA0KPiA+ID4g
PiA+ID4gPiBzdGF0aW5nIHRoYXQgaXQgbXVzdCBiZSBhDQo+ID4gPiA+ID4gPiA+IG11bHRpcGxl
IG9mIDgsIG90aGVyd2lzZSB1bmV4cGVjdGVkIHRoaW5ncyBjYW4gaGFwcGVuLg0KPiA+ID4gPiA+
ID4gPiANCj4gPiA+ID4gPiA+ID4gWW91IGFsc28gbm90aWNlZCB0aGF0IHRoZSBjdXJyZW50IFNI
QVJFX0JVRl9TSVpFIGRlZmluZQ0KPiA+ID4gPiA+ID4gPiBpcyB0b28NCj4gPiA+ID4gPiA+ID4g
bG93LCBidXQgSSBzYXcNCj4gPiA+ID4gPiA+ID4gbm8gcGF0Y2ggY29ycmVjdGluZyB0aGlzLiBT
aG91bGRuJ3QgdGhhdCBiZSBmaXhlZCBhcw0KPiA+ID4gPiA+ID4gPiB3ZWxsPw0KPiA+ID4gPiA+
ID4gDQo+ID4gPiA+ID4gPiBBRkFJQ1QgdGhlIGZpcm13YXJlIGV4cGVjdHMgdGhpcyBleGFjdCBz
aXplIG9uIGl0cyBlbmQsIHNvDQo+ID4gPiA+ID4gPiBJDQo+ID4gPiA+ID4gPiBkb24ndA0KPiA+
ID4gPiA+ID4gYmVsaWV2ZSBpdCBjYW4gYmUgY2hhbmdlZCB0aGF0IGVhc2lseS4gQnV0IG1heWJl
IHNvbWVvbmUNCj4gPiA+ID4gPiA+IGZyb20gTVRLDQo+ID4gPiA+ID4gPiBjYW4NCj4gPiA+ID4g
PiA+IHByb3ZlIG1lIHdyb25nLg0KPiA+ID4gPiA+ID4gDQo+ID4gPiA+ID4gDQo+ID4gPiA+ID4g
SSBsb29rZWQgZnVydGhlciBhbmQgbm90ZWQgdGhhdCB0aGUgc3RydWN0cyB0aGF0IGFyZSBsYXJn
ZXINCj4gPiA+ID4gPiB0aGFuDQo+ID4gPiA+ID4gJ1NIQVJFX0JVRl9TSVpFJw0KPiA+ID4gPiA+
ICh2ZW5jX2FwX2lwaV9tc2dfZW5jX2V4dCB2ZW5jX2FwX2lwaV9tc2dfc2V0X3BhcmFtX2V4dCkN
Cj4gPiA+ID4gPiBhcmUgdXNlZCBieSBkcml2ZXJzIHRoYXQgZG9uJ3QgdXNlIHRoaXMgdnB1IGFw
aSwgc28gYWN0dWFsbHkNCj4gPiA+ID4gPiBTSEFSRV9CVUZfU0laRSBpcw0KPiA+ID4gPiA+IG5v
dCB0b28gbG93IGFuZCBhcyBDb3J1cmJvdCB3b3J0ZSBwcm9iYWJseSBub3QgY2hhbmdlYWJsZS4N
Cj4gPiA+ID4gPiANCj4gPiA+ID4gPiANCj4gPiA+ID4gPiBUaGFua3MsDQo+ID4gPiA+ID4gRGFm
bmENCj4gPiA+ID4gPiANCj4gPiA+ID4gPiA+IENoZWVycywNCj4gPiA+ID4gPiA+IEFsZXguDQo+
ID4gPiA+ID4gPiANCj4gPiA+ID4gDQo+ID4gPiA+IA0K

