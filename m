Return-Path: <linux-media+bounces-53992-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id KGdqJMaeo2lzIgUAu9opvQ
	(envelope-from <linux-media+bounces-53992-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Sun, 01 Mar 2026 03:04:54 +0100
X-Original-To: lists+linux-media@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 389FA1CCD91
	for <lists+linux-media@lfdr.de>; Sun, 01 Mar 2026 03:04:54 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 7F83E3079A9E
	for <lists+linux-media@lfdr.de>; Sun,  1 Mar 2026 02:00:08 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9826A2FE07D;
	Sun,  1 Mar 2026 01:59:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="kLskbNGv"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0B8472D5937;
	Sun,  1 Mar 2026 01:59:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772330398; cv=none; b=W0K5VwaXzfc8U9Iu1Q/BqH4GGNSmazF0EZH/xuTh1maFoVcOytSQLrIvvIYVxfkQUy2ZBsMbBxbVp/vUaZQvSPQN4L1OLoEnPzW3i0Ll7X05wF0n5GlZe5nXNXqV2RhTHkW7UadZT/jPljK2nIqnPSqMuStaoA1OyuvlITAZb5s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772330398; c=relaxed/simple;
	bh=BDTsYfM1gVZO0Bscw6uXPMIz8P50tpP5bzxxGR1zwIQ=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=H3wAnJgYr1WVc6khuHSgitMULPK3Xz6RYv4GA4Iz5oEeUprf5EALYOosVDt7EoeqraMlIg0cyq9jykOF/qj10Eq4iLACSFuyla0+W0E7mz9kJxoq/VO7z73P5jb/dkYLN3A7EDTzLJUwrPl7gDLO/PF2EehqYuVUR2LIDBDk8qg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=kLskbNGv; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6B4ACC19421;
	Sun,  1 Mar 2026 01:59:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1772330397;
	bh=BDTsYfM1gVZO0Bscw6uXPMIz8P50tpP5bzxxGR1zwIQ=;
	h=From:To:Cc:Subject:Date:From;
	b=kLskbNGvMGln967j/L9JdgxkTjHUkohDerdPFJjK/zFxIrSYbBH0Q5brLVyJ4L/xP
	 E9SpkTO2DjgDtzqjHgkafBGN2VGrltaOKK4m8cjVygjymESYy/RscQzNAaRiFMXHMj
	 +EXEzCyQxJw1gnvx1ZPKtndaKA7Gg0KoFBeJoX9C45fZwds5v6HjGTy/06w8uK1Q/P
	 fEczKtH5WA1vjla1XnCvL6R3J89s2YRl/9BQxDFfEEMheDpdnxDjhwX/t57IiyoDti
	 7ctKvyMHai6razkSzW24cVkeIi8rfEmKTJMJVNYdpBA+tp/qpaUutLKqAlfuNyYDxE
	 BbIMiK4LP7cFg==
From: Sasha Levin <sashal@kernel.org>
To: stable@vger.kernel.org,
	lihaoxiang@isrc.iscas.ac.cn
Cc: Hans Verkuil <hverkuil+cisco@kernel.org>,
	linux-media@vger.kernel.org
Subject: FAILED: Patch "media: cx25821: Add missing unmap in snd_cx25821_hw_params()" failed to apply to 5.10-stable tree
Date: Sat, 28 Feb 2026 20:59:56 -0500
Message-ID: <20260301015956.1725854-1-sashal@kernel.org>
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
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c09:e001:a7::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-53992-lists,linux-media=lfdr.de];
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
	RCPT_COUNT_THREE(0.00)[4];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[sashal@kernel.org,linux-media@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[kernel.org:+];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-media,cisco];
	TO_DN_SOME(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[iscas.ac.cn:email,sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 389FA1CCD91
X-Rspamd-Action: no action

The patch below does not apply to the 5.10-stable tree.
If someone wants it applied there, or to any other stable or longterm
tree, then please email the backport, including the original git commit
id to <stable@vger.kernel.org>.

Thanks,
Sasha

------------------ original commit in Linus's tree ------------------

From 863f50d583445c3c8b28a0fc4bb9c18fd9656f41 Mon Sep 17 00:00:00 2001
From: Haoxiang Li <lihaoxiang@isrc.iscas.ac.cn>
Date: Wed, 10 Dec 2025 16:52:30 +0800
Subject: [PATCH] media: cx25821: Add missing unmap in snd_cx25821_hw_params()

In error path, add cx25821_alsa_dma_unmap() to release the
resource acquired by cx25821_alsa_dma_map()

Fixes: 8d8e6d6005de ("[media] cx28521: drop videobuf abuse in cx25821-alsa")
Cc: stable@vger.kernel.org
Signed-off-by: Haoxiang Li <lihaoxiang@isrc.iscas.ac.cn>
Signed-off-by: Hans Verkuil <hverkuil+cisco@kernel.org>
---
 drivers/media/pci/cx25821/cx25821-alsa.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/media/pci/cx25821/cx25821-alsa.c b/drivers/media/pci/cx25821/cx25821-alsa.c
index a42f0c03a7ca8..f463365163b7e 100644
--- a/drivers/media/pci/cx25821/cx25821-alsa.c
+++ b/drivers/media/pci/cx25821/cx25821-alsa.c
@@ -535,6 +535,7 @@ static int snd_cx25821_hw_params(struct snd_pcm_substream *substream,
 			chip->period_size, chip->num_periods, 1);
 	if (ret < 0) {
 		pr_info("DEBUG: ERROR after cx25821_risc_databuffer_audio()\n");
+		cx25821_alsa_dma_unmap(chip);
 		goto error;
 	}
 
-- 
2.51.0





