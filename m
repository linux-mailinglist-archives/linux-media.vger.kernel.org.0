Return-Path: <linux-media+bounces-39831-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id BD44CB25515
	for <lists+linux-media@lfdr.de>; Wed, 13 Aug 2025 23:18:56 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id EC45F1C2761E
	for <lists+linux-media@lfdr.de>; Wed, 13 Aug 2025 21:19:15 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B2FA32D641A;
	Wed, 13 Aug 2025 21:18:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="FnCZMsAc"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com [209.85.128.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4CFAF1F4191
	for <linux-media@vger.kernel.org>; Wed, 13 Aug 2025 21:18:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755119928; cv=none; b=I/zLVOtEdpqgyxzihSs1GafbqLUo9Kql0YengXY/FGNbzk4WAGTvWxuYi4UUbTDHjZsSkRTE+yB3171bIrte4Dg37DbsoVMvcuWU0FGz2GMWRo2Ck2JhiqMLrQWq08S42vkWXGGOMjzVue+DbqH8ohxsl72lyO22q5vVjtbM5WM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755119928; c=relaxed/simple;
	bh=159JjksWphg/u3Ou/yWHfdipsTDPtxM9qqh+szH/GOY=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=sHvLAytABIWkiKvoiSxJeQ0pSL/p5IyU+raMTRDN9OUMSsYiXLwzKnNAPLqMrecoCQ+4Zw7ZgVBAlfiFwuh6XwSK6YTvKXb+JTqIn7j8/bb01HADoTwxo7D/N5O1kux+lVV0jyAKeCY85BCgE8LTYGh7hCkO7PX9wo5U4amyvPo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=FnCZMsAc; arc=none smtp.client-ip=209.85.128.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wm1-f45.google.com with SMTP id 5b1f17b1804b1-45a1b00f187so1040495e9.0
        for <linux-media@vger.kernel.org>; Wed, 13 Aug 2025 14:18:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1755119924; x=1755724724; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=PqmDry58z/oQCQIk+cJ1AKlAu2Ei2eYWgYuFg40UKS4=;
        b=FnCZMsAcpicyI2FzXNdanhhyO+t5bYkJTLM8qy/IZv2B+5ChFS7kaLDh9uRcf9/t/l
         NEwS9PC3YQ7ci614goM+wGG5F02s1WXpxic1M1d1+Aj+RlhiwbcboyGerd0tm4Oik2he
         NV/PNOZTGZi1O4kMn8hl0s4px1Fa+KPiG/LMS5Csyw/ltQtsG5Lgr2CaxSYxcw2TsLzm
         y9flbREHmvbyX/h6fKYseL/S5ZNI5ZxrTIKJd3kf+K7orpUHOhADXD1NwuI0VImuwUYJ
         PxfkWDDP9+ZHcspC5fLHBW8+JLVnTm29wbWu2GHRm/ZuAnGQK3NUCLcVTRRVY4Dk72J5
         azOQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755119924; x=1755724724;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=PqmDry58z/oQCQIk+cJ1AKlAu2Ei2eYWgYuFg40UKS4=;
        b=cDzrxbdKUR1Yta2lJyHiwY3xYebQrUZpLtgWE4Exx+07dODsVrfxReea0kGaw2UDAR
         vWynwH2wJtW3/TO7LUrjAPMGbbBsGi4aqoHsWYzP9hJVBXLu/8+vFbWnw1MBLx+Mldto
         A6YMTgRvPu1KIeL7VU0hJaPCy5XZW58hwL/uT/zcyyp5tvETaARYV9ShOg0ZDEZEe/JW
         h8C6EYcyNLIKf5TKhRtVRttDGMdMVrSPPZWlNEWOUT2Ibmt6dNzCyvSQiCjQmk+GAwbF
         hggt2fkeMbWu70OUWa2KZDCHQ2VlrxrizTeCo1eOybicH5Y/ZBOAAWXZYG7/RwrUfAAL
         fNQA==
X-Forwarded-Encrypted: i=1; AJvYcCU61rgMad1oO8+VjqPeW46gul8mChYTUeATXUAtw7vIr+7kCdDn9M2tXikdHUizfuwBy1nVw6kaCc5uzw==@vger.kernel.org
X-Gm-Message-State: AOJu0YwKQOGNn8qwMY30WyHHXgGqPiMly68olVB05+EIa7M/uXkeGkd1
	JH3pisHutujAUYdM5BupFOnXM10Ja1kNUHYIXPWcCBI/+Od4sjUwR7XBoewgcI+hZcg=
X-Gm-Gg: ASbGncsVtJnqjGzPJDas7vEqLJx+Q86zHrz5Iy+asIJajL1tIXQfZ9+u2bgGHAzykc4
	Qe+fQtVWiiUxl6NgW8VsdffyO9gn0sKMzEvYZZHtBLRVLn3gR4ri5vestTCaXmnbWpeJOYUV7sY
	b4vmcY+GES3CShOsKJMaV5u3JV4r7dxwaaIt6zWI4u67LBX7U5QgM2/NrpFloeIJ3fwdJeM4ZFP
	A9iVFCBRElyEg7E3B3QWQIBrbrLAMu+Jy3okGnXM8u6xZ6Y+Ye3+nf7IGxBeT4iMW3AcMB/SnBV
	AWxBRmLGlnQqrFLgjKwMiA7ebCaj7XoHZch9uWT9o0qeNLrkzujEm11W0pnIVTNNGq0M7jXuKdJ
	IO5m4AL1rdxIQvzOHzVBVNtXY2A+uHdDw5GdXADDu6P1R2w0DcsoxoTNFaD0pz3W8
X-Google-Smtp-Source: AGHT+IGVcM00Y26FF+FPGURVp7bTF94M65Mkx8JUXqdBhigzdEAzBLNoXLhJsRfOkHHWGBlHaw1XQA==
X-Received: by 2002:a05:600c:b90:b0:458:bfe1:4a82 with SMTP id 5b1f17b1804b1-45a1b655872mr2584415e9.16.1755119924479;
        Wed, 13 Aug 2025 14:18:44 -0700 (PDT)
Received: from [192.168.0.13] (188-141-3-146.dynamic.upc.ie. [188.141.3.146])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-45a1b789d68sm1106075e9.1.2025.08.13.14.18.43
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 13 Aug 2025 14:18:44 -0700 (PDT)
Message-ID: <b69b884b-c257-4b72-80b0-3251306365ad@linaro.org>
Date: Wed, 13 Aug 2025 22:18:42 +0100
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 6/9] media: qcom: camss: Add support for CSID for
 sa8775p
