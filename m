Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 20C4F10F8DF
	for <lists+linux-media@lfdr.de>; Tue,  3 Dec 2019 08:37:05 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727561AbfLCHgX (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 3 Dec 2019 02:36:23 -0500
Received: from mailgw02.mediatek.com ([210.61.82.184]:59383 "EHLO
        mailgw02.mediatek.com" rhost-flags-OK-FAIL-OK-FAIL) by vger.kernel.org
        with ESMTP id S1727386AbfLCHgV (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Tue, 3 Dec 2019 02:36:21 -0500
X-UUID: 19b02910c6ba4280ab06721b2091080e-20191203
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
        h=Content-Transfer-Encoding:MIME-Version:Content-Type:References:In-Reply-To:Date:CC:To:From:Subject:Message-ID; bh=RS1SOJ53qB4oVEPa7QVaDgVYJ6ii69MjHwS2W7BD1SU=;
        b=egidPDKUQ8DvqY5vSr6pHFia0xtAL7GpEuhuTbxkJEGzM/aaPNgQXEUuBdpzKbu+sX5qdoOBhc6W+xXjKEj1gnUwhRgBP5xiUhPJjgDb7CTYZNiV8So2WACcO8K/k30F9bjzOurVqXG05JsEWw5Ljc8/GYvESGOhf3bGsQqL1+Y=;
X-UUID: 19b02910c6ba4280ab06721b2091080e-20191203
Received: from mtkmrs01.mediatek.inc [(172.21.131.159)] by mailgw02.mediatek.com
        (envelope-from <jerry-ch.chen@mediatek.com>)
        (Cellopoint E-mail Firewall v4.1.10 Build 0809 with TLS)
        with ESMTP id 1082560974; Tue, 03 Dec 2019 15:36:13 +0800
Received: from mtkcas07.mediatek.inc (172.21.101.84) by
 mtkmbs01n1.mediatek.inc (172.21.101.68) with Microsoft SMTP Server (TLS) id
 15.0.1395.4; Tue, 3 Dec 2019 15:36:04 +0800
Received: from [172.21.84.99] (172.21.84.99) by mtkcas07.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1395.4 via Frontend
 Transport; Tue, 3 Dec 2019 15:35:51 +0800
Message-ID: <1575358572.22859.16.camel@mtksdccf07>
Subject: Re: [RFC PATCH V3 3/3] platform: mtk-isp: Add Mediatek FD driver
From:   Jerry-ch Chen <Jerry-ch.Chen@mediatek.com>
To:     Tomasz Figa <tfiga@chromium.org>
CC:     "matthias.bgg@gmail.com" <matthias.bgg@gmail.com>,
        "mchehab@kernel.org" <mchehab@kernel.org>,
        "lkml@metux.net" <lkml@metux.net>,
        CK Hu =?UTF-8?Q?=28=E8=83=A1=E4=BF=8A=E5=85=89=29?= 
        <ck.hu@mediatek.com>, "yuzhao@chromium.org" <yuzhao@chromium.org>,
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
        Po-Yang Huang =?UTF-8?Q?=28=E9=BB=83=E6=9F=8F=E9=99=BD=29?= 
        <po-yang.huang@mediatek.com>,
        Rynn Wu =?UTF-8?Q?=28=E5=90=B3=E8=82=B2=E6=81=A9=29?= 
        <Rynn.Wu@mediatek.com>,
        "linux-media@vger.kernel.org" <linux-media@vger.kernel.org>,
        srv_heupstream <srv_heupstream@mediatek.com>,
        "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
        "laurent.pinchart+renesas@ideasonboard.com" 
        <laurent.pinchart+renesas@ideasonboard.com>,
        "hans.verkuil@cisco.com" <hans.verkuil@cisco.com>
Date:   Tue, 3 Dec 2019 15:36:12 +0800
In-Reply-To: <CAAFQd5D-F1C4RyVeTzX=z72h6x0P5Gyb2X0EsH0YRQVAP6hGmQ@mail.gmail.com>
References: <20190906101125.3784-1-Jerry-Ch.chen@mediatek.com>
         <20190906101125.3784-4-Jerry-Ch.chen@mediatek.com>
         <1571109375.3706.40.camel@mtksdccf07> <20191025035211.GA67000@chromium.org>
         <1574237450.20087.17.camel@mtksdccf07>
         <CAAFQd5DPErhL0_1f6BzDMMOVhxNfJdctBsK=mcBP6oNcmw-r=w@mail.gmail.com>
         <1575046535.22859.12.camel@mtksdccf07>
         <CAAFQd5D-F1C4RyVeTzX=z72h6x0P5Gyb2X0EsH0YRQVAP6hGmQ@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"
X-Mailer: Evolution 3.2.3-0ubuntu6 
MIME-Version: 1.0
X-MTK:  N
Content-Transfer-Encoding: base64
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

SGkgVG9tYXN6LA0KDQpPbiBNb24sIDIwMTktMTItMDIgYXQgMTg6NDggKzA5MDAsIFRvbWFzeiBG
aWdhIHdyb3RlOg0KPiBPbiBTYXQsIE5vdiAzMCwgMjAxOSBhdCAxOjU1IEFNIEplcnJ5LWNoIENo
ZW4NCj4gPEplcnJ5LWNoLkNoZW5AbWVkaWF0ZWsuY29tPiB3cm90ZToNCj4gPg0KPiA+IEhpIFRv
bWFzeiwNCj4gPg0KPiA+IE9uIFdlZCwgMjAxOS0xMS0yMCBhdCAxODoyOCArMDkwMCwgVG9tYXN6
IEZpZ2Egd3JvdGU6DQo+ID4gPiBPbiBXZWQsIE5vdiAyMCwgMjAxOSBhdCA1OjExIFBNIEplcnJ5
LWNoIENoZW4NCj4gPiA+IDxKZXJyeS1jaC5DaGVuQG1lZGlhdGVrLmNvbT4gd3JvdGU6DQo+ID4g
PiA+DQo+ID4gPiA+IEhpIFRvbWFzeiwNCj4gPiA+ID4NCj4gPiA+ID4gT24gRnJpLCAyMDE5LTEw
LTI1IGF0IDExOjUyICswODAwLCBUb21hc3ogRmlnYSB3cm90ZToNCj4gPiA+ID4gPiBPbiBUdWUs
IE9jdCAxNSwgMjAxOSBhdCAxMToxNjoxNUFNICswODAwLCBKZXJyeS1jaCBDaGVuIHdyb3RlOg0K
PiA+ID4gPiA+ID4gSGkgVG9tYXN6LA0KPiA+ID4gPiA+ID4NCj4gPiA+ID4gPiA+IE9uIEZyaSwg
MjAxOS0wOS0wNiBhdCAxODoxMSArMDgwMCwgSmVycnktY2ggQ2hlbiB3cm90ZToNCj4gPiA+ID4g
PiA+ID4gRnJvbTogSmVycnktY2ggQ2hlbiA8amVycnktY2guY2hlbkBtZWRpYXRlay5jb20+DQo+
ID4gPiA+ID4gPiA+DQo+ID4gPiA+ID4gPiA+IFRoaXMgcGF0Y2ggYWRkcyB0aGUgZHJpdmVyIG9m
IEZhY2UgRGV0ZWN0aW9uIChGRCkgdW5pdCBpbg0KPiA+ID4gPiA+ID4gPiBNZWRpYXRlayBjYW1l
cmEgc3lzdGVtLCBwcm92aWRpbmcgZmFjZSBkZXRlY3Rpb24gZnVuY3Rpb24uDQo+ID4gPiA+ID4g
PiA+DQo+ID4gPiA+ID4gPiA+IFRoZSBtdGstaXNwIGRpcmVjdG9yeSB3aWxsIGNvbnRhaW4gZHJp
dmVycyBmb3IgbXVsdGlwbGUgSVANCj4gPiA+ID4gPiA+ID4gYmxvY2tzIGZvdW5kIGluIE1lZGlh
dGVrIElTUCBzeXN0ZW0uIEl0IHdpbGwgaW5jbHVkZSBJU1AgUGFzcyAxDQo+ID4gPiA+ID4gPiA+
IGRyaXZlciAoQ0FNKSwgc2Vuc29yIGludGVyZmFjZSBkcml2ZXIsIERJUCBkcml2ZXIgYW5kIGZh
Y2UNCj4gPiA+ID4gPiA+ID4gZGV0ZWN0aW9uIGRyaXZlci4NCj4gPiA+ID4gPiA+ID4NCj4gPiA+
ID4gPiA+ID4gU2lnbmVkLW9mZi1ieTogSmVycnktY2ggQ2hlbiA8amVycnktY2guY2hlbkBtZWRp
YXRlay5jb20+DQo+ID4gPiA+ID4gPiA+IC0tLQ0KPiA+ID4gPiA+ID4gPiAgZHJpdmVycy9tZWRp
YS9wbGF0Zm9ybS9LY29uZmlnICAgICAgICAgICAgICAgIHwgICAgMiArDQo+ID4gPiA+ID4gPiA+
ICBkcml2ZXJzL21lZGlhL3BsYXRmb3JtL01ha2VmaWxlICAgICAgICAgICAgICAgfCAgICAyICsN
Cj4gPiA+ID4gPiA+ID4gIGRyaXZlcnMvbWVkaWEvcGxhdGZvcm0vbXRrLWlzcC9mZC9LY29uZmln
ICAgICB8ICAgMTkgKw0KPiA+ID4gPiA+ID4gPiAgZHJpdmVycy9tZWRpYS9wbGF0Zm9ybS9tdGst
aXNwL2ZkL01ha2VmaWxlICAgIHwgICAgNSArDQo+ID4gPiA+ID4gPiA+ICBkcml2ZXJzL21lZGlh
L3BsYXRmb3JtL210ay1pc3AvZmQvbXRrX2ZkLmggICAgfCAgMTQ4ICsrDQo+ID4gPiA+ID4gPiA+
ICBkcml2ZXJzL21lZGlhL3BsYXRmb3JtL210ay1pc3AvZmQvbXRrX2ZkXzQwLmMgfCAxMjE5ICsr
KysrKysrKysrKysrKysrDQo+ID4gPiA+ID4gPiA+ICBpbmNsdWRlL3VhcGkvbGludXgvbXRrLWZk
LXY0bDItY29udHJvbHMuaCAgICAgfCAgIDY5ICsNCj4gPiA+ID4gPiA+ID4gIGluY2x1ZGUvdWFw
aS9saW51eC92NGwyLWNvbnRyb2xzLmggICAgICAgICAgICB8ICAgIDQgKw0KPiA+ID4gPiA+ID4g
PiAgOCBmaWxlcyBjaGFuZ2VkLCAxNDY4IGluc2VydGlvbnMoKykNCj4gPiA+ID4gPiA+ID4gIGNy
ZWF0ZSBtb2RlIDEwMDY0NCBkcml2ZXJzL21lZGlhL3BsYXRmb3JtL210ay1pc3AvZmQvS2NvbmZp
Zw0KPiA+ID4gPiA+ID4gPiAgY3JlYXRlIG1vZGUgMTAwNjQ0IGRyaXZlcnMvbWVkaWEvcGxhdGZv
cm0vbXRrLWlzcC9mZC9NYWtlZmlsZQ0KPiA+ID4gPiA+ID4gPiAgY3JlYXRlIG1vZGUgMTAwNjQ0
IGRyaXZlcnMvbWVkaWEvcGxhdGZvcm0vbXRrLWlzcC9mZC9tdGtfZmQuaA0KPiA+ID4gPiA+ID4g
PiAgY3JlYXRlIG1vZGUgMTAwNjQ0IGRyaXZlcnMvbWVkaWEvcGxhdGZvcm0vbXRrLWlzcC9mZC9t
dGtfZmRfNDAuYw0KPiA+ID4gPiA+ID4gPiAgY3JlYXRlIG1vZGUgMTAwNjQ0IGluY2x1ZGUvdWFw
aS9saW51eC9tdGstZmQtdjRsMi1jb250cm9scy5oDQo+ID4gPiA+ID4gPiA+DQo+ID4gPiA+ID4N
Cj4gPiA+ID4gPiBbc25pcF0NCltzbmlwXQ0KPiA+ID4gPiA+IFtzbmlwXQ0KPiA+ID4gPiA+DQo+
ID4gPiA+ID4gPiA+ICsvKiBTZXQgdGhlIGZhY2UgYW5nbGUgYW5kIGRpcmVjdGlvbnMgdG8gYmUg
ZGV0ZWN0ZWQgKi8NCj4gPiA+ID4gPiA+ID4gKyNkZWZpbmUgVjRMMl9DSURfTVRLX0ZEX0RFVEVD
VF9QT1NFICAgICAgICAgICAgICAoVjRMMl9DSURfVVNFUl9NVEtfRkRfQkFTRSArIDEpDQo+ID4g
PiA+ID4gPiA+ICsNCj4gPiA+ID4gPiA+ID4gKy8qIFNldCBpbWFnZSB3aWR0aHMgZm9yIGFuIGlu
cHV0IGltYWdlIHRvIGJlIHNjYWxlZCBkb3duIGZvciBmYWNlIGRldGVjdGlvbiAqLw0KPiA+ID4g
PiA+ID4gPiArI2RlZmluZSBWNEwyX0NJRF9NVEtfRkRfU0NBTEVfRE9XTl9JTUdfV0lEVEggICAg
IChWNEwyX0NJRF9VU0VSX01US19GRF9CQVNFICsgMikNCj4gPiA+ID4gPiA+ID4gKw0KPiA+ID4g
PiA+ID4gPiArLyogU2V0IGltYWdlIGhlaWdodHMgZm9yIGFuIGlucHV0IGltYWdlIHRvIGJlIHNj
YWxlZCBkb3duIGZvciBmYWNlIGRldGVjdGlvbiAqLw0KPiA+ID4gPiA+ID4gPiArI2RlZmluZSBW
NEwyX0NJRF9NVEtfRkRfU0NBTEVfRE9XTl9JTUdfSEVJR0hUICAgIChWNEwyX0NJRF9VU0VSX01U
S19GRF9CQVNFICsgMykNCj4gPiA+ID4gPiA+ID4gKw0KPiA+ID4gPiA+ID4gPiArLyogU2V0IHRo
ZSBsZW5ndGggb2Ygc2NhbGUgZG93biBzaXplIGFycmF5ICovDQo+ID4gPiA+ID4gPiA+ICsjZGVm
aW5lIFY0TDJfQ0lEX01US19GRF9TQ0FMRV9JTUdfTlVNICAgICAgICAgICAgKFY0TDJfQ0lEX1VT
RVJfTVRLX0ZEX0JBU0UgKyA0KQ0KPiA+ID4gPiA+ID4gPiArDQo+ID4gPiA+ID4gPiA+ICsvKiBT
ZXQgdGhlIGRldGVjdGlvbiBzcGVlZCwgdXN1YWxseSByZWR1Y2luZyBhY2N1cmFjeS4gKi8NCj4g
PiA+ID4gPiA+ID4gKyNkZWZpbmUgVjRMMl9DSURfTVRLX0ZEX0RFVEVDVF9TUEVFRCAgICAgICAg
ICAgICAoVjRMMl9DSURfVVNFUl9NVEtfRkRfQkFTRSArIDUpDQo+ID4gPiA+ID4gPiA+ICsNCj4g
PiA+ID4gPiA+ID4gKy8qIFNlbGVjdCB0aGUgZGV0ZWN0aW9uIG1vZGVsIG9yIGFsZ29yaXRobSB0
byBiZSB1c2VkLiAqLw0KPiA+ID4gPiA+ID4gPiArI2RlZmluZSBWNEwyX0NJRF9NVEtfRkRfREVU
RUNUSU9OX01PREVMICAgICAgICAgIChWNEwyX0NJRF9VU0VSX01US19GRF9CQVNFICsgNikNCj4g
PiA+ID4gPiA+ID4gKw0KPiA+ID4gPiA+ID4gPiArLyogV2UgcmVzZXJ2ZSAxNiBjb250cm9scyBm
b3IgdGhpcyBkcml2ZXIuICovDQo+ID4gPiA+ID4gPiA+ICsjZGVmaW5lIFY0TDJfQ0lEX01US19G
RF9NQVggICAgICAgICAgICAgICAgICAgICAgMTYNCj4gPiA+ID4gPiA+ID4gKw0KPiA+ID4gPiA+
ID4NCj4gPiA+ID4gPiA+IEZvciB0aGVzZSBjb250cm9sIElEcywgSSB0aGluayB0aGUgZm9sbG93
aW5nIHNob3VsZCBiZSByZW1haW5lZCBhcyBjaGlwDQo+ID4gPiA+ID4gPiBzcGVjaWZpYyBjb250
cm9scy4NCj4gPiA+ID4gPiA+IFY0TDJfQ0lEX01US19GRF9TQ0FMRV9ET1dOX0lNR19XSURUSCwN
Cj4gPiA+ID4gPiA+IFY0TDJfQ0lEX01US19GRF9TQ0FMRV9ET1dOX0lNR19IRUlHSFQgYW5kIFY0
TDJfQ0lEX01US19GRF9TQ0FMRV9JTUdfTlVNDQo+ID4gPiA+ID4gPg0KPiA+ID4gPiA+ID4gSG9w
ZSB0aGVyZSB3b3VsZCBiZSBzdGFuZGFyZGl6aW5nIGZhY2UgZGV0ZWN0aW9uIGFwaSB0aGF0IGNv
dmVyIHRoZSByZXN0DQo+ID4gPiA+ID4gPiBjb250cm9sczogVjRMMl9DSURfTVRLX0ZEX0RFVEVD
VF9QT1NFLCBWNEwyX0NJRF9NVEtfRkRfREVURUNUX1NQRUVEIGFuZA0KPiA+ID4gPiA+ID4gVjRM
Ml9DSURfTVRLX0ZEX0RFVEVDVElPTl9NT0RFTA0KPiA+ID4gPiA+ID4NCj4gPiA+ID4gPiA+IFdv
dWxkIHlvdSBoYXZlIGFueSBzdWdnZXN0aW9ucyBvbiBob3cgdG8gcHJvcG9zZSB0aGUgc3RhbmRh
cmQgZmFjZQ0KPiA+ID4gPiA+ID4gZGV0ZWN0aW9uIGFwaXM/DQo+ID4gPiA+ID4gPg0KPiA+ID4g
PiA+DQo+ID4gPiA+ID4gR2l2ZW4gbm8gZm9sbG93IHVwIGZlZWRiYWNrIGZyb20gdGhlIGNvbW11
bml0eSwgSSB0aGluayB3ZSBjYW4ga2VlcCB0aGVtDQo+ID4gPiA+ID4gYXMgZHJpdmVyLXNwZWNp
ZmljLCBidXQgc2hvdWxkIG1ha2Ugc3VyZSB0aGF0IHRoZXkgaGF2ZSBzb21lIHJlYXNvbmFibGUN
Cj4gPiA+ID4gPiBkZWZhdWx0IHZhbHVlcyBpbiBjYXNlIGFuIGFwcGxpY2F0aW9uIGRvZXNuJ3Qg
cmVjb2duaXplIHRoZW0uDQo+ID4gPiA+ID4NCj4gPiA+ID4gPiBCZXN0IHJlZ2FyZHMsDQo+ID4g
PiA+ID4gVG9tYXN6DQo+ID4gPiA+ID4NCj4gPiA+ID4gU2hvdWxkIEkga2VlcCB0aGUgZmlsZSAi
bXRrLWZkLXY0bDItY29udHJvbHMuaCIgd2hpY2ggZGVmaW5lcyB0aGUNCj4gPiA+ID4gY29udHJv
bCBpZHMgdW5kZXIgdGhlIGZvbGRlciAiL2luY2x1ZGUvdWFwaS9saW51eCI/DQo+ID4gPg0KPiA+
ID4gV2Ugc2hvdWxkIGRlZmluZSB0aGUgQ0lEIGJhc2UgZm9yIHRoZSBGRCBkcml2ZXIgaW4gdjRs
Mi1jb250cm9scy5oLA0KPiA+ID4gYnV0IHRoZSBjb250cm9scyB0aGVtc2VsdmVzIHNob3VsZCBi
ZSBvbmx5IGRlZmluZWQgaW5zaWRlIHRoZSBkcml2ZXIuDQo+ID4gPg0KPiA+ID4gRm9yIGV4YW1w
bGU6DQo+ID4gPiBodHRwczovL2VsaXhpci5ib290bGluLmNvbS9saW51eC92NS40LXJjOC9zb3Vy
Y2UvaW5jbHVkZS91YXBpL2xpbnV4L3Y0bDItY29udHJvbHMuaCNMMTc4DQo+ID4gPiBodHRwczov
L2VsaXhpci5ib290bGluLmNvbS9saW51eC92NS40LXJjOC9zb3VyY2UvZHJpdmVycy9tZWRpYS9p
MmMvYWR2NzE4MC5jI0wxODENCj4gPiA+DQo+ID4gPiBCZXN0IHJlZ2FyZHMsDQo+ID4gPiBUb21h
c3oNCj4gPg0KPiA+IEFwcHJlY2lhdGUgZm9yIHByb3ZpZGluZyB0aGUgZXhhbXBsZSwNCj4gPiBX
b3VsZCBpdCBiZSBmaW5lIGZvciBtZSB0byBwdXQgdGhlIHByaXZhdGUgQ0lEIGluIHRoZSBtdGtf
ZmQuaCh3aGljaCBpcw0KPiA+IHNpbWlsYXIgdG8gYmVmb3JlLi4uKSBvciBmb2xsb3cgdGhlIGV4
YW1wbGUgdG8gZGVmaW5lIGluc2lkZQ0KPiA+IG10a19mZF80MC5jPz8NCj4gPg0KPiA+IFRoZSBu
ZXh0IHZlcnNpb24gaXMgYWxtb3N0IHJlYWR5LCBtYXliZSBJIGNhbiBzZW5kIGl0IHdoZW4gSSBy
ZWFkeSBpbiBhDQo+ID4gZmV3IGRheXM/DQo+IA0KPiBTaW5jZSBtdGtfZmRfNDAuYyBpcyB0aGUg
b25seSBwbGFjZSB0aGUgZGVmaW5pdGlvbnMgZnJvbSBtdGtfZmQuaCBhcmUNCj4gdXNlZCwgSSdk
IHN1Z2dlc3QganVzdCBtb3ZpbmcgYWxsIHRoZSBjb250ZW50cyB0byB0aGUgLmMgZmlsZS4NCj4g
DQo+IEJlc3QgcmVnYXJkcywNCj4gVG9tYXN6DQpEb25lLA0KDQpUaGFua3MgYW5kIGJlc3QgcmVn
YXJkcywNCkplcnJ5DQoNCg0K

