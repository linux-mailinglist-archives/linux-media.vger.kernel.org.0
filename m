Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 983AA5214A6
	for <lists+linux-media@lfdr.de>; Tue, 10 May 2022 14:00:31 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S241511AbiEJMEK (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 10 May 2022 08:04:10 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53826 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S241501AbiEJMEJ (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 10 May 2022 08:04:09 -0400
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4C80352E73
        for <linux-media@vger.kernel.org>; Tue, 10 May 2022 05:00:12 -0700 (PDT)
Received: from pendragon.lan (62-78-145-57.bb.dnainternet.fi [62.78.145.57])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id E493C21CD;
        Tue, 10 May 2022 13:59:48 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1652183989;
        bh=8RjlLCLqB3e6bnEKhzH3wSIoisKEZ2LtKIghyJR8FuI=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=BFG09sYFsxxRj5SMMS5H5KQbolIXa/AOoH5ZZOjflmotdNmmUyh89xGBJYMgoVjhI
         bLaBpbfxksE1yQ6Qm4iCRDBLp+JEklSCADWKklUyudP5eaEQUTq3VUPEvVUfTRjSVK
         xlzEh60XIvMLeV0Ca2asdQCp6dWGcAq7BI11hg/c=
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
Subject: [PATCH 46/50] staging: media: imx: imx7-media-csi: Add V4L2_PIX_FMT_Y14 support
Date:   Tue, 10 May 2022 14:58:55 +0300
Message-Id: <20220510115859.19777-47-laurent.pinchart@ideasonboard.com>
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

The device supports 14-bit greyscale formats the same way it supports
14-bit Bayer formats.

Signed-off-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
---
 drivers/staging/media/imx/imx7-media-csi.c | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/drivers/staging/media/imx/imx7-media-csi.c b/drivers/staging/media/imx/imx7-media-csi.c
index 1bb60f245861..4d8e3c0a3633 100644
--- a/drivers/staging/media/imx/imx7-media-csi.c
+++ b/drivers/staging/media/imx/imx7-media-csi.c
@@ -905,6 +905,10 @@ static const struct imx7_csi_pixfmt pixel_formats[] = {
 		.fourcc = V4L2_PIX_FMT_Y12,
 		.codes  = IMX_BUS_FMTS(MEDIA_BUS_FMT_Y12_1X12),
 		.bpp    = 16,
+	}, {
+		.fourcc = V4L2_PIX_FMT_Y14,
+		.codes  = IMX_BUS_FMTS(MEDIA_BUS_FMT_Y14_1X14),
+		.bpp    = 16,
 	},
 };
 
@@ -2019,6 +2023,7 @@ static int imx7_csi_pad_link_validate(struct v4l2_subdev *sd,
 	case V4L2_PIX_FMT_GREY:
 	case V4L2_PIX_FMT_Y10:
 	case V4L2_PIX_FMT_Y12:
+	case V4L2_PIX_FMT_Y14:
 	case V4L2_PIX_FMT_SBGGR8:
 	case V4L2_PIX_FMT_SGBRG8:
 	case V4L2_PIX_FMT_SGRBG8:
-- 
Regards,

Laurent Pinchart

