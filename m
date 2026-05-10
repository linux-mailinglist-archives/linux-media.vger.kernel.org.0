Return-Path: <linux-media+bounces-61023-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id SFx2IXlVAGp5GQEAu9opvQ
	(envelope-from <linux-media+bounces-61023-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Sun, 10 May 2026 11:52:57 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id DC685503794
	for <lists+linux-media@lfdr.de>; Sun, 10 May 2026 11:52:56 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id B8E3A305EA86
	for <lists+linux-media@lfdr.de>; Sun, 10 May 2026 09:48:19 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8E9BE37CD2C;
	Sun, 10 May 2026 09:48:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="UIXIqxkf"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com [209.85.128.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E2DBB37CD4D
	for <linux-media@vger.kernel.org>; Sun, 10 May 2026 09:48:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778406497; cv=none; b=cE2LfCX4ceEUpffIzc54C77KKq0NW/G/8HUzMTOkgh12mE+NF/EfkXL1kuwt43bx0yIjJ5S1sQYNNfxcMJt0iZqNc1fMHOzRgY8easmdRhHxSEzFUn2Sx6RayXPEHPTk0Ek1gf3X7QXH5ZT/d1s1RUOgen84JtXFSGfGEF3q+EM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778406497; c=relaxed/simple;
	bh=PThAJofFUpaf0I7H3OPLDBFfLJQH6zwvWvtmukAgzZI=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=djC9/JGScM27xaVkHc5ua0lCv+PZoDE0n7EW9liPRw0gamgKrsQ2GZ3LA+ZdBLP43eQvrO8PszqUqUOxmRTwlzjGUWnR9//B9rtGOGfOtE+TwqWz7DNUxg3SEqy7KQH7fmww6vKV5wEq5j9Ta1vopPslJQHQSs+j2HMWoe5ZYD8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=UIXIqxkf; arc=none smtp.client-ip=209.85.128.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wm1-f52.google.com with SMTP id 5b1f17b1804b1-48a7fe4f40bso37959495e9.0
        for <linux-media@vger.kernel.org>; Sun, 10 May 2026 02:48:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1778406489; x=1779011289; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=qJYDpcxH6Tn7+0ROYd7sOCYGz+GoNKS70+mlfSYBYV8=;
        b=UIXIqxkfDe6yto75EOjj7Nqn6jcpzylJ70+ijNqrIxVQe/iMOqMOLn4TJ7BboT7+Oz
         /4mhcmmcusdAzQNtldbSdJOeG/NZ27biyVx0IhoErzzbxj6zXKFNo1PXRBiaWbRh2msX
         5mwghnEo3LDL4Af8souX6q6YPCR2KGpdXD6MAFhjMOhYblvjjYJL3RoRS7ABMzdp11O9
         x2MAiz4SaGw/Um77J8BscZLHxTnMhdnvKToGOrBlRUJi7Y0fFYLkykz/UixlZQgJula0
         KWWu/Xv/BHIu31fEK0qVu8qSuZ4TNmXWOBMxz72tH2AQAZo8xhqLc2cFXTDs3aa+rkOe
         n8mQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778406489; x=1779011289;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=qJYDpcxH6Tn7+0ROYd7sOCYGz+GoNKS70+mlfSYBYV8=;
        b=i3yG6Siso8IYq49vCIDXfkwoyCyzwgmnxIi7OvTsdfg1DTKigiw+R5cgdNkjTr6gU8
         PMrkwKRJqEhaMR/ELCC5LzTo4awTECWBFAs0ehbHy31lv/f7AfiRNFVQk4jkoyV1d6k5
         W+/vzPLPrb+Sv7Kz2kplhRW8O3zdlWERV3UHVhbhrcW8hN6Dtjp+90UnpoMg3wZzj4Sk
         /lPA7Ih1u5y9r4AvF1c4cALT8/qk2IMiPTTGh5oLzNhv03imTWa+jb0haT1pIVP98iyX
         qPayGXXc45c47QZcueChc5olkO/UHjCWNclBzlUCIjNXsIzYtWKRYPccUiQxp4lMeKFE
         1lIQ==
X-Gm-Message-State: AOJu0Yy3jLbNil9b2tcuulapp8NM1qiiSRq5lOjCiYUu2iNa+ttc1Uxj
	TlYbKEN0prS5icY7qXb8x19kWdWKNB3xOpGzmXW8NaI0cJrEPK2DS+rSH3YV3w==
X-Gm-Gg: Acq92OEc4koap14XkMyo1lDgBN6igp8kCA0ROE5RMJcS4kbL2zBYklgDBFRrUonopuW
	XHV7m3xwzq61bUEPRVtVU+EBY+2Hku1YZBNX+6klYfQPZHsYNqtSKk44wL8J1yrwlUxCTBSLUP4
	SscVrRIgZBJ55RhveEstoyQHLqRyVsa6NEU20HzMUAVi3cq6Kp5o8PbXNS/R437yj0ocMZJ2d1P
	Z7tb4FhxYC+DLN10o30kq5S0MMhC2XazuVRU9tMwjapFiux9TJ1hfdsZyUoRUfWCg8dQZn9eLL6
	T52kgW0ayH6ISasTIsymJwSDjKesCGNk0zvOr+qs+Wm2+XGy92EjP64NDU901JWrFZG5h6vmcFG
	FYG+tVdwLtcocxg6DRyxpfR9Ub5duJH2RQsDJIFRM14aXsPTLanD6LqgeAJFaEEnmmnFPybct/L
	/asGCdXwxKgoSSt9bPW+/TULoD12UF
X-Received: by 2002:a05:600c:8011:b0:488:8840:e5ae with SMTP id 5b1f17b1804b1-48e51f3b589mr302185505e9.24.1778406489364;
        Sun, 10 May 2026 02:48:09 -0700 (PDT)
Received: from [192.168.8.79] ([2a00:f502:160:4e2:a099:cad9:2ecd:93de])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-48e702e0bf2sm182807925e9.4.2026.05.10.02.48.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 10 May 2026 02:48:08 -0700 (PDT)
From: Erikas Bitovtas <xerikasxx@gmail.com>
Date: Sun, 10 May 2026 12:47:45 +0300
Subject: [PATCH v6 7/8] media: qcom: venus: Add msm8939 resource struct
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20260510-msm8939-venus-rfc-v6-7-e69465375900@gmail.com>
References: <20260510-msm8939-venus-rfc-v6-0-e69465375900@gmail.com>
In-Reply-To: <20260510-msm8939-venus-rfc-v6-0-e69465375900@gmail.com>
To: Bryan O'Donoghue <bod@kernel.org>, 
 Vikash Garodia <vikash.garodia@oss.qualcomm.com>, 
 Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 =?utf-8?q?Andr=C3=A9_Apitzsch?= <git@apitzsch.eu>, 
 Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, 
 Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney@redhat.com>
Cc: linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-clk@vger.kernel.org, ~postmarketos/upstreaming@lists.sr.ht, 
 phone-devel@vger.kernel.org, Erikas Bitovtas <xerikasxx@gmail.com>, 
 Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Rspamd-Queue-Id: DC685503794
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-61023-lists,linux-media=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_CC(0.00)[vger.kernel.org,lists.sr.ht,gmail.com,oss.qualcomm.com];
	FREEMAIL_FROM(0.00)[gmail.com];
	RCPT_COUNT_TWELVE(0.00)[22];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[xerikasxx@gmail.com,linux-media@vger.kernel.org];
	DKIM_TRACE(0.00)[gmail.com:+];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-media,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[apitzsch.eu:email,0.0.0.30:email,qualcomm.com:email,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]
X-Rspamd-Action: no action

From: André Apitzsch <git@apitzsch.eu>

Add msm8939 configuration data and related compatible.

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Signed-off-by: André Apitzsch <git@apitzsch.eu>
Reviewed-by: Bryan O'Donoghue <bod@kernel.org>
Signed-off-by: Erikas Bitovtas <xerikasxx@gmail.com>
---
 drivers/media/platform/qcom/venus/core.c | 41 ++++++++++++++++++++++++++++++++
 1 file changed, 41 insertions(+)

diff --git a/drivers/media/platform/qcom/venus/core.c b/drivers/media/platform/qcom/venus/core.c
index 7e639760c41d..6ad20d58dda2 100644
--- a/drivers/media/platform/qcom/venus/core.c
+++ b/drivers/media/platform/qcom/venus/core.c
@@ -688,6 +688,46 @@ static const struct venus_resources msm8916_res = {
 	.enc_nodename = "video-encoder",
 };
 
+static const struct freq_tbl msm8939_freq_table[] = {
+	{ 489600, 266670000 },	/* 1080p @ 60 */
+	{ 244800, 133330000 },	/* 1080p @ 30 */
+	{ 244800, 200000000 },	/* 1080p @ 30 */
+	{ 220800, 133330000 },	/* 720p @ 60 */
+	{ 108000, 133330000 },	/* 720p @ 30 */
+	{ 108000, 200000000 },	/* 720p @ 30 */
+	{ 72000, 133330000 },	/* VGA @ 60 */
+	{ 36000, 133330000 },	/* VGA @ 30 */
+};
+
+static const struct reg_val msm8939_reg_preset[] = {
+	{ 0xe0020, 0x0aaaaaaa },
+	{ 0xe0024, 0x0aaaaaaa },
+	{ 0x80124, 0x00000003 },
+};
+
+static const struct venus_resources msm8939_res = {
+	.freq_tbl = msm8939_freq_table,
+	.freq_tbl_size = ARRAY_SIZE(msm8939_freq_table),
+	.reg_tbl = msm8939_reg_preset,
+	.reg_tbl_size = ARRAY_SIZE(msm8939_reg_preset),
+	.clks = { "core", "iface", "bus", },
+	.clks_num = 3,
+	.vcodec0_clks = { "vcodec0_core", "vcodec1_core" },
+	.vcodec1_clks = { "vcodec0_core", "vcodec1_core" },
+	.vcodec_clks_num = 2,
+	.vcodec_pmdomains = (const char *[]) { "venus", "vcodec0", "vcodec1" },
+	.vcodec_pmdomains_num = 3,
+	.max_load = 489600, /* 1080p@30 + 1080p@30 */
+	.hfi_version = HFI_VERSION_1XX,
+	.vmem_id = VIDC_RESOURCE_NONE,
+	.vmem_size = 0,
+	.vmem_addr = 0,
+	.dma_mask = 0xddc00000 - 1,
+	.fwname = "qcom/venus-1.8/venus.mbn",
+	.dec_nodename = "video-decoder",
+	.enc_nodename = "video-encoder",
+};
+
 static const struct freq_tbl msm8996_freq_table[] = {
 	{ 1944000, 520000000 },	/* 4k UHD @ 60 (decode only) */
 	{  972000, 520000000 },	/* 4k UHD @ 30 */
@@ -1121,6 +1161,7 @@ static const struct venus_resources qcm2290_res = {
 
 static const struct of_device_id venus_dt_match[] = {
 	{ .compatible = "qcom,msm8916-venus", .data = &msm8916_res, },
+	{ .compatible = "qcom,msm8939-venus", .data = &msm8939_res, },
 	{ .compatible = "qcom,msm8996-venus", .data = &msm8996_res, },
 	{ .compatible = "qcom,msm8998-venus", .data = &msm8998_res, },
 	{ .compatible = "qcom,qcm2290-venus", .data = &qcm2290_res, },

-- 
2.54.0


