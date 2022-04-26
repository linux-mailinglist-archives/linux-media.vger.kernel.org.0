Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 3F68950F1A5
	for <lists+linux-media@lfdr.de>; Tue, 26 Apr 2022 09:03:15 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1343606AbiDZHGN (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 26 Apr 2022 03:06:13 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48122 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1343605AbiDZHGM (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 26 Apr 2022 03:06:12 -0400
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [IPv6:2001:4b98:dc2:55:216:3eff:fef7:d647])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9F80D6D4C0
        for <linux-media@vger.kernel.org>; Tue, 26 Apr 2022 00:03:05 -0700 (PDT)
Received: from deskari.lan (91-156-85-209.elisa-laajakaista.fi [91.156.85.209])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id C1EB3B2A;
        Tue, 26 Apr 2022 09:03:01 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1650956582;
        bh=7PKNIw9bu27CR8YSFttzwWz41EeUv2qUanCyC6XliCs=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=jHiN01gNxyGjTdnJcHSmyRKwya3DqQmmwAHZihiaOlx7XcPe4UmZlVktUEysSG+Tf
         QXkJryD/Tir0TJfA4XtsPpvp1+TJQEaYpPGI+QmyBhXQpBFtEO+i2PKH4Kuz6n+t2Q
         4bwG+goO+vdBE+GyOrZfYf39ZlJ6mHlORzuattFk=
From:   Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
To:     linux-media@vger.kernel.org, sakari.ailus@linux.intel.com,
        Jacopo Mondi <jacopo+renesas@jmondi.org>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        niklas.soderlund+renesas@ragnatech.se,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        Pratyush Yadav <p.yadav@ti.com>, satish.nagireddy@getcruise.com
Cc:     Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
Subject: [PATCH v2 3/3] media: ti: cal: use frame desc to get vc and dt
Date:   Tue, 26 Apr 2022 10:02:40 +0300
Message-Id: <20220426070240.68100-4-tomi.valkeinen@ideasonboard.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220426070240.68100-1-tomi.valkeinen@ideasonboard.com>
References: <20220426070240.68100-1-tomi.valkeinen@ideasonboard.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_PASS,SPF_PASS
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Use get_frame_desc() to get the frame desc from the connected source,
and use the provided virtual channel and datatype instead of hardcoded
ones.

get_frame_desc() can contain multiple streams, but as we don't support
multiple streams yet, we will just always use the first stream.

If the source doesn't support get_frame_desc(), fall back to the
previous method of always capturing virtual channel 0 and any datatype.

Signed-off-by: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
---
 drivers/media/platform/ti/cal/cal-camerarx.c | 27 +++++++++++
 drivers/media/platform/ti/cal/cal.c          | 49 +++++++++++++++++++-
 drivers/media/platform/ti/cal/cal.h          |  2 +
 3 files changed, 76 insertions(+), 2 deletions(-)

diff --git a/drivers/media/platform/ti/cal/cal-camerarx.c b/drivers/media/platform/ti/cal/cal-camerarx.c
index 6b43a1525b45..e69fed117fea 100644
--- a/drivers/media/platform/ti/cal/cal-camerarx.c
+++ b/drivers/media/platform/ti/cal/cal-camerarx.c
@@ -583,6 +583,33 @@ static int cal_camerarx_parse_dt(struct cal_camerarx *phy)
 	return ret;
 }
 
