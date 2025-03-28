Return-Path: <linux-media+bounces-28961-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 535CBA7525E
	for <lists+linux-media@lfdr.de>; Fri, 28 Mar 2025 23:12:02 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id F014C3B054F
	for <lists+linux-media@lfdr.de>; Fri, 28 Mar 2025 22:11:47 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9C85C1EF387;
	Fri, 28 Mar 2025 22:11:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=rere.qmqm.pl header.i=@rere.qmqm.pl header.b="A0LKbWu0"
X-Original-To: linux-media@vger.kernel.org
Received: from rere.qmqm.pl (rere.qmqm.pl [91.227.64.183])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 194E31EFF84;
	Fri, 28 Mar 2025 22:11:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=91.227.64.183
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743199905; cv=none; b=j5atHOjDDqvhdJMIFG2BhWB0Rz6QXi7DimEGp/LMoyfkmXCuQ3jNkNLMp6+xn0qw23wwpVHYWDLWnitOrFfgY9cayPNFP9QqiX4+NBp77blczTrXbWKiH85OEZ9No2QsbqSFhvedaRsAY8j2oMPiNP+gRMBO0sSZmc2mJlosTPk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743199905; c=relaxed/simple;
	bh=/dib/gzsTIlvEmJfADpulHrNlQwv64RFIf5HDrJqhsU=;
	h=Date:Message-Id:Subject:MIME-Version:Content-Type:From:To:Cc; b=eg/w7Qe+CpZ1oe7g6t4fp0YiGYvOeJYpLQcnHVStZRjFJsHuX6ZJhA+5ShFKHWQQHNIGmV7pHK8hIYgC+mttuoyvF5YU1L00Xpa1KzZt4rHYLq20K128MEtN2d4sEPDc7lYusD+9UYqHwhBuUt+y/BqQq5hACxVnm+tHl38kAuQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=rere.qmqm.pl; spf=pass smtp.mailfrom=rere.qmqm.pl; dkim=pass (2048-bit key) header.d=rere.qmqm.pl header.i=@rere.qmqm.pl header.b=A0LKbWu0; arc=none smtp.client-ip=91.227.64.183
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=rere.qmqm.pl
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=rere.qmqm.pl
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=rere.qmqm.pl; s=1;
	t=1743199297; bh=/dib/gzsTIlvEmJfADpulHrNlQwv64RFIf5HDrJqhsU=;
	h=Date:Subject:From:To:Cc:From;
	b=A0LKbWu0qS5fbovl4poQJpOYSfC3czOLCfemvBpE2+Jrdq/r+0uHx/QBuw3cA/BVV
	 j0AbOeFTUB+cKfglS4M4qCS6P0rV4hs0V5Qkf+CEnZu4keuOw4O6AMw2EZYaK+AVfl
	 iXy+ExxVGDXF4tgA157+5HLa6BLOUOnxunCdLMqh50dGL/VvJSFOBnu06hBmh6lRlK
	 fT0zs4sC3g2v3E3eYnwL6mYK9v4VPFmTHLiH4QaVYD44oaN96IfBz5TW7GWA5vBsA+
	 2ooewN05kBYY7Ln6tdqkqLBFXc4uh33iDOQTQZwOd3+voT3t8m/9YzcjS4stMkDNeD
	 YTR4VLANjcMLg==
Received: from remote.user (localhost [127.0.0.1])
	by rere.qmqm.pl (Postfix) with ESMTPSA id 4ZPZHN6WFHz1L;
	Fri, 28 Mar 2025 23:01:36 +0100 (CET)
X-Virus-Status: Clean
X-Virus-Scanned: clamav-milter 1.0.7 at mail
Date: Fri, 28 Mar 2025 23:01:36 +0100
Message-Id: <6f496c586e0c2db7f7b929f466bdd0607e61e45d.1743199164.git.mirq-linux@rere.qmqm.pl>
Subject: [PATCH media/fixes] media: rtl2832_sdr: unsplit vb_queue initialization
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
From:	=?UTF-8?q?Micha=C5=82=20Miros=C5=82aw?= <mirq-linux@rere.qmqm.pl>
To:	Mauro Carvalho Chehab <mchehab@kernel.org>
Cc:	Hans Verkuil <hverkuil@xs4all.nl>,
	Uwe =?UTF-8?Q?Kleine-K=C3=B6nig?= <u.kleine-koenig@baylibre.com>,
	linux-media@vger.kernel.org,
	linux-kernel@vger.kernel.org

