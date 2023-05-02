Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 87A6E6F45C8
	for <lists+linux-media@lfdr.de>; Tue,  2 May 2023 16:09:24 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234145AbjEBOJX (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 2 May 2023 10:09:23 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:32868 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233614AbjEBOJH (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Tue, 2 May 2023 10:09:07 -0400
Received: from mx1.tq-group.com (mx1.tq-group.com [93.104.207.81])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 00E4A1BF0
        for <linux-media@vger.kernel.org>; Tue,  2 May 2023 07:09:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=tq-group.com; i=@tq-group.com; q=dns/txt; s=key1;
  t=1683036546; x=1714572546;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=Po284pkusD+oh26TkRbRThDBdVYfcNJXuLPkM5pnIbQ=;
  b=lXp7W5L5GjlM0mvj2Vf1PbTFM34mELRU45vZjeGjtKgvrQZmnydnsmhc
   dcgo+Q+vak2qXIRUA7mYRWndZLUL6MrOFypj+uIr+1sSq4E1vpES1/ktj
   nGPT9ceLu2cCD/biTneO4mFPQp6XUq3mJCzzcHar7HUSR4PRH6j9W7x9D
   Z87oFP+zbjFBprv7zkIdEjFcgUr7qrSAaYnffXbp9IBm7N/NWFUZuZ3ah
   KwMzB+WLHZ7oEsbdh4B9RXDEXr5vkM4USGX039siOWDabf6kdUOPB+fYE
   HqVNWC5OhY6dV+aZg37DTOfMZGZzvrLo3cedJcDmKmRM3VhQhicrqqv9X
   w==;
X-IronPort-AV: E=Sophos;i="5.99,244,1677538800"; 
   d="scan'208";a="30671759"
Received: from unknown (HELO tq-pgp-pr1.tq-net.de) ([192.168.6.15])
  by mx1-pgp.tq-group.com with ESMTP; 02 May 2023 16:09:04 +0200
Received: from mx1.tq-group.com ([192.168.6.7])
  by tq-pgp-pr1.tq-net.de (PGP Universal service);
  Tue, 02 May 2023 16:09:04 +0200
X-PGP-Universal: processed;
        by tq-pgp-pr1.tq-net.de on Tue, 02 May 2023 16:09:04 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=tq-group.com; i=@tq-group.com; q=dns/txt; s=key1;
  t=1683036544; x=1714572544;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=Po284pkusD+oh26TkRbRThDBdVYfcNJXuLPkM5pnIbQ=;
  b=RFeGnDP4JGZChE7tW5kzhNXyqsTOVV3k92MZYySGSdHER9ETTrU0Pklf
   RjlEhujqB1r6a2jv2Ej06vX8hxPT/9nyh6b74s7/5ShbP5Md1gapsvSwg
   1h52TnmC+qHhXVP+nsyaP6a7/u5yKqxTlXlKTI8JVONAbMExQbarqzuLe
   yfclzyMdzLiXLoJ9IoVRA4dwCXkQxudQQ0KZx4dCqb9a4p/KFjpzldQok
   I9lpcQV4LMQ9Sf6blhXVs4vU+aYwGPQfkSTtb0XLcb6nSiqCXQesOeCRw
   ltPpnHVk6XgMgFKIsm7HjoThW6I/+GLTmrZmCorFhfoP3HGUFq7+7MqlF
   w==;
X-IronPort-AV: E=Sophos;i="5.99,244,1677538800"; 
   d="scan'208";a="30671758"
Received: from vtuxmail01.tq-net.de ([10.115.0.20])
  by mx1.tq-group.com with ESMTP; 02 May 2023 16:09:04 +0200
Received: from steina-w.tq-net.de (unknown [10.123.53.21])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
        (No client certificate requested)
        by vtuxmail01.tq-net.de (Postfix) with ESMTPSA id 1DB3F280056;
        Tue,  2 May 2023 16:09:04 +0200 (CEST)
From:   Alexander Stein <alexander.stein@ew.tq-group.com>
To:     Steve Longerbeam <slongerbeam@gmail.com>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Shawn Guo <shawnguo@kernel.org>,
        Sascha Hauer <s.hauer@pengutronix.de>,
        Fabio Estevam <festevam@gmail.com>
Cc:     Alexander Stein <alexander.stein@ew.tq-group.com>,
        Pengutronix Kernel Team <kernel@pengutronix.de>,
        NXP Linux Team <linux-imx@nxp.com>,
        linux-media@vger.kernel.org, linux-staging@lists.linux.dev,
        linux-arm-kernel@lists.infradead.org
Subject: [PATCH 1/1] media: staging: media: imx6-mipi-csi2: Add log_status core callback
Date:   Tue,  2 May 2023 16:09:02 +0200
Message-Id: <20230502140902.2324813-1-alexander.stein@ew.tq-group.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.0 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

This prints all register values.

Signed-off-by: Alexander Stein <alexander.stein@ew.tq-group.com>
---
This might help when trying to figure if capturing does not work.

 drivers/staging/media/imx/imx6-mipi-csi2.c | 45 ++++++++++++++++++++++
 1 file changed, 45 insertions(+)

diff --git a/drivers/staging/media/imx/imx6-mipi-csi2.c b/drivers/staging/media/imx/imx6-mipi-csi2.c
index c07994ea6e96..ab565b4e29ec 100644
--- a/drivers/staging/media/imx/imx6-mipi-csi2.c
+++ b/drivers/staging/media/imx/imx6-mipi-csi2.c
@@ -12,6 +12,7 @@
 #include <linux/module.h>
 #include <linux/of_graph.h>
 #include <linux/platform_device.h>
+#include <media/v4l2-common.h>
 #include <media/v4l2-device.h>
 #include <media/v4l2-fwnode.h>
 #include <media/v4l2-mc.h>
@@ -564,6 +565,49 @@ static int csi2_registered(struct v4l2_subdev *sd)
 				      V4L2_FIELD_NONE, NULL);
 }
 
