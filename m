Return-Path: <linux-media+bounces-10367-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id D6DE08B5EE0
	for <lists+linux-media@lfdr.de>; Mon, 29 Apr 2024 18:22:10 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id DE89CB22C3B
	for <lists+linux-media@lfdr.de>; Mon, 29 Apr 2024 16:22:07 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9AD148624B;
	Mon, 29 Apr 2024 16:21:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=freebox-fr.20230601.gappssmtp.com header.i=@freebox-fr.20230601.gappssmtp.com header.b="ccJtUqTw"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-lj1-f169.google.com (mail-lj1-f169.google.com [209.85.208.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 287AD8529C
	for <linux-media@vger.kernel.org>; Mon, 29 Apr 2024 16:21:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1714407679; cv=none; b=MTkHh6+LoIx76B8HY3d9w7VjgTnLAScPF3CLKGztGsZGHiODyeSfi6gBrnRKkyAiJA9g5zeH3yu7OQAF+Q+e5gjwHvcmmosew2CunDQ9XIJxviKWIMTeV+GEjst3OZLSU+TOyiyNu09zI+uABzqmjkCdIwVatBm4XEOvO6YLEak=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1714407679; c=relaxed/simple;
	bh=f09XPEMd1cpgM+0G/Mmk2IfLd3rZXQ6Qse5lUXfMQt8=;
	h=Message-ID:Date:MIME-Version:Subject:From:To:Cc:References:
	 In-Reply-To:Content-Type; b=YnV5dHAjZ4r5Zn2frkrCErV9uo04i7YlxStxc1tYDxlFtL9yX3SwO2cB4JV0gqmhmVXQrfR17hOShbtPxaqdakHPHnacDP+vVkUOIEDJv2Pk50pdELRS3gtzhN3HfZT8sfAejAEcO2lht09vs6miXMNIdmD8YiuiqeqBvwUXQiY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=freebox.fr; spf=pass smtp.mailfrom=freebox.fr; dkim=pass (2048-bit key) header.d=freebox-fr.20230601.gappssmtp.com header.i=@freebox-fr.20230601.gappssmtp.com header.b=ccJtUqTw; arc=none smtp.client-ip=209.85.208.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=freebox.fr
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=freebox.fr
Received: by mail-lj1-f169.google.com with SMTP id 38308e7fff4ca-2e0a2870bceso13452311fa.2
        for <linux-media@vger.kernel.org>; Mon, 29 Apr 2024 09:21:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=freebox-fr.20230601.gappssmtp.com; s=20230601; t=1714407675; x=1715012475; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:content-language:references
         :cc:to:from:subject:user-agent:mime-version:date:message-id:from:to
         :cc:subject:date:message-id:reply-to;
        bh=g8N15hk2cj73KP+gQB9y1hbe0Q0mU9PexGJT9++xN1o=;
        b=ccJtUqTwAvl/PzWKOs/c1sCeGhSYRM/LI7Qj/RuyjK2mMoMq3b0p+Kw5XvEvb8I/de
         +cuNrXX/HC5nlqll7PO4vSOhU3acPwTU0wg7x65Q51Nj8Bnp4SO1u4fKSnAhDImmHgY8
         BAeUcW3gsVwlG7kyNxY0447Uh6MHVLvr4I1EHlmAuwSuCla24MS9BppZktzVuLs4qkL/
         kYLpOX9/zIvgKkjPJLdYl2mAOyL1H0u4NALHCPFj8GkqPgj+ja+EgXkC68Sc5IwQF7dO
         DzRA0rvHhyBX9dD496iXn/o1y5lASSueMjT5tPGhaUpkxouJyn6z7/KH3oy/91CRW6Bp
         zjrw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1714407675; x=1715012475;
        h=content-transfer-encoding:in-reply-to:content-language:references
         :cc:to:from:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=g8N15hk2cj73KP+gQB9y1hbe0Q0mU9PexGJT9++xN1o=;
        b=wogV4WQzKc23SD9irE8CPtPsSDpENQuxoVwLzWOT4DF/79dcSZykRKrO1RB+zvmRwl
         fbTZpAU7cW3iiLUr5TlFLNmsXe711NWD2yqTdlX/Vb5/ElWrxfYwMh4LwfXWdKuf+aXg
         /w1R+fiGPLwuASgXtbqrVhaMGY5Q+uwHCMdXCKKEmFSBgRMo7ugqbw0eo7OGk7KkNCef
         rO5HhfXmCp9S/13pMNTt4EQuAVjVddEasRUJ9zS12B8gGaoPGqwzF7wXGy1eBDEOjbQ6
         hJqMNJQdS98+kC8004IbEZIfTjf5IHnN0fluZjDoYo8zbQJUCl1gNk5YDU7TcAEmkLNp
         s7Mw==
X-Forwarded-Encrypted: i=1; AJvYcCVU7dqEWTQWocq8XqUFuw/6r3oEgyJqvBKj+S1enYQId1UcTs47/fkWKdA+7mQHV2Rd0Sy6YGWM/LnJBApAMqUFPapOeD7S+dOmRBQ=
X-Gm-Message-State: AOJu0Yzx4wdApYLGS9gLB1y0QEpiLgYC9Gte16bj21tavmGpl1GakOxL
	M+3OIDmOHvC96QvgBK80NCySSVG/PqcaALROkhUzU1MnnUEShzLqIl9Ll4NXxFE=
X-Google-Smtp-Source: AGHT+IE4TOW4UjIewweRE0HIrulhSqoUwGIv3MAML2KPrKAxT78+lJT31zNYlcM2Hzb+lFfQd/FvSA==
X-Received: by 2002:a2e:9497:0:b0:2da:736d:3cf5 with SMTP id c23-20020a2e9497000000b002da736d3cf5mr5229286ljh.41.1714407675418;
        Mon, 29 Apr 2024 09:21:15 -0700 (PDT)
Received: from [192.168.108.81] (freebox.vlq16.iliad.fr. [213.36.7.13])
        by smtp.gmail.com with ESMTPSA id t20-20020a05600c199400b0041c012ca327sm7469761wmq.45.2024.04.29.09.21.15
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 29 Apr 2024 09:21:15 -0700 (PDT)
Message-ID: <31072144-8880-483f-880b-8c8ca73b2003@freebox.fr>
Date: Mon, 29 Apr 2024 18:19:27 +0200
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: [PATCH v1 3/3] media: venus: add MSM8998 support
From: Marc Gonzalez <mgonzalez@freebox.fr>
To: Bjorn Andersson <andersson@kernel.org>,
 Jeffrey Hugo <quic_jhugo@quicinc.com>,
 Konrad Dybcio <konrad.dybcio@linaro.org>,
 Stanimir Varbanov <stanimir.k.varbanov@gmail.com>,
 Vikash Garodia <quic_vgarodia@quicinc.com>,
 Bryan O Donoghue <bryan.odonoghue@linaro.org>
Cc: MSM <linux-arm-msm@vger.kernel.org>,
 linux-media <linux-media@vger.kernel.org>, DT <devicetree@vger.kernel.org>,
 Pierre-Hugues Husson <phhusson@freebox.fr>, Arnaud Vrac <avrac@freebox.fr>,
 Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Conor Dooley <conor+dt@kernel.org>
References: <2b21b160-a530-486a-9404-c5bf8863ffed@freebox.fr>
Content-Language: en-US
In-Reply-To: <2b21b160-a530-486a-9404-c5bf8863ffed@freebox.fr>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

From: Pierre-Hugues Husson <phhusson@freebox.fr>

Add the missing bits for MSM8998 support.

Signed-off-by: Pierre-Hugues Husson <phhusson@freebox.fr>
Signed-off-by: Marc Gonzalez <mgonzalez@freebox.fr>
---
 drivers/media/platform/qcom/venus/core.c | 42 ++++++++++++++++++++++++++++++++++++++++++
 1 file changed, 42 insertions(+)

diff --git a/drivers/media/platform/qcom/venus/core.c b/drivers/media/platform/qcom/venus/core.c
index ce206b7097541..42e0c580e093d 100644
--- a/drivers/media/platform/qcom/venus/core.c
+++ b/drivers/media/platform/qcom/venus/core.c
@@ -587,6 +587,47 @@ static const struct venus_resources msm8996_res = {
 	.fwname = "qcom/venus-4.2/venus.mbn",
 };
 
+static const struct freq_tbl msm8998_freq_table[] = {
+	{ 1944000, 520000000 },	/* 4k UHD @ 60 (decode only) */
+	{  972000, 520000000 },	/* 4k UHD @ 30 */
+	{  489600, 346666667 },	/* 1080p @ 60 */
+	{  244800, 150000000 },	/* 1080p @ 30 */
+	{  108000,  75000000 },	/* 720p @ 30 */
+};
+
+/*
+ * https://git.codelinaro.org/clo/la/kernel/msm-4.4/-/blob/caf_migration/kernel.lnx.4.4.r38-rel/arch/arm/boot/dts/qcom/msm8998-vidc.dtsi
+ */
+static const struct reg_val msm8998_reg_preset[] = {
+	{ 0x80124, 0x00000003 },
+	{ 0x80550, 0x01111111 },
+	{ 0x80560, 0x01111111 },
+	{ 0x80568, 0x01111111 },
+	{ 0x80570, 0x01111111 },
+	{ 0x80580, 0x01111111 },
+	{ 0x80588, 0x01111111 },
+	{ 0xe2010, 0x00000000 },
+};
+
+static const struct venus_resources msm8998_res = {
+	.freq_tbl = msm8998_freq_table,
+	.freq_tbl_size = ARRAY_SIZE(msm8998_freq_table),
+	.reg_tbl = msm8998_reg_preset,
+	.reg_tbl_size = ARRAY_SIZE(msm8998_reg_preset),
+	.clks = { "core", "iface", "bus", "mbus" },
+	.clks_num = 4,
+	.vcodec0_clks = { "core" },
+	.vcodec1_clks = { "core" },
+	.vcodec_clks_num = 1,
+	.max_load = 2563200,
+	.hfi_version = HFI_VERSION_3XX,
+	.vmem_id = VIDC_RESOURCE_NONE,
+	.vmem_size = 0,
+	.vmem_addr = 0,
+	.dma_mask = 0xddc00000 - 1,
+	.fwname = "qcom/venus-4.4/venus.mbn",
+};
+
 static const struct freq_tbl sdm660_freq_table[] = {
 	{ 979200, 518400000 },
 	{ 489600, 441600000 },
@@ -893,6 +934,7 @@ static const struct venus_resources sc7280_res = {
 static const struct of_device_id venus_dt_match[] = {
 	{ .compatible = "qcom,msm8916-venus", .data = &msm8916_res, },
 	{ .compatible = "qcom,msm8996-venus", .data = &msm8996_res, },
+	{ .compatible = "qcom,msm8998-venus", .data = &msm8998_res, },
 	{ .compatible = "qcom,sdm660-venus", .data = &sdm660_res, },
 	{ .compatible = "qcom,sdm845-venus", .data = &sdm845_res, },
 	{ .compatible = "qcom,sdm845-venus-v2", .data = &sdm845_res_v2, },
-- 
2.34.1


