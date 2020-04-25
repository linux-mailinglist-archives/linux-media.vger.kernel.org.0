Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E64461B86DD
	for <lists+linux-media@lfdr.de>; Sat, 25 Apr 2020 15:47:17 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726128AbgDYNrB (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sat, 25 Apr 2020 09:47:01 -0400
Received: from bhuna.collabora.co.uk ([46.235.227.227]:50032 "EHLO
        bhuna.collabora.co.uk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726087AbgDYNrB (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Sat, 25 Apr 2020 09:47:01 -0400
Received: from [127.0.0.1] (localhost [127.0.0.1])
        (Authenticated sender: ezequiel)
        with ESMTPSA id 6EA352A227C
Message-ID: <c49a060e7f5da9564e375fdd47117d3f901e5d00.camel@collabora.com>
Subject: Re: [PATCH v2 4/4] media: rockchip: rga: Only set output CSC mode
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
        justin.swartz@risingedge.co.za, Johan Jonker <jbx6244@gmail.com>,
        Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date:   Sat, 25 Apr 2020 10:46:47 -0300
In-Reply-To: <20200423200937.1039257-5-paul.kocialkowski@bootlin.com>
References: <20200423200937.1039257-1-paul.kocialkowski@bootlin.com>
         <20200423200937.1039257-5-paul.kocialkowski@bootlin.com>
Organization: Collabora
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.36.0-1 
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Paul,

Thanks a lot for the patch.

I haven't had the chance to test this,
but I'd say you are fixing a long time issue here.

I really appreciate that.

On Thu, 2020-04-23 at 22:09 +0200, Paul Kocialkowski wrote:
> Setting the output CSC mode is required for a YUV output, but must not
> be set when the input is also YUV. Doing this (as tested with a YUV420P
> to YUV420P conversion) results in wrong colors.
> 
> Adapt the logic to only set the CSC mode when the output is YUV and the
> input is RGB.
> 
> Fixes: f7e7b48e6d79 ("[media] rockchip/rga: v4l2 m2m support")
> Signed-off-by: Paul Kocialkowski <paul.kocialkowski@bootlin.com>
> ---
>  drivers/media/platform/rockchip/rga/rga-hw.c | 18 +++++++++++-------
>  1 file changed, 11 insertions(+), 7 deletions(-)
> 
> diff --git a/drivers/media/platform/rockchip/rga/rga-hw.c b/drivers/media/platform/rockchip/rga/rga-hw.c
> index 4be6dcf292ff..cbffcf986ccf 100644
> --- a/drivers/media/platform/rockchip/rga/rga-hw.c
> +++ b/drivers/media/platform/rockchip/rga/rga-hw.c
> @@ -216,13 +216,17 @@ static void rga_cmd_set_trans_info(struct rga_ctx *ctx)
>  	}
>  
>  	if (ctx->out.fmt->hw_format >= RGA_COLOR_FMT_YUV422SP) {

Since we are already here touching this code, would you mind
adding another patch, to do some cleaning first?

First, replace the nested ifs with a boolean operator.
Then, introduce some IS_YUV (or IS_RGB) macro, making the above test
more like IS_YUV(out_hw_format).

Finally, perhaps a comment along the lines of your commit message:

"""
Setting the output CSC mode is required for a YUV output,
but must not be set when the input is also YUV.
"""

Details up to you :-)

After the clean-up patch, which would be just cosmetics,
your fix should be cleaner and more clear.

Thanks,
Ezequiel
 
> -		switch (ctx->out.colorspace) {
> -		case V4L2_COLORSPACE_REC709:
> -			dst_info.data.csc_mode = RGA_SRC_CSC_MODE_BT709_R0;
> -			break;
> -		default:
> -			dst_info.data.csc_mode = RGA_DST_CSC_MODE_BT601_R0;
> -			break;
> +		if (ctx->in.fmt->hw_format < RGA_COLOR_FMT_YUV422SP) {
> +			switch (ctx->out.colorspace) {
> +			case V4L2_COLORSPACE_REC709:
> +				dst_info.data.csc_mode =
> +					RGA_SRC_CSC_MODE_BT709_R0;
> +				break;
> +			default:
> +				dst_info.data.csc_mode =
> +					RGA_DST_CSC_MODE_BT601_R0;
> +				break;
> +			}
>  		}
>  	}
>  


