Return-Path: <linux-media+bounces-2633-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id B80FE817CF4
	for <lists+linux-media@lfdr.de>; Mon, 18 Dec 2023 22:51:18 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 660AB281C4B
	for <lists+linux-media@lfdr.de>; Mon, 18 Dec 2023 21:51:17 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 46BE574E0F;
	Mon, 18 Dec 2023 21:51:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="gp6NBwr0"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-lj1-f176.google.com (mail-lj1-f176.google.com [209.85.208.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AF15C740A2
	for <linux-media@vger.kernel.org>; Mon, 18 Dec 2023 21:51:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lj1-f176.google.com with SMTP id 38308e7fff4ca-2cc4029dc6eso44708121fa.1
        for <linux-media@vger.kernel.org>; Mon, 18 Dec 2023 13:51:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1702936259; x=1703541059; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=HpqC5fnit+OvETtq6T9wtzXgUHs1FJOABqRcVnmg1Jg=;
        b=gp6NBwr09y/Dga1MGMtN+JjH3t5Z1eHDvLdvEGgb6iQNNR2FUeUR0LiJbKcq/nwrFS
         lzIOiqhTaCW35K7tskKWi0yhkrSOuwmo3vng69NZbSecFBbnUQDO+En+RVdMle4Z7CWN
         vti4wT7YHiD8JRscQwjbsI6g0dT7pUTi8wyT97nWD6IJSHPsPaV+6njqUiOHTQKSfksl
         FvNfZgTXp5wMHZCVc0/r59Y856ihFA1y1Op7EYbsvKOCC0+QemihOajUsvi7mVg5HY/x
         qk9a8hoL34NErSfzRWBiELXwu2KQ9HTF9bgH/G62f4dIk903eXTbyotehffuY3iH6nlT
         2b0w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1702936259; x=1703541059;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=HpqC5fnit+OvETtq6T9wtzXgUHs1FJOABqRcVnmg1Jg=;
        b=B9rjznfXP2N8oFN2Pto4TNX7ip2F1gECH49ZeCcwF4Vg/c2/IysfaSN4y2YOtUOgbW
         tnBaFu3C23mUr3KQWJarXzmY+r1XhLBKCUxEERzVX6b6VNuvXbqE/fP+k6fvVF8aJ/9K
         vEbX+M8xDczWsSu/MTil5tdknUFI86N4RR6nxpndV8qwXH0AFbWvl/19BqTvLpykvXZj
         W59g3t31nxHNZwRPH3h1ik3uzyABtAEYw893RGb8yrmP9wAwvnWHacWHIGs3+dAwGEhg
         wSz/OtZ49vJ+waI4xrHhdUNPVYdVQZBoiGSsUAYTaVjwWIDsJRgA4VO/hfS/EK3yBiFx
         Sdgg==
X-Gm-Message-State: AOJu0YxHTPKKdxyq+VOM2OCK0WvHkncZKs1XIB9WD5nEM9EFSjx0jDdL
	ecX6bBYmVCxqBLkZLriAbrdDwg==
X-Google-Smtp-Source: AGHT+IGaGm4QpmOIGIy0kS4wH041LlNK8W/DICtV5z7/1mZ2jOUrn2yU5m4ZurHCHvQYWVf7yC/0Bg==
X-Received: by 2002:a2e:9545:0:b0:2ca:cb:36a1 with SMTP id t5-20020a2e9545000000b002ca00cb36a1mr7529025ljh.30.1702936258680;
        Mon, 18 Dec 2023 13:50:58 -0800 (PST)
Received: from [172.30.205.119] (UNUSED.212-182-62-129.lubman.net.pl. [212.182.62.129])
        by smtp.gmail.com with ESMTPSA id t1-20020a2e9c41000000b002c9ef016247sm3458166ljj.132.2023.12.18.13.50.57
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 18 Dec 2023 13:50:58 -0800 (PST)
Message-ID: <35e714ac-017e-4c3e-9a7f-75cf943fc515@linaro.org>
Date: Mon, 18 Dec 2023 22:50:57 +0100
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 11/34] media: iris: introduce packetization layer for
 creating HFI packets
Content-Language: en-US
To: Dikshita Agarwal <quic_dikshita@quicinc.com>,
 linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
 stanimir.k.varbanov@gmail.com, quic_vgarodia@quicinc.com, agross@kernel.org,
 andersson@kernel.org, mchehab@kernel.org, bryan.odonoghue@linaro.org
Cc: linux-arm-msm@vger.kernel.org, quic_abhinavk@quicinc.com
References: <1702899149-21321-1-git-send-email-quic_dikshita@quicinc.com>
 <1702899149-21321-12-git-send-email-quic_dikshita@quicinc.com>
From: Konrad Dybcio <konrad.dybcio@linaro.org>
In-Reply-To: <1702899149-21321-12-git-send-email-quic_dikshita@quicinc.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit



On 12/18/23 12:32, Dikshita Agarwal wrote:
> Host firmware interface (HFI) is well defined set of interfaces
> for communication between host driver and firmware.
> The command and responses are exchanged in form of packets.
> One or multiple packets are grouped under packet header.
> Each packet has packet type which describes the specific HFI
> and payload which holds the corresponding value for that HFI.
> 
> Sys_init is the first packets sent to firmware, which initializes
> the firmware. Sys_image_version packet is to get the firmware
> version string.
> 
> Signed-off-by: Dikshita Agarwal <quic_dikshita@quicinc.com>
> ---
[...]

>   struct iris_core {
> @@ -65,6 +70,11 @@ struct iris_core {
>   	struct mem_desc				sfr;
>   	struct mutex				lock; /* lock for core structure */
>   	unsigned int				use_tz;
> +	u8					*packet;
> +	u32					packet_size;
I'm not sure it's necessary to always keep a reference to the last
packet in the core struct, especially since it needs to be allocated
first anyway

> +	u32					sys_init_id;
This looks like a hyper-defensive measure against some firmware
overtaking attacks.. Or a way to spot random/unwanted resets of
the firmware core..

Is it actually necessary, or does this just serve as a debug
feature?

> +	u32					header_id;
Similar to above..

> +	u32					packet_id;
And here.

I performed some quick CTRL-F-agge around the series and this is
never reset.. Can the firmware cope with this? What if I watch a
veeeery long youtube video that ends up creating more than
(1<<32)-1 HFI packets while playing?

> +
> +enum hfi_packet_host_flags {
> +	HFI_HOST_FLAGS_NONE			= 0x00000000,
> +	HFI_HOST_FLAGS_INTR_REQUIRED		= 0x00000001,
> +	HFI_HOST_FLAGS_RESPONSE_REQUIRED	= 0x00000002,
> +	HFI_HOST_FLAGS_NON_DISCARDABLE		= 0x00000004,
> +	HFI_HOST_FLAGS_GET_PROPERTY		= 0x00000008,
BIT(n)?

> +};
> +
> +enum hfi_packet_firmware_flags {
> +	HFI_FW_FLAGS_NONE		= 0x00000000,
> +	HFI_FW_FLAGS_SUCCESS		= 0x00000001,
> +	HFI_FW_FLAGS_INFORMATION	= 0x00000002,
> +	HFI_FW_FLAGS_SESSION_ERROR	= 0x00000004,
> +	HFI_FW_FLAGS_SYSTEM_ERROR	= 0x00000008,
BIT(n)?

Konrad

