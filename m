Return-Path: <linux-media+bounces-41229-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 7B035B397B1
	for <lists+linux-media@lfdr.de>; Thu, 28 Aug 2025 11:01:02 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id C8CED466FC5
	for <lists+linux-media@lfdr.de>; Thu, 28 Aug 2025 09:01:01 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A3D8F2FFDD0;
	Thu, 28 Aug 2025 08:59:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=samsung.com header.i=@samsung.com header.b="aI9Np7hy"
X-Original-To: linux-media@vger.kernel.org
Received: from mailout1.samsung.com (mailout1.samsung.com [203.254.224.24])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3852B2FF657
	for <linux-media@vger.kernel.org>; Thu, 28 Aug 2025 08:59:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=203.254.224.24
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756371588; cv=none; b=F9w3GdoTy/luAL5JYzz4TsdhALu+sYRLVRak7lyvKkQm/Y37iB0/o1Qry7P8XqhscUGlCjN1iJQJIHF+6SY2WhAoCx20DOw65B9kLuh8aUAiiyBdhAEqytMpSnJjVZiO0B0BbvLDandcHJtFRFtiafgceCZh4Gmw2q6DJOjMEa8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756371588; c=relaxed/simple;
	bh=y69aJvaC7ciZ5Hf9QaOQ87FPgv9BOZJHu+NQjvRatRw=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:MIME-Version:
	 Content-Type:References; b=doRap+2B/OCuVqAd2z+fEZlH5r7+rn8jeZMwNGpEPRiD04NGuMZSQtR+evI99o2OD7N6NGNRM2jl3vW7Ew+B1Gt19+Jg69HU+2WsCYNvPS44MjuI7mIshn3+78L14y2nlQAIuwp3yOHulUHQrKmKksmoRAGQJw2Ic1LJh6S7jA8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=samsung.com; spf=pass smtp.mailfrom=samsung.com; dkim=pass (1024-bit key) header.d=samsung.com header.i=@samsung.com header.b=aI9Np7hy; arc=none smtp.client-ip=203.254.224.24
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=samsung.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=samsung.com
Received: from epcas5p4.samsung.com (unknown [182.195.41.42])
	by mailout1.samsung.com (KnoxPortal) with ESMTP id 20250828085944epoutp019de9f54a781d8c01326bc52bfc96ca51~f4qaBKNi41200712007epoutp01p
	for <linux-media@vger.kernel.org>; Thu, 28 Aug 2025 08:59:44 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout1.samsung.com 20250828085944epoutp019de9f54a781d8c01326bc52bfc96ca51~f4qaBKNi41200712007epoutp01p
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
	s=mail20170921; t=1756371584;
	bh=MiHBdJbfHrVtpDhp68bjMjb9GJcwMtqCUnZwS8iakKU=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=aI9Np7hyuBLbHIWLY0jpDY7dsMh/oXWangAfqzVGy2BjMExfkD8HDLTqQfWIQfBvB
	 vCDaAxcbUylGe9nfbShqx8TZoiuM+clQqBCsQdMV+hnZMgExL6/0k68lMutJs8EfRH
	 VF4Uaavl1LgH7jTyk8oCNByXJV/yaQz1AYx7bRCc=
Received: from epsnrtp02.localdomain (unknown [182.195.42.154]) by
	epcas5p2.samsung.com (KnoxPortal) with ESMTPS id
	20250828085943epcas5p2abc570ed0afce51201230b0a623628f4~f4qZiduZm0593805938epcas5p2s;
	Thu, 28 Aug 2025 08:59:43 +0000 (GMT)
Received: from epcas5p3.samsung.com (unknown [182.195.38.86]) by
	epsnrtp02.localdomain (Postfix) with ESMTP id 4cCFhZ6w18z2SSKZ; Thu, 28 Aug
	2025 08:59:42 +0000 (GMT)
Received: from epsmtip2.samsung.com (unknown [182.195.34.31]) by
	epcas5p3.samsung.com (KnoxPortal) with ESMTPA id
	20250828085942epcas5p3724f3184a1b12c20a8016c89f7e47ba7~f4qX9omGJ1633316333epcas5p3d;
	Thu, 28 Aug 2025 08:59:42 +0000 (GMT)
Received: from cheetah.samsungds.net (unknown [107.109.115.53]) by
	epsmtip2.samsung.com (KnoxPortal) with ESMTPA id
	20250828085939epsmtip2842c1ef84d867f70baaae3e4d034b56d~f4qVS88A00283502835epsmtip2X;
	Thu, 28 Aug 2025 08:59:39 +0000 (GMT)
From: Inbaraj E <inbaraj.e@samsung.com>
To: rmfrfs@gmail.com, laurent.pinchart@ideasonboard.com, martink@posteo.de,
	kernel@puri.sm, mchehab@kernel.org, robh@kernel.org, krzk+dt@kernel.org,
	conor+dt@kernel.org, shawnguo@kernel.org, s.hauer@pengutronix.de
