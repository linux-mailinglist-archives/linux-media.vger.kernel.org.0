Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 5E2102453E3
	for <lists+linux-media@lfdr.de>; Sun, 16 Aug 2020 00:07:04 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728585AbgHOWHC (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sat, 15 Aug 2020 18:07:02 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45610 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728376AbgHOVus (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Sat, 15 Aug 2020 17:50:48 -0400
Received: from bhuna.collabora.co.uk (bhuna.collabora.co.uk [IPv6:2a00:1098:0:82:1000:25:2eeb:e3e3])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E7EE7C08EC65
        for <linux-media@vger.kernel.org>; Sat, 15 Aug 2020 03:37:59 -0700 (PDT)
Received: from [127.0.0.1] (localhost [127.0.0.1])
        (Authenticated sender: dafna)
        with ESMTPSA id 1514229A949
From:   Dafna Hirschfeld <dafna.hirschfeld@collabora.com>
To:     linux-media@vger.kernel.org
Cc:     laurent.pinchart@ideasonboard.com, dafna.hirschfeld@collabora.com,
        helen.koike@collabora.com, ezequiel@collabora.com,
        hverkuil@xs4all.nl, kernel@collabora.com, dafna3@gmail.com,
        sakari.ailus@linux.intel.com, linux-rockchip@lists.infradead.org,
        mchehab@kernel.org, tfiga@chromium.org
Subject: [PATCH v2 10/14] media: staging: rkisp1: isp: add a warning and debugfs var for irq delay
Date:   Sat, 15 Aug 2020 12:37:30 +0200
Message-Id: <20200815103734.31153-11-dafna.hirschfeld@collabora.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200815103734.31153-1-dafna.hirschfeld@collabora.com>
References: <20200815103734.31153-1-dafna.hirschfeld@collabora.com>
Sender: linux-media-owner@vger.kernel.org
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
 drivers/staging/media/rkisp1/rkisp1-common.h | 1 +
 drivers/staging/media/rkisp1/rkisp1-dev.c    | 2 ++
 drivers/staging/media/rkisp1/rkisp1-isp.c    | 5 +++++
 3 files changed, 8 insertions(+)

diff --git a/drivers/staging/media/rkisp1/rkisp1-common.h b/drivers/staging/media/rkisp1/rkisp1-common.h
index 79edece6ee77..5aed0e37850a 100644
--- a/drivers/staging/media/rkisp1/rkisp1-common.h
+++ b/drivers/staging/media/rkisp1/rkisp1-common.h
@@ -228,6 +228,7 @@ struct rkisp1_debug {
 	unsigned long outform_size_error;
 	unsigned long img_stabilization_size_error;
 	unsigned long inform_size_error;
+	unsigned long irq_delay;
 	unsigned long mipi_error;
 	unsigned long stats_error;
 	unsigned long stop_timeout[2];
diff --git a/drivers/staging/media/rkisp1/rkisp1-dev.c b/drivers/staging/media/rkisp1/rkisp1-dev.c
index a0eb8f08708b..557de940286b 100644
--- a/drivers/staging/media/rkisp1/rkisp1-dev.c
+++ b/drivers/staging/media/rkisp1/rkisp1-dev.c
@@ -445,6 +445,8 @@ static void rkisp1_debug_init(struct rkisp1_device *rkisp1)
 			     &debug->img_stabilization_size_error);
 	debugfs_create_ulong("inform_size_error", 0444,  debug->debugfs_dir,
 			     &debug->inform_size_error);
+	debugfs_create_ulong("irq_delay", 0444,  debug->debugfs_dir,
+			     &debug->irq_delay);
 	debugfs_create_ulong("mipi_error", 0444, debug->debugfs_dir,
 			     &debug->mipi_error);
 	debugfs_create_ulong("stats_error", 0444, debug->debugfs_dir,
diff --git a/drivers/staging/media/rkisp1/rkisp1-isp.c b/drivers/staging/media/rkisp1/rkisp1-isp.c
index 1ffe7cc7bb12..33cfad19dde2 100644
--- a/drivers/staging/media/rkisp1/rkisp1-isp.c
+++ b/drivers/staging/media/rkisp1/rkisp1-isp.c
@@ -1118,6 +1118,11 @@ void rkisp1_isp_isr(struct rkisp1_device *rkisp1)
 		 */
 		rkisp1->isp.frame_sequence++;
 		rkisp1_isp_queue_event_sof(&rkisp1->isp);
+		if (status & RKISP1_CIF_ISP_FRAME) {
+			WARN_ONCE(1, "irq delay is too long, buffers might not be in sync\n");
+			rkisp1->debug.irq_delay++;
+		}
+	}
 
 	if (status & RKISP1_CIF_ISP_PIC_SIZE_ERROR) {
 		/* Clear pic_size_error */
-- 
2.17.1

