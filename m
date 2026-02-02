Return-Path: <linux-media+bounces-52028-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id sMvjGKO8gGl3AgMAu9opvQ
	(envelope-from <linux-media+bounces-52028-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Mon, 02 Feb 2026 16:02:59 +0100
X-Original-To: lists+linux-media@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id F2A39CDCE2
	for <lists+linux-media@lfdr.de>; Mon, 02 Feb 2026 16:02:58 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id A0DA2305F6C4
	for <lists+linux-media@lfdr.de>; Mon,  2 Feb 2026 14:53:10 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 04C78374722;
	Mon,  2 Feb 2026 14:53:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="UGQuQJWQ"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-ej1-f49.google.com (mail-ej1-f49.google.com [209.85.218.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E745737472D
	for <linux-media@vger.kernel.org>; Mon,  2 Feb 2026 14:52:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770043983; cv=none; b=ehZbO1bzMlgIyNTasfCt7agxPr/BLJic8E2JEe36kBXKi3lNAxl5krJsoLXnTU1CeDzKC5htrS72/mnr/1R6KS3A7zMnOHBDt6uK0H1NhykoFAJhmaL6cxrhOjsArI+RTUKVJPRDXTw9G/uD9ut8fscbEfCbh7tstzcUg708IsM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770043983; c=relaxed/simple;
	bh=7mmYBSlGn9pr58Ada0yI1WrJmu1rxBzreSlmAkai3QA=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=oOuDHZKS3YStHQOzpZ6qs7zh3ylnZCssLNWLa5l0VWY299fEBXsNaCI8mm5w7zBrUCU5dqby2dOiPSphkenXf4o7crN0E6VQbdoSHOL43irT2CM6020o0z+H0UX88JBht0lHuwhUt6CpehuJcfgWDBrxSw4MSU86mTLqEyoFtyY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=UGQuQJWQ; arc=none smtp.client-ip=209.85.218.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-ej1-f49.google.com with SMTP id a640c23a62f3a-b87677a8abeso687162466b.1
        for <linux-media@vger.kernel.org>; Mon, 02 Feb 2026 06:52:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1770043978; x=1770648778; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=/FAPn1s81bjTvSS2PqJP+fsJ0s7tNOWXLNO1ZsVsGR0=;
        b=UGQuQJWQlULnXqesHI3jej4arViV8N/KLUoQ98Xg7PHYTykMpJt4ki79D2fH5VAPEe
         I52ESEZs/0LUPi/UEdhslpm4C9WSSjIBSD/y/Rd0ZThHM5NRWybJRLQVxXRdLooXI8zs
         S6BSwWI2Rjc6HuhzD0LdA0PGrnjU9Y52kBkGLC7OhiXr3c3WQQMkC1y4IAYolHQg+iKZ
         0GGlhfxYthEmFnjT5Kjjy2VjDRQzZgoe+h6mNAnce+C/TifvJdvXwRU8Dp//WomyQk4X
         kha5u/N3hBpNin3uzVwWG0PqeGTvaKw0M4jP2n1zkFILVJs5MIkM2OtgXwcGfpt6PlX4
         psWg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770043978; x=1770648778;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=/FAPn1s81bjTvSS2PqJP+fsJ0s7tNOWXLNO1ZsVsGR0=;
        b=ln0PKUvT/QPrHJwkTAZZtbkgi/LR23h4CnV6P0OyMDXsj01QTTP8YLysupquSIGC1K
         NnYwQrE03Ab3ET2EZyEJBl13ZXrHa7wdV/zA5YG/YuY761eJXCwuDBOY5olJ4WYxOR0S
         wbWACWCjQ4HTu3xK9iDTU9HqDlKrwIm3BjCvCeqqvHU3i5ZFCzKqCKO+6n3WArJpbhuI
         RdTqsCRYl+kYHbDhfY2wZNoscbzOQuAMlXe8FlF1BO4+0GTomQiFAT5rgchGLpvuHMo4
         jOChgtLo8T9HeDwHTuFShImxhzgvRgnI9BsQr0KSQpQvcdY25z8zBaMsxcwMm0Y3/cna
         iiaA==
X-Forwarded-Encrypted: i=1; AJvYcCXnXou3d02bvZ9SKbq3D7STB2REU8ZOibufNa9dWmE7rAFKSrFVice+XMNGwJi4qaPVmOqiCGbjI17fSg==@vger.kernel.org
X-Gm-Message-State: AOJu0YzJPuGUjUuFRzlqd21/kvgRY04DZM9vFFEHGS//ZB4mr1mFnl6O
	Dnam699Juzzi1YbKejJIfuVHpetVsEr9iVsZlY+kx0ncG92Qnf+5h7urh2E6BQyg31Y=
X-Gm-Gg: AZuq6aIXtY/nYaOZmLAtDOFrpZ++e40OziQVXnUv0HbuCR8Ye9eaJLRHw7QN4YC6x4U
	vJEH0j5Q1a9JEx0KG3fJKprpGnewhEoXYKNEXomg4OGLIFEU/IY9iimlSCPAdzmCz1m9T3sn4gj
	5aIaO2NB5EaS2RGeIBVc0v+dlWVciL7e8Jij2JPB9i+wwUACkg1IMUHlJdpJRcyAOZa6bFnRyfG
	IkngLIEkJCSklhxN25+dMi0gVZRJLBqjenqC/QbFIj5FQ/mcNfBrhee4er+pJ46BgCLaB/pum1q
	Zw5fEzNyK9bX/iGm0dDvgtxfLmjGJ7kBYrZq6YJYHIpskRrAZtOR9y3XJmjy43s0RUxfoTj+fPX
	RAivRcjLg+SiLANAPPGDe/3rijrwMKL6X18kl1Vayhu0tO51+lncd9eV0yOIXEiZC7OUWXr9AI/
	qtmh4K4LpgM5/PnJ5EAB1trmy1uBTQcDP0QStC6iTXFa9HHqbLwVjC
X-Received: by 2002:a17:907:e118:b0:b88:5182:b869 with SMTP id a640c23a62f3a-b8dff53e52dmr517742466b.23.1770043977666;
        Mon, 02 Feb 2026 06:52:57 -0800 (PST)
Received: from [192.168.0.40] (188-141-3-146.dynamic.upc.ie. [188.141.3.146])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b8dbeff5629sm891897166b.27.2026.02.02.06.52.56
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 02 Feb 2026 06:52:57 -0800 (PST)
Message-ID: <47fbba15-6375-40fc-bd2c-8ebf2788837e@linaro.org>
Date: Mon, 2 Feb 2026 14:52:54 +0000
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/7] of: factor out of_map_id() code
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
 <20260126-kaanapali-iris-v1-2-e2646246bfc1@oss.qualcomm.com>
From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Content-Language: en-US
In-Reply-To: <20260126-kaanapali-iris-v1-2-e2646246bfc1@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[linaro.org,none];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	R_DKIM_ALLOW(-0.20)[linaro.org:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[24];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-52028-lists,linux-media=lfdr.de];
	DKIM_TRACE(0.00)[linaro.org:+];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[bryan.odonoghue@linaro.org,linux-media@vger.kernel.org];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-media,dt,cisco];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,linaro.org:mid,linaro.org:dkim,qualcomm.com:email]