To: Vikram Sharma <quic_vikramsa@quicinc.com>, rfoss@kernel.org,
 todor.too@gmail.com, mchehab@kernel.org, robh@kernel.org,
 krzk+dt@kernel.org, conor+dt@kernel.org, andersson@kernel.org,
 konradybcio@kernel.org, hverkuil-cisco@xs4all.nl,
 cros-qcom-dts-watchers@chromium.org, catalin.marinas@arm.com, will@kernel.org
Cc: linux-arm-kernel@lists.infradead.org, quic_svankada@quicinc.com,
 linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20250807121105.710072-1-quic_vikramsa@quicinc.com>
 <20250807121105.710072-7-quic_vikramsa@quicinc.com>
From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Content-Language: en-US
In-Reply-To: <20250807121105.710072-7-quic_vikramsa@quicinc.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 07/08/2025 13:11, Vikram Sharma wrote:
> The CSID in sa8775p is version 690, This csid is different from
> csid 780 w.r.t few bit-fields.
> 
> Signed-off-by: Suresh Vankadara <quic_svankada@quicinc.com>
> Signed-off-by: Vikram Sharma <quic_vikramsa@quicinc.com>
> ---
>   .../platform/qcom/camss/camss-csid-gen3.c     |  27 +++-
>   drivers/media/platform/qcom/camss/camss.c     | 133 ++++++++++++++++++
>   2 files changed, 153 insertions(+), 7 deletions(-)
> 
> diff --git a/drivers/media/platform/qcom/camss/camss-csid-gen3.c b/drivers/media/platform/qcom/camss/camss-csid-gen3.c
> index 433908a54baa..fc6a9787febe 100644
> --- a/drivers/media/platform/qcom/camss/camss-csid-gen3.c
> +++ b/drivers/media/platform/qcom/camss/camss-csid-gen3.c
> @@ -45,8 +45,11 @@
>   #define CSID_CSI2_RX_IRQ_CLEAR		0xA4
>   #define CSID_CSI2_RX_IRQ_SET		0xA8
>   
> +#define IS_CSID_690(csid)	(csid->camss->res->version == CAMSS_8775P)
>   #define CSID_BUF_DONE_IRQ_STATUS	0x8C
> -#define		BUF_DONE_IRQ_STATUS_RDI_OFFSET	(csid_is_lite(csid) ? 1 : 14)
> +#define BUF_DONE_IRQ_STATUS_RDI_OFFSET  (csid_is_lite(csid) ?\
> +						1 : (IS_CSID_690(csid) ?\
> +						13 : 14))
>   #define CSID_BUF_DONE_IRQ_MASK		0x90
>   #define CSID_BUF_DONE_IRQ_CLEAR		0x94
>   #define CSID_BUF_DONE_IRQ_SET		0x98
> @@ -59,6 +62,7 @@
>   
>   #define CSID_CSI2_RX_CFG0		0x200
>   #define		CSI2_RX_CFG0_NUM_ACTIVE_LANES	0
> +#define		CSI2_RX_CFG0_VC_MODE		3
>   #define		CSI2_RX_CFG0_DL0_INPUT_SEL	4
>   #define		CSI2_RX_CFG0_PHY_NUM_SEL	20
>   
> @@ -66,7 +70,9 @@
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
> @@ -75,10 +81,14 @@
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
> @@ -86,9 +96,12 @@
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
> diff --git a/drivers/media/platform/qcom/camss/camss.c b/drivers/media/platform/qcom/camss/camss.c
> index 4767d4e7c306..5f1e267045cb 100644
> --- a/drivers/media/platform/qcom/camss/camss.c
> +++ b/drivers/media/platform/qcom/camss/camss.c
> @@ -2554,6 +2554,139 @@ static const struct camss_subdev_resources csiphy_res_8775p[] = {
>   	},
>   };
>   
> +static const struct camss_subdev_resources csid_res_8775p[] = {
> +	/* CSID0 */
> +	{
> +		.regulators = {},
> +		.clock = { "csid", "csiphy_rx"},
> +		.clock_rate = {
> +			{ 400000000, 400000000},
> +			{ 400000000, 400000000}
> +		},
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
> +		.clock = { "csid", "csiphy_rx"},
> +		.clock_rate = {
> +			{ 400000000, 400000000},
> +			{ 400000000, 400000000}
> +		},
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
> +		.clock = { "cpas_vfe_lite", "vfe_lite_ahb",
> +			   "vfe_lite_csid", "vfe_lite_cphy_rx",
> +			   "vfe_lite"},
> +		.clock_rate = {
> +			{ 0, 0, 400000000, 400000000, 0},
> +			{ 0, 0, 400000000, 480000000, 0}
> +		},
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
> +		.clock = { "cpas_vfe_lite", "vfe_lite_ahb",
> +			   "vfe_lite_csid", "vfe_lite_cphy_rx",
> +			   "vfe_lite"},
> +		.clock_rate = {
> +			{ 0, 0, 400000000, 400000000, 0},
> +			{ 0, 0, 400000000, 480000000, 0}
> +		},
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
> +		.clock = { "cpas_vfe_lite", "vfe_lite_ahb",
> +			   "vfe_lite_csid", "vfe_lite_cphy_rx",
> +			   "vfe_lite"},
> +		.clock_rate = {
> +			{ 0, 0, 400000000, 400000000, 0},
> +			{ 0, 0, 400000000, 480000000, 0}
> +		},
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
> +		.clock = { "cpas_vfe_lite", "vfe_lite_ahb",
> +			   "vfe_lite_csid", "vfe_lite_cphy_rx",
> +			   "vfe_lite"},
> +		.clock_rate = {
> +			{ 0, 0, 400000000, 400000000, 0},
> +			{ 0, 0, 400000000, 480000000, 0}
> +		},
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
> +		.clock = { "cpas_vfe_lite", "vfe_lite_ahb",
> +			   "vfe_lite_csid", "vfe_lite_cphy_rx",
> +			   "vfe_lite"},
> +		.clock_rate = {
> +			{ 0, 0, 400000000, 400000000, 0},
> +			{ 0, 0, 400000000, 480000000, 0}
> +		},
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
Reviewed-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>

