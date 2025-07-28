Return-Path: <linux-media+bounces-38566-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 5D63BB13C99
	for <lists+linux-media@lfdr.de>; Mon, 28 Jul 2025 16:13:24 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 76D371890C54
	for <lists+linux-media@lfdr.de>; Mon, 28 Jul 2025 14:06:48 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 88FE2273D85;
	Mon, 28 Jul 2025 14:02:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="k/YQACin"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com [209.85.128.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E7726450F2
	for <linux-media@vger.kernel.org>; Mon, 28 Jul 2025 14:02:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753711339; cv=none; b=egd7tEA7I7X6uaKHoDLJxKHXSvrcdqHSLoUeASLhTVyOKdlVYbKC/e9xfiREFO75M1HosE/e3Rz6Zf2FIUCABPPRKIvBFcX78CyaQr41pHTO76Vz8z/Z7vZiso0Nh6MUpowUCQ7FIb/p8LMd4/u6vsYDUHTihS4CyPiIX0WJZ9Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753711339; c=relaxed/simple;
	bh=KO8i/mUp/L1BpdU8Do+Wpmb2CPG3Q3jG+Kb87u47rKc=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=F16mzIiqHFrw/bxAUY9s2yFG4iG7uJ0ULkBoySTFrw6KwvSHDYCsSLBxDBNrgZwF0Z985zyK1jJGSW3vnmDTbyqbIjOn0vtpySytK6Xc1YuPHugEykvPLs/5FHaalz6alI9y0MV5ot/7Z7OCfvBCQZvTSQDU4b1tSMOnQa5UR/8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=k/YQACin; arc=none smtp.client-ip=209.85.128.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wm1-f52.google.com with SMTP id 5b1f17b1804b1-451d7b50815so29790065e9.2
        for <linux-media@vger.kernel.org>; Mon, 28 Jul 2025 07:02:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1753711334; x=1754316134; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=MDgnlrhOp316LKm8qgqTwB9fvvKHrbdRGlvBul5Nxhw=;
        b=k/YQACiniq1vVuKcRKW0uqjqwoB5EdvCDprEWN2EFVptvsQZd7X/qstseBpaTjhBtk
         32jcRoFzCM1zxkjRaacKawr/ZewVgWWveHPocX5DHBzTVbzgUOfIQE9D5pdBUo8fVwZg
         fmvbpSGjbcjh0Dert4lCzCAIWgZlet9uvBCStDUHrEE1/PjbV0pDzsUVkaGYbwlfb7mT
         CNjvo45T3qnA3QB/4s01WwUE4WpqMoTopuxs0wY+HuKAaxF5daB+ChyQR9Ypq1I58FOB
         DwuACK/D89v+75CqRCkV86ZHQZZKPXg+mEIfBfqDOk4gbLW0CuM8Qqcr+wJlcj776zV6
         LE1A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753711334; x=1754316134;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=MDgnlrhOp316LKm8qgqTwB9fvvKHrbdRGlvBul5Nxhw=;
        b=iSl6Mc8KSMK/2ueLEyKwEk2F5na/1p8M3UWxYBk4cXTo7sBJEmVLPfwxVz2G7uoHBh
         L6u0OQDW0HjAqiVliWNumPo9WPuWvsIyYvIeKMiKUbazM/+K9De/u1AWwtx9om2a1ors
         lVulWxEaqWknA2s7MFvm6p7a2HhAm31F2X+G48o7MzdOJeAa3Yn1If7jIUyMmUc8Nds4
         1YFbiqJDyWWFOLvSjjTcgfgQn2Lyf3TKADCed917pzpqN655AtoJq0b8sMxxA87H4Ifd
         gKPzLy6V2ovJiktkRvTHeCY91ZhWXAFan/wwg8E0Of0ygD9xsnYtlpJTCZpyDoCtMye5
         Tu6Q==
X-Forwarded-Encrypted: i=1; AJvYcCVXU62TgV121gAeHnuDGkmO50e4WimXL917XImMQlG7C6p2n8fW+10zT60bb+Qf0MQUYDk8L1MHw+1z8A==@vger.kernel.org
X-Gm-Message-State: AOJu0Yzee8SJXMRAtJhS+V5LjN0N1Lf9WgdKwTYo09WhdyBCXY4pGZS+
	ehHksuIXALLnJPDg8iDuhV+D4q6eeVuNpDPcFobZr7CSk3N3dzFshj0Y24TDE/mPDBg=
X-Gm-Gg: ASbGncv+/Va5y230IRs3XFbfpOU5BW9vkMzpl7hFyShsLH9CYM19wxWLYbqkdtGp0IX
	Vduv6oAkDxegjDJ48+njGjGCiquyPU0lBWy0J+rHjucMGpcP78Ofn9oSalzXY4FiC/H26VQRkjg
	rKat3oxPpkgvvA0pqRBVH1f2i9BM7R0y2cWN40+ptKRwcIhRMUGmjAtBvDcDQ6GidQThBZiGV9J
	MNUe2ZZKHa7RoKy7RiI3waoXjPWw/jY6ALAFDVrErFHbXk6eutCJ5gcvze/SbE7CwICNW8XsFN8
	N7FsxkHZGgBt7S5H856GhbjEvEHa5dGx0eVXdYBiiztvPoFzciR08h8d4UExihtptzOkovv574H
	aTDINVG0OdLQNsR81f28EnfGCNF/nijV+Ee9nrrAYVUGKURi4uKslsH+gOz+3gCxMfPLd8RXmhA
	==
X-Google-Smtp-Source: AGHT+IEVjNzjQfUAHGkG5K1xgvtcGDceKpvleFX8cpLDujOgXcnJhaEFr7U+ftGk/7ClOLjACshFTA==
X-Received: by 2002:a05:600c:45d1:b0:455:f187:6203 with SMTP id 5b1f17b1804b1-4587654f0camr89203815e9.27.1753711333913;
        Mon, 28 Jul 2025 07:02:13 -0700 (PDT)
Received: from [192.168.0.35] (188-141-3-146.dynamic.upc.ie. [188.141.3.146])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3b778ebaca7sm9122241f8f.30.2025.07.28.07.02.12
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 28 Jul 2025 07:02:13 -0700 (PDT)
Message-ID: <07501287-647f-4bb8-9d6d-42bb37ea04cc@linaro.org>
Date: Mon, 28 Jul 2025 15:02:11 +0100
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 7/9] media: qcom: camss: Add support for CSID for
 sa8775p
