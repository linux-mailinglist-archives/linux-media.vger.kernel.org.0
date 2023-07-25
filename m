Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 791417622E7
	for <lists+linux-media@lfdr.de>; Tue, 25 Jul 2023 22:02:49 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229597AbjGYUCs (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 25 Jul 2023 16:02:48 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47806 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230508AbjGYUCr (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 25 Jul 2023 16:02:47 -0400
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [IPv6:2001:4b98:dc2:55:216:3eff:fef7:d647])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 168FC13D
        for <linux-media@vger.kernel.org>; Tue, 25 Jul 2023 13:02:46 -0700 (PDT)
Received: from pendragon.ideasonboard.com (213-243-189-158.bb.dnainternet.fi [213.243.189.158])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 08EB5B2A;
        Tue, 25 Jul 2023 22:01:45 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1690315306;
        bh=0xD/IiUiKKZFNx98xrewDB0XkuY51YZ3Wer4Moc0QhM=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=Q4p0x5YVRoAchSaXmC+MWVoV7tynIveROyeEbh+N1OoHE4E29fa9o/cLjAvz4tiHZ
         AM5vzJeAdA/+U1K0sgvbAm5mD+7DECUHAsxp6xMBpL01feGFK2lMjJ3peLsol/h6xd
         KYJlI5sI7mrrtg/NSGIF+EzDBn1stPOswNjK4WsY=
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     linux-media@vger.kernel.org
Cc:     Rui Miguel Silva <rmfrfs@gmail.com>,
        Alexander Stein <alexander.stein@ew.tq-group.com>,
        Tim Harvey <tharvey@gateworks.com>,
        Fabio Estevam <festevam@denx.de>,
        NXP Linux Team <linux-imx@nxp.com>,
        Pengutronix Kernel Team <kernel@pengutronix.de>,
        Martin Kepplinger <martink@posteo.de>,
        Purism Kernel Team <kernel@puri.sm>
Subject: [PATCH v3 2/3] media: imx: imx7-media-csi: Fix frame sizes enumeration
Date:   Tue, 25 Jul 2023 23:02:48 +0300
Message-Id: <20230725200249.15447-3-laurent.pinchart@ideasonboard.com>
X-Mailer: git-send-email 2.39.3
In-Reply-To: <20230725200249.15447-1-laurent.pinchart@ideasonboard.com>
References: <20230725200249.15447-1-laurent.pinchart@ideasonboard.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_BLOCKED,
        SPF_HELO_PASS,SPF_PASS,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Enumeration of the minimum, maximum and step values for the image width
does not take hardware constraints into account. Fix it.

Signed-off-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
---
 drivers/media/platform/nxp/imx7-media-csi.c | 14 ++++++++------
 1 file changed, 8 insertions(+), 6 deletions(-)

diff --git a/drivers/media/platform/nxp/imx7-media-csi.c b/drivers/media/platform/nxp/imx7-media-csi.c
index 5684ecd2e3fe..3aa7978d3f8a 100644
--- a/drivers/media/platform/nxp/imx7-media-csi.c
+++ b/drivers/media/platform/nxp/imx7-media-csi.c
@@ -1076,6 +1076,7 @@ static int imx7_csi_video_enum_framesizes(struct file *file, void *fh,
 					  struct v4l2_frmsizeenum *fsize)
 {
 	const struct imx7_csi_pixfmt *cc;
+	u32 walign;
 
 	if (fsize->index > 0)
 		return -EINVAL;
@@ -1085,16 +1086,17 @@ static int imx7_csi_video_enum_framesizes(struct file *file, void *fh,
 		return -EINVAL;
 
 	/*
-	 * TODO: The constraints are hardware-specific and may depend on the
-	 * pixel format. This should come from the driver using
-	 * imx_media_capture.
+	 * The width alignment is 8 bytes as indicated by the
+	 * CSI_IMAG_PARA.IMAGE_WIDTH documentation. Convert it to pixels.
 	 */
+	walign = 8 * 8 / cc->bpp;
+
 	fsize->type = V4L2_FRMSIZE_TYPE_CONTINUOUS;
-	fsize->stepwise.min_width = 1;
-	fsize->stepwise.max_width = 65535;
+	fsize->stepwise.min_width = walign;
+	fsize->stepwise.max_width = round_down(65535U, walign);
 	fsize->stepwise.min_height = 1;
 	fsize->stepwise.max_height = 65535;
-	fsize->stepwise.step_width = 1;
+	fsize->stepwise.step_width = walign;
 	fsize->stepwise.step_height = 1;
 
 	return 0;
-- 
Regards,

Laurent Pinchart

