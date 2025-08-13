Return-Path: <linux-media+bounces-39838-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 5E6BDB25586
	for <lists+linux-media@lfdr.de>; Wed, 13 Aug 2025 23:35:21 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 0DF093AF280
	for <lists+linux-media@lfdr.de>; Wed, 13 Aug 2025 21:32:43 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B6BE930AAAC;
	Wed, 13 Aug 2025 21:32:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="QMcCfUja"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com [209.85.128.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B7F992D0C81
	for <linux-media@vger.kernel.org>; Wed, 13 Aug 2025 21:32:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755120740; cv=none; b=SZnNEaQ+5r5g4LgIZnGXUimo7SKc2pytGaXDY1bvinK0anwa0fdEPmLuxEjwhLz5nKHu6nSYcsO7EXVlPFAk+Bo6uQGUflWEnTnaj2Rg+U9cZUdjhACFXcSSN3zS0QCyLXR+iTgrFlXCTVQfuRAyiPpp6T5FFrjQXsr3Nfz6n48=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755120740; c=relaxed/simple;
	bh=gz575RtG23oSRtncyZleJ9U5eprqql62eLY7aALs0jY=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=R8GF5b6gDywr1t5D+Eoi2O6DHccIknh97QobDsgjfdDjBUUvhj8FX5bX3+EpxPe/QJGRgqlhnnDW1cQ1Lnn0X0i7rX8mPv1CbitXidliEjAMN7N7nGQwNs7+OlrEO827LblZt8fpB8kyRmnecxRog7/2MlWkOxWupxucro+iBWs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=QMcCfUja; arc=none smtp.client-ip=209.85.128.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wm1-f53.google.com with SMTP id 5b1f17b1804b1-45a1b04f8b5so1141695e9.1
        for <linux-media@vger.kernel.org>; Wed, 13 Aug 2025 14:32:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1755120734; x=1755725534; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=j5cG3cbEW4nr0PnGSR/wXOBrvwNEWafTFeGX/LZex5Y=;
        b=QMcCfUjaMG1xw/wXlsMR7BmuiVQt7JGnQXYBn0KycJVQt727KjKoWz+OFEZoGjGfLH
         bfdQPMmx6lIFJ3qFLw+2dDf362+iO9mHTS6bndnbi8sQwLG2kNt5/WNMvu8vV6ak/SkP
         iDZ6uayb5eJVdN+VzSXwLsQOEBFmrbroTxUw7ouRZlhnhRwFBXP40X7lDH2tSPcVQtzJ
         JwH3BQ3NNG9/tVnf4XCID4iOF0lM4w5g/ku3WzRfVwrf2+7TEh2ZcsNfS700Nj4TFC6q
         sncgnhizEnErZHiVd29lF2NtT6tzxZ20xt1XEgAGQUDWALe0khaBzKUiCVNmu3D2NJ7K
         tujA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755120734; x=1755725534;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=j5cG3cbEW4nr0PnGSR/wXOBrvwNEWafTFeGX/LZex5Y=;
        b=ZTZO8ItVtfy15dtDgoyVMXeHMEWeOO3MgdmNEeP1q0kYrPmWznL2gJQl9Nj2iPYk2Y
         UisiuMLXdtjdpp5nV1i+nge4cQ/2fS4cU2TpYo6moVaHxmhougUbUAVMINRYKdbMbwRh
         Zn9Z8T1t0oOYslBRp5PupIegZG9h9MecEmEBZHUNyVlOL0YChvPoVgsXIKZd+qJgYMIr
         PmHFpnadkk7lFK6bzzCQlBr0PAflFU3Tye3mSkpooy2Zel5GnAgkGDX9QlKLhJrkkWLn
         z9JgZjDsNPuHu+y6Q0irp13VrJt0IWTt7ZF60DDFni43nvDSvOTwp7PBplT8XFA9vCYR
         vTGA==
X-Forwarded-Encrypted: i=1; AJvYcCVC15bLCejajenelZCP1Okv+Kp2SiwtBHHVPC+4WOGwqVcjQc9JwIF8k0TCYtdrT2M8grtbkIiESJVLJQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YyEIdXDd0KByl8OREof/t2y0ohc5nGHOd77mXZAvh9nZt+OrQkF
	0ck1itgx807MroU+R1VvuJmezBhjg9D2Dqc3ztejFc2MCUatqTAA4joTlNnG9EBZFQA=
X-Gm-Gg: ASbGncvNPQC9zMFz7+m1lfGnWASV9tnHPBY574XGhyBPoMHJnqYQCkcbwr4Okf4E2RL
	KI1Rtj3Gtrhlu3sFLyy0qO6dNMYe242XnhNUrJIqTiZ/PxOKsol3pDw5tTyDKk1hGISJP48ZQBx
	GjRhxQ4BOnC1mxZeZUZWWv/OMHjt5Sc3sKo4esmvgQ6etzdEq8gWfgdje8n0QyCyGmhscIivVQR
	3lE3Z8OBYC2oEFF0MN0w5nA4FJob9hegoOBgOBXdePSc5Jp2K4V6pkMGmzymu/fYv4W8rhYU5mD
	MzLcdTFyta8PHtEIebCn6ghur8oZPeaqEmI7mFFanjP/W+n2fYdd4xFtLueheI09rR92WT5FmLU
	Pjmq/eY+KgE1RfSqm/IRpufE+xp7NTzzcX8TKqxdm3bZ0atVXUrF/snvS/xLJavnf
X-Google-Smtp-Source: AGHT+IHkYxD1EboP/TbdW74mssEAzDAmI9C1GIx0bTyGR/ssaIY4vNnPWQhRo2D5dv3Be+lyxWwcGg==
X-Received: by 2002:a05:6000:288f:b0:3b7:94c6:7c9 with SMTP id ffacd0b85a97d-3b9edf935aemr644651f8f.27.1755120733878;
        Wed, 13 Aug 2025 14:32:13 -0700 (PDT)
Received: from [192.168.0.13] (188-141-3-146.dynamic.upc.ie. [188.141.3.146])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3b79c469319sm47865251f8f.54.2025.08.13.14.32.11
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 13 Aug 2025 14:32:12 -0700 (PDT)
Message-ID: <505218ad-d010-42a2-bf01-d2141d55001d@linaro.org>
Date: Wed, 13 Aug 2025 22:32:11 +0100
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 3/7] media: qcom: camss: Add CSIPHY support for QCS8300
To: Vikram Sharma <quic_vikramsa@quicinc.com>, rfoss@kernel.org,
 todor.too@gmail.com, mchehab@kernel.org, robh@kernel.org,
 krzk+dt@kernel.org, conor+dt@kernel.org, andersson@kernel.org,
 konradybcio@kernel.org, hverkuil-cisco@xs4all.nl,
 cros-qcom-dts-watchers@chromium.org, catalin.marinas@arm.com, will@kernel.org
