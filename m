Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 4C53822105A
	for <lists+linux-media@lfdr.de>; Wed, 15 Jul 2020 17:08:28 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728256AbgGOPIP (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 15 Jul 2020 11:08:15 -0400
Received: from lb2-smtp-cloud9.xs4all.net ([194.109.24.26]:40761 "EHLO
        lb2-smtp-cloud9.xs4all.net" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1726811AbgGOPIM (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 15 Jul 2020 11:08:12 -0400
Received: from cust-b5b5937f ([IPv6:fc0c:c16d:66b8:757f:c639:739b:9d66:799d])
        by smtp-cloud9.xs4all.net with ESMTPA
        id vj0wjiYitZ80Hvj0zjSMQx; Wed, 15 Jul 2020 17:08:10 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=xs4all.nl; s=s1;
        t=1594825690; bh=MfR0iIx1t6edsl5rVEscp8afq44kE2NLsJWD6g/5Exs=;
        h=Subject:To:From:Message-ID:Date:MIME-Version:Content-Type:From:
         Subject;
        b=ZgqQVlBJGN4DZzdOjaOyt51au2gcFOrMiMfzD47a2ePq+u/Y+C6CA0CIJ7lMNvPHi
         Rm9V/DL8auV07/CDjz+mMWT/YWwd3h3efzDMH+5eR8hRnR9fnQTscogcL7ZmeMzmui
         JHvyMS4YW0XmPZos/PXJ8VsCYgWvL/h+ozqCsnqYZVx+i3QXs6A50tqD1wviIpAQ+A
         kuHOa4QlXVqo55xTq35aqj7kaSPY8L5pZdQDpoNP4HySaa+gQHI7009x66A7GQSCnZ
         +iD82h7uiI2M85CJWIkPIyCZiKvqoXZUcBRWGjk7CdSURvP7OW/NfrZDNy0oFQpVm8
         bGU1qpI3u69Tw==
Subject: Re: [PATCH v6 1/9] media: v4l2-subdev: Introduce
 [get|set]_mbus_config pad ops
To:     Jacopo Mondi <jacopo+renesas@jmondi.org>, mchehab@kernel.org,
        sakari.ailus@linux.intel.com, laurent.pinchart@ideasonboard.com
Cc:     niklas.soderlund+renesas@ragnatech.se,
        kieran.bingham@ideasonboard.com, dave.stevenson@raspberrypi.com,
        hyun.kwon@xilinx.com, jmkrzyszt@gmail.com, robert.jarzmik@free.fr,
        linux-media@vger.kernel.org, linux-renesas-soc@vger.kernel.org
References: <20200714135812.55158-1-jacopo+renesas@jmondi.org>
 <20200714135812.55158-2-jacopo+renesas@jmondi.org>
From:   Hans Verkuil <hverkuil-cisco@xs4all.nl>
Message-ID: <750089f9-0e7f-3b2a-ec85-38452cb64fa1@xs4all.nl>
Date:   Wed, 15 Jul 2020 17:08:05 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20200714135812.55158-2-jacopo+renesas@jmondi.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-CMAE-Envelope: MS4wfKaXZOaR9gLvkHrvnAUwLk1E+69jhA1wbaru0oeOz5UCBF7yVRu8kpHBRr7hdON67bhWvSfzCf3MkDKRxoti+8d2QGMx/pedMXO2chhZh5W/glm8nK0s
 SfLinQU9dOsJgwKAH3EUEanVRFmVEz5xcNpZplMSig7fugxXgu74MJCKjpIZt9CMgYl1FYJhIayGHw+V5WH0TihdLAvwZiDHQU16qRhA+E/KVodLVogTz1Jn
 iJodZ/1raJiTeRvzXfkvfE8Xap/si70GgU64a5eEh5FF310Nu68YOhhhfGkEy05tCkDiqT1R8AZYFGL2bA27uWVyVWPcV/Br4Mugy1pbnBU0RjGXE97UEOYt
 OfFIzeIT0Mv2HQ8Lwz5LJ1hvlPmyVEVfq1+P6c+1LM4LHcdkkz6v/8rJb3Tbmc/ogM6Q8dHbDuQkQ/vDQ4bs7lQalk+BCHCG9XPs6ZrNZ/UQGHEl917TnZAZ
 qt/y3AOVlnNTyoBoU+ociEBBb2S4hOsn13t/XHiLnrLHO2j8Q2iYqrCzelLBcIaVsJv8R4LE6rwsq7w4AbR0cZ5fEuQlFW6ZSy0XsU0THe53OAzVCdYfSTmr
 ujaGOYMkGxJQ/I53tj/HHQkYiDLM0H2Z9r5BHRX9YKUmbg==
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On 14/07/2020 15:58, Jacopo Mondi wrote:
> Introduce two new pad operations to allow retrieving and configuring the
> media bus parameters on a subdevice pad.
> 
> The newly introduced operations aims to replace the s/g_mbus_config video
> operations, which have been on their way for deprecation since a long
> time.
> 
> Signed-off-by: Jacopo Mondi <jacopo+renesas@jmondi.org>
> ---
>  include/media/v4l2-subdev.h | 27 +++++++++++++++++++++++++++
>  1 file changed, 27 insertions(+)
> 
> diff --git a/include/media/v4l2-subdev.h b/include/media/v4l2-subdev.h
> index f7fe78a6f65a..d8b9d5735307 100644
> --- a/include/media/v4l2-subdev.h
> +++ b/include/media/v4l2-subdev.h
> @@ -670,6 +670,29 @@ struct v4l2_subdev_pad_config {
>   *
>   * @set_frame_desc: set the low level media bus frame parameters, @fd array
>   *                  may be adjusted by the subdev driver to device capabilities.
> + *
> + * @get_mbus_config: get the media bus configuration of a remote sub-device.
> + *		     The media bus configuration is usually retrieved from the
> + *		     firmware interface at sub-device probe time, immediately
> + *		     applied to the hardware and eventually adjusted by the
> + *		     driver. Remote sub-devices (usually video receivers) shall
> + *		     use this operation to query the transmitting end bus
> + *		     configuration in order to adjust their own one accordingly.
> + *		     Callers should make sure they get the most up-to-date as
> + *		     possible configuration from the remote end, likely calling
> + *		     this operation as close as possible to stream on time. The
> + *		     operation shall fail if the pad index it has been called on
> + *		     is not valid.
> + *
> + * @set_mbus_config: set the media bus configuration of a remote sub-device.
> + *		     This operations is intended to allow, in combination with
> + *		     the get_mbus_config operation, the negotiation of media bus
> + *		     configuration parameters between media sub-devices. The
> + *		     operation shall not fail if the requested configuration is
> + *		     not supported, but the driver shall update the content of
> + *		     the %config argument to reflect what has been actually
> + *		     applied to the hardware. The operation shall fail if the
> + *		     pad index it has been called on is not valid.
>   */

Hm, I'd hoped I could merge this, but I think include/media/v4l2-mediabus.h
also needs to be updated.

So the old g_mbus_config returned all supported configurations, while the
new get_mbus_config returns the *current* configuration.

That's fine, but that means that the meaning of the struct v4l2_mbus_config
flags field changes as well and several comments in v4l2-mediabus.h need to
be updated to reflect this.

E.g. instead of '/* How many lanes the client can use */' it becomes
'/* How many lanes the client uses */'.

Frankly, these flags can be redesigned now since you only need a single
e.g. V4L2_MBUS_HSYNC_ACTIVE_HIGH flag since if it is not set, then that
means ACTIVE_LOW. And since it is now a single bit, it is also easy to
make each flag a bit field.

The CSI2 lanes/channels can just be a bit field for the number of lanes/channels,
which is much easier to read. I strongly recommend making this change at the minimum.

Now all this can be done in a follow-up series, but the v4l2-mediabus.h
definitely needs to be updated to reflect the new code.

This can be done as a v6 5.5/9 patch (since it should come right after the
g/s_mbus_config removal).

Regards,

	Hans

>  struct v4l2_subdev_pad_ops {
>  	int (*init_cfg)(struct v4l2_subdev *sd,
> @@ -710,6 +733,10 @@ struct v4l2_subdev_pad_ops {
>  			      struct v4l2_mbus_frame_desc *fd);
>  	int (*set_frame_desc)(struct v4l2_subdev *sd, unsigned int pad,
>  			      struct v4l2_mbus_frame_desc *fd);
> +	int (*get_mbus_config)(struct v4l2_subdev *sd, unsigned int pad,
> +			       struct v4l2_mbus_config *config);
> +	int (*set_mbus_config)(struct v4l2_subdev *sd, unsigned int pad,
> +			       struct v4l2_mbus_config *config);
>  };
>  
>  /**
> 

