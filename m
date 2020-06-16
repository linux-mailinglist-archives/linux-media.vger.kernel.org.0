Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B98031FB157
	for <lists+linux-media@lfdr.de>; Tue, 16 Jun 2020 14:58:16 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728920AbgFPM6I (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 16 Jun 2020 08:58:08 -0400
Received: from mailgw01.mediatek.com ([210.61.82.183]:57346 "EHLO
        mailgw01.mediatek.com" rhost-flags-OK-FAIL-OK-FAIL) by vger.kernel.org
        with ESMTP id S1728911AbgFPM6H (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 16 Jun 2020 08:58:07 -0400
X-UUID: 0b13982439a24cc3872f19a2a975f112-20200616
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
        h=Content-Transfer-Encoding:Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From; bh=JC6Ap5lkEUDRzG48YCqQYH/0TW9LXucBJHSVGVhjYFg=;
        b=BUHqpiA2n9IFk0La2QU4ANUnY+ligdfa+lg806+ZPYrbhwpGPy5la7PkRhcmGEWnhGrUCwlse/LhDmPrRYxAjcluagPSR142r/BKqVTkfz2+ST2+08BDnRRZX9YdT5nXDOeobs1BX0NIeK8Tki8X2vBLLSSj+8+ozEi/gazdc+E=;
X-UUID: 0b13982439a24cc3872f19a2a975f112-20200616
Received: from mtkcas07.mediatek.inc [(172.21.101.84)] by mailgw01.mediatek.com
        (envelope-from <dongchun.zhu@mediatek.com>)
        (Cellopoint E-mail Firewall v4.1.10 Build 0809 with TLS)
        with ESMTP id 2010726951; Tue, 16 Jun 2020 20:58:04 +0800
Received: from mtkcas08.mediatek.inc (172.21.101.126) by
 mtkmbs05n1.mediatek.inc (172.21.101.15) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Tue, 16 Jun 2020 20:58:02 +0800
Received: from localhost.localdomain (10.17.3.153) by mtkcas08.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Tue, 16 Jun 2020 20:57:59 +0800
From:   Dongchun Zhu <dongchun.zhu@mediatek.com>
To:     <linus.walleij@linaro.org>, <bgolaszewski@baylibre.com>,
        <mchehab@kernel.org>, <andriy.shevchenko@linux.intel.com>,
        <robh+dt@kernel.org>, <mark.rutland@arm.com>,
        <sakari.ailus@linux.intel.com>, <drinkcat@chromium.org>,
        <tfiga@chromium.org>, <matthias.bgg@gmail.com>,
        <bingbu.cao@intel.com>
CC:     <srv_heupstream@mediatek.com>,
        <linux-mediatek@lists.infradead.org>,
        <linux-arm-kernel@lists.infradead.org>, <sj.huang@mediatek.com>,
        <linux-media@vger.kernel.org>, <devicetree@vger.kernel.org>,
        <louis.kuo@mediatek.com>, <shengnan.wang@mediatek.com>,
        <dongchun.zhu@mediatek.com>
Subject: [PATCH V8 1/2] media: dt-bindings: media: i2c: Document DW9768 bindings
Date:   Tue, 16 Jun 2020 20:55:30 +0800
Message-ID: <20200616125531.31671-2-dongchun.zhu@mediatek.com>
X-Mailer: git-send-email 2.9.2
In-Reply-To: <20200616125531.31671-1-dongchun.zhu@mediatek.com>
References: <20200616125531.31671-1-dongchun.zhu@mediatek.com>
MIME-Version: 1.0
Content-Type: text/plain
X-MTK:  N
Content-Transfer-Encoding: base64
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

QWRkIERldmljZVRyZWUgQmluZGluZyBEb2N1bWVudGF0aW9uIGZvciBEb25nd29vbiBBbmF0ZWNo
IERXOTc2OA0Kdm9pY2UgY29pbCBhY3R1YXRvci4NCg0KUmV2aWV3ZWQtYnk6IFJvYiBIZXJyaW5n
IDxyb2JoQGtlcm5lbC5vcmc+DQpTaWduZWQtb2ZmLWJ5OiBEb25nY2h1biBaaHUgPGRvbmdjaHVu
LnpodUBtZWRpYXRlay5jb20+DQotLS0NCiAuLi4vYmluZGluZ3MvbWVkaWEvaTJjL2Rvbmd3b29u
LGR3OTc2OC55YW1sICAgICAgICB8IDEwMCArKysrKysrKysrKysrKysrKysrKysNCiBNQUlOVEFJ
TkVSUyAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICB8ICAgNyArKw0KIDIg
ZmlsZXMgY2hhbmdlZCwgMTA3IGluc2VydGlvbnMoKykNCiBjcmVhdGUgbW9kZSAxMDA2NDQgRG9j
dW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL21lZGlhL2kyYy9kb25nd29vbixkdzk3Njgu
eWFtbA0KDQpkaWZmIC0tZ2l0IGEvRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL21l
ZGlhL2kyYy9kb25nd29vbixkdzk3NjgueWFtbCBiL0RvY3VtZW50YXRpb24vZGV2aWNldHJlZS9i
aW5kaW5ncy9tZWRpYS9pMmMvZG9uZ3dvb24sZHc5NzY4LnlhbWwNCm5ldyBmaWxlIG1vZGUgMTAw
NjQ0DQppbmRleCAwMDAwMDAwLi5jYjk2ZTk1DQotLS0gL2Rldi9udWxsDQorKysgYi9Eb2N1bWVu
dGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3MvbWVkaWEvaTJjL2Rvbmd3b29uLGR3OTc2OC55YW1s
DQpAQCAtMCwwICsxLDEwMCBAQA0KKyMgU1BEWC1MaWNlbnNlLUlkZW50aWZpZXI6IChHUEwtMi4w
IE9SIEJTRC0yLUNsYXVzZSkNCisjIENvcHlyaWdodCAoYykgMjAyMCBNZWRpYVRlayBJbmMuDQor
JVlBTUwgMS4yDQorLS0tDQorJGlkOiBodHRwOi8vZGV2aWNldHJlZS5vcmcvc2NoZW1hcy9tZWRp
YS9pMmMvZG9uZ3dvb24sZHc5NzY4LnlhbWwjDQorJHNjaGVtYTogaHR0cDovL2RldmljZXRyZWUu
b3JnL21ldGEtc2NoZW1hcy9jb3JlLnlhbWwjDQorDQordGl0bGU6IERvbmd3b29uIEFuYXRlY2gg
RFc5NzY4IFZvaWNlIENvaWwgTW90b3IgKFZDTSkgTGVucyBEZXZpY2UgVHJlZSBCaW5kaW5ncw0K
Kw0KK21haW50YWluZXJzOg0KKyAgLSBEb25nY2h1biBaaHUgPGRvbmdjaHVuLnpodUBtZWRpYXRl
ay5jb20+DQorDQorZGVzY3JpcHRpb246IHwtDQorICBUaGUgRG9uZ3dvb24gRFc5NzY4IGlzIGEg
c2luZ2xlIDEwLWJpdCBkaWdpdGFsLXRvLWFuYWxvZyAoREFDKSBjb252ZXJ0ZXINCisgIHdpdGgg
MTAwIG1BIG91dHB1dCBjdXJyZW50IHNpbmsgY2FwYWJpbGl0eS4gVkNNIGN1cnJlbnQgaXMgY29u
dHJvbGxlZCB3aXRoDQorICBhIGxpbmVhciBtb2RlIGRyaXZlci4gVGhlIERBQyBpcyBjb250cm9s
bGVkIHZpYSBhIDItd2lyZSAoSTJDLWNvbXBhdGlibGUpDQorICBzZXJpYWwgaW50ZXJmYWNlIHRo
YXQgb3BlcmF0ZXMgYXQgY2xvY2sgcmF0ZXMgdXAgdG8gMU1Iei4gVGhpcyBjaGlwDQorICBpbnRl
Z3JhdGVzIEFkdmFuY2VkIEFjdHVhdG9yIENvbnRyb2wgKEFBQykgdGVjaG5vbG9neSBhbmQgaXMg
aW50ZW5kZWQgZm9yDQorICBkcml2aW5nIHZvaWNlIGNvaWwgbGVuc2VzIGluIGNhbWVyYSBtb2R1
bGVzLg0KKw0KK3Byb3BlcnRpZXM6DQorICBjb21wYXRpYmxlOg0KKyAgICBlbnVtOg0KKyAgICAg
IC0gZG9uZ3dvb24sZHc5NzY4ICMgZm9yIERXOTc2OCBWQ00NCisgICAgICAtIGdpYW50ZWMsZ3Q5
NzY5ICAjIGZvciBHVDk3NjkgVkNNDQorDQorICByZWc6DQorICAgIG1heEl0ZW1zOiAxDQorDQor
ICB2aW4tc3VwcGx5Og0KKyAgICBkZXNjcmlwdGlvbjoNCisgICAgICBEZWZpbml0aW9uIG9mIHRo
ZSByZWd1bGF0b3IgdXNlZCBhcyBEaWdpdGFsIEkvTyB2b2x0YWdlIHN1cHBseS4NCisNCisgIHZk
ZC1zdXBwbHk6DQorICAgIGRlc2NyaXB0aW9uOg0KKyAgICAgIERlZmluaXRpb24gb2YgdGhlIHJl
Z3VsYXRvciB1c2VkIGFzIERpZ2l0YWwgY29yZSB2b2x0YWdlIHN1cHBseS4NCisNCisgIGRvbmd3
b29uLGFhYy1tb2RlOg0KKyAgICBkZXNjcmlwdGlvbjoNCisgICAgICBJbmRpY2F0aW9uIG9mIEFB
QyBtb2RlIHNlbGVjdC4NCisgICAgYWxsT2Y6DQorICAgICAgLSAkcmVmOiAiL3NjaGVtYXMvdHlw
ZXMueWFtbCMvZGVmaW5pdGlvbnMvdWludDMyIg0KKyAgICAgIC0gZW51bToNCisgICAgICAgICAg
LSAxICAgICMgIEFBQzIgbW9kZShvcGVyYXRpb24gdGltZSMgMC40OCB4IFR2aWIpDQorICAgICAg
ICAgIC0gMiAgICAjICBBQUMzIG1vZGUob3BlcmF0aW9uIHRpbWUjIDAuNzAgeCBUdmliKQ0KKyAg
ICAgICAgICAtIDMgICAgIyAgQUFDNCBtb2RlKG9wZXJhdGlvbiB0aW1lIyAwLjc1IHggVHZpYikN
CisgICAgICAgICAgLSA1ICAgICMgIEFBQzggbW9kZShvcGVyYXRpb24gdGltZSMgMS4xMyB4IFR2
aWIpDQorICAgICAgICBkZWZhdWx0OiAyDQorDQorICBkb25nd29vbixhYWMtdGltaW5nOg0KKyAg
ICBkZXNjcmlwdGlvbjoNCisgICAgICBOdW1iZXIgb2YgQUFDIFRpbWluZyBjb3VudCB0aGF0IGNv
bnRyb2xsZWQgYnkgb25lIDYtYml0IHBlcmlvZCBvZg0KKyAgICAgIHZpYnJhdGlvbiByZWdpc3Rl
ciBBQUNUWzU6MF0sIHRoZSB1bml0IG9mIHdoaWNoIGlzIDEwMCB1cy4NCisgICAgYWxsT2Y6DQor
ICAgICAgLSAkcmVmOiAiL3NjaGVtYXMvdHlwZXMueWFtbCMvZGVmaW5pdGlvbnMvdWludDMyIg0K
KyAgICAgIC0gZGVmYXVsdDogMHgyMA0KKyAgICAgICAgbWluaW11bTogMHgwMA0KKyAgICAgICAg
bWF4aW11bTogMHgzZg0KKw0KKyAgZG9uZ3dvb24sY2xvY2stcHJlc2M6DQorICAgIGRlc2NyaXB0
aW9uOg0KKyAgICAgIEluZGljYXRpb24gb2YgVkNNIGludGVybmFsIGNsb2NrIGRpdmlkaW5nIHJh
dGUgc2VsZWN0LCBhcyBvbmUgbXVsdGlwbGUNCisgICAgICBmYWN0b3IgdG8gY2FsY3VsYXRlIFZD
TSByaW5nIHBlcmlvZGljIHRpbWUgVHZpYi4NCisgICAgYWxsT2Y6DQorICAgICAgLSAkcmVmOiAi
L3NjaGVtYXMvdHlwZXMueWFtbCMvZGVmaW5pdGlvbnMvdWludDMyIg0KKyAgICAgIC0gZW51bToN
CisgICAgICAgICAgLSAwICAgICMgIERpdmlkaW5nIFJhdGUgLSAgMg0KKyAgICAgICAgICAtIDEg
ICAgIyAgRGl2aWRpbmcgUmF0ZSAtICAxDQorICAgICAgICAgIC0gMiAgICAjICBEaXZpZGluZyBS
YXRlIC0gIDEvMg0KKyAgICAgICAgICAtIDMgICAgIyAgRGl2aWRpbmcgUmF0ZSAtICAxLzQNCisg
ICAgICAgICAgLSA0ICAgICMgIERpdmlkaW5nIFJhdGUgLSAgOA0KKyAgICAgICAgICAtIDUgICAg
IyAgRGl2aWRpbmcgUmF0ZSAtICA0DQorICAgICAgICBkZWZhdWx0OiAxDQorDQorcmVxdWlyZWQ6
DQorICAtIGNvbXBhdGlibGUNCisgIC0gcmVnDQorICAtIHZpbi1zdXBwbHkNCisgIC0gdmRkLXN1
cHBseQ0KKw0KK2FkZGl0aW9uYWxQcm9wZXJ0aWVzOiBmYWxzZQ0KKw0KK2V4YW1wbGVzOg0KKyAg
LSB8DQorDQorICAgIGkyYyB7DQorICAgICAgICAjYWRkcmVzcy1jZWxscyA9IDwxPjsNCisgICAg
ICAgICNzaXplLWNlbGxzID0gPDA+Ow0KKw0KKyAgICAgICAgZHc5NzY4OiBjYW1lcmEtbGVuc0Bj
IHsNCisgICAgICAgICAgICBjb21wYXRpYmxlID0gImRvbmd3b29uLGR3OTc2OCI7DQorICAgICAg
ICAgICAgcmVnID0gPDB4MGM+Ow0KKw0KKyAgICAgICAgICAgIHZpbi1zdXBwbHkgPSA8Jm10NjM1
OF92Y2FtaW9fcmVnPjsNCisgICAgICAgICAgICB2ZGQtc3VwcGx5ID0gPCZtdDYzNThfdmNhbWEy
X3JlZz47DQorICAgICAgICAgICAgZG9uZ3dvb24sYWFjLXRpbWluZyA9IDwweDM5PjsNCisgICAg
ICAgIH07DQorICAgIH07DQorDQorLi4uDQpkaWZmIC0tZ2l0IGEvTUFJTlRBSU5FUlMgYi9NQUlO
VEFJTkVSUw0KaW5kZXggNjhmMjFkNC4uNjI2OTBjNCAxMDA2NDQNCi0tLSBhL01BSU5UQUlORVJT
DQorKysgYi9NQUlOVEFJTkVSUw0KQEAgLTUyMTUsNiArNTIxNSwxMyBAQCBUOglnaXQgZ2l0Oi8v
bGludXh0di5vcmcvbWVkaWFfdHJlZS5naXQNCiBGOglEb2N1bWVudGF0aW9uL2RldmljZXRyZWUv
YmluZGluZ3MvbWVkaWEvaTJjL2Rvbmd3b29uLGR3OTcxNC50eHQNCiBGOglkcml2ZXJzL21lZGlh
L2kyYy9kdzk3MTQuYw0KIA0KK0RPTkdXT09OIERXOTc2OCBMRU5TIFZPSUNFIENPSUwgRFJJVkVS
DQorTToJRG9uZ2NodW4gWmh1IDxkb25nY2h1bi56aHVAbWVkaWF0ZWsuY29tPg0KK0w6CWxpbnV4
LW1lZGlhQHZnZXIua2VybmVsLm9yZw0KK1M6CU1haW50YWluZWQNCitUOglnaXQgZ2l0Oi8vbGlu
dXh0di5vcmcvbWVkaWFfdHJlZS5naXQNCitGOglEb2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmlu
ZGluZ3MvbWVkaWEvaTJjL2Rvbmd3b29uLGR3OTc2OC55YW1sDQorDQogRE9OR1dPT04gRFc5ODA3
IExFTlMgVk9JQ0UgQ09JTCBEUklWRVINCiBNOglTYWthcmkgQWlsdXMgPHNha2FyaS5haWx1c0Bs
aW51eC5pbnRlbC5jb20+DQogTDoJbGludXgtbWVkaWFAdmdlci5rZXJuZWwub3JnDQotLSANCjIu
OS4yDQo=

