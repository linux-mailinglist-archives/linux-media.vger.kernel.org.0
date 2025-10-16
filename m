Return-Path: <linux-media+bounces-44718-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [142.0.200.124])
	by mail.lfdr.de (Postfix) with ESMTPS id C2EFABE3048
	for <lists+linux-media@lfdr.de>; Thu, 16 Oct 2025 13:12:36 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id DC21E4FF15C
	for <lists+linux-media@lfdr.de>; Thu, 16 Oct 2025 11:12:27 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DB19530C61F;
	Thu, 16 Oct 2025 11:12:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=samsung.com header.i=@samsung.com header.b="ml/7w8Zf"
X-Original-To: linux-media@vger.kernel.org
Received: from mailout2.w1.samsung.com (mailout2.w1.samsung.com [210.118.77.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BDE952E1757
	for <linux-media@vger.kernel.org>; Thu, 16 Oct 2025 11:12:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=210.118.77.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760613135; cv=none; b=Nn833n4y4KkUJos4hrrzylU0Q+eltsVXjKMi92ei4UCUI+cBuseAlvGR+3L3xbxKwcKaxcEcc4iYVku9AzWEH90vQ0oxgCJ/hcmQyblC0M/667b3xkfsLS0GrRwkVu/6gH85Z+ZJcflltTa/Dk6VAhyuQI+DlKRKvGGnwoyKhVY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760613135; c=relaxed/simple;
	bh=F2NDQd0RB+lDxTS6DTrsGgpz1L9XDygP38aOkc9JCmQ=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version:Content-Type:
	 References; b=bnSVtjya8djrtWvUi+m7aYjiDpMZvQ2kaMtPGUkzKkBp7u3lQRk6+tM3KvSpyYcP1Zo7mcOxUo/XK3Ukx6Vmc0cvKPTClm0rNdemFCcVAfprIR8BzU6HZbrUMrcJ91XxOo6PzHbZfQxMSmo3Y8vUJGcp0G+d77bPTK2K7IhKDgo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=samsung.com; spf=pass smtp.mailfrom=samsung.com; dkim=pass (1024-bit key) header.d=samsung.com header.i=@samsung.com header.b=ml/7w8Zf; arc=none smtp.client-ip=210.118.77.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=samsung.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=samsung.com
Received: from eucas1p1.samsung.com (unknown [182.198.249.206])
	by mailout2.w1.samsung.com (KnoxPortal) with ESMTP id 20251016111208euoutp02c8309595140c1247171ba1c4c769652b~u9E-6SX0g1602516025euoutp02b
	for <linux-media@vger.kernel.org>; Thu, 16 Oct 2025 11:12:08 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout2.w1.samsung.com 20251016111208euoutp02c8309595140c1247171ba1c4c769652b~u9E-6SX0g1602516025euoutp02b
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
	s=mail20170921; t=1760613128;
	bh=vz6aHMBDh36l9YV+XjUIIXycn9boKM8dyJnIdlbGieA=;
	h=From:To:Cc:Subject:Date:References:From;
	b=ml/7w8ZfnrWTdTCW0sjXPykM6Z9Pi3CBIqOprfFmB+gDvj13V4IfWIyPxFgnnBsE/
	 CxA4dRIgRfqoWv26PNTZnc7ihN1w/lXEImegGrJ/X3RTiGDcS6qCvEg3GfSo/KoHlz
	 MB/1QLvN+xI+5LOXTqnJm3esHr5LiJ/PGtykp7VQ=
Received: from eusmtip1.samsung.com (unknown [203.254.199.221]) by
	eucas1p2.samsung.com (KnoxPortal) with ESMTPA id
	20251016111208eucas1p24cd8cc1e952a8cdf73fbadea704b499d~u9E-jI15-1702017020eucas1p2G;
	Thu, 16 Oct 2025 11:12:08 +0000 (GMT)
Received: from AMDC4653.digital.local (unknown [106.120.51.32]) by
	eusmtip1.samsung.com (KnoxPortal) with ESMTPA id
	20251016111207eusmtip1a8615a027e8a98878686cbaa67d402a5~u9E-HbUgn1158811588eusmtip1i;
	Thu, 16 Oct 2025 11:12:07 +0000 (GMT)
From: Marek Szyprowski <m.szyprowski@samsung.com>
To: linux-media@vger.kernel.org, linux-kernel@vger.kernel.org
Cc: Marek Szyprowski <m.szyprowski@samsung.com>, Tomasz Figa
	<tfiga@chromium.org>, Mauro Carvalho Chehab <mchehab@kernel.org>, Guennadi
	Liakhovetski <g.liakhovetski@gmx.de>, Benjamin Gaignard
	<benjamin.gaignard@collabora.com>, Hans Verkuil <hverkuil@kernel.org>,
	stable@vger.kernel.org
Subject: [PATCH] media: videobuf2: forbid create_bufs/remove_bufs when
 legacy fileio is active
Date: Thu, 16 Oct 2025 13:11:54 +0200
Message-Id: <20251016111154.993949-1-m.szyprowski@samsung.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CMS-MailID: 20251016111208eucas1p24cd8cc1e952a8cdf73fbadea704b499d
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
X-RootMTR: 20251016111208eucas1p24cd8cc1e952a8cdf73fbadea704b499d
X-EPHeader: CA
X-CMS-RootMailID: 20251016111208eucas1p24cd8cc1e952a8cdf73fbadea704b499d
References: <CGME20251016111208eucas1p24cd8cc1e952a8cdf73fbadea704b499d@eucas1p2.samsung.com>

create_bufs and remove_bufs ioctl calls manipulate queue internal buffer
list, potentially overwriting some pointers used by the legacy fileio
access mode. Simply forbid those calls when fileio is active to protect
internal queue state between subsequent read/write calls.

CC: stable@vger.kernel.org
Fixes: 2d86401c2cbf ("[media] V4L: vb2: add support for buffers of different sizes on a single queue")
Fixes: a3293a85381e ("media: v4l2: Add REMOVE_BUFS ioctl")
Signed-off-by: Marek Szyprowski <m.szyprowski@samsung.com>
---
 drivers/media/common/videobuf2/videobuf2-v4l2.c | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/drivers/media/common/videobuf2/videobuf2-v4l2.c b/drivers/media/common/videobuf2/videobuf2-v4l2.c
index d911021c1bb0..f4104d5971dd 100644
--- a/drivers/media/common/videobuf2/videobuf2-v4l2.c
+++ b/drivers/media/common/videobuf2/videobuf2-v4l2.c
@@ -751,6 +751,11 @@ int vb2_create_bufs(struct vb2_queue *q, struct v4l2_create_buffers *create)
 	int ret = vb2_verify_memory_type(q, create->memory, f->type);
 	unsigned i;
 
+	if (vb2_fileio_is_active(q)) {
+		dprintk(q, 1, "file io in progress\n");
+		return -EBUSY;
+	}
+
 	create->index = vb2_get_num_buffers(q);
 	vb2_set_flags_and_caps(q, create->memory, &create->flags,
 			       &create->capabilities, &create->max_num_buffers);
@@ -1010,6 +1015,11 @@ int vb2_ioctl_remove_bufs(struct file *file, void *priv,
 	if (vb2_queue_is_busy(vdev->queue, file))
 		return -EBUSY;
 
+	if (vb2_fileio_is_active(vdev->queue)) {
+		dprintk(vdev->queue, 1, "file io in progress\n");
+		return -EBUSY;
+	}
+
 	return vb2_core_remove_bufs(vdev->queue, d->index, d->count);
 }
 EXPORT_SYMBOL_GPL(vb2_ioctl_remove_bufs);
-- 
2.34.1


