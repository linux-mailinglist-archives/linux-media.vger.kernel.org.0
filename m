Return-Path: <linux-media+bounces-58165-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id kDQzJrHX1GlxyAcAu9opvQ
	(envelope-from <linux-media+bounces-58165-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Tue, 07 Apr 2026 12:08:49 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 5B48E3AC8AD
	for <lists+linux-media@lfdr.de>; Tue, 07 Apr 2026 12:08:49 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id F053C302257F
	for <lists+linux-media@lfdr.de>; Tue,  7 Apr 2026 10:08:44 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0985B3A785C;
	Tue,  7 Apr 2026 10:08:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="doe8hmpq"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 697DC3A75A5;
	Tue,  7 Apr 2026 10:08:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775556523; cv=none; b=ppl1HToVCtXh0xJoUP39eacpnsQgGaeLW/z7bV1ajZ6mwgLAkxMsdUH+dCORDbscMwZW+Y5RD+gedULWfAp1HxQsaovfiorRWGkPDrRJsAMz2yv7nFXvgkroSMkr98UFwXW2okK5fWbWMXIaXrynYPmE6M13hWDFsn/OGlOVAhw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775556523; c=relaxed/simple;
	bh=FF81oGCkaM1al5wTM45wM9udUtbVp+kmfVYy65JbJVc=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=Z+cVt3ltouwdRDzixQbqzemkmRFbw1ZP4nRbKbk16pl9K4HGFDqX7o7toev6c5IvIIlRS4Z4O865KlPUW3MI+6H0i05lgNkChX1FIsQy5RuxYkP8qtE3O8NRkywRyH/sU4/eKHe3UE1Q7p+Wzr5qFqFmMqNGLq6ZSSdJtgVR20s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=doe8hmpq; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0A5DEC116C6;
	Tue,  7 Apr 2026 10:08:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1775556523;
	bh=FF81oGCkaM1al5wTM45wM9udUtbVp+kmfVYy65JbJVc=;
	h=From:To:Cc:Subject:Date:From;
	b=doe8hmpqOgMHgpuqlIxjNOlv/09XZ9XWaih4D0HLiftNXoxzonf8DKb2F+M5CkAIo
	 K9Uxar3m+OM3bLLDdH+gLk1lXWwSybFfkxdQNZWClJRhzs4Gyri5QeHZJFDImjJfNA
	 UocjY039NQX7stk2OxMoKc06m4zDoZ96zF0q+3THaTW/ByJ5fuc3HZRyxW+MnB6GtU
	 Y3/zfTbguKyxnxnxUJ68CBU5Wg2rZrE5G8G7CN/o81LVKUCJGALSlmENfXKxOKmsEj
	 r2emCmA8iSvaH9ABltEPzAoo1+WYtODBGjmGLDJR4Em6cDMRP8zE9T4rpuYwfsck6g
	 7Dt2dakaeAHww==
Received: from johan by xi.lan with local (Exim 4.98.2)
	(envelope-from <johan@kernel.org>)
	id 1wA3MO-0000000B3Y1-3Nlu;
	Tue, 07 Apr 2026 12:08:40 +0200
From: Johan Hovold <johan@kernel.org>
To: "Lad, Prabhakar" <prabhakar.csengg@gmail.com>
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>,
	linux-media@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Johan Hovold <johan@kernel.org>,
	stable@vger.kernel.org,
	Kevin Hilman <khilman@baylibre.com>
Subject: [PATCH] media: vpif_capture: fix OF node reference imbalance
Date: Tue,  7 Apr 2026 12:08:31 +0200
Message-ID: <20260407100831.2635227-1-johan@kernel.org>
X-Mailer: git-send-email 2.52.0
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
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_MISSING_CHARSET(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-58165-lists,linux-media=lfdr.de];
	RCVD_COUNT_FIVE(0.00)[5];
	FREEMAIL_TO(0.00)[gmail.com];
	FORGED_SENDER_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FROM_NEQ_ENVFROM(0.00)[johan@kernel.org,linux-media@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[7];
	NEURAL_HAM(-0.00)[-1.000];
	DKIM_TRACE(0.00)[kernel.org:+];
	TAGGED_RCPT(0.00)[linux-media];
	TO_DN_SOME(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 5B48E3AC8AD
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

The driver reuses the OF node of the parent device but fails to take
another reference to balance the one dropped by the platform bus code
when unbinding the parent and releasing the child devices.

Fix this by using the intended helper for reusing OF nodes.

Fixes: 4a5f8ae50b66 ("[media] davinci: vpif_capture: get subdevs from DT when available")
Cc: stable@vger.kernel.org	# 4.13
Cc: Kevin Hilman <khilman@baylibre.com>
Signed-off-by: Johan Hovold <johan@kernel.org>
---
 drivers/media/platform/ti/davinci/vpif_capture.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/media/platform/ti/davinci/vpif_capture.c b/drivers/media/platform/ti/davinci/vpif_capture.c
index 15df3ea2f77e..91cb6223561a 100644
--- a/drivers/media/platform/ti/davinci/vpif_capture.c
+++ b/drivers/media/platform/ti/davinci/vpif_capture.c
@@ -1498,7 +1498,7 @@ vpif_capture_get_pdata(struct platform_device *pdev,
 	 * video ports & endpoints data.
 	 */
 	if (pdev->dev.parent && pdev->dev.parent->of_node)
-		pdev->dev.of_node = pdev->dev.parent->of_node;
+		device_set_of_node_from_dev(&pdev->dev, pdev->dev.parent);
 	if (!IS_ENABLED(CONFIG_OF) || !pdev->dev.of_node)
 		return pdev->dev.platform_data;
 
-- 
2.52.0