`queue->lock` must be set before calling vb2_queue_init() as the
calee checks the whole structure for validity. Otherwise we get:

  rtl2832 7-0010: Realtek RTL2832 successfully attached
  usb 2-1.6: DVB: registering adapter 0 frontend 0 (Realtek RTL2832 (DVB-T))...
  dvbdev: dvb_create_media_entity: media entity 'Realtek RTL2832 (DVB-T)' registered.
  r820t 8-001a: creating new instance
  r820t 8-001a: Rafael Micro r820t successfully identified, chip type: R820T
  ------------[ cut here ]------------
  WARNING: CPU: 4 PID: 1364245 at drivers/media/common/videobuf2/videobuf2-core.c:2661 vb2_core_queue_init+0x249/0x250 [videobuf2_common]a
...
  CPU: 4 UID: 1000 PID: 1364245 Comm: gqrx Tainted: G        W  O       6.13.7+ #671
  Tainted: [W]=WARN, [O]=OOT_MODULE
  Hardware name: System manufacturer System Product Name/P8Z68-V PRO, BIOS 3603 11/09/2012
  RIP: 0010:vb2_core_queue_init+0x249/0x250 [videobuf2_common]
  Code: eb f1 0f 0b eb ed 0f 0b eb e9 0f 0b eb e5 0f 0b eb e1 0f 0b eb dd 0f 0b eb d9 0f 0b eb d5 0f 0b eb d1 0f 0b eb cd 0f 0b eb c9 <0f> 0b eb c5 0f 1f 00 83 7f 30 01 74 05 c3 cc cc cc cc 53 48 89 fb
  RSP: 0018:ffffc9000d747858 EFLAGS: 00010246
  RAX: 0000000000000000 RBX: ffff888123e09750 RCX: ffffffffa4601500
  RDX: 0000000000000001 RSI: 0000000000000001 RDI: 0000000000000000
  RBP: ffff8883b3617000 R08: ffffffffa45fd090 R09: ffffffff8240ca40
  R10: 0000000000000990 R11: 0000000000000000 R12: ffff88830fd27580
  R13: ffff8883b3617010 R14: 0000000000000000 R15: ffff888123e09000
  FS:  00007f4a7e480dc0(0000) GS:ffff8887fe600000(0000) knlGS:0000000000000000
  CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
  CR2: 000055f78f2f5dd8 CR3: 000000060f310004 CR4: 00000000000626f0
  Call Trace:
   <TASK>
   ? __warn+0x80/0x180
   ? vb2_core_queue_init+0x249/0x250 [videobuf2_common]
   ? report_bug+0x18d/0x1c0
   ? handle_bug+0x53/0x90
   ? exc_invalid_op+0x13/0x60
   ? asm_exc_invalid_op+0x16/0x20
   ? vb2_core_queue_init+0x249/0x250 [videobuf2_common]
   rtl2832_sdr_probe+0x191/0x570 [rtl2832_sdr]
   platform_probe+0x3b/0x90
   really_probe+0xbf/0x380
   ? driver_probe_device+0x90/0x90
   __driver_probe_device+0x73/0x150
   driver_probe_device+0x1a/0x90
   __device_attach_driver+0x80/0x110
   bus_for_each_drv+0x7e/0xd0
   __device_attach+0xb2/0x1b0
   bus_probe_device+0x8f/0xa0
   device_add+0x645/0x860
   platform_device_add+0x171/0x250
   platform_device_register_full+0x10f/0x1a0
   rtl2832u_tuner_attach+0x40c/0x9a0 [dvb_usb_rtl28xxu]
   dvb_usbv2_probe+0x67d/0x1210 [dvb_usb_v2]
   usb_probe_interface+0xdc/0x2f0
   really_probe+0xbf/0x380
   ? driver_probe_device+0x90/0x90
   __driver_probe_device+0x73/0x150
   driver_probe_device+0x1a/0x90
   __device_attach_driver+0x80/0x110
   bus_for_each_drv+0x7e/0xd0
   __device_attach+0xb2/0x1b0
   proc_ioctl+0x1ae/0x210
   usbdev_ioctl+0x14f6/0x15f0
   ? lock_release+0x205/0x430
   __x64_sys_ioctl+0x8e/0xc0
   do_syscall_64+0x58/0x100
   entry_SYSCALL_64_after_hwframe+0x67/0x6f
  RIP: 0033:0x7f4a83b24ded
  Code: 04 25 28 00 00 00 48 89 45 c8 31 c0 48 8d 45 10 c7 45 b0 10 00 00 00 48 89 45 b8 48 8d 45 d0 48 89 45 c0 b8 10 00 00 00 0f 05 <89> c2 3d 00 f0 ff ff 77 1a 48 8b 45 c8 64 48 2b 04 25 28 00 00 00
  RSP: 002b:00007ffe9f17fea0 EFLAGS: 00000246 ORIG_RAX: 0000000000000010
  RAX: ffffffffffffffda RBX: 0000561ed1074780 RCX: 00007f4a83b24ded
  RDX: 00007ffe9f17ff00 RSI: 00000000c0105512 RDI: 0000000000000013
  RBP: 00007ffe9f17fef0 R08: 00007ffe9f17fe30 R09: 0000000000000000
  R10: 00007f4a827405c8 R11: 0000000000000246 R12: 0000561ed1396d80
  R13: 0000561ed135eca0 R14: 0000561ed11a63d0 R15: 0000000000000000
   </TASK>
  irq event stamp: 0
  hardirqs last  enabled at (0): [<0000000000000000>] 0x0
  hardirqs last disabled at (0): [<ffffffff810895a8>] copy_process+0x998/0x1ee0
  softirqs last  enabled at (0): [<ffffffff810895a8>] copy_process+0x998/0x1ee0
  softirqs last disabled at (0): [<0000000000000000>] 0x0
  ---[ end trace 0000000000000000 ]---
  rtl2832_sdr rtl2832_sdr.4.auto: Could not initialize vb2 queue
  rtl2832_sdr rtl2832_sdr.4.auto: probe with driver rtl2832_sdr failed with error -22

