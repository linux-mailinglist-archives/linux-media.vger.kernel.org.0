Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 72A706E6117
	for <lists+linux-media@lfdr.de>; Tue, 18 Apr 2023 14:20:54 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231153AbjDRMUv (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 18 Apr 2023 08:20:51 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57854 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230483AbjDRMUt (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 18 Apr 2023 08:20:49 -0400
Received: from mx1.tq-group.com (mx1.tq-group.com [93.104.207.81])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 46CCC10E2
        for <linux-media@vger.kernel.org>; Tue, 18 Apr 2023 05:20:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=tq-group.com; i=@tq-group.com; q=dns/txt; s=key1;
  t=1681820448; x=1713356448;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=Tu7ZRmsYDcYoNQeM8pRuPA+VuhlatpH/tZGgviYR1zA=;
  b=MkfhMtckomYNZxmYr1Jfj6XgJpPEE1K1S6s44zV4peydzqHwipCZo68T
   A72cX8xZ50Qk4BHErv0a2PSfgRAPUzeCYMj7yugCQp53B5UhArNg7QaPn
   U0nMjngyCXnLDEYCaDBG0do7Gl/yhHcMEKQjxepITjCpK58r3krEkGIgm
   lM+PfuaiXNtP3qcEkYkRWOxMjnXS681+r5Dzn47uxxg0WUhe7H5rtv+h3
   flLaFJBs0J9PB2vzXNDBneuQhgqZ/yQDn715YY7vp9G1IG7+gLH00G6sR
   H2cfKfjKPcks6sUDjvcuaYxoE0NeGHue/rcN/sqin3dZKnEYVN9K3Vo1N
   g==;
X-IronPort-AV: E=Sophos;i="5.99,207,1677538800"; 
   d="scan'208";a="30398477"
Received: from unknown (HELO tq-pgp-pr1.tq-net.de) ([192.168.6.15])
  by mx1-pgp.tq-group.com with ESMTP; 18 Apr 2023 14:20:45 +0200
Received: from mx1.tq-group.com ([192.168.6.7])
  by tq-pgp-pr1.tq-net.de (PGP Universal service);
  Tue, 18 Apr 2023 14:20:45 +0200
X-PGP-Universal: processed;
        by tq-pgp-pr1.tq-net.de on Tue, 18 Apr 2023 14:20:45 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=tq-group.com; i=@tq-group.com; q=dns/txt; s=key1;
  t=1681820445; x=1713356445;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=Tu7ZRmsYDcYoNQeM8pRuPA+VuhlatpH/tZGgviYR1zA=;
  b=IXoxCfA2b0/TZtgl8SG47HIp3p1r3sf3W7gDPBrEFOKwcazslzyPmvK8
   hSXqi4nZgPoUEoDJlQZujNWdlUx7MbjxZFqiuxV5k1UGfup6/iBDsaItl
   Z2N8rCwqD+oLlnI8LqhmfNrEfdTtuyTKC26b5kfzBso4peFerPApeRirz
   0XOFX2ZT3uZl2PAENjmOGE+RDo4kfRHDk9hbv48t8RqetEf17bzjsioFv
   MQX9Q65y08ikeJY/2ZKUGPXptB1JSdrOhd2hZ6Nvefa6CHOqQFh7Cdq79
   8V3fUFBaon8bHDo1EoLPf7x1YfRwshAJN5G6DUuBKXC0ynRW49oE/ba45
   A==;
X-IronPort-AV: E=Sophos;i="5.99,207,1677538800"; 
   d="scan'208";a="30398474"
Received: from vtuxmail01.tq-net.de ([10.115.0.20])
  by mx1.tq-group.com with ESMTP; 18 Apr 2023 14:20:45 +0200
Received: from steina-w.tq-net.de (unknown [10.123.53.21])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
        (No client certificate requested)
        by vtuxmail01.tq-net.de (Postfix) with ESMTPSA id 9D1D8280074;
        Tue, 18 Apr 2023 14:20:44 +0200 (CEST)
From:   Alexander Stein <alexander.stein@ew.tq-group.com>
To:     Rui Miguel Silva <rmfrfs@gmail.com>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Shawn Guo <shawnguo@kernel.org>,
        Sascha Hauer <s.hauer@pengutronix.de>,
        Fabio Estevam <festevam@gmail.com>
Cc:     Alexander Stein <alexander.stein@ew.tq-group.com>,
        Pengutronix Kernel Team <kernel@pengutronix.de>,
        NXP Linux Team <linux-imx@nxp.com>,
        linux-media@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Subject: [PATCH v3 3/4] media: imx: imx7-media-csi: Lift width constraints for 8bpp formats
Date:   Tue, 18 Apr 2023 14:20:40 +0200
Message-Id: <20230418122041.1318862-4-alexander.stein@ew.tq-group.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230418122041.1318862-1-alexander.stein@ew.tq-group.com>
References: <20230418122041.1318862-1-alexander.stein@ew.tq-group.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.0 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE,
        URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

For 8-bit formats the image_width just needs to be a multiple of 8 pixels
others just a multiple of 4 pixels.

Signed-off-by: Alexander Stein <alexander.stein@ew.tq-group.com>
---
Changes in v3:
* Fix commit message (Only 8-bit formats needs multiple of 8 pixels)

 drivers/media/platform/nxp/imx7-media-csi.c | 9 ++++++++-
 1 file changed, 8 insertions(+), 1 deletion(-)

diff --git a/drivers/media/platform/nxp/imx7-media-csi.c b/drivers/media/platform/nxp/imx7-media-csi.c
index 1315f5743b76f..730c9c57bf4bc 100644
--- a/drivers/media/platform/nxp/imx7-media-csi.c
+++ b/drivers/media/platform/nxp/imx7-media-csi.c
@@ -1146,6 +1146,7 @@ __imx7_csi_video_try_fmt(struct v4l2_pix_format *pixfmt,
 			 struct v4l2_rect *compose)
 {
 	const struct imx7_csi_pixfmt *cc;
+	u32 walign;
 
 	if (compose) {
 		compose->width = pixfmt->width;
@@ -1162,13 +1163,19 @@ __imx7_csi_video_try_fmt(struct v4l2_pix_format *pixfmt,
 		cc = imx7_csi_find_pixel_format(pixfmt->pixelformat);
 	}
 
+	/* Refer to CSI_IMAG_PARA.IMAGE_WIDTH description */
+	if (cc->bpp == 8)
+		walign = 8;
+	else
+		walign = 4;
+
 	/*
 	 * Round up width for minimum burst size.
 	 *
 	 * TODO: Implement configurable stride support, and check what the real
 	 * hardware alignment constraint on the width is.
 	 */
-	v4l_bound_align_image(&pixfmt->width, 1, 0xffff, 8,
+	v4l_bound_align_image(&pixfmt->width, 1, 0xffff, walign,
 			      &pixfmt->height, 1, 0xffff, 1, 0);
 
 	pixfmt->bytesperline = pixfmt->width * cc->bpp / 8;
-- 
2.34.1

