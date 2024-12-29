Return-Path: <linux-media+bounces-24145-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 8FEB09FDEB1
	for <lists+linux-media@lfdr.de>; Sun, 29 Dec 2024 12:04:34 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id EDB1D3A17F9
	for <lists+linux-media@lfdr.de>; Sun, 29 Dec 2024 11:04:29 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A5515156C72;
	Sun, 29 Dec 2024 11:04:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=qq.com header.i=@qq.com header.b="a60DRqhI"
X-Original-To: linux-media@vger.kernel.org
Received: from out162-62-57-252.mail.qq.com (out162-62-57-252.mail.qq.com [162.62.57.252])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B8B6984D2B;
	Sun, 29 Dec 2024 11:04:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=162.62.57.252
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1735470257; cv=none; b=T7dpZgbeAwhOaGTArvlfJFZtnbcp64j0FCYwt8mZHLGsVLCBg2RTSrTKGY/BIcBTr//IM6CAs0Hrm1KnXSVA+jInqniLyhiTmi2ZH1zWshNCtM/oBVazqhIFJ+fMOV+Z6onu7s0ZuQKSH5Sr+BVNejRVN45Z53XYgP+MLeF4bss=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1735470257; c=relaxed/simple;
	bh=kqGY7peCa7nM0QzKwbt15Hnnreh/dAaykpDqf890z6M=;
	h=Message-ID:From:To:Cc:Subject:Date:In-Reply-To:References:
	 MIME-Version; b=NKW8+F1pPwWP4OgOGyUX/F/sUbrLR41rU/CoCj46ZsjxWtivhYCTMHsahfChyO65egml2+/es5U52CIl5E6LDVssiCAYUL6KrkbHpNfsupNFdCtihPRlgo+XzIV4XR0D/fIwPx0JrZ2O8u4IQyDHAgZZGyjcWK12CnPtT/01JPM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=qq.com; spf=pass smtp.mailfrom=qq.com; dkim=pass (1024-bit key) header.d=qq.com header.i=@qq.com header.b=a60DRqhI; arc=none smtp.client-ip=162.62.57.252
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=qq.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=qq.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qq.com; s=s201512;
	t=1735470249; bh=qpwwX0CYaA2ZaPJMtou1h+AZfImKROxZGg5HaW/Jzxg=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=a60DRqhI6HysZSzBwuQrTbX4XGbwFVb0jFn1N7DeoCROKCNOw6J/Y2IPo/LK6fn4n
	 zMb6HhBtBPEZTbnc+BlATEqr4NXYbSAPDwVXRU0KYlcKSsLs67qKrVilVzifCSVIfR
	 rJ5WIJAiD6ugHWf9h2x6OERcbFOt4ndYEHdPKILY=
Received: from pek-lxu-l1.wrs.com ([114.244.57.34])
	by newxmesmtplogicsvrszgpua5-1.qq.com (NewEsmtp) with SMTP
	id CA6B1085; Sun, 29 Dec 2024 18:50:38 +0800
