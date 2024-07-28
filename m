Return-Path: <linux-media+bounces-15387-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id A211093E6BD
	for <lists+linux-media@lfdr.de>; Sun, 28 Jul 2024 17:53:20 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id D376A1C2134B
	for <lists+linux-media@lfdr.de>; Sun, 28 Jul 2024 15:53:19 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A3E0013D89D;
	Sun, 28 Jul 2024 15:47:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="uBiexvoc"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 03E2513D501;
	Sun, 28 Jul 2024 15:47:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722181620; cv=none; b=cTsZ6R7/oe3oXFS+btfYflmlgcq4DIMC7NtfBXMsAuaqkAFeLQygbt8EWD/iDozd2yLZrGrJgkQwuOaPQTj6/Gn5sHbE/gbhD/q9DebaBCVmKS3mZnDMRb4cz1CKfRADUKsVjj27o0Kfilo407NbMRRs9wr4f0q9J9yxqrUnRPw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722181620; c=relaxed/simple;
	bh=1ZUpqpAYNsERthG2uNEP8fXF8a97EKUzxa95cDVmaqE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=oPjcbhN/OBbK0JizwOsuYx7unI3evTlT0cgKaI/8XjvlS6h8q2S8x1BNM8vDh12QIIY0CuF2PJP4rVOm810mXJbdzhvsZISrJYj8KWgfqsC0DuKIUaJUwwjWRR1RMyfg2x7vdWIm6zn0UgrCKFblMNp6xan4LSkFRl7bqUUo8Q4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=uBiexvoc; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B415BC32782;
	Sun, 28 Jul 2024 15:46:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1722181619;
	bh=1ZUpqpAYNsERthG2uNEP8fXF8a97EKUzxa95cDVmaqE=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=uBiexvoceXQPyoCdEAkNuMfLv9qSJ95qugJEziU7Y58AujDNoduCkakccDCcTEA7D
	 gRGE8U9JeWtQW/AWF6lvJu+GsqOwt2qjnc5AsFHlwZo0zPyvwER77B6RqHC4/rYHGE
	 0cs8xvA5Z066cNE/x8qdba0ZTiqzgp9V8QqLnZ0TZa6X6EJxeWe6Y733IEsdWl7Z1j
	 NdWsIanOsBmXTmsYhKSRwKGzAQ8bdBQ/MUCFxGnr5ILM3V8tABKRXYbOJ1MyHbhzs0
	 bHIcW2mazWiiHKgpuPZl69Hbcq89vO8rvZK2TWGUKaJ7f4g15lCUKb94ZtQwHqGZzD
	 Xa7nLfRO7pD8Q==
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
Subject: [PATCH AUTOSEL 6.6 10/20] media: amphion: Remove lock in s_ctrl callback
Date: Sun, 28 Jul 2024 11:45:08 -0400
Message-ID: <20240728154605.2048490-10-sashal@kernel.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240728154605.2048490-1-sashal@kernel.org>
References: <20240728154605.2048490-1-sashal@kernel.org>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
X-stable-base: Linux 6.6.43
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
index 133d77d1ea0c3..4f438eaa7d385 100644
--- a/drivers/media/platform/amphion/vdec.c
+++ b/drivers/media/platform/amphion/vdec.c
@@ -195,7 +195,6 @@ static int vdec_op_s_ctrl(struct v4l2_ctrl *ctrl)
 	struct vdec_t *vdec = inst->priv;
 	int ret = 0;
 
-	vpu_inst_lock(inst);
 	switch (ctrl->id) {
 	case V4L2_CID_MPEG_VIDEO_DEC_DISPLAY_DELAY_ENABLE:
 		vdec->params.display_delay_enable = ctrl->val;
@@ -207,7 +206,6 @@ static int vdec_op_s_ctrl(struct v4l2_ctrl *ctrl)
 		ret = -EINVAL;
 		break;
 	}
-	vpu_inst_unlock(inst);
 
 	return ret;
 }
diff --git a/drivers/media/platform/amphion/venc.c b/drivers/media/platform/amphion/venc.c
index 4eb57d793a9c0..16ed4d21519cd 100644
--- a/drivers/media/platform/amphion/venc.c
+++ b/drivers/media/platform/amphion/venc.c
@@ -518,7 +518,6 @@ static int venc_op_s_ctrl(struct v4l2_ctrl *ctrl)
 	struct venc_t *venc = inst->priv;
 	int ret = 0;
 
-	vpu_inst_lock(inst);
 	switch (ctrl->id) {
 	case V4L2_CID_MPEG_VIDEO_H264_PROFILE:
 		venc->params.profile = ctrl->val;
@@ -579,7 +578,6 @@ static int venc_op_s_ctrl(struct v4l2_ctrl *ctrl)
 		ret = -EINVAL;
 		break;
 	}
-	vpu_inst_unlock(inst);
 
 	return ret;
 }
-- 
2.43.0


