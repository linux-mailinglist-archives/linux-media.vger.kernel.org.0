Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 85B303F4362
	for <lists+linux-media@lfdr.de>; Mon, 23 Aug 2021 04:17:17 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234745AbhHWCR6 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sun, 22 Aug 2021 22:17:58 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60718 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234692AbhHWCR5 (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Sun, 22 Aug 2021 22:17:57 -0400
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [IPv6:2001:4b98:dc2:55:216:3eff:fef7:d647])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2A0E1C061575;
        Sun, 22 Aug 2021 19:17:16 -0700 (PDT)
Received: from pendragon.ideasonboard.com (62-78-145-57.bb.dnainternet.fi [62.78.145.57])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 837982A5;
        Mon, 23 Aug 2021 04:17:14 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1629685034;
        bh=5l2PjtP4ajDWlSQ+f9RgtGQbyfNtzB/hZqG6lGNcVJU=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=O1nj9VCwwPbQ51A7RYGPB+I+99zmvUT0FQOFPtYHSe1guPVflrfghBfslk/QjyN4S
         xkd1JB/3loTadaYV/LHST1qsUZoKBHma1Atu0rBPdj68KKOjWvnj6CDlVpYTLBa+j2
         iIF72oGXWNCR5HCLM1U3gkONx2EN++Jdk2ABnwNs=
Date:   Mon, 23 Aug 2021 05:17:05 +0300
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     Jacopo Mondi <jacopo+renesas@jmondi.org>
Cc:     Mauro Carvalho Chehab <mchehab@kernel.org>,
        Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>,
        Niklas =?utf-8?Q?S=C3=B6derlund?= 
        <niklas.soderlund+renesas@ragnatech.se>,
        Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        Sakari Ailus <sakari.ailus@iki.fi>,
        Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>,
        Thomas NIZAN <tnizan@witekio.com>,
        linux-renesas-soc@vger.kernel.org, linux-media@vger.kernel.org
Subject: Re: [RFC 4/5] media: i2c: max9286: Fetch PIXEL_RATE in s_stream
Message-ID: <YSMFIfNSDvuiZWPh@pendragon.ideasonboard.com>
References: <20210817072703.1167-1-jacopo+renesas@jmondi.org>
 <20210817072703.1167-5-jacopo+renesas@jmondi.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20210817072703.1167-5-jacopo+renesas@jmondi.org>
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Jacopo,

Thank you for the patch.

On Tue, Aug 17, 2021 at 09:27:02AM +0200, Jacopo Mondi wrote:
> The max9286 driver needs to fetch the remote serializer PIXEL_RATE
> control value in order to compute its own one, as the sum of the

s/its own one/its own/ (or its own pixel rate)

> values reported by the connected subdevices.
> 
> Currently the control is verified to be present at notifier's bound
> time, which requires the serializer driver to register the control at
> probe time. As the serializer driver might need to register the control
> later, by adding the control handler of its connected sensor, post-pone
> the max9286 check for the control availability at start stream time.
> 
> Signed-off-by: Jacopo Mondi <jacopo+renesas@jmondi.org>
> ---
>  drivers/media/i2c/max9286.c | 6 +++++-
>  1 file changed, 5 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/media/i2c/max9286.c b/drivers/media/i2c/max9286.c
> index 1b92d18a1f94..98fc90339a9e 100644
> --- a/drivers/media/i2c/max9286.c
> +++ b/drivers/media/i2c/max9286.c
> @@ -595,7 +595,7 @@ static int max9286_notify_bound(struct v4l2_async_notifier *notifier,
>  	max9286_check_config_link(priv, priv->source_mask);
>  	max9286_configure_i2c(priv, false);
>  
> -	return max9286_set_pixelrate(priv);
> +	return 0;
>  }
>  
>  static void max9286_notify_unbind(struct v4l2_async_notifier *notifier,
> @@ -674,6 +674,10 @@ static int max9286_s_stream(struct v4l2_subdev *sd, int enable)
>  	int ret;
>  
>  	if (enable) {
> +		ret = max9286_set_pixelrate(priv);
> +		if (ret)
> +			return ret;

That's very likely not going to work. The CSI-2 receiver connected to
the max9286 will need to know the pixel rate as part of its
initialization sequence, before calling .s_stream(1) on the max9286.

> +
>  		/*
>  		 * The frame sync between cameras is transmitted across the
>  		 * reverse channel as GPIO. We must open all channels while

-- 
Regards,

Laurent Pinchart
