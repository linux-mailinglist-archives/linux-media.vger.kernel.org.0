Return-Path: <linux-media+bounces-58856-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 38QcIQuU4Gn/jwAAu9opvQ
	(envelope-from <linux-media+bounces-58856-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Thu, 16 Apr 2026 09:47:23 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 5693B40B2CF
	for <lists+linux-media@lfdr.de>; Thu, 16 Apr 2026 09:47:22 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 7E7273176FB7
	for <lists+linux-media@lfdr.de>; Thu, 16 Apr 2026 07:43:55 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 633FF37CD46;
	Thu, 16 Apr 2026 07:43:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=pmhahn.de header.i=@pmhahn.de header.b="U8JjVtcF"
X-Original-To: linux-media@vger.kernel.org
Received: from birdy.pmhahn.de (birdy.pmhahn.de [88.198.22.186])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6F3FC3822A5;
	Thu, 16 Apr 2026 07:43:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=88.198.22.186
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776325432; cv=none; b=WlU0RUqyqS3tds8L10c5b3akt5iOxFmBhNPSx+7YCoawQAArk8QFN5/cHfECCT97MOWKFg4BsOFLemaMzw/DfjJgYrgS7NHnZnOLFqolrTUnwdMlQ4nPJaRfoles2RgYX1Af4zRrmrLN5J14b4RV6tH/UvgyFjWpFfXVAgh+8iA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776325432; c=relaxed/simple;
	bh=ZwybuEKIGVCChwJYM0yiRRHmhIFoQIIqysS1YUh1rfg=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=YyVFwEV+rq5cdi+pOOtBpO5w04IjLxANbpOdMH0cfURqcORXXhflcO9azMwZ4Wapggb5MxpRXPI1BSUb2AcZ7ccrqrsUSbTby9UQ6OERmdwwkgA0TWvIlvaJJbRqmNTTIDImXAX0bSQSi2LwghfjQTZ82dkEYx5OoRO9WvD1jQ8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=pmhahn.de; spf=pass smtp.mailfrom=pmhahn.de; dkim=fail (2048-bit key) header.d=pmhahn.de header.i=@pmhahn.de header.b=U8JjVtcF reason="signature verification failed"; arc=none smtp.client-ip=88.198.22.186
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=pmhahn.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=pmhahn.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=pmhahn.de; s=202501;
	t=1776324880; bh=ZwybuEKIGVCChwJYM0yiRRHmhIFoQIIqysS1YUh1rfg=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=U8JjVtcFtYoHiEGl66gdulCdd5I15+0bHnBrhQ6mT3vXQyudDuy01Nd/GNZtGZYJB
	 ETaIBPqj9BkWlia9TDufSz7tYnkgwnuaan9KNnnx8QYr3rkWs7alhCErxL0d4NOiU8
	 3YtqHP2iPMJB8zvWXCEJxHjldz82Y/ZIODBLdp72RjbWRPUyA2eAWi/qeSL6BeZ4NL
	 I2issAo2vMyLjSRuK2xV22w9BuEKY0awJd2F0HX2SMRcVHIN5Z6BiBicg2Z82wcs8o
	 2lRfvzl8I/dRWXBiytfwvI9ksqZNyfOLsaNnzwCNy4iP/aI0i/64oWi/KgTiV3cQKV
	 MLgUmlcRYlzwA==
Received: from jovis.fritz.box (p200300e2773852006edef9635d8adeb3.dip0.t-ipconnect.de [IPv6:2003:e2:7738:5200:6ede:f963:5d8a:deb3])
	by birdy.pmhahn.de (Postfix) with ESMTPSA id 326472201E29;
	Thu, 16 Apr 2026 09:34:40 +0200 (CEST)
Received: by jovis.fritz.box (Postfix, from userid 1000)
	id E4F6B83; Thu, 16 Apr 2026 09:34:39 +0200 (CEST)
From: Philipp Matthias Hahn <pmhahn@pmhahn.de>
To: Hans Verkuil <hverkuil@kernel.org>,
	Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: Philipp Matthias Hahn <pmhahn@pmhahn.de>,
	linux-media@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] media: gspca: Fix comment in sd_init()
Date: Thu, 16 Apr 2026 09:34:33 +0200
Message-ID: <74b1bd2d083ed7cdc25c282a744799fe2a7c31a3.1776323993.git.pmhahn@pmhahn.de>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <cover.1776323993.git.pmhahn@pmhahn.de>
References: <cover.1776323993.git.pmhahn@pmhahn.de>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spamd-Result: default: False [2.54 / 15.00];
	DMARC_POLICY_QUARANTINE(1.50)[pmhahn.de : SPF not aligned (relaxed),quarantine];
	MID_CONTAINS_FROM(1.00)[];
	R_DKIM_REJECT(1.00)[pmhahn.de:s=202501];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_MISSING_CHARSET(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-58856-lists,linux-media=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	ASN_FAIL(0.00)[10.253.234.172.asn.rspamd.com:server fail];
	FROM_HAS_DN(0.00)[];
	MIME_TRACE(0.00)[0:+];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	DKIM_TRACE(0.00)[pmhahn.de:-];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-media];
	RCVD_COUNT_FIVE(0.00)[5];
	FROM_NEQ_ENVFROM(0.00)[pmhahn@pmhahn.de,linux-media@vger.kernel.org];
	NEURAL_SPAM(0.00)[0.348];
	RCPT_COUNT_FIVE(0.00)[5];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,pmhahn.de:mid,pmhahn.de:email]
X-Rspamd-Queue-Id: 5693B40B2CF
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Fix spelling mistake of{ -> f}.

Signed-off-by: Philipp Matthias Hahn <pmhahn@pmhahn.de>
---
 drivers/media/usb/gspca/sonixb.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/media/usb/gspca/sonixb.c b/drivers/media/usb/gspca/sonixb.c
index 9a9aba5a35de..27594872de84 100644
--- a/drivers/media/usb/gspca/sonixb.c
+++ b/drivers/media/usb/gspca/sonixb.c
@@ -945,7 +945,7 @@ static int sd_config(struct gspca_dev *gspca_dev,
 /* this function is called at probe and resume time */
 static int sd_init(struct gspca_dev *gspca_dev)
 {
-	const __u8 stop = 0x09; /* Disable stream turn of LED */
+	const __u8 stop = 0x09; /* Disable stream, turn off LED */
 
 	reg_w(gspca_dev, 0x01, &stop, 1);
 
-- 
2.47.3


