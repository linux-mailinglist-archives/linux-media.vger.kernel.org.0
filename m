Return-Path: <linux-media+bounces-11270-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 257468C1A27
	for <lists+linux-media@lfdr.de>; Fri, 10 May 2024 02:00:14 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id D009F1F232B0
	for <lists+linux-media@lfdr.de>; Fri, 10 May 2024 00:00:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2391F1311B0;
	Fri, 10 May 2024 00:00:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nexus-software-ie.20230601.gappssmtp.com header.i=@nexus-software-ie.20230601.gappssmtp.com header.b="kBP0G5gd"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com [209.85.128.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B342112EBE7
	for <linux-media@vger.kernel.org>; Fri, 10 May 2024 00:00:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1715299203; cv=none; b=t1T+VXlnnS8calu92uuprlOA1TuEF1P85xnahbrogHILoBaDI5VnPKZgMxlmCsm00zEhif+9D7fyRjMRB2R3VXlWl+nvOEd5kskL1HqmjcNGZcrM9n7J9ArwcT6i7suAdQPXqMUpukv4HbpJO+t6hWiLfSP8lVRyC4qk3XV+nM8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1715299203; c=relaxed/simple;
	bh=n7znReOatkTCp/ojgNhGLxLQ8+ymQ1YvCj4wgmT2e+E=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=NWG7z0jI3peiq74gutxfg2tfFvJ7qMMvC/FXXaY3VATm832hbrki87zReCnWpp1lazkI71jFkDKNAZCH3c40EleGeJS5TYX8FnaSpmuOJ/vEOy1Q3kJwwu1BgoAHU0J+RXBDy75NhDiqg6nITmhBoA83g2gAIGT2HObxCsCxqxk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=nexus-software.ie; spf=none smtp.mailfrom=nexus-software.ie; dkim=pass (2048-bit key) header.d=nexus-software-ie.20230601.gappssmtp.com header.i=@nexus-software-ie.20230601.gappssmtp.com header.b=kBP0G5gd; arc=none smtp.client-ip=209.85.128.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=nexus-software.ie
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=nexus-software.ie
Received: by mail-wm1-f45.google.com with SMTP id 5b1f17b1804b1-41b79451153so10186045e9.2
        for <linux-media@vger.kernel.org>; Thu, 09 May 2024 17:00:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=nexus-software-ie.20230601.gappssmtp.com; s=20230601; t=1715299199; x=1715903999; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=ac8m1lg1I0T289VUpecDSdF94afPIFuxyWL4V464XBs=;
        b=kBP0G5gdJmNzUc/OcxOB4V6kXjisAnOfrnJOY14xnFeEecyO4Ykp95nY+sgd4oHYVJ
         JrSrv+KrdHueN0BengHG8VA3gGWPntC8HmzO4xU5yDYSmdcCa1wZhyA6GxCjNvYcuYX9
         wQn74Iwq2ezNknWTY/z5y8ry7itm0e5byxAiD8vyuBUJOONVxqc7CyC8D03IXy7pizWW
         vzoP41teAH1rznHA8X197U6S6UU+m8vK44BPfpyCCZa1luiWK7sOR1x27vpDqtRpRV74
         XyCqFnGIXGsAUqKETMvJqJSU827Jm7Nc71lDEHVc8ByN/Q68joSr4AejnG4/aOz81VI9
         Owsw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1715299199; x=1715903999;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=ac8m1lg1I0T289VUpecDSdF94afPIFuxyWL4V464XBs=;
        b=s9fwlA+eAFlQXGvFg8ZSutpO+/Tf3ccGSsioJE5QITGYLtALrKBdsDxjOf1PM23Raa
         HRb0EG8zMAyLzfvaIR58thWQf5QAlFaekqcahPbLdvAKKGYE27T2O24s4XUOOM4aWJnL
         L04ByivXBmXNF1X7Kt4UPSkUCcwMHXZ7tszlD46w9DjRGoKtR1XgrY18TX0ZzbOWJ0pP
         21jLpbOkfFN7ZaFDRc8/0/T1/n1AuOFh2hhrTRRDGIL9obhYxlF0T4Laqs9HgzVlSnm9
         lc46dmLTw1o5Yfdh1DMNczQccPYxGYeMRi4NC1Mn9N7dE2qLZhsuvi7BWHkRjMj309J9
         XIkQ==
X-Gm-Message-State: AOJu0Yx7sZC4gMKuPRCunaJmG3szNRGyEMTBVbji7W4d4fo60iCIlfK+
	wiGgJ2+nylQtuhrYneRGiC2qE+fqwI9aJlKrFcO97yD4hD7pqNoAQH1rLiEJmFY=
X-Google-Smtp-Source: AGHT+IG2PSyqS+bqV1WZloHrOnS1oEGY7MOpk1/VDvcVVtKw/Iui2AjmDMB4m7sMKJweAG7DjovZSg==
X-Received: by 2002:a05:600c:35c2:b0:41b:cb18:e24b with SMTP id 5b1f17b1804b1-41feaa39167mr8110355e9.9.1715299199008;
        Thu, 09 May 2024 16:59:59 -0700 (PDT)
Received: from [192.168.0.3] ([176.61.106.227])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-41f86e7e340sm77518495e9.0.2024.05.09.16.59.57
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 09 May 2024 16:59:58 -0700 (PDT)
Message-ID: <43fec2ec-7192-4b2d-9af5-2073be1da3d1@nexus-software.ie>
Date: Fri, 10 May 2024 00:59:56 +0100
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 15/18] media: venus: Refactor
 hfi_session_empty_buffer_compressed_pkt
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
 <20240507-cocci-flexarray-v2-15-7aea262cf065@chromium.org>
Content-Language: en-US
From: Bryan O'Donoghue <pure.logic@nexus-software.ie>
In-Reply-To: <20240507-cocci-flexarray-v2-15-7aea262cf065@chromium.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 07/05/2024 17:27, Ricardo Ribalda wrote:
> The single element array data[1] is never used. Replace it with a
> padding field of the same size.
> 
> This fixes the following cocci warning:
> drivers/media/platform/qcom/venus/hfi_cmds.h:146:5-9: WARNING use flexible-array member instead (https://www.kernel.org/doc/html/latest/process/deprecated.html#zero-length-and-one-element-arrays)
> 
> Signed-off-by: Ricardo Ribalda <ribalda@chromium.org>
> ---
>   drivers/media/platform/qcom/venus/hfi_cmds.h | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/media/platform/qcom/venus/hfi_cmds.h b/drivers/media/platform/qcom/venus/hfi_cmds.h
> index 15271b3f2b49..02e9a073d0c1 100644
> --- a/drivers/media/platform/qcom/venus/hfi_cmds.h
> +++ b/drivers/media/platform/qcom/venus/hfi_cmds.h
> @@ -143,7 +143,7 @@ struct hfi_session_empty_buffer_compressed_pkt {
>   	u32 input_tag;
>   	u32 packet_buffer;
>   	u32 extradata_buffer;
> -	u32 data[1];
> +	u32 padding;
>   };
>   
>   struct hfi_session_empty_buffer_uncompressed_plane0_pkt {
> 

Same comment as previous patch.

`data` is what we use in this driver's namespace not padding and the 
protocol structures enumerate the content of the payload as data not 
padding.

u32 data;

Then

Reviewed-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>

---
bod

