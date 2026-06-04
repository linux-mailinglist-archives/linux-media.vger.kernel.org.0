Return-Path: <linux-media+bounces-63734-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id DOLHAkH/IGrt+AAAu9opvQ
	(envelope-from <linux-media+bounces-63734-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Thu, 04 Jun 2026 06:29:53 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 56FDA63CD16
	for <lists+linux-media@lfdr.de>; Thu, 04 Jun 2026 06:29:52 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=gmail.com header.s=20251104 header.b=CfYUl+It;
	spf=pass (mail.lfdr.de: domain of "linux-media+bounces-63734-lists+linux-media=lfdr.de@vger.kernel.org" designates 172.234.253.10 as permitted sender) smtp.mailfrom="linux-media+bounces-63734-lists+linux-media=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=none) header.from=gmail.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 282513036D44
	for <lists+linux-media@lfdr.de>; Thu,  4 Jun 2026 04:28:38 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 19F803B19C1;
	Thu,  4 Jun 2026 04:28:35 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from mail-dl1-f65.google.com (mail-dl1-f65.google.com [74.125.82.65])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 794C13B2D1A
	for <linux-media@vger.kernel.org>; Thu,  4 Jun 2026 04:28:33 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780547314; cv=none; b=DPJG8mP6ISTjWYRnDHxQi3l+OAYUy+QbVqfhB6gyWypiuQ/YOxo30JGDh7iyof8yhrKFRHBTYiD/2/bwec6Z8oQ6p04rhY5vpvFMznplFaa9nZG3enDTGN7hha1aretMkIDuIIsz/nG43neAgcvrg58vPrKaMSDhYOF4hxcMRRg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780547314; c=relaxed/simple;
	bh=kPHuJtTQ0hkRfy7p73FhicO8cUg/8nIs8uPAoZveIcE=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=MeEMvlqAGAXdGkcOBo7booc4FgMbBf3wRzKG8FMOqrK8+wn/p+z8FkXtpfO1ZYJqKnJj6gImdln2MLYpN4qwb0itRJ8NosXCxBK0oEp4agaxAzKeCJUdE6cJ1iRajtmBiz9d8uKnAI5xcMZUFfr9A1jOlprTwB9kC8sTZi4deSI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=CfYUl+It; arc=none smtp.client-ip=74.125.82.65
Received: by mail-dl1-f65.google.com with SMTP id a92af1059eb24-137eed84fc6so808868c88.0
        for <linux-media@vger.kernel.org>; Wed, 03 Jun 2026 21:28:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1780547313; x=1781152113; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=0Krv81UtJqbrKiv64g1xvINw4ke0/xXMSb7GtZ8cJeM=;
        b=CfYUl+ItPiv6tYXi9JK0Ni8K9rm3TRRkgSNHBoo+RLWZ4JLxVzzg0LO5lJ9RuF1N9G
         t4Mndvlf0odZIiTb2MIetWgBBlaXBPIKzOKPj3FiX2NEeXaFZ12aS0rvEkMbpUY/sHon
         DM1dhveQuyYgJXKln1Ths9DS4l52BG85JPyIvGA5B7ZqdtygZ7jqysLcxLcy0UbDb4Kr
         YB6o6RSMhUW/kgf+f24UDEbOTdU4WCEKCpQSQDE3I6ki3vSL4L7ZqBsiCt+EBdCUrwLi
         xVU07FTjnqrBFEr2CED1xgdw4Zsgin9aNNKrAYms5S4kEk2EPNevnoN+yjoXZ13SgRgo
         wVQQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780547313; x=1781152113;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=0Krv81UtJqbrKiv64g1xvINw4ke0/xXMSb7GtZ8cJeM=;
        b=WfMnMJxPKIjABdF+D7lrwPN9xC/1OatEg/DAcGu3ICHekCQ24WUpZcPlyt/dinrbFO
         +qbCIjzNZMvYL2EM/HXtHhFwQftbHp9apZGE6NS9zN1xBwS23oFuJ2QpRgsDCgxPk96F
         EOkth40Pd3RqORoiOyB2THJh+NETv1BMdK3tSeMdCz7AQuYTmOMSD8flVpYd8pD7o2bb
         NEtxvemdsuvluT6Z77mtzxbwzvnLgQs9M4fWF8jDCtv5K0QR3tCIuH9zFJt60b9BYZUI
         ecOIsyC1IKfQG6d7LeOyoa/4pzMTfwWC+Nh58rcm6dVafyfxKGMJhYwHvPh0yXCccMDk
         EIQw==
X-Forwarded-Encrypted: i=1; AFNElJ9/Ml9YBMb1bzy47RF42rrHqe4fDIHMcNcsfw/XDb/kda9UkW0uzBOfhef9s3U8XlGDtuPVz/6gsp1n2g==@vger.kernel.org
X-Gm-Message-State: AOJu0YxxtsWG3K+KJeDsz+b4OLBWfbHQxBU8OI6QhELoJZYrHFqSmIFc
	osziQdUt8z+WyH/rO5n6Y83iCU80rJfH1SmZo8Au7T5PmBTKK0IZ0rPY
X-Gm-Gg: Acq92OF0VonwzAuKEro6aIk/nKq0OanOfwZHnxHyBQr/lZjeFz6XqeGSJhpdpgPSdtP
	M26zoUF1hOPeVC8wQloaOY/lsrbebjb1VmtDL5afKVAj2KTNsv1ZB/4Z2mnhyXGnYf9JmbacV1J
	7sIv/Lh4fGpCFcpSWpTTxd+qNUyj9OfxIJZgrh0vDkk3OEhw9bpcNiQJWwUTF6WUvIczr/nwKLw
	29ui4cW3g+ibhiB1PGTVn9xJN6AVdP1t2eod1SwxS92fJ1T6NNpnRBHmdsG9WNA+h/Ml2nFuZ/n
	FDPrPuI0s1PcneQziBBvFFvBA8He+Xa2HVIv9wnwegyvUcN4Hu/ye2H1fwjcLdRy1Da9rGJI5gd
	ZbYscrMQ5byVFvkfUbwDhZNp6K2zGfr9zaNXhGc16ybV2nIPZu9njfSnGaMUXP+WxCxW6L+Ml8j
	wWLkRj12u+fAga+b3V/WDGFlv/c8Wwc+ZrW+RQBBcMGfyC4Kg92ZID0OTnd98rWNiyrw==
X-Received: by 2002:a05:7300:dc8c:b0:2df:7fe3:96a with SMTP id 5a478bee46e88-3074f843547mr3215053eec.0.1780547312495;
        Wed, 03 Jun 2026 21:28:32 -0700 (PDT)
Received: from localhost.localdomain ([76.32.119.210])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3074df8076csm4379317eec.29.2026.06.03.21.28.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 03 Jun 2026 21:28:32 -0700 (PDT)
From: Hungyu Lin <dennylin0707@gmail.com>
To: vikash.garodia@oss.qualcomm.com,
	bod@kernel.org,
	mchehab@kernel.org
Cc: abhinav.kumar@linux.dev,
	stefan.schmidt@linaro.org,
	hverkuil@kernel.org,
	linux-media@vger.kernel.org,
	linux-arm-msm@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Hungyu Lin <dennylin0707@gmail.com>
Subject: [PATCH] media: qcom: iris: handle runtime PM resume failure in core deinit
Date: Thu,  4 Jun 2026 04:28:04 +0000
Message-Id: <20260604042804.40899-1-dennylin0707@gmail.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORWARDED(0.00)[lists@lfdr.de];
	TO_DN_SOME(0.00)[];
	FREEMAIL_CC(0.00)[linux.dev,linaro.org,kernel.org,vger.kernel.org,gmail.com];
	MIME_TRACE(0.00)[0:+];
	TAGGED_FROM(0.00)[bounces-63734-lists,linux-media=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:vikash.garodia@oss.qualcomm.com,m:bod@kernel.org,m:mchehab@kernel.org,m:abhinav.kumar@linux.dev,m:stefan.schmidt@linaro.org,m:hverkuil@kernel.org,m:linux-media@vger.kernel.org,m:linux-arm-msm@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:dennylin0707@gmail.com,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[dennylin0707@gmail.com,linux-media@vger.kernel.org];
	DKIM_TRACE(0.00)[gmail.com:+];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	FREEMAIL_FROM(0.00)[gmail.com];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[dennylin0707@gmail.com,linux-media@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	RCPT_COUNT_SEVEN(0.00)[10];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	TAGGED_RCPT(0.00)[linux-media];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,vger.kernel.org:from_smtp]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 56FDA63CD16

Check the return value of pm_runtime_resume_and_get() in
iris_core_deinit().

If runtime PM resume fails, avoid accessing hardware resources
and skip the corresponding pm_runtime_put_sync() call, preventing
unbalanced runtime PM references.

Fixes: bb8a95aa038e ("media: iris: implement power management")
Signed-off-by: Hungyu Lin <dennylin0707@gmail.com>
---
 drivers/media/platform/qcom/iris/iris_core.c | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/drivers/media/platform/qcom/iris/iris_core.c b/drivers/media/platform/qcom/iris/iris_core.c
index dbaac01eb15a..a3275ea57557 100644
--- a/drivers/media/platform/qcom/iris/iris_core.c
+++ b/drivers/media/platform/qcom/iris/iris_core.c
@@ -12,7 +12,11 @@
 
 void iris_core_deinit(struct iris_core *core)
 {
-	pm_runtime_resume_and_get(core->dev);
+	int ret;
+
+	ret = pm_runtime_resume_and_get(core->dev);
+	if (ret)
+		return;
 
 	mutex_lock(&core->lock);
 	if (core->state != IRIS_CORE_DEINIT) {
-- 
2.34.1


