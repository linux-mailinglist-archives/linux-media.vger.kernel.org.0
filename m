Return-Path: <linux-media+bounces-27301-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 77122A4B26B
	for <lists+linux-media@lfdr.de>; Sun,  2 Mar 2025 15:58:44 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 9232516D889
	for <lists+linux-media@lfdr.de>; Sun,  2 Mar 2025 14:58:43 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9D0861E5B9B;
	Sun,  2 Mar 2025 14:58:37 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from exchange.fintech.ru (exchange.fintech.ru [195.54.195.159])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B92B71D61BB;
	Sun,  2 Mar 2025 14:58:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.54.195.159
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740927517; cv=none; b=D5rS6caeBfjSWgiNNqUC68ZAsi3XOsBH5RcDWfS8YQ6eh50ouq5zpBk3dIVtnx3w9Oe3hM8a3gCW9RPnsniktcEtUWpEUvcm3Cg0RdfKuzH1JJAyXeNvTnBwq4gennyk/VR3WNiAPkSHmyOt7qt0xf0wfzU3xMZ3cnDgT4ZtYuU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740927517; c=relaxed/simple;
	bh=LeEMDPxI1ATJTE3OiKu7NT5rcQV6cwKsotz8B5qc6OM=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type; b=P/OKrZjNvSed2cQXHMFTZ1X0vbdYo3CvZ34VPfNdhompB6DyLntY9BVO5CtqMvlPJhqjnCFbcYdf5hCJ5j8G8yx+zc1Tjya6uWY0lNjFd9/i4lj3UFV0r5xL2vfo+RE7giIMJPzEImHWG+4QR0Y3VjpyajxmuQ6x7rgXw72ZUFE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=fintech.ru; spf=pass smtp.mailfrom=fintech.ru; arc=none smtp.client-ip=195.54.195.159
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=fintech.ru
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=fintech.ru
Received: from Ex16-01.fintech.ru (10.0.10.18) by exchange.fintech.ru
 (195.54.195.159) with Microsoft SMTP Server (TLS) id 14.3.498.0; Sun, 2 Mar
 2025 17:58:27 +0300
Received: from localhost (10.0.253.138) by Ex16-01.fintech.ru (10.0.10.18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2242.4; Sun, 2 Mar 2025
 17:58:27 +0300
From: Nikita Zhandarovich <n.zhandarovich@fintech.ru>
To: Shuah Khan <skhan@linuxfoundation.org>, Kieran Bingham
	<kieran.bingham@ideasonboard.com>, Mauro Carvalho Chehab <mchehab@kernel.org>
CC: Nikita Zhandarovich <n.zhandarovich@fintech.ru>,
	<linux-media@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
	<syzbot+5bcd7c809d365e14c4df@syzkaller.appspotmail.com>,
	<syzkaller-bugs@googlegroups.com>
Subject: [PATCH v2] media: vimc: skip .s_stream() for stopped entities
Date: Sun, 2 Mar 2025 17:58:25 +0300
Message-ID: <20250302145827.1600172-1-n.zhandarovich@fintech.ru>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: Ex16-02.fintech.ru (10.0.10.19) To Ex16-01.fintech.ru
 (10.0.10.18)

Syzbot reported [1] a warning prompted by a check in call_s_stream()
that checks whether .s_stream() operation is warranted for unstarted
or stopped subdevs.

Add a simple fix in vimc_streamer_pipeline_terminate() ensuring that
entities skip a call to .s_stream() unless they have been previously
properly started.

[1] Syzbot report:
------------[ cut here ]------------
WARNING: CPU: 0 PID: 5933 at drivers/media/v4l2-core/v4l2-subdev.c:460 call_s_stream+0x2df/0x350 drivers/media/v4l2-core/v4l2-subdev.c:460
Modules linked in:
CPU: 0 UID: 0 PID: 5933 Comm: syz-executor330 Not tainted 6.13.0-rc2-syzkaller-00362-g2d8308bf5b67 #0
...
Call Trace:
 <TASK>
 vimc_streamer_pipeline_terminate+0x218/0x320 drivers/media/test-drivers/vimc/vimc-streamer.c:62
 vimc_streamer_pipeline_init drivers/media/test-drivers/vimc/vimc-streamer.c:101 [inline]
 vimc_streamer_s_stream+0x650/0x9a0 drivers/media/test-drivers/vimc/vimc-streamer.c:203
 vimc_capture_start_streaming+0xa1/0x130 drivers/media/test-drivers/vimc/vimc-capture.c:256
 vb2_start_streaming+0x15f/0x5a0 drivers/media/common/videobuf2/videobuf2-core.c:1789
 vb2_core_streamon+0x2a7/0x450 drivers/media/common/videobuf2/videobuf2-core.c:2348
 vb2_streamon drivers/media/common/videobuf2/videobuf2-v4l2.c:875 [inline]
 vb2_ioctl_streamon+0xf4/0x170 drivers/media/common/videobuf2/videobuf2-v4l2.c:1118
 __video_do_ioctl+0xaf0/0xf00 drivers/media/v4l2-core/v4l2-ioctl.c:3122
 video_usercopy+0x4d2/0x1620 drivers/media/v4l2-core/v4l2-ioctl.c:3463
 v4l2_ioctl+0x1ba/0x250 drivers/media/v4l2-core/v4l2-dev.c:366
 vfs_ioctl fs/ioctl.c:51 [inline]
 __do_sys_ioctl fs/ioctl.c:906 [inline]
 __se_sys_ioctl fs/ioctl.c:892 [inline]
 __x64_sys_ioctl+0x190/0x200 fs/ioctl.c:892
 do_syscall_x64 arch/x86/entry/common.c:52 [inline]
 do_syscall_64+0xcd/0x250 arch/x86/entry/common.c:83
 entry_SYSCALL_64_after_hwframe+0x77/0x7f
RIP: 0033:0x7f2b85c01b19
...

Reported-by: syzbot+5bcd7c809d365e14c4df@syzkaller.appspotmail.com
Closes: https://syzkaller.appspot.com/bug?extid=5bcd7c809d365e14c4df
Fixes: adc589d2a208 ("media: vimc: Add vimc-streamer for stream control")
Cc: stable@vger.kernel.org
Signed-off-by: Nikita Zhandarovich <n.zhandarovich@fintech.ru>
---
v1 -> v2: Use v4l2_subdev_is_streaming() instead of directly reading
->s_stream_enabled field to determine to check streaming status.

 drivers/media/test-drivers/vimc/vimc-streamer.c | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/drivers/media/test-drivers/vimc/vimc-streamer.c b/drivers/media/test-drivers/vimc/vimc-streamer.c
index 807551a5143b..15d863f97cbf 100644
--- a/drivers/media/test-drivers/vimc/vimc-streamer.c
+++ b/drivers/media/test-drivers/vimc/vimc-streamer.c
@@ -59,6 +59,12 @@ static void vimc_streamer_pipeline_terminate(struct vimc_stream *stream)
 			continue;
 
 		sd = media_entity_to_v4l2_subdev(ved->ent);
+		/*
+		 * Do not call .s_stream() to stop an already
+		 * stopped/unstarted subdev.
+		 */
+		if (!v4l2_subdev_is_streaming(sd))
+			continue;
 		v4l2_subdev_call(sd, video, s_stream, 0);
 	}
 }

