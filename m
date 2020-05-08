Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 931E11CA1F6
	for <lists+linux-media@lfdr.de>; Fri,  8 May 2020 06:19:08 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725775AbgEHETD (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 8 May 2020 00:19:03 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37294 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725550AbgEHETD (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Fri, 8 May 2020 00:19:03 -0400
Received: from bhuna.collabora.co.uk (bhuna.collabora.co.uk [IPv6:2a00:1098:0:82:1000:25:2eeb:e3e3])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CD6E2C05BD43;
        Thu,  7 May 2020 21:19:02 -0700 (PDT)
Received: from [127.0.0.1] (localhost [127.0.0.1])
        (Authenticated sender: ezequiel)
        with ESMTPSA id B110A2A2D84
Message-ID: <d765f2ef6da5db7927d3718ceb43ab66f18686d3.camel@collabora.com>
Subject: Re: [PATCH v3 3/4] media: rockchip: rga: Introduce color fmt macros
 and refactor CSC mode logic
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
Date:   Fri, 08 May 2020 01:18:49 -0300
In-Reply-To: <20200430164245.1630174-4-paul.kocialkowski@bootlin.com>
References: <20200430164245.1630174-1-paul.kocialkowski@bootlin.com>
         <20200430164245.1630174-4-paul.kocialkowski@bootlin.com>
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
> This introduces two macros: RGA_COLOR_FMT_IS_YUV and RGA_COLOR_FMT_IS_RGB
> which allow quick checking of the colorspace familily of a RGA color format.
> 
> These macros are then used to refactor the logic for CSC mode selection.
> The two nested tests for input colorspace are simplified into a single one,
> with a logical and, making the whole more readable.
> 
> Signed-off-by: Paul Kocialkowski <paul.kocialkowski@bootlin.com>

Reviewed-by: Ezequiel Garcia <ezequiel@collabora.com>

Thanks a lot for the nice cleanup.

> ---
>  drivers/media/platform/rockchip/rga/rga-hw.c | 23 +++++++++-----------
>  drivers/media/platform/rockchip/rga/rga-hw.h |  5 +++++
>  2 files changed, 15 insertions(+), 13 deletions(-)
> 
> diff --git a/drivers/media/platform/rockchip/rga/rga-hw.c b/drivers/media/platform/rockchip/rga/rga-hw.c
> index 4be6dcf292ff..5607ee8d1917 100644
> --- a/drivers/media/platform/rockchip/rga/rga-hw.c
> +++ b/drivers/media/platform/rockchip/rga/rga-hw.c
> @@ -200,22 +200,19 @@ static void rga_cmd_set_trans_info(struct rga_ctx *ctx)
>  	dst_info.data.format = ctx->out.fmt->hw_format;
>  	dst_info.data.swap = ctx->out.fmt->color_swap;
>  
> -	if (ctx->in.fmt->hw_format >= RGA_COLOR_FMT_YUV422SP) {
> -		if (ctx->out.fmt->hw_format < RGA_COLOR_FMT_YUV422SP) {
> -			switch (ctx->in.colorspace) {
> -			case V4L2_COLORSPACE_REC709:
> -				src_info.data.csc_mode =
> -					RGA_SRC_CSC_MODE_BT709_R0;
> -				break;
> -			default:
> -				src_info.data.csc_mode =
> -					RGA_SRC_CSC_MODE_BT601_R0;
> -				break;
> -			}
> +	if (RGA_COLOR_FMT_IS_YUV(ctx->in.fmt->hw_format) &&
> +	    RGA_COLOR_FMT_IS_RGB(ctx->out.fmt->hw_format)) {
> +		switch (ctx->in.colorspace) {
> +		case V4L2_COLORSPACE_REC709:
> +			src_info.data.csc_mode = RGA_SRC_CSC_MODE_BT709_R0;
> +			break;
> +		default:
> +			src_info.data.csc_mode = RGA_SRC_CSC_MODE_BT601_R0;
> +			break;
>  		}
>  	}
>  
> -	if (ctx->out.fmt->hw_format >= RGA_COLOR_FMT_YUV422SP) {
> +	if (RGA_COLOR_FMT_IS_YUV(ctx->out.fmt->hw_format)) {
>  		switch (ctx->out.colorspace) {
>  		case V4L2_COLORSPACE_REC709:
>  			dst_info.data.csc_mode = RGA_SRC_CSC_MODE_BT709_R0;
> diff --git a/drivers/media/platform/rockchip/rga/rga-hw.h b/drivers/media/platform/rockchip/rga/rga-hw.h
> index 96cb0314dfa7..e8917e5630a4 100644
> --- a/drivers/media/platform/rockchip/rga/rga-hw.h
> +++ b/drivers/media/platform/rockchip/rga/rga-hw.h
> @@ -95,6 +95,11 @@
>  #define RGA_COLOR_FMT_CP_8BPP 15
>  #define RGA_COLOR_FMT_MASK 15
>  
> +#define RGA_COLOR_FMT_IS_YUV(fmt) \
> +	(((fmt) >= RGA_COLOR_FMT_YUV422SP) && ((fmt) < RGA_COLOR_FMT_CP_1BPP))
> +#define RGA_COLOR_FMT_IS_RGB(fmt) \
> +	((fmt) < RGA_COLOR_FMT_YUV422SP)
> +
>  #define RGA_COLOR_NONE_SWAP 0
>  #define RGA_COLOR_RB_SWAP 1
>  #define RGA_COLOR_ALPHA_SWAP 2


