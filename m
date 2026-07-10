Return-Path: <linux-media+bounces-67275-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id fbjHE/zTUGp45gIAu9opvQ
	(envelope-from <linux-media+bounces-67275-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Fri, 10 Jul 2026 13:14:04 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 9435F73A055
	for <lists+linux-media@lfdr.de>; Fri, 10 Jul 2026 13:14:03 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=kernel.org header.s=k20260515 header.b="FcOqV/+4";
	dmarc=pass (policy=quarantine) header.from=kernel.org;
	spf=pass (mail.lfdr.de: domain of "linux-media+bounces-67275-lists+linux-media=lfdr.de@vger.kernel.org" designates 2600:3c0a:e001:db::12fc:5321 as permitted sender) smtp.mailfrom="linux-media+bounces-67275-lists+linux-media=lfdr.de@vger.kernel.org";
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 73828301CA79
	for <lists+linux-media@lfdr.de>; Fri, 10 Jul 2026 11:11:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E9F1541168C;
	Fri, 10 Jul 2026 11:11:49 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 32C333FADE8
	for <linux-media@vger.kernel.org>; Fri, 10 Jul 2026 11:11:47 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783681909; cv=none; b=hdSWgwHfRVnrDP7YjLyC5SFWqkyzrCfKWCFqgFp0op8wT+cojvrbU1+1rQnYI/z+cOOSEKKljwDP3aSDNFt15HWkyDdAMq32GzfKFusJg9ykvHI3oQk8ogPx4R7k2Zl049Q4AEa+Yvjp2o9m6ZgVSo8FeIVPkxZ0dsodYYLFVKg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783681909; c=relaxed/simple;
	bh=JsnpIHevV2d4hCKOkyq5rR/G/j2/FLBiBl5/mNvEW+s=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=U53f9TqGViVsrY/JScjochUiiw5eBQOJSG97vx7R/5oMi7Y6QAUCSVUQIa+9In+dlrC3Agbc/VD7pgsmhmwK5QknbZxbpE3DgnXTfYs4Nh/SXpa0E9hsoRlceZOirPra5MV9knhspR59r7qTgRT3euf5NCgTmEbxvGpGd/44mxw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=FcOqV/+4; arc=none smtp.client-ip=100.103.45.18
Received: by smtp.kernel.org (Postfix) with ESMTPSA id ECBED1F000E9;
	Fri, 10 Jul 2026 11:11:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1783681907;
	bh=STu1q7spxfud2tNV24QZVaXtuzQ4ObeK00UCKZE+aE8=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=FcOqV/+4AtwJEztH1chPMo9DoKC7PHJL8x8WgbyPtpikmDzd0TKz6fQ9kUdIqQS+2
	 uAie2p2PPN07rTQeqj3QbRy/gLCzEds2+J7bSCqK27GfCLwBbMM/laqU8d1GWPTRYP
	 ee6n0fZjGXpeEkpTfOV5EwXVcJ6xYpDeDwmZta1yvbhZpwkSvISkiQW8UnDUlv4J6u
	 YItnm555fXU77Qje/b/WhibTDLC9MZQY76VUqhFgdA3x9R7yID19PmmSNOB6sRB+Xq
	 OKFK0OQ4epfDeUdIv8D6Mc9uUyBy6jvAnBALDnM7Ys7qLHPVe9yKx90KHKPCV1MmEj
	 2GjS9Iaij/jsQ==
From: Hans Verkuil <hverkuil+cisco@kernel.org>
To: linux-media@vger.kernel.org
Cc: Hans Verkuil <hverkuil+cisco@kernel.org>
Subject: [PATCH 2/8] media: cec/core: drop ABORTED/TIMEOUT check
Date: Fri, 10 Jul 2026 13:07:30 +0200
Message-ID: <cf5f003493c1c604cf5ae6ff7175e94510e6c916.1783681656.git.hverkuil+cisco@kernel.org>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <cover.1783681656.git.hverkuil+cisco@kernel.org>
References: <cover.1783681656.git.hverkuil+cisco@kernel.org>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-4.66 / 15.00];
	WHITELIST_SPF_DKIM(-3.00)[kernel.org:d:+,kernel.org:s:+];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20260515];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS(0.00)[m:linux-media@vger.kernel.org,m:hverkuil+cisco@kernel.org,m:hverkuil@kernel.org,s:lists@lfdr.de];
	RCVD_COUNT_THREE(0.00)[4];
	RCPT_COUNT_TWO(0.00)[2];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	TAGGED_FROM(0.00)[bounces-67275-lists,linux-media=lfdr.de,cisco];
	FORGED_SENDER(0.00)[hverkuil@kernel.org,linux-media@vger.kernel.org];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[hverkuil@kernel.org,linux-media@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[kernel.org:+];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	TO_DN_SOME(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-media,cisco];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 9435F73A055

When claiming a logical address, don't break off the process
when the transmit returns ABORTED or TIMEOUT. Just do another
attempt in that case.

Signed-off-by: Hans Verkuil <hverkuil+cisco@kernel.org>
---
 drivers/media/cec/core/cec-adap.c | 7 -------
 1 file changed, 7 deletions(-)

diff --git a/drivers/media/cec/core/cec-adap.c b/drivers/media/cec/core/cec-adap.c
index e9dce0dfd102..0c2f4660a7bd 100644
--- a/drivers/media/cec/core/cec-adap.c
+++ b/drivers/media/cec/core/cec-adap.c
@@ -1345,13 +1345,6 @@ static int cec_config_log_addr(struct cec_adapter *adap,
 		if (err)
 			return err;
 
-		/*
-		 * The message was aborted or timed out due to a disconnect or
-		 * unconfigure, just bail out.
-		 */
-		if (msg.tx_status &
-		    (CEC_TX_STATUS_ABORTED | CEC_TX_STATUS_TIMEOUT))
-			return -EINTR;
 		if (msg.tx_status & CEC_TX_STATUS_OK)
 			return 0;
 		if (msg.tx_status & CEC_TX_STATUS_NACK)
-- 
2.53.0


