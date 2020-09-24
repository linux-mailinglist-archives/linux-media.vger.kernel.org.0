Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 2D0A0277C2C
	for <lists+linux-media@lfdr.de>; Fri, 25 Sep 2020 01:09:38 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726763AbgIXXJg (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 24 Sep 2020 19:09:36 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53394 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726706AbgIXXJb (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 24 Sep 2020 19:09:31 -0400
Received: from mail-wm1-x344.google.com (mail-wm1-x344.google.com [IPv6:2a00:1450:4864:20::344])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2E31AC0613D3
        for <linux-media@vger.kernel.org>; Thu, 24 Sep 2020 16:09:30 -0700 (PDT)
Received: by mail-wm1-x344.google.com with SMTP id e11so616034wme.0
        for <linux-media@vger.kernel.org>; Thu, 24 Sep 2020 16:09:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=H3ni0Y+vSF2RMFAfsz5zuDv9PYzkhH62P7J2wILvdjQ=;
        b=o6Y3gTgQITjiMUNU82jHpnkLfXXPBo3p11EL4xZvgWtldHngBe/nxDsl1lhGSmyozl
         xiGKQRXWzNk84TKcjOFIoRqxXbK9wRu/1sgddatbPBLC8S5S+/Pzx05yflWN1QrVG5Rk
         8MgJqMe3zhT6ibrSO9KauT/CgTb98HmWw6wBFAzp5i06sLgsQNUNbV0SEMvivgkPDa9N
         EBYLRW7EuoGRHJFToV1V9ULAq6nw/gJJAWCkZ/YBHvumpd9XU/JBU3ormQlPXRTjMyTE
         n9+eKc74ulKJlm2l3pP+MSKRtAYDQQoSJHq744M07DbnhQJnQUqYOXOBJYEeGiDDm6+4
         3IAg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=H3ni0Y+vSF2RMFAfsz5zuDv9PYzkhH62P7J2wILvdjQ=;
        b=KlAsW411zURb4XsjuLxGhSqkHSTYzPmZ81nc4NWO1/Ge0TuknS5ibclIEr8zohXdwE
         2IXHJZQz2Kw7BOmhWsviOvYREzk78erHmAi2AhcDbxxF+WTVuonisYIHVDlb8eQ7fC4A
         T+2HAMrJB/D+8HtnCyqR7zWUmgqmtdfaqQB8tFbeV7rLytMiMwAypu7BQDOdkloxhdv8
         OhdQxSwnTcIhGZjUanKBfyPJtUqzxER6/yvtnMfcLhCjpvRzAwahomxcTlmIHYHwCpVE
         a5pErXr6Tpza/xtKLXhqIZSPmf05TKGltkyH4u3OpYEJWN48lSWQ08wA2Ov3wcmoboDl
         nW2Q==
X-Gm-Message-State: AOAM533MBzVc2R6fuE8I58vNHXCNjBAt5qjAmDL9tg+my41UkesiDvi1
        7EYJuqWYCozcYRfQB2LDTV7cGQ==
X-Google-Smtp-Source: ABdhPJy848Ex0WyCogBVOgzj0WKzhtLGnpD8lUhtQMsrJ+vHPnq6CSfZEeAzE/zEzdVDdyH1Y9IGOQ==
X-Received: by 2002:a1c:b608:: with SMTP id g8mr970827wmf.106.1600988968831;
        Thu, 24 Sep 2020 16:09:28 -0700 (PDT)
Received: from [192.168.1.7] ([195.24.90.54])
        by smtp.googlemail.com with ESMTPSA id q12sm659384wrp.17.2020.09.24.16.09.26
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 24 Sep 2020 16:09:28 -0700 (PDT)
Subject: Re: [PATCH 2/2] venus: venc: fix handlig of S_SELECTION and
 G_SELECTION
To:     Dikshita Agarwal <dikshita@codeaurora.org>,
        linux-media@vger.kernel.org, stanimir.varbanov@linaro.org
Cc:     linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        vgarodia@codeaurora.org
References: <1600968674-11559-1-git-send-email-dikshita@codeaurora.org>
 <1600968674-11559-3-git-send-email-dikshita@codeaurora.org>
From:   Stanimir Varbanov <stanimir.varbanov@linaro.org>
Message-ID: <c166c581-9fbe-f9c2-86bc-86615740c859@linaro.org>
Date:   Fri, 25 Sep 2020 02:09:26 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <1600968674-11559-3-git-send-email-dikshita@codeaurora.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org



On 9/24/20 8:31 PM, Dikshita Agarwal wrote:
> From: Stanimir Varbanov <stanimir.varbanov@linaro.org>
> 
> - return correct width and height for G_SELECTION
> - if requested rectangle wxh doesn't match with capture port wxh
>   adjust the rectangle to supported wxh.
> 
> Signed-off-by: Dikshita Agarwal <dikshita@codeaurora.org>
> ---
>  drivers/media/platform/qcom/venus/venc.c | 20 ++++++++++++--------
>  1 file changed, 12 insertions(+), 8 deletions(-)
> 
> diff --git a/drivers/media/platform/qcom/venus/venc.c b/drivers/media/platform/qcom/venus/venc.c
> index 7d2aaa8..a2cc12d 100644
> --- a/drivers/media/platform/qcom/venus/venc.c
> +++ b/drivers/media/platform/qcom/venus/venc.c
> @@ -463,13 +463,13 @@ static int venc_g_fmt(struct file *file, void *fh, struct v4l2_format *f)
>  	switch (s->target) {
>  	case V4L2_SEL_TGT_CROP_DEFAULT:
>  	case V4L2_SEL_TGT_CROP_BOUNDS:
> -		s->r.width = inst->width;
> -		s->r.height = inst->height;
> -		break;
> -	case V4L2_SEL_TGT_CROP:
>  		s->r.width = inst->out_width;
>  		s->r.height = inst->out_height;
>  		break;
> +	case V4L2_SEL_TGT_CROP:
> +		s->r.width = inst->width;
> +		s->r.height = inst->height;
> +		break;
>  	default:
>  		return -EINVAL;
>  	}
> @@ -490,10 +490,14 @@ static int venc_g_fmt(struct file *file, void *fh, struct v4l2_format *f)
>  
>  	switch (s->target) {
>  	case V4L2_SEL_TGT_CROP:
> -		if (s->r.width != inst->out_width ||
> -		    s->r.height != inst->out_height ||
> -		    s->r.top != 0 || s->r.left != 0)
> -			return -EINVAL;
> +		if (s->r.width != inst->width ||
> +		    s->r.height != inst->height ||
> +		    s->r.top != 0 || s->r.left != 0) {

In fact the 'if' statement is not needed. Just fill s->r.

> +			s->r.top = 0;
> +			s->r.left = 0;
> +			s->r.width = inst->width;
> +			s->r.height = inst->height;
> +		}
>  		break;
>  	default:
>  		return -EINVAL;
> 

-- 
regards,
Stan
