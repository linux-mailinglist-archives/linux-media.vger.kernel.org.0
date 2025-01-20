Return-Path: <linux-media+bounces-24968-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 1416CA16D26
	for <lists+linux-media@lfdr.de>; Mon, 20 Jan 2025 14:14:25 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 870C63A2BA8
	for <lists+linux-media@lfdr.de>; Mon, 20 Jan 2025 13:13:46 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0A7121E5018;
	Mon, 20 Jan 2025 13:11:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="d1MLNz3l"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D71CC1E47B6;
	Mon, 20 Jan 2025 13:11:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737378707; cv=none; b=VovDEH3nne97/T62vCARDOceil4CY9wx4eEuk7bo8bmnOf1/kjVWO9gu8B56ix9CCrZfCmXQ/ngw6h0w5OcSLcJJuwpwfvs0MCxP+m6a3NTg/GHos3p7bhrt6OYcETfx0hsuH93Bdj6iFbR/MwBzMSsR126L0O3PDyKTdUkcdQc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737378707; c=relaxed/simple;
	bh=e4FEE8+Vy6aIBfrj6HCMA0AaO6LCZd0h4tXExYMXGnw=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Hj7ZcrnaF9P7ohp9rVc4EXMjd0lh+DLHv67QNxBXH3Ve22PmqPTOWS0UHZn4tfGa0Qwp+gQyE5GLj6YZRvdKa19zQVjF++97fMzL3MDc9GoNquNNix/Ad9cX1R9ySKsEM1jjwLIZKrMg537fJKOZ8ryy8LBMB1LDaTagLYGcv3o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=d1MLNz3l; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from [127.0.1.1] (91-158-153-178.elisa-laajakaista.fi [91.158.153.178])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 94A7911E6;
	Mon, 20 Jan 2025 14:10:26 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1737378626;
	bh=e4FEE8+Vy6aIBfrj6HCMA0AaO6LCZd0h4tXExYMXGnw=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=d1MLNz3lkERwNMzZvHKxdib6EfQb6RH/M8Xlp4mN7sfWTcW3rZvKTFFhavb1Z9ZT8
	 ilYU6EV5VfMppt2n0n9BXsoQv7Chb5CkUfa9O8DJZxie20ZqzybOgnUszBccuSqjgs
	 h8C3BP++B64d90y3Cbt4/gSBvLwLN5Xw1G1bVL2s=
From: Tomi Valkeinen <tomi.valkeinen+renesas@ideasonboard.com>
Date: Mon, 20 Jan 2025 15:10:41 +0200
Subject: [PATCH 08/10] media: rcar-isp: Convert to subdev state
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250120-rcar-media-impro-v1-8-043823c3893e@ideasonboard.com>
References: <20250120-rcar-media-impro-v1-0-043823c3893e@ideasonboard.com>
In-Reply-To: <20250120-rcar-media-impro-v1-0-043823c3893e@ideasonboard.com>
To: =?utf-8?q?Niklas_S=C3=B6derlund?= <niklas.soderlund@ragnatech.se>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: linux-media@vger.kernel.org, linux-renesas-soc@vger.kernel.org, 
 linux-kernel@vger.kernel.org, 
 Tomi Valkeinen <tomi.valkeinen+renesas@ideasonboard.com>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=5282;
 i=tomi.valkeinen+renesas@ideasonboard.com; h=from:subject:message-id;
 bh=e4FEE8+Vy6aIBfrj6HCMA0AaO6LCZd0h4tXExYMXGnw=;
 b=owEBbQKS/ZANAwAIAfo9qoy8lh71AcsmYgBnjkt6BwC2t1+8prZkPsEQzxa5tob2NY79X18GP
 xrWovEzGfGJAjMEAAEIAB0WIQTEOAw+ll79gQef86f6PaqMvJYe9QUCZ45LegAKCRD6PaqMvJYe
 9TEFD/0fY/2FuxShWJuvvKWzKq7E33E62RS6qQt2tXnUfCld1s4Zceg2il/62O+4XNuuRBHAoxF
 OuUikCuVP9YXo5TZLy4TrR9OWzyHNqNFr+z1XQWd4Pu/ODdMF/x99YYoKxY1Hh3RrPgpJJP+/hv
 SVvPPIe0nL6gUQvlrpOtym6C/Hqw/gElDjBsr4XR05AdVgOcGLDOE24SLcYU1DjzKkGU6kzEt16
 GDwV7TUgB7tEfp5wp5B0tDZkOrvZL0PSGfuXU/bVGKznBsR4Clk4unKRCmA9An02FD3ySyyo+Ii
 uhTQwcahicyBW6Hin0yiPufSulZpZUbNWuprK9PZkOpH1g5wSh9OQU57znW6fIjz8gaIjeDuLjK
 DhE8Kk6zvg2EEPJlhz8zYFGPE6mSjnWSd6ktP5njx/jx9U1+kkwgm4NgVKz0WvtHS3CpkmNhvs9
 ny0241dC2Wz2JHKL3jDGXloeyosUeX4BXhY+lkV3JG4EKkXANOuG8fNDKLlpMUR5LTLexU8UEw4
 FIMRs+broOIpJtfmKj8JjSAGkbXkJus4lQe/PTySFXw6Bbku/bsLfN0hXyuYMddnf6yUS8wKXlC
 yHNWzmNBn6rmUR/GD79d92cKvnDaYBCE4Aj17yLQiE10PANpDIqjAPKRlAjoEvYLAQfFBUZj6TH
 y4/CO3Vk25BlCgg==
