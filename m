Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 795CD1D329C
	for <lists+linux-media@lfdr.de>; Thu, 14 May 2020 16:21:17 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726240AbgENOVN (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 14 May 2020 10:21:13 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34086 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726051AbgENOVM (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 14 May 2020 10:21:12 -0400
Received: from bhuna.collabora.co.uk (bhuna.collabora.co.uk [IPv6:2a00:1098:0:82:1000:25:2eeb:e3e3])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id AA2B9C061A0C
        for <linux-media@vger.kernel.org>; Thu, 14 May 2020 07:21:12 -0700 (PDT)
Received: from [127.0.0.1] (localhost [127.0.0.1])
        (Authenticated sender: dafna)
        with ESMTPSA id 8C4622A2EDD
From:   Dafna Hirschfeld <dafna.hirschfeld@collabora.com>
To:     linux-media@vger.kernel.org, dafna.hirschfeld@collabora.com,
        helen.koike@collabora.com, ezequiel@collabora.com,
        hverkuil@xs4all.nl, kernel@collabora.com, dafna3@gmail.com,
        sakari.ailus@linux.intel.com, linux-rockchip@lists.infradead.org,
        mchehab@kernel.org, laurent.pinchart@ideasonboard.com
Subject: [PATCH] media: staging: rkisp1: set more precise size errors in debugfs
Date:   Thu, 14 May 2020 16:21:02 +0200
Message-Id: <20200514142102.16111-1-dafna.hirschfeld@collabora.com>
X-Mailer: git-send-email 2.17.1
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

When a size error is signaled, it is possible to read a register
to see where the error comes from. So, in debugfs the general
error 'pic_size_err' can be replaced with 3 more precise errors.

Signed-off-by: Dafna Hirschfeld <dafna.hirschfeld@collabora.com>
---
 drivers/staging/media/rkisp1/rkisp1-common.h | 4 +++-
 drivers/staging/media/rkisp1/rkisp1-dev.c    | 8 ++++++--
 drivers/staging/media/rkisp1/rkisp1-isp.c    | 7 ++++++-
 3 files changed, 15 insertions(+), 4 deletions(-)

diff --git a/drivers/staging/media/rkisp1/rkisp1-common.h b/drivers/staging/media/rkisp1/rkisp1-common.h
index 0c4fe503adc9..95d54306bae6 100644
--- a/drivers/staging/media/rkisp1/rkisp1-common.h
+++ b/drivers/staging/media/rkisp1/rkisp1-common.h
@@ -226,7 +226,9 @@ struct rkisp1_resizer {
 struct rkisp1_debug {
 	struct dentry *debugfs_dir;
 	unsigned long data_loss;
-	unsigned long pic_size_error;
+	unsigned long outform_size_error;
+	unsigned long is_size_error;
+	unsigned long inform_size_error;
 	unsigned long mipi_error;
 	unsigned long stats_error;
 	unsigned long stop_timeout[2];
diff --git a/drivers/staging/media/rkisp1/rkisp1-dev.c b/drivers/staging/media/rkisp1/rkisp1-dev.c
index 9ac38bafb839..2298d3ae5950 100644
--- a/drivers/staging/media/rkisp1/rkisp1-dev.c
+++ b/drivers/staging/media/rkisp1/rkisp1-dev.c
@@ -438,8 +438,12 @@ static void rkisp1_debug_init(struct rkisp1_device *rkisp1)
 	}
 	debugfs_create_ulong("data_loss", 0444, debug->debugfs_dir,
 			     &debug->data_loss);
-	debugfs_create_ulong("pic_size_error", 0444,  debug->debugfs_dir,
-			     &debug->pic_size_error);
+	debugfs_create_ulong("outform_size_err", 0444,  debug->debugfs_dir,
+			     &debug->outform_size_error);
+	debugfs_create_ulong("is_size_error", 0444,  debug->debugfs_dir,
+			     &debug->is_size_error);
+	debugfs_create_ulong("inform_size_error", 0444,  debug->debugfs_dir,
+			     &debug->inform_size_error);
 	debugfs_create_ulong("mipi_error", 0444, debug->debugfs_dir,
 			     &debug->mipi_error);
 	debugfs_create_ulong("stats_error", 0444, debug->debugfs_dir,
diff --git a/drivers/staging/media/rkisp1/rkisp1-isp.c b/drivers/staging/media/rkisp1/rkisp1-isp.c
index dc2b59a0160a..a7e5461e25a5 100644
--- a/drivers/staging/media/rkisp1/rkisp1-isp.c
+++ b/drivers/staging/media/rkisp1/rkisp1-isp.c
@@ -1123,8 +1123,13 @@ void rkisp1_isp_isr(struct rkisp1_device *rkisp1)
 	if (status & RKISP1_CIF_ISP_PIC_SIZE_ERROR) {
 		/* Clear pic_size_error */
 		isp_err = rkisp1_read(rkisp1, RKISP1_CIF_ISP_ERR);
+		if (isp_err & RKISP1_CIF_ISP_ERR_INFORM_SIZE)
+			rkisp1->debug.inform_size_error++;
+		if (isp_err & RKISP1_CIF_ISP_ERR_IS_SIZE)
+			rkisp1->debug.is_size_error++;
+		if (isp_err & RKISP1_CIF_ISP_ERR_OUTFORM_SIZE)
+			rkisp1->debug.outform_size_error++;
 		rkisp1_write(rkisp1, isp_err, RKISP1_CIF_ISP_ERR_CLR);
-		rkisp1->debug.pic_size_error++;
 	} else if (status & RKISP1_CIF_ISP_DATA_LOSS) {
 		/* keep track of data_loss in debugfs */
 		rkisp1->debug.data_loss++;
-- 
2.17.1

