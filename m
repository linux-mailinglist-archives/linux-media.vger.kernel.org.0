Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id BE112403A35
	for <lists+linux-media@lfdr.de>; Wed,  8 Sep 2021 15:03:51 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230326AbhIHNEa (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 8 Sep 2021 09:04:30 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40156 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235591AbhIHNE0 (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Wed, 8 Sep 2021 09:04:26 -0400
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de [IPv6:2001:67c:670:201:290:27ff:fe1d:cc33])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 57AEDC0613C1
        for <linux-media@vger.kernel.org>; Wed,  8 Sep 2021 06:03:18 -0700 (PDT)
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
        by metis.ext.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.92)
        (envelope-from <mtr@pengutronix.de>)
        id 1mNxES-0004mJ-L9; Wed, 08 Sep 2021 15:03:16 +0200
Received: from [2a0a:edc0:0:1101:1d::39] (helo=dude03.red.stw.pengutronix.de)
        by drehscheibe.grey.stw.pengutronix.de with esmtp (Exim 4.92)
        (envelope-from <mtr@pengutronix.de>)
        id 1mNxER-0004SD-Mc; Wed, 08 Sep 2021 15:03:15 +0200
Received: from mtr by dude03.red.stw.pengutronix.de with local (Exim 4.92)
        (envelope-from <mtr@pengutronix.de>)
        id 1mNxER-00DpG8-Lp; Wed, 08 Sep 2021 15:03:15 +0200
From:   Michael Tretter <m.tretter@pengutronix.de>
To:     linux-media@vger.kernel.org, mchehab@kernel.org,
        hverkuil-cisco@xs4all.nl
Cc:     kernel@pengutronix.de, m.tretter@pengutronix.de
Subject: [PATCH 3/6] media: allegro: lookup VCU settings
Date:   Wed,  8 Sep 2021 15:03:12 +0200
Message-Id: <20210908130315.3295253-4-m.tretter@pengutronix.de>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20210908130315.3295253-1-m.tretter@pengutronix.de>
References: <20210908130315.3295253-1-m.tretter@pengutronix.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 2a0a:edc0:0:c01:1d::a2
X-SA-Exim-Mail-From: mtr@pengutronix.de
X-SA-Exim-Scanned: No (on metis.ext.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-media@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

The VCU provides information about its configuration in a dedicated
register space. These settings include, for example, the expected clock
rates and the configuration of the encoder buffer. In the device tree,
the settings are described by the "xlnx,vcu-settings" compatible.

The settings are needed to correctly configure the clocks and the
encoder buffer.

Lookup the VCU settings in the device tree and make it accessible to the
driver via a regmap.

Signed-off-by: Michael Tretter <m.tretter@pengutronix.de>
---
 drivers/media/platform/allegro-dvt/allegro-core.c | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/drivers/media/platform/allegro-dvt/allegro-core.c b/drivers/media/platform/allegro-dvt/allegro-core.c
index 89d6de6082f6..2663d9da0522 100644
--- a/drivers/media/platform/allegro-dvt/allegro-core.c
+++ b/drivers/media/platform/allegro-dvt/allegro-core.c
@@ -12,6 +12,8 @@
 #include <linux/io.h>
 #include <linux/kernel.h>
 #include <linux/log2.h>
+#include <linux/mfd/syscon.h>
+#include <linux/mfd/syscon/xlnx-vcu.h>
 #include <linux/module.h>
 #include <linux/of.h>
 #include <linux/of_device.h>
@@ -136,6 +138,7 @@ struct allegro_dev {
 
 	struct regmap *regmap;
 	struct regmap *sram;
+	struct regmap *settings;
 
 	const struct fw_info *fw_info;
 	struct allegro_buffer firmware;
@@ -3721,6 +3724,10 @@ static int allegro_probe(struct platform_device *pdev)
 		return PTR_ERR(dev->sram);
 	}
 
+	dev->settings = syscon_regmap_lookup_by_compatible("xlnx,vcu-settings");
+	if (IS_ERR(dev->settings))
+		dev_warn(&pdev->dev, "failed to open settings\n");
+
 	irq = platform_get_irq(pdev, 0);
 	if (irq < 0)
 		return irq;
-- 
2.30.2

