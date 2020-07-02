Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 477BF2122AD
	for <lists+linux-media@lfdr.de>; Thu,  2 Jul 2020 13:53:08 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728842AbgGBLxC (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 2 Jul 2020 07:53:02 -0400
Received: from mailgw02.mediatek.com ([210.61.82.184]:7483 "EHLO
        mailgw02.mediatek.com" rhost-flags-OK-FAIL-OK-FAIL) by vger.kernel.org
        with ESMTP id S1728661AbgGBLxB (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Thu, 2 Jul 2020 07:53:01 -0400
X-UUID: 7210cb0f931f47278b16833dfce785c6-20200702
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
        h=Content-Transfer-Encoding:Content-Type:MIME-Version:Message-ID:Date:Subject:CC:To:From; bh=nKlkkWFs3s2d4usM6wA4JUcE08ohBoy1IQ8R65ZelwI=;
        b=QMsEoFtXueawmjXCAiGgcFsDUkIMsU/s5ihO33BAgNSmrA30JL6Ak8fVViGRmWT5mfXwZcRS3uU1UUONCCpcO2sbvdd0HIsrvH98FnTEMoJ2FzPqyI6t8ClM4Xl53zq4lmXGArvweM5cpmf6JjwsFvyHl2H830QsjUXTzMNyTG0=;
X-UUID: 7210cb0f931f47278b16833dfce785c6-20200702
Received: from mtkexhb01.mediatek.inc [(172.21.101.102)] by mailgw02.mediatek.com
        (envelope-from <dongchun.zhu@mediatek.com>)
        (Cellopoint E-mail Firewall v4.1.10 Build 0809 with TLS)
        with ESMTP id 480147576; Thu, 02 Jul 2020 19:52:56 +0800
Received: from MTKCAS06.mediatek.inc (172.21.101.30) by
 mtkmbs02n1.mediatek.inc (172.21.101.77) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Thu, 2 Jul 2020 19:52:47 +0800
Received: from localhost.localdomain (10.17.3.153) by MTKCAS06.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Thu, 2 Jul 2020 19:52:46 +0800
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
Subject: [PATCH V12 0/2] media: i2c: Add support for OV02A10 sensor
Date:   Thu, 2 Jul 2020 19:52:21 +0800
Message-ID: <20200702115223.21507-1-dongchun.zhu@mediatek.com>
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
djExOiBodHRwczovL2xvcmUua2VybmVsLm9yZy9saW51eC1tZWRpYS8yMDIwMDYzMDAyNDk0Mi4y
MDg5MS0xLWRvbmdjaHVuLnpodUBtZWRpYXRlay5jb20vDQogdjEwOiBodHRwczovL2xvcmUua2Vy
bmVsLm9yZy9saW51eC1tZWRpYS8yMDIwMDYxNTEyMjkzNy4xODk2NS0zLWRvbmdjaHVuLnpodUBt
ZWRpYXRlay5jb20vDQogdjA5OiBodHRwczovL2xvcmUua2VybmVsLm9yZy9saW51eC1tZWRpYS8y
MDIwMDUyMzA4NDEwMy4zMTI3Ni0xLWRvbmdjaHVuLnpodUBtZWRpYXRlay5jb20vDQogdjA4OiBo
dHRwczovL2xvcmUua2VybmVsLm9yZy9saW51eC1tZWRpYS8yMDIwMDUwOTA4MDYyNy4yMzIyMi0x
LWRvbmdjaHVuLnpodUBtZWRpYXRlay5jb20vDQogdjA3OiBodHRwczovL2xvcmUua2VybmVsLm9y
Zy9saW51eC1tZWRpYS8yMDIwMDQzMDA4MDkyNC4xMTQwLTEtZG9uZ2NodW4uemh1QG1lZGlhdGVr
LmNvbS8NCiB2MDY6IGh0dHBzOi8vbG9yZS5rZXJuZWwub3JnL2xpbnV4LW1lZGlhLzIwMTkxMjEx
MTEyODQ5LjE2NzA1LTEtZG9uZ2NodW4uemh1QG1lZGlhdGVrLmNvbS8NCiB2MDU6IGh0dHBzOi8v
bG9yZS5rZXJuZWwub3JnL2xpbnV4LW1lZGlhLzIwMTkxMTA0MTA1NzEzLjI0MzExLTEtZG9uZ2No
dW4uemh1QG1lZGlhdGVrLmNvbS8NCiB2MDQ6IGh0dHBzOi8vbG9yZS5rZXJuZWwub3JnL2xpbnV4
LW1lZGlhLzIwMTkwOTA3MDkyNzI4LjIzODk3LTEtZG9uZ2NodW4uemh1QG1lZGlhdGVrLmNvbS8N
CiB2MDM6IGh0dHBzOi8vbG9yZS5rZXJuZWwub3JnL2xpbnV4LW1lZGlhLzIwMTkwODE5MDM0MzMx
LjEzMDk4LTEtZG9uZ2NodW4uemh1QG1lZGlhdGVrLmNvbS8NCiB2MDI6IGh0dHBzOi8vbG9yZS5r
ZXJuZWwub3JnL2xpbnV4LW1lZGlhLzIwMTkwNzA0MDg0NjUxLjMxMDUtMS1kb25nY2h1bi56aHVA
bWVkaWF0ZWsuY29tLw0KIHYwMTogaHR0cHM6Ly9sb3JlLmtlcm5lbC5vcmcvbGludXgtbWVkaWEv
MjAxOTA1MjMxMDIyMDQuMjQxMTItMS1kb25nY2h1bi56aHVAbWVkaWF0ZWsuY29tLw0KDQpDaGFu
Z2VzIG9mIHYxMiBtYWlubHkgYWRkcmVzcyBjb21tZW50cyBmcm9tIFNha2FyaSwgVG9tYXN6LCBB
bmR5Lg0KQ29tcGFyZWQgdG8gdjExOg0KIC0gVXBkYXRlIHRoZSBpbml0aWFsIEdQSU8gc3RhdGUg
Zm9yIHJlc2V0IHBpbiBpbiBwcm9iZSgpDQogLSBSZWZpbmUgdGhlIGZ1bmN0aW9uIG92MDJhMTBf
ZW50aXR5X2luaXRfY2ZnKCkNCg0KUGxlYXNlIHJldmlldy4NClRoYW5rcy4NCg0KRG9uZ2NodW4g
Wmh1ICgyKToNCiAgbWVkaWE6IGR0LWJpbmRpbmdzOiBtZWRpYTogaTJjOiBEb2N1bWVudCBPVjAy
QTEwIGJpbmRpbmdzDQogIG1lZGlhOiBpMmM6IG92MDJhMTA6IEFkZCBPVjAyQTEwIGltYWdlIHNl
bnNvciBkcml2ZXINCg0KIC4uLi9iaW5kaW5ncy9tZWRpYS9pMmMvb3Z0aSxvdjAyYTEwLnlhbWwg
ICAgICAgICAgIHwgIDE3MiArKysrDQogTUFJTlRBSU5FUlMgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgfCAgICA4ICsNCiBkcml2ZXJzL21lZGlhL2kyYy9LY29uZmlnICAg
ICAgICAgICAgICAgICAgICAgICAgICB8ICAgMTMgKw0KIGRyaXZlcnMvbWVkaWEvaTJjL01ha2Vm
aWxlICAgICAgICAgICAgICAgICAgICAgICAgIHwgICAgMSArDQogZHJpdmVycy9tZWRpYS9pMmMv
b3YwMmExMC5jICAgICAgICAgICAgICAgICAgICAgICAgfCAxMDUyICsrKysrKysrKysrKysrKysr
KysrDQogNSBmaWxlcyBjaGFuZ2VkLCAxMjQ2IGluc2VydGlvbnMoKykNCiBjcmVhdGUgbW9kZSAx
MDA2NDQgRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL21lZGlhL2kyYy9vdnRpLG92
MDJhMTAueWFtbA0KIGNyZWF0ZSBtb2RlIDEwMDY0NCBkcml2ZXJzL21lZGlhL2kyYy9vdjAyYTEw
LmMNCg0KLS0gDQoyLjkuMg0K

