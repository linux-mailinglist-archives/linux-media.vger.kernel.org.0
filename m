Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 35290570303
	for <lists+linux-media@lfdr.de>; Mon, 11 Jul 2022 14:44:02 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231840AbiGKMnx (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 11 Jul 2022 08:43:53 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43364 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231842AbiGKMnk (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 11 Jul 2022 08:43:40 -0400
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4E72B6334
        for <linux-media@vger.kernel.org>; Mon, 11 Jul 2022 05:43:36 -0700 (PDT)
Received: from pendragon.lan (62-78-145-57.bb.dnainternet.fi [62.78.145.57])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 2BBCE1AEF;
        Mon, 11 Jul 2022 14:43:25 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1657543405;
        bh=DLY7EF7T+i9kYiXWcztp+nc0pFdp76RpS+5O8XFQwDc=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=pGz99CnJg68iN9i/uE7zgVLgiHn74BEdqTGX5iQkhzHnMGAC2MHDBhkPkN3KrviG8
         T71SBCkXfD/wX5iNfI2/uZgGxBYEJnGuQ8buMUaUt8sokMxYrXFXpKYVGuILi6xIwM
         9s0GhkHmknkXdK/MgOHkiQD127SoD6Uz9keW2O7k=
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     linux-media@vger.kernel.org
Cc:     linux-rockchip@lists.infradead.org,
        Dafna Hirschfeld <dafna@fastmail.com>,
        Heiko Stuebner <heiko@sntech.de>,
        Helen Koike <helen.koike@collabora.com>,
        Paul Elder <paul.elder@ideasonboard.com>
Subject: [PATCH v3 10/46] media: rkisp1: Access ISP version from info pointer
Date:   Mon, 11 Jul 2022 15:42:12 +0300
Message-Id: <20220711124248.2683-11-laurent.pinchart@ideasonboard.com>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220711124248.2683-1-laurent.pinchart@ideasonboard.com>
References: <20220711124248.2683-1-laurent.pinchart@ideasonboard.com>
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

The ISP version is stored in the media_device hw_revision field and
access from there in the driver. Now that we store a pointer to the
match data in the rkisp1_device structure, access the ISP version from
there to make the code clearer and avoid depending on the media_device.

Signed-off-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Reviewed-by: Dafna Hirschfeld <dafna@fastmail.com>
Reviewed-by: Paul Elder <paul.elder@ideasonboard.com>
---
 drivers/media/platform/rockchip/rkisp1/rkisp1-isp.c    | 4 ++--
 drivers/media/platform/rockchip/rkisp1/rkisp1-params.c | 2 +-
 drivers/media/platform/rockchip/rkisp1/rkisp1-stats.c  | 2 +-
 3 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/drivers/media/platform/rockchip/rkisp1/rkisp1-isp.c b/drivers/media/platform/rockchip/rkisp1/rkisp1-isp.c
index bc94a51124b0..69c60814ecc1 100644
--- a/drivers/media/platform/rockchip/rkisp1/rkisp1-isp.c
+++ b/drivers/media/platform/rockchip/rkisp1/rkisp1-isp.c
@@ -417,7 +417,7 @@ static int rkisp1_config_mipi(struct rkisp1_device *rkisp1)
 	rkisp1_write(rkisp1, RKISP1_CIF_MIPI_CTRL, mipi_ctrl);
 
 	/* V12 could also use a newer csi2-host, but we don't want that yet */
-	if (rkisp1->media_dev.hw_revision == RKISP1_V12)
+	if (rkisp1->info->isp_ver == RKISP1_V12)
 		rkisp1_write(rkisp1, RKISP1_CIF_ISP_CSI0_CTRL0, 0);
 
 	/* Configure Data Type and Virtual Channel */
@@ -535,7 +535,7 @@ static void rkisp1_config_clk(struct rkisp1_device *rkisp1)
 	rkisp1_write(rkisp1, RKISP1_CIF_VI_ICCL, val);
 
 	/* ensure sp and mp can run at the same time in V12 */
-	if (rkisp1->media_dev.hw_revision == RKISP1_V12) {
+	if (rkisp1->info->isp_ver == RKISP1_V12) {
 		val = RKISP1_CIF_CLK_CTRL_MI_Y12 | RKISP1_CIF_CLK_CTRL_MI_SP |
 		      RKISP1_CIF_CLK_CTRL_MI_RAW0 | RKISP1_CIF_CLK_CTRL_MI_RAW1 |
 		      RKISP1_CIF_CLK_CTRL_MI_READ | RKISP1_CIF_CLK_CTRL_MI_RAWRD |
diff --git a/drivers/media/platform/rockchip/rkisp1/rkisp1-params.c b/drivers/media/platform/rockchip/rkisp1/rkisp1-params.c
index c88a9c0fa86e..9da7dc1bc690 100644
--- a/drivers/media/platform/rockchip/rkisp1/rkisp1-params.c
+++ b/drivers/media/platform/rockchip/rkisp1/rkisp1-params.c
@@ -1801,7 +1801,7 @@ static void rkisp1_init_params(struct rkisp1_params *params)
 	params->vdev_fmt.fmt.meta.buffersize =
 		sizeof(struct rkisp1_params_cfg);
 
-	if (params->rkisp1->media_dev.hw_revision == RKISP1_V12)
+	if (params->rkisp1->info->isp_ver == RKISP1_V12)
 		params->ops = &rkisp1_v12_params_ops;
 	else
 		params->ops = &rkisp1_v10_params_ops;
diff --git a/drivers/media/platform/rockchip/rkisp1/rkisp1-stats.c b/drivers/media/platform/rockchip/rkisp1/rkisp1-stats.c
index b7ae9166c52f..7d82356b5345 100644
--- a/drivers/media/platform/rockchip/rkisp1/rkisp1-stats.c
+++ b/drivers/media/platform/rockchip/rkisp1/rkisp1-stats.c
@@ -427,7 +427,7 @@ static void rkisp1_init_stats(struct rkisp1_stats *stats)
 	stats->vdev_fmt.fmt.meta.buffersize =
 		sizeof(struct rkisp1_stat_buffer);
 
-	if (stats->rkisp1->media_dev.hw_revision == RKISP1_V12)
+	if (stats->rkisp1->info->isp_ver == RKISP1_V12)
 		stats->ops = &rkisp1_v12_stats_ops;
 	else
 		stats->ops = &rkisp1_v10_stats_ops;
-- 
Regards,

Laurent Pinchart

