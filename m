Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 27F636E6116
	for <lists+linux-media@lfdr.de>; Tue, 18 Apr 2023 14:20:54 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230508AbjDRMUu (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 18 Apr 2023 08:20:50 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57848 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229882AbjDRMUs (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 18 Apr 2023 08:20:48 -0400
Received: from mx1.tq-group.com (mx1.tq-group.com [93.104.207.81])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1CC8EE44
        for <linux-media@vger.kernel.org>; Tue, 18 Apr 2023 05:20:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=tq-group.com; i=@tq-group.com; q=dns/txt; s=key1;
  t=1681820447; x=1713356447;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=x9t0YKFE5YdhFDRYs98DQ6cjcsr0r7KP+UROeDikahg=;
  b=fuZ7nDZcULRareMZQNQruVXzAKMAU1QcfNgv0y3OdIZJEpmROWQKEKN6
   nidRgpfJIJzBO3oEkRvxaBt8HkxHMYaHKZTFaQT+QiY+oYXgfSLNmOHsf
   ilBDofGj4eR3sn6wbfZRy7yrssbZigu/4b3t6HXCmC1JsWw85VijOKj/5
   eosCQMlRhl9YOckrXjcFvIXARforILE7m54VaflXs6/1uYi34ksPy5Hdn
   MMEXr4hHx983F31XT+AKxrvdyfwxX0Fom4vlKcts4woC9TqKnDcDiY8ml
   6+OfUR/AeRsSPaR7UeRB+hJ5gEO4OhdTvC/m6AQ/JuIUeEX82I+o2aUw3
   w==;
X-IronPort-AV: E=Sophos;i="5.99,207,1677538800"; 
   d="scan'208";a="30398475"
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
  bh=x9t0YKFE5YdhFDRYs98DQ6cjcsr0r7KP+UROeDikahg=;
  b=jDNHH+pOmfjwQPfBiIT9K97+VCjBVtokt18T1neMICFa6uLGsgaFKM4a
   /c6DXC5/GVkHsB8V3s43SruiC94WmyQd0dEK+4lPot/YzAOX+T4hLri0C
   S60faKegr8eHOKX592FUceBCkv82rPGt5KGfEVlGLeezJW68t+0oHVVD/
   p+NrrmE2fG2peUu/sbxJrrArg/BmO2dz2p966IgJW5hv6O796VJikeEaV
   dbE20UAL8EcRPE6TtwEp+/BVfbo5v4H3bWnfN4ajRt7Z6qw6JslFr86rm
   6Ii/wLgrJ+pTst9vacMxJDkevRlmmKlv8x+7bgsTdnp4ZHgs/+ndwCAa4
   w==;
X-IronPort-AV: E=Sophos;i="5.99,207,1677538800"; 
   d="scan'208";a="30398473"
Received: from vtuxmail01.tq-net.de ([10.115.0.20])
  by mx1.tq-group.com with ESMTP; 18 Apr 2023 14:20:45 +0200
Received: from steina-w.tq-net.de (unknown [10.123.53.21])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
        (No client certificate requested)
        by vtuxmail01.tq-net.de (Postfix) with ESMTPSA id 59540280073;
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
Subject: [PATCH v3 2/4] media: imx: imx7-media-csi: Remove interlave fields
Date:   Tue, 18 Apr 2023 14:20:39 +0200
Message-Id: <20230418122041.1318862-3-alexander.stein@ew.tq-group.com>
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

Interlaced mode is currently not supported, so disable fields in try_fmt.

Signed-off-by: Alexander Stein <alexander.stein@ew.tq-group.com>
---
Changes in v3:
* Remove left-over interlace mode check

 drivers/media/platform/nxp/imx7-media-csi.c | 15 +--------------
 1 file changed, 1 insertion(+), 14 deletions(-)

diff --git a/drivers/media/platform/nxp/imx7-media-csi.c b/drivers/media/platform/nxp/imx7-media-csi.c
index b149374b07ee1..1315f5743b76f 100644
--- a/drivers/media/platform/nxp/imx7-media-csi.c
+++ b/drivers/media/platform/nxp/imx7-media-csi.c
@@ -1162,20 +1162,6 @@ __imx7_csi_video_try_fmt(struct v4l2_pix_format *pixfmt,
 		cc = imx7_csi_find_pixel_format(pixfmt->pixelformat);
 	}
 
-	/* Allow IDMAC interweave but enforce field order from source. */
-	if (V4L2_FIELD_IS_INTERLACED(pixfmt->field)) {
-		switch (pixfmt->field) {
-		case V4L2_FIELD_SEQ_TB:
-			pixfmt->field = V4L2_FIELD_INTERLACED_TB;
-			break;
-		case V4L2_FIELD_SEQ_BT:
-			pixfmt->field = V4L2_FIELD_INTERLACED_BT;
-			break;
-		default:
-			break;
-		}
-	}
-
 	/*
 	 * Round up width for minimum burst size.
 	 *
@@ -1187,6 +1173,7 @@ __imx7_csi_video_try_fmt(struct v4l2_pix_format *pixfmt,
 
 	pixfmt->bytesperline = pixfmt->width * cc->bpp / 8;
 	pixfmt->sizeimage = pixfmt->bytesperline * pixfmt->height;
+	pixfmt->field = V4L2_FIELD_NONE;
 
 	return cc;
 }
-- 
2.34.1

