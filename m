Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id F29FD3C55E9
	for <lists+linux-media@lfdr.de>; Mon, 12 Jul 2021 12:56:23 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1350418AbhGLIMi (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 12 Jul 2021 04:12:38 -0400
Received: from mailgw01.mediatek.com ([60.244.123.138]:60826 "EHLO
        mailgw01.mediatek.com" rhost-flags-OK-FAIL-OK-FAIL) by vger.kernel.org
        with ESMTP id S1355638AbhGLIKK (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 12 Jul 2021 04:10:10 -0400
X-UUID: 8eab63c0825a494fb72f3489822534c5-20210712
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
        h=Content-Transfer-Encoding:MIME-Version:Content-Type:References:In-Reply-To:Date:CC:To:From:Subject:Message-ID; bh=pYihUe16LMSA8Z5B8sReIfUro/yCMswXaige3lLlv3k=;
        b=WH3RlvhMtzj5bi2g9GfaCo+Qjkau9BbZftNtDEhMvaunJb4wP5HVjQ9MGlDoAKJV5/RUX6mA/F0BfkDUssc72SEuowPyFrG8JNGOgS5HzMKvQvkRBzY7hW5xO4h0MQQuMQ6erTW+g4QTQvKOyYE6hf+BdfG/bMOsO/luqbrahTs=;
X-UUID: 8eab63c0825a494fb72f3489822534c5-20210712
Received: from mtkcas07.mediatek.inc [(172.21.101.84)] by mailgw01.mediatek.com
        (envelope-from <yunfei.dong@mediatek.com>)
        (Generic MTA with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
        with ESMTP id 405197711; Mon, 12 Jul 2021 16:07:16 +0800
Received: from mtkcas07.mediatek.inc (172.21.101.84) by
 mtkmbs02n1.mediatek.inc (172.21.101.77) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Mon, 12 Jul 2021 16:07:08 +0800
Received: from [10.17.3.153] (10.17.3.153) by mtkcas07.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Mon, 12 Jul 2021 16:07:07 +0800
Message-ID: <1626077227.7221.20.camel@mhfsdcap03>
Subject: Re: [PATCH v1, 06/14] media: mtk-vcodec: Add irq interface for core
 hardware
From:   mtk12024 <yunfei.dong@mediatek.com>
To:     Tzung-Bi Shih <tzungbi@google.com>
CC:     Alexandre Courbot <acourbot@chromium.org>,
        Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        Tzung-Bi Shih <tzungbi@chromium.org>,
        "Tiffany Lin" <tiffany.lin@mediatek.com>,
        Andrew-CT Chen <andrew-ct.chen@mediatek.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Matthias Brugger <matthias.bgg@gmail.com>,
        Tomasz Figa <tfiga@google.com>,
        Hsin-Yi Wang <hsinyi@chromium.org>,
        "Fritz Koenig" <frkoenig@chromium.org>,
        Irui Wang <irui.wang@mediatek.com>,
        <linux-media@vger.kernel.org>, <devicetree@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>,
        <linux-arm-kernel@lists.infradead.org>,
        <srv_heupstream@mediatek.com>,
        <linux-mediatek@lists.infradead.org>,
        <Project_Global_Chrome_Upstream_Group@mediatek.com>
Date:   Mon, 12 Jul 2021 16:07:07 +0800
In-Reply-To: <CA+Px+wWRE0DR15GgorZnoN1xdAqoau94gkoF7-x7h2hd21ZGXg@mail.gmail.com>
References: <20210707062157.21176-1-yunfei.dong@mediatek.com>
         <20210707062157.21176-7-yunfei.dong@mediatek.com>
         <CA+Px+wWRE0DR15GgorZnoN1xdAqoau94gkoF7-x7h2hd21ZGXg@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"
X-Mailer: Evolution 3.10.4-0ubuntu2 
MIME-Version: 1.0
X-MTK:  N
Content-Transfer-Encoding: base64
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

SGkgVHp1bmctQmksDQoNClRoYW5rcyBmb3IgeW91ciBkZXRhaWwgZmVlZGJhY2suDQpJIGFkZCB0
aGUgZGVzY3JpcHRpb24gYWNjb3JkaW5nIHRvIHlvdXIgZWFjaCBjb21tZW50cy4NCg0KT24gRnJp
LCAyMDIxLTA3LTA5IGF0IDE1OjU5ICswODAwLCBUenVuZy1CaSBTaGloIHdyb3RlOg0KPiBPbiBX
ZWQsIEp1bCA3LCAyMDIxIGF0IDI6MjIgUE0gWXVuZmVpIERvbmcgPHl1bmZlaS5kb25nQG1lZGlh
dGVrLmNvbT4gd3JvdGU6DQo+ID4gK3N0YXRpYyBpbnQgbXRrX3Zjb2RlY19nZXRfaHdfY291bnQo
c3RydWN0IG10a192Y29kZWNfZGV2ICpkZXYpDQo+ID4gK3sNCj4gPiArICAgICAgIGlmIChkZXYt
PnZkZWNfcGRhdGEtPmh3X2FyY2ggPT0gTVRLX1ZERUNfUFVSRV9TSU5HTEVfQ09SRSkNCj4gPiAr
ICAgICAgICAgICAgICAgcmV0dXJuIDE7DQo+ID4gKyAgICAgICBlbHNlIGlmIChkZXYtPnZkZWNf
cGRhdGEtPmh3X2FyY2ggPT0gTVRLX1ZERUNfTEFUX1NJTkdMRV9DT1JFKQ0KPiA+ICsgICAgICAg
ICAgICAgICByZXR1cm4gMjsNCj4gPiArICAgICAgIGVsc2UNCj4gPiArICAgICAgICAgICAgICAg
cmV0dXJuIDA7DQo+ID4gK30NCj4gVXNlIGEgc3dpdGNoIC4uIGNhc2UgLi4gd291bGQgYmUgZWFz
aWVyIHRvIHJlYWQuDQpZZXMNCj4gV291bGQgaXQgYmUgYmV0dGVyIHRvIHVzZSBzb21lIG1hY3Jv
IG9yIGVudW1zIGZvciB0aGUgbWFnaWMgbnVtYmVycz8NClllcywgYWRkIGVudW1zIGZvciBtYWdp
YyBudW1iZXJzLiANCmVudW0gbXRrX3ZkZWNfaHdfY291bnQgew0KCU1US19WREVDX05PX0hXID0g
MCwNCglNVEtfVkRFQ19PTkVfQ09SRSwNCglNVEtfVkRFQ19PTkVfTEFUX09ORV9DT1JFLA0KCU1U
S19WREVDX01BWF9IV19DT1VOVCwNCn07DQo+ID4gQEAgLTExMyw4ICsxMTQsNyBAQCBzdGF0aWMg
aW50IG10a192ZGVjX2NvbXBfaW5pdF9pcnEoc3RydWN0IG10a192ZGVjX2NvbXBfZGV2ICpkZXYp
DQo+ID4gICAgICAgICB9DQo+ID4NCj4gPiAgICAgICAgIHJldCA9IGRldm1fcmVxdWVzdF9pcnEo
JnBkZXYtPmRldiwgZGV2LT5kZWNfaXJxLA0KPiA+IC0gICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgbXRrX3ZkZWNfY29tcF9pcnFfaGFuZGxlciwNCj4gPiAtICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgIDAsIHBkZXYtPm5hbWUsIGRldik7DQo+ID4gKyAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICBtdGtfdmRlY19jb21wX2lycV9oYW5kbGVyLCAwLCBwZGV2LT5uYW1lLCBk
ZXYpOw0KPiBUaGUgY2hhbmdlIGlzIGlycmVsZXZhbnQgdG8gdGhpcyBwYXRjaC4NCldpbGwgZml4
Lg0KPiA+IEBAIC0xNTQsOCArMTU0LDEwIEBAIHN0YXRpYyBpbnQgbXRrX3ZkZWNfY29tcF9wcm9i
ZShzdHJ1Y3QgcGxhdGZvcm1fZGV2aWNlICpwZGV2KQ0KPiA+ICAgICAgICAgICAgICAgICBkbWFf
c2V0X21hc2tfYW5kX2NvaGVyZW50KCZwZGV2LT5kZXYsIERNQV9CSVRfTUFTSygzNCkpOw0KPiA+
DQo+ID4gICAgICAgICByZXQgPSBtdGtfdmRlY19jb21wX2luaXRfaXJxKGRldik7DQo+ID4gLSAg
ICAgICBpZiAocmV0KQ0KPiA+ICsgICAgICAgaWYgKHJldCkgew0KPiA+ICsgICAgICAgICAgICAg
ICBkZXZfZXJyKCZwZGV2LT5kZXYsICJGYWlsZWQgdG8gcmVnaXN0ZXIgaXJxIGhhbmRsZXIuXG4i
KTsNCj4gPiAgICAgICAgICAgICAgICAgZ290byBlcnI7DQo+ID4gKyAgICAgICB9DQo+IFRoZSBj
aGFuZ2Ugc2hvdWxkbid0IGJlIGluIHRoaXMgcGF0Y2guICBJbnN0ZWFkLCBhbm90aGVyIHBhdGNo
IHRoYXQNCj4gYWRkcyB0aGUgbXRrX3ZkZWNfY29tcF9pbml0X2lycSgpIGludm9jYXRpb24uDQo+
IA0KPiA+ICtpbnQgbXRrX3Zjb2RlY193YWl0X2Zvcl9jb21wX2RvbmVfY3R4KHN0cnVjdCBtdGtf
dmNvZGVjX2N0eCAgKmN0eCwNCj4gUmVtb3ZlIHRoZSBleHRyYSBzcGFjZSBiZWZvcmUgIipjdHgi
Lg0KV2lsIGZpeC4NCg==

