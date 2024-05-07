Return-Path: <linux-media+bounces-10973-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 31DC08BDE46
	for <lists+linux-media@lfdr.de>; Tue,  7 May 2024 11:31:44 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 551DA1C2213B
	for <lists+linux-media@lfdr.de>; Tue,  7 May 2024 09:31:43 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 05F7B14EC4B;
	Tue,  7 May 2024 09:31:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=freebox-fr.20230601.gappssmtp.com header.i=@freebox-fr.20230601.gappssmtp.com header.b="SsMsIuJX"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-lf1-f43.google.com (mail-lf1-f43.google.com [209.85.167.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AE6DA14E2C5
	for <linux-media@vger.kernel.org>; Tue,  7 May 2024 09:31:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1715074289; cv=none; b=SCLSqXR4JzuEnzTu7DHjNT7j7GSVeu6eH5GNvxlCF7dMYp4ModeCMtxHbTJ23aFa8CCf6fEul+nwfWrFBZDlSNYQ4Lbq2w5mXfQwXFC8iWgLDnA4t6DCGfZ6op4XBFivHbtC10kvitiU3jyvcaODM0FlWuwfwRqeLDNL+lk2H8c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1715074289; c=relaxed/simple;
	bh=m8CJb3SPjBevNO6revkMax575fM40oA2Ye3pZYO7emQ=;
	h=Message-ID:Date:MIME-Version:Subject:From:To:Cc:References:
	 In-Reply-To:Content-Type; b=Ek5REmZUq7cStVYAgU+fuDCJvI3qH/VAU0k62tliGOqZMp+gGJQ6lnJ774c0IZUfNExSf2B0WgCbHh1Nl5ePx7kp1eeECgZvoqffZFzEN+5gk9Kfce+wYCe6UzMcfU+/kOOGE8bo98FEepSlyqtqr5V+NGNAhs4b0QA/wrPcfEM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=freebox.fr; spf=pass smtp.mailfrom=freebox.fr; dkim=pass (2048-bit key) header.d=freebox-fr.20230601.gappssmtp.com header.i=@freebox-fr.20230601.gappssmtp.com header.b=SsMsIuJX; arc=none smtp.client-ip=209.85.167.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=freebox.fr
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=freebox.fr
Received: by mail-lf1-f43.google.com with SMTP id 2adb3069b0e04-51f1bf83f06so3537058e87.1
        for <linux-media@vger.kernel.org>; Tue, 07 May 2024 02:31:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=freebox-fr.20230601.gappssmtp.com; s=20230601; t=1715074280; x=1715679080; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:content-language:references
         :cc:to:from:subject:user-agent:mime-version:date:message-id:from:to
         :cc:subject:date:message-id:reply-to;
        bh=5AOYNrstidsMwkuCqD1NJg/W8IphbTWRSU868Li9K8s=;
        b=SsMsIuJXlJsEYgTwNKE/wYU17btzHe9r1Dxfb0qqT7KtV3l+4vWwizfLUlhpBoau72
         OjfaTzkm9MFF+XWufMwOa67KRX/ywLJjaNYLngLW7BlFaUmxRrMms2EcgVDgpDQWQCpo
         50a5CKjfKpGnH02AGInDnrkSyUf7LVq5/I/pWTE6YNH1D3LEdWu0x8m9IaJhlwnqb05w
         pcbwoeUgaVAmIwxwOVy0ZdKldyUCxsuZc/9nU9UhQT9BuOlyVqoqLFj8rgUn3ArleOpg
         Oh0p/XY3T8HcIox1xoXPBHoRdl0hpNRR8rCe8khvikETMutnWsBxE/CYHnwDilrsUjYJ
         Gf5w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1715074280; x=1715679080;
        h=content-transfer-encoding:in-reply-to:content-language:references
         :cc:to:from:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=5AOYNrstidsMwkuCqD1NJg/W8IphbTWRSU868Li9K8s=;
        b=BJLOM5Ww0qGBot+D3OR9Z3nA/JTqINcJdvTTnhLusjPaECAqbT4BEsN4kIjzdr0YYx
         m7Rg8cNsjTzEqh2c/dE0gRV0OPjwmOGfQn6I0fGApiWx7w8uRSsZ7O5/dEPJN9nwa5Vu
         Na2+4cWsJeG10mNTkysXvF1L44MvF4Acd26TwgD1A9lTwr7uJcCIVPvaliEXfNEpVQQQ
         eNJQxJqSjbq8BW+rYwBdz5p5TI0zb7KxKaOYi8qLjMzEkJluEZ+2squtdswiyMgFlgsb
         YRiIkgOmZR8rbgvPA6zFFjrbcm+UcdhEYLeCMCwwM1RsQebGFNIL70Gy7ZRWSaJEsOIs
         3VGA==
X-Forwarded-Encrypted: i=1; AJvYcCUV4ijO+cVLh5Bdl6DjtV7ZaUI/xgnKTczs34v3eB6P14ioXM8DpfBs5Sbk6i8OwbkHEtgOr6wbG8x1j+XS6ItJqbPjYn+W1SFJuqs=
X-Gm-Message-State: AOJu0Yz5TbWNiFzbbTI84UCyHdgqNlsxtqqbGyLZ6gmoFuEsaT61Gy7K
	N8xlMz8hdhK6W+pfqlbyvnuHTB+cpgn9Mp9AMde8nvZUcWl7SG0lyns0xIwzNGbaV+n/fQSmiMW
	I
X-Google-Smtp-Source: AGHT+IHUZLlmXsLgomTNPQ3kKEt2I9NW7E6TCcg7DuZg6C/VtUqmGuFjZozx3+25arCop7mtOGN88g==
X-Received: by 2002:a19:5210:0:b0:51f:5a66:adce with SMTP id m16-20020a195210000000b0051f5a66adcemr7705284lfb.14.1715074280368;
        Tue, 07 May 2024 02:31:20 -0700 (PDT)
Received: from [192.168.108.81] (freebox.vlq16.iliad.fr. [213.36.7.13])
        by smtp.gmail.com with ESMTPSA id f3-20020adfb603000000b0034dced2c5bdsm12517710wre.80.2024.05.07.02.31.19
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 07 May 2024 02:31:20 -0700 (PDT)
Message-ID: <6df495c5-db26-431d-8ce1-8263a2a12b2f@freebox.fr>
Date: Tue, 7 May 2024 11:30:11 +0200
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: [PATCH v4 3/3] media: venus: add msm8998 support
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
References: <1cf08b56-a247-431b-a24b-69f563f49240@freebox.fr>
Content-Language: en-US
In-Reply-To: <1cf08b56-a247-431b-a24b-69f563f49240@freebox.fr>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

From: Pierre-Hugues Husson <phhusson@freebox.fr>

Add the missing bits for msm8998 support.

Downstream vendor code for reference:

https://git.codelinaro.org/clo/la/kernel/msm-4.4/-/blob/caf_migration/kernel.lnx.4.4.r38-rel/arch/arm/boot/dts/qcom/msm8998-vidc.dtsi#L42-53

qcom,load-freq-tbl =
	/* Encoders */
	<972000 465000000 0x55555555>, /* 4k UHD @ 30 */
	<489600 360000000 0x55555555>, /* 1080p @ 60 */
	<244800 186000000 0x55555555>, /* 1080p @ 30 */
	<108000 100000000 0x55555555>, /* 720p @ 30 */
	/* Decoders */
	<1944000 465000000 0xffffffff>, /* 4k UHD @ 60 */
	< 972000 360000000 0xffffffff>, /* 4k UHD @ 30 */
	< 489600 186000000 0xffffffff>, /* 1080p @ 60 */
	< 244800 100000000 0xffffffff>; /* 1080p @ 30 */

Reviewed-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Signed-off-by: Pierre-Hugues Husson <phhusson@freebox.fr>
Signed-off-by: Marc Gonzalez <mgonzalez@freebox.fr>
---
 drivers/media/platform/qcom/venus/core.c | 39 +++++++++++++++++++++++++++++++++++++++
 1 file changed, 39 insertions(+)

diff --git a/drivers/media/platform/qcom/venus/core.c b/drivers/media/platform/qcom/venus/core.c
index ce206b7097541..8b715cb7ab51a 100644
--- a/drivers/media/platform/qcom/venus/core.c
+++ b/drivers/media/platform/qcom/venus/core.c
@@ -587,6 +587,44 @@ static const struct venus_resources msm8996_res = {
 	.fwname = "qcom/venus-4.2/venus.mbn",
 };
 
+static const struct freq_tbl msm8998_freq_table[] = {
+	{ 1944000, 465000000 },	/* 4k UHD @ 60 (decode only) */
+	{  972000, 465000000 },	/* 4k UHD @ 30 */
+	{  489600, 360000000 },	/* 1080p @ 60 */
+	{  244800, 186000000 },	/* 1080p @ 30 */
+	{  108000, 100000000 },	/* 720p @ 30 */
+};
+
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
@@ -893,6 +931,7 @@ static const struct venus_resources sc7280_res = {
 static const struct of_device_id venus_dt_match[] = {
 	{ .compatible = "qcom,msm8916-venus", .data = &msm8916_res, },
 	{ .compatible = "qcom,msm8996-venus", .data = &msm8996_res, },
+	{ .compatible = "qcom,msm8998-venus", .data = &msm8998_res, },
 	{ .compatible = "qcom,sdm660-venus", .data = &sdm660_res, },
 	{ .compatible = "qcom,sdm845-venus", .data = &sdm845_res, },
 	{ .compatible = "qcom,sdm845-venus-v2", .data = &sdm845_res_v2, },
-- 
2.34.1


