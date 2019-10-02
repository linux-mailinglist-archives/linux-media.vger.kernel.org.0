Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 4CDE0C8A99
	for <lists+linux-media@lfdr.de>; Wed,  2 Oct 2019 16:10:03 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726214AbfJBOKC (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 2 Oct 2019 10:10:02 -0400
Received: from bombadil.infradead.org ([198.137.202.133]:34812 "EHLO
        bombadil.infradead.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726087AbfJBOKC (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Wed, 2 Oct 2019 10:10:02 -0400
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=infradead.org; s=bombadil.20170209; h=Content-Transfer-Encoding:
        Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Subject:Cc:To:
        From:Date:Sender:Reply-To:Content-ID:Content-Description:Resent-Date:
        Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
        List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
         bh=9LDJy3q59M41dHEIhdF3uB5UxiWzohmUQUFHM1ReXac=; b=MBJM4pPG0qDmFJptL5AHhTivW
        Kk0ulg4cFVSZFJLu8yPCtV8huiQzG3rx9vUOOW3Ir3xSsnGRGeZwLvheVu6deRJMgjiLR0pIyvKek
        oiShNMDSuhascBKqQu/QCE5YwneLuxbWBTCTDcIYEh2qZiXJmKGQiuT93yQ+TFzs8ynhseMUmM6oI
        a3r6w/NWxKR1quOx++Vh4CFr1Y18Ox+cQAy5D50JStUxE25xEVa3e8ex2dTuKlWzKHwjjW25jwSzv
        e4GWkjWn20aKFbdVfO9PPAGD7orIaYGHPxPL3fUhamn83ny1O290i/6cyG2dghaiOIsC9ZWsIBb5m
        qj5O22AyA==;
Received: from 177.157.127.95.dynamic.adsl.gvt.net.br ([177.157.127.95] helo=coco.lan)
        by bombadil.infradead.org with esmtpsa (Exim 4.92.2 #3 (Red Hat Linux))
        id 1iFfKL-0007Gl-Gi; Wed, 02 Oct 2019 14:10:01 +0000
Date:   Wed, 2 Oct 2019 11:09:58 -0300
From:   Mauro Carvalho Chehab <mchehab+samsung@kernel.org>
To:     Stanimir Varbanov <stanimir.varbanov@linaro.org>
Cc:     linux-media@vger.kernel.org
Subject: Re: venus: venc: Fix enum frameintervals - was: [GIT PULL for v5.5]
 Venus updates, take 2
Message-ID: <20191002110958.2835d1ac@coco.lan>
In-Reply-To: <20191002112953.16642-1-stanimir.varbanov@linaro.org>
References: <20191002112953.16642-1-stanimir.varbanov@linaro.org>
X-Mailer: Claws Mail 3.17.4 (GTK+ 2.24.32; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Em Wed,  2 Oct 2019 14:29:53 +0300
Stanimir Varbanov <stanimir.varbanov@linaro.org> escreveu:

> Hi Mauro,
> 
> The Venus driver updates include:
> 
> * three fixes: fail to suspend, enum frameinterval issue with encoder
> and frequency table modifications for v3 to handle performance issues.
> * two new features: interconnect bandwidth support on v4 and more precise
> clock-scaling on v4.
> 
> Please pull.
>
> Stanimir Varbanov (3):
>       venus: venc: Fix enum frameintervals

> From c430fca8f2b9b7274a1186f85b69c469378dbd8a Mon Sep 17 00:00:00 2001
> From: Stanimir Varbanov <stanimir.varbanov@linaro.org>
> Date: Tue, 22 Jan 2019 12:53:22 +0200
> Subject: venus: venc: Fix enum frameintervals
> To: Linux Media Mailing List <linux-media@vger.kernel.org>
> Cc: Mauro Carvalho Chehab <mchehab@infradead.org>
> 
> This fixes an issue when setting the encoder framerate because of
> missing precision. Now the frameinterval type is changed to
> TYPE_CONTINUOUS and step = 1. Also the math is changed when
> framerate property is called - the firmware side expects the
> framerate in Q16 values.
> 
> Signed-off-by: Loic Poulain <loic.poulain@linaro.org>
> Signed-off-by: Stanimir Varbanov <stanimir.varbanov@linaro.org>
> ---
>  drivers/media/platform/qcom/venus/venc.c | 23 ++++++++++++++++-------
>  1 file changed, 16 insertions(+), 7 deletions(-)
> 
> diff --git a/drivers/media/platform/qcom/venus/venc.c b/drivers/media/platform/qcom/venus/venc.c
> index 1b7fb2d5887c..d0a97754ef18 100644
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
> @@ -599,12 +600,12 @@ static int venc_enum_frameintervals(struct file *file, void *fh,
>  	    fival->height < frame_height_min(inst))
>  		return -EINVAL;
>  
> -	fival->stepwise.min.numerator = 1;
> -	fival->stepwise.min.denominator = frate_max(inst);
> -	fival->stepwise.max.numerator = 1;
> -	fival->stepwise.max.denominator = frate_min(inst);
> +	fival->stepwise.min.numerator = FRAMERATE_FACTOR;
> +	fival->stepwise.min.denominator = frate_max(inst) * FRAMERATE_FACTOR;
> +	fival->stepwise.max.numerator = FRAMERATE_FACTOR;
> +	fival->stepwise.max.denominator = frate_min(inst) * FRAMERATE_FACTOR;

Hmm... this change seems plain wrong to me... Why do you want to change
the numerator? I mean:

	1/frame_min(inst)

is equal to:

	(const * 1) / (const * frame_min(inst))

Also, on every other driver, the returned fractions are normalized.

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
> @@ -659,9 +661,16 @@ static int venc_set_properties(struct venus_inst *inst)
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
> +	if (frate.framerate > frate_max(inst) * FRAMERATE_FACTOR)
> +		frate.framerate = frate_max(inst) * FRAMERATE_FACTOR;

You should not assume that userspace will be multiplying by the
frame factor. I mean, the driver should work the same way, no matter
if userspace is setting the framerate as:

	1/30, 2/60, ... n/(n *30)


>  
>  	ret = hfi_session_set_property(inst, ptype, &frate);
>  	if (ret)
> -- 
> 2.21.0
> 




Thanks,
Mauro
