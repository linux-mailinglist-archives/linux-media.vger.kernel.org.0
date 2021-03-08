Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D0D8D3305DB
	for <lists+linux-media@lfdr.de>; Mon,  8 Mar 2021 03:20:31 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232388AbhCHCMI (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sun, 7 Mar 2021 21:12:08 -0500
Received: from mailgw02.mediatek.com ([1.203.163.81]:30929 "EHLO
        mailgw02.mediatek.com" rhost-flags-OK-FAIL-OK-FAIL) by vger.kernel.org
        with ESMTP id S232315AbhCHCLh (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Sun, 7 Mar 2021 21:11:37 -0500
X-UUID: 64f174b2d35a4c13a756d9f59fa67f73-20210308
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
        h=Content-Transfer-Encoding:MIME-Version:Content-Type:References:In-Reply-To:Date:CC:To:From:Subject:Message-ID; bh=WARmp+G5Amaw16yL5UPtrSSIHvoPHKDE08RNLDiboJ8=;
        b=YFSdi03C6PkHhJH1u3u3s0auj50rn3dLMa5BWG0YrQg0rcnG/AQnNgVV85HvqtRCJwfJ7S2UueWkN9ddSyVirLsDlcYCIxk16EfV9Of0wDq5pnfuegKdBNnzchm3rnfgRbDjLLCcEkS8mX4u8r2oq6cLMDVkHuHq+hVp7AcYvbo=;
X-UUID: 64f174b2d35a4c13a756d9f59fa67f73-20210308
Received: from mtkcas35.mediatek.inc [(172.27.4.253)] by mailgw02.mediatek.com
        (envelope-from <irui.wang@mediatek.com>)
        (mailgw01.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
        with ESMTP id 1409625790; Mon, 08 Mar 2021 10:11:29 +0800
Received: from MTKCAS32.mediatek.inc (172.27.4.184) by MTKMBS31N1.mediatek.inc
 (172.27.4.69) with Microsoft SMTP Server (TLS) id 15.0.1497.2; Mon, 8 Mar
 2021 10:11:25 +0800
Received: from [10.17.3.153] (10.17.3.153) by MTKCAS32.mediatek.inc
 (172.27.4.170) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Mon, 8 Mar 2021 10:11:25 +0800
Message-ID: <1615169484.316.10.camel@mhfsdcap03>
Subject: Re: [PATCH v2,1/3] dt-bindings: media: mtk-vcodec: Separating mtk
 vcodec encoder node
From:   Irui Wang <irui.wang@mediatek.com>
To:     Rob Herring <robh@kernel.org>
CC:     Alexandre Courbot <acourbot@chromium.org>,
        Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        Tiffany Lin <tiffany.lin@mediatek.com>,
        Andrew-CT Chen <andrew-ct.chen@mediatek.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Matthias Brugger <matthias.bgg@gmail.com>,
        "Tomasz Figa" <tfiga@google.com>,
        Hsin-Yi Wang <hsinyi@chromium.org>,
        Maoguang Meng <maoguang.meng@mediatek.com>,
        Longfei Wang <longfei.wang@mediatek.com>,
        Yunfei Dong <yunfei.dong@mediatek.com>, <yong.wu@mediatek.com>,
        <linux-media@vger.kernel.org>, <devicetree@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>,
        <linux-arm-kernel@lists.infradead.org>,
        <srv_heupstream@mediatek.com>, <linux-mediatek@lists.infradead.org>
Date:   Mon, 8 Mar 2021 10:11:24 +0800
In-Reply-To: <20210306204649.GA1177075@robh.at.kernel.org>
References: <20210225073603.5881-1-irui.wang@mediatek.com>
         <20210306204649.GA1177075@robh.at.kernel.org>
Content-Type: text/plain; charset="UTF-8"
X-Mailer: Evolution 3.10.4-0ubuntu2 
MIME-Version: 1.0
X-TM-SNTS-SMTP: 6D00D0A912102C7618451A84A1BD2A78131A232820F02B87C660563313B06FB92000:8
X-MTK:  N
Content-Transfer-Encoding: base64
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

T24gU2F0LCAyMDIxLTAzLTA2IGF0IDEzOjQ2IC0wNzAwLCBSb2IgSGVycmluZyB3cm90ZToNCj4g
T24gVGh1LCBGZWIgMjUsIDIwMjEgYXQgMDM6MzY6MDFQTSArMDgwMCwgSXJ1aSBXYW5nIHdyb3Rl
Og0KPiA+IFVwZGF0ZXMgYmluZGluZyBkb2N1bWVudCBzaW5jZSB0aGUgYXZjIGFuZCB2cDggaGFy
ZHdhcmUgZW5jb2RlciBpbg0KPiA+IE1UODE3MyBhcmUgbm93IHNlcGFyYXRlZC4gU2VwYXJhdGUg
Im1lZGlhdGVrLG10ODE3My12Y29kZWMtZW5jIiB0bw0KPiA+ICJtZWRpYXRlayxtdDgxNzMtdmNv
ZGVjLWVuYy12cDgiIGFuZCAibWVkaWF0ZWssbXQ4MTczLXZjb2RlYy1lbmMiLg0KPiANCj4gVGhp
cyBpcyBub3QgYSBjb21wYXRpYmxlIGNoYW5nZS4gUGxlYXNlIGV4cGxhaW4gdGhhdCBoZXJlIGFu
ZCB3aHkgdGhhdCdzIA0KPiBva2F5IChpZiBpdCBpcykuDQo+IA0KRGVhciBSb2IsDQoNCkFzIHRo
ZSBmb2xsb3dpbmcgY29tbWl0IG1lc3NhZ2UsIHRoaXMgaXMgYSBwYXRjaCBmb3Igc21pIGNsZWFu
aW5nIHVwDQoibWVkaWF0ZWssbGFyYiIsIG9yIHB1dCB0aGUgZm9sbG93aW5nIG1lc3NhZ2UgaW4g
dGhlIGNvbW1pdCBtZXNzYWdlOg0KDQp0aGlzIHBhdGNoIHNlcGFyYXRlcyB0aGUgdHdvIGRldmlj
ZXMsIGl0J3MgYSBwcmVwYXJpbmcgcGF0Y2ggZm9yIGFkZGluZw0KZGV2aWNlX2xpbmsgYmV0d2Vl
biB0aGUgbGFyYnMgYW5kIHZlbmMtZGV2aWNlLiBJdCdzIG1haW5seSBmb3IgZml4aW5nDQp0aGUg
cHJvYmxlbToNCmh0dHBzOi8vbGttbC5vcmcvbGttbC8yMDE5LzkvMy8zMTYNCg0KSXMgdGhpcyBP
SyA/DQo+ID4gDQo+ID4gVGhpcyBpcyBhIHByZXBhcmluZyBwYXRjaCBmb3Igc21pIGNsZWFuaW5n
IHVwICJtZWRpYXRlayxsYXJiIi4NCj4gPiANCj4gPiBBY2tlZC1ieTogVGlmZmFueSBMaW4gPHRp
ZmZhbnkubGluQG1lZGlhdGVrLmNvbT4NCj4gPiBTaWduZWQtb2ZmLWJ5OiBIc2luLVlpIFdhbmcg
PGhzaW55aUBjaHJvbWl1bS5vcmc+DQo+ID4gU2lnbmVkLW9mZi1ieTogTWFvZ3VhbmcgTWVuZyA8
bWFvZ3VhbmcubWVuZ0BtZWRpYXRlay5jb20+DQo+ID4gU2lnbmVkLW9mZi1ieTogSXJ1aSBXYW5n
IDxpcnVpLndhbmdAbWVkaWF0ZWsuY29tPg0KPiA+IC0tLQ0KPiA+IENoYW5nZSBzaW5jZSB2MToN
Cj4gPiAtIHJlbmFtZSBjb21wYXRpYmxlIGFuZCBkZXZpY2Ugbm9kZQ0KPiA+IC0tLQ0KPiA+ICAu
Li4vYmluZGluZ3MvbWVkaWEvbWVkaWF0ZWstdmNvZGVjLnR4dCAgICAgICAgfCA1NSArKysrKysr
KysrLS0tLS0tLS0tDQo+ID4gIDEgZmlsZSBjaGFuZ2VkLCAyOSBpbnNlcnRpb25zKCspLCAyNiBk
ZWxldGlvbnMoLSkNCj4gPiANCj4gPiBkaWZmIC0tZ2l0IGEvRG9jdW1lbnRhdGlvbi9kZXZpY2V0
cmVlL2JpbmRpbmdzL21lZGlhL21lZGlhdGVrLXZjb2RlYy50eHQgYi9Eb2N1bWVudGF0aW9uL2Rl
dmljZXRyZWUvYmluZGluZ3MvbWVkaWEvbWVkaWF0ZWstdmNvZGVjLnR4dA0KPiA+IGluZGV4IDgy
MTc0MjRmZDRiZC4uMDMyMDljYmQ3NTQwIDEwMDY0NA0KPiA+IC0tLSBhL0RvY3VtZW50YXRpb24v
ZGV2aWNldHJlZS9iaW5kaW5ncy9tZWRpYS9tZWRpYXRlay12Y29kZWMudHh0DQo+ID4gKysrIGIv
RG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL21lZGlhL21lZGlhdGVrLXZjb2RlYy50
eHQNCj4gPiBAQCAtNCw3ICs0LDkgQEAgTWVkaWF0ZWsgVmlkZW8gQ29kZWMgaXMgdGhlIHZpZGVv
IGNvZGVjIGh3IHByZXNlbnQgaW4gTWVkaWF0ZWsgU29DcyB3aGljaA0KPiA+ICBzdXBwb3J0cyBo
aWdoIHJlc29sdXRpb24gZW5jb2RpbmcgYW5kIGRlY29kaW5nIGZ1bmN0aW9uYWxpdGllcy4NCj4g
PiAgDQo+ID4gIFJlcXVpcmVkIHByb3BlcnRpZXM6DQo+ID4gLS0gY29tcGF0aWJsZSA6ICJtZWRp
YXRlayxtdDgxNzMtdmNvZGVjLWVuYyIgZm9yIE1UODE3MyBlbmNvZGVyDQo+ID4gKy0gY29tcGF0
aWJsZSA6IG11c3QgYmUgb25lIG9mIHRoZSBmb2xsb3dpbmcgc3RyaW5nOg0KPiA+ICsgICJtZWRp
YXRlayxtdDgxNzMtdmNvZGVjLWVuYy12cDgiIGZvciBtdDgxNzMgdnA4IGVuY29kZXIuDQo+ID4g
KyAgIm1lZGlhdGVrLG10ODE3My12Y29kZWMtZW5jIiBmb3IgbXQ4MTczIGF2YyBlbmNvZGVyLg0K
PiA+ICAgICJtZWRpYXRlayxtdDgxODMtdmNvZGVjLWVuYyIgZm9yIE1UODE4MyBlbmNvZGVyLg0K
PiA+ICAgICJtZWRpYXRlayxtdDgxNzMtdmNvZGVjLWRlYyIgZm9yIE1UODE3MyBkZWNvZGVyLg0K
PiA+ICAtIHJlZyA6IFBoeXNpY2FsIGJhc2UgYWRkcmVzcyBvZiB0aGUgdmlkZW8gY29kZWMgcmVn
aXN0ZXJzIGFuZCBsZW5ndGggb2YNCj4gPiBAQCAtMTMsMTAgKzE1LDEwIEBAIFJlcXVpcmVkIHBy
b3BlcnRpZXM6DQo+ID4gIC0gbWVkaWF0ZWssbGFyYiA6IG11c3QgY29udGFpbiB0aGUgbG9jYWwg
YXJiaXRlcnMgaW4gdGhlIGN1cnJlbnQgU29jcy4NCj4gPiAgLSBjbG9ja3MgOiBsaXN0IG9mIGNs
b2NrIHNwZWNpZmllcnMsIGNvcnJlc3BvbmRpbmcgdG8gZW50cmllcyBpbg0KPiA+ICAgIHRoZSBj
bG9jay1uYW1lcyBwcm9wZXJ0eS4NCj4gPiAtLSBjbG9jay1uYW1lczogZW5jb2RlciBtdXN0IGNv
bnRhaW4gInZlbmNfc2VsX3NyYyIsICJ2ZW5jX3NlbCIsLA0KPiA+IC0gICJ2ZW5jX2x0X3NlbF9z
cmMiLCAidmVuY19sdF9zZWwiLCBkZWNvZGVyIG11c3QgY29udGFpbiAidmNvZGVjcGxsIiwNCj4g
PiAtICAidW5pdnBsbF9kMiIsICJjbGtfY2NpNDAwX3NlbCIsICJ2ZGVjX3NlbCIsICJ2ZGVjcGxs
IiwgInZlbmNwbGwiLA0KPiA+IC0gICJ2ZW5jX2x0X3NlbCIsICJ2ZGVjX2J1c19jbGtfc3JjIi4N
Cj4gPiArLSBjbG9jay1uYW1lczoNCj4gPiArICAgZW5jb2RlciBtdXN0IGNvbnRhaW4gInZlbmNf
c2VsIjsNCj4gDQo+IFdoYXQgaGFwcGVuZWQgdG8gdGhlIG90aGVyIGNsb2Nrcz8NCj4gDQo+IFNl
ZW1zIGxpa2UgeW91IGFyZSBkcm9wcGluZyB3aGF0IGFyZSBwYXJlbnQgY2xvY2tzPyBUaGF0IHNl
ZW1zIHVucmVsYXRlZCANCj4gdG8gdGhlIFZQOCBzcGxpdD8gSWYgc28sIHRoYXQncyBhIHNlcGFy
YXRlIGNoYW5nZS4NCg0KRGVhciBSb2IsDQoNCiJ2ZW5jX3NlbCIgaXMgZm9yIGF2YyBlbmNvZGVy
IGNsb2NrLCAidmVuY19zZWxfc3JjIiBpcyBpdHMgcGFyZW50LCB3ZQ0KcmVtb3ZlIHRoZSBwYXJl
bnQgYmVjYXVzZSB3ZSBzZXQgImFzc2lnbmVkLWNsb2NrcyIgYW5kDQoiYXNzaWduZWQtY2xvY2st
cGFyZW50cyINCg0Kc2FtZSBhcyB2ZW5jX2x0X3NlbCIgZm9yIHZwOCBlbmNvZGVyLCB3ZSBzcGxp
dCB0aGUgZGV2aWNlIG5vZGUsIHNvIHRoZQ0KY2xvY2tzIG5lZWQgc3BsaXQgYXMgd2VsbC4gb3Ig
Y2FuIHdlIHNheToNCi0gY2xvY2stbmFtZXM6DQogICBhdmMgdmVuYyBtdXN0IGNvbnRhaW4gInZl
bmNfc2VsIjsNCiAgIHZwOCB2ZW5jIG11c3QgY29udGFpbiAidmVuY19sdF9zZWwiOw0KDQpEZWFy
IEFsZXhhbmRyZSwNCmNvdWxkIHlvdSBoZWxwIHRvIGdpdmUgc29tZSBtb3JlIHN1Z2dlc3Rpb25z
IGFib3V0IHRoaXM/DQoNClRoYW5rcw0KQmVzdCBSZWdhcmRzDQo+IA0KPiA+ICsgICBkZWNvZGVy
ICBtdXN0IGNvbnRhaW4gInZjb2RlY3BsbCIsICJ1bml2cGxsX2QyIiwgImNsa19jY2k0MDBfc2Vs
IiwNCj4gPiArICAgInZkZWNfc2VsIiwgInZkZWNwbGwiLCAidmVuY3BsbCIsICJ2ZW5jX2x0X3Nl
bCIsICJ2ZGVjX2J1c19jbGtfc3JjIi4NCj4gPiAgLSBpb21tdXMgOiBzaG91bGQgcG9pbnQgdG8g
dGhlIHJlc3BlY3RpdmUgSU9NTVUgYmxvY2sgd2l0aCBtYXN0ZXIgcG9ydCBhcw0KPiA+ICAgIGFy
Z3VtZW50LCBzZWUgRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL2lvbW11L21lZGlh
dGVrLGlvbW11LnR4dA0KPiA+ICAgIGZvciBkZXRhaWxzLg0KPiA+IEBAIC04MCwxNCArODIsMTAg
QEAgdmNvZGVjX2RlYzogdmNvZGVjQDE2MDAwMDAwIHsNCj4gPiAgICAgIGFzc2lnbmVkLWNsb2Nr
LXJhdGVzID0gPDA+LCA8MD4sIDwwPiwgPDE0ODIwMDAwMDA+LCA8ODAwMDAwMDAwPjsNCj4gPiAg
ICB9Ow0KPiA+ICANCj4gPiAtICB2Y29kZWNfZW5jOiB2Y29kZWNAMTgwMDIwMDAgew0KPiA+ICt2
Y29kZWNfZW5jX2F2YzogdmNvZGVjQDE4MDAyMDAwIHsNCj4gPiAgICAgIGNvbXBhdGlibGUgPSAi
bWVkaWF0ZWssbXQ4MTczLXZjb2RlYy1lbmMiOw0KPiA+IC0gICAgcmVnID0gPDAgMHgxODAwMjAw
MCAwIDB4MTAwMD4sICAgIC8qVkVOQ19TWVMqLw0KPiA+IC0gICAgICAgICAgPDAgMHgxOTAwMjAw
MCAwIDB4MTAwMD47ICAgIC8qVkVOQ19MVF9TWVMqLw0KPiA+IC0gICAgaW50ZXJydXB0cyA9IDxH
SUNfU1BJIDE5OCBJUlFfVFlQRV9MRVZFTF9MT1c+LA0KPiA+IC0JCSA8R0lDX1NQSSAyMDIgSVJR
X1RZUEVfTEVWRUxfTE9XPjsNCj4gPiAtICAgIG1lZGlhdGVrLGxhcmIgPSA8JmxhcmIzPiwNCj4g
PiAtCQkgICAgPCZsYXJiNT47DQo+ID4gKyAgICByZWcgPSA8MCAweDE4MDAyMDAwIDAgMHgxMDAw
PjsNCj4gPiArICAgIGludGVycnVwdHMgPSA8R0lDX1NQSSAxOTggSVJRX1RZUEVfTEVWRUxfTE9X
PjsNCj4gPiAgICAgIGlvbW11cyA9IDwmaW9tbXUgTTRVX1BPUlRfVkVOQ19SQ1BVPiwNCj4gPiAg
ICAgICAgICAgICAgIDwmaW9tbXUgTTRVX1BPUlRfVkVOQ19SRUM+LA0KPiA+ICAgICAgICAgICAg
ICAgPCZpb21tdSBNNFVfUE9SVF9WRU5DX0JTRE1BPiwNCj4gPiBAQCAtOTgsOCArOTYsMjAgQEAg
dmNvZGVjX2RlYzogdmNvZGVjQDE2MDAwMDAwIHsNCj4gPiAgICAgICAgICAgICAgIDwmaW9tbXUg
TTRVX1BPUlRfVkVOQ19SRUZfTFVNQT4sDQo+ID4gICAgICAgICAgICAgICA8JmlvbW11IE00VV9Q
T1JUX1ZFTkNfUkVGX0NIUk9NQT4sDQo+ID4gICAgICAgICAgICAgICA8JmlvbW11IE00VV9QT1JU
X1ZFTkNfTkJNX1JETUE+LA0KPiA+IC0gICAgICAgICAgICAgPCZpb21tdSBNNFVfUE9SVF9WRU5D
X05CTV9XRE1BPiwNCj4gPiAtICAgICAgICAgICAgIDwmaW9tbXUgTTRVX1BPUlRfVkVOQ19SQ1BV
X1NFVDI+LA0KPiA+ICsgICAgICAgICAgICAgPCZpb21tdSBNNFVfUE9SVF9WRU5DX05CTV9XRE1B
PjsNCj4gPiArICAgIG1lZGlhdGVrLGxhcmIgPSA8JmxhcmIzPjsNCj4gPiArICAgIG1lZGlhdGVr
LHZwdSA9IDwmdnB1PjsNCj4gPiArICAgIGNsb2NrcyA9IDwmdG9wY2tnZW4gQ0xLX1RPUF9WRU5D
X1NFTD47DQo+ID4gKyAgICBjbG9jay1uYW1lcyA9ICJ2ZW5jX3NlbCI7DQo+ID4gKyAgICBhc3Np
Z25lZC1jbG9ja3MgPSA8JnRvcGNrZ2VuIENMS19UT1BfVkVOQ19TRUw+Ow0KPiA+ICsgICAgYXNz
aWduZWQtY2xvY2stcGFyZW50cyA9IDwmdG9wY2tnZW4gQ0xLX1RPUF9WQ09ERUNQTEw+Ow0KPiA+
ICsgIH07DQo+ID4gKw0KPiA+ICt2Y29kZWNfZW5jX3ZwODogdmNvZGVjQDE5MDAyMDAwIHsNCj4g
PiArICAgIGNvbXBhdGlibGUgPSAibWVkaWF0ZWssbXQ4MTczLXZjb2RlYy1lbmMtdnA4IjsNCj4g
PiArICAgIHJlZyA9ICA8MCAweDE5MDAyMDAwIDAgMHgxMDAwPjsJLyogVkVOQ19MVF9TWVMgKi8N
Cj4gPiArICAgIGludGVycnVwdHMgPSA8R0lDX1NQSSAyMDIgSVJRX1RZUEVfTEVWRUxfTE9XPjsN
Cj4gPiArICAgIGlvbW11cyA9IDwmaW9tbXUgTTRVX1BPUlRfVkVOQ19SQ1BVX1NFVDI+LA0KPiA+
ICAgICAgICAgICAgICAgPCZpb21tdSBNNFVfUE9SVF9WRU5DX1JFQ19GUk1fU0VUMj4sDQo+ID4g
ICAgICAgICAgICAgICA8JmlvbW11IE00VV9QT1JUX1ZFTkNfQlNETUFfU0VUMj4sDQo+ID4gICAg
ICAgICAgICAgICA8JmlvbW11IE00VV9QT1JUX1ZFTkNfU1ZfQ09NQV9TRVQyPiwNCj4gPiBAQCAt
MTA4LDE3ICsxMTgsMTAgQEAgdmNvZGVjX2RlYzogdmNvZGVjQDE2MDAwMDAwIHsNCj4gPiAgICAg
ICAgICAgICAgIDwmaW9tbXUgTTRVX1BPUlRfVkVOQ19DVVJfQ0hST01BX1NFVDI+LA0KPiA+ICAg
ICAgICAgICAgICAgPCZpb21tdSBNNFVfUE9SVF9WRU5DX1JFRl9MVU1BX1NFVDI+LA0KPiA+ICAg
ICAgICAgICAgICAgPCZpb21tdSBNNFVfUE9SVF9WRU5DX1JFQ19DSFJPTUFfU0VUMj47DQo+ID4g
KyAgICBtZWRpYXRlayxsYXJiID0gPCZsYXJiNT47DQo+ID4gICAgICBtZWRpYXRlayx2cHUgPSA8
JnZwdT47DQo+ID4gLSAgICBjbG9ja3MgPSA8JnRvcGNrZ2VuIENMS19UT1BfVkVOQ1BMTF9EMj4s
DQo+ID4gLSAgICAgICAgICAgICA8JnRvcGNrZ2VuIENMS19UT1BfVkVOQ19TRUw+LA0KPiA+IC0g
ICAgICAgICAgICAgPCZ0b3Bja2dlbiBDTEtfVE9QX1VOSVZQTEwxX0QyPiwNCj4gPiAtICAgICAg
ICAgICAgIDwmdG9wY2tnZW4gQ0xLX1RPUF9WRU5DX0xUX1NFTD47DQo+ID4gLSAgICBjbG9jay1u
YW1lcyA9ICJ2ZW5jX3NlbF9zcmMiLA0KPiA+IC0gICAgICAgICAgICAgICAgICAidmVuY19zZWwi
LA0KPiA+IC0gICAgICAgICAgICAgICAgICAidmVuY19sdF9zZWxfc3JjIiwNCj4gPiAtICAgICAg
ICAgICAgICAgICAgInZlbmNfbHRfc2VsIjsNCj4gPiAtICAgIGFzc2lnbmVkLWNsb2NrcyA9IDwm
dG9wY2tnZW4gQ0xLX1RPUF9WRU5DX1NFTD4sDQo+ID4gLSAgICAgICAgICAgICAgICAgICAgICA8
JnRvcGNrZ2VuIENMS19UT1BfVkVOQ19MVF9TRUw+Ow0KPiA+IC0gICAgYXNzaWduZWQtY2xvY2st
cGFyZW50cyA9IDwmdG9wY2tnZW4gQ0xLX1RPUF9WRU5DUExMX0QyPiwNCj4gPiAtICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICA8JnRvcGNrZ2VuIENMS19UT1BfVU5JVlBMTDFfRDI+Ow0KPiA+
ICsgICAgY2xvY2tzID0gPCZ0b3Bja2dlbiBDTEtfVE9QX1ZFTkNfTFRfU0VMPjsNCj4gPiArICAg
IGNsb2NrLW5hbWVzID0gInZlbmNfbHRfc2VsIjsNCj4gPiArICAgIGFzc2lnbmVkLWNsb2NrcyA9
IDwmdG9wY2tnZW4gQ0xLX1RPUF9WRU5DX0xUX1NFTD47DQo+ID4gKyAgICBhc3NpZ25lZC1jbG9j
ay1wYXJlbnRzID0gPCZ0b3Bja2dlbiBDTEtfVE9QX1ZDT0RFQ1BMTF8zNzBQNT47DQo+ID4gICAg
fTsNCj4gPiAtLSANCj4gPiAyLjI1LjENCj4gPiANCg0K

