Return-Path: <linux-media+bounces-61641-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id gKEbGN3vBmrOowIAu9opvQ
	(envelope-from <linux-media+bounces-61641-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Fri, 15 May 2026 12:05:17 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id C9E7D54CFDC
	for <lists+linux-media@lfdr.de>; Fri, 15 May 2026 12:05:16 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 2F9B031CF992
	for <lists+linux-media@lfdr.de>; Fri, 15 May 2026 09:39:08 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3482944CF4E;
	Fri, 15 May 2026 09:38:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="l7KnHs6Q"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-wr1-f53.google.com (mail-wr1-f53.google.com [209.85.221.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 25B2544CAE6
	for <linux-media@vger.kernel.org>; Fri, 15 May 2026 09:38:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778837884; cv=none; b=cH+Jf6bov2I5jjWq5ueg863roNDSW1kgxJy+iR4vIIQTEWap0p6VYQJLrjZu9YzfdcLS2kxlJG8EK+11OEiag0uY/339wqYDQF+wl3kUupyi01znb/wlBFvqIY690Ju7SpxdjLmbN1769XB6Hb8tMRez6GW/huTDqrvIIo6WPfI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778837884; c=relaxed/simple;
	bh=3+DIrEKOTRjSn6Jf6u2F/51kxz9IyDHPxLTMZ31egG8=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Lf8drlK556pK5KU9RncMno566i1JfdswWziTyveeAwJyuBXCzIW0DQmUM/Vio2O647eN9Ivd451i+vAWXrLncr/MEY1IwBZg9aZFcMgki+E4/Iw0Rj6dKV0CNODyejU8gJ6er3AUPlvtGmwRFDttDX4SMRRSh01t/h6lSlZfaJY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=l7KnHs6Q; arc=none smtp.client-ip=209.85.221.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wr1-f53.google.com with SMTP id ffacd0b85a97d-449d6c68ed8so7847084f8f.0
        for <linux-media@vger.kernel.org>; Fri, 15 May 2026 02:38:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1778837881; x=1779442681; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=JM0+spwssTd7/SW0gHqM1ACIOAIt6XsH3GP9t91zyrs=;
        b=l7KnHs6Qy/WxNWuBa5bQu+OslUFq53oJnEXGUPyIvuGXiXy50poBlU6pybzxfmzKdL
         WAOzuzmSfuoe09/URs5ZysrTKKEwHfaKUYEGplEYAtqHDTJeLer3536nmRTmpKje0uxR
         LYMD2JDgFNibw9XgF4q5wCKBq21yiV9vwHIQJTPxwIdE3f0un6Pm0ZA9Fbj7No+hkiks
         6VK6js3XnrsN/EWtm3AkfT6WAgUEguAz7hrpPOFzx9BJY6BsrrS/pWIKDMD/GOuzkxwF
         Yf9ppQ80AsBTDB59rA+Ex62bROKN7PfScqcuBWGad8tOsHL7roGluMaZZmEV4t4i8ZBs
         Lrrw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778837881; x=1779442681;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=JM0+spwssTd7/SW0gHqM1ACIOAIt6XsH3GP9t91zyrs=;
        b=g9GCsD47eVRTIvAxeGOzhysnxMRmqZC4d7hNXOH4XV8AZhDPDn4sVVWAHl+SjMGV+t
         /zqr1eEqIdyjjN67CXQS3vc1tz7S1joHtUXFgINdAhgoabL17LSE6tBnI6Sd9Bg1LqS7
         xNeG7kTzRc864zOWKe8nBcia2sNourX9DslUoCaZg2QUpJHtEyO/evJqflqVifoYsl1Z
         t1Yq9jqYpGIhe8GzO0GdGKAkkFeCpihUwCwngfYQj8MJQxJF0JDqwlaPR9ugGRW6aXTu
         9ESYnsqaU4VgtRAkqM3YrA7T6LjIJC+yMaaE/ksFvFDFh9ckuqUXF5B56hPJ9lgUxt5m
         Rw/g==
X-Gm-Message-State: AOJu0Yy9OxVeoJa2F7Im5a0eyHMJwq6aHIE+9HfmF3AplXtis8TxBy69
	5Y3bEYMvY4e18sfqsAW8v7PeoPkiP5EXPIgIZbTyY6TnJWQJFF4Z3gO+NJ+2MH63H6+K6Kt0Ruv
	3hzO5Tlk=
X-Gm-Gg: Acq92OG0zXVxcIGd8MqjRt0BiUe6AvkiEKfKwUbgaf20EAYeI9FbD1cBy/1anGJ9/AN
	K+xppu8oHhm4MV2LUz3woc3cDfk29LU5ttBqEzWZjlEBNfX9ZcNF6ltBDi611b/9c+TMqPgVw2L
	FDZSmCze7XMoSEbDrYbmkF374GRNrXionWi2CuH8ptxKgluEIoFF5Z8Q1ZhDmYkAgIvTbycr+1V
	2YO4yTlfWm3g2iEPU/iV3acK7VI3ADRwz5AvJzH6y4kA69pKkp64e7mvrvMcH1r36cPKKbl6LvF
	VreAFF9h/A/W0AXE/2NliXAhp/cKby1+Rx6fQom0dKgj3MNpTmCMQ9kRrenJXpgRMhmYr1jBouE
	Zz/1bvD3R350RftpsSQlBbSH5UixHwHbWctlfu7+3Brg6UPnBv0/pjgqoINhDJ7kaGkGC0dOidl
	oQU5PkQwfJV0az3SC9FeQg0T19asqr0fQ1dbvB
X-Received: by 2002:a05:6000:40df:b0:456:f186:7af8 with SMTP id ffacd0b85a97d-45e5c35e4c5mr4179602f8f.4.1778837881492;
        Fri, 15 May 2026 02:38:01 -0700 (PDT)
Received: from [192.168.0.167] ([109.76.168.101])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-45d9ec3ac86sm13540897f8f.14.2026.05.15.02.38.00
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 15 May 2026 02:38:00 -0700 (PDT)
Message-ID: <af3c7e4d-f18b-4247-82e9-2dc74f569a5d@linaro.org>
Date: Fri, 15 May 2026 10:37:59 +0100
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 5/6] media: qcom: iris: vdec: update find_format to
 handle 8bit and 10bit formats
To: Neil Armstrong <neil.armstrong@linaro.org>,
 Vikash Garodia <vikash.garodia@oss.qualcomm.com>,
 Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>,
 Abhinav Kumar <abhinav.kumar@linux.dev>,
 Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <20260511-topic-sm8x50-iris-10bit-decoding-v3-0-7fc049b93042@linaro.org>
 <0boIejkDZLA5Kw9uSWxeZX3GforfnPgAo7E27fY_Nnp4VjgHo8d9b70ojS2zrG-xk4dDT__EyunCPPEgJh1Niw==@protonmail.internalid>
 <20260511-topic-sm8x50-iris-10bit-decoding-v3-5-7fc049b93042@linaro.org>
From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Content-Language: en-US
In-Reply-To: <20260511-topic-sm8x50-iris-10bit-decoding-v3-5-7fc049b93042@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Rspamd-Queue-Id: C9E7D54CFDC
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[linaro.org,none];
	R_DKIM_ALLOW(-0.20)[linaro.org:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-61641-lists,linux-media=lfdr.de];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	DKIM_TRACE(0.00)[linaro.org:+];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	MIME_TRACE(0.00)[0:+];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[bryan.odonoghue@linaro.org,linux-media@vger.kernel.org];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	RCPT_COUNT_SEVEN(0.00)[8];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[linux-media];
	TO_DN_SOME(0.00)[]
X-Rspamd-Action: no action

On 11/05/2026 10:20, Neil Armstrong wrote:
> The 10bit pixel format can be only used when the decoder identifies the
> stream as decoding into 10bit pixel format buffers, so update the
> find_format helper to filter the formats and only allow the proper
> formats when setting or trying a capture format.
> 
> Signed-off-by: Neil Armstrong <neil.armstrong@linaro.org>
> ---
>   drivers/media/platform/qcom/iris/iris_platform_common.h |  1 +
>   drivers/media/platform/qcom/iris/iris_vdec.c            | 10 ++++++++++
>   2 files changed, 11 insertions(+)
> 
> diff --git a/drivers/media/platform/qcom/iris/iris_platform_common.h b/drivers/media/platform/qcom/iris/iris_platform_common.h
> index 5a489917580e..cd3509da4b75 100644
> --- a/drivers/media/platform/qcom/iris/iris_platform_common.h
> +++ b/drivers/media/platform/qcom/iris/iris_platform_common.h
> @@ -18,6 +18,7 @@ struct iris_inst;
> 
>   #define REGISTER_BIT_DEPTH(luma, chroma)	((luma) << 16 | (chroma))
>   #define BIT_DEPTH_8				REGISTER_BIT_DEPTH(8, 8)
> +#define BIT_DEPTH_10				REGISTER_BIT_DEPTH(10, 10)
>   #define CODED_FRAMES_PROGRESSIVE		0x0
>   #define DEFAULT_MAX_HOST_BUF_COUNT		64
>   #define DEFAULT_MAX_HOST_BURST_BUF_COUNT	256
> diff --git a/drivers/media/platform/qcom/iris/iris_vdec.c b/drivers/media/platform/qcom/iris/iris_vdec.c
> index eea69f937147..f4d9951ed04c 100644
> --- a/drivers/media/platform/qcom/iris/iris_vdec.c
> +++ b/drivers/media/platform/qcom/iris/iris_vdec.c
> @@ -99,6 +99,16 @@ find_format(struct iris_inst *inst, u32 pixfmt, u32 type)
>   	if (i == size || fmt[i].type != type)
>   		return NULL;
> 
> +	if (type == V4L2_BUF_TYPE_VIDEO_CAPTURE_MPLANE) {
> +		if (iris_fmt_is_8bit(fmt[i].pixfmt) &&
> +		    inst->fw_caps[BIT_DEPTH].value == BIT_DEPTH_10)
> +			return NULL;
> +
> +		if (iris_fmt_is_10bit(fmt[i].pixfmt) &&
> +		    inst->fw_caps[BIT_DEPTH].value != BIT_DEPTH_10)
> +			return NULL;
> +	}
> +
>   	return &fmt[i];
>   }
> 
> 

Reviewed-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>> --
> 2.34.1
> 


