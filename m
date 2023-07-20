Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 1F48175A7FA
	for <lists+linux-media@lfdr.de>; Thu, 20 Jul 2023 09:41:40 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231641AbjGTHlj (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 20 Jul 2023 03:41:39 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60250 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229451AbjGTHli (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 20 Jul 2023 03:41:38 -0400
Received: from mx1.tq-group.com (mx1.tq-group.com [93.104.207.81])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8EF4D2122
        for <linux-media@vger.kernel.org>; Thu, 20 Jul 2023 00:41:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=tq-group.com; i=@tq-group.com; q=dns/txt; s=key1;
  t=1689838896; x=1721374896;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=NypF6BjMiKMUosxHTXziAHI4i73qdfEnHzAUvrdx/3s=;
  b=VrUg6DdRlAWvuvdQ15+RC4KbA6o6ankxFaV3nGqyRM7SCH9JhDOXxp2A
   bpkb8SV9IHLWSZQf2wAALRGEN+AJx9h8PtDka7i3vFLPYIj2EtmC/vBVR
   QyDoE/TQWtGtAIEMaFzcEB0HUrx021iRW6ozzZI3KQNgOUNrtgpx0q7mw
   Fpm/nAx/MLSlGsAg5UYH/w7uH76BQlGIOcdj65AVnt/JSspLxdPq3glH6
   nocAv4BfI62XBfEt8/HxV7RLEWq1oMdqXvvpG/H9mQyt+OKbAhsJDIUGx
   DmI8liHe1fl8w2Tm/WcaVlP5L6BOu8bqf52KsWp3EzmwIjWpSx66b/ePK
   A==;
X-IronPort-AV: E=Sophos;i="6.01,218,1684792800"; 
   d="scan'208";a="32025080"
Received: from vtuxmail01.tq-net.de ([10.115.0.20])
  by mx1.tq-group.com with ESMTP; 20 Jul 2023 09:41:32 +0200
Received: from steina-w.tq-net.de (unknown [10.123.53.21])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
        (No client certificate requested)
        by vtuxmail01.tq-net.de (Postfix) with ESMTPSA id BEB97280084;
        Thu, 20 Jul 2023 09:41:32 +0200 (CEST)
From:   Alexander Stein <alexander.stein@ew.tq-group.com>
To:     Rui Miguel Silva <rmfrfs@gmail.com>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Shawn Guo <shawnguo@kernel.org>,
        Sascha Hauer <s.hauer@pengutronix.de>,
        Fabio Estevam <festevam@gmail.com>,
        Tim Harvey <tharvey@gateworks.com>
Cc:     Alexander Stein <alexander.stein@ew.tq-group.com>,
        Pengutronix Kernel Team <kernel@pengutronix.de>,
        NXP Linux Team <linux-imx@nxp.com>,
        linux-media@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Subject: [PATCH 2/2] media: imx: imx7-media-csi: Fix applying format constraints
Date:   Thu, 20 Jul 2023 09:41:29 +0200
Message-Id: <20230720074129.3680269-2-alexander.stein@ew.tq-group.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230720074129.3680269-1-alexander.stein@ew.tq-group.com>
References: <20230720074129.3680269-1-alexander.stein@ew.tq-group.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.0 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_EF,RCVD_IN_DNSWL_BLOCKED,SPF_HELO_NONE,SPF_PASS,
        T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

v4l_bound_align_image aligns to a multiple power of 2 of walign, but the
result only needs to be a multiple of walign. Fix this by using
v4l2_apply_frmsize_constraints() instead.

Reported-by: Tim Harvey <tharvey@gateworks.com>
Fixes: 6f482c4729d9 ("media: imx: imx7-media-csi: Get rid of superfluous call to imx7_csi_mbus_fmt_to_pix_fmt")
Signed-off-by: Alexander Stein <alexander.stein@ew.tq-group.com>
---
Tim,
can you please test if this fixes your problem?
Apparently this issue only arises under specific conditions, e.g. 640/480/8bpp.
This issue does not show up for 640/480/10bpp.

 drivers/media/platform/nxp/imx7-media-csi.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/media/platform/nxp/imx7-media-csi.c b/drivers/media/platform/nxp/imx7-media-csi.c
index 73f8f2a35422..523e5f039a5a 100644
--- a/drivers/media/platform/nxp/imx7-media-csi.c
+++ b/drivers/media/platform/nxp/imx7-media-csi.c
@@ -1141,8 +1141,8 @@ __imx7_csi_video_try_fmt(struct v4l2_pix_format *pixfmt,
 	 * TODO: Implement configurable stride support.
 	 */
 	walign = 8 * 8 / cc->bpp;
-	v4l_bound_align_image(&pixfmt->width, 1, 0xffff, walign,
-			      &pixfmt->height, 1, 0xffff, 1, 0);
+	v4l2_apply_frmsize_constraints(&pixfmt->width, &pixfmt->height,
+				       &imx7_csi_frmsize_stepwise);
 
 	pixfmt->bytesperline = pixfmt->width * cc->bpp / 8;
 	pixfmt->sizeimage = pixfmt->bytesperline * pixfmt->height;
-- 
2.34.1

