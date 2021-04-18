Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 99B8736357F
	for <lists+linux-media@lfdr.de>; Sun, 18 Apr 2021 15:24:54 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229848AbhDRNZV (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sun, 18 Apr 2021 09:25:21 -0400
Received: from perceval.ideasonboard.com ([213.167.242.64]:59452 "EHLO
        perceval.ideasonboard.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229671AbhDRNZV (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Sun, 18 Apr 2021 09:25:21 -0400
Received: from pendragon.ideasonboard.com (62-78-145-57.bb.dnainternet.fi [62.78.145.57])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 1FBEB499;
        Sun, 18 Apr 2021 15:24:52 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1618752292;
        bh=Zjgp5eTD2ut4yli/YqCuJMeWMcZdSZYKoz4Ht3lspBQ=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=EcU2DgvUysUCMDX7p83oJrzcN0cbYivWRc2pMXUNmTkKn7N6TPm4g9PgfzYDNSuGD
         HjXDGy0z7bjPX7khNZTYFKreIwroYjmBOrYv4zCsftt/lM6i1UQHCYYFT2KFh40z8c
         Co8iYJQoOk4oqWg/Lp4JNqmuzFHt9/iQEvcAzcYc=
Date:   Sun, 18 Apr 2021 16:24:48 +0300
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
Cc:     Benoit Parrot <bparrot@ti.com>, Pratyush Yadav <p.yadav@ti.com>,
        Lokesh Vutla <lokeshvutla@ti.com>, linux-media@vger.kernel.org
Subject: Re: [PATCH 27/28] media: ti-vpe: cal: remove cal_camerarx->fmtinfo
Message-ID: <YHwzIJO0zwUtIVej@pendragon.ideasonboard.com>
References: <20210412113457.328012-1-tomi.valkeinen@ideasonboard.com>
 <20210412113457.328012-28-tomi.valkeinen@ideasonboard.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20210412113457.328012-28-tomi.valkeinen@ideasonboard.com>
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Tomi,

Thank you for the patch.

On Mon, Apr 12, 2021 at 02:34:56PM +0300, Tomi Valkeinen wrote:
> struct cal_camerarx has fmtinfo field which is used to point to the
> current active input format. The only place where the field is used is
> cal_camerarx_get_ext_link_freq().
> 
> With multiple streams the whole concept of single input format is not
> valid anymore, so lets remove the field by looking up the format in
> cal_camerarx_get_ext_link_freq(), making it easier to handle the
> multistream-case in the following patches.
> 
> Signed-off-by: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
> ---
>  drivers/media/platform/ti-vpe/cal-camerarx.c | 12 ++++++++----
>  drivers/media/platform/ti-vpe/cal.h          |  1 -
>  2 files changed, 8 insertions(+), 5 deletions(-)
> 
> diff --git a/drivers/media/platform/ti-vpe/cal-camerarx.c b/drivers/media/platform/ti-vpe/cal-camerarx.c
> index 25f4692d210e..efe6513d69e8 100644
> --- a/drivers/media/platform/ti-vpe/cal-camerarx.c
> +++ b/drivers/media/platform/ti-vpe/cal-camerarx.c
> @@ -49,8 +49,15 @@ static s64 cal_camerarx_get_ext_link_freq(struct cal_camerarx *phy)
>  {
>  	struct v4l2_fwnode_bus_mipi_csi2 *mipi_csi2 = &phy->endpoint.bus.mipi_csi2;
>  	u32 num_lanes = mipi_csi2->num_data_lanes;
> -	u32 bpp = phy->fmtinfo->bpp;
> +	u32 bpp;
>  	s64 freq;
> +	const struct cal_format_info *fmtinfo;

I'd declare this after num_lanes as I like the reverse xmas tree order.

> +
> +	fmtinfo = cal_format_by_code(phy->formats[CAL_CAMERARX_PAD_SINK].code);
> +	if (!fmtinfo)
> +		return -EINVAL;
> +
> +	bpp = fmtinfo->bpp;

I wonder if we'll end up dropping this, as falling back to
V4L2_CID_PIXEL_RATE in v4l2_get_link_freq() makes less sense when using
multiplexed streams. Something to worry about later.

Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>

>  
>  	freq = v4l2_get_link_freq(phy->source->ctrl_handler, bpp, 2 * num_lanes);
>  	if (freq < 0) {
> @@ -723,9 +730,6 @@ static int cal_camerarx_sd_set_fmt(struct v4l2_subdev *sd,
>  					  format->which);
>  	*fmt = format->format;
>  
> -	if (format->which == V4L2_SUBDEV_FORMAT_ACTIVE)
> -		phy->fmtinfo = fmtinfo;
> -
>  	return 0;
>  }
>  
> diff --git a/drivers/media/platform/ti-vpe/cal.h b/drivers/media/platform/ti-vpe/cal.h
> index c941d2aec79f..7f35ad5ceac2 100644
> --- a/drivers/media/platform/ti-vpe/cal.h
> +++ b/drivers/media/platform/ti-vpe/cal.h
> @@ -163,7 +163,6 @@ struct cal_camerarx {
>  	struct v4l2_subdev	subdev;
>  	struct media_pad	pads[2];
>  	struct v4l2_mbus_framefmt	formats[2];
> -	const struct cal_format_info	*fmtinfo;
>  };
>  
>  struct cal_dev {

-- 
Regards,

Laurent Pinchart
