Return-Path: <linux-media+bounces-4218-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 16C9283D915
	for <lists+linux-media@lfdr.de>; Fri, 26 Jan 2024 12:12:21 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 8C7AD28C23B
	for <lists+linux-media@lfdr.de>; Fri, 26 Jan 2024 11:12:19 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8B77814286;
	Fri, 26 Jan 2024 11:12:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b="gZ7L1tUZ"
X-Original-To: linux-media@vger.kernel.org
Received: from madrid.collaboradmins.com (madrid.collaboradmins.com [46.235.227.194])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7A5C814013
	for <linux-media@vger.kernel.org>; Fri, 26 Jan 2024 11:12:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=46.235.227.194
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1706267531; cv=none; b=MKOqfzSC6PYO6i1H3065SUpQuKrxk5eLKFGpXk/snDtRCKIRoUtC/JD2LN/9VpLRwFcQpymXtGpHkEmCt9BUyGeQ/XQXYhQNVlCYmxtYCA3rCImFiirCqwQCMdyi3F3xh2Ee5yKl8eRtXBwBzjXkh22AXcoILB8bpnF80EJTlyY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1706267531; c=relaxed/simple;
	bh=h7+1fH1asTe/3V1N5kz+xgvCqBbzVWBWOGNpj2Vbml4=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=Sr4x2tSx1P8taZvrsMNmz6I83NPNjY9PouT4y/oxW6lvFON303TxlMWkCgAC4Ml+9EoQi+whky5BWOpq1ta1hcvvmxiE6sK+kS3n+AVV+AbDn4dsGnEu7eZDiMpa0FFKcLQx23S/poqfVsciOVMJi6Tb5+BfD1E6Mu+BnnA0jYI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b=gZ7L1tUZ; arc=none smtp.client-ip=46.235.227.194
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1706267527;
	bh=h7+1fH1asTe/3V1N5kz+xgvCqBbzVWBWOGNpj2Vbml4=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=gZ7L1tUZRxtb/QfxlL2RgukpxAlDrSAQGf1M2V9nC7oxOKaull7tw5B5N0MShSwzl
	 RV8qm065NRy474tRYwGqucEkEQLWUGQFqV+BKEmP5iS8TjjvX9JxnseQ52v1aLIVzt
	 x7IeMhhr2KKhffVPSKqfHAmgc9XBvqTcoRcDKkB7zq8q6f9jMBP+/ls/6enPO9diqE
	 PuLzEVExZRy7pVc+tb9X7KmIhBbtwJkcvR89AWVH4j0lrw926UyDDACpny2rpObhMQ
	 W1lPVWQoKDOpc5RKLcO08NHLya4zQHF1E3DShHYpBw6krMdd822qYXDeqd10maZuR0
	 Bh/L1zuRG7yvQ==
Received: from benjamin-XPS-13-9310.. (cola.collaboradmins.com [195.201.22.229])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: benjamin.gaignard)
	by madrid.collaboradmins.com (Postfix) with ESMTPSA id 7B0CB3782072;
	Fri, 26 Jan 2024 11:12:07 +0000 (UTC)
From: Benjamin Gaignard <benjamin.gaignard@collabora.com>
To: hverkuil@xs4all.nl,
	mchehab@kernel.org
Cc: linux-media@vger.kernel.org,
	kernel@collabora.com,
	Benjamin Gaignard <benjamin.gaignard@collabora.com>
Subject: [PATCH v7 1/2] v4l2-utils: Add VIDIOC_DELETE_BUFS ioctl
Date: Fri, 26 Jan 2024 12:12:04 +0100
Message-Id: <20240126111205.136630-2-benjamin.gaignard@collabora.com>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20240126111205.136630-1-benjamin.gaignard@collabora.com>
References: <20240126111205.136630-1-benjamin.gaignard@collabora.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add VIDIOC_DELETE_BUFS ioctl and it associated structure.
Define V4L2_BUF_CAP_SUPPORTS_DELETE_BUFS to signal that queue support
feature.

Signed-off-by: Benjamin Gaignard <benjamin.gaignard@collabora.com>
---
 include/linux/videodev2.h | 15 +++++++++++++++
 1 file changed, 15 insertions(+)

diff --git a/include/linux/videodev2.h b/include/linux/videodev2.h
index 397a99e3..a71244d9 100644
--- a/include/linux/videodev2.h
+++ b/include/linux/videodev2.h
@@ -2564,6 +2564,20 @@ struct v4l2_create_buffers {
 	__u32			reserved[5];
 };
 
+/**
+ * struct v4l2_delete_buffers - VIDIOC_DELETE_BUFS argument
+ * @index:	the first buffer to be deleted
+ * @count:	number of buffers to delete
+ * @type:	enum v4l2_buf_type
+ * @reserved:	future extensions
+ */
+struct v4l2_delete_buffers {
+	__u32			index;
+	__u32			count;
+	__u32			type;
+	__u32			reserved[13];
+};
+
 /*
  *	I O C T L   C O D E S   F O R   V I D E O   D E V I C E S
  *
@@ -2663,6 +2677,7 @@ struct v4l2_create_buffers {
 #define VIDIOC_DBG_G_CHIP_INFO  _IOWR('V', 102, struct v4l2_dbg_chip_info)
 
 #define VIDIOC_QUERY_EXT_CTRL	_IOWR('V', 103, struct v4l2_query_ext_ctrl)
+#define VIDIOC_DELETE_BUFS	_IOWR('V', 104, struct v4l2_delete_buffers)
 
 /* Reminder: when adding new ioctls please add support for them to
    drivers/media/v4l2-core/v4l2-compat-ioctl32.c as well! */
-- 
2.40.1


