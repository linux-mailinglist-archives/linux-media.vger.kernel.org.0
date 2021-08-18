Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id ABE093F081C
	for <lists+linux-media@lfdr.de>; Wed, 18 Aug 2021 17:34:48 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S239906AbhHRPfT (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 18 Aug 2021 11:35:19 -0400
Received: from Mailgw01.mediatek.com ([1.203.163.78]:48314 "EHLO
        mailgw01.mediatek.com" rhost-flags-OK-FAIL-OK-FAIL) by vger.kernel.org
        with ESMTP id S239533AbhHRPfS (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 18 Aug 2021 11:35:18 -0400
X-UUID: a9e2c846c5114af59fe9a63f1822d80d-20210818
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
        h=Content-Transfer-Encoding:MIME-Version:Content-Type:References:In-Reply-To:Date:CC:To:From:Subject:Message-ID; bh=mY2xlANhzGaCwEJ+ZS0j92R3ALD9b0W3vexQNRdZJa0=;
        b=d/PQsBmLKcfXJGiCIJLrWK92Sjfl664iHR3EI8HDaHNGm54Z1/h+Z+qPhbK8XNEdj53a0PpNPUIDEAV74ThOfavMecjQ8rn7TAWO22JdRaa8KZXaifagBkV40oa+Of4jh0etw8zJ/XWphS3MmV61pij1F+PScdkcI4DtGpx1Mag=;
X-UUID: a9e2c846c5114af59fe9a63f1822d80d-20210818
Received: from mtkcas36.mediatek.inc [(172.27.4.253)] by mailgw01.mediatek.com
        (envelope-from <houlong.wei@mediatek.com>)
        (mailgw01.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
        with ESMTP id 690763005; Wed, 18 Aug 2021 23:34:37 +0800
Received: from MTKCAS36.mediatek.inc (172.27.4.186) by MTKMBS32N1.mediatek.inc
 (172.27.4.71) with Microsoft SMTP Server (TLS) id 15.0.1497.2; Wed, 18 Aug
 2021 23:34:31 +0800
Received: from mhfsdcap04 (10.17.3.154) by MTKCAS36.mediatek.inc
 (172.27.4.170) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Wed, 18 Aug 2021 23:34:31 +0800
Message-ID: <ea8c8373fbf6a9895276f098cfa2cf3f7761a4b5.camel@mediatek.com>
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
Date:   Wed, 18 Aug 2021 23:34:32 +0800
In-Reply-To: <CAOak1e-oyzxbvHimMReQpZCAPyCtAsaGixjwmoa0EzMjqaUxVg@mail.gmail.com>
References: <20210802121215.703023-1-eizan@chromium.org>
         <20210802220943.v6.7.I2049e180dca12e0d1b3178bfc7292dcf9e05ac28@changeid>
         <bf98c5ee749bca755bd46832f858536dbf51a2a4.camel@mediatek.com>
         <CAOak1e-oyzxbvHimMReQpZCAPyCtAsaGixjwmoa0EzMjqaUxVg@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"
X-Mailer: Evolution 3.28.5-0ubuntu0.18.04.2 
MIME-Version: 1.0
X-TM-SNTS-SMTP: 52578409B4DD15A61C9794237D2C83A9C988EF0D0F591ADDCF1BB92849887C712000:8
X-MTK:  N
Content-Transfer-Encoding: base64
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

SGkgRWl6YW4sDQoNCkZpcnN0bHksIGFib3V0IGhvdyB0byBkZXRlcm1pbmUgdGhlIG1hc3RlciBt
ZHAgZHJpdmVyLCB3ZSBhbHNvIGNhbg0KanVkZ2UgdGhlIGNvbXBvbmVudCB0eXBlLiBUaGUgY29t
cG9uZW50IHR5cGUgY2FuIGJlIGdvdHRlbiBieSBjYWxsaW5nDQpvZl9kZXZpY2VfZ2V0X21hdGNo
X2RhdGEoZGV2KS4gSWYgdGhlIGNvbXBvbmVudCBpcyBNVEtfTURQX1JETUEsIGl0IGlzDQp0aGUg
bWFzdGVyIGRyaXZlci4gTm8gbWF0dGVyIGl0IGlzIG1kcF9yZG1hMCBvciBtZHBfcmRtYTEuDQoN
ClNlY29uZGx5LCBhYm91dCBzdXBwb3J0aW5nIHRoZSBtdWx0aXBsZSBNRFAgbWFzdGVyIGRldmlj
ZSBub2RlcywgeW91DQpjYW4gdHJ5IG15IGFkdmljZSBpbiBteSBwcmV2aW91cyBjb21tZW50IGFm
dGVyIHRoZSBjb21wbGV0aW9uIG9mIHRoaXMNCnNlcmllcyBvZiBwYXRjaGVzLg0KDQpUaGFua3Mg
YSBsb3QuDQoNClJlZ2FyZHMsDQpIb3Vsb25nDQoNCk9uIFdlZCwgMjAyMS0wOC0xOCBhdCAxNTo0
MyArMDgwMCwgRWl6YW4gTWl5YW1vdG8gd3JvdGU6DQo+IEhpIEhvdWxvbmcsDQo+IA0KPiBPbiBN
b24sIEF1ZyAxNiwgMjAyMSBhdCAxOjAwIFBNIGhvdWxvbmcgd2VpIDxob3Vsb25nLndlaUBtZWRp
YXRlay5jb20NCj4gPiB3cm90ZToNCj4gPiBIaSBFaXphbiwNCj4gPiANCj4gPiAibWRwLXJkbWEw
IiBtYXkgYmUgbm90IHRoZSBvbmx5IG9uZSBtYXN0ZXIgZGV2aWNlIG5vZGUuIEluIGZhY3QsDQo+
ID4gdGhlcmUNCj4gPiBhcmUgMiAibWRwLXJkbWEiIGluIG10ODE3My4gWW91IGNhbiBzZWUgIm1k
cF9yZG1hMSIgdmlhIGJlbG93IGxpbmsuDQo+ID4gDQo+ID4gDQpodHRwczovL2dpdC5rZXJuZWwu
b3JnL3B1Yi9zY20vbGludXgva2VybmVsL2dpdC9zdGFibGUvbGludXguZ2l0L3RyZWUvYXJjaC9h
cm02NC9ib290L2R0cy9tZWRpYXRlay9tdDgxNzMuZHRzaT9oPXY1LjEzLjExI24xMDE2DQo+ID4g
SWYgd2UgYWRkICJtZWRpYXRlayxtdDgxNzMtbWRwIiB0byAibWRwX3JkbWExIiBsaWtlIGJlbG93
LCB3ZSB3aWxsDQo+ID4gaGF2ZQ0KPiA+IG9uZSBtb3JlIFY0TDIgdmlkZW8gZGV2aWUgbm9kZS4N
Cj4gPiANCj4gPiAgICAgICAgICAgICAgICAgbWRwX3JkbWExOiByZG1hQDE0MDAyMDAwIHsNCj4g
PiAgICAgICAgICAgICAgICAgICAgICAgICBjb21wYXRpYmxlID0gIm1lZGlhdGVrLG10ODE3My1t
ZHAtcmRtYSIsDQo+ID4gICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICJtZWRp
YXRlayxtdDgxNzMtbWRwIjsNCj4gPiAgICAgICAgICAgICAgICAgICAgICAgICAuLi4NCj4gPiAg
ICAgICAgICAgICAgICAgfQ0KPiA+IA0KPiA+IFdlIHNob3VsZCBjb25zaWRlciB0aGUgY2FzZSB0
aGF0IHRoZXJlIGFyZSBtb3JlIHRoYW4gb25lICJNRFBfUkRNQSINCj4gPiBjb21wb25lbnRzLg0K
PiANCj4gV291bGQgaXQgYmUgb2theSB3aXRoIHlvdSBpZiB3ZSBhZGRlZCBzdXBwb3J0IGZvciBt
dWx0aXBsZSBNRFAgbWFzdGVyDQo+IGRldmljZSBub2RlcyBpbiBmb2xsb3ctdXAgY2hhbmdlcz8g
TXkgcmF0aW9uYWxlIGlzIHRoaXM6DQo+IC0gQXMgZmFyIGFzIEkgY2FuIHRlbGwsIHRoZSBtZWRp
YXRlayBpbnRlZ3JhdGlvbiB3aXRoIFY0TDIgY3VycmVudGx5DQo+IG9ubHkgaGFuZGxlcyBhIHNp
bmdsZSBNRFAgbWFzdGVyIGRldmljZSBub2RlLiBJdCdzIG5vdCBjbGVhciB0byBtZQ0KPiB0aGUN
Cj4gc2NvcGUgb2YgY2hhbmdlcyB0aGF0IHdpbGwgYmUgbmVlZGVkIHRvIG1ha2UgdGhpbmdzIHdv
cmsgcHJvcGVybHkNCj4gd2l0aA0KPiBtdWx0aXBsZSBub2Rlcy4NCj4gLSBUaGUgcGF0Y2ggc2Vy
aWVzIG1ha2VzIHZpZGVvIGRlY29kZSB3b3JrIChhZG1pdHRlZGx5LCBpbiBsaWdodCBvZg0KPiB5
b3VyIGNvbW1lbnRzIG5vdCBvcHRpbWFsbHkpIHVwc3RyZWFtLCB3aGljaCBpcyBiZXR0ZXIgdGhh
biBub3QNCj4gbGFuZGluZyB0aGVzZSBjaGFuZ2VzIGF0IGFsbC4NCj4gDQo+IEknZCBsaWtlIHRv
IHNheSB0aGF0IEknbSB2ZXJ5IG9wZW4gdG8gKGFuZCBleGNpdGVkIGFib3V0KSBkaXNjdXNzaW5n
DQo+IGZ1cnRoZXIgd29yayB0byBzdXBwb3J0IG11bHRpcGxlIE1EUCBtYXN0ZXIgbm9kZXMsIHBl
cmhhcHMgd2UgY2FuDQo+IHdvcmsgdG9nZXRoZXIgb24gdGhpcyBzbyBJIGNhbiB1bmRlcnN0YW5k
IHdoYXQgbmVlZHMgdG8gYmUgZG9uZS4NCj4gDQo+IFBsZWFzZSBsZXQgbWUga25vdyB5b3VyIHRo
b3VnaHRzLA0KPiANCj4gRWl6YW4NCg==

