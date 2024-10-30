Return-Path: <linux-media+bounces-20581-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 0C0229B612E
	for <lists+linux-media@lfdr.de>; Wed, 30 Oct 2024 12:15:54 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 5AAEDB220C6
	for <lists+linux-media@lfdr.de>; Wed, 30 Oct 2024 11:15:51 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8E4571E47D1;
	Wed, 30 Oct 2024 11:15:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="OK29gaPi"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-lf1-f42.google.com (mail-lf1-f42.google.com [209.85.167.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C4F61194C61
	for <linux-media@vger.kernel.org>; Wed, 30 Oct 2024 11:15:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730286942; cv=none; b=MrMLPYx+eJBiQkHnH+g+TzmQ6r4yECTXM0J/w5rk7Asd9dSwqimv6noaE2h3cJ/G4h5y1i1v5Earf1y3gUp2U2vuWLhRFWIhj1Z9Ll+PmkwFxLeCzE9zz9JCJapeERLiXDdsz/hsvyPonicK/emOLx9u+HSHP9ZNefBVOXZjYUg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730286942; c=relaxed/simple;
	bh=jKt4DqhUeqn5+aQpA8Y9FsxFBiSCB6U1bKfAyqLY0wc=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=mTrQekQxJFtHor9q3LO0x8dy762c/YjtjQC2lfgKuUqa+ka/bBatiJ7zeht8fIG97cbn8AWenIQg5NNb5Pnt7ntk0wDgHsSgZTwu4KiHsvKmaDUeD14GgjB3xjaCjVUkmBVnrO/2lTkGPUov7+ITCe/66S4Cm8is66Y3XNK9WdE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=OK29gaPi; arc=none smtp.client-ip=209.85.167.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lf1-f42.google.com with SMTP id 2adb3069b0e04-53b13eae3b3so850352e87.3
        for <linux-media@vger.kernel.org>; Wed, 30 Oct 2024 04:15:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1730286937; x=1730891737; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=HnsM1ZBtYqvT9Z+Nzk3/lpUZceeOsS1rj6sXVLhZuAQ=;
        b=OK29gaPiZZXoUUdyLsvN4YwFal1TEeOA/0keFpx3t87G8wTnUyAD6odXK5lukyzRXA
         eYEp0A1ue3YKdUs9DdU+4Kme41LNRAL8YHz6sqF7cixgFHY4zunlAuQvioWcLiiZENSp
         h4YkVceeKKO2fpDkBYPhkVlwSlG/VqO83zjv7XE4vVoqh2qlYxHwVvNCSC98iRnPUSle
         jUHKhsa20NwcSC7rfaC+POq42ASAAjiuCfFeGZFIqZ//znpurtgGZjyVk5l99VgYUUmH
         KpnYytq/CPt+dAW+WXoA51d88FlbwC6HEeuQI/7+ie+b2zjvPpwaF4gW//E/DdEIrEUe
         ab1A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730286937; x=1730891737;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=HnsM1ZBtYqvT9Z+Nzk3/lpUZceeOsS1rj6sXVLhZuAQ=;
        b=vH6iPfUbWxlWoLpDSVfMPm3TtvXgeaZI7TxO0Z75uMolHCO2qm/TJN3PvNsLquSKMT
         qoTDszgzK+Rz+nnlyVby33ra9/tJu+Chb2+fcq2YeBnhKB0rAThSfb0rVxShT/n3wc1c
         AUF/v6IJdokDXsLDfP86dNknRXJkskwYjhmMBx/XgeZkD97GJK3nhJGYm3TdukqFMj9d
         hDhCl9/AsyqYzZkky2LPokQwxbMSiwzsOtG1F3chep73XRHhefg6W6ox/6vDVOPGaYVQ
         G82Z7C6Q2Fntiwpr29QUmbhgHRfJHRRdXfJjMWUTCRx+c0c/yJScuGo1mqno425/uFU0
         nIuw==
X-Forwarded-Encrypted: i=1; AJvYcCXxsOmaNOIMJKsPNwc2GPBquu1rbvUZIcgg3jVmUDwtYuaA8BtMA6cfSrVFYd+8UyotWyZFfFahM3KuhA==@vger.kernel.org
X-Gm-Message-State: AOJu0YzfYCBknOOAaVS1boNvyaVzAnbOm5Ld4RLzPvAgXfhAUVsjY1Fp
	SZPNfV2YPioMTFe6eeCSL5CIRZyEXq3X8TfkRs7AOVxjYXBeCf5qvbn50RC1r08=
X-Google-Smtp-Source: AGHT+IE3dqpNlZfQxOsTMecDBegcXtAhg1qM3SUzh2z1nBFVAfgCbdnROiIgjFhTayIPs3zag/DDAw==
X-Received: by 2002:a05:651c:b0a:b0:2fb:591d:3de1 with SMTP id 38308e7fff4ca-2fcbe0c1d42mr23445641fa.7.1730286936940;
        Wed, 30 Oct 2024 04:15:36 -0700 (PDT)
Received: from [192.168.1.4] (88-112-131-206.elisa-laajakaista.fi. [88.112.131.206])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-2fd536a2d1fsm2347011fa.140.2024.10.30.04.15.35
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 30 Oct 2024 04:15:36 -0700 (PDT)
Message-ID: <ec9b08dd-c889-4166-a579-27cd0fdd4329@linaro.org>
Date: Wed, 30 Oct 2024 13:15:35 +0200
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 3/6] media: qcom: camss: Add support for camss driver
 on SC7280
Content-Language: en-US
To: Vikram Sharma <quic_vikramsa@quicinc.com>, rfoss@kernel.org,
 todor.too@gmail.com, bryan.odonoghue@linaro.org, mchehab@kernel.org,
 robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
 akapatra@quicinc.com, hariramp@quicinc.com, andersson@kernel.org,
 konradybcio@kernel.org, hverkuil-cisco@xs4all.nl,
 cros-qcom-dts-watchers@chromium.org, catalin.marinas@arm.com, will@kernel.org
Cc: linux-arm-kernel@lists.infradead.org, linux-media@vger.kernel.org,
 linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, kernel@quicinc.com
References: <20241030105347.2117034-1-quic_vikramsa@quicinc.com>
 <20241030105347.2117034-4-quic_vikramsa@quicinc.com>
From: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
In-Reply-To: <20241030105347.2117034-4-quic_vikramsa@quicinc.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 10/30/24 12:53, Vikram Sharma wrote:
> From: Suresh Vankadara <quic_svankada@quicinc.com>
> 
> Add support for the camss driver on the SC7280 SoC.
> 
> Signed-off-by: Suresh Vankadara <quic_svankada@quicinc.com>
> Signed-off-by: Trishansh Bhardwaj <quic_tbhardwa@quicinc.com>
> Signed-off-by: Vikram Sharma <quic_vikramsa@quicinc.com>
> ---
>   .../media/platform/qcom/camss/camss-csid.c    |   1 -
>   .../qcom/camss/camss-csiphy-3ph-1-0.c         |   5 +
>   .../media/platform/qcom/camss/camss-csiphy.c  |   5 +
>   .../media/platform/qcom/camss/camss-csiphy.h  |   1 +
>   drivers/media/platform/qcom/camss/camss-vfe.c |   2 +
>   drivers/media/platform/qcom/camss/camss.c     | 339 ++++++++++++++++++
>   drivers/media/platform/qcom/camss/camss.h     |   1 +
>   7 files changed, 353 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/media/platform/qcom/camss/camss-csid.c b/drivers/media/platform/qcom/camss/camss-csid.c
> index 858db5d4ca75..8d3dc26e2af4 100644
> --- a/drivers/media/platform/qcom/camss/camss-csid.c
> +++ b/drivers/media/platform/qcom/camss/camss-csid.c
> @@ -1028,7 +1028,6 @@ int msm_csid_subdev_init(struct camss *camss, struct csid_device *csid,
>   	csid->res->hw_ops->subdev_init(csid);
>   
>   	/* Memory */
> -
>   	if (camss->res->version == CAMSS_8250) {
>   		/* for titan 480, CSID registers are inside the VFE region,
>   		 * between the VFE "top" and "bus" registers. this requires
> diff --git a/drivers/media/platform/qcom/camss/camss-csiphy-3ph-1-0.c b/drivers/media/platform/qcom/camss/camss-csiphy-3ph-1-0.c
> index 7d2490c9de01..f341f7b7fd8a 100644
> --- a/drivers/media/platform/qcom/camss/camss-csiphy-3ph-1-0.c
> +++ b/drivers/media/platform/qcom/camss/camss-csiphy-3ph-1-0.c
> @@ -505,6 +505,10 @@ static void csiphy_gen2_config_lanes(struct csiphy_device *csiphy,
>   	u32 val;
>   
>   	switch (csiphy->camss->res->version) {
> +	case CAMSS_7280:
> +		r = &lane_regs_sm8250[0][0];
> +		array_size = ARRAY_SIZE(lane_regs_sm8250[0]);
> +		break;
>   	case CAMSS_8250:
>   		r = &lane_regs_sm8250[0][0];
>   		array_size = ARRAY_SIZE(lane_regs_sm8250[0]);
> @@ -557,6 +561,7 @@ static bool csiphy_is_gen2(u32 version)
>   	bool ret = false;
>   
>   	switch (version) {
> +	case CAMSS_7280:
>   	case CAMSS_8250:
>   	case CAMSS_8280XP:
>   	case CAMSS_845:
> diff --git a/drivers/media/platform/qcom/camss/camss-csiphy.c b/drivers/media/platform/qcom/camss/camss-csiphy.c
> index 68a3ea1ba2a5..9722cee4143f 100644
> --- a/drivers/media/platform/qcom/camss/camss-csiphy.c
> +++ b/drivers/media/platform/qcom/camss/camss-csiphy.c
> @@ -108,6 +108,11 @@ const struct csiphy_formats csiphy_formats_sdm845 = {
>   	.formats = formats_sdm845
>   };
>   
> +const struct csiphy_formats csiphy_formats_sc7280 = {
> +	.nformats = ARRAY_SIZE(formats_sdm845),
> +	.formats = formats_sdm845
> +};
> +

Since you are picky about alphabetical sorting, you may need to keep
it here as well.

>   /*
>    * csiphy_get_bpp - map media bus format to bits per pixel
>    * @formats: supported media bus formats array
> diff --git a/drivers/media/platform/qcom/camss/camss-csiphy.h b/drivers/media/platform/qcom/camss/camss-csiphy.h
> index eebc1ff1cfab..67a96ef55bb6 100644
> --- a/drivers/media/platform/qcom/camss/camss-csiphy.h
> +++ b/drivers/media/platform/qcom/camss/camss-csiphy.h
> @@ -112,6 +112,7 @@ void msm_csiphy_unregister_entity(struct csiphy_device *csiphy);
>   extern const struct csiphy_formats csiphy_formats_8x16;
>   extern const struct csiphy_formats csiphy_formats_8x96;
>   extern const struct csiphy_formats csiphy_formats_sdm845;
> +extern const struct csiphy_formats csiphy_formats_sc7280;

Same comment as above.

>   
>   extern const struct csiphy_hw_ops csiphy_ops_2ph_1_0;
>   extern const struct csiphy_hw_ops csiphy_ops_3ph_1_0;
> diff --git a/drivers/media/platform/qcom/camss/camss-vfe.c b/drivers/media/platform/qcom/camss/camss-vfe.c
> index ffcb1e2ec417..61f6815a3756 100644
> --- a/drivers/media/platform/qcom/camss/camss-vfe.c
> +++ b/drivers/media/platform/qcom/camss/camss-vfe.c
> @@ -334,6 +334,7 @@ static u32 vfe_src_pad_code(struct vfe_line *line, u32 sink_code,
>   		}
>   		break;
>   	case CAMSS_660:
> +	case CAMSS_7280:
>   	case CAMSS_8x96:
>   	case CAMSS_8250:
>   	case CAMSS_8280XP:
> @@ -1692,6 +1693,7 @@ static int vfe_bpl_align(struct vfe_device *vfe)
>   	int ret = 8;
>   
>   	switch (vfe->camss->res->version) {
> +	case CAMSS_7280:
>   	case CAMSS_8250:
>   	case CAMSS_8280XP:
>   	case CAMSS_845:
> diff --git a/drivers/media/platform/qcom/camss/camss.c b/drivers/media/platform/qcom/camss/camss.c
> index e8cd8afe7bee..addaed8f77cb 100644
> --- a/drivers/media/platform/qcom/camss/camss.c
> +++ b/drivers/media/platform/qcom/camss/camss.c
> @@ -1480,6 +1480,330 @@ static const struct resources_icc icc_res_sc8280xp[] = {
>   	},
>   };
>   
> +static const struct camss_subdev_resources csiphy_res_7280[] = {

Same comment as above.

> +	/* CSIPHY0 */
> +	{
> +		.regulators = {},
> +		.clock = { "csiphy0", "csiphy0_timer"},
> +		.clock_rate = {
> +			{ 300000000 },
> +			{ 300000000 }
> +		},
> +		.reg = { "csiphy0" },
> +		.interrupt = { "csiphy0" },
> +		.csiphy = {
> +			.hw_ops = &csiphy_ops_3ph_1_0,
> +			.formats = &csiphy_formats_sc7280
> +		}
> +	},
> +	/* CSIPHY1 */
> +	{
> +		.regulators = {},
> +		.clock = { "csiphy1", "csiphy1_timer"},
> +		.clock_rate = {
> +			{ 300000000 },
> +			{ 300000000 }
> +		},
> +		.reg = { "csiphy1" },
> +		.interrupt = { "csiphy1" },
> +		.csiphy = {
> +			.hw_ops = &csiphy_ops_3ph_1_0,
> +			.formats = &csiphy_formats_sc7280
> +		}
> +	},
> +	/* CSIPHY2 */
> +	{
> +		.regulators = {},
> +		.clock = { "csiphy2", "csiphy2_timer"},
> +		.clock_rate = {
> +			{ 300000000 },
> +			{ 300000000 }
> +		},
> +		.reg = { "csiphy2" },
> +		.interrupt = { "csiphy2" },
> +		.csiphy = {
> +			.hw_ops = &csiphy_ops_3ph_1_0,
> +			.formats = &csiphy_formats_sc7280
> +		}
> +	},
> +	/* CSIPHY3 */
> +	{
> +		.regulators = {},
> +		.clock = { "csiphy3", "csiphy3_timer"},
> +		.clock_rate = {
> +			{ 300000000 },
> +			{ 300000000 }
> +		},
> +		.reg = { "csiphy3" },
> +		.interrupt = { "csiphy3" },
> +		.csiphy = {
> +			.hw_ops = &csiphy_ops_3ph_1_0,
> +			.formats = &csiphy_formats_sc7280
> +		}
> +	},
> +	/* CSIPHY4 */
> +	{
> +		.regulators = {},
> +		.clock = { "csiphy4", "csiphy4_timer"},
> +		.clock_rate = {
> +			{ 300000000 },
> +			{ 300000000 }
> +		},
> +		.reg = { "csiphy4" },
> +		.interrupt = { "csiphy4" },
> +		.csiphy = {
> +			.hw_ops = &csiphy_ops_3ph_1_0,
> +			.formats = &csiphy_formats_sc7280
> +		}
> +	},
> +};
> +
> +static const struct camss_subdev_resources csid_res_7280[] = {
> +	/* CSID0 */
> +	{
> +		.regulators = { "vdda-phy", "vdda-pll" },

Supply regulators shall be properties of CSIPHY IP and its representation
in the driver.

> +
> +		.clock = { "csi0", "vfe0_cphy_rx", "vfe0", "soc_ahb"},
> +		.clock_rate = {
> +			{ 300000000, 0, 380000000, 0},
> +			{ 400000000, 0, 510000000, 0},
> +			{ 400000000, 0, 637000000, 0},
> +			{ 400000000, 0, 760000000, 0}
> +		},
> +
> +		.reg = { "csid0" },
> +		.interrupt = { "csid0" },
> +		.csid = {
> +			.is_lite = false,
> +			.hw_ops = &csid_ops_gen2,
> +			.parent_dev_ops = &vfe_parent_dev_ops,
> +			.formats = &csid_formats_gen2
> +		}
> +	},
> +	/* CSID1 */
> +	{
> +		.regulators = { "vdda-phy", "vdda-pll" },
> +
> +		.clock = { "csi1", "vfe1_cphy_rx", "vfe1", "soc_ahb"},
> +		.clock_rate = {
> +			{ 300000000, 0, 380000000, 0},
> +			{ 400000000, 0, 510000000, 0},
> +			{ 400000000, 0, 637000000, 0},
> +			{ 400000000, 0, 760000000, 0}
> +		},
> +
> +		.reg = { "csid1" },
> +		.interrupt = { "csid1" },
> +		.csid = {
> +			.is_lite = false,
> +			.hw_ops = &csid_ops_gen2,
> +			.parent_dev_ops = &vfe_parent_dev_ops,
> +			.formats = &csid_formats_gen2
> +		}
> +	},
> +	/* CSID2 */
> +	{
> +		.regulators = { "vdda-phy", "vdda-pll" },
> +
> +		.clock = { "csi2", "vfe2_cphy_rx", "vfe2", "soc_ahb"},
> +		.clock_rate = {
> +			{ 300000000, 0, 380000000, 0},
> +			{ 400000000, 0, 510000000, 0},
> +			{ 400000000, 0, 637000000, 0},
> +			{ 400000000, 0, 760000000, 0}
> +		},
> +
> +		.reg = { "csid2" },
> +		.interrupt = { "csid2" },
> +		.csid = {
> +			.is_lite = false,
> +			.hw_ops = &csid_ops_gen2,
> +			.parent_dev_ops = &vfe_parent_dev_ops,
> +			.formats = &csid_formats_gen2
> +		}
> +	},
> +	/* CSID3 */
> +	{
> +		.regulators = { "vdda-phy", "vdda-pll" },
> +
> +		.clock = { "csi3", "vfe0_lite_cphy_rx", "vfe0_lite", "soc_ahb"},
> +		.clock_rate = {
> +			{ 300000000, 0, 320000000, 0},
> +			{ 400000000, 0, 400000000, 0},
> +			{ 400000000, 0, 480000000, 0},
> +			{ 400000000, 0, 600000000, 0}
> +		},
> +
> +		.reg = { "csid_lite0" },
> +		.interrupt = { "csid_lite0" },
> +		.csid = {
> +			.is_lite = true,
> +			.hw_ops = &csid_ops_gen2,
> +			.parent_dev_ops = &vfe_parent_dev_ops,
> +			.formats = &csid_formats_gen2
> +		}
> +	},
> +	/* CSID4 */
> +	{
> +		.regulators = { "vdda-phy", "vdda-pll" },
> +
> +		.clock = { "csi3", "vfe0_lite_cphy_rx", "vfe0_lite", "soc_ahb"},
> +		.clock_rate = {
> +			{ 300000000, 0, 320000000, 0},
> +			{ 400000000, 0, 400000000, 0},
> +			{ 400000000, 0, 480000000, 0},
> +			{ 400000000, 0, 600000000, 0}
> +		},
> +
> +		.reg = { "csid_lite1" },
> +		.interrupt = { "csid_lite1" },
> +		.csid = {
> +			.is_lite = true,
> +			.hw_ops = &csid_ops_gen2,
> +			.parent_dev_ops = &vfe_parent_dev_ops,
> +			.formats = &csid_formats_gen2
> +		}
> +	},
> +};
> +
> +static const struct camss_subdev_resources vfe_res_7280[] = {
> +	/* VFE0 */
> +	{
> +		.regulators = {},
> +
> +		.clock = { "vfe0", "vfe0_axi", "soc_ahb",
> +			   "camnoc_axi", "gcc_camera_axi"},
> +		.clock_rate = {
> +			{ 380000000, 0, 80000000, 150000000, 0},
> +			{ 510000000, 0, 80000000, 240000000, 0},
> +			{ 637000000, 0, 80000000, 320000000, 0},
> +			{ 760000000, 0, 80000000, 400000000, 0},
> +			{ 760000000, 0, 80000000, 480000000, 0},
> +		},
> +
> +		.reg = { "vfe0" },
> +		.interrupt = { "vfe0" },
> +		.vfe = {
> +			.line_num = 3,
> +			.is_lite = false,
> +			.has_pd = true,
> +			.pd_name = "ife0",
> +			.hw_ops = &vfe_ops_170,
> +			.formats_rdi = &vfe_formats_rdi_845,
> +			.formats_pix = &vfe_formats_pix_845
> +		}
> +	},
> +	/* VFE1 */
> +	{
> +		.regulators = {},
> +
> +		.clock = { "vfe1", "vfe1_axi", "soc_ahb",
> +			   "camnoc_axi", "gcc_camera_axi"},
> +		.clock_rate = {
> +			{ 380000000, 0, 80000000, 150000000, 0},
> +			{ 510000000, 0, 80000000, 240000000, 0},
> +			{ 637000000, 0, 80000000, 320000000, 0},
> +			{ 760000000, 0, 80000000, 400000000, 0},
> +			{ 760000000, 0, 80000000, 480000000, 0},
> +		},
> +
> +		.reg = { "vfe1" },
> +		.interrupt = { "vfe1" },
> +		.vfe = {
> +			.line_num = 3,
> +			.is_lite = false,
> +			.has_pd = true,
> +			.pd_name = "ife1",
> +			.hw_ops = &vfe_ops_170,
> +			.formats_rdi = &vfe_formats_rdi_845,
> +			.formats_pix = &vfe_formats_pix_845
> +		}
> +	},
> +	/* VFE2 */
> +	{
> +		.regulators = {},
> +
> +		.clock = { "vfe2", "vfe2_axi", "soc_ahb",
> +			   "camnoc_axi", "gcc_camera_axi"},
> +		.clock_rate = {
> +			{ 380000000, 0, 80000000, 150000000, 0},
> +			{ 510000000, 0, 80000000, 240000000, 0},
> +			{ 637000000, 0, 80000000, 320000000, 0},
> +			{ 760000000, 0, 80000000, 400000000, 0},
> +			{ 760000000, 0, 80000000, 480000000, 0},
> +		},
> +
> +		.reg = { "vfe2" },
> +		.interrupt = { "vfe2" },
> +		.vfe = {
> +			.line_num = 3,
> +			.is_lite = false,
> +			.hw_ops = &vfe_ops_170,
> +			.has_pd = true,
> +			.pd_name = "ife2",
> +			.formats_rdi = &vfe_formats_rdi_845,
> +			.formats_pix = &vfe_formats_pix_845
> +		}
> +	},
> +	/* VFE3 (lite) */
> +	{
> +		.clock = { "vfe0_lite", "soc_ahb",
> +			   "camnoc_axi", "gcc_camera_axi"},
> +		.clock_rate = {
> +			{ 320000000, 80000000, 150000000, 0},
> +			{ 400000000, 80000000, 240000000, 0},
> +			{ 480000000, 80000000, 320000000, 0},
> +			{ 600000000, 80000000, 400000000, 0},
> +		},
> +
> +		.regulators = {},
> +		.reg = { "vfe_lite0" },
> +		.interrupt = { "vfe_lite0" },
> +		.vfe = {
> +			.line_num = 4,
> +			.is_lite = true,
> +			.hw_ops = &vfe_ops_170,
> +			.formats_rdi = &vfe_formats_rdi_845,
> +			.formats_pix = &vfe_formats_pix_845
> +		}
> +	},
> +	/* VFE4 (lite) */
> +	{
> +		.clock = { "vfe1_lite", "soc_ahb",
> +			   "camnoc_axi", "gcc_camera_axi"},
> +		.clock_rate = {
> +			{ 320000000, 80000000, 150000000, 0},
> +			{ 400000000, 80000000, 240000000, 0},
> +			{ 480000000, 80000000, 320000000, 0},
> +			{ 600000000, 80000000, 400000000, 0},
> +		},
> +
> +		.regulators = {},
> +		.reg = { "vfe_lite1" },
> +		.interrupt = { "vfe_lite1" },
> +		.vfe = {
> +			.line_num = 4,
> +			.is_lite = true,
> +			.hw_ops = &vfe_ops_170,
> +			.formats_rdi = &vfe_formats_rdi_845,
> +			.formats_pix = &vfe_formats_pix_845
> +		}
> +	},
> +};
> +
> +static const struct resources_icc icc_res_sc7280[] = {
> +	{
> +		.name = "ahb",
> +		.icc_bw_tbl.avg = 38400,
> +		.icc_bw_tbl.peak = 76800,
> +	},
> +	{
> +		.name = "hf_0",
> +		.icc_bw_tbl.avg = 2097152,
> +		.icc_bw_tbl.peak = 2097152,
> +	},
> +};
> +
>   /*
>    * camss_add_clock_margin - Add margin to clock frequency rate
>    * @rate: Clock frequency rate
> @@ -2453,9 +2777,24 @@ static const struct camss_resources sc8280xp_resources = {
>   	.link_entities = camss_link_entities
>   };
>   
> +static const struct camss_resources sc7280_resources = {
> +	.version = CAMSS_7280,
> +	.pd_name = "top",
> +	.csiphy_res = csiphy_res_7280,
> +	.csid_res = csid_res_7280,
> +	.vfe_res = vfe_res_7280,
> +	.icc_res = icc_res_sc7280,
> +	.icc_path_num = ARRAY_SIZE(icc_res_sc7280),
> +	.csiphy_num = ARRAY_SIZE(csiphy_res_7280),
> +	.csid_num = ARRAY_SIZE(csid_res_7280),
> +	.vfe_num = ARRAY_SIZE(vfe_res_7280),
> +	.link_entities = camss_link_entities
> +};
> +
>   static const struct of_device_id camss_dt_match[] = {
>   	{ .compatible = "qcom,msm8916-camss", .data = &msm8916_resources },
>   	{ .compatible = "qcom,msm8996-camss", .data = &msm8996_resources },
> +	{ .compatible = "qcom,sc7280-camss", .data = &sc7280_resources },
>   	{ .compatible = "qcom,sc8280xp-camss", .data = &sc8280xp_resources },
>   	{ .compatible = "qcom,sdm660-camss", .data = &sdm660_resources },
>   	{ .compatible = "qcom,sdm845-camss", .data = &sdm845_resources },
> diff --git a/drivers/media/platform/qcom/camss/camss.h b/drivers/media/platform/qcom/camss/camss.h
> index 0ce84fcbbd25..bbdf9aa81c36 100644
> --- a/drivers/media/platform/qcom/camss/camss.h
> +++ b/drivers/media/platform/qcom/camss/camss.h
> @@ -80,6 +80,7 @@ enum camss_version {
>   	CAMSS_8x16,
>   	CAMSS_8x96,
>   	CAMSS_660,
> +	CAMSS_7280,
>   	CAMSS_845,
>   	CAMSS_8250,
>   	CAMSS_8280XP,


--
Best wishes,
Vladimir

