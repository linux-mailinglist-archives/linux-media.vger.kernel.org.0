Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 4C33454BA26
	for <lists+linux-media@lfdr.de>; Tue, 14 Jun 2022 21:12:08 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1345170AbiFNTMH (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 14 Jun 2022 15:12:07 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52124 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S245174AbiFNTMG (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 14 Jun 2022 15:12:06 -0400
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [IPv6:2001:4b98:dc2:55:216:3eff:fef7:d647])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 287C320BC5
        for <linux-media@vger.kernel.org>; Tue, 14 Jun 2022 12:12:01 -0700 (PDT)
Received: from pyrite.rasen.tech (softbank036240126034.bbtec.net [36.240.126.34])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id C036AF95;
        Tue, 14 Jun 2022 21:11:55 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1655233919;
        bh=kFkq9EYQIYVYHtcJ4C11CNQqT3UkvhgAxURDV/zltyQ=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=Tb9ZhQwoW6KiLThS8fkam+w+mRotLEPZ0SszpXIfNe0D27QAYBarRr9fnLHEALkC6
         OtzDab+vvXYa9ojnF6XzFiMEEqixPz/YrSRUWVsYsB7H+Cv9OYJTe2MHIPbwsne60N
         UG5w/0Ji5GVMHOQZBYLJQCTCLj2f3VoFq1nY4SMY=
From:   Paul Elder <paul.elder@ideasonboard.com>
To:     linux-media@vger.kernel.org
Cc:     Paul Elder <paul.elder@ideasonboard.com>, dafna@fastmail.com,
        heiko@sntech.de, laurent.pinchart@ideasonboard.com,
        jeanmichel.hautbois@ideasonboard.com, jacopo@jmondi.org,
        djrscally@gmail.com, helen.koike@collabora.com,
        linux-rockchip@lists.infradead.org
Subject: [PATCH 03/55] media: rkisp1: debug: Add debugfs files to monitor MI and ISP interrupts
Date:   Wed, 15 Jun 2022 04:10:35 +0900
Message-Id: <20220614191127.3420492-4-paul.elder@ideasonboard.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20220614191127.3420492-1-paul.elder@ideasonboard.com>
References: <20220614191127.3420492-1-paul.elder@ideasonboard.com>
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

Add files in debugfs to monitor some of the interrupts of the MI and
ISP. Add the appropriate holder variables in the rkisp1_debug struct as
well.

Signed-off-by: Paul Elder <paul.elder@ideasonboard.com>
---
 .../platform/rockchip/rkisp1/rkisp1-common.h  |  9 +++++++++
 .../platform/rockchip/rkisp1/rkisp1-debug.c   | 20 +++++++++++++++++++
 2 files changed, 29 insertions(+)

diff --git a/drivers/media/platform/rockchip/rkisp1/rkisp1-common.h b/drivers/media/platform/rockchip/rkisp1/rkisp1-common.h
index 4243ff5e2197..a67fe7b1dfa1 100644
--- a/drivers/media/platform/rockchip/rkisp1/rkisp1-common.h
+++ b/drivers/media/platform/rockchip/rkisp1/rkisp1-common.h
@@ -364,6 +364,15 @@ struct rkisp1_debug {
 	unsigned long stats_error;
 	unsigned long stop_timeout[2];
 	unsigned long frame_drop[2];
+	unsigned long mi_irq_mblk_line_count;
+	unsigned long mi_irq_fill_mp_y_count;
+	unsigned long mi_irq_frame_count;
+	unsigned long mi_irq_wrap_mp_y_count;
+	unsigned long mi_irq_wrap_mp_cb_count;
+	unsigned long mi_irq_wrap_mp_cr_count;
+	unsigned long isp_irq_v_start_count;
+	unsigned long isp_irq_frame_count;
+	unsigned long isp_irq_frame_in_count;
 };
 
 /*
diff --git a/drivers/media/platform/rockchip/rkisp1/rkisp1-debug.c b/drivers/media/platform/rockchip/rkisp1/rkisp1-debug.c
index 1a59c00fabdd..02854e8ea1a4 100644
--- a/drivers/media/platform/rockchip/rkisp1/rkisp1-debug.c
+++ b/drivers/media/platform/rockchip/rkisp1/rkisp1-debug.c
@@ -220,6 +220,26 @@ void rkisp1_debug_init(struct rkisp1_device *rkisp1)
 	debugfs_create_file("input_status", 0444, debug->debugfs_dir, rkisp1,
 			    &rkisp1_debug_input_status_fops);
 
+	debugfs_create_ulong("mi_irq_mblk_line_count", 0444, debug->debugfs_dir,
+			     &debug->mi_irq_mblk_line_count);
+	debugfs_create_ulong("mi_irq_fill_mp_y_count", 0444, debug->debugfs_dir,
+			     &debug->mi_irq_fill_mp_y_count);
+	debugfs_create_ulong("mi_irq_frame_count", 0444, debug->debugfs_dir,
+			     &debug->mi_irq_frame_count);
+	debugfs_create_ulong("mi_irq_wrap_mp_y_count", 0444, debug->debugfs_dir,
+			     &debug->mi_irq_wrap_mp_y_count);
+	debugfs_create_ulong("mi_irq_wrap_mp_cb_count", 0444, debug->debugfs_dir,
+			     &debug->mi_irq_wrap_mp_cb_count);
+	debugfs_create_ulong("mi_irq_wrap_mp_cr_count", 0444, debug->debugfs_dir,
+			     &debug->mi_irq_wrap_mp_cr_count);
+
+	debugfs_create_ulong("isp_irq_v_start_count", 0444, debug->debugfs_dir,
+			     &debug->isp_irq_v_start_count);
+	debugfs_create_ulong("isp_irq_frame_count", 0444, debug->debugfs_dir,
+			     &debug->isp_irq_frame_count);
+	debugfs_create_ulong("isp_irq_frame_in_count", 0444, debug->debugfs_dir,
+			     &debug->isp_irq_frame_in_count);
+
 	regs_dir = debugfs_create_dir("regs", debug->debugfs_dir);
 
 	debugfs_create_file("core", 0444, regs_dir, rkisp1,
-- 
2.30.2

