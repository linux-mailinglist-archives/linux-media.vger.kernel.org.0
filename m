Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 3036A7835BE
	for <lists+linux-media@lfdr.de>; Tue, 22 Aug 2023 00:30:21 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231564AbjHUWaV (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 21 Aug 2023 18:30:21 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34548 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231546AbjHUWaV (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 21 Aug 2023 18:30:21 -0400
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A633A18B
        for <linux-media@vger.kernel.org>; Mon, 21 Aug 2023 15:30:15 -0700 (PDT)
Received: from pendragon.ideasonboard.com (213-243-189-158.bb.dnainternet.fi [213.243.189.158])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 87F0F87FA;
        Tue, 22 Aug 2023 00:28:48 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1692656928;
        bh=XIdxGoEpKhi5pL3s4SavjagXts4HNfhv5X0/sYKjzPM=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=TiiJIbegGwLQesp9bUOwtRHD39W2UXhdjPSMAOQiyoSTqqNitpMTnLTH7lzWcbiaE
         fB0plD9AF0bklM0/HDqk+D/3/JtFcwKB/fTIQq4HD4lM9n8uc6A6lHiLTqL6NDW0fl
         fGRj5RgVw6AWJ7tqdrXsHIvTtlIeTVd3oDFqNmmA=
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     linux-media@vger.kernel.org
Cc:     Sakari Ailus <sakari.ailus@iki.fi>,
        Dave Stevenson <dave.stevenson@raspberrypi.com>,
        Jacopo Mondi <jacopo.mondi@ideasonboard.com>,
        Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>,
        Hans de Goede <hdegoede@redhat.com>
Subject: [PATCH v2 07/18] media: i2c: imx219: Initialize ycbcr_enc
Date:   Tue, 22 Aug 2023 01:29:50 +0300
Message-ID: <20230821223001.28480-8-laurent.pinchart@ideasonboard.com>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20230821223001.28480-1-laurent.pinchart@ideasonboard.com>
References: <20230821223001.28480-1-laurent.pinchart@ideasonboard.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_BLOCKED,
        SPF_HELO_PASS,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

While the ycbcr_enc field doesn't apply to raw formats, leaving it
uninitialized makes the driver behave in a less deterministic way. Fix
it by picking the default value for the colorspace.

Signed-off-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
---
Changes since v1:

- Use V4L2_YCBCR_ENC_601
---
 drivers/media/i2c/imx219.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/media/i2c/imx219.c b/drivers/media/i2c/imx219.c
index 3a0b082d9ee0..16776a3ae84d 100644
--- a/drivers/media/i2c/imx219.c
+++ b/drivers/media/i2c/imx219.c
@@ -499,6 +499,7 @@ static void imx219_update_pad_format(struct imx219 *imx219,
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

