Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 283522AF008
	for <lists+linux-media@lfdr.de>; Wed, 11 Nov 2020 12:52:09 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726544AbgKKLwG (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 11 Nov 2020 06:52:06 -0500
Received: from mailgw02.mediatek.com ([210.61.82.184]:56929 "EHLO
        mailgw02.mediatek.com" rhost-flags-OK-FAIL-OK-FAIL) by vger.kernel.org
        with ESMTP id S1726519AbgKKLvy (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 11 Nov 2020 06:51:54 -0500
X-UUID: 578f816632e946a0a2429302cc0cc4b7-20201111
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
        h=Content-Transfer-Encoding:MIME-Version:Content-Type:References:In-Reply-To:Date:CC:To:From:Subject:Message-ID; bh=UhU4ckWuzFApvZG5zcI0GayqiwUyxV2bEVkr/AKfVEU=;
        b=U/NO7q7lgEde9ZIKTFF6eOj+TpvDiQqej2D0xy8jVDw9sn5LNIEpqs31bxwwHoHLVLURiKPXH4+2LHVydDkCeu9IXb0QHyfLmPyLav0ozfq28BHqkTxJvE6Z9MgEZS8bOOufK6HvLKfl2die2hSALnXt4Q1cCbQMCvlGGZkYHoU=;
X-UUID: 578f816632e946a0a2429302cc0cc4b7-20201111
Received: from mtkexhb01.mediatek.inc [(172.21.101.102)] by mailgw02.mediatek.com
        (envelope-from <jerry-ch.chen@mediatek.com>)
        (Cellopoint E-mail Firewall v4.1.14 Build 0819 with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
        with ESMTP id 1464959215; Wed, 11 Nov 2020 19:51:50 +0800
Received: from mtkcas07.mediatek.inc (172.21.101.84) by
 mtkmbs07n2.mediatek.inc (172.21.101.141) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Wed, 11 Nov 2020 19:51:48 +0800
Received: from [172.21.84.99] (172.21.84.99) by mtkcas07.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Wed, 11 Nov 2020 19:51:48 +0800
Message-ID: <1605095509.28992.7.camel@mtksdccf07>
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
        "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>
Date:   Wed, 11 Nov 2020 19:51:49 +0800
In-Reply-To: <20200630171912.GE1212092@chromium.org>
References: <20191204124732.10932-1-Jerry-Ch.chen@mediatek.com>
         <1588903371.16825.14.camel@mtksdccf07>
         <CAAFQd5CP+gH3zG9fejBv_hTzeAExMoY+L38W8e4e3OSc-gVRHg@mail.gmail.com>
         <20200521183825.GB249683@chromium.org>
         <1593526253.29676.28.camel@mtksdccf07>
         <20200630171912.GE1212092@chromium.org>
Content-Type: text/plain; charset="UTF-8"
X-Mailer: Evolution 3.2.3-0ubuntu6 
MIME-Version: 1.0
X-MTK:  N
Content-Transfer-Encoding: base64
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

SGkgVG9tYXN6LA0KDQpPbiBXZWQsIDIwMjAtMDctMDEgYXQgMDE6MTkgKzA4MDAsIFRvbWFzeiBG
aWdhIHdyb3RlOg0KPiBIaSBKZXJyeSwNCj4gDQo+IE9uIFR1ZSwgSnVuIDMwLCAyMDIwIGF0IDEw
OjEwOjUzUE0gKzA4MDAsIEplcnJ5LWNoIENoZW4gd3JvdGU6DQo+ID4gSGkgVG9tYXN6LA0KPiA+
IA0KPiA+IE9uIFRodSwgMjAyMC0wNS0yMSBhdCAxODozOCArMDAwMCwgVG9tYXN6IEZpZ2Egd3Jv
dGU6DQo+ID4gPiBIaSBKZXJyeSwNCj4gPiA+IA0KPiA+ID4gT24gV2VkLCBNYXkgMTMsIDIwMjAg
YXQgMTE6NDU6MzdQTSArMDIwMCwgVG9tYXN6IEZpZ2Egd3JvdGU6DQo+ID4gPiA+IEhpIEplcnJ5
LA0KPiA+ID4gPiANCj4gPiA+ID4gT24gRnJpLCBNYXkgOCwgMjAyMCBhdCA0OjAzIEFNIEplcnJ5
LWNoIENoZW4gPEplcnJ5LWNoLkNoZW5AbWVkaWF0ZWsuY29tPiB3cm90ZToNCj4gPiA+ID4gPg0K
PiA+ID4gPiA+IEhpIExhdXJlbnQsIFRvbWFzeiwgTWF0dGhpYXMsDQo+ID4gPiA+ID4NCj4gPiA+
ID4gPiBnZW50bGUgcGluZyBmb3IgdGhpcyBwYXRjaCBzZXQsDQo+ID4gPiA+ID4gSWYgbm8gbmV3
IGNvbW1lbnRzLCBJIHdvdWxkIGxpa2UgdG8gc2VuZCBhIG5ld2VyIHZlcnNpb24uDQo+ID4gPiA+
ID4NCj4gPiA+ID4gDQo+ID4gPiA+IFNvcnJ5LCBJIHN0aWxsIGhhdmVuJ3QgaGFkIGEgY2hhbmNl
IHRvIGxvb2sgYXQgdGhlIHNlcmllcywgc28gZmVlbA0KPiA+ID4gPiBmcmVlIHRvIHNlbmQgYSBu
ZXcgdmVyc2lvbiBhbmQgSSB3aWxsIHRha2UgYSBsb29rIGF0IHRoZSBuZXcgb25lLg0KPiA+ID4g
PiANCj4gPiA+IA0KPiA+ID4gRmluYWxseSBmb3VuZCBzb21lIHRpbWUgdG8gcmV2aWV3IHRoZSBz
ZXJpZXMuIEFnYWluIHNvcnJ5IGZvciB0aGUgZGVsYXkNCj4gPiA+IGFuZCB0aGFua3MgZm9yIHlv
dXIgcGF0aWVuY2UuDQo+ID4gPiANCj4gPiA+IFNvbWUgZ2VuZXJhbCBjb21tZW50czoNCj4gPiA+
IDEpIFRoZSBtZXRhZGF0YSBmb3JtYXQgRm91ckNDIHNob3VsZCBiZSBhZGRlZCBpbiBhIHNlcGFy
YXRlIHBhdGNoLA0KPiA+ID4gdG9nZXRoZXIgd2l0aCBkb2N1bWVudGF0aW9uIGZvciBpdC4NCj4g
PiA+IDIpIENvbnRyb2wgSURzLCBzdHJ1Y3RzIHVzZWQgYnkgdGhlIHVzZXJzcGFjZSwgZXRjLiBz
aG91bGQgYmUgZGVmaW5lZCBpbg0KPiA+ID4gYSBoZWFkZXIgdW5kZXIgaW5jbHVkZS91YXBpL2xp
bnV4Lg0KPiA+ID4gDQo+ID4gPiBQbGVhc2UgYWxzbyBjaGVjayBteSByZXBsaWVzIHRvIHBhcnRp
Y3VsYXIgcGF0Y2hlcyBmb3IgZnVydGhlciBjb21tZW50cy4NCj4gPiA+IA0KPiA+ID4gQmVzdCBy
ZWdhcmRzLA0KPiA+ID4gVG9tYXN6DQo+ID4gDQo+ID4gQXBwcmVjaWF0ZSBmb3IgeW91ciByZXBs
eSwNCj4gPiANCj4gPiBTbyBmYXIsIEkndmUgbG9jYWxseSBjcmVhdGVkIGFuIHVhcGkgaGVhZGVy
Og0KPiA+IGluY2x1ZGUvdWFwaS9saW51eC9tdGtfZmRfNDAuaA0KPiA+IHdoaWNoIHByb3ZpZGVz
IHNvbWUgdmFsdWVzLCBjb250cm9sIGlkcywgYW5kIHRoZSBkZWZpbml0aW9ucyBvZg0KPiA+IHN0
cnVjdHVyZXMgdGhhdCB3b3VsZCBiZSBuZWVkZWQgYnkgdXNlciBvZiBtdGtfZmRfNDAgZHJpdmVy
Lg0KPiA+IEluIGFkZGl0aW9uLCBJIGFsc28gcHJvdmlkZSBhIE1BQ1JPIGFzIGV4YW1wbGUgaW4g
Y29tbWVudHMgdGhhdCBjYW4NCj4gPiBleHRyYWN0IHRoZSBzdHJ1Y3QgbWVtYmVyIHdpdGggYml0
IGxlbmd0aCBhbmQgb2Zmc2V0DQo+ID4gZGVmaW5pdGlvbnMoZWxpbWluYXRlIHRoZSBiaXQtZmll
bGRzKS4NCj4gPiANCj4gPiBBbHNvLCBJIHdvdWxkIGxpa2UgdG8gcmVuYW1lIHN0cnVjdCBmZF91
c2VyX291dHB1dCB3aXRoIHN0cnVjdA0KPiA+IG10a19mZF9od19yZXN1bHQuIEkgd29ycnkgZmRf
dXNlcl9vdXRwdXQgd291bGQgYmUgYSBjb25mdXNpbmcgbmFtZS4NCj4gDQo+IFRoZSBjaGFuZ2Ug
c291bmRzIGdvb2QgdG8gbWUuDQo+IA0KPiA+IEkgd2lsbCBhZGQgdGhlbSBpbiBhIHNlcGFyYXRl
IHBhdGNoIGluIG5leHQgdmVyc2lvbi4NCj4gPiANCj4gDQo+IE9rYXkuDQo+IA0KPiA+IEkgYW0g
c3RpbGwgd29ya2luZyBvbiB0aGUgZG9jdW1lbnRhdGlvbiwgd2hpY2ggbWlnaHQgYmUNCj4gPiBE
b2N1bWVudGF0aW9uL21lZGlhL3VhcGkvdjRsL3BpeGZtdC1tZXRhLW10ay1mZC00MC5yc3QuDQo+
ID4gUmVmZXJpbmcgdGhlIG90aGVyIHBpeGZtdC0qLnJzdCBmaWxlcywgSSB3aWxsIHRyeSB0byBw
cm92aWRlIHRoZQ0KPiA+IGZsYXQtdGFibGUgb2YgdGhlIG1ldGFkYXRhIHdpdGggdGhlIHN0cnVj
dHVyZSBvZiB0aGUgbXRrX2ZkX2h3X3Jlc3VsdC4NCj4gPiANCj4gDQo+IFNvdW5kcyBnb29kIHRv
IG1lLg0KPiANCj4gPiBJIGFtIGNvbmZ1c2luZyB0aGF0IHNob3VsZCBJIHJlbWFpbiB0aGUgbmFt
ZSB3aXRoIC00MCBpbiB0aGUgdGFpbCBvZiByc3QNCj4gPiBmaWxlPw0KPiANCj4gVGhlIGhlYWRl
ciBhbmQgZG9jdW1lbnRhdGlvbiBmaWxlIG5hbWVzIHNob3VsZCBtYXRjaCB0aGUgZHJpdmVyIG5h
bWUuICBJDQo+IGp1c3Qgbm90aWNlZCB0aGVyZSBpcyBzb21lIGluY29uc2lzdGVuY3kgaW4gdGhl
IG5hbWluZywgdGhvdWdoLiBUaGUNCj4gZHJpdmVyIHNlZW1zIHRvIGJlIGxvY2F0ZWQgdW5kZXIg
ZHJpdmVycy9tZWRpYS9wbGF0Zm9ybS9tdGstaXNwL2ZkLCBidXQNCj4gdGhlIGRyaXZlciBuYW1l
IGluIHRoZSBwbGF0Zm9ybSBkcml2ZXIgc3RydWN0IGFuZCBhcyByZXBvcnRlZCBieQ0KPiBWSURJ
T0NfUVVFUllDQVAgc2VlbXMgdG8gYmUgIm10ay1mZC00LjAiLiANCg0KPiBTaW5jZSB3ZSBoYXZl
IG1hbnkgbXRrLSogZHJpdmVycyBpbiB0aGUgdHJlZSBjdXJyZW50bHksIEkgdGhpbmsgaXQgbWln
aHQNCj4gbWFrZSBzZW5zZSB0byBjb25zb2xpZGF0ZSB0aGVtIHVuZGVyIGRyaXZlcnMvbWVkaWEv
cGxhdGZvcm0vbWVkaWF0ZWssDQo+IHNpbWlsYXJseSB0byBkcml2ZXJzL21lZGlhL3BsYXRmb3Jt
L3Fjb20gb3IgL3JvY2tjaGlwLiBCdXQgaXQgY291bGQgYmUNCj4gZG9uZSBsYXRlciwgYXMgYSBm
b2xsb3ctdXAuDQo+IA0KPiBNeSBzdWdnZXN0aW9uIHdvdWxkIGJlIHRvIHBsYWNlIHRoZSBkcml2
ZXIgdW5kZXINCj4gZHJpdmVycy9tZWRpYS9wbGF0Zm9ybS9tdGstZmQtNDAgYW5kIGFsc28gcmVu
YW1lIHRoZSByZWxhdGVkIEtjb25maWcNCj4gc3ltYm9sIHRvIGluY2x1ZGUgdGhlIF80MCBzdWZm
aXguDQo+IA0KPiBXaGF0IGRvIHlvdSB0aGluaz8NCj4gDQoNCkkgQXBwcmVjaWF0ZSB5b3VyIGNv
bW1lbnRzLA0KU29ycnkgZm9yIHRoZSBsYXRlIHJlcGx5Lg0KDQpXb3VsZCBpdCBiZSBwb3NzaWJs
ZSBmb3IgbWUgdG8gcmVwbGFjZSB0aGUgZHJpdmVyIGFzIGRyaXZlcnMvbWVkaWEvcGxhdGZvcm0v
bXRrX2ZkL210ay1mZC00MD8oSnVzdCBsaWtlIG10ay1pc3AvaXNwXzUwKQ0KDQo+ID4gU2luY2Ug
SSB0aGluayB0aGUgbGF5b3V0IG9mIG1ldGFkYXRhIG1pZ2h0IGJlIGRpZmZlcmVudCBpbiB0aGUg
ZnV0dXJlDQo+ID4gbXRrIGZkIGRyaXZlcnMuIE1heWJlIHRoZXkgY3JlYXRlIGEgbmV3IG9uZSBv
ciBzaG91bGQgdGhleSB1cGRhdGUgdGhlDQo+ID4gcnN0IGZpbGUgd2hlbiB0aGV5IGFyZSB1cHN0
cmVhbWluZz8NCj4gPiANCj4gDQo+IEkgdGhpbmsgd2UnbGwgZGVjaWRlIHdoYXQgdG8gZG8gd2hl
biB0aGF0IGhhcHBlbnMuIERlcGVuZGluZyBvbiB3aGV0aGVyDQo+IHRoZXJlIGlzIG1vcmUgZmFj
ZSBkZXRlY3Rpb24gaGFyZHdhcmUgYXZhaWxhYmxlLCB3ZSBtaWdodCBiZSBhYmxlIHRvDQo+IG1p
Z3JhdGUgdG8gc3RhbmRhcmQgY29udHJvbHMgYW5kIG1ldGFkYXRhIGJ1ZmZlciBmb3JtYXRzIGF0
IHRoYXQgdGltZS4NCj4gDQpPay4NCg0KPiA+IE90aGVyIGNvbW1lbnRzIGFyZSBhbG1vc3QgZml4
ZWQsIEkgd2lsbCBpbmZvcm0geW91IGJ5IHRoaXMgbWFpbCB0aHJlYWQNCj4gPiBhcyBzb29uIGFz
IEkgZmluaXNoIHRoZSBkb2N1bWVudGF0aW9uIG9mIGZkIG1ldGFkYXRhIGZvcm1hdC4NCj4gDQo+
IE9rYXksIHRoYW5rcy4NCj4gDQo+IEJlc3QgcmVnYXJkcywNCj4gVG9tYXN6DQoNClRoYW5rcyBh
bmQgQmVzdCBSZWdhcmRzLA0KSmVycnkNCg0K

