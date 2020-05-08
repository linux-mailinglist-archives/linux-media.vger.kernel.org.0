Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 9EB3F1CA1FB
	for <lists+linux-media@lfdr.de>; Fri,  8 May 2020 06:19:41 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725971AbgEHETa (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 8 May 2020 00:19:30 -0400
Received: from bhuna.collabora.co.uk ([46.235.227.227]:45452 "EHLO
        bhuna.collabora.co.uk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725550AbgEHETa (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Fri, 8 May 2020 00:19:30 -0400
Received: from [127.0.0.1] (localhost [127.0.0.1])
        (Authenticated sender: ezequiel)
        with ESMTPSA id 936272A2D84
Message-ID: <96c35183ad7cde60afb8617e334b060e718ee532.camel@collabora.com>
Subject: Re: [PATCH v3 4/4] media: rockchip: rga: Only set output CSC mode
 for RGB input
From:   Ezequiel Garcia <ezequiel@collabora.com>
To:     Paul Kocialkowski <paul.kocialkowski@bootlin.com>,
        linux-media@vger.kernel.org, linux-rockchip@lists.infradead.org,
        devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-kernel@vger.kernel.org
Cc:     Mauro Carvalho Chehab <mchehab@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Heiko Stuebner <heiko@sntech.de>,
        Hans Verkuil <hansverk@cisco.com>,
        Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date:   Fri, 08 May 2020 01:19:17 -0300
In-Reply-To: <20200430164245.1630174-5-paul.kocialkowski@bootlin.com>
References: <20200430164245.1630174-1-paul.kocialkowski@bootlin.com>
         <20200430164245.1630174-5-paul.kocialkowski@bootlin.com>
Organization: Collabora
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.36.0-1 
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Thu, 2020-04-30 at 18:42 +0200, Paul Kocialkowski wrote:
> Setting the output CSC mode is required for a YUV output, but must not
> be set when the input is also YUV. Doing this (as tested with a YUV420P
> to YUV420P conversion) results in wrong colors.
> 
> Adapt the logic to only set the output CSC mode when the output is YUV and
> the input is RGB. Also add a comment to clarify the rationale.
> 
> Fixes: f7e7b48e6d79 ("[media] rockchip/rga: v4l2 m2m support")
> Signed-off-by: Paul Kocialkowski <paul.kocialkowski@bootlin.com>

Reviewed-by: Ezequiel Garcia <ezequiel@collabora.com>

Thanks!

> ---
>  drivers/media/platform/rockchip/rga/rga-hw.c | 8 +++++++-
>  1 file changed, 7 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/media/platform/rockchip/rga/rga-hw.c b/drivers/media/platform/rockchip/rga/rga-hw.c
> index 5607ee8d1917..aaa96f256356 100644
> --- a/drivers/media/platform/rockchip/rga/rga-hw.c
> +++ b/drivers/media/platform/rockchip/rga/rga-hw.c
> @@ -200,6 +200,11 @@ static void rga_cmd_set_trans_info(struct rga_ctx *ctx)
>  	dst_info.data.format = ctx->out.fmt->hw_format;
>  	dst_info.data.swap = ctx->out.fmt->color_swap;
>  
> +	/*
> +	 * CSC mode must only be set when the colorspace families differ between
> +	 * input and output. It must remain unset (zeroed) if both are the same.
> +	 */
> +
>  	if (RGA_COLOR_FMT_IS_YUV(ctx->in.fmt->hw_format) &&
>  	    RGA_COLOR_FMT_IS_RGB(ctx->out.fmt->hw_format)) {
>  		switch (ctx->in.colorspace) {
> @@ -212,7 +217,8 @@ static void rga_cmd_set_trans_info(struct rga_ctx *ctx)
>  		}
>  	}
>  
> -	if (RGA_COLOR_FMT_IS_YUV(ctx->out.fmt->hw_format)) {
> +	if (RGA_COLOR_FMT_IS_RGB(ctx->in.fmt->hw_format) &&
> +	    RGA_COLOR_FMT_IS_YUV(ctx->out.fmt->hw_format)) {
>  		switch (ctx->out.colorspace) {
>  		case V4L2_COLORSPACE_REC709:
>  			dst_info.data.csc_mode = RGA_SRC_CSC_MODE_BT709_R0;