Cc: linux-arm-kernel@lists.infradead.org, linux-media@vger.kernel.org,
 linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <20250813053724.232494-1-quic_vikramsa@quicinc.com>
 <20250813053724.232494-4-quic_vikramsa@quicinc.com>
From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Content-Language: en-US
In-Reply-To: <20250813053724.232494-4-quic_vikramsa@quicinc.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 13/08/2025 06:37, Vikram Sharma wrote:
> QCS8300 uses the same CSIPHY hardware version (v1.3.0) as
> SA8775P. The only difference between the two platforms is
> the number of CSIPHY instances: SA8775P has four, while
> QCS8300 has three.
> 
> Signed-off-by: Vikram Sharma <quic_vikramsa@quicinc.com>
> ---
>   .../qcom/camss/camss-csiphy-3ph-1-0.c         |  2 +
>   drivers/media/platform/qcom/camss/camss.c     | 57 +++++++++++++++++++
>   2 files changed, 59 insertions(+)
> 
> diff --git a/drivers/media/platform/qcom/camss/camss-csiphy-3ph-1-0.c b/drivers/media/platform/qcom/camss/camss-csiphy-3ph-1-0.c
> index a610504359d0..445f4d41e847 100644
> --- a/drivers/media/platform/qcom/camss/camss-csiphy-3ph-1-0.c
> +++ b/drivers/media/platform/qcom/camss/camss-csiphy-3ph-1-0.c
> @@ -826,6 +826,7 @@ static bool csiphy_is_gen2(u32 version)
>   	case CAMSS_7280:
>   	case CAMSS_8250:
>   	case CAMSS_8280XP:
> +	case CAMSS_8300:
>   	case CAMSS_845:
>   	case CAMSS_8550:
>   	case CAMSS_8775P:
> @@ -928,6 +929,7 @@ static int csiphy_init(struct csiphy_device *csiphy)
>   		regs->lane_array_size = ARRAY_SIZE(lane_regs_sm8550);
>   		regs->offset = 0x1000;
>   		break;
> +	case CAMSS_8300:
>   	case CAMSS_8775P:
>   		regs->lane_regs = &lane_regs_sa8775p[0];
>   		regs->lane_array_size = ARRAY_SIZE(lane_regs_sa8775p);
> diff --git a/drivers/media/platform/qcom/camss/camss.c b/drivers/media/platform/qcom/camss/camss.c
> index 6b9aba1029b5..410e188d26aa 100644
> --- a/drivers/media/platform/qcom/camss/camss.c
> +++ b/drivers/media/platform/qcom/camss/camss.c
> @@ -2483,6 +2483,63 @@ static const struct resources_icc icc_res_sm8550[] = {
>   	},
>   };
>   
> +static const struct camss_subdev_resources csiphy_res_8300[] = {
> +	/* CSIPHY0 */
> +	{
> +		.regulators = { "vdda-phy", "vdda-pll" },
> +
> +		.clock = { "csiphy_rx", "csiphy0", "csiphy0_timer" },
> +		.clock_rate = {
> +			{ 400000000 },
> +			{ 0 },
> +			{ 400000000 },
> +		},
> +		.reg = { "csiphy0" },
> +		.interrupt = { "csiphy0" },
> +		.csiphy = {
> +			.id = 0,
> +			.hw_ops = &csiphy_ops_3ph_1_0,
> +			.formats = &csiphy_formats_sdm845,
> +		}
> +	},
> +	/* CSIPHY1 */
> +	{
> +		.regulators = { "vdda-phy", "vdda-pll" },
> +
> +		.clock = { "csiphy_rx", "csiphy1", "csiphy1_timer" },
> +		.clock_rate = {
> +			{ 400000000 },
> +			{ 0 },
> +			{ 400000000 },
> +		},
> +		.reg = { "csiphy1" },
> +		.interrupt = { "csiphy1" },
> +		.csiphy = {
> +			.id = 1,
> +			.hw_ops = &csiphy_ops_3ph_1_0,
> +			.formats = &csiphy_formats_sdm845,
> +		}
> +	},
> +	/* CSIPHY2 */
> +	{
> +		.regulators = { "vdda-phy", "vdda-pll" },
> +
> +		.clock = { "csiphy_rx", "csiphy2", "csiphy2_timer" },
> +		.clock_rate = {
> +			{ 400000000 },
> +			{ 0 },
> +			{ 400000000 },
> +		},
> +		.reg = { "csiphy2" },
> +		.interrupt = { "csiphy2" },
> +		.csiphy = {
> +			.id = 2,
> +			.hw_ops = &csiphy_ops_3ph_1_0,
> +			.formats = &csiphy_formats_sdm845,
> +		}
> +	},
> +};
> +
>   static const struct camss_subdev_resources csiphy_res_8775p[] = {
>   	/* CSIPHY0 */
>   	{
Reviewed-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>

