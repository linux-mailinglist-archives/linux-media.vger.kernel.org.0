Return-Path: <linux-media+bounces-62796-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id gJTqI26jFWohXAcAu9opvQ
	(envelope-from <linux-media+bounces-62796-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Tue, 26 May 2026 15:43:10 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id E02615D6BC2
	for <lists+linux-media@lfdr.de>; Tue, 26 May 2026 15:43:09 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 7852A30985EB
	for <lists+linux-media@lfdr.de>; Tue, 26 May 2026 13:32:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 198073FBB56;
	Tue, 26 May 2026 13:31:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="MrZTYUmm"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com [209.85.128.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 45C003FB05D
	for <linux-media@vger.kernel.org>; Tue, 26 May 2026 13:31:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779802311; cv=none; b=jHrA/Kaeet+THt/1oZ2VfzrU2V7hu52jzsKTScxAabcPYRu9y70U5Z2/RxQSTodSDOdSODDZNstuCtjYcJ0MurI+5ML2FXyvBkECP5d3+KMQVZXEUlp37aJqn0aQ/jlO1lO6wnl3NdTmfbvhFX3KamVGD0Q6OUsAe3CgOwZ7QkA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779802311; c=relaxed/simple;
	bh=DevLhieZ2Jb0JoG3u3mXqGfpLCKqdiC/50tm4MHf7SM=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=MR/Ylbs5N6t6vMkZPp3eSUqtdKUG4v0AnB37VJ35B06HURLiX8osjgZno1wmjZ6cjM8Im3qp27LGmvvCDjZbZ5sr4gryMh2on74ZxeQBYJim61M454LLVvPV77dVT5gfWhsK1hP6/vbYFk5TBP+OX3qc09UQ6kRzpe2O0csRm/A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=MrZTYUmm; arc=none smtp.client-ip=209.85.128.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wm1-f53.google.com with SMTP id 5b1f17b1804b1-49068493267so15156815e9.1
        for <linux-media@vger.kernel.org>; Tue, 26 May 2026 06:31:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1779802302; x=1780407102; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=TcbIlr1puve+xrm8T0Jkr/obWl/FvkGIhLR+4PXKcyc=;
        b=MrZTYUmmg9/KQcCudWc1YnxidIPEaKqKlH+V11h9z2R80GGaxsHtIgfNM1fSm1zZOW
         7dxaiW4b9pfXsh/Wk2+8Ecx3nGkuALUFkshw9DaMqurjBDI6swKk1WRtTOLmshHvZ0ju
         OIGM+a82zpyh0E6I/rfi8sOCroFdvY4t+HMt+6fhWmlcsExqXXnd9Q2wOEGF39GUCtmA
         yypR7IrJs2KBmO4LjJfbNuVwoz1QeYXgF1kYJ1rj+Po/qYWMAT7AKUCEfIdoYdHzFVlb
         Jluluw+XR/FUXlgoqUmDt5Pg7bNWUjP5mVgsUA/4ZSgsz/xQFQF1rrlzUCr13anqR0sQ
         Nv4g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779802302; x=1780407102;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=TcbIlr1puve+xrm8T0Jkr/obWl/FvkGIhLR+4PXKcyc=;
        b=B9wmklkzUKqVYItZJE1lgto6u6tVxoz0KnGBxOeeP+uNa3/j++M6iKkyQViLoOu3BV
         OTwybb5BmDgE/qmBEJq2YvXo/6jHuD8xEYOsr5wAU1FsRhzPkXFobJ7XTvUbiTAjF+q4
         xJS/ZC6tvXGdG5hRKYIc5NT58ii30KPgadGZ8x7sbHPGxMfBn+hU6S9xGNl28ranc/W2
         xqGrGf/vOrL1177OfOBcDb1IlHzORWLsa+/slF+ONc4K+eMgxmuJhI1a0HwcK0g+Ip71
         5AEJ55YA26BV/G4N/thVeNITNRQiarp6wjJRfzrgX5wEIqZwuA1scC9PRErndt3/2mf4
         OMGQ==
X-Gm-Message-State: AOJu0YzA3XYoe2kaJI4Z6fUo7ucbdBs/BbuicryNBxikQDWtdqNxci2T
	g3pgATVBFX8sxpaiyew/xazJz1AltS2olmA0KZ3yZRKWO60C/UaQ626e
X-Gm-Gg: Acq92OFWSfcbX7sUbrdfxIJe3WXNwZxf9BQg7wzo7NL0SaaAG1bi6Wcz3l6OEZQCerS
	sDBg21XhKpjcGPOnAqZXmyXfhreGRC99j7DzGW0mZytZxTlTiioErsC19dV7hN8SZoF3qHsy+pF
	PjRWoaV0jaqYXacdJtkyb60kYOAWDVMp+WAPV0OrHiO5KvFwl91Lsy1mtFsQRVU67yaLUhL283X
	3NcoL8wEaewfHHJ5LDJaXrikPMgqx/Spn+bdHmwdzxoZU4tiUKlong6DAnPITgPVz1Yi5eNEQpE
	pOUE+WC1RJhC4Oo1bpNl4SGXvUvA7c1nlR4esF8jbV1xUmxuAxw8vI0o+C9bNBxuYffqm8lCCkZ
	I4yUignJ0bny1WagtH4ZbxYXymcuH9ydlIELUpa/hl4lAfm4ocHSpRg12EcIScJ5JbLusvQcVYo
	YZv5UzuvTQQaiRsBsDSBu50nlNiw==
X-Received: by 2002:a05:600c:84ce:b0:48e:6db3:ff2e with SMTP id 5b1f17b1804b1-490426aba7fmr175000465e9.15.1779802301797;
        Tue, 26 May 2026 06:31:41 -0700 (PDT)
Received: from [192.168.0.39] ([79.133.247.80])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-490452580dfsm170958895e9.1.2026.05.26.06.31.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 26 May 2026 06:31:41 -0700 (PDT)
From: Erikas Bitovtas <xerikasxx@gmail.com>
Date: Tue, 26 May 2026 16:24:28 +0300
Subject: [PATCH v9 5/8] media: qcom: venus: Add msm8939 resource struct
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20260526-msm8939-venus-rfc-v9-5-bb1069f3fe02@gmail.com>
References: <20260526-msm8939-venus-rfc-v9-0-bb1069f3fe02@gmail.com>
In-Reply-To: <20260526-msm8939-venus-rfc-v9-0-bb1069f3fe02@gmail.com>
To: Bryan O'Donoghue <bod@kernel.org>, 
 Vikash Garodia <vikash.garodia@oss.qualcomm.com>, 
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
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-62796-lists,linux-media=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_CC(0.00)[vger.kernel.org,lists.sr.ht,gmail.com,oss.qualcomm.com];
	FREEMAIL_FROM(0.00)[gmail.com];
	RCPT_COUNT_TWELVE(0.00)[21];
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,apitzsch.eu:email,qualcomm.com:email,0.0.0.30:email]
X-Rspamd-Queue-Id: E02615D6BC2
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

From: André Apitzsch <git@apitzsch.eu>

Add msm8939 configuration data and related compatible.

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Reviewed-by: Bryan O'Donoghue <bod@kernel.org>
Signed-off-by: André Apitzsch <git@apitzsch.eu>
Signed-off-by: Erikas Bitovtas <xerikasxx@gmail.com>
---
 drivers/media/platform/qcom/venus/core.c | 40 ++++++++++++++++++++++++++++++++
 1 file changed, 40 insertions(+)

diff --git a/drivers/media/platform/qcom/venus/core.c b/drivers/media/platform/qcom/venus/core.c
index bd88e2b484a5..243e342b0ae7 100644
--- a/drivers/media/platform/qcom/venus/core.c
+++ b/drivers/media/platform/qcom/venus/core.c
@@ -693,6 +693,45 @@ static const struct venus_resources msm8916_res = {
 	.enc_nodename = "video-encoder",
 };
 
+static const struct freq_tbl msm8939_freq_table[] = {
+	{ 489600, 266670000 },	/* 1080p @ 60 */
+	{ 244800, 133330000 },	/* 1080p @ 30 */
+	{ 220800, 133330000 },	/* 720p @ 60 */
+	{ 108000, 133330000 },	/* 720p @ 30 */
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
+	.vcodec_clks = { "vcodec0_core", "vcodec1_core" },
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
+	.dec_codec_blacklist = HFI_VIDEO_CODEC_SPARK,
+	.enc_codec_blacklist = HFI_VIDEO_CODEC_HEVC,
+	.dec_nodename = "video-decoder",
+	.enc_nodename = "video-encoder",
+};
+
 static const struct freq_tbl msm8996_freq_table[] = {
 	{ 1944000, 520000000 },	/* 4k UHD @ 60 (decode only) */
 	{  972000, 520000000 },	/* 4k UHD @ 30 */
@@ -1133,6 +1172,7 @@ static const struct venus_resources qcm2290_res = {
 
 static const struct of_device_id venus_dt_match[] = {
 	{ .compatible = "qcom,msm8916-venus", .data = &msm8916_res, },
+	{ .compatible = "qcom,msm8939-venus", .data = &msm8939_res, },
 	{ .compatible = "qcom,msm8996-venus", .data = &msm8996_res, },
 	{ .compatible = "qcom,msm8998-venus", .data = &msm8998_res, },
 	{ .compatible = "qcom,qcm2290-venus", .data = &qcm2290_res, },

-- 
2.54.0


