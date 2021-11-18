Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 96D4E455977
	for <lists+linux-media@lfdr.de>; Thu, 18 Nov 2021 11:54:48 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S244918AbhKRK5r (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 18 Nov 2021 05:57:47 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51196 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S243529AbhKRK5q (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 18 Nov 2021 05:57:46 -0500
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [IPv6:2001:4b98:dc2:55:216:3eff:fef7:d647])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CD1AAC061570
        for <linux-media@vger.kernel.org>; Thu, 18 Nov 2021 02:54:46 -0800 (PST)
Received: from [192.168.1.111] (91-158-153-130.elisa-laajakaista.fi [91.158.153.130])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 1E36B3E5;
        Thu, 18 Nov 2021 11:54:43 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1637232883;
        bh=YXogZondwmjBcuvAVKBHiKjoDMlbhMgQphw/tDyJuws=;
        h=To:Cc:References:From:Subject:Date:In-Reply-To:From;
        b=EJhLL3v0UbeowZ29miC09oPhuxii1+DBO6sOeQZuuxKefgbA3byU0cmyK5HmBDVQk
         cCKUtEgG+ruxU6Vgh4yz737j+WT7mV3+fjYNQYze04IMCyZItrl8TXIjozTMwO/hDI
         UToq91jNbnVa1M/q9+EZMnaIwvPv4tbk8CsKvFzY=
To:     linux-media@vger.kernel.org, sakari.ailus@linux.intel.com,
        Jacopo Mondi <jacopo+renesas@jmondi.org>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        niklas.soderlund+renesas@ragnatech.se
Cc:     Mauro Carvalho Chehab <mchehab@kernel.org>,
        Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        Pratyush Yadav <p.yadav@ti.com>,
        Michal Simek <michal.simek@xilinx.com>
References: <20211005085750.138151-1-tomi.valkeinen@ideasonboard.com>
 <20211005085750.138151-28-tomi.valkeinen@ideasonboard.com>
From:   Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
Subject: Re: [PATCH v9 27/36] media: subdev: Add [GS]_ROUTING subdev ioctls
 and operations
Message-ID: <4e17aa13-b1fb-b07d-1e1d-6209bdc8745b@ideasonboard.com>
Date:   Thu, 18 Nov 2021 12:54:40 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
MIME-Version: 1.0
In-Reply-To: <20211005085750.138151-28-tomi.valkeinen@ideasonboard.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On 05/10/2021 11:57, Tomi Valkeinen wrote:
> From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
> 
> Add support for subdev internal routing. A route is defined as a single
> stream from a sink pad to a source pad.
> 
> The userspace can configure the routing via two new ioctls,
> VIDIOC_SUBDEV_G_ROUTING and VIDIOC_SUBDEV_S_ROUTING, and subdevs can
> implement the functionality with v4l2_subdev_pad_ops.set_routing().
> 
> Signed-off-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
> Signed-off-by: Michal Simek <michal.simek@xilinx.com>

<snip>

> diff --git a/include/uapi/linux/v4l2-subdev.h b/include/uapi/linux/v4l2-subdev.h
> index 658106f5b5dc..5ba409db47ff 100644
> --- a/include/uapi/linux/v4l2-subdev.h
> +++ b/include/uapi/linux/v4l2-subdev.h
> @@ -188,6 +188,61 @@ struct v4l2_subdev_capability {
>   /* The v4l2 sub-device video device node is registered in read-only mode. */
>   #define V4L2_SUBDEV_CAP_RO_SUBDEV		0x00000001
>   
> +/*
> + * Is the route active? An active route will start when streaming is enabled
> + * on a video node.
> + */
> +#define V4L2_SUBDEV_ROUTE_FL_ACTIVE		(1 << 0)
> +
> +/*
> + * Is the route immutable, i.e. can it be activated and inactivated?
> + * Set by the driver.
> + */
> +#define V4L2_SUBDEV_ROUTE_FL_IMMUTABLE		(1 << 1)
> +
> +/*
> + * Is the route a source endpoint? A source endpoint route refers to a stream
> + * generated internally by the subdevice (usually a sensor), and thus there
> + * is no sink-side endpoint for the route. The sink_pad and sink_stream
> + * fields are unused.
> + * Set by the driver.
> + */
> +#define V4L2_SUBDEV_ROUTE_FL_SOURCE		(1 << 2)

I think we should have one more flag.

IMMUTABLE means that the route cannot be inactivated (or activated, but 
a route that's always inactive doesn't make sense), and even if it's not 
mentioned above, I think IMMUTABLE also means the route cannot be 
removed from the routing table, or changed in any way.

We should have a new flag that indicates that the route must exist, but 
it can be activated/inactivated. V4L2_SUBDEV_ROUTE_FL_STATIC? 
V4L2_SUBDEV_ROUTE_FL_IMMUTABLE would be a "superset" of 
V4L2_SUBDEV_ROUTE_FL_STATIC.

Or maybe we should have neither... Both are a bit challenging, as the 
routing system depends on user defined stream identifiers, which in 
practice means that only sensors might have IMMUTABLE or STATIC source 
routes. For every other subdev in the pipeline the userspace must be 
able to change the stream identifiers.

Perhaps just V4L2_SUBDEV_ROUTE_FL_SOURCE would be enough, which would 
also imply STATIC.

  Tomi
