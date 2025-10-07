Return-Path: <linux-media+bounces-43827-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id D8739BC0F10
	for <lists+linux-media@lfdr.de>; Tue, 07 Oct 2025 11:58:13 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 929763AFE1B
	for <lists+linux-media@lfdr.de>; Tue,  7 Oct 2025 09:58:12 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 768DC261B80;
	Tue,  7 Oct 2025 09:58:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="KoKh6j2y"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C79331A9F8D
	for <linux-media@vger.kernel.org>; Tue,  7 Oct 2025 09:58:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759831088; cv=none; b=m7xv9OZr7TvLBzjaDKOp1vM9YqaB4zJAjFdcfhCQ2J62Vl5r9NE1PqtW7XPMWKcKD0MhSovJYwgK0CIvKebuSf5b7COEW2c7ATVZw6WnmM6Vsw+HAedwj+pQsDpdeUdzf7iH1QoMEKvpyc4Le1IFrgNO/g03VmQyjdJ0hQDJCO8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759831088; c=relaxed/simple;
	bh=vDvrqXCfJdTqFX8NmQAxEsYcZwLnAc6ZEBxNeHzawHY=;
	h=Message-ID:Date:MIME-Version:From:Subject:To:Cc:Content-Type; b=Rw3p42MD/zunpt4d/7Y6jTb1iEB+Y5QDyncYGhuLV9SGXDvbCGHdStmrLlh3L+ox6vFd9d2U/h+V/L+2ur4BvKXAO6KvmTjJ4f79WxHGhjA/xOR6kLR3UI54WWdhbhQ96vzUY7BVS48kNU/QNBllvRkZi+5+TqiSvQ2exAmBLg4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=KoKh6j2y; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8DA99C4CEF1;
	Tue,  7 Oct 2025 09:58:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1759831086;
	bh=vDvrqXCfJdTqFX8NmQAxEsYcZwLnAc6ZEBxNeHzawHY=;
	h=Date:From:Subject:To:Cc:From;
	b=KoKh6j2ytuvSEFevOuDkBM30q9xJpQer9QX2CUemuvlte1vIElO777s+eAZUn3mbl
	 FL063IjPiq48Y92UsywVplPdAo5BS0fAIKF91clj92npZSUAUOhMJgP8hV3a6vG/mw
	 GC0yoioVVxX3Y3uwJ/V2t6mFBNFqiRNJVF4uyxm0AeiHmHpvx3ohd4DCB6eN2o0cjA
	 Cw1G5ZOM9zqLvNFJCgV0YeLfgKM3ofjC6dngVV1KCNzMdnb3Nic9GzAVpobP0XrEGc
	 XnXg+hZZZP8rkjnT2JdwTJFQdnJDM/hgsTKPlPBmH+QMYazK7URl3TPSf+pSKQYnHv
	 NhawM28T5Qsrw==
Message-ID: <d378edbd-fa4b-4f96-a191-7bca4dbb99aa@kernel.org>
Date: Tue, 7 Oct 2025 11:58:04 +0200
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Hans Verkuil <hverkuil+cisco@kernel.org>
Content-Language: en-US, nl
Subject: [PATCH] media: v4l2-async: don't unbind an already unbound device
To: Linux Media Mailing List <linux-media@vger.kernel.org>,
 Sakari Ailus <sakari.ailus@linux.intel.com>
Cc: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

In __v4l2_async_register_subdev() we call v4l2_async_match_notify
to notify a matched subdev. That function tries to register and
bind to the device, but on error it will leave the device
unregistered and unbound.

However, __v4l2_async_register_subdev() will try to unbind the
device if v4l2_async_match_notify() returned an error. That
fails with a kernel oops.

Set 'asc' to NULL to prevent the unbind step from happening.

Found by testing omap3isp on a Beagle xM board *without* the
mt9p031 camera connected. In that case the internal_ops->registered
callback returns -ENODEV and you get a kernel oops:

[    5.811462] mt9p031 1-0048: MT9P031 not detected, wrong version 0xffffff87
[    5.818664] 8<--- cut here ---
[    5.821746] Unable to handle kernel NULL pointer dereference at virtual address 00000004 when write
[    5.830932] [00000004] *pgd=00000000
[    5.834594] Internal error: Oops: 805 [#1] SMP ARM
[    5.839447] Modules linked in:
[    5.842559] CPU: 0 UID: 0 PID: 25 Comm: kworker/u4:1 Not tainted 6.17.0-arm #8 NONE
[    5.850402] Hardware name: Generic OMAP36xx (Flattened Device Tree)
[    5.856719] Workqueue: events_unbound deferred_probe_work_func
[    5.862640] PC is at v4l2_async_unbind_subdev_one+0x54/0xc0
[    5.868316] LR is at v4l2_async_unbind_subdev_one+0xa0/0xc0

<snip>

[    6.198181] Call trace:
[    6.198211]  v4l2_async_unbind_subdev_one from __v4l2_async_register_subdev+0x144/0x19c
[    6.208862]  __v4l2_async_register_subdev from mt9p031_probe+0x490/0x564
[    6.215667]  mt9p031_probe from i2c_device_probe+0x168/0x308
[    6.221405]  i2c_device_probe from really_probe+0xc8/0x2c8
[    6.226989]  really_probe from __driver_probe_device+0x88/0x1a0
[    6.233001]  __driver_probe_device from driver_probe_device+0x30/0x104
[    6.239624]  driver_probe_device from __device_attach_driver+0x94/0x108
[    6.246307]  __device_attach_driver from bus_for_each_drv+0x84/0xd8
[    6.252685]  bus_for_each_drv from __device_attach+0xa8/0x1a4
[    6.258483]  __device_attach from bus_probe_device+0x88/0x8c
[    6.264251]  bus_probe_device from deferred_probe_work_func+0x78/0xa4
[    6.270751]  deferred_probe_work_func from process_one_work+0x178/0x3bc
[    6.277496]  process_one_work from worker_thread+0x27c/0x450
[    6.283264]  worker_thread from kthread+0x118/0x244
[    6.288238]  kthread from ret_from_fork+0x14/0x28

Signed-off-by: Hans Verkuil <hverkuil+cisco@kernel.org>
---
Note: I'm not sure if this a the best approach to fix this. Suggestions are welcome.
I also can't figure out when this issue was introduced. It might have been there since
the beginning.
---
 drivers/media/v4l2-core/v4l2-async.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/drivers/media/v4l2-core/v4l2-async.c b/drivers/media/v4l2-core/v4l2-async.c
index ee884a8221fb..ccf47d240b89 100644
--- a/drivers/media/v4l2-core/v4l2-async.c
+++ b/drivers/media/v4l2-core/v4l2-async.c
@@ -828,8 +828,10 @@ int __v4l2_async_register_subdev(struct v4l2_subdev *sd, struct module *module)
 		while ((asc = v4l2_async_find_match(notifier, sd))) {
 			ret = v4l2_async_match_notify(notifier, v4l2_dev, sd,
 						      asc);
-			if (ret)
+			if (ret) {
+				asc = NULL;
 				goto err_unbind;
+			}

 			ret = v4l2_async_nf_try_complete(notifier);
 			if (ret)
-- 
2.51.0


