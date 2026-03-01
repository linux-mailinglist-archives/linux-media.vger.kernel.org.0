Return-Path: <linux-media+bounces-53896-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id QERDGtaWo2l7HQUAu9opvQ
	(envelope-from <linux-media+bounces-53896-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Sun, 01 Mar 2026 02:31:02 +0100
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id C47191CAD92
	for <lists+linux-media@lfdr.de>; Sun, 01 Mar 2026 02:31:01 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 9802730E566D
	for <lists+linux-media@lfdr.de>; Sun,  1 Mar 2026 01:20:34 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 49B4627E045;
	Sun,  1 Mar 2026 01:20:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="relivqiJ"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B20991A3154;
	Sun,  1 Mar 2026 01:20:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772328021; cv=none; b=IDF5YRKOVmSm1T5JK6OPww3+Ry3fQWPGIjQPW3mHBuQUagDozB/wQDb7d3Oy/i2AGyuBPlpvJ42KOGv+L9MSNQCVOAxOwEooifjrqjfbkKYbkqiX9PjV5wdH0/C0SlXtqC1NJubGYExdeUhPtQyCN2yfF3T3RQ0eHs2hKjH5+a4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772328021; c=relaxed/simple;
	bh=2/dPs9eA+52/abNbJJpxJoJNph69SlOXiKofjthZ+3c=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=sVRGlRb82MzboekeThVdoqW2loWWvZWVzgQI5BR3b1OrZ/0U7Ic6nkFlZb6dxVJo+N8OXDTPDDtV/Uk8EwQIhqpLA4X1didpR5h0MVBAbpu36QoEuBnuVpdI1kSaKxUUCTKxMGtwJOuWuIxT5BtBZPDj2Mq0L9TlP2OCj2usog4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=relivqiJ; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D6F4BC19421;
	Sun,  1 Mar 2026 01:20:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1772328021;
	bh=2/dPs9eA+52/abNbJJpxJoJNph69SlOXiKofjthZ+3c=;
	h=From:To:Cc:Subject:Date:From;
	b=relivqiJNsXqOX34LiD0kecDA9zG5QHeTkEGXLq2fNp5sBCg3nZ/ydd+BJNGvfTDg
	 7/gA+mKyy1OPt8lwXqazsgWksT30C2O/t5yUCW70POf0IZyFb3Wxqt7VabcZRkn3Yx
	 QKlpewmoMeQtRj8mdkELDPSek+uXQpM7gThqfvVJGbYKM3GzruSA4+XqPxtWdtgrv4
	 24IE/iECaAtiKLbrQMOQYCBjDf6fhDHLsaHpuPIhbpk/6E90T2o9Ue8CNplOO72nXl
	 C5TA+QBOYX1xXlerkfa3e5iMLvqXJu1ktYXmCsC+rAYvYrp2hOafbuFSlyuX7VrAnb
	 pTJBMtRB5wB8g==
From: Sasha Levin <sashal@kernel.org>
To: stable@vger.kernel.org,
	nihaal@cse.iitm.ac.in
Cc: Hans Verkuil <hverkuil+cisco@kernel.org>,
	linux-media@vger.kernel.org
Subject: FAILED: Patch "media: i2c/tw9903: Fix potential memory leak in tw9903_probe()" failed to apply to 6.12-stable tree
Date: Sat, 28 Feb 2026 20:20:19 -0500
Message-ID: <20260301012019.1675846-1-sashal@kernel.org>
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
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-53896-lists,linux-media=lfdr.de];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	RCPT_COUNT_THREE(0.00)[4];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[sashal@kernel.org,linux-media@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[kernel.org:+];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-media,cisco];
	TO_DN_SOME(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: C47191CAD92
X-Rspamd-Action: no action

The patch below does not apply to the 6.12-stable tree.
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





