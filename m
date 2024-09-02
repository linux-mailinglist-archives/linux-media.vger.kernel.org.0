Return-Path: <linux-media+bounces-17360-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 504D4968962
	for <lists+linux-media@lfdr.de>; Mon,  2 Sep 2024 16:05:09 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id B1203B214F0
	for <lists+linux-media@lfdr.de>; Mon,  2 Sep 2024 14:05:06 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7D6E720FABD;
	Mon,  2 Sep 2024 14:05:00 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 28DE620FABF
	for <linux-media@vger.kernel.org>; Mon,  2 Sep 2024 14:04:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725285900; cv=none; b=hsk8tBfFYHLe0Ji4UsMk8mdArGQ5iiTabxSyJha7MzIXBC1K5R9gRUYi0snQoWUD5917jrmAgx961y/DdanzJBGBzk8ZxdPKvXBF9foojPrgLhWxxdbHOuJogXb/URjNAuxYECgb8XBjW6V+HZW+2c0QSDW7sEc3V3iQWuhY6Vg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725285900; c=relaxed/simple;
	bh=wT82DjcBqfg/q4NsjHyucBUdfT/CkGTppWWI1f3ssRc=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=aOTPRg3wGM1Buzw//Pr+2HFL/SjZ+n92uhe6XxXy/bitW5zG1sLtTzAjMbYoGUbmIsRCy7zVNBZluAjPUE17lvGjRqGO4mLZq8p8PAfRWato6fFGMLKEQ48aoM67p38qPOhLmg0qY7FTtk7dqUB43qbTWIsEqGIvSsgrCHzCeCk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D7815C4CEC4;
	Mon,  2 Sep 2024 14:04:58 +0000 (UTC)
From: Hans Verkuil <hverkuil-cisco@xs4all.nl>
To: linux-media@vger.kernel.org
Cc: Hans Verkuil <hverkuil-cisco@xs4all.nl>,
	Hans de Goede <hdegoede@redhat.com>
Subject: [PATCH 1/9] media: staging: atomisp: set lock before calling vb2_queue_init()
Date: Mon,  2 Sep 2024 16:04:47 +0200
Message-Id: <90b8e7a40c3ed306cbeb96c2f4dad97eb7e53bfd.1725285495.git.hverkuil-cisco@xs4all.nl>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1725285495.git.hverkuil-cisco@xs4all.nl>
References: <cover.1725285495.git.hverkuil-cisco@xs4all.nl>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The vb2_queue_init() will expect the vb2_queue lock pointer to be set in
the future. So for those drivers that set the lock later, move it up to
before the vb2_queue_init() call.

Signed-off-by: Hans Verkuil <hverkuil-cisco@xs4all.nl>
Cc: Hans de Goede <hdegoede@redhat.com>
---
 drivers/staging/media/atomisp/pci/atomisp_subdev.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/staging/media/atomisp/pci/atomisp_subdev.c b/drivers/staging/media/atomisp/pci/atomisp_subdev.c
index 3a3e84a035e2..202497695e46 100644
--- a/drivers/staging/media/atomisp/pci/atomisp_subdev.c
+++ b/drivers/staging/media/atomisp/pci/atomisp_subdev.c
@@ -797,12 +797,12 @@ static int atomisp_init_subdev_pipe(struct atomisp_sub_device *asd,
 	pipe->vb_queue.ops = &atomisp_vb2_ops;
 	pipe->vb_queue.mem_ops = &vb2_vmalloc_memops;
 	pipe->vb_queue.timestamp_flags = V4L2_BUF_FLAG_TIMESTAMP_MONOTONIC;
+	pipe->vb_queue.lock = &pipe->vb_queue_mutex;
 	ret = vb2_queue_init(&pipe->vb_queue);
 	if (ret)
 		return ret;
 
 	pipe->vdev.queue = &pipe->vb_queue;
-	pipe->vdev.queue->lock = &pipe->vb_queue_mutex;
 
 	INIT_LIST_HEAD(&pipe->buffers_in_css);
 	INIT_LIST_HEAD(&pipe->activeq);
-- 
2.34.1


