Return-Path: <linux-media+bounces-20907-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 8456B9BCB03
	for <lists+linux-media@lfdr.de>; Tue,  5 Nov 2024 11:51:48 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id B22741C22705
	for <lists+linux-media@lfdr.de>; Tue,  5 Nov 2024 10:51:47 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1745F1D414E;
	Tue,  5 Nov 2024 10:51:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="ikfewV4C"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com [209.85.128.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C34B41D31BA
	for <linux-media@vger.kernel.org>; Tue,  5 Nov 2024 10:51:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730803889; cv=none; b=PY/tEaOroG9s7pna2aHrMQf2t6C0BZj1xzSdmBpEdMdOQv8RDnejRi3Dhe7HBQKEufEoaJ9endKJfgpRbbUUNu3T+u/RsoyD7dhhxOYGkTSY5lIfm/xipFISCEvmVdfOwBPq98BJk7KMg1J5deelWdu8ZDUjIpoYzyqJULK7KTY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730803889; c=relaxed/simple;
	bh=HD+BgOOVBl5mx7chCMOpk4RtL2B+f8ert3pkr1zMpqA=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=QxGeur5hVIjd7bXciPrZWCum8RExpEey1PEhyS0mYnIfeJBRuYccL8sYyAoF1IZ1ju3BPfZUUAJVDMW6XctSgQ/eeQNHKMGsut34cVllB9JZ75C5mHER1CjW22hkeyw5S0kMIQHuLOyg8D5TWDIKr75f7/ITPLmPDH25+afwwYo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=ikfewV4C; arc=none smtp.client-ip=209.85.128.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wm1-f50.google.com with SMTP id 5b1f17b1804b1-4316cce103dso62744645e9.3
        for <linux-media@vger.kernel.org>; Tue, 05 Nov 2024 02:51:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1730803886; x=1731408686; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=8ATNs/B/w+2yp0EYeoeJF01EDXlRzVZxzeXpZEXEEfY=;
        b=ikfewV4COefm9gwaIO0IxX3dbvV2S1d9cgPiGAJMVw2DFMm9voM9DE0lpEL+Me6AYl
         j7akomgGodRuAvryorhtNuFXzdFfAOX4qxEdVl4vxynWy8V4QdZphz5bdDy8JKEoT8Me
         ksWHuPDWGniPKqTT9/l2ekyjoxKwgLalxsLGfdlqAb5zNFwX+VMpVzsi/emgy9Jk+6dJ
         7/zK+xbnfMIRTmSDPaW6sJiI7fDuTfzOUkXecz1UaQIy/JTTWeL9/ejQaG+FzJfUE8bd
         Nfo49EWgcFAb701SbNqiUuTt2iT42xkfRk4Qy7GViIHP1q8Mls5yCRaUUlD3AR6ZPUNt
         2Rig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730803886; x=1731408686;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=8ATNs/B/w+2yp0EYeoeJF01EDXlRzVZxzeXpZEXEEfY=;
        b=gzgqM1QpT8ogeKYnwn689JaEKeAeGeIoXb9uxgtFDjG1DHMq6HMjaL4B1/Sx/bahTz
         4oP80IKalp6fo+TSBVYQgvl2oXFeSBbNA+B3jkWjvp1h0GAtHW91QKp2JZkgsxtpcyfT
         ukV3dHZ12WgYvMkjVWsxTyfvJzZKdx/zuGPUb+G+GxyOQhH9QfqjzpIoTws3KCZD3fAN
         sWGgLhac91DqdCRtSZRb1h++4xACUprbTLAJdAoBXUYeV3tDHtWR6YtQBHbQUoy9pjXY
         ESExDvA8u5DTXOtKYV0HC8XmZegfOgymZ03/KAtsUKQDQQFnMZBxXrNMAbDYxXke4KM1
         yi/w==
X-Gm-Message-State: AOJu0YyDc+H7rqYiaFJojGXTLj2GQQuWlfC1TyLgczG5qDc0fiWUe0bv
	tEsMxDk/3BWUH1iE5B9zn62BLeWahXSrZ6yVpiq0LZ9c52YKRJPJqZksJQ/5qkA=
X-Google-Smtp-Source: AGHT+IH71ZuNZKuI+PZhGTdJo4OsIY4DbJKX5pqqVUQT1HsIyvod98087dQv/2ssVzIfDzdbe8PZUg==
X-Received: by 2002:a05:600c:1d1e:b0:431:604d:b22 with SMTP id 5b1f17b1804b1-43283255922mr160211525e9.16.1730803884606;
        Tue, 05 Nov 2024 02:51:24 -0800 (PST)
Received: from [192.168.0.40] ([176.61.106.227])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-381c116af7esm15800883f8f.103.2024.11.05.02.51.23
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 05 Nov 2024 02:51:24 -0800 (PST)
Message-ID: <640fe933-078d-4bf5-815c-7db0eb8b9de4@linaro.org>
Date: Tue, 5 Nov 2024 10:51:22 +0000
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/4] media: venus: hfi_parser: add check to avoid out of
 bound access
