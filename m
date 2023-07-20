Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 23DC375A7F9
	for <lists+linux-media@lfdr.de>; Thu, 20 Jul 2023 09:41:39 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231584AbjGTHlh (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 20 Jul 2023 03:41:37 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60236 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229451AbjGTHlg (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 20 Jul 2023 03:41:36 -0400
Received: from mx1.tq-group.com (mx1.tq-group.com [93.104.207.81])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 893C12118
        for <linux-media@vger.kernel.org>; Thu, 20 Jul 2023 00:41:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=tq-group.com; i=@tq-group.com; q=dns/txt; s=key1;
  t=1689838894; x=1721374894;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=cXY/BLZfaDuNi5P3IqCRO4cP4HDGKE/2ag+TBekzt7g=;
  b=JzbW+i3D4pnDGHwv3Fsq+LRA6jDCy6igkEa/8fbzfgS4eMjvDZpifs78
   iWwkhm3cegXNDStEQ+zX6A81nPFGCyWU7NNGQmY400sHYWNuwCxygB9AE
   5wpu2jIBafWSeYh7r9UI3tcPdPxSkUCzxpUhZiVxryQ8tThKFdCUlrlN2
   +7H0LmGvEgDQnxdRlEXJ+Z63m7Wwe7EA+ZZ3BA0qt3sZA+CVM33EsttzW
   NPyIMvMampSGhL1Done97lsih+KR8mmohErqbcI66PCy0HcncKT+ZTyrh
   q51v8GYmFF2GQJVI3LTVVPg3mTorfxTQSHZwPzjSmT2/Ahsxlln2qhcWn
   w==;
X-IronPort-AV: E=Sophos;i="6.01,218,1684792800"; 
   d="scan'208";a="32025079"
Received: from vtuxmail01.tq-net.de ([10.115.0.20])
  by mx1.tq-group.com with ESMTP; 20 Jul 2023 09:41:32 +0200
Received: from steina-w.tq-net.de (unknown [10.123.53.21])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
        (No client certificate requested)
        by vtuxmail01.tq-net.de (Postfix) with ESMTPSA id 8C2FA280078;
        Thu, 20 Jul 2023 09:41:32 +0200 (CEST)
From:   Alexander Stein <alexander.stein@ew.tq-group.com>
To:     Rui Miguel Silva <rmfrfs@gmail.com>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Shawn Guo <shawnguo@kernel.org>,
        Sascha Hauer <s.hauer@pengutronix.de>,
        Fabio Estevam <festevam@gmail.com>,
        Tim Harvey <tharvey@gateworks.com>
Cc:     Alexander Stein <alexander.stein@ew.tq-group.com>,
        Pengutronix Kernel Team <kernel@pengutronix.de>,
        NXP Linux Team <linux-imx@nxp.com>,
        linux-media@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Subject: [PATCH 1/2] media: imx: imx7-media-csi: Move stepwise framesize into a dedicated struct
Date:   Thu, 20 Jul 2023 09:41:28 +0200
Message-Id: <20230720074129.3680269-1-alexander.stein@ew.tq-group.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.0 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_EF,RCVD_IN_DNSWL_BLOCKED,SPF_HELO_NONE,SPF_PASS,
        T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

This way these constraints can be reused later on.
No functional change intended.

Signed-off-by: Alexander Stein <alexander.stein@ew.tq-group.com>
---
 drivers/media/platform/nxp/imx7-media-csi.c | 26 ++++++++++++---------
 1 file changed, 15 insertions(+), 11 deletions(-)

diff --git a/drivers/media/platform/nxp/imx7-media-csi.c b/drivers/media/platform/nxp/imx7-media-csi.c
index 2f9302fc7570..73f8f2a35422 100644
--- a/drivers/media/platform/nxp/imx7-media-csi.c
+++ b/drivers/media/platform/nxp/imx7-media-csi.c
@@ -260,6 +260,20 @@ imx7_csi_notifier_to_dev(struct v4l2_async_notifier *n)
 	return container_of(n, struct imx7_csi, notifier);
 }
 
+/*
+ * TODO: The constraints are hardware-specific and may depend on the
+ * pixel format. This should come from the driver using
+ * imx_media_capture.
+ */
+static const struct v4l2_frmsize_stepwise imx7_csi_frmsize_stepwise = {
+	.min_width = 1,
+	.min_height = 1,
+	.max_width = 65535,
+	.max_height = 65535,
+	.step_width = 1,
+	.step_height = 1,
+};
+
 /* -----------------------------------------------------------------------------
  * Hardware Configuration
  */
@@ -1082,18 +1096,8 @@ static int imx7_csi_video_enum_framesizes(struct file *file, void *fh,
 	if (!cc)
 		return -EINVAL;
 
-	/*
-	 * TODO: The constraints are hardware-specific and may depend on the
-	 * pixel format. This should come from the driver using
-	 * imx_media_capture.
-	 */
 	fsize->type = V4L2_FRMSIZE_TYPE_CONTINUOUS;
-	fsize->stepwise.min_width = 1;
-	fsize->stepwise.max_width = 65535;
-	fsize->stepwise.min_height = 1;
-	fsize->stepwise.max_height = 65535;
-	fsize->stepwise.step_width = 1;
-	fsize->stepwise.step_height = 1;
+	fsize->stepwise = imx7_csi_frmsize_stepwise;
 
 	return 0;
 }
-- 
2.34.1

