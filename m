Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E21812B04B2
	for <lists+linux-media@lfdr.de>; Thu, 12 Nov 2020 13:05:42 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728206AbgKLMFk (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 12 Nov 2020 07:05:40 -0500
Received: from mailgw02.mediatek.com ([210.61.82.184]:42413 "EHLO
        mailgw02.mediatek.com" rhost-flags-OK-FAIL-OK-FAIL) by vger.kernel.org
        with ESMTP id S1728001AbgKLMFk (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 12 Nov 2020 07:05:40 -0500
X-UUID: a4ddf62b2e4446c9a2a708d52a33d90c-20201112
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
        h=Content-Transfer-Encoding:MIME-Version:Content-Type:References:In-Reply-To:Date:CC:To:From:Subject:Message-ID; bh=rkrx/0y+VLVHdkKRHQGj2MOMnmnQL8tfJKLnA8geVFk=;
        b=XZqZB5CkTknpR5L7XeD6020kQTrNLzxEh/pvLvUakBrBT3wafUf5SaBBEzvhOtTQqG4VL8rbXPt4CUikhZAFSkZvptgPaVL0thdz+OAc19lAUzu3delZxAlZLOABsALExF2ONc11AIZ89A/zwQYoXXN8p1teb15tp4xko/Coulc=;
X-UUID: a4ddf62b2e4446c9a2a708d52a33d90c-20201112
Received: from mtkcas08.mediatek.inc [(172.21.101.126)] by mailgw02.mediatek.com
        (envelope-from <jerry-ch.chen@mediatek.com>)
        (Cellopoint E-mail Firewall v4.1.14 Build 0819 with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
        with ESMTP id 1776318028; Thu, 12 Nov 2020 20:05:35 +0800
Received: from mtkcas10.mediatek.inc (172.21.101.39) by
 mtkmbs08n2.mediatek.inc (172.21.101.56) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Thu, 12 Nov 2020 20:05:33 +0800
Received: from [172.21.84.99] (172.21.84.99) by mtkcas10.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Thu, 12 Nov 2020 20:05:33 +0800
Message-ID: <1605182733.28992.12.camel@mtksdccf07>
Subject: Re: [RFC PATCH V4 0/4] media: platform: Add support for Face
 Detection (FD) on mt8183 SoC
From:   Jerry-ch Chen <Jerry-ch.Chen@mediatek.com>
To:     Tomasz Figa <tfiga@chromium.org>
CC:     "hans.verkuil@cisco.com" <hans.verkuil@cisco.com>,
        HansVerkuil <hverkuil@xs4all.nl>,
        "laurent.pinchart+renesas@ideasonboard.com" 
        <laurent.pinchart+renesas@ideasonboard.com>,
        "matthias.bgg@gmail.com" <matthias.bgg@gmail.com>,
        "mchehab@kernel.org" <mchehab@kernel.org>,
        "pihsun@chromium.org" <pihsun@chromium.org>,
        "yuzhao@chromium.org" <yuzhao@chromium.org>,
        "zwisler@chromium.org" <zwisler@chromium.org>,
        "linux-mediatek@lists.infradead.org" 
        <linux-mediatek@lists.infradead.org>,
        "linux-arm-kernel@lists.infradead.org" 
        <linux-arm-kernel@lists.infradead.org>,
        Sean Cheng =?UTF-8?Q?=28=E9=84=AD=E6=98=87=E5=BC=98=29?= 
        <Sean.Cheng@mediatek.com>,
        "Sj Huang =?UTF-8?Q?=28=E9=BB=83=E4=BF=A1=E7=92=8B=29?=" 
        <sj.huang@mediatek.com>,
        Christie Yu =?UTF-8?Q?=28=E6=B8=B8=E9=9B=85=E6=83=A0=29?= 
        <christie.yu@mediatek.com>,
        Frederic Chen =?UTF-8?Q?=28=E9=99=B3=E4=BF=8A=E5=85=83=29?= 
        <Frederic.Chen@mediatek.com>,
        Jungo Lin =?UTF-8?Q?=28=E6=9E=97=E6=98=8E=E4=BF=8A=29?= 
        <jungo.lin@mediatek.com>,
        "linux-media@vger.kernel.org" <linux-media@vger.kernel.org>,
        srv_heupstream <srv_heupstream@mediatek.com>,
        "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
        <jerry-ch.chen@mediatek.com>
Date:   Thu, 12 Nov 2020 20:05:33 +0800
In-Reply-To: <CAAFQd5CeZYOAxwHjsVOV9eJRt15-npTsH15Y5idwr3-ux+85qQ@mail.gmail.com>
References: <20191204124732.10932-1-Jerry-Ch.chen@mediatek.com>
         <1588903371.16825.14.camel@mtksdccf07>
         <CAAFQd5CP+gH3zG9fejBv_hTzeAExMoY+L38W8e4e3OSc-gVRHg@mail.gmail.com>
         <20200521183825.GB249683@chromium.org>
         <1593526253.29676.28.camel@mtksdccf07>
         <20200630171912.GE1212092@chromium.org>
         <1605095509.28992.7.camel@mtksdccf07>
         <CAAFQd5CeZYOAxwHjsVOV9eJRt15-npTsH15Y5idwr3-ux+85qQ@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"
X-Mailer: Evolution 3.2.3-0ubuntu6 
MIME-Version: 1.0
X-TM-SNTS-SMTP: D5DC22526726D3CEFEB905176DBDB94E8FD03992B6158F35E624E84112C052132000:8
X-MTK:  N
Content-Transfer-Encoding: base64
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

SGkgVG9tYXN6LA0KDQpPbiBUaHUsIDIwMjAtMTEtMTIgYXQgMTM6MjYgKzA5MDAsIFRvbWFzeiBG
aWdhIHdyb3RlOg0KPiBPbiBXZWQsIE5vdiAxMSwgMjAyMCBhdCA4OjUxIFBNIEplcnJ5LWNoIENo
ZW4NCj4gPEplcnJ5LWNoLkNoZW5AbWVkaWF0ZWsuY29tPiB3cm90ZToNCj4gPg0KPiA+IEhpIFRv
bWFzeiwNCj4gPg0KPiA+IE9uIFdlZCwgMjAyMC0wNy0wMSBhdCAwMToxOSArMDgwMCwgVG9tYXN6
IEZpZ2Egd3JvdGU6DQo+ID4gPiBIaSBKZXJyeSwNCj4gPiA+DQo+ID4gPiBPbiBUdWUsIEp1biAz
MCwgMjAyMCBhdCAxMDoxMDo1M1BNICswODAwLCBKZXJyeS1jaCBDaGVuIHdyb3RlOg0KPiA+ID4g
PiBIaSBUb21hc3osDQo+ID4gPiA+DQo+ID4gPiA+IE9uIFRodSwgMjAyMC0wNS0yMSBhdCAxODoz
OCArMDAwMCwgVG9tYXN6IEZpZ2Egd3JvdGU6DQo+ID4gPiA+ID4gSGkgSmVycnksDQo+ID4gPiA+
ID4NCj4gPiA+ID4gPiBPbiBXZWQsIE1heSAxMywgMjAyMCBhdCAxMTo0NTozN1BNICswMjAwLCBU
b21hc3ogRmlnYSB3cm90ZToNCj4gPiA+ID4gPiA+IEhpIEplcnJ5LA0KPiA+ID4gPiA+ID4NCj4g
PiA+ID4gPiA+IE9uIEZyaSwgTWF5IDgsIDIwMjAgYXQgNDowMyBBTSBKZXJyeS1jaCBDaGVuIDxK
ZXJyeS1jaC5DaGVuQG1lZGlhdGVrLmNvbT4gd3JvdGU6DQo+ID4gPiA+ID4gPiA+DQo+ID4gPiA+
ID4gPiA+IEhpIExhdXJlbnQsIFRvbWFzeiwgTWF0dGhpYXMsDQo+ID4gPiA+ID4gPiA+DQo+ID4g
PiA+ID4gPiA+IGdlbnRsZSBwaW5nIGZvciB0aGlzIHBhdGNoIHNldCwNCj4gPiA+ID4gPiA+ID4g
SWYgbm8gbmV3IGNvbW1lbnRzLCBJIHdvdWxkIGxpa2UgdG8gc2VuZCBhIG5ld2VyIHZlcnNpb24u
DQo+ID4gPiA+ID4gPiA+DQo+ID4gPiA+ID4gPg0KPiA+ID4gPiA+ID4gU29ycnksIEkgc3RpbGwg
aGF2ZW4ndCBoYWQgYSBjaGFuY2UgdG8gbG9vayBhdCB0aGUgc2VyaWVzLCBzbyBmZWVsDQo+ID4g
PiA+ID4gPiBmcmVlIHRvIHNlbmQgYSBuZXcgdmVyc2lvbiBhbmQgSSB3aWxsIHRha2UgYSBsb29r
IGF0IHRoZSBuZXcgb25lLg0KPiA+ID4gPiA+ID4NCj4gPiA+ID4gPg0KPiA+ID4gPiA+IEZpbmFs
bHkgZm91bmQgc29tZSB0aW1lIHRvIHJldmlldyB0aGUgc2VyaWVzLiBBZ2FpbiBzb3JyeSBmb3Ig
dGhlIGRlbGF5DQo+ID4gPiA+ID4gYW5kIHRoYW5rcyBmb3IgeW91ciBwYXRpZW5jZS4NCj4gPiA+
ID4gPg0KPiA+ID4gPiA+IFNvbWUgZ2VuZXJhbCBjb21tZW50czoNCj4gPiA+ID4gPiAxKSBUaGUg
bWV0YWRhdGEgZm9ybWF0IEZvdXJDQyBzaG91bGQgYmUgYWRkZWQgaW4gYSBzZXBhcmF0ZSBwYXRj
aCwNCj4gPiA+ID4gPiB0b2dldGhlciB3aXRoIGRvY3VtZW50YXRpb24gZm9yIGl0Lg0KPiA+ID4g
PiA+IDIpIENvbnRyb2wgSURzLCBzdHJ1Y3RzIHVzZWQgYnkgdGhlIHVzZXJzcGFjZSwgZXRjLiBz
aG91bGQgYmUgZGVmaW5lZCBpbg0KPiA+ID4gPiA+IGEgaGVhZGVyIHVuZGVyIGluY2x1ZGUvdWFw
aS9saW51eC4NCj4gPiA+ID4gPg0KPiA+ID4gPiA+IFBsZWFzZSBhbHNvIGNoZWNrIG15IHJlcGxp
ZXMgdG8gcGFydGljdWxhciBwYXRjaGVzIGZvciBmdXJ0aGVyIGNvbW1lbnRzLg0KPiA+ID4gPiA+
DQo+ID4gPiA+ID4gQmVzdCByZWdhcmRzLA0KPiA+ID4gPiA+IFRvbWFzeg0KPiA+ID4gPg0KPiA+
ID4gPiBBcHByZWNpYXRlIGZvciB5b3VyIHJlcGx5LA0KPiA+ID4gPg0KPiA+ID4gPiBTbyBmYXIs
IEkndmUgbG9jYWxseSBjcmVhdGVkIGFuIHVhcGkgaGVhZGVyOg0KPiA+ID4gPiBpbmNsdWRlL3Vh
cGkvbGludXgvbXRrX2ZkXzQwLmgNCj4gPiA+ID4gd2hpY2ggcHJvdmlkZXMgc29tZSB2YWx1ZXMs
IGNvbnRyb2wgaWRzLCBhbmQgdGhlIGRlZmluaXRpb25zIG9mDQo+ID4gPiA+IHN0cnVjdHVyZXMg
dGhhdCB3b3VsZCBiZSBuZWVkZWQgYnkgdXNlciBvZiBtdGtfZmRfNDAgZHJpdmVyLg0KPiA+ID4g
PiBJbiBhZGRpdGlvbiwgSSBhbHNvIHByb3ZpZGUgYSBNQUNSTyBhcyBleGFtcGxlIGluIGNvbW1l
bnRzIHRoYXQgY2FuDQo+ID4gPiA+IGV4dHJhY3QgdGhlIHN0cnVjdCBtZW1iZXIgd2l0aCBiaXQg
bGVuZ3RoIGFuZCBvZmZzZXQNCj4gPiA+ID4gZGVmaW5pdGlvbnMoZWxpbWluYXRlIHRoZSBiaXQt
ZmllbGRzKS4NCj4gPiA+ID4NCj4gPiA+ID4gQWxzbywgSSB3b3VsZCBsaWtlIHRvIHJlbmFtZSBz
dHJ1Y3QgZmRfdXNlcl9vdXRwdXQgd2l0aCBzdHJ1Y3QNCj4gPiA+ID4gbXRrX2ZkX2h3X3Jlc3Vs
dC4gSSB3b3JyeSBmZF91c2VyX291dHB1dCB3b3VsZCBiZSBhIGNvbmZ1c2luZyBuYW1lLg0KPiA+
ID4NCj4gPiA+IFRoZSBjaGFuZ2Ugc291bmRzIGdvb2QgdG8gbWUuDQo+ID4gPg0KPiA+ID4gPiBJ
IHdpbGwgYWRkIHRoZW0gaW4gYSBzZXBhcmF0ZSBwYXRjaCBpbiBuZXh0IHZlcnNpb24uDQo+ID4g
PiA+DQo+ID4gPg0KPiA+ID4gT2theS4NCj4gPiA+DQo+ID4gPiA+IEkgYW0gc3RpbGwgd29ya2lu
ZyBvbiB0aGUgZG9jdW1lbnRhdGlvbiwgd2hpY2ggbWlnaHQgYmUNCj4gPiA+ID4gRG9jdW1lbnRh
dGlvbi9tZWRpYS91YXBpL3Y0bC9waXhmbXQtbWV0YS1tdGstZmQtNDAucnN0Lg0KPiA+ID4gPiBS
ZWZlcmluZyB0aGUgb3RoZXIgcGl4Zm10LSoucnN0IGZpbGVzLCBJIHdpbGwgdHJ5IHRvIHByb3Zp
ZGUgdGhlDQo+ID4gPiA+IGZsYXQtdGFibGUgb2YgdGhlIG1ldGFkYXRhIHdpdGggdGhlIHN0cnVj
dHVyZSBvZiB0aGUgbXRrX2ZkX2h3X3Jlc3VsdC4NCj4gPiA+ID4NCj4gPiA+DQo+ID4gPiBTb3Vu
ZHMgZ29vZCB0byBtZS4NCj4gPiA+DQo+ID4gPiA+IEkgYW0gY29uZnVzaW5nIHRoYXQgc2hvdWxk
IEkgcmVtYWluIHRoZSBuYW1lIHdpdGggLTQwIGluIHRoZSB0YWlsIG9mIHJzdA0KPiA+ID4gPiBm
aWxlPw0KPiA+ID4NCj4gPiA+IFRoZSBoZWFkZXIgYW5kIGRvY3VtZW50YXRpb24gZmlsZSBuYW1l
cyBzaG91bGQgbWF0Y2ggdGhlIGRyaXZlciBuYW1lLiAgSQ0KPiA+ID4ganVzdCBub3RpY2VkIHRo
ZXJlIGlzIHNvbWUgaW5jb25zaXN0ZW5jeSBpbiB0aGUgbmFtaW5nLCB0aG91Z2guIFRoZQ0KPiA+
ID4gZHJpdmVyIHNlZW1zIHRvIGJlIGxvY2F0ZWQgdW5kZXIgZHJpdmVycy9tZWRpYS9wbGF0Zm9y
bS9tdGstaXNwL2ZkLCBidXQNCj4gPiA+IHRoZSBkcml2ZXIgbmFtZSBpbiB0aGUgcGxhdGZvcm0g
ZHJpdmVyIHN0cnVjdCBhbmQgYXMgcmVwb3J0ZWQgYnkNCj4gPiA+IFZJRElPQ19RVUVSWUNBUCBz
ZWVtcyB0byBiZSAibXRrLWZkLTQuMCIuDQo+ID4NCj4gPiA+IFNpbmNlIHdlIGhhdmUgbWFueSBt
dGstKiBkcml2ZXJzIGluIHRoZSB0cmVlIGN1cnJlbnRseSwgSSB0aGluayBpdCBtaWdodA0KPiA+
ID4gbWFrZSBzZW5zZSB0byBjb25zb2xpZGF0ZSB0aGVtIHVuZGVyIGRyaXZlcnMvbWVkaWEvcGxh
dGZvcm0vbWVkaWF0ZWssDQo+ID4gPiBzaW1pbGFybHkgdG8gZHJpdmVycy9tZWRpYS9wbGF0Zm9y
bS9xY29tIG9yIC9yb2NrY2hpcC4gQnV0IGl0IGNvdWxkIGJlDQo+ID4gPiBkb25lIGxhdGVyLCBh
cyBhIGZvbGxvdy11cC4NCj4gPiA+DQo+ID4gPiBNeSBzdWdnZXN0aW9uIHdvdWxkIGJlIHRvIHBs
YWNlIHRoZSBkcml2ZXIgdW5kZXINCj4gPiA+IGRyaXZlcnMvbWVkaWEvcGxhdGZvcm0vbXRrLWZk
LTQwIGFuZCBhbHNvIHJlbmFtZSB0aGUgcmVsYXRlZCBLY29uZmlnDQo+ID4gPiBzeW1ib2wgdG8g
aW5jbHVkZSB0aGUgXzQwIHN1ZmZpeC4NCj4gPiA+DQo+ID4gPiBXaGF0IGRvIHlvdSB0aGluaz8N
Cj4gPiA+DQo+ID4NCj4gPiBJIEFwcHJlY2lhdGUgeW91ciBjb21tZW50cywNCj4gPiBTb3JyeSBm
b3IgdGhlIGxhdGUgcmVwbHkuDQo+ID4NCj4gPiBXb3VsZCBpdCBiZSBwb3NzaWJsZSBmb3IgbWUg
dG8gcmVwbGFjZSB0aGUgZHJpdmVyIGFzIGRyaXZlcnMvbWVkaWEvcGxhdGZvcm0vbXRrX2ZkL210
ay1mZC00MD8oSnVzdCBsaWtlIG10ay1pc3AvaXNwXzUwKQ0KPiA+DQo+IA0KPiBJJ20gbm90IGEg
YmlnIGZhbiBvZiBkdXBsaWNhdGluZyAibXRrIGZkIiBpbiB0aGUgcGF0aC4gSG93IGFib3V0IGp1
c3QNCj4gbWFraW5nIGl0IGRyaXZlcnMvbWVkaWEvcGxhdGZvcm0vbXRrLWZkLTQwPw0KPiANCg0K
T2ssIEkgd2lsbCBtYWtlIGl0IGRyaXZlcnMvbWVkaWEvcGxhdGZvcm0vbXRrLWZkLTQwLA0KYW5k
IGFsc28gcmVuYW1lIHRoZSByZWxhdGVkIEtjb25maWcgc3ltYm9sIHRvIGluY2x1ZGUgdGhlIF80
MCBzdWZmaXguDQoNClRoYW5rcyBhbmQgQmVzdCBSZWdhcmRzLA0KSmVycnkuDQoNCj4gQmVzdCBy
ZWdhcmRzLA0KPiBUb21hc3oNCg0K

