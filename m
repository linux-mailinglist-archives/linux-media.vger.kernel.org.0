Return-Path: <linux-media+bounces-20933-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id B9A049BCE62
	for <lists+linux-media@lfdr.de>; Tue,  5 Nov 2024 14:55:29 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 500DCB22360
	for <lists+linux-media@lfdr.de>; Tue,  5 Nov 2024 13:55:27 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C29581D6DA1;
	Tue,  5 Nov 2024 13:55:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="eqCYQvXe"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-lf1-f44.google.com (mail-lf1-f44.google.com [209.85.167.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7A2871D6DBB
	for <linux-media@vger.kernel.org>; Tue,  5 Nov 2024 13:55:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730814918; cv=none; b=EWtdMnISCGDaMw7XCkTc4OdJ9OarEwz661oWa7QDlUXOyYYD10Bk+3cRrBrZXnnNqQJ/SRCUVNQwy1NGWoyFWvG8cAwq94DSUNnXfBuydCEH2qsT/liBnAKZflSSZYBsYHZtfwV0dyoCORutS/ZvYcO0a1pq4NH6fEINz1bef/U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730814918; c=relaxed/simple;
	bh=q3GUUlKx9/4DSdIfudTo/BHl0hN1/E6WoZ6HBZQcFBQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=sCLyLfx6sFUeF9yA/HmrxmVx8vRsjpqs8Kc1zgE43H33nH3GM8cXwW+t0nmH33TNJ7VL3d4DOiWWSatEki0nSAAJcGyhijZFxddcF66iQ074Q7gRGdLDKX/UCmCSlrYEkC6Z7e27bmee+Wi/DZKluJ3z5SwZFsoL98U6IchN/Ug=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=eqCYQvXe; arc=none smtp.client-ip=209.85.167.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lf1-f44.google.com with SMTP id 2adb3069b0e04-539f7606199so3119780e87.0
        for <linux-media@vger.kernel.org>; Tue, 05 Nov 2024 05:55:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1730814915; x=1731419715; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=JYPfDLl1JujNUnzUwabCMz6D5QPnpcJrxkCJPH1YFNY=;
        b=eqCYQvXeHRGvRxdW7FlF+UFkmDn712x9y6/xZvjDPZW18kfuCoG1q4XMpfFuowGLJ3
         F4XDD296dEQCO/C/iuKCwkPKErI9dBWhJeMFx7P1OgKY4ATUg2TphS3tzP4HaH1R8Wnv
         NdDQpfhFnhQGsUmSUoENwpWmdBVFvf/Cy21ouNt4UfIBGfjWOkJQurqz1KdkNA9XjcD9
         jaxq+uQ7keCMJb0qOYRURV/lqe50825ln2WjFyt9LUz93wFMC68s2UrY/OAb6F0zqxqX
         WpvT0uTiRiHZjPBGrS+HytlrzdSBsJONgCnfOZ2PqtenqX+8PEqIpUkS6MofwR0bGT0R
         2H6Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730814915; x=1731419715;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=JYPfDLl1JujNUnzUwabCMz6D5QPnpcJrxkCJPH1YFNY=;
        b=rT0A2Ek8wqSnjuoQ9Y+WRhlBS4S+swt5ljjz8lFb+t+wE387ha7jTaJsiiJxmMLxqY
         Zi2WTENI2qEdBeHwIS9SqIgch5w5irrGZYGTkLgGIQgASo78B8pbXdMg24aiSz9w053B
         YMOAumZwcbRS8yB3Fua741cxLbsicCcEJckquESOLFaepesWIOEMLiIL6bQCX57h1TNU
         yYMbwq6vgbtna6KZnOFjBWbmM3vXdDsH+gzZjABT/TM4prtXDQFd1Yt/D4t5JoE9tNTX
         fZdg/hmiJk0W7ctkOuluPt+kc75P6ulD6MMbooHz9GmzhCbLcQDY9ZaeKFto1hVAUgs1
         vVew==
X-Forwarded-Encrypted: i=1; AJvYcCU4S8RiOuRKJ86l143YHCP9PrAyNSvq6BCz9SE8nxTe6makr2dZa9xkP8G4QXYWMMyag7F7kYTLwKZ8Fg==@vger.kernel.org
X-Gm-Message-State: AOJu0YzWGte1/fLmO8wfilcE65Gi+y4ef+7ztpjw1zJNmVQrF3Vu6cYD
	HhwlTTeNTig/+Tt+Ee8ohQS0RKDZ3AzKvCd88EvQIC63pXJrdpDP0TfYuhnyLVo=
X-Google-Smtp-Source: AGHT+IEpdU8rDqLX+DIyNpSfiPybyrFjFo19IbFA9Zw/IdLK8a2VdSMO8JD0bOCCp6sr0LFzmU0S1w==
X-Received: by 2002:a05:6512:e9b:b0:539:fbfd:fc74 with SMTP id 2adb3069b0e04-53b7ed185a8mr13160964e87.40.1730814914500;
        Tue, 05 Nov 2024 05:55:14 -0800 (PST)
Received: from eriador.lumag.spb.ru (2001-14ba-a0c3-3a00--7a1.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::7a1])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-53c7bdcbfa6sm2103558e87.208.2024.11.05.05.55.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 05 Nov 2024 05:55:13 -0800 (PST)
Date: Tue, 5 Nov 2024 15:55:10 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Vikash Garodia <quic_vgarodia@quicinc.com>
Cc: Stanimir Varbanov <stanimir.k.varbanov@gmail.com>, 
	Bryan O'Donoghue <bryan.odonoghue@linaro.org>, Mauro Carvalho Chehab <mchehab@kernel.org>, 
	linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org, 
	stable@vger.kernel.org
Subject: Re: [PATCH 1/4] media: venus: hfi_parser: add check to avoid out of
 bound access
Message-ID: <b2yvyaycylsxo2bmynlrqp3pzhge2tjvtvzhmpvon2lzyx3bb4@747g3erapcro>
References: <20241105-venus_oob-v1-0-8d4feedfe2bb@quicinc.com>
 <20241105-venus_oob-v1-1-8d4feedfe2bb@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241105-venus_oob-v1-1-8d4feedfe2bb@quicinc.com>

On Tue, Nov 05, 2024 at 02:24:54PM +0530, Vikash Garodia wrote:
> There is a possibility that init_codecs is invoked multiple times during
> manipulated payload from video firmware. In such case, if codecs_count
> can get incremented to value more than MAX_CODEC_NUM, there can be OOB
> access. Keep a check for max accessible memory before accessing it.

No. Please make sure that init_codecs() does a correct thing, so that
core->codecs_count isn't incremented that much (or even better that
init_codecs() doesn't do anything if it is executed second time).

> 
> Cc: stable@vger.kernel.org
> Fixes: 1a73374a04e5 ("media: venus: hfi_parser: add common capability parser")
> Signed-off-by: Vikash Garodia <quic_vgarodia@quicinc.com>
> ---
>  drivers/media/platform/qcom/venus/hfi_parser.c | 4 ++++
>  1 file changed, 4 insertions(+)
> 
> diff --git a/drivers/media/platform/qcom/venus/hfi_parser.c b/drivers/media/platform/qcom/venus/hfi_parser.c
> index 3df241dc3a118bcdeb2c28a6ffdb907b644d5653..27d0172294d5154f4839e8cef172f9a619dfa305 100644
> --- a/drivers/media/platform/qcom/venus/hfi_parser.c
> +++ b/drivers/media/platform/qcom/venus/hfi_parser.c
> @@ -23,6 +23,8 @@ static void init_codecs(struct venus_core *core)
>  		return;
>  
>  	for_each_set_bit(bit, &core->dec_codecs, MAX_CODEC_NUM) {
> +		if (core->codecs_count >= MAX_CODEC_NUM)
> +			return;
>  		cap = &caps[core->codecs_count++];
>  		cap->codec = BIT(bit);
>  		cap->domain = VIDC_SESSION_TYPE_DEC;
> @@ -30,6 +32,8 @@ static void init_codecs(struct venus_core *core)
>  	}
>  
>  	for_each_set_bit(bit, &core->enc_codecs, MAX_CODEC_NUM) {
> +		if (core->codecs_count >= MAX_CODEC_NUM)
> +			return;
>  		cap = &caps[core->codecs_count++];
>  		cap->codec = BIT(bit);
>  		cap->domain = VIDC_SESSION_TYPE_ENC;
> 
> -- 
> 2.34.1
> 

-- 
With best wishes
Dmitry

