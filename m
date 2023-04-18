Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id C6DFB6E6118
	for <lists+linux-media@lfdr.de>; Tue, 18 Apr 2023 14:20:54 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230416AbjDRMUt (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 18 Apr 2023 08:20:49 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57846 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230158AbjDRMUs (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 18 Apr 2023 08:20:48 -0400
Received: from mx1.tq-group.com (mx1.tq-group.com [93.104.207.81])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C543FC2
        for <linux-media@vger.kernel.org>; Tue, 18 Apr 2023 05:20:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=tq-group.com; i=@tq-group.com; q=dns/txt; s=key1;
  t=1681820447; x=1713356447;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=XGw5xC6Fg4pq6w23AOORh/+eD6UfJOrgZkSlQ/9Kyj8=;
  b=f/fcty+8ezai3Z778j82KvdSmYHgSB+I4ESZ1syaihq4q//5Qp6nv4AJ
   OyJQNrdSTnAsiZPTac1gOteJDmYmGIOMP1+Ad0rS9cRWaRN0HWBWTrEVc
   cwM8jn9wTCwCvhK2MbcpjdxZIP4um+KLe1eJPgZ7Z+p7dXZovkondv5kq
   gkrr9kIuBnyXW8ksYfz88IUS2Zq0w1w1dQVyWrfvg/0v7K3GUbnx/h1Np
   CPVPplRLvalz0NjnVOB4twp/FPkdz98y4i7Xb0DutQ9xGtpG8bpXnmXIK
   /2c2p3KeE8uF4/djGFCB+btULNoLu/6NJOmODMfURWZOa7g+o9f4fTHbR
   w==;
X-IronPort-AV: E=Sophos;i="5.99,207,1677538800"; 
   d="scan'208";a="30398472"
Received: from unknown (HELO tq-pgp-pr1.tq-net.de) ([192.168.6.15])
  by mx1-pgp.tq-group.com with ESMTP; 18 Apr 2023 14:20:44 +0200
Received: from mx1.tq-group.com ([192.168.6.7])
  by tq-pgp-pr1.tq-net.de (PGP Universal service);
  Tue, 18 Apr 2023 14:20:44 +0200
X-PGP-Universal: processed;
        by tq-pgp-pr1.tq-net.de on Tue, 18 Apr 2023 14:20:44 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=tq-group.com; i=@tq-group.com; q=dns/txt; s=key1;
  t=1681820444; x=1713356444;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=XGw5xC6Fg4pq6w23AOORh/+eD6UfJOrgZkSlQ/9Kyj8=;
  b=KHraa1TEam3bWtBOOirsu9iwl+L5mpvyth/yx5I6adyOEBz9HiPMxsUZ
   VpgvqszfhFlFpCdfIGD+h2E6FYM+T4qf2OgWe05so01FZzNoYzHrTpvmB
   an2BbjJuwJO43FZ4JbpivIX5NXUZ4UolsPVcEdAirkkF1xf1WBzsFBX/K
   D1v+KUk7tpJvEU8iCyRqwtVXTCR5C5X6vDbMN4SCrPuDisaazbJp3Q7hs
   TZwLC6hV4chCQdih6ufurVpQTXnEfYu9Nl7pk9jF0QvnnMfrm1l2O6DfR
   9btnrUXm2Z7m6yKk8oui19h9cGL+t5KiJMuQg2DxPXSzQ/7TwUP+jerPx
   g==;
X-IronPort-AV: E=Sophos;i="5.99,207,1677538800"; 
   d="scan'208";a="30398470"
Received: from vtuxmail01.tq-net.de ([10.115.0.20])
  by mx1.tq-group.com with ESMTP; 18 Apr 2023 14:20:44 +0200
Received: from steina-w.tq-net.de (unknown [10.123.53.21])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
        (No client certificate requested)
        by vtuxmail01.tq-net.de (Postfix) with ESMTPSA id A4E2A280072;
        Tue, 18 Apr 2023 14:20:43 +0200 (CEST)
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
Subject: [PATCH v3 1/4] media: imx: imx7-media-csi: Get rid of superfluous call to imx7_csi_mbus_fmt_to_pix_fmt
Date:   Tue, 18 Apr 2023 14:20:38 +0200
Message-Id: <20230418122041.1318862-2-alexander.stein@ew.tq-group.com>
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

There is no need to convert input pixformat to mbus_framefmt and back
again. Instead apply pixformat width constrains directly.
Assign compose values before adjusting pixformat height/width.

Signed-off-by: Alexander Stein <alexander.stein@ew.tq-group.com>
---
Changes in v3:
* Move compose assignment before width adjustments
* Add comments regarding width multiples
* Remove unneeded stride rounding

 drivers/media/platform/nxp/imx7-media-csi.c | 22 ++++++++++++++-------
 1 file changed, 15 insertions(+), 7 deletions(-)

diff --git a/drivers/media/platform/nxp/imx7-media-csi.c b/drivers/media/platform/nxp/imx7-media-csi.c
index b701e823436a8..b149374b07ee1 100644
--- a/drivers/media/platform/nxp/imx7-media-csi.c
+++ b/drivers/media/platform/nxp/imx7-media-csi.c
@@ -1145,9 +1145,13 @@ static const struct imx7_csi_pixfmt *
 __imx7_csi_video_try_fmt(struct v4l2_pix_format *pixfmt,
 			 struct v4l2_rect *compose)
 {
-	struct v4l2_mbus_framefmt fmt_src;
 	const struct imx7_csi_pixfmt *cc;
 
+	if (compose) {
+		compose->width = pixfmt->width;
+		compose->height = pixfmt->height;
+	}
+
 	/*
 	 * Find the pixel format, default to the first supported format if not
 	 * found.
@@ -1172,13 +1176,17 @@ __imx7_csi_video_try_fmt(struct v4l2_pix_format *pixfmt,
 		}
 	}
 
-	v4l2_fill_mbus_format(&fmt_src, pixfmt, 0);
-	imx7_csi_mbus_fmt_to_pix_fmt(pixfmt, &fmt_src, cc);
+	/*
+	 * Round up width for minimum burst size.
+	 *
+	 * TODO: Implement configurable stride support, and check what the real
+	 * hardware alignment constraint on the width is.
+	 */
+	v4l_bound_align_image(&pixfmt->width, 1, 0xffff, 8,
+			      &pixfmt->height, 1, 0xffff, 1, 0);
 
-	if (compose) {
-		compose->width = fmt_src.width;
-		compose->height = fmt_src.height;
-	}
+	pixfmt->bytesperline = pixfmt->width * cc->bpp / 8;
+	pixfmt->sizeimage = pixfmt->bytesperline * pixfmt->height;
 
 	return cc;
 }
-- 
2.34.1