To: Vikram Sharma <quic_vikramsa@quicinc.com>, rfoss@kernel.org,
 todor.too@gmail.com, mchehab@kernel.org, robh@kernel.org,
 krzk+dt@kernel.org, conor+dt@kernel.org, andersson@kernel.org,
 konradybcio@kernel.org, hverkuil-cisco@xs4all.nl,
 cros-qcom-dts-watchers@chromium.org, catalin.marinas@arm.com, will@kernel.org
Cc: linux-arm-kernel@lists.infradead.org, quic_svankada@quicinc.com,
 linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20250703171938.3606998-1-quic_vikramsa@quicinc.com>
 <20250703171938.3606998-8-quic_vikramsa@quicinc.com>
From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Content-Language: en-US
In-Reply-To: <20250703171938.3606998-8-quic_vikramsa@quicinc.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 03/07/2025 18:19, Vikram Sharma wrote:
> The CSID in sa8775p is version 690, This csid is different from
> csid 780 w.r.t few bit-fields.
> 
> Co-developed-by: Suresh Vankadara <quic_svankada@quicinc.com>
> Signed-off-by: Suresh Vankadara <quic_svankada@quicinc.com>
> Signed-off-by: Vikram Sharma <quic_vikramsa@quicinc.com>
> ---
>   .../platform/qcom/camss/camss-csid-gen3.c     |  31 +++-
>   drivers/media/platform/qcom/camss/camss.c     | 151 ++++++++++++++++++
>   2 files changed, 175 insertions(+), 7 deletions(-)
> 
> diff --git a/drivers/media/platform/qcom/camss/camss-csid-gen3.c b/drivers/media/platform/qcom/camss/camss-csid-gen3.c
> index 0941152ec301..f62084fb8287 100644
> --- a/drivers/media/platform/qcom/camss/camss-csid-gen3.c
> +++ b/drivers/media/platform/qcom/camss/camss-csid-gen3.c
> @@ -47,8 +47,12 @@
>   #define CSID_CSI2_RX_IRQ_CLEAR		0xA4
>   #define CSID_CSI2_RX_IRQ_SET		0xA8
>   
> +#define IS_CSID_690(csid)	(csid->camss->res->version ==\
> +					CAMSS_8775P ? true : false)

