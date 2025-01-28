Return-Path: <linux-media+bounces-25370-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id CD072A21008
	for <lists+linux-media@lfdr.de>; Tue, 28 Jan 2025 18:58:52 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id DC960165144
	for <lists+linux-media@lfdr.de>; Tue, 28 Jan 2025 17:58:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 786E41DFD9A;
	Tue, 28 Jan 2025 17:54:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="E5ef1eCL"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C6D271DE4D9;
	Tue, 28 Jan 2025 17:54:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738086868; cv=none; b=l7ZdCKPOUDJzUeufciUrk4qrWKqnftx6I40NeNI4pzUGuBA3jccT1Tp6h+aBByiQBCASJg/EAksc0aXHjE+zklcx2C2f5VU/zuAxT4/lXDRxx60j/VX4co0SH0GTAht/iskZ0v+m6NicE9DuUYy84f97Sbpuiak8zCqlnYsEkPk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738086868; c=relaxed/simple;
	bh=6IlTXrf+OuYlpW75YNnbsyAZRgbiObU+HYAnKQfU2hE=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=cFP6rAIkYhmdILI2hOBkRf/xrsqeKqsDqQmOMERAybe8zpa9mkER3NxL9s5CCrdDMeWm8MINsksvU3uDR0oT/t3h/B6SvcHeyJb2R5hpSxg7iNZ2UmxltTRXPTPuVs2CYBK9xB3fqwYR3MBLT85j0DEecZLkmbB8xolmDUEdFNQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=E5ef1eCL; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3763BC4AF09;
	Tue, 28 Jan 2025 17:54:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1738086868;
	bh=6IlTXrf+OuYlpW75YNnbsyAZRgbiObU+HYAnKQfU2hE=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=E5ef1eCLQAZPhsEknQ7ft12jOHTbSZYa+fs1j/Jye+MhuY1Mb2C6MHOnvUmZ4BGkB
	 RlNbY5vv5qyZ3fV2L4Uxj8LxumEOPdAZ/aN/sLGuiafai2QfWcpTUpU7AkNOGISkPT
	 WuCnRg70X3CS89xV9GRO7aH7zkYwnoG4zrKf+96xIUkgMStKMrCuIUmdbkf6wmEnPx
	 WSibiMnl+EI7O9wfm1ciWgTCLhN2tkgU02jJOI9/dvpAyNaIgrS4tY6PMjwcdMHtVZ
	 hjuCxzPEYPWSX6o0jjx8pJ8voSNF1Y7jUlKjpz1xkUs1lPplfVved8SdKeLqZC9/yY
	 vAFXTw74bXqxw==
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Cc: Edward Adam Davis <eadavis@qq.com>,
	syzbot+5e248227c80a3be8e96a@syzkaller.appspotmail.com,
	Hans Verkuil <hverkuil@xs4all.nl>,
	Sasha Levin <sashal@kernel.org>,
	dwlsalmeida@gmail.com,
	mchehab@kernel.org,
	linux-media@vger.kernel.org
Subject: [PATCH AUTOSEL 6.12 08/12] media: vidtv: Fix a null-ptr-deref in vidtv_mux_stop_thread
Date: Tue, 28 Jan 2025 12:54:10 -0500
Message-Id: <20250128175414.1197295-8-sashal@kernel.org>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250128175414.1197295-1-sashal@kernel.org>
References: <20250128175414.1197295-1-sashal@kernel.org>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
X-stable-base: Linux 6.12.11
Content-Transfer-Encoding: 8bit

From: Edward Adam Davis <eadavis@qq.com>

[ Upstream commit 1221989555db711578a327a9367f1be46500cb48 ]

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
Signed-off-by: Hans Verkuil <hverkuil@xs4all.nl>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 drivers/media/test-drivers/vidtv/vidtv_bridge.c | 8 +++++++-
 1 file changed, 7 insertions(+), 1 deletion(-)

diff --git a/drivers/media/test-drivers/vidtv/vidtv_bridge.c b/drivers/media/test-drivers/vidtv/vidtv_bridge.c
index 613949df897d3..6d964e392d313 100644
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
2.39.5


