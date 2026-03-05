Return-Path: <linux-media+bounces-54648-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id iJEyCUKCqWkd9gAAu9opvQ
	(envelope-from <linux-media+bounces-54648-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Thu, 05 Mar 2026 14:16:50 +0100
X-Original-To: lists+linux-media@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id ABE6521283F
	for <lists+linux-media@lfdr.de>; Thu, 05 Mar 2026 14:16:49 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 40674304D54C
	for <lists+linux-media@lfdr.de>; Thu,  5 Mar 2026 13:16:47 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0246222578D;
	Thu,  5 Mar 2026 13:16:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="C1pEte7V"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-lj1-f177.google.com (mail-lj1-f177.google.com [209.85.208.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3532822A1E1
	for <linux-media@vger.kernel.org>; Thu,  5 Mar 2026 13:16:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772716604; cv=none; b=qUibbKti1+5rvfXCawyuUX1Tc3UoOMqLJw1wLdy5Z0C7V5pKXuGGLqbq5NKRt8HglsByaWHSA46IE/V+EhMeRFPXMOSFvKSNGYzvALIdTPrRf2QMeIsb+BFlqLvSe9aJ/4LXCdBL3AWChR2uVYdLPnmVQlmEDf2CT93XJjusmLY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772716604; c=relaxed/simple;
	bh=Xmwpt63dFCWo8nmG1TWJk7Eo89fada5fAtwBIJjQKZc=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=OfZsS67k+PFR0Bk7fEP9ihgtHMbR/Jhm5JT7kLSxcQNHz4RQWlVrV903MQhTalbKYTyIxBMM382I/9bEzDfTBQ7t48yAVzlZJpkmcZEQD+eae61KZWofkPXC0gdyutFI2Vn+8psO/wqQLSj4Lj5wyN483aa4cSdrZmqWJrZ7m94=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=C1pEte7V; arc=none smtp.client-ip=209.85.208.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-lj1-f177.google.com with SMTP id 38308e7fff4ca-38a33a542aeso10136211fa.3
        for <linux-media@vger.kernel.org>; Thu, 05 Mar 2026 05:16:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1772716601; x=1773321401; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=xs6QwGvNwXN+Yconf6GGtRihUgZX18HvE5vVBmbHDpg=;
        b=C1pEte7VlZVU1/IT8BVdRDtZ9VBZc0N8ayaK36zLWoCo08txXe4q/V/OrNvHvbsnpI
         ZU9tLIGYpiN5tz8qCHOVHgvlNuQZ+9txulCNZLzVpW40nYbw64HZYbSL3G5W8Uz8ytWt
         ncWwNSZqddD8kTmArpqdjHkJVpbbWYaW92NzKQ9+tPAwGUAkAR4Lyh99ZXkr3FnYkOwl
         IfvzvQJwnbSXu37Oo6H3HxTzvVsBanchV5ain/bx0vyaoucB9TLSTVP4nuNL8BOwYBK7
         2v7bjA2ZHP8f/06/EabTZJWlz/R15zrgyoMIWi3L0eQZASBDstV3+5BRs0kupWOLmoRg
         ZNsg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772716601; x=1773321401;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=xs6QwGvNwXN+Yconf6GGtRihUgZX18HvE5vVBmbHDpg=;
        b=H4MmGv2ZqIWHmwXOMZVM6PqhM7opDJTtV4QhSnGAIvd/d2fRPkT6HPwuLwnPN0j7My
         sPkjV2Pp/A/Znkosj8cMY/i9g4xEaAB+KUtQ7Bq5v5adtEwG2YmKR9dkSo4jhYlvo1Jp
         ZkQuEJNOgKUKe65NDT1Kd0poxJNrQ06mN1pYO6FwtQF5bCfz/HYEK2FUaAXs8qgFtdUf
         sCB6iNR1ztZaxOR2QODq6wn8n8B+BWthUAX/cnKK2h0jaxjojanOkd555pIlZEyt1sT+
         oRZRjRML7KJlSINPLUgRFqFovNpI8jOf2zpS46pyhfjxNT6L1oqcQFwnNMmdBs5DfBCE
         cqmw==
X-Gm-Message-State: AOJu0YyAv5V6i5hTDibE7giP5Vh5Bj1HdYLnqqztHq523cXE+1XCUsOD
	7JoIraltP6g5UwgwYDaZjti2zPTdYNFr0SMsxBwmq8j5WQA5D5+aA3/f
X-Gm-Gg: ATEYQzzN/Id1ytm8dWqdcIVBwQrQyDvKycpcrzvn9yJM0n8ny9isBocwsaNJxxt4hIB
	u0i/z2S/hB2XjKtCRVIaz3TTE9WlNrh9S6mD5qkptAbSLNVUImCqjT9LktQiW2AW2/7J8RTL+wd
	QF+WdXz7m12hGfRpwLryzEmWEwbUeBiC0MraGJjoFIzfrtLWcPHwlxjOOTcrUbzQnK+fnGd0rhJ
	N1mNQhxUb+q+a9ZVd+ud533cYTqPQ3JqdHxbEnuTyEYdMWrSkehEY45scXz3oczlRVDV76uBSNT
	FgeSdV68elPaO6WVI6DdEkkXw5JMPzkJMNXovERAWZdRW+B+K316E9vbADlq5sPi0RHldlvcU11
	I7sgD0m1LKBA4ZrPfqNiWl+SK0Vwi5BfUj9GuqM3hM5ICKfzzxL+90aX87uOYyaiCfKNVlXZSVD
	EpPwvshTeYZJD3Fo6rF58coMdvsb4xxqT6egvtjn0=
X-Received: by 2002:a05:651c:3050:b0:38a:a2b:5ef7 with SMTP id 38308e7fff4ca-38a2c5a90bemr29115221fa.15.1772716601069;
        Thu, 05 Mar 2026 05:16:41 -0800 (PST)
Received: from gentoo.sknt.ru ([95.161.221.172])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-38a3ad7e74fsm292011fa.35.2026.03.05.05.16.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 05 Mar 2026 05:16:40 -0800 (PST)
From: Alexander Shiyan <eagle.alexander923@gmail.com>
To: linux-kernel@vger.kernel.org
Cc: linux-media@vger.kernel.org,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Alexander Shiyan <eagle.alexander923@gmail.com>
Subject: [PATCH] media: ccs-pll: Fix pre-PLL divider calculation for EXT_IP_PLL_DIVIDER flag
Date: Thu,  5 Mar 2026 16:16:37 +0300
Message-ID: <20260305131637.2572615-1-eagle.alexander923@gmail.com>
X-Mailer: git-send-email 2.52.0
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Rspamd-Queue-Id: ABE6521283F
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.16 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c09:e001:a7::/64:c];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20230601];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_FROM(0.00)[gmail.com];
	TO_DN_SOME(0.00)[];
	FREEMAIL_CC(0.00)[vger.kernel.org,linux.intel.com,kernel.org,gmail.com];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-54648-lists,linux-media=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[gmail.com:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
	RCPT_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[eaglealexander923@gmail.com,linux-media@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	MID_RHS_MATCH_FROM(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-media];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sto.lore.kernel.org:rdns,sto.lore.kernel.org:helo]
X-Rspamd-Action: no action

When the CCS_PLL_FLAG_EXT_IP_PLL_DIVIDER flag is set, odd pre-PLL divider
values are allowed. However, in the operational timing branch the
calculation of the minimum pre-PLL divider incorrectly uses clk_div_even_up,
forcing the minimum value to be even, even if the flag is set. This prevents
selecting a valid odd divider like 3, which may be required for certain
sensor configurations.

Fix this by removing the forced even rounding from the minimum pre-PLL
divider calculation. The loop later uses the flag to determine the step,
so odd values will be considered when the flag is set.

Signed-off-by: Alexander Shiyan <eagle.alexander923@gmail.com>
---
 drivers/media/i2c/ccs-pll.c | 5 ++---
 1 file changed, 2 insertions(+), 3 deletions(-)

diff --git a/drivers/media/i2c/ccs-pll.c b/drivers/media/i2c/ccs-pll.c
index 4eb83636e102..1605cfa5db19 100644
--- a/drivers/media/i2c/ccs-pll.c
+++ b/drivers/media/i2c/ccs-pll.c
@@ -824,9 +824,8 @@ int ccs_pll_calculate(struct device *dev, const struct ccs_pll_limits *lim,
 				   op_lim_fr->min_pll_ip_clk_freq_hz));
 	min_op_pre_pll_clk_div =
 		max_t(u16, op_lim_fr->min_pre_pll_clk_div,
-		      clk_div_even_up(
-			      DIV_ROUND_UP(pll->ext_clk_freq_hz,
-					   op_lim_fr->max_pll_ip_clk_freq_hz)));
+		      DIV_ROUND_UP(pll->ext_clk_freq_hz,
+				   op_lim_fr->max_pll_ip_clk_freq_hz));
 	dev_dbg(dev, "pre-pll check: min / max op_pre_pll_clk_div: %u / %u\n",
 		min_op_pre_pll_clk_div, max_op_pre_pll_clk_div);
 
-- 
2.52.0


