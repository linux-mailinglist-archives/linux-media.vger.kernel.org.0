Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 0A720342DE3
	for <lists+linux-media@lfdr.de>; Sat, 20 Mar 2021 16:43:46 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229875AbhCTPnN (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sat, 20 Mar 2021 11:43:13 -0400
Received: from perceval.ideasonboard.com ([213.167.242.64]:46806 "EHLO
        perceval.ideasonboard.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229791AbhCTPmz (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Sat, 20 Mar 2021 11:42:55 -0400
Received: from pendragon.ideasonboard.com (62-78-145-57.bb.dnainternet.fi [62.78.145.57])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 07EB98D3;
        Sat, 20 Mar 2021 16:42:51 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1616254972;
        bh=173LBmGmWR/M+VIJkThtB3MyheJPfVfgrWH8Pz618eQ=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=hoz6NGVDOvIC3yHD4GyFLSZ5eDfRsgNsx/Jqr8cX2ybyDfbGs+LTohNWsOI3Wr99P
         ffqnmHBZRWXiBxtiKzYC8jXq4nJLbq4jmcpVzOdFRgwrmOQV7r2yZSSRmce8ihn8Ji
         ifF8uRJgYciQfttNRPS+Jkce9qpPpQ02TuD01OqU=
Date:   Sat, 20 Mar 2021 17:42:12 +0200
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     Jacopo Mondi <jacopo+renesas@jmondi.org>
Cc:     kieran.bingham+renesas@ideasonboard.com,
        niklas.soderlund+renesas@ragnatech.se, geert@linux-m68k.org,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        linux-media@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
        linux-kernel@vger.kernel.org, Sakari Ailus <sakari.ailus@iki.fi>
Subject: Re: [PATCH v3 05/19] media: v4l2-subdev: De-deprecate init() subdev
 op
Message-ID: <YFYX1KHi74XPEWLi@pendragon.ideasonboard.com>
References: <20210319164148.199192-1-jacopo+renesas@jmondi.org>
 <20210319164148.199192-6-jacopo+renesas@jmondi.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20210319164148.199192-6-jacopo+renesas@jmondi.org>
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Jacopo,

Thank you for the patch.

CC'ing Sakari on v3 to get feedback.

On Fri, Mar 19, 2021 at 05:41:34PM +0100, Jacopo Mondi wrote:
> The init() subdev core operation is deemed to be deprecated for new
> subdevice drivers. However it could prove useful for complex
> architectures to defer operation that require access to the
> communication bus if said bus is not available (or fully configured)
> at the time when the subdevice probe() function is run.
> 
> As an example, the GMSL architecture requires the GMSL configuration
> link to be configured on the host side after the remote subdevice
> has completed its probe function. After the configuration on the host
> side has been performed, the subdevice registers can be accessed through
> the communication bus.
> 
> In particular:
> 
> 	HOST			REMOTE
> 
> 	probe()
> 	   |
> 	   ---------------------> |
> 				  probe() {
> 				     bus config()
> 				  }
> 	   |<--------------------|
> 	v4l2 async bound {
> 	    bus config()
> 	    call subdev init()
> 	   |-------------------->|
> 				 init() {
> 				     access register on the bus()
> 				}
> 	   |<-------------------
> 	}
> 
> In the GMSL use case the bus configuration requires the enablement of the
> noise immunity threshold on the remote side which ensures reliability
> of communications in electrically noisy environments. After the subdevice
> has enabled the threshold at the end of its probe() sequence the host
> side shall compensate it with an higher signal amplitude. Once this
> sequence has completed the bus can be accessed with noise protection
> enabled and all the operations that require a considerable number of
> transactions on the bus (such as the image sensor configuration
> sequence) are run in the subdevice init() operation implementation.
> 
> Signed-off-by: Jacopo Mondi <jacopo+renesas@jmondi.org>
> ---
>  include/media/v4l2-subdev.h | 15 ++++++++++++---
>  1 file changed, 12 insertions(+), 3 deletions(-)
> 
> diff --git a/include/media/v4l2-subdev.h b/include/media/v4l2-subdev.h
> index d0e9a5bdb08b..3068d9940669 100644
> --- a/include/media/v4l2-subdev.h
> +++ b/include/media/v4l2-subdev.h
> @@ -148,9 +148,18 @@ struct v4l2_subdev_io_pin_config {
>   *	each pin being configured.  This function could be called at times
>   *	other than just subdevice initialization.
>   *
> - * @init: initialize the sensor registers to some sort of reasonable default
> - *	values. Do not use for new drivers and should be removed in existing
> - *	drivers.
> + * @init: initialize the subdevice registers to some sort of reasonable default
> + *	values. Do not use for new drivers (and should be removed in existing
> + *	ones) for regular architectures where the image sensor is connected to
> + *	the host receiver. For more complex architectures where the subdevice
> + *	initialization should be deferred to the completion of the probe
> + *	sequence of some intermediate component, or the communication bus
> + *	requires configurations on the host side that depend on the completion
> + *	of the probe sequence of the remote subdevices, the usage of this
> + *	operation could be considered to allow the devices along the pipeline to
> + *	probe and register in the media graph and to defer any operation that
> + *	require actual access to the communication bus to their init() function
> + *	implementation.
>   *
>   * @load_fw: load firmware.
>   *

-- 
Regards,

Laurent Pinchart
