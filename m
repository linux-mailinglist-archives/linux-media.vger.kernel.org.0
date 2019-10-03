Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id C6488C9BEE
	for <lists+linux-media@lfdr.de>; Thu,  3 Oct 2019 12:15:55 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728017AbfJCKP1 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 3 Oct 2019 06:15:27 -0400
Received: from mail-lj1-f195.google.com ([209.85.208.195]:42382 "EHLO
        mail-lj1-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727452AbfJCKP1 (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Thu, 3 Oct 2019 06:15:27 -0400
Received: by mail-lj1-f195.google.com with SMTP id y23so2034935lje.9
        for <linux-media@vger.kernel.org>; Thu, 03 Oct 2019 03:15:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=N0mEh8h/+lTt1oqjhjSQEtUmW6ZnOGqZIlNw7QjUcps=;
        b=NgvKuqpua+PcMK93J3i7jtJblJyMNLYFD9qQSv6cI835YtRhnr3ghI2Gym6zgMgitH
         7adURvZ2N1SAVNN40ZA6mDMyLhkdWmRkem7Oq7T+SlVjCnp7lBqIrutv4tcxZlWhzl6L
         jJV+Ufj4VLl++YcTPrAfeoNKwQb4LlSCepqJtwCUXF7StVfUdNdTiEjtF5bzEiJpRxyD
         1cugQl+I7riTg0B5ojoIfaDO37P4BuL6FXHBu7fu9RZ9ypNEP7y9LOuWRyptWFnWH259
         WPUkdmA552kj+9sxaViFniImrS/Obz2NgS2ZqFMXh5zdmrKrxdFKcNAJKcZlCq+4wBON
         3D5A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=N0mEh8h/+lTt1oqjhjSQEtUmW6ZnOGqZIlNw7QjUcps=;
        b=WPSZsE/ONaK9lLvSODZqMbe7oU+QJvjs29pEQSSoRV/wKr9LyI1xprm/BePQ8agSoD
         N8Q/H5XIfI6Rp5ET2TgAGHwenrpLdCAiGdMqNNdd34xyt7GHxcrWwXiv3CFROZaQ7J2U
         mlJgpk5nXf/8Cn0a1dDKb4ZaWAzphVe8riisj+bzCaaxPA6cVEijKVl3UdzlL3QIaxXh
         Kd5u2Ekm9th4MSTD7PrzE2VV+kMxYyPDyuqsOg4x+mw87t3kivYFLBRwT0iCYuyBBK6J
         R72V7E7o6RUduOnuwaz7z3zwxKG/+NC6D2oNjwF6quwfYKQ762cRE536gXCY2UE6FdvP
         P89w==
X-Gm-Message-State: APjAAAVO+aqMJF0MbNRzEMJCOUW5KUdBrYy3ODejunPFkgYEGep5CUVW
        XDT2FBR0O6X1v2tUatUMFwpJ/g==
X-Google-Smtp-Source: APXvYqxZ+LfRodntnn1xTy1GvKmEh3AwXrDJt7eub4h2t+idDe36RcotX8DabSqZCNop4XRMpG9Mqg==
X-Received: by 2002:a2e:9652:: with SMTP id z18mr2727662ljh.249.1570097724762;
        Thu, 03 Oct 2019 03:15:24 -0700 (PDT)
Received: from [192.168.27.209] ([37.157.136.206])
        by smtp.googlemail.com with ESMTPSA id v1sm350275lfe.34.2019.10.03.03.15.23
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Thu, 03 Oct 2019 03:15:24 -0700 (PDT)
Subject: Re: [PATCH v4] venus: venc: Fix enum frameintervals
To:     linux-media@vger.kernel.org
Cc:     Mauro Carvalho Chehab <mchehab+samsung@kernel.org>,
        Loic Poulain <loic.poulain@linaro.org>,
        Nicolas Dufresne <nicolas@ndufresne.ca>
References: <20191003101038.13732-1-stanimir.varbanov@linaro.org>
From:   Stanimir Varbanov <stanimir.varbanov@linaro.org>
Message-ID: <50eb3902-fe10-5952-8bdf-9b6b9ac37c62@linaro.org>
Date:   Thu, 3 Oct 2019 13:15:21 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <20191003101038.13732-1-stanimir.varbanov@linaro.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

I have tested this on db410c with following gst pipeline:

gst-launch-1.0 -v videotestsrc !
video/x-raw,format=NV12,width=1280,height=960,framerate=24/1 !
v4l2h264enc
extra-controls="controls,h264_profile=4,h264_level="5",video_bitrate=10000000;"
! filesink location=gstenc.h264

Loic, could you give it a try on db820c too?

Here is the info on the bug which I try to fix with current patch:

https://bugs.96boards.org/show_bug.cgi?id=513

On 10/3/19 1:10 PM, Stanimir Varbanov wrote:
> This fixes an issue when setting the encoder framerate because of
> missing precision. Now the frameinterval type is changed to
> TYPE_CONTINUOUS and step = 1. Also the math is changed when
> framerate property is called - the firmware side expects the
> framerate in Q16 values.
> 
> Signed-off-by: Stanimir Varbanov <stanimir.varbanov@linaro.org>
> ---
> 
> Changes since v3:
> Keep min/max numerator one, and divide frate(max/min) to frame
> factor (returned framerate max/min capabilities are in range
> 1 to 120fps but in Q16 i.e. 65536 to 7864320).
> 
>  drivers/media/platform/qcom/venus/venc.c | 17 ++++++++++++-----
>  1 file changed, 12 insertions(+), 5 deletions(-)
> 
> diff --git a/drivers/media/platform/qcom/venus/venc.c b/drivers/media/platform/qcom/venus/venc.c
> index 1b7fb2d5887c..133ff7eceb83 100644
> --- a/drivers/media/platform/qcom/venus/venc.c
> +++ b/drivers/media/platform/qcom/venus/venc.c
> @@ -22,6 +22,7 @@
>  #include "venc.h"
>  
>  #define NUM_B_FRAMES_MAX	4
> +#define FRAMERATE_FACTOR	BIT(16)
>  
>  /*
>   * Three resons to keep MPLANE formats (despite that the number of planes
> @@ -576,7 +577,7 @@ static int venc_enum_frameintervals(struct file *file, void *fh,
>  	struct venus_inst *inst = to_inst(file);
>  	const struct venus_format *fmt;
>  
> -	fival->type = V4L2_FRMIVAL_TYPE_STEPWISE;
> +	fival->type = V4L2_FRMIVAL_TYPE_CONTINUOUS;
>  
>  	fmt = find_format(inst, fival->pixel_format,
>  			  V4L2_BUF_TYPE_VIDEO_CAPTURE_MPLANE);
> @@ -600,11 +601,11 @@ static int venc_enum_frameintervals(struct file *file, void *fh,
>  		return -EINVAL;
>  
>  	fival->stepwise.min.numerator = 1;
> -	fival->stepwise.min.denominator = frate_max(inst);
> +	fival->stepwise.min.denominator = frate_max(inst) / FRAMERATE_FACTOR;
>  	fival->stepwise.max.numerator = 1;
> -	fival->stepwise.max.denominator = frate_min(inst);
> +	fival->stepwise.max.denominator = frate_min(inst) / FRAMERATE_FACTOR;
>  	fival->stepwise.step.numerator = 1;
> -	fival->stepwise.step.denominator = frate_max(inst);
> +	fival->stepwise.step.denominator = 1;
>  
>  	return 0;
>  }
> @@ -649,6 +650,7 @@ static int venc_set_properties(struct venus_inst *inst)
>  	struct hfi_quantization quant;
>  	struct hfi_quantization_range quant_range;
>  	u32 ptype, rate_control, bitrate, profile = 0, level = 0;
> +	u64 framerate;
>  	int ret;
>  
>  	ret = venus_helper_set_work_mode(inst, VIDC_WORK_MODE_2);
> @@ -659,9 +661,14 @@ static int venc_set_properties(struct venus_inst *inst)
>  	if (ret)
>  		return ret;
>  
> +	framerate = inst->timeperframe.denominator * FRAMERATE_FACTOR;
> +	/* next line is to round up */
> +	framerate += inst->timeperframe.numerator - 1;
> +	do_div(framerate, inst->timeperframe.numerator);
> +
>  	ptype = HFI_PROPERTY_CONFIG_FRAME_RATE;
>  	frate.buffer_type = HFI_BUFFER_OUTPUT;
> -	frate.framerate = inst->fps * (1 << 16);
> +	frate.framerate = framerate;
>  
>  	ret = hfi_session_set_property(inst, ptype, &frate);
>  	if (ret)
> 

-- 
regards,
Stan
