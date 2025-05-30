Return-Path: <linux-media+bounces-33677-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 31F6CAC90B2
	for <lists+linux-media@lfdr.de>; Fri, 30 May 2025 15:54:54 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 835E6A41991
	for <lists+linux-media@lfdr.de>; Fri, 30 May 2025 13:53:39 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7C925233134;
	Fri, 30 May 2025 13:51:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="ECXFzOK/"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5E23423185E;
	Fri, 30 May 2025 13:51:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748613109; cv=none; b=BmjOpJVOtFGKKwrbaa8CtvQDvTc5qqWYY/w+BDRozzIFAmL71H7jI+R3/gNDG7M3OpH5c/cIWAQwXneVcfYBJqsfRGLVHeMx632iwiWHtWA7Lx+XmjYNtRpJvhll3P4mwJhSkz3BSjFiWWe37I/giJRGp4nk5/HN+D5nLE+kASE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748613109; c=relaxed/simple;
	bh=OMIeYdUtXu63h6bre0JQxBRXMomRsy32y7R+INsUhcY=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=V0X/OgJfYFx4mE7z+v2I6ugnN7lGFxiezI0pQXT1e62obumMj5ohVQuLFxKMIEtdeiBoUgKwNR4FVUFma3XkWzOw/VTGEfRquO7nyOufob6sWu1+fDZfJyXPQw22dyVs6i6U7aSbtZd6XSYQaWBL0+cCX6os3f1RIbazx8Prxb4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=ECXFzOK/; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from [127.0.1.1] (91-158-153-178.elisa-laajakaista.fi [91.158.153.178])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 4BF628D4;
	Fri, 30 May 2025 15:51:08 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1748613068;
	bh=OMIeYdUtXu63h6bre0JQxBRXMomRsy32y7R+INsUhcY=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=ECXFzOK/E/vxzBzunOzMdEI6iQ5/XzSsSohwW+E12NbFNtx2tTyYKy38IFpRo3udm
	 YObdlGp/bth3m8QOp0HNKxhGG9IWfd6tOd10k4pbKCyjn4F+bq5TWFeK300IHHmI5M
	 6PuPnxrGxZNVqlbCVwSZq1jafmvzmLTQFD1irRZ0=
From: Tomi Valkeinen <tomi.valkeinen+renesas@ideasonboard.com>
Date: Fri, 30 May 2025 16:50:39 +0300
Subject: [PATCH v3 10/15] media: rcar-csi2: Add .get_frame_desc op
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250530-rcar-streams-v3-10-026655df7138@ideasonboard.com>
References: <20250530-rcar-streams-v3-0-026655df7138@ideasonboard.com>
In-Reply-To: <20250530-rcar-streams-v3-0-026655df7138@ideasonboard.com>
To: =?utf-8?q?Niklas_S=C3=B6derlund?= <niklas.soderlund@ragnatech.se>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>, 
 Sakari Ailus <sakari.ailus@linux.intel.com>
Cc: linux-media@vger.kernel.org, linux-renesas-soc@vger.kernel.org, 
 linux-kernel@vger.kernel.org, 
 =?utf-8?q?Niklas_S=C3=B6derlund?= <niklas.soderlund+renesas@ragnatech.se>, 
 Mauro Carvalho Chehab <mchehab+huawei@kernel.org>, 
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>, 
 Jacopo Mondi <jacopo.mondi@ideasonboard.com>, 
 Tomi Valkeinen <tomi.valkeinen+renesas@ideasonboard.com>
X-Mailer: b4 0.15-dev-c25d1
X-Developer-Signature: v=1; a=openpgp-sha256; l=2471;
 i=tomi.valkeinen+renesas@ideasonboard.com; h=from:subject:message-id;
 bh=OMIeYdUtXu63h6bre0JQxBRXMomRsy32y7R+INsUhcY=;
 b=owEBbQKS/ZANAwAIAfo9qoy8lh71AcsmYgBoObfeadzC5/4IupfxQN53rx28ztvd8xN0C4A3Q
 44+5JJoR26JAjMEAAEIAB0WIQTEOAw+ll79gQef86f6PaqMvJYe9QUCaDm33gAKCRD6PaqMvJYe
 9TJdD/472GcPjV/Rj4xMlW+/l1FKOBp6oC9S3TBrChTGU1uUq2Sd6oLtAINgzmjpt1FwiYdfXPN
 auKfJpEE1d8VaHmBuUjGcVhYYWmDBzG+gwvCcqsL/a5U3rl8Ew7ZskQzt2STvutsyVvXRBUaGDo
 02cmJGw1sZIfpRLWvy/gdssi/gHSIxI/VUC2rVv9c4raZHAD4G3VlC3+73G7Sv5GzQb6etNPJZO
 21ZH6fSC8HDMZU2xL7vFhhw8io+E6Ogdv+elXOKT78jrRaZWb3DlZnhjZkMy6frY5fVsUtmPvzt
 IDoMWQhY15XGepVJ0lUPOyrjD5Se3elilKMNxxc3HFrRjf+QINL/B4bIfiFpbLOzpEzO5F1HP+f
 31+09MZFN5L7+w54S7aw7tlqiW5Dohr37MouLTMJBdGyzahvUe4QIThWUmg01C8QaB4qq2Sngqq
 6Cb6GTeuwG8G1c+Dr7fMya5u7P7z0LqMpGQ7JzcuNnoj5n1Rm5pVuyPHjYLZNfNc6hd3i1+zSEL
 e6JOKbJA3pt2SIBB0uSCyS1XvEauoe6ynWuPk+9xsSyj+n8WFWBp1Pu8tCzb8rhFp6LN1wJDs9f
 f3/M8mfKdCzQMAv/8uoPeJbVZkK0xfydX2bWExSsiIm8uKodxRLTL3ZSwGH8y4X8f1NoBaxGTFL
 E7cQ+RoQLeY4xvA==
