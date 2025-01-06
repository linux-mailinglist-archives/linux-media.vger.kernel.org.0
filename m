Return-Path: <linux-media+bounces-24290-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id D962FA02782
	for <lists+linux-media@lfdr.de>; Mon,  6 Jan 2025 15:09:03 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 5101A188217D
	for <lists+linux-media@lfdr.de>; Mon,  6 Jan 2025 14:08:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 286ED1DE4C7;
	Mon,  6 Jan 2025 14:08:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="Sdha6wmb"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-wr1-f49.google.com (mail-wr1-f49.google.com [209.85.221.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 361EF1DE889
	for <linux-media@vger.kernel.org>; Mon,  6 Jan 2025 14:08:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736172499; cv=none; b=oiASIp3JkgoYlPnq7zOtnjP+7eRw0W//DxiscSj6wlOP1gLB/HoUaH2x439mgVhWQ7laUVywFpE0GM3NU5y8HWVs4S0vrVybep3CjskB0D90sGNleBve5HNRFboHhwHsyw1LJQW7hRrTimLfulrD6uou84RQoaip6zKrokG5cm4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736172499; c=relaxed/simple;
	bh=GbeZc7W6Q3I0MRY/HrXEVTv18jbZE/U2UUTXH/SitKM=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Nr30CaegOUKXyDVeuF6B2O9pOVT6EehPuQsGsY1a641EeljDlL8I9gadUDGB7zZiwseFrWNKF9i7iwEaWXZfoZaMPzw76wKjGBeFxpOlHYDR8PiWXX6FrNNVAdqu983SSg7u6C36GNOmwoOULCoxE7Tpw+rE10T+UTz8wOJRo3s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=Sdha6wmb; arc=none smtp.client-ip=209.85.221.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wr1-f49.google.com with SMTP id ffacd0b85a97d-3862df95f92so6303467f8f.2
        for <linux-media@vger.kernel.org>; Mon, 06 Jan 2025 06:08:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1736172494; x=1736777294; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=ncYQpwQ9OCIQn9/rsFj5efsB71N9r4wzFE7cHZesHrU=;
        b=Sdha6wmbSsJT6PjOLlmv5nvTfSycR7Km3XSwaP/+LSJRXE+U6pOx8ID5ca/Mn+Nlpy
         OCMdFixf5WsxLW1rsdprmHQUSkdACHNUVb7E5kKdDUjq+pQJGQCwDum7uB+NgAnUOsOm
         Q2sEQYrDN37f6eVxOFCqxJJpKxK/i5iZHizGdHdrHwxgcCTDwdXeUDFhRAKcF1TF0ye5
         O8sMBm6eSXLrVbDQzyvv6hdpK38hl0xnJrli60kKFbLLPm3IZFC1aN1AQ29DCZVRsh9A
         9K7LGB96glp7AVY30iREQkdDwE+jnyTO/JA19BQ1aQXBGCOjm9gpgnaSTkxpEtZoy3PP
         2bJg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736172494; x=1736777294;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=ncYQpwQ9OCIQn9/rsFj5efsB71N9r4wzFE7cHZesHrU=;
        b=wQJoioiOI/HsZNNWrCgruUH5PQzI15ANOWOnq8H0TKpQD41zjwpqewr/AzEc2w7iOd
         Sq6quQLivzr58AvbeaWf8+ARADAljqFCEK1/G7k1H2XP5X+5wCzM/uG/LI4C8fS3q0tA
         jmTwuypOZH36NDc20dSMq06rQQvWcbmz7QXy0b4nG8sV1oZicKKY9+rq0lg23sVA18KT
         OX57F6bk7fNg5PROny5nEg2yYcjY7Xi35FuigmGEui8h9F+8LRa1GDJ5K5CG6H3sfIpJ
         cBrh00Va+jbJMn9Z/swx9+zCk1ek/MDtUJTJlb0kYD8mro7/s+rEHwlDMfBgGNA+KZ5h
         jSAg==
X-Gm-Message-State: AOJu0Yz8cyvdvQPGjGzlXYd1GOcBKJqZFUIdHdafj6bkUc9Sn+V8YHNM
	kfIPRWxdE1FAAbO3ZvuJD5DS0e0ocV/t1D0qfDXnrDBm7FO/+F+duoHkFhO4dByZefdMv0xa88N
	R
X-Gm-Gg: ASbGncuU1gwiwuMWIQWMHU3LxKwKyQ7U+utHB2ozZLQovk1r5kj35SqEqbcNtknpRd6
	wW/TpUSi18oMMdXsi9dYfyFBEvMo77rjXoW7YV2ia2/dJRE0dw+5h+vnPp9iZg3HcEkwwEVpMPB
	IOqnINhIKgiwqN6sPDZonYfVwDr7IIY2m3KVMNQJouvlMkulkBzS+heXn4Jsz3MrUFa03dm6FHr
	G0Oh0ZVH2CB8XR++O6lbm0yODw/oOO27spsx02n6/KDPM4uiCBQZyS5yefnVO5rpv4bHA==
X-Google-Smtp-Source: AGHT+IHW3ETfqtBsOE2bHkob+eHNeS2Nwu8SpS7/ti4RMQCKSJ5YxWWSnX51+61lvx3mx4ntI21zUA==
X-Received: by 2002:a5d:598d:0:b0:385:e013:39ef with SMTP id ffacd0b85a97d-38a221e30aemr43363039f8f.6.1736172494526;
        Mon, 06 Jan 2025 06:08:14 -0800 (PST)
Received: from [192.168.0.40] ([176.61.106.227])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-38a412f778esm33701910f8f.4.2025.01.06.06.08.13
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 06 Jan 2025 06:08:14 -0800 (PST)
Message-ID: <92009895-8b9e-43d5-99f0-efc43c4b09c8@linaro.org>
Date: Mon, 6 Jan 2025 14:08:13 +0000
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 3/6] media: venus: venc: Ignore parm smaller than 1fps
To: Ricardo Ribalda <ribalda@chromium.org>,
 Mauro Carvalho Chehab <mchehab@kernel.org>,
 Stanimir Varbanov <stanimir.k.varbanov@gmail.com>,
 Vikash Garodia <quic_vgarodia@quicinc.com>,
 Hans Verkuil <hans.verkuil@cisco.com>, Hans Verkuil <hverkuil@xs4all.nl>
Cc: linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
 Stanimir Varbanov <stanimir.varbanov@linaro.org>,
 linux-arm-msm@vger.kernel.org
References: <20250106-fix-cocci-v4-0-3c8eb97995ba@chromium.org>
 <20250106-fix-cocci-v4-3-3c8eb97995ba@chromium.org>
Content-Language: en-US
From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
In-Reply-To: <20250106-fix-cocci-v4-3-3c8eb97995ba@chromium.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 06/01/2025 13:40, Ricardo Ribalda wrote:
> The driver uses "whole" fps in all its calculations (e.g. in
> load_per_instance()). Return -EINVAL if the user provides a parm that
> will result in 0 whole fps.
> 
> Reported-by: Hans Verkuil <hverkuil@xs4all.nl>
> Closes: https://lore.kernel.org/linux-media/f11653a7-bc49-48cd-9cdb-1659147453e4@xs4all.nl/T/#m91cd962ac942834654f94c92206e2f85ff7d97f0
> Fixes: aaaa93eda64b ("[media] media: venus: venc: add video encoder files")
> Signed-off-by: Ricardo Ribalda <ribalda@chromium.org>
> ---
>   drivers/media/platform/qcom/venus/venc.c | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/media/platform/qcom/venus/venc.c b/drivers/media/platform/qcom/venus/venc.c
> index c1c543535aaf..bd967d60c883 100644
> --- a/drivers/media/platform/qcom/venus/venc.c
> +++ b/drivers/media/platform/qcom/venus/venc.c
> @@ -411,7 +411,7 @@ static int venc_s_parm(struct file *file, void *fh, struct v4l2_streamparm *a)
>   	us_per_frame = timeperframe->numerator * (u64)USEC_PER_SEC;
>   	do_div(us_per_frame, timeperframe->denominator);
>   
> -	if (!us_per_frame)
> +	if (!us_per_frame || us_per_frame > USEC_PER_SEC)
>   		return -EINVAL;
>   
>   	fps = (u64)USEC_PER_SEC;
> 
Reviewed-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>

