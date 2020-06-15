Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id DB2521F968F
	for <lists+linux-media@lfdr.de>; Mon, 15 Jun 2020 14:32:15 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729893AbgFOMcO (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 15 Jun 2020 08:32:14 -0400
Received: from mailgw02.mediatek.com ([210.61.82.184]:39610 "EHLO
        mailgw02.mediatek.com" rhost-flags-OK-FAIL-OK-FAIL) by vger.kernel.org
        with ESMTP id S1728598AbgFOMcN (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 15 Jun 2020 08:32:13 -0400
X-UUID: 32c6cc40a1ec4f3fa397f2de588ad28b-20200615
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
        h=Content-Transfer-Encoding:Content-Type:MIME-Version:Message-ID:Date:Subject:CC:To:From; bh=LempUdXCCkO3XMmtbxe09boDlc3IHyauHMUqUrdhizc=;
        b=j7wAmmAKRJXfgQFfYQ+3SVjF+ALdXZnS6Z5lYLs33HzRB4KTZ0lhtxWevNYtz+Ypt4ezh6W4GeYcnhil34lH5oztHKm0pz0MOdpivdVb4+DWGTzWVd40jrbYBEZRjn+uVYLEXgH+uccEDpkjQrtbRjLQzca5Ul2dzM58f/Yhbx0=;
X-UUID: 32c6cc40a1ec4f3fa397f2de588ad28b-20200615
Received: from mtkcas11.mediatek.inc [(172.21.101.40)] by mailgw02.mediatek.com
        (envelope-from <dongchun.zhu@mediatek.com>)
        (Cellopoint E-mail Firewall v4.1.10 Build 0809 with TLS)
        with ESMTP id 1609515663; Mon, 15 Jun 2020 20:32:09 +0800
Received: from mtkcas08.mediatek.inc (172.21.101.126) by
 mtkmbs07n2.mediatek.inc (172.21.101.141) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Mon, 15 Jun 2020 20:32:06 +0800
Received: from localhost.localdomain (10.17.3.153) by mtkcas08.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Mon, 15 Jun 2020 20:32:06 +0800
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
Subject: [PATCH V10 0/2] media: i2c: Add support for OV02A10 sensor
Date:   Mon, 15 Jun 2020 20:29:35 +0800
Message-ID: <20200615122937.18965-1-dongchun.zhu@mediatek.com>
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
dWItZGV2aWNlIGRyaXZlciBmb3IgT21uaXZpc2lvbidzDQpPVjAyQTEwIDIgbWVnYXBpeGVsIENN
T1MgMS81IiBzZW5zb3IsIHdoaWNoIGhhcyBhIHNpbmdsZSBNSVBJIGxhbmUgaW50ZXJmYWNlDQph
bmQgb3V0cHV0IGZvcm1hdCBvZiAxMC1iaXQgUkFXLg0KDQpUaGUgZHJpdmVyIGlzIGltcGxlbWVu
dGVkIHdpdGggVjRMMiBmcmFtZXdvcmsuDQogLSBBc3luYyByZWdpc3RlcmVkIGFzIGEgVjRMMiBz
dWItZGV2aWNlLg0KIC0gQXMgdGhlIGZpcnN0IGNvbXBvbmVudCBvZiBjYW1lcmEgc3lzdGVtIGlu
Y2x1ZGluZyBTZW5pbmYsIElTUCBwaXBlbGluZS4NCiAtIEEgbWVkaWEgZW50aXR5IHRoYXQgcHJv
dmlkZXMgb25lIHNvdXJjZSBwYWQgaW4gY29tbW9uIGFuZCB0d28gZm9yIGR1YWwtY2FtLg0KIA0K
UHJldmlvdXMgdmVyc2lvbnMgb2YgdGhpcyBwYXRjaC1zZXQgY2FuIGJlIGZvdW5kIGhlcmU6DQog
djk6IGh0dHBzOi8vbG9yZS5rZXJuZWwub3JnL2xpbnV4LW1lZGlhLzIwMjAwNTIzMDg0MTAzLjMx
Mjc2LTEtZG9uZ2NodW4uemh1QG1lZGlhdGVrLmNvbS8NCiB2ODogaHR0cHM6Ly9sb3JlLmtlcm5l
bC5vcmcvbGludXgtbWVkaWEvMjAyMDA1MDkwODA2MjcuMjMyMjItMS1kb25nY2h1bi56aHVAbWVk
aWF0ZWsuY29tLw0KIHY3OiBodHRwczovL2xvcmUua2VybmVsLm9yZy9saW51eC1tZWRpYS8yMDIw
MDQzMDA4MDkyNC4xMTQwLTEtZG9uZ2NodW4uemh1QG1lZGlhdGVrLmNvbS8NCiB2NjogaHR0cHM6
Ly9sb3JlLmtlcm5lbC5vcmcvbGludXgtbWVkaWEvMjAxOTEyMTExMTI4NDkuMTY3MDUtMS1kb25n
Y2h1bi56aHVAbWVkaWF0ZWsuY29tLw0KIHY1OiBodHRwczovL2xvcmUua2VybmVsLm9yZy9saW51
eC1tZWRpYS8yMDE5MTEwNDEwNTcxMy4yNDMxMS0xLWRvbmdjaHVuLnpodUBtZWRpYXRlay5jb20v
DQogdjQ6IGh0dHBzOi8vbG9yZS5rZXJuZWwub3JnL2xpbnV4LW1lZGlhLzIwMTkwOTA3MDkyNzI4
LjIzODk3LTEtZG9uZ2NodW4uemh1QG1lZGlhdGVrLmNvbS8NCiB2MzogaHR0cHM6Ly9sb3JlLmtl
cm5lbC5vcmcvbGludXgtbWVkaWEvMjAxOTA4MTkwMzQzMzEuMTMwOTgtMS1kb25nY2h1bi56aHVA
bWVkaWF0ZWsuY29tLw0KIHYyOiBodHRwczovL2xvcmUua2VybmVsLm9yZy9saW51eC1tZWRpYS8y
MDE5MDcwNDA4NDY1MS4zMTA1LTEtZG9uZ2NodW4uemh1QG1lZGlhdGVrLmNvbS8NCiB2MTogaHR0
cHM6Ly9sb3JlLmtlcm5lbC5vcmcvbGludXgtbWVkaWEvMjAxOTA1MjMxMDIyMDQuMjQxMTItMS1k
b25nY2h1bi56aHVAbWVkaWF0ZWsuY29tLw0KDQpDaGFuZ2VzIG9mIHYxMCBhcmUgYWRkcmVzc2lu
ZyBjb21tZW50cyBmcm9tIFJvYiwgU2FrYXJpLCBUb21hc3ouDQpDb21wYXJlZCB0byB2OToNCiAt
IEFkZCBtYXhJdGVtcyBjb25zdHJhaW50IHRvIHBvd2VyZG93bi1ncGlvcyBhbmQgcmVzZXQtZ3Bp
b3MNCiAtIEFkZCBhIGRlc2NyaXB0aW9uIG9mIHRoZSBkYXRhIHRoYXQgc2Vuc29yIHBvcnQgbm9k
ZSBzaGFsbCBoYXZlDQogLSBSZW1vdmUgJ2RhdGEtbGFuZXMnIHByb3BlcnR5IGFzIGl0IHByb3Zp
ZGVzIG5vIGluZm9ybWF0aW9uIHRvIHRoZSByZWNlaXZlcg0KIC0gUmVmaW5lICdlcnJfcG93ZXJf
b2ZmJyBlcnJvciBoYW5kbGluZyBzZWN0aW9uIGFmdGVyIGFzeW5jIHJlZ2lzdGVyIHN1Yi1kZXZp
Y2UNCiAtIEhhbmRsZSB0aGUgY2FzZSB3aGVuIGZtdC0+d2hpY2ggaXMgVjRMMl9TVUJERVZfRk9S
TUFUX1RSWQ0KIC0gUm9sbGJhY2sgdGhlIGNvbnRyb2xzIG9mIEhCTEFOSyBhbmQgVkJMQU5LIGFz
IHVzZXJzcGFjZSBtYXkgbmVlZCB0aGVtDQogLSBVc2UgJ0VpZ2h0IFZlcnRpY2FsIENvbG9yIEJh
cnMnIHRvIG5vcm1hbGl6ZSBzdGFuZGFyZCBuYW1lIG9mIHRlc3QgcGF0dGVybg0KIC0gRml4IG90
aGVyIHJldmlldyBjb21tZW50cyBpbiB2OQ0KDQpQbGVhc2UgcmV2aWV3Lg0KVGhhbmtzLg0KDQpE
b25nY2h1biBaaHUgKDIpOg0KICBtZWRpYTogZHQtYmluZGluZ3M6IG1lZGlhOiBpMmM6IERvY3Vt
ZW50IE9WMDJBMTAgYmluZGluZ3MNCiAgbWVkaWE6IGkyYzogb3YwMmExMDogQWRkIE9WMDJBMTAg
aW1hZ2Ugc2Vuc29yIGRyaXZlcg0KDQogLi4uL2JpbmRpbmdzL21lZGlhL2kyYy9vdnRpLG92MDJh
MTAueWFtbCAgICAgICAgICAgfCAgMTcxICsrKysNCiBNQUlOVEFJTkVSUyAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICB8ICAgIDggKw0KIGRyaXZlcnMvbWVkaWEvaTJjL0tj
b25maWcgICAgICAgICAgICAgICAgICAgICAgICAgIHwgICAxMyArDQogZHJpdmVycy9tZWRpYS9p
MmMvTWFrZWZpbGUgICAgICAgICAgICAgICAgICAgICAgICAgfCAgICAxICsNCiBkcml2ZXJzL21l
ZGlhL2kyYy9vdjAyYTEwLmMgICAgICAgICAgICAgICAgICAgICAgICB8IDEwNDIgKysrKysrKysr
KysrKysrKysrKysNCiA1IGZpbGVzIGNoYW5nZWQsIDEyMzUgaW5zZXJ0aW9ucygrKQ0KIGNyZWF0
ZSBtb2RlIDEwMDY0NCBEb2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3MvbWVkaWEvaTJj
L292dGksb3YwMmExMC55YW1sDQogY3JlYXRlIG1vZGUgMTAwNjQ0IGRyaXZlcnMvbWVkaWEvaTJj
L292MDJhMTAuYw0KDQotLSANCjIuOS4yDQo=

