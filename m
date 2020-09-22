Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 96F722740E6
	for <lists+linux-media@lfdr.de>; Tue, 22 Sep 2020 13:34:29 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726606AbgIVLeP (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 22 Sep 2020 07:34:15 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38964 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726600AbgIVLeO (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 22 Sep 2020 07:34:14 -0400
Received: from bhuna.collabora.co.uk (bhuna.collabora.co.uk [IPv6:2a00:1098:0:82:1000:25:2eeb:e3e3])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 30397C061755
        for <linux-media@vger.kernel.org>; Tue, 22 Sep 2020 04:34:14 -0700 (PDT)
Received: from guri.fritz.box (p200300c7cf13ec005877be1094b7a29d.dip0.t-ipconnect.de [IPv6:2003:c7:cf13:ec00:5877:be10:94b7:a29d])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        (Authenticated sender: dafna)
        by bhuna.collabora.co.uk (Postfix) with ESMTPSA id 6F65429B4BD;
        Tue, 22 Sep 2020 12:34:12 +0100 (BST)
From:   Dafna Hirschfeld <dafna.hirschfeld@collabora.com>
To:     linux-media@vger.kernel.org
Cc:     laurent.pinchart@ideasonboard.com, dafna.hirschfeld@collabora.com,
        helen.koike@collabora.com, ezequiel@collabora.com,
        hverkuil@xs4all.nl, kernel@collabora.com, dafna3@gmail.com,
        sakari.ailus@linux.intel.com, linux-rockchip@lists.infradead.org,
        mchehab@kernel.org, tfiga@chromium.org
Subject: [PATCH v3 07/12] media: staging: rkisp1: isp: add a warning and debugfs var for irq delay
Date:   Tue, 22 Sep 2020 13:33:57 +0200
Message-Id: <20200922113402.12442-8-dafna.hirschfeld@collabora.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200922113402.12442-1-dafna.hirschfeld@collabora.com>
References: <20200922113402.12442-1-dafna.hirschfeld@collabora.com>
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

The signal RKISP1_CIF_ISP_FRAME is set when the ISP completes
outputting the frame to the next block in the pipeline.
In order to keep buffer synchronization we assume that the
RKISP1_CIF_ISP_V_START signal never arrives together with the
RKISP1_CIF_ISP_FRAME signal.
In case those signals arrive together then the code is not able to
tell if the RKISP1_CIF_ISP_FRAME signal relates to the frame of
the current v-start or the previous. This patch adds a WARN_ONCE
and a debugfs var to catch it.

Signed-off-by: Dafna Hirschfeld <dafna.hirschfeld@collabora.com>
---
changes since v2:
remove unneeded closing "}" due to fixing
"media: staging: rkisp1: remove atomic operations for frame sequence"
---
 drivers/staging/media/rkisp1/rkisp1-common.h | 1 +
 drivers/staging/media/rkisp1/rkisp1-dev.c    | 2 ++
 drivers/staging/media/rkisp1/rkisp1-isp.c    | 4 ++++
 3 files changed, 7 insertions(+)

diff --git a/drivers/staging/media/rkisp1/rkisp1-common.h b/drivers/staging/media/rkisp1/rkisp1-common.h
index 51c92a251ea5..8c79679e67b8 100644
--- a/drivers/staging/media/rkisp1/rkisp1-common.h
+++ b/drivers/staging/media/rkisp1/rkisp1-common.h
@@ -326,6 +326,7 @@ struct rkisp1_debug {
 	unsigned long outform_size_error;
 	unsigned long img_stabilization_size_error;
 	unsigned long inform_size_error;
+	unsigned long irq_delay;
 	unsigned long mipi_error;
 	unsigned long stats_error;
 	unsigned long stop_timeout[2];
diff --git a/drivers/staging/media/rkisp1/rkisp1-dev.c b/drivers/staging/media/rkisp1/rkisp1-dev.c
index d85ac10e5494..91584695804b 100644
--- a/drivers/staging/media/rkisp1/rkisp1-dev.c
+++ b/drivers/staging/media/rkisp1/rkisp1-dev.c
@@ -444,6 +444,8 @@ static void rkisp1_debug_init(struct rkisp1_device *rkisp1)
 			     &debug->img_stabilization_size_error);
 	debugfs_create_ulong("inform_size_error", 0444,  debug->debugfs_dir,
 			     &debug->inform_size_error);
+	debugfs_create_ulong("irq_delay", 0444,  debug->debugfs_dir,
+			     &debug->irq_delay);
 	debugfs_create_ulong("mipi_error", 0444, debug->debugfs_dir,
 			     &debug->mipi_error);
 	debugfs_create_ulong("stats_error", 0444, debug->debugfs_dir,
diff --git a/drivers/staging/media/rkisp1/rkisp1-isp.c b/drivers/staging/media/rkisp1/rkisp1-isp.c
index 0e71d600dd2b..9020633c1b3f 100644
--- a/drivers/staging/media/rkisp1/rkisp1-isp.c
+++ b/drivers/staging/media/rkisp1/rkisp1-isp.c
@@ -1111,6 +1111,10 @@ void rkisp1_isp_isr(struct rkisp1_device *rkisp1)
 	if (status & RKISP1_CIF_ISP_V_START) {
 		rkisp1->isp.frame_sequence++;
 		rkisp1_isp_queue_event_sof(&rkisp1->isp);
+		if (status & RKISP1_CIF_ISP_FRAME) {
+			WARN_ONCE(1, "irq delay is too long, buffers might not be in sync\n");
+			rkisp1->debug.irq_delay++;
+		}
 	}
 	if (status & RKISP1_CIF_ISP_PIC_SIZE_ERROR) {
 		/* Clear pic_size_error */
-- 
2.17.1

