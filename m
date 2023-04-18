Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id D44F96E5A30
	for <lists+linux-media@lfdr.de>; Tue, 18 Apr 2023 09:14:59 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229734AbjDRHO6 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 18 Apr 2023 03:14:58 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33602 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231249AbjDRHOy (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 18 Apr 2023 03:14:54 -0400
Received: from mx1.tq-group.com (mx1.tq-group.com [93.104.207.81])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 075C7273C
        for <linux-media@vger.kernel.org>; Tue, 18 Apr 2023 00:14:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=tq-group.com; i=@tq-group.com; q=dns/txt; s=key1;
  t=1681802093; x=1713338093;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=edaL6dP8udaoBENjAOXy9u4eKuGvdt1NYMIa3nDzb9Q=;
  b=p2FK9wFpG8SKNbgvp8SN4VZZii0haBfP+9g6Ahlg5JA4emgDzzCsNnuS
   E4Bfy/r9/RO0BXIGtw3WdkDwYh5qEhiglKwu93s8L81mrf4+CE2UXu5IP
   NaJR/W8auwvh9ULqs4zMx0vB18k/fE8It6hZprAu8VtdX7Kmn5FGQusCE
   1n3QFc9YzUU9AJEc9sDWNqDDoeC3kqLKikBWbCQ/n+QCVkS1yRjkrR1yg
   v6xB8zYYYVWdkAwYPdCZtkLVmNQH/IG+F810OGr5i3aTVjuczQszQXrWs
   zWqKKdTzZVYIsBLlj+bScz1FyufhvgEfNArK2YucDzPdSwDoRR1fzljqg
   w==;
X-IronPort-AV: E=Sophos;i="5.99,206,1677538800"; 
   d="scan'208";a="30385558"
Received: from unknown (HELO tq-pgp-pr1.tq-net.de) ([192.168.6.15])
  by mx1-pgp.tq-group.com with ESMTP; 18 Apr 2023 09:14:47 +0200
Received: from mx1.tq-group.com ([192.168.6.7])
  by tq-pgp-pr1.tq-net.de (PGP Universal service);
  Tue, 18 Apr 2023 09:14:47 +0200
X-PGP-Universal: processed;
        by tq-pgp-pr1.tq-net.de on Tue, 18 Apr 2023 09:14:47 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=tq-group.com; i=@tq-group.com; q=dns/txt; s=key1;
  t=1681802087; x=1713338087;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=edaL6dP8udaoBENjAOXy9u4eKuGvdt1NYMIa3nDzb9Q=;
  b=l6XcpwZaYyDwzkEE71WvcRI6G29deS/DKUHq/w9v/4PLC8FwLMaNpj6y
   ya3d22G7+Vz+hygEA0jnztKByExWgLjkT1lL+6KwEkIF0iQPsWCGQ2gFA
   /ZW8ZpJTZkc0guHvVOXU8ggY1TsJDFicHvvXdwEVm/AztIyBK+03Fdujt
   ubJ2Kgq9oHXHuTNVGAjn+GXKQXQXaI35yED9Y8TUI4dOwUgUlujNt4ep3
   6KVT1Zj9361oL1otLRUUwxH3bpbWe0Bn+MAIpKgIfsLBbWsc9QtQoS7SK
   veylED7rPUFR4kfJKs2uIcVHUdkEiSjf+k6Qi1X0xSgqxwL7zk9MwOvXv
   Q==;
X-IronPort-AV: E=Sophos;i="5.99,206,1677538800"; 
   d="scan'208";a="30385557"
Received: from vtuxmail01.tq-net.de ([10.115.0.20])
  by mx1.tq-group.com with ESMTP; 18 Apr 2023 09:14:47 +0200
Received: from steina-w.tq-net.de (unknown [10.123.53.21])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
        (No client certificate requested)
        by vtuxmail01.tq-net.de (Postfix) with ESMTPSA id 3AA40280074;
        Tue, 18 Apr 2023 09:14:47 +0200 (CEST)
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
Subject: [PATCH v2 3/3] media: imx: imx7-media-csi: Lift width constraints for 8bpp formats
Date:   Tue, 18 Apr 2023 09:14:39 +0200
Message-Id: <20230418071439.197735-4-alexander.stein@ew.tq-group.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230418071439.197735-1-alexander.stein@ew.tq-group.com>
References: <20230418071439.197735-1-alexander.stein@ew.tq-group.com>
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

For 8-bit formats the image_width just needs to be a multiple of 4 pixels.

Signed-off-by: Alexander Stein <alexander.stein@ew.tq-group.com>
---
 drivers/media/platform/nxp/imx7-media-csi.c | 9 ++++++++-
 1 file changed, 8 insertions(+), 1 deletion(-)

diff --git a/drivers/media/platform/nxp/imx7-media-csi.c b/drivers/media/platform/nxp/imx7-media-csi.c
index 1508f6ba20e91..5240670476b2b 100644
--- a/drivers/media/platform/nxp/imx7-media-csi.c
+++ b/drivers/media/platform/nxp/imx7-media-csi.c
@@ -1147,6 +1147,7 @@ __imx7_csi_video_try_fmt(struct v4l2_pix_format *pixfmt,
 {
 	const struct imx7_csi_pixfmt *cc;
 	u32 stride;
+	u32 walign;
 
 	/*
 	 * Find the pixel format, default to the first supported format if not
@@ -1172,7 +1173,13 @@ __imx7_csi_video_try_fmt(struct v4l2_pix_format *pixfmt,
 		}
 	}
 
-	v4l_bound_align_image(&pixfmt->width, 1, 0xffff, 8,
+	/* Refer to CSI_IMAG_PARA.IMAGE_WIDTH description */
+	if (cc->bpp == 8)
+		walign = 8;
+	else
+		walign = 4;
+
+	v4l_bound_align_image(&pixfmt->width, 1, 0xffff, walign,
 			      &pixfmt->height, 1, 0xffff, 1, 0);
 
 	stride = round_up((pixfmt->width * cc->bpp) / 8, 8);
-- 
2.34.1

