Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 039471D9171
	for <lists+linux-media@lfdr.de>; Tue, 19 May 2020 09:52:49 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728668AbgESHwq (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 19 May 2020 03:52:46 -0400
Received: from relay4-d.mail.gandi.net ([217.70.183.196]:32973 "EHLO
        relay4-d.mail.gandi.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727057AbgESHwq (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 19 May 2020 03:52:46 -0400
X-Originating-IP: 93.34.118.233
Received: from uno.localdomain (93-34-118-233.ip49.fastwebnet.it [93.34.118.233])
        (Authenticated sender: jacopo@jmondi.org)
        by relay4-d.mail.gandi.net (Postfix) with ESMTPSA id 948E1E0003;
        Tue, 19 May 2020 07:52:43 +0000 (UTC)
Date:   Tue, 19 May 2020 09:56:01 +0200
From:   Jacopo Mondi <jacopo@jmondi.org>
To:     Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>
Cc:     sakari.ailus@iki.fi, linux-media@vger.kernel.org,
        linux-renesas-soc@vger.kernel.org
Subject: Re: [PATCH] fixes! [max9286]: Validate link formats
Message-ID: <20200519075601.wdykflbxgvqvfl3x@uno.localdomain>
References: <e898b72f-f793-6c0d-27a8-5a34c61f763e@ideasonboard.com>
 <20200518161159.2185855-1-kieran.bingham+renesas@ideasonboard.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20200518161159.2185855-1-kieran.bingham+renesas@ideasonboard.com>
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Kieran,

On Mon, May 18, 2020 at 05:11:59PM +0100, Kieran Bingham wrote:
> Disallow setting a format on the source link, but enable link validation
> by returning the format of the first bound source when getting the
> format of the source pad.
>
> Signed-off-by: Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>
> ---
>  drivers/media/i2c/max9286.c | 17 +++++++++++++----
>  1 file changed, 13 insertions(+), 4 deletions(-)
>
> diff --git a/drivers/media/i2c/max9286.c b/drivers/media/i2c/max9286.c
> index ef824d2b26b8..6c01595936d7 100644
> --- a/drivers/media/i2c/max9286.c
> +++ b/drivers/media/i2c/max9286.c
> @@ -711,7 +711,10 @@ static int max9286_set_fmt(struct v4l2_subdev *sd,
>  	struct max9286_priv *priv = sd_to_max9286(sd);
>  	struct v4l2_mbus_framefmt *cfg_fmt;
>
> -	if (format->pad >= MAX9286_SRC_PAD)
> +	/* \todo: Multiplexed streams support

I know where \todo comes from, but it's usually TODO.
Also
        /*
         * TODO:

if the comment is multiline

> +	 * Prevent setting the format on the shared multiplexed bus.
> +	 */
> +	if (format->pad == MAX9286_SRC_PAD)
>  		return -EINVAL;
>
>  	/* Refuse non YUV422 formats as we hardcode DT to 8 bit YUV422 */
> @@ -743,11 +746,17 @@ static int max9286_get_fmt(struct v4l2_subdev *sd,
>  {
>  	struct max9286_priv *priv = sd_to_max9286(sd);
>  	struct v4l2_mbus_framefmt *cfg_fmt;
> +	unsigned int pad = format->pad;
>
> -	if (format->pad >= MAX9286_SRC_PAD)
> -		return -EINVAL;
> +	/* \todo: Multiplexed Stream Support
> +	 * Support link validation by returning the format of the first bound
> +	 * link. All links must have the same format, as we do not support
> +	 * mixing, and matching of cameras connected to the max9286.
> +	 */
> +	if (format->pad == MAX9286_SRC_PAD)

You can use pad

> +		pad = ffs(priv->bound_sources);
>
> -	cfg_fmt = max9286_get_pad_format(priv, cfg, format->pad, format->which);
> +	cfg_fmt = max9286_get_pad_format(priv, cfg, pad, format->which);

Or you could add one entry to struct max9286_priv.fmt for the source
pad format, set the format there when is set on one sink, and just
drop the check on the pad index in get_fmt. Up to you.

Please squash in v10

Thanks
  j

>  	if (!cfg_fmt)
>  		return -EINVAL;
>
> --
> 2.25.1
>
