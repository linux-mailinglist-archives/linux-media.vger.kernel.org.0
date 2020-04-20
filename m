Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 001571AFF9D
	for <lists+linux-media@lfdr.de>; Mon, 20 Apr 2020 03:52:54 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725988AbgDTBwy (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sun, 19 Apr 2020 21:52:54 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45540 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-FAIL-OK-FAIL)
        by vger.kernel.org with ESMTP id S1725953AbgDTBwx (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Sun, 19 Apr 2020 21:52:53 -0400
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [IPv6:2001:4b98:dc2:55:216:3eff:fef7:d647])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C0784C061A0C;
        Sun, 19 Apr 2020 18:52:53 -0700 (PDT)
Received: from pendragon.ideasonboard.com (81-175-216-236.bb.dnainternet.fi [81.175.216.236])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id EE35B528;
        Mon, 20 Apr 2020 03:52:51 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1587347572;
        bh=4TJpzJVwjQvycm4PBMh5K/9lnutdpSkcWIHkDh2R8aY=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=eL1+lxTH5obfkkH4LYHt4ZfD8LhKNTZbw2tB0HjGcbVMwu/fF4syibZvphfdCdHqF
         x77eGC77DLv8hPDVuCuIbjzMWPbnhfSkjeAO93/pDjK4pcPu1+EhyoRuobtE+VQUSd
         TZFG1vBH9wiEbMJ+VsAzM6z6OkjXEffPV+6qoBts=
Date:   Mon, 20 Apr 2020 04:52:39 +0300
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     Jacopo Mondi <jacopo+renesas@jmondi.org>
Cc:     mchehab@kernel.org, hverkuil-cisco@xs4all.nl,
        sakari.ailus@linux.intel.com,
        niklas.soderlund+renesas@ragnatech.se,
        kieran.bingham@ideasonboard.com, dave.stevenson@raspberrypi.com,
        hyun.kwon@xilinx.com, linux-media@vger.kernel.org,
        linux-renesas-soc@vger.kernel.org
Subject: Re: [PATCH v2 3/6] media: v4l2-subdev: Expand get_mbus_config doc
Message-ID: <20200420015239.GC15673@pendragon.ideasonboard.com>
References: <20200415105004.2497356-1-jacopo+renesas@jmondi.org>
 <20200415105004.2497356-4-jacopo+renesas@jmondi.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20200415105004.2497356-4-jacopo+renesas@jmondi.org>
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Jacopo,

Thank you for the patch.

On Wed, Apr 15, 2020 at 12:50:00PM +0200, Jacopo Mondi wrote:
> Expand documentation of the newly introduced get_mbus_config() pad
> operation.
> 
> Signed-off-by: Jacopo Mondi <jacopo+renesas@jmondi.org>
> ---
> 
> Providing this as separate patch to ease review/discussion.
> Can be likely squashed in 1/6

Yes, I think it should be squashed.

> ---
>  include/media/v4l2-subdev.h | 12 +++++++++++-
>  1 file changed, 11 insertions(+), 1 deletion(-)
> 
> diff --git a/include/media/v4l2-subdev.h b/include/media/v4l2-subdev.h
> index 9bf14c41626d..e95f44e778a6 100644
> --- a/include/media/v4l2-subdev.h
> +++ b/include/media/v4l2-subdev.h
> @@ -737,7 +737,17 @@ struct v4l2_subdev_pad_config {
>   * @set_frame_desc: set the low level media bus frame parameters, @fd array
>   *                  may be adjusted by the subdev driver to device capabilities.
>   *
> - * @get_mbus_config: get the current mbus configuration
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
> + *		     stream on time.

Much better than a single line, but still quite imprecise :-S I think we
need to describe clearly when the implementer of this operation is
allowed to change the bus configuration for instance, and we need to
think about the locking model between the subdev and the caller.

The other option is to consider that most subdev operations are
currently under-documented and keep going with the flow :-) I will thus
not block this patch series due to the documentation.

>   */
>  struct v4l2_subdev_pad_ops {
>  	int (*init_cfg)(struct v4l2_subdev *sd,

-- 
Regards,

Laurent Pinchart
