Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 666B93A65D1
	for <lists+linux-media@lfdr.de>; Mon, 14 Jun 2021 13:43:57 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236252AbhFNLmU (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 14 Jun 2021 07:42:20 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45580 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235719AbhFNLlW (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 14 Jun 2021 07:41:22 -0400
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [IPv6:2001:4b98:dc2:55:216:3eff:fef7:d647])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 69C64C061141
        for <linux-media@vger.kernel.org>; Mon, 14 Jun 2021 04:37:58 -0700 (PDT)
Received: from deskari.lan (91-158-153-130.elisa-laajakaista.fi [91.158.153.130])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 15C5E5EA1;
        Mon, 14 Jun 2021 13:24:09 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1623669849;
        bh=HLAtHQjVW51OT/r5VKK+VNTh13Vyva15atefN87rQis=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=Mr2r84NhTbd/wQLUw1JS9nfa0/Y+r8EGoQKLe9Yofpzw/oBh7aQeuAlVtoNnGoSkb
         h8zPGPMDv2Dlya4R0w+wQXp6QMuFC58yZag0CTfwtvIvkQXCUOQV4nGk0qll8XxnP9
         K52HgwEuQYMWOQ6bpUN/26dRujyhbMcnlwvv61HQ=
From:   Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
To:     linux-media@vger.kernel.org, Lokesh Vutla <lokeshvutla@ti.com>,
        Pratyush Yadav <p.yadav@ti.com>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc:     Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
Subject: [PATCH v4 17/35] media: ti-vpe: cal: allocate pix proc dynamically
Date:   Mon, 14 Jun 2021 14:23:27 +0300
Message-Id: <20210614112345.2032435-18-tomi.valkeinen@ideasonboard.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210614112345.2032435-1-tomi.valkeinen@ideasonboard.com>
References: <20210614112345.2032435-1-tomi.valkeinen@ideasonboard.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

CAL has 4 pixel processing units but the units are not needed e.g. for
metadata. As we could be capturing 4 pixel streams and 4 metadata
streams, i.e. using 8 DMA contexts, we cannot assign a pixel processing
unit to every DMA context. Instead we need to reserve a pixel processing
unit only when needed.

Add functions to reserve and release a pix proc unit, and use them in
cal_ctx_prepare/unprepare. Note that for the time being we still always
reserve a pix proc unit.

Signed-off-by: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
---
 drivers/media/platform/ti-vpe/cal.c | 44 +++++++++++++++++++++++++++--
 drivers/media/platform/ti-vpe/cal.h |  2 ++
 2 files changed, 44 insertions(+), 2 deletions(-)

diff --git a/drivers/media/platform/ti-vpe/cal.c b/drivers/media/platform/ti-vpe/cal.c
index 8d3e46899ad6..92240dfa7b78 100644
--- a/drivers/media/platform/ti-vpe/cal.c
+++ b/drivers/media/platform/ti-vpe/cal.c
@@ -290,6 +290,37 @@ void cal_quickdump_regs(struct cal_dev *cal)
  * ------------------------------------------------------------------
  */
 
+#define CAL_MAX_PIX_PROC 4
+
+static int cal_reserve_pix_proc(struct cal_dev *cal)
+{
+	unsigned long ret;
+
+	spin_lock(&cal->v4l2_dev.lock);
+
+	ret = find_first_zero_bit(&cal->reserved_pix_proc_mask, CAL_MAX_PIX_PROC);
+
+	if (ret == CAL_MAX_PIX_PROC) {
+		spin_unlock(&cal->v4l2_dev.lock);
+		return -ENOSPC;
+	}
+
+	cal->reserved_pix_proc_mask |= BIT(ret);
+
+	spin_unlock(&cal->v4l2_dev.lock);
+
+	return ret;
+}
+
+static void cal_release_pix_proc(struct cal_dev *cal, unsigned int pix_proc_num)
+{
+	spin_lock(&cal->v4l2_dev.lock);
+
+	cal->reserved_pix_proc_mask &= ~BIT(pix_proc_num);
+
+	spin_unlock(&cal->v4l2_dev.lock);
+}
+
 static void cal_ctx_csi2_config(struct cal_ctx *ctx)
 {
 	u32 val;
@@ -433,12 +464,22 @@ static bool cal_ctx_wr_dma_stopped(struct cal_ctx *ctx)
 
 int cal_ctx_prepare(struct cal_ctx *ctx)
 {
+	int ret;
+
+	ret = cal_reserve_pix_proc(ctx->cal);
+	if (ret < 0) {
+		ctx_err(ctx, "Failed to reserve pix proc: %d\n", ret);
+		return ret;
+	}
+
+	ctx->pix_proc = ret;
+
 	return 0;
 }
 
 void cal_ctx_unprepare(struct cal_ctx *ctx)
 {
-
+	cal_release_pix_proc(ctx->cal, ctx->pix_proc);
 }
 
 void cal_ctx_start(struct cal_ctx *ctx)
@@ -873,7 +914,6 @@ static struct cal_ctx *cal_ctx_create(struct cal_dev *cal, int inst)
 	ctx->dma_ctx = inst;
 	ctx->csi2_ctx = inst;
 	ctx->cport = inst;
-	ctx->pix_proc = inst;
 
 	ret = cal_ctx_v4l2_init(ctx);
 	if (ret)
diff --git a/drivers/media/platform/ti-vpe/cal.h b/drivers/media/platform/ti-vpe/cal.h
index e4db2a905f68..5d8b3193be7d 100644
--- a/drivers/media/platform/ti-vpe/cal.h
+++ b/drivers/media/platform/ti-vpe/cal.h
@@ -188,6 +188,8 @@ struct cal_dev {
 	struct media_device	mdev;
 	struct v4l2_device	v4l2_dev;
 	struct v4l2_async_notifier notifier;
+
+	unsigned long		reserved_pix_proc_mask;
 };
 
 /*
-- 
2.25.1

