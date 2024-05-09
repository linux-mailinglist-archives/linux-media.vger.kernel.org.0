Return-Path: <linux-media+bounces-11269-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 1F0AE8C1A21
	for <lists+linux-media@lfdr.de>; Fri, 10 May 2024 01:58:36 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 4A4321C22608
	for <lists+linux-media@lfdr.de>; Thu,  9 May 2024 23:58:35 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 83421130E40;
	Thu,  9 May 2024 23:58:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="dWBW+k/T"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-wr1-f68.google.com (mail-wr1-f68.google.com [209.85.221.68])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 42B8C12DD82
	for <linux-media@vger.kernel.org>; Thu,  9 May 2024 23:58:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.68
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1715299107; cv=none; b=B+W6QW8cdwDijUN9gVcRAPAa37naPWAa55iPAZMuayfBhzHK+BTsFMXLH0MQZbrhhNlVCQvl4M/NA0Lf86PDqcYvGj6ffoph2ySaVtxaN7VRcGPsJIG9NujpmRLzMdkMvtf8gZNJ6wthYIXOoT3CAWPI84QQsHV3NTx1COFRDEk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1715299107; c=relaxed/simple;
	bh=kb91QkRvN9QrSwYzW62IYyuQVgedafRInEn1oWI0YLI=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=fTYi25pLEfnVRDycYhSHChsfupmF8e84vLlfAkwq9oW1Ddce+wK4jBR0C1OHmt2ZsHvLp4/7vT+tC6kyepPdhNlB96AhsUpqS48PPQR3uj0Je961HDIXYKlvjy+ZK3v9Q7TJSqKi45k++PYTFC0lTGYn4h0BisfeIVS4sXwd4wE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=dWBW+k/T; arc=none smtp.client-ip=209.85.221.68
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wr1-f68.google.com with SMTP id ffacd0b85a97d-34d8f6cfe5bso1045914f8f.3
        for <linux-media@vger.kernel.org>; Thu, 09 May 2024 16:58:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1715299104; x=1715903904; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=SmADRC8neGnr2C7Jsqx/otJ850xdxIBcAhILuBFUDCg=;
        b=dWBW+k/TNwo8LuuHkQxU5wYLXOLt/5I72lVxDis3RHBb8LU2XwZIe6eSKmdRGakFAD
         KjH6AZ19LbPFfqIGmwLRnRZA4i2pJHOE4+P7gN7mNxu2V326gtpthnf1Exkee14+WZkd
         EEMm1R3qYacfRb8FiT2i7tpRIUzVyyJK+zAMkpXzxRZRZedpwAUAVNlmKNQVdQqNrNBx
         nVF03+1R7bsvUn2B2bQvmochC6FdiV2/usvxv/JCR9Xcpp+Bp5jCXE0Nhi5FpaUzaCW+
         5RMakz90XvOuSDhSzIkIvSKHTz1bVISoEgkrmXwWje+OX3hhpXgW66t2CysX6gG0Wueo
         3dkg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1715299104; x=1715903904;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=SmADRC8neGnr2C7Jsqx/otJ850xdxIBcAhILuBFUDCg=;
        b=KjAoy1W/p3ZfFuUWAY4mcpmxHpKlLP1r2Djq0zv29tQRFN2f75Tpxph+1v/Fb63+38
         ajZTA4Cc9uuP5KESwAJ8MrZ3+3LeuLEX/3RtyS3xEbS6IEPl2d4RwrteJJlEV9wNMQiu
         JNu1Fz5Lie/Z+h5QRQoMpZbgdGDwChur49U3ROSt/Z1DgIImHqhtVzhS/OChueTkUhQn
         edNDD7LSeW5RZar5Q6w16bQSgdtTf21S0E2LFl2ZxaNWhn/1n1UD5Hp/+B9Lgn6M437i
         tUQNSg9kJSMI9BGkQykWaXL8InMvrkfH6gRWdhZP6GShMMKWzA94LxTGtNrmL+bpC+Ry
         VsyA==
X-Gm-Message-State: AOJu0YxBeOshXSjL1tmcCEfLxO4TnQhnxTp1ZvAMQVPB4DKvN0Hh1b+u
	8CTQhWIK5q+/8hoESiHC/DX+9iDm9hkyHtetdR8RIUD5kEfXlCv8s+WMeHIvoCY=
X-Google-Smtp-Source: AGHT+IFDwl+vsE63gkhGWvzP1kBHKBKxw0Cew31F/NUWgE8/55F44dsMw6lb8YVdGhvzJwmBNcwoSw==
X-Received: by 2002:adf:ec01:0:b0:34c:5f6e:1720 with SMTP id ffacd0b85a97d-3504aa62d00mr589668f8f.60.1715299104660;
        Thu, 09 May 2024 16:58:24 -0700 (PDT)
Received: from [192.168.0.3] ([176.61.106.227])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3502baacf7esm2945702f8f.77.2024.05.09.16.58.23
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 09 May 2024 16:58:24 -0700 (PDT)
Message-ID: <6ddd92f2-5ba5-4832-b4a1-12c9918c091a@linaro.org>
Date: Fri, 10 May 2024 00:58:22 +0100
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 14/18] media: venus: Refactor
 hfi_session_empty_buffer_uncompressed_plane0_pkt
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
 <20240507-cocci-flexarray-v2-14-7aea262cf065@chromium.org>
Content-Language: en-US
From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
In-Reply-To: <20240507-cocci-flexarray-v2-14-7aea262cf065@chromium.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 07/05/2024 17:27, Ricardo Ribalda wrote:
> The single element array data[1] is never used. Replace it whit a
> padding field of the same size.
> 
> This fixes the following cocci error:
> drivers/media/platform/qcom/venus/hfi_cmds.h:163:5-9: WARNING use flexible-array member instead (https://www.kernel.org/doc/html/latest/process/deprecated.html#zero-length-and-one-element-arrays)
> 
> Signed-off-by: Ricardo Ribalda <ribalda@chromium.org>
> ---
>   drivers/media/platform/qcom/venus/hfi_cmds.h | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/media/platform/qcom/venus/hfi_cmds.h b/drivers/media/platform/qcom/venus/hfi_cmds.h
> index e1dd0ea2be1a..15271b3f2b49 100644
> --- a/drivers/media/platform/qcom/venus/hfi_cmds.h
> +++ b/drivers/media/platform/qcom/venus/hfi_cmds.h
> @@ -160,7 +160,7 @@ struct hfi_session_empty_buffer_uncompressed_plane0_pkt {
>   	u32 input_tag;
>   	u32 packet_buffer;
>   	u32 extradata_buffer;
> -	u32 data[1];
> +	u32 padding;
>   };
>   
>   struct hfi_session_fill_buffer_pkt {
> 

Its not padding - which is what we mean when we want to align something 
to a boundary - its data that we don't currently use.

Please retain the namespace and do data[1] -> data.

Once done.

Reviewed-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>

