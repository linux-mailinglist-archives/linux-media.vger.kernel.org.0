Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 46CD13A5DBB
	for <lists+linux-media@lfdr.de>; Mon, 14 Jun 2021 09:33:42 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232536AbhFNHfn (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 14 Jun 2021 03:35:43 -0400
Received: from relay8-d.mail.gandi.net ([217.70.183.201]:59627 "EHLO
        relay8-d.mail.gandi.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232424AbhFNHfm (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 14 Jun 2021 03:35:42 -0400
Received: (Authenticated sender: jacopo@jmondi.org)
        by relay8-d.mail.gandi.net (Postfix) with ESMTPSA id 116541BF20D;
        Mon, 14 Jun 2021 07:33:34 +0000 (UTC)
Date:   Mon, 14 Jun 2021 09:34:25 +0200
From:   Jacopo Mondi <jacopo@jmondi.org>
To:     Jacopo Mondi <jacopo+renesas@jmondi.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Sakari Ailus <sakari.ailus@iki.fi>,
        Hans Verkuil <hverkuil-cisco@xs4all.nl>
Cc:     kieran.bingham+renesas@ideasonboard.com,
        laurent.pinchart+renesas@ideasonboard.com,
        niklas.soderlund+renesas@ragnatech.se, geert@linux-m68k.org,
        linux-media@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH v4 16/17] media: v4l2-subdev: De-deprecate init() subdev
 op
Message-ID: <20210614073425.p4dlkx5tv5pddogo@uno.localdomain>
References: <20210412093451.14198-1-jacopo+renesas@jmondi.org>
 <20210412093451.14198-17-jacopo+renesas@jmondi.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20210412093451.14198-17-jacopo+renesas@jmondi.org>
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hello linux-media,

On Mon, Apr 12, 2021 at 11:34:50AM +0200, Jacopo Mondi wrote:
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

This change is key for the whole series to get in, and requires the
approval of linux-media maintainers as it use a function now deemed as
deprecated.

Could I get an ack/nack please ?

Thanks
   j

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
> --
> 2.31.1
>
