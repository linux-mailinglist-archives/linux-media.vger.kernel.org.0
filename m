Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 428F71BF247
	for <lists+linux-media@lfdr.de>; Thu, 30 Apr 2020 10:10:25 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726476AbgD3IKX (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 30 Apr 2020 04:10:23 -0400
Received: from mailgw02.mediatek.com ([210.61.82.184]:54299 "EHLO
        mailgw02.mediatek.com" rhost-flags-OK-FAIL-OK-FAIL) by vger.kernel.org
        with ESMTP id S1726420AbgD3IKW (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 30 Apr 2020 04:10:22 -0400
X-UUID: cbe1aa01cbce4d3497b8755b156760ab-20200430
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
        h=Content-Transfer-Encoding:Content-Type:MIME-Version:Message-ID:Date:Subject:CC:To:From; bh=OkjZA2Q16Y2OmU712BHLCUtFHRvElOB0/IOIcZcoXc0=;
        b=MOsOj+mO36UD2gW/IoesPdcv7Eukm/LXZ67JSnGV14P4SkjHUeyMjbfJOJJsyC+RXX0g4yC7yPWBKOXbcUTWYBrLvF3qlhw4t6NGyTL7RmIhJPXUaVsMiZ+MhWx9geFkwn3HQGLSBR19vBzf0klIAt5CehEjlx9ljm5baNXUTd0=;
X-UUID: cbe1aa01cbce4d3497b8755b156760ab-20200430
Received: from mtkcas08.mediatek.inc [(172.21.101.126)] by mailgw02.mediatek.com
        (envelope-from <dongchun.zhu@mediatek.com>)
        (Cellopoint E-mail Firewall v4.1.10 Build 0809 with TLS)
        with ESMTP id 213971226; Thu, 30 Apr 2020 16:10:21 +0800
Received: from mtkcas08.mediatek.inc (172.21.101.126) by
 mtkmbs07n1.mediatek.inc (172.21.101.16) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Thu, 30 Apr 2020 16:10:19 +0800
Received: from localhost.localdomain (10.17.3.153) by mtkcas08.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Thu, 30 Apr 2020 16:10:18 +0800
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
Subject: [V7, 0/2] media: i2c: Add support for OV02A10 sensor
Date:   Thu, 30 Apr 2020 16:09:22 +0800
Message-ID: <20200430080924.1140-1-dongchun.zhu@mediatek.com>
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
dmlkZXMgb25lIHNvdXJjZSBwYWQgaW4gY29tbW9uIGFuZCB0d28gZm9yIGR1YWwtY2FtLg0KDQpD
aGFuZ2VzIG9mIHY3IG1haW5seSBhZGRyZXNzIGNvbW1lbnRzIGZyb20gUm9iLCBUb21hc3osIEFu
ZHksIFNha2FyaS4NCiAtIFJlYmFzZSBvbnRvIDUuNy1yYzENCiAtIFVzZSBEVCBiaW5kaW5ncyBp
biBZQU1MIHRvIHJlcGxhY2Ugb2Ygb2xkIHRleHQgZG9jdW1lbnRhdGlvbg0KIC0gRG9jdW1lbnQg
b3B0aW9uYWwgcHJvcGVydHkgIm92dGksbWlwaS10eC1zcGVlZCIgYW5kICJyb3RhdGlvbiIgDQog
LSBSZWZpbmUgZHJpdmVyIG1vcmUgc2ltcGx5DQogDQpQcmV2aW91cyB2ZXJzaW9ucyBvZiB0aGlz
IHBhdGNoLXNldCBjYW4gYmUgZm91bmQgaGVyZToNCiB2NjogaHR0cHM6Ly9sb3JlLmtlcm5lbC5v
cmcvbGludXgtbWVkaWEvMjAxOTEyMTExMTI4NDkuMTY3MDUtMS1kb25nY2h1bi56aHVAbWVkaWF0
ZWsuY29tLw0KIHY1OiBodHRwczovL2xvcmUua2VybmVsLm9yZy9saW51eC1tZWRpYS8yMDE5MTEw
NDEwNTcxMy4yNDMxMS0xLWRvbmdjaHVuLnpodUBtZWRpYXRlay5jb20vDQogdjQ6IGh0dHBzOi8v
bG9yZS5rZXJuZWwub3JnL2xpbnV4LW1lZGlhLzIwMTkwOTA3MDkyNzI4LjIzODk3LTEtZG9uZ2No
dW4uemh1QG1lZGlhdGVrLmNvbS8NCiB2MzogaHR0cHM6Ly9sb3JlLmtlcm5lbC5vcmcvbGludXgt
bWVkaWEvMjAxOTA4MTkwMzQzMzEuMTMwOTgtMS1kb25nY2h1bi56aHVAbWVkaWF0ZWsuY29tLw0K
IHYyOiBodHRwczovL2xvcmUua2VybmVsLm9yZy9saW51eC1tZWRpYS8yMDE5MDcwNDA4NDY1MS4z
MTA1LTEtZG9uZ2NodW4uemh1QG1lZGlhdGVrLmNvbS8NCiB2MTogaHR0cHM6Ly9sb3JlLmtlcm5l
bC5vcmcvbGludXgtbWVkaWEvMjAxOTA1MjMxMDIyMDQuMjQxMTItMS1kb25nY2h1bi56aHVAbWVk
aWF0ZWsuY29tLw0KDQpDaGFuZ2VzIG9mIHY3IG1haW5seSBhZGRyZXNzIGNvbW1lbnRzIGZyb20g
Um9iLCBUb21hc3osIEFuZHksIFNha2FyaS4NCiAtIFJlYmFzZSBvbnRvIDUuNy1yYzENCiAtIFVz
ZSBEVCBiaW5kaW5ncyBpbiBZQU1MIHRvIHJlcGxhY2Ugb2Ygb2xkIHRleHQgZG9jdW1lbnRhdGlv
bg0KIC0gRG9jdW1lbnQgb3B0aW9uYWwgcHJvcGVydHkgIm92dGksbWlwaS10eC1zcGVlZCIgYW5k
ICJyb3RhdGlvbiINCiAtIFJlZmluZSBkcml2ZXIgbW9yZSBzaW1wbHkNCg0KUGxlYXNlIHJldmll
dy4NClRoYW5rcy4NCg0KRG9uZ2NodW4gWmh1ICgyKToNCiAgbWVkaWE6IGR0LWJpbmRpbmdzOiBt
ZWRpYTogaTJjOiBEb2N1bWVudCBPVjAyQTEwIGJpbmRpbmdzDQogIG1lZGlhOiBpMmM6IG92MDJh
MTA6IEFkZCBPVjAyQTEwIGltYWdlIHNlbnNvciBkcml2ZXINCg0KIC4uLi9iaW5kaW5ncy9tZWRp
YS9pMmMvb3Z0aSxvdjAyYTEwLnlhbWwgICAgICAgICAgIHwgIDE0OCArKysNCiBNQUlOVEFJTkVS
UyAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICB8ICAgIDggKw0KIGRyaXZl
cnMvbWVkaWEvaTJjL0tjb25maWcgICAgICAgICAgICAgICAgICAgICAgICAgIHwgICAxMSArDQog
ZHJpdmVycy9tZWRpYS9pMmMvTWFrZWZpbGUgICAgICAgICAgICAgICAgICAgICAgICAgfCAgICAx
ICsNCiBkcml2ZXJzL21lZGlhL2kyYy9vdjAyYTEwLmMgICAgICAgICAgICAgICAgICAgICAgICB8
IDEwOTAgKysrKysrKysrKysrKysrKysrKysNCiA1IGZpbGVzIGNoYW5nZWQsIDEyNTggaW5zZXJ0
aW9ucygrKQ0KIGNyZWF0ZSBtb2RlIDEwMDY0NCBEb2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmlu
ZGluZ3MvbWVkaWEvaTJjL292dGksb3YwMmExMC55YW1sDQogY3JlYXRlIG1vZGUgMTAwNjQ0IGRy
aXZlcnMvbWVkaWEvaTJjL292MDJhMTAuYw0KDQotLSANCjIuOS4yDQo=

