Return-Path: <linux-media+bounces-17319-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 316AA96821B
	for <lists+linux-media@lfdr.de>; Mon,  2 Sep 2024 10:36:25 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id A873BB2301B
	for <lists+linux-media@lfdr.de>; Mon,  2 Sep 2024 08:36:22 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 42D8F187324;
	Mon,  2 Sep 2024 08:36:03 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DE364185B78
	for <linux-media@vger.kernel.org>; Mon,  2 Sep 2024 08:36:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725266162; cv=none; b=jQMr+vTMwKeWMYmWwkGKKcmQ758eIbcBzeXr0WIg/cTw9dnt9Qt4RCLGVZwm7VjXFAPv+09kY/oNUvZRHCy6Ag+PG0aQ80xHu6+hFj0FITUNeoGiFTRSoznERNmYf/2YMbEsqVDSVh2L18WOlYIOiXnrwfPnJqovTBhKRMxKj4Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725266162; c=relaxed/simple;
	bh=2uz8PHPy75tBB2bEaV3WyfPmw+1LyeXcp75kPYyDQh0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=tDyXergUAes6gN86ZOPh4czzVNaQRuYp04tv9khDfX6ju3z7D0nHTZ3MmjPVyGRADbz9RRR4zW1eB3lRgme3Dnc1EX9LJqTLsGVB+n7YOOwZOyI2ngorVsUZs1y/nj/fjf1M+MoRpzrGFNBRxDdU7SmbdhyEkOT2CrKiI8bu0eU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 72FAEC4CEC6;
	Mon,  2 Sep 2024 08:36:01 +0000 (UTC)
From: Hans Verkuil <hverkuil-cisco@xs4all.nl>
To: linux-media@vger.kernel.org
Cc: Hans Verkuil <hverkuil-cisco@xs4all.nl>,
	Jacopo Mondi <jacopo.mondi@ideasonboard.com>,
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Subject: [PATCH 3/4] media: pisp_be: add missing wait_prepare/finish ops
Date: Mon,  2 Sep 2024 10:31:23 +0200
Message-ID: <dbe984e9d94781de82a157e96274db04774cbc27.1725265884.git.hverkuil-cisco@xs4all.nl>
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
Cc: Jacopo Mondi <jacopo.mondi@ideasonboard.com>
Cc: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
---
 drivers/media/platform/raspberrypi/pisp_be/pisp_be.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/media/platform/raspberrypi/pisp_be/pisp_be.c b/drivers/media/platform/raspberrypi/pisp_be/pisp_be.c
index 65ff2382cffe..7ce3be626c4a 100644
--- a/drivers/media/platform/raspberrypi/pisp_be/pisp_be.c
+++ b/drivers/media/platform/raspberrypi/pisp_be/pisp_be.c
@@ -964,6 +964,8 @@ static const struct vb2_ops pispbe_node_queue_ops = {
 	.buf_queue = pispbe_node_buffer_queue,
 	.start_streaming = pispbe_node_start_streaming,
 	.stop_streaming = pispbe_node_stop_streaming,
+	.wait_prepare = vb2_ops_wait_prepare,
+	.wait_finish = vb2_ops_wait_finish,
 };
 
 static const struct v4l2_file_operations pispbe_fops = {
-- 
2.43.0


