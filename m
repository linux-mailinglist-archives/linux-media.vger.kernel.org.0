Return-Path: <linux-media+bounces-12088-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 35B548D1BA7
	for <lists+linux-media@lfdr.de>; Tue, 28 May 2024 14:52:25 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 8BC1AB223D6
	for <lists+linux-media@lfdr.de>; Tue, 28 May 2024 12:52:22 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4C56A16D4F4;
	Tue, 28 May 2024 12:52:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=freebox-fr.20230601.gappssmtp.com header.i=@freebox-fr.20230601.gappssmtp.com header.b="edyIiM/p"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-lf1-f45.google.com (mail-lf1-f45.google.com [209.85.167.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D084616C42C
	for <linux-media@vger.kernel.org>; Tue, 28 May 2024 12:52:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1716900735; cv=none; b=CRoP3GB9Hnk53LyMTnTdivMReukSD4cfrSuTd3OkgORa15Zj8DuXWqM1s46XhP1PfkkbRn9tQFWlSRyiEtz/hD4oO9u4wynoP/qLrRaWuzzGzvKcYV5m2OgpDseJQ90EMHTkA6RU6fEJdAuRAiDGa5wguq3FD6XfNEXMN5qnALM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1716900735; c=relaxed/simple;
	bh=gbJ0EW9+YkUfB1SCUS9zEwSF5c/vAeBAVk/1UKCFskM=;
	h=Message-ID:Date:MIME-Version:Subject:From:To:Cc:References:
	 In-Reply-To:Content-Type; b=BJEf6xEkY1AZDXvhXK/BZ0VErNW5ZWoiYKnwt4Tjrd5rXxfSyK9E+QyXbRMEkwPvGqCN9fB8mf6TOUN1S6s0SQpQU5OozJqd6vpZsFL7Lum5BW+RxzkHrvx9gbjaT+t4N9GweolBB7Bhv3BvaoiUmGN7CkJ4b8dKvW9gAQxMgAI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=freebox.fr; spf=pass smtp.mailfrom=freebox.fr; dkim=pass (2048-bit key) header.d=freebox-fr.20230601.gappssmtp.com header.i=@freebox-fr.20230601.gappssmtp.com header.b=edyIiM/p; arc=none smtp.client-ip=209.85.167.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=freebox.fr
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=freebox.fr
Received: by mail-lf1-f45.google.com with SMTP id 2adb3069b0e04-529648cd69dso957738e87.2
        for <linux-media@vger.kernel.org>; Tue, 28 May 2024 05:52:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=freebox-fr.20230601.gappssmtp.com; s=20230601; t=1716900732; x=1717505532; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:content-language:references
         :cc:to:from:subject:user-agent:mime-version:date:message-id:from:to
         :cc:subject:date:message-id:reply-to;
        bh=ecOVMqIIWoiHJhC2XPG8/GG8wCb2FTfi0m70TQ/ptQc=;
        b=edyIiM/pNqsOkbJLUQr8PT6djvrttp17chrsp+I/ogyMpojybElzsnJ+lt2VuFw/rO
         Iw5tJOwLXGZivjbkk/7LTCa18Z+nGIXsqcic4N/3mQmjSO6u54Ak4lSCt3ybFymYJ2OX
         qLFjEsLQIpeWRP28eyDfx9Pngy3UOLCf2z4Oewb7a/A2yqxsf2C6Fs2ymkR7CeWOIzmX
         uQeW2kM9nEkC7BiM0M+SN1JkFt+yXjUAMgyHcuTpQdSa8ZIiuVxg0koA4xMGbgbO/noC
         k3Z3eI1bzXY1o1GeNmcQF5NBpGISpwu8WQQh/I/xqM1MjOSr3MWZDy2FApnLXOqC1ZEd
         DRIA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1716900732; x=1717505532;
        h=content-transfer-encoding:in-reply-to:content-language:references
         :cc:to:from:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=ecOVMqIIWoiHJhC2XPG8/GG8wCb2FTfi0m70TQ/ptQc=;
        b=JVfmZPbXia/3F0Ca7fwE8FeFaJgWS3YuzEdmlzhmE8nbAWSMFS5MGj1CBpDlwJgSwl
         3p77h1fECFUl53nLFHxwCmhXpptzLgeZzdUkZf2SoJrcqU7on2itTRyUcy+AYd68+YRz
         yYT+nuhEBGCvNnBfJXgGdICKw9ygtj4MtgoZO1NSQZJ27AEHstTXJPLTvyNJu7Cn/g51
         EKCCMDPU6F4tDVsPDPrun21/6TzEnHbxr1wAxF7neMMydkk3VwK3gyc2TQ49gn5KWqYQ
         mVWTLXzvKzNQXrTFgB+UR6HhGHfit28XudnT1glWollgLN/e58ZE8UACGJPkesB75Oth
         jr4w==
X-Forwarded-Encrypted: i=1; AJvYcCV/inBRSJ9pjXkJc5I8zbQD8C4HEgWHYQy8821w6w26f2W49jh6R1OFeDJkWeNwxeYY8OCrJQybIKFnSRZFLb3+neGlJPlJBGp1rnM=
X-Gm-Message-State: AOJu0YwQql7KB9JpQMTBLYcR0EAVtArNBPGpujZsQB52ImeqTrBvzinS
	aUXvd2EEXjXQDpqp5tGFGgg8bw36Uk+lPsQui1Tu/EXxe/5ttanxFKW+ckYec4E=
X-Google-Smtp-Source: AGHT+IF3smLqtQ0xwzmM86/unf5McpKtfbRGs9RhlpBqDyBLVw0ZMqBFFkNSdZOTR6Exg9C4MIBfpQ==
X-Received: by 2002:a05:6512:1085:b0:523:8c10:9e0e with SMTP id 2adb3069b0e04-52964eac478mr13790696e87.3.1716900730981;
        Tue, 28 May 2024 05:52:10 -0700 (PDT)
Received: from [192.168.108.81] (freebox.vlq16.iliad.fr. [213.36.7.13])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-421088f9d3csm141972945e9.0.2024.05.28.05.52.10
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 28 May 2024 05:52:10 -0700 (PDT)
Message-ID: <4e7f404e-f115-4da7-b707-3970fb1609ac@freebox.fr>
Date: Tue, 28 May 2024 14:52:10 +0200
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 3/3] media: venus: add msm8998 support
From: Marc Gonzalez <mgonzalez@freebox.fr>
To: Mauro Carvalho Chehab <mchehab@kernel.org>,
 Stanimir Varbanov <stanimir.k.varbanov@gmail.com>,
 Vikash Garodia <quic_vgarodia@quicinc.com>,
 Bryan O Donoghue <bryan.odonoghue@linaro.org>
Cc: MSM <linux-arm-msm@vger.kernel.org>,
 linux-media <linux-media@vger.kernel.org>,
 Pierre-Hugues Husson <phhusson@freebox.fr>, Arnaud Vrac <avrac@freebox.fr>,
 Bjorn Andersson <andersson@kernel.org>, Jeffrey Hugo
 <quic_jhugo@quicinc.com>, Konrad Dybcio <konrad.dybcio@linaro.org>
References: <1cf08b56-a247-431b-a24b-69f563f49240@freebox.fr>
 <6df495c5-db26-431d-8ce1-8263a2a12b2f@freebox.fr>
Content-Language: en-US
In-Reply-To: <6df495c5-db26-431d-8ce1-8263a2a12b2f@freebox.fr>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 07/05/2024 11:30, Marc Gonzalez wrote:

> From: Pierre-Hugues Husson <phhusson@freebox.fr>
> 
> Add the missing bits for msm8998 support.
> 
> Downstream vendor code for reference:
> 
> https://git.codelinaro.org/clo/la/kernel/msm-4.4/-/blob/caf_migration/kernel.lnx.4.4.r38-rel/arch/arm/boot/dts/qcom/msm8998-vidc.dtsi#L42-53
> 
> qcom,load-freq-tbl =
> 	/* Encoders */
> 	<972000 465000000 0x55555555>, /* 4k UHD @ 30 */
> 	<489600 360000000 0x55555555>, /* 1080p @ 60 */
> 	<244800 186000000 0x55555555>, /* 1080p @ 30 */
> 	<108000 100000000 0x55555555>, /* 720p @ 30 */
> 	/* Decoders */
> 	<1944000 465000000 0xffffffff>, /* 4k UHD @ 60 */
> 	< 972000 360000000 0xffffffff>, /* 4k UHD @ 30 */
> 	< 489600 186000000 0xffffffff>, /* 1080p @ 60 */
> 	< 244800 100000000 0xffffffff>; /* 1080p @ 30 */
> 
> Reviewed-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
> Signed-off-by: Pierre-Hugues Husson <phhusson@freebox.fr>
> Signed-off-by: Marc Gonzalez <mgonzalez@freebox.fr>
> ---
>  drivers/media/platform/qcom/venus/core.c | 39 +++++++++++++++++++++++++++++++++++++++
>  1 file changed, 39 insertions(+)
> 
> diff --git a/drivers/media/platform/qcom/venus/core.c b/drivers/media/platform/qcom/venus/core.c
> index ce206b7097541..8b715cb7ab51a 100644
> --- a/drivers/media/platform/qcom/venus/core.c
> +++ b/drivers/media/platform/qcom/venus/core.c
> @@ -587,6 +587,44 @@ static const struct venus_resources msm8996_res = {
>  	.fwname = "qcom/venus-4.2/venus.mbn",
>  };
>  
> +static const struct freq_tbl msm8998_freq_table[] = {
> +	{ 1944000, 465000000 },	/* 4k UHD @ 60 (decode only) */
> +	{  972000, 465000000 },	/* 4k UHD @ 30 */
> +	{  489600, 360000000 },	/* 1080p @ 60 */
> +	{  244800, 186000000 },	/* 1080p @ 30 */
> +	{  108000, 100000000 },	/* 720p @ 30 */
> +};
> +
> +static const struct reg_val msm8998_reg_preset[] = {
> +	{ 0x80124, 0x00000003 },
> +	{ 0x80550, 0x01111111 },
> +	{ 0x80560, 0x01111111 },
> +	{ 0x80568, 0x01111111 },
> +	{ 0x80570, 0x01111111 },
> +	{ 0x80580, 0x01111111 },
> +	{ 0x80588, 0x01111111 },
> +	{ 0xe2010, 0x00000000 },
> +};
> +
> +static const struct venus_resources msm8998_res = {
> +	.freq_tbl = msm8998_freq_table,
> +	.freq_tbl_size = ARRAY_SIZE(msm8998_freq_table),
> +	.reg_tbl = msm8998_reg_preset,
> +	.reg_tbl_size = ARRAY_SIZE(msm8998_reg_preset),
> +	.clks = { "core", "iface", "bus", "mbus" },
> +	.clks_num = 4,
> +	.vcodec0_clks = { "core" },
> +	.vcodec1_clks = { "core" },
> +	.vcodec_clks_num = 1,
> +	.max_load = 2563200,
> +	.hfi_version = HFI_VERSION_3XX,
> +	.vmem_id = VIDC_RESOURCE_NONE,
> +	.vmem_size = 0,
> +	.vmem_addr = 0,
> +	.dma_mask = 0xddc00000 - 1,
> +	.fwname = "qcom/venus-4.4/venus.mbn",
> +};
> +
>  static const struct freq_tbl sdm660_freq_table[] = {
>  	{ 979200, 518400000 },
>  	{ 489600, 441600000 },
> @@ -893,6 +931,7 @@ static const struct venus_resources sc7280_res = {
>  static const struct of_device_id venus_dt_match[] = {
>  	{ .compatible = "qcom,msm8916-venus", .data = &msm8916_res, },
>  	{ .compatible = "qcom,msm8996-venus", .data = &msm8996_res, },
> +	{ .compatible = "qcom,msm8998-venus", .data = &msm8998_res, },
>  	{ .compatible = "qcom,sdm660-venus", .data = &sdm660_res, },
>  	{ .compatible = "qcom,sdm845-venus", .data = &sdm845_res, },
>  	{ .compatible = "qcom,sdm845-venus-v2", .data = &sdm845_res_v2, },

Hello Mauro,

Will this patch be merged through your tree?

Regards


