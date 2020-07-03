Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id CC0C62135AF
	for <lists+linux-media@lfdr.de>; Fri,  3 Jul 2020 10:04:39 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726283AbgGCIEi (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 3 Jul 2020 04:04:38 -0400
Received: from mailgw02.mediatek.com ([210.61.82.184]:65470 "EHLO
        mailgw02.mediatek.com" rhost-flags-OK-FAIL-OK-FAIL) by vger.kernel.org
        with ESMTP id S1725648AbgGCIEh (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Fri, 3 Jul 2020 04:04:37 -0400
X-UUID: 0abc58f37d8949f3a5e332253a872fb6-20200703
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
        h=Content-Transfer-Encoding:Content-Type:MIME-Version:Message-ID:Date:Subject:CC:To:From; bh=wAyY3Pzu4/qYV499F42vjkVX0Bv9W6FosPSxDbCeIiQ=;
        b=tGbHVgl0+5gctWKDS4v0I8RV5WhfNTba3Vvgx7Oc3QsyNfd+YIcDtq7fjfM2bqnONBdUB3N4uIm1s253HTrJHXcprsSfkhWbhfZv7dPKKGuY2UY0aVdRQPVpfRGbo/alpWL+/kXupSNgc7fBz9e78JUCHBLFTV8nWCuIizX5ank=;
X-UUID: 0abc58f37d8949f3a5e332253a872fb6-20200703
Received: from mtkcas06.mediatek.inc [(172.21.101.30)] by mailgw02.mediatek.com
        (envelope-from <dongchun.zhu@mediatek.com>)
        (Cellopoint E-mail Firewall v4.1.10 Build 0809 with TLS)
        with ESMTP id 1636154247; Fri, 03 Jul 2020 16:04:35 +0800
Received: from mtkcas07.mediatek.inc (172.21.101.84) by
 mtkmbs05n2.mediatek.inc (172.21.101.140) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Fri, 3 Jul 2020 16:04:33 +0800
Received: from localhost.localdomain (10.17.3.153) by mtkcas07.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Fri, 3 Jul 2020 16:04:31 +0800
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
Subject: [PATCH V10 0/2] media: i2c: Add support for DW9768 VCM
Date:   Fri, 3 Jul 2020 16:04:02 +0800
Message-ID: <20200703080404.29770-1-dongchun.zhu@mediatek.com>
X-Mailer: git-send-email 2.9.2
MIME-Version: 1.0
Content-Type: text/plain
X-MTK:  N
Content-Transfer-Encoding: base64
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

SGVsbG8sDQoNClRoaXMgc2VyaWVzIGFkZHMgRFQgYmluZGluZyBhbmQgVjRMMiBzdWItZGV2aWNl
IGRyaXZlciBmb3IgRG9uZ3dvb24ncyBEVzk3NjguDQpEVzk3NjggaXMgYSAxMC1iaXQgREFDIHdp
dGggMTAwbUEgb3V0cHV0IGN1cnJlbnQgc2luayBjYXBhYmlsaXR5LCBkZXNpZ25lZA0KZm9yIGxp
bmVhciBjb250cm9sIG9mIHZvaWNlIGNvaWwgbW90b3IoVkNNKS4NCg0KVGhpcyBkcml2ZXIgY3Jl
YXRlcyBhIFY0TDIgc3ViLWRldmljZSBhbmQgcHJvdmlkZXMgY29udHJvbCB0byBzZXQgdGhlIGRl
c2lyZWQNCmZvY3VzIHZpYSBJSTJDIHNlcmlhbCBpbnRlcmZhY2UuDQoNCkl0IGNvbnRyb2xzIHRo
ZSBwb3NpdGlvbiB3aXRoIDEwLWJpdCBEQUMgZGF0YSBEWzk6MF0gYW5kIHNlcGVyYXRlcyB0d28g
OC1iaXQNCnJlZ2lzdGVycyB0byBjb250cm9sIHRoZSBWQ00gcG9zaXRpb24gYXMgYmVsb3dzLg0K
REFDX01TQjogRFs5OjhdKEFERFI6IDB4MDMpOg0KICAgICArLS0tKy0tLSstLS0rLS0tKy0tLSst
LS0rLS0tKy0tLSsNCiAgICAgfC0tLXwtLS18LS0tfC0tLXwtLS18LS0tfEQwOXxEMDh8DQogICAg
ICstLS0rLS0tKy0tLSstLS0rLS0tKy0tLSstLS0rLS0tKw0KREFDX0xTQjogRFs3OjBdKEFERFI6
IDB4MDQpOg0KICAgICArLS0tKy0tLSstLS0rLS0tKy0tLSstLS0rLS0tKy0tLSsNCiAgICAgfEQw
N3xEMDZ8RDA1fEQwNHxEMDN8RDAyfEQwMXxEMDB8DQogICAgICstLS0rLS0tKy0tLSstLS0rLS0t
Ky0tLSstLS0rLS0tKw0KDQpUaGlzIGRyaXZlciBzdXBwb3J0czoNCiAtIHNldCBEVzk3NjggdG8g
c3RhbmRieSBtb2RlIG9uY2Ugc3VzcGVuZCBhbmQgdHVybiBpdCBiYWNrIHRvIGFjdGl2ZSBpZiBy
ZXN1bWUNCiAtIHNldCB0aGUgZGVzaXJlZCBmb2N1cyB2aWEgVjRMMl9DSURfRk9DVVNfQUJTT0xV
VEUgY3RybA0KDQpQcmV2aW91cyB2ZXJzaW9ucyBvZiB0aGlzIHBhdGNoLXNldCBjYW4gYmUgZm91
bmQgaGVyZToNCiB2OTogaHR0cHM6Ly9sb3JlLmtlcm5lbC5vcmcvbGludXgtbWVkaWEvMjAyMDA2
MzAwNjIyMTEuMjI5ODgtMS1kb25nY2h1bi56aHVAbWVkaWF0ZWsuY29tLw0KIHY4OiBodHRwczov
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
djEwIGFkZHJlc3MgY29tbWVudHMgZnJvbSBTYWthcmksIFRvbWFzeiwgQmluZ2J1Lg0KQ29tcGFy
ZWQgdG8gdjk6DQogLSBBZGQgcmV2aWV3ZWQtYnkgZm9yIFZDTSBkcml2ZXINCiAtIFJlLXNlbmQg
cGxhaW4gcGF0Y2ggdG8gdGVzdCBpZiB0aGVyZSBhcmUgc3RpbGwgd2VpcmQgdHJhaWxpbmcgd2hp
dGVzcGFjZXMNCg0KUGxlYXNlIHJldmlldy4NClRoYW5rcy4NCg0KRG9uZ2NodW4gWmh1ICgyKToN
CiAgbWVkaWE6IGR0LWJpbmRpbmdzOiBtZWRpYTogaTJjOiBEb2N1bWVudCBEVzk3NjggYmluZGlu
Z3MNCiAgbWVkaWE6IGkyYzogZHc5NzY4OiBBZGQgRFc5NzY4IFZDTSBkcml2ZXINCg0KIC4uLi9i
aW5kaW5ncy9tZWRpYS9pMmMvZG9uZ3dvb24sZHc5NzY4LnlhbWwgICAgICAgIHwgMTAwICsrKysN
CiBNQUlOVEFJTkVSUyAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICB8ICAg
OCArDQogZHJpdmVycy9tZWRpYS9pMmMvS2NvbmZpZyAgICAgICAgICAgICAgICAgICAgICAgICAg
fCAgMTIgKw0KIGRyaXZlcnMvbWVkaWEvaTJjL01ha2VmaWxlICAgICAgICAgICAgICAgICAgICAg
ICAgIHwgICAxICsNCiBkcml2ZXJzL21lZGlhL2kyYy9kdzk3NjguYyAgICAgICAgICAgICAgICAg
ICAgICAgICB8IDU1NCArKysrKysrKysrKysrKysrKysrKysNCiA1IGZpbGVzIGNoYW5nZWQsIDY3
NSBpbnNlcnRpb25zKCspDQogY3JlYXRlIG1vZGUgMTAwNjQ0IERvY3VtZW50YXRpb24vZGV2aWNl
dHJlZS9iaW5kaW5ncy9tZWRpYS9pMmMvZG9uZ3dvb24sZHc5NzY4LnlhbWwNCiBjcmVhdGUgbW9k
ZSAxMDA2NDQgZHJpdmVycy9tZWRpYS9pMmMvZHc5NzY4LmMNCg0KLS0gDQoyLjkuMg0K

