Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 15F18586B2E
	for <lists+linux-media@lfdr.de>; Mon,  1 Aug 2022 14:47:14 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234995AbiHAMrL (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 1 Aug 2022 08:47:11 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50242 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234953AbiHAMqy (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Mon, 1 Aug 2022 08:46:54 -0400
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id AA484AE73
        for <linux-media@vger.kernel.org>; Mon,  1 Aug 2022 05:37:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1659357425; x=1690893425;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=K0DnO4xnpBkj2RzpPGU2t/gxet3pLpTRaKPyRKg/j74=;
  b=d/139ajS9PxeJUEHGOWOdXMP0B2CbR7snfb5MpeXvDYJ+h6ttuapJ7yw
   iQWSNJncF9uQnzZi3l90EjACA+chOFiA5LjpKHEfEGgI7bwG7pjoYosxw
   GNmgsEfBebsQUj2lQ8aMwKtZ5y5QcaVnJgTGgCIGAAAsgPkZ8r2k/CPkv
   5frt99nrfQMfF74vHQtQCnoQgkZ640B23e74Za4VBCQ9cIXEMQCqlvMzl
   raC00Lt7TlVik2PtQVv+2QbRxAAkOAsdOM/QK3lcRLnM1nkf5Hc/CoNvT
   D1ThzRlpyBT5xGNONSY0pLg7XMQRPrJYrS5WItYJGmNTZWe/tczqwypvY
   A==;
X-IronPort-AV: E=McAfee;i="6400,9594,10425"; a="286693036"
X-IronPort-AV: E=Sophos;i="5.93,206,1654585200"; 
   d="scan'208";a="286693036"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
  by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Aug 2022 05:37:05 -0700
X-IronPort-AV: E=Sophos;i="5.93,206,1654585200"; 
   d="scan'208";a="634876177"
Received: from punajuuri.fi.intel.com (HELO paasikivi.fi.intel.com) ([10.237.72.43])
  by orsmga001-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Aug 2022 05:37:02 -0700
Received: from paasikivi.fi.intel.com (localhost [127.0.0.1])
        by paasikivi.fi.intel.com (Postfix) with SMTP id 0C701203B7;
        Mon,  1 Aug 2022 15:37:00 +0300 (EEST)
Date:   Mon, 1 Aug 2022 12:37:00 +0000
From:   Sakari Ailus <sakari.ailus@linux.intel.com>
To:     Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
Cc:     linux-media@vger.kernel.org,
        Jacopo Mondi <jacopo+renesas@jmondi.org>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        niklas.soderlund+renesas@ragnatech.se,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        Pratyush Yadav <p.yadav@ti.com>,
        Kishon Vijay Abraham <kishon@ti.com>,
        satish.nagireddy@getcruise.com, Tomasz Figa <tfiga@chromium.org>
Subject: Re: [PATCH v12 26/30] media: v4l2-subdev: Add
 v4l2_subdev_state_xlate_streams() helper
Message-ID: <YufI7P9kf2E2mBYG@paasikivi.fi.intel.com>
References: <20220727103639.581567-1-tomi.valkeinen@ideasonboard.com>
 <20220727103639.581567-27-tomi.valkeinen@ideasonboard.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220727103639.581567-27-tomi.valkeinen@ideasonboard.com>
X-Spam-Status: No, score=-7.6 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,
        SPF_NONE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Moi,

On Wed, Jul 27, 2022 at 01:36:35PM +0300, Tomi Valkeinen wrote:
> From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
> 
> Add a helper function to translate streams between two pads of a subdev,
> using the subdev's internal routing table.
> 
> Signed-off-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
> Signed-off-by: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
> ---
>  drivers/media/v4l2-core/v4l2-subdev.c | 26 ++++++++++++++++++++++++++
>  include/media/v4l2-subdev.h           | 23 +++++++++++++++++++++++
>  2 files changed, 49 insertions(+)
> 
> diff --git a/drivers/media/v4l2-core/v4l2-subdev.c b/drivers/media/v4l2-core/v4l2-subdev.c
> index 2fc999b1b6c1..35ddf4dbe3a9 100644
> --- a/drivers/media/v4l2-core/v4l2-subdev.c
> +++ b/drivers/media/v4l2-core/v4l2-subdev.c
> @@ -1619,6 +1619,32 @@ v4l2_subdev_state_get_opposite_stream_format(struct v4l2_subdev_state *state,
>  }
>  EXPORT_SYMBOL_GPL(v4l2_subdev_state_get_opposite_stream_format);
>  
> +u64 v4l2_subdev_state_xlate_streams(const struct v4l2_subdev_state *state,
> +				    u32 pad0, u32 pad1, u64 *streams)
> +{
> +	const struct v4l2_subdev_krouting *routing = &state->routing;
> +	struct v4l2_subdev_route *route;
> +	u64 streams0 = 0;
> +	u64 streams1 = 0;
> +
> +	for_each_active_route(routing, route) {
> +		if (route->sink_pad == pad0 && route->source_pad == pad1 &&
> +		    (*streams & BIT_ULL(route->sink_stream))) {
> +			streams0 |= BIT_ULL(route->sink_stream);
> +			streams1 |= BIT_ULL(route->source_stream);
> +		}
> +		if (route->source_pad == pad0 && route->sink_pad == pad1 &&
> +		    (*streams & BIT_ULL(route->source_stream))) {
> +			streams0 |= BIT_ULL(route->source_stream);
> +			streams1 |= BIT_ULL(route->sink_stream);
> +		}
> +	}
> +
> +	*streams = streams0;
> +	return streams1;
> +}
> +EXPORT_SYMBOL_GPL(v4l2_subdev_state_xlate_streams);
> +
>  int v4l2_subdev_routing_validate(struct v4l2_subdev *sd,
>  				 const struct v4l2_subdev_krouting *routing,
>  				 enum v4l2_subdev_routing_restriction disallow)
> diff --git a/include/media/v4l2-subdev.h b/include/media/v4l2-subdev.h
> index f749effadde2..dd5cccc827ef 100644
> --- a/include/media/v4l2-subdev.h
> +++ b/include/media/v4l2-subdev.h
> @@ -1554,6 +1554,29 @@ struct v4l2_mbus_framefmt *
>  v4l2_subdev_state_get_opposite_stream_format(struct v4l2_subdev_state *state,
>  					     u32 pad, u32 stream);
>  
> +/**
> + * v4l2_subdev_state_xlate_streams() - Translate streams from one pad to another
> + *
> + * @state: Subdevice state
> + * @pad0: The first pad
> + * @pad1: The second pad
> + * @streams: Streams bitmask on the first pad
> + *
> + * Streams on sink pads of a subdev are routed to source pads as expressed in
> + * the subdev state routing table. Stream numbers don't necessarily match on
> + * the sink and source side of a route. This function translates stream numbers
> + * on @pad0, expressed as a bitmask in @streams, to the corresponding streams
> + * on @pad1 using the routing table from the @state. It returns the stream mask
> + * on @pad1, and updates @streams with the streams that have been found in the
> + * routing table.
> + *
> + * @pad0 and @pad1 must be a sink and a source, in any order.
> + *
> + * Return: The bitmask of streams of @pad1 that are routed to @streams on @pad0.
> + */
> +u64 v4l2_subdev_state_xlate_streams(const struct v4l2_subdev_state *state,
> +				    u32 pad0, u32 pad1, u64 *streams);
> +
>  /**
>   * enum v4l2_subdev_routing_restriction - Subdevice internal routing restrictions
>   *

How and where is this meant to be used?

-- 
Sakari Ailus