Cc: kernel@pengutronix.de, festevam@gmail.com, linux-media@vger.kernel.org,
	devicetree@vger.kernel.org, imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	linux-samsung-soc@vger.kernel.org, pankaj.dubey@samsung.com,
	ravi.patel@samsung.com, shradha.t@samsung.com, Inbaraj E
	<inbaraj.e@samsung.com>
Subject: [PATCH v3 5/7] media: imx-mipi-csis: Add support for dynamic VC
 selection
Date: Thu, 28 Aug 2025 14:29:09 +0530
Message-ID: <20250828085911.81266-6-inbaraj.e@samsung.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250828085911.81266-1-inbaraj.e@samsung.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CMS-MailID: 20250828085942epcas5p3724f3184a1b12c20a8016c89f7e47ba7
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
CMS-TYPE: 105P
cpgsPolicy: CPGSC10-541,Y
X-CFilter-Loop: Reflected
X-CMS-RootMailID: 20250828085942epcas5p3724f3184a1b12c20a8016c89f7e47ba7
References: <20250828085911.81266-1-inbaraj.e@samsung.com>
	<CGME20250828085942epcas5p3724f3184a1b12c20a8016c89f7e47ba7@epcas5p3.samsung.com>

The existing implementation configures VC0 by default for streaming.
This patch adds support to obtain the VC dynamically from the
subdevice(Sensor) through the get_frame_desc() operation and configure
the corresponding VC when starting the stream.

If get_frame_desc() is not implemented by the subdevice, VC0 will be
selected by default for configuration and streaming.

Signed-off-by: Inbaraj E <inbaraj.e@samsung.com>
---
 drivers/media/platform/nxp/imx-mipi-csis.c | 61 ++++++++++++++++++----
 1 file changed, 51 insertions(+), 10 deletions(-)

diff --git a/drivers/media/platform/nxp/imx-mipi-csis.c b/drivers/media/platform/nxp/imx-mipi-csis.c
index 2443906377bd..b7ab441cc78a 100644
--- a/drivers/media/platform/nxp/imx-mipi-csis.c
+++ b/drivers/media/platform/nxp/imx-mipi-csis.c
@@ -334,6 +334,7 @@ struct mipi_csis_device {
 	struct regulator *mipi_phy_regulator;
 
 	const struct mipi_csis_info *info;
+	unsigned int vc;
 	unsigned int num_channels;
 
 	struct v4l2_subdev sd;
@@ -585,7 +586,7 @@ static void __mipi_csis_set_format(struct mipi_csis_device *csis,
 	u32 val;
 
 	/* Color format */
-	val = mipi_csis_read(csis, MIPI_CSIS_ISP_CONFIG_CH(0));
+	val = mipi_csis_read(csis, MIPI_CSIS_ISP_CONFIG_CH(csis->vc));
 	val &= ~(MIPI_CSIS_ISPCFG_PARALLEL | MIPI_CSIS_ISPCFG_PIXEL_MODE_MASK |
 		 MIPI_CSIS_ISPCFG_DATAFORMAT_MASK);
 
@@ -606,10 +607,10 @@ static void __mipi_csis_set_format(struct mipi_csis_device *csis,
 		val |= MIPI_CSIS_ISPCFG_PIXEL_MODE_DUAL;
 
 	val |= MIPI_CSIS_ISPCFG_DATAFORMAT(csis_fmt->data_type);
-	mipi_csis_write(csis, MIPI_CSIS_ISP_CONFIG_CH(0), val);
+	mipi_csis_write(csis, MIPI_CSIS_ISP_CONFIG_CH(csis->vc), val);
 
 	/* Pixel resolution */
-	mipi_csis_write(csis, MIPI_CSIS_ISP_RESOL_CH(0),
+	mipi_csis_write(csis, MIPI_CSIS_ISP_RESOL_CH(csis->vc),
 			MIPI_CSIS_ISP_RESOL_VRESOL(format->height) |
 			MIPI_CSIS_ISP_RESOL_HRESOL(format->width));
 }
@@ -683,14 +684,14 @@ static void mipi_csis_set_params(struct mipi_csis_device *csis,
 			MIPI_CSIS_DPHY_CMN_CTRL_HSSETTLE(csis->hs_settle) |
 			MIPI_CSIS_DPHY_CMN_CTRL_CLKSETTLE(csis->clk_settle));
 
-	mipi_csis_write(csis, MIPI_CSIS_ISP_SYNC_CH(0),
+	mipi_csis_write(csis, MIPI_CSIS_ISP_SYNC_CH(csis->vc),
 			MIPI_CSIS_ISP_SYNC_HSYNC_LINTV(0) |
 			MIPI_CSIS_ISP_SYNC_VSYNC_SINTV(0) |
 			MIPI_CSIS_ISP_SYNC_VSYNC_EINTV(0));
 
 	val = mipi_csis_read(csis, MIPI_CSIS_CLK_CTRL);
-	val |= MIPI_CSIS_CLK_CTRL_WCLK_SRC(0);
-	val |= MIPI_CSIS_CLK_CTRL_CLKGATE_TRAIL(0, 15);
+	val |= MIPI_CSIS_CLK_CTRL_WCLK_SRC(csis->vc);
+	val |= MIPI_CSIS_CLK_CTRL_CLKGATE_TRAIL(csis->vc, 15);
 	val &= ~MIPI_CSIS_CLK_CTRL_CLKGATE_EN_MSK;
 	mipi_csis_write(csis, MIPI_CSIS_CLK_CTRL, val);
 
@@ -707,7 +708,7 @@ static void mipi_csis_set_params(struct mipi_csis_device *csis,
 	/* Update the shadow register. */
 	val = mipi_csis_read(csis, MIPI_CSIS_CMN_CTRL);
 	mipi_csis_write(csis, MIPI_CSIS_CMN_CTRL,
-			val | MIPI_CSIS_CMN_CTRL_UPDATE_SHADOW(0) |
+			val | MIPI_CSIS_CMN_CTRL_UPDATE_SHADOW(csis->vc) |
 			MIPI_CSIS_CMN_CTRL_UPDATE_SHADOW_CTRL);
 }
 
@@ -778,7 +779,7 @@ static void mipi_csis_queue_event_sof(struct mipi_csis_device *csis)
 	};
 	u32 frame;
 
-	frame = mipi_csis_read(csis, MIPI_CSIS_FRAME_COUNTER_CH(0));
+	frame = mipi_csis_read(csis, MIPI_CSIS_FRAME_COUNTER_CH(csis->vc));
 	event.u.frame_sync.frame_sequence = frame;
 	v4l2_event_queue(csis->sd.devnode, &event);
 }
@@ -810,7 +811,7 @@ static irqreturn_t mipi_csis_irq_handler(int irq, void *dev_id)
 		}
 	}
 
