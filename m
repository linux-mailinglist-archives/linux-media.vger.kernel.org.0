Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 3CDD161CC0
	for <lists+linux-media@lfdr.de>; Mon,  8 Jul 2019 12:12:12 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729226AbfGHKMK (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 8 Jul 2019 06:12:10 -0400
Received: from mailgw01.mediatek.com ([210.61.82.183]:26214 "EHLO
        mailgw01.mediatek.com" rhost-flags-OK-FAIL-OK-FAIL) by vger.kernel.org
        with ESMTP id S1728766AbfGHKMK (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Mon, 8 Jul 2019 06:12:10 -0400
X-UUID: e38e6b8228614fcfb5a61589c4146c24-20190708
X-UUID: e38e6b8228614fcfb5a61589c4146c24-20190708
Received: from mtkcas07.mediatek.inc [(172.21.101.84)] by mailgw01.mediatek.com
        (envelope-from <dongchun.zhu@mediatek.com>)
        (mhqrelay.mediatek.com ESMTP with TLS)
        with ESMTP id 1231339994; Mon, 08 Jul 2019 18:11:58 +0800
Received: from mtkcas08.mediatek.inc (172.21.101.126) by
 mtkmbs07n1.mediatek.inc (172.21.101.16) with Microsoft SMTP Server (TLS) id
 15.0.1395.4; Mon, 8 Jul 2019 18:11:57 +0800
Received: from localhost.localdomain (10.17.3.153) by mtkcas08.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1395.4 via Frontend
 Transport; Mon, 8 Jul 2019 18:11:56 +0800
From:   <dongchun.zhu@mediatek.com>
To:     <mchehab@kernel.org>, <robh+dt@kernel.org>, <mark.rutland@arm.com>,
        <matthias.bgg@gmail.com>, <sakari.ailus@linux.intel.com>,
        <tfiga@chromium.org>, <bingbu.cao@intel.com>
CC:     <srv_heupstream@mediatek.com>,
        <linux-mediatek@lists.infradead.org>,
        <linux-arm-kernel@lists.infradead.org>, <sj.huang@mediatek.com>,
        <linux-media@vger.kernel.org>, <devicetree@vger.kernel.org>,
        <louis.kuo@mediatek.com>, <shengnan.wang@mediatek.com>,
        <dongchun.zhu@mediatek.com>
Subject: [PATCH 1/2] media: i2c: dw9768: Add DT support and MAINTAINERS entry
Date:   Mon, 8 Jul 2019 18:06:40 +0800
Message-ID: <20190708100641.2702-2-dongchun.zhu@mediatek.com>
X-Mailer: git-send-email 2.9.2
In-Reply-To: <20190708100641.2702-1-dongchun.zhu@mediatek.com>
References: <20190708100641.2702-1-dongchun.zhu@mediatek.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="y"
Content-Transfer-Encoding: 8bit
X-MTK:  N
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

From: Dongchun Zhu <dongchun.zhu@mediatek.com>

Add the Devicetree binding documentation and MAINTAINERS entry for dw9768.

Signed-off-by: Dongchun Zhu <dongchun.zhu@mediatek.com>
---
 Documentation/devicetree/bindings/media/i2c/dongwoon,dw9768.txt | 9 +++++++++
 MAINTAINERS                                                     | 7 +++++++
 2 files changed, 16 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/media/i2c/dongwoon,dw9768.txt

diff --git a/Documentation/devicetree/bindings/media/i2c/dongwoon,dw9768.txt b/Documentation/devicetree/bindings/media/i2c/dongwoon,dw9768.txt
new file mode 100644
index 0000000..94b8ec3
--- /dev/null
+++ b/Documentation/devicetree/bindings/media/i2c/dongwoon,dw9768.txt
@@ -0,0 +1,9 @@
+Dongwoon Anatech DW9768 camera voice coil lens driver
+
+DW9768 is a 10-bit DAC with current sink capability. It is intended
+for driving voice coil lenses in camera modules.
+
+Mandatory properties:
+
+- compatible: "dongwoon,dw9768"
+- reg: I²C slave address
diff --git a/MAINTAINERS b/MAINTAINERS
index 5cfbea4..8f6ac93 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -4872,6 +4872,13 @@ S:	Maintained
 F:	drivers/media/i2c/dw9714.c
 F:	Documentation/devicetree/bindings/media/i2c/dongwoon,dw9714.txt
 
+DONGWOON DW9768 LENS VOICE COIL DRIVER
+M:	Dongchun Zhu <dongchun.zhu@mediatek.com>
+L:	linux-media@vger.kernel.org
+T:	git git://linuxtv.org/media_tree.git
+S:	Maintained
+F:	Documentation/devicetree/bindings/media/i2c/dongwoon,dw9768.txt
+
 DONGWOON DW9807 LENS VOICE COIL DRIVER
 M:	Sakari Ailus <sakari.ailus@linux.intel.com>
 L:	linux-media@vger.kernel.org
-- 
2.9.2