To: Vikash Garodia <quic_vgarodia@quicinc.com>,
 Stanimir Varbanov <stanimir.k.varbanov@gmail.com>,
 Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
 Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
 linux-kernel@vger.kernel.org, stable@vger.kernel.org
References: <20241105-venus_oob-v1-0-8d4feedfe2bb@quicinc.com>
 <20241105-venus_oob-v1-1-8d4feedfe2bb@quicinc.com>
Content-Language: en-US
From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
In-Reply-To: <20241105-venus_oob-v1-1-8d4feedfe2bb@quicinc.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 05/11/2024 08:54, Vikash Garodia wrote:
> There is a possibility that init_codecs is invoked multiple times during
> manipulated payload from video firmware. In such case, if codecs_count
> can get incremented to value more than MAX_CODEC_NUM, there can be OOB
> access. Keep a check for max accessible memory before accessing it.
> 
> Cc: stable@vger.kernel.org
> Fixes: 1a73374a04e5 ("media: venus: hfi_parser: add common capability parser")
> Signed-off-by: Vikash Garodia <quic_vgarodia@quicinc.com>
> ---
>   drivers/media/platform/qcom/venus/hfi_parser.c | 4 ++++
>   1 file changed, 4 insertions(+)
> 
> diff --git a/drivers/media/platform/qcom/venus/hfi_parser.c b/drivers/media/platform/qcom/venus/hfi_parser.c
> index 3df241dc3a118bcdeb2c28a6ffdb907b644d5653..27d0172294d5154f4839e8cef172f9a619dfa305 100644
> --- a/drivers/media/platform/qcom/venus/hfi_parser.c
> +++ b/drivers/media/platform/qcom/venus/hfi_parser.c
> @@ -23,6 +23,8 @@ static void init_codecs(struct venus_core *core)
>   		return;
>   
>   	for_each_set_bit(bit, &core->dec_codecs, MAX_CODEC_NUM) {
> +		if (core->codecs_count >= MAX_CODEC_NUM)
> +			return;
>   		cap = &caps[core->codecs_count++];
>   		cap->codec = BIT(bit);
>   		cap->domain = VIDC_SESSION_TYPE_DEC;
> @@ -30,6 +32,8 @@ static void init_codecs(struct venus_core *core)
>   	}
>   
>   	for_each_set_bit(bit, &core->enc_codecs, MAX_CODEC_NUM) {
> +		if (core->codecs_count >= MAX_CODEC_NUM)
> +			return;
>   		cap = &caps[core->codecs_count++];
>   		cap->codec = BIT(bit);
>   		cap->domain = VIDC_SESSION_TYPE_ENC;
> 

I don't see how codecs_count could be greater than the control, since 
you increment by one on each loop but >= is fine too I suppose.

Reviewed-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>

