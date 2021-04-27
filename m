Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 3ED1A36C6E9
	for <lists+linux-media@lfdr.de>; Tue, 27 Apr 2021 15:20:42 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236384AbhD0NVT (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 27 Apr 2021 09:21:19 -0400
Received: from perceval.ideasonboard.com ([213.167.242.64]:48494 "EHLO
        perceval.ideasonboard.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236001AbhD0NVS (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 27 Apr 2021 09:21:18 -0400
Received: from deskari.lan (91-157-208-71.elisa-laajakaista.fi [91.157.208.71])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 2C0C2AF3;
        Tue, 27 Apr 2021 15:20:34 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1619529634;
        bh=DHfA3qrS0nVdkK+M2JWwGm1GBn++xrUAFhxB9zRD4y8=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=Ws1gFMTZHJz8XCVrPACKSdYoD32yH0uLMkT27apUhldZRMIxsxy5nXfcKK+yCzDYe
         Evu024GAtGf7luT48yzzaPduD205l14gLnaktHkPViF2cCJBW7RM5rlgOj41vq6WhJ
         QGeoJ9C1Ehk9hGaaxjBpgHadUcWwZriIPM1M83Xw=
From:   Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
To:     Benoit Parrot <bparrot@ti.com>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Pratyush Yadav <p.yadav@ti.com>,
        Lokesh Vutla <lokeshvutla@ti.com>, linux-media@vger.kernel.org
Cc:     sakari.ailus@linux.intel.com,
        Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
Subject: [PATCH 2/4] media: ti-vpe: cal: use frame desc to get vc and dt
Date:   Tue, 27 Apr 2021 16:20:26 +0300
Message-Id: <20210427132028.1005757-3-tomi.valkeinen@ideasonboard.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210427132028.1005757-1-tomi.valkeinen@ideasonboard.com>
References: <20210427132028.1005757-1-tomi.valkeinen@ideasonboard.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Use get_frame_desc() to get the frame desc from the connected source,
and use the provided virtual channel and datatype instead of hardcoded
ones.

get_frame_desc() works per stream, but as we don't support multiple
streams yet, we will just always use stream 0.

If the source doesn't support get_frame_desc(), fall back to the
previous method of always capturing virtual channel 0 and any datatype.

Signed-off-by: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
---
 drivers/media/platform/ti-vpe/cal-camerarx.c | 26 +++++++++++
 drivers/media/platform/ti-vpe/cal.c          | 49 +++++++++++++++++++-
 drivers/media/platform/ti-vpe/cal.h          |  3 ++
 3 files changed, 76 insertions(+), 2 deletions(-)

diff --git a/drivers/media/platform/ti-vpe/cal-camerarx.c b/drivers/media/platform/ti-vpe/cal-camerarx.c
index a4b783e038b5..36103f5af6e9 100644
--- a/drivers/media/platform/ti-vpe/cal-camerarx.c
+++ b/drivers/media/platform/ti-vpe/cal-camerarx.c
@@ -583,6 +583,32 @@ static int cal_camerarx_parse_dt(struct cal_camerarx *phy)
 	return ret;
 }
 
+int cal_camerarx_get_remote_frame_desc(struct cal_camerarx *phy,
+				       struct v4l2_mbus_frame_desc *fd)
+{
+	struct media_pad *pad;
+	int ret;
+
+	if (!phy->source)
+		return -ENODEV;
+
+	pad = media_entity_remote_pad(&phy->pads[CAL_CAMERARX_PAD_SINK]);
+	if (!pad)
+		return -ENODEV;
+
+	ret = v4l2_subdev_call(phy->source, pad, get_frame_desc, pad->index,
+			       fd);
+	if (ret)
+		return ret;
+
+	if (fd->type != V4L2_MBUS_FRAME_DESC_TYPE_CSI2) {
+		dev_err(phy->cal->dev, "Frame desc do not describe CSI-2 link");
+		return -EINVAL;
+	}
+
+	return 0;
+}
+
 /* ------------------------------------------------------------------
  *	V4L2 Subdev Operations
  * ------------------------------------------------------------------
diff --git a/drivers/media/platform/ti-vpe/cal.c b/drivers/media/platform/ti-vpe/cal.c
index fcc81024ae18..7975bb449acd 100644
--- a/drivers/media/platform/ti-vpe/cal.c
+++ b/drivers/media/platform/ti-vpe/cal.c
@@ -469,10 +469,56 @@ static bool cal_ctx_wr_dma_stopped(struct cal_ctx *ctx)
 	return stopped;
 }
 
+static int
+cal_get_remote_frame_desc_entry(struct cal_camerarx *phy, u32 stream,
+				struct v4l2_mbus_frame_desc_entry *entry)
+{
+	struct v4l2_mbus_frame_desc fd;
+	unsigned int i;
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
+	for (i = 0; i < fd.num_entries; i++) {
+		if (stream == fd.entry[i].stream) {
+			*entry = fd.entry[i];
+			return 0;
+		}
+	}
+
+	return -ENODEV;
+}
+
 int cal_ctx_prepare(struct cal_ctx *ctx)
 {
+	struct v4l2_mbus_frame_desc_entry entry;
 	int ret;
 
+	ret = cal_get_remote_frame_desc_entry(ctx->phy, ctx->stream, &entry);
+
+	if (ret == -ENOIOCTLCMD) {
+		ctx->vc = 0;
+		ctx->datatype = CAL_CSI2_CTX_DT_ANY;
+	} else if (!ret) {
+		ctx_dbg(2, ctx, "Framedesc: stream %u, len %u, vc %u, dt %#x\n",
+		       entry.stream,
+		       entry.length,
+		       entry.bus.csi2.vc,
+		       entry.bus.csi2.dt);
+
+		ctx->vc = entry.bus.csi2.vc;
+		ctx->datatype = entry.bus.csi2.dt;
+	} else {
+		ctx_err(ctx, "Failed to get remote frame desc: %d\n", ret);
+		return ret;
+	}
+
 	ctx->use_pix_proc = !ctx->fmtinfo->meta;
 
 	if (ctx->use_pix_proc) {
@@ -925,8 +971,7 @@ static struct cal_ctx *cal_ctx_create(struct cal_dev *cal, int inst)
 	ctx->dma_ctx = inst;
 	ctx->csi2_ctx = inst;
 	ctx->cport = inst;
-	ctx->vc = 0;
-	ctx->datatype = CAL_CSI2_CTX_DT_ANY;
+	ctx->stream = 0;
 
 	ret = cal_ctx_v4l2_init(ctx);
 	if (ret)
diff --git a/drivers/media/platform/ti-vpe/cal.h b/drivers/media/platform/ti-vpe/cal.h
index 29b865d1a238..3aea444f8bf8 100644
--- a/drivers/media/platform/ti-vpe/cal.h
+++ b/drivers/media/platform/ti-vpe/cal.h
@@ -245,6 +245,7 @@ struct cal_ctx {
 	u8			pix_proc;
 	u8			vc;
 	u8			datatype;
+	u32			stream;
 
 	bool			use_pix_proc;
 };
@@ -318,6 +319,8 @@ const struct cal_format_info *cal_format_by_code(u32 code);
 
 void cal_quickdump_regs(struct cal_dev *cal);
 
+int cal_camerarx_get_remote_frame_desc(struct cal_camerarx *phy,
+				       struct v4l2_mbus_frame_desc *fd);
 void cal_camerarx_disable(struct cal_camerarx *phy);
 void cal_camerarx_i913_errata(struct cal_camerarx *phy);
 struct cal_camerarx *cal_camerarx_create(struct cal_dev *cal,
-- 
2.25.1

