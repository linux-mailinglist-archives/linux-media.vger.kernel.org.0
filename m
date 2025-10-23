Return-Path: <linux-media+bounces-45377-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 33F6FC00C4E
	for <lists+linux-media@lfdr.de>; Thu, 23 Oct 2025 13:34:58 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 46B923AE653
	for <lists+linux-media@lfdr.de>; Thu, 23 Oct 2025 11:31:43 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0DC6D30DEB1;
	Thu, 23 Oct 2025 11:31:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=samsung.com header.i=@samsung.com header.b="MyxMWOyd"
X-Original-To: linux-media@vger.kernel.org
Received: from mailout1.w1.samsung.com (mailout1.w1.samsung.com [210.118.77.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 58E7D2ECD3F
	for <linux-media@vger.kernel.org>; Thu, 23 Oct 2025 11:31:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=210.118.77.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761219071; cv=none; b=Ahu3o36bMnDYQOebPaQFQsnmEc5bjQEYGX00R7mgSW39H2TV3RDmZHhd1LXwkxrrjy5RHZkPFkn1vD7nj7P9irr5PZaAbxxlReDpeQKEwGqEbg0f40oVJWLGVUjtbkjOiGIiBHQ8Y3pe0fEBArOjpfg/lxf2tVY3j33tFHp6BqI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761219071; c=relaxed/simple;
	bh=JcnSMo9y3YxKtGUECkBGqRJ6L1ZRjv62tHSgnSjZjEk=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version:Content-Type:
	 References; b=bkqVMzJBK+1ycgo7e8M4g32UJRVKFmcjt5gDPu2vGg8ONbio0h88F2E2lB1N4Jp21Q+edptdLE2NOncJoitpj5Ztx/ozi5ANEKt/I9zQSsZQznlnG1UR4+nccqw67HaMItXb3SamJ117p61GN1t7DpQWcIY/r1JWuRou7feVEvs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=samsung.com; spf=pass smtp.mailfrom=samsung.com; dkim=pass (1024-bit key) header.d=samsung.com header.i=@samsung.com header.b=MyxMWOyd; arc=none smtp.client-ip=210.118.77.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=samsung.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=samsung.com
Received: from eucas1p2.samsung.com (unknown [182.198.249.207])
	by mailout1.w1.samsung.com (KnoxPortal) with ESMTP id 20251023113101euoutp01ffb896af8c595533ff7c52b117b80c51~xG2fI1rjK2799327993euoutp01f
	for <linux-media@vger.kernel.org>; Thu, 23 Oct 2025 11:31:01 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout1.w1.samsung.com 20251023113101euoutp01ffb896af8c595533ff7c52b117b80c51~xG2fI1rjK2799327993euoutp01f
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
	s=mail20170921; t=1761219061;
	bh=Zx10uetxODgjiKwTb72B0FkSj8NfHGThGH35zw/9c/k=;
	h=From:To:Cc:Subject:Date:References:From;
	b=MyxMWOydrLm4P9vtJWZy9qjqZKcM90Rb+ffqBXikNI6dTkoAPV2JMO2VugVbaAbBP
	 Jn1EV96/W6+Ut7T6dIvy0/SVfVGHQ7LiLTfQ5UfcinytcjkgsPxWjhw0tMdgCUX2yA
	 t3M/3HTVDNrYEx8DiU29K5P0MYVEZMpUVI9Ss0y8=
Received: from eusmtip2.samsung.com (unknown [203.254.199.222]) by
	eucas1p2.samsung.com (KnoxPortal) with ESMTPA id
	20251023113101eucas1p2c227985b0198d888564cab00aeb94f01~xG2epxrmC0682306823eucas1p2M;
	Thu, 23 Oct 2025 11:31:01 +0000 (GMT)
Received: from AMDC4653.digital.local (unknown [106.120.51.32]) by
	eusmtip2.samsung.com (KnoxPortal) with ESMTPA id
	20251023113100eusmtip2603dffa83e23648131d49e9f9b96ce67~xG2eKz9l00413304133eusmtip2C;
	Thu, 23 Oct 2025 11:31:00 +0000 (GMT)
From: Marek Szyprowski <m.szyprowski@samsung.com>
To: linux-media@vger.kernel.org, linux-kernel@vger.kernel.org
Cc: Marek Szyprowski <m.szyprowski@samsung.com>, Tomasz Figa
	<tfiga@chromium.org>, Mauro Carvalho Chehab <mchehab@kernel.org>, Guennadi
	Liakhovetski <g.liakhovetski@gmx.de>, Benjamin Gaignard
	<benjamin.gaignard@collabora.com>, Hans Verkuil <hverkuil@kernel.org>,
	stable@vger.kernel.org, Shuangpeng Bai <SJB7183@psu.edu>
Subject: [PATCH v3] media: videobuf2: forbid remove_bufs when legacy fileio
 is active
Date: Thu, 23 Oct 2025 13:30:52 +0200
Message-Id: <20251023113052.1303082-1-m.szyprowski@samsung.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CMS-MailID: 20251023113101eucas1p2c227985b0198d888564cab00aeb94f01
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
X-RootMTR: 20251023113101eucas1p2c227985b0198d888564cab00aeb94f01
X-EPHeader: CA
X-CMS-RootMailID: 20251023113101eucas1p2c227985b0198d888564cab00aeb94f01
References: <CGME20251023113101eucas1p2c227985b0198d888564cab00aeb94f01@eucas1p2.samsung.com>

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
 drivers/media/common/videobuf2/videobuf2-v4l2.c | 8 +++++---
 1 file changed, 5 insertions(+), 3 deletions(-)

diff --git a/drivers/media/common/videobuf2/videobuf2-v4l2.c b/drivers/media/common/videobuf2/videobuf2-v4l2.c
index d911021c1bb0..a8a5b42a42d0 100644
--- a/drivers/media/common/videobuf2/videobuf2-v4l2.c
+++ b/drivers/media/common/videobuf2/videobuf2-v4l2.c
@@ -1000,13 +1000,15 @@ int vb2_ioctl_remove_bufs(struct file *file, void *priv,
 			  struct v4l2_remove_buffers *d)
 {
 	struct video_device *vdev = video_devdata(file);
-
-	if (vdev->queue->type != d->type)
-		return -EINVAL;
+	int res;
 
 	if (d->count == 0)
 		return 0;
 
+	res = vb2_verify_memory_type(vdev->queue, vdev->queue->memory, d->type);
+	if (res)
+		return res;
+
 	if (vb2_queue_is_busy(vdev->queue, file))
 		return -EBUSY;
 
-- 
2.34.1


