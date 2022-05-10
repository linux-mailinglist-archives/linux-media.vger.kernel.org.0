Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id C32AC521498
	for <lists+linux-media@lfdr.de>; Tue, 10 May 2022 14:00:25 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S241476AbiEJMDs (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 10 May 2022 08:03:48 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52244 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S241470AbiEJMDs (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 10 May 2022 08:03:48 -0400
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [IPv6:2001:4b98:dc2:55:216:3eff:fef7:d647])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id DA43E54685
        for <linux-media@vger.kernel.org>; Tue, 10 May 2022 04:59:50 -0700 (PDT)
Received: from pendragon.lan (62-78-145-57.bb.dnainternet.fi [62.78.145.57])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 5DAF4E0C;
        Tue, 10 May 2022 13:59:36 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1652183977;
        bh=H0UZuPYvqIKi1smJ8Qfmjedgtg9V7e3LUJmJMM+87hQ=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=J7EOm4zh3ZfbthdkMlrxtQ48/G1BjkmHWv3CDqyTvhwRqOXwPmiriERlrLaTb5PfU
         LT9gkFqchrUUdNSx0pvfiX8Ds2sKyOkVpwpvb0fN+Bf5gJELwkwL2qkpCeLRqS+Dlf
         Fz+1uSlKwyrJzTd+bV5cUlZ+cC6OGzk4gK7t+/6A=
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     linux-media@vger.kernel.org
Cc:     Rui Miguel Silva <rmfrfs@gmail.com>,
        Steve Longerbeam <slongerbeam@gmail.com>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        Jacopo Mondi <jacopo@jmondi.org>,
        Martin Kepplinger <martin.kepplinger@puri.sm>,
        Alexander Stein <alexander.stein@ew.tq-group.com>,
        Dorota Czaplejewicz <dorota.czaplejewicz@puri.sm>,
        kernel@pengutronix.de
Subject: [PATCH 31/50] staging: media: imx: imx7-media-csi: Decouple from shared macros
Date:   Tue, 10 May 2022 14:58:40 +0300
Message-Id: <20220510115859.19777-32-laurent.pinchart@ideasonboard.com>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220510115859.19777-1-laurent.pinchart@ideasonboard.com>
References: <20220510115859.19777-1-laurent.pinchart@ideasonboard.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_PASS,SPF_PASS,
        T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED autolearn=ham autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Decouple from the IMX7_CSI_VIDEO_DEF_PIX_WIDTH,
IMX7_CSI_VIDEO_DEF_PIX_HEIGHT and IMX_MEDIA_EOF_TIMEOUT macros defined
in shared helpers by duplicating them in the imx7-media-csi driver, with
a rename to avoid name clashes. No functional change intended.

Signed-off-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
---
 drivers/staging/media/imx/imx7-media-csi.c | 9 ++++++---
 1 file changed, 6 insertions(+), 3 deletions(-)

diff --git a/drivers/staging/media/imx/imx7-media-csi.c b/drivers/staging/media/imx/imx7-media-csi.c
index 05907d6257a8..2106a72ebe85 100644
--- a/drivers/staging/media/imx/imx7-media-csi.c
+++ b/drivers/staging/media/imx/imx7-media-csi.c
@@ -165,6 +165,9 @@
 #define IMX7_CSI_VIDEO_NAME		"imx-capture"
 /* In bytes, per queue */
 #define IMX7_CSI_VIDEO_MEM_LIMIT	SZ_64M
+#define IMX7_CSI_VIDEO_DEF_PIX_WIDTH	640
+#define IMX7_CSI_VIDEO_DEF_PIX_HEIGHT	480
+#define IMX7_CSI_VIDEO_EOF_TIMEOUT	2000
 
 enum imx_csi_model {
 	IMX7_CSI_IMX7 = 0,
@@ -488,7 +491,7 @@ static void imx7_csi_dma_stop(struct imx7_csi *csi)
 	/*
 	 * and then wait for interrupt handler to mark completion.
 	 */
-	timeout_jiffies = msecs_to_jiffies(IMX_MEDIA_EOF_TIMEOUT);
+	timeout_jiffies = msecs_to_jiffies(IMX7_CSI_VIDEO_EOF_TIMEOUT);
 	ret = wait_for_completion_timeout(&csi->last_eof_completion,
 					  timeout_jiffies);
 	if (ret == 0)
@@ -1275,8 +1278,8 @@ static int imx7_csi_video_init_format(struct imx7_csi *csi)
 		.which = V4L2_SUBDEV_FORMAT_ACTIVE,
 	};
 	fmt_src.format.code = MEDIA_BUS_FMT_UYVY8_2X8;
-	fmt_src.format.width = IMX_MEDIA_DEF_PIX_WIDTH;
-	fmt_src.format.height = IMX_MEDIA_DEF_PIX_HEIGHT;
+	fmt_src.format.width = IMX7_CSI_VIDEO_DEF_PIX_WIDTH;
+	fmt_src.format.height = IMX7_CSI_VIDEO_DEF_PIX_HEIGHT;
 
 	imx_media_mbus_fmt_to_pix_fmt(&csi->vdev_fmt, &fmt_src.format, NULL);
 	csi->vdev_compose.width = fmt_src.format.width;
-- 
Regards,

Laurent Pinchart

