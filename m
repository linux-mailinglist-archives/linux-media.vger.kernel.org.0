Return-Path: <linux-media+bounces-40534-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 1E524B2F084
	for <lists+linux-media@lfdr.de>; Thu, 21 Aug 2025 10:06:00 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 5CB485A3149
	for <lists+linux-media@lfdr.de>; Thu, 21 Aug 2025 08:03:47 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7EDC936CE06;
	Thu, 21 Aug 2025 08:03:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="oVm3ZGwf"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com [209.85.128.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D8CA62F4A
	for <linux-media@vger.kernel.org>; Thu, 21 Aug 2025 08:03:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755763421; cv=none; b=urFOv9kObxMLN3DXBmAZXs4AlBuFA0rEJ6n40UpVu2tEY7H6pQlXK990D9cy/NUUevjxLxI9cGnQzjGitfvyFbJ7UQ0Wa9ZPEgKMTHztdfi+Y0POeFS7fQlQqFIhaqNQ6j26c0ws7uU0wBlIoL97CZCzqsvti0iG7z1qP64U7SA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755763421; c=relaxed/simple;
	bh=C/eiv5q+ImrialkjcooHtCZD+FBwZF7ossUvqO8kMwc=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=WI+3qd1EQP5OFGRjlJjWCC6N6pFFttJ2Y3Cew9879lS/ILGzwH4/8f/yXF0QHdD4Ota/RPXDEEXKJbXrNLnZRD+6yeqFq8FW2ZSgESfPNa2Ly+b6VAxhdgDll1zD3/z4h+18QSuxLOXezCox4BdL0m09ygWAGOQXZhApVryna/Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=oVm3ZGwf; arc=none smtp.client-ip=209.85.128.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wm1-f47.google.com with SMTP id 5b1f17b1804b1-45a1b004a31so4505455e9.0
        for <linux-media@vger.kernel.org>; Thu, 21 Aug 2025 01:03:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1755763418; x=1756368218; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=BPIf2eULCAMXs3+uk1dB1VPHgpKeONu4TT2vxqp0Ehw=;
        b=oVm3ZGwfH2EAw/ZOApEKvUD5EBU/NfD9oPCdilVtU6QRlyvQ8g03tTZhbqlWUPjde0
         WVFrfcRN+2fskFysG9SsjbXupb5zfzc4dleW5g5o9ZLZ9Bt48fqEhIAHhfpmHjv3RL+E
         cxxyI37fFQkXIRB+wrGNXhcACTIEiAEvLa+rbkLwtyjZX95RY72L8vqKNypNkA/+jPYC
         +9CtwcAPo3etREKHKtQHDnNFdykUGiK7SkP5+90I0rMPPqj7zms8SLgtY7K+Hab3tCo8
         eusa0CsxAHmQee6LhvR7/N2Wu01DUP6Vs4DqHGBjnlMeSBDOiz1ioIcuXHmrIcgmZYKq
         ppVA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755763418; x=1756368218;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=BPIf2eULCAMXs3+uk1dB1VPHgpKeONu4TT2vxqp0Ehw=;
        b=olOJZD0OP3jcsyt1ANzXlCC83pDdVNAWkYStQ8aZXeyiDva1GoJiD847VpL9hKTb3P
         87PrLwvTS4oAFDlEEik3jdx0An2LpQY7C/12vu8JE8425c6Iw28Y2kR4L23O1ZvMJ0le
         BDYo04EDoYJY5Zq/10nTUiOZcvKbd7uQqBeWfYOwmsoE9Q04BHWcwWZ5tOVCTbHJ2zt/
         msi52k/8qVR1hMAI69v6812rNLSxWlvNT6NUMhcplVDGtTmpb59cVW0apq1a6t4oxyH5
         TkbcGCZ9n+UIZVJEOqYyu/39FGdkv1NleXTHrsX4bCW/ZPsyIWTsjQwlQwb3n5/4qerf
         qr6w==
X-Gm-Message-State: AOJu0YxqVdM1JX9UhMUfkpQs5SlzC78ijxWpa/iMq0XGZuW5Cn/mgO91
	EeLfwk6u9+oERf4PWjFB6LnrOAl7UIcTCteDXagzRYmo5w9rNj5+rSZ/dggCZPXGkAA=
X-Gm-Gg: ASbGncuSaKmuOXKpR27XnTNGH3CMYWERN9nssDrfvWKdpUObeYzsIVf21HyeyNsoVpD
	eAy2aFWr5g5pzRe7Cpl473JxAWoUNV8ZQEDegQ/kkBdU5m23y5XR89dcD1/mN/XcNx2DgKSAqUs
	sJXuVW1dvh6G8papVQ1eBQDZazLQpn6muyPcdjriwmU9hh3csddioXSWIbQex3adK1aFjgZycmz
	4GjR56GMugb4zUXlLpkeZUAW9kcyxuGEbjJDPBFtdSdmGjxcCnAO8g3lNSzByHjbB0QXzb1Fygj
	6R5Z5DutJLtP8yiC3lDdC0h/+yMwAU/w7dyN+0oEvEuyCKA6aeI40VuQVZlCMB3yUP7yBjsur2Z
	WKa+tqH1ifufbCym8xaGiANreh0ViWmXwuRE3oVy2p/Z2q2SvdQvzAM4hIAi/I6Y037Q6tMk6aw
	==
X-Google-Smtp-Source: AGHT+IEHomoTcPzi3SYTo69eEu7KMiWuzYDZb7aLDP3qy0VA1T5c3IbeWt2cpIvR/iXXdxI0Ai4RWg==
X-Received: by 2002:a05:600c:3b85:b0:456:1204:e7e6 with SMTP id 5b1f17b1804b1-45b4d7e8238mr11688465e9.11.1755763418103;
        Thu, 21 Aug 2025 01:03:38 -0700 (PDT)
Received: from [192.168.0.35] (188-141-3-146.dynamic.upc.ie. [188.141.3.146])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3c0771c1a12sm10376095f8f.34.2025.08.21.01.03.36
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 21 Aug 2025 01:03:37 -0700 (PDT)
Message-ID: <95ffeb62-0a48-4d64-b6c5-e6b4ee932e5a@linaro.org>
Date: Thu, 21 Aug 2025 09:03:36 +0100
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 02/26] media: iris: Report unreleased PERSIST buffers
 on session close
