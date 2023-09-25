Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 375B97ACD46
	for <lists+linux-media@lfdr.de>; Mon, 25 Sep 2023 02:42:54 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231492AbjIYAm5 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sun, 24 Sep 2023 20:42:57 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50682 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231503AbjIYAmz (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Sun, 24 Sep 2023 20:42:55 -0400
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4DD1919A
        for <linux-media@vger.kernel.org>; Sun, 24 Sep 2023 17:42:35 -0700 (PDT)
Received: from pendragon.ideasonboard.com (213-243-189-158.bb.dnainternet.fi [213.243.189.158])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 461D88E1;
        Mon, 25 Sep 2023 02:39:41 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1695602381;
        bh=4CC4se0kQYbu5sKCaZGEoZwn9RO/cNevRn0IVl8Bwi0=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=Coj9WpDNbx5D/z5yOkzBQVxfDYRKex2BklKSADUx1I/YwsQQerv1AwxqWFm8Trjd6
         pHhZZejslwiDKo32FqwcNqD6vGP+lZmqoy1tBpNajC+7pNK1ZfNvDgvkVpLq+RpBcn
         HbPeuntEOzfLufZl6Oa3r4UedVgKKHHO5M/Yv7oU=
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     linux-media@vger.kernel.org
Cc:     Dafna Hirschfeld <dafna@fastmail.com>,
        Paul Elder <paul.elder@ideasonboard.com>,
        linux-rockchip@lists.infradead.org
Subject: [PATCH v2 13/14] media: rkisp1: resizer: Improve debug message when configuring resizer
Date:   Mon, 25 Sep 2023 03:41:11 +0300
Message-ID: <20230925004112.22797-14-laurent.pinchart@ideasonboard.com>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20230925004112.22797-1-laurent.pinchart@ideasonboard.com>
References: <20230925004112.22797-1-laurent.pinchart@ideasonboard.com>
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

The debug messages that show the resizer configuration are only printed
if the driver enables the resizer. This prevents checking the resizer
configuration when the driver believes it should be disabled. Fix it by
moving the dev_dbg() statements earlier.

Also, combine the two debug prints into a single one to gather all the
information in one place, which makes reading the log easier.

While at it, use %u instead of %d to print unsigned values.

Signed-off-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
---
 .../media/platform/rockchip/rkisp1/rkisp1-resizer.c  | 12 ++++++------
 1 file changed, 6 insertions(+), 6 deletions(-)

diff --git a/drivers/media/platform/rockchip/rkisp1/rkisp1-resizer.c b/drivers/media/platform/rockchip/rkisp1/rkisp1-resizer.c
index 1741ada7032b..92ae2d2e0f12 100644
--- a/drivers/media/platform/rockchip/rkisp1/rkisp1-resizer.c
+++ b/drivers/media/platform/rockchip/rkisp1/rkisp1-resizer.c
@@ -309,17 +309,17 @@ static void rkisp1_rsz_config(struct rkisp1_resizer *rsz,
 	src_c.width = src_y.width / src_yuv_info->hdiv;
 	src_c.height = src_y.height / src_yuv_info->vdiv;
 
+	dev_dbg(rsz->rkisp1->dev,
+		"stream %u rsz/scale: Y %ux%u -> %ux%u, CbCr %ux%u -> %ux%u\n",
+		rsz->id, sink_y->width, sink_y->height,
+		src_fmt->width, src_fmt->height,
+		sink_c.width, sink_c.height, src_c.width, src_c.height);
+
 	if (sink_c.width == src_c.width && sink_c.height == src_c.height) {
 		rkisp1_rsz_disable(rsz, when);
 		return;
 	}
 
-	dev_dbg(rsz->rkisp1->dev, "stream %d rsz/scale: %dx%d -> %dx%d\n",
-		rsz->id, sink_y->width, sink_y->height,
-		src_fmt->width, src_fmt->height);
-	dev_dbg(rsz->rkisp1->dev, "chroma scaling %dx%d -> %dx%d\n",
-		sink_c.width, sink_c.height, src_c.width, src_c.height);
-
 	/* set values in the hw */
 	rkisp1_rsz_config_regs(rsz, sink_y, &sink_c, &src_y, &src_c, when);
 }
-- 
Regards,

Laurent Pinchart

