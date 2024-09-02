Return-Path: <linux-media+bounces-17317-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 697B9968219
	for <lists+linux-media@lfdr.de>; Mon,  2 Sep 2024 10:36:17 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 131DF1F231EE
	for <lists+linux-media@lfdr.de>; Mon,  2 Sep 2024 08:36:17 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 33F09186E53;
	Mon,  2 Sep 2024 08:36:00 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D128D183092
	for <linux-media@vger.kernel.org>; Mon,  2 Sep 2024 08:35:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725266159; cv=none; b=KGQ1kJJTZmsIrzHbIsLPfEpkrh2nWCenAxuK+ESxB3WYy8GNHwvDtPFB3/VW/N4y1iqYKrzQpEEh0kZ9L8mH5WiXiI37onYXjzQO7yNgCKA4PmlfTvd3sFtWAhg+moApKA3NQgjK/Z8lnquHqEuSsKHFYHzvFlDBrhmXcARdxYk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725266159; c=relaxed/simple;
	bh=c1ZoilupvXOePwyTLsPlmR+RpTfrs6hOkihPa0UZuus=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=AvUjWrM1DfXtQVb3/Hb8YvM2G8yZMm5ct6MgdcNSOFwrClzMc8YvmctX4HwThWhYPkTqk/Tn+MNKDlQVANRBdfXaN8iOAk7eY/geuJqlIDKvFZwRw5Q9N0H8lYNe2ReKgRHh7GY5Kf4aT4Ydf9O1ciuXB8Bl54OK2ZDZRItUuZQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 96580C4CEC6;
	Mon,  2 Sep 2024 08:35:58 +0000 (UTC)
From: Hans Verkuil <hverkuil-cisco@xs4all.nl>
To: linux-media@vger.kernel.org
Cc: Hans Verkuil <hverkuil-cisco@xs4all.nl>,
	Hans de Goede <hdegoede@redhat.com>
Subject: [PATCH 1/4] media: atomisp: add missing wait_prepare/finish ops
Date: Mon,  2 Sep 2024 10:31:21 +0200
Message-ID: <9f401f3732dd728e3d2ca508002c97b80a2eae30.1725265884.git.hverkuil-cisco@xs4all.nl>
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
Cc: Hans de Goede <hdegoede@redhat.com>
---
 drivers/staging/media/atomisp/pci/atomisp_fops.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/staging/media/atomisp/pci/atomisp_fops.c b/drivers/staging/media/atomisp/pci/atomisp_fops.c
index 50c4123ba006..b180fcbea9b1 100644
--- a/drivers/staging/media/atomisp/pci/atomisp_fops.c
+++ b/drivers/staging/media/atomisp/pci/atomisp_fops.c
@@ -441,6 +441,8 @@ const struct vb2_ops atomisp_vb2_ops = {
 	.buf_queue		= atomisp_buf_queue,
 	.start_streaming	= atomisp_start_streaming,
 	.stop_streaming		= atomisp_stop_streaming,
+	.wait_prepare		= vb2_ops_wait_prepare,
+	.wait_finish		= vb2_ops_wait_finish,
 };
 
 static void atomisp_dev_init_struct(struct atomisp_device *isp)
-- 
2.43.0


