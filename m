Return-Path: <linux-media+bounces-20915-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 2944A9BCB9C
	for <lists+linux-media@lfdr.de>; Tue,  5 Nov 2024 12:23:28 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id E2A2F2851AC
	for <lists+linux-media@lfdr.de>; Tue,  5 Nov 2024 11:23:26 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B730A1D4607;
	Tue,  5 Nov 2024 11:23:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="FTAjt54r"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-lf1-f51.google.com (mail-lf1-f51.google.com [209.85.167.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5EFCC1D4154
	for <linux-media@vger.kernel.org>; Tue,  5 Nov 2024 11:23:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730805791; cv=none; b=KzEtwy24nfpKG93r5FuUjg+uM2sahqojDtYXAM4o4Q8t8CDcfKn2zcqaj9sl4ndlHOXaFzjeXNiHGHVLrYn4Ixe/YseT3hJBoD0adMBeJKecaR74PHfzLl5J4ibSMk1CZ8e7zYLuZkz9vQ/YDXN4VbGPzATwnU5nbWldmqKG9qQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730805791; c=relaxed/simple;
	bh=gu5W4N3YVHoS/XkXUH6wLnC37EF1yQUgzdD/I/kxVHY=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=gdEK0AFYGkSja7V7oUgTQYspJsHPvUL21krjm83ohXfEMZIplVs6jXKdmiMixbf5Qu1vRciWAgNKndgUNUx18TMrM/3DSHmzzEL8Mt+KrFt9h8LBYMTTtzAws5/18GRsVpyviS4MaRL1HjKgNr7jdPJ05tZ3jsQJuzrP9VBnrGo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=FTAjt54r; arc=none smtp.client-ip=209.85.167.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lf1-f51.google.com with SMTP id 2adb3069b0e04-539f4d8ef66so6714030e87.1
        for <linux-media@vger.kernel.org>; Tue, 05 Nov 2024 03:23:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1730805787; x=1731410587; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=kfRKb6qYv530q1n0OeScBq8hVcVdxnrfY7wSThB323A=;
        b=FTAjt54rdB5e1X0ahTbHWJZSGvcSguumA/K6sRoBow4iT0pIXbpHYzvGPCanEe7CJS
         oh16mYRnfoP0PiCuBoshV20/HPL24M+1FmUOeXl8Gh/6EzqiFOWERMXtiDCQ1nmXbfoA
         Jr1jA7lMq1gnMeADUu1EdF4mmwPjtiTeteL4sNRPcXbWGa4N6UlLr/9NqVb5rdrzmg+h
         ilxqTWALRnxeCODpM9i6EhjFfBqezPIhnN6S6CfV91JdhHc2fyAIPeDpYxsQbPo7IQK6
         0X2ULYn7MTEC9FPihC0w2ulkXrKXrMVJ8GCAQF0UmzOBcS+a+dSaRZhKgwv2UUMqvxAb
         DikQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730805787; x=1731410587;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=kfRKb6qYv530q1n0OeScBq8hVcVdxnrfY7wSThB323A=;
        b=h4UHziPLASVo2Q/HvUZmiDkzSxyPu9n1f7NNrhDg5SZ/EfpW4cr5emND3Zy3/sMRaw
         j8kdvilFVhCYQWjrGC8mimlNMGMuQ3ImSK2mBXUDViTZ+ee1czaP+vOVNLIkoPcAFUUF
         4+FvJ7q+V4ACpwZ+dkntAfUyDDXfl38IcVlpRfTiMtgFuEh2qT40gSK8bVM/4wQyUqf1
         89V4e/koDhBgSJy4HwGMDSgPkrI3t7vxSxtWNzT8AZjQoMmhgRBmTsjFvxcL6C7HrlTU
         W7FB6bU+rWPu3Aty6HJgu317ZLODjfUBZjG+TBr8ZK7LhqaAONnaSF9saEpAI+nWknkw
         tq5w==
X-Gm-Message-State: AOJu0YzZeBILXIG1NAwcgfndxi6mC451+Ruys4uEeLfBHLxoX8gXiYDS
	QVNDtU++gKcuB8w3o7/bcNNN7eSLw+j42KTC1kI0lkNXUfJ6Wi4EQU99Yp8hR3QkptlXDs4WswK
	Pm+A=
X-Google-Smtp-Source: AGHT+IEu79YGFxZM6Eecn6ewOoMwq28FlO/8LqwRJUbtDaL1h8BGJ+TOp/Y8iTBbhuCNrcvbQJTXBA==
X-Received: by 2002:a05:651c:505:b0:2f5:abe:b6bd with SMTP id 38308e7fff4ca-2fcbe099636mr164756301fa.42.1730805787245;
        Tue, 05 Nov 2024 03:23:07 -0800 (PST)
Received: from [192.168.0.40] ([176.61.106.227])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4327d5ac002sm184409155e9.5.2024.11.05.03.23.06
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 05 Nov 2024 03:23:06 -0800 (PST)
Message-ID: <3ae9d07c-173e-4715-8cb5-f3d84de14f39@linaro.org>
Date: Tue, 5 Nov 2024 11:23:05 +0000
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 3/4] media: venus: hfi: add check to handle incorrect
 queue size
To: Vikash Garodia <quic_vgarodia@quicinc.com>,
 Stanimir Varbanov <stanimir.k.varbanov@gmail.com>,
 Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
 Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
 linux-kernel@vger.kernel.org, stable@vger.kernel.org
References: <20241105-venus_oob-v1-0-8d4feedfe2bb@quicinc.com>
 <20241105-venus_oob-v1-3-8d4feedfe2bb@quicinc.com>
Content-Language: en-US
From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
In-Reply-To: <20241105-venus_oob-v1-3-8d4feedfe2bb@quicinc.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 05/11/2024 08:54, Vikash Garodia wrote:
> qsize represents size of shared queued between driver and video
> firmware. Firmware can modify this value to an invalid large value. In
> such situation, empty_space will be bigger than the space actually
> available. Since new_wr_idx is not checked, so the following code will
> result in an OOB write.
> ...
> qsize = qhdr->q_size
> 
> if (wr_idx >= rd_idx)
>   empty_space = qsize - (wr_idx - rd_idx)
> ....
> if (new_wr_idx < qsize) {
>   memcpy(wr_ptr, packet, dwords << 2) --> OOB write
> 
> Add check to ensure qsize is within the allocated size while
> reading and writing packets into the queue.
> 
> Cc: stable@vger.kernel.org
> Fixes: d96d3f30c0f2 ("[media] media: venus: hfi: add Venus HFI files")
> Signed-off-by: Vikash Garodia <quic_vgarodia@quicinc.com>
> ---
>   drivers/media/platform/qcom/venus/hfi_venus.c | 6 ++++++
>   1 file changed, 6 insertions(+)
> 
> diff --git a/drivers/media/platform/qcom/venus/hfi_venus.c b/drivers/media/platform/qcom/venus/hfi_venus.c
> index f9437b6412b91c2483670a2b11f4fd43f3206404..50d92214190d88eff273a5ba3f95486f758bcc05 100644
> --- a/drivers/media/platform/qcom/venus/hfi_venus.c
> +++ b/drivers/media/platform/qcom/venus/hfi_venus.c
> @@ -187,6 +187,9 @@ static int venus_write_queue(struct venus_hfi_device *hdev,
>   	/* ensure rd/wr indices's are read from memory */
>   	rmb();
>   
> +	if (qsize > IFACEQ_QUEUE_SIZE/4)
> +		return -EINVAL;
> +
>   	if (wr_idx >= rd_idx)
>   		empty_space = qsize - (wr_idx - rd_idx);
>   	else
> @@ -255,6 +258,9 @@ static int venus_read_queue(struct venus_hfi_device *hdev,
>   	wr_idx = qhdr->write_idx;
>   	qsize = qhdr->q_size;
>   
> +	if (qsize > IFACEQ_QUEUE_SIZE/4)
> +		return -EINVAL;
> +
>   	/* make sure data is valid before using it */
>   	rmb();
>   
> 

You have this same calculation in venus_set_qhdr_defaults() really needs 
a macro or something to stop repeating the same code in another patch later.

Reviewed-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>

