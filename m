Return-Path: <linux-media+bounces-56613-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 0E5EC2/rvmn9jgMAu9opvQ
	(envelope-from <linux-media+bounces-56613-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Sat, 21 Mar 2026 20:03:11 +0100
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 82D4B2E6E3E
	for <lists+linux-media@lfdr.de>; Sat, 21 Mar 2026 20:03:10 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 1C34F301DBA8
	for <lists+linux-media@lfdr.de>; Sat, 21 Mar 2026 19:02:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E2FE431064B;
	Sat, 21 Mar 2026 19:02:39 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from mail.auroraos.dev (unknown [95.181.193.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3037E2F5492
	for <linux-media@vger.kernel.org>; Sat, 21 Mar 2026 19:02:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=95.181.193.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774119759; cv=none; b=TrsPqC5/5HqOqdqr2S386w7oPh1vI9kzdL1YVrIUgpDsIunrZlUVXXoGomTitrexOs59Hm9bVne1YPtQdagg6bsY0ZBiCt9+9LmDXzwkYHed+WXlKWtl/aWB0WSS/5pSt+rVRDgqvr6N3B8Nnl5Xd8ZTnCNOo5REOkp2dokU4Qc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774119759; c=relaxed/simple;
	bh=7gZDHv3b8uaBS1hf5e6BNJij/qexxmgsPE54LXIe04Y=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=b2ZxCTxtCmis8G8Qj4AdM/72wROOb0x6W6F1JB7JfsnWwB6be33DhLicLkgczxHPhUIOKseHybulrjnz0gYMB/wJbykcbgfr9VCNQkk73zL06YjEbHhfo2xmhJ24kTdHvSRo7N89KMX1xFBwJ9Yyi3ugVXW0nL+GoNYc6d7aeMc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=auroraos.dev; spf=pass smtp.mailfrom=auroraos.dev; arc=none smtp.client-ip=95.181.193.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=auroraos.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=auroraos.dev
Received: from wasted (213.87.139.102) by exch16.corp.auroraos.dev
 (10.189.209.38) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.1847.3; Sat, 21 Mar
 2026 22:02:24 +0300
From: Sergey Shtylyov <s.shtylyov@auroraos.dev>
To: Mauro Carvalho Chehab <mchehab@kernel.org>, <linux-media@vger.kernel.org>
CC: Sergey Shtylyov <s.shtylyov@auroraos.dev>
Subject: [PATCH 4/5] media: lgdt3306a: use *switch* statement in lgdt3306a_init()
Date: Sat, 21 Mar 2026 22:01:41 +0300
Message-ID: <20260321190143.21123-5-s.shtylyov@auroraos.dev>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260321190143.21123-1-s.shtylyov@auroraos.dev>
References: <20260321190143.21123-1-s.shtylyov@auroraos.dev>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: exch16.corp.auroraos.dev (10.189.209.38) To
 exch16.corp.auroraos.dev (10.189.209.38)
X-Spamd-Result: default: False [0.14 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	R_MISSING_CHARSET(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	DMARC_POLICY_SOFTFAIL(0.10)[auroraos.dev : SPF not aligned (relaxed), No valid DKIM,quarantine,sampled_out];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-56613-lists,linux-media=lfdr.de];
	RCVD_COUNT_THREE(0.00)[4];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[s.shtylyov@auroraos.dev,linux-media@vger.kernel.org];
	R_DKIM_NA(0.00)[];
	NEURAL_HAM(-0.00)[-0.999];
	RCPT_COUNT_THREE(0.00)[3];
	TAGGED_RCPT(0.00)[linux-media];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	TO_DN_SOME(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[auroraos.dev:email,auroraos.dev:mid,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 82D4B2E6E3E
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

In lgdt3306a_init(), there's a chain of state->cfg->xtalMHz comparisons --
the *switch* statement clearly fits better there...

Signed-off-by: Sergey Shtylyov <s.shtylyov@auroraos.dev>
---
 drivers/media/dvb-frontends/lgdt3306a.c | 10 ++++++----
 1 file changed, 6 insertions(+), 4 deletions(-)

diff --git a/drivers/media/dvb-frontends/lgdt3306a.c b/drivers/media/dvb-frontends/lgdt3306a.c
index d586f9ca6a86..98af9c0f3757 100644
--- a/drivers/media/dvb-frontends/lgdt3306a.c
+++ b/drivers/media/dvb-frontends/lgdt3306a.c
@@ -898,7 +898,8 @@ static int lgdt3306a_init(struct dvb_frontend *fe)
 	if (lg_chkerr(ret))
 		goto fail;
 
-	if (state->cfg->xtalMHz == 24) {	/* 24MHz */
+	switch (state->cfg->xtalMHz) {
+	case 24: /* 24MHz */
 		/* 7. Frequency for PLL output(0x2564 for 192MHz for 24MHz) */
 		ret = lgdt3306a_read_reg(state, 0x0005, &val);
 		if (lg_chkerr(ret))
@@ -921,8 +922,8 @@ static int lgdt3306a_init(struct dvb_frontend *fe)
 		ret = lgdt3306a_write_reg(state, 0x000d, val);
 		if (lg_chkerr(ret))
 			goto fail;
-
-	} else if (state->cfg->xtalMHz == 25) { /* 25MHz */
+		break;
+	case 25: /* 25MHz */
 		/* 7. Frequency for PLL output */
 		ret = lgdt3306a_read_reg(state, 0x0005, &val);
 		if (lg_chkerr(ret))
@@ -945,7 +946,8 @@ static int lgdt3306a_init(struct dvb_frontend *fe)
 		ret = lgdt3306a_write_reg(state, 0x000d, val);
 		if (lg_chkerr(ret))
 			goto fail;
-	} else {
+		break;
+	default:
 		pr_err("Bad xtalMHz=%d\n", state->cfg->xtalMHz);
 	}
 #if 0
-- 
2.53.0

