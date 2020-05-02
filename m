Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id DD4031C26DA
	for <lists+linux-media@lfdr.de>; Sat,  2 May 2020 18:18:34 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728363AbgEBQSd (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sat, 2 May 2020 12:18:33 -0400
Received: from mailgw01.mediatek.com ([210.61.82.183]:34943 "EHLO
        mailgw01.mediatek.com" rhost-flags-OK-FAIL-OK-FAIL) by vger.kernel.org
        with ESMTP id S1728235AbgEBQSd (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Sat, 2 May 2020 12:18:33 -0400
X-UUID: d4da2c91a54b4fbfac170d4fb213753e-20200503
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
        h=Content-Transfer-Encoding:Content-Type:MIME-Version:Message-ID:Date:Subject:CC:To:From; bh=EAAh30Bef+oW9eX3BIR+Eagl/ceAkjF9T1b8MCX4U/s=;
        b=gteqzQ8YkMYcJB1FRKXZfdwyUoGdEgzj11pVC45ifZLdzJyvW6/t5zeAT9Joyv4ezFWVa80Y22BlYEA6buj0tPQ6WO45gOkYeg/v+5uzFq8bOCD+AzucxHjWUTZkqqTxRDuBeCHLO3Hf4Zei7fJfD5gx6yHvCekZ7Qc9r6l9y2o=;
X-UUID: d4da2c91a54b4fbfac170d4fb213753e-20200503
Received: from mtkcas11.mediatek.inc [(172.21.101.40)] by mailgw01.mediatek.com
        (envelope-from <dongchun.zhu@mediatek.com>)
        (Cellopoint E-mail Firewall v4.1.10 Build 0809 with TLS)
        with ESMTP id 798395048; Sun, 03 May 2020 00:18:29 +0800
Received: from mtkcas08.mediatek.inc (172.21.101.126) by
 mtkmbs05n1.mediatek.inc (172.21.101.15) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Sun, 3 May 2020 00:18:23 +0800
Received: from localhost.localdomain (10.17.3.153) by mtkcas08.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Sun, 3 May 2020 00:18:24 +0800
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
Subject: [V5, 0/2] media: i2c: Add support for DW9768 VCM driver
Date:   Sun, 3 May 2020 00:17:25 +0800
Message-ID: <20200502161727.30463-1-dongchun.zhu@mediatek.com>
X-Mailer: git-send-email 2.9.2
MIME-Version: 1.0
Content-Type: text/plain
X-MTK:  N
Content-Transfer-Encoding: base64
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

SGVsbG8sDQoNClRoaXMgc2VyaWVzIGFkZHMgRFQgYmluZGluZ3MgaW4gWUFNTCBhbmQgVjRMMiBz
dWItZGV2aWNlIGRyaXZlciBmb3IgRFc5NzY4DQpsZW5zIHZvaWNlIGNvaWwgbW90b3IsIHdoaWNo
IGlzIGEgMTAtYml0IERBQyB3aXRoIDEwMG1BIG91dHB1dCBjdXJyZW50DQpzaW5rIGNhcGFiaWxp
dHkgZnJvbSBEb25nd29vbi4NCg0KVGhlIGRyaXZlciBpcyBkZXNpZ25lZCBmb3IgbGluZWFyIGNv
bnRyb2wgb2Ygdm9pY2UgY29pbCBtb3RvciwNCmFuZCBjb250cm9sbGVkIHZpYSBJSUMgc2VyaWFs
IGludGVyZmFjZSB0byBzZXQgdGhlIGRlc2lyZWQgZm9jdXMuDQpJdCBjb250cm9scyB0aGUgcG9z
aXRpb24gd2l0aCAxMC1iaXQgREFDIGRhdGEgRFs5OjBdIGFuZCBzZXBlcmF0ZXMNCnR3byA4LWJp
dCByZWdpc3RlcnMgdG8gY29udHJvbCB0aGUgVkNNIHBvc2l0aW9uIGFzIGJlbG93cy4NCkRBQ19N
U0I6IERbOTo4XShBRERSOiAweDAzKToNCiAgICAgKy0tLSstLS0rLS0tKy0tLSstLS0rLS0tKy0t
LSstLS0rDQogICAgIHwtLS18LS0tfC0tLXwtLS18LS0tfC0tLXxEMDl8RDA4fA0KICAgICArLS0t
Ky0tLSstLS0rLS0tKy0tLSstLS0rLS0tKy0tLSsNCkRBQ19MU0I6IERbNzowXShBRERSOiAweDA0
KToNCiAgICAgKy0tLSstLS0rLS0tKy0tLSstLS0rLS0tKy0tLSstLS0rDQogICAgIHxEMDd8RDA2
fEQwNXxEMDR8RDAzfEQwMnxEMDF8RDAwfA0KICAgICArLS0tKy0tLSstLS0rLS0tKy0tLSstLS0r
LS0tKy0tLSsNCg0KVGhpcyBkcml2ZXIgc3VwcG9ydHM6DQogLSBzZXQgRFc5NzY4IHRvIHN0YW5k
YnkgbW9kZSBvbmNlIHN1c3BlbmQgYW5kIHR1cm4gaXQgYmFjayB0byBhY3RpdmUgaWYgcmVzdW1l
DQogLSBzZXQgdGhlIGRlc2lyZWQgZm9jdXMgdmlhIFY0TDJfQ0lEX0ZPQ1VTX0FCU09MVVRFIGN0
cmwNCg0KUHJldmlvdXMgdmVyc2lvbnMgb2YgdGhpcyBwYXRjaC1zZXQgY2FuIGJlIGZvdW5kIGhl
cmU6DQogdjQ6IGh0dHBzOi8vbG9yZS5rZXJuZWwub3JnL2xpbnV4LW1lZGlhLzIwMjAwMzMwMTIz
NjM0LjM2My0xLWRvbmdjaHVuLnpodUBtZWRpYXRlay5jb20vDQogdjM6IGh0dHBzOi8vbG9yZS5r
ZXJuZWwub3JnL2xpbnV4LW1lZGlhLzIwMjAwMjI4MTU1OTU4LjIwNjU3LTEtZG9uZ2NodW4uemh1
QG1lZGlhdGVrLmNvbS8NCiB2MjogaHR0cHM6Ly9sb3JlLmtlcm5lbC5vcmcvbGludXgtbWVkaWEv
MjAxOTA5MDUwNzIxNDIuMTQ2MDYtMS1kb25nY2h1bi56aHVAbWVkaWF0ZWsuY29tLw0KIHYxOiBo
dHRwczovL2xvcmUua2VybmVsLm9yZy9saW51eC1tZWRpYS8yMDE5MDcwODEwMDY0MS4yNzAyLTEt
ZG9uZ2NodW4uemh1QG1lZGlhdGVrLmNvbS8NCg0KQ2hhbmdlcyBvZiB2NSBhcmUgYWRkcmVzc2lu
ZyBjb21tZW50cyBmcm9tIFJvYiwgQW5keSwgU2FrYXJpLCBpbmNsdWRpbmc6DQogLSBSZWJhc2Ug
b250byA1LjctcmMxDQogLSBSZWZpbmUgRFQgYmluZGluZ3MgaW4gWUFNTA0KIC0gUmVtb3ZlIHRo
ZSBjb25kaXRpb24gb2YgSVNfRU5BQkxFRChDT05GSUdfUE0pIGFzIHRoZSBkcml2ZXIgZGVwZW5k
cyBvbiBQTQ0KIC0gUmV2ZXJzZSB0aGUgb3JkZXIgb2YgZW5hYmxpbmcgUlBNIGFuZCByZWdpc3Rl
cmluZyB0aGUgYXN5bmMgc3ViZGV2DQoNClBsZWFzZSByZXZpZXcuDQpUaGFua3MuDQoNCkRvbmdj
aHVuIFpodSAoMik6DQogIG1lZGlhOiBkdC1iaW5kaW5nczogbWVkaWE6IGkyYzogRG9jdW1lbnQg
RFc5NzY4IGJpbmRpbmdzDQogIG1lZGlhOiBpMmM6IGR3OTc2ODogQWRkIERXOTc2OCBWQ00gZHJp
dmVyDQoNCiAuLi4vYmluZGluZ3MvbWVkaWEvaTJjL2Rvbmd3b29uLGR3OTc2OC55YW1sICAgICAg
ICB8ICA2MCArKysNCiBNQUlOVEFJTkVSUyAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICB8ICAgOCArDQogZHJpdmVycy9tZWRpYS9pMmMvS2NvbmZpZyAgICAgICAgICAgICAg
ICAgICAgICAgICAgfCAgMTEgKw0KIGRyaXZlcnMvbWVkaWEvaTJjL01ha2VmaWxlICAgICAgICAg
ICAgICAgICAgICAgICAgIHwgICAxICsNCiBkcml2ZXJzL21lZGlhL2kyYy9kdzk3NjguYyAgICAg
ICAgICAgICAgICAgICAgICAgICB8IDQ0MCArKysrKysrKysrKysrKysrKysrKysNCiA1IGZpbGVz
IGNoYW5nZWQsIDUyMCBpbnNlcnRpb25zKCspDQogY3JlYXRlIG1vZGUgMTAwNjQ0IERvY3VtZW50
YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy9tZWRpYS9pMmMvZG9uZ3dvb24sZHc5NzY4LnlhbWwN
CiBjcmVhdGUgbW9kZSAxMDA2NDQgZHJpdmVycy9tZWRpYS9pMmMvZHc5NzY4LmMNCg0KLS0gDQoy
LjkuMg0K

