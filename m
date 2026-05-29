Return-Path: <linux-media+bounces-63046-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id QPSgH1WrGWpdyQgAu9opvQ
	(envelope-from <linux-media+bounces-63046-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Fri, 29 May 2026 17:05:57 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id E69656043AE
	for <lists+linux-media@lfdr.de>; Fri, 29 May 2026 17:05:56 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id D5AE230A57ED
	for <lists+linux-media@lfdr.de>; Fri, 29 May 2026 14:58:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 53F1C3EEACD;
	Fri, 29 May 2026 14:50:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="hfvaQ+kK"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com [209.85.128.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3EBAD3FC5DE
	for <linux-media@vger.kernel.org>; Fri, 29 May 2026 14:50:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780066214; cv=none; b=nJt5IE/JoHQCFfuwYeLv5XfR6rnjn2vdZnTEC4RmVAZNWFOIfcgaIkwKVc/TUsCfSRxaQmBz5HyPdJQHHoKGiEFBhOrD/6mRADMGOMOF9ArRJNZNOYDDxhGA1C5svjlYKqLtD5VbETK3/W7XFRVVXL477OfknBn0ZE0aDj5VpW8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780066214; c=relaxed/simple;
	bh=eYKpuyW60WhNBvpKpM0dnVeiP02GhlW+x65D2kkVOS4=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=dPfiGI8JFWgMXHlOwI8Zb95L/ocG/fK6uqiZgPKL4oWdYA7yRpua37uwpIsrKKOY3Lvs2X5PvSn0sZ12Lpy/RzU5nKeWdO7yGA4fA08saVqpc5jM56oyNeOEZxbis9SPaYF5wU0Fq02FqyzlABGgwrAvWbb4RYEo8x6Ndk0xD50=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=hfvaQ+kK; arc=none smtp.client-ip=209.85.128.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wm1-f53.google.com with SMTP id 5b1f17b1804b1-4904127c32cso48664065e9.2
        for <linux-media@vger.kernel.org>; Fri, 29 May 2026 07:50:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1780066209; x=1780671009; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=998TnqsmogxF/r6nfGdlWjCmEBwKB7v3lBt+Tn4sLtI=;
        b=hfvaQ+kKPCS/jBYagSjCYJZJZD6hVRHs2eMM99y3616dNraowD1c1+cYpXSc1liAfL
         9edJhFRJ2a6ZtdwsH80ih7wBF8m86MuT1D3VDcsxf6wbtQzyfC1Iu4wNmOJ2uGw/acUi
         OH5TzLE83V9cDYRgkBBwrUEyD6MScdh5J1aeRAMa/yqhVUOXCevGpGZtD3BL98ELi89i
         ctSH+pjpSPQaRsXpoNMfxY87TpfWjcJsbJn1JXsZYcsraAwZ5soDaQRLc8VPjW67DPPo
         pcnvvbe3wdRfCL1U8+VU7tee57RMUe35HoZcSATUOqk+dfZfE8PimFat+CrkptspEClC
         LjSw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780066209; x=1780671009;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=998TnqsmogxF/r6nfGdlWjCmEBwKB7v3lBt+Tn4sLtI=;
        b=AD7WsAQ7xSqXzsNg9uYQqEsS6OV2XMA/kD1KD0yQJbUVo/swjhRwq0sRuogpx4dXHs
         5AoY9zDGDSHGZMp8EpjwJOCGntb1XBmN7EMK3bXAHOv3jjDW36bwBW/4U5mOlw45cI1c
         ufzVjgcN7M+wZn00uOFvRH/ELszL6Ke+FGPIWHa7avAlRmpuLBBnE6PZB4GUGrYQb9Z7
         pwYoYtiXLU2brkovqbfKG/8bZBnLbimQnpxLy34KrslcSCPOhkq7QsY26PXkGo8ncYmo
         m0ALbHwIJPxXFY7bgDK1Ns+XKUTmTuSSGu4CUbkL+AkEmhEP04E26DRbpjzwBqxQjyl3
         IbUg==
X-Forwarded-Encrypted: i=1; AFNElJ99xR5VGi4CfsJ0nG+HvUFZDJo7Q2YV8Wpj/srNQNDNha8KOrm+A+6lCHj3jXRZUcvE/9/kKruY6aksEA==@vger.kernel.org
X-Gm-Message-State: AOJu0Yymx6GLLV/9SdKn7oI++0QB/VT818tJWg8j6KNTLEo4rWbj1ofc
	RqPJzM4j+XGrWig0uT7mBZiw+usCiy4tBJAvBYKCGxB96rUcTHaOqbC2xgFInaxKwRM=
X-Gm-Gg: Acq92OFCeFNmq9dtW1+R9yxZfbT2YUPpRKpHhwZmee9U/Ml6ksfms5vj2UMrVFLTjr9
	X7xzwg3GI729Y0U2vUIvAeN+Wc53bqmgXEvgKE3ma4R1ws5t3wnolsV2W9yNq5J1BNg8s4WE+qh
	diZN9bxhsVHWDvxdEDMviN5rxdzYKxv1IL440SyRxbVWkysxnmUTLZfL9HJL8viOsdieEA0JhJU
	WoRTYR11kyM6XvJ1QTqmiilgiPHIgTfLL+WS90Ck33tCDhE3UzgZPTTErDi2y6erhG++InZyHU2
	SZoADj0qkiEoanEnK1L0bYK17pdNhAchHSyuV+VEKXJ2T4HEniKE5CvFglZBP91dnyBbcEqlGb1
	nVTXmXbBHBCCfM8cDvvRlGlIznvqXboIxR9/Pkk4V77ZpjfQjwNf98YbET3FDOhCHhaubBZHbkC
	Anp6/M65YM49d4hXwgxHHe5pLbhynIkSWUHP+4jamcKQU=
X-Received: by 2002:a7b:c358:0:b0:490:53b0:9e53 with SMTP id 5b1f17b1804b1-4909c078feamr38969365e9.1.1780066209385;
        Fri, 29 May 2026 07:50:09 -0700 (PDT)
Received: from [192.168.0.101] ([64.43.33.81])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4909ca6e124sm49040165e9.7.2026.05.29.07.50.08
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 29 May 2026 07:50:08 -0700 (PDT)
Message-ID: <449651a8-18a5-40d2-bc68-59223dc8b69a@linaro.org>
Date: Fri, 29 May 2026 15:50:07 +0100
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 5/6] media: qcom: camss: enable vfe for Glymur
To: Vikram Sharma <vikram.sharma@oss.qualcomm.com>,
 Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
 Loic Poulain <loic.poulain@oss.qualcomm.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Nihal Kumar Gupta <nihal.gupta@oss.qualcomm.com>,
 Robert Foss <rfoss@kernel.org>, Andi Shyti <andi.shyti@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-media@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-i2c@vger.kernel.org, Suresh Vankadara <svankada@qti.qualcomm.com>,
 Prashant Shrotriya <pshrotri@qti.qualcomm.com>
References: <20260529-glymur_camss-v1-0-bee535396d22@oss.qualcomm.com>
 <20260529-glymur_camss-v1-5-bee535396d22@oss.qualcomm.com>
From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Content-Language: en-US
In-Reply-To: <20260529-glymur_camss-v1-5-bee535396d22@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[linaro.org,none];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	R_DKIM_ALLOW(-0.20)[linaro.org:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[17];
	TAGGED_FROM(0.00)[bounces-63046-lists,linux-media=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	DKIM_TRACE(0.00)[linaro.org:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[bryan.odonoghue@linaro.org,linux-media@vger.kernel.org];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-media,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:email,tor.lore.kernel.org:rdns,tor.lore.kernel.org:helo]
X-Rspamd-Queue-Id: E69656043AE
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On 29/05/2026 15:37, Vikram Sharma wrote:
> From: Prashant Shrotriya <pshrotri@qti.qualcomm.com>
> 
> Extend vfe_src_pad_code() and vfe_bpl_align() for Glymur.
> 
> Signed-off-by: Prashant Shrotriya <pshrotri@qti.qualcomm.com>
> Signed-off-by: Vikram Sharma <vikram.sharma@oss.qualcomm.com>
> ---
>   drivers/media/platform/qcom/camss/camss-vfe.c | 2 ++
>   1 file changed, 2 insertions(+)
> 
> diff --git a/drivers/media/platform/qcom/camss/camss-vfe.c b/drivers/media/platform/qcom/camss/camss-vfe.c
> index 319d19158988..baaecc22a716 100644
> --- a/drivers/media/platform/qcom/camss/camss-vfe.c
> +++ b/drivers/media/platform/qcom/camss/camss-vfe.c
> @@ -353,6 +353,7 @@ static u32 vfe_src_pad_code(struct vfe_line *line, u32 sink_code,
>   	case CAMSS_8550:
>   	case CAMSS_8650:
>   	case CAMSS_8775P:
> +	case CAMSS_GLYMUR:
>   	case CAMSS_X1E80100:
>   		switch (sink_code) {
>   		case MEDIA_BUS_FMT_YUYV8_1X16:
> @@ -2013,6 +2014,7 @@ static int vfe_bpl_align_rdi(struct vfe_device *vfe)
>   	case CAMSS_8550:
>   	case CAMSS_8650:
>   	case CAMSS_8775P:
> +	case CAMSS_GLYMUR:
>   	case CAMSS_X1E80100:
>   		ret = 16;
>   		break;
> 

This is a pointless enum add.

NAK.

---
bod