X-QQ-mid: xmsmtpt1735469438t7melcqfi
Message-ID: <tencent_2BDD951952CF980D9F25A10DE69222DD8A07@qq.com>
X-QQ-XMAILINFO: NLNuKjcZ2ePXDYb677rLL2XXvKIiUKpg1guL4bmKBcLS7vwyX9qA/ShcdOZ6n4
	 YHLGy8E7oDCTgIpptQhBp3wak1F9XfQfOTyyiNndeej7DWPSyFJrIZjPr+GbUru11wycBifB+/lM
	 40DYKufd4hyfRaPRQFANi8GSLx5vElZj+DhsDrATS1D0MPcNCKMlx9uV1AkmZ7/IS11EhXXLRh/6
	 01P6llItja/s1hhlACddo7RTo2MqYr6QMprce1++1uh8/dvQaRZV+olsm/MMV+gaVebfSaZTD//J
	 AhGYScGd0rlD2PcHB70bsT0ShSS8hYNNg7Zy4lTvYuJSOJ8g6kqar+klqxqTgrq0tEG7t01NiM/B
	 vYSLP1BFLeY+XupglEXnBdHRe9Q3p9GyKSyMe2hV6hQmNjZNUP0Vr4ambTnZIcomMRkQPinKVbYe
	 2OcrVZkUPHEEUyPj44Bye8wiLW5514yYmojMU0QV9YKqDJi//FWmjvGRmvC2jPByhiIS4L8Wv6gG
	 kYqVCp278o7esSIAKWjYJTJm4akOF4r0nFJbaJsQCUzSR1BiMPp54PsYcYeHAJgIN8Am8grrxKTc
	 UOfHFyMVrrjHgYc+D6mROI3xIh+LgHmzDi4e+MwUE125/kXDMXS6cFQxr4KvcImzyGbnSMjbAOiu
	 0CP8H8cgAVqz/oiE5d19o4axs/sW5phqNmjrqxK+xYN6VE5C/Fp/XUfitzrfTLpVOv8e1aH1VwWu
	 S3pOJX3/awYadcbZoDQz6R+ib0+v+i0o+WnmEmKaV9uSoAIzN8QDJoztopS9POu3+xATNkiEHLc6
	 HoioWA3sTV/XRYRt6hEngZ6Q08wvBYQ1MoMfAD82Sf8H9Zn+WSRiOfbaYLG1pJ9+fnZPNvkEZcaa
	 /Vk9Fx6SAxyppmtNSXEd2gn03SrD98y4yMTd/6UCN0PoCUhzElIL8=
X-QQ-XMRINFO: NyFYKkN4Ny6FSmKK/uo/jdU=
From: Edward Adam Davis <eadavis@qq.com>
To: syzbot+5e248227c80a3be8e96a@syzkaller.appspotmail.com
Cc: dwlsalmeida@gmail.com,
	linux-kernel@vger.kernel.org,
	linux-media@vger.kernel.org,
	mchehab@kernel.org,
	syzkaller-bugs@googlegroups.com
Subject: [PATCH] media: vidtv: Fix a null-ptr-deref in vidtv_mux_stop_thread
Date: Sun, 29 Dec 2024 18:50:39 +0800
X-OQ-MSGID: <20241229105038.845517-2-eadavis@qq.com>
X-Mailer: git-send-email 2.47.0
In-Reply-To: <6770e486.050a0220.2f3838.04a4.GAE@google.com>
References: <6770e486.050a0220.2f3838.04a4.GAE@google.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

syzbot report a null-ptr-deref in vidtv_mux_stop_thread. [1]

If dvb->mux is not initialized successfully by vidtv_mux_init() in the
vidtv_start_streaming(), it will trigger null pointer dereference about mux
in vidtv_mux_stop_thread().

Adjust the timing of streaming initialization and check it before
stopping it.

