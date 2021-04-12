Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 1BFE035C552
	for <lists+linux-media@lfdr.de>; Mon, 12 Apr 2021 13:35:37 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S240565AbhDLLfx (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 12 Apr 2021 07:35:53 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44698 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S240553AbhDLLfu (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 12 Apr 2021 07:35:50 -0400
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [IPv6:2001:4b98:dc2:55:216:3eff:fef7:d647])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CD56AC061574
        for <linux-media@vger.kernel.org>; Mon, 12 Apr 2021 04:35:31 -0700 (PDT)
Received: from deskari.lan (91-157-208-71.elisa-laajakaista.fi [91.157.208.71])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id BD795E70;
        Mon, 12 Apr 2021 13:35:28 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1618227329;
        bh=Bj+uanVzx5YWUV4c5GD9UxGSnMKHxMyIXmoqYcJj+NU=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=KcrDTFAAWGfzim5oO5q1YVKd68fkRWr0SIN8q9qDXGyC9EASzHMbqszZb0ZuSBaYu
         0DLEpr2koNg9UsfSqFTi3pl+Ifl7lUxKOVAR/VXcM0eiSMP0yTn8057cGMi0PAqSva
         KrNwkW8zPUPXkQJrdnETMb5vdpF/KWWn3uFdzdrw=
From:   Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
To:     Benoit Parrot <bparrot@ti.com>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Pratyush Yadav <p.yadav@ti.com>,
        Lokesh Vutla <lokeshvutla@ti.com>, linux-media@vger.kernel.org
Cc:     Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
Subject: [PATCH 16/28] media: ti-vpe: cal: disable ppi and pix proc at ctx_stop
Date:   Mon, 12 Apr 2021 14:34:45 +0300
Message-Id: <20210412113457.328012-17-tomi.valkeinen@ideasonboard.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210412113457.328012-1-tomi.valkeinen@ideasonboard.com>
References: <20210412113457.328012-1-tomi.valkeinen@ideasonboard.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Disable PPI and pix proc in cal_ctx_stop() to ensure they are not used
if the same context is used later on a different PHY or without pix
proc.

Signed-off-by: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
---
 drivers/media/platform/ti-vpe/cal.c | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/drivers/media/platform/ti-vpe/cal.c b/drivers/media/platform/ti-vpe/cal.c
index 092041ddbcfb..a6ca341c98bd 100644
--- a/drivers/media/platform/ti-vpe/cal.c
+++ b/drivers/media/platform/ti-vpe/cal.c
@@ -484,6 +484,12 @@ void cal_ctx_stop(struct cal_ctx *ctx)
 		  CAL_HL_IRQ_WDMA_START_MASK(ctx->dma_ctx));
 
 	ctx->dma.state = CAL_DMA_STOPPED;
+
+	/* Disable PPI context */
+	cal_write(ctx->cal, CAL_CSI2_CTX(ctx->phy->instance, ctx->ppi_ctx), 0);
+
+	/* Disable pix proc */
+	cal_write(ctx->cal, CAL_PIX_PROC(ctx->pix_proc), 0);
 }
 
 /* ------------------------------------------------------------------
-- 
2.25.1

