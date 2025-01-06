Return-Path: <linux-media+bounces-24289-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 600B3A0277B
	for <lists+linux-media@lfdr.de>; Mon,  6 Jan 2025 15:08:24 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 795C6163378
	for <lists+linux-media@lfdr.de>; Mon,  6 Jan 2025 14:08:21 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0074A1DDC3A;
	Mon,  6 Jan 2025 14:08:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="N0MteEZP"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com [209.85.128.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8097F1DC9AD
	for <linux-media@vger.kernel.org>; Mon,  6 Jan 2025 14:08:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736172488; cv=none; b=RTk2yx/DBcHC4HpPaij8Ygf/yGybwn9K+CCeDCvF0ub0/WHsxgybJETIzbhZYuF5jTZ1dbpJeD6Vyzzh9roEroVRCMMCIQXXkgHmt3CcUz0mBicg5w9Z2u8eN6j/e/y741P5aHAPo1ZS/XDgdsKPlWkBRbaKp3FgJupfbg7aECU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736172488; c=relaxed/simple;
	bh=mk1DitITBu6wmhsqn2nmojT+Nq4BeNVWOenXUM2lmEw=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=jF6FEyZ6XOQZ95rWEVLnkhYH3jyGgLduooq5dw4mZDMBpMqbuQTaTUKeVVAM2gb1b8EF1NeOEpyOt/FhXkzDctmWsQh9VOtH4CG0U/QJlCweHFXPBbpAbnmhFu2zdbgHnFpI1Ro6Pkqj/TY3cRbWm90gMIOmNdmtOaPzEGUwWdE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=N0MteEZP; arc=none smtp.client-ip=209.85.128.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wm1-f53.google.com with SMTP id 5b1f17b1804b1-435f8f29f8aso104198935e9.2
        for <linux-media@vger.kernel.org>; Mon, 06 Jan 2025 06:08:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1736172485; x=1736777285; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=EWT9lmpyxnN+ivmg93OmXz9oSbysfzx800Q4Ls4JS4Q=;
        b=N0MteEZPUuWNDfqEplcQfjSgJOEibnEPodHQGSb9WHW07ih6eXoxx5FvGokqVMchvp
         AJ2UMAy7TbeOfs5VEvx+peekQZP48gbY1slc48H3R8JaDYTrw4C1cM1C7DvjwW7aR3AB
         Lc6DMjZtn7CVqFnd+cYzzNsF5NMAq715BAUrtKZLs3Ep6n7SpxYWunSCIWvbDRAl6n2h
         iIxpTjlVjrx+WuosmlD+7wzBZpi4gFRMBGVBOb7Gh9QAwZy6WjAA0PyWnreqdeTKjPay
         CZt6wavw9ehskVNGmW70rFzKdv3iV+MJQzsc4+8MfAlWaQtFxGxD+q1zIStzlinGyIwB
         brGA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736172485; x=1736777285;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=EWT9lmpyxnN+ivmg93OmXz9oSbysfzx800Q4Ls4JS4Q=;
        b=lBzxPrTsFuACkAnuX+gjgezuh7OTwe5oaOKJc6iX5COXjARKVVKFGcENNX/EJ9V1Sx
         dhphH42hODSwzRut4KKnq6QMsRhxABF5RWSh/kqzEMS/RdFg51kTosjLwxzaIeI1gOO+
         PqPGayJ+gkf/R7lnLuzDqVq1gJeGWv9Y0WdtL2rL18enI35OnlVBgQPkol1PuSTNo+N7
         7q6MhpyfwjXpuA6+blAcPJjdqH8NIXKj93xFZnetw6O3X1WG9N5hF6lXcC2dq1QJnWdy
         o38g30drFOWYFB2763VB0KRLf/VvCg4mSG5jEpZuQrRiJ+mlzfZ1f+Pg/yA6AM6BhZ/g
         PaRQ==
X-Gm-Message-State: AOJu0YxfJmJapg99AV8NtxVzbgHdqhe9/vpuW/0pXx8yFjQgZUrlf3a5
	P1TECLE07Ct01pDEQqhWjexqf04FY1FruTOPg93Vl3F0hSJem4e+kPLjv7mbi2g=
X-Gm-Gg: ASbGncsxI3cDBebZPj5Rt6po9BXhWfkUFAUSN3fmPtFZaClTZUW6fGWRVp8+ArHrkAs
	fLXAO7tulavnNw3bSpK3+mj8LHj2PRHhyLM5R1WeLt9NYfItEfloKTq+V8XsD6ywEgBaHayBW64
	cBIreB6kvu27tEXGVAEd2z7GNEq0JdeRgO3yNnbkgSMQ6fzir7mGMwcHbhpDzD6ohSZlZo/8vCi
	dyVVDnGLWilDkbt90H/8gewTRw0EIvDBA2aOW8kD2PTxVkgfFODIdu6au0wtjZWWXR48g==
X-Google-Smtp-Source: AGHT+IHXug5yLq0vZe9jWONZUJ9YxeEdyT8/tH+NsyQkfEAG5MJnrSgKUFKRqEqVTgqoOpnTJGzJPQ==
X-Received: by 2002:a05:600c:3554:b0:434:9934:575 with SMTP id 5b1f17b1804b1-436686461d6mr509541595e9.16.1736172484915;
        Mon, 06 Jan 2025 06:08:04 -0800 (PST)
Received: from [192.168.0.40] ([176.61.106.227])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-43656b442dasm600692965e9.42.2025.01.06.06.08.03
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 06 Jan 2025 06:08:04 -0800 (PST)
Message-ID: <4df2adac-c9d8-46f5-ad92-105b91f8ae4e@linaro.org>
Date: Mon, 6 Jan 2025 14:08:03 +0000
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 2/6] media: venus: vdec: Ignore parm smaller than 1fps
To: Ricardo Ribalda <ribalda@chromium.org>,
 Mauro Carvalho Chehab <mchehab@kernel.org>,
 Stanimir Varbanov <stanimir.k.varbanov@gmail.com>,
 Vikash Garodia <quic_vgarodia@quicinc.com>,
 Hans Verkuil <hans.verkuil@cisco.com>, Hans Verkuil <hverkuil@xs4all.nl>
