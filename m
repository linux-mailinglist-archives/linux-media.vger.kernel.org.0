Return-Path: <linux-media+bounces-25092-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id A9A40A1895B
	for <lists+linux-media@lfdr.de>; Wed, 22 Jan 2025 02:09:56 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 469EC7A2448
	for <lists+linux-media@lfdr.de>; Wed, 22 Jan 2025 01:09:44 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5B5F342AA1;
	Wed, 22 Jan 2025 01:09:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="vh2IAR7U"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-lj1-f179.google.com (mail-lj1-f179.google.com [209.85.208.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 896082B9A4
	for <linux-media@vger.kernel.org>; Wed, 22 Jan 2025 01:09:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737508183; cv=none; b=nvDJctYUlCMagzoVeTvsotIuXCDioEURpCV+DL338Bnd1WX11TsfO4y7Okm7E9C1CPXQRL77wE24/IyzZ9sVlPV7O5YLGUjkNbfaD6q/Xf7pYhntpiPMLH3CzHdoL3+LlKRBdOyTxWrqrfXeEyQL94r8KJHwRv9BcN2hh2sVs8Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737508183; c=relaxed/simple;
	bh=y0RPDn/gbKIL0U1gUY7KiM3aAkiK8nJyKSBOjIHSMRg=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=kLBxA3gSeDm1tEBFyynZ2pG2zJDD2TpBNW0lgjK8nmFBLLYIjKOj1Q08jjueUz/HqMWNwzf9ZzH1MU2Dg5EJJ4maEpfMS/P5RJkRDM+tedQsyfdg+ZjgNWk+Q/h8AdfUKC8CGcY1qkwkAKtGKgqldXsSpXtA8T/6uJqqEQxTWqM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=vh2IAR7U; arc=none smtp.client-ip=209.85.208.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lj1-f179.google.com with SMTP id 38308e7fff4ca-3001f1232e5so5154841fa.3
        for <linux-media@vger.kernel.org>; Tue, 21 Jan 2025 17:09:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1737508180; x=1738112980; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=bUgYsbOTnfrP1SLzi6WIak7GcqgK8R2slbDIPIUw9xU=;
        b=vh2IAR7UZEq/QElJxnHIbUzf4JCRjXRz6DaY5yIn55v81LWcHyNj8KP48KuNCAg96S
         IuBZjw9prG9OKrLYCtTzaVyzMeFomm0sQ0zG4xMvxrCj6ZFo6kfMrJuTJdB0qWJlTEtR
         nLmYRE6QZirHkN0YXB9lSVjkUD4/UfqvflZsAqmfxIfM/bVMWpZP0NjBn+ZKQJwZZTx0
         FIkQ0znBAW4ZiDry+HBF4zuILUZqEUIbVAqqLvn7VG7ihdpZiy6rbMOdajM7hNsU0d7t
         lIF9AnENRSW0OI/zDx23VjubL34ubyRYuFzL/8sl73B1LFcPodpnHOnuyUF+r6+66gJ6
         +JLg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1737508180; x=1738112980;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=bUgYsbOTnfrP1SLzi6WIak7GcqgK8R2slbDIPIUw9xU=;
        b=E2Xpm0SnxyU2efsf9XFoExuWJ//q4soDsJwY8Pnyhch4nRV1+6kB44geAdL4I9Ly0m
         2uzLqF+rTQx/C7i3R2QEasOVS7v5Sm7BKL3Idnl3r8jtNm18kBMtRCnUMtIo5PwYjYmn
         EJii5pozqsdPF70UVkaCRlONMVJDUUVNzeMC/v/TEJ3wMJ0yWMrTCOp1EMT037ec2VM1
         7v72BYcsw8x3g2pd4Ucj1q8p7BXt+i/JewtH+N8VJHUGfrcSIYfV09AubyVXQ6iIyHbY
         Gf0JIQtz/PlmYoVoA8WOWYuyipaXXQjjiYXfuuLrJAJ4aTISHYnsci9zlwp8qOg5SiIW
         1HkQ==
X-Forwarded-Encrypted: i=1; AJvYcCU2BJ40adB7Ue+qn0/y5T7WW9Bb41jJ3SyCVC1l542HZYNUNOcX1IxQR9G/FiEJEdTsxYCdYg99q0Xg2g==@vger.kernel.org
X-Gm-Message-State: AOJu0Yx7wVg4e/95FXTFggORuxl5nUf5vQFnY4+OlbtUMPXXMqH7bRr/
	xWnSyZF1vwxXYIS/pMtq3s6fiu7ClAsH9ycICqcEMkkLW+C6Tyy/k5z9fZCE0Gw=
X-Gm-Gg: ASbGncv+hiId6VewrpBCBw92lubOlWGrcwnLJExtTlwrvhihH+Vb2s+5rbnQotTGn+C
	Z45HiqxUnW2r9w2Rs7DcM1anMWNR+fxWHEEfG0Dtdvf7NxoKcl53C/LxzXczhndGx7ck3Tpho+6
	k9OsET4xMrT+AniCBkTVDZzUqnjYFDYqXYon7PRkJtcno1eJnMWWmhvH8XHBAzOcHqjx9Cgxtfv
	Uj1L0hPzADEAWHLL5xZyHOZpu/zvr3TJ51AOGs9ngurc4bn0+8mLnPTfOh9r8S7xnepMxIOO1hr
	H8f/MLwlGY9yk9+LaK5chB9HnOss8zfmA+TuGB47OnVngrWw
X-Google-Smtp-Source: AGHT+IGxeLziuK2EEMuWiR3jDB87gK9GGt4+qCFoEOXnzCklxXpT+NeiqT41eWm8tR9pkrlznwKwAg==
X-Received: by 2002:a2e:a585:0:b0:302:1cdd:738d with SMTP id 38308e7fff4ca-3072cb065efmr25735681fa.7.1737508179538;
        Tue, 21 Jan 2025 17:09:39 -0800 (PST)
Received: from [192.168.1.4] (88-112-131-206.elisa-laajakaista.fi. [88.112.131.206])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-3072a4ed6b3sm23881741fa.85.2025.01.21.17.09.37
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 21 Jan 2025 17:09:38 -0800 (PST)
Message-ID: <381929d4-e324-4c4d-bd27-0848bdfc0b63@linaro.org>
Date: Wed, 22 Jan 2025 03:09:36 +0200
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v9 14/16] media: qcom: camss: csiphy-3ph: Add Gen2 v2.1.2
 two-phase MIPI CSI-2 DPHY support
Content-Language: ru-RU
To: Depeng Shao <quic_depengs@quicinc.com>, rfoss@kernel.org,
 todor.too@gmail.com, bryan.odonoghue@linaro.org, mchehab@kernel.org,
 robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org, hverkuil@xs4all.nl
Cc: quic_eberman@quicinc.com, linux-media@vger.kernel.org,
 linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, kernel@quicinc.com
References: <20250113043133.1387162-1-quic_depengs@quicinc.com>
 <20250113043133.1387162-15-quic_depengs@quicinc.com>
From: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
In-Reply-To: <20250113043133.1387162-15-quic_depengs@quicinc.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi Depeng.

On 1/13/25 06:31, Depeng Shao wrote:
> Add a PHY configuration sequence and PHY resource for the sm8550 which
> uses a Qualcomm Gen 2 version 2.1.2 CSI-2 PHY.
> 
> The PHY can be configured as two phase or three phase in C-PHY or D-PHY
> mode. This configuration supports two-phase D-PHY mode.
> 
> Reviewed-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
> Signed-off-by: Depeng Shao <quic_depengs@quicinc.com>
> ---
>   .../qcom/camss/camss-csiphy-3ph-1-0.c         | 111 ++++++++++++++++++
>   drivers/media/platform/qcom/camss/camss.c     | 109 +++++++++++++++++
>   2 files changed, 220 insertions(+)
> 
> diff --git a/drivers/media/platform/qcom/camss/camss-csiphy-3ph-1-0.c b/drivers/media/platform/qcom/camss/camss-csiphy-3ph-1-0.c
> index b5a116ced6a7..a6cc957b986e 100644
> --- a/drivers/media/platform/qcom/camss/camss-csiphy-3ph-1-0.c
> +++ b/drivers/media/platform/qcom/camss/camss-csiphy-3ph-1-0.c
> @@ -318,6 +318,111 @@ csiphy_lane_regs lane_regs_sm8250[] = {
>   	{0x0884, 0x01, 0x00, CSIPHY_DEFAULT_PARAMS},
>   };
>   
> +/* GEN2 2.1.2 2PH DPHY mode */
> +static const struct
> +csiphy_lane_regs lane_regs_sm8550[] = {
> +	{0x0E90, 0x0F, 0x00, CSIPHY_DEFAULT_PARAMS},
> +	{0x0E98, 0x08, 0x00, CSIPHY_DEFAULT_PARAMS},
> +	{0x0E94, 0x07, 0x01, CSIPHY_DEFAULT_PARAMS},

With respect to Bryan's change

https://lore.kernel.org/linux-media/20250120-linux-next-25-01-19-x1e80100-camss-driver-v1-5-44c62a0edcd2@linaro.org/

Is the added delay in us or ns units?

> +	{0x00A0, 0x00, 0x00, CSIPHY_DEFAULT_PARAMS},
> +	{0x0090, 0x0F, 0x00, CSIPHY_DEFAULT_PARAMS},
> +	{0x0098, 0x08, 0x00, CSIPHY_DEFAULT_PARAMS},
> +	{0x0094, 0x07, 0x01, CSIPHY_DEFAULT_PARAMS},
> +	{0x0494, 0x00, 0x00, CSIPHY_DEFAULT_PARAMS},
> +	{0x04A0, 0x00, 0x00, CSIPHY_DEFAULT_PARAMS},
> +	{0x0490, 0x0F, 0x00, CSIPHY_DEFAULT_PARAMS},
> +	{0x0498, 0x08, 0x00, CSIPHY_DEFAULT_PARAMS},
> +	{0x0494, 0x07, 0x01, CSIPHY_DEFAULT_PARAMS},
> +	{0x0894, 0x00, 0x00, CSIPHY_DEFAULT_PARAMS},
> +	{0x08A0, 0x00, 0x00, CSIPHY_DEFAULT_PARAMS},
> +	{0x0890, 0x0F, 0x00, CSIPHY_DEFAULT_PARAMS},
> +	{0x0898, 0x08, 0x00, CSIPHY_DEFAULT_PARAMS},
> +	{0x0894, 0x07, 0x01, CSIPHY_DEFAULT_PARAMS},
> +	{0x0C94, 0x00, 0x00, CSIPHY_DEFAULT_PARAMS},
> +	{0x0CA0, 0x00, 0x00, CSIPHY_DEFAULT_PARAMS},
> +	{0x0C90, 0x0F, 0x00, CSIPHY_DEFAULT_PARAMS},
> +	{0x0C98, 0x08, 0x00, CSIPHY_DEFAULT_PARAMS},
> +	{0x0C94, 0x07, 0x01, CSIPHY_DEFAULT_PARAMS},
> +	{0x0E30, 0x00, 0x00, CSIPHY_DEFAULT_PARAMS},
> +	{0x0E28, 0x04, 0x00, CSIPHY_DEFAULT_PARAMS},
> +	{0x0E00, 0x80, 0x00, CSIPHY_DEFAULT_PARAMS},
> +	{0x0E0C, 0xFF, 0x00, CSIPHY_DEFAULT_PARAMS},
> +	{0x0E38, 0x1F, 0x00, CSIPHY_DEFAULT_PARAMS},
> +	{0x0E2C, 0x01, 0x00, CSIPHY_DEFAULT_PARAMS},
> +	{0x0E34, 0x0F, 0x00, CSIPHY_DEFAULT_PARAMS},
> +	{0x0E1C, 0x0A, 0x00, CSIPHY_DEFAULT_PARAMS},
> +	{0x0E14, 0x60, 0x00, CSIPHY_DEFAULT_PARAMS},
> +	{0x0E3C, 0xB8, 0x00, CSIPHY_DEFAULT_PARAMS},
> +	{0x0E04, 0x0C, 0x00, CSIPHY_DEFAULT_PARAMS},
> +	{0x0E20, 0x00, 0x00, CSIPHY_DEFAULT_PARAMS},
> +	{0x0E08, 0x10, 0x00, CSIPHY_SETTLE_CNT_LOWER_BYTE},
> +	{0x0E10, 0x52, 0x00, CSIPHY_DEFAULT_PARAMS},
> +	{0x0030, 0x00, 0x00, CSIPHY_DEFAULT_PARAMS},
> +	{0x0000, 0x8E, 0x00, CSIPHY_DEFAULT_PARAMS},
> +	{0x0038, 0xFE, 0x00, CSIPHY_DEFAULT_PARAMS},
> +	{0x002C, 0x01, 0x00, CSIPHY_DEFAULT_PARAMS},
> +	{0x0034, 0x0F, 0x00, CSIPHY_DEFAULT_PARAMS},
> +	{0x001C, 0x0A, 0x00, CSIPHY_DEFAULT_PARAMS},
> +	{0x0014, 0x60, 0x00, CSIPHY_DEFAULT_PARAMS},
> +	{0x003C, 0xB8, 0x00, CSIPHY_DEFAULT_PARAMS},
> +	{0x0004, 0x0C, 0x00, CSIPHY_DEFAULT_PARAMS},
> +	{0x0020, 0x00, 0x00, CSIPHY_DEFAULT_PARAMS},
> +	{0x0008, 0x10, 0x00, CSIPHY_SETTLE_CNT_LOWER_BYTE},
> +	{0x0010, 0x52, 0x00, CSIPHY_DEFAULT_PARAMS},
> +	{0x0430, 0x00, 0x00, CSIPHY_DEFAULT_PARAMS},
> +	{0x0400, 0x8E, 0x00, CSIPHY_DEFAULT_PARAMS},
> +	{0x0438, 0xFE, 0x00, CSIPHY_DEFAULT_PARAMS},
> +	{0x042C, 0x01, 0x00, CSIPHY_DEFAULT_PARAMS},
> +	{0x0434, 0x0F, 0x00, CSIPHY_DEFAULT_PARAMS},
> +	{0x041C, 0x0A, 0x00, CSIPHY_DEFAULT_PARAMS},
> +	{0x0414, 0x60, 0x00, CSIPHY_DEFAULT_PARAMS},
> +	{0x043C, 0xB8, 0x00, CSIPHY_DEFAULT_PARAMS},
> +	{0x0404, 0x0C, 0x00, CSIPHY_DEFAULT_PARAMS},
> +	{0x0420, 0x00, 0x00, CSIPHY_DEFAULT_PARAMS},
> +	{0x0408, 0x10, 0x00, CSIPHY_SETTLE_CNT_LOWER_BYTE},
> +	{0x0410, 0x52, 0x00, CSIPHY_DEFAULT_PARAMS},
> +	{0x0830, 0x00, 0x00, CSIPHY_DEFAULT_PARAMS},
> +	{0x0800, 0x8E, 0x00, CSIPHY_DEFAULT_PARAMS},
> +	{0x0838, 0xFE, 0x00, CSIPHY_DEFAULT_PARAMS},
> +	{0x082C, 0x01, 0x00, CSIPHY_DEFAULT_PARAMS},
> +	{0x0834, 0x0F, 0x00, CSIPHY_DEFAULT_PARAMS},
> +	{0x081C, 0x0A, 0x00, CSIPHY_DEFAULT_PARAMS},
> +	{0x0814, 0x60, 0x00, CSIPHY_DEFAULT_PARAMS},
> +	{0x083C, 0xB8, 0x00, CSIPHY_DEFAULT_PARAMS},
> +	{0x0804, 0x0C, 0x00, CSIPHY_DEFAULT_PARAMS},
> +	{0x0820, 0x00, 0x00, CSIPHY_DEFAULT_PARAMS},
> +	{0x0808, 0x10, 0x00, CSIPHY_SETTLE_CNT_LOWER_BYTE},
> +	{0x0810, 0x52, 0x00, CSIPHY_DEFAULT_PARAMS},
> +	{0x0C30, 0x00, 0x00, CSIPHY_DEFAULT_PARAMS},
> +	{0x0C00, 0x8E, 0x00, CSIPHY_DEFAULT_PARAMS},
> +	{0x0C38, 0xFE, 0x00, CSIPHY_DEFAULT_PARAMS},
> +	{0x0C2C, 0x01, 0x00, CSIPHY_DEFAULT_PARAMS},
> +	{0x0C34, 0x0F, 0x00, CSIPHY_DEFAULT_PARAMS},
> +	{0x0C1C, 0x0A, 0x00, CSIPHY_DEFAULT_PARAMS},
> +	{0x0C14, 0x60, 0x00, CSIPHY_DEFAULT_PARAMS},
> +	{0x0C3C, 0xB8, 0x00, CSIPHY_DEFAULT_PARAMS},
> +	{0x0C04, 0x0C, 0x00, CSIPHY_DEFAULT_PARAMS},
> +	{0x0C20, 0x00, 0x00, CSIPHY_DEFAULT_PARAMS},
> +	{0x0C08, 0x10, 0x00, CSIPHY_SETTLE_CNT_LOWER_BYTE},
> +	{0x0C10, 0x52, 0x00, CSIPHY_DEFAULT_PARAMS},
> +	{0x0094, 0xD7, 0x00, CSIPHY_DEFAULT_PARAMS},
> +	{0x005C, 0x04, 0x00, CSIPHY_DEFAULT_PARAMS},
> +	{0x0060, 0xBD, 0x00, CSIPHY_DEFAULT_PARAMS},
> +	{0x0064, 0x7F, 0x00, CSIPHY_DEFAULT_PARAMS},
> +	{0x0494, 0xD7, 0x00, CSIPHY_DEFAULT_PARAMS},
> +	{0x045C, 0x04, 0x00, CSIPHY_DEFAULT_PARAMS},
> +	{0x0460, 0xBD, 0x00, CSIPHY_DEFAULT_PARAMS},
> +	{0x0464, 0x7F, 0x00, CSIPHY_DEFAULT_PARAMS},
> +	{0x0894, 0xD7, 0x00, CSIPHY_DEFAULT_PARAMS},
> +	{0x085C, 0x04, 0x00, CSIPHY_DEFAULT_PARAMS},
> +	{0x0860, 0xBD, 0x00, CSIPHY_DEFAULT_PARAMS},
> +	{0x0864, 0x7F, 0x00, CSIPHY_DEFAULT_PARAMS},
> +	{0x0C94, 0xD7, 0x00, CSIPHY_DEFAULT_PARAMS},
> +	{0x0C5C, 0x04, 0x00, CSIPHY_DEFAULT_PARAMS},
> +	{0x0C60, 0xBD, 0x00, CSIPHY_DEFAULT_PARAMS},
> +	{0x0C64, 0x7F, 0x00, CSIPHY_DEFAULT_PARAMS},
> +};
> +
>   static void csiphy_hw_version_read(struct csiphy_device *csiphy,
>   				   struct device *dev)
>   {
> @@ -520,6 +625,7 @@ static bool csiphy_is_gen2(u32 version)
>   	case CAMSS_8250:
>   	case CAMSS_8280XP:
>   	case CAMSS_845:
> +	case CAMSS_8550:
>   		ret = true;
>   		break;
>   	}
> @@ -608,6 +714,11 @@ static int csiphy_init(struct csiphy_device *csiphy)
>   		regs->lane_regs = &lane_regs_sc8280xp[0];
>   		regs->lane_array_size = ARRAY_SIZE(lane_regs_sc8280xp);
>   		break;
> +	case CAMSS_8550:
> +		regs->lane_regs = &lane_regs_sm8550[0];
> +		regs->lane_array_size = ARRAY_SIZE(lane_regs_sm8550);
> +		regs->offset = 0x1000;
> +		break;
>   	default:
>   		WARN(1, "unknown csiphy version\n");
>   		return -ENODEV;
> diff --git a/drivers/media/platform/qcom/camss/camss.c b/drivers/media/platform/qcom/camss/camss.c
> index a1b8f202c8bb..80f8b77547a1 100644
> --- a/drivers/media/platform/qcom/camss/camss.c
> +++ b/drivers/media/platform/qcom/camss/camss.c
> @@ -1938,6 +1938,113 @@ static const struct resources_icc icc_res_sc8280xp[] = {
>   	},
>   };
>   
> +static const struct camss_subdev_resources csiphy_res_8550[] = {
> +	/* CSIPHY0 */
> +	{
> +		.regulators = { "vdda-phy", "vdda-pll" },

I still assume that the supply names should be renamed to *-0p9 and *-1p2,
it's an easy fix...

> +		.clock = { "csiphy0", "csiphy0_timer" },
> +		.clock_rate = { { 400000000, 480000000 },
> +				{ 400000000 } },
> +		.reg = { "csiphy0" },
> +		.interrupt = { "csiphy0" },
> +		.csiphy = {
> +			.hw_ops = &csiphy_ops_3ph_1_0,
> +			.formats = &csiphy_formats_sdm845
> +		}
> +	},
> +	/* CSIPHY1 */
> +	{
> +		.regulators = { "vdda-phy", "vdda-pll" },
> +		.clock = { "csiphy1", "csiphy1_timer" },
> +		.clock_rate = { { 400000000, 480000000 },
> +				{ 400000000 } },
> +		.reg = { "csiphy1" },
> +		.interrupt = { "csiphy1" },
> +		.csiphy = {
> +			.hw_ops = &csiphy_ops_3ph_1_0,
> +			.formats = &csiphy_formats_sdm845
> +		}
> +	},
> +	/* CSIPHY2 */
> +	{
> +		.regulators = { "vdda-phy", "vdda-pll" },
> +		.clock = { "csiphy2", "csiphy2_timer" },
> +		.clock_rate = { { 400000000, 480000000 },
> +				{ 400000000 } },
> +		.reg = { "csiphy2" },
> +		.interrupt = { "csiphy2" },
> +		.csiphy = {
> +			.hw_ops = &csiphy_ops_3ph_1_0,
> +			.formats = &csiphy_formats_sdm845
> +		}
> +	},
> +	/* CSIPHY3 */
> +	{
> +		.regulators = { "vdda-phy", "vdda-pll" },
> +		.clock = { "csiphy3", "csiphy3_timer" },
> +		.clock_rate = { { 400000000, 480000000 },
> +				{ 400000000 } },
> +		.reg = { "csiphy3" },
> +		.interrupt = { "csiphy3" },
> +		.csiphy = {
> +			.hw_ops = &csiphy_ops_3ph_1_0,
> +			.formats = &csiphy_formats_sdm845
> +		}
> +	},
> +	/* CSIPHY4 */
> +	{
> +		.regulators = { "vdda-phy", "vdda-pll" },
> +		.clock = { "csiphy4", "csiphy4_timer" },
> +		.clock_rate = { { 400000000, 480000000 },
> +				{ 400000000 } },
> +		.reg = { "csiphy4" },
> +		.interrupt = { "csiphy4" },
> +		.csiphy = {
> +			.hw_ops = &csiphy_ops_3ph_1_0,
> +			.formats = &csiphy_formats_sdm845
> +		}
> +	},
> +	/* CSIPHY5 */
> +	{
> +		.regulators = { "vdda-phy", "vdda-pll" },
> +		.clock = { "csiphy5", "csiphy5_timer" },
> +		.clock_rate = { { 400000000, 480000000 },
> +				{ 400000000 } },
> +		.reg = { "csiphy5" },
> +		.interrupt = { "csiphy5" },
> +		.csiphy = {
> +			.hw_ops = &csiphy_ops_3ph_1_0,
> +			.formats = &csiphy_formats_sdm845
> +		}
> +	},
> +	/* CSIPHY6 */
> +	{
> +		.regulators = { "vdda-phy", "vdda-pll" },
> +		.clock = { "csiphy6", "csiphy6_timer" },
> +		.clock_rate = { { 400000000, 480000000 },
> +				{ 400000000 } },
> +		.reg = { "csiphy6" },
> +		.interrupt = { "csiphy6" },
> +		.csiphy = {
> +			.hw_ops = &csiphy_ops_3ph_1_0,
> +			.formats = &csiphy_formats_sdm845
> +		}
> +	},
> +	/* CSIPHY7 */
> +	{
> +		.regulators = { "vdda-phy", "vdda-pll" },
> +		.clock = { "csiphy7", "csiphy7_timer" },
> +		.clock_rate = { { 400000000, 480000000 },
> +				{ 400000000 } },
> +		.reg = { "csiphy7" },
> +		.interrupt = { "csiphy7" },
> +		.csiphy = {
> +			.hw_ops = &csiphy_ops_3ph_1_0,
> +			.formats = &csiphy_formats_sdm845
> +		}
> +	}
> +};
> +
>   static const struct resources_icc icc_res_sm8550[] = {
>   	{
>   		.name = "ahb",
> @@ -2990,8 +3097,10 @@ static const struct camss_resources sc7280_resources = {
>   static const struct camss_resources sm8550_resources = {
>   	.version = CAMSS_8550,
>   	.pd_name = "top",
> +	.csiphy_res = csiphy_res_8550,
>   	.icc_res = icc_res_sm8550,
>   	.icc_path_num = ARRAY_SIZE(icc_res_sm8550),
> +	.csiphy_num = ARRAY_SIZE(csiphy_res_8550),
>   	.link_entities = camss_link_entities
>   };
>   

--
Best wishes,
Vladimir

