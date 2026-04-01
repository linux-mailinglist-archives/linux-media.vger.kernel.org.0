Return-Path: <linux-media+bounces-57836-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id cCuFDH+3zGnMVwYAu9opvQ
	(envelope-from <linux-media+bounces-57836-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Wed, 01 Apr 2026 08:13:19 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id B633F375167
	for <lists+linux-media@lfdr.de>; Wed, 01 Apr 2026 08:13:17 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id B2C06302C0F1
	for <lists+linux-media@lfdr.de>; Wed,  1 Apr 2026 06:13:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 527D432C94B;
	Wed,  1 Apr 2026 06:13:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=sina.cn header.i=@sina.cn header.b="rDMq9JAa"
X-Original-To: linux-media@vger.kernel.org
Received: from mail115-63.sinamail.sina.com.cn (mail115-63.sinamail.sina.com.cn [218.30.115.63])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0AB322BDC13
	for <linux-media@vger.kernel.org>; Wed,  1 Apr 2026 06:13:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=218.30.115.63
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775023992; cv=none; b=pr1l2JFWpR3w1SdwOuP8z7Hm99K/rBAjzro0hHcd+tlqGhLIR1IPuCR3/6+ieI7VdRnUxXn9gS/zsGsHEF54fgj9C6PlfePZLDL8suPUgxNVyrzqN5bPh3oXB23jGOsJRPJC+ClEmcso2eEViFhd41DX3HxB1+wDDx04ObzkEr0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775023992; c=relaxed/simple;
	bh=/HyS1RYTyVOcHNSoQszutPIt+ayra7uA20TwMUMDYCU=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=gQJSSE70igQBoQzXSHKCAcrvaUj08d6UbXPdN40fh5n4uMy67VEwjIwHfb5h7carxtlE2Q+Hv6LokgIMOOKoXnhQAiGOgfhv+nP6U0iXhnX4x6D13LmAjIBIl820A0/1mbCWsMMRzjEe7t205OJlLrMaVFDbP9dOq7sciFIB3Bs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=sina.cn; spf=pass smtp.mailfrom=sina.cn; dkim=pass (1024-bit key) header.d=sina.cn header.i=@sina.cn header.b=rDMq9JAa; arc=none smtp.client-ip=218.30.115.63
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=sina.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sina.cn
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sina.cn; s=201208; t=1775023988;
	bh=+aEDzyDbOTl4WToRqKBS93o7mOqX6kQhrjREC999MfU=;
	h=From:Subject:Date:Message-Id;
	b=rDMq9JAaOpZY5W3cPxgbPMqFJLMsuYYr749U6oMVHQjRmmmWS/QYI99wBJgFKbIHB
	 /bS1aBQiPROcoCdvB//95y8mu0nLus/G1WkuXGz5/VlWn7sfV9HvqihKiU6iazolL2
	 L4ZPuMck0zwiOsdG8gbHGzfIvXQs2OdHRX0mqtB8=
X-SMAIL-HELO: NTT-kernel-dev
Received: from unknown (HELO NTT-kernel-dev)([60.247.85.88])
	by sina.cn (10.185.250.22) with ESMTP
	id 69CCB763000067E9; Wed, 1 Apr 2026 14:12:59 +0800 (CST)
X-Sender: jianqkang@sina.cn
X-Auth-ID: jianqkang@sina.cn
Authentication-Results: sina.cn;
	 spf=none smtp.mailfrom=jianqkang@sina.cn;
	 dkim=none header.i=none;
	 dmarc=none action=none header.from=jianqkang@sina.cn
X-SMAIL-MID: 6042587602323
X-SMAIL-UIID: EB597CE8F08B4BDB8B64E81E1B7E65C9-20260401-141259-1
From: Jianqiang kang <jianqkang@sina.cn>
To: gregkh@linuxfoundation.org,
	stable@vger.kernel.org,
	axboe@kernel.dk
Cc: patches@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	mchehab@kernel.org,
	hverkuil@xs4all.nl,
	sashal@kernel.org,
	obi@linuxtv.org,
	linux-media@vger.kernel.org,
	torvalds@linux-foundation.org
Subject: [PATCH 5.15.y] media: dvb-core: fix wrong reinitialization of ringbuffer on reopen
Date: Wed,  1 Apr 2026 14:12:51 +0800
Message-Id: <20260401061251.4165263-1-jianqkang@sina.cn>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spamd-Result: default: False [-0.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[sina.cn,none];
	R_DKIM_ALLOW(-0.20)[sina.cn:s=201208];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c15:e001:75::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	RCVD_COUNT_THREE(0.00)[4];
	TAGGED_FROM(0.00)[bounces-57836-lists,linux-media=lfdr.de];
	FREEMAIL_CC(0.00)[lists.linux.dev,vger.kernel.org,kernel.org,xs4all.nl,linuxtv.org,linux-foundation.org];
	RCVD_TLS_LAST(0.00)[];
	DKIM_TRACE(0.00)[sina.cn:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c15::/32, country:SG];
	FREEMAIL_FROM(0.00)[sina.cn];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[jianqkang@sina.cn,linux-media@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_NONE(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[11];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-media];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns,kernel.dk:email]
X-Rspamd-Queue-Id: B633F375167
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

From: Jens Axboe <axboe@kernel.dk>

[ Upstream commit bfbc0b5b32a8f28ce284add619bf226716a59bc0 ]

dvb_dvr_open() calls dvb_ringbuffer_init() when a new reader opens the
DVR device.  dvb_ringbuffer_init() calls init_waitqueue_head(), which
reinitializes the waitqueue list head to empty.

Since dmxdev->dvr_buffer.queue is a shared waitqueue (all opens of the
same DVR device share it), this orphans any existing waitqueue entries
from io_uring poll or epoll, leaving them with stale prev/next pointers
while the list head is reset to {self, self}.

The waitqueue and spinlock in dvr_buffer are already properly
initialized once in dvb_dmxdev_init().  The open path only needs to
reset the buffer data pointer, size, and read/write positions.

Replace the dvb_ringbuffer_init() call in dvb_dvr_open() with direct
assignment of data/size and a call to dvb_ringbuffer_reset(), which
properly resets pread, pwrite, and error with correct memory ordering
without touching the waitqueue or spinlock.

Cc: stable@vger.kernel.org
Fixes: 34731df288a5f ("V4L/DVB (3501): Dmxdev: use dvb_ringbuffer")
Reported-by: syzbot+ab12f0c08dd7ab8d057c@syzkaller.appspotmail.com
Tested-by: syzbot+ab12f0c08dd7ab8d057c@syzkaller.appspotmail.com
Link: https://lore.kernel.org/all/698a26d3.050a0220.3b3015.007d.GAE@google.com/
Signed-off-by: Jens Axboe <axboe@kernel.dk>
Signed-off-by: Linus Torvalds <torvalds@linux-foundation.org>
Signed-off-by: Jianqiang kang <jianqkang@sina.cn>
---
 drivers/media/dvb-core/dmxdev.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/drivers/media/dvb-core/dmxdev.c b/drivers/media/dvb-core/dmxdev.c
index 4989ffe2477e..a5dd2470ecbe 100644
--- a/drivers/media/dvb-core/dmxdev.c
+++ b/drivers/media/dvb-core/dmxdev.c
@@ -178,7 +178,9 @@ static int dvb_dvr_open(struct inode *inode, struct file *file)
 			mutex_unlock(&dmxdev->mutex);
 			return -ENOMEM;
 		}
-		dvb_ringbuffer_init(&dmxdev->dvr_buffer, mem, DVR_BUFFER_SIZE);
+		dmxdev->dvr_buffer.data = mem;
+		dmxdev->dvr_buffer.size = DVR_BUFFER_SIZE;
+		dvb_ringbuffer_reset(&dmxdev->dvr_buffer);
 		if (dmxdev->may_do_mmap)
 			dvb_vb2_init(&dmxdev->dvr_vb2_ctx, "dvr",
 				     file->f_flags & O_NONBLOCK);
-- 
2.34.1