You don't need to make this into a bool.

version == CAMSS_8775P will do exactly the same logical thing.

>   #define CSID_BUF_DONE_IRQ_STATUS	0x8C
> -#define		BUF_DONE_IRQ_STATUS_RDI_OFFSET	(csid_is_lite(csid) ? 1 : 14)
> +#define BUF_DONE_IRQ_STATUS_RDI_OFFSET  (csid_is_lite(csid) ?\
> +						1 : (IS_CSID_690(csid) ?\
> +						13 : 14))
>   #define CSID_BUF_DONE_IRQ_MASK		0x90
>   #define CSID_BUF_DONE_IRQ_CLEAR		0x94
>   #define CSID_BUF_DONE_IRQ_SET		0x98
> @@ -61,6 +65,7 @@
>   
>   #define CSID_CSI2_RX_CFG0		0x200
>   #define		CSI2_RX_CFG0_NUM_ACTIVE_LANES	0
> +#define		CSI2_RX_CFG0_VC_MODE		3
>   #define		CSI2_RX_CFG0_DL0_INPUT_SEL	4
>   #define		CSI2_RX_CFG0_PHY_NUM_SEL	20
>   
> @@ -68,7 +73,9 @@
>   #define		CSI2_RX_CFG1_ECC_CORRECTION_EN	BIT(0)
>   #define		CSI2_RX_CFG1_VC_MODE		BIT(2)
>   
> -#define CSID_RDI_CFG0(rdi)		(0x500 + 0x100 * (rdi))
> +#define CSID_RDI_CFG0(rdi)	(csid_is_lite(csid) && IS_CSID_690(csid) ?\
> +					(0x300 + 0x100 * (rdi)) :\
> +					(0x500 + 0x100 * (rdi)))
>   #define		RDI_CFG0_TIMESTAMP_EN		BIT(6)
>   #define		RDI_CFG0_TIMESTAMP_STB_SEL	BIT(8)
>   #define		RDI_CFG0_DECODE_FORMAT		12
> @@ -77,10 +84,14 @@
>   #define		RDI_CFG0_DT_ID			27
>   #define		RDI_CFG0_EN			BIT(31)
>   
> -#define CSID_RDI_CTRL(rdi)		(0x504 + 0x100 * (rdi))
> +#define CSID_RDI_CTRL(rdi)	(csid_is_lite(csid) && IS_CSID_690(csid) ?\
> +					(0x304 + 0x100 * (rdi)) :\
> +					(0x504 + 0x100 * (rdi)))
>   #define		RDI_CTRL_START_CMD		BIT(0)
>   
> -#define CSID_RDI_CFG1(rdi)		(0x510 + 0x100 * (rdi))
> +#define CSID_RDI_CFG1(rdi)	(csid_is_lite(csid) && IS_CSID_690(csid) ?\
> +					(0x310 + 0x100 * (rdi)) :\
> +					(0x510 + 0x100 * (rdi)))
>   #define		RDI_CFG1_DROP_H_EN		BIT(5)
>   #define		RDI_CFG1_DROP_V_EN		BIT(6)
>   #define		RDI_CFG1_CROP_H_EN		BIT(7)
> @@ -88,9 +99,12 @@
>   #define		RDI_CFG1_PIX_STORE		BIT(10)
>   #define		RDI_CFG1_PACKING_FORMAT_MIPI	BIT(15)
>   
> -#define CSID_RDI_IRQ_SUBSAMPLE_PATTERN(rdi)	(0x548 + 0x100 * (rdi))
> -#define CSID_RDI_IRQ_SUBSAMPLE_PERIOD(rdi)	(0x54C + 0x100 * (rdi))
> -
> +#define CSID_RDI_IRQ_SUBSAMPLE_PATTERN(rdi)	(csid_is_lite(csid) && IS_CSID_690(csid) ?\
> +							(0x348 + 0x100 * (rdi)) :\
> +							(0x548 + 0x100 * (rdi)))
> +#define CSID_RDI_IRQ_SUBSAMPLE_PERIOD(rdi)	(csid_is_lite(csid) && IS_CSID_690(csid) ?\
> +							(0x34C + 0x100 * (rdi)) :\
> +							(0x54C + 0x100 * (rdi)))
>   #define CSI2_RX_CFG0_PHY_SEL_BASE_IDX	1
>   
>   static void __csid_configure_rx(struct csid_device *csid,
> @@ -102,6 +116,9 @@ static void __csid_configure_rx(struct csid_device *csid,
>   	val |= phy->lane_assign << CSI2_RX_CFG0_DL0_INPUT_SEL;
>   	val |= (phy->csiphy_id + CSI2_RX_CFG0_PHY_SEL_BASE_IDX) << CSI2_RX_CFG0_PHY_NUM_SEL;
>   
> +	if (IS_CSID_690(csid) && (vc > 3))
> +		val |= 1 << CSI2_RX_CFG0_VC_MODE;
> +

I remeber that the > 3 has a purpose but, I don't remember of off the 
top of my head what that is.

Please add a comment to state why "> 3" matters.

BTW should this be "> 3" or ">= 3" please double check.

>   	writel(val, csid->base + CSID_CSI2_RX_CFG0);
>   
>   	val = CSI2_RX_CFG1_ECC_CORRECTION_EN;
> diff --git a/drivers/media/platform/qcom/camss/camss.c b/drivers/media/platform/qcom/camss/camss.c
> index ebc3b296bb50..b2398196b9ff 100644
> --- a/drivers/media/platform/qcom/camss/camss.c
> +++ b/drivers/media/platform/qcom/camss/camss.c
> @@ -2269,6 +2269,10 @@ static const struct camss_subdev_resources csiphy_res_8550[] = {
>   	}
>   };
>   
> +static const struct resources_wrapper csid_wrapper_res_sa8775p = {
> +	.reg = "csid_wrapper",
> +};
> +
>   static const struct resources_wrapper csid_wrapper_res_sm8550 = {
>   	.reg = "csid_wrapper",
>   };

Redefining the same string in separate structures over and over again 
seems wasteful.

Please take the opporunity of this new addition to rationalise down the 
string declarations and .. if possible the number of struct 
resources_wrappers we are doing here.

> @@ -2558,6 +2562,153 @@ static const struct camss_subdev_resources csiphy_res_8775p[] = {
>   	},
>   };
>   
> +static const struct camss_subdev_resources csid_res_8775p[] = {
> +	/* CSID0 */
> +	{
> +		.regulators = {},
> +
Zap the newlines.
> +		.clock = { "csid", "csiphy_rx"},
> +		.clock_rate = {
> +			{ 400000000, 400000000},
> +			{ 400000000, 400000000}
> +		},
> +
> +		.reg = { "csid0" },
> +		.interrupt = { "csid0" },
> +		.csid = {
> +			.is_lite = false,
> +			.hw_ops = &csid_ops_gen3,
> +			.parent_dev_ops = &vfe_parent_dev_ops,
> +			.formats = &csid_formats_gen2
> +		}
> +	},
> +	/* CSID1 */
> +	{
> +		.regulators = {},
> +
> +		.clock = { "csid", "csiphy_rx"},
> +		.clock_rate = {
> +			{ 400000000, 400000000},
> +			{ 400000000, 400000000}
> +		},
> +
> +		.reg = { "csid1" },
> +		.interrupt = { "csid1" },
> +		.csid = {
> +			.is_lite = false,
> +			.hw_ops = &csid_ops_gen3,
> +			.parent_dev_ops = &vfe_parent_dev_ops,
> +			.formats = &csid_formats_gen2
> +		}
> +	},
> +
> +	/* CSID2 (lite) */
> +	{
> +		.regulators = {},
> +
> +		.clock = { "cpas_vfe_lite", "vfe_lite_ahb",
> +			   "vfe_lite_csid", "vfe_lite_cphy_rx",
> +			   "vfe_lite"},
> +		.clock_rate = {
> +			{ 0, 0, 400000000, 400000000, 0},
> +			{ 0, 0, 400000000, 480000000, 0}
> +		},
> +
> +		.reg = { "csid_lite0" },
> +		.interrupt = { "csid_lite0" },
> +		.csid = {
> +			.is_lite = true,
> +			.hw_ops = &csid_ops_gen3,
> +			.parent_dev_ops = &vfe_parent_dev_ops,
> +			.formats = &csid_formats_gen2
> +		}
> +	},
> +	/* CSID3 (lite) */
> +	{
> +		.regulators = {},
> +
> +		.clock = { "cpas_vfe_lite", "vfe_lite_ahb",
> +			   "vfe_lite_csid", "vfe_lite_cphy_rx",
> +			   "vfe_lite"},
> +		.clock_rate = {
> +			{ 0, 0, 400000000, 400000000, 0},
> +			{ 0, 0, 400000000, 480000000, 0}
> +		},
> +
> +		.reg = { "csid_lite1" },
> +		.interrupt = { "csid_lite1" },
> +		.csid = {
> +			.is_lite = true,
> +			.hw_ops = &csid_ops_gen3,
> +			.parent_dev_ops = &vfe_parent_dev_ops,
> +			.formats = &csid_formats_gen2
> +		}
> +	},
> +	/* CSID4 (lite) */
> +	{
> +		.regulators = {},
> +
> +		.clock = { "cpas_vfe_lite", "vfe_lite_ahb",
> +			   "vfe_lite_csid", "vfe_lite_cphy_rx",
> +			   "vfe_lite"},
> +		.clock_rate = {
> +			{ 0, 0, 400000000, 400000000, 0},
> +			{ 0, 0, 400000000, 480000000, 0}
> +		},
> +
> +		.reg = { "csid_lite2" },
> +		.interrupt = { "csid_lite2" },
> +		.csid = {
> +			.is_lite = true,
> +			.hw_ops = &csid_ops_gen3,
> +			.parent_dev_ops = &vfe_parent_dev_ops,
> +			.formats = &csid_formats_gen2
> +		}
> +	},
> +	/* CSID5 (lite) */
> +	{
> +		.regulators = {},
> +
> +		.clock = { "cpas_vfe_lite", "vfe_lite_ahb",
> +			   "vfe_lite_csid", "vfe_lite_cphy_rx",
> +			   "vfe_lite"},
> +		.clock_rate = {
> +			{ 0, 0, 400000000, 400000000, 0},
> +			{ 0, 0, 400000000, 480000000, 0}
> +		},
> +
> +		.reg = { "csid_lite3" },
> +		.interrupt = { "csid_lite3" },
> +		.csid = {
> +			.is_lite = true,
> +			.hw_ops = &csid_ops_gen3,
> +			.parent_dev_ops = &vfe_parent_dev_ops,
> +			.formats = &csid_formats_gen2
> +		}
> +	},
> +	/* CSID6 (lite) */
> +	{
> +		.regulators = {},
> +
> +		.clock = { "cpas_vfe_lite", "vfe_lite_ahb",
> +			   "vfe_lite_csid", "vfe_lite_cphy_rx",
> +			   "vfe_lite"},
> +		.clock_rate = {
> +			{ 0, 0, 400000000, 400000000, 0},
> +			{ 0, 0, 400000000, 480000000, 0}
> +		},
> +
> +		.reg = { "csid_lite4" },
> +		.interrupt = { "csid_lite4" },
> +		.csid = {
> +			.is_lite = true,
> +			.hw_ops = &csid_ops_gen3,
> +			.parent_dev_ops = &vfe_parent_dev_ops,
> +			.formats = &csid_formats_gen2
> +		}
> +	},
> +};
> +
>   static const struct resources_icc icc_res_sa8775p[] = {
>   	{
>   		.name = "ahb",

---
bod

