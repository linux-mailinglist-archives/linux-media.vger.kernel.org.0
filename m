Return-Path: <linux-media+bounces-48202-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 7D7F8CA2093
	for <lists+linux-media@lfdr.de>; Thu, 04 Dec 2025 01:23:42 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id ADD32301C93F
	for <lists+linux-media@lfdr.de>; Thu,  4 Dec 2025 00:23:16 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B92D419D89E;
	Thu,  4 Dec 2025 00:23:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="CpfmM7kz"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com [209.85.128.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5256D17A2E8
	for <linux-media@vger.kernel.org>; Thu,  4 Dec 2025 00:23:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764807792; cv=none; b=LwWOcPZgu8aa4lYG6/eZ8ZNPAIYMhDQBP2Bc+Eu7Q1ep+4d/DlmtrmoZvTMTvEEewdtLf0+sUhZDAR4m9I/ItN5qwwebMngBIRmkw5ncO4Rv9ncsZFvZ2Pa43gtoQWA3zg2PE4blh+wQrF6tJxegJ01EMVVlWFLlhHdqkbhi1ps=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764807792; c=relaxed/simple;
	bh=MNTkF/8d5j3LaPV58pIl8PN8GUdjUcXP0AuTDgV34EY=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Gt0+rTeG5XGneSa5hrN7pGT/IdpAjYsBMtCRK36Id/rL+xNjjJCbiBNzrxrXQANL6O7CKaX85kh8H3dvRfJtOVGDAoH4MubnQQW57gUxoYagHMCgSPJVwW/T9QU21SnIEE8Pe3OwMLDvmtU2sGQeOyKcy/HugrxjOQLJCEL/G3A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=CpfmM7kz; arc=none smtp.client-ip=209.85.128.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wm1-f49.google.com with SMTP id 5b1f17b1804b1-47118259fd8so3266455e9.3
        for <linux-media@vger.kernel.org>; Wed, 03 Dec 2025 16:23:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1764807788; x=1765412588; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=hSsgnZDgwxeWHOfQ1yvr20ZB+yAVv0WNlnSyxa9advM=;
        b=CpfmM7kzAsW3nh3QsPkp6vQN5gPdGGpGTcQvny32UcfSCp7W3o1A6gGrYqMteOExcq
         nuckhBWTOZobZCbQ7pZpN7OvRyMZS8yPcnSESCKenrVij0J7TInvp+Nik2pgM4eIhj6r
         +g8MXPVZXmSBaF4WRqJEE33Q/fYRQOsTA3jUcj1IRAQpzk9BKABhOroOna2gThVPdFdd
         IkDZbsuCl/gXlm+LuqiRjYvHzL/OMfVYvKzL8025UIFQ9r8/Yzt4k5qt2DMXlNKLvClL
         8oByr5WfhcCLSwnXQlXwZmnxExYhuqp8r9QtI4S5TC4yo6U7D/dsUXygWGd7f+q1jnN6
         jKLw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764807788; x=1765412588;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=hSsgnZDgwxeWHOfQ1yvr20ZB+yAVv0WNlnSyxa9advM=;
        b=EKFWK1/qPA2RZ9T8z6V/Lt+pDcmsE7CHDfvUg/ZymvTGC39+12vANNFwDmnGVlGdpz
         0POAhOVFFAS42UIeT8iSRByV4qfZ77wykgKKH9JEZNdy5/oYlYOjnOvgzNC3Ceqgz0hy
         2LwsIevmOozakJOXcejfk3J/99wSFDyu3jDOZG6T7VfILMkLHox2rDZ2xh2WQSoVlsGm
         33XAY1gNyQzCNkcikmyDN1uO1QY6FJDEc8dm4fw3PVpVOnCwRqGjcVq/3V23tb9Kv408
         SwLzsB2lueX1Cd5Uh/OYH7ldShBeSXtKiFCjqYEhI0P+anJw/zUnDMeCeRuiVQqdwEIv
         /eUg==
X-Gm-Message-State: AOJu0YxOZ1OM4TaYhv7o7HBOSVad7LV4ve87f7GmA4Za3+RLC6+JSx2V
	E/qKOiM1J/Di8C+MrJbJuVvhlcWE2p8aRL4YOOj6GDov1lvuDIbGRaTFVfu7EQSw6N4=
X-Gm-Gg: ASbGnctZbGmLIZMw7dWEL4RCwqbGtQUaHydwDRPuZc/gC7xKjY1pJ7VJpPBgDGcPchB
	BedC0j2PpndCZ6s685im2mVX0J8bzcBCyc0y8XXDkiquEtM5MXreWvJdr6+4mJq5DA9quA1IqZ5
	4oJUrFmOitl5vgGrlYiZmdXXUAjTsdBxrvxzYW5QSO7jRjRbHSStG+upaaEl8Wr67rUq3D5hX0o
	apXGDh8pOcyI5oEOD82DnmKXyMv7jywnl/qgvNdS1joJW7ln6fhNelzZCB9dEH6L5S0my2TGB8Z
	0I80C4gI5FweK4knivk2u0mp8uKsT89hu/Fas1yUEf3lFSxM7Hg7WEbMSegyQ2dZKCPjnbN1wk+
	b7RfrSlGDiAV0hyYuEjpsacQYizDAJXjtC8rhpluG7xEibIPtLwS1NNP+iP7bE5b+GDivBMCxD2
	0DRr3fSGkBfGIhH7UbxV10XdrqCGLvC+35vF5MNgVcUwu7GjlyIfQ+
X-Google-Smtp-Source: AGHT+IE9sjcZj2k+bMrjv8MGJnuHtdInw7ZKP6kmKbxl2Ij1shm86IyV9zTHLG27mOITzxtiEgI5YQ==
X-Received: by 2002:a05:600c:35ce:b0:479:2651:3f9c with SMTP id 5b1f17b1804b1-4792f268a6bmr9277855e9.14.1764807788588;
        Wed, 03 Dec 2025 16:23:08 -0800 (PST)
Received: from [192.168.0.27] (188-141-3-146.dynamic.upc.ie. [188.141.3.146])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-42e1ca8bae9sm40362472f8f.33.2025.12.03.16.23.06
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 03 Dec 2025 16:23:07 -0800 (PST)
Message-ID: <42ce8a95-8f83-46db-91ee-73a1a942eabf@linaro.org>
Date: Thu, 4 Dec 2025 00:23:06 +0000
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] media: qcom: camss: csid-340: Fix unused variables
To: Loic Poulain <loic.poulain@oss.qualcomm.com>,
 vladimir.zapolskiy@linaro.org, mchehab@kernel.org
