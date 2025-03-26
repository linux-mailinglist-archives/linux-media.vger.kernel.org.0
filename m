Return-Path: <linux-media+bounces-28778-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 4AE7EA71574
	for <lists+linux-media@lfdr.de>; Wed, 26 Mar 2025 12:13:56 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 8B8CA3A7053
	for <lists+linux-media@lfdr.de>; Wed, 26 Mar 2025 11:12:34 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 06B1E1F3BA7;
	Wed, 26 Mar 2025 11:10:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="n0kThBMu"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E37F41F2360;
	Wed, 26 Mar 2025 11:10:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742987440; cv=none; b=e+/nXGJmg3GfxI9VcIVipSQP5fn+ZaWMQS9Gds0GZu3VEhsiC8e23OWokoGkX6EfE6izD+6x8tLGlC15GzKwf+KwqUPu35mByBi3rcsgbGNRl6fauCTciuURG4Xi14hVFJKwij66arj1MEbtxiS1To1jY6ifkLBHhfKs4vua/rE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742987440; c=relaxed/simple;
	bh=OMIeYdUtXu63h6bre0JQxBRXMomRsy32y7R+INsUhcY=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=F2sl6c3zAzisfTi3JVODgg/eYbMLJDjbkZL4/TuT03+hpRLbzv88mg3AXDAIYpe7xOzWBM3//6TL4eVcDjA1L8V4OinZl5Q2bp/h6N37p3GcsRl1TFVvesu4J5YBdoeUyLU1kFxekot2LDO+GM8AB5o/3M8my9sU3stAow5fIxE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=n0kThBMu; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from [127.0.1.1] (91-158-153-178.elisa-laajakaista.fi [91.158.153.178])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id DBDA11989;
	Wed, 26 Mar 2025 12:08:32 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1742987313;
	bh=OMIeYdUtXu63h6bre0JQxBRXMomRsy32y7R+INsUhcY=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=n0kThBMuicpmuxOfo3EjWJhPSYtKz8rfyOueV47zAGUJ+GMODKNiW20GBYjJpwXpB
	 5hegtaY2Rq78Xo4m9i1mLdJM1Ieir3WJzHvWKHCZbFchcFLwjkoRusMhvtA+e2suVo
	 FulKjgzaTKq33DNPmR/3FU/xeos9CxYLBCqdKBcs=
From: Tomi Valkeinen <tomi.valkeinen+renesas@ideasonboard.com>
Date: Wed, 26 Mar 2025 13:09:32 +0200
Subject: [PATCH v2 10/15] media: rcar-csi2: Add .get_frame_desc op
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250326-rcar-streams-v2-10-d0d7002c641f@ideasonboard.com>
References: <20250326-rcar-streams-v2-0-d0d7002c641f@ideasonboard.com>
In-Reply-To: <20250326-rcar-streams-v2-0-d0d7002c641f@ideasonboard.com>
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
 b=owEBbQKS/ZANAwAIAfo9qoy8lh71AcsmYgBn4+CTmEc0mo/AJUBaKXD1hjchn6IDoL7EThWZK
 Kmq9iaOrtKJAjMEAAEIAB0WIQTEOAw+ll79gQef86f6PaqMvJYe9QUCZ+PgkwAKCRD6PaqMvJYe
 9R7ND/9+IijtAq8Ymm4h4UxOZr2GtB7pyo4dSKd7ZVzbINOefL2iC2+/QdlqB+i8gZpQ0yx/aX4
 /yx3Bjw148zwLoOrW3XSBUA/ri8dYMDHaR+aLfuw8rPW5bWmAtsTxLolN/JQvD8JFMOUWsMtT/9
 xuxkysnSytoVDyE5aHIhcgtITR6qJkvfZAXNohMnkioSaEDiU5VqrxPTNovKKILYU6eoRj5AOGC
 NJdD0DpP0dmIsDfu9FksDj2TrTiwas2kguIkBXjts7225WgDR6zXijtud8xh+dfP4dKX8P/UtDj
 Iyr5bEFA7tgm7wQSQuyMGmPj/CxvpbtBrqYTY5RshVq/Cdu2e4+SgpEycKMqmfnncjjNwEuDGn6
 DLuE0r1ySWh7VHFVYK/kJ/i6Z0xYCEhqpMCBEzHfg2lOjWio0w9mHFn5aChXD+7LUI/C+KUi4H5
 GVToZJBjhunZNbFnt7T9MVLsj8LPBxkmVCbqoQ9YDm9d89oFs7IpIjTAxnaRMDIsi0rCWvAuEc5
 z93b0LdEK3s4xsro3xmhnJxlufVYCl9c3O+J1xSKd4jR2AdXauPHRJOFfNj251430NkTzsWh+ux
 1B6q/z09IsotlkVr4dizGHkWYIiP5UgLdtWuXo1VaXtseRkjOZcb0SG2xI1zXUL5MqjcGKZ8Oux
 fFzJ1hGKrI8Xmlw==
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


