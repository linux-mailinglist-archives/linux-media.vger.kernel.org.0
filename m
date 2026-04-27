Return-Path: <linux-media+bounces-59707-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id IGPnDfil72mvDgEAu9opvQ
	(envelope-from <linux-media+bounces-59707-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Mon, 27 Apr 2026 20:07:52 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id D5CF3478364
	for <lists+linux-media@lfdr.de>; Mon, 27 Apr 2026 20:07:51 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 5D9793091783
	for <lists+linux-media@lfdr.de>; Mon, 27 Apr 2026 17:59:17 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 650F93E8C61;
	Mon, 27 Apr 2026 17:58:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="DTMVGQut"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-yw1-f170.google.com (mail-yw1-f170.google.com [209.85.128.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2C1683E9583
	for <linux-media@vger.kernel.org>; Mon, 27 Apr 2026 17:58:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777312735; cv=none; b=By9XQF8lQyQZ0CuGzThJPPKPRDDeYJEtLM9OGaw5Ud1xEC4efd/RYNG3V4KYraQeXfxQ9xLnXQRqHSgytnWjWJkzNXza9XbeTZqOJpFAixhfvptvCsD7uAQuVbRCV8nFSw7EvEOFNNLE3O6OhIPzb3DbIV21IG5ODoQXo+UY0dU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777312735; c=relaxed/simple;
	bh=Xk0UXmcYPkMiRcwlsWbLeKXkQX3Iku6FWRxA9QzJnOQ=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=lHXjnpQ1ps2+7wCfrSPy5VpM0pJaqp40lZ2OZaqYDFE4c8A4Ll0Tqfbq42A/Ed7BEZzK4z2eL8hOuhxkVyOkiCK9x6hiaU1VU2lL8rk7u8DfzPR25EuClNdYZ5DVm8EOg7lb3xDG4YwcIzdp5yiBwS/zC9Ej7iOLrrqCJCZVH9Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=DTMVGQut; arc=none smtp.client-ip=209.85.128.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-yw1-f170.google.com with SMTP id 00721157ae682-794719afcd4so110562877b3.1
        for <linux-media@vger.kernel.org>; Mon, 27 Apr 2026 10:58:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1777312733; x=1777917533; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=7NYYhGmqxRMsjsqtwuQ+VCWuB6ek7t/CJSP2hNZsrRY=;
        b=DTMVGQutX0e+Uycc81wJZ8KJJZfKb0l7zgVg0vmq0nUCmsFNxQUfMc0QxNERZc1Mie
         Emqi8/u4gt/qh1M+G1vE6HgHMWHPN89/sJckFhTE1/qPbLV1hg/CRiArAAZxbwF8y9wk
         q8vCq2kMwSpm3lGYYTnUmIFmYm39O4cQxWyQyIBUWIEVYNzoWDDRNPNYjdm0slfjdVyH
         QSL1WA7aXUv1OPs3Vfm5OnWItIO0ek6JoDO71XsbSfFke2uuhPsHF+fIVex9si9KDTA/
         o4VJ5SEV8cvAC2+G5EpcHos2iiMhzb6CXr8BOLVpCJy70zOFoPZ//1tKBQJqNdNR+CWQ
         1Gzg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777312733; x=1777917533;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=7NYYhGmqxRMsjsqtwuQ+VCWuB6ek7t/CJSP2hNZsrRY=;
        b=B1yYSmNfeGkPj/GV501yrZcYZqKPXXllBOcucdN1KbJfdopw4uccf7NI/0thc6gohK
         +GVe7OInF1kWV8kHiK+1vKED28+ziRRf7R1gX1UXCIBdNlLZpoUZr6RwhdemtwgwQBzk
         0o828RZXGYz0dMldsNEQcU2qMEPnM7QShHWr7eLmiI4ZKDyGTEHNr+mIi1jRhIwSK6uO
         DMyvuR/wsLkKBqApYcnMmRKLmva0voMk/0i5VXkjJCehNA4UhsRizedKJA4gF5Z6o2Vn
         0RvDjtP0qZdXm1Es8KacbjHjvGJse8piBYaF3zilx4HQcTeqk2hR7MmKtVPYbEdeOjBD
         Mctg==
X-Gm-Message-State: AOJu0YzusYjnW7ZBcVG3vBNmcALRuX33VpBFXeQ4aIJF2NFUaRKaq982
	K/gB7i68HDJbfNp2d2bmDRi4xxZo7YVc+ZzE+mQ+HNQjlWuYzhakI0Jb
X-Gm-Gg: AeBDiesbC39GbfKRxXD7i50K3PlViT0eLmCtKTg9wQC/sdv+h9NCkJ21TSbXL1n/qsA
	xh6Ost068ISzYLg5/tiVbmqPqmtBKYNhJcUjABXmnA55HWRjkRDmlxKJRsRvuC1cer9vXjrz2kB
	kNKUoSlbeCt4qprFZnDO3NPa+9+yeyx/XncrsHkOBwLrQFtYb3QknOqw/9km9ZlGVAyCTe13cJt
	B7KuMAxHWNnwKRcxzOZZXy3nK/M1F/+GYZ77/wGAeNhDEerfmlGZezoCuRNlYWOuiNQBo7Tlu6P
	17H3xcnG1kweY/aTqHjKycG1gteYy304w1OOvxw6qKX0tEQJFBLfmfqvWC1Qi0ex0yACtTNkMMK
	X5QKUFDH0gJsuKaOFxmCur6XliedLqIppmrUEmV7esUDbhHMhwh8QlejxO8QZwaBNKJamX9rNBz
	AVwtiMU5wQkji+YxA2rPp1l3LQrPiHVCrahE6L
X-Received: by 2002:a05:690c:9406:b0:7b2:dad2:5def with SMTP id 00721157ae682-7bcee02a83emr2560347b3.48.1777312733280;
        Mon, 27 Apr 2026 10:58:53 -0700 (PDT)
Received: from [192.168.0.39] ([79.133.247.80])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-7bcf05e9cf8sm198467b3.18.2026.04.27.10.58.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 27 Apr 2026 10:58:52 -0700 (PDT)
From: Erikas Bitovtas <xerikasxx@gmail.com>
Date: Mon, 27 Apr 2026 20:58:25 +0300
Subject: [PATCH RFC v3 03/11] media: qcom: venus: Add msm8939 resource
 struct
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20260427-msm8939-venus-rfc-v3-3-288195bb7917@gmail.com>
References: <20260427-msm8939-venus-rfc-v3-0-288195bb7917@gmail.com>
In-Reply-To: <20260427-msm8939-venus-rfc-v3-0-288195bb7917@gmail.com>
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
 Stephen Boyd <sboyd@kernel.org>
Cc: linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-clk@vger.kernel.org, ~postmarketos/upstreaming@lists.sr.ht, 
 phone-devel@vger.kernel.org, Erikas Bitovtas <xerikasxx@gmail.com>, 
 Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Rspamd-Queue-Id: D5CF3478364
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-59707-lists,linux-media=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_CC(0.00)[vger.kernel.org,lists.sr.ht,gmail.com,oss.qualcomm.com];
	FREEMAIL_FROM(0.00)[gmail.com];
	RCPT_COUNT_TWELVE(0.00)[21];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[apitzsch.eu:email,qualcomm.com:email,0.0.0.30:email,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]

From: André Apitzsch <git@apitzsch.eu>

Add msm8939 configuration data and related compatible.

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Signed-off-by: André Apitzsch <git@apitzsch.eu>
Signed-off-by: Erikas Bitovtas <xerikasxx@gmail.com>
---
 drivers/media/platform/qcom/venus/core.c | 40 ++++++++++++++++++++++++++++++++
 1 file changed, 40 insertions(+)

diff --git a/drivers/media/platform/qcom/venus/core.c b/drivers/media/platform/qcom/venus/core.c
index 7e639760c41d..5bd3ad21b366 100644
--- a/drivers/media/platform/qcom/venus/core.c
+++ b/drivers/media/platform/qcom/venus/core.c
@@ -688,6 +688,45 @@ static const struct venus_resources msm8916_res = {
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
+	.vcodec0_clks = { "core0", "core1" },
+	.vcodec1_clks = { "core0", "core1" },
+	.vcodec_clks_num = 2,
+	.vcodec0_pmdomains = (const char *[]) { "core0", "core1" },
+	.vcodec1_pmdomains = (const char *[]) { "core0", "core1" },
+	.vcodec_pmdomains_num = 2,
+	.max_load = 489600, /* 1080p@30 + 1080p@30 */
+	.hfi_version = HFI_VERSION_1XX,
+	.vmem_id = VIDC_RESOURCE_NONE,
+	.vmem_size = 0,
+	.vmem_addr = 0,
+	.dma_mask = 0xddc00000 - 1,
+	.fwname = "qcom/venus-1.8/venus.mbn",
+};
+
 static const struct freq_tbl msm8996_freq_table[] = {
 	{ 1944000, 520000000 },	/* 4k UHD @ 60 (decode only) */
 	{  972000, 520000000 },	/* 4k UHD @ 30 */
@@ -1121,6 +1160,7 @@ static const struct venus_resources qcm2290_res = {
 
 static const struct of_device_id venus_dt_match[] = {
 	{ .compatible = "qcom,msm8916-venus", .data = &msm8916_res, },
+	{ .compatible = "qcom,msm8939-venus", .data = &msm8939_res, },
 	{ .compatible = "qcom,msm8996-venus", .data = &msm8996_res, },
 	{ .compatible = "qcom,msm8998-venus", .data = &msm8998_res, },
 	{ .compatible = "qcom,qcm2290-venus", .data = &qcm2290_res, },

-- 
2.54.0


