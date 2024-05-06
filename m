Return-Path: <linux-media+bounces-10879-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 74A088BCF70
	for <lists+linux-media@lfdr.de>; Mon,  6 May 2024 15:48:56 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 994151C2135D
	for <lists+linux-media@lfdr.de>; Mon,  6 May 2024 13:48:55 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 40C7A7FBBE;
	Mon,  6 May 2024 13:48:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=freebox-fr.20230601.gappssmtp.com header.i=@freebox-fr.20230601.gappssmtp.com header.b="T5p73/Ca"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com [209.85.128.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C478380026
	for <linux-media@vger.kernel.org>; Mon,  6 May 2024 13:48:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1715003313; cv=none; b=XC1GtkHJsk2pkwLmOANGzCqesjLG3OXhghmgZFkHaHFx+FnF24iFt1f2N5IFZd4VNq+1XJmlR412N6EpW8CXcDHVpbjYT7XpKwRQcdl4XbWBvXjoYaKwsUI0A+6M8h5eq25NBLgdcXxCxLxu01RZrmJG3OzL+RCXhgq9cVcnx3A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1715003313; c=relaxed/simple;
	bh=JgCoIyaNf84LuEOmp2FQmBp4+GiQ/TBuX7xx4VD7nv0=;
	h=Message-ID:Date:MIME-Version:Subject:From:To:Cc:References:
	 In-Reply-To:Content-Type; b=peYQNB8Oob29qM2V6UX6A+ln0gqVLlPOGMtKkZstlzG0qCf1rScYbTQqfoP+Bl0q1diGRL3LadjjSIfAzQEq98H8yEW8+u7jWwubXWn62nm+YtjR8mASzHc+OoK/WHgfCpaUy2b3VfKoJ7xrfZjOx0R9ddFCKU19L+UKBpaxLz4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=freebox.fr; spf=pass smtp.mailfrom=freebox.fr; dkim=pass (2048-bit key) header.d=freebox-fr.20230601.gappssmtp.com header.i=@freebox-fr.20230601.gappssmtp.com header.b=T5p73/Ca; arc=none smtp.client-ip=209.85.128.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=freebox.fr
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=freebox.fr
Received: by mail-wm1-f46.google.com with SMTP id 5b1f17b1804b1-41c7ac71996so16221055e9.3
        for <linux-media@vger.kernel.org>; Mon, 06 May 2024 06:48:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=freebox-fr.20230601.gappssmtp.com; s=20230601; t=1715003310; x=1715608110; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:content-language:references
         :cc:to:from:subject:user-agent:mime-version:date:message-id:from:to
         :cc:subject:date:message-id:reply-to;
        bh=SLH2UGXcs8WjbaIo1wdcYxN1wrBoZdoSVxpSWyyjSRA=;
        b=T5p73/CaI14tTFOXiS6B/3OjGXEPse16lGRUu0AgfDxlRxBieljKxi1bNm3GCRgIxI
         0FBpigXxW5A/j6bdzrq3uy102SLC44FpnpjaoF3GtWooPzn4nXhdbSLDRxqeDW0exduu
         7sq3SNtxs5UnC1pLHaI18z8qeVjFypMClgBMLPxIdfTUZcrFEVY5FCOv6dz+4RwMyW2O
         eKX2oifDRoFvG2C6t0HF33inpFR7XWPf2ztpOj0vFSOTdpjhMiK+U2GvTU13qqyuBzZT
         eYkl3SqCsd0BTX9jhpnnGXGHjVTf9dkfGKkHOI0YvG7a9eXW3bPDZAUO9vxr+2uiYIMR
         KT1A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1715003310; x=1715608110;
        h=content-transfer-encoding:in-reply-to:content-language:references
         :cc:to:from:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=SLH2UGXcs8WjbaIo1wdcYxN1wrBoZdoSVxpSWyyjSRA=;
        b=u9bvKZdvMKr4DTXGtBdObAuAG1rci4RnOUCK6kqQ83cd0Ej8D1A3sVsLUKutYN4bZK
         +bGVMKKKoxJXF+X9hIGkBOx95MoEUl9qKK4vHDfJcg4LOQD65Oxw8ehEM//kkFoUKxD9
         oHLQkd65JATkv6eqNQTbv5CgBDU+hf/A19mQjFjoZHYURJFRJckIY4eNVaHLdzu202vh
         KZXqB+BxP4rsYvffnjRgy79rSuugfWlWOYhGqZiyCnwsvEEc4lPBNLJIdu8Av/GW8mY1
         9d2oqT63THpeTn/fy2YWOKIa1I8kYFzN/M6yqLpq/cPP8JtCLyEmr6Jj/KDQc2FL/MBO
         6Agg==
X-Forwarded-Encrypted: i=1; AJvYcCWYvu9PzX1HUptU1IuUKKD3K+PdifMsWG+JMC8wAyscPqYCRycu/dqvxgk5bPQ5uX3YJD3MBDEyc6NoS2QCPgT6Q/G+xsmvhixEDsY=
X-Gm-Message-State: AOJu0Yx9diWtIYho4KS68RmRNAJrIMkxfEcGBMsDMGSabdmN/814yU7k
	xFO1aL2Nz1sJ+ZnphT3o/RUBBsrf8npNSZ+IuSq2Qr+SuRQ2R4ALNiBJZX35mmjO5e2l+KLrv75
	n
X-Google-Smtp-Source: AGHT+IEedcw3sMzjY7rXaFp1w7fge+NsJOpm4Z2nCZgS9MvKI8F14/OUmWE4PrWNmBbJOEFSZALqnQ==
X-Received: by 2002:a05:600c:35cb:b0:41b:a670:a9f1 with SMTP id r11-20020a05600c35cb00b0041ba670a9f1mr8243093wmq.7.1715003310109;
        Mon, 06 May 2024 06:48:30 -0700 (PDT)
Received: from [192.168.108.81] (freebox.vlq16.iliad.fr. [213.36.7.13])
        by smtp.gmail.com with ESMTPSA id je8-20020a05600c1f8800b0041bf28aa11dsm16131973wmb.42.2024.05.06.06.48.29
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 06 May 2024 06:48:29 -0700 (PDT)
Message-ID: <14bda891-5035-433c-888e-b3c330eeffaf@freebox.fr>
Date: Mon, 6 May 2024 15:47:24 +0200
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: [PATCH v3 3/3] media: venus: add msm8998 support
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
References: <72860c1d-7434-4be6-8c1d-9ea177602802@freebox.fr>
Content-Language: en-US
In-Reply-To: <72860c1d-7434-4be6-8c1d-9ea177602802@freebox.fr>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

From: Pierre-Hugues Husson <phhusson@freebox.fr>

Add the missing bits for msm8998 support.

Reviewed-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Signed-off-by: Pierre-Hugues Husson <phhusson@freebox.fr>
Signed-off-by: Marc Gonzalez <mgonzalez@freebox.fr>
---
 drivers/media/platform/qcom/venus/core.c | 48 ++++++++++++++++++++++++++++++++++++++++++++++++
 1 file changed, 48 insertions(+)

diff --git a/drivers/media/platform/qcom/venus/core.c b/drivers/media/platform/qcom/venus/core.c
index ce206b7097541..064120127cb86 100644
--- a/drivers/media/platform/qcom/venus/core.c
+++ b/drivers/media/platform/qcom/venus/core.c
@@ -554,6 +554,9 @@ static const struct venus_resources msm8916_res = {
 	.fwname = "qcom/venus-1.8/venus.mbn",
 };
 
+/*
+ * https://git.codelinaro.org/clo/la/kernel/msm-4.4/-/blame/caf_migration/kernel.lnx.4.4.r38-rel/arch/arm/boot/dts/qcom/msm8996-v3.dtsi#L403-414
+ */
 static const struct freq_tbl msm8996_freq_table[] = {
 	{ 1944000, 520000000 },	/* 4k UHD @ 60 (decode only) */
 	{  972000, 520000000 },	/* 4k UHD @ 30 */
@@ -587,6 +590,50 @@ static const struct venus_resources msm8996_res = {
 	.fwname = "qcom/venus-4.2/venus.mbn",
 };
 
+/*
+ * https://git.codelinaro.org/clo/la/kernel/msm-4.4/-/blob/caf_migration/kernel.lnx.4.4.r38-rel/arch/arm/boot/dts/qcom/msm8998-vidc.dtsi#L42-53
+ */
+static const struct freq_tbl msm8998_freq_table[] = {
+	{ 1944000, 465000000 },	/* 4k UHD @ 60 (decode only) */
+	{  972000, 465000000 },	/* 4k UHD @ 30 */
+	{  489600, 360000000 },	/* 1080p @ 60 */
+	{  244800, 186000000 },	/* 1080p @ 30 */
+	{  108000, 100000000 },	/* 720p @ 30 */
+};
+
+/*
+ * https://git.codelinaro.org/clo/la/kernel/msm-4.4/-/blob/caf_migration/kernel.lnx.4.4.r38-rel/arch/arm/boot/dts/qcom/msm8998-vidc.dtsi#L29-37
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
@@ -893,6 +940,7 @@ static const struct venus_resources sc7280_res = {
 static const struct of_device_id venus_dt_match[] = {
 	{ .compatible = "qcom,msm8916-venus", .data = &msm8916_res, },
 	{ .compatible = "qcom,msm8996-venus", .data = &msm8996_res, },
+	{ .compatible = "qcom,msm8998-venus", .data = &msm8998_res, },
 	{ .compatible = "qcom,sdm660-venus", .data = &sdm660_res, },
 	{ .compatible = "qcom,sdm845-venus", .data = &sdm845_res, },
 	{ .compatible = "qcom,sdm845-venus-v2", .data = &sdm845_res_v2, },
-- 
2.34.1