[1]
KASAN: null-ptr-deref in range [0x0000000000000128-0x000000000000012f]
CPU: 0 UID: 0 PID: 5842 Comm: syz-executor248 Not tainted 6.13.0-rc4-syzkaller-00012-g9b2ffa6148b1 #0
Hardware name: Google Google Compute Engine/Google Compute Engine, BIOS Google 09/13/2024
RIP: 0010:vidtv_mux_stop_thread+0x26/0x80 drivers/media/test-drivers/vidtv/vidtv_mux.c:471
Code: 90 90 90 90 66 0f 1f 00 55 53 48 89 fb e8 82 2e c8 f9 48 8d bb 28 01 00 00 48 b8 00 00 00 00 00 fc ff df 48 89 fa 48 c1 ea 03 <0f> b6 04 02 84 c0 74 02 7e 3b 0f b6 ab 28 01 00 00 31 ff 89 ee e8
RSP: 0018:ffffc90003f2faa8 EFLAGS: 00010202
RAX: dffffc0000000000 RBX: 0000000000000000 RCX: ffffffff87cfb125
RDX: 0000000000000025 RSI: ffffffff87d120ce RDI: 0000000000000128
RBP: ffff888029b8d220 R08: 0000000000000005 R09: 0000000000000000
R10: 0000000000000000 R11: 0000000000000003 R12: ffff888029b8d188
R13: ffffffff8f590aa0 R14: ffffc9000581c5c8 R15: ffff888029a17710
FS:  00007f7eef5156c0(0000) GS:ffff8880b8600000(0000) knlGS:0000000000000000
CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
CR2: 00007f7eef5e635c CR3: 0000000076ca6000 CR4: 00000000003526f0
DR0: 0000000000000000 DR1: 0000000000000000 DR2: 0000000000000000
DR3: 0000000000000000 DR6: 00000000fffe0ff0 DR7: 0000000000000400
Call Trace:
 <TASK>
 vidtv_stop_streaming drivers/media/test-drivers/vidtv/vidtv_bridge.c:209 [inline]
 vidtv_stop_feed+0x151/0x250 drivers/media/test-drivers/vidtv/vidtv_bridge.c:252
 dmx_section_feed_stop_filtering+0x90/0x160 drivers/media/dvb-core/dvb_demux.c:1000
 dvb_dmxdev_feed_stop.isra.0+0x1ee/0x270 drivers/media/dvb-core/dmxdev.c:486
 dvb_dmxdev_filter_stop+0x22a/0x3a0 drivers/media/dvb-core/dmxdev.c:559
 dvb_dmxdev_filter_free drivers/media/dvb-core/dmxdev.c:840 [inline]
 dvb_demux_release+0x92/0x550 drivers/media/dvb-core/dmxdev.c:1246
 __fput+0x3f8/0xb60 fs/file_table.c:450
 task_work_run+0x14e/0x250 kernel/task_work.c:239
 get_signal+0x1d3/0x2610 kernel/signal.c:2790
 arch_do_signal_or_restart+0x90/0x7e0 arch/x86/kernel/signal.c:337
 exit_to_user_mode_loop kernel/entry/common.c:111 [inline]
 exit_to_user_mode_prepare include/linux/entry-common.h:329 [inline]
 __syscall_exit_to_user_mode_work kernel/entry/common.c:207 [inline]
 syscall_exit_to_user_mode+0x150/0x2a0 kernel/entry/common.c:218
 do_syscall_64+0xda/0x250 arch/x86/entry/common.c:89
 entry_SYSCALL_64_after_hwframe+0x77/0x7f

Reported-by: syzbot+5e248227c80a3be8e96a@syzkaller.appspotmail.com
Closes: https://syzkaller.appspot.com/bug?extid=5e248227c80a3be8e96a
Signed-off-by: Edward Adam Davis <eadavis@qq.com>
---
 drivers/media/test-drivers/vidtv/vidtv_bridge.c | 8 +++++++-
 1 file changed, 7 insertions(+), 1 deletion(-)

diff --git a/drivers/media/test-drivers/vidtv/vidtv_bridge.c b/drivers/media/test-drivers/vidtv/vidtv_bridge.c
index e1dd8adeba46..438483c62fac 100644
--- a/drivers/media/test-drivers/vidtv/vidtv_bridge.c
+++ b/drivers/media/test-drivers/vidtv/vidtv_bridge.c
@@ -191,10 +191,11 @@ static int vidtv_start_streaming(struct vidtv_dvb *dvb)
 
 	mux_args.mux_buf_sz  = mux_buf_sz;
 
-	dvb->streaming = true;
 	dvb->mux = vidtv_mux_init(dvb->fe[0], dev, &mux_args);
 	if (!dvb->mux)
 		return -ENOMEM;
+
+	dvb->streaming = true;
 	vidtv_mux_start_thread(dvb->mux);
 
 	dev_dbg_ratelimited(dev, "Started streaming\n");
@@ -205,6 +206,11 @@ static int vidtv_stop_streaming(struct vidtv_dvb *dvb)
 {
 	struct device *dev = &dvb->pdev->dev;
 
+	if (!dvb->streaming) {
+		dev_warn_ratelimited(dev, "No streaming. Skipping.\n");
+		return 0;
+	}
+
 	dvb->streaming = false;
 	vidtv_mux_stop_thread(dvb->mux);
 	vidtv_mux_destroy(dvb->mux);
-- 
2.47.0


