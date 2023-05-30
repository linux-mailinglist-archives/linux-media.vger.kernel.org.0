Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id B3204715395
	for <lists+linux-media@lfdr.de>; Tue, 30 May 2023 04:21:26 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230136AbjE3CVY (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 29 May 2023 22:21:24 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57598 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229928AbjE3CVX (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 29 May 2023 22:21:23 -0400
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [IPv6:2001:4b98:dc2:55:216:3eff:fef7:d647])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E4D6AE8
        for <linux-media@vger.kernel.org>; Mon, 29 May 2023 19:21:18 -0700 (PDT)
Received: from pendragon.ideasonboard.com (om126158230151.30.openmobile.ne.jp [126.158.230.151])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 991A0E4;
        Tue, 30 May 2023 04:20:56 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1685413257;
        bh=dC9yesgByiAJsOqtv3kv9BVk+ErSvksxt+j/1tgd9kI=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=VVxj+nPcKqZ9LIcubCpfPU58r6wOuKAKIam9t3kuPBp4YZ9AlNa4FDVjR4PMmUg7t
         gXNvKvINzpv501OsYWV+5RGOl5C8KwbGcjG0JXEeJxaZaHJaPMbgbEckfFHHk68MMj
         4qQiHA/XsnlSJdHANpOyc2/rwYQu5KIshyh/QVhQ=
Date:   Tue, 30 May 2023 05:21:19 +0300
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
Cc:     Sakari Ailus <sakari.ailus@linux.intel.com>,
        linux-media@vger.kernel.org,
        Philipp Zabel <p.zabel@pengutronix.de>, hverkuil@xs4all.nl,
        Francesco Dolcini <francesco@dolcini.it>,
        aishwarya.kothari@toradex.com, Robert Foss <rfoss@kernel.org>,
        Todor Tomov <todor.too@gmail.com>,
        Hyun Kwon <hyun.kwon@xilinx.com>, bingbu.cao@intel.com,
        niklas.soderlund@ragnatech.se,
        Kieran Bingham <kieran.bingham@ideasonboard.com>,
        Benjamin Mugnier <benjamin.mugnier@foss.st.com>,
        Sylvain Petinot <sylvain.petinot@foss.st.com>,
        Eugen Hristev <eugen.hristev@collabora.com>,
        Nicolas Ferre <nicolas.ferre@microchip.com>,
        Maxime Ripard <mripard@kernel.org>,
        Rui Miguel Silva <rmfrfs@gmail.com>,
        Fabio Estevam <festevam@gmail.com>,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Sylwester Nawrocki <s.nawrocki@samsung.com>,
        Dafna Hirschfeld <dafna@fastmail.com>,
        Hugues Fruchet <hugues.fruchet@foss.st.com>,
        Yong Deng <yong.deng@magewell.com>,
        Paul Kocialkowski <paul.kocialkowski@bootlin.com>,
        "Lad, Prabhakar" <prabhakar.csengg@gmail.com>,
        Benoit Parrot <bparrot@ti.com>,
        Steve Longerbeam <slongerbeam@gmail.com>,
        Thierry Reding <thierry.reding@gmail.com>,
        Jonathan Hunter <jonathanh@nvidia.com>,
        Sowjanya Komatineni <skomatineni@nvidia.com>,
        Marco Felsch <m.felsch@pengutronix.de>
Subject: Re: [RESEND PATCH v3 03/32] media: xilinx-vipp: Clean up bound async
 notifier callback
Message-ID: <20230530022119.GD21633@pendragon.ideasonboard.com>
References: <20230525091615.2324824-1-sakari.ailus@linux.intel.com>
 <20230525091615.2324824-4-sakari.ailus@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20230525091615.2324824-4-sakari.ailus@linux.intel.com>
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_PASS,SPF_PASS,
        T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED autolearn=ham autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Tomi, could you please test this patch ?

On Thu, May 25, 2023 at 12:15:46PM +0300, Sakari Ailus wrote:
> The async notifier bound callback does a lot of checks that have probably
> been always unnecessary. Remove the lookup of the async subev that we
> already have, as well as the debug print that is already printed by the
> framework.
> 
> Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>
> ---
>  drivers/media/platform/xilinx/xilinx-vipp.c | 32 ++++-----------------
>  1 file changed, 5 insertions(+), 27 deletions(-)
> 
> diff --git a/drivers/media/platform/xilinx/xilinx-vipp.c b/drivers/media/platform/xilinx/xilinx-vipp.c
> index 3123216b3f70e..b309af0c83749 100644
> --- a/drivers/media/platform/xilinx/xilinx-vipp.c
> +++ b/drivers/media/platform/xilinx/xilinx-vipp.c
> @@ -312,36 +312,14 @@ static int xvip_graph_notify_complete(struct v4l2_async_notifier *notifier)
>  
>  static int xvip_graph_notify_bound(struct v4l2_async_notifier *notifier,
>  				   struct v4l2_subdev *subdev,
> -				   struct v4l2_async_subdev *unused)
> +				   struct v4l2_async_subdev *asd)
>  {
> -	struct xvip_composite_device *xdev =
> -		container_of(notifier, struct xvip_composite_device, notifier);
> -	struct xvip_graph_entity *entity;
> -	struct v4l2_async_subdev *asd;
> +	struct xvip_graph_entity *entity = to_xvip_entity(asd);
>  
> -	/* Locate the entity corresponding to the bound subdev and store the
> -	 * subdev pointer.
> -	 */
> -	list_for_each_entry(asd, &xdev->notifier.asd_list, asd_list) {
> -		entity = to_xvip_entity(asd);
> +	entity->entity = &subdev->entity;
> +	entity->subdev = subdev;
>  
> -		if (entity->asd.match.fwnode != subdev->fwnode)
> -			continue;
> -
> -		if (entity->subdev) {
> -			dev_err(xdev->dev, "duplicate subdev for node %p\n",
> -				entity->asd.match.fwnode);
> -			return -EINVAL;
> -		}
> -
> -		dev_dbg(xdev->dev, "subdev %s bound\n", subdev->name);
> -		entity->entity = &subdev->entity;
> -		entity->subdev = subdev;
> -		return 0;
> -	}
> -
> -	dev_err(xdev->dev, "no entity for subdev %s\n", subdev->name);
> -	return -EINVAL;
> +	return 0;
>  }
>  
>  static const struct v4l2_async_notifier_operations xvip_graph_notify_ops = {

-- 
Regards,

Laurent Pinchart
