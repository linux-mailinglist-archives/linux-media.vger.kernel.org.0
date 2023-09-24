Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 264F17ACA87
	for <lists+linux-media@lfdr.de>; Sun, 24 Sep 2023 17:33:14 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229910AbjIXPdS (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sun, 24 Sep 2023 11:33:18 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42538 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229993AbjIXPdR (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Sun, 24 Sep 2023 11:33:17 -0400
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [IPv6:2001:4b98:dc2:55:216:3eff:fef7:d647])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A0DA2CF
        for <linux-media@vger.kernel.org>; Sun, 24 Sep 2023 08:33:11 -0700 (PDT)
Received: from pendragon.ideasonboard.com (213-243-189-158.bb.dnainternet.fi [213.243.189.158])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 1FAAF3364;
        Sun, 24 Sep 2023 17:31:29 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1695569489;
        bh=OsYjfUlR5pRvNliLT2/in2xZuztw55Sws642itRQWnE=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=brEHWPvdGeS6qUnt1J7z6LQEIQRDyWuvRPmw8jaTP49AlqMhy0CDEulKjAY92+34E
         pQzoFwVgKF3ow7db5773xZP/tJaY5xy7rToriZt4fRw+OY00tBjCl3TAL2iQJ5KYGt
         Dl3cJORh6tW3hQ7WrOp0QROVzHHr6Ts7kgz+v95o=
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     linux-media@vger.kernel.org
Cc:     Sakari Ailus <sakari.ailus@iki.fi>,
        Dave Stevenson <dave.stevenson@raspberrypi.com>,
        Jacopo Mondi <jacopo.mondi@ideasonboard.com>,
        Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>,
        Hans de Goede <hdegoede@redhat.com>
Subject: [PATCH v4 08/20] media: i2c: imx219: Initialize ycbcr_enc
Date:   Sun, 24 Sep 2023 18:32:57 +0300
Message-ID: <20230924153309.12423-9-laurent.pinchart@ideasonboard.com>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20230924153309.12423-1-laurent.pinchart@ideasonboard.com>
References: <20230924153309.12423-1-laurent.pinchart@ideasonboard.com>
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
index 140924445a61..2e1fbeef11a8 100644
--- a/drivers/media/i2c/imx219.c
+++ b/drivers/media/i2c/imx219.c
@@ -495,6 +495,7 @@ static void imx219_update_pad_format(struct imx219 *imx219,
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