X-Developer-Key: i=tomi.valkeinen+renesas@ideasonboard.com; a=openpgp;
 fpr=C4380C3E965EFD81079FF3A7FA3DAA8CBC961EF5

Convert to subdev state. This allows us to drop the internal mutex and
risp_get_pad_format(), and add streams support in the future.

Signed-off-by: Tomi Valkeinen <tomi.valkeinen+renesas@ideasonboard.com>
---
 drivers/media/platform/renesas/rcar-isp.c | 70 ++++++++++++-------------------
 1 file changed, 27 insertions(+), 43 deletions(-)

diff --git a/drivers/media/platform/renesas/rcar-isp.c b/drivers/media/platform/renesas/rcar-isp.c
index 385fafb2318f..d4eaabb45e07 100644
--- a/drivers/media/platform/renesas/rcar-isp.c
+++ b/drivers/media/platform/renesas/rcar-isp.c
@@ -171,8 +171,6 @@ struct rcar_isp {
 	struct v4l2_subdev *remote;
 	unsigned int remote_pad;
 
-	struct mutex lock; /* Protects mf and stream_count. */
-	struct v4l2_mbus_framefmt mf;
 	int stream_count;
 };
 
@@ -219,14 +217,19 @@ static void risp_power_off(struct rcar_isp *isp)
 	pm_runtime_put(isp->dev);
 }
 
