Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E34D23ECC38
	for <lists+linux-media@lfdr.de>; Mon, 16 Aug 2021 03:15:16 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232244AbhHPBPq (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sun, 15 Aug 2021 21:15:46 -0400
Received: from Mailgw01.mediatek.com ([1.203.163.78]:4592 "EHLO
        mailgw01.mediatek.com" rhost-flags-OK-FAIL-OK-FAIL) by vger.kernel.org
        with ESMTP id S231609AbhHPBPp (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Sun, 15 Aug 2021 21:15:45 -0400
X-UUID: 9ab6844cea67458abc723823b4e1d395-20210816
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
        h=Content-Transfer-Encoding:MIME-Version:Content-Type:References:In-Reply-To:Date:CC:To:From:Subject:Message-ID; bh=RQEr/zdFCuICuxl+OW0xx9STP8PX6Pu3KpkKJuqMDno=;
        b=r7L0qvn15ycv4x3IGruagz8UQATnajrpm9PSIVGRiQrwTPAMTwwkjaXPl0kpSM1xv+3unZaQBTrw2ID4vsAUiLfwy2F/N/dtC1s9gaZD25ba1OHDprSXN9aqPzg6I/x+e1iHcu+Ir4lK0P0VCKa4gupkNdsFgOk+7yU3zToTF3c=;
X-UUID: 9ab6844cea67458abc723823b4e1d395-20210816
Received: from mtkmrs31.mediatek.inc [(172.27.4.253)] by mailgw01.mediatek.com
        (envelope-from <houlong.wei@mediatek.com>)
        (mailgw01.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
        with ESMTP id 4055748; Mon, 16 Aug 2021 09:15:10 +0800
Received: from MTKCAS36.mediatek.inc (172.27.4.186) by MTKMBS31N1.mediatek.inc
 (172.27.4.69) with Microsoft SMTP Server (TLS) id 15.0.1497.2; Mon, 16 Aug
 2021 09:15:06 +0800
Received: from mhfsdcap04 (10.17.3.154) by MTKCAS36.mediatek.inc
 (172.27.4.170) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Mon, 16 Aug 2021 09:15:06 +0800
Message-ID: <4d2e4210c74f7fe14d933571df768dc58a1e9266.camel@mediatek.com>
Subject: Re: [PATCH v6 5/9] mtk-mdp: make mdp driver to be loadable by
 platform_device_register*()
From:   houlong wei <houlong.wei@mediatek.com>
To:     Eizan Miyamoto <eizan@chromium.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
CC:     "wenst@chromium.org" <wenst@chromium.org>,
        "Yong Wu =?UTF-8?Q?=28=E5=90=B4=E5=8B=87=29?=" <Yong.Wu@mediatek.com>,
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
Date:   Mon, 16 Aug 2021 09:15:07 +0800
In-Reply-To: <20210802220943.v6.5.Iedb6b4f47788548b0cf7bfffae85cac917344c2f@changeid>
References: <20210802121215.703023-1-eizan@chromium.org>
         <20210802220943.v6.5.Iedb6b4f47788548b0cf7bfffae85cac917344c2f@changeid>
Content-Type: text/plain; charset="UTF-8"
X-Mailer: Evolution 3.28.5-0ubuntu0.18.04.2 
MIME-Version: 1.0
X-TM-SNTS-SMTP: 680883F27902D823AF960F84F7F7E0839A133A61DAECBD205F7E444452E6F9492000:8
X-MTK:  N
Content-Transfer-Encoding: base64
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

T24gTW9uLCAyMDIxLTA4LTAyIGF0IDIwOjEyICswODAwLCBFaXphbiBNaXlhbW90byB3cm90ZToN
Cj4gUmF0aGVyIHRoYW4gaGFuZ2luZyB0aGUgTURQIG1hc3RlciBjb21wb25lbnQgZHJpdmVyIG9m
ZiBvZiB0aGUgcmRtYTANCj4gZGV2aWNlLCBtYWtlIGl0IHBvc3NpYmxlIHRvbyBjcmVhdGUgYSAi
dmlydHVhbCIgZGV2aWNlIGJ5IHJlZ2lzdGVyaW5nDQo+IGl0IHdpdGggcGxhdGZvcm1fZGV2aWNl
X3JlZ2lzdGVyXyooKSB0byBiZSBwcm9iZWQgYnkgdGhlIG10a19tZHBfY29yZQ0KPiBkcml2ZXIu
DQo+IA0KPiBCcm9hZGx5LCB0aHJlZSBpbnRlcmRlcGVuZGVudCB0aGluZ3MgYXJlIGRvbmUgYnkg
dGhpcyBjaGFuZ2U6DQo+IC0gTWFrZSBpdCBpcyBwb3NzaWJsZSB0byBzZWFyY2ggZm9yIE1EUCBk
ZXZpY2VzIGluIHRoZSBkZXZpY2UgdHJlZQ0KPiAgIHRocm91Z2ggdGhlIGdyYW5kcGFyZW50IGRl
dmljZSdzIG9mX25vZGUuDQo+IC0gdjRsLXJlbGF0ZWQgc2V0dXAgaXMgbW92ZWQgaW50byBmcm9t
IHRoZSBtdGtfbWRwX2NvcmUgZHJpdmVyIHRvIHRoZQ0KPiAgIG10a19tZHBfY29tcCBkcml2ZXIu
DQo+IC0gUHJlc2VuY2Ugb2YgYSBtZWRpYXRlayx2cHUgcHJvcGVydHkgaW4gYW4gTURQIGNvbXBv
bmVudCBkZXZpY2Ugbm9kZQ0KPiAgIGlzIHVzZWQgdG8gZGV0ZXJtaW5lIHdoYXQgZGV2aWNlIHRv
IHVzZSB3aGVuIGRpc3BhdGNoaW5nIERNQSBvcHMNCj4gZnJvbQ0KPiAgIHRoZSByZWxldmFudCBp
b2N0bCwgYW5kIGFsc28gZG8gVjRMMiBpbml0aWFsaXphdGlvbiBpbiB0aGlzIGNhc2UuDQo+IA0K
PiBTaWduZWQtb2ZmLWJ5OiBFaXphbiBNaXlhbW90byA8ZWl6YW5AY2hyb21pdW0ub3JnPg0KPiAt
LS0NCg0KUmV2aWV3ZWQtYnk6IEhvdWxvbmcgV2VpIDxob3Vsb25nLndlaUBtZWRpYXRlay5jb20+
DQoNCj4gQ2hhbmdlcyBpbiB2NjoNCj4gLSBEb24ndCBwcm9wYWdhdGUgZXJyb3JzIGZyb20gY2xv
Y2tfb24vb2ZmIGFzIGFuIGFmdGVydGhvdWdodC4NCj4gLSBTcGxpdCBhcGFydCBtb2RpZnlpbmcg
bWRwIGRyaXZlciB0byBiZSBsb2FkYWJsZSBmcm9tIG1tc3lzIGZyb20NCj4gICBhY3R1YWxseSBs
b2FkaW5nIGl0IGZyb20gbW1zeXMgaW50byB0d28gY2hhbmdzIHRvIG1ha2UgcmV2aWV3DQo+IGVh
c2llci4NCj4gLSBVcGRhdGUgZGV2aWNldHJlZSBiaW5kaW5ncyB0byByZWZsZWN0IG5vIGxvbmdl
ciBuZWVkaW5nIHRoZQ0KPiAgIG1lZGlhdGVrLHZwdSBwcm9wZXJ0eSBpbiB0aGUgbWRwX3JkbWEw
IGRldmljZSBub2RlLg0KPiAtIFNvbWUgc3R5bGlzdGljIGNsZWFudXBzLg0KPiANCj4gQ2hhbmdl
cyBpbiB2NToNCj4gLSByZWJhc2UgYW5kIHRlc3Qgb24gNS4xMy1uZXh0IEAgZTJmNzRiMTNkYmU2
DQo+IA0KPiBDaGFuZ2VzIGluIHY0Og0KPiAtIHJlYmFzZSBhbmQgdGVzdCBvbiA1LjEzDQo+IC0g
ZG9uJ3QgZGVwZW5kIG9uIA0KPiBodHRwczovL3BhdGNod29yay5rZXJuZWwub3JnL3Byb2plY3Qv
bGludXgtbWVkaWF0ZWsvbGlzdC8/c2VyaWVzPTQ2NDg3Mw0KPiANCj4gQ2hhbmdlcyBpbiB2MzoN
Cj4gLSBnZXQgbWRwIG1hc3RlciBmcm9tIGFsaWFzZXMgaW5zdGVhZCBvZiBzdHJjbXAgYWdhaW5z
dCBvZl9ub2RlLT5uYW1lDQo+IA0KPiBDaGFuZ2VzIGluIHYyOg0KPiAtIHJlYmFzZWQgb250byBM
aW51eCA1LjEyDQo+IC0gMTAwIGNoYXIgbGluZSBsZW5ndGggYWxsb3dhbmNlIHdhcyB1dGlsaXpl
ZCBpbiBhIGZldyBwbGFjZXMNCj4gLSBSZW1vdmFsIG9mIGEgcmVkdW5kYW50IGRldl9lcnIoKSBw
cmludCBhdCB0aGUgZW5kIG9mDQo+ICAgbXRrX21kcF9jb21wX2luaXQoKQ0KPiAtIEluc3RlYWQg
b2YgcHJpbnRpbmcgZXJyb3JzIGFuZCBpZ25vcmluZyB0aGVtLCBJJ3ZlIGFkZGVkIGEgcGF0Y2gg
dG8NCj4gICBjb3JyZWN0bHkgcHJvcGFnYXRlIHRoZW0uDQo+IC0gVXNlIG9mIEMgc3R5bGUgY29t
bWVudHMuDQo+IC0gVGhyZWUgYWRkaXRpb25hbCBwYXRjaGVzIHdlcmUgYWRkZWQgdG8gZWxpbWlu
YXRlIGRlcGVuZGVuY3kgb24gdGhlDQo+ICAgbWVkaWF0ZWssdnB1IHByb3BlcnR5IGluc2lkZSB0
aGUgbWRwX3JkbWEwIGRldmljZSBub2RlLg0KDQpbLi4uXQ0K