X-Rspamd-Queue-Id: F2A39CDCE2
X-Rspamd-Action: no action

On 26/01/2026 12:25, Vikash Garodia wrote:
> From: Charan Teja Kalla <charan.kalla@oss.qualcomm.com>

This commit message is confusing and inaccurate.

First up, you're not factoring _out_ of_map_id() - factor out 
of_map_id() means to remove of_map_id() - you are refactoring of_map_id().

Your patch title should be something like "refactor of_map_id() to 
prepare for mapping of multiple IDs to a single device"

> Linux interprets multiple mappings for the same input ID as a set of
> equivalent choices to pick one. There exists usecases where these set
> must be maintained in parallel, ex: on ARM, a dynamically created child
> device(s) is referencing multiple input id's in parent iommu-map.
> 
> Factor out the code where multiple mappings needs to be maintained in
> parallel can be achieved through callback from this factored out code.

Which callback ? There is no ->function(pointer, here...); ?!

Just make some plain and straightforward statements about what you are 
doing and why. There's no need to resort to dissertation-speak.

> Signed-off-by: Charan Teja Kalla <charan.kalla@oss.qualcomm.com>
> Signed-off-by: Vijayanand Jitta <vijayanand.jitta@oss.qualcomm.com>
> Signed-off-by: Vikash Garodia <vikash.garodia@oss.qualcomm.com>
> ---
>   drivers/of/base.c | 47 ++++++++++++++++++++++++++++++++---------------
>   1 file changed, 32 insertions(+), 15 deletions(-)
> 
> diff --git a/drivers/of/base.c b/drivers/of/base.c
> index 0825f3dc93f2472e9947af09acdde72031ab85bc..606bef4f90e7d13bae4f7b0c45acd1755ad89826 100644
> --- a/drivers/of/base.c
> +++ b/drivers/of/base.c
> @@ -2122,6 +2122,32 @@ static bool of_check_bad_map(const __be32 *map, int len)
>   	return true;
>   }
>   
> +static int of_map_id_fill_output(struct of_map_id_arg *arg,
> +				 struct device_node *phandle_node, u32 id_or_offset,
> +				 const __be32 *out_base, u32 cells,
> +				 bool bypass)
> +{
> +	if (bypass) {
> +		arg->map_args.args[0] = id_or_offset;
> +		return 0;
> +	}
> +
> +	if (arg->map_args.np)
> +		of_node_put(phandle_node);
> +	else
> +		arg->map_args.np = phandle_node;
> +
> +	if (arg->map_args.np != phandle_node)
> +		return -EAGAIN;
> +
> +	for (int i = 0; i < cells; i++)
> +		arg->map_args.args[i] = (id_or_offset + be32_to_cpu(out_base[i]));
> +
> +	arg->map_args.args_count = cells;
> +
> +	return 0;
> +}
> +
>   /**
>    * of_map_id - Translate an ID through a downstream mapping.
>    * @np: root complex device node.
> @@ -2162,8 +2188,7 @@ int of_map_id(const struct device_node *np, u32 id, const char *map_name,
>   		if (arg->map_args.np)
>   			return -ENODEV;
>   		/* Otherwise, no map implies no translation */
> -		arg->map_args.args[0] = id;
> -		return 0;
> +		goto bypass_translation;
>   	}
>   
>   	if (map_bytes % sizeof(*map))
> @@ -2185,6 +2210,7 @@ int of_map_id(const struct device_node *np, u32 id, const char *map_name,
>   		struct device_node *phandle_node;
>   		u32 id_base, phandle, id_len, id_off, cells = 0;
>   		const __be32 *out_base;
> +		int ret;
>   
>   		if (map_len - offset < 2)
>   			goto err_map_len;
> @@ -2238,19 +2264,10 @@ int of_map_id(const struct device_node *np, u32 id, const char *map_name,
>   		if (masked_id < id_base || id_off >= id_len)
>   			continue;
>   
> -		if (arg->map_args.np)
> -			of_node_put(phandle_node);
> -		else
> -			arg->map_args.np = phandle_node;
> -
> -		if (arg->map_args.np != phandle_node)
> +		ret = of_map_id_fill_output(arg, phandle_node, id_off, out_base, cells, false);
> +		if (ret == -EAGAIN)
>   			continue;
>   
> -		for (int i = 0; i < cells; i++)
> -			arg->map_args.args[i] = (id_off + be32_to_cpu(out_base[i]));
> -
> -		arg->map_args.args_count = cells;
> -
>   		pr_debug("%pOF: %s, using mask %08x, id-base: %08x, out-base: %08x, length: %08x, id: %08x -> %08x\n",
>   			np, map_name, map_mask, id_base, be32_to_cpup(out_base),
>   			id_len, id, id_off + be32_to_cpup(out_base));
> @@ -2260,9 +2277,9 @@ int of_map_id(const struct device_node *np, u32 id, const char *map_name,
>   	pr_info("%pOF: no %s translation for id 0x%x on %pOF\n", np, map_name,
>   		id, arg->map_args.np  ? arg->map_args.np : NULL);
>   
> +bypass_translation:
>   	/* Bypasses translation */
> -	arg->map_args.args[0] = id;
> -	return 0;
> +	return of_map_id_fill_output(arg, NULL, id, 0, 0, true);
>   
>   err_map_len:
>   	pr_err("%pOF: Error: Bad %s length: %d\n", np, map_name, map_bytes);
> 


