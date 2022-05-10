Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id F28DF5214A3
	for <lists+linux-media@lfdr.de>; Tue, 10 May 2022 14:00:29 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S240820AbiEJMED (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 10 May 2022 08:04:03 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53082 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S241493AbiEJMEA (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 10 May 2022 08:04:00 -0400
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id F218B52E73
        for <linux-media@vger.kernel.org>; Tue, 10 May 2022 05:00:02 -0700 (PDT)
Received: from pendragon.lan (62-78-145-57.bb.dnainternet.fi [62.78.145.57])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 113A218C1;
        Tue, 10 May 2022 13:59:43 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1652183983;
        bh=1XqqnZEZEy88Ls146BNeFzkHY5yYmenhdQ/p58Z+TVs=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=NrwzaBKywbbjkKxbQPmzpt1pCRAOlsOJwk+vYurBGnhPzXWnt/kwsjclqK+5AwmKL
         HUrUBFH0IUhEUx1EnpLArS/qsZsVhV8N5ydqrR1mDKzbJVGCPWtEdH4PQHk/vdFL7J
         G+tJ/ks4l5oEtYm+t0YdTa85lRU5RUKb7UD6lDhU=
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
Subject: [PATCH 39/50] staging: media: imx: imx7-media-csi: Define macro for default mbus code
Date:   Tue, 10 May 2022 14:58:48 +0300
Message-Id: <20220510115859.19777-40-laurent.pinchart@ideasonboard.com>
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

Define a macro for the default media bus code and use it through the
driver to replace a hardcoded value and a dynamic query from the
pixel_formats table.

Signed-off-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
---
 drivers/staging/media/imx/imx7-media-csi.c | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/drivers/staging/media/imx/imx7-media-csi.c b/drivers/staging/media/imx/imx7-media-csi.c
index bcf57aff3572..f2e85e9851e4 100644
--- a/drivers/staging/media/imx/imx7-media-csi.c
+++ b/drivers/staging/media/imx/imx7-media-csi.c
@@ -167,6 +167,7 @@
 #define IMX7_CSI_VIDEO_MEM_LIMIT	SZ_64M
 #define IMX7_CSI_VIDEO_EOF_TIMEOUT	2000
 
+#define IMX7_CSI_DEF_MBUS_CODE		MEDIA_BUS_FMT_UYVY8_2X8
 #define IMX7_CSI_DEF_PIX_WIDTH		640
 #define IMX7_CSI_DEF_PIX_HEIGHT		480
 
@@ -1096,7 +1097,7 @@ static int imx7_csi_init_mbus_fmt(struct v4l2_mbus_framefmt *mbus,
 	mbus->field = field;
 
 	if (code == 0)
-		imx7_csi_enum_mbus_formats(&code, 0, IMX7_CSI_PIXFMT_SEL_YUV);
+		code = IMX7_CSI_DEF_MBUS_CODE;
 
 	lcc = imx7_csi_find_mbus_format(code, IMX7_CSI_PIXFMT_SEL_ANY);
 	if (!lcc)
@@ -1629,7 +1630,7 @@ static int imx7_csi_video_init_format(struct imx7_csi *csi)
 		.pad = IMX7_CSI_PAD_SRC,
 		.which = V4L2_SUBDEV_FORMAT_ACTIVE,
 	};
-	fmt_src.format.code = MEDIA_BUS_FMT_UYVY8_2X8;
+	fmt_src.format.code = IMX7_CSI_DEF_MBUS_CODE;
 	fmt_src.format.width = IMX7_CSI_DEF_PIX_WIDTH;
 	fmt_src.format.height = IMX7_CSI_DEF_PIX_HEIGHT;
 
-- 
Regards,

Laurent Pinchart

