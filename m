Return-Path: <linux-media+bounces-53995-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id uCFIJNGio2mRIwUAu9opvQ
	(envelope-from <linux-media+bounces-53995-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Sun, 01 Mar 2026 03:22:09 +0100
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 33EC61CD7CD
	for <lists+linux-media@lfdr.de>; Sun, 01 Mar 2026 03:22:09 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 0074632EFFE7
	for <lists+linux-media@lfdr.de>; Sun,  1 Mar 2026 02:00:18 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 987972EE262;
	Sun,  1 Mar 2026 02:00:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="LE76JPot"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0BB083009C7;
	Sun,  1 Mar 2026 02:00:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772330405; cv=none; b=NQQ9VN4jL1ZHLVXQ4EnZJ4qdOl2Cc9eVgsA2hlE71za4QHYplOtgpJWrKtsgLHtO/Qfry7esdI7YRsWBE4fMkex8KZYpWcpPgcTjwz3WR/as9VC3vswDME2tag37M+2s/iV/THUGcftPYM2O2LkM1/G5SDcSZ/JynN62FUoGQkU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772330405; c=relaxed/simple;
	bh=4c6Uif4XHF5BsdecX3PLKYO2jwZIrzmW4FOFA/yG7XI=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=VQilPQYJPv6MS26qy9OF87PYulio4Ftsqv9qY4CRkcr6SuigSyTIVDkZ+Uz2TgOLZh6e+2CAlb4d/oxgur+9dmKO3PlkZPer2OwczR3anoZ6kDAVlQiGOHlwxcT1Zlb2P5TPpRlEbgqi5SZf0QtwhVQ4TZCQk98E1uV2JhVVsPQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=LE76JPot; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6D631C19421;
	Sun,  1 Mar 2026 02:00:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1772330404;
	bh=4c6Uif4XHF5BsdecX3PLKYO2jwZIrzmW4FOFA/yG7XI=;
	h=From:To:Cc:Subject:Date:From;
	b=LE76JPotkbGTXZNukCmPqdfKKcsevmw7covLgq9dDh8NiQiq0X5N7739QWIaHaYXi
	 N5iv01gVWAeiqE0qEk0wEQ95oBoG/dwNkwSJyvoqPb1NIp0IvObxrrmWwNpxXLeCBz
	 pHCwgq4K0L9EqQ3UNjslS8UNBNHA1A1AWavgmZjTzUpA7GDC0DurqRtBFTnJO6+l0m
	 h+EBywWR84ijRxaNDqKcNsTxfj2pMQp/baIQfkWZO5Qac8Da3oyBmE1y+3tpJnkGTX
	 DEK/6XcGXDZrAbQIIlVjxEAqfxnTBQAyRgWCcsezsflD+bihQ6of6Y34YU9oqVb24J
	 HvFVsMZxyIshQ==
From: Sasha Levin <sashal@kernel.org>
To: stable@vger.kernel.org,
	nihaal@cse.iitm.ac.in
Cc: Hans Verkuil <hverkuil+cisco@kernel.org>,
	linux-media@vger.kernel.org
Subject: FAILED: Patch "media: i2c/tw9906: Fix potential memory leak in tw9906_probe()" failed to apply to 5.10-stable tree
Date: Sat, 28 Feb 2026 21:00:02 -0500
Message-ID: <20260301020003.1726002-1-sashal@kernel.org>
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
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-53995-lists,linux-media=lfdr.de];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	RCPT_COUNT_THREE(0.00)[4];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[sashal@kernel.org,linux-media@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[kernel.org:+];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-media,cisco];
	TO_DN_SOME(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,iitm.ac.in:email]
X-Rspamd-Queue-Id: 33EC61CD7CD
X-Rspamd-Action: no action

The patch below does not apply to the 5.10-stable tree.
If someone wants it applied there, or to any other stable or longterm
tree, then please email the backport, including the original git commit
id to <stable@vger.kernel.org>.

Thanks,
Sasha

------------------ original commit in Linus's tree ------------------

From cad237b6c875fbee5d353a2b289e98d240d17ec8 Mon Sep 17 00:00:00 2001
From: Abdun Nihaal <nihaal@cse.iitm.ac.in>
Date: Tue, 23 Dec 2025 11:19:01 +0530
Subject: [PATCH] media: i2c/tw9906: Fix potential memory leak in
 tw9906_probe()

In one of the error paths in tw9906_probe(), the memory allocated in
v4l2_ctrl_handler_init() and v4l2_ctrl_new_std() is not freed. Fix that
by calling v4l2_ctrl_handler_free() on the handler in that error path.

Cc: stable@vger.kernel.org
Fixes: a000e9a02b58 ("[media] tw9906: add Techwell tw9906 video decoder")
Signed-off-by: Abdun Nihaal <nihaal@cse.iitm.ac.in>
Signed-off-by: Hans Verkuil <hverkuil+cisco@kernel.org>
---
 drivers/media/i2c/tw9906.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/media/i2c/tw9906.c b/drivers/media/i2c/tw9906.c
index 6220f4fddbabc..0ab43fe42d7f4 100644
--- a/drivers/media/i2c/tw9906.c
+++ b/drivers/media/i2c/tw9906.c
@@ -196,6 +196,7 @@ static int tw9906_probe(struct i2c_client *client)
 
 	if (write_regs(sd, initial_registers) < 0) {
 		v4l2_err(client, "error initializing TW9906\n");
+		v4l2_ctrl_handler_free(hdl);
 		return -EINVAL;
 	}
 
-- 
2.51.0





