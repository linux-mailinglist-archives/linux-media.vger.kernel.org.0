Return-Path: <linux-media+bounces-44390-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id DC20FBD8CDE
	for <lists+linux-media@lfdr.de>; Tue, 14 Oct 2025 12:47:08 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 2DAD6189D8CB
	for <lists+linux-media@lfdr.de>; Tue, 14 Oct 2025 10:47:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8928D2FABF5;
	Tue, 14 Oct 2025 10:47:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=samsung.com header.i=@samsung.com header.b="hMRTIaCu"
X-Original-To: linux-media@vger.kernel.org
Received: from mailout1.w1.samsung.com (mailout1.w1.samsung.com [210.118.77.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9DDB42F8BC0
	for <linux-media@vger.kernel.org>; Tue, 14 Oct 2025 10:47:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=210.118.77.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760438824; cv=none; b=SBkn+B6WJtL/OHg6OeyI+Wi0m8TAqzXBGDVkqdiuQE/oxfpSW1/ERiKTOV1H3h4ZxGmSlLIgzl9nw8wJRmcS/O9bCAqjzfD2VTopyXvkVOMZ7hiI2HP4dW7DtnJyZCQSUUnF4CRTwA+VHyoUCvZ4/UaazCksfKIlW0ek7Ov17Uc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760438824; c=relaxed/simple;
	bh=8aocFyCOxCpoLJEbEuTq35PMVV63kXV+5jFoHk+IvTk=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version:Content-Type:
	 References; b=J4zDYnYlblu5vHS9Gf1NN5ueNBxs/bmNQxLvHQHh/Bh8qO4ydM3GlUDSi4n6S7195BM8GnHtpYyQBA510HEN7d/VZEO4Anb849kQLH7zdxhvvhi0TQfdJUxxWu6ksDOr0cgwwus2Tt8IJuyXnqwzyhGZsJLv8LZw+GGLy7QNRb8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=samsung.com; spf=pass smtp.mailfrom=samsung.com; dkim=pass (1024-bit key) header.d=samsung.com header.i=@samsung.com header.b=hMRTIaCu; arc=none smtp.client-ip=210.118.77.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=samsung.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=samsung.com
Received: from eucas1p2.samsung.com (unknown [182.198.249.207])
	by mailout1.w1.samsung.com (KnoxPortal) with ESMTP id 20251014104654euoutp01855ca85e73a6d601db22ce27145a805e~uVcZK5ylM0692406924euoutp01G
	for <linux-media@vger.kernel.org>; Tue, 14 Oct 2025 10:46:54 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout1.w1.samsung.com 20251014104654euoutp01855ca85e73a6d601db22ce27145a805e~uVcZK5ylM0692406924euoutp01G
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
	s=mail20170921; t=1760438814;
	bh=zkmQ5PPCGOMpS7lkgoZAul6Lf/MVygcQKOzt/YoDHLg=;
	h=From:To:Cc:Subject:Date:References:From;
	b=hMRTIaCugssG/s6KTGhn/owQf2lt9ESLRQip68gzTsr+WuXn1NdD6V6UVyXd/56+s
	 fPxUljIFihydZrPi4ZMFi8jPXP2fgNwwMhb3efj+kEnx7yrqIwXZFY589+KPagy3M0
	 CMibQQjItzmN5KfcZecURMz6KpLY3qSSaunyPm5Q=
Received: from eusmtip1.samsung.com (unknown [203.254.199.221]) by
	eucas1p1.samsung.com (KnoxPortal) with ESMTPA id
	20251014104654eucas1p19b0f4c8c17c0d5fca76ba1e12f74fbe4~uVcYzqshg0183901839eucas1p16;
	Tue, 14 Oct 2025 10:46:54 +0000 (GMT)
Received: from AMDC4653.digital.local (unknown [106.120.51.32]) by
	eusmtip1.samsung.com (KnoxPortal) with ESMTPA id
	20251014104653eusmtip1029c762e819539d11b084aa8582c35c3~uVcYZUAKX2950129501eusmtip1O;
	Tue, 14 Oct 2025 10:46:53 +0000 (GMT)
From: Marek Szyprowski <m.szyprowski@samsung.com>
To: linux-media@vger.kernel.org, linux-samsung-soc@vger.kernel.org
Cc: Marek Szyprowski <m.szyprowski@samsung.com>, Sylwester Nawrocki
	<s.nawrocki@samsung.com>, Hans Verkuil <hverkuil@xs4all.nl>, Mauro Carvalho
	Chehab <mchehab@kernel.org>, Krzysztof Kozlowski <krzk@kernel.org>, Alim
	Akhtar <alim.akhtar@samsung.com>
Subject: [PATCH] media: samsung: exynos4-is: fix potential ABBA deadlock on
 init
Date: Tue, 14 Oct 2025 12:46:43 +0200
Message-Id: <20251014104643.1884897-1-m.szyprowski@samsung.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CMS-MailID: 20251014104654eucas1p19b0f4c8c17c0d5fca76ba1e12f74fbe4
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
X-RootMTR: 20251014104654eucas1p19b0f4c8c17c0d5fca76ba1e12f74fbe4
X-EPHeader: CA
X-CMS-RootMailID: 20251014104654eucas1p19b0f4c8c17c0d5fca76ba1e12f74fbe4
References: <CGME20251014104654eucas1p19b0f4c8c17c0d5fca76ba1e12f74fbe4@eucas1p1.samsung.com>

v4l2_device_register_subdev_nodes() must called without taking
media_dev->graph_mutex to avoid potential AB-BA deadlock on further
subdevice driver initialization.

Fixes: fa91f1056f17 ("[media] exynos4-is: Add support for asynchronous subdevices registration")
Signed-off-by: Marek Szyprowski <m.szyprowski@samsung.com>
---
This fixes a long standing bug that happens sometimes during driver
intialization. This issue has been finally captured by the lock
dependency tracker with the following log:

 ======================================================
 WARNING: possible circular locking dependency detected
 6.17.0-00001-g6ec53b34d5b7 #16049 Not tainted
 ------------------------------------------------------
 kworker/u16:3/50 is trying to acquire lock:
 bf049068 (videodev_lock){+.+.}-{3:3}, at: __video_register_device+0xf0/0x1428 [videodev]
 
 but task is already holding lock:
 c3818a34 (&mdev->graph_mutex){+.+.}-{3:3}, at: subdev_notifier_complete+0x30/0x3cc [s5p_fimc]
 
 which lock already depends on the new lock.
 
 
 the existing dependency chain (in reverse order) is:
 
 -> #1 (&mdev->graph_mutex){+.+.}-{3:3}:
        __mutex_lock+0xb0/0x10c4
        mutex_lock_nested+0x1c/0x24
        media_device_register_entity+0x84/0x1ec [mc]
        __video_register_device+0x958/0x1428 [videodev]
        fimc_capture_subdev_registered+0x2a8/0x300 [s5p_fimc]
        __v4l2_device_register_subdev+0xd0/0x164 [videodev]
        fimc_md_probe+0x79c/0xcc0 [s5p_fimc]
        platform_probe+0x5c/0x98
        really_probe+0xe0/0x3d4
        __driver_probe_device+0x9c/0x1e0
        driver_probe_device+0x30/0xc0
        __driver_attach+0x124/0x1d4
        bus_for_each_dev+0x70/0xc4
        bus_add_driver+0xe0/0x220
        driver_register+0x7c/0x114
        _note_18+0xc/0x1c [exynos_fimc_lite]
        do_one_initcall+0x70/0x328
        do_init_module+0x54/0x234
        init_module_from_file+0x94/0xd4
        sys_finit_module+0x1a4/0x2d4
        ret_fast_syscall+0x0/0x1c
 
 -> #0 (videodev_lock){+.+.}-{3:3}:
        __lock_acquire+0x1650/0x29fc
        lock_acquire+0x134/0x388
        __mutex_lock+0xb0/0x10c4
        mutex_lock_nested+0x1c/0x24
        __video_register_device+0xf0/0x1428 [videodev]
        __v4l2_device_register_subdev_nodes+0xd8/0x1a4 [videodev]
        subdev_notifier_complete+0x1dc/0x3cc [s5p_fimc]
        __v4l2_async_register_subdev+0xd0/0x1ac [v4l2_async]
        s5c73m3_probe+0x620/0x724 [s5c73m3]
        i2c_device_probe+0x1bc/0x364
        really_probe+0xe0/0x3d4
        __driver_probe_device+0x9c/0x1e0
        driver_probe_device+0x30/0xc0
        __device_attach_driver+0xa8/0x120
        bus_for_each_drv+0x84/0xdc
        __device_attach+0xb0/0x20c
        bus_probe_device+0x8c/0x90
        deferred_probe_work_func+0x98/0xe0
        process_one_work+0x250/0x71c
        worker_thread+0x1ac/0x3b0
        kthread+0x13c/0x278
        ret_from_fork+0x14/0x28
 
 other info that might help us debug this:
 
  Possible unsafe locking scenario:
 
        CPU0                    CPU1
        ----                    ----
   lock(&mdev->graph_mutex);
                                lock(videodev_lock);
                                lock(&mdev->graph_mutex);
   lock(videodev_lock);
 
  *** DEADLOCK ***
 
 5 locks held by kworker/u16:3/50:
  #0: c1c128b4 ((wq_completion)events_unbound){+.+.}-{0:0}, at: process_one_work+0x1b0/0x71c
  #1: f0a15f18 (deferred_probe_work){+.+.}-{0:0}, at: process_one_work+0x1dc/0x71c
  #2: c2617c9c (&dev->mutex){....}-{3:3}, at: __device_attach+0x30/0x20c
  #3: bf09c040 (list_lock){+.+.}-{3:3}, at: __v4l2_async_register_subdev+0x50/0x1ac [v4l2_async]
  #4: c3818a34 (&mdev->graph_mutex){+.+.}-{3:3}, at: subdev_notifier_complete+0x30/0x3cc [s5p_fimc]
 
 stack backtrace:
 CPU: 0 UID: 0 PID: 50 Comm: kworker/u16:3 Not tainted 6.17.0-00001-g6ec53b34d5b7 #16049 PREEMPT 
 Hardware name: Samsung Exynos (Flattened Device Tree)
 Workqueue: events_unbound deferred_probe_work_func
 Call trace: 
  unwind_backtrace from show_stack+0x10/0x14
  show_stack from dump_stack_lvl+0x68/0x88
  dump_stack_lvl from print_circular_bug+0x31c/0x394
  print_circular_bug from check_noncircular+0x178/0x194
  check_noncircular from __lock_acquire+0x1650/0x29fc
  __lock_acquire from lock_acquire+0x134/0x388
  lock_acquire from __mutex_lock+0xb0/0x10c4
  __mutex_lock from mutex_lock_nested+0x1c/0x24
  mutex_lock_nested from __video_register_device+0xf0/0x1428 [videodev]
  __video_register_device [videodev] from __v4l2_device_register_subdev_nodes+0xd8/0x1a4 [videodev]
  __v4l2_device_register_subdev_nodes [videodev] from subdev_notifier_complete+0x1dc/0x3cc [s5p_fimc]
  subdev_notifier_complete [s5p_fimc] from __v4l2_async_register_subdev+0xd0/0x1ac [v4l2_async]
  __v4l2_async_register_subdev [v4l2_async] from s5c73m3_probe+0x620/0x724 [s5c73m3]
  s5c73m3_probe [s5c73m3] from i2c_device_probe+0x1bc/0x364
  i2c_device_probe from really_probe+0xe0/0x3d4
  really_probe from __driver_probe_device+0x9c/0x1e0
  __driver_probe_device from driver_probe_device+0x30/0xc0
  driver_probe_device from __device_attach_driver+0xa8/0x120
  __device_attach_driver from bus_for_each_drv+0x84/0xdc
  bus_for_each_drv from __device_attach+0xb0/0x20c
  __device_attach from bus_probe_device+0x8c/0x90
  bus_probe_device from deferred_probe_work_func+0x98/0xe0
  deferred_probe_work_func from process_one_work+0x250/0x71c
  process_one_work from worker_thread+0x1ac/0x3b0
  worker_thread from kthread+0x13c/0x278
  kthread from ret_from_fork+0x14/0x28
 Exception stack(0xf0a15fb0 to 0xf0a15ff8)
 5fa0:                                     00000000 00000000 00000000 00000000
 5fc0: 00000000 00000000 00000000 00000000 00000000 00000000 00000000 00000000
 5fe0: 00000000 00000000 00000000 00000000 00000013 00000000
---
 drivers/media/platform/samsung/exynos4-is/media-dev.c | 10 ++++++----
 1 file changed, 6 insertions(+), 4 deletions(-)

diff --git a/drivers/media/platform/samsung/exynos4-is/media-dev.c b/drivers/media/platform/samsung/exynos4-is/media-dev.c
index c781853586fd..e9d7875cf01e 100644
--- a/drivers/media/platform/samsung/exynos4-is/media-dev.c
+++ b/drivers/media/platform/samsung/exynos4-is/media-dev.c
@@ -1399,12 +1399,14 @@ static int subdev_notifier_complete(struct v4l2_async_notifier *notifier)
 	mutex_lock(&fmd->media_dev.graph_mutex);
 
 	ret = fimc_md_create_links(fmd);
-	if (ret < 0)
-		goto unlock;
+	if (ret < 0) {
+		mutex_unlock(&fmd->media_dev.graph_mutex);
+		return ret;
+	}
 
-	ret = v4l2_device_register_subdev_nodes(&fmd->v4l2_dev);
-unlock:
 	mutex_unlock(&fmd->media_dev.graph_mutex);
+
+	ret = v4l2_device_register_subdev_nodes(&fmd->v4l2_dev);
 	if (ret < 0)
 		return ret;
 
-- 
2.34.1


