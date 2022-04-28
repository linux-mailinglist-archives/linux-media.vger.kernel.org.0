Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 62BF9512D55
	for <lists+linux-media@lfdr.de>; Thu, 28 Apr 2022 09:51:28 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233865AbiD1Hyk (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 28 Apr 2022 03:54:40 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57416 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232924AbiD1Hyi (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 28 Apr 2022 03:54:38 -0400
Received: from ams.source.kernel.org (ams.source.kernel.org [IPv6:2604:1380:4601:e00::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id DB82D3981E
        for <linux-media@vger.kernel.org>; Thu, 28 Apr 2022 00:51:23 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ams.source.kernel.org (Postfix) with ESMTPS id 962E2B82B32
        for <linux-media@vger.kernel.org>; Thu, 28 Apr 2022 07:51:22 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5C4F1C385A0;
        Thu, 28 Apr 2022 07:51:20 +0000 (UTC)
Message-ID: <96c45649-c4b6-c690-7b81-875285cd9d0d@xs4all.nl>
Date:   Thu, 28 Apr 2022 09:51:18 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.7.0
Subject: Re: [PATCH] media: coda: limit frame interval enumeration to
 supported encoder frame sizes
Content-Language: en-US
To:     Philipp Zabel <p.zabel@pengutronix.de>, linux-media@vger.kernel.org
Cc:     Mauro Carvalho Chehab <mchehab@kernel.org>, kernel@pengutronix.de
References: <20220426091555.2240313-1-p.zabel@pengutronix.de>
From:   Hans Verkuil <hverkuil@xs4all.nl>
In-Reply-To: <20220426091555.2240313-1-p.zabel@pengutronix.de>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-6.7 required=5.0 tests=BAYES_00,
        HEADER_FROM_DIFFERENT_DOMAINS,NICE_REPLY_A,RCVD_IN_DNSWL_HI,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On 26/04/2022 11:15, Philipp Zabel wrote:
> Let VIDIOC_ENUM_FRAMEINTERVALS return -EINVAL if userspace queries
> frame intervals for frame sizes unsupported by the encoder. Fixes the
> following v4l2-compliance failure:
> 
> 		fail: v4l2-test-formats.cpp(123): found frame intervals for invalid size 47x16
> 		fail: v4l2-test-formats.cpp(282): node->codec_mask & STATEFUL_ENCODER
> 	test VIDIOC_ENUM_FMT/FRAMESIZES/FRAMEINTERVALS: FAIL
> 
> For decoder devices, return -ENOTTY.

Shouldn't that be 'encoder devices'?

And why mention it at all since this isn't part of the changes in this patch?

I can drop this last sentence, if you like, but before I do that I need
confirmation that that's OK.

Regards,

	Hans

> 
> Signed-off-by: Philipp Zabel <p.zabel@pengutronix.de>
> ---
>  .../media/platform/chips-media/coda-common.c  | 20 +++++++++++++------
>  1 file changed, 14 insertions(+), 6 deletions(-)
> 
> diff --git a/drivers/media/platform/chips-media/coda-common.c b/drivers/media/platform/chips-media/coda-common.c
> index 7528f2718c4d..af71eea04dbd 100644
> --- a/drivers/media/platform/chips-media/coda-common.c
> +++ b/drivers/media/platform/chips-media/coda-common.c
> @@ -1315,7 +1315,8 @@ static int coda_enum_frameintervals(struct file *file, void *fh,
>  				    struct v4l2_frmivalenum *f)
>  {
>  	struct coda_ctx *ctx = fh_to_ctx(fh);
> -	int i;
> +	struct coda_q_data *q_data;
> +	const struct coda_codec *codec;
>  
>  	if (f->index)
>  		return -EINVAL;
> @@ -1324,12 +1325,19 @@ static int coda_enum_frameintervals(struct file *file, void *fh,
>  	if (!ctx->vdoa && f->pixel_format == V4L2_PIX_FMT_YUYV)
>  		return -EINVAL;
>  
> -	for (i = 0; i < CODA_MAX_FORMATS; i++) {
> -		if (f->pixel_format == ctx->cvd->src_formats[i] ||
> -		    f->pixel_format == ctx->cvd->dst_formats[i])
> -			break;
> +	if (coda_format_normalize_yuv(f->pixel_format) == V4L2_PIX_FMT_YUV420) {
> +		q_data = get_q_data(ctx, V4L2_BUF_TYPE_VIDEO_CAPTURE);
> +		codec = coda_find_codec(ctx->dev, f->pixel_format,
> +					q_data->fourcc);
> +	} else {
> +		codec = coda_find_codec(ctx->dev, V4L2_PIX_FMT_YUV420,
> +					f->pixel_format);
>  	}
> -	if (i == CODA_MAX_FORMATS)
> +	if (!codec)
> +		return -EINVAL;
> +
> +	if (f->width < MIN_W || f->width > codec->max_w ||
> +	    f->height < MIN_H || f->height > codec->max_h)
>  		return -EINVAL;
>  
>  	f->type = V4L2_FRMIVAL_TYPE_CONTINUOUS;

