Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 1B7E8569FCA
	for <lists+linux-media@lfdr.de>; Thu,  7 Jul 2022 12:27:56 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232388AbiGGK1w (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 7 Jul 2022 06:27:52 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53672 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232195AbiGGK1v (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Thu, 7 Jul 2022 06:27:51 -0400
Received: from mail-pf1-x430.google.com (mail-pf1-x430.google.com [IPv6:2607:f8b0:4864:20::430])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 916432A260
        for <linux-media@vger.kernel.org>; Thu,  7 Jul 2022 03:27:47 -0700 (PDT)
Received: by mail-pf1-x430.google.com with SMTP id b9so2445639pfp.10
        for <linux-media@vger.kernel.org>; Thu, 07 Jul 2022 03:27:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=s01JHVcqayCgEqhqHx7u8geLLfvm7N1pIgEYPcD4UCQ=;
        b=HYMkPZUMNaYMVrx9HavtmILboCXy9XKoZXhJ67NoA0w25TandL1LozfaT5K8776Rxj
         GFCoKxKK0qCF+WfedLpaAZLDbdaN2Mh+AF4fagpNPTfOqdPCFHZOzK/wQdGjskxsZOmk
         ymRFfJ7KMODG+PRjrOOKhxWdZQf9/il3pTwfk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=s01JHVcqayCgEqhqHx7u8geLLfvm7N1pIgEYPcD4UCQ=;
        b=c+4f7rtkclcJKUd9M9E6z1J0Dz5Je+8uNBm6MmNPdh97n27kvJpophhrEAwUDeexcx
         q4R112R6nVPcuheHwadb9ga1P6Pk3ewE6o+QlErWvXNXnkcFTOfp4iCZRIRTlNkC3ybq
         Y00KyB8tmki8AZIV3xqODLnTb0gcVfKOVpyf2rnNNuhiTFosDoFOLtQDrph1r4wBkLSc
         j/ILaGArK3FYpcAmaSq8iWbXG/AyhklvJMsJsp0jF1yuL0VmSJJ4xJ19lKvNH6Ba8fWL
         qiksdxKKjJ6DQi4CZZL3wXXrkef5XO3utAQKFW2upX4xxY0Ib9Tyrhk7NVfw1ygXYfGQ
         9NAg==
X-Gm-Message-State: AJIora8Ut8M7s89z49aZaEKtmKHq74oxD0nKMq9X1UPLBCjlhGKYu1DW
        4XVrjFOunerjxZ5rp8cXQ1LAAA==
X-Google-Smtp-Source: AGRyM1tTbNM00buEWNj+mMZqtXT1rOVJjgiENRPle2178m2fMIYgDcVQisiVjwDhZS5ODqZ/jEhfVQ==
X-Received: by 2002:a05:6a00:a8b:b0:4cd:6030:4df3 with SMTP id b11-20020a056a000a8b00b004cd60304df3mr8449781pfl.40.1657189667099;
        Thu, 07 Jul 2022 03:27:47 -0700 (PDT)
Received: from chromium.org ([2401:fa00:8f:203:e189:4251:f442:cb5b])
        by smtp.gmail.com with ESMTPSA id i72-20020a62874b000000b0051b9d15fc18sm26578750pfe.156.2022.07.07.03.27.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 07 Jul 2022 03:27:45 -0700 (PDT)
Date:   Thu, 7 Jul 2022 19:27:41 +0900
From:   Tomasz Figa <tfiga@chromium.org>
To:     Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
Cc:     linux-media@vger.kernel.org, sakari.ailus@linux.intel.com,
        Jacopo Mondi <jacopo+renesas@jmondi.org>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        niklas.soderlund+renesas@ragnatech.se,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        Pratyush Yadav <p.yadav@ti.com>
Subject: Re: [PATCH v11 34/36] media: v4l2-subdev: Add
 v4l2_subdev_state_xlate_streams() helper
Message-ID: <Ysa1HZh5f38iXDHf@chromium.org>
References: <20220301161156.1119557-1-tomi.valkeinen@ideasonboard.com>
 <20220301161156.1119557-35-tomi.valkeinen@ideasonboard.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220301161156.1119557-35-tomi.valkeinen@ideasonboard.com>
X-Spam-Status: No, score=-2.8 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Tomi, Laurent,

On Tue, Mar 01, 2022 at 06:11:54PM +0200, Tomi Valkeinen wrote:
> From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
> 
> Add a helper function to translate streams between two pads of a subdev,
> using the subdev's internal routing table.
> 

Thanks for the patch! Please see my comments inline.

> Signed-off-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
> Signed-off-by: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
> ---
>  drivers/media/v4l2-core/v4l2-subdev.c | 25 +++++++++++++++++++++++++
>  include/media/v4l2-subdev.h           | 23 +++++++++++++++++++++++
>  2 files changed, 48 insertions(+)
> 
> diff --git a/drivers/media/v4l2-core/v4l2-subdev.c b/drivers/media/v4l2-core/v4l2-subdev.c
> index e30338a53088..6a9fc62dacbf 100644
> --- a/drivers/media/v4l2-core/v4l2-subdev.c
> +++ b/drivers/media/v4l2-core/v4l2-subdev.c
> @@ -1529,6 +1529,31 @@ v4l2_subdev_state_get_opposite_stream_format(struct v4l2_subdev_state *state,
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
> +		    (*streams & BIT(route->sink_stream))) {
> +			streams0 |= BIT(route->sink_stream);
> +			streams1 |= BIT(route->source_stream);
> +		}
> +		if (route->source_pad == pad0 && route->sink_pad == pad1 &&
> +		    (*streams & BIT(route->source_stream))) {
> +			streams0 |= BIT(route->source_stream);
> +			streams1 |= BIT(route->sink_stream);
> +		}
> +	}
> +
> +	*streams = streams0;
> +	return streams1;
> +}
> +
>  int v4l2_subdev_get_fmt(struct v4l2_subdev *sd, struct v4l2_subdev_state *state,
>  			struct v4l2_subdev_format *format)
>  {
> diff --git a/include/media/v4l2-subdev.h b/include/media/v4l2-subdev.h
> index 1eced0f47296..992debe116ac 100644
> --- a/include/media/v4l2-subdev.h
> +++ b/include/media/v4l2-subdev.h
> @@ -1497,6 +1497,29 @@ struct v4l2_mbus_framefmt *
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

It might be just me, but somehow I associate "translate" with turning a
name from one namespace into a corresponding name from another
namespace. In this case I initially assumed that this function is
supposed to accept stream IDs from pad0 and return corresponding
stream IDs from pad1. However, it looks like this is move like - "tell
me which streams on pad1 are connected to the given pad0 streams". Is
this correct?

If yes, maybe v4l2_subdev_state_get_routed_streams() be a better name?

Best regards,
Tomasz

