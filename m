Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 6C60F192285
	for <lists+linux-media@lfdr.de>; Wed, 25 Mar 2020 09:22:22 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726154AbgCYIWS (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 25 Mar 2020 04:22:18 -0400
Received: from lb1-smtp-cloud7.xs4all.net ([194.109.24.24]:56641 "EHLO
        lb1-smtp-cloud7.xs4all.net" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1725903AbgCYIWS (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 25 Mar 2020 04:22:18 -0400
Received: from [192.168.2.10] ([46.9.234.233])
        by smtp-cloud7.xs4all.net with ESMTPA
        id H1IajKJ5TLu1fH1Iejyo5M; Wed, 25 Mar 2020 09:22:16 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=xs4all.nl; s=s1;
        t=1585124536; bh=/aDo3zrCti3BBCrxSQ/TeptM5Zr/TgtJSYJzo5ajLRM=;
        h=Subject:To:From:Message-ID:Date:MIME-Version:Content-Type:From:
         Subject;
        b=PTXhT7dx6nfIYWPJYYNIHXYeLNorVkxVHVFnY1pjFqOiq7smMs9LtERuxEDmmnW3m
         7uMabsKF0l2keatFvhWzYFHNhn1ZU0hfnfz4PYp4GKM3JxNp8Ysr1YAEBxjCzvryId
         6nMHe4ztg8JtfgeW6InhTa/1YVo5ZrbC2CTLYNkyPN9N///tuH0rMagAA16k9yt4Fu
         EhUJ1x7bkNUYPiD2bqfLqxMThVxb9S29DJvOCQsMp0mr9iaoasiPmo3qtiYW8KbWt+
         uQSx/mxT4Z24OjUNY9g1qO89kpwP8vZKnx6NGyCll5S9QL8jXJDcOmfwCZalRc8kaD
         GcVEOtJGBE9Lg==
Subject: Re: [PATCH v2 3/8] hantro: Use v4l2_m2m_buf_done_and_job_finish
To:     Ezequiel Garcia <ezequiel@collabora.com>,
        linux-media@vger.kernel.org, linux-rockchip@lists.infradead.org,
        linux-kernel@vger.kernel.org
Cc:     Tomasz Figa <tfiga@chromium.org>,
        Nicolas Dufresne <nicolas@ndufresne.ca>, kernel@collabora.com,
        Jonas Karlman <jonas@kwiboo.se>,
        Heiko Stuebner <heiko@sntech.de>,
        Alexandre Courbot <acourbot@chromium.org>,
        Jeffrey Kardatzke <jkardatzke@chromium.org>,
        Rob Herring <robh@kernel.org>
References: <20200318132108.21873-1-ezequiel@collabora.com>
 <20200318132108.21873-4-ezequiel@collabora.com>
From:   Hans Verkuil <hverkuil@xs4all.nl>
Message-ID: <13b1efe1-8b52-070b-cf11-b230bd405d3e@xs4all.nl>
Date:   Wed, 25 Mar 2020 09:22:04 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.5.0
MIME-Version: 1.0
In-Reply-To: <20200318132108.21873-4-ezequiel@collabora.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-CMAE-Envelope: MS4wfE8LnAJGtJIuF9Ii9JP2ReP31A+tuYGruVID7G/PunDtKNEu8GDpAbT3oeVtzLFV3wjOopKFvqkPc55xYZuuwPuHicMbx8cgOp3Ifllw4olxPk8FZhYu
 jarfWIDfSOSqpUvHqBAieb3Q2OgmMYlPiyUg2tc0BajXXb4MfpV2zbUMhNmiDPi8Qz6AfhQtPjeX5AkVgThhFhuW3QL/+WJ3VCJJLaaWcoWQLBMCXAtPqSj3
 XjfbR7Z2itflfbso8OM9hfsSLCvMS/zE2A7++XvpuE2VbDrUsCnO0dyGYPX1kAk31ZCJVsEaM4miXingB1jsOrVAORb1f+xK5W/4JJLiQZ4EWla+sUQlNZFw
 OEAkky79aV5R4vqlI1wjjfATAc9Q6X5qyNt9wCvT/8BDY5YviK8MoZhOz9rhhIMFudCnMw75A1JOuh0ep7Dbj522yZSZUuK+q+/PjaTgk6ZMjtTcBV7qkRM/
 SEnYI7rCyVBrDzCx3ham7nRG4lwtLrqqfnIdCtAI0AnzD2xz27skmqMxzTeZwhKCMWimJh1zZpSDLx2a
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On 3/18/20 2:21 PM, Ezequiel Garcia wrote:
> Let the core sort out the nuances of returning buffers
> to userspace, by using the v4l2_m2m_buf_done_and_job_finish
> helper.
> 
> This change also removes usage of buffer sequence fields,
> which shouldn't have any meaning for stateless decoders.

Uh, why remove this? For one, doesn't this cause fails in v4l2-compliance?
Also, while I agree that it is not terribly useful, it doesn't hurt, does it?

And the V4L2 spec makes no exception for stateless codecs with respect to the
sequence field.

Nacked-by: Hans Verkuil <hverkuil-cisco@xs4all.nl>

Regards,

	Hans

> 
> Signed-off-by: Ezequiel Garcia <ezequiel@collabora.com>
> ---
>  drivers/staging/media/hantro/hantro_drv.c | 27 ++++++++---------------
>  1 file changed, 9 insertions(+), 18 deletions(-)
> 
> diff --git a/drivers/staging/media/hantro/hantro_drv.c b/drivers/staging/media/hantro/hantro_drv.c
> index 0b1200fc0e1a..ec889d755cd6 100644
> --- a/drivers/staging/media/hantro/hantro_drv.c
> +++ b/drivers/staging/media/hantro/hantro_drv.c
> @@ -94,32 +94,23 @@ static void hantro_job_finish(struct hantro_dev *vpu,
>  			      unsigned int bytesused,
>  			      enum vb2_buffer_state result)
>  {
> -	struct vb2_v4l2_buffer *src, *dst;
>  	int ret;
>  
>  	pm_runtime_mark_last_busy(vpu->dev);
>  	pm_runtime_put_autosuspend(vpu->dev);
>  	clk_bulk_disable(vpu->variant->num_clocks, vpu->clocks);
>  
> -	src = v4l2_m2m_src_buf_remove(ctx->fh.m2m_ctx);
> -	dst = v4l2_m2m_dst_buf_remove(ctx->fh.m2m_ctx);
> -
> -	if (WARN_ON(!src))
> -		return;
> -	if (WARN_ON(!dst))
> -		return;
> -
> -	src->sequence = ctx->sequence_out++;
> -	dst->sequence = ctx->sequence_cap++;
> -
> -	ret = ctx->buf_finish(ctx, &dst->vb2_buf, bytesused);
> -	if (ret)
> -		result = VB2_BUF_STATE_ERROR;
> +	if (ctx->buf_finish) {
> +		struct vb2_v4l2_buffer *dst;
>  
> -	v4l2_m2m_buf_done(src, result);
> -	v4l2_m2m_buf_done(dst, result);
> +		dst = v4l2_m2m_next_dst_buf(ctx->fh.m2m_ctx);
> +		ret = ctx->buf_finish(ctx, &dst->vb2_buf, bytesused);
> +		if (ret)
> +			result = VB2_BUF_STATE_ERROR;
> +	}
>  
> -	v4l2_m2m_job_finish(vpu->m2m_dev, ctx->fh.m2m_ctx);
> +	v4l2_m2m_buf_done_and_job_finish(ctx->dev->m2m_dev, ctx->fh.m2m_ctx,
> +					 result);
>  }
>  
>  void hantro_irq_done(struct hantro_dev *vpu, unsigned int bytesused,
> 

