Return-Path: <linux-media+bounces-30704-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 3CDADA967FD
	for <lists+linux-media@lfdr.de>; Tue, 22 Apr 2025 13:43:26 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id D33E9189BB78
	for <lists+linux-media@lfdr.de>; Tue, 22 Apr 2025 11:43:16 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9987527BF93;
	Tue, 22 Apr 2025 11:42:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="YWH1uu/+"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-wr1-f54.google.com (mail-wr1-f54.google.com [209.85.221.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4719B27815B
	for <linux-media@vger.kernel.org>; Tue, 22 Apr 2025 11:42:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745322170; cv=none; b=t7QxWTFulg/FqFRyJhixgHwrBwm2Pg3oEdHpxUzMEHJkGr8L6adbze63SWmqY7SrgfwBfpqnuvEt04gYBOh8hkQH636pxm43drx4JBsZb0trDv1u2hPuWqge9NuJjTg8fTuui/KnAyOzoKAs3nblVEMc+3C8+RSin1UdkeLbQIo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745322170; c=relaxed/simple;
	bh=tbX7mQOIGX55IdMjMFPvOgCenceYKNl06uSYieBepWc=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=qoCKHHqHWfX5et7KEf9bzlgF+ePmbS2P4N4oL0pSXZm9NaED03S+VtKt9zay9+6gxBdqqQhNPwD1FYiQfjkgjneRN3Lvc6vRR12WJrnW8AuZf3F6auwRlZKDoeAbKetjf2ACUx1yqIiUSf33ww9QPPxX4Tf2/DVERvtbREecnis=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=YWH1uu/+; arc=none smtp.client-ip=209.85.221.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wr1-f54.google.com with SMTP id ffacd0b85a97d-39ee651e419so2814107f8f.3
        for <linux-media@vger.kernel.org>; Tue, 22 Apr 2025 04:42:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1745322166; x=1745926966; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=JAtpbusfzNOZNvLKOxFKZXWKBshVxpyaWdtZDoMUmWw=;
        b=YWH1uu/+yqy7Izb6qqn1/CWhfeedVzm5hIN+abdaSNj34AWsgFSy/kVVG9gtPcEK8T
         DijneBaSRubPCbpjLE9iBsMr1NzjwBnVIHgfvaZMwFt0aaN6fUtrXjMaM/gzR43KBPmT
         lj4dwfJGPE+l0aZ39MnX1OLpyXN0aMNElVM9PVji+hfzUyhP6zEFwEqjCkphhTr9DRHg
         AKrj8ncrFzgzC2nZw+7uJGf20CPAYQInYShgdRHK7EYz6HyV611qRpIi1c4wPYXriRmv
         fKCYmhkeOtQDv5326EgXuRAWETGW6W4nLg3DZPu7lcuwWrU+tfzE57Wtklq1NCTMBStb
         mG4g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745322166; x=1745926966;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=JAtpbusfzNOZNvLKOxFKZXWKBshVxpyaWdtZDoMUmWw=;
        b=LOyRrq/LwRTz2DU31/3UitXC29Zsj2dJQzk4vACLJioNxB7KgC8k8b1GXqtWS1B87p
         P+/2Xc5V8pvV8ePb9lvfH5RHK3xg9YgoR5oM2F4HbIShpjU7QBacxSjIbQEZsD7GPcuj
         4snCCWAs2zo8qMvOvKj+c24Q+4vSGNtpBswT4/AgTrU3XG/D9MwZeCbMeucIkOr3cfV8
         g1B6f3FsciMs4Bv/WyaMTY3QIodJf4iq7hF7mOaf8QrdaoguwL4M025Eoa6yZ3wJDRt6
         RSbR7D9P8Lc82gjUZ4XFIhh5SszzN2w+2otO6+nrZl0aLdYd+gtK9Sb3M4u1qF4X3mAt
         mxkA==
X-Gm-Message-State: AOJu0YwDFVph3lyqSz/tBwzcE+a3lUzq8cRZPe2jAsn9t4XlAIMIDL82
	shGPhJp4AiUt3hJbJU7ndo0z+rAgv+Efy8CXey4+0i4JuH+NvjblEgfBTsFNlSs7fwq8fyOUc6h
	9mis=
X-Gm-Gg: ASbGnctr73hjgHtS1u6RqyJFAVBUzh0KTYXTpgR13MRHMPJNcT4hYoLBpUGkrTADB1v
	GivtQv/wExPfq/615TblgPPNHQ9fTlgHHUa8QcQFwFz+Vph0eVOOeOgSyO529FUd6kSAwrF56c5
	9coJD5Y2yadnpK5TkkI8efozPkVROA9TOkZ661uB8y3snZlK0KPRqC7Mvi9cBXxGbR/+VLB5qNg
	9itajwW8+8J2BfpVLl7QUgCB697DvW/nkgKvGw/gRkMOlbnikJVJzWMBelw7bRI2HtxaJWp11QG
	NqD2bfAnljcS9aYNnQqEcOhdHOQl0ZA0Tld7MbnjxNI+xWQOFwG3UTdx0UCEBwK54yr1YIYo/A7
	81i8EUg==
X-Google-Smtp-Source: AGHT+IFnpfK9wbngeFTqmbwdUBIGCYnopeBaUnSvM3KI5hm84C4xc0ECIUNcElXH1HfIGS3hGXWcSQ==
X-Received: by 2002:a5d:6d8c:0:b0:39f:e93:3d0c with SMTP id ffacd0b85a97d-39f0e933d1bmr3612117f8f.30.1745322166575;
        Tue, 22 Apr 2025 04:42:46 -0700 (PDT)
Received: from [192.168.0.34] (188-141-3-146.dynamic.upc.ie. [188.141.3.146])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-39efa4332f8sm14724322f8f.40.2025.04.22.04.42.45
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 22 Apr 2025 04:42:46 -0700 (PDT)
Message-ID: <e81d6d27-908c-45b2-a3b5-fbf743f9aaba@linaro.org>
Date: Tue, 22 Apr 2025 12:42:45 +0100
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] media: qcom: camss: vfe: Avoid unnecessary RUP command
To: Loic Poulain <loic.poulain@oss.qualcomm.com>, rfoss@kernel.org,
 todor.too@gmail.com
Cc: linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org
References: <20250422081436.6535-1-loic.poulain@oss.qualcomm.com>
Content-Language: en-US
From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
In-Reply-To: <20250422081436.6535-1-loic.poulain@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 22/04/2025 09:14, Loic Poulain wrote:
> Today, we submit a RUP command (reg_update) after queuing a new frame
> buffer using vfe_wm_update. However, vfe_wm_update writes the buffer
> address to a FIFO register which does not require a subsequent RUP
> command, as this register is not double-buffered like other config
> or control shadow registers.
> 
> This results in the capture process generating twice the expected number
> of interrupts, with one RUP done and one BUF done interrupt for each frame.
> 
> We can relax the interrupt pressure and VFE load by removing this extra
> RUP command, which is only necessary when initializing or reconfiguring
> the VFE.
> 
> Note: this has only been tested with vfe-340/qcm2290, the assumption is
> that the other VFEs behave similarly.
> 
> Signed-off-by: Loic Poulain <loic.poulain@oss.qualcomm.com>
> ---
>   drivers/media/platform/qcom/camss/camss-vfe.c | 5 ++---
>   1 file changed, 2 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/media/platform/qcom/camss/camss-vfe.c b/drivers/media/platform/qcom/camss/camss-vfe.c
> index c575c9767492..32de1d104fe7 100644
> --- a/drivers/media/platform/qcom/camss/camss-vfe.c
> +++ b/drivers/media/platform/qcom/camss/camss-vfe.c
> @@ -481,7 +481,6 @@ void vfe_buf_done(struct vfe_device *vfe, int wm)
>   		ops->vfe_wm_update(vfe, output->wm_idx[0],
>   				   output->buf[index]->addr[0],
>   				   line);
> -		ops->reg_update(vfe, line->id);
>   	} else {
>   		output->gen2.active_num--;
>   	}
> @@ -546,9 +545,10 @@ int vfe_enable_output_v2(struct vfe_line *line)
>   		output->gen2.active_num++;
>   		ops->vfe_wm_update(vfe, output->wm_idx[0],
>   				   output->buf[i]->addr[0], line);
> -		ops->reg_update(vfe, line->id);
>   	}
>   
> +	ops->reg_update(vfe, line->id);
> +
>   	spin_unlock_irqrestore(&vfe->output_lock, flags);
>   
>   	return 0;
> @@ -582,7 +582,6 @@ int vfe_queue_buffer_v2(struct camss_video *vid,
>   		output->buf[output->gen2.active_num++] = buf;
>   		ops->vfe_wm_update(vfe, output->wm_idx[0],
>   				   buf->addr[0], line);
> -		ops->reg_update(vfe, line->id);
>   	} else {
>   		vfe_buf_add_pending(output, buf);
>   	}

This looks good.

Obviously needs a lot of testing to validate across various other 
platforms to validate.

---
bod

