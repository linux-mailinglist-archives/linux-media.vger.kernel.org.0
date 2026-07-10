Return-Path: <linux-media+bounces-67244-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id utXyB/W2UGqe3wIAu9opvQ
	(envelope-from <linux-media+bounces-67244-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Fri, 10 Jul 2026 11:10:13 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id 1B6D2738DEB
	for <lists+linux-media@lfdr.de>; Fri, 10 Jul 2026 11:10:12 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=mess.org header.s=2020 header.b=pqaVoVc+;
	dkim=pass header.d=mess.org header.s=2020 header.b=Q7tS2vmA;
	dmarc=pass (policy=none) header.from=mess.org;
	spf=pass (mail.lfdr.de: domain of "linux-media+bounces-67244-lists+linux-media=lfdr.de@vger.kernel.org" designates 104.64.211.4 as permitted sender) smtp.mailfrom="linux-media+bounces-67244-lists+linux-media=lfdr.de@vger.kernel.org";
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id C3D7B306E80F
	for <lists+linux-media@lfdr.de>; Fri, 10 Jul 2026 08:55:23 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7FCAF3DE436;
	Fri, 10 Jul 2026 08:54:00 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from extorris.mess.org (extorris.mess.org [92.243.27.206])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5723E3DA7EE;
	Fri, 10 Jul 2026 08:53:58 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783673639; cv=none; b=q8ODGCWioqmsuDzyHLSTUvza63x9qAyNuOCCwjtzz+yReg9Zuw936yBgbLYmyD/Ovrk2Ox3e1XVcHaZOwYsHf3f3+TrSTzuYgjxADZxFBr09U5bjNO6JhzpvqN5/ZkRIENQXWilEKaXonEYNiio7py58oEiNfZiuyMS/3b/1GNI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783673639; c=relaxed/simple;
	bh=PFYYQhVg4NRarAQ81g5gFeRQ3Pkd+XUXZYeUxj9P9Kk=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=kL7mEM4bJNYtHXt1hgwfbbMRSeNFvXvoR5PAdRkoTxzQRkOxid3SUC+icDLqH32GSTGQBYcSucW56GaPfKFEpYlT70dyLD7iFY+HStKT4lu3vgjwz4/I7e0lGJ3+AoDQsS5MktkN3yoCz1tSDVllkEHwKlODC3ZH50JY0scJKZE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=mess.org; spf=pass smtp.mailfrom=mess.org; dkim=pass (2048-bit key) header.d=mess.org header.i=@mess.org header.b=pqaVoVc+; dkim=pass (2048-bit key) header.d=mess.org header.i=@mess.org header.b=Q7tS2vmA; arc=none smtp.client-ip=92.243.27.206
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=mess.org; s=2020;
	t=1783673630; bh=PFYYQhVg4NRarAQ81g5gFeRQ3Pkd+XUXZYeUxj9P9Kk=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=pqaVoVc+xqwi4zltj+mcYWczHgP/iJginifwqnX3TdaDGrn9Fo2biGHB4LkJUYEog
	 u2BKKbjSMb+PJvjwn8U7aD1Umnb3MtMioRxmS4T2Hs7LgdSeJZJqiwjAGKsrxzjo1t
	 XhRRdDolDRqHN/jWkkxCauK1pm5+ch5mJ4IJ3Ty5sygL4HxvpeK4StAbkIRYeosNWU
	 mUxh8khTw26WwJJVtEGoxfULdBIIbt73S+xo2JdlyqB+PMTmQqkNggOKKheYr7tG3O
	 uhb6YALZxnGWhS2siP7468iU4dOUW35VCwD0Sv82LWC6nVFari0Ne6m5zexY3n0qui
	 yE1VwSj9VYHKA==
Received: by extorris.mess.org (Postfix, from userid 1004)
	id CCE7D40B54; Fri, 10 Jul 2026 09:53:50 +0100 (BST)
X-Spam-Level: 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=mess.org; s=2020;
	t=1783673629; bh=PFYYQhVg4NRarAQ81g5gFeRQ3Pkd+XUXZYeUxj9P9Kk=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=Q7tS2vmA86o248eMBvJZbYEhyUISrTe2nv47HVo3EBB7Wxrw/q2cjF2Q/s1a683pj
	 BoBwF+MTN5v6MmQc7WN1g5SAoqY0NzP9lX+ggsZPVjvkpArpwCtP34JWz2KigVZg4e
	 6L0xbtr9uexxKL+seFkxe6wfL9blzBpwgYSgfoEFoYy6gvzgZ3t9n0FXXuHercC8Gb
	 ArHomzEUtOdrVqrjnuDjawTYJZawhFr+ZEK3GKuww4egj8dYWc46AUqlVpofx+Ap1z
	 aJPjdLb7TV96CXOc2nFahvHojnRrNmcHsgaXzd50an5BycQdq1m405O6IWFL8/cCJK
	 Z4M3GggQWecXA==
Received: from maru.local (unknown [62.232.99.130])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by extorris.mess.org (Postfix) with ESMTPSA id B556540B4C;
	Fri, 10 Jul 2026 09:53:49 +0100 (BST)
From: Sean Young <sean@mess.org>
To: linux-media@vger.kernel.org,
	Sean Young <sean@mess.org>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Chen-Yu Tsai <wens@kernel.org>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Samuel Holland <samuel@sholland.org>,
	Hans Verkuil <hverkuil+cisco@kernel.org>,
	Patrice Chotard <patrice.chotard@foss.st.com>
Cc: linux-arm-kernel@lists.infradead.org,
	linux-sunxi@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: [PATCH 4/7] media: sunxi-cir: Ensure no more interrupts can occur before free
Date: Fri, 10 Jul 2026 09:53:32 +0100
Message-ID: <e74a0caf91aaefaf98476a191e6489c606632bf1.1783673420.git.sean@mess.org>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <cover.1783673420.git.sean@mess.org>
References: <cover.1783673420.git.sean@mess.org>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Rspamd-Action: no action
X-Spamd-Result: default: False [0.84 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[mess.org,none];
	R_DKIM_ALLOW(-0.20)[mess.org:s=2020];
	R_SPF_ALLOW(-0.20)[+ip4:104.64.211.4:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS(0.00)[m:linux-media@vger.kernel.org,m:sean@mess.org,m:mchehab@kernel.org,m:wens@kernel.org,m:jernej.skrabec@gmail.com,m:samuel@sholland.org,m:hverkuil+cisco@kernel.org,m:patrice.chotard@foss.st.com,m:linux-arm-kernel@lists.infradead.org,m:linux-sunxi@lists.linux.dev,m:linux-kernel@vger.kernel.org,m:jernejskrabec@gmail.com,m:hverkuil@kernel.org,s:lists@lfdr.de];
	TAGGED_FROM(0.00)[bounces-67244-lists,linux-media=lfdr.de];
	FORGED_SENDER(0.00)[sean@mess.org,linux-media@vger.kernel.org];
	FREEMAIL_TO(0.00)[vger.kernel.org,mess.org,kernel.org,gmail.com,sholland.org,foss.st.com];
	RCVD_TLS_LAST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:104.64.192.0/19, country:SG];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[sean@mess.org,linux-media@vger.kernel.org];
	DKIM_TRACE(0.00)[mess.org:+];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	TO_DN_SOME(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[11];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-media,cisco];
	FROM_HAS_DN(0.00)[]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 1B6D2738DEB

Only call rc_free_device() once the hardware has been stopped.

Fixes: dccc0c3ddf8f ("media: rc: fix race between unregister and urb/irq callbacks")
Signed-off-by: Sean Young <sean@mess.org>
---
 drivers/media/rc/sunxi-cir.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/media/rc/sunxi-cir.c b/drivers/media/rc/sunxi-cir.c
index 28e840a7e5b8..af1ee08ffdbe 100644
--- a/drivers/media/rc/sunxi-cir.c
+++ b/drivers/media/rc/sunxi-cir.c
@@ -374,8 +374,8 @@ static void sunxi_ir_remove(struct platform_device *pdev)
 	struct sunxi_ir *ir = platform_get_drvdata(pdev);
 
 	rc_unregister_device(ir->rc);
-	rc_free_device(ir->rc);
 	sunxi_ir_hw_exit(&pdev->dev);
+	rc_free_device(ir->rc);
 }
 
 static void sunxi_ir_shutdown(struct platform_device *pdev)
-- 
2.55.0


