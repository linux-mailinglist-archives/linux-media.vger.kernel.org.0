Return-Path: <linux-media+bounces-17320-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id B051A96821C
	for <lists+linux-media@lfdr.de>; Mon,  2 Sep 2024 10:36:25 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 6C1882837A9
	for <lists+linux-media@lfdr.de>; Mon,  2 Sep 2024 08:36:24 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 982F6183092;
	Mon,  2 Sep 2024 08:36:04 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4159817C9B3
	for <linux-media@vger.kernel.org>; Mon,  2 Sep 2024 08:36:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725266164; cv=none; b=aLQ8H/EWTjNqaM6s3du2L53MyJCYC+m/uIJeFSz4vJS+cQU28tiirMI4iEgvITiU+W6wKca6QvXU7SXr/dRTpFrj+dZpdfDcJILXegTqCWDym0ECmH6w8uffiBICYQCAKIwFEzwvL1mresyWPGx/ofuDrOdE0Pugnk4SHkZRmZU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725266164; c=relaxed/simple;
	bh=JbaDlZeVXDY0tB3P7a0tbnj8rqi1AnQm6tuabUWnf5E=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Ic+LeEkPiDIYMkBPFoG8PYT/w3rsnjzDmzAIqm+dlTifKqQv8VvLwN2/cxzbvJGT2uH/I9+yQnomoha8HOIWskjIqCfF4rYfA47iQThhMPVw9eMDWK/fAulldWcMob/gAgKvCknyP3vgolLu+UKEP4owpSlqGex0zOajfwgDirA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id F08DAC4CEC2;
	Mon,  2 Sep 2024 08:36:02 +0000 (UTC)
From: Hans Verkuil <hverkuil-cisco@xs4all.nl>
To: linux-media@vger.kernel.org
Cc: Hans Verkuil <hverkuil-cisco@xs4all.nl>,
	Stanimir Varbanov <stanimir.k.varbanov@gmail.com>
Subject: [PATCH 4/4] media: venus: add missing wait_prepare/finish ops
Date: Mon,  2 Sep 2024 10:31:24 +0200
Message-ID: <ef6958db1e5d5a9f50cf4db6056c22b49c2a1e65.1725265884.git.hverkuil-cisco@xs4all.nl>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1725265884.git.hverkuil-cisco@xs4all.nl>
References: <cover.1725265884.git.hverkuil-cisco@xs4all.nl>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Without these ops the v4l2-compliance blocking wait test will fail.
These ops are required to ensure that when VIDIOC_DQBUF has to
wait for buffers to arrive, the queue lock is correctly released
and retaken. Otherwise the wait for a buffer would block all other
queue ioctls.

Signed-off-by: Hans Verkuil <hverkuil-cisco@xs4all.nl>
Cc: Stanimir Varbanov <stanimir.k.varbanov@gmail.com>
---
 drivers/media/platform/qcom/venus/vdec.c | 2 ++
 drivers/media/platform/qcom/venus/venc.c | 2 ++
 2 files changed, 4 insertions(+)

diff --git a/drivers/media/platform/qcom/venus/vdec.c b/drivers/media/platform/qcom/venus/vdec.c
index d12089370d91..666309f684f1 100644
--- a/drivers/media/platform/qcom/venus/vdec.c
+++ b/drivers/media/platform/qcom/venus/vdec.c
@@ -1390,6 +1390,8 @@ static const struct vb2_ops vdec_vb2_ops = {
 	.buf_prepare = venus_helper_vb2_buf_prepare,
 	.start_streaming = vdec_start_streaming,
 	.stop_streaming = vdec_stop_streaming,
+	.wait_prepare = vb2_ops_wait_prepare,
+	.wait_finish = vb2_ops_wait_finish,
 	.buf_queue = vdec_vb2_buf_queue,
 };
 
diff --git a/drivers/media/platform/qcom/venus/venc.c b/drivers/media/platform/qcom/venus/venc.c
index 3ec2fb8d9fab..5804a4911537 100644
--- a/drivers/media/platform/qcom/venus/venc.c
+++ b/drivers/media/platform/qcom/venus/venc.c
@@ -1319,6 +1319,8 @@ static const struct vb2_ops venc_vb2_ops = {
 	.buf_prepare = venus_helper_vb2_buf_prepare,
 	.start_streaming = venc_start_streaming,
 	.stop_streaming = venus_helper_vb2_stop_streaming,
+	.wait_prepare = vb2_ops_wait_prepare,
+	.wait_finish = vb2_ops_wait_finish,
 	.buf_queue = venc_vb2_buf_queue,
 };
 
-- 
2.43.0


