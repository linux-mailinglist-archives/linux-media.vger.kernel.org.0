Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 8F82323B61C
	for <lists+linux-media@lfdr.de>; Tue,  4 Aug 2020 09:54:11 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726198AbgHDHyH (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 4 Aug 2020 03:54:07 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53004 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729472AbgHDHyF (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Tue, 4 Aug 2020 03:54:05 -0400
Received: from mail-wm1-x344.google.com (mail-wm1-x344.google.com [IPv6:2a00:1450:4864:20::344])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E479BC061756
        for <linux-media@vger.kernel.org>; Tue,  4 Aug 2020 00:54:04 -0700 (PDT)
Received: by mail-wm1-x344.google.com with SMTP id c19so1603007wmd.1
        for <linux-media@vger.kernel.org>; Tue, 04 Aug 2020 00:54:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=H2zCW/kQ6aCvtur961Ynj7Bn0wcaRINKRQWdR+heL0s=;
        b=k9fRH+9ZtxBpRHtuM9z2fdTe/S7XZeGu3Z1phZPH7Gs0CeWKZbhFlIOzGK2PgN6/X+
         lQoCgx1WshDVTgIOSMJYgXrTNiej3IY6nqA7DU5f94tkKazD5dt9bMMBpGDDlTZVUmha
         IePJtQUYNLAuCHnIgCjVMAHHdp8kkSn7ACsnwFI3HGJyPfr05Q6Ud0IC0YCjAnc9xEbx
         1bzbukNJKDLg7RIW5EEfdODn7tEDv+il4TVFkWaM3OijcxhmTSRnOztPrCMjngDQ1Jng
         j0ygWKRYwV34Hh/cTHg/Poyh0vEoy8P9c5CZxLgzJX0iXirGwH0VO/b2gFMeTlVRbw/Z
         prAg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=H2zCW/kQ6aCvtur961Ynj7Bn0wcaRINKRQWdR+heL0s=;
        b=HKhUxLhjfstdu1XujdnTf8Py41TQwM6Zf93/S+zMgYLUyrX/EuS1Ogxg10ZTl2FBoj
         nMQ5yReHFxiBShGo0qLg8GHjB3pbmxSiE8Lv6cGMmk9EHPkY0gSJqs7qRIDHPp/+LDqZ
         JMlhdqpJtvED+uSnZUAcQOgzmccceBSy8YPgWBBIvFmLQTpaZjom5kSVhbcIfzCetHWf
         YhQPHKihrjZO54U2MARj+P4iQJAFRDEdx/vs/Fu9cH/SHLN2fCxpwzgA5Sm217vLWeRC
         afJSBsFgrvOKgpzPWtC3hnFlEaAN5ncw7Yg/uugVDTXm5/rEJdPbwMnK40G3UQxNYo60
         uNqQ==
X-Gm-Message-State: AOAM530A3DCjvuAr5bgxk34rlumhOHCMrYqwOzubGui1V2RAeNi25UrH
        t2p+HVYmPkm1Fltnk3eadM3VzoAqE0Lsng==
X-Google-Smtp-Source: ABdhPJzsLRcRIdeD7uMwiFMA9OnMMg+wBok0W54IJT5RDIP6Gz4Wm+D58D95Zh8ZmIqWqU2tT/UtNw==
X-Received: by 2002:a1c:f60d:: with SMTP id w13mr2970557wmc.51.1596527643385;
        Tue, 04 Aug 2020 00:54:03 -0700 (PDT)
Received: from [192.168.1.9] ([195.24.90.54])
        by smtp.googlemail.com with ESMTPSA id r3sm2103516wro.1.2020.08.04.00.54.02
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 04 Aug 2020 00:54:02 -0700 (PDT)
Subject: Re: [PATCH] media: venus: Fix reported frame intervals
To:     Loic Poulain <loic.poulain@linaro.org>,
        stanimir.varbanov@linaro.org
Cc:     linux-arm-msm@vger.kernel.org, linux-media@vger.kernel.org
References: <1596464268-7382-1-git-send-email-loic.poulain@linaro.org>
From:   Stanimir Varbanov <stanimir.varbanov@linaro.org>
Message-ID: <4cf40f23-1181-1543-cd5c-212ad2bb0ead@linaro.org>
Date:   Tue, 4 Aug 2020 10:54:01 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <1596464268-7382-1-git-send-email-loic.poulain@linaro.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Loic,

On 8/3/20 5:17 PM, Loic Poulain wrote:
> On dragonboard-410c (apq8016) with HFI_VERSION_1XX, the reported
> framerate is in unit of 1/65535 fps (for fine grained control).
> So the current reported supported frame intervals is wrong (max
> is 1/65535 fps), leading to encoding issues or format negotiation
> failures with gstreamer.
> 
> Fix that by setting the framerate numerator according the framerate
> factor (65535).
> 
> The factor is not always the same, e.g. with db820c (apq8096) HFI
> reports framerate in fps unit. So only apply that for HFI_VERSION_1XX.
> 
> Signed-off-by: Loic Poulain <loic.poulain@linaro.org>
> ---
>  drivers/media/platform/qcom/venus/venc.c | 13 ++++++++++---
>  1 file changed, 10 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/media/platform/qcom/venus/venc.c b/drivers/media/platform/qcom/venus/venc.c
> index 9981a2a..654bbaf 100644
> --- a/drivers/media/platform/qcom/venus/venc.c
> +++ b/drivers/media/platform/qcom/venus/venc.c
> @@ -575,7 +575,9 @@ static int venc_enum_frameintervals(struct file *file, void *fh,
>  				    struct v4l2_frmivalenum *fival)
>  {
>  	struct venus_inst *inst = to_inst(file);
> +	enum hfi_version ver = inst->core->res->hfi_version;
>  	const struct venus_format *fmt;
> +	unsigned int framerate_factor = 1;
>  
>  	fival->type = V4L2_FRMIVAL_TYPE_STEPWISE;
>  
> @@ -600,11 +602,16 @@ static int venc_enum_frameintervals(struct file *file, void *fh,
>  	    fival->height < frame_height_min(inst))
>  		return -EINVAL;
>  
> -	fival->stepwise.min.numerator = 1;
> +	if (ver == HFI_VERSION_1XX) {

Could you use IS_V1(inst->core) macro instead.

> +		/* framerate is reported in 1/65535 fps unit */

I wonder isn't better to be consistent for all venus versions and return
1/1 to 1/120 instead of 65535/65535 to 65535/7864320?

> +		framerate_factor = (1 << 16);
> +	}
> +
> +	fival->stepwise.min.numerator = framerate_factor;
>  	fival->stepwise.min.denominator = frate_max(inst);
> -	fival->stepwise.max.numerator = 1;
> +	fival->stepwise.max.numerator = framerate_factor;
>  	fival->stepwise.max.denominator = frate_min(inst);
> -	fival->stepwise.step.numerator = 1;
> +	fival->stepwise.step.numerator = framerate_factor;
>  	fival->stepwise.step.denominator = frate_max(inst);
>  
>  	return 0;
> 

-- 
regards,
Stan
