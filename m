Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 5DEB83A5E99
	for <lists+linux-media@lfdr.de>; Mon, 14 Jun 2021 10:51:38 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232627AbhFNIxj (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 14 Jun 2021 04:53:39 -0400
Received: from lb2-smtp-cloud8.xs4all.net ([194.109.24.25]:47307 "EHLO
        lb2-smtp-cloud8.xs4all.net" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S232528AbhFNIxd (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 14 Jun 2021 04:53:33 -0400
Received: from cust-b5b5937f ([IPv6:fc0c:c16d:66b8:757f:c639:739b:9d66:799d])
        by smtp-cloud8.xs4all.net with ESMTPA
        id siJZlb5ZFhqltsiJclm6MC; Mon, 14 Jun 2021 10:51:29 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=xs4all.nl; s=s2;
        t=1623660689; bh=+H5uVlIFNhykOXsC5lcJztNlsLEis8cXwhsHsGpQVBM=;
        h=Subject:To:From:Message-ID:Date:MIME-Version:Content-Type:From:
         Subject;
        b=sRWKwmvG7ZZx4G6NyEPJevdP1zfXTscMM7a4uRE+d/MCRRN86ZQ+x4DIHbV02Hi4E
         6CQyLeAMR+m2mV6BMycQ8ILSRnZzcGGS5zLBGO3+e5j6rNpvlDQj/PeyX9a28wYFQh
         Ngo33I2mplQYkdcAyBj6ymkYbmoVxYsbZKlPWnKCSgTp76NEEncV1PuPNcC94UaTZE
         W9lpluwB8grgWx4PlKqYCR2eivijqJr87Qbm2+NQ4pQPMQMSCjU8mpkRmp7zD/rYPb
         GEVgoqozWA+YLbxRj8Rn6s2j/8etlNPnS0S7aQHiqe1CdyXg/OA1K8oDSARQVsU1Z8
         VPw516I7GDJ4w==
Subject: Re: [PATCH v4 16/17] media: v4l2-subdev: De-deprecate init() subdev
 op
To:     Jacopo Mondi <jacopo+renesas@jmondi.org>,
        kieran.bingham+renesas@ideasonboard.com,
        laurent.pinchart+renesas@ideasonboard.com,
        niklas.soderlund+renesas@ragnatech.se, geert@linux-m68k.org
Cc:     Mauro Carvalho Chehab <mchehab@kernel.org>,
        linux-media@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
        linux-kernel@vger.kernel.org, Sakari Ailus <sakari.ailus@iki.fi>
References: <20210412093451.14198-1-jacopo+renesas@jmondi.org>
 <20210412093451.14198-17-jacopo+renesas@jmondi.org>
From:   Hans Verkuil <hverkuil-cisco@xs4all.nl>
Message-ID: <2ad9747e-7e2d-2c95-a98b-b6b0e7534e42@xs4all.nl>
Date:   Mon, 14 Jun 2021 10:51:25 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Firefox/78.0 Thunderbird/78.10.0
MIME-Version: 1.0
In-Reply-To: <20210412093451.14198-17-jacopo+renesas@jmondi.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-CMAE-Envelope: MS4xfDfU7v0cY3T1PcpmbPx7u+dbBQhnVFqgDAD4lNxgvusljxV1IJzKzzfP6uPRjP4bj56HYOVI/AZr1LVqx7B1CLPMIco6RqR+RIFUYj7O91ClS40crQId
 f5GXfMGqoGUUwZLUp0ZyDWW4WPX9Dwi7sKQojH2zkCeAhQt8SgqyyswISQsm3leiQycwjU3GffX8NnMOEaWfswJF5VRP5dJXRYI7zAF+EHKTgG7qOhFgMpxy
 gp+LthCsmoSFmWkis3HRQ7Ku/qX1/aNCUn79R9ib6kPqpqJkJ8oY9FfZLfSnt0riOWClJ8k+iH/DfsNqx8U3dMuhdkHUm2Y3Q27LFLjyX7VP0CM8RVfzTEhK
 EWrmL3cmODtFMq/4HYqD/Z1HjtMnnV1rBa8H3m+MIIpf7l+hsXzWaCcsUDFDKBthARYevL86ifMDq+tf5KH7ZGF6wBddJ20FOaK4twD2Rj8YzgdKZ8L9F8L7
 nNVM5JvX+dqpq3t22Jh9ZMIfSmPzW9gh1t7E6BIsYLSaGI9Xl6wNAwZ6N22wgZ43z6Qwc4nI5ZqjdRWYd2jkuKbwJLC2h/JeujfmRqi14+U6pUUZPLRbziwL
 xeMVxGhs2vAaWLRTRTxKV/v+
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On 12/04/2021 11:34, Jacopo Mondi wrote:
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

I don't like de-deprecating init. It was deprecated for a good reason, and
I'd like to keep it that way.

There are two alternatives: one is a bit quick-and-dirty, the other is a hint
towards a more generic solution (just a hint since it will require more research):

1) Quick-and-dirty: use the core callback op to create a custom INIT callback.
This depends on this patch:

https://patchwork.linuxtv.org/project/linux-media/patch/20210610214305.4170835-8-arnd@kernel.org/

This will make it clear to the reader that this is a highly specific interaction
between two drivers that are tightly coupled. It works in the current situation,
but not if we want to make this more generic.

2) Subdev drivers can implement the registered() op which is called by
v4l2_device_register_subdev(). This in turn is called from v4l2_async_match_notify().

What you want is that when max9286 calls v4l2_async_subdev_notifier_register, it
can set a flag or something indicating that initialization has to be postponed.
Then, when v4l2_async_match_notify() calls the register() callback, that flag can
be read. If false, then the register() callback will initialize the device, if
true then that won't happen. Instead, it will do that when the max9286 calls a
post_register() callback.

This is a lot more work (and research, since this is just a brainstorm from my
side), but it is a way towards making this a generic solution.

Regards,

	Hans

>   *
>   * @load_fw: load firmware.
>   *
> --
> 2.31.1
> 

