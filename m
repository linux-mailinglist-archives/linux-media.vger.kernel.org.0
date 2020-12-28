Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 271442E6988
	for <lists+linux-media@lfdr.de>; Mon, 28 Dec 2020 18:05:05 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728022AbgL1RDJ (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 28 Dec 2020 12:03:09 -0500
Received: from mailgw01.mediatek.com ([210.61.82.183]:47765 "EHLO
        mailgw01.mediatek.com" rhost-flags-OK-FAIL-OK-FAIL) by vger.kernel.org
        with ESMTP id S1727993AbgL1RDJ (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 28 Dec 2020 12:03:09 -0500
X-UUID: 055633af851147eebbc5b48d86d3a51b-20201229
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
        h=Content-Transfer-Encoding:MIME-Version:Content-Type:References:In-Reply-To:Date:CC:To:From:Subject:Message-ID; bh=MKcGaDmRcVBvqDrJbkq1CbbgmmDaPv8lVjeRUC8j44s=;
        b=uabjDfIplXpYFkdbBNisq5KG98ovAvMLn0LMZbeVIBM8qPNo2Z+M3Bkrm+p7/MPnUmHNixg9wm7KMbPkBtDl76bnFOapQ7asYZ/acVAmBxhK8VXxjP0WF6rw0+mtkaLjDXoeVkOxTxYxNUftRJtYB21FI07+7qAYEuEdn8yluQQ=;
X-UUID: 055633af851147eebbc5b48d86d3a51b-20201229
Received: from mtkcas10.mediatek.inc [(172.21.101.39)] by mailgw01.mediatek.com
        (envelope-from <jerry-ch.chen@mediatek.com>)
        (Cellopoint E-mail Firewall v4.1.14 Build 0819 with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
        with ESMTP id 506157940; Tue, 29 Dec 2020 01:02:25 +0800
Received: from mtkcas07.mediatek.inc (172.21.101.84) by
 mtkmbs06n2.mediatek.inc (172.21.101.130) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Tue, 29 Dec 2020 01:02:22 +0800
Received: from [172.21.84.99] (172.21.84.99) by mtkcas07.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Tue, 29 Dec 2020 01:03:30 +0800
Message-ID: <1609174942.3068.9.camel@mtksdccf07>
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
Date:   Tue, 29 Dec 2020 01:02:22 +0800
In-Reply-To: <1605182733.28992.12.camel@mtksdccf07>
References: <20191204124732.10932-1-Jerry-Ch.chen@mediatek.com>
         <1588903371.16825.14.camel@mtksdccf07>
         <CAAFQd5CP+gH3zG9fejBv_hTzeAExMoY+L38W8e4e3OSc-gVRHg@mail.gmail.com>
         <20200521183825.GB249683@chromium.org>
         <1593526253.29676.28.camel@mtksdccf07>
         <20200630171912.GE1212092@chromium.org>
         <1605095509.28992.7.camel@mtksdccf07>
         <CAAFQd5CeZYOAxwHjsVOV9eJRt15-npTsH15Y5idwr3-ux+85qQ@mail.gmail.com>
         <1605182733.28992.12.camel@mtksdccf07>
Content-Type: text/plain; charset="UTF-8"
X-Mailer: Evolution 3.2.3-0ubuntu6 
MIME-Version: 1.0
X-TM-SNTS-SMTP: 8CB3A893A9AB6C3BBF7C61ED52F91BA0A7C48437C37AB22DA5155F362C3E85E02000:8
X-MTK:  N
Content-Transfer-Encoding: base64
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

SGkgVG9tYXN6LA0KDQpPbiBUaHUsIDIwMjAtMTEtMTIgYXQgMjA6MDUgKzA4MDAsIEplcnJ5LWNo
IENoZW4gd3JvdGU6DQo+IEhpIFRvbWFzeiwNCj4gDQo+IE9uIFRodSwgMjAyMC0xMS0xMiBhdCAx
MzoyNiArMDkwMCwgVG9tYXN6IEZpZ2Egd3JvdGU6DQo+ID4gT24gV2VkLCBOb3YgMTEsIDIwMjAg
YXQgODo1MSBQTSBKZXJyeS1jaCBDaGVuDQo+ID4gPEplcnJ5LWNoLkNoZW5AbWVkaWF0ZWsuY29t
PiB3cm90ZToNCj4gPiA+DQo+ID4gPiBIaSBUb21hc3osDQo+ID4gPg0KPiA+ID4gT24gV2VkLCAy
MDIwLTA3LTAxIGF0IDAxOjE5ICswODAwLCBUb21hc3ogRmlnYSB3cm90ZToNCj4gPiA+ID4gSGkg
SmVycnksDQo+ID4gPiA+DQo+ID4gPiA+IE9uIFR1ZSwgSnVuIDMwLCAyMDIwIGF0IDEwOjEwOjUz
UE0gKzA4MDAsIEplcnJ5LWNoIENoZW4gd3JvdGU6DQo+ID4gPiA+ID4gSGkgVG9tYXN6LA0KPiA+
ID4gPiA+DQo+ID4gPiA+ID4gT24gVGh1LCAyMDIwLTA1LTIxIGF0IDE4OjM4ICswMDAwLCBUb21h
c3ogRmlnYSB3cm90ZToNCj4gPiA+ID4gPiA+IEhpIEplcnJ5LA0KPiA+ID4gPiA+ID4NCj4gPiA+
ID4gPiA+IE9uIFdlZCwgTWF5IDEzLCAyMDIwIGF0IDExOjQ1OjM3UE0gKzAyMDAsIFRvbWFzeiBG
aWdhIHdyb3RlOg0KPiA+ID4gPiA+ID4gPiBIaSBKZXJyeSwNCj4gPiA+ID4gPiA+ID4NCj4gPiA+
ID4gPiA+ID4gT24gRnJpLCBNYXkgOCwgMjAyMCBhdCA0OjAzIEFNIEplcnJ5LWNoIENoZW4gPEpl
cnJ5LWNoLkNoZW5AbWVkaWF0ZWsuY29tPiB3cm90ZToNCj4gPiA+ID4gPiA+ID4gPg0KPiA+ID4g
PiA+ID4gPiA+IEhpIExhdXJlbnQsIFRvbWFzeiwgTWF0dGhpYXMsDQo+ID4gPiA+ID4gPiA+ID4N
Cj4gPiA+ID4gPiA+ID4gPiBnZW50bGUgcGluZyBmb3IgdGhpcyBwYXRjaCBzZXQsDQo+ID4gPiA+
ID4gPiA+ID4gSWYgbm8gbmV3IGNvbW1lbnRzLCBJIHdvdWxkIGxpa2UgdG8gc2VuZCBhIG5ld2Vy
IHZlcnNpb24uDQo+ID4gPiA+ID4gPiA+ID4NCj4gPiA+ID4gPiA+ID4NCj4gPiA+ID4gPiA+ID4g
U29ycnksIEkgc3RpbGwgaGF2ZW4ndCBoYWQgYSBjaGFuY2UgdG8gbG9vayBhdCB0aGUgc2VyaWVz
LCBzbyBmZWVsDQo+ID4gPiA+ID4gPiA+IGZyZWUgdG8gc2VuZCBhIG5ldyB2ZXJzaW9uIGFuZCBJ
IHdpbGwgdGFrZSBhIGxvb2sgYXQgdGhlIG5ldyBvbmUuDQo+ID4gPiA+ID4gPiA+DQo+ID4gPiA+
ID4gPg0KPiA+ID4gPiA+ID4gRmluYWxseSBmb3VuZCBzb21lIHRpbWUgdG8gcmV2aWV3IHRoZSBz
ZXJpZXMuIEFnYWluIHNvcnJ5IGZvciB0aGUgZGVsYXkNCj4gPiA+ID4gPiA+IGFuZCB0aGFua3Mg
Zm9yIHlvdXIgcGF0aWVuY2UuDQo+ID4gPiA+ID4gPg0KPiA+ID4gPiA+ID4gU29tZSBnZW5lcmFs
IGNvbW1lbnRzOg0KPiA+ID4gPiA+ID4gMSkgVGhlIG1ldGFkYXRhIGZvcm1hdCBGb3VyQ0Mgc2hv
dWxkIGJlIGFkZGVkIGluIGEgc2VwYXJhdGUgcGF0Y2gsDQo+ID4gPiA+ID4gPiB0b2dldGhlciB3
aXRoIGRvY3VtZW50YXRpb24gZm9yIGl0Lg0KPiA+ID4gPiA+ID4gMikgQ29udHJvbCBJRHMsIHN0
cnVjdHMgdXNlZCBieSB0aGUgdXNlcnNwYWNlLCBldGMuIHNob3VsZCBiZSBkZWZpbmVkIGluDQo+
ID4gPiA+ID4gPiBhIGhlYWRlciB1bmRlciBpbmNsdWRlL3VhcGkvbGludXguDQo+ID4gPiA+ID4g
Pg0KPiA+ID4gPiA+ID4gUGxlYXNlIGFsc28gY2hlY2sgbXkgcmVwbGllcyB0byBwYXJ0aWN1bGFy
IHBhdGNoZXMgZm9yIGZ1cnRoZXIgY29tbWVudHMuDQo+ID4gPiA+ID4gPg0KPiA+ID4gPiA+ID4g
QmVzdCByZWdhcmRzLA0KPiA+ID4gPiA+ID4gVG9tYXN6DQo+ID4gPiA+ID4NCj4gPiA+ID4gPiBB
cHByZWNpYXRlIGZvciB5b3VyIHJlcGx5LA0KPiA+ID4gPiA+DQo+ID4gPiA+ID4gU28gZmFyLCBJ
J3ZlIGxvY2FsbHkgY3JlYXRlZCBhbiB1YXBpIGhlYWRlcjoNCj4gPiA+ID4gPiBpbmNsdWRlL3Vh
cGkvbGludXgvbXRrX2ZkXzQwLmgNCj4gPiA+ID4gPiB3aGljaCBwcm92aWRlcyBzb21lIHZhbHVl
cywgY29udHJvbCBpZHMsIGFuZCB0aGUgZGVmaW5pdGlvbnMgb2YNCj4gPiA+ID4gPiBzdHJ1Y3R1
cmVzIHRoYXQgd291bGQgYmUgbmVlZGVkIGJ5IHVzZXIgb2YgbXRrX2ZkXzQwIGRyaXZlci4NCj4g
PiA+ID4gPiBJbiBhZGRpdGlvbiwgSSBhbHNvIHByb3ZpZGUgYSBNQUNSTyBhcyBleGFtcGxlIGlu
IGNvbW1lbnRzIHRoYXQgY2FuDQo+ID4gPiA+ID4gZXh0cmFjdCB0aGUgc3RydWN0IG1lbWJlciB3
aXRoIGJpdCBsZW5ndGggYW5kIG9mZnNldA0KPiA+ID4gPiA+IGRlZmluaXRpb25zKGVsaW1pbmF0
ZSB0aGUgYml0LWZpZWxkcykuDQo+ID4gPiA+ID4NCj4gPiA+ID4gPiBBbHNvLCBJIHdvdWxkIGxp
a2UgdG8gcmVuYW1lIHN0cnVjdCBmZF91c2VyX291dHB1dCB3aXRoIHN0cnVjdA0KPiA+ID4gPiA+
IG10a19mZF9od19yZXN1bHQuIEkgd29ycnkgZmRfdXNlcl9vdXRwdXQgd291bGQgYmUgYSBjb25m
dXNpbmcgbmFtZS4NCj4gPiA+ID4NCj4gPiA+ID4gVGhlIGNoYW5nZSBzb3VuZHMgZ29vZCB0byBt
ZS4NCj4gPiA+ID4NCj4gPiA+ID4gPiBJIHdpbGwgYWRkIHRoZW0gaW4gYSBzZXBhcmF0ZSBwYXRj
aCBpbiBuZXh0IHZlcnNpb24uDQo+ID4gPiA+ID4NCj4gPiA+ID4NCj4gPiA+ID4gT2theS4NCj4g
PiA+ID4NCj4gPiA+ID4gPiBJIGFtIHN0aWxsIHdvcmtpbmcgb24gdGhlIGRvY3VtZW50YXRpb24s
IHdoaWNoIG1pZ2h0IGJlDQo+ID4gPiA+ID4gRG9jdW1lbnRhdGlvbi9tZWRpYS91YXBpL3Y0bC9w
aXhmbXQtbWV0YS1tdGstZmQtNDAucnN0Lg0KPiA+ID4gPiA+IFJlZmVyaW5nIHRoZSBvdGhlciBw
aXhmbXQtKi5yc3QgZmlsZXMsIEkgd2lsbCB0cnkgdG8gcHJvdmlkZSB0aGUNCj4gPiA+ID4gPiBm
bGF0LXRhYmxlIG9mIHRoZSBtZXRhZGF0YSB3aXRoIHRoZSBzdHJ1Y3R1cmUgb2YgdGhlIG10a19m
ZF9od19yZXN1bHQuDQo+ID4gPiA+ID4NCj4gPiA+ID4NCj4gPiA+ID4gU291bmRzIGdvb2QgdG8g
bWUuDQo+ID4gPiA+DQo+ID4gPiA+ID4gSSBhbSBjb25mdXNpbmcgdGhhdCBzaG91bGQgSSByZW1h
aW4gdGhlIG5hbWUgd2l0aCAtNDAgaW4gdGhlIHRhaWwgb2YgcnN0DQo+ID4gPiA+ID4gZmlsZT8N
Cj4gPiA+ID4NCj4gPiA+ID4gVGhlIGhlYWRlciBhbmQgZG9jdW1lbnRhdGlvbiBmaWxlIG5hbWVz
IHNob3VsZCBtYXRjaCB0aGUgZHJpdmVyIG5hbWUuICBJDQo+ID4gPiA+IGp1c3Qgbm90aWNlZCB0
aGVyZSBpcyBzb21lIGluY29uc2lzdGVuY3kgaW4gdGhlIG5hbWluZywgdGhvdWdoLiBUaGUNCj4g
PiA+ID4gZHJpdmVyIHNlZW1zIHRvIGJlIGxvY2F0ZWQgdW5kZXIgZHJpdmVycy9tZWRpYS9wbGF0
Zm9ybS9tdGstaXNwL2ZkLCBidXQNCj4gPiA+ID4gdGhlIGRyaXZlciBuYW1lIGluIHRoZSBwbGF0
Zm9ybSBkcml2ZXIgc3RydWN0IGFuZCBhcyByZXBvcnRlZCBieQ0KPiA+ID4gPiBWSURJT0NfUVVF
UllDQVAgc2VlbXMgdG8gYmUgIm10ay1mZC00LjAiLg0KPiA+ID4NCj4gPiA+ID4gU2luY2Ugd2Ug
aGF2ZSBtYW55IG10ay0qIGRyaXZlcnMgaW4gdGhlIHRyZWUgY3VycmVudGx5LCBJIHRoaW5rIGl0
IG1pZ2h0DQo+ID4gPiA+IG1ha2Ugc2Vuc2UgdG8gY29uc29saWRhdGUgdGhlbSB1bmRlciBkcml2
ZXJzL21lZGlhL3BsYXRmb3JtL21lZGlhdGVrLA0KPiA+ID4gPiBzaW1pbGFybHkgdG8gZHJpdmVy
cy9tZWRpYS9wbGF0Zm9ybS9xY29tIG9yIC9yb2NrY2hpcC4gQnV0IGl0IGNvdWxkIGJlDQo+ID4g
PiA+IGRvbmUgbGF0ZXIsIGFzIGEgZm9sbG93LXVwLg0KPiA+ID4gPg0KPiA+ID4gPiBNeSBzdWdn
ZXN0aW9uIHdvdWxkIGJlIHRvIHBsYWNlIHRoZSBkcml2ZXIgdW5kZXINCj4gPiA+ID4gZHJpdmVy
cy9tZWRpYS9wbGF0Zm9ybS9tdGstZmQtNDAgYW5kIGFsc28gcmVuYW1lIHRoZSByZWxhdGVkIEtj
b25maWcNCj4gPiA+ID4gc3ltYm9sIHRvIGluY2x1ZGUgdGhlIF80MCBzdWZmaXguDQo+ID4gPiA+
DQo+ID4gPiA+IFdoYXQgZG8geW91IHRoaW5rPw0KPiA+ID4gPg0KPiA+ID4NCj4gPiA+IEkgQXBw
cmVjaWF0ZSB5b3VyIGNvbW1lbnRzLA0KPiA+ID4gU29ycnkgZm9yIHRoZSBsYXRlIHJlcGx5Lg0K
PiA+ID4NCj4gPiA+IFdvdWxkIGl0IGJlIHBvc3NpYmxlIGZvciBtZSB0byByZXBsYWNlIHRoZSBk
cml2ZXIgYXMgZHJpdmVycy9tZWRpYS9wbGF0Zm9ybS9tdGtfZmQvbXRrLWZkLTQwPyhKdXN0IGxp
a2UgbXRrLWlzcC9pc3BfNTApDQo+ID4gPg0KPiA+IA0KPiA+IEknbSBub3QgYSBiaWcgZmFuIG9m
IGR1cGxpY2F0aW5nICJtdGsgZmQiIGluIHRoZSBwYXRoLiBIb3cgYWJvdXQganVzdA0KPiA+IG1h
a2luZyBpdCBkcml2ZXJzL21lZGlhL3BsYXRmb3JtL210ay1mZC00MD8NCj4gPiANCj4gDQo+IE9r
LCBJIHdpbGwgbWFrZSBpdCBkcml2ZXJzL21lZGlhL3BsYXRmb3JtL210ay1mZC00MCwNCj4gYW5k
IGFsc28gcmVuYW1lIHRoZSByZWxhdGVkIEtjb25maWcgc3ltYm9sIHRvIGluY2x1ZGUgdGhlIF80
MCBzdWZmaXguDQo+IA0KPiBUaGFua3MgYW5kIEJlc3QgUmVnYXJkcywNCj4gSmVycnkuDQo+IA0K
PiA+IEJlc3QgcmVnYXJkcywNCj4gPiBUb21hc3oNCj4gDQoNCg0KSSd2ZSBmaW5pc2ggdGhlIGRv
Y3VtZW50IG9mIEZEIGRyaXZlciwgZGVzY3JpYmluZyB0aGUgc3RydWN0dXJlIG9mIHRoZQ0KbXRr
X2ZkX2h3X3Jlc3VsdC4gQ291bGQgSSBzZW5kIHRoZSBuZXcgdmVyc2lvbiBvZiB0aGUgZHJpdmVy
PyB3b3VsZCB0aGUNCmZvbGRlciBwYXRoIHJlcGxhY2VtZW50IG11c3QgYmUgaW5jbHVkZWQgaW4g
dGhlIG5ldyB2ZXJzaW9uPw0KDQpUaGFua3MgYW5kIEJlc3QgUmVnYXJkcywNCkplcnJ5DQo=

