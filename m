Return-Path: <linux-media+bounces-9822-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id A49E18ABDC2
	for <lists+linux-media@lfdr.de>; Sun, 21 Apr 2024 01:23:22 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id C8E641C20B03
	for <lists+linux-media@lfdr.de>; Sat, 20 Apr 2024 23:23:21 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 18B9B4C62A;
	Sat, 20 Apr 2024 23:23:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="UMNw0TfY"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-ed1-f52.google.com (mail-ed1-f52.google.com [209.85.208.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DDCAA4CDE0
	for <linux-media@vger.kernel.org>; Sat, 20 Apr 2024 23:23:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1713655394; cv=none; b=eOf/Ihn1127wbdbLjW+cEe2LbvGxZ2993UPybyX1rl8y3+chK78hRg51pJ/iMaz3IKTbzmkvsgirFALzYrbsK9uDdts452fwAiQycEwpTS+OWcjXAL9hakO7TplpF8jM8Q1CAAswoUGCxaUrAisFpjcfoS/i2SxlwbSrDP/8cn8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1713655394; c=relaxed/simple;
	bh=bBNbxTaDfIJVcjkaQmgCFXE6pXweSy07pk6tkP8ChP4=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=uo5/jCuzTshnxO4OUVPbVaA92Q78sJSdxPLtqPlaTpFtzNoFLB8oUqa5vq8NjE95HbKPZFn830br3+LIJDsAwy7gSQnu9KZdoMG1TR+84NV3j7CKdxqjl2KQqTvUS6a2svZhXoPZmwcI/5g+XEB0Tw+ZktVO0I9q5GO8jypJBQA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=UMNw0TfY; arc=none smtp.client-ip=209.85.208.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-ed1-f52.google.com with SMTP id 4fb4d7f45d1cf-56e136cbcecso4494331a12.3
        for <linux-media@vger.kernel.org>; Sat, 20 Apr 2024 16:23:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1713655391; x=1714260191; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=G7j9WmKVfIxCtxmA5+g+ivZQajcRB8Ss1Yyb3DxCAfA=;
        b=UMNw0TfYERYCM73Fq3Dfxfa5Nka7eEdWP9KeNxkaioU40XArRH47xzepKqoU2hhwCX
         b+dG1RBOcQs45R3gAJUzXUzZvZub3wnRBgTjWhpaPxZIptbWaphPb5nVDFAuUvJq4jI8
         UPZYhuWMAJSVqenLIVmJ4xR9TGXvnI1Iv92AdQHTkrW/3cOShxU+zzVaRt5aPHrMhMKi
         RCtHNsxaOmGUuc3q8TqcuMLa3mSmTJIxlnBkb0B5AQAM+scdAVilZ9EIuvJCLh4sdCeR
         cN3cnCp5Qks5PxR3rc7JWD825iRdublNaQcBKGnLfo+lcDRtKkH/12CqHAPTrnPJ2MjC
         Z7Mg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1713655391; x=1714260191;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=G7j9WmKVfIxCtxmA5+g+ivZQajcRB8Ss1Yyb3DxCAfA=;
        b=Bf9Z8/+TJ2rgI+ZnES9+i1J9nBHiRYm7dDv7F8FNElfxuPFM/Tm5r0guSrD6iuDFdt
         OIqJYsOPxBwoOOWGn2drrP+Io4SS6KD1og3VCiEzeYGJ4jkBf7k8RTlS6SSZ5mKaSkFP
         1Bj+XlWTAirJtxN8X/s+j5ZKiUf86+u3+UxtYve7+AzrTV6+b8d9a2YH/nsHU0zyw4Rw
         o/G8b5OvuXRtseOEf4dphbO6Z5jtkKVxhHwT635XwyQjGB8r8ByoV2E41CX9uMTdla0H
         6Sj7gS5E7PKjvZxLnXp2LOHUZ6MNp2Xor0lN1e0ShaRk47qWttzaZ7OuInxkO8Ca2xsC
         saOQ==
X-Gm-Message-State: AOJu0YyQ+UUlnJJF+C0xx2Ikw9nI3nzaYo8m0FDGLTICFkd2qxrb9YED
	gZL7I2LBNOIWOP1LLRSFVJxqhnU5rt/fgNo5wmZu7cQaCmHMKR1U7z6rEZIFxhU=
X-Google-Smtp-Source: AGHT+IHIgAHqaBHAo2tv0s9P7hAH/P161Q1ck8771gq2FLpa0nizkFWxKtOsbHWkZLUsCdT//bfy9g==
X-Received: by 2002:a17:906:c24d:b0:a4e:5137:9969 with SMTP id bl13-20020a170906c24d00b00a4e51379969mr4156927ejb.32.1713655391076;
        Sat, 20 Apr 2024 16:23:11 -0700 (PDT)
Received: from [192.168.0.102] ([176.61.106.68])
        by smtp.gmail.com with ESMTPSA id v24-20020a170906339800b00a521904b548sm3889268eja.166.2024.04.20.16.23.09
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 20 Apr 2024 16:23:10 -0700 (PDT)
Message-ID: <27513574-3131-4704-9c3d-f699cc9edb9b@linaro.org>
Date: Sun, 21 Apr 2024 00:23:08 +0100
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 09/26] media: v4l: async: refactor
 v4l2_async_create_ancillary_links
To: Ricardo Ribalda <ribalda@chromium.org>,
 Martin Tuma <martin.tuma@digiteqautomotive.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Hugues Fruchet <hugues.fruchet@foss.st.com>,
 Alain Volmat <alain.volmat@foss.st.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>,
 Paul Kocialkowski <paul.kocialkowski@bootlin.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Chen-Yu Tsai
 <wens@csie.org>, Jernej Skrabec <jernej.skrabec@gmail.com>,
 Samuel Holland <samuel@sholland.org>,
 Sakari Ailus <sakari.ailus@linux.intel.com>,
 Thierry Reding <thierry.reding@gmail.com>,
 Jonathan Hunter <jonathanh@nvidia.com>,
 Sowjanya Komatineni <skomatineni@nvidia.com>,
 Luca Ceresoli <luca.ceresoli@bootlin.com>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 Hans Verkuil <hverkuil@xs4all.nl>, Sergey Kozlov <serjk@netup.ru>,
 Abylay Ospan <aospan@netup.ru>,
 Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>,
 Dmitry Osipenko <digetx@gmail.com>,
 Benjamin Mugnier <benjamin.mugnier@foss.st.com>,
 Sylvain Petinot <sylvain.petinot@foss.st.com>,
 Stanimir Varbanov <stanimir.k.varbanov@gmail.com>,
 Vikash Garodia <quic_vgarodia@quicinc.com>,
 Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konrad.dybcio@linaro.org>
Cc: linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org, linux-staging@lists.linux.dev,
 linux-sunxi@lists.linux.dev, linux-tegra@vger.kernel.org,
 linux-mediatek@lists.infradead.org, linux-arm-msm@vger.kernel.org
References: <20240419-fix-cocci-v2-0-2119e692309c@chromium.org>
 <20240419-fix-cocci-v2-9-2119e692309c@chromium.org>
Content-Language: en-US
From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
In-Reply-To: <20240419-fix-cocci-v2-9-2119e692309c@chromium.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 19/04/2024 10:47, Ricardo Ribalda wrote:
> Return 0 without checking IS_ERR or PTR_ERR if CONFIG_MEDIA_CONTROLLER
> is not enabled.
> 
> This makes cocci happier:
> 
> drivers/media/v4l2-core/v4l2-async.c:331:23-30: ERROR: PTR_ERR applied after initialization to constant on line 319
> 
> Signed-off-by: Ricardo Ribalda <ribalda@chromium.org>
> ---
>   drivers/media/v4l2-core/v4l2-async.c | 7 +++----
>   1 file changed, 3 insertions(+), 4 deletions(-)
> 
> diff --git a/drivers/media/v4l2-core/v4l2-async.c b/drivers/media/v4l2-core/v4l2-async.c
> index 4bb073587817..915a9f3ea93c 100644
> --- a/drivers/media/v4l2-core/v4l2-async.c
> +++ b/drivers/media/v4l2-core/v4l2-async.c
> @@ -316,9 +316,10 @@ v4l2_async_nf_try_all_subdevs(struct v4l2_async_notifier *notifier);
>   static int v4l2_async_create_ancillary_links(struct v4l2_async_notifier *n,
>   					     struct v4l2_subdev *sd)
>   {
> -	struct media_link *link = NULL;
> +	struct media_link *link;
>   
> -#if IS_ENABLED(CONFIG_MEDIA_CONTROLLER)
> +	if (!IS_ENABLED(CONFIG_MEDIA_CONTROLLER))
> +		return 0;
>   
>   	if (sd->entity.function != MEDIA_ENT_F_LENS &&
>   	    sd->entity.function != MEDIA_ENT_F_FLASH)
> @@ -326,8 +327,6 @@ static int v4l2_async_create_ancillary_links(struct v4l2_async_notifier *n,
>   
>   	link = media_create_ancillary_link(&n->sd->entity, &sd->entity);
>   
> -#endif
> -
>   	return IS_ERR(link) ? PTR_ERR(link) : 0;
>   }
>   
> 

Reviewed-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>

---
bod

