Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 9C17020F6E0
	for <lists+linux-media@lfdr.de>; Tue, 30 Jun 2020 16:11:01 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731859AbgF3OLA (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 30 Jun 2020 10:11:00 -0400
Received: from mailgw02.mediatek.com ([210.61.82.184]:35376 "EHLO
        mailgw02.mediatek.com" rhost-flags-OK-FAIL-OK-FAIL) by vger.kernel.org
        with ESMTP id S1729908AbgF3OK7 (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 30 Jun 2020 10:10:59 -0400
X-UUID: 7355e478856f46dda6151b4e554d11f7-20200630
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
        h=Content-Transfer-Encoding:MIME-Version:Content-Type:References:In-Reply-To:Date:CC:To:From:Subject:Message-ID; bh=cxMnMMWUcVlBq3TyW4cE97CM4bI+Rge6V0CEfuXLJSs=;
        b=GVVje8vy47V91iiWKK/nPY7B2b5015LBDU7sMrA53GVdlYsnxBIBsng+47QeeH+E5YQ2UwykS2bVR74JAbiU6Qvl4E7sXk5xBzTKlEIvdulUP8f/DoAgZxL1twSFEpQmLLnDwDth+Vnucv2Nsa++zvlnmbQG9mr13iQhTFmRvTY=;
X-UUID: 7355e478856f46dda6151b4e554d11f7-20200630
Received: from mtkcas07.mediatek.inc [(172.21.101.84)] by mailgw02.mediatek.com
        (envelope-from <jerry-ch.chen@mediatek.com>)
        (Cellopoint E-mail Firewall v4.1.10 Build 0809 with TLS)
        with ESMTP id 871010070; Tue, 30 Jun 2020 22:10:54 +0800
Received: from MTKCAS06.mediatek.inc (172.21.101.30) by
 mtkmbs01n1.mediatek.inc (172.21.101.68) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Tue, 30 Jun 2020 22:10:50 +0800
Received: from [172.21.84.99] (172.21.84.99) by MTKCAS06.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Tue, 30 Jun 2020 22:10:50 +0800
Message-ID: <1593526253.29676.28.camel@mtksdccf07>
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
Date:   Tue, 30 Jun 2020 22:10:53 +0800
In-Reply-To: <20200521183825.GB249683@chromium.org>
References: <20191204124732.10932-1-Jerry-Ch.chen@mediatek.com>
         <1588903371.16825.14.camel@mtksdccf07>
         <CAAFQd5CP+gH3zG9fejBv_hTzeAExMoY+L38W8e4e3OSc-gVRHg@mail.gmail.com>
         <20200521183825.GB249683@chromium.org>
Content-Type: text/plain; charset="UTF-8"
X-Mailer: Evolution 3.2.3-0ubuntu6 
MIME-Version: 1.0
X-MTK:  N
Content-Transfer-Encoding: base64
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

SGkgVG9tYXN6LA0KDQpPbiBUaHUsIDIwMjAtMDUtMjEgYXQgMTg6MzggKzAwMDAsIFRvbWFzeiBG
aWdhIHdyb3RlOg0KPiBIaSBKZXJyeSwNCj4gDQo+IE9uIFdlZCwgTWF5IDEzLCAyMDIwIGF0IDEx
OjQ1OjM3UE0gKzAyMDAsIFRvbWFzeiBGaWdhIHdyb3RlOg0KPiA+IEhpIEplcnJ5LA0KPiA+IA0K
PiA+IE9uIEZyaSwgTWF5IDgsIDIwMjAgYXQgNDowMyBBTSBKZXJyeS1jaCBDaGVuIDxKZXJyeS1j
aC5DaGVuQG1lZGlhdGVrLmNvbT4gd3JvdGU6DQo+ID4gPg0KPiA+ID4gSGkgTGF1cmVudCwgVG9t
YXN6LCBNYXR0aGlhcywNCj4gPiA+DQo+ID4gPiBnZW50bGUgcGluZyBmb3IgdGhpcyBwYXRjaCBz
ZXQsDQo+ID4gPiBJZiBubyBuZXcgY29tbWVudHMsIEkgd291bGQgbGlrZSB0byBzZW5kIGEgbmV3
ZXIgdmVyc2lvbi4NCj4gPiA+DQo+ID4gDQo+ID4gU29ycnksIEkgc3RpbGwgaGF2ZW4ndCBoYWQg
YSBjaGFuY2UgdG8gbG9vayBhdCB0aGUgc2VyaWVzLCBzbyBmZWVsDQo+ID4gZnJlZSB0byBzZW5k
IGEgbmV3IHZlcnNpb24gYW5kIEkgd2lsbCB0YWtlIGEgbG9vayBhdCB0aGUgbmV3IG9uZS4NCj4g
PiANCj4gDQo+IEZpbmFsbHkgZm91bmQgc29tZSB0aW1lIHRvIHJldmlldyB0aGUgc2VyaWVzLiBB
Z2FpbiBzb3JyeSBmb3IgdGhlIGRlbGF5DQo+IGFuZCB0aGFua3MgZm9yIHlvdXIgcGF0aWVuY2Uu
DQo+IA0KPiBTb21lIGdlbmVyYWwgY29tbWVudHM6DQo+IDEpIFRoZSBtZXRhZGF0YSBmb3JtYXQg
Rm91ckNDIHNob3VsZCBiZSBhZGRlZCBpbiBhIHNlcGFyYXRlIHBhdGNoLA0KPiB0b2dldGhlciB3
aXRoIGRvY3VtZW50YXRpb24gZm9yIGl0Lg0KPiAyKSBDb250cm9sIElEcywgc3RydWN0cyB1c2Vk
IGJ5IHRoZSB1c2Vyc3BhY2UsIGV0Yy4gc2hvdWxkIGJlIGRlZmluZWQgaW4NCj4gYSBoZWFkZXIg
dW5kZXIgaW5jbHVkZS91YXBpL2xpbnV4Lg0KPiANCj4gUGxlYXNlIGFsc28gY2hlY2sgbXkgcmVw
bGllcyB0byBwYXJ0aWN1bGFyIHBhdGNoZXMgZm9yIGZ1cnRoZXIgY29tbWVudHMuDQo+IA0KPiBC
ZXN0IHJlZ2FyZHMsDQo+IFRvbWFzeg0KDQpBcHByZWNpYXRlIGZvciB5b3VyIHJlcGx5LA0KDQpT
byBmYXIsIEkndmUgbG9jYWxseSBjcmVhdGVkIGFuIHVhcGkgaGVhZGVyOg0KaW5jbHVkZS91YXBp
L2xpbnV4L210a19mZF80MC5oDQp3aGljaCBwcm92aWRlcyBzb21lIHZhbHVlcywgY29udHJvbCBp
ZHMsIGFuZCB0aGUgZGVmaW5pdGlvbnMgb2YNCnN0cnVjdHVyZXMgdGhhdCB3b3VsZCBiZSBuZWVk
ZWQgYnkgdXNlciBvZiBtdGtfZmRfNDAgZHJpdmVyLg0KSW4gYWRkaXRpb24sIEkgYWxzbyBwcm92
aWRlIGEgTUFDUk8gYXMgZXhhbXBsZSBpbiBjb21tZW50cyB0aGF0IGNhbg0KZXh0cmFjdCB0aGUg
c3RydWN0IG1lbWJlciB3aXRoIGJpdCBsZW5ndGggYW5kIG9mZnNldA0KZGVmaW5pdGlvbnMoZWxp
bWluYXRlIHRoZSBiaXQtZmllbGRzKS4NCg0KQWxzbywgSSB3b3VsZCBsaWtlIHRvIHJlbmFtZSBz
dHJ1Y3QgZmRfdXNlcl9vdXRwdXQgd2l0aCBzdHJ1Y3QNCm10a19mZF9od19yZXN1bHQuIEkgd29y
cnkgZmRfdXNlcl9vdXRwdXQgd291bGQgYmUgYSBjb25mdXNpbmcgbmFtZS4NCkkgd2lsbCBhZGQg
dGhlbSBpbiBhIHNlcGFyYXRlIHBhdGNoIGluIG5leHQgdmVyc2lvbi4NCg0KSSBhbSBzdGlsbCB3
b3JraW5nIG9uIHRoZSBkb2N1bWVudGF0aW9uLCB3aGljaCBtaWdodCBiZQ0KRG9jdW1lbnRhdGlv
bi9tZWRpYS91YXBpL3Y0bC9waXhmbXQtbWV0YS1tdGstZmQtNDAucnN0Lg0KUmVmZXJpbmcgdGhl
IG90aGVyIHBpeGZtdC0qLnJzdCBmaWxlcywgSSB3aWxsIHRyeSB0byBwcm92aWRlIHRoZQ0KZmxh
dC10YWJsZSBvZiB0aGUgbWV0YWRhdGEgd2l0aCB0aGUgc3RydWN0dXJlIG9mIHRoZSBtdGtfZmRf
aHdfcmVzdWx0Lg0KDQpJIGFtIGNvbmZ1c2luZyB0aGF0IHNob3VsZCBJIHJlbWFpbiB0aGUgbmFt
ZSB3aXRoIC00MCBpbiB0aGUgdGFpbCBvZiByc3QNCmZpbGU/DQpTaW5jZSBJIHRoaW5rIHRoZSBs
YXlvdXQgb2YgbWV0YWRhdGEgbWlnaHQgYmUgZGlmZmVyZW50IGluIHRoZSBmdXR1cmUNCm10ayBm
ZCBkcml2ZXJzLiBNYXliZSB0aGV5IGNyZWF0ZSBhIG5ldyBvbmUgb3Igc2hvdWxkIHRoZXkgdXBk
YXRlIHRoZQ0KcnN0IGZpbGUgd2hlbiB0aGV5IGFyZSB1cHN0cmVhbWluZz8NCg0KT3RoZXIgY29t
bWVudHMgYXJlIGFsbW9zdCBmaXhlZCwgSSB3aWxsIGluZm9ybSB5b3UgYnkgdGhpcyBtYWlsIHRo
cmVhZA0KYXMgc29vbiBhcyBJIGZpbmlzaCB0aGUgZG9jdW1lbnRhdGlvbiBvZiBmZCBtZXRhZGF0
YSBmb3JtYXQuDQoNClNvcnJ5IGZvciB0aGUgbGF0ZSByZXNwb25zZSwNClRoYW5rcyBhbmQgQmVz
dCBSZWdhcmRzLA0KSmVycnkNCg==

