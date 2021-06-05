Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 09FC839CB7F
	for <lists+linux-media@lfdr.de>; Sun,  6 Jun 2021 00:45:11 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230025AbhFEWq5 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sat, 5 Jun 2021 18:46:57 -0400
Received: from perceval.ideasonboard.com ([213.167.242.64]:49582 "EHLO
        perceval.ideasonboard.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229998AbhFEWq5 (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Sat, 5 Jun 2021 18:46:57 -0400
Received: from pendragon.ideasonboard.com (62-78-145-57.bb.dnainternet.fi [62.78.145.57])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 951D73E7;
        Sun,  6 Jun 2021 00:45:06 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1622933106;
        bh=LsudLtHyPsi6SfGcgkgYIK3AOLDW3WJbw9x6KUFbJlg=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=mrLEDTCqCJfotMbuxdbIbGEgYZ1MJ9XJyyH3FbREadjDxH2MDWMkJf7cAWbiCp64c
         P0WGnzpSMdydO/SYoNeB5oEw6gRA2QH3QH+5azK9ip+sX1873sy4mUGPRjxkNj8n0Z
         F4seTyuvR1slFr+OZ6JoMlzEKUEb01S6v+XJrYx8=
Date:   Sun, 6 Jun 2021 01:44:53 +0300
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
Cc:     linux-media@vger.kernel.org, sakari.ailus@linux.intel.com,
        Jacopo Mondi <jacopo+renesas@jmondi.org>,
        niklas.soderlund+renesas@ragnatech.se,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        Pratyush Yadav <p.yadav@ti.com>,
        Lokesh Vutla <lokeshvutla@ti.com>
Subject: Re: [PATCH v7 20/27] v4l: subdev: add V4L2_SUBDEV_ROUTE_FL_SOURCE
Message-ID: <YLv+Za5F/0wiD5cZ@pendragon.ideasonboard.com>
References: <20210524104408.599645-1-tomi.valkeinen@ideasonboard.com>
 <20210524104408.599645-21-tomi.valkeinen@ideasonboard.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20210524104408.599645-21-tomi.valkeinen@ideasonboard.com>
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Tomi,

Thank you for the patch.

On Mon, May 24, 2021 at 01:44:01PM +0300, Tomi Valkeinen wrote:
> Add route flag to indicate that the route is a source route. This means
> that the route does not lead anywhere, and the sink_pad and sink_stream
> should not be used.

I don't like this much. It's not a route if it doesn't lead anywhere, so
this flag seems like a hack. If we need a way to discover streams on a
source, I'd rather have an explicit operation to do so. Can't the get
frame descriptor operation be used for this ?

If the need is to find out that we're reaching the end of a pipeline
while going through links and routes, I'd rather have a pad flag to
indicate that the pad is an endpoint.

> A sensor which provides multiple streams should implement get_routing
> and use the flag to mark the routes as sources.
> 
> Signed-off-by: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
> ---
>  include/uapi/linux/v4l2-subdev.h | 7 +++++++
>  1 file changed, 7 insertions(+)
> 
> diff --git a/include/uapi/linux/v4l2-subdev.h b/include/uapi/linux/v4l2-subdev.h
> index 45c01799e2cd..f20491e1f53f 100644
> --- a/include/uapi/linux/v4l2-subdev.h
> +++ b/include/uapi/linux/v4l2-subdev.h
> @@ -200,6 +200,13 @@ struct v4l2_subdev_capability {
>   */
>  #define V4L2_SUBDEV_ROUTE_FL_IMMUTABLE		BIT(1)
>  
> +/**
> + * Is the route a source endpoint? A source endpoint route doesn't come
> + * from "anywhere", and the sink_pad and sink_stream fields are unused.
> + * Set by the driver.
> + */
> +#define V4L2_SUBDEV_ROUTE_FL_SOURCE		BIT(2)
> +
>  /**
>   * struct v4l2_subdev_route - A route inside a subdev
>   *

-- 
Regards,

Laurent Pinchart
