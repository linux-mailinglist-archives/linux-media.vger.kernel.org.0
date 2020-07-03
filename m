Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 9A4C821320F
	for <lists+linux-media@lfdr.de>; Fri,  3 Jul 2020 05:14:51 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726035AbgGCDOr (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 2 Jul 2020 23:14:47 -0400
Received: from bhuna.collabora.co.uk ([46.235.227.227]:37632 "EHLO
        bhuna.collabora.co.uk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725915AbgGCDOq (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Thu, 2 Jul 2020 23:14:46 -0400
Received: from [127.0.0.1] (localhost [127.0.0.1])
        (Authenticated sender: ezequiel)
        with ESMTPSA id 4E34E2A054D
Message-ID: <67a130a8fd8874c5dc639c924de959f88357b480.camel@collabora.com>
Subject: Re: [PATCH 8/9] media: rkvdec: Add validate_fmt ops for pixelformat
 validation
From:   Ezequiel Garcia <ezequiel@collabora.com>
To:     Jonas Karlman <jonas@kwiboo.se>, linux-media@vger.kernel.org,
        linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org
Cc:     Hans Verkuil <hans.verkuil@cisco.com>,
        Nicolas Dufresne <nicolas.dufresne@collabora.com>,
        Tomasz Figa <tfiga@chromium.org>,
        Alexandre Courbot <acourbot@chromium.org>
Date:   Fri, 03 Jul 2020 00:14:36 -0300
In-Reply-To: <20200701215616.30874-9-jonas@kwiboo.se>
References: <20200701215616.30874-1-jonas@kwiboo.se>
         <20200701215616.30874-9-jonas@kwiboo.se>
Organization: Collabora
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.36.0-1 
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Jonas,

Thanks for working on this.

On Wed, 2020-07-01 at 21:56 +0000, Jonas Karlman wrote:
> Add an optional validate_fmt operation that is used to validate the
> pixelformat of CAPTURE buffers.
> 
> This is used in next patch to ensure correct pixelformat is used for 10-bit
> and 4:2:2 content.
> 
> Signed-off-by: Jonas Karlman <jonas@kwiboo.se>
> ---
>  drivers/staging/media/rkvdec/rkvdec.c | 8 ++++++++
>  drivers/staging/media/rkvdec/rkvdec.h | 1 +
>  2 files changed, 9 insertions(+)
> 
> diff --git a/drivers/staging/media/rkvdec/rkvdec.c b/drivers/staging/media/rkvdec/rkvdec.c
> index b1de55aa6535..465444c58f13 100644
> --- a/drivers/staging/media/rkvdec/rkvdec.c
> +++ b/drivers/staging/media/rkvdec/rkvdec.c
> @@ -239,6 +239,14 @@ static int rkvdec_try_capture_fmt(struct file *file, void *priv,
>  	if (WARN_ON(!coded_desc))
>  		return -EINVAL;
>  
> +	if (coded_desc->ops->validate_fmt) {
> +		int ret;
> +
> +		ret = coded_desc->ops->validate_fmt(ctx, pix_mp->pixelformat);
> +		if (ret)
> +			return ret;
> +	}
> + 

I don't think this approach will be enough. Unless I'm mistaken,
it's perfectly legal as per the stateless spec to first
call S_FMT on the OUTPUT queue (which is propagated to the CAPTURE side),
and then set the SPS and other controls.

The application is not required to do a TRY_FMT after S_EXT_CTRLS.

What I believe is needed is for the S_EXT_CTRLS to modify
and restrict the CAPTURE format accordingly, so the application
gets the correct format on G_FMT (and restrict future TRY_FMT).

Also, V4L2 spec asks drivers not to fail on S_FMT
format mismatch, but instead to adjust and return a legal format
back to the application [1].

Let me know what you think and thanks again.

Ezequiel

[1] Documentation/userspace-api/media/v4l/vidioc-g-fmt.rst

>  	for (i = 0; i < coded_desc->num_decoded_fmts; i++) {
>  		if (coded_desc->decoded_fmts[i] == pix_mp->pixelformat)
>  			break;
> diff --git a/drivers/staging/media/rkvdec/rkvdec.h b/drivers/staging/media/rkvdec/rkvdec.h
> index 2fc9f46b6910..be4fc3645cde 100644
> --- a/drivers/staging/media/rkvdec/rkvdec.h
> +++ b/drivers/staging/media/rkvdec/rkvdec.h
> @@ -64,6 +64,7 @@ vb2_to_rkvdec_decoded_buf(struct vb2_buffer *buf)
>  struct rkvdec_coded_fmt_ops {
>  	int (*adjust_fmt)(struct rkvdec_ctx *ctx,
>  			  struct v4l2_format *f);
> +	int (*validate_fmt)(struct rkvdec_ctx *ctx, u32 pixelformat);
>  	int (*start)(struct rkvdec_ctx *ctx);
>  	void (*stop)(struct rkvdec_ctx *ctx);
>  	int (*run)(struct rkvdec_ctx *ctx);