To: Dikshita Agarwal <quic_dikshita@quicinc.com>,
 Vikash Garodia <quic_vgarodia@quicinc.com>,
 Abhinav Kumar <abhinav.kumar@linux.dev>,
 Mauro Carvalho Chehab <mchehab@kernel.org>,
 Stefan Schmidt <stefan.schmidt@linaro.org>,
 Vedang Nagar <quic_vnagar@quicinc.com>, Hans Verkuil <hverkuil@kernel.org>
Cc: linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
 linux-kernel@vger.kernel.org, Renjiang Han <quic_renjiang@quicinc.com>,
 Wangao Wang <quic_wangaow@quicinc.com>
References: <20250820-iris-video-encoder-v3-0-80ab0ba58b3d@quicinc.com>
 <20250820-iris-video-encoder-v3-2-80ab0ba58b3d@quicinc.com>
From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Content-Language: en-US
In-Reply-To: <20250820-iris-video-encoder-v3-2-80ab0ba58b3d@quicinc.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 20/08/2025 10:07, Dikshita Agarwal wrote:
> Add error reporting for unreleased PERSIST internal buffers in
> iris_check_num_queued_internal_buffers(). This ensures all buffer types
> are checked and logged if not freed during session close, helping to
> detect memory leaks and improve driver robustness. No change to buffer
> lifecycle or allocation logic.
> 
> Fixes: d2abb1ff5a3c ("media: iris: Verify internal buffer release on close")
> Reviewed-by: Vikash Garodia <quic_vgarodia@quicinc.com>
> Tested-by: Vikash Garodia <quic_vgarodia@quicinc.com> # X1E80100
> Signed-off-by: Dikshita Agarwal <quic_dikshita@quicinc.com>
> ---
>   drivers/media/platform/qcom/iris/iris_vidc.c | 8 ++++++++
>   1 file changed, 8 insertions(+)
> 
> diff --git a/drivers/media/platform/qcom/iris/iris_vidc.c b/drivers/media/platform/qcom/iris/iris_vidc.c
> index cf150b32d6c2f9c7e1da7abfd5211fdfc469d96f..5fe7699c611583463231a60058d6960b6749edf5 100644
> --- a/drivers/media/platform/qcom/iris/iris_vidc.c
> +++ b/drivers/media/platform/qcom/iris/iris_vidc.c
> @@ -246,6 +246,14 @@ static void iris_check_num_queued_internal_buffers(struct iris_inst *inst, u32 p
>   			dev_err(inst->core->dev, "%d buffer of type %d not released",
>   				count, internal_buf_type[i]);
>   	}
> +
> +	buffers = &inst->buffers[BUF_PERSIST];
> +
> +	count = 0;
> +	list_for_each_entry_safe(buf, next, &buffers->list, list)
> +		count++;
> +	if (count)
> +		dev_err(inst->core->dev, "%d buffer of type BUF_PERSIST not released", count);
>   }
>   
>   int iris_close(struct file *filp)
> 

I don't think this change warrants a Fixes tag.

Other than that it seems reasonable.