-static int risp_start(struct rcar_isp *isp)
+static int risp_start(struct rcar_isp *isp, struct v4l2_subdev_state *state)
 {
+	const struct v4l2_mbus_framefmt *fmt;
 	const struct rcar_isp_format *format;
 	unsigned int vc;
 	u32 sel_csi = 0;
 	int ret;
 
-	format = risp_code_to_fmt(isp->mf.code);
+	fmt = v4l2_subdev_state_get_format(state, RCAR_ISP_SINK);
+	if (!fmt)
+		return -EINVAL;
+
+	format = risp_code_to_fmt(fmt->code);
 	if (!format) {
 		dev_err(isp->dev, "Unsupported bus format\n");
 		return -EINVAL;
@@ -289,9 +292,10 @@ static void risp_stop(struct rcar_isp *isp)
 static int risp_s_stream(struct v4l2_subdev *sd, int enable)
 {
 	struct rcar_isp *isp = sd_to_isp(sd);
+	struct v4l2_subdev_state *state;
 	int ret = 0;
 
-	mutex_lock(&isp->lock);
+	state = v4l2_subdev_lock_and_get_active_state(sd);
 
 	if (!isp->remote) {
 		ret = -ENODEV;
@@ -299,7 +303,7 @@ static int risp_s_stream(struct v4l2_subdev *sd, int enable)
 	}
 
 	if (enable && isp->stream_count == 0) {
-		ret = risp_start(isp);
+		ret = risp_start(isp, state);
 		if (ret)
 			goto out;
 	} else if (!enable && isp->stream_count == 1) {
@@ -308,7 +312,7 @@ static int risp_s_stream(struct v4l2_subdev *sd, int enable)
 
 	isp->stream_count += enable ? 1 : -1;
 out:
-	mutex_unlock(&isp->lock);
+	v4l2_subdev_unlock_state(state);
 
 	return ret;
 }
@@ -318,50 +322,28 @@ static const struct v4l2_subdev_video_ops risp_video_ops = {
 };
 
 static int risp_set_pad_format(struct v4l2_subdev *sd,
-			       struct v4l2_subdev_state *sd_state,
+			       struct v4l2_subdev_state *state,
 			       struct v4l2_subdev_format *format)
 {
-	struct rcar_isp *isp = sd_to_isp(sd);
 	struct v4l2_mbus_framefmt *framefmt;
 
-	mutex_lock(&isp->lock);
+	if (format->pad > RCAR_ISP_SINK)
+		return v4l2_subdev_get_fmt(sd, state, format);
 
 	if (!risp_code_to_fmt(format->format.code))
 		format->format.code = rcar_isp_formats[0].code;
 
-	if (format->which == V4L2_SUBDEV_FORMAT_ACTIVE) {
-		isp->mf = format->format;
-	} else {
-		framefmt = v4l2_subdev_state_get_format(sd_state, 0);
+	for (unsigned int i = 0; i < RCAR_ISP_NUM_PADS; i++) {
+		framefmt = v4l2_subdev_state_get_format(state, i);
 		*framefmt = format->format;
 	}
 
-	mutex_unlock(&isp->lock);
-
-	return 0;
-}
-
-static int risp_get_pad_format(struct v4l2_subdev *sd,
-			       struct v4l2_subdev_state *sd_state,
-			       struct v4l2_subdev_format *format)
-{
-	struct rcar_isp *isp = sd_to_isp(sd);
-
-	mutex_lock(&isp->lock);
-
-	if (format->which == V4L2_SUBDEV_FORMAT_ACTIVE)
-		format->format = isp->mf;
-	else
-		format->format = *v4l2_subdev_state_get_format(sd_state, 0);
-
-	mutex_unlock(&isp->lock);
-
 	return 0;
 }
 
 static const struct v4l2_subdev_pad_ops risp_pad_ops = {
 	.set_fmt = risp_set_pad_format,
-	.get_fmt = risp_get_pad_format,
+	.get_fmt = v4l2_subdev_get_fmt,
 	.link_validate = v4l2_subdev_link_validate_default,
 };
 
@@ -500,12 +482,10 @@ static int risp_probe(struct platform_device *pdev)
 
 	isp->dev = &pdev->dev;
 
-	mutex_init(&isp->lock);
-
 	ret = risp_probe_resources(isp, pdev);
 	if (ret) {
 		dev_err(isp->dev, "Failed to get resources\n");
-		goto error_mutex;
+		return ret;
 	}
 
 	platform_set_drvdata(pdev, isp);
@@ -536,20 +516,25 @@ static int risp_probe(struct platform_device *pdev)
 	if (ret)
 		goto error_notifier;
 
+	ret = v4l2_subdev_init_finalize(&isp->subdev);
+	if (ret)
+		goto error_notifier;
+
 	ret = v4l2_async_register_subdev(&isp->subdev);
 	if (ret < 0)
-		goto error_notifier;
+		goto error_subdev;
 
 	dev_info(isp->dev, "Using CSI-2 input: %u\n", isp->csi_input);
 
 	return 0;
+
+error_subdev:
+	v4l2_subdev_cleanup(&isp->subdev);
 error_notifier:
 	v4l2_async_nf_unregister(&isp->notifier);
 	v4l2_async_nf_cleanup(&isp->notifier);
 error_pm:
 	pm_runtime_disable(&pdev->dev);
-error_mutex:
-	mutex_destroy(&isp->lock);
 
 	return ret;
 }
@@ -562,10 +547,9 @@ static void risp_remove(struct platform_device *pdev)
 	v4l2_async_nf_cleanup(&isp->notifier);
 
 	v4l2_async_unregister_subdev(&isp->subdev);
+	v4l2_subdev_cleanup(&isp->subdev);
 
 	pm_runtime_disable(&pdev->dev);
-
-	mutex_destroy(&isp->lock);
 }
 
 static struct platform_driver rcar_isp_driver = {

-- 
2.43.0