Signed-off-by: Michał Mirosław <mirq-linux@rere.qmqm.pl>
---
 drivers/media/dvb-frontends/rtl2832_sdr.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/media/dvb-frontends/rtl2832_sdr.c b/drivers/media/dvb-frontends/rtl2832_sdr.c
index 05254d8717db..0357624968f1 100644
--- a/drivers/media/dvb-frontends/rtl2832_sdr.c
+++ b/drivers/media/dvb-frontends/rtl2832_sdr.c
@@ -1363,6 +1363,7 @@ static int rtl2832_sdr_probe(struct platform_device *pdev)
 	dev->vb_queue.ops = &rtl2832_sdr_vb2_ops;
 	dev->vb_queue.mem_ops = &vb2_vmalloc_memops;
 	dev->vb_queue.timestamp_flags = V4L2_BUF_FLAG_TIMESTAMP_MONOTONIC;
+	dev->vb_queue.lock = &dev->vb_queue_lock;
 	ret = vb2_queue_init(&dev->vb_queue);
 	if (ret) {
 		dev_err(&pdev->dev, "Could not initialize vb2 queue\n");
@@ -1421,7 +1422,6 @@ static int rtl2832_sdr_probe(struct platform_device *pdev)
 	/* Init video_device structure */
 	dev->vdev = rtl2832_sdr_template;
 	dev->vdev.queue = &dev->vb_queue;
-	dev->vdev.queue->lock = &dev->vb_queue_lock;
 	video_set_drvdata(&dev->vdev, dev);
 
 	/* Register the v4l2_device structure */
-- 
2.39.5


