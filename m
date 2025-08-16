Return-Path: <linux-media+bounces-40012-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id EC02FB28D0C
	for <lists+linux-media@lfdr.de>; Sat, 16 Aug 2025 12:51:21 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id A30F93BABAE
	for <lists+linux-media@lfdr.de>; Sat, 16 Aug 2025 10:50:18 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4F39029A332;
	Sat, 16 Aug 2025 10:50:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="civYSYls"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com [209.85.128.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1E2FE2253AE
	for <linux-media@vger.kernel.org>; Sat, 16 Aug 2025 10:50:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755341405; cv=none; b=WPCR/WPGv1GvflKM+xyn2MkGdfsAI2AEQU7d43q2HalRV6K/ComWiNzNHkJF+raOrwFtMNDZdrTq4rUsluKhgmkyIsZGcKa9/JG4lukbNojHa1mLl6G5yF/2l403UWzsRzDMuiP1LBqO4yaG/lxfX1OnikrAKi2y0+hed9JTNes=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755341405; c=relaxed/simple;
	bh=doz42PD32C7caXkh5JHONCE2ZOdONZJc6Yx0NMQtnSk=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=OAGzrPqdrW3EtkGD5iNdWJDNwHM+RDABaSOjZya5G/Gx5borG4BkmFAzxoOWYtSaxgwH2C3v83csUdbFNYlSaUq4bCIgi7XhBdSJ06BgZHfGQLQDo5koaklLz3EGuzgCZ1RDj0mMv6zDOWTVbnlQrSflt3G4kohKXRLy/cceoT8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=civYSYls; arc=none smtp.client-ip=209.85.128.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wm1-f47.google.com with SMTP id 5b1f17b1804b1-45a1b05d252so17146545e9.1
        for <linux-media@vger.kernel.org>; Sat, 16 Aug 2025 03:50:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1755341400; x=1755946200; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=FwwivMGnEw2uIFchpfZdnqFMVWS3GjK/zVl2JQuqPm0=;
        b=civYSYlszTqujTcerSF3GMsRE3F3MT5kFJ0r1tByjMyep8shuH1/6RJnLGhhIBw0c0
         mr3l6hNlvx+fzSQEZtcebCmQ/wXvaaE865jU0CvNUuLHzOBlxbJKkSzkI72guOI2+DUx
         kQWjws2D7tdZsYaF/CEcLveD7oFPNiYoFYCiFq2iG7Cpb09mVBYloyRyvMhXGi3HEOe1
         72lskpcYZah4k+yZjn32uMYI3iUTW3VsSsPzrIWXhjWIE62T9A79yb3KKgVIhyqI8Kcz
         jVMj5lEWveAkscVCTrr+P7SQD8nCs5tLfiZ3v4kuFMA0stdhFboeTe3HyRSy5UnpjSD7
         xXsA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755341400; x=1755946200;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=FwwivMGnEw2uIFchpfZdnqFMVWS3GjK/zVl2JQuqPm0=;
        b=gD7ByWutyDK5m1ujksCYbaR3NZg1k6oQovFFWy9WcjMC601JPrY4hL1pqoSaDXiq4W
         PagiAFLHjYv2KDrY3hrBEWitMqFSjdEpnelAAmX3E4mflzKMWB79ZdC4/Bj1sBqyZizp
         cjoHJP6IFOf7w2Ye2VNL8IQjSdVgwXOJtCGhvaM8aNfHdX3ckLS7Gkbb1lWYUNajlpe5
         gyCfi0vyGliVnrLZW8x8TwWFT6KlQSsrfb6OiLZpUsxaiRcspuZ2iyX62PaQT9jcfjjp
         zl0+EmfaB0ehtHOYuSha+zrqp6hiSUvVtyaTx64exOBGdnvOTm+nPb1gL8gEmBmVWBUW
         05kQ==
X-Gm-Message-State: AOJu0YxyJegZzDu/JopENBNIZ6bxBKWodAxagzq1PJQGAfy6/yDZUZXh
	O+C0zMRkYP5CNU18RCcEjPoN5gR/QT7Jljtrxzu4XgLhVxYMReQO5Ml1o2w7vl0tSgQ=
X-Gm-Gg: ASbGncs97bACIbpYIHTfxt+QYHc0J3WqYVjQSe5DgLlVEBYeGUar9QkmJoEqr7HBagq
	47sayicLRPR+BbWWOl/y+0kfpoz2VtahW9PrQGqrWkZRd7sdojISHLC5IzbrT5/o3GhQGRUv1+T
	p3Tpz9xojRzaasyGN50lADUYsqqFzTYwbyibDPv1ZDm4j+R3RtXNJKG0fsW+8PuQUBFqYstXjIi
	YSTYSYAlBc4tbFgbCcQkFA5+BivHrCRaHWLlJSSq4nYZwpncCg+d4+dXAMzxuzGZbY2uK4sud5S
	vSpZfNO8IoOCRt4VhdJ4MHshJzu/rCIACBru7M8mCPAzfX7sYsI0/N//99rM2O8qu3oE5s0pPnd
	KmHaOUoUQBrXbPrpjrDfLCmzfGWHur5zptGGdMXPT+AIEO/AC27o5+8yH1Aiy3G4r
X-Google-Smtp-Source: AGHT+IE5o1fNVVbU2Hem8lhgp/yOa9qYSWveharYtFOMpSTzQ18tGJVdXt4smsZsAVwuhr9xInUKkg==
X-Received: by 2002:a05:600c:474d:b0:456:1ac8:cac8 with SMTP id 5b1f17b1804b1-45a2180b6aemr48450885e9.15.1755341400420;
        Sat, 16 Aug 2025 03:50:00 -0700 (PDT)
Received: from [192.168.0.13] (188-141-3-146.dynamic.upc.ie. [188.141.3.146])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-45a27fd554bsm12863585e9.13.2025.08.16.03.49.59
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 16 Aug 2025 03:49:59 -0700 (PDT)
Message-ID: <d6c26171-8be9-4c15-a105-3d641558032f@linaro.org>
Date: Sat, 16 Aug 2025 11:49:59 +0100
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 07/24] media: iris: Update vbuf flags before
 v4l2_m2m_buf_done
