Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 15C7C67FC63
	for <lists+linux-media@lfdr.de>; Sun, 29 Jan 2023 03:34:52 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233982AbjA2Ceu (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sat, 28 Jan 2023 21:34:50 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59908 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233952AbjA2Ceq (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Sat, 28 Jan 2023 21:34:46 -0500
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [IPv6:2001:4b98:dc2:55:216:3eff:fef7:d647])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8BB2F23339
        for <linux-media@vger.kernel.org>; Sat, 28 Jan 2023 18:34:45 -0800 (PST)
Received: from pendragon.ideasonboard.com (213-243-189-158.bb.dnainternet.fi [213.243.189.158])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 068C2327;
        Sun, 29 Jan 2023 03:34:43 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1674959684;
        bh=FAl/jCMRZUkPmLGBZdKzLljzgRIsxehGtNBJTqOM80c=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=MU/pNIYEpeqsf8OMtpeYcG2ZTAwl6d2+YHv7QiEeDq4kp0VGdUwRhvpm6KtB/3O1i
         aw5l56nmHnOSX1wRvX/c/PRtF75rKAv8FJtuD7s/RzmFJ3BfLTuRSO2QK8VFeqlCSZ
         TW1v8n6nOInxFUr39hAJpEMo0Mp/NGkD+7gVQUWg=
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     linux-media@vger.kernel.org
Cc:     Adam Ford <aford173@gmail.com>,
        Martin Kepplinger <martin.kepplinger@puri.sm>,
        Paul Elder <paul.elder@ideasonboard.com>,
        Rui Miguel Silva <rmfrfs@gmail.com>, kernel@pengutronix.de,
        linux-imx@nxp.com
Subject: [PATCH v2 7/8] media: imx: imx7-media-csi: Zero format struct before calling .get_fmt()
Date:   Sun, 29 Jan 2023 04:34:28 +0200
Message-Id: <20230129023429.22467-8-laurent.pinchart@ideasonboard.com>
X-Mailer: git-send-email 2.39.1
In-Reply-To: <20230129023429.22467-1-laurent.pinchart@ideasonboard.com>
References: <20230129023429.22467-1-laurent.pinchart@ideasonboard.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_PASS,SPF_PASS
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

The v4l2_subdev_format structure passed to the .get_fmt() subdev
operation in imx7_csi_video_validate_fmt() isn't zeroed, which can cause
undefined behaviour. Fix it.

Signed-off-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
---
 drivers/media/platform/nxp/imx7-media-csi.c | 7 ++++---
 1 file changed, 4 insertions(+), 3 deletions(-)

diff --git a/drivers/media/platform/nxp/imx7-media-csi.c b/drivers/media/platform/nxp/imx7-media-csi.c
index 733e44700ff9..943e541768bd 100644
--- a/drivers/media/platform/nxp/imx7-media-csi.c
+++ b/drivers/media/platform/nxp/imx7-media-csi.c
@@ -1412,13 +1412,14 @@ static void imx7_csi_video_buf_queue(struct vb2_buffer *vb)
 
 static int imx7_csi_video_validate_fmt(struct imx7_csi *csi)
 {
-	struct v4l2_subdev_format fmt_src;
+	struct v4l2_subdev_format fmt_src = {
+		.pad = IMX7_CSI_PAD_SRC,
+		.which = V4L2_SUBDEV_FORMAT_ACTIVE,
+	};
 	const struct imx7_csi_pixfmt *cc;
 	int ret;
 
 	/* Retrieve the media bus format on the source subdev. */
-	fmt_src.pad = IMX7_CSI_PAD_SRC;
-	fmt_src.which = V4L2_SUBDEV_FORMAT_ACTIVE;
 	ret = v4l2_subdev_call(&csi->sd, pad, get_fmt, NULL, &fmt_src);
 	if (ret)
 		return ret;
-- 
Regards,

Laurent Pinchart

