Return-Path: <linux-media+bounces-45557-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id E3A01C09950
	for <lists+linux-media@lfdr.de>; Sat, 25 Oct 2025 18:38:29 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 7DF531A639EB
	for <lists+linux-media@lfdr.de>; Sat, 25 Oct 2025 16:30:46 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 951BC3148A0;
	Sat, 25 Oct 2025 16:23:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="HIvvAotu"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DE8D4309F14;
	Sat, 25 Oct 2025 16:23:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761409414; cv=none; b=cxH2uPWB5s1QDtRTqhU+J636WPBCT+x58+v7z4DxRxVhHtFJwtkp5tcwbQhBCMHoWt1qqI0NWtW6qwcLo1dt3j7A4VXita95KXhjewwFJU/17a+CXbyl4oIcbBhoktT7gUTmZwYxKQa4qizLgM6hEi/ZY+WgFYJOIJPAQMf9LB8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761409414; c=relaxed/simple;
	bh=mM0EykjC/LGpqCHiluc0tn7P9aVGNkhW/8wTR3iWL88=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=oVMrAStJTl2DQypgpRkW9eq/28XTYv+4/WpvO8LFGqWKXlHlJDtFDeeNK+10PSr0ZCpzSu74UWzhVmEGWiZblX+lh1vMFU88VfnP0lJnJtMDM803RxwabCVapt7m11YR3GGda/SyWxO2pKex71jBDzFajxehV+vNMc01mSu3HAs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=HIvvAotu; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A78F1C4CEFB;
	Sat, 25 Oct 2025 16:23:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1761409413;
	bh=mM0EykjC/LGpqCHiluc0tn7P9aVGNkhW/8wTR3iWL88=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=HIvvAotu7AmjQ6CVyJeQ9n6smt3wh/NPZwKUeWQp1CGel1uWwCwfVGg/NQj3FE4m+
	 GrsT9lrFIV3OUwdwNRCpgslUseR7MUM5V8zyRp8wwNO9DA7KfDacZ75qGx18X3T7To
	 q9X1q7SqWM3jfSEdB3MuudZtIBhdJlnhcQT3AcAkAZJQZxNliIpFue2HBQFd2FQstO
	 3cDcvIaPY7d37duSlfTTX5dPeXM6U+gSMO2L5CuSEXdi1Q9af+yyjv2zpOMoO/QEYA
	 5GSV/0qtpkZL+1MEjU0QimZyI3fBYTLa9er/i6zT23bpeOlyJT0mkqDGhcgfnI40ie
	 KoYNLEG1N5L6Q==
From: Sasha Levin <sashal@kernel.org>
To: patches@lists.linux.dev,
	stable@vger.kernel.org
Cc: Paul Kocialkowski <paulk@sys-base.io>,
	Nicolas Dufresne <nicolas.dufresne@collabora.com>,
	Hans Verkuil <hverkuil+cisco@kernel.org>,
	Sasha Levin <sashal@kernel.org>,
	benjamin.gaignard@collabora.com,
	p.zabel@pengutronix.de,
	linux-media@vger.kernel.org,
	linux-rockchip@lists.infradead.org
Subject: [PATCH AUTOSEL 6.17-6.1] media: verisilicon: Explicitly disable selection api ioctls for decoders
Date: Sat, 25 Oct 2025 11:59:03 -0400
Message-ID: <20251025160905.3857885-312-sashal@kernel.org>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20251025160905.3857885-1-sashal@kernel.org>
References: <20251025160905.3857885-1-sashal@kernel.org>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
X-stable-base: Linux 6.17.5
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

From: Paul Kocialkowski <paulk@sys-base.io>

[ Upstream commit 73d50aa92f28ee8414fbfde011974fce970b82cc ]

Call the dedicated v4l2_disable_ioctl helper instead of manually
checking whether the current context is an encoder for the selection
api ioctls.

Signed-off-by: Paul Kocialkowski <paulk@sys-base.io>
Reviewed-by: Nicolas Dufresne <nicolas.dufresne@collabora.com>
Signed-off-by: Nicolas Dufresne <nicolas.dufresne@collabora.com>
Signed-off-by: Hans Verkuil <hverkuil+cisco@kernel.org>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---

LLM Generated explanations, may be completely bogus:

YES

**Why This Fix Matters**
- Correctly hides unsupported ioctls on decoder nodes: Previously, the
  driver exposed `VIDIOC_G_SELECTION`/`VIDIOC_S_SELECTION` to decoders
  but rejected them at runtime with `-EINVAL`. This incorrectly
  advertised capability and confused userspace and core heuristics. With
  this change, those ioctls are explicitly disabled and return
  `-ENOTTY`, which is the correct “not supported” error and matches V4L2
  expectations (drivers/media/v4l2-core/v4l2-ioctl.c:3073, 3111).
