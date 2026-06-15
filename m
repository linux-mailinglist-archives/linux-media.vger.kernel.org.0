Return-Path: <linux-media+bounces-64938-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id +M6WGLKCMGr5TwUAu9opvQ
	(envelope-from <linux-media+bounces-64938-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Tue, 16 Jun 2026 00:54:42 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id D451468A807
	for <lists+linux-media@lfdr.de>; Tue, 16 Jun 2026 00:54:41 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=gmail.com header.s=20251104 header.b=iExf9tf2;
	spf=pass (mail.lfdr.de: domain of "linux-media+bounces-64938-lists+linux-media=lfdr.de@vger.kernel.org" designates 2600:3c0a:e001:db::12fc:5321 as permitted sender) smtp.mailfrom="linux-media+bounces-64938-lists+linux-media=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=none) header.from=gmail.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id E4E7E306FC26
	for <lists+linux-media@lfdr.de>; Mon, 15 Jun 2026 22:53:56 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7493A3BBFA0;
	Mon, 15 Jun 2026 22:53:56 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from mail-dy1-f194.google.com (mail-dy1-f194.google.com [74.125.82.194])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C96DA3BB69B
	for <linux-media@vger.kernel.org>; Mon, 15 Jun 2026 22:53:54 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781564035; cv=none; b=Ooj7159NW10l8MJyjmuZCq6OdGRykHRTTozp3PYvQbvcAo6+wgt2zRD4rhvU98anWl6PstX7PT9Zi3xytZJyZmicfHate4dFKTJp+iGDLdXZb8LOlHJICE2NNq7HpnJ5AmtW+i7+33F0BqRWqfl32YlM5PT7yaEermR7qvsisyE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781564035; c=relaxed/simple;
	bh=uJXopNznpOLBAwaGCxrRuCv37Iisxk3QpVHF/fUGVWs=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=Optu1vBZggMxbJ/EgkgXi/eQim2sNMqwArs99qkql30AW1l3JBQEdOGc+WX9cXCi4lQ4b1TBTMb6/3q8hNVy8I/W1ZfZqo3x9rwFo9ip3D5fb08JzpL18swSf+FCF2uBeoqzREfz2UaQZUUk2izntWuePRQsE6FqpB4PXSEmpzM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=iExf9tf2; arc=none smtp.client-ip=74.125.82.194
Received: by mail-dy1-f194.google.com with SMTP id 5a478bee46e88-307631dbfedso8308488eec.0
        for <linux-media@vger.kernel.org>; Mon, 15 Jun 2026 15:53:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1781564034; x=1782168834; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=A3CN6mz876+/SEyI0OosJ7IJHs+qiuB800Fja+uy4WU=;
        b=iExf9tf2HQouriqrKfdKqzzdxM4PRwPjCfpogxMNELfu3dCxc73WbMFLLVw8qA9Azr
         iDSnp+DtIuyoe9RZXZ3BmA4P58P8InX8dRw5+eEGqf8kFaGibejmKhw3HvA8tctUAQf8
         u51JyTiCilNIcKP/2agcM0ZZPvT/skH+xPfjJMrk+pCNKb7jkn+zZffijtlSNtf1Cq+U
         S1B6YR2tXmkCpw8+stRXeZe9sFyBlH5uiAiAUjNZqEsIK3PeBI0WDn1fLJp/AutNPn3Z
         IEXM0oI8YHoGdEJfj4d5zm2VMPRwM1phpfB0mVkuVI9SGwTlezk2JbhWUAoeqFrFb0F0
         4hHQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781564034; x=1782168834;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=A3CN6mz876+/SEyI0OosJ7IJHs+qiuB800Fja+uy4WU=;
        b=qeImlR7ikASfAX2BZQ2Zq/gKneUBXA34GDwa2rfW+45/jhtK6TnYBGMKd2NZeBN/hF
         3Y6NenfaLmP14Ua39tvN+tGNtlGcVZrECsMaJHfmtOq6K+V5T3Yhz/ytm3GRs9gJsZqy
         00FFDjnyvMH7CAIPn/twyMpFz0celR7MGgRFztG1XGkYZboG9RylwidpHFoASf4LDMqb
         uVrv4LRB1uEDE0a9lRySXlOyl+FDgDpYk8zysVXj09LxSCarpaJFgzHROiqZIGseLXCk
         6KslLTNbZsU9jufdJ7qhWErqj5SY1VCqaPZYi4AIrrmEbuxqM/9O1X5q2L7/RfoeYN5K
         bdpw==
X-Forwarded-Encrypted: i=1; AFNElJ/PEjfpQigtzLcAMBeE+xOSI65DqEooqjLsdoszI1omIpfEI4f3Hlr1yBiEXiJqR1gjY9qDkR3DRng2pw==@vger.kernel.org
X-Gm-Message-State: AOJu0YxWEC055nJICtnvnvynhL/x9DZ/E+RP+X8bw6HCRtzozRiZ+WTQ
	4g6+2vqKv/WRB4T3tVrBDrty1H+YYI+ZTAXxRtvPZwGqHub3jQsE+iFw
X-Gm-Gg: Acq92OFrc5lQXL+Bur6KMzb4K2BxYaGNH6rxRfzUs4XtpAb6owU/PQZwS6odyaY9eTg
	Dz0CBM3TYie7E2o3jsnlbscDRH3aPRrr2Ay1boeLIe4w8icw5/FNexon0uqWS29AkBgExoiZMlZ
	pi9SLCL0F3JUaZMnY6i6BKjXIrtUAO8P6lSUli0HVFVmokKlm3gPlvymXKiyKdyHVDFhTwWlMJh
	156DQFI7IVpfz8ZhDLbPNQhuvkJgIbBVmIvZXccGDdp68LUCFdBa3aH7uxUSCKf87Lm1xTnd7/l
	hoYI5lW6Zgkv7JCpHNyN31bH4NybqaULtSCMRMwmpgJeCG8xX55qp1ZbFmA8jsqGO7GtB4Ce5Qs
	ZPwMgKnoBxeazTSjd5VOiQn+SfyTX2EFoy1/6aMvcA32xzUztO8mPAuZuDTOF0ZiJvtP1FB6hkE
	A2KxvvcirzcDeIdj9225CkEZXKvB7QcyF7orohthx4W5oIaq6fz0BaJjFLIiobZ5/q2hdRthRST
	Q2+RvIhPrXhquQkkuZ2zytPYbMCqkCMFGVaHsKjUSmJwN6ivu8lzcHNy0xSDY6xxfJ9VlNUGCT1
	vS6qpaR9WJItQhXxZ56BZuNCoo2O
X-Received: by 2002:a05:7300:8609:b0:304:d8cb:841a with SMTP id 5a478bee46e88-30ba5b28d0emr761709eec.14.1781564033851;
        Mon, 15 Jun 2026 15:53:53 -0700 (PDT)
Received: from ethan-latitude5420.. (host-127-24.cafrjco.fresno.ca.us.clients.pavlovmedia.net. [68.180.127.24])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3081eb95342sm16727559eec.29.2026.06.15.15.53.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 15 Jun 2026 15:53:53 -0700 (PDT)
From: Ethan Nelson-Moore <enelsonmoore@gmail.com>
To: "GitAuthor: Ethan Nelson-Moore" <enelsonmoore@gmail.com>,
	linux-media@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Subject: [PATCH v2] media: mt2063: correct CONFIG_MEDIA_TUNER_MT2063 macro name in comment
Date: Mon, 15 Jun 2026 15:53:48 -0700
Message-ID: <20260615225351.22791-1-enelsonmoore@gmail.com>
X-Mailer: git-send-email 2.43.0
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
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_CC(0.00)[kernel.org,gmail.com,collabora.com];
	MIME_TRACE(0.00)[0:+];
	TAGGED_FROM(0.00)[bounces-64938-lists,linux-media=lfdr.de];
	TO_DN_SOME(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:enelsonmoore@gmail.com,m:linux-media@vger.kernel.org,m:linux-arm-kernel@lists.infradead.org,m:linux-mediatek@lists.infradead.org,m:mchehab@kernel.org,m:matthias.bgg@gmail.com,m:angelogioacchino.delregno@collabora.com,m:matthiasbgg@gmail.com,s:lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_TO(0.00)[gmail.com,vger.kernel.org,lists.infradead.org];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_SENDER(0.00)[enelsonmoore@gmail.com,linux-media@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FREEMAIL_FROM(0.00)[gmail.com];
	FORGED_SENDER_FORWARDING(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_HAS_DN(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[enelsonmoore@gmail.com,linux-media@vger.kernel.org];
	DKIM_TRACE(0.00)[gmail.com:+];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	RCPT_COUNT_SEVEN(0.00)[7];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-media];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: D451468A807

A comment in drivers/media/tuners/mt2063.h incorrectly refers to
CONFIG_DVB_MT2063 instead of CONFIG_MEDIA_TUNER_MT2063. Correct it.

Discovered while searching for CONFIG_* symbols referenced in code but
not defined in any Kconfig file.

Signed-off-by: Ethan Nelson-Moore <enelsonmoore@gmail.com>
---
Changes in v2: Use correct media: commit message prefix

 drivers/media/tuners/mt2063.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/media/tuners/mt2063.h b/drivers/media/tuners/mt2063.h
index 30d03cd76061..6c4b6c68ec25 100644
--- a/drivers/media/tuners/mt2063.h
+++ b/drivers/media/tuners/mt2063.h
@@ -24,6 +24,6 @@ static inline struct dvb_frontend *mt2063_attach(struct dvb_frontend *fe,
 	return NULL;
 }
 
-#endif /* CONFIG_DVB_MT2063 */
+#endif /* IS_REACHABLE(CONFIG_MEDIA_TUNER_MT2063) */
 
 #endif /* __MT2063_H__ */
-- 
2.43.0