-	if (status & MIPI_CSIS_INT_SRC_FRAME_START(0))
+	if (status & MIPI_CSIS_INT_SRC_FRAME_START(csis->vc))
 		mipi_csis_queue_event_sof(csis);
 
 	spin_unlock_irqrestore(&csis->slock, flags);
@@ -1191,7 +1192,7 @@ static int mipi_csis_get_frame_desc(struct v4l2_subdev *sd, unsigned int pad,
 
 	entry->flags = 0;
 	entry->pixelcode = csis_fmt->code;
-	entry->bus.csi2.vc = 0;
+	entry->bus.csi2.vc = csis->vc;
 	entry->bus.csi2.dt = csis_fmt->data_type;
 
 	return 0;
@@ -1269,6 +1270,39 @@ static const struct v4l2_subdev_internal_ops mipi_csis_internal_ops = {
 	.init_state		= mipi_csis_init_state,
 };
 
+static int mipi_csis_get_vc(struct mipi_csis_device *csis)
+{
+	struct v4l2_mbus_frame_desc fd = { };
+	int ret;
+
+	ret = v4l2_subdev_call(csis->source.sd, pad, get_frame_desc, csis->source.pad->index, &fd);
+	if (ret < 0 && ret != -ENOIOCTLCMD) {
+		dev_err(csis->dev, "get_frame_desc failed on source subdev\n");
+		return ret;
+	}
+
+	/* If remote subdev does not implement .get_frame_desc default to VC0 */
+	if (ret == -ENOIOCTLCMD)
+		return 0;
+
+	if (fd.type != V4L2_MBUS_FRAME_DESC_TYPE_CSI2) {
+		dev_err(csis->dev, "get_frame_desc returned invalid bus type %d\n", fd.type);
+		return -EINVAL;
+	}
+
+	if (!fd.num_entries) {
+		dev_err(csis->dev, "get_frame_desc returned zero enteries\n");
+		return -EINVAL;
+	}
+
+	if (fd.entry[0].bus.csi2.vc >= csis->num_channels) {
+		dev_err(csis->dev, "get_frame_desc returned invalid virtual channel\n");
+		return -EINVAL;
+	}
+
+	return fd.entry[0].bus.csi2.vc;
+}
+
 /* -----------------------------------------------------------------------------
  * Media entity operations
  */
@@ -1296,6 +1330,13 @@ static int mipi_csis_link_setup(struct media_entity *entity,
 
 		csis->source.sd = remote_sd;
 		csis->source.pad = remote_pad;
+
+		ret = mipi_csis_get_vc(csis);
+
+		if (ret < 0)
+			return -EBUSY;
+
+		csis->vc = ret;
 	} else {
 		csis->source.sd = NULL;
 		csis->source.pad = NULL;
-- 
2.49.0


