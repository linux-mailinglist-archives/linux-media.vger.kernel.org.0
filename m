Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id DD6FD7ACD3F
	for <lists+linux-media@lfdr.de>; Mon, 25 Sep 2023 02:42:25 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231538AbjIYAma (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sun, 24 Sep 2023 20:42:30 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36826 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231678AbjIYAmR (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Sun, 24 Sep 2023 20:42:17 -0400
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A4F4AE56
        for <linux-media@vger.kernel.org>; Sun, 24 Sep 2023 17:41:51 -0700 (PDT)
Received: from pendragon.ideasonboard.com (213-243-189-158.bb.dnainternet.fi [213.243.189.158])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 8025D1B70;
        Mon, 25 Sep 2023 02:39:35 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1695602375;
        bh=0A4fLySmfS29cqsduJAheAN/d88DT6dkQYkH8WFGnGQ=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=wHeXuVdO2rLj6X8OgGZ108eZmEtolMoGuvmdEl+Bo56WMk9wCqUNU8dLjDPUhuxZk
         2Rg28bzmvUEQtx2ROeirLvcjzyAeO6Vqh/wul1aniIraA/SuJtr6cbinamFyNJHpc8
         uOLpPOARYH3FRinvqnVVwMuAupyK0kEdwBCAqSP8=
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     linux-media@vger.kernel.org
Cc:     Dafna Hirschfeld <dafna@fastmail.com>,
        Paul Elder <paul.elder@ideasonboard.com>,
        linux-rockchip@lists.infradead.org
Subject: [PATCH v2 09/14] media: rkisp1: Program RKISP1_CIF_MI_SP_Y_PIC_SIZE register
Date:   Mon, 25 Sep 2023 03:41:07 +0300
Message-ID: <20230925004112.22797-10-laurent.pinchart@ideasonboard.com>
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

The self path has a Y_PIC_SIZE register that needs to be programmed to
the total number of pixels, including the stride. This isn't done by the
driver, fix it.

While at it, reorder the register write order to sort them by address.

Signed-off-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
---
 drivers/media/platform/rockchip/rkisp1/rkisp1-capture.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/drivers/media/platform/rockchip/rkisp1/rkisp1-capture.c b/drivers/media/platform/rockchip/rkisp1/rkisp1-capture.c
index 3c1e2c1a8bbe..c6d7e01c8949 100644
--- a/drivers/media/platform/rockchip/rkisp1/rkisp1-capture.c
+++ b/drivers/media/platform/rockchip/rkisp1/rkisp1-capture.c
@@ -479,9 +479,11 @@ static void rkisp1_sp_config(struct rkisp1_capture *cap)
 	rkisp1_write(rkisp1, cap->config->mi.cr_size_init,
 		     rkisp1_pixfmt_comp_size(pixm, RKISP1_PLANE_CR));
 
+	rkisp1_write(rkisp1, RKISP1_CIF_MI_SP_Y_LLENGTH, cap->sp_y_stride);
 	rkisp1_write(rkisp1, RKISP1_CIF_MI_SP_Y_PIC_WIDTH, pixm->width);
 	rkisp1_write(rkisp1, RKISP1_CIF_MI_SP_Y_PIC_HEIGHT, pixm->height);
-	rkisp1_write(rkisp1, RKISP1_CIF_MI_SP_Y_LLENGTH, cap->sp_y_stride);
+	rkisp1_write(rkisp1, RKISP1_CIF_MI_SP_Y_PIC_SIZE,
+		     cap->sp_y_stride * pixm->height);
 
 	rkisp1_irq_frame_end_enable(cap);
 
-- 
Regards,

Laurent Pinchart

