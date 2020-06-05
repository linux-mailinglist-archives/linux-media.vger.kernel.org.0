Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A35D41EF5DC
	for <lists+linux-media@lfdr.de>; Fri,  5 Jun 2020 12:56:32 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726835AbgFEK4Y (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 5 Jun 2020 06:56:24 -0400
Received: from mailgw02.mediatek.com ([210.61.82.184]:6959 "EHLO
        mailgw02.mediatek.com" rhost-flags-OK-FAIL-OK-FAIL) by vger.kernel.org
        with ESMTP id S1726507AbgFEK4Y (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Fri, 5 Jun 2020 06:56:24 -0400
X-UUID: 6b189767abc54e5e8cd9283870a18f2d-20200605
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
        h=Content-Transfer-Encoding:Content-Type:MIME-Version:Message-ID:Date:Subject:CC:To:From; bh=RDATlCMt7JAqD+s3CrHj64evnMGc2HkPNIFyTmwdTd4=;
        b=bydpq7m6/IV+fpJlBB24jPrmNyLK5ps2k5juGN/wZpfUOpHqAX9+kohzL3Q2JTkVociC55b5aFU9vA8wrFpTvXo6pZiX//9SUF3F6X0qPk2eGEhkDOwwkHdmsI30O2xSCq7NPnm4cQoz9OU+rKYgcVixYfT0RXB6ols+lM+K9Es=;
X-UUID: 6b189767abc54e5e8cd9283870a18f2d-20200605
Received: from mtkcas06.mediatek.inc [(172.21.101.30)] by mailgw02.mediatek.com
        (envelope-from <dongchun.zhu@mediatek.com>)
        (Cellopoint E-mail Firewall v4.1.10 Build 0809 with TLS)
        with ESMTP id 1896889789; Fri, 05 Jun 2020 18:56:21 +0800
Received: from MTKCAS06.mediatek.inc (172.21.101.30) by
 mtkmbs05n1.mediatek.inc (172.21.101.15) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Fri, 5 Jun 2020 18:56:18 +0800
Received: from localhost.localdomain (10.17.3.153) by MTKCAS06.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Fri, 5 Jun 2020 18:56:15 +0800
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
Subject: [V7, 0/2] media: i2c: Add support for DW9768 VCM driver
Date:   Fri, 5 Jun 2020 18:54:10 +0800
Message-ID: <20200605105412.18813-1-dongchun.zhu@mediatek.com>
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
dGggMTAwbUEgb3V0cHV0IGN1cnJlbnQgc2luayBjYXBhYmlsaXR5Lg0KDQpUaGUgZHJpdmVyIGNv
bnRyb2xzIHRoZSBwb3NpdGlvbiB3aXRoIDEwLWJpdCBEQUMgZGF0YSBEWzk6MF0gYW5kIHNlcGVy
YXRlcw0KdHdvIDgtYml0IHJlZ2lzdGVycyB0byBjb250cm9sIHRoZSBWQ00gcG9zaXRpb24gYXMg
YmVsb3dzLg0KREFDX01TQjogRFs5OjhdKEFERFI6IDB4MDMpOg0KICAgICArLS0tKy0tLSstLS0r
LS0tKy0tLSstLS0rLS0tKy0tLSsNCiAgICAgfC0tLXwtLS18LS0tfC0tLXwtLS18LS0tfEQwOXxE
MDh8DQogICAgICstLS0rLS0tKy0tLSstLS0rLS0tKy0tLSstLS0rLS0tKw0KREFDX0xTQjogRFs3
OjBdKEFERFI6IDB4MDQpOg0KICAgICArLS0tKy0tLSstLS0rLS0tKy0tLSstLS0rLS0tKy0tLSsN
CiAgICAgfEQwN3xEMDZ8RDA1fEQwNHxEMDN8RDAyfEQwMXxEMDB8DQogICAgICstLS0rLS0tKy0t
LSstLS0rLS0tKy0tLSstLS0rLS0tKw0KDQpUaGlzIGRyaXZlciBzdXBwb3J0czoNCiAtIHNldCBE
Vzk3NjggdG8gc3RhbmRieSBtb2RlIG9uY2Ugc3VzcGVuZCBhbmQgdHVybiBpdCBiYWNrIHRvIGFj
dGl2ZSBpZiByZXN1bWUNCiAtIHNldCB0aGUgZGVzaXJlZCBmb2N1cyB2aWEgVjRMMl9DSURfRk9D
VVNfQUJTT0xVVEUgY3RybA0KDQpQcmV2aW91cyB2ZXJzaW9ucyBvZiB0aGlzIHBhdGNoLXNldCBj
YW4gYmUgZm91bmQgaGVyZToNCnY2OiBodHRwczovL2xvcmUua2VybmVsLm9yZy9saW51eC1tZWRp
YS8yMDIwMDUxODEzMjczMS4yMDg1NS0xLWRvbmdjaHVuLnpodUBtZWRpYXRlay5jb20vDQp2NTog
aHR0cHM6Ly9sb3JlLmtlcm5lbC5vcmcvbGludXgtbWVkaWEvMjAyMDA1MDIxNjE3MjcuMzA0NjMt
MS1kb25nY2h1bi56aHVAbWVkaWF0ZWsuY29tLw0KdjQ6IGh0dHBzOi8vbG9yZS5rZXJuZWwub3Jn
L2xpbnV4LW1lZGlhLzIwMjAwMzMwMTIzNjM0LjM2My0xLWRvbmdjaHVuLnpodUBtZWRpYXRlay5j
b20vDQp2MzogaHR0cHM6Ly9sb3JlLmtlcm5lbC5vcmcvbGludXgtbWVkaWEvMjAyMDAyMjgxNTU5
NTguMjA2NTctMS1kb25nY2h1bi56aHVAbWVkaWF0ZWsuY29tLw0KdjI6IGh0dHBzOi8vbG9yZS5r
ZXJuZWwub3JnL2xpbnV4LW1lZGlhLzIwMTkwOTA1MDcyMTQyLjE0NjA2LTEtZG9uZ2NodW4uemh1
QG1lZGlhdGVrLmNvbS8NCnYxOiBodHRwczovL2xvcmUua2VybmVsLm9yZy9saW51eC1tZWRpYS8y
MDE5MDcwODEwMDY0MS4yNzAyLTEtZG9uZ2NodW4uemh1QG1lZGlhdGVrLmNvbS8NCg0KTWFpbmx5
IGNoYW5nZXMgb2YgdjcgYXJlIGFkZHJlc3NpbmcgY29tbWVudHMgZnJvbSBSb2IsIFNha2FyaSwg
VG9tYXN6Lg0KQ29tcGFyZWQgdG8gdjY6DQogLSBSZWZpbmUgRFQgYmluZGluZ3MNCiAtIFVzZSBp
MmNfc21idXNfcmVhZF9ieXRlX2RhdGEoKSBkaXJlY3RseSB0byByZXBsYWNlIG9mIGR3OTc2OF9y
ZWFkX3NtYnVzKCkNCiAtIENhbGN1bGF0ZSBvcGVyYXRpb24gdGltZSBiYXNlZCBvbiB0aGUgY29u
ZmlndXJlZCBib2FyZC1zcGVjaWZpYyBEVCBzZXR0aW5ncw0KIC0gQWJzdHJhY3QgYXN5bmMgcmVn
aXN0ZXIgZXJyb3IgaGFuZGxpbmcgY2FzZQ0KIC0gRml4IG90aGVyIHJldmlldyBjb21tZW50cyBp
biB2Ng0KDQpQbGVhc2UgcmV2aWV3Lg0KVGhhbmtzLg0KDQpEb25nY2h1biBaaHUgKDIpOg0KICBt
ZWRpYTogZHQtYmluZGluZ3M6IG1lZGlhOiBpMmM6IERvY3VtZW50IERXOTc2OCBiaW5kaW5ncw0K
ICBtZWRpYTogaTJjOiBkdzk3Njg6IEFkZCBEVzk3NjggVkNNIGRyaXZlcg0KDQogLi4uL2JpbmRp
bmdzL21lZGlhL2kyYy9kb25nd29vbixkdzk3NjgueWFtbCAgICAgICAgfCAxMDAgKysrKw0KIE1B
SU5UQUlORVJTICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIHwgICA4ICsN
CiBkcml2ZXJzL21lZGlhL2kyYy9LY29uZmlnICAgICAgICAgICAgICAgICAgICAgICAgICB8ICAx
MyArDQogZHJpdmVycy9tZWRpYS9pMmMvTWFrZWZpbGUgICAgICAgICAgICAgICAgICAgICAgICAg
fCAgIDEgKw0KIGRyaXZlcnMvbWVkaWEvaTJjL2R3OTc2OC5jICAgICAgICAgICAgICAgICAgICAg
ICAgIHwgNTY2ICsrKysrKysrKysrKysrKysrKysrKw0KIDUgZmlsZXMgY2hhbmdlZCwgNjg4IGlu
c2VydGlvbnMoKykNCiBjcmVhdGUgbW9kZSAxMDA2NDQgRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVl
L2JpbmRpbmdzL21lZGlhL2kyYy9kb25nd29vbixkdzk3NjgueWFtbA0KIGNyZWF0ZSBtb2RlIDEw
MDY0NCBkcml2ZXJzL21lZGlhL2kyYy9kdzk3NjguYw0KDQotLSANCjIuOS4yDQo=

