Return-Path: <linux-media+bounces-14251-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id C2BC991A78B
	for <lists+linux-media@lfdr.de>; Thu, 27 Jun 2024 15:12:39 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id E4E7E1C243CC
	for <lists+linux-media@lfdr.de>; Thu, 27 Jun 2024 13:12:38 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 35CBE18FC7E;
	Thu, 27 Jun 2024 13:10:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b="P3szRGYV"
X-Original-To: linux-media@vger.kernel.org
Received: from lelv0143.ext.ti.com (lelv0143.ext.ti.com [198.47.23.248])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BC6A7188CB4;
	Thu, 27 Jun 2024 13:10:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.47.23.248
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719493853; cv=none; b=B4ajCnrQQtr5bOPhSA1ZWeWTZYXumtuBVmSzbfQRw06hGsW9rHDrNAeJtWXKHrYxvk7OIk+elVGh6IVwOoh2QCHC0suwmpEoPSmHvK9OYEf1CjpKtpp3nhDkotOyRhdVDeyOqBJHrDORnz6lF6wQ+r1aMStHA84yBDh+udeN9O4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719493853; c=relaxed/simple;
	bh=yyxtthi9p6UTAr7uLnRPfVyD++ADD1tyats8zxjM5W4=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-ID:References:
	 In-Reply-To:To:CC; b=G2dQ2GMz0HLNMKSzvw2sZGZuoiTKss07O6OvMTor0tV3MPgrK4v/924aSLleT5IO2JVPWnuBYdHdLgmR+NkRXk8VzG2BYdKrLY0+bJ9CafrcTy+X3u7HDJhYxUZO/P2n1V4Y1uBxCkeN+hBqKG1TdQfyxUokuBDIWbi28UKaris=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com; spf=pass smtp.mailfrom=ti.com; dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b=P3szRGYV; arc=none smtp.client-ip=198.47.23.248
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ti.com
Received: from fllv0035.itg.ti.com ([10.64.41.0])
	by lelv0143.ext.ti.com (8.15.2/8.15.2) with ESMTP id 45RDAYnD110232;
	Thu, 27 Jun 2024 08:10:34 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1719493834;
	bh=PwOvTyxf/jW9XjXeX0PFsj+Ejzs5gpxyJIVQYJgwVz0=;
	h=From:Date:Subject:References:In-Reply-To:To:CC;
	b=P3szRGYVUnOYM7Zx+ndWQPIrBhSWSxM7GDwAGI4r9Z1nR+d64WtmvFpX3TeJ0qIdG
	 owklcIPU6N3+bZS+XjayrmRApA1g3PEql9Y+iB0HxQtvsVd2kMi1OFTX9sAQSr6OfV
	 DNCkK6RsqEEd8vx9qAQPoHl5ehuDNlrxQx1KBLFg=
