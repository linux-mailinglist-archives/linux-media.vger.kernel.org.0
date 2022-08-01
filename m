Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id A179458667C
	for <lists+linux-media@lfdr.de>; Mon,  1 Aug 2022 10:40:31 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229816AbiHAIk3 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 1 Aug 2022 04:40:29 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51036 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229671AbiHAIk3 (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Mon, 1 Aug 2022 04:40:29 -0400
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1165C2A246
        for <linux-media@vger.kernel.org>; Mon,  1 Aug 2022 01:40:26 -0700 (PDT)
Received: from [192.168.1.111] (91-158-154-79.elisa-laajakaista.fi [91.158.154.79])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 1809D2F3;
        Mon,  1 Aug 2022 10:40:24 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1659343224;
        bh=lfoa7quIx85ro0ICMsUeUJ0JjwzTyBF38TjmIdwtvME=;
        h=Date:Subject:To:References:From:In-Reply-To:From;
        b=rHLChApjXumseQaO8FmTwNDVEjbNixcFLh/pBhaBmT+SUejsTGmM5NaMAtgnNsRve
         qzhdDeDpTHvP2vyP3rR9vV5Q7Ihjr9aUT1P70WwAje6JIMR896VljR6pUZWIhVNfo7
         y/QxWaWM+shoV/KeLhQJvP12zr1EUaB5BcY9BzhI=
Message-ID: <8adf413e-1a65-6c5a-3059-57ac48ae763c@ideasonboard.com>
Date:   Mon, 1 Aug 2022 11:40:21 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [PATCH v12 23/30] media: subdev: Add for_each_active_route()
 macro
Content-Language: en-US
To:     linux-media@vger.kernel.org, sakari.ailus@linux.intel.com,
        Jacopo Mondi <jacopo+renesas@jmondi.org>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        niklas.soderlund+renesas@ragnatech.se,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        Pratyush Yadav <p.yadav@ti.com>,
        Kishon Vijay Abraham <kishon@ti.com>,
        satish.nagireddy@getcruise.com, Tomasz Figa <tfiga@chromium.org>
References: <20220727103639.581567-1-tomi.valkeinen@ideasonboard.com>
 <20220727103639.581567-24-tomi.valkeinen@ideasonboard.com>
From:   Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
In-Reply-To: <20220727103639.581567-24-tomi.valkeinen@ideasonboard.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,SPF_HELO_PASS,
        SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On 27/07/2022 13:36, Tomi Valkeinen wrote:

> @@ -1593,6 +1593,19 @@ int v4l2_subdev_routing_validate(struct v4l2_subdev *sd,
>   				 const struct v4l2_subdev_krouting *routing,
>   				 enum v4l2_subdev_routing_restriction disallow);
>   
> +struct v4l2_subdev_route *
> +__v4l2_subdev_next_active_route(const struct v4l2_subdev_krouting *routing,
> +				struct v4l2_subdev_route *route);
> +
> +/**
> + * for_each_active_route - iterate on all active routes of a routing table
> + * @routing: The routing table
> + * @route: The route iterator
> + */
> +#define for_each_active_route(routing, route) \
> +	for ((route) = NULL;                  \
> +	     ((route) = __v4l2_subdev_next_active_route((routing), (route)));)
> +

By the way, now that we can do it, how do people feel about changing the
above (and other similar macros) to something like:

#define for_each_active_route(routing, route)        \
	for (struct v4l2_subdev_route *route = NULL; \
	     (route = __v4l2_subdev_next_active_route((routing), route));)

  Tomi
