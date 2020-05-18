Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id CED131D79D8
	for <lists+linux-media@lfdr.de>; Mon, 18 May 2020 15:29:10 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726958AbgERN3I (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 18 May 2020 09:29:08 -0400
Received: from mailgw01.mediatek.com ([210.61.82.183]:39161 "EHLO
        mailgw01.mediatek.com" rhost-flags-OK-FAIL-OK-FAIL) by vger.kernel.org
        with ESMTP id S1726775AbgERN3I (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 18 May 2020 09:29:08 -0400
X-UUID: 7fa473ba96a9451c88b54261dcbf2e0c-20200518
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
        h=Content-Transfer-Encoding:Content-Type:MIME-Version:Message-ID:Date:Subject:CC:To:From; bh=0oPHPt5pIb7KHZdlyVqoLRWJ+ikzXZ8b5EsBL/Pps+M=;
        b=l7XVTTa5BNIRmYHaMG7Yv9ZpVnRhAg0ziJbNDCqBuRC9jjisumcugGycJmwGC9eLatM0aosoONyuzC8zJX58twVjqoebz6yR9uilzpsdiAuM1Ru2WeO0Xz69+Bw1SH6fIfBkVCscZMRsB7BnvsjdG8fC51CXM6EnVktPpWo27RE=;
X-UUID: 7fa473ba96a9451c88b54261dcbf2e0c-20200518
Received: from mtkexhb01.mediatek.inc [(172.21.101.102)] by mailgw01.mediatek.com
        (envelope-from <dongchun.zhu@mediatek.com>)
        (Cellopoint E-mail Firewall v4.1.10 Build 0809 with TLS)
        with ESMTP id 728150184; Mon, 18 May 2020 21:29:02 +0800
Received: from mtkcas07.mediatek.inc (172.21.101.84) by
 mtkmbs07n1.mediatek.inc (172.21.101.16) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Mon, 18 May 2020 21:29:01 +0800
Received: from localhost.localdomain (10.17.3.153) by mtkcas07.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Mon, 18 May 2020 21:28:59 +0800
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
Subject: [V6, 0/2] media: i2c: Add support for DW9768 VCM driver
Date:   Mon, 18 May 2020 21:27:29 +0800
Message-ID: <20200518132731.20855-1-dongchun.zhu@mediatek.com>
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
dWItZGV2aWNlIGRyaXZlciBmb3IgRFc5NzY4DQpsZW5zIHZvaWNlIGNvaWwgbW90b3IoVkNNKSwg
d2hpY2ggaXMgYSAxMC1iaXQgREFDIHdpdGggMTAwbUEgb3V0cHV0IGN1cnJlbnQNCnNpbmsgY2Fw
YWJpbGl0eSBmcm9tIERvbmd3b29uLg0KDQpUaGUgZHJpdmVyIGlzIGRlc2lnbmVkIGZvciBsaW5l
YXIgY29udHJvbCBvZiB2b2ljZSBjb2lsIG1vdG9yLA0KYW5kIGNvbnRyb2xsZWQgdmlhIElJQyBz
ZXJpYWwgaW50ZXJmYWNlIHRvIHNldCB0aGUgZGVzaXJlZCBmb2N1cy4NCkl0IGNvbnRyb2xzIHRo
ZSBwb3NpdGlvbiB3aXRoIDEwLWJpdCBEQUMgZGF0YSBEWzk6MF0gYW5kIHNlcGVyYXRlcw0KdHdv
IDgtYml0IHJlZ3MgdG8gY29udHJvbCB0aGUgVkNNIHBvc2l0aW9uIGFzIGJlbG93cy4NCkRBQ19N
U0I6IERbOTo4XShBRERSOiAweDAzKToNCiAgICAgKy0tLSstLS0rLS0tKy0tLSstLS0rLS0tKy0t
LSstLS0rDQogICAgIHwtLS18LS0tfC0tLXwtLS18LS0tfC0tLXxEMDl8RDA4fA0KICAgICArLS0t
Ky0tLSstLS0rLS0tKy0tLSstLS0rLS0tKy0tLSsNCkRBQ19MU0I6IERbNzowXShBRERSOiAweDA0
KToNCiAgICAgKy0tLSstLS0rLS0tKy0tLSstLS0rLS0tKy0tLSstLS0rDQogICAgIHxEMDd8RDA2
fEQwNXxEMDR8RDAzfEQwMnxEMDF8RDAwfA0KICAgICArLS0tKy0tLSstLS0rLS0tKy0tLSstLS0r
LS0tKy0tLSsNCg0KVGhpcyBkcml2ZXIgc3VwcG9ydHM6DQogLSBzZXQgRFc5NzY4IHRvIHN0YW5k
YnkgbW9kZSBvbmNlIHN1c3BlbmQgYW5kIHR1cm4gaXQgYmFjayB0byBhY3RpdmUgaWYgcmVzdW1l
DQogLSBzZXQgdGhlIGRlc2lyZWQgZm9jdXMgdmlhIFY0TDJfQ0lEX0ZPQ1VTX0FCU09MVVRFIGN0
cmwNCg0KUHJldmlvdXMgdmVyc2lvbnMgb2YgdGhpcyBwYXRjaC1zZXQgY2FuIGJlIGZvdW5kIGhl
cmU6DQp2NTogaHR0cHM6Ly9sb3JlLmtlcm5lbC5vcmcvbGludXgtbWVkaWEvMjAyMDA1MDIxNjE3
MjcuMzA0NjMtMS1kb25nY2h1bi56aHVAbWVkaWF0ZWsuY29tLw0KdjQ6IGh0dHBzOi8vbG9yZS5r
ZXJuZWwub3JnL2xpbnV4LW1lZGlhLzIwMjAwMzMwMTIzNjM0LjM2My0xLWRvbmdjaHVuLnpodUBt
ZWRpYXRlay5jb20vDQp2MzogaHR0cHM6Ly9sb3JlLmtlcm5lbC5vcmcvbGludXgtbWVkaWEvMjAy
MDAyMjgxNTU5NTguMjA2NTctMS1kb25nY2h1bi56aHVAbWVkaWF0ZWsuY29tLw0KdjI6IGh0dHBz
Oi8vbG9yZS5rZXJuZWwub3JnL2xpbnV4LW1lZGlhLzIwMTkwOTA1MDcyMTQyLjE0NjA2LTEtZG9u
Z2NodW4uemh1QG1lZGlhdGVrLmNvbS8NCnYxOiBodHRwczovL2xvcmUua2VybmVsLm9yZy9saW51
eC1tZWRpYS8yMDE5MDcwODEwMDY0MS4yNzAyLTEtZG9uZ2NodW4uemh1QG1lZGlhdGVrLmNvbS8N
Cg0KTWFpbmx5IGNoYW5nZXMgb2YgdjYgYXJlIGFkZHJlc3NpbmcgY29tbWVudHMgZnJvbSBSb2Is
IFNha2FyaSwgVG9tYXN6Lg0KQ29tcGFyZWQgdG8gdjU6DQogLSBBZGQgYSBzZWNvbmQgY29tcGF0
aWJsZSBzdHJpbmcgZm9yIHRoZSBHaWFudGVjIGRldmljZQ0KIC0gRG9jdW1lbnQgb3B0aW9uYWwg
cHJvcGVydGllczogImRvbmd3b29uLGFhYy1tb2RlIiwgImRvbmd3b29uLGFhYy10aW1pbmciIGFu
ZA0KICAgImRvbmd3b29uLGNsb2NrLWRpdmlkaW5nLXJhdGUiIGZvciBsZW5zIHNwZWNpZmljIHJl
ZyBzZXR0aW5ncw0KIC0gQWRqdXN0IEtjb25maWcgdG8gbWF0Y2ggdGhlIGN1cnJlbnQgbWVkaWEg
dHJlZSBtYXN0ZXIgYnJhbmNoDQogLSBVc2UgY29udGFpbmVyX29mKCkgZGlyZWN0bHkgdG8gcmVw
bGFjZSBvZiBkZWZpbmluZyBtYWNybyBmdW5jdGlvbg0KDQpQbGVhc2UgaGVscCByZXZpZXcuDQpU
aGFua3MuDQoNCkRvbmdjaHVuIFpodSAoMik6DQogIG1lZGlhOiBkdC1iaW5kaW5nczogbWVkaWE6
IGkyYzogRG9jdW1lbnQgRFc5NzY4IGJpbmRpbmdzDQogIG1lZGlhOiBpMmM6IGR3OTc2ODogQWRk
IERXOTc2OCBWQ00gZHJpdmVyDQoNCiAuLi4vYmluZGluZ3MvbWVkaWEvaTJjL2Rvbmd3b29uLGR3
OTc2OC55YW1sICAgICAgICB8IDEwNSArKysrKw0KIE1BSU5UQUlORVJTICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgIHwgICA4ICsNCiBkcml2ZXJzL21lZGlhL2kyYy9LY29u
ZmlnICAgICAgICAgICAgICAgICAgICAgICAgICB8ICAxMyArDQogZHJpdmVycy9tZWRpYS9pMmMv
TWFrZWZpbGUgICAgICAgICAgICAgICAgICAgICAgICAgfCAgIDEgKw0KIGRyaXZlcnMvbWVkaWEv
aTJjL2R3OTc2OC5jICAgICAgICAgICAgICAgICAgICAgICAgIHwgNTE1ICsrKysrKysrKysrKysr
KysrKysrKw0KIDUgZmlsZXMgY2hhbmdlZCwgNjQyIGluc2VydGlvbnMoKykNCiBjcmVhdGUgbW9k
ZSAxMDA2NDQgRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL21lZGlhL2kyYy9kb25n
d29vbixkdzk3NjgueWFtbA0KIGNyZWF0ZSBtb2RlIDEwMDY0NCBkcml2ZXJzL21lZGlhL2kyYy9k
dzk3NjguYw0KDQotLSANCjIuOS4yDQo=

