Return-Path: <linux-media+bounces-9986-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id B76478B0526
	for <lists+linux-media@lfdr.de>; Wed, 24 Apr 2024 10:57:11 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 677CC1F2212E
	for <lists+linux-media@lfdr.de>; Wed, 24 Apr 2024 08:57:11 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 04C64158A1B;
	Wed, 24 Apr 2024 08:57:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="XWQkydc6"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-wr1-f47.google.com (mail-wr1-f47.google.com [209.85.221.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C62B115886E
	for <linux-media@vger.kernel.org>; Wed, 24 Apr 2024 08:57:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1713949024; cv=none; b=gLd1qkxmgyUyLda7PjXwV7Uy3n8AUQ4os7McmGp/8NMIoymAvtFhhIE9P5GhDiW1y2mOTgh+0RrInxPfXeH5/gNut5zmDO4y8H1psAGW8InUZmyWcmVvjtcMzKmVA9nFl4sb0YBFqNSu5WMt4q2b12vGsmLvOwI8uG2vKCNbEpo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1713949024; c=relaxed/simple;
	bh=2O72LDU1OqLroHzeVRXvbfTsfJ2fryQ4/oEHiZA7yqk=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=TaokxGR7liVSUZlQgJ7F0k3J+gIvcxmQv7WOgU0VPh1BrMHgm2w6dPATZI46U2abUpjmHW6HJsdWYcHRGkCnDu507PudBVuuUBJMN2auxiV4q4Iyx77bVmIro9NLDEFQI7sntCSfDRQ01o8iyC2MoDRJ5v1D5xQzcpgI6IQ6/V0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=XWQkydc6; arc=none smtp.client-ip=209.85.221.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wr1-f47.google.com with SMTP id ffacd0b85a97d-343c2f5b50fso4721955f8f.2
        for <linux-media@vger.kernel.org>; Wed, 24 Apr 2024 01:57:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1713949021; x=1714553821; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=AkIP6wFEIDdLYh2L9xznda/rD06h99rIWQ52OqgoXs8=;
        b=XWQkydc6ifkoesYyyw2U5cHA0sdZiz0VjUkM/xH8y520/Dt5tITDvpVYNOHnqCNKsO
         YeUs/mIzlikaaIXUw9xfTNIU8bcYE1ypsSNTvaLB5BY5zCqUoO9a4XOm7CFx22D8EpyF
         H04vx0AO7iea0+w0oib9MLmG7cXIo/+lcn43nZyWdidxFNC4J9W9bcmUJJ9xmi+4d+Tp
         8KRpj+ORL+IDXg/M/WCKmqI8dEnPs+4dKqiFFDWyb5NzReVNlBdvomZbOocJsscVhv81
         0MiLGDZc9SNK6HXrEwvHfjXb2FSSO08J02IuRPoM5JJlZL7bSUjCcc483jPC3LsJDS5R
         f6pg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1713949021; x=1714553821;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=AkIP6wFEIDdLYh2L9xznda/rD06h99rIWQ52OqgoXs8=;
        b=vRTjOiZIJNgzOrrsn/NT2QMLUTi00VOItAFxVjCA3OHavUAR//LSXoZ5K78BckJqRT
         vsPN9c6YRjHifjggzqnrkUbqyw4M5JBcQZz3tx/YWDHTbcggD/goSXaImNd1hZjSd7vU
         Mg+Oi6S2t9aW/hsOl4sq9yNbJa9Hf9+SJ7d29BdEXTWqJutV03pkcpJtV3/mAN1/7Wm/
         h0DGEnm8WFYZTejqtw0LFXdzFiayjW+DFFA5hCq3+yiLsLOPKtyWNESgza0TLprJ2aTl
         1/Q2X0PkiDBV2piG9K7qu709CtcgpekzHC9io5p4nrm1HypgMztwGwLbOC4K3Yk7SKUV
         w2gg==
X-Gm-Message-State: AOJu0Yza9Cl2RUlnd96FkKZpHgrgO6Ek5W5vojmwRV17Lm8Bh4PfIrQy
	DNa/kifPWE0lUVz3ZLpY0ZkEnaE80rLB2nGaypWtHamkvs88RvgeiEjctq1BOtM=
X-Google-Smtp-Source: AGHT+IEyU1gmwXgqSJtlqDiujsmNdbhvlCic00FHBLWvq1Gj2coaTNmeFtYG0ICD0QzXKkhlq8J0Rg==
X-Received: by 2002:a5d:5449:0:b0:34a:a836:b940 with SMTP id w9-20020a5d5449000000b0034aa836b940mr1011074wrv.18.1713949021138;
        Wed, 24 Apr 2024 01:57:01 -0700 (PDT)
Received: from [192.168.0.19] ([176.61.106.227])
        by smtp.gmail.com with ESMTPSA id v2-20020adfe282000000b00346ceb9e060sm16488957wri.103.2024.04.24.01.56.59
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 24 Apr 2024 01:57:00 -0700 (PDT)
Message-ID: <40e817d3-3a7a-4da5-9237-12915357e011@linaro.org>
Date: Wed, 24 Apr 2024 09:56:59 +0100
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] media: venus: fix use after free in vdec_close
Content-Language: en-US
To: Dikshita Agarwal <quic_dikshita@quicinc.com>,
 Stanimir Varbanov <stanimir.k.varbanov@gmail.com>,
 Vikash Garodia <quic_vgarodia@quicinc.com>,
 Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konrad.dybcio@linaro.org>,
 Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <1713943070-24085-1-git-send-email-quic_dikshita@quicinc.com>
From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
In-Reply-To: <1713943070-24085-1-git-send-email-quic_dikshita@quicinc.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 24/04/2024 08:17, Dikshita Agarwal wrote:
> There appears to be a possible use after free with vdec_close().
> The firmware will add buffer release work to the work queue through
> HFI callbacks as a normal part of decoding. Randomly closing the
> decoder device from userspace during normal decoding can incur
> a read after free for inst.
> 
> Fix it by cancelling the work in vdec_close.
> 
> Signed-off-by: Dikshita Agarwal <quic_dikshita@quicinc.com>
> ---
>   drivers/media/platform/qcom/venus/vdec.c | 1 +
>   1 file changed, 1 insertion(+)
> 
> diff --git a/drivers/media/platform/qcom/venus/vdec.c b/drivers/media/platform/qcom/venus/vdec.c
> index 29130a9..56f8a25 100644
> --- a/drivers/media/platform/qcom/venus/vdec.c
> +++ b/drivers/media/platform/qcom/venus/vdec.c
> @@ -1747,6 +1747,7 @@ static int vdec_close(struct file *file)
>   
>   	vdec_pm_get(inst);
>   
> +	cancel_work_sync(&inst->delayed_process_work);
>   	v4l2_m2m_ctx_release(inst->m2m_ctx);
>   	v4l2_m2m_release(inst->m2m_dev);
>   	vdec_ctrl_deinit(inst);

Needs a Fixes tag

---
bod

