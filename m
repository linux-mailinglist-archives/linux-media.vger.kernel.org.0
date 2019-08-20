Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 7ED5895D45
	for <lists+linux-media@lfdr.de>; Tue, 20 Aug 2019 13:26:21 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729846AbfHTLY5 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 20 Aug 2019 07:24:57 -0400
Received: from mail.kernel.org ([198.145.29.99]:41048 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1729814AbfHTLYz (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Tue, 20 Aug 2019 07:24:55 -0400
Received: from localhost (lfbn-1-17395-211.w86-250.abo.wanadoo.fr [86.250.200.211])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 41D1022D6D;
        Tue, 20 Aug 2019 11:24:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1566300294;
        bh=X1W8O7WR9KJI5jwenMWm+UPsfIL6Rn9a3Bmw4eKTkjU=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=gxBPJv7J7nQUWgzP7bwlSuZioGh03+7UEx0QSyveMtgbw1/wiMjiqwWw/JL0HCdC2
         JCSy0+N/wWtMOGEauPuPNPpgO6oVamTOx3in7+ug/tP0KG8T5me5CtKcbov0hlr4sv
         enOzhxBDu7dogAEgwsJuj5Q86dCGe3MPM6BZLy8U=
From:   Maxime Ripard <mripard@kernel.org>
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
Subject: [PATCH v7 2/5] media: sunxi: Refactor the Makefile and Kconfig
Date:   Tue, 20 Aug 2019 13:24:33 +0200
Message-Id: <1345e5d1beb34549399bd2c2dc30adb52cda2b01.1566300265.git-series.maxime.ripard@bootlin.com>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <cover.b695c63cf668192aff5574a3005d483c601e77f6.1566300265.git-series.maxime.ripard@bootlin.com>
References: <cover.b695c63cf668192aff5574a3005d483c601e77f6.1566300265.git-series.maxime.ripard@bootlin.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

From: Maxime Ripard <maxime.ripard@bootlin.com>

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
index 89555f9a813f..2fda8036d11d 100644
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
