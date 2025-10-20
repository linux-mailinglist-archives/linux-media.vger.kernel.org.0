Return-Path: <linux-media+bounces-45051-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [142.0.200.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 5129CBF247B
	for <lists+linux-media@lfdr.de>; Mon, 20 Oct 2025 18:02:18 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 51EF84F6B15
	for <lists+linux-media@lfdr.de>; Mon, 20 Oct 2025 16:01:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C34EF283683;
	Mon, 20 Oct 2025 16:01:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=samsung.com header.i=@samsung.com header.b="diCbvMxy"
X-Original-To: linux-media@vger.kernel.org
Received: from mailout2.w1.samsung.com (mailout2.w1.samsung.com [210.118.77.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 23DA3283FCE
	for <linux-media@vger.kernel.org>; Mon, 20 Oct 2025 16:01:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=210.118.77.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760976100; cv=none; b=ah8h3jZppB2WVdcr8KNIRT3//2TjtsgFUSddgVR5YpK++3u2l69c4gk9sqQuTZMLTWZpeu1CeVcyo2ltFGvawGIDzIww58sLs9IFzwnQ6C77gB6YBNE4Hfzmn3Z2LO/OIeg4ZMdJXpBDd2xVdHWCqBwMmMjnt9sBJV/94JQDz1c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760976100; c=relaxed/simple;
	bh=lY512ww2GgxRIYZ3nYvRoncqZSBQoFPXtRikl+duERA=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version:Content-Type:
	 References; b=YLWzcJuw2pX+zg9aHfdcpLhiXlufo63+Buz9I4Z6wdvf0hvX+T7UU00VhNwafbEwuUsg/PWr24J3e6/yilOhpPB/5w8nH+OohiK45yoT+HH36Qg4WVy6q8qGWNv7H0cJvsayaLeEMaV9kl8kVJvxo9hnKUWTvhP0d4e0AjoYn64=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=samsung.com; spf=pass smtp.mailfrom=samsung.com; dkim=pass (1024-bit key) header.d=samsung.com header.i=@samsung.com header.b=diCbvMxy; arc=none smtp.client-ip=210.118.77.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=samsung.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=samsung.com
Received: from eucas1p2.samsung.com (unknown [182.198.249.207])
	by mailout2.w1.samsung.com (KnoxPortal) with ESMTP id 20251020160135euoutp0230d7749ecb1e4abd43ac21dbbe449783~wPm29iV-w1220612206euoutp02d
	for <linux-media@vger.kernel.org>; Mon, 20 Oct 2025 16:01:35 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout2.w1.samsung.com 20251020160135euoutp0230d7749ecb1e4abd43ac21dbbe449783~wPm29iV-w1220612206euoutp02d
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
	s=mail20170921; t=1760976095;
	bh=Vz2ne046ZdvV+eht6cashAps0Hu4TwK9pfYylzXhh4I=;
	h=From:To:Cc:Subject:Date:References:From;
	b=diCbvMxyv6VHxaci38HRs6zoXY8d96RdjS2RPZsMICSvRkrneyUnNJQK/LZ/Uaw6L
	 xKhKEh8hsY4h4LpLmmaQp2FgwMXXjvAaQ23ZKKXp/q88v7+QlSN/0+UZVzpoTvouWD
	 rh/u5PEM7yXEQ2eTmgVRTObDe6WtX1W6+z/UzZLo=
Received: from eusmtip2.samsung.com (unknown [203.254.199.222]) by
	eucas1p2.samsung.com (KnoxPortal) with ESMTPA id
	20251020160135eucas1p29eb8517e240f188f102e77713f85e29d~wPm2qtRxi1568615686eucas1p2V;
	Mon, 20 Oct 2025 16:01:35 +0000 (GMT)
Received: from AMDC4653.digital.local (unknown [106.120.51.32]) by
	eusmtip2.samsung.com (KnoxPortal) with ESMTPA id
	20251020160134eusmtip28bdd46101f68866229b0150d21bad517~wPm2Mo_TP1636616366eusmtip2o;
	Mon, 20 Oct 2025 16:01:34 +0000 (GMT)
From: Marek Szyprowski <m.szyprowski@samsung.com>
To: linux-media@vger.kernel.org, linux-kernel@vger.kernel.org
Cc: Marek Szyprowski <m.szyprowski@samsung.com>, Tomasz Figa
	<tfiga@chromium.org>, Mauro Carvalho Chehab <mchehab@kernel.org>, Guennadi
	Liakhovetski <g.liakhovetski@gmx.de>, Benjamin Gaignard
	<benjamin.gaignard@collabora.com>, Hans Verkuil <hverkuil@kernel.org>,
	stable@vger.kernel.org, Shuangpeng Bai <SJB7183@psu.edu>
Subject: [PATCH v2] media: videobuf2: forbid remove_bufs when legacy fileio
 is active
Date: Mon, 20 Oct 2025 18:01:21 +0200
Message-Id: <20251020160121.1985354-1-m.szyprowski@samsung.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CMS-MailID: 20251020160135eucas1p29eb8517e240f188f102e77713f85e29d
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
X-RootMTR: 20251020160135eucas1p29eb8517e240f188f102e77713f85e29d
X-EPHeader: CA
X-CMS-RootMailID: 20251020160135eucas1p29eb8517e240f188f102e77713f85e29d
References: <CGME20251020160135eucas1p29eb8517e240f188f102e77713f85e29d@eucas1p2.samsung.com>

vb2_ioctl_remove_bufs() call manipulates queue internal buffer list,
potentially overwriting some pointers used by the legacy fileio access
mode. Add a vb2_verify_memory_type() check symmetrical to
vb2_ioctl_create_bufs() to forbid that ioctl when fileio is active to
protect internal queue state between subsequent read/write calls.

CC: stable@vger.kernel.org
Fixes: a3293a85381e ("media: v4l2: Add REMOVE_BUFS ioctl")
Reported-by: Shuangpeng Bai<SJB7183@psu.edu>
Suggested-by: Benjamin Gaignard <benjamin.gaignard@collabora.com>
Signed-off-by: Marek Szyprowski <m.szyprowski@samsung.com>
---
v2:
- dropped a change to vb2_ioctl_create_bufs(), as it is already handled
  by the vb2_verify_memory_type() call
- replaced queue->type check in vb2_ioctl_remove_bufs() by a call to
  vb2_verify_memory_type() which covers all cases

v1: https://lore.kernel.org/all/20251016111154.993949-1-m.szyprowski@samsung.com/
---
 drivers/media/common/videobuf2/videobuf2-v4l2.c | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/drivers/media/common/videobuf2/videobuf2-v4l2.c b/drivers/media/common/videobuf2/videobuf2-v4l2.c
index d911021c1bb0..0de7490292fe 100644
--- a/drivers/media/common/videobuf2/videobuf2-v4l2.c
+++ b/drivers/media/common/videobuf2/videobuf2-v4l2.c
@@ -1000,9 +1000,11 @@ int vb2_ioctl_remove_bufs(struct file *file, void *priv,
 			  struct v4l2_remove_buffers *d)
 {
 	struct video_device *vdev = video_devdata(file);
+	int res;
 
-	if (vdev->queue->type != d->type)
-		return -EINVAL;
+	res = vb2_verify_memory_type(vdev->queue, vdev->queue->memory, d->type);
+	if (res)
+		return res;
 
 	if (d->count == 0)
 		return 0;
-- 
2.34.1