Cc: linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
 Stanimir Varbanov <stanimir.varbanov@linaro.org>,
 linux-arm-msm@vger.kernel.org
References: <20250106-fix-cocci-v4-0-3c8eb97995ba@chromium.org>
 <20250106-fix-cocci-v4-2-3c8eb97995ba@chromium.org>
Content-Language: en-US
From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
In-Reply-To: <20250106-fix-cocci-v4-2-3c8eb97995ba@chromium.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 06/01/2025 13:40, Ricardo Ribalda wrote:
> The driver uses "whole" fps in all its calculations (e.g. in
> load_per_instance()) Return -EINVAL if the user provides a parm that
> will result in 0 whole fps.
> 
> Reported-by: Hans Verkuil <hverkuil@xs4all.nl>
> Closes: https://lore.kernel.org/linux-media/f11653a7-bc49-48cd-9cdb-1659147453e4@xs4all.nl/T/#m91cd962ac942834654f94c92206e2f85ff7d97f0
> Fixes: 7472c1c69138 ("[media] media: venus: vdec: add video decoder files")
> Signed-off-by: Ricardo Ribalda <ribalda@chromium.org>
> ---
>   drivers/media/platform/qcom/venus/vdec.c | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/media/platform/qcom/venus/vdec.c b/drivers/media/platform/qcom/venus/vdec.c
> index 98c22b9f9372..25edd77b9cf9 100644
> --- a/drivers/media/platform/qcom/venus/vdec.c
> +++ b/drivers/media/platform/qcom/venus/vdec.c
> @@ -481,7 +481,7 @@ static int vdec_s_parm(struct file *file, void *fh, struct v4l2_streamparm *a)
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

