Return-Path: <linux-media+bounces-64764-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id u74GOyVWLWpsfAQAu9opvQ
	(envelope-from <linux-media+bounces-64764-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Sat, 13 Jun 2026 15:07:49 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id AD25667EA40
	for <lists+linux-media@lfdr.de>; Sat, 13 Jun 2026 15:07:49 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=gmail.com header.s=20251104 header.b=PwjOymvQ;
	spf=pass (mail.lfdr.de: domain of "linux-media+bounces-64764-lists+linux-media=lfdr.de@vger.kernel.org" designates 172.232.135.74 as permitted sender) smtp.mailfrom="linux-media+bounces-64764-lists+linux-media=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=none) header.from=gmail.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 25F7A3002B1C
	for <lists+linux-media@lfdr.de>; Sat, 13 Jun 2026 13:07:49 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6724D331EAB;
	Sat, 13 Jun 2026 13:07:45 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from mail-pf1-f178.google.com (mail-pf1-f178.google.com [209.85.210.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B04B33B8959
	for <linux-media@vger.kernel.org>; Sat, 13 Jun 2026 13:07:41 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781356064; cv=none; b=m1tJPhk85MXl/Upcm1a4i0a3vCn6EYF3cP22PFonYq2V7bTBYOPKAcffeaq4V4k07u9Lv/qSgNNpiOHVlMPybEbd1ruV/CuJqcYP4LD4P+mgSWF0UoxzP8lg0xVvA1nuJlMrm82gtNWMwdQXOS+IdU6ccPZixx3Pb4+pU94zWYA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781356064; c=relaxed/simple;
	bh=GmZ7hlNwqfSz0MCKgoapjDySSeXK8lsX46ODhl/JuJ0=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=PYLctZHmqV3P6M3lqrkBA8w4NaAIlo/Rn4LqTpWpyN65nZF8uhon5gTmdq0qDM6i4HPRO7cyYKV2IZh0xQMLoVLTh3tzNH/5nOKdA8+btHVdnMULIH1v/zdKwXGLXSTAIAUYmiWNoKV4+eYmPAOvTFBDL0Leylu1cJxvQUMbhF8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=PwjOymvQ; arc=none smtp.client-ip=209.85.210.178
Received: by mail-pf1-f178.google.com with SMTP id d2e1a72fcca58-84231305a80so1139480b3a.0
        for <linux-media@vger.kernel.org>; Sat, 13 Jun 2026 06:07:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1781356061; x=1781960861; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=bnqfJc9uIWxjcaXjEbkB/bV1HAo7jhd4Hq3fcqX/0Z4=;
        b=PwjOymvQ2D6iRq3zwYxwpArtAag2Bo9C8BPj0Zw2B3v8UWr5egbbIzK/kpFHK9YqPd
         cBm3w4bi6BH7km1Vazk7Cmn4TrS+b566gSO4zXZecA3x9WFhE/hdeXzgJ/JaBdEygWfc
         0GLNalt5sbtdaaytYOCXig7/9RkOs2xhIpEB+DZ92ndl2qzx161gmgj35FkuuB4/VK3Z
         R/TYVhCJX9q6IVCFrABGykFdtdCnKYj2JFT0F/F8OaZEWd2Wn4x2q9etIMBy0YWyk9QR
         CzoPhHQgSfXYXAO/8Jj1I2Xx+589vt0mJn3yRFJvc7EcdFJ9S9AWeJUEMzhy7nn1SFAW
         DhQg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781356061; x=1781960861;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=bnqfJc9uIWxjcaXjEbkB/bV1HAo7jhd4Hq3fcqX/0Z4=;
        b=mDRqW02nXglCEp0dS6wr+GuGRjC0IakEaoXTNSrNszqLV46gAlCJXf9CTUgRBBbLFy
         HM4dlvI8C9xFA+OdBF8mdrOieLeduzOgwvV0qKtEdjbBKgJs7RN0JViLPJYyVHNGkNI6
         uKnv96YYajmPPOvLtoNL5ye07GoCrKEfpuKKcbiHp3Awr9HgtrG9YLfWetmTEnOOYoU9
         eVT7Vh7/sw3JWXrYaoDRj4i6iketDFVV+x1qlgPxbQBovOiP3ltlOB0cJ7pctvuIc8Cx
         tyDpVx5kw+1ovXSD+99x9/KDk6BtmhG6OwQKoBc9MshXh98p9+xcAd2C7CWg9Qj0CCTC
         E5VQ==
X-Gm-Message-State: AOJu0Yy2bYsLPtb7w22bgpzwKYh4XWBmjlxj+sCs8EVFB+pc7laO4oeu
	4yywBkYX/XlXu0UCTTVNz0ys1fHA94c98QbNa2jSTG2ajUYaWPskGPbu
X-Gm-Gg: Acq92OFS7NH2ZrnPiOmR6Jh8jIitaF5NTBW/8iUY4d5UOIZv2rLHeWai2uPJ4UQT1Zc
	tB6lX3Ynxlo2oCMd+Jl+5RTPzLGZXjAkz7X+u6G9gk+LDCE8SUM4XR3RCi0Lei5tGcP1Scp201E
	s+zbeB6H3gvR6mC9tug9bpr6n9Yv7T/7FbSU25lNe5oFlFfE6RcLuDLamtXyfvCVGUCPrn5p35I
	IhuzT5D8NdWMQdL+XD47MBD3sRRhZHy1qLsGPncBdmN6NfGkW8T7PEn51x0MTondbyAdSuaAJsN
	tL577dxN5WHvP56tUORokIHPG+1leeo0xDthymdG4/nREwNGgbLUUiBTRA0JJ2JWBHtV8V4uaur
	1gmFFs8WIswPLH3YBNsvAOm3Eeh7g0lRCun1bFwHF9DXv27E7FVtW/O49KMn2fqv8Q5Q8FzQAcS
	ERWiIfcOxI2JVZIY5biTo6t8GrwVQWjXX34zhb163iEmtvXrEvHwyzok+io5crU8A=
X-Received: by 2002:a05:6a00:1f04:b0:83d:b0a0:90e3 with SMTP id d2e1a72fcca58-844e1a625ebmr3798522b3a.31.1781356060870;
        Sat, 13 Jun 2026 06:07:40 -0700 (PDT)
Received: from localhost.localdomain ([49.207.217.37])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-8434b009e67sm6021995b3a.42.2026.06.13.06.07.38
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Sat, 13 Jun 2026 06:07:40 -0700 (PDT)
From: Biren Pandya <birenpandya@gmail.com>
To: Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: linux-media@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Biren Pandya <birenpandya@gmail.com>
Subject: [PATCH] media: i2c: ov772x: fix memory leak in probe error path
Date: Sat, 13 Jun 2026 18:37:34 +0530
Message-ID: <20260613130734.68983-1-birenpandya@gmail.com>
X-Mailer: git-send-email 2.50.1
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
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74:c];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_CC(0.00)[vger.kernel.org,gmail.com];
	TO_DN_SOME(0.00)[];
	TAGGED_FROM(0.00)[bounces-64764-lists,linux-media=lfdr.de];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_SENDER(0.00)[birenpandya@gmail.com,linux-media@vger.kernel.org];
	FORGED_RECIPIENTS(0.00)[m:mchehab@kernel.org,m:linux-media@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:birenpandya@gmail.com,s:lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_THREE(0.00)[4];
	FREEMAIL_FROM(0.00)[gmail.com];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[birenpandya@gmail.com,linux-media@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[gmail.com:+];
	RCVD_COUNT_FIVE(0.00)[5];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	ALIAS_RESOLVED(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-media];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sto.lore.kernel.org:rdns,sto.lore.kernel.org:helo,vger.kernel.org:from_smtp]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: AD25667EA40

If ov772x_parse_dt() fails, the probe function branches to
error_clk_put, which does not put the powerdown GPIO, leading
to a memory leak. Branch to error_gpio_put instead.

Signed-off-by: Biren Pandya <birenpandya@gmail.com>
---
 drivers/media/i2c/ov772x.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/media/i2c/ov772x.c b/drivers/media/i2c/ov772x.c
index 062e102..2643a84 100644
--- a/drivers/media/i2c/ov772x.c
+++ b/drivers/media/i2c/ov772x.c
@@ -1496,7 +1496,7 @@ static int ov772x_probe(struct i2c_client *client)
 
 	ret = ov772x_parse_dt(client, priv);
 	if (ret)
-		goto error_clk_put;
+		goto error_gpio_put;
 
 	ret = ov772x_video_probe(priv);
 	if (ret < 0)
-- 
2.50.1 (Apple Git-155)


