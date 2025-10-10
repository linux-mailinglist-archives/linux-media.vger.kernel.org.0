Return-Path: <linux-media+bounces-44161-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 124D2BCC728
	for <lists+linux-media@lfdr.de>; Fri, 10 Oct 2025 11:57:45 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id BE98940257D
	for <lists+linux-media@lfdr.de>; Fri, 10 Oct 2025 09:57:43 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E211F2ED17A;
	Fri, 10 Oct 2025 09:57:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="LsGYLeFt"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4BD1E20A5EA
	for <linux-media@vger.kernel.org>; Fri, 10 Oct 2025 09:57:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760090256; cv=none; b=cKELP3MS7HxBhtViXevtOglDJxSDhFvZvZN+9VQvjDZZ1WHhcyTCVC4pnbeG2a6Yrt4Q0cyelqvwUXjtF2onm47QfKIdR0I2+p/p9r5lN/pjAuzK2ItZyg4+nBLs7LMpZwFp78ZrBLDhjkgNtRSWU66lh58iq9ivfSBTjc38rBQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760090256; c=relaxed/simple;
	bh=o+PCIZgupjw/WqR4FkhT+mDGTSZsCUH+5fibY/dpA/E=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=rZKvYuqhCbrOZYIup7Ecx0eDqI+B0Jh1FWjm8aPZGM6+Jxq8oyYWdRXp5WxGci29ilurX0IFdEkj0Yj3uSx37cyWYMiIn8uoc9/76TsVh5CKUdOeKX+gFxhWB3CTnolBO8HBqcg8APYt4p+m3QBpwLeeiV+rtNOgNIkCwMS0Ns4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=LsGYLeFt; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 15E4CC4CEF5;
	Fri, 10 Oct 2025 09:57:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1760090255;
	bh=o+PCIZgupjw/WqR4FkhT+mDGTSZsCUH+5fibY/dpA/E=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=LsGYLeFtIAQj71lIQMzZsSCILf8h3e1qrgyLe3fNgDMAZ1aF6j2OWE8yMfC9XO3gj
	 QxVuThOd40VIwWAupHeJhWhfCsw/CTtYkXO2XW8nsxlwZsHYg5A6BNchJOmVoCKUPD
	 BY35V8nuh9AL+8f+VyCGG9yNnIu/0WCJECnVAdlK4J3vG/OwnHl3Q15RE8K1YZLYb5
	 u2Lu5XLtuAzMZdMyhKJzQBvyE4Y8042de3ixArK6xKRgZjBvwKuRy0bJLEluwr/+A5
	 EqppcSLlXqpULnUlVU0c14lQ03c00m1m3rrztoVIlGFJrFDfuO87Kzwo0Siv6/DYgF
	 oThKUqgPNEXOQ==
From: Hans Verkuil <hverkuil+cisco@kernel.org>
To: linux-media@vger.kernel.org
Cc: Sakari Ailus <sakari.ailus@linux.intel.com>,
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Nicolas Dufresne <nicolas@ndufresne.ca>,
	Hans Verkuil <hverkuil+cisco@kernel.org>
Subject: [RFC PATCH 1/5] media: videodev2.h: add flags field to v4l2_event
Date: Fri, 10 Oct 2025 11:54:06 +0200
Message-ID: <10360b8b280a682ad2a6d0b3d07205981d4097ae.1760090050.git.hverkuil+cisco@kernel.org>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <cover.1760090050.git.hverkuil+cisco@kernel.org>
References: <cover.1760090050.git.hverkuil+cisco@kernel.org>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add a new flags field to struct v4l2_event.

Signed-off-by: Hans Verkuil <hverkuil+cisco@kernel.org>
---
 drivers/media/v4l2-core/v4l2-compat-ioctl32.c | 8 ++++++--
 drivers/media/v4l2-core/v4l2-ioctl.c          | 4 ++--
 include/uapi/linux/videodev2.h                | 3 ++-
 3 files changed, 10 insertions(+), 5 deletions(-)

