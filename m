Return-Path: <linux-media+bounces-22082-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id C12089D987B
	for <lists+linux-media@lfdr.de>; Tue, 26 Nov 2024 14:24:35 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id A2DFEB22DF7
	for <lists+linux-media@lfdr.de>; Tue, 26 Nov 2024 13:17:38 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8B2961D47A2;
	Tue, 26 Nov 2024 13:17:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.com header.i=@suse.com header.b="Uw+YYQeo";
	dkim=pass (1024-bit key) header.d=suse.com header.i=@suse.com header.b="Uw+YYQeo"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1D2C41BDAA1;
	Tue, 26 Nov 2024 13:17:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1732627051; cv=none; b=lgnblenzhoaPl8wHMtoNCeTl1sEtkjZ8ncFsxmgVdNBNGebnRTgxzLWg30A9/pr1MlaKhyhegC87GkXh6R6z51TC6tenxWz5Aj8hf4seRWoEzV7eqi8hnD2BjPIgsFCmtcg1KzVlxA7gjKbvrJ84BFbyn6iiMG1Yfv3S4PveFJQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1732627051; c=relaxed/simple;
	bh=kGWYvRyKkgDEq45vYjYWq6dvUkqj/3c1Mu2ElpMKN9M=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=DzD0rz822y1uVeJuJdMA26DQpGY/DktfVWM/29O8xFi2//Zo2OQqPp4zzIN0UPKxBsNOn+BilK6ZZvd0+Yz8kgukoE2JuZixuAi75DGE8df6zTwJ4fr5hRZgNZHTLVwfJGVvdkjVinm640+VZNssB46GU5DIxUUsMdYOMiIWnxw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com; spf=pass smtp.mailfrom=suse.com; dkim=pass (1024-bit key) header.d=suse.com header.i=@suse.com header.b=Uw+YYQeo; dkim=pass (1024-bit key) header.d=suse.com header.i=@suse.com header.b=Uw+YYQeo; arc=none smtp.client-ip=195.135.223.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id 3B1AE1F750;
	Tue, 26 Nov 2024 13:17:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1732627045; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:  content-transfer-encoding:content-transfer-encoding;
	bh=YSBkGuLf4r4wgewrViI+yhQRaVyazBo9x3CWk8Y+w/s=;
	b=Uw+YYQeo8ekSZxaZx+fVu55yN6cAQvuFORuTewrjSju5xeG95fSgGvjloOGRt+SUj9MgkG
	brCJWbCZC/bedsYx8GnQjjOTBW5b4insEvP5LkNEyi4dZlV5dlarg1sPgA05M6m3jtE4Yq
	cGkSnrzI7xZyi37Bxf9SZVebTGBkUps=
Authentication-Results: smtp-out2.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1732627045; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:  content-transfer-encoding:content-transfer-encoding;
	bh=YSBkGuLf4r4wgewrViI+yhQRaVyazBo9x3CWk8Y+w/s=;
	b=Uw+YYQeo8ekSZxaZx+fVu55yN6cAQvuFORuTewrjSju5xeG95fSgGvjloOGRt+SUj9MgkG
	brCJWbCZC/bedsYx8GnQjjOTBW5b4insEvP5LkNEyi4dZlV5dlarg1sPgA05M6m3jtE4Yq
	cGkSnrzI7xZyi37Bxf9SZVebTGBkUps=
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 0ED7313890;
	Tue, 26 Nov 2024 13:17:25 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id Y/9uAmXKRWcPYAAAD6G6ig
	(envelope-from <oneukum@suse.com>); Tue, 26 Nov 2024 13:17:25 +0000
From: Oliver Neukum <oneukum@suse.com>
To: sean@mess.org,
	mchehab@kernel.org,
	linux-media@vger.kernel.org,
	linux-usb@vger.kernel.org
Cc: Oliver Neukum <oneukum@suse.com>,
	syzbot+ffba8e636870dac0e0c0@syzkaller.appspotmail.com
Subject: [PATCH] media: rc: iguanair: handle timeouts
Date: Tue, 26 Nov 2024 14:17:22 +0100
Message-ID: <20241126131722.22175-1-oneukum@suse.com>
X-Mailer: git-send-email 2.47.0
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Level: 
X-Spamd-Result: default: False [-1.30 / 50.00];
	BAYES_HAM(-3.00)[99.99%];
	SUSPICIOUS_RECIPS(1.50)[];
	MID_CONTAINS_FROM(1.00)[];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	R_MISSING_CHARSET(0.50)[];
	NEURAL_HAM_SHORT(-0.20)[-1.000];
	MIME_GOOD(-0.10)[text/plain];
	RCVD_COUNT_TWO(0.00)[2];
	ARC_NA(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	TAGGED_RCPT(0.00)[ffba8e636870dac0e0c0];
	DBL_BLOCKED_OPENRESOLVER(0.00)[imap1.dmz-prg2.suse.org:helo,suse.com:email,suse.com:mid];
	FUZZY_BLOCKED(0.00)[rspamd.com];
	FROM_EQ_ENVFROM(0.00)[];
	DKIM_SIGNED(0.00)[suse.com:s=susede1];
	RCPT_COUNT_FIVE(0.00)[6];
	RCVD_TLS_ALL(0.00)[]
X-Spam-Score: -1.30
X-Spam-Flag: NO

In case of a timeout the IO must be cancelled or
the next IO using the URB will fail and/or overwrite
an operational URB.

The automatic bisection fails because it arrives
at a commit that correctly lets the test case run
without an error.

Signed-off-by: Oliver Neukum <oneukum@suse.com>
Fixes: e99a7cfe93fd9  ("[media] iguanair: reuse existing urb callback for command responses")
Reported-by: syzbot+ffba8e636870dac0e0c0@syzkaller.appspotmail.com
Tested-by: syzbot+ffba8e636870dac0e0c0@syzkaller.appspotmail.com
---
 drivers/media/rc/iguanair.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/drivers/media/rc/iguanair.c b/drivers/media/rc/iguanair.c
index 276bf3c8a8cb..8af94246e591 100644
--- a/drivers/media/rc/iguanair.c
+++ b/drivers/media/rc/iguanair.c
@@ -194,8 +194,10 @@ static int iguanair_send(struct iguanair *ir, unsigned size)
 	if (rc)
 		return rc;
 
-	if (wait_for_completion_timeout(&ir->completion, TIMEOUT) == 0)
+	if (wait_for_completion_timeout(&ir->completion, TIMEOUT) == 0) {
+		usb_kill_urb(ir->urb_out);
 		return -ETIMEDOUT;
+	}
 
 	return rc;
 }
-- 
2.47.0


