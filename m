Return-Path: <linux-media+bounces-11265-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 2944E8C19F9
	for <lists+linux-media@lfdr.de>; Fri, 10 May 2024 01:38:27 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id D3288283E1A
	for <lists+linux-media@lfdr.de>; Thu,  9 May 2024 23:38:25 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0392E12838D;
	Thu,  9 May 2024 23:38:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="A5qCEt+f"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-wr1-f68.google.com (mail-wr1-f68.google.com [209.85.221.68])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C037D1292C4
	for <linux-media@vger.kernel.org>; Thu,  9 May 2024 23:38:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.68
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1715297899; cv=none; b=aOyhvPOuxC5JnU8TgB2E4oHUALIeuULFn+kRYStQpzjLxpgiJDJuVz0rHVj04C0U8V8YTS7IrPxy6MojToXIgQjBT+AWKzLRDrzXqIrdNM2Z3UCvkyi2f/9DR7q64XoMgi6QlEV0tEM7acdg7FHzJ/dXJHi6x+4nswP1X6ZtY/o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1715297899; c=relaxed/simple;
	bh=sNEjidbN7tu2jNbATHcFmBZnyREdrkbUQ9Itle2yXRw=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=uHTe+uHrQvezh429PXFDglW2RJELwZb9W/Z8u3qtOJaGGfRgswExdJb3X1l8UgNgU8fTkusd7VqPXzeZY0jgzuqp/fh+TDzIwpAOqzXhpuTDynS7TWC6wo2g6E/RtF9Db1WMO5QZFqYAH5dA+LIvENXr+MYlMlIfpQBHjfKPqXw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=A5qCEt+f; arc=none smtp.client-ip=209.85.221.68
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wr1-f68.google.com with SMTP id ffacd0b85a97d-34da84cb755so1001206f8f.2
        for <linux-media@vger.kernel.org>; Thu, 09 May 2024 16:38:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1715297896; x=1715902696; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=yfanHmHbpXKbKUeSgjFcBc7DGojl6kbad8r19/0s0Bo=;
        b=A5qCEt+fEDkfRSfqjEguYZojwzV0feyAGA9DnT7nHxUnVN+ktjGBhFY/4GP1+2EGjA
         AqgVKsMKxuqSSwNPt1z/cozaYpVqN7uLglIAs9GQQ5zoYWnDDqH69JrHSeaERx7Oz5lF
         ZfC8pDnkAl+o1zZ2+Jxjc/RVv2dQyxBalPd3BBgSvI4ff8fUDcqs3NnfxaYViikSGLza
         NULdqkFlJuIhA88wiMs71CbV+mwWSY+Ml0JlSlmvPHEYGakl9ocmm7RaRtfBgqVmmZen
         xTdP1x0r4otxqHCSn/PcSyQPGjfKZ9kpAWOoVTOkm9Ztk2Hp4gFzoYE4y12ppX3ziC7y
         /1Yg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1715297896; x=1715902696;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=yfanHmHbpXKbKUeSgjFcBc7DGojl6kbad8r19/0s0Bo=;
        b=l6/EQ7q6XSCs8eMcqhWePFEG7TC6Pl/2DGLh1EF+PKKR0MOCQnj88sWoJzUWN8S1hK
         N2cRszsvlpPRIoHj63xiTFZIt0KJDtjvkOS9rTV31HKPwW2qn3xy/hQMU/JXMtsb55BO
         oJZOtzhLtFjKP3sjWrJ47noFGSYrwL6NTQVqUvvYqcBGxIAOQQUfdOVWuASmVOcgi4M5
         /74bO9WWHeJb5+GF65lvAxmuKbXJCDKFufGmzWKXD++bqBBhxSZLxXX98zdprUDeZVnV
         xrTSR0qXd9CYzHgeQ4utu3IWV+a+0edRy8paWZ5HVj4XQpFGJJbb4NkyEpGfVD4I7yJH
         8ijw==
X-Gm-Message-State: AOJu0YxcDJrkc/UVeGm/zxbc19IBwtPvgPsX5E0lTrU4TaXeaObIZeIX
	d4tmDTJCrIa+t3N2E7XNuq7L0g2q3L79Z2HR2ip84tb+MyCAFaUoSutzIKyed8g=
X-Google-Smtp-Source: AGHT+IFosRlvX75zyqklQng+oyl1KbifK/aRJOq31cJ1nB9jqtVbgc75tpe5nCBMM0jPYnJik8IM9w==
X-Received: by 2002:adf:e486:0:b0:34d:ab5b:d8f3 with SMTP id ffacd0b85a97d-3504a632b5dmr627399f8f.21.1715297896142;
        Thu, 09 May 2024 16:38:16 -0700 (PDT)
Received: from [192.168.0.3] ([176.61.106.227])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3502b79bd4fsm2936986f8f.7.2024.05.09.16.38.15
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 09 May 2024 16:38:15 -0700 (PDT)
Message-ID: <86f3fe7a-dc10-44a5-907e-4f336e590b7b@linaro.org>
Date: Fri, 10 May 2024 00:38:14 +0100
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 11/18] media: venus: Refactor struct
 hfi_uncompressed_plane_info
To: Ricardo Ribalda <ribalda@chromium.org>,
 Michael Tretter <m.tretter@pengutronix.de>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 Mauro Carvalho Chehab <mchehab@kernel.org>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Michal Simek <michal.simek@amd.com>, Andy Walls <awalls@md.metrocast.net>,
 Stanimir Varbanov <stanimir.k.varbanov@gmail.com>,
 Vikash Garodia <quic_vgarodia@quicinc.com>,
 Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
 Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konrad.dybcio@linaro.org>
Cc: linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-arm-msm@vger.kernel.org,
 Hans Verkuil <hverkuil-cisco@xs4all.nl>
References: <20240507-cocci-flexarray-v2-0-7aea262cf065@chromium.org>
 <20240507-cocci-flexarray-v2-11-7aea262cf065@chromium.org>
Content-Language: en-US
From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
In-Reply-To: <20240507-cocci-flexarray-v2-11-7aea262cf065@chromium.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 07/05/2024 17:27, Ricardo Ribalda wrote:
> This field is never used, but if we remove it we would change the size
> of the struct and can lead to behavior change. Stay on the safe side by
> replacing the single element array with a single element field.
> 
> This fixes the following cocci warning:
> drivers/media/platform/qcom/venus/hfi_helper.h:1003:43-60: WARNING use flexible-array member instead (https://www.kernel.org/doc/html/latest/process/deprecated.html#zero-length-and-one-element-arrays)
> 
> Signed-off-by: Ricardo Ribalda <ribalda@chromium.org>
> ---
>   drivers/media/platform/qcom/venus/hfi_helper.h | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/media/platform/qcom/venus/hfi_helper.h b/drivers/media/platform/qcom/venus/hfi_helper.h
> index 7c0edef263ae..eb0a4c64b7ef 100644
> --- a/drivers/media/platform/qcom/venus/hfi_helper.h
> +++ b/drivers/media/platform/qcom/venus/hfi_helper.h
> @@ -1000,7 +1000,7 @@ struct hfi_uncompressed_plane_constraints {
>   struct hfi_uncompressed_plane_info {
>   	u32 format;
>   	u32 num_planes;
> -	struct hfi_uncompressed_plane_constraints plane_constraints[1];
> +	struct hfi_uncompressed_plane_constraints plane_constraints;
>   };
>   
>   struct hfi_uncompressed_format_supported {
> 
Reviewed-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>

