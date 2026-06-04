Return-Path: <linux-media+bounces-63739-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id wbfrCZILIWp0+gAAu9opvQ
	(envelope-from <linux-media+bounces-63739-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Thu, 04 Jun 2026 07:22:26 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 7605763CF19
	for <lists+linux-media@lfdr.de>; Thu, 04 Jun 2026 07:22:25 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=gmail.com header.s=20251104 header.b=PYU0hcj1;
	spf=pass (mail.lfdr.de: domain of "linux-media+bounces-63739-lists+linux-media=lfdr.de@vger.kernel.org" designates 2600:3c0a:e001:db::12fc:5321 as permitted sender) smtp.mailfrom="linux-media+bounces-63739-lists+linux-media=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=none) header.from=gmail.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 78F963061692
	for <lists+linux-media@lfdr.de>; Thu,  4 Jun 2026 05:18:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0BBD83BED5A;
	Thu,  4 Jun 2026 05:18:59 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from mail-dy1-f193.google.com (mail-dy1-f193.google.com [74.125.82.193])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AFF45353EF3
	for <linux-media@vger.kernel.org>; Thu,  4 Jun 2026 05:18:56 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780550338; cv=none; b=pTbxIAGTJ6l4EKLZ8PJopGih6WdaS4ylV1d9Frrg3xYBAb0Q0uouRW1qcSJQfk/W+HblEXms983vYT2ahpgMgqQYd1+0CNsGnPIuVX5DofOiTqbr2OFkB2Hh7p9zWA0hyNVzfU2Bg/yufoJCZa1ui0zo3lCAZDQrej+rh8tgfLM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780550338; c=relaxed/simple;
	bh=6sS/rOAwEAnbZVoTrMOiDHFw6dT7vuBK3ka0sNLl7b4=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=oItustWVAXPlpZ8QySlDqU2UrwYOGq43GXyY6n6zmCHpPb8FzGQIHwmIh+w5ZTYlt3iidGWcEZclD6vnxTEDU3l4kVo3YdfXwxQtR+jBYNceePcxmLV0znM+GIbu7/W+FAXMhDtWvNtJMDjv3eB86qE56N08y//ZHdSsVaDaIQ0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=PYU0hcj1; arc=none smtp.client-ip=74.125.82.193
Received: by mail-dy1-f193.google.com with SMTP id 5a478bee46e88-304d7f31215so213201eec.1
        for <linux-media@vger.kernel.org>; Wed, 03 Jun 2026 22:18:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1780550336; x=1781155136; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=jtOAUIkJHHpqIWubsJjKRb06yKny8EDW95y2MrqiHJY=;
        b=PYU0hcj1nYhe5pt8AaifOMHHltJHBY2YhOm4+IcyuPIYDOyEx9qj0D8qCQrzS46hZZ
         cMTZumzOD3JV2RvIrqo7OAgEgxIb/JaHDDaNxfosYiCQGO7xrkVeEak0XyGIc4itqr2r
         hLOM5Qq0TKV8uvXu5gyJFiNlLkmzXPtkNQGEVRNfp6IUB+aoV7ZDGvHIH9PKmccxAd8O
         XS7a+EopBbsNU4OkUVigVE0JAP/mcfDUhz+6FGLZ3LB2mW6f7wmaXhTdlSTCvQcXy7MM
         NvYXJXpVBs8bUpiBT41QmE4y8dadsJejZQvCKZKlCb+UZaaO3fWwS9H6TcSBlvAlsf9k
         pxIw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780550336; x=1781155136;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=jtOAUIkJHHpqIWubsJjKRb06yKny8EDW95y2MrqiHJY=;
        b=h1ljzKnxpjdwGiR07QbNq0RX5EtTUm2wClJbO6mWA8X6DreuCnv2z8LxYjESl0ArIx
         Ozv8dVUGIWghQ/5oXml4y9p5O2Ff0VEWbUC0DDw+QttElMA6tqjWJGsKDKPr9WfFfkPt
         iIeOwIP2KeXoJI8tInr2isfVmKGDOBld7WsnN4Ls1lDSoMDFMrGrnCkUsxGipzkYDK3w
         XmDa2vDhi4gp7K4QsdwztwcMjxemNcyCZ8cDR/llqTY9QuErjp0qsSMBSMM8tRcoqxu7
         +zWK0Os9zM6OrWNYh+qmmz+bynmAzDRISREowtHQPUweUz3CRlZ6/0c8mKtL2aEtraeS
         j06g==
X-Forwarded-Encrypted: i=1; AFNElJ9dmPd7ivRrbadgRZA+v0GGtrucicYOyv+Y+tGNcMrnmP8vFwnFmziUcZy3fUmwKj+gb2y6OUVglV6g+g==@vger.kernel.org
X-Gm-Message-State: AOJu0YwwYHBnc4BRVL1J+nO8wJlbbNYVwMfehHyIR7iFNamdMTOwLKhb
	5xboenNbKNm3C9Y8/qpV8RMZYR47w4cp9WIeLD/VqGSLmZUCs+FExWzU
X-Gm-Gg: Acq92OFRngWxUyImKMfkaMt06JzmPCKgtJbSYTxrg76u7JmGhef27GhPH6ojeWMCffu
	CSlN8xRlXgI4gxXiLbsHq7C9TQQ8+eenIQKUMJYuK34moeCsNrhzaTzFzC8vRNfa3WOOqJNJpGQ
	jW/3CZ85cRtviN7oy3HN3CdKKYb8fNHD2r1j/IXcIQxqsEpu1ZVJxzxnqR2gZHYIXDOiwm7S43G
	BUUUNmlKAENKZRJE8DpH1oa7Xe/KkYthHGl28PCgvuSYKSEzvcm6OhenI/d2mY4Ll0z5WUVO/y3
	+eZ/HcBXwt3phDY/1tVMkVZAzIEBF1JLePRlj1jy93T9GbZy5baIf5DdjugS2Qh3h6+uM9ec3f4
	ZNpVjv/PVt0hUsgARSfA1A8EJuWFgQ5u9K828R1ZWkfWcDpl1dM90ubNo35XfF0+uDaLNjiAdoT
	wsoZsGWMaWkfhiUNlk+pD+RgKj3WJk0RMei2Qbvz/ZihlqWJKq/3MAVHo9U8gxfd/EAg==
X-Received: by 2002:a05:7300:3c15:b0:2ed:e14:7f54 with SMTP id 5a478bee46e88-3074fc6fb5fmr3151329eec.30.1780550335845;
        Wed, 03 Jun 2026 22:18:55 -0700 (PDT)
Received: from localhost.localdomain ([76.32.119.210])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3074df805d1sm3837573eec.28.2026.06.03.22.18.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 03 Jun 2026 22:18:55 -0700 (PDT)
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
Subject: [PATCH] media: qcom: iris: rollback OPP vote on PM resume failure
Date: Thu,  4 Jun 2026 05:18:14 +0000
Message-Id: <20260604051814.41738-1-dennylin0707@gmail.com>
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
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORWARDED(0.00)[lists@lfdr.de];
	TO_DN_SOME(0.00)[];
	FREEMAIL_CC(0.00)[linux.dev,linaro.org,kernel.org,vger.kernel.org,gmail.com];
	MIME_TRACE(0.00)[0:+];
	TAGGED_FROM(0.00)[bounces-63739-lists,linux-media=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:vikash.garodia@oss.qualcomm.com,m:bod@kernel.org,m:mchehab@kernel.org,m:abhinav.kumar@linux.dev,m:stefan.schmidt@linaro.org,m:hverkuil@kernel.org,m:linux-media@vger.kernel.org,m:linux-arm-msm@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:dennylin0707@gmail.com,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[dennylin0707@gmail.com,linux-media@vger.kernel.org];
	DKIM_TRACE(0.00)[gmail.com:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 7605763CF19

Rollback the maximum OPP vote when
pm_runtime_resume_and_get() fails in
iris_enable_power_domains().

This ensures the performance state vote is released when
power domain enablement does not complete successfully.

Fixes: bb8a95aa038e ("media: iris: implement power management")
Signed-off-by: Hungyu Lin <dennylin0707@gmail.com>
---
 drivers/media/platform/qcom/iris/iris_resources.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/drivers/media/platform/qcom/iris/iris_resources.c b/drivers/media/platform/qcom/iris/iris_resources.c
index f5e3341e1430..a7d25f7a201a 100644
--- a/drivers/media/platform/qcom/iris/iris_resources.c
+++ b/drivers/media/platform/qcom/iris/iris_resources.c
@@ -79,8 +79,10 @@ int iris_enable_power_domains(struct iris_core *core, struct device *pd_dev)
 		return ret;
 
 	ret = pm_runtime_resume_and_get(pd_dev);
-	if (ret)
+	if (ret) {
+		iris_opp_set_rate(core->dev, 0);
 		return ret;
+	}
 
 	return 0;
 }
-- 
2.34.1


