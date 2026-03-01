Return-Path: <linux-media+bounces-53976-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id YHzDKJeco2k3IQUAu9opvQ
	(envelope-from <linux-media+bounces-53976-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Sun, 01 Mar 2026 02:55:35 +0100
X-Original-To: lists+linux-media@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id 3D7ED1CC426
	for <lists+linux-media@lfdr.de>; Sun, 01 Mar 2026 02:55:35 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 8F66F309F0BA
	for <lists+linux-media@lfdr.de>; Sun,  1 Mar 2026 01:51:19 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3CB8031079B;
	Sun,  1 Mar 2026 01:49:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="WpoAPle8"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A19FE31062E;
	Sun,  1 Mar 2026 01:49:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772329780; cv=none; b=VFOQmkOOMRGSmTX36w9w+Y+upclq6AjGZA69CKrxG4+uCt8Frz+X1tS9Yuk2G9yOVV2Soxzo/MmABhNweiQiuXpqOcH1XRaU3tYG9DsI/hcBJA4DSBWZrCNEhjm8unxZB0FjndC1L5N6onvgi1T9OakvSqWcTm/FEwLb+aisFw8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772329780; c=relaxed/simple;
	bh=qd0kiE6a3ngdkkE98txGD9/f8dAUUR/jeu345BrYNfk=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=YJ/gf/QhhQgb7kwMW0aQKnzdYr9S7QKMwR0HlYkSviOv9PDZDRyj8i8qpKKhuYRZ1SCTSsehGFleQVqopEWDw+WHJoWGs/V5g7egJrhMDRAx7BzY/ctjvny1iXjy5Dl4ABmOeXyhiu1Ezd5sKKGL3U18ArremdVxy2tmdCK1nUI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=WpoAPle8; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C67BEC19421;
	Sun,  1 Mar 2026 01:49:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1772329780;
	bh=qd0kiE6a3ngdkkE98txGD9/f8dAUUR/jeu345BrYNfk=;
	h=From:To:Cc:Subject:Date:From;
	b=WpoAPle8Ps42A28gmZan7tjRDjS4vTZ+LuJqtzKGGBtkr1NksKNIVTNdnbQ431iOT
	 gdVnMVqWhpJePPBTCi89B0jDXaG3gIgeuLJf9JI2I/OVavkVIuWQH5lEWdV5HnLLj6
	 gqOlTcoXU/dviNF88P4CW1Q0s4Cs3qNnSKNM+llimwogRx4YDmriOH9mrky0P+BD9k
	 ldOI7XTPbQqD8ObPL3dLRhl2w6/js/U1Z89X2MvA9rUBmy5sTnwl6iXes/Od6rSCW6
	 OJafML6wyEccMWkC9OXg8BTQDWAoQPuA7eoEqZbw90Xp3hkAsLrxRQIeWZj3+K7t/4
	 IBwgp3C6yjG9Q==
From: Sasha Levin <sashal@kernel.org>
To: stable@vger.kernel.org,
	nihaal@cse.iitm.ac.in
Cc: Hans Verkuil <hverkuil+cisco@kernel.org>,
	linux-media@vger.kernel.org
Subject: FAILED: Patch "media: i2c/tw9906: Fix potential memory leak in tw9906_probe()" failed to apply to 5.15-stable tree
Date: Sat, 28 Feb 2026 20:49:38 -0500
Message-ID: <20260301014938.1714305-1-sashal@kernel.org>
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
	TAGGED_FROM(0.00)[bounces-53976-lists,linux-media=lfdr.de];
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 3D7ED1CC426
X-Rspamd-Action: no action

The patch below does not apply to the 5.15-stable tree.
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





