Return-Path: <linux-media+bounces-50960-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 0FA92D39126
	for <lists+linux-media@lfdr.de>; Sat, 17 Jan 2026 22:38:28 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 0F95D30096BB
	for <lists+linux-media@lfdr.de>; Sat, 17 Jan 2026 21:38:27 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9E5172EB86C;
	Sat, 17 Jan 2026 21:38:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="UCpcSigS"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-wr1-f42.google.com (mail-wr1-f42.google.com [209.85.221.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BD8F32DAFD7
	for <linux-media@vger.kernel.org>; Sat, 17 Jan 2026 21:38:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768685905; cv=none; b=ODN4mkQNNiwCUVKm+QCKWzegpXjGhbs9zz4BBtklf1ExX1YoP2iCMlqPk4UZHMkynammGAeTiedoexKqWx/1PeeiEfPA6CFSvveuhx+asBvG1rmZVvUKeWVAE8NHr6CIJyruKges9RCghtIN+1ABrbBdj2m0F/6IUM8hm9cwjfQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768685905; c=relaxed/simple;
	bh=r75LXAxamOFiLJ7w1C7qUg+8O4qE9Zd/yue01h8JojA=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=PDv8LnAwbL2m1yDF2ia11qyWwDvPB4KjZ1Ug3TUU/nwbyW9hS8SPvvuMEuePcbkZbBIUYv4vZwK2sUxSEddproY9I8vYnMU+aj7O1hXMhMVIJIlV2gJkYFkwexEuaOSzRL+1feiNVRdiRAjkdmEHsYbe3PQyX2XzZLFSKmei8j8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=UCpcSigS; arc=none smtp.client-ip=209.85.221.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wr1-f42.google.com with SMTP id ffacd0b85a97d-42fb6ce71c7so2832760f8f.1
        for <linux-media@vger.kernel.org>; Sat, 17 Jan 2026 13:38:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1768685901; x=1769290701; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=zOSrfCVt3slZZjtnDEf8LgA1EjmVMXj7ymK/XhVHifo=;
        b=UCpcSigSuj8AFXc4bBjc46Tc2LcqCDN/SdfDTYw6RdYFmloOmWjvHyyb8n4YRgIwwq
         mZsEEPc++KJkH9k6U1Tn3pn1HRF1S0Rc6hgdm8knoPO2jiucnhSxR/H8Nl0yFaV3ay7X
         BMUR/R26w52I1QK4mBjfJqoKPC54RpoFJFnQy6kDe+gPVjsbv92nJwdDsHP7Nadf5C5r
         kPCYHIJFOygVD1ZbYUPwdwuBxd0k0jrTp7ukDZFrL/29BaHuSMl52ekgWftTFoX4bRcw
         y7zIhNfTSYnzI6HHkNOvNFbRP1gdFtedFqEJ42PB/febRz++83+77xi9vcl80me/bojp
         KRzQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768685901; x=1769290701;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=zOSrfCVt3slZZjtnDEf8LgA1EjmVMXj7ymK/XhVHifo=;
        b=etS/l0g4asSOn9O87B975pKqNJ042QjCJH3IPARS4r15O5WX0LJc8F64EzRdIPBjQq
         wdbQ70B0O7T5aGq3s7uFp6WhxPgQNrQ5Uiu5Zeoet25t1IsdzGkuXwxTlS7yWJHDV9sE
         4a6J9JO2iDwYzppOx5S6L4vOK+i+pFBd45uHQQgcmRKBBzv73EctSfjcI/H7gZIQcHi3
         4kG3KTi5KJl4+Mk9hJCEMILs+ZKEiB20IIjRZbZMFH1fKpq3dO8bKNo8aVuesbhPbA2P
         xgCpPTVxCoJ7xrD82b185t2PT+Ic3CeQu6l+qffT1rBMyW993oHCgzgEqugBC7UQc3XQ
         fSWA==
X-Forwarded-Encrypted: i=1; AJvYcCW/DSOdUWrVeGPxAbv2Si8gtXm2bmq3MApHFelkdeKf7V2VxDzSGY64YvS3LAcnUi2nT1hrVxMO5RV4zA==@vger.kernel.org
X-Gm-Message-State: AOJu0YxC4rIyiioWqdwMnMdvvVEDQt0gSXlSrdXxXloCUfeEEMELvE2J
	a+TydLj0/KVaVVuJdSLMpCqD+TQ17ZWCHajcca/cCMee+6CITr9YVBZqtYWk3W3suxM=
X-Gm-Gg: AY/fxX5YvkxBsDXIiS0saYHD7Oeu4cEiR1eN/RYag0ZnmCbURdfmc8qBxkNfOmfUhqk
	4O2FfxV4SR/nvSJfSBcW9GyyzhnrVmfbVw8mYZYQjxswY5rlKSNsAEOkikl/V66KYRBFkD737P5
	5qAiypPeRheXAn/iJRDV9CXRf9/QVJPR/CYGZRUvXB3q5qGW/b6m+8Egk+tb/hPTbtJRhWHfmQQ
	XE44Bt9fpH6Bwq7BrDfunkAIHsQL5xJuHFBFPOt7TWQMJhXH1JmGNaz10l1Zp2vid9ZJ0fiXlA/
	dgBX0ttQg/7XR7xamefHbT9z/6oy+yE25R3i4PM67sNggC1G920Ppoa/MTMctAu0+qmjD7gNOg4
	hR2VZzBa9PS7E7iNPZvX0s6vEMWHHiUZnTzLevkM5+bGPaslGQ/XmyWgTUTD8m4AAFALt68I9pK
	HsgyamhAW9SXvIFXETIS52f7HsWB5gq2dwLazCAl/H7FpafaLJckTr
X-Received: by 2002:a05:6000:240e:b0:433:1d30:461 with SMTP id ffacd0b85a97d-43569bc4837mr8556092f8f.32.1768685901066;
        Sat, 17 Jan 2026 13:38:21 -0800 (PST)
Received: from [192.168.0.40] (188-141-3-146.dynamic.upc.ie. [188.141.3.146])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-43569998240sm12791161f8f.43.2026.01.17.13.38.19
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 17 Jan 2026 13:38:20 -0800 (PST)
Message-ID: <de5fbe8d-3f9e-4be8-a9e3-991b959305e4@linaro.org>
Date: Sat, 17 Jan 2026 21:38:17 +0000
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 2/8] media: qcom: camss: csiphy-3ph: Use odd bits for
 configuring C-PHY lanes
To: david@ixit.cz, Robert Foss <rfoss@kernel.org>,
 Todor Tomov <todor.too@gmail.com>,
 Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
 Mauro Carvalho Chehab <mchehab@kernel.org>,
 Luca Weiss <luca.weiss@fairphone.com>, Petr Hodina <phodina@protonmail.com>,
 Casey Connolly <casey.connolly@linaro.org>, "Dr. Git" <drgitx@gmail.com>
Cc: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
 Joel Selvaraj <foss@joelselvaraj.com>, Kieran Bingham <kbingham@kernel.org>,
 Sakari Ailus <sakari.ailus@linux.intel.com>, linux-media@vger.kernel.org,
 linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
 phone-devel@vger.kernel.org
References: <20260117-qcom-cphy-v3-0-8ce76a06f7db@ixit.cz>
 <20260117-qcom-cphy-v3-2-8ce76a06f7db@ixit.cz>
From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Content-Language: en-US
In-Reply-To: <20260117-qcom-cphy-v3-2-8ce76a06f7db@ixit.cz>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 17/01/2026 15:36, David Heidelberg via B4 Relay wrote:
> From: David Heidelberg <david@ixit.cz>
> 
> So far, only D-PHY mode was supported, which uses even bits when enabling
> or masking lanes. For C-PHY configuration, the hardware instead requires
> using the odd bits.
> 
> Since there can be unrecognized configuration allow returning failure.
> 
> Signed-off-by: David Heidelberg <david@ixit.cz>
> ---
>   .../platform/qcom/camss/camss-csiphy-2ph-1-0.c     |  8 ++--
>   .../platform/qcom/camss/camss-csiphy-3ph-1-0.c     | 49 +++++++++++++++++-----
>   drivers/media/platform/qcom/camss/camss-csiphy.c   |  4 +-
>   drivers/media/platform/qcom/camss/camss-csiphy.h   |  6 +--
>   4 files changed, 47 insertions(+), 20 deletions(-)
> 
> diff --git a/drivers/media/platform/qcom/camss/camss-csiphy-2ph-1-0.c b/drivers/media/platform/qcom/camss/camss-csiphy-2ph-1-0.c
> index 9d67e7fa6366a..bb4b91f69616b 100644
> --- a/drivers/media/platform/qcom/camss/camss-csiphy-2ph-1-0.c
> +++ b/drivers/media/platform/qcom/camss/camss-csiphy-2ph-1-0.c
> @@ -94,9 +94,9 @@ static u8 csiphy_settle_cnt_calc(s64 link_freq, u32 timer_clk_rate)
>   	return settle_cnt;
>   }
>   
> -static void csiphy_lanes_enable(struct csiphy_device *csiphy,
> -				struct csiphy_config *cfg,
> -				s64 link_freq, u8 lane_mask)
> +static int csiphy_lanes_enable(struct csiphy_device *csiphy,
> +			       struct csiphy_config *cfg,
> +			       s64 link_freq, u8 lane_mask)
>   {
>   	struct csiphy_lanes_cfg *c = &cfg->csi2->lane_cfg;
>   	u8 settle_cnt;
> @@ -132,6 +132,8 @@ static void csiphy_lanes_enable(struct csiphy_device *csiphy,
>   		writel_relaxed(0x3f, csiphy->base +
>   			       CAMSS_CSI_PHY_INTERRUPT_CLEARn(l));
>   	}
> +
> +	return 0;
>   }
>   
>   static void csiphy_lanes_disable(struct csiphy_device *csiphy,
> diff --git a/drivers/media/platform/qcom/camss/camss-csiphy-3ph-1-0.c b/drivers/media/platform/qcom/camss/camss-csiphy-3ph-1-0.c
> index 4154832745525..f3a8625511e1e 100644
> --- a/drivers/media/platform/qcom/camss/camss-csiphy-3ph-1-0.c
> +++ b/drivers/media/platform/qcom/camss/camss-csiphy-3ph-1-0.c
> @@ -14,6 +14,7 @@
>   #include <linux/delay.h>
>   #include <linux/interrupt.h>
>   #include <linux/io.h>
> +#include <linux/media-bus-format.h>
>   
>   #define CSIPHY_3PH_LNn_CFG1(n)			(0x000 + 0x100 * (n))
>   #define CSIPHY_3PH_LNn_CFG1_SWI_REC_DLY_PRG	(BIT(7) | BIT(6))
> @@ -993,13 +994,22 @@ static void csiphy_gen2_config_lanes(struct csiphy_device *csiphy,
>   
>   static u8 csiphy_get_lane_mask(struct csiphy_lanes_cfg *lane_cfg)
>   {
> -	u8 lane_mask;
> -	int i;
> +	u8 lane_mask = 0;
>   
> -	lane_mask = CSIPHY_3PH_CMN_CSI_COMMON_CTRL5_CLK_ENABLE;
> +	switch (lane_cfg->phy_cfg) {
> +	case V4L2_MBUS_CSI2_CPHY:
> +		for (int i = 0; i < lane_cfg->num_data; i++)
> +			lane_mask |= (1 << lane_cfg->data[i].pos) + 1;

1 << anything == BIT(anything)

I've always disliked the look of this code and now it occurs to me why.

This code is analogous to:

lane_mask |= BIT(lane_cfg->data[i].pos) + 1);

but BIT() is less janky and more upstreamy.

janky/upstreamy - this is the on-point technical argument y'all came 
here for :)

> +		break;
> +	case V4L2_MBUS_CSI2_DPHY:
> +		lane_mask = CSIPHY_3PH_CMN_CSI_COMMON_CTRL5_CLK_ENABLE;
>   
> -	for (i = 0; i < lane_cfg->num_data; i++)
> -		lane_mask |= 1 << lane_cfg->data[i].pos;
> +		for (int i = 0; i < lane_cfg->num_data; i++)
> +			lane_mask |= 1 << lane_cfg->data[i].pos;
> +		break;
> +	default:
> +		break;
> +	}
>   
>   	return lane_mask;
>   }
> @@ -1027,10 +1037,11 @@ static bool csiphy_is_gen2(u32 version)
>   	return ret;
>   }
>   
> -static void csiphy_lanes_enable(struct csiphy_device *csiphy,
> -				struct csiphy_config *cfg,
> -				s64 link_freq, u8 lane_mask)
> +static int csiphy_lanes_enable(struct csiphy_device *csiphy,
> +			       struct csiphy_config *cfg,
> +			       s64 link_freq, u8 lane_mask)
>   {
> +	struct device *dev = csiphy->camss->dev;
>   	struct csiphy_lanes_cfg *c = &cfg->csi2->lane_cfg;
>   	struct csiphy_device_regs *regs = csiphy->regs;
>   	u8 settle_cnt;
> @@ -1039,9 +1050,23 @@ static void csiphy_lanes_enable(struct csiphy_device *csiphy,
>   
>   	settle_cnt = csiphy_settle_cnt_calc(link_freq, csiphy->timer_clk_rate);
>   
> -	val = CSIPHY_3PH_CMN_CSI_COMMON_CTRL5_CLK_ENABLE;
> -	for (i = 0; i < c->num_data; i++)
> -		val |= BIT(c->data[i].pos * 2);
> +	val = 0;
> +
> +	switch (c->phy_cfg) {
> +	case V4L2_MBUS_CSI2_CPHY:
> +		for (i = 0; i < c->num_data; i++)
> +			val |= BIT((c->data[i].pos * 2) + 1);
> +		break;
> +	case V4L2_MBUS_CSI2_DPHY:
> +		val = CSIPHY_3PH_CMN_CSI_COMMON_CTRL5_CLK_ENABLE;
> +
> +		for (i = 0; i < c->num_data; i++)
> +			val |= BIT(c->data[i].pos * 2);
> +		break;
> +	default:
> +		dev_err(dev, "Unsupported bus type %d\n", c->phy_cfg);
> +		return -EINVAL;
> +	}
>   
>   	writel_relaxed(val, csiphy->base +
>   		       CSIPHY_3PH_CMN_CSI_COMMON_CTRLn(regs->offset, 5));
> @@ -1068,6 +1093,8 @@ static void csiphy_lanes_enable(struct csiphy_device *csiphy,
>   		writel_relaxed(0, csiphy->base +
>   			       CSIPHY_3PH_CMN_CSI_COMMON_CTRLn(regs->offset, i));
>   	}
> +
> +	return 0;
>   }
>   
>   static void csiphy_lanes_disable(struct csiphy_device *csiphy,
> diff --git a/drivers/media/platform/qcom/camss/camss-csiphy.c b/drivers/media/platform/qcom/camss/camss-csiphy.c
> index 62623393f4144..08dd238e52799 100644
> --- a/drivers/media/platform/qcom/camss/camss-csiphy.c
> +++ b/drivers/media/platform/qcom/camss/camss-csiphy.c
> @@ -295,9 +295,7 @@ static int csiphy_stream_on(struct csiphy_device *csiphy)
>   		wmb();
>   	}
>   
> -	csiphy->res->hw_ops->lanes_enable(csiphy, cfg, link_freq, lane_mask);
> -
> -	return 0;
> +	return csiphy->res->hw_ops->lanes_enable(csiphy, cfg, link_freq, lane_mask);

ick.

More high brow stuff from bod here but, more seriously this is three 
levels of indirection deep and the statement keeps getting longer.

Could you get a pointer to hw_ops() to reduce this down a bit.

>   }
>   
>   /*
> diff --git a/drivers/media/platform/qcom/camss/camss-csiphy.h b/drivers/media/platform/qcom/camss/camss-csiphy.h
> index d198171700e73..21cf2ce931c1d 100644
> --- a/drivers/media/platform/qcom/camss/camss-csiphy.h
> +++ b/drivers/media/platform/qcom/camss/camss-csiphy.h
> @@ -73,9 +73,9 @@ struct csiphy_hw_ops {
>   	void (*hw_version_read)(struct csiphy_device *csiphy,
>   				struct device *dev);
>   	void (*reset)(struct csiphy_device *csiphy);
> -	void (*lanes_enable)(struct csiphy_device *csiphy,
> -			     struct csiphy_config *cfg,
> -			     s64 link_freq, u8 lane_mask);
> +	int (*lanes_enable)(struct csiphy_device *csiphy,
> +			    struct csiphy_config *cfg,
> +			    s64 link_freq, u8 lane_mask);
>   	void (*lanes_disable)(struct csiphy_device *csiphy,
>   			      struct csiphy_config *cfg);
>   	irqreturn_t (*isr)(int irq, void *dev);
> 

With those tweaks.

Reviewed-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>

---
bod

