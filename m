Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 35BDB56267A
	for <lists+linux-media@lfdr.de>; Fri,  1 Jul 2022 01:08:34 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231176AbiF3XIJ (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 30 Jun 2022 19:08:09 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55338 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230339AbiF3XII (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 30 Jun 2022 19:08:08 -0400
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9632C58FF2
        for <linux-media@vger.kernel.org>; Thu, 30 Jun 2022 16:08:03 -0700 (PDT)
Received: from pendragon.lan (62-78-145-57.bb.dnainternet.fi [62.78.145.57])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id ED774E7B;
        Fri,  1 Jul 2022 01:07:42 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1656630463;
        bh=01epSYX4cVGebTAAHohqrj/JBTpDXrCiZTO0fNB7AQI=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=Zpmt1g/tvNvgZuo+fX78RIaphs8j+dUNxhbbCWvY9JtTGOJ9XvX9evxjkEqvMHpMn
         4rLWct9JNHIOTGGbLUdhwixBKb4zdgShDQsQ7uAYWzZzZBXTdhxlE0265Rod/qzdaD
         Jvh+/rPKpggh/Aa3ob2cczUdKrfIDUH1WuLmsaXI=
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     linux-media@vger.kernel.org
Cc:     linux-rockchip@lists.infradead.org,
        Dafna Hirschfeld <dafna@fastmail.com>,
        Heiko Stuebner <heiko@sntech.de>,
        Helen Koike <helen.koike@collabora.com>,
        Paul Elder <paul.elder@ideasonboard.com>
Subject: [PATCH v2 09/55] media: rkisp1: Save info pointer in rkisp1_device
Date:   Fri,  1 Jul 2022 02:06:27 +0300
Message-Id: <20220630230713.10580-10-laurent.pinchart@ideasonboard.com>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220630230713.10580-1-laurent.pinchart@ideasonboard.com>
References: <20220630230713.10580-1-laurent.pinchart@ideasonboard.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_PASS,SPF_PASS,
        T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

From: Paul Elder <paul.elder@ideasonboard.com>

To make it possible to use the rkisp1_info after probe time (for
instance to make code conditional on the ISP version), save it in the
main rkisp1_device structure. To achieve this, also move the info
structure into the common header, and document it.

While at it, drop a NULL check in rkisp1_probe() for the match data as
it can't happen.

Signed-off-by: Paul Elder <paul.elder@ideasonboard.com>
Signed-off-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Reviewed-by: Dafna Hirschfeld <dafna@fastmail.com>
---
Changes since v1:

- Typo fix
---
 .../platform/rockchip/rkisp1/rkisp1-common.h  | 22 +++++++++++++++++++
 .../platform/rockchip/rkisp1/rkisp1-dev.c     | 15 +++----------
 2 files changed, 25 insertions(+), 12 deletions(-)

diff --git a/drivers/media/platform/rockchip/rkisp1/rkisp1-common.h b/drivers/media/platform/rockchip/rkisp1/rkisp1-common.h
index 4243ff5e2197..7dca59f7b424 100644
--- a/drivers/media/platform/rockchip/rkisp1/rkisp1-common.h
+++ b/drivers/media/platform/rockchip/rkisp1/rkisp1-common.h
@@ -91,6 +91,26 @@ enum rkisp1_isp_pad {
 	RKISP1_ISP_PAD_MAX
 };
 
+/*
+ * struct rkisp1_info - Model-specific ISP Information
+ *
+ * @clks: array of ISP clock names
+ * @clk_size: number of entries in the @clks array
+ * @isrs: array of ISP interrupt descriptors
+ * @isr_size: number of entries in the @isrs array
+ * @isp_ver: ISP version
+ *
+ * This structure contains information about the ISP specific to a particular
+ * ISP model, version, or integration in a particular SoC.
+ */
+struct rkisp1_info {
+	const char * const *clks;
+	unsigned int clk_size;
+	const struct rkisp1_isr_data *isrs;
+	unsigned int isr_size;
+	enum rkisp1_cif_isp_version isp_ver;
+};
+
 /*
  * struct rkisp1_sensor_async - A container for the v4l2_async_subdev to add to the notifier
  *				of the v4l2-async API
@@ -386,6 +406,7 @@ struct rkisp1_debug {
  * @pipe:	   media pipeline
  * @stream_lock:   serializes {start/stop}_streaming callbacks between the capture devices.
  * @debug:	   debug params to be exposed on debugfs
+ * @info:	   version-specific ISP information
  */
 struct rkisp1_device {
 	void __iomem *base_addr;
@@ -404,6 +425,7 @@ struct rkisp1_device {
 	struct media_pipeline pipe;
 	struct mutex stream_lock; /* serialize {start/stop}_streaming cb between capture devices */
 	struct rkisp1_debug debug;
+	const struct rkisp1_info *info;
 };
 
 /*
diff --git a/drivers/media/platform/rockchip/rkisp1/rkisp1-dev.c b/drivers/media/platform/rockchip/rkisp1/rkisp1-dev.c
index 258980ef4783..39ae35074062 100644
--- a/drivers/media/platform/rockchip/rkisp1/rkisp1-dev.c
+++ b/drivers/media/platform/rockchip/rkisp1/rkisp1-dev.c
@@ -105,14 +105,6 @@ struct rkisp1_isr_data {
 	irqreturn_t (*isr)(int irq, void *ctx);
 };
 
-struct rkisp1_info {
-	const char * const *clks;
-	unsigned int clk_size;
-	const struct rkisp1_isr_data *isrs;
-	unsigned int isr_size;
-	enum rkisp1_cif_isp_version isp_ver;
-};
-
 /* ----------------------------------------------------------------------------
  * Sensor DT bindings
  */
@@ -469,14 +461,13 @@ static int rkisp1_probe(struct platform_device *pdev)
 	int ret, irq;
 	u32 cif_id;
 
-	info = of_device_get_match_data(&pdev->dev);
-	if (!info)
-		return -ENODEV;
-
 	rkisp1 = devm_kzalloc(dev, sizeof(*rkisp1), GFP_KERNEL);
 	if (!rkisp1)
 		return -ENOMEM;
 
+	info = of_device_get_match_data(dev);
+	rkisp1->info = info;
+
 	dev_set_drvdata(dev, rkisp1);
 	rkisp1->dev = dev;
 
-- 
Regards,

Laurent Pinchart

