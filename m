Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 7902A38D4EF
	for <lists+linux-media@lfdr.de>; Sat, 22 May 2021 11:51:17 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230295AbhEVJwi (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sat, 22 May 2021 05:52:38 -0400
Received: from Mailgw01.mediatek.com ([1.203.163.78]:22039 "EHLO
        mailgw01.mediatek.com" rhost-flags-OK-FAIL-OK-FAIL) by vger.kernel.org
        with ESMTP id S230207AbhEVJwi (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Sat, 22 May 2021 05:52:38 -0400
X-UUID: 3be9b6b4c9af4c8db00d7a7d7cefbdf7-20210522
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
        h=Content-Transfer-Encoding:MIME-Version:Content-Type:References:In-Reply-To:Date:CC:To:From:Subject:Message-ID; bh=aaYsqkqjYTO4Peo/NYX1DMDat+z2Uuc/qMNttr4MZeA=;
        b=Fg9RpcwLKseJ7ImoKxodQ6n9ZuR94Ch71aS4tAV2bCqKvgfN88D6IpPZN0CixsHZoI02Wv6sibe+d+c3RbEfxiuxyR+vnH8tzrP9X1QTw9at/44hSO0pNH0dy/bvbTa4qvP6QukMXoKERqEQNeSTtvW/hrd4AHOyIREwDbIwF8M=;
X-UUID: 3be9b6b4c9af4c8db00d7a7d7cefbdf7-20210522
Received: from mtkcas34.mediatek.inc [(172.27.4.253)] by mailgw01.mediatek.com
        (envelope-from <yong.wu@mediatek.com>)
        (mailgw01.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
        with ESMTP id 878822936; Sat, 22 May 2021 17:51:11 +0800
Received: from MTKCAS36.mediatek.inc (172.27.4.186) by MTKMBS31N2.mediatek.inc
 (172.27.4.87) with Microsoft SMTP Server (TLS) id 15.0.1497.2; Sat, 22 May
 2021 17:51:00 +0800
Received: from [10.17.3.153] (10.17.3.153) by MTKCAS36.mediatek.inc
 (172.27.4.170) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Sat, 22 May 2021 17:50:59 +0800
Message-ID: <1621677059.2894.14.camel@mhfsdcap03>
Subject: Re: [PATCH v4,3/6] media: mtk-vcodec: Support 4GB~8GB range iova
 space for venc
From:   Yong Wu <yong.wu@mediatek.com>
To:     Tzung-Bi Shih <tzungbi@google.com>
CC:     Irui Wang <irui.wang@mediatek.com>,
        Alexandre Courbot <acourbot@chromium.org>,
        Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        "Tiffany Lin" <tiffany.lin@mediatek.com>,
        Andrew-CT Chen <andrew-ct.chen@mediatek.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Matthias Brugger <matthias.bgg@gmail.com>,
        Tomasz Figa <tfiga@google.com>,
        Hsin-Yi Wang <hsinyi@chromium.org>,
        Maoguang Meng <maoguang.meng@mediatek.com>,
        "Longfei Wang" <longfei.wang@mediatek.com>,
        Yunfei Dong <yunfei.dong@mediatek.com>,
        Fritz Koenig <frkoenig@chromium.org>,
        Tzung-Bi Shih <tzungbi@chromium.org>,
        <linux-media@vger.kernel.org>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        "moderated list:ARM/Mediatek SoC support" 
        <linux-arm-kernel@lists.infradead.org>,
        <srv_heupstream@mediatek.com>,
        "moderated list:ARM/Mediatek SoC support" 
        <linux-mediatek@lists.infradead.org>,
        <Project_Global_Chrome_Upstream_Group@mediatek.com>
Date:   Sat, 22 May 2021 17:50:59 +0800
In-Reply-To: <CA+Px+wXkn2ih0JdgKBOoHZU1=QqO=vE1MAP5tauHvRe=rtjg7g@mail.gmail.com>
References: <20210521070139.20644-1-irui.wang@mediatek.com>
         <20210521070139.20644-4-irui.wang@mediatek.com>
         <CA+Px+wXkn2ih0JdgKBOoHZU1=QqO=vE1MAP5tauHvRe=rtjg7g@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"
X-Mailer: Evolution 3.10.4-0ubuntu2 
MIME-Version: 1.0
X-TM-SNTS-SMTP: D209C5D26ECC073ABCE984EEC7E77BD5AD0A4CF1B0D8E0187A280BECBD0F64C82000:8
X-MTK:  N
Content-Transfer-Encoding: base64
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

T24gRnJpLCAyMDIxLTA1LTIxIGF0IDE2OjA2ICswODAwLCBUenVuZy1CaSBTaGloIHdyb3RlOg0K
PiBPbiBGcmksIE1heSAyMSwgMjAyMSBhdCAzOjAyIFBNIElydWkgV2FuZyA8aXJ1aS53YW5nQG1l
ZGlhdGVrLmNvbT4gd3JvdGU6DQo+ID4gKyAgICAgICBpZiAob2ZfZ2V0X3Byb3BlcnR5KHBkZXYt
PmRldi5vZl9ub2RlLCAiZG1hLXJhbmdlcyIsIE5VTEwpKQ0KPiA+ICsgICAgICAgICAgICAgICBk
bWFfc2V0X21hc2tfYW5kX2NvaGVyZW50KCZwZGV2LT5kZXYsIERNQV9CSVRfTUFTSygzNCkpOw0K
PiA+ICsNCj4gDQo+IEZyb20geW91ciBwcmV2aW91cyBkdC1iaW5kaW5ncyBwYXRjaFsxXSwgaXQg
aGFzIDQgYmFua3MuDQo+ID4gMH40RzsgNEd+OEc7IDhHfjEyRzsgMTJHfjE2Ry4NCj4gDQo+IEJ1
dCwgdGhlIGNvZGUgdHJlYXRzIGl0IGFzIGEgYm9vbGVhbi4gIEkuZS4gMH40R0IgaWYgbm9uLWV4
aXN0ZW50Ow0KPiBvdGhlcndpc2UsIDRHQn44R0IuDQoNCkhlcmUgRE1BX0JJVF9NQVNLKDM0KSBt
ZWFucyBkbWEgYWRkcmVzcyBzdXBwb3J0IDM0Yml0cygxNkdCKS4NCg0KVGhlIGNvZGUgaXMgb2sg
Zm9yIG1lLiBPbmx5IHRoZSBjb21taXQgbWVzc2FnZSBzaG91bGQgbm90IHNheSA0Ry04Ry4gaXQN
CmNvdWxkIGJlIHNvbWV0aGluZyBsaWtlOg0KDQpVc2UgdGhlIGRtYV9zZXRfbWFza19hbmRfY29o
ZXJlbnQgaGVscGVyIHRvIHNldCB2ZW5jIERNQSBiaXQgbWFzayB0bw0Kc3VwcG9ydCAzNGJpdHMg
aW92YSBzcGFjZSgxNkdCKSB0aGF0IHRoZSBtdDgxOTIgaW9tbXUgSFcgc3VwcG9ydC4gV2hvbGUN
CnRoZSBpb3ZhIHJhbmdlIHNlcGFyYXRlIHRvIDB+NEcvNEd+OEcvOEd+MTJHLzEyR34xNkcsIFJl
Z2FyZGluZyB3aGljaA0KaW92YSByYW5nZSBWRU5DIGFjdHVhbGx5IGxvY2F0ZSwgaXQgZGVwZW5k
IG9uIHRoZSBkbWEtcmFuZ2VzIHByb3BlcnR5IG9mDQp0aGUgdmVuYyBkdHNpIG5vZGUuDQoNCj4g
DQo+IFsxXTogaHR0cHM6Ly9wYXRjaHdvcmsubGludXh0di5vcmcvcHJvamVjdC9saW51eC1tZWRp
YS9wYXRjaC8yMDIxMDUyMTA3MDEzOS4yMDY0NC0zLWlydWkud2FuZ0BtZWRpYXRlay5jb20vDQo+
IA0KPiBfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXw0KPiBM
aW51eC1tZWRpYXRlayBtYWlsaW5nIGxpc3QNCj4gTGludXgtbWVkaWF0ZWtAbGlzdHMuaW5mcmFk
ZWFkLm9yZw0KPiBodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xp
bnV4LW1lZGlhdGVrDQoNCg==

