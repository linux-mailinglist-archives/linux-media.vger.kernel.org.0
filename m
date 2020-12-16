Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A62F62DBB19
	for <lists+linux-media@lfdr.de>; Wed, 16 Dec 2020 07:15:45 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725858AbgLPGPG (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 16 Dec 2020 01:15:06 -0500
Received: from so254-31.mailgun.net ([198.61.254.31]:49781 "EHLO
        so254-31.mailgun.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725837AbgLPGPF (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 16 Dec 2020 01:15:05 -0500
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org; q=dns/txt;
 s=smtp; t=1608099286; h=Message-ID: References: In-Reply-To: Subject:
 Cc: To: From: Date: Content-Transfer-Encoding: Content-Type:
 MIME-Version: Sender; bh=axLs1TlNIot97zD7Yk+z5pGDkbmdKej+nb8qydUo+m4=;
 b=kwHLi0ILdKTVvI3CtuSV8qfMwztNYpgg0GZ0F3wwfeI2ldkY7MoNod6rNxxg4M+1Lb4goGqY
 scTSrke3VHlDkcFD6Z6pqV0R7w+Hps3jS+x15ni29v3ZjjV9zP/z8uB8eYlQwqvF+beobN9C
 U7iIWV9NvPqhWdw6GMPp74f1vRM=
X-Mailgun-Sending-Ip: 198.61.254.31
X-Mailgun-Sid: WyI3ZjU0NiIsICJsaW51eC1tZWRpYUB2Z2VyLmtlcm5lbC5vcmciLCAiYmU5ZTRhIl0=
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n08.prod.us-east-1.postgun.com with SMTP id
 5fd9a5b77549779c5b3d99f8 (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Wed, 16 Dec 2020 06:14:15
 GMT
Sender: dikshita=codeaurora.org@mg.codeaurora.org
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
        id 0C844C433CA; Wed, 16 Dec 2020 06:14:15 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.9 required=2.0 tests=ALL_TRUSTED,BAYES_00,
        URIBL_BLOCKED autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.codeaurora.org (localhost.localdomain [127.0.0.1])
        (using TLSv1 with cipher ECDHE-RSA-AES256-SHA (256/256 bits))
        (No client certificate requested)
        (Authenticated sender: dikshita)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id 5C52FC433C6;
        Wed, 16 Dec 2020 06:14:14 +0000 (UTC)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII;
 format=flowed
Content-Transfer-Encoding: 7bit
Date:   Wed, 16 Dec 2020 11:44:14 +0530
From:   dikshita@codeaurora.org
To:     linux-media@vger.kernel.org, stanimir.varbanov@linaro.org
Cc:     linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        vgarodia@codeaurora.org
Subject: Re: [PATCH 1/2] venus: venc: update output format based on capture
 format.
In-Reply-To: <1600968674-11559-2-git-send-email-dikshita@codeaurora.org>
References: <1600968674-11559-1-git-send-email-dikshita@codeaurora.org>
 <1600968674-11559-2-git-send-email-dikshita@codeaurora.org>
Message-ID: <8e467d9434768f6c9ec93885719a1987@codeaurora.org>
X-Sender: dikshita@codeaurora.org
User-Agent: Roundcube Webmail/1.3.9
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi All,

Kindly ignore this patch.
https://patchwork.linuxtv.org/project/linux-media/list/?series=3790 
replaces this.

Thanks,
Dikshita

On 2020-09-24 23:01, Dikshita Agarwal wrote:
> update output format parameters when s_fmt is called on
> capture port as recommended in encoder spec.
> 
> Signed-off-by: Dikshita Agarwal <dikshita@codeaurora.org>
> ---
>  drivers/media/platform/qcom/venus/venc.c | 28 
> +++++++++++++++-------------
>  1 file changed, 15 insertions(+), 13 deletions(-)
> 
> diff --git a/drivers/media/platform/qcom/venus/venc.c
> b/drivers/media/platform/qcom/venus/venc.c
> index c591d00..7d2aaa8 100644
> --- a/drivers/media/platform/qcom/venus/venc.c
> +++ b/drivers/media/platform/qcom/venus/venc.c
> @@ -382,31 +382,33 @@ static int venc_s_fmt(struct file *file, void
> *fh, struct v4l2_format *f)
> 
>  	memset(&format, 0, sizeof(format));
> 
> -	format.type = V4L2_BUF_TYPE_VIDEO_OUTPUT_MPLANE;
> -	format.fmt.pix_mp.pixelformat = pixfmt_out;
> +	format.type = V4L2_BUF_TYPE_VIDEO_CAPTURE_MPLANE;
> +	format.fmt.pix_mp.pixelformat = pixfmt_cap;
>  	format.fmt.pix_mp.width = orig_pixmp.width;
>  	format.fmt.pix_mp.height = orig_pixmp.height;
>  	venc_try_fmt_common(inst, &format);
> 
> -	if (f->type == V4L2_BUF_TYPE_VIDEO_OUTPUT_MPLANE) {
> -		inst->out_width = format.fmt.pix_mp.width;
> -		inst->out_height = format.fmt.pix_mp.height;
> -		inst->colorspace = pixmp->colorspace;
> -		inst->ycbcr_enc = pixmp->ycbcr_enc;
> -		inst->quantization = pixmp->quantization;
> -		inst->xfer_func = pixmp->xfer_func;
> +	if (f->type == V4L2_BUF_TYPE_VIDEO_CAPTURE_MPLANE) {
> +		inst->width = format.fmt.pix_mp.width;
> +		inst->height = format.fmt.pix_mp.height;
>  	}
> 
>  	memset(&format, 0, sizeof(format));
> 
> -	format.type = V4L2_BUF_TYPE_VIDEO_CAPTURE_MPLANE;
> -	format.fmt.pix_mp.pixelformat = pixfmt_cap;
> +	format.type = V4L2_BUF_TYPE_VIDEO_OUTPUT_MPLANE;
> +	format.fmt.pix_mp.pixelformat = pixfmt_out;
>  	format.fmt.pix_mp.width = orig_pixmp.width;
>  	format.fmt.pix_mp.height = orig_pixmp.height;
>  	venc_try_fmt_common(inst, &format);
> 
> -	inst->width = format.fmt.pix_mp.width;
> -	inst->height = format.fmt.pix_mp.height;
> +	inst->out_width = format.fmt.pix_mp.width;
> +	inst->out_height = format.fmt.pix_mp.height;
> +	if (f->type == V4L2_BUF_TYPE_VIDEO_OUTPUT_MPLANE) {
> +		inst->colorspace = pixmp->colorspace;
> +		inst->ycbcr_enc = pixmp->ycbcr_enc;
> +		inst->quantization = pixmp->quantization;
> +		inst->xfer_func = pixmp->xfer_func;
> +	}
> 
>  	if (f->type == V4L2_BUF_TYPE_VIDEO_OUTPUT_MPLANE)
>  		inst->fmt_out = fmt;
