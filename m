Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 83F11242864
	for <lists+linux-media@lfdr.de>; Wed, 12 Aug 2020 12:55:49 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727872AbgHLKzk (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 12 Aug 2020 06:55:40 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41590 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727808AbgHLKyl (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 12 Aug 2020 06:54:41 -0400
Received: from mail-wm1-x341.google.com (mail-wm1-x341.google.com [IPv6:2a00:1450:4864:20::341])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 45620C061787
        for <linux-media@vger.kernel.org>; Wed, 12 Aug 2020 03:54:14 -0700 (PDT)
Received: by mail-wm1-x341.google.com with SMTP id d190so1374365wmd.4
        for <linux-media@vger.kernel.org>; Wed, 12 Aug 2020 03:54:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=z+jAzkAYbm8dRi6meS5Ks6bwjI53FeOFtpVqTfL46wc=;
        b=Px4MzpFxqro1h3xEn3hbGCmlHGC9AUOZhBWro5yZdAKbQ1CtAQQsY2R6Qg7ZveQysP
         eN26mgXanaiNs+6VV2GDBf1/ii/oD7QuOrGxSrZTtnWDzz44k+G9n+xzWdbN0OUOkNOD
         dRoleTQIaU4iodD/SbRX65KLB9QDNr/lapHwoasiy35wAfHLMiQo2PzgyfQVP3nf2mf5
         AmmniBz0mCw9iVTdKZmnbx5rVJ0LQFfDjEy6AkvJes+5Hbm/6UxgvmX4rLDyyC072oqK
         EnCGHyJCnBIu05gAluXOeyo6nny/hdd6sfxcAJ+yeyRIYmzUW0hXmIOOo5Ya5z+6i2Su
         8M4Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=z+jAzkAYbm8dRi6meS5Ks6bwjI53FeOFtpVqTfL46wc=;
        b=CekmWmENN58MsbEgfZ2cAJYv12H/zVqeC8pynCkUsMhXUI9pJo83LefHj5d5X1xvtH
         HYC+t8VEH1y8sm0G/1UD58wQizGBDKLUA7D2g0xoBorlLt44wupN2TYwB5zwxLCbaLug
         HLcUsI0JM+v5vwWOyMAYGyCT46SBgCwFspc0meDCysYDpIarj/um/MoHz7BgDnLjhCrE
         4sEV9t6lo/P7OtGOg/8OQCSmL4vabmDmtRHa/Sxwx+mNn4IcB3vuDwQT3eKApebeBDFO
         9Q2FAs7bsfgtvYkYE0IwIMEAPfPfg1H0CNyIFki2skaTE0EhAmSgnqb8tuoqKCz+uXsg
         XlVw==
X-Gm-Message-State: AOAM533H5hpnFzBrdNN3yMCU2zEyjozKUDk0/YfCOLYFDMDowBg2Xcxf
        ebNpTPABbfzJqk6m/j3MKTN3Ww==
X-Google-Smtp-Source: ABdhPJxOX8KY3sja99cOHmyJ0eZOgpp0Zu2wnZrvweWHbVIO6LQ1fckTETTNEdKj14vX0kyacVHntw==
X-Received: by 2002:a1c:4c17:: with SMTP id z23mr8426384wmf.49.1597229649440;
        Wed, 12 Aug 2020 03:54:09 -0700 (PDT)
Received: from [192.168.1.14] ([195.24.90.54])
        by smtp.googlemail.com with ESMTPSA id r11sm3424811wrw.78.2020.08.12.03.54.07
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 12 Aug 2020 03:54:08 -0700 (PDT)
Subject: Re: [PATCH v2] media: venus: Fix reported frame intervals
To:     Loic Poulain <loic.poulain@linaro.org>,
        stanimir.varbanov@linaro.org
Cc:     linux-arm-msm@vger.kernel.org, linux-media@vger.kernel.org,
        anibal.limon@linaro.org
References: <1596543717-9106-1-git-send-email-loic.poulain@linaro.org>
From:   Stanimir Varbanov <stanimir.varbanov@linaro.org>
Message-ID: <503a3674-0697-8955-f0c2-109e5f700e41@linaro.org>
Date:   Wed, 12 Aug 2020 13:54:06 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <1596543717-9106-1-git-send-email-loic.poulain@linaro.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Loic,

Thanks for the patch!

On 8/4/20 3:21 PM, Loic Poulain wrote:
> On dragonboard-410c (apq8016) with HFI_VERSION_1XX, the reported
> framerate is in unit of 1/65535 fps (for fine grained control).
> So the current reported supported frame intervals is wrong (max
> is 1/65535 fps), leading to encoding issues or format negotiation
> failures with gstreamer.
> 
> Fix that by setting the framerate denominator to coherent value
> based on the the framerate factor.
> 
> The factor is not always the same, e.g. with db820c (apq8096) HFI
> reports framerate in fps unit. So only apply that for HFI_VERSION_1XX.
> 
> Signed-off-by: Loic Poulain <loic.poulain@linaro.org>
> ---
>  v2: Use IS_V1 helper for retrieveing venus core version
>      Adjust denominator instead of numerator
> 
>  drivers/media/platform/qcom/venus/venc.c | 12 +++++++++---
>  1 file changed, 9 insertions(+), 3 deletions(-)

Acked-by: Stanimir Varbanov <stanimir.varbanov@linaro.org>

> 
> diff --git a/drivers/media/platform/qcom/venus/venc.c b/drivers/media/platform/qcom/venus/venc.c
> index 9981a2a..5b3df09 100644
> --- a/drivers/media/platform/qcom/venus/venc.c
> +++ b/drivers/media/platform/qcom/venus/venc.c
> @@ -576,6 +576,7 @@ static int venc_enum_frameintervals(struct file *file, void *fh,
>  {
>  	struct venus_inst *inst = to_inst(file);
>  	const struct venus_format *fmt;
> +	unsigned int framerate_factor = 1;
>  
>  	fival->type = V4L2_FRMIVAL_TYPE_STEPWISE;
>  
> @@ -600,12 +601,17 @@ static int venc_enum_frameintervals(struct file *file, void *fh,
>  	    fival->height < frame_height_min(inst))
>  		return -EINVAL;
>  
> +	if (IS_V1(inst->core)) {
> +		/* framerate is reported in 1/65535 fps unit */
> +		framerate_factor = (1 << 16);
> +	}
> +
>  	fival->stepwise.min.numerator = 1;
> -	fival->stepwise.min.denominator = frate_max(inst);
> +	fival->stepwise.min.denominator = frate_max(inst) / framerate_factor;
>  	fival->stepwise.max.numerator = 1;
> -	fival->stepwise.max.denominator = frate_min(inst);
> +	fival->stepwise.max.denominator = frate_min(inst) / framerate_factor;
>  	fival->stepwise.step.numerator = 1;
> -	fival->stepwise.step.denominator = frate_max(inst);
> +	fival->stepwise.step.denominator = frate_max(inst) / framerate_factor;
>  
>  	return 0;
>  }
> 

-- 
regards,
Stan
