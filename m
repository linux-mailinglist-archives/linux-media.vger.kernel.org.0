Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 86B971EF5DE
	for <lists+linux-media@lfdr.de>; Fri,  5 Jun 2020 12:56:33 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726921AbgFEK42 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 5 Jun 2020 06:56:28 -0400
Received: from mailgw02.mediatek.com ([210.61.82.184]:65340 "EHLO
        mailgw02.mediatek.com" rhost-flags-OK-FAIL-OK-FAIL) by vger.kernel.org
        with ESMTP id S1726507AbgFEK42 (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Fri, 5 Jun 2020 06:56:28 -0400
X-UUID: 4acc3543fb6249afb17b7c1835ec550c-20200605
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
        h=Content-Transfer-Encoding:Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From; bh=GB3BmrYm0aa9Hyediiem4Vhbejg6A4uzu2p73CzOME4=;
        b=LnU98IOXpCPy5KbqPywB+tVxk7tjk3+K7tNPLv8LOT184i/MRZPdhmOZDF0rKdEUkqTUO5EmqzFVgwZ+21fevClv4pfb9bJ+xO4inaPeVCcuOWy+XsSJqwEGve/87FTLkpsomOayd7f5hfEoeVaxOshPQW8xSiacOA4yMR1DyqE=;
X-UUID: 4acc3543fb6249afb17b7c1835ec550c-20200605
Received: from mtkcas07.mediatek.inc [(172.21.101.84)] by mailgw02.mediatek.com
        (envelope-from <dongchun.zhu@mediatek.com>)
        (Cellopoint E-mail Firewall v4.1.10 Build 0809 with TLS)
        with ESMTP id 817390367; Fri, 05 Jun 2020 18:56:23 +0800
Received: from MTKCAS06.mediatek.inc (172.21.101.30) by
 mtkmbs02n2.mediatek.inc (172.21.101.101) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Fri, 5 Jun 2020 18:56:18 +0800
Received: from localhost.localdomain (10.17.3.153) by MTKCAS06.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Fri, 5 Jun 2020 18:56:17 +0800
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
Subject: [V7, 1/2] media: dt-bindings: media: i2c: Document DW9768 bindings
Date:   Fri, 5 Jun 2020 18:54:11 +0800
Message-ID: <20200605105412.18813-2-dongchun.zhu@mediatek.com>
X-Mailer: git-send-email 2.9.2
In-Reply-To: <20200605105412.18813-1-dongchun.zhu@mediatek.com>
References: <20200605105412.18813-1-dongchun.zhu@mediatek.com>
MIME-Version: 1.0
Content-Type: text/plain
X-TM-SNTS-SMTP: 3B30C2CEE124AB025647D88D19C7E6A5A4F60D92C90E79CDF2498E1D37207BFE2000:8
X-MTK:  N
Content-Transfer-Encoding: base64
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

QWRkIERldmljZVRyZWUgYmluZGluZyBkb2N1bWVudGF0aW9uIGZvciBEb25nd29vbiBBbmF0ZWNo
IERXOTc2OCB2b2ljZQ0KY29pbCBhY3R1YXRvci4NCg0KU2lnbmVkLW9mZi1ieTogRG9uZ2NodW4g
Wmh1IDxkb25nY2h1bi56aHVAbWVkaWF0ZWsuY29tPg0KLS0tDQogLi4uL2JpbmRpbmdzL21lZGlh
L2kyYy9kb25nd29vbixkdzk3NjgueWFtbCAgICAgICAgfCAxMDAgKysrKysrKysrKysrKysrKysr
KysrDQogTUFJTlRBSU5FUlMgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
fCAgIDcgKysNCiAyIGZpbGVzIGNoYW5nZWQsIDEwNyBpbnNlcnRpb25zKCspDQogY3JlYXRlIG1v
ZGUgMTAwNjQ0IERvY3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy9tZWRpYS9pMmMvZG9u
Z3dvb24sZHc5NzY4LnlhbWwNCg0KZGlmZiAtLWdpdCBhL0RvY3VtZW50YXRpb24vZGV2aWNldHJl
ZS9iaW5kaW5ncy9tZWRpYS9pMmMvZG9uZ3dvb24sZHc5NzY4LnlhbWwgYi9Eb2N1bWVudGF0aW9u
L2RldmljZXRyZWUvYmluZGluZ3MvbWVkaWEvaTJjL2Rvbmd3b29uLGR3OTc2OC55YW1sDQpuZXcg
ZmlsZSBtb2RlIDEwMDY0NA0KaW5kZXggMDAwMDAwMC4uY2I5NmU5NQ0KLS0tIC9kZXYvbnVsbA0K
KysrIGIvRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL21lZGlhL2kyYy9kb25nd29v
bixkdzk3NjgueWFtbA0KQEAgLTAsMCArMSwxMDAgQEANCisjIFNQRFgtTGljZW5zZS1JZGVudGlm
aWVyOiAoR1BMLTIuMCBPUiBCU0QtMi1DbGF1c2UpDQorIyBDb3B5cmlnaHQgKGMpIDIwMjAgTWVk
aWFUZWsgSW5jLg0KKyVZQU1MIDEuMg0KKy0tLQ0KKyRpZDogaHR0cDovL2RldmljZXRyZWUub3Jn
L3NjaGVtYXMvbWVkaWEvaTJjL2Rvbmd3b29uLGR3OTc2OC55YW1sIw0KKyRzY2hlbWE6IGh0dHA6
Ly9kZXZpY2V0cmVlLm9yZy9tZXRhLXNjaGVtYXMvY29yZS55YW1sIw0KKw0KK3RpdGxlOiBEb25n
d29vbiBBbmF0ZWNoIERXOTc2OCBWb2ljZSBDb2lsIE1vdG9yIChWQ00pIExlbnMgRGV2aWNlIFRy
ZWUgQmluZGluZ3MNCisNCittYWludGFpbmVyczoNCisgIC0gRG9uZ2NodW4gWmh1IDxkb25nY2h1
bi56aHVAbWVkaWF0ZWsuY29tPg0KKw0KK2Rlc2NyaXB0aW9uOiB8LQ0KKyAgVGhlIERvbmd3b29u
IERXOTc2OCBpcyBhIHNpbmdsZSAxMC1iaXQgZGlnaXRhbC10by1hbmFsb2cgKERBQykgY29udmVy
dGVyDQorICB3aXRoIDEwMCBtQSBvdXRwdXQgY3VycmVudCBzaW5rIGNhcGFiaWxpdHkuIFZDTSBj
dXJyZW50IGlzIGNvbnRyb2xsZWQgd2l0aA0KKyAgYSBsaW5lYXIgbW9kZSBkcml2ZXIuIFRoZSBE
QUMgaXMgY29udHJvbGxlZCB2aWEgYSAyLXdpcmUgKEkyQy1jb21wYXRpYmxlKQ0KKyAgc2VyaWFs
IGludGVyZmFjZSB0aGF0IG9wZXJhdGVzIGF0IGNsb2NrIHJhdGVzIHVwIHRvIDFNSHouIFRoaXMg
Y2hpcA0KKyAgaW50ZWdyYXRlcyBBZHZhbmNlZCBBY3R1YXRvciBDb250cm9sIChBQUMpIHRlY2hu
b2xvZ3kgYW5kIGlzIGludGVuZGVkIGZvcg0KKyAgZHJpdmluZyB2b2ljZSBjb2lsIGxlbnNlcyBp
biBjYW1lcmEgbW9kdWxlcy4NCisNCitwcm9wZXJ0aWVzOg0KKyAgY29tcGF0aWJsZToNCisgICAg
ZW51bToNCisgICAgICAtIGRvbmd3b29uLGR3OTc2OCAjIGZvciBEVzk3NjggVkNNDQorICAgICAg
LSBnaWFudGVjLGd0OTc2OSAgIyBmb3IgR1Q5NzY5IFZDTQ0KKw0KKyAgcmVnOg0KKyAgICBtYXhJ
dGVtczogMQ0KKw0KKyAgdmluLXN1cHBseToNCisgICAgZGVzY3JpcHRpb246DQorICAgICAgRGVm
aW5pdGlvbiBvZiB0aGUgcmVndWxhdG9yIHVzZWQgYXMgRGlnaXRhbCBJL08gdm9sdGFnZSBzdXBw
bHkuDQorDQorICB2ZGQtc3VwcGx5Og0KKyAgICBkZXNjcmlwdGlvbjoNCisgICAgICBEZWZpbml0
aW9uIG9mIHRoZSByZWd1bGF0b3IgdXNlZCBhcyBEaWdpdGFsIGNvcmUgdm9sdGFnZSBzdXBwbHku
DQorDQorICBkb25nd29vbixhYWMtbW9kZToNCisgICAgZGVzY3JpcHRpb246DQorICAgICAgSW5k
aWNhdGlvbiBvZiBBQUMgbW9kZSBzZWxlY3QuDQorICAgIGFsbE9mOg0KKyAgICAgIC0gJHJlZjog
Ii9zY2hlbWFzL3R5cGVzLnlhbWwjL2RlZmluaXRpb25zL3VpbnQzMiINCisgICAgICAtIGVudW06
DQorICAgICAgICAgIC0gMSAgICAjICBBQUMyIG1vZGUob3BlcmF0aW9uIHRpbWUjIDAuNDggeCBU
dmliKQ0KKyAgICAgICAgICAtIDIgICAgIyAgQUFDMyBtb2RlKG9wZXJhdGlvbiB0aW1lIyAwLjcw
IHggVHZpYikNCisgICAgICAgICAgLSAzICAgICMgIEFBQzQgbW9kZShvcGVyYXRpb24gdGltZSMg
MC43NSB4IFR2aWIpDQorICAgICAgICAgIC0gNSAgICAjICBBQUM4IG1vZGUob3BlcmF0aW9uIHRp
bWUjIDEuMTMgeCBUdmliKQ0KKyAgICAgICAgZGVmYXVsdDogMg0KKw0KKyAgZG9uZ3dvb24sYWFj
LXRpbWluZzoNCisgICAgZGVzY3JpcHRpb246DQorICAgICAgTnVtYmVyIG9mIEFBQyBUaW1pbmcg
Y291bnQgdGhhdCBjb250cm9sbGVkIGJ5IG9uZSA2LWJpdCBwZXJpb2Qgb2YNCisgICAgICB2aWJy
YXRpb24gcmVnaXN0ZXIgQUFDVFs1OjBdLCB0aGUgdW5pdCBvZiB3aGljaCBpcyAxMDAgdXMuDQor
ICAgIGFsbE9mOg0KKyAgICAgIC0gJHJlZjogIi9zY2hlbWFzL3R5cGVzLnlhbWwjL2RlZmluaXRp
b25zL3VpbnQzMiINCisgICAgICAtIGRlZmF1bHQ6IDB4MjANCisgICAgICAgIG1pbmltdW06IDB4
MDANCisgICAgICAgIG1heGltdW06IDB4M2YNCisNCisgIGRvbmd3b29uLGNsb2NrLXByZXNjOg0K
KyAgICBkZXNjcmlwdGlvbjoNCisgICAgICBJbmRpY2F0aW9uIG9mIFZDTSBpbnRlcm5hbCBjbG9j
ayBkaXZpZGluZyByYXRlIHNlbGVjdCwgYXMgb25lIG11bHRpcGxlDQorICAgICAgZmFjdG9yIHRv
IGNhbGN1bGF0ZSBWQ00gcmluZyBwZXJpb2RpYyB0aW1lIFR2aWIuDQorICAgIGFsbE9mOg0KKyAg
ICAgIC0gJHJlZjogIi9zY2hlbWFzL3R5cGVzLnlhbWwjL2RlZmluaXRpb25zL3VpbnQzMiINCisg
ICAgICAtIGVudW06DQorICAgICAgICAgIC0gMCAgICAjICBEaXZpZGluZyBSYXRlIC0gIDINCisg
ICAgICAgICAgLSAxICAgICMgIERpdmlkaW5nIFJhdGUgLSAgMQ0KKyAgICAgICAgICAtIDIgICAg
IyAgRGl2aWRpbmcgUmF0ZSAtICAxLzINCisgICAgICAgICAgLSAzICAgICMgIERpdmlkaW5nIFJh
dGUgLSAgMS80DQorICAgICAgICAgIC0gNCAgICAjICBEaXZpZGluZyBSYXRlIC0gIDgNCisgICAg
ICAgICAgLSA1ICAgICMgIERpdmlkaW5nIFJhdGUgLSAgNA0KKyAgICAgICAgZGVmYXVsdDogMQ0K
Kw0KK3JlcXVpcmVkOg0KKyAgLSBjb21wYXRpYmxlDQorICAtIHJlZw0KKyAgLSB2aW4tc3VwcGx5
DQorICAtIHZkZC1zdXBwbHkNCisNCithZGRpdGlvbmFsUHJvcGVydGllczogZmFsc2UNCisNCitl
eGFtcGxlczoNCisgIC0gfA0KKw0KKyAgICBpMmMgew0KKyAgICAgICAgI2FkZHJlc3MtY2VsbHMg
PSA8MT47DQorICAgICAgICAjc2l6ZS1jZWxscyA9IDwwPjsNCisNCisgICAgICAgIGR3OTc2ODog
Y2FtZXJhLWxlbnNAYyB7DQorICAgICAgICAgICAgY29tcGF0aWJsZSA9ICJkb25nd29vbixkdzk3
NjgiOw0KKyAgICAgICAgICAgIHJlZyA9IDwweDBjPjsNCisNCisgICAgICAgICAgICB2aW4tc3Vw
cGx5ID0gPCZtdDYzNThfdmNhbWlvX3JlZz47DQorICAgICAgICAgICAgdmRkLXN1cHBseSA9IDwm
bXQ2MzU4X3ZjYW1hMl9yZWc+Ow0KKyAgICAgICAgICAgIGRvbmd3b29uLGFhYy10aW1pbmcgPSA8
MHgzOT47DQorICAgICAgICB9Ow0KKyAgICB9Ow0KKw0KKy4uLg0KZGlmZiAtLWdpdCBhL01BSU5U
QUlORVJTIGIvTUFJTlRBSU5FUlMNCmluZGV4IGU2NGU1ZGIuLjhkNzJjNDEgMTAwNjQ0DQotLS0g
YS9NQUlOVEFJTkVSUw0KKysrIGIvTUFJTlRBSU5FUlMNCkBAIC01MTUxLDYgKzUxNTEsMTMgQEAg
VDoJZ2l0IGdpdDovL2xpbnV4dHYub3JnL21lZGlhX3RyZWUuZ2l0DQogRjoJRG9jdW1lbnRhdGlv
bi9kZXZpY2V0cmVlL2JpbmRpbmdzL21lZGlhL2kyYy9kb25nd29vbixkdzk3MTQudHh0DQogRjoJ
ZHJpdmVycy9tZWRpYS9pMmMvZHc5NzE0LmMNCiANCitET05HV09PTiBEVzk3NjggTEVOUyBWT0lD
RSBDT0lMIERSSVZFUg0KK006CURvbmdjaHVuIFpodSA8ZG9uZ2NodW4uemh1QG1lZGlhdGVrLmNv
bT4NCitMOglsaW51eC1tZWRpYUB2Z2VyLmtlcm5lbC5vcmcNCitTOglNYWludGFpbmVkDQorVDoJ
Z2l0IGdpdDovL2xpbnV4dHYub3JnL21lZGlhX3RyZWUuZ2l0DQorRjoJRG9jdW1lbnRhdGlvbi9k
ZXZpY2V0cmVlL2JpbmRpbmdzL21lZGlhL2kyYy9kb25nd29vbixkdzk3NjgueWFtbA0KKw0KIERP
TkdXT09OIERXOTgwNyBMRU5TIFZPSUNFIENPSUwgRFJJVkVSDQogTToJU2FrYXJpIEFpbHVzIDxz
YWthcmkuYWlsdXNAbGludXguaW50ZWwuY29tPg0KIEw6CWxpbnV4LW1lZGlhQHZnZXIua2VybmVs
Lm9yZw0KLS0gDQoyLjkuMg0K

