Return-Path: <linux-media+bounces-52029-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id MJ2ZFnu+gGl3AgMAu9opvQ
	(envelope-from <linux-media+bounces-52029-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Mon, 02 Feb 2026 16:10:51 +0100
X-Original-To: lists+linux-media@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 6FEAACDF11
	for <lists+linux-media@lfdr.de>; Mon, 02 Feb 2026 16:10:50 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 43901304C037
	for <lists+linux-media@lfdr.de>; Mon,  2 Feb 2026 14:58:43 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1EA49378D75;
	Mon,  2 Feb 2026 14:57:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="KikUtpGD"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com [209.85.128.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6E44934D3AA
	for <linux-media@vger.kernel.org>; Mon,  2 Feb 2026 14:57:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770044275; cv=none; b=BcyGvHwvINjUE+VlEI8l++ygWPUQGB/ZXDUXmBt03TUcN6TgKw/hLccgim/9BVXAeuRk+UxO/qITL+WWas7R1KJZCbMUu5JMTtUPKDO9dmXWICuNcHtjvq17vp4MqDafTMh76ae0dmJPd/vcbLg46B/VhR2LviMwAaZDG/XOTxA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770044275; c=relaxed/simple;
	bh=B3e19ERAbUW85KVr1sGO4WMlEUSH0urMoXY3AXkh/kY=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=ZaD2OZuJVLutELC22b3LeXC/yD7eMGTygkpcuYL+7o8X9kM8S8yM+jGIFD2EneN/n+SU3YsSac11Q9IrL6KQ6v0ujmNQQZZQYK6OdokztDuAm+5puv68xmx3w/Ea5FgdnLavx8XlM1Fy4HuBO8ox770Jy/KpFBGQGe3HqBf54GE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=KikUtpGD; arc=none smtp.client-ip=209.85.128.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wm1-f51.google.com with SMTP id 5b1f17b1804b1-4807068eacbso38111925e9.2
        for <linux-media@vger.kernel.org>; Mon, 02 Feb 2026 06:57:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1770044272; x=1770649072; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=u6DxzKATYmCstepZDSTbcR5vSPshABosa+zzxO2zKsA=;
        b=KikUtpGD0KAfDxR6kKIV5+38ZHEg8h68Q4NT2kaeWHYYU5WCtmY48DloME+rKc9apy
         TBCORHsLHZ4E5/ECoVsGUiptjBkektmDKWMcp9pzLNur7lGgNkIsAoq/XzIzLCqpVUc/
         V3uE9Nk00FqRrgeD+rRTl0F2dwhIuPAhvfWU2k1CkUzOJq/GC30clCHa964KL9iYSVhm
         k3+SQGdtXEoPFhKk5fMYSUQCVyaf9XIxHiTDDBeBHqqfS1+osqEnlu6gNCr2zJuHh7Ix
         aZlHPstvGVO0+P6C+RLasCf7DpTGua3ldG+YObvB5Vwqt2Y5ADWAr1Ehnfk1zkrd9nts
         keCA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770044272; x=1770649072;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=u6DxzKATYmCstepZDSTbcR5vSPshABosa+zzxO2zKsA=;
        b=Yc+nCM9SaKuUE9owYI8PYowv/xpuNr6jxdzQjBjNCwJjk2k+6i5yHXyNjO22NjjfnM
         wZNdpjfpTSyzs/1qWO3FD3oS4/U+AEnXAhdZJCew+2bn9b6RuaQrjl/uHZJhE8Zsfe+5
         7LKhapAIDJTj6xCHa+ONtZHUSI5NPP61D7pOwoghwONrQBKErndCK29/C/cPkeaPDQsv
         +fjR+9OD1vh9rWqLBYHj3EnilMTa2QS5wkkuEJMeoIrsJF3RLkrOhv9DB1KUmK5Ld0fL
         Qb+IeBNtp/NxsiL5lMldZDnJnsVgUGu0BnVZfx0r/LR0NVZr6XfFo5h23hZN2eEf9Xb8
         MidQ==
X-Forwarded-Encrypted: i=1; AJvYcCXV0kaXnemN3p3veg9qPBJrSidbSNaHXdn3TcSoSYOSqSh+HsJ1QP6b63QfA2QY29mBNn4NBdp6jnEszA==@vger.kernel.org
X-Gm-Message-State: AOJu0YyzhDY4POROKeYtWcpnDaKuS6NRsMRt6LyiCFadKsryxjlbZm0w
	h+15KJH0lX5SV0cE2YM9e5BI2zy6abkjiBNmR2v+GPl7SiiDQG0hpUHJuySUAZcUyBc=
X-Gm-Gg: AZuq6aKJjewPQOIBGGJqC2n8J2HBqvuulcRtP5btSir0r9iZzkzDEjA83W39QbXovoq
	xaRvY46LIq59a7HqqH2mze3bPzgZO2i4Gse2qym44oOSUh+Q/GVTmvSQoVvLT/Ga3L3KleASjQK
	5HBOLh6e7/CN85L7mkg0bD7ZH0ITZ7a0zEa0F9KmhW/yszq4EXVpb3wdY/3JpD3M9RAlGnY3yBw
	IUiBGY6aHLbfdZGKmCQ/DhuSWXI54Zfilhz4upUd/YQHL3Yi/S/4aRNbALwfxdozGDeqdQNYpM5
	lW7Ck/lqPVy0IeLRZSQG/xB51Dbmctk6esOJe4+NyNS3Xjl2K2uEvF1fHWkxwrXMgjIQ6jj58dF
	Mk+Px4u8KKQBBZHxXUMQdQkpFkl24kj4CrVnZu/+Q5p9Q8LIL6bw7coQN1TNjf/SnTpJOD0wddf
	50SX7nLoKyuGPfW4Q2VHuQbL+eF5wZuZplrQqAhUxLVWxxGBgecJ4X
X-Received: by 2002:a05:600c:b99:b0:479:3a86:dc1c with SMTP id 5b1f17b1804b1-482db49a407mr160340815e9.36.1770044271500;
        Mon, 02 Feb 2026 06:57:51 -0800 (PST)
Received: from [192.168.0.40] (188-141-3-146.dynamic.upc.ie. [188.141.3.146])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-48066c428basm490755955e9.12.2026.02.02.06.57.50
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 02 Feb 2026 06:57:50 -0800 (PST)
Message-ID: <c3c38745-2bc0-4573-92d3-f5035d651ca1@linaro.org>
Date: Mon, 2 Feb 2026 14:57:48 +0000
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 3/7] of/iommu: add multi-map support
To: Vikash Garodia <vikash.garodia@oss.qualcomm.com>,
 Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>,
 Abhinav Kumar <abhinav.kumar@linux.dev>, Bryan O'Donoghue <bod@kernel.org>,
 Mauro Carvalho Chehab <mchehab@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Saravana Kannan <saravanak@kernel.org>,
 Joerg Roedel <joro@8bytes.org>, Will Deacon <will@kernel.org>,
 Robin Murphy <robin.murphy@arm.com>,
 Stefan Schmidt <stefan.schmidt@linaro.org>,
 Hans Verkuil <hverkuil@kernel.org>, Krzysztof Kozlowski <krzk@kernel.org>,
 Vishnu Reddy <busanna.reddy@oss.qualcomm.com>,
 Hans Verkuil <hverkuil+cisco@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-media@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 iommu@lists.linux.dev, Charan Teja Kalla <charan.kalla@oss.qualcomm.com>,
 Vijayanand Jitta <vijayanand.jitta@oss.qualcomm.com>
References: <20260126-kaanapali-iris-v1-0-e2646246bfc1@oss.qualcomm.com>
 <20260126-kaanapali-iris-v1-3-e2646246bfc1@oss.qualcomm.com>
From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Content-Language: en-US
In-Reply-To: <20260126-kaanapali-iris-v1-3-e2646246bfc1@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[linaro.org,none];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c15:e001:75::/64:c];
	R_DKIM_ALLOW(-0.20)[linaro.org:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[24];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-52029-lists,linux-media=lfdr.de];
	DKIM_TRACE(0.00)[linaro.org:+];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[bryan.odonoghue@linaro.org,linux-media@vger.kernel.org];
	ASN(0.00)[asn:63949, ipnet:2600:3c15::/32, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-media,dt,cisco];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[linux.dev:email,arg.map_args.np:url,sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns,linaro.org:mid,linaro.org:dkim,qualcomm.com:email]
