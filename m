Return-Path: <linux-media+bounces-17124-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 10D89964210
	for <lists+linux-media@lfdr.de>; Thu, 29 Aug 2024 12:37:02 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 7F2871F25535
	for <lists+linux-media@lfdr.de>; Thu, 29 Aug 2024 10:37:01 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0D34B18E37C;
	Thu, 29 Aug 2024 10:30:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="vOpWa6yq"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-lj1-f177.google.com (mail-lj1-f177.google.com [209.85.208.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B1C3E18CBE6
	for <linux-media@vger.kernel.org>; Thu, 29 Aug 2024 10:30:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724927454; cv=none; b=lkKuA2mkGfS/uDi+K2IaE5rC3VpDlvBGwRvp2KMlR3TBA6DzIed6IbCkM8sSW5XAefQSMJh2sCpESYFgWoZDZ4RuE4lY8Z+7hzFGSGtzLDq8iismqUKuR2aaQO6JRTaUMAG+Nm/IUCi/nyxplz7sG/j8X94q0dkGzg6rlNU8em8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724927454; c=relaxed/simple;
	bh=JwD/5CpATNeAUUT2U9dB5jqpbx39vshHUiLHiXYrBCs=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=QowSm7zOGI40j4TKNCGg8nvUdLfc59whG+6h7hd/kRnvNOst+jTrOKSGT+Xs7e3wGuXrO08QVGes04OeelMQNqS/XIe/m5jNNp++ZOXnR4dj4VLPXTtT0JA/GJXIGLmCLqyOB3muxSE2ECOiK7SVKcBMoRL3TObjxcX3srjJi/A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=vOpWa6yq; arc=none smtp.client-ip=209.85.208.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lj1-f177.google.com with SMTP id 38308e7fff4ca-2f43de7ad5eso6840201fa.1
        for <linux-media@vger.kernel.org>; Thu, 29 Aug 2024 03:30:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1724927451; x=1725532251; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=+/rkwYzdtv1HTnAFhDMt6zw9EEXfwMPtCfoF7AvvSYU=;
        b=vOpWa6yqIIGPLB+LvxeuaVbzdJKcgZlhA7I90lsjAcS9A/o3ESu/amJQJXvbkqNFgi
         wd/vRC6aZ8BWeawj5rCLEuKZdmH7hRxP3fnjgndcAAaKvWNrVy8Q5FwL2VngouV/aiDL
         4lNzWnCxorGR8flUm/HWTsay6m+Y2FBKObcD0hPLpPUs89bF+x0YhrCWU9RZ0E3FPxhf
         /1h92pYvQZYK2FWaDk/2zt1lwGpfy3MeNmZGOOiiaSSdqhZg4yKfkfbLxNpOyBW+E2/8
         mRpNRoWWpKyyCl31F20kL1lc8W3HzW4qD6YP38FzD7Wo2S+aG9Syf3zZYcungQdgTNUx
         dgFA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1724927451; x=1725532251;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=+/rkwYzdtv1HTnAFhDMt6zw9EEXfwMPtCfoF7AvvSYU=;
        b=K6f9Er9F4XQYfWJIQJqvVBxeD5Ceye7FutOQI6O/eN6wRuDQscskHpA2flfMfWeVUL
         XLW8/T3IP2tW5zIgTzBzCMS2+SWiQMVs489ScY8M+VfoDcPr4VyHPVVYuPHf2nIfiFVh
         hwO85n7hFAO5qZNk7daU5LPhEHjZacBMiwq13T/EmMO60SEu4myQrBmA+5p+PFA05Cck
         0YK1xu80dHNerthuyiIpEseTkyrzgoEeb4G+JViJrjfLpoSRvH+lexf5lrXJ5gcnm8sf
         X5hXPxawrhlG6fFhrMB7/QlYvmD73N5B+RyCsPmIjdXlBErpf9KVK6pIkUpNESV9HC1K
         tiRQ==
X-Forwarded-Encrypted: i=1; AJvYcCXIHYoCZRIKwnwadmLACVJr4CYKUdcw+Tmm8gyRbFlpIHi2p2JSq5a73unxd3rPyiDBaeL+Qb4elMSkuA==@vger.kernel.org
X-Gm-Message-State: AOJu0YySff+jYUj88fPBx5vg7kFrXDxybz1W0pz59I5NnrJF232+I84Q
	acgWvCKe7eks7pHo87AikhUZ+d2ro/6zGOXQnca6jPkX17bIt3aF3jzuT8lUAec=
X-Google-Smtp-Source: AGHT+IExRQfAycplDihxi2sTfQugdwOLm/BGeiRKRBZyEWM9TcHn6gFVPCB6oog9W8hrTsVTV1Oz+Q==
X-Received: by 2002:a2e:bea6:0:b0:2ef:185d:e3d7 with SMTP id 38308e7fff4ca-2f61050fa47mr21875841fa.38.1724927450310;
        Thu, 29 Aug 2024 03:30:50 -0700 (PDT)
Received: from [192.168.0.25] ([176.61.106.227])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-5c226cebf6esm533814a12.97.2024.08.29.03.30.49
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 29 Aug 2024 03:30:49 -0700 (PDT)
Message-ID: <918e84fa-4a07-4ca4-bd3c-a14cb0a8f3dc@linaro.org>
Date: Thu, 29 Aug 2024 11:30:49 +0100
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RESEND v3 2/3] media: qcom: venus: Fix uninitialized variable
 warning
To: Nas Chung <nas.chung@chipsnmedia.com>, mchehab@kernel.org,
 hverkuil@xs4all.nl, linux-media@vger.kernel.org
Cc: linux-kernel@vger.kernel.org
References: <20240725061034.461-1-nas.chung@chipsnmedia.com>
 <20240725061034.461-3-nas.chung@chipsnmedia.com>
Content-Language: en-US
From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
In-Reply-To: <20240725061034.461-3-nas.chung@chipsnmedia.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 25/07/2024 07:10, Nas Chung wrote:
> Avoid uninitialized variable when both V4L2_TYPE_IS_OUTPUT() and
> V4L2_TYPE_IS_CAPTURE() return false.
> 
> Signed-off-by: Nas Chung <nas.chung@chipsnmedia.com>
> ---
>   drivers/media/platform/qcom/venus/vdec.c | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/media/platform/qcom/venus/vdec.c b/drivers/media/platform/qcom/venus/vdec.c
> index d12089370d91..b72b579018e3 100644
> --- a/drivers/media/platform/qcom/venus/vdec.c
> +++ b/drivers/media/platform/qcom/venus/vdec.c
> @@ -161,7 +161,7 @@ find_format_by_index(struct venus_inst *inst, unsigned int index, u32 type)
>   
>   		if (V4L2_TYPE_IS_OUTPUT(type)) {
>   			valid = venus_helper_check_codec(inst, fmt[i].pixfmt);
> -		} else if (V4L2_TYPE_IS_CAPTURE(type)) {
> +		} else {
>   			valid = venus_helper_check_format(inst, fmt[i].pixfmt);
>   
>   			if (fmt[i].pixfmt == V4L2_PIX_FMT_QC10C &&

Can you give an example of the error - compile time I assume, this fixes ?

---
bod