Cc: linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org
References: <20251203164330.1552-1-loic.poulain@oss.qualcomm.com>
From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Content-Language: en-US
In-Reply-To: <20251203164330.1552-1-loic.poulain@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 03/12/2025 16:43, Loic Poulain wrote:
> The CSID driver has some unused variables and function parameters
> that are no longer needed (due to refactoring). This patch cleans
> up those unused elements:
> 
> - Removing the `vc` parameter from `__csid_configure_rx()`.
> - Dropping the unused `lane_cnt` variable.
> - Adjusting calls to `__csid_configure_rx()` accordingly.
> 
> Fixes: fb1c6b86d8ff ("media: qcom: camss: Add CSID 340 support")
> Signed-off-by: Loic Poulain <loic.poulain@oss.qualcomm.com>
> ---
>   drivers/media/platform/qcom/camss/camss-csid-340.c | 10 +++-------
>   1 file changed, 3 insertions(+), 7 deletions(-)
> 
> diff --git a/drivers/media/platform/qcom/camss/camss-csid-340.c b/drivers/media/platform/qcom/camss/camss-csid-340.c
> index 22a30510fb79..2b50f9b96a34 100644
> --- a/drivers/media/platform/qcom/camss/camss-csid-340.c
> +++ b/drivers/media/platform/qcom/camss/camss-csid-340.c
> @@ -55,8 +55,7 @@
>   #define CSID_RDI_CTRL_HALT_AT_FRAME_BOUNDARY		0
>   #define CSID_RDI_CTRL_RESUME_AT_FRAME_BOUNDARY		1
>   
> -static void __csid_configure_rx(struct csid_device *csid,
> -				struct csid_phy_config *phy, int vc)
> +static void __csid_configure_rx(struct csid_device *csid, struct csid_phy_config *phy)
>   {
>   	u32 val;
>   
> @@ -81,13 +80,9 @@ static void __csid_configure_rdi_stream(struct csid_device *csid, u8 enable, u8
>   	const struct csid_format_info *format = csid_get_fmt_entry(csid->res->formats->formats,
>   								   csid->res->formats->nformats,
>   								   input_format->code);
> -	u8 lane_cnt = csid->phy.lane_cnt;
>   	u8 dt_id;
>   	u32 val;
>   
> -	if (!lane_cnt)
> -		lane_cnt = 4;
> -
>   	/*
>   	 * DT_ID is a two bit bitfield that is concatenated with
>   	 * the four least significant bits of the five bit VC
> @@ -120,10 +115,11 @@ static void csid_configure_stream(struct csid_device *csid, u8 enable)
>   {
>   	int i;
>   
> +	__csid_configure_rx(csid, &csid->phy);
> +
>   	for (i = 0; i < MSM_CSID_MAX_SRC_STREAMS; i++) {
>   		if (csid->phy.en_vc & BIT(i)) {
>   			__csid_configure_rdi_stream(csid, enable, i);
> -			__csid_configure_rx(csid, &csid->phy, i);
>   			__csid_ctrl_rdi(csid, enable, i);
>   		}
>   	}
Reviewed-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>

