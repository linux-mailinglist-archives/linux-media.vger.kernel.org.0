Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 29D862FED49
	for <lists+linux-media@lfdr.de>; Thu, 21 Jan 2021 15:48:02 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1732111AbhAUOql (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 21 Jan 2021 09:46:41 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55904 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1731557AbhAUOpF (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 21 Jan 2021 09:45:05 -0500
Received: from bhuna.collabora.co.uk (bhuna.collabora.co.uk [IPv6:2a00:1098:0:82:1000:25:2eeb:e3e3])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 23DC8C0613D6
        for <linux-media@vger.kernel.org>; Thu, 21 Jan 2021 06:44:16 -0800 (PST)
Received: from [127.0.0.1] (localhost [127.0.0.1])
        (Authenticated sender: dafna)
        with ESMTPSA id 7D89F1F45EB8
From:   Dafna Hirschfeld <dafna.hirschfeld@collabora.com>
To:     linux-media@vger.kernel.org, laurent.pinchart@ideasonboard.com,
        hverkuil@xs4all.nl, sakari.ailus@linux.intel.com, heiko@sntech.de
Cc:     dafna.hirschfeld@collabora.com, helen.koike@collabora.com,
        ezequiel@collabora.com, kernel@collabora.com, dafna3@gmail.com,
        linux-rockchip@lists.infradead.org, mchehab@kernel.org,
        tfiga@chromium.org
Subject: [PATCH v8 2/6] media: rkisp1: stats: remove a wrong cast to u8
Date:   Thu, 21 Jan 2021 15:44:03 +0100
Message-Id: <20210121144407.9045-3-dafna.hirschfeld@collabora.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20210121144407.9045-1-dafna.hirschfeld@collabora.com>
References: <20210121144407.9045-1-dafna.hirschfeld@collabora.com>
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

hist_bins is an array of type __u32. Each entry represent
a 20 bit fixed point value as documented inline.
The cast to u8 when setting the values is wrong. Remove it.

Signed-off-by: Dafna Hirschfeld <dafna.hirschfeld@collabora.com>
Reviewed-by: Heiko Stuebner <heiko@sntech.de>
---
 drivers/media/platform/rockchip/rkisp1/rkisp1-stats.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/drivers/media/platform/rockchip/rkisp1/rkisp1-stats.c b/drivers/media/platform/rockchip/rkisp1/rkisp1-stats.c
index 3ddab8fa8f2d..4cdb180fa64d 100644
--- a/drivers/media/platform/rockchip/rkisp1/rkisp1-stats.c
+++ b/drivers/media/platform/rockchip/rkisp1/rkisp1-stats.c
@@ -235,8 +235,7 @@ static void rkisp1_stats_get_hst_meas(struct rkisp1_stats *stats,
 	pbuf->meas_type |= RKISP1_CIF_ISP_STAT_HIST;
 	for (i = 0; i < RKISP1_CIF_ISP_HIST_BIN_N_MAX; i++)
 		pbuf->params.hist.hist_bins[i] =
-			(u8)rkisp1_read(rkisp1,
-					RKISP1_CIF_ISP_HIST_BIN_0 + i * 4);
+			rkisp1_read(rkisp1, RKISP1_CIF_ISP_HIST_BIN_0 + i * 4);
 }
 
 static void rkisp1_stats_get_bls_meas(struct rkisp1_stats *stats,
-- 
2.17.1

