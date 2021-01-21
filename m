Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D9A1A2FED3B
	for <lists+linux-media@lfdr.de>; Thu, 21 Jan 2021 15:45:49 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729446AbhAUOpN (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 21 Jan 2021 09:45:13 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55900 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729117AbhAUOo4 (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 21 Jan 2021 09:44:56 -0500
Received: from bhuna.collabora.co.uk (bhuna.collabora.co.uk [IPv6:2a00:1098:0:82:1000:25:2eeb:e3e3])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8E906C061756
        for <linux-media@vger.kernel.org>; Thu, 21 Jan 2021 06:44:15 -0800 (PST)
Received: from [127.0.0.1] (localhost [127.0.0.1])
        (Authenticated sender: dafna)
        with ESMTPSA id E303B1F45EB7
From:   Dafna Hirschfeld <dafna.hirschfeld@collabora.com>
To:     linux-media@vger.kernel.org, laurent.pinchart@ideasonboard.com,
        hverkuil@xs4all.nl, sakari.ailus@linux.intel.com, heiko@sntech.de
Cc:     dafna.hirschfeld@collabora.com, helen.koike@collabora.com,
        ezequiel@collabora.com, kernel@collabora.com, dafna3@gmail.com,
        linux-rockchip@lists.infradead.org, mchehab@kernel.org,
        tfiga@chromium.org
Subject: [PATCH v8 1/6] media: rkisp1: uapi: change hist_bins array type from __u16 to __u32
Date:   Thu, 21 Jan 2021 15:44:02 +0100
Message-Id: <20210121144407.9045-2-dafna.hirschfeld@collabora.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20210121144407.9045-1-dafna.hirschfeld@collabora.com>
References: <20210121144407.9045-1-dafna.hirschfeld@collabora.com>
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Each entry in the array is a 20 bits value composed of 16 bits unsigned
integer and 4 bits fractional part. So the type should change to __u32.
In addition add a documentation of how the measurements are done.

Signed-off-by: Dafna Hirschfeld <dafna.hirschfeld@collabora.com>
---
 include/uapi/linux/rkisp1-config.h | 13 +++++++++----
 1 file changed, 9 insertions(+), 4 deletions(-)

diff --git a/include/uapi/linux/rkisp1-config.h b/include/uapi/linux/rkisp1-config.h
index 6e449e784260..24f05d6d258f 100644
--- a/include/uapi/linux/rkisp1-config.h
+++ b/include/uapi/linux/rkisp1-config.h
@@ -844,13 +844,18 @@ struct rkisp1_cif_isp_af_stat {
 /**
  * struct rkisp1_cif_isp_hist_stat - statistics histogram data
  *
- * @hist_bins: measured bin counters
+ * @hist_bins: measured bin counters. Each bin is a 20 bits unsigned fixed point
+ *	       type. Bits 0-4 are the fractional part and bits 5-19 are the
+ *	       integer part.
  *
- * Measurement window divided into 25 sub-windows, set
- * with ISP_HIST_XXX
+ * The window of the measurements area is divided to 5x5 sub-windows. The
+ * histogram is then computed for each sub-window independently and the final
+ * result is a weighted average of the histogram measurements on all
+ * sub-windows. The window of the measurements area and the weight of each
+ * sub-window are configurable using struct @rkisp1_cif_isp_hst_config.
  */
 struct rkisp1_cif_isp_hist_stat {
-	__u16 hist_bins[RKISP1_CIF_ISP_HIST_BIN_N_MAX];
+	__u32 hist_bins[RKISP1_CIF_ISP_HIST_BIN_N_MAX];
 };
 
 /**
-- 
2.17.1