+/* --------------- CORE OPS --------------- */
+
+static int csi2_log_status(struct v4l2_subdev *sd)
+{
+	struct csi2_dev *csi2 = sd_to_dev(sd);
+
+	v4l2_info(sd, "-----MIPI CSI status-----\n");
+	v4l2_info(sd, "VERSION: 0x%x\n",
+		  readl(csi2->base + CSI2_VERSION));
+	v4l2_info(sd, "N_LANES: 0x%x\n",
+		  readl(csi2->base + CSI2_N_LANES));
+	v4l2_info(sd, "PHY_SHUTDOWNZ: 0x%x\n",
+		  readl(csi2->base + CSI2_PHY_SHUTDOWNZ));
+	v4l2_info(sd, "DPHY_RSTZ: 0x%x\n",
+		  readl(csi2->base + CSI2_DPHY_RSTZ));
+	v4l2_info(sd, "RESETN: 0x%x\n",
+		  readl(csi2->base + CSI2_RESETN));
+	v4l2_info(sd, "PHY_STATE: 0x%x\n",
+		  readl(csi2->base + CSI2_PHY_STATE));
+	v4l2_info(sd, "DATA_IDS_1: 0x%x\n",
+		  readl(csi2->base + CSI2_DATA_IDS_1));
+	v4l2_info(sd, "DATA_IDS_2: 0x%x\n",
+		  readl(csi2->base + CSI2_DATA_IDS_2));
+	v4l2_info(sd, "ERR1: 0x%x\n",
+		  readl(csi2->base + CSI2_ERR1));
+	v4l2_info(sd, "ERR2: 0x%x\n",
+		  readl(csi2->base + CSI2_ERR2));
+	v4l2_info(sd, "MSK1: 0x%x\n",
+		  readl(csi2->base + CSI2_MSK1));
+	v4l2_info(sd, "MSK2: 0x%x\n",
+		  readl(csi2->base + CSI2_MSK2));
+	v4l2_info(sd, "PHY_TST_CTRL0: 0x%x\n",
+		  readl(csi2->base + CSI2_PHY_TST_CTRL0));
+	v4l2_info(sd, "PHY_TST_CTRL1: 0x%x\n",
+		  readl(csi2->base + CSI2_PHY_TST_CTRL1));
+
+	return 0;
+}
+
+static const struct v4l2_subdev_core_ops csi2_core_ops = {
+	.log_status = csi2_log_status,
+};
+
 static const struct media_entity_operations csi2_entity_ops = {
 	.link_setup = csi2_link_setup,
 	.link_validate = v4l2_subdev_link_validate,
@@ -581,6 +625,7 @@ static const struct v4l2_subdev_pad_ops csi2_pad_ops = {
 };
 
 static const struct v4l2_subdev_ops csi2_subdev_ops = {
+	.core = &csi2_core_ops,
 	.video = &csi2_video_ops,
 	.pad = &csi2_pad_ops,
 };
-- 
2.34.1

