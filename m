Return-Path: <linux-media+bounces-45089-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 87A63BF374E
	for <lists+linux-media@lfdr.de>; Mon, 20 Oct 2025 22:32:20 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 3A58318A6955
	for <lists+linux-media@lfdr.de>; Mon, 20 Oct 2025 20:32:43 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5650E29ACE5;
	Mon, 20 Oct 2025 20:32:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="DAZto7Ra"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com [209.85.128.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DAC3E2236E0
	for <linux-media@vger.kernel.org>; Mon, 20 Oct 2025 20:32:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760992331; cv=none; b=Y9i8on0p52xxjqtH3Dne0nZVxBQpZU80oOuvBzDFM+bLwpQTmH52sj97ySrmRIKpMdolJXZ55d2OPy+Vrf6vNzADp6EPdLDzv/VpES3aJIrZl4zb3ZCVHxumvhE+oRSI26Gr/KbOdokmwigAG7NTtadTcf2REx21oqyL3kLVLqQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760992331; c=relaxed/simple;
	bh=c7W7BdRslnUiINnTazMN+1bR68ND9emWP+ijC1QbHUE=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Q7sAv5Gh4XCPcF8GRG+tEIYOd7GeacHdpZMIkMT+qsRcgJi7i45W0/VjT3FoS5otzZD81vi9sTvlMybJTJ9fTW1uYuwpUpmh9Ck/EBJ18wfr42hTT8pjnq8635NY7IVVsEF3JDXCg7TdRbaeVqy+ToK0OAVvVAyCEOVgZoVaGbw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=DAZto7Ra; arc=none smtp.client-ip=209.85.128.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wm1-f45.google.com with SMTP id 5b1f17b1804b1-4711b95226dso35377685e9.0
        for <linux-media@vger.kernel.org>; Mon, 20 Oct 2025 13:32:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1760992328; x=1761597128; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=xV7aO91XA1EKltfEfLhh+WUtohK38h192UjKVGJnyJ8=;
        b=DAZto7Ra5LVhMDVJUtOePa+CHo4Fw9i+DiMXYMM5okH65ikjVud6QaGxhytpwpldZj
         pM2nOkcNu122J3yONuw955K3QVwhP1NwP3VHO39JOZtGkLyt9P3RL4mpIiofelnEMSAT
         Nm733M5WlhHK83ty3myzeDSwaaEF05i53JnMwhOAPl3ePFX8KQNCFGs7DEWcqaLcWPMl
         EDfh97eOAWdw9UqZVYe1BxqfYRYwo8hojFvHRB4vbUuNPZuXFO7CznDh1Cgh+zq2DxVY
         TBE5I6p2gg40X6n42qPpSO6IX1/QuCCtY0LKUUfmfrhlGqeWtKurZPgjF0uN4j57OwF4
         r46Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760992328; x=1761597128;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=xV7aO91XA1EKltfEfLhh+WUtohK38h192UjKVGJnyJ8=;
        b=j/pafsruhaMw1s+5Cq9yNCoo/Y35UuPcf++UtkPixzpdVO3qPRHF78AiQXju2DnaEH
         S0FsRtOc+/Tk8oPCRzJ52X5G9PR4lC9yamZ+YyxrAL2dvwmx8EBz9BQaWccw5Zcgl2ns
         CzVYRQhZ1EOtbNmVjbfCf9xQRAzcOqIdyHPo7pyfB/Bu8BwAjYUEVgEYtKEputcKYgRO
         sdxrHgTfeLTZzmb68xcARHUtnGGoKSccLB/KTJ6h7v9KBWp+WiH28qwPE3nDC48KDm3P
         02R55qLU8YmSDwTTjD4TCfA4uZjPT0WMHbBsE0S0BBUklrziHkpr5oSFbdjtDPNO0dB1
         SFRA==
X-Forwarded-Encrypted: i=1; AJvYcCUjzWDY4qukmMQbtoMyW16tvltHxi0ufbIqJ8ystoDa0RQwMpVOzPqbLsYqIRSShWAlTcieMSLCcXmRSA==@vger.kernel.org
X-Gm-Message-State: AOJu0YzruHYsis0UO63fhyHJy+vgSYWnYG1P8eBf41LB0IBoqOvcpMMO
	ntddOZk2/5eLu+SRfe/heyw3FVMrNkShHLQ5W/Liy2u5wnjh0kBAaOJT92e4oq5vJk4=
X-Gm-Gg: ASbGncte+/iOat4Gyo0WXLdQS51K3LBPiTn6EFLnG8y/bOGWIc1EEmfmSgZ8D+KMlgh
	UpGLX53Z3kw9OMm0ZmKs86TIT28waVt8E16M8LW4OOIO0aiYX3a7UzZJodJitioK7gmkG+dGXc5
	/4irf6dYfRX+puG7+xVj0ywLpX1wTidjPyOa6opAnFEiL2VkzJ7l7/XXpaDa0tWpLIJ1lgh0MJl
	uMNFvRudo38YPD7TzF+qCK+WZ0RKegfLZW4DTp4UyOs7Y7ul3eAv4w44Xmf8SFyLRhgsuME+xdo
	Niqp5EIKpBG2+spK5LTe5euPYOVMAWSTz1h1zIZYS2BtGzPRn+srUG5gVKF0oPsDX33K3rU116E
	uSzKMOlSyDrXUoFizAt0HWbH9wx80wN9HY6RQjBWGHSiyxo3EkO+KjJCzM8GuSHRvgsJxOTuxNG
	FIrmL7kAGaOzsHIv+rdBWgJVcsGN+Mewo7B59gfRXpG973b6NAcfXPBPJmRa0NxKGo
X-Google-Smtp-Source: AGHT+IGI2eFhwjI+QH/KTsQ5wDZc9aBnGwoN0mcHqpwVZHLVrlHx8oEYO8R9GZvWc6oAOVbJGMhxkA==
X-Received: by 2002:a05:600c:470d:b0:471:a98:998d with SMTP id 5b1f17b1804b1-471178a4ac3mr96226545e9.12.1760992328169;
        Mon, 20 Oct 2025 13:32:08 -0700 (PDT)
Received: from [192.168.0.163] (188-141-3-146.dynamic.upc.ie. [188.141.3.146])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-471144c82b8sm247669905e9.15.2025.10.20.13.32.07
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 20 Oct 2025 13:32:07 -0700 (PDT)
Message-ID: <44a3b5ff-f909-41bd-87c9-760b90d3496f@linaro.org>
Date: Mon, 20 Oct 2025 21:32:06 +0100
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] media: qcom: camss: Do not enable cpas fast ahb clock for
 SM8550 VFE lite