Received: from DFLE111.ent.ti.com (dfle111.ent.ti.com [10.64.6.32])
	by fllv0035.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 45RDAYZv095663
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Thu, 27 Jun 2024 08:10:34 -0500
Received: from DFLE100.ent.ti.com (10.64.6.21) by DFLE111.ent.ti.com
 (10.64.6.32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Thu, 27
 Jun 2024 08:10:33 -0500
Received: from lelvsmtp6.itg.ti.com (10.180.75.249) by DFLE100.ent.ti.com
 (10.64.6.21) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Thu, 27 Jun 2024 08:10:33 -0500
Received: from localhost (jluthra.dhcp.ti.com [172.24.227.116])
	by lelvsmtp6.itg.ti.com (8.15.2/8.15.2) with ESMTP id 45RDAXmV038593;
	Thu, 27 Jun 2024 08:10:33 -0500
From: Jai Luthra <j-luthra@ti.com>
Date: Thu, 27 Jun 2024 18:40:01 +0530
Subject: [PATCH v2 06/13] media: ti: j721e-csi2rx: add a subdev for the
 core device
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-ID: <20240627-multistream-v2-6-6ae96c54c1c3@ti.com>
References: <20240627-multistream-v2-0-6ae96c54c1c3@ti.com>
In-Reply-To: <20240627-multistream-v2-0-6ae96c54c1c3@ti.com>
To: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>,
        Mauro Carvalho Chehab
	<mchehab@kernel.org>,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
        Hans
 Verkuil <hverkuil-cisco@xs4all.nl>,
        Vaishnav Achath <vaishnav.a@ti.com>,
        Maxime Ripard <mripard@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof
 Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Conor Dooley
	<conor+dt@kernel.org>
CC: <linux-media@vger.kernel.org>, <devicetree@vger.kernel.org>,
        Vignesh
 Raghavendra <vigneshr@ti.com>,
        Aradhya Bhatia <a-bhatia1@ti.com>, Devarsh
 Thakkar <devarsht@ti.com>,
        Changhuang Liang
	<changhuang.liang@starfivetech.com>,
        Jack Zhu <jack.zhu@starfivetech.com>,
        Julien Massot <julien.massot@collabora.com>,
        Laurent Pinchart
	<laurent.pinchart@ideasonboard.com>,
        Jai Luthra <j-luthra@ti.com>
X-Mailer: b4 0.12.4
X-Developer-Signature: v=1; a=openpgp-sha256; l=12457; i=j-luthra@ti.com;
 h=from:subject:message-id; bh=yyxtthi9p6UTAr7uLnRPfVyD++ADD1tyats8zxjM5W4=;
 b=owEBbQKS/ZANAwAIAUPekfkkmnFFAcsmYgBmfWS3b02P9ZA4mhKlEFNGdNQMFWHPJA8P1tRDq
 XF0jru5d7iJAjMEAAEIAB0WIQRN4NgY5dV16NRar8VD3pH5JJpxRQUCZn1ktwAKCRBD3pH5JJpx
 RT+gEACa39l4D6TDL+XbhiSvVfe2NppWwthwGpc4uAJ7aOoim5SzrsYciKgFkdk11y3EdMMZuDn
 D2M1A4Xz2Qms1uUNzj73y4bB8HYyZ3CSdIuWJAzQP3OXzO375qg8xiwItIff2wScRrd98SAJpQJ
 DMscw1hiq07UiJ0GwfnW9di8G4t5D59WK7d/IQ9dj86XoFe+a0KtbE9rlnUp7Ob1vi0ZtUeODSD
 VjxiiuuahAEttVKl/4D3WMKDH8VpxcAqpSMFXRO0dhn2XT+zGB9ifV0UocZmY/5rosWjY+ljZ5K
 F/YLxkaUXgOo+nfZuW0yw9Tg5Zg7Pwk3u3zFldpsBnesCTf/LwC7phEjiFXI7/7/fzChl58IhyC
 JBfe25VayrwKwit82FlcfVOcGdS+TbwDMB2TwBfc0w0nmF4LyR5vtojXk5rFMYLrDaVu8Wmw/Rv
 laR+3/KIPb8mqf26alhpVXvp/ouWnh/mZVA/0MSlDGtw/bRzKfacO/qoKATGV1B4bj6lxWt6IJn
 wZx7/zCBSFYsslX+9TWVwZVXgdBjCDJZDRWiU0ABDATHpp/HrQlACeiNbODspP+JeOnV9+3HKMO
 Q0wDVNwacEwN5dlBLqCtvYn7H4ps/Fb2xYXHg8ab8rM5pNooE4zAdyM+mbZ3aYkZchkJzygZTbA
 sMllvpLpqj717YA==
X-Developer-Key: i=j-luthra@ti.com; a=openpgp;
 fpr=4DE0D818E5D575E8D45AAFC543DE91F9249A7145
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180

With single stream capture, it was simpler to use the video device as
the media entity representing the main TI CSI2RX device. Now with multi
stream capture coming into the picture, the model has shifted to each
video device having a link to the main device's subdev. The routing
would then be set on this subdev.

Add this subdev, link each context to this subdev's entity and link the
subdev's entity to the source. Also add an array of media pads. It will
have one sink pad and source pads equal to the number of contexts.

Co-developed-by: Pratyush Yadav <p.yadav@ti.com>
Signed-off-by: Pratyush Yadav <p.yadav@ti.com>
Signed-off-by: Jai Luthra <j-luthra@ti.com>
---
 .../media/platform/ti/j721e-csi2rx/j721e-csi2rx.c  | 237 ++++++++++++++++++---
 1 file changed, 212 insertions(+), 25 deletions(-)

diff --git a/drivers/media/platform/ti/j721e-csi2rx/j721e-csi2rx.c b/drivers/media/platform/ti/j721e-csi2rx/j721e-csi2rx.c
index 361b0ea8e0d9..13d7426ab4ba 100644
--- a/drivers/media/platform/ti/j721e-csi2rx/j721e-csi2rx.c
+++ b/drivers/media/platform/ti/j721e-csi2rx/j721e-csi2rx.c
@@ -51,6 +51,11 @@
 #define MAX_WIDTH_BYTES			SZ_16K
 #define MAX_HEIGHT_LINES		SZ_16K
 
+#define TI_CSI2RX_PAD_SINK		0
+#define TI_CSI2RX_PAD_FIRST_SOURCE	1
+#define TI_CSI2RX_NUM_SOURCE_PADS	1
+#define TI_CSI2RX_NUM_PADS		(1 + TI_CSI2RX_NUM_SOURCE_PADS)
+
 #define DRAIN_TIMEOUT_MS		50
 #define DRAIN_BUFFER_SIZE		SZ_32K
 
@@ -97,6 +102,7 @@ struct ti_csi2rx_ctx {
 	struct mutex			mutex; /* To serialize ioctls. */
 	struct v4l2_format		v_fmt;
 	struct ti_csi2rx_dma		dma;
+	struct media_pad		pad;
 	u32				sequence;
 	u32				idx;
 };
@@ -104,12 +110,15 @@ struct ti_csi2rx_ctx {
 struct ti_csi2rx_dev {
 	struct device			*dev;
 	void __iomem			*shim;
+	struct mutex			mutex; /* To serialize ioctls. */
+	unsigned int			enable_count;
 	struct v4l2_device		v4l2_dev;
 	struct media_device		mdev;
 	struct media_pipeline		pipe;
-	struct media_pad		pad;
+	struct media_pad		pads[TI_CSI2RX_NUM_PADS];
 	struct v4l2_async_notifier	notifier;
 	struct v4l2_subdev		*source;
+	struct v4l2_subdev		subdev;
 	struct ti_csi2rx_ctx		ctx[TI_CSI2RX_NUM_CTX];
 	/* Buffer to drain stale data from PSI-L endpoint */
 	struct {
@@ -431,6 +440,15 @@ static int csi_async_notifier_complete(struct v4l2_async_notifier *notifier)
 	struct ti_csi2rx_dev *csi = dev_get_drvdata(notifier->v4l2_dev->dev);
 	int ret, i;
 
+	/* Create link from source to subdev */
+	ret = v4l2_create_fwnode_links_to_pad(csi->source,
+					      &csi->pads[TI_CSI2RX_PAD_SINK],
+					      MEDIA_LNK_FL_IMMUTABLE |
+					      MEDIA_LNK_FL_ENABLED);
+	if (ret)
+		return ret;
+
+	/* Create and link video nodes for all DMA contexts */
 	for (i = 0; i < TI_CSI2RX_NUM_CTX; i++) {
 		struct ti_csi2rx_ctx *ctx = &csi->ctx[i];
 		struct video_device *vdev = &ctx->vdev;
@@ -438,13 +456,17 @@ static int csi_async_notifier_complete(struct v4l2_async_notifier *notifier)
 		ret = video_register_device(vdev, VFL_TYPE_VIDEO, -1);
 		if (ret)
 			goto unregister_dev;
-	}
 
-	ret = v4l2_create_fwnode_links_to_pad(csi->source, &csi->pad,
-					      MEDIA_LNK_FL_IMMUTABLE |
-					      MEDIA_LNK_FL_ENABLED);
-	if (ret)
-		goto unregister_dev;
+		ret = media_create_pad_link(&csi->subdev.entity,
+					    TI_CSI2RX_PAD_FIRST_SOURCE + ctx->idx,
+					    &vdev->entity, 0,
+					    MEDIA_LNK_FL_IMMUTABLE |
+					    MEDIA_LNK_FL_ENABLED);
+		if (ret) {
+			video_unregister_device(vdev);
+			goto unregister_dev;
+		}
+	}
 
 	ret = v4l2_device_register_subdev_nodes(&csi->v4l2_dev);
 	if (ret)
@@ -859,7 +881,7 @@ static int ti_csi2rx_start_streaming(struct vb2_queue *vq, unsigned int count)
 	dma->state = TI_CSI2RX_DMA_ACTIVE;
 	spin_unlock_irqrestore(&dma->lock, flags);
 
-	ret = v4l2_subdev_call(csi->source, video, s_stream, 1);
+	ret = v4l2_subdev_call(&csi->subdev, video, s_stream, 1);
 	if (ret)
 		goto err_dma;
 
@@ -887,7 +909,7 @@ static void ti_csi2rx_stop_streaming(struct vb2_queue *vq)
 	writel(0, csi->shim + SHIM_CNTL);
 	writel(0, csi->shim + SHIM_DMACNTX(ctx->idx));
 
-	ret = v4l2_subdev_call(csi->source, video, s_stream, 0);
+	ret = v4l2_subdev_call(&csi->subdev, video, s_stream, 0);
 	if (ret)
 		dev_err(csi->dev, "Failed to stop subdev stream\n");
 
@@ -905,6 +927,119 @@ static const struct vb2_ops csi_vb2_qops = {
 	.wait_finish = vb2_ops_wait_finish,
 };
 
+static inline struct ti_csi2rx_dev *to_csi2rx_dev(struct v4l2_subdev *sd)
+{
+	return container_of(sd, struct ti_csi2rx_dev, subdev);
+}
+
+static int ti_csi2rx_sd_set_fmt(struct v4l2_subdev *sd,
+				struct v4l2_subdev_state *state,
+				struct v4l2_subdev_format *format)
+{
+	struct v4l2_mbus_framefmt *fmt;
+	int ret = 0;
+
+	/* No transcoding, don't allow setting source fmt */
+	if (format->pad >= TI_CSI2RX_PAD_FIRST_SOURCE)
+		return v4l2_subdev_get_fmt(sd, state, format);
+
+	if (!find_format_by_code(format->format.code))
+		format->format.code = ti_csi2rx_formats[0].code;
+
+	format->format.field = V4L2_FIELD_NONE;
+
+	fmt = v4l2_subdev_state_get_format(state, format->pad, format->stream);
+	if (!fmt) {
+		ret = -EINVAL;
+		goto out;
+	}
+	*fmt = format->format;
+
+	fmt = v4l2_subdev_state_get_format(state, TI_CSI2RX_PAD_FIRST_SOURCE,
+					   format->stream);
+	if (!fmt) {
+		ret = -EINVAL;
+		goto out;
+	}
+	*fmt = format->format;
+
+out:
+	return ret;
+}
+
+static int ti_csi2rx_sd_init_state(struct v4l2_subdev *sd,
+				   struct v4l2_subdev_state *state)
+{
+	struct v4l2_subdev_format format = {
+		.pad = TI_CSI2RX_PAD_SINK,
+		.format = {
+			.width = 640,
+			.height = 480,
+			.code = MEDIA_BUS_FMT_UYVY8_1X16,
+			.field = V4L2_FIELD_NONE,
+			.colorspace = V4L2_COLORSPACE_SRGB,
+			.ycbcr_enc = V4L2_YCBCR_ENC_601,
+			.quantization = V4L2_QUANTIZATION_LIM_RANGE,
+			.xfer_func = V4L2_XFER_FUNC_SRGB,
+		},
+	};
+
+	return ti_csi2rx_sd_set_fmt(sd, state, &format);
+}
+
+static int ti_csi2rx_sd_s_stream(struct v4l2_subdev *sd, int enable)
+{
+	struct ti_csi2rx_dev *csi = to_csi2rx_dev(sd);
+	int ret = 0;
+
+	mutex_lock(&csi->mutex);
+
+	if (enable) {
+		if (csi->enable_count > 0) {
+			csi->enable_count++;
+			goto out;
+		}
+
+		ret = v4l2_subdev_call(csi->source, video, s_stream, 1);
+		if (ret)
+			goto out;
+
+		csi->enable_count++;
+	} else {
+		if (csi->enable_count == 0) {
+			ret = -EINVAL;
+			goto out;
+		}
+
+		if (--csi->enable_count > 0)
+			goto out;
+
+		ret = v4l2_subdev_call(csi->source, video, s_stream, 0);
+	}
+
+out:
+	mutex_unlock(&csi->mutex);
+	return ret;
+}
+
+static const struct v4l2_subdev_pad_ops ti_csi2rx_subdev_pad_ops = {
+	.get_fmt = v4l2_subdev_get_fmt,
+	.set_fmt = ti_csi2rx_sd_set_fmt,
+};
+
+static const struct v4l2_subdev_video_ops ti_csi2rx_subdev_video_ops = {
+	.s_stream = ti_csi2rx_sd_s_stream,
+};
+
+static const struct v4l2_subdev_ops ti_csi2rx_subdev_ops = {
+	.video = &ti_csi2rx_subdev_video_ops,
+	.pad = &ti_csi2rx_subdev_pad_ops,
+};
+
+static const struct v4l2_subdev_internal_ops ti_csi2rx_internal_ops = {
+	.init_state = ti_csi2rx_sd_init_state,
+};
+
 static void ti_csi2rx_cleanup_dma(struct ti_csi2rx_ctx *ctx)
 {
 	dma_release_channel(ctx->dma.chan);
@@ -912,6 +1047,7 @@ static void ti_csi2rx_cleanup_dma(struct ti_csi2rx_ctx *ctx)
 
 static void ti_csi2rx_cleanup_v4l2(struct ti_csi2rx_dev *csi)
 {
+	v4l2_subdev_cleanup(&csi->subdev);
 	media_device_unregister(&csi->mdev);
 	v4l2_device_unregister(&csi->v4l2_dev);
 	media_device_cleanup(&csi->mdev);
@@ -973,14 +1109,22 @@ static int ti_csi2rx_link_validate(struct media_link *link)
 	struct v4l2_subdev_format source_fmt = {
 		.which	= V4L2_SUBDEV_FORMAT_ACTIVE,
 		.pad	= link->source->index,
+		.stream = 0,
 	};
+	struct v4l2_subdev_state *state;
 	const struct ti_csi2rx_fmt *ti_fmt;
 	int ret;
 
-	ret = v4l2_subdev_call_state_active(csi->source, pad,
-					    get_fmt, &source_fmt);
-	if (ret)
-		return ret;
+	state = v4l2_subdev_lock_and_get_active_state(&csi->subdev);
+	ret = v4l2_subdev_call(&csi->subdev, pad, get_fmt, state, &source_fmt);
+	v4l2_subdev_unlock_state(state);
+
+	if (ret) {
+		dev_dbg(csi->dev,
+			"Skipping validation as no format present on \"%s\":%u:0\n",
+			link->source->entity->name, link->source->index);
+		return 0;
+	}
 
 	if (source_fmt.format.width != csi_fmt->width) {
 		dev_dbg(csi->dev, "Width does not match (source %u, sink %u)\n",
@@ -1010,8 +1154,9 @@ static int ti_csi2rx_link_validate(struct media_link *link)
 
 	if (ti_fmt->fourcc != csi_fmt->pixelformat) {
 		dev_dbg(csi->dev,
-			"Cannot transform source fmt 0x%x to sink fmt 0x%x\n",
-			ti_fmt->fourcc, csi_fmt->pixelformat);
+			"Cannot transform \"%s\":%u format %p4cc to %p4cc\n",
+			link->source->entity->name, link->source->index,
+			&ti_fmt->fourcc, &csi_fmt->pixelformat);
 		return -EPIPE;
 	}
 
@@ -1022,6 +1167,10 @@ static const struct media_entity_operations ti_csi2rx_video_entity_ops = {
 	.link_validate = ti_csi2rx_link_validate,
 };
 
+static const struct media_entity_operations ti_csi2rx_subdev_entity_ops = {
+	.link_validate = v4l2_subdev_link_validate,
+};
+
 static int ti_csi2rx_init_dma(struct ti_csi2rx_ctx *ctx)
 {
 	struct dma_slave_config cfg = {
@@ -1053,7 +1202,8 @@ static int ti_csi2rx_init_dma(struct ti_csi2rx_ctx *ctx)
 static int ti_csi2rx_v4l2_init(struct ti_csi2rx_dev *csi)
 {
 	struct media_device *mdev = &csi->mdev;
-	int ret;
+	struct v4l2_subdev *sd = &csi->subdev;
+	int ret, i;
 
 	mdev->dev = csi->dev;
 	mdev->hw_revision = 1;
@@ -1065,16 +1215,50 @@ static int ti_csi2rx_v4l2_init(struct ti_csi2rx_dev *csi)
 
 	ret = v4l2_device_register(csi->dev, &csi->v4l2_dev);
 	if (ret)
-		return ret;
+		goto cleanup_media;
 
 	ret = media_device_register(mdev);
-	if (ret) {
-		v4l2_device_unregister(&csi->v4l2_dev);
-		media_device_cleanup(mdev);
-		return ret;
-	}
+	if (ret)
+		goto unregister_v4l2;
+
+	v4l2_subdev_init(sd, &ti_csi2rx_subdev_ops);
+	sd->internal_ops = &ti_csi2rx_internal_ops;
+	sd->entity.function = MEDIA_ENT_F_VID_IF_BRIDGE;
+	sd->flags = V4L2_SUBDEV_FL_HAS_DEVNODE;
+	strscpy(sd->name, dev_name(csi->dev), sizeof(sd->name));
+	sd->dev = csi->dev;
+	sd->entity.ops = &ti_csi2rx_subdev_entity_ops;
+
+	csi->pads[TI_CSI2RX_PAD_SINK].flags = MEDIA_PAD_FL_SINK;
+
+	for (i = TI_CSI2RX_PAD_FIRST_SOURCE; i < TI_CSI2RX_NUM_PADS; i++)
+		csi->pads[i].flags = MEDIA_PAD_FL_SOURCE;
+
+	ret = media_entity_pads_init(&sd->entity, ARRAY_SIZE(csi->pads),
+				     csi->pads);
+	if (ret)
+		goto unregister_media;
+
+	ret = v4l2_subdev_init_finalize(sd);
+	if (ret)
+		goto unregister_media;
+
+	ret = v4l2_device_register_subdev(&csi->v4l2_dev, sd);
+	if (ret)
+		goto cleanup_subdev;
 
 	return 0;
+
+cleanup_subdev:
+	v4l2_subdev_cleanup(sd);
+unregister_media:
+	media_device_unregister(mdev);
+unregister_v4l2:
+	v4l2_device_unregister(&csi->v4l2_dev);
+cleanup_media:
+	media_device_cleanup(mdev);
+
+	return ret;
 }
 
 static int ti_csi2rx_init_ctx(struct ti_csi2rx_ctx *ctx)
@@ -1101,9 +1285,9 @@ static int ti_csi2rx_init_ctx(struct ti_csi2rx_ctx *ctx)
 
 	ti_csi2rx_fill_fmt(fmt, &ctx->v_fmt);
 
-	csi->pad.flags = MEDIA_PAD_FL_SINK;
+	ctx->pad.flags = MEDIA_PAD_FL_SINK;
 	vdev->entity.ops = &ti_csi2rx_video_entity_ops;
-	ret = media_entity_pads_init(&ctx->vdev.entity, 1, &csi->pad);
+	ret = media_entity_pads_init(&ctx->vdev.entity, 1, &ctx->pad);
 	if (ret)
 		return ret;
 
@@ -1159,6 +1343,8 @@ static int ti_csi2rx_probe(struct platform_device *pdev)
 	if (!csi->drain.vaddr)
 		return -ENOMEM;
 
+	mutex_init(&csi->mutex);
+
 	ret = ti_csi2rx_v4l2_init(csi);
 	if (ret)
 		goto err_v4l2;
@@ -1191,6 +1377,7 @@ static int ti_csi2rx_probe(struct platform_device *pdev)
 		ti_csi2rx_cleanup_ctx(&csi->ctx[i]);
 	ti_csi2rx_cleanup_v4l2(csi);
 err_v4l2:
+	mutex_destroy(&csi->mutex);
 	dma_free_coherent(csi->dev, csi->drain.len, csi->drain.vaddr,
 			  csi->drain.paddr);
 	return ret;
@@ -1213,7 +1400,7 @@ static void ti_csi2rx_remove(struct platform_device *pdev)
 
 	ti_csi2rx_cleanup_notifier(csi);
 	ti_csi2rx_cleanup_v4l2(csi);
-
+	mutex_destroy(&csi->mutex);
 	dma_free_coherent(csi->dev, csi->drain.len, csi->drain.vaddr,
 			  csi->drain.paddr);
 }

-- 
2.43.0


