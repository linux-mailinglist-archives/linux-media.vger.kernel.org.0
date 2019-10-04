Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 1B4EFCB979
	for <lists+linux-media@lfdr.de>; Fri,  4 Oct 2019 13:48:45 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729638AbfJDLso (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 4 Oct 2019 07:48:44 -0400
Received: from bombadil.infradead.org ([198.137.202.133]:36608 "EHLO
        bombadil.infradead.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726393AbfJDLso (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Fri, 4 Oct 2019 07:48:44 -0400
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=infradead.org; s=bombadil.20170209; h=Content-Transfer-Encoding:
        Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Subject:Cc:To:
        From:Date:Sender:Reply-To:Content-ID:Content-Description:Resent-Date:
        Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
        List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
         bh=mnhO/nnICthVIGWRwbzfA3SGJPmjfckRidHYDF4L3oQ=; b=Sn3+G/Bmqb1r1sKhZ6LNVCJvG
        nLE4pJ+FZMo8h87W9IhAKmFZJNbWOYqwGLWRp+eHd/Xr0mTOkd6MCSQUFgXQS10CMk9OVeXcgljBA
        kDvgNI0E2AePp116s9p4M2eQLjYxuXkB2+XmrOLGnmGGe8Hdps/eloj7qBOrF8EpmGxs17QLEVQBt
        eiFAAyr6EkSPcjw7yosgyXllHa7pEs5h4IV477HP9bAewabASOSJET+GBudQ9Ov+q6befMyc6Ibfu
        W/aBeAwUPpSbK447V7LMe3AYXU/3svreiLi9PFHPEstwSRnGnmO7ZTLCUS3SEumkV3PTD5sjNs1Lf
        IZCWnohLg==;
Received: from 177.133.68.49.dynamic.adsl.gvt.net.br ([177.133.68.49] helo=coco.lan)
        by bombadil.infradead.org with esmtpsa (Exim 4.92.2 #3 (Red Hat Linux))
        id 1iGM4g-0001Mj-Vi; Fri, 04 Oct 2019 11:48:43 +0000
Date:   Fri, 4 Oct 2019 08:48:39 -0300
From:   Mauro Carvalho Chehab <mchehab+samsung@kernel.org>
To:     Stanimir Varbanov <stanimir.varbanov@linaro.org>
Cc:     linux-media@vger.kernel.org,
        Loic Poulain <loic.poulain@linaro.org>,
        Nicolas Dufresne <nicolas@ndufresne.ca>
Subject: Re: [PATCH v4] venus: venc: Fix enum frameintervals
Message-ID: <20191004084839.7e278fcd@coco.lan>
In-Reply-To: <20191003101038.13732-1-stanimir.varbanov@linaro.org>
References: <20191003101038.13732-1-stanimir.varbanov@linaro.org>
X-Mailer: Claws Mail 3.17.4 (GTK+ 2.24.32; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Em Thu,  3 Oct 2019 13:10:38 +0300
Stanimir Varbanov <stanimir.varbanov@linaro.org> escreveu:

> This fixes an issue when setting the encoder framerate because of
> missing precision. Now the frameinterval type is changed to
> TYPE_CONTINUOUS and step = 1. Also the math is changed when
> framerate property is called - the firmware side expects the
> framerate in Q16 values.
> 
> Signed-off-by: Stanimir Varbanov <stanimir.varbanov@linaro.org>

Didn't test the patch, but just reviewing the code, this version
looks OK on my eyes.

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



Thanks,
Mauro
