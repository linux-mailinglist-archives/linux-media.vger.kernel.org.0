Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 76F223F0836
	for <lists+linux-media@lfdr.de>; Wed, 18 Aug 2021 17:42:58 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S239819AbhHRPnb (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 18 Aug 2021 11:43:31 -0400
Received: from Mailgw01.mediatek.com ([1.203.163.78]:20130 "EHLO
        mailgw01.mediatek.com" rhost-flags-OK-FAIL-OK-FAIL) by vger.kernel.org
        with ESMTP id S230360AbhHRPnb (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 18 Aug 2021 11:43:31 -0400
X-UUID: 2f8fd4dc22c844b9a98383ffecdfbb40-20210818
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
        h=Content-Transfer-Encoding:MIME-Version:Content-Type:References:In-Reply-To:Date:CC:To:From:Subject:Message-ID; bh=86dDfb5H+rm8NM4C/7EdNI/WVjklVl5YtluKeCEmmaM=;
        b=bmb2sM5qw+JbUIzKGsqp2BT1yLOcLfdwgzHgLVpvJjga/Vgycw60U3GT4m5jHRcdbJFOAdh7HV+FvY2Kq4dylKrOEqsOT2WqxPyrNPhUIZ6HiLwOjg7uUREaRJzI0P3KC7PKYCuBtB/3d7ItYBSjm2zpDVbe7koZnkmdJV0ycY4=;
X-UUID: 2f8fd4dc22c844b9a98383ffecdfbb40-20210818
Received: from mtkmrs31.mediatek.inc [(172.27.4.253)] by mailgw01.mediatek.com
        (envelope-from <houlong.wei@mediatek.com>)
        (mailgw01.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
        with ESMTP id 1092501207; Wed, 18 Aug 2021 23:42:49 +0800
Received: from MTKCAS36.mediatek.inc (172.27.4.186) by MTKMBS31N1.mediatek.inc
 (172.27.4.69) with Microsoft SMTP Server (TLS) id 15.0.1497.2; Wed, 18 Aug
 2021 23:42:45 +0800
Received: from mhfsdcap04 (10.17.3.154) by MTKCAS36.mediatek.inc
 (172.27.4.170) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Wed, 18 Aug 2021 23:42:44 +0800
Message-ID: <14b9c2efb28d84712b7b4e7b67b6c87558cd9f5d.camel@mediatek.com>
Subject: Re: [PATCH v6 7/9] media: mtk-mdp: use mdp-rdma0 alias to point to
 MDP master
From:   houlong wei <houlong.wei@mediatek.com>
To:     Eizan Miyamoto <eizan@chromium.org>
CC:     "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        "wenst@chromium.org" <wenst@chromium.org>,
        Yong Wu =?UTF-8?Q?=28=E5=90=B4=E5=8B=87=29?= 
        <Yong.Wu@mediatek.com>,
        "enric.balletbo@collabora.com" <enric.balletbo@collabora.com>,
        "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
        "chunkuang.hu@kernel.org" <chunkuang.hu@kernel.org>,
        "Andrew-CT Chen =?UTF-8?Q?=28=E9=99=B3=E6=99=BA=E8=BF=AA=29?=" 
        <Andrew-CT.Chen@mediatek.com>,
        Matthias Brugger <matthias.bgg@gmail.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        "Minghsiu Tsai =?UTF-8?Q?=28=E8=94=A1=E6=98=8E=E4=BF=AE=29?=" 
        <Minghsiu.Tsai@mediatek.com>,
        "linux-arm-kernel@lists.infradead.org" 
        <linux-arm-kernel@lists.infradead.org>,
        "linux-media@vger.kernel.org" <linux-media@vger.kernel.org>,
        "linux-mediatek@lists.infradead.org" 
        <linux-mediatek@lists.infradead.org>, <houlong.wei@mediatek.com>
Date:   Wed, 18 Aug 2021 23:42:45 +0800
In-Reply-To: <CAOak1e924x8E+kM2WJ3oGPxxt_R=b79BtbxPAdENamvjVamnEw@mail.gmail.com>
References: <20210802121215.703023-1-eizan@chromium.org>
         <20210802220943.v6.7.I2049e180dca12e0d1b3178bfc7292dcf9e05ac28@changeid>
         <bf98c5ee749bca755bd46832f858536dbf51a2a4.camel@mediatek.com>
         <9f23beea197495d017a548ef483584714a3673f9.camel@mediatek.com>
         <CAOak1e924x8E+kM2WJ3oGPxxt_R=b79BtbxPAdENamvjVamnEw@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"
X-Mailer: Evolution 3.28.5-0ubuntu0.18.04.2 
MIME-Version: 1.0
X-TM-SNTS-SMTP: 5605CBA0DE33A0953E955550ED951D96D8291363804197D7A25242AB0FE584F32000:8
X-MTK:  N
Content-Transfer-Encoding: base64
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

T24gV2VkLCAyMDIxLTA4LTE4IGF0IDE1OjUwICswODAwLCBFaXphbiBNaXlhbW90byB3cm90ZToN
Cj4gSGkgSG91bG9uZywNCj4gDQo+IFRoYW5rIHlvdSBmb3IgeW91ciByZXZpZXcgb24gdGhpcyBz
ZXJpZXMsIGl0IGlzIG11Y2ggYXBwcmVjaWF0ZWQuDQo+IA0KPiBPbiBNb24sIEF1ZyAxNiwgMjAy
MSBhdCAyOjUzIFBNIGhvdWxvbmcgd2VpIDxob3Vsb25nLndlaUBtZWRpYXRlay5jb20NCj4gPiB3
cm90ZToNCj4gPiBJcyB5b3VyIHJlbW92aW5nICJtZWRpYXRlayx2cHUiIG5lY2Vzc2FyeSBmb3Ig
dGhpcyBzZXJpZXMgIlJlZmFjdG9yDQo+ID4gTVRLDQo+ID4gTURQIGRyaXZlciBpbnRvIGNvcmUv
Y29tcG9uZW50cyIgPw0KPiANCj4gUmVtb3ZpbmcgaXQgaXMgbm90IHN0cmljdGx5IG5lY2Vzc2Fy
eSBmb3IgdGhlIHNlcmllcyB0byBmdW5jdGlvbiwgSQ0KPiB3aWxsIHJlLXVwbG9hZCB0aGUgc2Vy
aWVzIGFuZCBvbWl0IHRoZSBmb2xsb3dpbmcgY2hhbmdlczoNCj4gLSBbUEFUQ0ggdjYgOC85XSBk
dHM6IG10ay1tZHA6IHJlbW92ZSBtZWRpYXRlayx2cHUgcHJvcGVydHkgZnJvbQ0KPiBwcmltYXJ5
IE1EUCBkZXZpY2UNCj4gLSBbUEFUQ0ggdjYgOS85XSBkdC1iaW5kaW5nczogbWVkaWF0ZWs6IHJl
bW92ZSB2cHUgcmVxdWlyZW1lbnQgZnJvbQ0KPiBtdGstbWRwDQo+IA0KPiBEbyBwbGVhc2UgbGV0
IG1lIGtub3cgaWYgeW91IG1lYW50IHNvbWV0aGluZyBkaWZmZXJlbnQuDQo+IA0KPiBUaGFua3Ms
DQo+IA0KPiBFaXphbg0KPiANCj4gDQpIaSBFaXphbiwNCg0KVGhhbmtzIGZvciB5b3VyIGhlbHAg
YW5kIGVmZm9ydC4gSXQncyBleGFjdGx5IHdoYXQgSSBleHByZXNzZWQuDQoNClJlZ2FyZHMsDQpI
b3Vsb25nDQo+IA0KPiANCj4gPiANCj4gPiBJbiBzb21lIE1lZGlhVGVrIHByb2plY3RzIChub3Qg
dXBzdHJlYW0geWV0KSwgdGhlIGRldmljZS10cmVlIG5vZGUNCj4gPiBuYW1lDQo+ID4gInZwdSIg
bWF5IGJlIGNoYW5nZWQgdG8gc29tZXRoaW5nIGxpa2UgInZwdTAiLCAidnB1MSIgb3Igb3RoZXIN
Cj4gPiBuYW1lLA0KPiA+IHdoaWNoIGRlcGVuZHMgb24gdGhlIGltcGxlbWVudGF0aW9uIG9mICJt
dGstdnB1IiBkcml2ZXIuIFdlIGNhbg0KPiA+IHNwZWNpZnkNCj4gPiB0aGUgZGlmZmVyZW50IHBo
YW5kbGUgdG8gIm1lZGlhdGVrLHZwdSIgaW4gLmR0c2kgZmlsZS4gSWYgd2UgdXNlDQo+ID4gb2Zf
ZmluZF9ub2RlX2J5X25hbWUoKSB0byBnZXQgdGhlIHZwdV9ub2RlLCB3ZSBoYXZlIHRvIG1vZGlm
eSB0aGUNCj4gPiBuYW1lDQo+ID4gc3RyaW5nIGluIGRpZmZlcmVudCBwcm9qZWN0Lg0KPiA+IElm
IHRoZSBhbnN3ZXIgb2YgbXkgcHJldmlvdXMgcXVlc3Rpb25zIGlzICJObyIsIEkgcHJlZmVyIHRv
IHNsb3cNCj4gPiBkb3duDQo+ID4gdGhlIG1vZGlmaWNhdGlvbiBvZiByZW1vdmluZyAibWVkaWF0
ZWssdnB1Ii4NCj4gPiANCj4gPiBTb3JyeSBmb3IgbGF0ZSByZXBseS4NCj4gPiANCj4gPiBSZWdh
cmRzLA0KPiA+IEhvdWxvbmcNCg==

