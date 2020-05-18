Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 27E941D746F
	for <lists+linux-media@lfdr.de>; Mon, 18 May 2020 11:53:46 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726339AbgERJxp (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 18 May 2020 05:53:45 -0400
Received: from lb2-smtp-cloud7.xs4all.net ([194.109.24.28]:39901 "EHLO
        lb2-smtp-cloud7.xs4all.net" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1726040AbgERJxp (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 18 May 2020 05:53:45 -0400
Received: from cust-b5b5937f ([IPv6:fc0c:c16d:66b8:757f:c639:739b:9d66:799d])
        by smtp-cloud7.xs4all.net with ESMTPA
        id acSojt04etKAsacSsjKnKs; Mon, 18 May 2020 11:53:42 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=xs4all.nl; s=s1;
        t=1589795622; bh=12kGb49FgTe7lMiE4T0QZ6mV2qM0DCIbyXntkOOding=;
        h=Subject:To:From:Message-ID:Date:MIME-Version:Content-Type:From:
         Subject;
        b=Farfjb/CgYdopahAerx6NB8ty5Y4WAcVEezr2WayT4YIJ/EXsR080ST5Zi5XSLAST
         ka3o8W3xt9nzIzkQWF333lzPnYxfAKdeoPy1woxpU6jGWi6IBOUMceYrtpkyUR63Mz
         uuWPw5YYTF8GwTYNSbmJ/VwZgcYpxzzbV7u/vQKRHfHUipEBvibPrFyRN6TITVqmAS
         qjOejAlZRWbaCipGw5ozOlkA9pGMmZFLKSQOqRZvCypahrGKQNb+3jDMCxIN1FF2vj
         Wy19hjo59o6bCZWD4pln/9ooaDxnLF/cpJV3gwfg8Lg+fsgb8jxDV77hTTF/It+67b
         pzWxjfIbSmJcA==
Subject: Re: [PATCH v3 1/8] media: v4l2-subdv: Introduce [s|g]et_mbus_config
 pad ops
To:     Jacopo Mondi <jacopo+renesas@jmondi.org>, mchehab@kernel.org,
        sakari.ailus@linux.intel.com, laurent.pinchart@ideasonboard.com
Cc:     niklas.soderlund+renesas@ragnatech.se,
        kieran.bingham@ideasonboard.com, dave.stevenson@raspberrypi.com,
        hyun.kwon@xilinx.com, linux-media@vger.kernel.org,
        linux-renesas-soc@vger.kernel.org
References: <20200514164540.507233-1-jacopo+renesas@jmondi.org>
 <20200514164540.507233-3-jacopo+renesas@jmondi.org>
From:   Hans Verkuil <hverkuil-cisco@xs4all.nl>
Message-ID: <71508b06-878d-ab11-417c-455dfc3fd6a5@xs4all.nl>
Date:   Mon, 18 May 2020 11:53:38 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.5.0
MIME-Version: 1.0
In-Reply-To: <20200514164540.507233-3-jacopo+renesas@jmondi.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-CMAE-Envelope: MS4wfGR1BU34wubcTWXabe4m+NUIF4rB4mtv/jtIa0An2D7ZGAhXXYOkxmuGmhL5sSrPOj87jZ/cZtDmn0jOlvmSC/1thJ9/b6UpolhAu+8G8pY9z6zIeuGm
 05pu13UyX7uZ48st7g12FymKeQojo+o6thou3ktYSsv+POqKCbhZ0cbmNH8t7vPjUhaFG9gnx44EqMMSmlNSz5xN+9QTRu7hhryp4MjizlCRejizoCnuf5zV
 EGDEqTdjHGQ6HI0ZW5qEfhY6EyiwsX15mffFY9WH+/Dv6PthqNR8l1+QWBOk83fDSIi05bAfK/RksK374lG5a9h6qdbgf9GH9f5eNPT01y+xwZgreRM7OlQx
 yQme3FK9+0FWzcnp69G+w0FgdlwD2fUNPKQ0x4NcIHwinHeqd+iOGO8C4UuYigoufvZ8CaQ6QDNY4YsVcPc2ESuxqnoJHSnKHO0eB6sukiviRpTHcmgue7MJ
 QF6BxaufM2Hk0PBxZDy+zPc8WwTRO3ErNHF9NddYVvmrfo2GB/VR0piAT7DWMdL4kn171F8rrlWNmQ5WK4lmYTUEcU6ZgaYp2l//5A==
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

For v4 can you fix the subject? It's v4l2-subdev, not v4l2-subdv.

Regards,

	Hans

On 14/05/2020 18:45, Jacopo Mondi wrote:
> Introduce two new pad operations to allow retrieving and configuring the
> media bus configuration on a subdevice pad.
> 
> The newly introduced operations aims to replace the s/g_mbus_config video
> operations, which have been on their way to be deprecated since a long
> time.
> 
> Signed-off-by: Jacopo Mondi <jacopo+renesas@jmondi.org>
> ---
>  include/media/v4l2-subdev.h | 30 ++++++++++++++++++++++++++++++
>  1 file changed, 30 insertions(+)
> 
> diff --git a/include/media/v4l2-subdev.h b/include/media/v4l2-subdev.h
> index a4848de59852..8d5f4a255b87 100644
> --- a/include/media/v4l2-subdev.h
> +++ b/include/media/v4l2-subdev.h
> @@ -670,6 +670,32 @@ struct v4l2_subdev_pad_config {
>   *
>   * @set_frame_desc: set the low level media bus frame parameters, @fd array
>   *                  may be adjusted by the subdev driver to device capabilities.
> + *
> + * @get_mbus_config: get the current media bus configuration. This operation is
> + *		     intended to be used to synchronize the media bus
> + *		     configuration parameters between receivers and
> + *		     transmitters. The static bus configuration is usually
> + *		     received from the firmware interface, and updated
> + *		     dynamically using this operation to retrieve bus
> + *		     configuration parameters which could change at run-time.
> + *		     Callers should make sure they get the most up-to-date as
> + *		     possible configuration from the connected sub-device,
> + *		     likely calling this operation as close as possible to
> + *		     stream on time. The operation is allowed to fail if the
> + *		     pad index it has been called on is unsupported.
> + *
> + * @set_mbus_config: set the media bus configuration. This operations is
> + *		     intended to allow, in combination with the
> + *		     get_mbus_format operation, the negotiation of media bus
> + *		     configuration parameters between media subdevices.
> + *		     The initial media bus configuration is retrieved from
> + *		     the firmware interface and later updated through this
> + *		     operation if the sub-device allows changing it.
> + *		     The operation shall not fail if the requested configuration
> + *		     is not supported, but the driver shall update the received
> + *		     %config argument to reflect what has been actually applied
> + *		     to the hardware. The operation is allowed to fail if the
> + *		     pad index it has been called on is unsupported.
>   */
>  struct v4l2_subdev_pad_ops {
>  	int (*init_cfg)(struct v4l2_subdev *sd,
> @@ -710,6 +736,10 @@ struct v4l2_subdev_pad_ops {
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

