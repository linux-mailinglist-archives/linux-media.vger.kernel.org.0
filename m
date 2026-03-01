Return-Path: <linux-media+bounces-53991-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id EHd/NcKeo2lzIgUAu9opvQ
	(envelope-from <linux-media+bounces-53991-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Sun, 01 Mar 2026 03:04:50 +0100
X-Original-To: lists+linux-media@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id 899691CCD88
	for <lists+linux-media@lfdr.de>; Sun, 01 Mar 2026 03:04:50 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 8EEFE3011167
	for <lists+linux-media@lfdr.de>; Sun,  1 Mar 2026 02:00:05 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 699972FC89C;
	Sun,  1 Mar 2026 01:59:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="TkWByOX0"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D4472262FEC;
	Sun,  1 Mar 2026 01:59:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772330395; cv=none; b=Xwo3G5jz5m4GxHuZ9G1zuQAKbpWpBNtadH8SJth5A8u1NHMZKDDZqAR82PfHGpO6PLYrzw6oiXxEKmrmXfdGaz3FbWKFChKbAo31G3egaspXErShIkP2RrZfxWNDMY7pwFSr8UxEe5PTWgq6aToCgBu9nSygeGYw1OwiZ+ytIyA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772330395; c=relaxed/simple;
	bh=xADjTb4BmUTxNDnoYX6ZZkO1Cbf053gzKyEjxC9m8lo=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=PNRqPUsHethS+lGfm+vW/NWfH67cYcVO1MT521jtf1zLZ1nlmOTsNmvTnuz8PZ+Od3Fg3R/8Nxpr9RhJJakjxf02EXCbWL6lRBm9mS93Lj+UPIxwiIkael5mf1WcxH024+arLipJhI3nN2ZqtYfcn65cZhSs6qez/99PR/ISleA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=TkWByOX0; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 449C6C19421;
	Sun,  1 Mar 2026 01:59:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1772330395;
	bh=xADjTb4BmUTxNDnoYX6ZZkO1Cbf053gzKyEjxC9m8lo=;
	h=From:To:Cc:Subject:Date:From;
	b=TkWByOX00w/YvvIKB3OycNxR41A59bNCf80C+ww7nD18Hp6iVbYaIvpt3R5pTiTPH
	 pbeWWnOFF+sTDJxYrvzk2NvHztnE4E57BUaCA+yJu2YPtPlY7wTeJ0xp5HYRoTYjCj
	 i1flo++pqMx0VTSC8Dj7AYRe5PYWPzxMIFP8vA59mif6iq6m7nCbx6ALyuYcSwtXUP
	 /Khp1ZHXm9N5A8OUA2gD8ZaaK77DjJ1DBQVXMUIOm4UlbqR1h0IJyk30ncjt3cxuEp
	 gg9jabU+/eRTLkL/bSjXksOFmpyvkSlad7TZOYibDajuiAqvE39fjoKKcfJqrrfVzv
	 TDFi5uW39kn1w==
From: Sasha Levin <sashal@kernel.org>
To: stable@vger.kernel.org,
	nihaal@cse.iitm.ac.in
Cc: Hans Verkuil <hverkuil+cisco@kernel.org>,
	linux-media@vger.kernel.org
Subject: FAILED: Patch "media: i2c/tw9903: Fix potential memory leak in tw9903_probe()" failed to apply to 5.10-stable tree
Date: Sat, 28 Feb 2026 20:59:53 -0500
Message-ID: <20260301015954.1725804-1-sashal@kernel.org>
X-Mailer: git-send-email 2.51.0
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Patchwork-Hint: ignore
X-stable: review
Content-Transfer-Encoding: 8bit
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	MID_CONTAINS_FROM(1.00)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-53991-lists,linux-media=lfdr.de];
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	RCPT_COUNT_THREE(0.00)[4];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[sashal@kernel.org,linux-media@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[kernel.org:+];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-media,cisco];
	TO_DN_SOME(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[iitm.ac.in:email,sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 899691CCD88
X-Rspamd-Action: no action

The patch below does not apply to the 5.10-stable tree.
If someone wants it applied there, or to any other stable or longterm
tree, then please email the backport, including the original git commit
id to <stable@vger.kernel.org>.

Thanks,
Sasha

------------------ original commit in Linus's tree ------------------

From 9cea16fea47e5553f51d10957677ff735b1eff03 Mon Sep 17 00:00:00 2001
From: Abdun Nihaal <nihaal@cse.iitm.ac.in>
Date: Tue, 23 Dec 2025 11:18:13 +0530
Subject: [PATCH] media: i2c/tw9903: Fix potential memory leak in
 tw9903_probe()

In one of the error paths in tw9903_probe(), the memory allocated in
v4l2_ctrl_handler_init() and v4l2_ctrl_new_std() is not freed. Fix that
by calling v4l2_ctrl_handler_free() on the handler in that error path.

Cc: stable@vger.kernel.org
Fixes: 0890ec19c65d ("[media] tw9903: add new tw9903 video decoder")
Signed-off-by: Abdun Nihaal <nihaal@cse.iitm.ac.in>
Signed-off-by: Hans Verkuil <hverkuil+cisco@kernel.org>
---
 drivers/media/i2c/tw9903.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/media/i2c/tw9903.c b/drivers/media/i2c/tw9903.c
index b996a05e56f28..c3eafd5d5dc82 100644
--- a/drivers/media/i2c/tw9903.c
+++ b/drivers/media/i2c/tw9903.c
@@ -228,6 +228,7 @@ static int tw9903_probe(struct i2c_client *client)
 
 	if (write_regs(sd, initial_registers) < 0) {
 		v4l2_err(client, "error initializing TW9903\n");
+		v4l2_ctrl_handler_free(hdl);
 		return -EINVAL;
 	}
 
-- 
2.51.0





