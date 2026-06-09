Return-Path: <linux-media+bounces-64331-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id hWnEDiZwKGrgEgMAu9opvQ
	(envelope-from <linux-media+bounces-64331-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Tue, 09 Jun 2026 21:57:26 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 9351A663F79
	for <lists+linux-media@lfdr.de>; Tue, 09 Jun 2026 21:57:25 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=gmail.com header.s=20251104 header.b=k8x8EDtQ;
	spf=pass (mail.lfdr.de: domain of "linux-media+bounces-64331-lists+linux-media=lfdr.de@vger.kernel.org" designates 2600:3c0a:e001:db::12fc:5321 as permitted sender) smtp.mailfrom="linux-media+bounces-64331-lists+linux-media=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=none) header.from=gmail.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 2B65E30D6CC2
	for <lists+linux-media@lfdr.de>; Tue,  9 Jun 2026 19:52:09 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5E35B4BCAD7;
	Tue,  9 Jun 2026 19:51:31 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from mail-dy1-f193.google.com (mail-dy1-f193.google.com [74.125.82.193])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D6CB6411667
	for <linux-media@vger.kernel.org>; Tue,  9 Jun 2026 19:51:24 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781034690; cv=none; b=sEw3BIesgqODVjp2c0IgI6V0o9igCZxzu4ARQDEdeVdtpbBvo7JuCIXLNSHIn/X9F9sYwBQs6mgocSHZwo8/pIWjBtGSgBwaZopHDYxcWJDWjbJOa4i2Mc4jbLuYd37YSaD8yKMlLyLHZePK9fqHUATUSIlSazLVmpEmcA872rU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781034690; c=relaxed/simple;
	bh=qMSDC8LaJJ6uxmMZnG/6yy5eUEN3C6idsWxWIj73qUI=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=VAiq+ib7iaugkn/yn3GF8C6xl+qSyqrJ2HFnti7+5wXfNXUp/+R7hPvpk61o6MDdfjEqJsm8HRWSgHALjkEi4e/eB3kEqFN8ix9V32aho2JS+TAaeULb3hb9L6o4RP9WfDHTpgFSoH7AgdGda1bUWg59lhAvGplaW4lYgSv6ogo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=k8x8EDtQ; arc=none smtp.client-ip=74.125.82.193
Received: by mail-dy1-f193.google.com with SMTP id 5a478bee46e88-304cf518c9dso7394424eec.1
        for <linux-media@vger.kernel.org>; Tue, 09 Jun 2026 12:51:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1781034684; x=1781639484; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=LX6a2e9EdQz5MAjUwwyjvP6/Tr8doN8n3cPlP/rAx0M=;
        b=k8x8EDtQrtjABDIZunjGFL0/qDg7XuO/6JbM+phw0MOlBR356+VFsGfdWPA9GAl1NW
         9GwUQZfdqFk6xeCZ0NySyW0RlWiWYjTU9eDNyhARhiAKfSNvNdKuU7pemwqeu+3xB6zf
         g8oxPpC7hGMER5EgHo1UG5ZIhArMcZUC+hwYElm+Y8fC+/IrhibF/7BQcGXdmam18Ovp
         nZSIxBISd0cvsNxzPTKMQ6+KQgEDe9uQuDy1JxKpH+h0FmJMuYI96pt5R5TpYHZPKHpU
         IFvlQKUDyIygJbueuC+4BJMC+M98VXB49Qxutnl3zx2imhLlnrtN83NUXd9TyagDIrRd
         XQMA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781034684; x=1781639484;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=LX6a2e9EdQz5MAjUwwyjvP6/Tr8doN8n3cPlP/rAx0M=;
        b=ZS5e0jLr7h1Qql4gV97arhtf0GgAs7zIHU9jH9ZuE/DxfvC8PgKBG4cjryvuRoaRgN
         +S65mgfX6CRrTtBMSEpuxC5F3lifCwFbedYoTF6lMlCWgS41ko8hjKSm9cDTHVSj9mmo
         jORcydKfq6e4jqlM7AM5iCpFoSsVPPUT1YBf6neePTzMjpfKENAPuvnERSA1o1WhIUuD
         mxRUlMVklMQtO3kJXQmtksVVeOsKODfNay6yHJyP6O50UzUFp1x2Sr4EK7YrNSDbT/RG
         Qf8gy0zkefvNrslSNOVvEPJe/yh27rQvCbkKfX5DAisItRa0B1I4yZCtAaL2JdRVd9/v
         rSOA==
X-Gm-Message-State: AOJu0YwwLjVBYghaGtDBoXnqC+y3679VtIt6rX/JUzbQyQg171n2ocKc
	J9GsKNIL6Z5r9swSputMIctOv/lkNAiWGViEFFsRz43XfLnTRb3h+SYpmOgsv/LP
X-Gm-Gg: Acq92OFk3B7F/jmIhCaTxfUfECxa1af3CMRSfm3rKpKRDQstn1gUFbJKc8f5MugqL8v
	eG0RuDkTP6wVRAST6GYGvanJ8dbdGY72f0zdR/23lNd3qgQR3vXaGKQuP5NtA0Cenu5OrNixnIw
	sKq+WjwMgpfRAZeCO4WUsIF125p7aJ2ZEgDE4d7k4COlrI0nTeMg0cBi9vzIN6kf265OT72AU2g
	PdyaNB/PPBvWu0s3OZoI2suxHZ+sRzrU4n3EyduXX360tKimWBDRB3YMeLrA55mJlLayCS6d2d8
	NR2U9Y05sorn/SbsbFU3SAINTop+kUJ6UboBDtio/QYKugK9ufnlBQfOw0w+UN1DXA85ruPpSkQ
	po2zsqLnOGCLKXwRb84E5vS2YLswihLFC5vd9Hop1UdeXDwQbalhhk+nqUjFWN86MCaD+jBQ3KP
	COfMjYNLylChkj8tKmbEGW9TLvS/Bu1T36LDFtL9TFjNKFXOgtsj931yr7oN4qjBPYrU8raRTIz
	AW8j9iwcs4mxjU0U/xA0iqDuzHBi+zEhP4sBfHn0FLgxc4nay5hkc9pW1xZKP3ee8jydXb2Cgd7
	xDaaic8PvTVLOERULFOXu7lCsO0L
X-Received: by 2002:a05:693c:2d82:b0:304:9b48:53da with SMTP id 5a478bee46e88-3077b260fe3mr11348789eec.26.1781034683644;
        Tue, 09 Jun 2026 12:51:23 -0700 (PDT)
Received: from ethan-latitude5420.. (host-127-24.cafrjco.fresno.ca.us.clients.pavlovmedia.net. [68.180.127.24])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3074df349d8sm22524818eec.22.2026.06.09.12.51.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 09 Jun 2026 12:51:23 -0700 (PDT)
From: Ethan Nelson-Moore <enelsonmoore@gmail.com>
To: linux-media@vger.kernel.org
Cc: Ethan Nelson-Moore <enelsonmoore@gmail.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>
Subject: [PATCH] media: dvb: correct CONFIG_DVB_S5H1432 macro name in #endif comment
Date: Tue,  9 Jun 2026 12:51:15 -0700
Message-ID: <20260609195118.148286-1-enelsonmoore@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.66 / 15.00];
	MID_CONTAINS_FROM(1.00)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_CC(0.00)[gmail.com,kernel.org];
	TO_DN_SOME(0.00)[];
	TAGGED_FROM(0.00)[bounces-64331-lists,linux-media=lfdr.de];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_SENDER(0.00)[enelsonmoore@gmail.com,linux-media@vger.kernel.org];
	FORGED_RECIPIENTS(0.00)[m:linux-media@vger.kernel.org,m:enelsonmoore@gmail.com,m:mchehab@kernel.org,s:lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_THREE(0.00)[3];
	FREEMAIL_FROM(0.00)[gmail.com];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[enelsonmoore@gmail.com,linux-media@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[gmail.com:+];
	RCVD_COUNT_FIVE(0.00)[5];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	ALIAS_RESOLVED(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-media];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,vger.kernel.org:from_smtp]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 9351A663F79

A comment in drivers/media/dvb-frontends/s5h1432.h incorrectly refers
to CONFIG_DVB_s5h1432 (lowercase) instead of CONFIG_DVB_S5H1432.
Correct it.

Discovered while searching for CONFIG_* symbols referenced in code but
not defined in any Kconfig file.
---
 drivers/media/dvb-frontends/s5h1432.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/media/dvb-frontends/s5h1432.h b/drivers/media/dvb-frontends/s5h1432.h
index f031c0654e47..d61ccbf07910 100644
--- a/drivers/media/dvb-frontends/s5h1432.h
+++ b/drivers/media/dvb-frontends/s5h1432.h
@@ -71,6 +71,6 @@ static inline struct dvb_frontend *s5h1432_attach(const struct s5h1432_config
 	printk(KERN_WARNING "%s: driver disabled by Kconfig\n", __func__);
 	return NULL;
 }
-#endif /* CONFIG_DVB_s5h1432 */
+#endif /* CONFIG_DVB_S5H1432 */
 
 #endif /* __s5h1432_H__ */
-- 
2.43.0


