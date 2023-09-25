Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 9895B7AE0CB
	for <lists+linux-media@lfdr.de>; Mon, 25 Sep 2023 23:31:56 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233386AbjIYVcB (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 25 Sep 2023 17:32:01 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56426 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233059AbjIYVcA (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 25 Sep 2023 17:32:00 -0400
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [IPv6:2001:4b98:dc2:55:216:3eff:fef7:d647])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C07B3109
        for <linux-media@vger.kernel.org>; Mon, 25 Sep 2023 14:31:53 -0700 (PDT)
Received: from pendragon.ideasonboard.com (213-243-189-158.bb.dnainternet.fi [213.243.189.158])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 9CDF1F02;
        Mon, 25 Sep 2023 23:30:11 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1695677411;
        bh=ZgXPj5n3C+0Rj+03hW4Y6BZDNP39i8fM//4wxdOxajc=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=klBzlUhjSM+9u3L7opelqZmvtExDMGz8hu1c4Mqm8GVs0jDix97kD2KFKAWhRScGZ
         Bk7Ck1REWpahgjy+Pln6btdDojQmYrQiCHa+wIV8MOQFCzSIhf1jveWx1pgYv5Rhor
         yRhNiM+OFZgMNMADpMtx0sp3NyBodvvNU5epNWVU=
Date:   Tue, 26 Sep 2023 00:32:02 +0300
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     Sakari Ailus <sakari.ailus@linux.intel.com>
Cc:     linux-media@vger.kernel.org, tomi.valkeinen@ideasonboard.com,
        bingbu.cao@intel.com, hongju.wang@intel.com, hverkuil@xs4all.nl,
        Andrey Konovalov <andrey.konovalov@linaro.org>,
        Jacopo Mondi <jacopo.mondi@ideasonboard.com>,
        Dmitry Perchanov <dmitry.perchanov@intel.com>,
        "Ng, Khai Wen" <khai.wen.ng@intel.com>
Subject: Re: [PATCH v4 21/23] media: uapi: Allow a larger number of routes
 than there's room for
Message-ID: <20230925213202.GA12446@pendragon.ideasonboard.com>
References: <20230922142239.259425-1-sakari.ailus@linux.intel.com>
 <20230922142239.259425-22-sakari.ailus@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20230922142239.259425-22-sakari.ailus@linux.intel.com>
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_PASS,SPF_PASS
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Sakari,

Thank you for the patch.

On Fri, Sep 22, 2023 at 05:22:37PM +0300, Sakari Ailus wrote:
> On VIDIOC_SUBDEV_[GS]_ROUTING, only return as many routes back to the user
> as there's room. Do not consider it an error if more routes existed.
> Simply inform the user there are more routes.
> 
> Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>
> ---
>  .../userspace-api/media/v4l/vidioc-subdev-g-routing.rst   | 4 ----
>  drivers/media/v4l2-core/v4l2-subdev.c                     | 8 ++------
>  2 files changed, 2 insertions(+), 10 deletions(-)
> 
> diff --git a/Documentation/userspace-api/media/v4l/vidioc-subdev-g-routing.rst b/Documentation/userspace-api/media/v4l/vidioc-subdev-g-routing.rst
> index ced53ea5f23c..99d3c15fd759 100644
> --- a/Documentation/userspace-api/media/v4l/vidioc-subdev-g-routing.rst
> +++ b/Documentation/userspace-api/media/v4l/vidioc-subdev-g-routing.rst
> @@ -145,10 +145,6 @@ On success 0 is returned, on error -1 and the ``errno`` variable is set
>  appropriately. The generic error codes are described at the
>  :ref:`Generic Error Codes <gen-errors>` chapter.
>  
> -ENOSPC
> -   The application provided ``num_routes`` is not big enough to contain
> -   all the available routes the subdevice exposes.
> -
>  EINVAL
>     The sink or source pad identifiers reference a non-existing pad, or reference
>     pads of different types (ie. the sink_pad identifiers refers to a source pad).
> diff --git a/drivers/media/v4l2-core/v4l2-subdev.c b/drivers/media/v4l2-core/v4l2-subdev.c
> index 1bcc96cde6da..7871ec8a66d1 100644
> --- a/drivers/media/v4l2-core/v4l2-subdev.c
> +++ b/drivers/media/v4l2-core/v4l2-subdev.c
> @@ -956,14 +956,10 @@ static long subdev_do_ioctl(struct file *file, unsigned int cmd, void *arg,
>  
>  		krouting = &state->routing;
>  
> -		if (routing->len_routes < krouting->num_routes) {
> -			routing->num_routes = krouting->num_routes;
> -			return -ENOSPC;
> -		}
> -
>  		memcpy((struct v4l2_subdev_route *)(uintptr_t)routing->routes,
>  		       krouting->routes,
> -		       krouting->num_routes * sizeof(*krouting->routes));
> +		       min(krouting->num_routes, krouting->len_routes) *

This should be

		       min(krouting->num_routes, routing->len_routes) *

> +		       sizeof(*krouting->routes));
>  		routing->num_routes = krouting->num_routes;
>  
>  		return 0;

-- 
Regards,

Laurent Pinchart