To: Dikshita Agarwal <quic_dikshita@quicinc.com>,
 Vikash Garodia <quic_vgarodia@quicinc.com>,
 Abhinav Kumar <abhinav.kumar@linux.dev>,
 Mauro Carvalho Chehab <mchehab@kernel.org>, Hans Verkuil
 <hverkuil@xs4all.nl>, Stefan Schmidt <stefan.schmidt@linaro.org>,
 Vedang Nagar <quic_vnagar@quicinc.com>
Cc: linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
 linux-kernel@vger.kernel.org, Renjiang Han <quic_renjiang@quicinc.com>,
 Wangao Wang <quic_wangaow@quicinc.com>
References: <20250813-iris-video-encoder-v2-0-c725ff673078@quicinc.com>
 <20250813-iris-video-encoder-v2-7-c725ff673078@quicinc.com>
From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Content-Language: en-US
In-Reply-To: <20250813-iris-video-encoder-v2-7-c725ff673078@quicinc.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 13/08/2025 10:37, Dikshita Agarwal wrote:
> Update the vbuf flags appropriately in error cases before calling
> v4l2_m2m_buf_done(). Previously, the flag update was skippied in error
> scenario, which could result in incorrect state reporting for buffers.
> 
> Fixes: 17f2a485ca67 ("media: iris: implement vb2 ops for buf_queue and firmware response")
> Reviewed-by: Vikash Garodia <quic_vgarodia@quicinc.com>
> Tested-by: Vikash Garodia <quic_vgarodia@quicinc.com> # X1E80100
> Signed-off-by: Dikshita Agarwal <quic_dikshita@quicinc.com>
> ---
>   drivers/media/platform/qcom/iris/iris_buffer.c | 4 ++--
>   1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/media/platform/qcom/iris/iris_buffer.c b/drivers/media/platform/qcom/iris/iris_buffer.c
> index 23cac5d1312913b8dac44347ae66cb80a6a15deb..38548ee4749ea7dd1addf2c9d0677cf5217e3546 100644
> --- a/drivers/media/platform/qcom/iris/iris_buffer.c
> +++ b/drivers/media/platform/qcom/iris/iris_buffer.c
> @@ -651,6 +651,8 @@ int iris_vb2_buffer_done(struct iris_inst *inst, struct iris_buffer *buf)
>   
>   	vb2 = &vbuf->vb2_buf;
>   
> +	vbuf->flags |= buf->flags;
> +
>   	if (buf->flags & V4L2_BUF_FLAG_ERROR) {
>   		state = VB2_BUF_STATE_ERROR;
>   		vb2_set_plane_payload(vb2, 0, 0);
> @@ -659,8 +661,6 @@ int iris_vb2_buffer_done(struct iris_inst *inst, struct iris_buffer *buf)
>   		return 0;
>   	}
>   
> -	vbuf->flags |= buf->flags;
> -
>   	if (V4L2_TYPE_IS_CAPTURE(type)) {
>   		vb2_set_plane_payload(vb2, 0, buf->data_size);
>   		vbuf->sequence = inst->sequence_cap++;
> 
Reviewed-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>

