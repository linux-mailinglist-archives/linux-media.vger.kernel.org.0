Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 2990A45A241
	for <lists+linux-media@lfdr.de>; Tue, 23 Nov 2021 13:12:11 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236931AbhKWMPQ (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 23 Nov 2021 07:15:16 -0500
Received: from bhuna.collabora.co.uk ([46.235.227.227]:42590 "EHLO
        bhuna.collabora.co.uk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232715AbhKWMPQ (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 23 Nov 2021 07:15:16 -0500
Received: from [127.0.0.1] (localhost [127.0.0.1])
        (Authenticated sender: andrzej.p)
        with ESMTPSA id 7417D1F44A0C
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=collabora.com; s=mail;
        t=1637669527; bh=Or79jjqBJNUaiCRZxQgJN0tuqh1QPWbrzNTllPwYxK0=;
        h=Subject:To:Cc:References:From:Date:In-Reply-To:From;
        b=eOE8eITmaFRDfFbJ9YCUOMGM8nQNHNBRlrqI5pjrhIONU3l8YUKGECP6xfhbP98cC
         MBM/AyzocnoJ054c5kt39t9hbugIxUENfvLFlHVcboHZ7kb/FwzA1Sbdalb4RvVdNP
         w1VGhHgQg/B7QFS+5bnTcJqWlDjHsZ4nYUETZ/GScV7fg6AGJt9sU5OFwKgdHZpX77
         QG7NFZ+BLxBc9Vjhl1+nSOHce8j02LtST6EpqKbuanUKKJaOBdn+YGIUWJXL+JpQJ4
         5lFlTaBFSU1pMEupZgrI8/LhyDo99CcbJjVXW3QeAHQJNjyilPqFGi+KfTdzGoSS7x
         MOHqwVD9QacQQ==
Subject: Re: [PATCH 4/7] media: hantro: move postproc enablement for old cores
To:     Jernej Skrabec <jernej.skrabec@gmail.com>,
        linux-media@vger.kernel.org
Cc:     ezequiel@vanguardiasur.com.ar, nicolas.dufresne@collabora.com,
        mchehab@kernel.org, robh+dt@kernel.org, mripard@kernel.org,
        wens@csie.org, p.zabel@pengutronix.de, gregkh@linuxfoundation.org,
        devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-sunxi@lists.linux.dev, linux-kernel@vger.kernel.org,
        linux-staging@lists.linux.dev
References: <20211122184702.768341-1-jernej.skrabec@gmail.com>
 <20211122184702.768341-5-jernej.skrabec@gmail.com>
From:   Andrzej Pietrasiewicz <andrzej.p@collabora.com>
Message-ID: <df868233-552f-ecc3-29e1-4a3a4761cf31@collabora.com>
Date:   Tue, 23 Nov 2021 13:12:04 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
MIME-Version: 1.0
In-Reply-To: <20211122184702.768341-5-jernej.skrabec@gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Jernej,

W dniu 22.11.2021 o 19:46, Jernej Skrabec pisze:
> Older G2 cores, like that in Allwinner H6, seem to have issue with
> latching postproc register values if this is first thing done in job.
> Moving that to the end solves the issue.
> 
> Signed-off-by: Jernej Skrabec <jernej.skrabec@gmail.com>
> ---
>   drivers/staging/media/hantro/hantro_drv.c | 9 ++++++++-
>   1 file changed, 8 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/staging/media/hantro/hantro_drv.c b/drivers/staging/media/hantro/hantro_drv.c
> index 8c3de31f51b3..530994ab3024 100644
> --- a/drivers/staging/media/hantro/hantro_drv.c
> +++ b/drivers/staging/media/hantro/hantro_drv.c
> @@ -130,7 +130,7 @@ void hantro_start_prepare_run(struct hantro_ctx *ctx)
>   	v4l2_ctrl_request_setup(src_buf->vb2_buf.req_obj.req,
>   				&ctx->ctrl_handler);
>   
> -	if (!ctx->is_encoder) {
> +	if (!ctx->is_encoder && !ctx->dev->variant->legacy_regs) {
>   		if (hantro_needs_postproc(ctx, ctx->vpu_dst_fmt))
>   			hantro_postproc_enable(ctx);
>   		else
> @@ -142,6 +142,13 @@ void hantro_end_prepare_run(struct hantro_ctx *ctx)
>   {
>   	struct vb2_v4l2_buffer *src_buf;
>   
> +	if (ctx->dev->variant->legacy_regs && !ctx->is_encoder) {

My personal preference would be to alter the order to match what is
in hantro_start_prepare_run(), and add a comment:

+       /*
+        * Older G2 cores, like that in Allwinner H6, seem to have issue with
+	 * latching postproc register values if this is first thing done in job.
+	 * Moving that to the end solves the issue.
+	 */
+	if (!ctx->is_encoder && ctx->dev->variant->legacy_regs) {

With that changed,

Reviewed-by: Andrzej Pietrasiewicz <andrzej.p@collabora.com>

> +		if (hantro_needs_postproc(ctx, ctx->vpu_dst_fmt))
> +			hantro_postproc_enable(ctx);
> +		else
> +			hantro_postproc_disable(ctx);
> +	}
> +
>   	src_buf = hantro_get_src_buf(ctx);
>   	v4l2_ctrl_request_complete(src_buf->vb2_buf.req_obj.req,
>   				   &ctx->ctrl_handler);
> 