diff --git a/drivers/media/v4l2-core/v4l2-compat-ioctl32.c b/drivers/media/v4l2-core/v4l2-compat-ioctl32.c
index 2c88e1175a10..160ce928bc91 100644
--- a/drivers/media/v4l2-core/v4l2-compat-ioctl32.c
+++ b/drivers/media/v4l2-core/v4l2-compat-ioctl32.c
@@ -754,7 +754,8 @@ struct v4l2_event32 {
 		compat_s64		tv_nsec;
 	} timestamp;
 	__u32				id;
-	__u32				reserved[8];
+	__u32				flags;
+	__u32				reserved[7];
 };
 
 static int put_v4l2_event32(struct v4l2_event *p64,
@@ -767,6 +768,7 @@ static int put_v4l2_event32(struct v4l2_event *p64,
 	    put_user(p64->timestamp.tv_sec, &p32->timestamp.tv_sec) ||
 	    put_user(p64->timestamp.tv_nsec, &p32->timestamp.tv_nsec) ||
 	    put_user(p64->id, &p32->id) ||
+	    put_user(p64->flags, &p32->flags) ||
 	    copy_to_user(p32->reserved, p64->reserved, sizeof(p32->reserved)))
 		return -EFAULT;
 	return 0;
@@ -785,7 +787,8 @@ struct v4l2_event32_time32 {
 	__u32				sequence;
 	struct old_timespec32		timestamp;
 	__u32				id;
-	__u32				reserved[8];
+	__u32				flags;
+	__u32				reserved[7];
 };
 
 static int put_v4l2_event32_time32(struct v4l2_event *p64,
@@ -798,6 +801,7 @@ static int put_v4l2_event32_time32(struct v4l2_event *p64,
 	    put_user(p64->timestamp.tv_sec, &p32->timestamp.tv_sec) ||
 	    put_user(p64->timestamp.tv_nsec, &p32->timestamp.tv_nsec) ||
 	    put_user(p64->id, &p32->id) ||
+	    put_user(p64->flags, &p32->flags) ||
 	    copy_to_user(p32->reserved, p64->reserved, sizeof(p32->reserved)))
 		return -EFAULT;
 	return 0;
diff --git a/drivers/media/v4l2-core/v4l2-ioctl.c b/drivers/media/v4l2-core/v4l2-ioctl.c
index 01cf52c3ea33..b421336605a3 100644
--- a/drivers/media/v4l2-core/v4l2-ioctl.c
+++ b/drivers/media/v4l2-core/v4l2-ioctl.c
@@ -791,8 +791,8 @@ static void v4l_print_event(const void *arg, bool write_only)
 	const struct v4l2_event *p = arg;
 	const struct v4l2_event_ctrl *c;
 
-	pr_cont("type=0x%x, pending=%u, sequence=%u, id=%u, timestamp=%llu.%9.9llu\n",
-			p->type, p->pending, p->sequence, p->id,
+	pr_cont("type=0x%x, pending=%u, sequence=%u, id=%u, flags=%08x, timestamp=%llu.%9.9llu\n",
+			p->type, p->pending, p->sequence, p->id, p->flags,
 			p->timestamp.tv_sec, p->timestamp.tv_nsec);
 	switch (p->type) {
 	case V4L2_EVENT_VSYNC:
diff --git a/include/uapi/linux/videodev2.h b/include/uapi/linux/videodev2.h
index becd08fdbddb..83ee088df24a 100644
--- a/include/uapi/linux/videodev2.h
+++ b/include/uapi/linux/videodev2.h
@@ -2618,7 +2618,8 @@ struct v4l2_event {
 	struct timespec			timestamp;
 #endif
 	__u32				id;
-	__u32				reserved[8];
+	__u32				flags;
+	__u32				reserved[7];
 };
 
 #define V4L2_EVENT_SUB_FL_SEND_INITIAL		(1 << 0)
-- 
2.51.0


