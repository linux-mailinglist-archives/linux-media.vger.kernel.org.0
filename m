Return-Path: <linux-media+bounces-15392-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 8B73693E6EA
	for <lists+linux-media@lfdr.de>; Sun, 28 Jul 2024 17:58:17 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id AF6BE1C213B9
	for <lists+linux-media@lfdr.de>; Sun, 28 Jul 2024 15:58:16 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 67D5A12C52F;
	Sun, 28 Jul 2024 15:48:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="pxjE7r3T"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BD44C145A07;
	Sun, 28 Jul 2024 15:48:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722181722; cv=none; b=X8RmtrSasMWExV1oJzRsyyd0iIkaDkvhcXb6HG0bcNxrzRcDYuDAA09sXnAwQ81OszcbdLq0PNB+IRfE/Nl0QQ/Qkx0qIKrAVAE2fOkVA3U2OFEt7jjLXASUaonUpYv4MZK0FLL+uKl/KWWFduz4aa7K6MsP4jvSs0omEEoD1Lo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722181722; c=relaxed/simple;
	bh=JhIduxfQXsXHvWv4UcErwNEbswui5ftIZ75jKlJtJsE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=TBNb8qXnhruccrVqeogDhIepJoOI1DimrIlMnXsRVA5ejKxWys+nrED2ZUo9A9PrpM3iQozTJIHa2xRAuNL0IE5BzsGH4gh8xsBVs12Hu4+Yc8hBEnD5GEbSU9ZvLgWfnf91dMZ6f40rwBA33wiKBKM7IB1LLou8wVAdqDoBP2w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=pxjE7r3T; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1A02BC32782;
	Sun, 28 Jul 2024 15:48:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1722181722;
	bh=JhIduxfQXsXHvWv4UcErwNEbswui5ftIZ75jKlJtJsE=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=pxjE7r3T8ctVZYhEnMnmHcGVv9MN02kZ6TO6ScxVzqhtZXdC/7X2Ezjy9CMZqO/U3
	 Qrfz+mBRnsRh+WFHWwvyYExmSckC2C+dPUkRlrJR9ExV1u6XDhqN7OhPynQCWF8mIA
	 FD2u1/1g63yniBJNp1hiszowOVldXTXUIhz88pmbccdE1WFeIKZ0Tpf2t3tF/778a7
	 lRyeRLtoECoLfqtC53FMgrZvFTMktraueRvbnoS+Noemzm315sOM1fimUSRUDUDTHB
	 4rolwwwUu3b2zs1HeNScxsiRQHgDJF9kFGyZMYM/0SnsmwGvdPDLX5yw2fLTon4NrN
	 La6lP384DOIhg==
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Cc: Ming Qian <ming.qian@nxp.com>,
	Sebastian Fricke <sebastian.fricke@collabora.com>,
	Hans Verkuil <hverkuil-cisco@xs4all.nl>,
	Sasha Levin <sashal@kernel.org>,
	eagle.zhou@nxp.com,
	mchehab@kernel.org,
	linux-media@vger.kernel.org
Subject: [PATCH AUTOSEL 6.1 07/17] media: amphion: Remove lock in s_ctrl callback
Date: Sun, 28 Jul 2024 11:47:17 -0400
Message-ID: <20240728154805.2049226-7-sashal@kernel.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240728154805.2049226-1-sashal@kernel.org>
References: <20240728154805.2049226-1-sashal@kernel.org>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
X-stable-base: Linux 6.1.102
Content-Transfer-Encoding: 8bit

From: Ming Qian <ming.qian@nxp.com>

[ Upstream commit 065927b51eb1f042c3e026cebfd55e72ccc26093 ]

There is no need to add a lock in s_ctrl callback, it has been
synchronized by the ctrl_handler's lock, otherwise it may led to
a deadlock if the driver calls v4l2_ctrl_s_ctrl().

Signed-off-by: Ming Qian <ming.qian@nxp.com>
Signed-off-by: Sebastian Fricke <sebastian.fricke@collabora.com>
Signed-off-by: Hans Verkuil <hverkuil-cisco@xs4all.nl>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 drivers/media/platform/amphion/vdec.c | 2 --
 drivers/media/platform/amphion/venc.c | 2 --
 2 files changed, 4 deletions(-)

diff --git a/drivers/media/platform/amphion/vdec.c b/drivers/media/platform/amphion/vdec.c
index dc35a87e628ec..2bfab4467b81c 100644
--- a/drivers/media/platform/amphion/vdec.c
+++ b/drivers/media/platform/amphion/vdec.c
@@ -145,7 +145,6 @@ static int vdec_op_s_ctrl(struct v4l2_ctrl *ctrl)
 	struct vdec_t *vdec = inst->priv;
 	int ret = 0;
 
-	vpu_inst_lock(inst);
 	switch (ctrl->id) {
 	case V4L2_CID_MPEG_VIDEO_DEC_DISPLAY_DELAY_ENABLE:
 		vdec->params.display_delay_enable = ctrl->val;
@@ -157,7 +156,6 @@ static int vdec_op_s_ctrl(struct v4l2_ctrl *ctrl)
 		ret = -EINVAL;
 		break;
 	}
-	vpu_inst_unlock(inst);
 
 	return ret;
 }
diff --git a/drivers/media/platform/amphion/venc.c b/drivers/media/platform/amphion/venc.c
index 1df2b35c1a240..c9cfef16c5b92 100644
--- a/drivers/media/platform/amphion/venc.c
+++ b/drivers/media/platform/amphion/venc.c
@@ -528,7 +528,6 @@ static int venc_op_s_ctrl(struct v4l2_ctrl *ctrl)
 	struct venc_t *venc = inst->priv;
 	int ret = 0;
 
-	vpu_inst_lock(inst);
 	switch (ctrl->id) {
 	case V4L2_CID_MPEG_VIDEO_H264_PROFILE:
 		venc->params.profile = ctrl->val;
@@ -589,7 +588,6 @@ static int venc_op_s_ctrl(struct v4l2_ctrl *ctrl)
 		ret = -EINVAL;
 		break;
 	}
-	vpu_inst_unlock(inst);
 
 	return ret;
 }
-- 
2.43.0


