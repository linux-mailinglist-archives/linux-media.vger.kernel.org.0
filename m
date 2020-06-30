Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 189C920EE39
	for <lists+linux-media@lfdr.de>; Tue, 30 Jun 2020 08:22:48 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730040AbgF3GWm (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 30 Jun 2020 02:22:42 -0400
Received: from mailgw02.mediatek.com ([210.61.82.184]:53950 "EHLO
        mailgw02.mediatek.com" rhost-flags-OK-FAIL-OK-FAIL) by vger.kernel.org
        with ESMTP id S1729901AbgF3GWl (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 30 Jun 2020 02:22:41 -0400
X-UUID: 58c55bafefdb433484826967884d46ed-20200630
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
        h=Content-Transfer-Encoding:Content-Type:MIME-Version:Message-ID:Date:Subject:CC:To:From; bh=nR6OzzIisReA8shV0BgR3bsU+tUWbUvrl963V50edjM=;
        b=Q64iXN0KDB+49ds74oVzmvWAlkcdaUMxtxYJNw438CBRQEmUJod+Dg57rXYp3lgjCZ9CdPS0fccuOAXnNi7+A7q88VoaCbeHkNpcdY95AwCz7r6m4UDtzYZyAAustrCuw1RUoF1GWSuVoR1WfMHuWT/H+BJV4559Vk33CXjE5DY=;
X-UUID: 58c55bafefdb433484826967884d46ed-20200630
Received: from mtkcas10.mediatek.inc [(172.21.101.39)] by mailgw02.mediatek.com
        (envelope-from <dongchun.zhu@mediatek.com>)
        (Cellopoint E-mail Firewall v4.1.10 Build 0809 with TLS)
        with ESMTP id 898209961; Tue, 30 Jun 2020 14:22:35 +0800
Received: from mtkcas08.mediatek.inc (172.21.101.126) by
 mtkmbs07n2.mediatek.inc (172.21.101.141) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Tue, 30 Jun 2020 14:22:32 +0800
Received: from localhost.localdomain (10.17.3.153) by mtkcas08.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Tue, 30 Jun 2020 14:22:33 +0800
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
Subject: [PATCH V9 0/2] media: i2c: Add support for DW9768 VCM
Date:   Tue, 30 Jun 2020 14:22:09 +0800
Message-ID: <20200630062211.22988-1-dongchun.zhu@mediatek.com>
X-Mailer: git-send-email 2.9.2
MIME-Version: 1.0
Content-Type: text/plain
X-MTK:  N
Content-Transfer-Encoding: base64
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

SGVsbG8sDQoNClRoaXMgc2VyaWVzIGFkZHMgRFQgYmluZGluZ3MgYW5kIFY0TDIgc3ViLWRldmlj
ZSBkcml2ZXIgZm9yIERvbmd3b29uJ3MgRFc5NzY4LA0Kd2hpY2ggaXMgYSAxMC1iaXQgREFDIHdp
dGggMTAwbUEgb3V0cHV0IGN1cnJlbnQgc2luayBjYXBhYmlsaXR5Lg0KDQpUaGUgZHJpdmVyIGlz
IGRlc2lnbmVkIGZvciBsaW5lYXIgY29udHJvbCBvZiB2b2ljZSBjb2lsIG1vdG9yKFZDTSkuDQpJ
dCBjcmVhdGVzIGEgVjRMMiBzdWItZGV2aWNlIGFuZCBwcm92aWRlcyBjb250cm9sIHRvIHNldCB0
aGUgZGVzaXJlZCBmb2N1cy4NCg0KSXQgY29udHJvbHMgdGhlIHBvc2l0aW9uIHdpdGggMTAtYml0
IERBQyBkYXRhIERbOTowXSBhbmQgc2VwZXJhdGVzDQp0d28gOC1iaXQgcmVnaXN0ZXJzIHRvIGNv
bnRyb2wgdGhlIFZDTSBwb3NpdGlvbiBhcyBiZWxvd3MuDQpEQUNfTVNCOiBEWzk6OF0oQUREUjog
MHgwMyk6DQogICAgICstLS0rLS0tKy0tLSstLS0rLS0tKy0tLSstLS0rLS0tKw0KICAgICB8LS0t
fC0tLXwtLS18LS0tfC0tLXwtLS18RDA5fEQwOHwNCiAgICAgKy0tLSstLS0rLS0tKy0tLSstLS0r
LS0tKy0tLSstLS0rDQpEQUNfTFNCOiBEWzc6MF0oQUREUjogMHgwNCk6DQogICAgICstLS0rLS0t
Ky0tLSstLS0rLS0tKy0tLSstLS0rLS0tKw0KICAgICB8RDA3fEQwNnxEMDV8RDA0fEQwM3xEMDJ8
RDAxfEQwMHwNCiAgICAgKy0tLSstLS0rLS0tKy0tLSstLS0rLS0tKy0tLSstLS0rDQoNClRoaXMg
ZHJpdmVyIHN1cHBvcnRzOg0KIC0gc2V0IERXOTc2OCB0byBzdGFuZGJ5IG1vZGUgb25jZSBzdXNw
ZW5kIGFuZCB0dXJuIGl0IGJhY2sgdG8gYWN0aXZlIGlmIHJlc3VtZQ0KIC0gc2V0IHRoZSBkZXNp
cmVkIGZvY3VzIHZpYSBWNEwyX0NJRF9GT0NVU19BQlNPTFVURSBjdHJsDQoNClByZXZpb3VzIHZl
cnNpb25zIG9mIHRoaXMgcGF0Y2gtc2V0IGNhbiBiZSBmb3VuZCBoZXJlOg0KIHY4OiBodHRwczov
L2xvcmUua2VybmVsLm9yZy9saW51eC1tZWRpYS8yMDIwMDYxNjEyNTUzMS4zMTY3MS0xLWRvbmdj
aHVuLnpodUBtZWRpYXRlay5jb20vDQogdjc6IGh0dHBzOi8vbG9yZS5rZXJuZWwub3JnL2xpbnV4
LW1lZGlhLzIwMjAwNjA1MTA1NDEyLjE4ODEzLTEtZG9uZ2NodW4uemh1QG1lZGlhdGVrLmNvbS8N
CiB2NjogaHR0cHM6Ly9sb3JlLmtlcm5lbC5vcmcvbGludXgtbWVkaWEvMjAyMDA1MTgxMzI3MzEu
MjA4NTUtMS1kb25nY2h1bi56aHVAbWVkaWF0ZWsuY29tLw0KIHY1OiBodHRwczovL2xvcmUua2Vy
bmVsLm9yZy9saW51eC1tZWRpYS8yMDIwMDUwMjE2MTcyNy4zMDQ2My0xLWRvbmdjaHVuLnpodUBt
ZWRpYXRlay5jb20vDQogdjQ6IGh0dHBzOi8vbG9yZS5rZXJuZWwub3JnL2xpbnV4LW1lZGlhLzIw
MjAwMzMwMTIzNjM0LjM2My0xLWRvbmdjaHVuLnpodUBtZWRpYXRlay5jb20vDQogdjM6IGh0dHBz
Oi8vbG9yZS5rZXJuZWwub3JnL2xpbnV4LW1lZGlhLzIwMjAwMjI4MTU1OTU4LjIwNjU3LTEtZG9u
Z2NodW4uemh1QG1lZGlhdGVrLmNvbS8NCiB2MjogaHR0cHM6Ly9sb3JlLmtlcm5lbC5vcmcvbGlu
dXgtbWVkaWEvMjAxOTA5MDUwNzIxNDIuMTQ2MDYtMS1kb25nY2h1bi56aHVAbWVkaWF0ZWsuY29t
Lw0KIHYxOiBodHRwczovL2xvcmUua2VybmVsLm9yZy9saW51eC1tZWRpYS8yMDE5MDcwODEwMDY0
MS4yNzAyLTEtZG9uZ2NodW4uemh1QG1lZGlhdGVrLmNvbS8NCg0KTWFpbmx5IGNoYW5nZXMgb2Yg
djkgYXJlIGFkZHJlc3NpbmcgY29tbWVudHMgZnJvbSBUb21hc3ouDQpDb21wYXJlZCB0byB2ODoN
CiAtIFJlZmluZSBkdzk3NjhfY2FsX21vdmVfZGVsYXkoKSB0byByZXR1cm4gdGhlIHZhbHVlIGlu
IGEgc3RhbmRhcmQgdW5pdA0KIC0gUmVmaW5lIGVycl9wb3dlcl9vZmYgZXJyb3IgaGFuZGxlciBz
ZWN0aW9uIGluIHByb2JlKCkNCiAtIFVzZSBwbV9ydW50aW1lX3N0YXR1c19zdXNwZW5kZWQoKSBp
biByZW1vdmUoKQ0KDQpQbGVhc2UgcmV2aWV3Lg0KVGhhbmtzLg0KDQpEb25nY2h1biBaaHUgKDIp
Og0KICBtZWRpYTogZHQtYmluZGluZ3M6IG1lZGlhOiBpMmM6IERvY3VtZW50IERXOTc2OCBiaW5k
aW5ncw0KICBtZWRpYTogaTJjOiBkdzk3Njg6IEFkZCBEVzk3NjggVkNNIGRyaXZlcg0KDQogLi4u
L2JpbmRpbmdzL21lZGlhL2kyYy9kb25nd29vbixkdzk3NjgueWFtbCAgICAgICAgfCAxMDAgKysr
Kw0KIE1BSU5UQUlORVJTICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIHwg
ICA4ICsNCiBkcml2ZXJzL21lZGlhL2kyYy9LY29uZmlnICAgICAgICAgICAgICAgICAgICAgICAg
ICB8ICAxMiArDQogZHJpdmVycy9tZWRpYS9pMmMvTWFrZWZpbGUgICAgICAgICAgICAgICAgICAg
ICAgICAgfCAgIDEgKw0KIGRyaXZlcnMvbWVkaWEvaTJjL2R3OTc2OC5jICAgICAgICAgICAgICAg
ICAgICAgICAgIHwgNTU0ICsrKysrKysrKysrKysrKysrKysrKw0KIDUgZmlsZXMgY2hhbmdlZCwg
Njc1IGluc2VydGlvbnMoKykNCiBjcmVhdGUgbW9kZSAxMDA2NDQgRG9jdW1lbnRhdGlvbi9kZXZp
Y2V0cmVlL2JpbmRpbmdzL21lZGlhL2kyYy9kb25nd29vbixkdzk3NjgueWFtbA0KIGNyZWF0ZSBt
b2RlIDEwMDY0NCBkcml2ZXJzL21lZGlhL2kyYy9kdzk3NjguYw0KDQotLSANCjIuOS4yDQo=

