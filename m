Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 3ED122FD60D
	for <lists+linux-media@lfdr.de>; Wed, 20 Jan 2021 17:51:47 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727175AbhATQvG (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 20 Jan 2021 11:51:06 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54122 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2391588AbhATQpm (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 20 Jan 2021 11:45:42 -0500
Received: from bhuna.collabora.co.uk (bhuna.collabora.co.uk [IPv6:2a00:1098:0:82:1000:25:2eeb:e3e3])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3C2F6C0613CF
        for <linux-media@vger.kernel.org>; Wed, 20 Jan 2021 08:45:00 -0800 (PST)
Received: from [127.0.0.1] (localhost [127.0.0.1])
        (Authenticated sender: dafna)
        with ESMTPSA id 48FA41F44FC0
From:   Dafna Hirschfeld <dafna.hirschfeld@collabora.com>
To:     linux-media@vger.kernel.org, heiko.stuebner@theobroma-systems.com,
        heiko@sntech.de
Cc:     laurent.pinchart@ideasonboard.com, dafna.hirschfeld@collabora.com,
        helen.koike@collabora.com, ezequiel@collabora.com,
        hverkuil@xs4all.nl, kernel@collabora.com, dafna3@gmail.com,
        sakari.ailus@linux.intel.com, linux-rockchip@lists.infradead.org,
        mchehab@kernel.org, tfiga@chromium.org
Subject: [PATCH v7 3/5] media: rockchip: rkisp1: reduce number of histogram grid elements in uapi
Date:   Wed, 20 Jan 2021 17:44:44 +0100
Message-Id: <20210120164446.1220-4-dafna.hirschfeld@collabora.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20210120164446.1220-1-dafna.hirschfeld@collabora.com>
References: <20210120164446.1220-1-dafna.hirschfeld@collabora.com>
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

From: Heiko Stuebner <heiko.stuebner@theobroma-systems.com>

The uapi right now specifies an array size of 28 but the actual number
of elements is only 25 with the last 3 being unused.

Reduce the array size to the correct number of elements and change
the params code to iterate the array 25 times.

Signed-off-by: Heiko Stuebner <heiko.stuebner@theobroma-systems.com>
Signed-off-by: Dafna Hirschfeld <dafna.hirschfeld@collabora.com>
---
 drivers/media/platform/rockchip/rkisp1/rkisp1-params.c | 3 ++-
 include/uapi/linux/rkisp1-config.h                     | 3 +--
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/media/platform/rockchip/rkisp1/rkisp1-params.c b/drivers/media/platform/rockchip/rkisp1/rkisp1-params.c
index 6af4d551ffb5..021939466b24 100644
--- a/drivers/media/platform/rockchip/rkisp1/rkisp1-params.c
+++ b/drivers/media/platform/rockchip/rkisp1/rkisp1-params.c
@@ -589,7 +589,6 @@ static void rkisp1_hst_config(struct rkisp1_params *params,
 		RKISP1_CIF_ISP_HIST_WEIGHT_22TO03,
 		RKISP1_CIF_ISP_HIST_WEIGHT_13TO43,
 		RKISP1_CIF_ISP_HIST_WEIGHT_04TO34,
-		RKISP1_CIF_ISP_HIST_WEIGHT_44,
 	};
 	const u8 *weight;
 	unsigned int i;
@@ -622,6 +621,8 @@ static void rkisp1_hst_config(struct rkisp1_params *params,
 							    weight[2],
 							    weight[3]),
 				 hist_weight_regs[i]);
+
+	rkisp1_write(params->rkisp1, weight[0] & 0x1F, RKISP1_CIF_ISP_HIST_WEIGHT_44);
 }
 
 static void
diff --git a/include/uapi/linux/rkisp1-config.h b/include/uapi/linux/rkisp1-config.h
index f75f8d698fb4..0da07cd1ceeb 100644
--- a/include/uapi/linux/rkisp1-config.h
+++ b/include/uapi/linux/rkisp1-config.h
@@ -102,8 +102,7 @@
 /*
  * Histogram calculation
  */
-/* Last 3 values unused. */
-#define RKISP1_CIF_ISP_HISTOGRAM_WEIGHT_GRIDS_SIZE 28
+#define RKISP1_CIF_ISP_HISTOGRAM_WEIGHT_GRIDS_SIZE 25
 
 /*
  * Defect Pixel Cluster Correction
-- 
2.17.1

