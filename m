Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 2FBB779EA34
	for <lists+linux-media@lfdr.de>; Wed, 13 Sep 2023 15:56:40 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S241142AbjIMN4m (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 13 Sep 2023 09:56:42 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41576 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S241148AbjIMN4l (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 13 Sep 2023 09:56:41 -0400
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3EEC519BF
        for <linux-media@vger.kernel.org>; Wed, 13 Sep 2023 06:56:37 -0700 (PDT)
Received: from pendragon.ideasonboard.com (213-243-189-158.bb.dnainternet.fi [213.243.189.158])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 35B722CC7;
        Wed, 13 Sep 2023 15:55:04 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1694613304;
        bh=mmORNoXWgM3QStbGQ8t2NcPQtTANZ8qSjmsMGeC33OU=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=tK4nfxUc2ZpRV9pgfSoZkkQNzDYAC1xgFPbFd70i55Czredptdrq56EZmrh30LLHx
         txSV1zQgUk6BWxRe3CtklKpPlLju1GLmLXJDOlv89OMv5DFbOcpcclPNxSc3NHZ171
         xrIHoMO+CCvFkYsQuPWDcJMmx8KLFVgiY4LEV50A=
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     linux-media@vger.kernel.org
Cc:     Sakari Ailus <sakari.ailus@iki.fi>,
        Dave Stevenson <dave.stevenson@raspberrypi.com>,
        Jacopo Mondi <jacopo.mondi@ideasonboard.com>,
        Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>,
        Hans de Goede <hdegoede@redhat.com>
Subject: [PATCH v3 08/20] media: i2c: imx219: Initialize ycbcr_enc
Date:   Wed, 13 Sep 2023 16:56:26 +0300
Message-ID: <20230913135638.26277-9-laurent.pinchart@ideasonboard.com>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20230913135638.26277-1-laurent.pinchart@ideasonboard.com>
References: <20230913135638.26277-1-laurent.pinchart@ideasonboard.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

While the ycbcr_enc field doesn't apply to raw formats, leaving it
uninitialized makes the driver behave in a less deterministic way. Fix
it by picking the default value for the colorspace.

Signed-off-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Reviewed-by: Dave Stevenson <dave.stevenson@raspberrypi.com>
---
Changes since v1:

- Use V4L2_YCBCR_ENC_601
---
 drivers/media/i2c/imx219.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/media/i2c/imx219.c b/drivers/media/i2c/imx219.c
index f8575d47a375..f53812ad4560 100644
--- a/drivers/media/i2c/imx219.c
+++ b/drivers/media/i2c/imx219.c
@@ -498,6 +498,7 @@ static void imx219_update_pad_format(struct imx219 *imx219,
 	fmt->height = mode->height;
 	fmt->field = V4L2_FIELD_NONE;
 	fmt->colorspace = V4L2_COLORSPACE_RAW;
+	fmt->ycbcr_enc = V4L2_YCBCR_ENC_601;
 	fmt->quantization = V4L2_QUANTIZATION_FULL_RANGE;
 	fmt->xfer_func = V4L2_XFER_FUNC_NONE;
 }
-- 
Regards,

Laurent Pinchart

