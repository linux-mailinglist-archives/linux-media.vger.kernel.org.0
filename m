Return-Path: <linux-media+bounces-59603-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id WF4hCpkI7WkEegAAu9opvQ
	(envelope-from <linux-media+bounces-59603-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Sat, 25 Apr 2026 20:31:53 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 9249F467479
	for <lists+linux-media@lfdr.de>; Sat, 25 Apr 2026 20:31:52 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 6F7D5301944E
	for <lists+linux-media@lfdr.de>; Sat, 25 Apr 2026 18:31:31 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3F3E5377EA5;
	Sat, 25 Apr 2026 18:31:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="VT/Ort+4"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com [209.85.128.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DBCF3374E67
	for <linux-media@vger.kernel.org>; Sat, 25 Apr 2026 18:31:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777141889; cv=none; b=bJQhKD2n50X+Pu9GfcvjrHJR35e4uVL8ueaylgjc2pH/BkPEoMjGkcdf6L9MQGQi44BG6S7aXvR3tYdJGbiWDUanrW6f41WJ3Lp7gwjCvtxXGdqii5PXaArcEUiklSKcucehNB5luQHX8H5K6JehTfdW0RbEcJZRgolTStBT+ok=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777141889; c=relaxed/simple;
	bh=LpD6bSQrYC1BjamcEs0u6YsU6tL9lz8IAu4zl3kOQh0=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Kc903AFVM0OJsYFdpVj0S2FCcX6fUj9E0xmpgenBIFsC8AnhCgfQqrrQ5SRi2t31WhmJsSNWtI/C3tMnPbFLO7tIGoSbh6JGTFsDAt22pudephAqZcUzTMAyAEqDWbxyum6ObNFjtiQUzOedT4y6jmM0mMhuOGz8OCDZO3XCoP0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=VT/Ort+4; arc=none smtp.client-ip=209.85.128.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wm1-f41.google.com with SMTP id 5b1f17b1804b1-4852b81c73aso73517575e9.3
        for <linux-media@vger.kernel.org>; Sat, 25 Apr 2026 11:31:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1777141883; x=1777746683; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=7V1onxXfVBoDwpXP39VrgYBBMWRu3J4MOQfpF7jti6U=;
        b=VT/Ort+4laCNJMTw5benZ6n/d+RPfiSGNaYXD/bX5Uke3ikX01/1DVc5RRLXIT/K1X
         PKXyvlM9nV/YHMNFBqhWcE0r4vPViI3JorCg4XeM2V3Uek2sM/rRcoOnFtxn4ZwyzmJA
         b9p6c4KTW63E0zKVadJdNAb8FBx/OYAWqOWLsacIkPLUy0i0xHbQ6UqCYcYBRzZEZgts
         2CgOQ8IXOeClzB6Edeh9K5DAF7zHgHMpEq9Tah14wYHtpOtvkoEg3Uo8RIcZJ2tVkM/P
         GzklJ6LjDHiQrHK/E7xa7Rm6GgCnOfmufK85hxdRtyjO0Q+JExhj5f7HBWGPqny32Jcq
         oykQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777141883; x=1777746683;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=7V1onxXfVBoDwpXP39VrgYBBMWRu3J4MOQfpF7jti6U=;
        b=ct3AJJpR9rAgrLl5RmpxQtE6Gc3/D4fwxkmYYM8n8xWgEGESRMTrctMsU/rNqp0KBK
         qMyT4MIIqwkaJVrWx4bwVggPwmCMNJzguPXJhKHU7+efpvqCU4EVShz62GgLp8J8f6Jq
         3js/Z4sYVzI4eMg7OIrsdeTM/4vezWRbDX8by366jLstvmF4m47kNEBjVul9g7Ju9feq
         txEUBxMTx7t+Lu8TMcNMzjtpzx2/VmxrOSGfXGFtD8oYl9BDHSmE/Ks8z1mqY4X3giqj
         pyJ98vbLxrZd1Bei856a/9Wj2Ku5MZmLM8VG02lMPWFLmkrHX/eqKzoIXVGnzg3jc3OJ
         sIdQ==
X-Gm-Message-State: AOJu0Yx7Z7A5t7FxA5jajARz0LBjuauIuu2leZm28gpXrWkYa3/t6cH6
	jdhm0rFCyyFStFpLct9ND5oy2Bkm5ac/P+O/JasoooAGalOOOtM+jmR7
X-Gm-Gg: AeBDiesvbvb+XjTeu8FxCzo/M20HTOVf5YpRFAfDt9uhomxavKdLLmmlfXBZRV53HWM
	Eds6LGmLSdqGYiIfr4gMew2Gvvu+Hy/GmxmYzz1JS6G3Exh8AjZ4lOMIkDSsRbYsmHi/lnTQ6N5
	wz0VReLtQSFdiPLQX2pw2RRUxG4ehEPQqVlka/cbqZqr9JYZ2s/CNha4sdEUOWbXSv6xmCR1Jnh
	7QbF489pcwEn8nBWPNeJddHDr1FLfMhi/43bTbyJQxK7sKVN1v2YaIUmBzAB6eGndZaknxHD8YI
	NtgP8G0OC0TZlbDvMIhMIqhTh45h70Wew7TALkeJ9gb19fcKno4794k6JaGXvDFx1m0rdeLyegO
	LzrePQHDrf9Sea6jMuRv8jOhqUxI2nzFXgVeypbnX/RzjeBQNj7G+01Er6+yOv9C7Yc9cqg8+mc
	sD4B32u9dNDxAlXHe9e86Exxn33CtECwYrQFY=
X-Received: by 2002:a05:600c:33a6:b0:489:1c1f:35f9 with SMTP id 5b1f17b1804b1-4891c1f38b6mr230516585e9.9.1777141883035;
        Sat, 25 Apr 2026 11:31:23 -0700 (PDT)
Received: from [192.168.8.79] ([2a00:f502:260:fa4:a26c:adcb:8da8:3])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4899dc95920sm133613675e9.6.2026.04.25.11.31.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 25 Apr 2026 11:31:22 -0700 (PDT)
From: Erikas Bitovtas <xerikasxx@gmail.com>
Date: Sat, 25 Apr 2026 21:31:04 +0300
Subject: [PATCH RFC v2 03/11] media: qcom: venus: Add msm8939 resource
 struct
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20260425-msm8939-venus-rfc-v2-3-f69e52b36207@gmail.com>
References: <20260425-msm8939-venus-rfc-v2-0-f69e52b36207@gmail.com>
In-Reply-To: <20260425-msm8939-venus-rfc-v2-0-f69e52b36207@gmail.com>
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
X-Rspamd-Queue-Id: 9249F467479
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-59603-lists,linux-media=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_CC(0.00)[vger.kernel.org,lists.sr.ht,gmail.com,oss.qualcomm.com];
	FREEMAIL_FROM(0.00)[gmail.com];
	RCPT_COUNT_TWELVE(0.00)[21];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[apitzsch.eu:email,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,qualcomm.com:email,0.0.0.30:email]

From: André Apitzsch <git@apitzsch.eu>

Add msm8939 configuration data and related compatible.

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Signed-off-by: André Apitzsch <git@apitzsch.eu>
Signed-off-by: Erikas Bitovtas <xerikasxx@gmail.com>
---
 drivers/media/platform/qcom/venus/core.c | 40 ++++++++++++++++++++++++++++++++
 1 file changed, 40 insertions(+)

diff --git a/drivers/media/platform/qcom/venus/core.c b/drivers/media/platform/qcom/venus/core.c
index 7e639760c41d..ebe166b5c955 100644
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
+	.enc_nodename = "video-encoder",
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