+int cal_camerarx_get_remote_frame_desc(struct cal_camerarx *phy,
+				       struct v4l2_mbus_frame_desc *desc)
+{
+	struct media_pad *pad;
+	int ret;
+
+	if (!phy->source)
+		return -EPIPE;
+
+	pad = media_entity_remote_pad(&phy->pads[CAL_CAMERARX_PAD_SINK]);
+	if (!pad)
+		return -EPIPE;
+
+	ret = v4l2_subdev_call(phy->source, pad, get_frame_desc, pad->index,
+			       desc);
+	if (ret)
+		return ret;
+
+	if (desc->type != V4L2_MBUS_FRAME_DESC_TYPE_CSI2) {
+		dev_err(phy->cal->dev,
+			"Frame descriptor does not describe CSI-2 link");
+		return -EINVAL;
+	}
+
+	return 0;
+}
+
 /* ------------------------------------------------------------------
  *	V4L2 Subdev Operations
  * ------------------------------------------------------------------
diff --git a/drivers/media/platform/ti/cal/cal.c b/drivers/media/platform/ti/cal/cal.c
index 4a4a6c5983f7..df66b8192349 100644
--- a/drivers/media/platform/ti/cal/cal.c
+++ b/drivers/media/platform/ti/cal/cal.c
@@ -469,10 +469,57 @@ static bool cal_ctx_wr_dma_stopped(struct cal_ctx *ctx)
 	return stopped;
 }
 
+static int
+cal_get_remote_frame_desc_entry(struct cal_camerarx *phy,
+				struct v4l2_mbus_frame_desc_entry *entry)
+{
+	struct v4l2_mbus_frame_desc fd;
+	int ret;
+
+	ret = cal_camerarx_get_remote_frame_desc(phy, &fd);
+	if (ret) {
+		if (ret != -ENOIOCTLCMD)
+			dev_err(phy->cal->dev,
+				"Failed to get remote frame desc: %d\n", ret);
+		return ret;
+	}
+
+	if (fd.num_entries == 0) {
+		dev_err(phy->cal->dev,
+			"No streams found in the remote frame descriptor\n");
+
+		return -ENODEV;
+	}
+
+	if (fd.num_entries > 1)
+		dev_dbg(phy->cal->dev,
+			"Multiple streams not supported in remote frame descriptor, using the first one\n");
+
+	*entry = fd.entry[0];
+
+	return 0;
+}
+
 int cal_ctx_prepare(struct cal_ctx *ctx)
 {
+	struct v4l2_mbus_frame_desc_entry entry;
 	int ret;
 
+	ret = cal_get_remote_frame_desc_entry(ctx->phy, &entry);
+
+	if (ret == -ENOIOCTLCMD) {
+		ctx->vc = 0;
+		ctx->datatype = CAL_CSI2_CTX_DT_ANY;
+	} else if (!ret) {
+		ctx_dbg(2, ctx, "Framedesc: len %u, vc %u, dt %#x\n",
+			entry.length, entry.bus.csi2.vc, entry.bus.csi2.dt);
+
+		ctx->vc = entry.bus.csi2.vc;
+		ctx->datatype = entry.bus.csi2.dt;
+	} else {
+		return ret;
+	}
+
 	ctx->use_pix_proc = !ctx->fmtinfo->meta;
 
 	if (ctx->use_pix_proc) {
@@ -936,8 +983,6 @@ static struct cal_ctx *cal_ctx_create(struct cal_dev *cal, int inst)
 	ctx->dma_ctx = inst;
 	ctx->csi2_ctx = inst;
 	ctx->cport = inst;
-	ctx->vc = 0;
-	ctx->datatype = CAL_CSI2_CTX_DT_ANY;
 
 	ret = cal_ctx_v4l2_init(ctx);
 	if (ret)
diff --git a/drivers/media/platform/ti/cal/cal.h b/drivers/media/platform/ti/cal/cal.h
index 527e22d022f3..61409ddced98 100644
--- a/drivers/media/platform/ti/cal/cal.h
+++ b/drivers/media/platform/ti/cal/cal.h
@@ -323,6 +323,8 @@ const struct cal_format_info *cal_format_by_code(u32 code);
 
 void cal_quickdump_regs(struct cal_dev *cal);
 
+int cal_camerarx_get_remote_frame_desc(struct cal_camerarx *phy,
+				       struct v4l2_mbus_frame_desc *desc);
 void cal_camerarx_disable(struct cal_camerarx *phy);
 void cal_camerarx_i913_errata(struct cal_camerarx *phy);
 struct cal_camerarx *cal_camerarx_create(struct cal_dev *cal,
-- 
2.34.1

