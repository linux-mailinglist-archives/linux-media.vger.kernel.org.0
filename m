Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 30EE71FB158
	for <lists+linux-media@lfdr.de>; Tue, 16 Jun 2020 14:58:17 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728931AbgFPM6J (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 16 Jun 2020 08:58:09 -0400
Received: from mailgw01.mediatek.com ([210.61.82.183]:33136 "EHLO
        mailgw01.mediatek.com" rhost-flags-OK-FAIL-OK-FAIL) by vger.kernel.org
        with ESMTP id S1728596AbgFPM6I (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 16 Jun 2020 08:58:08 -0400
X-UUID: 44323cc4d58d4aa783254dc03ade135f-20200616
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
        h=Content-Transfer-Encoding:Content-Type:MIME-Version:Message-ID:Date:Subject:CC:To:From; bh=oNHjaMOtZSRmFXKNgj4jutQqnqBUtcgYhDdv/yzFkco=;
        b=leubagLZK/HGWxX/mDodYglcxtNSjE0hq0QyZdaDQZrsieWLSZdj3yUjmeHkLSc15tDfU4GB/DrZ/r8nrf8R+gA0dhjQJvgjJzlEM59LfxS81SZlQhH1XxO4p6H4xKKhJXBTUrYRFwnxLPBFRXw5+YBy/bOQkHyRyArytkKm34g=;
X-UUID: 44323cc4d58d4aa783254dc03ade135f-20200616
Received: from mtkcas06.mediatek.inc [(172.21.101.30)] by mailgw01.mediatek.com
        (envelope-from <dongchun.zhu@mediatek.com>)
        (Cellopoint E-mail Firewall v4.1.10 Build 0809 with TLS)
        with ESMTP id 298553589; Tue, 16 Jun 2020 20:58:02 +0800
Received: from mtkcas08.mediatek.inc (172.21.101.126) by
 mtkmbs07n1.mediatek.inc (172.21.101.16) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Tue, 16 Jun 2020 20:58:00 +0800
Received: from localhost.localdomain (10.17.3.153) by mtkcas08.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Tue, 16 Jun 2020 20:57:58 +0800
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
Subject: [PATCH V8 0/2] media: i2c: Add support for DW9768 VCM driver
Date:   Tue, 16 Jun 2020 20:55:29 +0800
Message-ID: <20200616125531.31671-1-dongchun.zhu@mediatek.com>
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
IGRlc2lnbmVkIGZvciBsaW5lYXIgY29udHJvbCBvZiB2b2ljZSBjb2lsIG1vdG9yKFZDTSksDQph
bmQgY29udHJvbGxlZCB2aWEgSUlDIHNlcmlhbCBpbnRlcmZhY2UgdG8gc2V0IHRoZSBkZXNpcmVk
IGZvY3VzLg0KDQpJdCBjb250cm9scyB0aGUgcG9zaXRpb24gd2l0aCAxMC1iaXQgREFDIGRhdGEg
RFs5OjBdIGFuZCBzZXBlcmF0ZXMNCnR3byA4LWJpdCByZWdpc3RlcnMgdG8gY29udHJvbCB0aGUg
VkNNIHBvc2l0aW9uIGFzIGJlbG93cy4NCkRBQ19NU0I6IERbOTo4XShBRERSOiAweDAzKToNCiAg
ICAgKy0tLSstLS0rLS0tKy0tLSstLS0rLS0tKy0tLSstLS0rDQogICAgIHwtLS18LS0tfC0tLXwt
LS18LS0tfC0tLXxEMDl8RDA4fA0KICAgICArLS0tKy0tLSstLS0rLS0tKy0tLSstLS0rLS0tKy0t
LSsNCkRBQ19MU0I6IERbNzowXShBRERSOiAweDA0KToNCiAgICAgKy0tLSstLS0rLS0tKy0tLSst
LS0rLS0tKy0tLSstLS0rDQogICAgIHxEMDd8RDA2fEQwNXxEMDR8RDAzfEQwMnxEMDF8RDAwfA0K
ICAgICArLS0tKy0tLSstLS0rLS0tKy0tLSstLS0rLS0tKy0tLSsNCg0KVGhpcyBkcml2ZXIgc3Vw
cG9ydHM6DQogLSBzZXQgRFc5NzY4IHRvIHN0YW5kYnkgbW9kZSBvbmNlIHN1c3BlbmQgYW5kIHR1
cm4gaXQgYmFjayB0byBhY3RpdmUgaWYgcmVzdW1lDQogLSBzZXQgdGhlIGRlc2lyZWQgZm9jdXMg
dmlhIFY0TDJfQ0lEX0ZPQ1VTX0FCU09MVVRFIGN0cmwNCg0KUHJldmlvdXMgdmVyc2lvbnMgb2Yg
dGhpcyBwYXRjaC1zZXQgY2FuIGJlIGZvdW5kIGhlcmU6DQp2NzogaHR0cHM6Ly9sb3JlLmtlcm5l
bC5vcmcvbGludXgtbWVkaWEvMjAyMDA2MDUxMDU0MTIuMTg4MTMtMS1kb25nY2h1bi56aHVAbWVk
aWF0ZWsuY29tLw0KdjY6IGh0dHBzOi8vbG9yZS5rZXJuZWwub3JnL2xpbnV4LW1lZGlhLzIwMjAw
NTE4MTMyNzMxLjIwODU1LTEtZG9uZ2NodW4uemh1QG1lZGlhdGVrLmNvbS8NCnY1OiBodHRwczov
L2xvcmUua2VybmVsLm9yZy9saW51eC1tZWRpYS8yMDIwMDUwMjE2MTcyNy4zMDQ2My0xLWRvbmdj
aHVuLnpodUBtZWRpYXRlay5jb20vDQp2NDogaHR0cHM6Ly9sb3JlLmtlcm5lbC5vcmcvbGludXgt
bWVkaWEvMjAyMDAzMzAxMjM2MzQuMzYzLTEtZG9uZ2NodW4uemh1QG1lZGlhdGVrLmNvbS8NCnYz
OiBodHRwczovL2xvcmUua2VybmVsLm9yZy9saW51eC1tZWRpYS8yMDIwMDIyODE1NTk1OC4yMDY1
Ny0xLWRvbmdjaHVuLnpodUBtZWRpYXRlay5jb20vDQp2MjogaHR0cHM6Ly9sb3JlLmtlcm5lbC5v
cmcvbGludXgtbWVkaWEvMjAxOTA5MDUwNzIxNDIuMTQ2MDYtMS1kb25nY2h1bi56aHVAbWVkaWF0
ZWsuY29tLw0KdjE6IGh0dHBzOi8vbG9yZS5rZXJuZWwub3JnL2xpbnV4LW1lZGlhLzIwMTkwNzA4
MTAwNjQxLjI3MDItMS1kb25nY2h1bi56aHVAbWVkaWF0ZWsuY29tLw0KDQpNYWlubHkgY2hhbmdl
cyBvZiB2OCBhcmUgYWRkcmVzc2luZyBjb21tZW50cyBmcm9tIFJvYiwgU2FrYXJpLCBBbmR5LCBU
b21hc3ouDQpDb21wYXJlZCB0byB2NzoNCiAtIFJlYmFzZSBvbnRvIDUuOC1yYzENCiAtIENhbGN1
bGF0ZSBtb3ZlIGRlbGF5IHRpbWUgb25jZSBpbiBwcm9iZSgpIGFuZCByZXN0b3JlIGl0IGluIHBy
aXZhdGUgc3RydWN0DQogLSBVc2UgdGhlIGZ3bm9kZSBwcm9wZXJ0eSBBUEkgdG8gcmVhZCB0aGUg
cHJvcGVydGllcyBpbnRvIHRoZSBmaWxlZCBkaXJlY3RseQ0KIC0gUmVuYW1lIGVycm9yX2FzeW5j
X3JlZ2lzdGVyIHRvIGVycl9wb3dlcl9vZmYgYW5kIHJlZmluZSBpdA0KIC0gRml4IG90aGVyIHJl
dmlldyBjb21tZW50cyBpbiB2Nw0KDQpQbGVhc2UgcmV2aWV3Lg0KVGhhbmtzLg0KDQpEb25nY2h1
biBaaHUgKDIpOg0KICBtZWRpYTogZHQtYmluZGluZ3M6IG1lZGlhOiBpMmM6IERvY3VtZW50IERX
OTc2OCBiaW5kaW5ncw0KICBtZWRpYTogaTJjOiBkdzk3Njg6IEFkZCBEVzk3NjggVkNNIGRyaXZl
cg0KDQogLi4uL2JpbmRpbmdzL21lZGlhL2kyYy9kb25nd29vbixkdzk3NjgueWFtbCAgICAgICAg
fCAxMDAgKysrKw0KIE1BSU5UQUlORVJTICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgIHwgICA4ICsNCiBkcml2ZXJzL21lZGlhL2kyYy9LY29uZmlnICAgICAgICAgICAgICAg
ICAgICAgICAgICB8ICAxMiArDQogZHJpdmVycy9tZWRpYS9pMmMvTWFrZWZpbGUgICAgICAgICAg
ICAgICAgICAgICAgICAgfCAgIDEgKw0KIGRyaXZlcnMvbWVkaWEvaTJjL2R3OTc2OC5jICAgICAg
ICAgICAgICAgICAgICAgICAgIHwgNTUzICsrKysrKysrKysrKysrKysrKysrKw0KIDUgZmlsZXMg
Y2hhbmdlZCwgNjc0IGluc2VydGlvbnMoKykNCiBjcmVhdGUgbW9kZSAxMDA2NDQgRG9jdW1lbnRh
dGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL21lZGlhL2kyYy9kb25nd29vbixkdzk3NjgueWFtbA0K
IGNyZWF0ZSBtb2RlIDEwMDY0NCBkcml2ZXJzL21lZGlhL2kyYy9kdzk3NjguYw0KDQotLSANCjIu
OS4yDQo=

