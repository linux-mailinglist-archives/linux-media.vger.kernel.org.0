Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 0584D215E79
	for <lists+linux-media@lfdr.de>; Mon,  6 Jul 2020 20:38:22 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729861AbgGFShj (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 6 Jul 2020 14:37:39 -0400
Received: from perceval.ideasonboard.com ([213.167.242.64]:45202 "EHLO
        perceval.ideasonboard.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729695AbgGFShi (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Mon, 6 Jul 2020 14:37:38 -0400
Received: from pendragon.bb.dnainternet.fi (81-175-216-236.bb.dnainternet.fi [81.175.216.236])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 25CDDAC6;
        Mon,  6 Jul 2020 20:37:32 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1594060652;
        bh=s2PAK9og/7k10AYoeLymCzLkPl7uCC4ubzCOGj3pa+M=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=A9wYrk6HInLel2j0sORAU4k+j5dFNBoXZzcsV1YUsEYi3nZ4V9hPNY117CWNT8TcO
         MTj/Z7+pNj3FgupXmGam8eBl5COlk8jEE2W89ONmMu/HI7crEt8zgaKDtaU1DM2kV6
         rxgIK/116SJoo08EkMWM7TpKOcKNK8ClVuN+xEig=
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     linux-media@vger.kernel.org
Cc:     Tomi Valkeinen <tomi.valkeinen@ti.com>,
        Benoit Parrot <bparrot@ti.com>
Subject: [PATCH v2 010/108] media: ti-vpe: cal: Remove needless variable initialization
Date:   Mon,  6 Jul 2020 21:35:31 +0300
Message-Id: <20200706183709.12238-11-laurent.pinchart@ideasonboard.com>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20200706183709.12238-1-laurent.pinchart@ideasonboard.com>
References: <20200706183709.12238-1-laurent.pinchart@ideasonboard.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

A few local variables are needlessly initialized. Fix them.

Signed-off-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Reviewed-by: Tomi Valkeinen <tomi.valkeinen@ti.com>
Reviewed-by: Benoit Parrot <bparrot@ti.com>
---
 drivers/media/platform/ti-vpe/cal.c | 18 +++++++++---------
 1 file changed, 9 insertions(+), 9 deletions(-)

diff --git a/drivers/media/platform/ti-vpe/cal.c b/drivers/media/platform/ti-vpe/cal.c
index 3668c4d445fe..d0390b23426d 100644
--- a/drivers/media/platform/ti-vpe/cal.c
+++ b/drivers/media/platform/ti-vpe/cal.c
@@ -616,8 +616,8 @@ static struct cc_data *cc_create(struct cal_dev *dev, unsigned int core)
  */
 static void cal_get_hwinfo(struct cal_dev *dev)
 {
-	u32 revision = 0;
-	u32 hwinfo = 0;
+	u32 revision;
+	u32 hwinfo;
 
 	revision = reg_read(dev, CAL_HL_REVISION);
 	cal_dbg(3, dev, "CAL_HL_REVISION = 0x%08x (expecting 0x40000200)\n",
@@ -1302,7 +1302,7 @@ static int cal_enum_fmt_vid_cap(struct file *file, void  *priv,
 				struct v4l2_fmtdesc *f)
 {
 	struct cal_ctx *ctx = video_drvdata(file);
-	const struct cal_fmt *fmt = NULL;
+	const struct cal_fmt *fmt;
 
 	if (f->index >= ctx->num_active_fmt)
 		return -EINVAL;
@@ -1655,7 +1655,7 @@ static void cal_buffer_queue(struct vb2_buffer *vb)
 	struct cal_buffer *buf = container_of(vb, struct cal_buffer,
 					      vb.vb2_buf);
 	struct cal_dmaqueue *vidq = &ctx->vidq;
-	unsigned long flags = 0;
+	unsigned long flags;
 
 	/* recheck locking */
 	spin_lock_irqsave(&ctx->slock, flags);
@@ -1668,7 +1668,7 @@ static int cal_start_streaming(struct vb2_queue *vq, unsigned int count)
 	struct cal_ctx *ctx = vb2_get_drv_priv(vq);
 	struct cal_dmaqueue *dma_q = &ctx->vidq;
 	struct cal_buffer *buf, *tmp;
-	unsigned long addr = 0;
+	unsigned long addr;
 	unsigned long flags;
 	int ret;
 
@@ -2008,7 +2008,7 @@ static struct device_node *
 of_get_next_port(const struct device_node *parent,
 		 struct device_node *prev)
 {
-	struct device_node *port = NULL;
+	struct device_node *port;
 
 	if (!parent)
 		return NULL;
@@ -2052,7 +2052,7 @@ static struct device_node *
 of_get_next_endpoint(const struct device_node *parent,
 		     struct device_node *prev)
 {
-	struct device_node *ep = NULL;
+	struct device_node *ep;
 
 	if (!parent)
 		return NULL;
@@ -2266,8 +2266,8 @@ static int cal_probe(struct platform_device *pdev)
 	struct cal_dev *dev;
 	struct cal_ctx *ctx;
 	struct device_node *parent = pdev->dev.of_node;
-	struct regmap *syscon_camerrx = NULL;
-	u32 syscon_camerrx_offset = 0;
+	struct regmap *syscon_camerrx;
+	u32 syscon_camerrx_offset;
 	int ret;
 	int irq;
 	int i;
-- 
Regards,

Laurent Pinchart

