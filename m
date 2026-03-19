Return-Path: <linux-media+bounces-56352-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 8E1gDGsrvGn4twIAu9opvQ
	(envelope-from <linux-media+bounces-56352-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Thu, 19 Mar 2026 17:59:23 +0100
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id A79302CF415
	for <lists+linux-media@lfdr.de>; Thu, 19 Mar 2026 17:59:22 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 0DDB431E5BDC
	for <lists+linux-media@lfdr.de>; Thu, 19 Mar 2026 16:50:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4B0083806B3;
	Thu, 19 Mar 2026 16:49:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=qq.com header.i=@qq.com header.b="Dl/L9v5B"
X-Original-To: linux-media@vger.kernel.org
Received: from out203-205-221-221.mail.qq.com (out203-205-221-221.mail.qq.com [203.205.221.221])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E6B56202F71;
	Thu, 19 Mar 2026 16:49:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=203.205.221.221
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773938995; cv=none; b=Aor/fgSyjKxM8/mOWvt3DbH4WR1iFMYIfxuweGTYxLvVHFTurcfarP2/z47Nb6Qsom4UoIceVetGtWk0BlSB4I5Jyl9yTOvhNUgNUvcnNfPYk4VSCWeIuhYomyaxhfuZYEzDHRcLBMC84MaREjFqE7uFsWZcQQT99/tR9QcNxdQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773938995; c=relaxed/simple;
	bh=dAvH8q9/3FwRqb3G8NwMs6fNW//AgtM156im8GZyxjk=;
	h=Message-ID:From:To:Cc:Subject:Date:In-Reply-To:References:
	 MIME-Version; b=JJSDjA0OFp+i+ikw5oXKZ6PfK1SC5YiCha3PHMh7W2JpQKStNeTuMMW3zFAoqHOMZxsmG+Rs99L1Y2GHPkSZSSmnswGoW6M2QnpuWCypBhpVA2F0nnzX+p0kePPsIMOnv7N8ue5KL9jCfF25rl3AzKQm0oi2nCaQgT9Yk2wDW2g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=qq.com; spf=pass smtp.mailfrom=qq.com; dkim=pass (1024-bit key) header.d=qq.com header.i=@qq.com header.b=Dl/L9v5B; arc=none smtp.client-ip=203.205.221.221
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=qq.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=qq.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qq.com; s=s201512;
	t=1773938985; bh=klqaFugiT/gumnkvniog5k96mzRuSPm3cWLnPT0oFGo=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=Dl/L9v5BbFJvRjEEUZn4fRw+WPTNABJhWwbDrE3XLcQv+TWsuTSmQ326gi40dn/V3
	 meAKr9yY/D06uo+DfGRh4lHJEX6jDHwslhgwuxEurb2uO1Gym3eVkL87eygrVzTJjv
	 bbpKryxLt5fq+P74VnLQ5sSJ5nbfIJeWv8Eg3LWg=
Received: from lxu-ped-host.. ([111.198.231.89])
	by newxmesmtplogicsvrszb43-0.qq.com (NewEsmtp) with SMTP
	id C6B03E28; Fri, 20 Mar 2026 00:49:43 +0800
X-QQ-mid: xmsmtpt1773938983t9f6r39rf
Message-ID: <tencent_5DCCB375C3694964A3A5A44677775777E605@qq.com>
X-QQ-XMAILINFO: ONZF21EM6mfKP70nL+BYTyXIdodHlU7dvRWlwZxc3Plsebq7e/jX92Stu5Llnb
	 NRB6dRKwpedQXUjXFCD1QtUO+TT45om7fMu6pA34+oMq5O7oiZE2KP2qSu3UoekfBP+DgWhkLpYs
	 7EzNfgzia7aW3FSl0+7m6Hq36LcVcTW8D1m8/bA/E74LpPPUYpyvXrq0SbojOlk0Nd98HM9Ugarv
	 r/KRfuAGdPwKwLRC784KLmcFp8HEhVnNTaKshQTYQk/Tf4p3dn77Uf09torWJ5DqgKwEmUTMrGb7
	 +vY8l+d4UrK7M5ySEpy3bxN/sTHU+7BTRq5F9d1b+n2zBDlcc5DDXiXgnOVG26jHC/yQIlJ8TayY
	 czz0Mw2mwlB1Fw07Ada6J0LM2reZ02yCj9BKb8UlfFoIYKovyTLCbnwfUL1zYLhbmFfFbAXUOXYs
	 36DvbAvZUfFIEQXQs/wv6jc966qdhbIjyXzffwwlPIclgm8fmI5TshG7+woWEVIGSdIuYI55sSZN
	 iJTLh/nJkEfkPemNw0n1HP0NL4sNv+TevOaOOb7JBT98mmUuwi8o8yOYVTfAr9BSeWO6++y55Ud9
	 FrDhQj0sZ3CuI0aqlyXXrxHNf78ktbIRhaUlMsp6pfoCEg3bsRu+gl1SWvfECc5oDJhGPcmfviJI
	 jCgvDvnMwVfplA7nNTz51cV0KRRBl7nLHA+6E85XZ6sX5SDzs83G7Vvbw9eaf1vZsRva0sgaQPEd
	 6wtYPmSpX+v7j+VTmssRZlDhWm6FCSY5HfR1DBIm0Cw653RFXgtlOMXxRmLMvP4Ll6y6b272iGI7
	 cT2Vzzy1UGRgdjZYaVDdbIn/WqDh+v2Gr5w+TQWMtZ6WnsFav+vxhqTXW22xF1xSazHayTZZFUGO
	 lhK5rGctHtOW8IBAIuhT7SIHzLy0X87cWZ8hTKsV2XP/fCAesI+nRsLftWirwkPeedfAhn6AfWp9
	 JJfwhlMk2COOipKDXbJUORUs+btMos9+giurtW3Og6Ou5psUhT4ezx+KjM4JTBg85/AaKYKkoDKf
	 3eidU50ezTiK9Vglfk
X-QQ-XMRINFO: M/715EihBoGS47X28/vv4NpnfpeBLnr4Qg==
From: Edward Adam Davis <eadavis@qq.com>
To: syzbot+1a7507a194fff09e5c44@syzkaller.appspotmail.com
Cc: linux-kernel@vger.kernel.org,
	linux-media@vger.kernel.org,
	linux-usb@vger.kernel.org,
	mchehab@kernel.org,
	syzkaller-bugs@googlegroups.com
Subject: [PATCH] media: usb: em28xx: fix the race condition between init extension and open
Date: Fri, 20 Mar 2026 00:49:43 +0800
X-OQ-MSGID: <20260319164942.296914-2-eadavis@qq.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <69bba3fe.050a0220.227207.0030.GAE@google.com>
References: <69bba3fe.050a0220.227207.0030.GAE@google.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spamd-Result: default: False [-0.16 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[qq.com,quarantine];
	R_DKIM_ALLOW(-0.20)[qq.com:s=s201512];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_FROM(0.00)[qq.com];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-56352-lists,linux-media=lfdr.de];
	RCVD_COUNT_THREE(0.00)[4];
	DKIM_TRACE(0.00)[qq.com:+];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	RCPT_COUNT_FIVE(0.00)[6];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[eadavis@qq.com,linux-media@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_NONE(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	NEURAL_HAM(-0.00)[-0.788];
	TAGGED_RCPT(0.00)[linux-media,1a7507a194fff09e5c44];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qq.com:dkim,qq.com:email,qq.com:mid,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,appspotmail.com:email]
X-Rspamd-Queue-Id: A79302CF415
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

The em28xx video device utilizes the same em28xx->lock during both the
extension initialization process and the open system call. This design
creates a race condition: if the extension initialization fails, the
video device undergoes a unregister a video4linux device process; 
should an open call be initiated during this unregister, it is highly
likely to enter the open routine within the em28xx driver. At this
juncture, however, em28xx->lock remains held by the kwork responsible
for the extension initialization. Consequently, the open routine is
forced to wait for the unregister process to complete before it can
acquire em28xx->lock, once the lock is finally acquired, the subsequent
code execution proceeds to access the video device instance, an instance
that has, by that time, already been deregistered, thereby triggering
the uaf described in [1].

To mitigate this issue and prevent the UAF resulting from lock contention
over em28xx->lock between the open call and the extension initialization
routine, the lock acquisition method within the em28xx open call has been
modified to use trylock.

[1]
BUG: KASAN: slab-use-after-free in v4l2_open+0x395/0x3a0 drivers/media/v4l2-core/v4l2-dev.c:444
Call Trace:
 v4l2_open+0x395/0x3a0 drivers/media/v4l2-core/v4l2-dev.c:444
 chrdev_open+0x4cd/0x5e0 fs/char_dev.c:411
 do_dentry_open+0x785/0x14e0 fs/open.c:949
 vfs_open+0x3b/0x340 fs/open.c:1081

Allocated by task 809:
 em28xx_v4l2_init+0x10b/0x2e70 drivers/media/usb/em28xx/em28xx-video.c:2538
 em28xx_init_extension+0x120/0x1c0 drivers/media/usb/em28xx/em28xx-core.c:1117

Freed by task 809:
 em28xx_free_v4l2 drivers/media/usb/em28xx/em28xx-video.c:2118 [inline]
 kref_put include/linux/kref.h:65 [inline]
 em28xx_v4l2_init+0x1683/0x2e70 drivers/media/usb/em28xx/em28xx-video.c:2907
 em28xx_init_extension+0x120/0x1c0 drivers/media/usb/em28xx/em28xx-core.c:1117

Reported-by: syzbot+1a7507a194fff09e5c44@syzkaller.appspotmail.com
Closes: https://syzkaller.appspot.com/bug?extid=1a7507a194fff09e5c44
Tested-by: syzbot+1a7507a194fff09e5c44@syzkaller.appspotmail.com
Signed-off-by: Edward Adam Davis <eadavis@qq.com>
---
 drivers/media/usb/em28xx/em28xx-video.c |  2 +-
 1 file changed, 1 insertions(+), 1 deletions(-)

diff --git a/drivers/media/usb/em28xx/em28xx-video.c b/drivers/media/usb/em28xx/em28xx-video.c
index b0c184f237a7..563b4267588e 100644
--- a/drivers/media/usb/em28xx/em28xx-video.c
+++ b/drivers/media/usb/em28xx/em28xx-video.c
@@ -2147,7 +2147,7 @@ static int em28xx_v4l2_open(struct file *filp)
 			video_device_node_name(vdev), v4l2_type_names[fh_type],
 			v4l2->users);
 
-	if (mutex_lock_interruptible(&dev->lock))
+	if (!mutex_trylock(&dev->lock))
 		return -ERESTARTSYS;
 
 	ret = v4l2_fh_open(filp);
-- 
2.43.0


