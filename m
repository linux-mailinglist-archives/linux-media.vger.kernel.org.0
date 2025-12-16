Return-Path: <linux-media+bounces-48905-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 7771ACC40D7
	for <lists+linux-media@lfdr.de>; Tue, 16 Dec 2025 16:50:02 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id D06CE309F222
	for <lists+linux-media@lfdr.de>; Tue, 16 Dec 2025 15:46:08 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7214B35505F;
	Tue, 16 Dec 2025 15:19:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="jAIvc0ID"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AD095352FAD;
	Tue, 16 Dec 2025 15:19:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765898369; cv=none; b=pq66VvkiEWZPy+MDn0cV+CpoXCSZo1B8Tb+pmCefnpQfzK9c04amnuZU6679hqm+HuOyVwkkH5Xlm/IKCAPdrzJ3d3d3h/HS9wC78TdIIo0N12MFg7ikmTkfq5Xi8IIl/P+JG6JyR+myFv3dp5OsbWYsC/CGT0rP/cL1YHXhOW4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765898369; c=relaxed/simple;
	bh=dhK3uD+Ut+8LJFD1lnLJkekf7X3cpMpIVzZnITUPmuc=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=MGJDMcmgyUKwEhtNRgBXV0DZAQ+qoPFJvlpOnjYkVjr1mArSPaJrTiMVdFlO5rbdVHuBkkadHEtkogcFgJ/nT4ItYibTKI7S1IbUilXABOmv8MUsB2CjU6cG5UrIbo3VOKLwt3juzABobTo3i5uMw8/QMgY8l+xw1gjXW2/+hLU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=jAIvc0ID; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from [127.0.1.1] (91-158-153-178.elisa-laajakaista.fi [91.158.153.178])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 92EAB594;
	Tue, 16 Dec 2025 16:19:07 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1765898348;
	bh=dhK3uD+Ut+8LJFD1lnLJkekf7X3cpMpIVzZnITUPmuc=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=jAIvc0IDr3Mfyv2X7rdmDZUw2ln3/D2Yqr4nFZQHb9wS9oDMReTm0Nhj0FIh8+GCM
	 V0irtkeN55O3HR/rSA/MN3z8kcF9QphRd4Kkmm/mvQEFfODWE4GP7qJA5BtuNsPQY8
	 UycidPQPE6OgGClevBWDA1yt/r4zUeKu06+n28uM=
From: Tomi Valkeinen <tomi.valkeinen+renesas@ideasonboard.com>
Date: Tue, 16 Dec 2025 17:18:28 +0200
Subject: [PATCH v4 11/15] media: rcar-csi2: Add .get_frame_desc op
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251216-rcar-streams-v4-11-f28b4831cc67@ideasonboard.com>
References: <20251216-rcar-streams-v4-0-f28b4831cc67@ideasonboard.com>
In-Reply-To: <20251216-rcar-streams-v4-0-f28b4831cc67@ideasonboard.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=2753;
 i=tomi.valkeinen+renesas@ideasonboard.com; h=from:subject:message-id;
 bh=dhK3uD+Ut+8LJFD1lnLJkekf7X3cpMpIVzZnITUPmuc=;
 b=owEBbQKS/ZANAwAIAfo9qoy8lh71AcsmYgBpQXhmNVeW0hlujPsjS4BTqkBrTm+M2BMWWfUz3
 /owcFNl71aJAjMEAAEIAB0WIQTEOAw+ll79gQef86f6PaqMvJYe9QUCaUF4ZgAKCRD6PaqMvJYe
 9T87D/9dqArUf0CC4gfOtNWsTEgsBaai1JTpwPzdFZuQwOvxP1YeaEy+U4iVdbOHoNUCzXRIX9d
 qs1yu8/7tg7vI0j/6dFeIApQ2C1CjO9LVUXmVsPLdnjR/KNi9im82RnFfd4JYOtUJfBqxldobmQ
 J5VSKGTbeXSHf71sx2wx4pwyLhz2dQwQhEMlmcF68haAX6iMgq60jXG867bctBrv9jWuI5DfCPg
 Hh2JvQbjM4VVlDEtegTbTeYiRIVx8hrJTY/u1Fw9G4wIC/9tM2hDiRLG7hMYVlJ/9N9Bdw6xIEU
 9gqgM8bJnUfTeTsdranmjtqrP+xaUBoYHGPIGaRjWEg6vB71RMm2kytb3xRilCpgXXde6ql5gTy
 XQYnH7aqFRTZVGwbMNSGf7fAbwDLj1oRZZMd95OLXY/OdOA0icRy9h20auW1FkvkFwgWyE5Wbq2
 GqSmKlOuRJZgpocHdmbqDbiSCG9qHiLPeZmThoYwdiuxZtzs8FC33CcT1NCisT4hKS9c0s0GA/H
 ltwZ8phjVOYG+6YwFw2m0Fa2EdmKHgHUua+HIXHCqOTe7ZVePCad1lCDxxgAbH8PRDf2pqVSTMh
 BKoIPHMYxztH57VBoIikn5F3mefJp39Dg9BQwBMVYs2NtWBM0kmxtQxdiCeGKvg4qcXyOPoLbEm
 xhUN84EF3/osEzQ==
X-Developer-Key: i=tomi.valkeinen+renesas@ideasonboard.com; a=openpgp;
 fpr=C4380C3E965EFD81079FF3A7FA3DAA8CBC961EF5

Add v4l2_subdev_pad_ops.get_frame_desc() implementation.

We also implement a fallback for the case where the upstream subdevice
does not implement .get_frame_desc. It assumes a single stream with VC =
0 and DT based on the configured stream mbus format.

Signed-off-by: Tomi Valkeinen <tomi.valkeinen+renesas@ideasonboard.com>
---
 drivers/media/platform/renesas/rcar-csi2.c | 70 ++++++++++++++++++++++++++++++
 1 file changed, 70 insertions(+)

diff --git a/drivers/media/platform/renesas/rcar-csi2.c b/drivers/media/platform/renesas/rcar-csi2.c
index ad62c95c8f9a..b8baf7c65e90 100644
--- a/drivers/media/platform/renesas/rcar-csi2.c
+++ b/drivers/media/platform/renesas/rcar-csi2.c
@@ -1935,12 +1935,82 @@ static int rcsi2_set_pad_format(struct v4l2_subdev *sd,
 	return 0;
 }
 
+static int rcsi2_get_frame_desc_fallback(struct v4l2_subdev *sd,
+					 unsigned int pad,
+					 struct v4l2_mbus_frame_desc *fd)
+{
+	struct v4l2_subdev_route *route;
+	const struct rcar_csi2_format *format;
+	struct v4l2_subdev_state *state;
+	struct v4l2_mbus_framefmt *fmt;
+	int ret = 0;
+
+	state = v4l2_subdev_lock_and_get_active_state(sd);
+
+	if (state->routing.num_routes != 1) {
+		ret = -EINVAL;
+		goto out;
+	}
+
+	route = &state->routing.routes[0];
+
+	if (route->source_pad != pad) {
+		ret = -EINVAL;
+		goto out;
+	}
+
+	fmt = v4l2_subdev_state_get_format(state, route->sink_pad,
+					   route->sink_stream);
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
+	fd->entry[0].stream = route->source_stream;
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