X-Developer-Key: i=tomi.valkeinen+renesas@ideasonboard.com; a=openpgp;
 fpr=C4380C3E965EFD81079FF3A7FA3DAA8CBC961EF5

Add v4l2_subdev_pad_ops.get_frame_desc() implementation.

We also implement a fallback for the case where the upstream subdevice
does not implement .get_frame_desc. It assumes a single stream with VC =
0 and DT based on the configured stream mbus format.

Signed-off-by: Tomi Valkeinen <tomi.valkeinen+renesas@ideasonboard.com>
---
 drivers/media/platform/renesas/rcar-csi2.c | 56 ++++++++++++++++++++++++++++++
 1 file changed, 56 insertions(+)

diff --git a/drivers/media/platform/renesas/rcar-csi2.c b/drivers/media/platform/renesas/rcar-csi2.c
index 20bd44274bd2..65c7f3040696 100644
--- a/drivers/media/platform/renesas/rcar-csi2.c
+++ b/drivers/media/platform/renesas/rcar-csi2.c
@@ -1676,12 +1676,68 @@ static int rcsi2_set_pad_format(struct v4l2_subdev *sd,
 	return 0;
 }
 
+static int rcsi2_get_frame_desc_fallback(struct v4l2_subdev *sd,
+					 unsigned int pad,
+					 struct v4l2_mbus_frame_desc *fd)
+{
+	const struct rcar_csi2_format *format;
+	struct v4l2_subdev_state *state;
+	struct v4l2_mbus_framefmt *fmt;
+	int ret = 0;
+
+	state = v4l2_subdev_lock_and_get_active_state(sd);
+
+	fmt = v4l2_subdev_state_get_format(state, RCAR_CSI2_SINK, 0);
+	if (!fmt) {
+		ret = -EINVAL;
+		goto out;
+	}
+
+	format = rcsi2_code_to_fmt(fmt->code);
+	if (!format) {
+		ret = -EINVAL;
+		goto out;
+	}
+
+	fd->num_entries = 1;
+	fd->type = V4L2_MBUS_FRAME_DESC_TYPE_CSI2;
+	fd->entry[0].stream = 0;
+	fd->entry[0].pixelcode = fmt->code;
+	fd->entry[0].bus.csi2.vc = 0;
+	fd->entry[0].bus.csi2.dt = format->datatype;
+
+out:
+	v4l2_subdev_unlock_state(state);
+
+	return ret;
+}
+
+static int rcsi2_get_frame_desc(struct v4l2_subdev *sd, unsigned int pad,
+				struct v4l2_mbus_frame_desc *fd)
+{
+	struct rcar_csi2 *priv = sd_to_csi2(sd);
+	int ret;
+
+	if (WARN_ON(!priv->info->use_isp))
+		return -ENOTTY;
+
+	if (WARN_ON(pad != RCAR_CSI2_SOURCE_VC0))
+		return -EINVAL;
+
+	ret = v4l2_subdev_get_frame_desc_passthrough(sd, pad, fd);
+	if (ret == -ENOIOCTLCMD)
+		ret = rcsi2_get_frame_desc_fallback(sd, pad, fd);
+	return ret;
+}
+
 static const struct v4l2_subdev_pad_ops rcar_csi2_pad_ops = {
 	.enable_streams = rcsi2_enable_streams,
 	.disable_streams = rcsi2_disable_streams,
 
 	.set_fmt = rcsi2_set_pad_format,
 	.get_fmt = v4l2_subdev_get_fmt,
+
+	.get_frame_desc = rcsi2_get_frame_desc,
 };
 
 static const struct v4l2_subdev_ops rcar_csi2_subdev_ops = {

-- 
2.43.0


