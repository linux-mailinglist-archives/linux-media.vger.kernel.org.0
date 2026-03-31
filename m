Return-Path: <linux-media+bounces-57790-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id yEBhJ1/Ny2luLwYAu9opvQ
	(envelope-from <linux-media+bounces-57790-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Tue, 31 Mar 2026 15:34:23 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 0BE4F36A515
	for <lists+linux-media@lfdr.de>; Tue, 31 Mar 2026 15:34:22 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 4882530F88D4
	for <lists+linux-media@lfdr.de>; Tue, 31 Mar 2026 13:29:16 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0E6A83E6DCA;
	Tue, 31 Mar 2026 13:29:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="WpOsP9m8"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-lf1-f43.google.com (mail-lf1-f43.google.com [209.85.167.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A25AB3E51C5
	for <linux-media@vger.kernel.org>; Tue, 31 Mar 2026 13:29:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774963754; cv=none; b=DjV9tvulEv2DdDvmEkS82qTxe3ZnA6fAJU6KXpg33q0df4hqXlSUQMlZgt/v/86GGuM7VnC/NUdbTcPZzZo2o4AaQq4d9tdDgdr3I3WR34mniUROiQyhwwdSOGKQMcD7fmbGROx/84/1+ZhjV53cfdSfLIXKBPbXxR1HVon3GUc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774963754; c=relaxed/simple;
	bh=sjgHIlOjJIUqOmCKtxBoJhAEO+KEsYQgiP0C/Ip9OJE=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Wmn7u242mbqd6xmpheb94YF11Ny1TdaaNacDkm0vYJiGaKZaefzfChAec25L6Rt3Cj5YF55Dajhp/+QxtGhpWHQUNHJYHo1+blV7mhiX6OoQTjqIU6wRYmNUK1YVqz540haMTFrlbUv0kWgEfELKAdn9W8OFokQTNGP7LY1Kw/A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=WpOsP9m8; arc=none smtp.client-ip=209.85.167.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lf1-f43.google.com with SMTP id 2adb3069b0e04-5a2bf521011so53333e87.2
        for <linux-media@vger.kernel.org>; Tue, 31 Mar 2026 06:29:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1774963750; x=1775568550; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to:subject
         :user-agent:mime-version:date:message-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=BbFdFY1ryYFC+hM/WPwZzfOvMcgDCJMGIGsqBBOf6+I=;
        b=WpOsP9m8wsDKoZi0UvIdqw6AYOYuUQA8SBcB1QugxeJspgjXZUg1iMaV4/GBqDwmNK
         xAMWy/kNfIiSY9d2DakMpdMwsxCtWZx74P+dopMXiZ3v3jbGPvzzGXjZ5aVnWdCN9MU9
         QwDRtTRPbFu3D7yeSqZpHgvXYDr6yfN/JvHpQH8mhMwviEvyW1l64lTrOCcMXjUUG9tw
         /m9y5EfJavMvbfUqONkju9QAcaUMEbVoWp8xWyB2xjwVNOsajX/zCD09k2BAJXcW2ZbB
         n0xXNuk9oaFZeM4AQwUuy6lNHm+iFzlaalrfIoM8FG54ewahC9KjwzXb2F1Kk9J8GyVV
         6qIQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774963750; x=1775568550;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to:subject
         :user-agent:mime-version:date:message-id:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=BbFdFY1ryYFC+hM/WPwZzfOvMcgDCJMGIGsqBBOf6+I=;
        b=j+Jr1sEnkjMRcFCQzuvP1r+7FUKNbw64JXsUMVyNBirkafSIR9vz+bk1w4p5C7mfuF
         MvJ2ziEKkMZz1kJgyGud0mpWXUdTX6cP79oruHX6xoYE7RMjrs9ndLS+M+IvXSwinaMQ
         ZCkQVghg3Cb2XAlnmQ5pFpk3CHsd8kBSQUurSisOU0NqyObISFf+Ac3IHNYRamWP9LgV
         Jq9qH1KstSv0RTHRlqkDKlvzOU/Cvp2tLGmACfvV0+/sBqqZ7jDcX1L9kVPiQuQ3ETy2
         v032nRohXK+cXt3W+ZVvtbpcnTt17Oy03W0H9YS/7Jzr8EogMHiI0utpB/6AFTZcS8Pd
         Dp3A==
X-Forwarded-Encrypted: i=1; AJvYcCUBeznvmXc8nRUF9xWtNaYPsm/DrP4H1PoDfItC1w0pPdD48y1in4q/CnyTgk1jjl++Y/RJuLIoVvzwJQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YwYoPYwOm9i5VZubtbnFxbStx4ROAiMeIvP36gx0+6SHBGXOdX3
	V+crslUqNZnSysiiww9NBl1nw/y1aKEUQKz/if+UZQdSPl2dEABMBSFwglBEkYbyzjg=
X-Gm-Gg: ATEYQzzi0A1LPykC16jeWUOy96nGMWInjMiqPiCzhuBKHGsy0XSLkr0ZQN1bWkMX2AS
	ViU9TFoVkQXvOekJyMWt6dqgZ6MeA+it9PbT1QWBvPQxK8eYl015L8foCZZTI8NKEcJ+HAtLvs8
	g+cL1AjiCwrENBOsgJROqT3wsRZ2P95aZ48oUTkZ+lNNb/QDe/RVvBZepMLcf3hmZj5oHGgBDC+
	FyyvZUS/RZSzG69TKEHb4ovG+8I7w3FT9hE5wlKHIuq3sykpdotYroY5yO4DNq9OYO2Wot75t2H
	lLC2LX/oL4CRTFqAnvYIkJBHZKTVUPROrkKDTlcMh0feHs+BSSEe2DAq73GEai927HOSrXPI3OA
	mGknbEfjRtzD0ntk2vgHAkWZFjuZC0rmSbHlx7elMOqvi3HBO/6JCqEQkDpuPyKxOqB2tqesIrz
	88C5J0rWZfYg2ekRvYN/7cittt9ukSi/U6v2rHofBG2cjE/SyQpKV5IgtFzgr7BtqQBoBeGEmRX
	gTeng==
X-Received: by 2002:a05:6512:39d6:b0:5a2:a52a:c69e with SMTP id 2adb3069b0e04-5a2ab913ef4mr2989896e87.4.1774963750387;
        Tue, 31 Mar 2026 06:29:10 -0700 (PDT)
Received: from [192.168.1.100] (91-159-24-186.elisa-laajakaista.fi. [91.159.24.186])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5a2b145f040sm2447874e87.75.2026.03.31.06.29.09
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 31 Mar 2026 06:29:09 -0700 (PDT)
Message-ID: <55d61750-07de-458d-8668-09f84a35220e@linaro.org>
Date: Tue, 31 Mar 2026 16:29:08 +0300
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 3/3] arm64: dts: qcom: sm6350: Add CAMSS node
To: Luca Weiss <luca.weiss@fairphone.com>
Cc: Bryan O'Donoghue <bod@kernel.org>, Robert Foss <rfoss@kernel.org>,
 ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org,
 linux-arm-msm@vger.kernel.org, linux-media@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 Todor Tomov <todor.too@gmail.com>, Mauro Carvalho Chehab
 <mchehab@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
 Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konradybcio@kernel.org>
References: <20260216-sm6350-camss-v4-0-b9df35f87edb@fairphone.com>
 <20260216-sm6350-camss-v4-3-b9df35f87edb@fairphone.com>
From: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
In-Reply-To: <20260216-sm6350-camss-v4-3-b9df35f87edb@fairphone.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[linaro.org,none];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[linaro.org:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_CC(0.00)[kernel.org,lists.sr.ht,vger.kernel.org,gmail.com,linaro.org];
	TAGGED_FROM(0.00)[bounces-57790-lists,linux-media=lfdr.de];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[17];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[linaro.org:+];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[vladimir.zapolskiy@linaro.org,linux-media@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-media,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[0.0.0.0:email,linaro.org:dkim,linaro.org:email,linaro.org:mid,fairphone.com:email,acb3000:email,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 0BE4F36A515
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On 2/16/26 10:54, Luca Weiss wrote:
> Add a node for the CAMSS on the SM6350 SoC.
> 
> Signed-off-by: Luca Weiss <luca.weiss@fairphone.com>
> ---
>   arch/arm64/boot/dts/qcom/sm6350.dtsi | 233 +++++++++++++++++++++++++++++++++++
>   1 file changed, 233 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/qcom/sm6350.dtsi b/arch/arm64/boot/dts/qcom/sm6350.dtsi
> index 9f9b9f9af0da..9ff9508c5ce6 100644
> --- a/arch/arm64/boot/dts/qcom/sm6350.dtsi
> +++ b/arch/arm64/boot/dts/qcom/sm6350.dtsi
> @@ -2161,6 +2161,239 @@ cci1_i2c0: i2c-bus@0 {
>   			/* SM6350 seems to have cci1_i2c1 on gpio2 & gpio3 but unused downstream */
>   		};
>   
> +		camss: isp@acb3000 {
> +			compatible = "qcom,sm6350-camss";
> +
> +			reg = <0x0 0x0acb3000 0x0 0x1000>,
> +			      <0x0 0x0acba000 0x0 0x1000>,
> +			      <0x0 0x0acc1000 0x0 0x1000>,
> +			      <0x0 0x0acc8000 0x0 0x1000>,
> +			      <0x0 0x0ac65000 0x0 0x1000>,
> +			      <0x0 0x0ac66000 0x0 0x1000>,
> +			      <0x0 0x0ac67000 0x0 0x1000>,
> +			      <0x0 0x0ac68000 0x0 0x1000>,
> +			      <0x0 0x0acaf000 0x0 0x4000>,
> +			      <0x0 0x0acb6000 0x0 0x4000>,
> +			      <0x0 0x0acbd000 0x0 0x4000>,
> +			      <0x0 0x0acc4000 0x0 0x4000>,
> +			      <0x0 0x0ac18000 0x0 0x3000>,
> +			      <0x0 0x0ac00000 0x0 0x6000>,
> +			      <0x0 0x0ac10000 0x0 0x8000>,
> +			      <0x0 0x0ac6f000 0x0 0x8000>,
> +			      <0x0 0x0ac42000 0x0 0x4600>,
> +			      <0x0 0x01fc0000 0x0 0x40000>,

I notice that this memory range is very distant, can somebody with
the access to the specs confirm that it is a part of CAMSS IP?

> +			      <0x0 0x0ac48000 0x0 0x1000>,
> +			      <0x0 0x0ac40000 0x0 0x1000>,
> +			      <0x0 0x0ac87000 0x0 0xa000>,
> +			      <0x0 0x0ac52000 0x0 0x4000>,
> +			      <0x0 0x0ac4e000 0x0 0x4000>,
> +			      <0x0 0x0ac6b000 0x0 0xa00>;
> +			reg-names = "csid0",
> +				    "csid1",
> +				    "csid2",
> +				    "csid_lite",
> +				    "csiphy0",
> +				    "csiphy1",
> +				    "csiphy2",
> +				    "csiphy3",
> +				    "vfe0",
> +				    "vfe1",
> +				    "vfe2",
> +				    "vfe_lite",
> +				    "a5_csr",
> +				    "a5_qgic",
> +				    "a5_sierra",
> +				    "bps",
> +				    "camnoc",
> +				    "core_top_csr_tcsr",

Looking at the memory map I have a feeling that this "core_top_csr_tcsr"
is not a natural part of CAMSS IPs, it should be clarified by someone
else.

> +				    "cpas_cdm",
> +				    "cpas_top",
> +				    "ipe",
> +				    "jpeg_dma",
> +				    "jpeg_enc",
> +				    "lrme";
> +

The .dtsi change strictly follows the dt bindings description, won't
repeat previously given concerns here, so

Reviewed-by: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>

-- 
Best wishes,
Vladimir

