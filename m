Return-Path: <linux-media+bounces-28958-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id E3308A7524B
	for <lists+linux-media@lfdr.de>; Fri, 28 Mar 2025 23:05:43 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id B43357A6969
	for <lists+linux-media@lfdr.de>; Fri, 28 Mar 2025 22:04:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 58EAD1E51EF;
	Fri, 28 Mar 2025 22:05:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=rere.qmqm.pl header.i=@rere.qmqm.pl header.b="Lao+jfJT"
X-Original-To: linux-media@vger.kernel.org
Received: from rere.qmqm.pl (rere.qmqm.pl [91.227.64.183])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0AA09145B24;
	Fri, 28 Mar 2025 22:05:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=91.227.64.183
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743199532; cv=none; b=iElzT46ymnlpnjAdeSzh/oFcicecfb77oB7lTw9Rk2bWV9CMFeY5LYyydh29nW2bg9YFRh9DeJ4esgWp6LF5BeOz7ZawD0u3YBpBkhD5NTG8kyqXwKNZ2Y+Qd7txDmWf7d0d6/zybVQi+lVg4++f1+0FJU6OwH/eLQCNPUHOYdo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743199532; c=relaxed/simple;
	bh=STj7BAh1HZkG6kcQaITmaRBGjjCr19VABXUsCekE7Xw=;
	h=Date:Message-Id:Subject:MIME-Version:Content-Type:From:To:Cc; b=pWaWEo5H9UGsqdA492/YScr+zX0yeRbucu0TpdtEz280Hj2OMWyMyS+NI4a6SC792sVf432/MhsD521cZVc4JbZkzprHM6YYWG8sWDHGUnlsBIIL1nqeEXhlQ+knZxM2ohww3QS10kowbRdzfOwDXk/ZTpfOnWUE3y4eNB7u5jc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=rere.qmqm.pl; spf=pass smtp.mailfrom=rere.qmqm.pl; dkim=pass (2048-bit key) header.d=rere.qmqm.pl header.i=@rere.qmqm.pl header.b=Lao+jfJT; arc=none smtp.client-ip=91.227.64.183
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=rere.qmqm.pl
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=rere.qmqm.pl
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=rere.qmqm.pl; s=1;
	t=1743199527; bh=STj7BAh1HZkG6kcQaITmaRBGjjCr19VABXUsCekE7Xw=;
	h=Date:Subject:From:To:Cc:From;
	b=Lao+jfJT2qqGxjxozIVLDNZGnQzKzWHwXybFYEY2vYKo3r2HnKqoDRLSZvs8Gy8zz
	 tPFMwlQU5jQ99AHR+dUZtiA6y4O4OQM8WccL8/eVx0gFjAyKSRtfZfmw7XAw/ssb8L
	 YaC0WhhZpRQVD426FGX79HX31XvbAv/A3tT7YKrfg8iN958TN4XEUecfw/KD+qE1Zw
	 2mlpz61RsuP7bMyJUCHDlL1Jq7c/bcXezOUZ4uIBbcZ9le/1jkpT7FKSlK0g8cfcFF
	 mdoRD1e1sQpHwxvdj0PNU07cEoVXD5nUlHVvGPe6tdRi3L3th0RxbKRvzlo6ks6EPj
	 0CmkGytneFEhw==
Received: from remote.user (localhost [127.0.0.1])
	by rere.qmqm.pl (Postfix) with ESMTPSA id 4ZPZMq3vVyzGC;
	Fri, 28 Mar 2025 23:05:27 +0100 (CET)
X-Virus-Status: Clean
X-Virus-Scanned: clamav-milter 1.0.7 at mail
Date: Fri, 28 Mar 2025 23:05:27 +0100
Message-Id: <f78d0c5d569d646717f31fbb2bc4e1a5812e40b5.1743199454.git.mirq-linux@rere.qmqm.pl>
Subject: [PATCH] media: videobuf2: check constants during build time
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
From:	=?UTF-8?q?Micha=C5=82=20Miros=C5=82aw?= <mirq-linux@rere.qmqm.pl>
To:	Tomasz Figa <tfiga@chromium.org>,
	Marek Szyprowski <m.szyprowski@samsung.com>
Cc:	Mauro Carvalho Chehab <mchehab@kernel.org>,
	linux-media@vger.kernel.org,
	linux-kernel@vger.kernel.org

There is nothing a driver author can do fix in the driver to make the
global constants match. Since the assertion can be verified at build
time, don't return EINVAL at runtime for it.

Signed-off-by: Michał Mirosław <mirq-linux@rere.qmqm.pl>
---
 drivers/media/common/videobuf2/videobuf2-v4l2.c | 11 +++++------
 1 file changed, 5 insertions(+), 6 deletions(-)

diff --git a/drivers/media/common/videobuf2/videobuf2-v4l2.c b/drivers/media/common/videobuf2/videobuf2-v4l2.c
index 9201d854dbcc..1cd26faee503 100644
--- a/drivers/media/common/videobuf2/videobuf2-v4l2.c
+++ b/drivers/media/common/videobuf2/videobuf2-v4l2.c
@@ -903,6 +903,11 @@ EXPORT_SYMBOL_GPL(vb2_expbuf);
 
 int vb2_queue_init_name(struct vb2_queue *q, const char *name)
 {
+	/* vb2_memory should match with v4l2_memory */
+	BUILD_BUG_ON(VB2_MEMORY_MMAP != (int)V4L2_MEMORY_MMAP);
+	BUILD_BUG_ON(VB2_MEMORY_USERPTR != (int)V4L2_MEMORY_USERPTR);
+	BUILD_BUG_ON(VB2_MEMORY_DMABUF != (int)V4L2_MEMORY_DMABUF);
+
 	/*
 	 * Sanity check
 	 */
@@ -916,12 +921,6 @@ int vb2_queue_init_name(struct vb2_queue *q, const char *name)
 	WARN_ON((q->timestamp_flags & V4L2_BUF_FLAG_TIMESTAMP_MASK) ==
 		V4L2_BUF_FLAG_TIMESTAMP_UNKNOWN);
 
-	/* Warn that vb2_memory should match with v4l2_memory */
-	if (WARN_ON(VB2_MEMORY_MMAP != (int)V4L2_MEMORY_MMAP)
-		|| WARN_ON(VB2_MEMORY_USERPTR != (int)V4L2_MEMORY_USERPTR)
-		|| WARN_ON(VB2_MEMORY_DMABUF != (int)V4L2_MEMORY_DMABUF))
-		return -EINVAL;
-
 	if (q->buf_struct_size == 0)
 		q->buf_struct_size = sizeof(struct vb2_v4l2_buffer);
 
-- 
2.39.5