X-Rspamd-Queue-Id: 6FEAACDF11
X-Rspamd-Action: no action

On 26/01/2026 12:25, Vikash Garodia wrote:
> From: Charan Teja Kalla <charan.kalla@oss.qualcomm.com>
> 
> When multiple mappings are present for an input id, linux matches just
> the first one. There is a usecase[1] where all the mappings are to be
> maintained in parallel for an iommu-map entry of a same input id.
> 
> Whether multi-map is needed is reported by the callers through the
> callback function passed, which is called for every input id match.
> 
> Since the requirement in the usecase[1] is for platform devices, not
> sure if it is really clean to maintain this decision on the bus type at
> the of_iommu layer or further to be from the respective
> iommu_driver->impl_ops().
> 
> [1] https://lore.kernel.org/all/20250627-video_cb-v3-0-51e18c0ffbce@quicinc.com/
> 
> Signed-off-by: Charan Teja Kalla <charan.kalla@oss.qualcomm.com>
> Signed-off-by: Vijayanand Jitta <vijayanand.jitta@oss.qualcomm.com>
> Signed-off-by: Vikash Garodia <vikash.garodia@oss.qualcomm.com>
> ---
>   drivers/iommu/of_iommu.c | 36 ++++++++++++++++++++++++++++--------
>   drivers/of/base.c        | 38 ++++++++++++++++++++++++++++----------
>   include/linux/of.h       |  6 ++++++
>   3 files changed, 62 insertions(+), 18 deletions(-)
> 
> diff --git a/drivers/iommu/of_iommu.c b/drivers/iommu/of_iommu.c
> index 768eaddf927b0700b2497b08ea21611b1a1b5688..067bb2298973671e1eaf01bb2ea52df3d2a52a44 100644
> --- a/drivers/iommu/of_iommu.c
> +++ b/drivers/iommu/of_iommu.c
> @@ -16,6 +16,7 @@
>   #include <linux/pci.h>
>   #include <linux/slab.h>
>   #include <linux/fsl/mc.h>
> +#include <linux/platform_device.h>
>   
>   #include "iommu-priv.h"
>   
> @@ -41,22 +42,41 @@ static int of_iommu_xlate(struct device *dev,
>   	return ret;
>   }
>   
> +/*
> + * Callback to be called from of_map_id(), that tells if
> + * all the mappings for an input id to be maintained in
> + * parallel. Should this decission be from further layers,
> + * iommu_driver->impl_ops?
> + */
> +static int of_iommu_configure_cb(struct of_map_id_arg *arg)
> +{
> +	struct of_phandle_args *iommu_spec = &arg->map_args;
> +	struct device *dev = arg->dev;
> +	int err;
> +
> +	err = of_iommu_xlate(dev, iommu_spec);
> +	of_node_put(iommu_spec->np);
> +
> +	/* !iommu_spec->np may be from the bypassed translations */
> +	if (!err)
> +		err = (!arg->multi_map || !iommu_spec->np) ? 0 : -EAGAIN;
> +
> +	return err;
> +}
> +
>   static int of_iommu_configure_dev_id(struct device_node *master_np,
>   				     struct device *dev,
>   				     const u32 *id)
>   {
>   	struct of_map_id_arg arg = {
>   		.map_args = {},
> +		.cb = of_iommu_configure_cb,
> +		.dev = dev,
> +		/* Should this be pushed to iommu_driver->impl_ops? */
> +		.multi_map = dev_is_platform(dev),
>   	};
> -	int err;
> -
> -	err = of_map_iommu_id(master_np, *id, &arg);
> -	if (err)
> -		return err;
>   
> -	err = of_iommu_xlate(dev, &arg.map_args);
> -	of_node_put(arg.map_args.np);
> -	return err;
> +	return of_map_iommu_id(master_np, *id, &arg);
>   }
>   
>   static int of_iommu_configure_dev(struct device_node *master_np,
> diff --git a/drivers/of/base.c b/drivers/of/base.c
> index 606bef4f90e7d13bae4f7b0c45acd1755ad89826..a1c3c5954ec7e8eb3753c8fd782a1570f9eb9c17 100644
> --- a/drivers/of/base.c
> +++ b/drivers/of/base.c
> @@ -2122,14 +2122,21 @@ static bool of_check_bad_map(const __be32 *map, int len)
>   	return true;
>   }
>   
> -static int of_map_id_fill_output(struct of_map_id_arg *arg,
> -				 struct device_node *phandle_node, u32 id_or_offset,
> -				 const __be32 *out_base, u32 cells,
> -				 bool bypass)
> +/*
> + * Fill the id_out and target for the of_map_id() caller. Also
> + * call the callback passed to the of_map_id() as part of the arg
> + * that decides if to continue further search.
> + */
> +static int of_map_id_fill_arg(struct of_map_id_arg *arg,
> +			      struct device_node *phandle_node, u32 id_or_offset,
> +			      const __be32 *out_base, u32 cells,
> +			      bool bypass, bool *multi_id_map)
>   {
> +	int ret;
> +
>   	if (bypass) {
>   		arg->map_args.args[0] = id_or_offset;
> -		return 0;
> +		goto output;
>   	}
>   
>   	if (arg->map_args.np)
> @@ -2145,7 +2152,14 @@ static int of_map_id_fill_output(struct of_map_id_arg *arg,
>   
>   	arg->map_args.args_count = cells;
>   
> -	return 0;
> +output:
> +	/* pass the output for the callback, callers may further decide */
> +	ret =  arg->cb ? arg->cb(arg) : 0;
> +
> +	if (multi_id_map && ret == -EAGAIN)
> +		*multi_id_map = true;
> +
> +	return ret;
>   }
>   
>   /**
> @@ -2179,6 +2193,7 @@ int of_map_id(const struct device_node *np, u32 id, const char *map_name,
>   	int map_bytes, map_len, offset = 0;
>   	bool bad_map = false;
>   	const __be32 *map = NULL;
> +	bool multi_id_map = false;
>   
>   	if (!np || !map_name || !arg)
>   		return -EINVAL;
> @@ -2264,23 +2279,26 @@ int of_map_id(const struct device_node *np, u32 id, const char *map_name,
>   		if (masked_id < id_base || id_off >= id_len)
>   			continue;
>   
> -		ret = of_map_id_fill_output(arg, phandle_node, id_off, out_base, cells, false);
> +		ret = of_map_id_fill_arg(arg, phandle_node, id_off, out_base,
> +					 cells, false, &multi_id_map);
>   		if (ret == -EAGAIN)
>   			continue;
>   
>   		pr_debug("%pOF: %s, using mask %08x, id-base: %08x, out-base: %08x, length: %08x, id: %08x -> %08x\n",
>   			np, map_name, map_mask, id_base, be32_to_cpup(out_base),
>   			id_len, id, id_off + be32_to_cpup(out_base));
> -		return 0;
> +		return ret;
>   	}
>   
> +	if (multi_id_map)
> +		return 0;
> +
>   	pr_info("%pOF: no %s translation for id 0x%x on %pOF\n", np, map_name,
>   		id, arg->map_args.np  ? arg->map_args.np : NULL);
>   
>   bypass_translation:
>   	/* Bypasses translation */
> -	return of_map_id_fill_output(arg, NULL, id, 0, 0, true);
> -
> +	return of_map_id_fill_arg(arg, NULL, id, 0, 0, true, NULL);
>   err_map_len:
>   	pr_err("%pOF: Error: Bad %s length: %d\n", np, map_name, map_bytes);
>   	return -EINVAL;
> diff --git a/include/linux/of.h b/include/linux/of.h
> index 9efa6f93712c6024f05476f9fd39f3294f942ec1..abab73a76682351f5635c1127a6c899917525050 100644
> --- a/include/linux/of.h
> +++ b/include/linux/of.h
> @@ -25,6 +25,9 @@
>   typedef u32 phandle;
>   typedef u32 ihandle;
>   
> +struct of_map_id_arg;
> +typedef int (*of_map_id_cb)(struct of_map_id_arg *arg);
> +
>   struct property {
>   	char	*name;
>   	int	length;
> @@ -76,6 +79,9 @@ struct of_phandle_args {
>   
>   struct of_map_id_arg {
>   	struct of_phandle_args map_args;
> +	of_map_id_cb cb;
> +	struct device *dev;
> +	bool multi_map;
>   };
>   
>   struct of_phandle_iterator {
> 

I think at a minimum this and the previous patch should be separated 
into its/their own series ∵ you really require this to be applied before 
proceeding on with the rest of the submission.

Get these two patches through iommu@lists.linux.dev in isolation and 
then submit the driver changes to consume.

---
bod