To: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
 Robert Foss <rfoss@kernel.org>, Todor Tomov <todor.too@gmail.com>
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>, linux-media@vger.kernel.org,
 linux-arm-msm@vger.kernel.org
References: <20251020140227.2264634-1-vladimir.zapolskiy@linaro.org>
From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Content-Language: en-US
In-Reply-To: <20251020140227.2264634-1-vladimir.zapolskiy@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 20/10/2025 15:02, Vladimir Zapolskiy wrote:
> The clock is needed to stream images over a full VFE IP on SM8550 CAMSS,
> and it should not be enabled, when an image stream is routed over any of
> two lite VFE IPs on the SoC.
> 
> Signed-off-by: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
> ---
>   drivers/media/platform/qcom/camss/camss.c | 6 ++----
>   1 file changed, 2 insertions(+), 4 deletions(-)
> 
> diff --git a/drivers/media/platform/qcom/camss/camss.c b/drivers/media/platform/qcom/camss/camss.c
> index 2fbcd0e343aa..fc838b3d2203 100644
> --- a/drivers/media/platform/qcom/camss/camss.c
> +++ b/drivers/media/platform/qcom/camss/camss.c
> @@ -2561,12 +2561,11 @@ static const struct camss_subdev_resources vfe_res_8550[] = {
>   	/* VFE3 lite */
>   	{
>   		.regulators = {},
> -		.clock = { "gcc_axi_hf", "cpas_ahb", "cpas_fast_ahb_clk", "vfe_lite_ahb",
> +		.clock = { "gcc_axi_hf", "cpas_ahb", "vfe_lite_ahb",
>   			   "vfe_lite", "cpas_ife_lite", "camnoc_axi" },
>   		.clock_rate = {	{ 0 },
>   				{ 80000000 },
>   				{ 300000000, 400000000 },
> -				{ 300000000, 400000000 },
>   				{ 400000000, 480000000 },
>   				{ 300000000, 400000000 },
>   				{ 300000000, 400000000 } },
> @@ -2583,12 +2582,11 @@ static const struct camss_subdev_resources vfe_res_8550[] = {
>   	/* VFE4 lite */
>   	{
>   		.regulators = {},
> -		.clock = { "gcc_axi_hf", "cpas_ahb", "cpas_fast_ahb_clk", "vfe_lite_ahb",
> +		.clock = { "gcc_axi_hf", "cpas_ahb", "vfe_lite_ahb",
>   			   "vfe_lite", "cpas_ife_lite", "camnoc_axi" },
>   		.clock_rate = {	{ 0 },
>   				{ 80000000 },
>   				{ 300000000, 400000000 },
> -				{ 300000000, 400000000 },
>   				{ 400000000, 480000000 },
>   				{ 300000000, 400000000 },
>   				{ 300000000, 400000000 } },

Acked-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>

