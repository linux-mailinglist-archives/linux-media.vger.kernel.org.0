Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id EDD7765683
	for <lists+linux-media@lfdr.de>; Thu, 11 Jul 2019 14:15:29 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728694AbfGKMPZ (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 11 Jul 2019 08:15:25 -0400
Received: from relay11.mail.gandi.net ([217.70.178.231]:45913 "EHLO
        relay11.mail.gandi.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725934AbfGKMPV (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 11 Jul 2019 08:15:21 -0400
Received: from localhost (lfbn-1-17395-211.w86-250.abo.wanadoo.fr [86.250.200.211])
        (Authenticated sender: maxime.ripard@bootlin.com)
        by relay11.mail.gandi.net (Postfix) with ESMTPSA id 51A21100017;
        Thu, 11 Jul 2019 12:15:18 +0000 (UTC)
From:   Maxime Ripard <maxime.ripard@bootlin.com>
To:     Hans Verkuil <hans.verkuil@cisco.com>,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>
Cc:     Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        linux-media@vger.kernel.org, Chen-Yu Tsai <wens@csie.org>,
        linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        devicetree@vger.kernel.org, Mark Rutland <mark.rutland@arm.com>,
        Rob Herring <robh+dt@kernel.org>,
        Frank Rowand <frowand.list@gmail.com>,
        Maxime Ripard <maxime.ripard@bootlin.com>
Subject: [PATCH v6 2/5] media: sunxi: Refactor the Makefile and Kconfig
Date:   Thu, 11 Jul 2019 14:15:04 +0200
Message-Id: <a68df210e89e53e58e6bb2da64f634e8598066ae.1562847292.git-series.maxime.ripard@bootlin.com>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <cover.34bcd988943a26671681eaf849aacab51fab1cfe.1562847292.git-series.maxime.ripard@bootlin.com>
References: <cover.34bcd988943a26671681eaf849aacab51fab1cfe.1562847292.git-series.maxime.ripard@bootlin.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

The Makefile and Kconfig for the sun6i CSI driver are included in the main
Makefile / KConfig file. Since we're going to add a new CSI driver for an
older chip, and the Cedrus driver eventually, it makes more sense to put
those in our directory.

Signed-off-by: Maxime Ripard <maxime.ripard@bootlin.com>
---
 drivers/media/platform/Kconfig        | 2 +-
 drivers/media/platform/Makefile       | 2 +-
 drivers/media/platform/sunxi/Kconfig  | 1 +
 drivers/media/platform/sunxi/Makefile | 1 +
 4 files changed, 4 insertions(+), 2 deletions(-)
 create mode 100644 drivers/media/platform/sunxi/Kconfig
 create mode 100644 drivers/media/platform/sunxi/Makefile

diff --git a/drivers/media/platform/Kconfig b/drivers/media/platform/Kconfig
index 8a19654b393a..2abf4ea8b9b1 100644
--- a/drivers/media/platform/Kconfig
+++ b/drivers/media/platform/Kconfig
@@ -146,7 +146,7 @@ source "drivers/media/platform/am437x/Kconfig"
 source "drivers/media/platform/xilinx/Kconfig"
 source "drivers/media/platform/rcar-vin/Kconfig"
 source "drivers/media/platform/atmel/Kconfig"
-source "drivers/media/platform/sunxi/sun6i-csi/Kconfig"
+source "drivers/media/platform/sunxi/Kconfig"
 
 config VIDEO_TI_CAL
 	tristate "TI CAL (Camera Adaptation Layer) driver"
diff --git a/drivers/media/platform/Makefile b/drivers/media/platform/Makefile
index 7cbbd925124c..6ee7eb0d36f4 100644
--- a/drivers/media/platform/Makefile
+++ b/drivers/media/platform/Makefile
@@ -100,4 +100,4 @@ obj-y					+= meson/
 
 obj-y					+= cros-ec-cec/
 
-obj-$(CONFIG_VIDEO_SUN6I_CSI)		+= sunxi/sun6i-csi/
+obj-y					+= sunxi/
diff --git a/drivers/media/platform/sunxi/Kconfig b/drivers/media/platform/sunxi/Kconfig
new file mode 100644
index 000000000000..1b6e89cb78b2
--- /dev/null
+++ b/drivers/media/platform/sunxi/Kconfig
@@ -0,0 +1 @@
+source "drivers/media/platform/sunxi/sun6i-csi/Kconfig"
diff --git a/drivers/media/platform/sunxi/Makefile b/drivers/media/platform/sunxi/Makefile
new file mode 100644
index 000000000000..8d06f98500ee
--- /dev/null
+++ b/drivers/media/platform/sunxi/Makefile
@@ -0,0 +1 @@
+obj-y		+= sun6i-csi/
-- 
git-series 0.9.1
