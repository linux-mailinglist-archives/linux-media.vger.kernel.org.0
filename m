Return-Path: <linux-media+bounces-59008-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id ttDSFRoi4mlg2AAAu9opvQ
	(envelope-from <linux-media+bounces-59008-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Fri, 17 Apr 2026 14:05:46 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id CF52041B114
	for <lists+linux-media@lfdr.de>; Fri, 17 Apr 2026 14:05:41 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 9A9113037C1D
	for <lists+linux-media@lfdr.de>; Fri, 17 Apr 2026 12:05:35 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 88A56394786;
	Fri, 17 Apr 2026 12:05:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=pmhahn.de header.i=@pmhahn.de header.b="DEC+KqBN"
X-Original-To: linux-media@vger.kernel.org
Received: from birdy.pmhahn.de (birdy.pmhahn.de [88.198.22.186])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4BA87377EBA;
	Fri, 17 Apr 2026 12:05:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=88.198.22.186
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776427534; cv=none; b=YWREVZ/OhPuMLsoMzlEXU/OUeE0CDtRHnwvaFOPB2PvPJNWNAfFtIpDeou67GPTWxh9bhmUSJ4CMGHpCFg3+uuiAGAGqDxYiVe2c7mPWCGokR9ydHV0GmptjRfGdMoOaF0ndMwP+Q0/h9S2+ClQqJHhF4ENLewTUIpa3vFL7RRA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776427534; c=relaxed/simple;
	bh=87RweLBnK4JfPtx/1tuhTBNFAt8lV0nR1jz4FpXfPcY=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=oThgJ+cQKueVWwH/K2yLC9KJmgu+7a9FFxHmfffcqNtafHNAcIIa21NofulqRvmYSyPLyLCQIbTqbkppdeGD19GcEbyi+iZMy+NSxKyBPV0notEZoP7Srg6AH/52kdXKJKjCK8359MLGZb2NDZtYnHsWQY8yXKFWqtITDCiWj0s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=pmhahn.de; spf=pass smtp.mailfrom=pmhahn.de; dkim=fail (2048-bit key) header.d=pmhahn.de header.i=@pmhahn.de header.b=DEC+KqBN reason="signature verification failed"; arc=none smtp.client-ip=88.198.22.186
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=pmhahn.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=pmhahn.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=pmhahn.de; s=202501;
	t=1776427523; bh=87RweLBnK4JfPtx/1tuhTBNFAt8lV0nR1jz4FpXfPcY=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=DEC+KqBNstvr1FKf/tBinHv6u6UbRDTeHHk4Pcu7fdCq3nqKEVcVCx0ntjKeZbk8T
	 DMma/7A3/4d+Shn6PKc/UmfsAsgfq2ZsaRsFYXQaPpkTAideg+jjDGIOt+7VMtGVzE
	 M3KPzerJdr+DFeXiBEqsMYmmzi3n2/GnA0yVUyqM6fvDZRoYaY9ab0NlglEmb6CKmu
	 l3hyIVuLtKcMzqsPHZdrRuwM6XFPLXKsujTbW3e/zV+KXjpvyBIaoNYVTXiyzLebL5
	 dgMXve1JsGUGDn6YYiE9yQRcuaKqC0y3N5FUAcLrsVz3w9kvxYLEvx2s2LGTRYiUPQ
	 oWdMDGIF4LdkA==
Received: from jovis.fritz.box (p200300e2773852006e6c8d9d01a0fe6e.dip0.t-ipconnect.de [IPv6:2003:e2:7738:5200:6e6c:8d9d:1a0:fe6e])
	by birdy.pmhahn.de (Postfix) with ESMTPSA id 89DB022057F9;
	Fri, 17 Apr 2026 14:05:23 +0200 (CEST)
Received: by jovis.fritz.box (Postfix, from userid 1000)
	id 2E3C683; Fri, 17 Apr 2026 14:05:23 +0200 (CEST)
From: Philipp Matthias Hahn <pmhahn@pmhahn.de>
To: Hans Verkuil <hverkuil@kernel.org>,
	Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: Philipp Matthias Hahn <pmhahn@pmhahn.de>,
	linux-media@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2] media: gspca: Fix comment in sd_init()
Date: Fri, 17 Apr 2026 14:05:08 +0200
Message-ID: <5ad942452a456deb71f97d7fad963ddf2806c747.1776426352.git.pmhahn@pmhahn.de>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <cover.1776426352.git.pmhahn@pmhahn.de>
References: <cover.1776426352.git.pmhahn@pmhahn.de>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spamd-Result: default: False [2.54 / 15.00];
	DMARC_POLICY_QUARANTINE(1.50)[pmhahn.de : SPF not aligned (relaxed),quarantine];
	R_DKIM_REJECT(1.00)[pmhahn.de:s=202501];
	MID_CONTAINS_FROM(1.00)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_MISSING_CHARSET(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	TO_DN_SOME(0.00)[];
	DKIM_TRACE(0.00)[pmhahn.de:-];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-59008-lists,linux-media=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	RCPT_COUNT_FIVE(0.00)[5];
	FROM_NEQ_ENVFROM(0.00)[pmhahn@pmhahn.de,linux-media@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	NEURAL_SPAM(0.00)[0.231];
	PRECEDENCE_BULK(0.00)[];
	TAGGED_RCPT(0.00)[linux-media];
	RCVD_COUNT_FIVE(0.00)[5];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: CF52041B114
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Fix spelling mistake of{ -> f}.

Signed-off-by: Philipp Matthias Hahn <pmhahn@pmhahn.de>
---
 drivers/media/usb/gspca/sonixb.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/media/usb/gspca/sonixb.c b/drivers/media/usb/gspca/sonixb.c
index d1c7868b4a6b..f373b5734d83 100644
--- a/drivers/media/usb/gspca/sonixb.c
+++ b/drivers/media/usb/gspca/sonixb.c
@@ -946,7 +946,7 @@ static int sd_config(struct gspca_dev *gspca_dev,
 /* this function is called at probe and resume time */
 static int sd_init(struct gspca_dev *gspca_dev)
 {
-	const __u8 stop = 0x09; /* Disable stream turn of LED */
+	const __u8 stop = 0x09; /* Disable stream, turn off LED */
 
 	reg_w(gspca_dev, 0x01, &stop, 1);
 
-- 
2.47.3