- Avoids misleading legacy crop exposure: V4L2 core auto-enables legacy
  crop ioctls if selection is available. Disabling selection for
  decoders prevents the core from enabling `VIDIOC_G_CROP/CROPCAP` on
  decoder nodes (drivers/media/v4l2-core/v4l2-dev.c:657,
  drivers/media/v4l2-core/v4l2-dev.c:659,
  drivers/media/v4l2-core/v4l2-dev.c:662,
  drivers/media/v4l2-core/v4l2-dev.c:663,
  drivers/media/v4l2-core/v4l2-dev.c:664,
  drivers/media/v4l2-core/v4l2-dev.c:665). This fixes a user-visible API
  correctness issue.

**Change Details**
- Disables selection ioctls for decoder device nodes using the standard
  helper, before registration:
  - `v4l2_disable_ioctl(vfd, VIDIOC_G_SELECTION);`
  - `v4l2_disable_ioctl(vfd, VIDIOC_S_SELECTION);`
  - Location: drivers/media/platform/verisilicon/hantro_drv.c:918,
    drivers/media/platform/verisilicon/hantro_drv.c:919
  - Called before `video_register_device`, as required
    (drivers/media/platform/verisilicon/hantro_drv.c:924).
- Simplifies selection handlers to only enforce buffer type, removing
  runtime checks on context role:
  - Dropped `!ctx->is_encoder` checks; now only `sel->type !=
    V4L2_BUF_TYPE_VIDEO_OUTPUT` is validated.
  - `vidioc_g_selection`:
    drivers/media/platform/verisilicon/hantro_v4l2.c:666–667
  - `vidioc_s_selection`:
    drivers/media/platform/verisilicon/hantro_v4l2.c:698–699
  - Effect: No functional change for encoders (where `ctx->is_encoder`
    is always true), and decoders won’t reach these handlers since the
    ioctls are disabled.

**Risk and Side Effects**
- Behavior change is limited to decoders for selection ioctls: return
  code changes from `-EINVAL` to `-ENOTTY` via core gating
  (`is_valid_ioctl()` fails, `ret` remains `-ENOTTY`,
  drivers/media/v4l2-core/v4l2-ioctl.c:3073, 3111–3113). This is the
  correct semantics for “unsupported ioctl” and improves userspace
  detection.
- No architectural changes; confined to the Verisilicon Hantro driver.
  Encoder behavior is unchanged.
- Very small, contained patch; unlikely to introduce regressions. Aligns
  with common media driver practice of disabling non-applicable ioctls
  for a given node.

**Stable Backport Fit**
- Fixes a user-visible API bug (misadvertised capability and wrong
  errno) with minimal, localized changes.
- No new features or interfaces; follows stable rules for correctness
  fixes.
- Touches a non-core subsystem (media, platform driver), minimizing
  cross-subsystem risk.

Given the above, this commit is a good candidate for stable backporting.

 drivers/media/platform/verisilicon/hantro_drv.c  | 2 ++
 drivers/media/platform/verisilicon/hantro_v4l2.c | 6 ++----
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/drivers/media/platform/verisilicon/hantro_drv.c b/drivers/media/platform/verisilicon/hantro_drv.c
index fa972effd4a2c..9d5e50fedae1f 100644
--- a/drivers/media/platform/verisilicon/hantro_drv.c
+++ b/drivers/media/platform/verisilicon/hantro_drv.c
@@ -917,6 +917,8 @@ static int hantro_add_func(struct hantro_dev *vpu, unsigned int funcid)
 		vpu->decoder = func;
 		v4l2_disable_ioctl(vfd, VIDIOC_TRY_ENCODER_CMD);
 		v4l2_disable_ioctl(vfd, VIDIOC_ENCODER_CMD);
+		v4l2_disable_ioctl(vfd, VIDIOC_G_SELECTION);
+		v4l2_disable_ioctl(vfd, VIDIOC_S_SELECTION);
 	}
 
 	video_set_drvdata(vfd, vpu);
diff --git a/drivers/media/platform/verisilicon/hantro_v4l2.c b/drivers/media/platform/verisilicon/hantro_v4l2.c
index 7c3515cf7d64a..4598f9b4bd21c 100644
--- a/drivers/media/platform/verisilicon/hantro_v4l2.c
+++ b/drivers/media/platform/verisilicon/hantro_v4l2.c
@@ -663,8 +663,7 @@ static int vidioc_g_selection(struct file *file, void *priv,
 	struct hantro_ctx *ctx = fh_to_ctx(priv);
 
 	/* Crop only supported on source. */
-	if (!ctx->is_encoder ||
-	    sel->type != V4L2_BUF_TYPE_VIDEO_OUTPUT)
+	if (sel->type != V4L2_BUF_TYPE_VIDEO_OUTPUT)
 		return -EINVAL;
 
 	switch (sel->target) {
@@ -696,8 +695,7 @@ static int vidioc_s_selection(struct file *file, void *priv,
 	struct vb2_queue *vq;
 
 	/* Crop only supported on source. */
-	if (!ctx->is_encoder ||
-	    sel->type != V4L2_BUF_TYPE_VIDEO_OUTPUT)
+	if (sel->type != V4L2_BUF_TYPE_VIDEO_OUTPUT)
 		return -EINVAL;
 
 	/* Change not allowed if the queue is streaming. */
-- 
2.51.0


