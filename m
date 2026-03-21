Return-Path: <linux-media+bounces-56611-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id cF2HLV7rvmn9jgMAu9opvQ
	(envelope-from <linux-media+bounces-56611-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Sat, 21 Mar 2026 20:02:54 +0100
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 187A12E6E30
	for <lists+linux-media@lfdr.de>; Sat, 21 Mar 2026 20:02:54 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 3FC64301BC23
	for <lists+linux-media@lfdr.de>; Sat, 21 Mar 2026 19:02:35 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0E96830EF89;
	Sat, 21 Mar 2026 19:02:35 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from mail.auroraos.dev (unknown [95.181.193.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 26EC22ED870
	for <linux-media@vger.kernel.org>; Sat, 21 Mar 2026 19:02:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=95.181.193.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774119754; cv=none; b=t1/GQAtua8j+wmooXfMosx6Z55Aewd/QyfZkNq7+3U36OgEhr5TQ5TvBtuMoWU1wI051zwnzcTEHQ8++By+R6M4ugpZiXyOslz4xONyxIj9nChmZ43Quh0I2585PgBk003yKRUeyBdnIiIRgoEPTvBan5VOybJXi3N7TP60vgjU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774119754; c=relaxed/simple;
	bh=1Z5cgmXUB1T+RNibtz4An9bzTLPjYxumOivR45SYoC0=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=ijRJZgAQ1L5eDAYQJ4X9uWsVgJnE7bR9OWkEpGlzm3pNgozSBvNHmME6lIV6rjAQzbwQ4itX7lcTLuQeV9kyu2TFWyW6F36JVnio3RgRM6UrRIhpaJw5h6MMcAXi6eoYeTf+SLkCUyayaQ3Huoh20F4otehGU+ZYA7RypqfuHss=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=auroraos.dev; spf=pass smtp.mailfrom=auroraos.dev; arc=none smtp.client-ip=95.181.193.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=auroraos.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=auroraos.dev
Received: from wasted (213.87.139.102) by exch16.corp.auroraos.dev
 (10.189.209.38) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.1847.3; Sat, 21 Mar
 2026 22:02:23 +0300
From: Sergey Shtylyov <s.shtylyov@auroraos.dev>
To: Mauro Carvalho Chehab <mchehab@kernel.org>, <linux-media@vger.kernel.org>
CC: Sergey Shtylyov <s.shtylyov@auroraos.dev>
Subject: [PATCH 2/5] media: lgdt3306a: drop pointless register read in lgdt3306a_set_qam()
Date: Sat, 21 Mar 2026 22:01:39 +0300
Message-ID: <20260321190143.21123-3-s.shtylyov@auroraos.dev>
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
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	DMARC_POLICY_SOFTFAIL(0.10)[auroraos.dev : SPF not aligned (relaxed), No valid DKIM,quarantine,sampled_out];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-56611-lists,linux-media=lfdr.de];
	RCVD_COUNT_THREE(0.00)[4];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[s.shtylyov@auroraos.dev,linux-media@vger.kernel.org];
	R_DKIM_NA(0.00)[];
	NEURAL_HAM(-0.00)[-0.999];
	RCPT_COUNT_THREE(0.00)[3];
	TAGGED_RCPT(0.00)[linux-media];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	TO_DN_SOME(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[auroraos.dev:email,auroraos.dev:mid,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 187A12E6E30
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

In lgdt3306a_set_qam(), the driver reads register 0x0024 but after that it
ANDs the value read with 0 which renders the read pointless (I don't think
it has any side effect). Drop the pointless read, just writing 0x00 to the
register...

Signed-off-by: Sergey Shtylyov <s.shtylyov@auroraos.dev>
---
 drivers/media/dvb-frontends/lgdt3306a.c | 6 +-----
 1 file changed, 1 insertion(+), 5 deletions(-)

diff --git a/drivers/media/dvb-frontends/lgdt3306a.c b/drivers/media/dvb-frontends/lgdt3306a.c
index cde9f3edae63..458ff198e659 100644
--- a/drivers/media/dvb-frontends/lgdt3306a.c
+++ b/drivers/media/dvb-frontends/lgdt3306a.c
@@ -637,11 +637,7 @@ static int lgdt3306a_set_qam(struct lgdt3306a_state *state, int modulation)
 		goto fail;
 
 	/* 5. No AICC operation in QAM mode */
-	ret = lgdt3306a_read_reg(state, 0x0024, &val);
-	if (lg_chkerr(ret))
-		goto fail;
-	val &= 0x00;
-	ret = lgdt3306a_write_reg(state, 0x0024, val);
+	ret = lgdt3306a_write_reg(state, 0x0024, 0x00);
 	if (lg_chkerr(ret))
 		goto fail;
 
-- 
2.53.0

