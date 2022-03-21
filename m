Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id D9B594E2C49
	for <lists+linux-media@lfdr.de>; Mon, 21 Mar 2022 16:30:46 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1350260AbiCUPcK (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 21 Mar 2022 11:32:10 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58670 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1348931AbiCUPcJ (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 21 Mar 2022 11:32:09 -0400
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [IPv6:2001:4b98:dc2:55:216:3eff:fef7:d647])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6E05126AF3
        for <linux-media@vger.kernel.org>; Mon, 21 Mar 2022 08:30:42 -0700 (PDT)
Received: from pendragon.lan (62-78-145-57.bb.dnainternet.fi [62.78.145.57])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id B529B291;
        Mon, 21 Mar 2022 16:30:40 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1647876641;
        bh=66H0wD98K23FIS1xSooO9uv7AuqPr2YjLe3EJxXu53o=;
        h=From:To:Cc:Subject:Date:From;
        b=pPFZoGsvshpVFpwt2cGSaBFaWRMEiyGcdulCHHmlHZQfJcmR8igFoawg34MQHg6ir
         OdVNX3449pfTl/yVjSMwhz3te7VDwZUkJI8QTKj2pB7XA/o8n1n/FU7smHqM2S/tky
         6jPiWRHZD7GpCOa30SZwyLIwVndCrrk0DRJSPszQ=
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     linux-media@vger.kernel.org
Cc:     Jacopo Mondi <jacopo@jmondi.org>,
        Rui Miguel Silva <rmfrfs@gmail.com>, kernel@pengutronix.de,
        linux-imx@nxp.com
Subject: [PATCH] media: imx: imx-mipi-csis: Fix active format initialization on source pad
Date:   Mon, 21 Mar 2022 17:30:20 +0200
Message-Id: <20220321153020.29965-1-laurent.pinchart@ideasonboard.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_PASS,SPF_PASS,
        T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Commit 52f69bc5f8c0 ("media: imx: csis: Store pads format separately")
broke initialization of the active format on the source pad, as it
forgot to update the .init_cfg() handler. Fix it.

Fixes: 52f69bc5f8c0 ("media: imx: csis: Store pads format separately")
Signed-off-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
---
 drivers/media/platform/imx/imx-mipi-csis.c | 8 --------
 1 file changed, 8 deletions(-)

diff --git a/drivers/media/platform/imx/imx-mipi-csis.c b/drivers/media/platform/imx/imx-mipi-csis.c
index 6d03d89fb5d8..9da105d37987 100644
--- a/drivers/media/platform/imx/imx-mipi-csis.c
+++ b/drivers/media/platform/imx/imx-mipi-csis.c
@@ -1014,14 +1014,6 @@ static int mipi_csis_init_cfg(struct v4l2_subdev *sd,
 		V4L2_MAP_QUANTIZATION_DEFAULT(false, fmt_sink->colorspace,
 					      fmt_sink->ycbcr_enc);
 
-	/*
-	 * When called from mipi_csis_subdev_init() to initialize the active
-	 * configuration, cfg is NULL, which indicates there's no source pad
-	 * configuration to set.
-	 */
-	if (!sd_state)
-		return 0;
-
 	fmt_source = mipi_csis_get_format(csis, sd_state, which,
 					  CSIS_PAD_SOURCE);
 	*fmt_source = *fmt_sink;
-- 
Regards,

Laurent Pinchart

