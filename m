Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 3E2E442F6DD
	for <lists+linux-media@lfdr.de>; Fri, 15 Oct 2021 17:17:54 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S240877AbhJOPT7 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 15 Oct 2021 11:19:59 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39038 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232267AbhJOPT6 (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 15 Oct 2021 11:19:58 -0400
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [IPv6:2001:4b98:dc2:55:216:3eff:fef7:d647])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 29BB2C061570
        for <linux-media@vger.kernel.org>; Fri, 15 Oct 2021 08:17:52 -0700 (PDT)
Received: from [192.168.1.136] (91-158-153-130.elisa-laajakaista.fi [91.158.153.130])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 6DD122E3;
        Fri, 15 Oct 2021 17:17:48 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1634311069;
        bh=pq8T99SCdGNGu6fJJxbDQbenHAxN1BhDvE2lzOA5xp4=;
        h=To:Cc:References:From:Subject:Date:In-Reply-To:From;
        b=WjmK/MteImYhzXA7pgNKhztYtu5ANdMGzUE61+wajL2mbAfQfVtDacSbbimPgyaH8
         nCprSpSIjpCnUFa1tK1f8leha/AxQgIycrfiZZmtAhp3yU72+CSJmuyIefp34Jq8Pn
         Dsch3ekh9R/vieB/I4odYzMp3X+Te5t3Dw6okK/U=
To:     Jacopo Mondi <jacopo@jmondi.org>
Cc:     linux-media@vger.kernel.org, sakari.ailus@linux.intel.com,
        Jacopo Mondi <jacopo+renesas@jmondi.org>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        niklas.soderlund+renesas@ragnatech.se,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        Pratyush Yadav <p.yadav@ti.com>,
        Michal Simek <michal.simek@xilinx.com>
References: <20211005085750.138151-1-tomi.valkeinen@ideasonboard.com>
 <20211005085750.138151-28-tomi.valkeinen@ideasonboard.com>
 <20211015121320.c7ctjcvyvwx4mhy4@uno.localdomain>
 <465623f3-c022-7ed3-29c3-d82a0cf8c952@ideasonboard.com>
 <20211015140527.sjgtljfymhqzzflr@uno.localdomain>
From:   Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
Subject: Re: [PATCH v9 27/36] media: subdev: Add [GS]_ROUTING subdev ioctls
 and operations
Message-ID: <1bf26b9c-f468-2981-aa3e-df5bdc784849@ideasonboard.com>
Date:   Fri, 15 Oct 2021 18:17:45 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <20211015140527.sjgtljfymhqzzflr@uno.localdomain>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi,

On 15/10/2021 17:05, Jacopo Mondi wrote:

> Ok, I understand this allow you to
> 
>          int _set_routing(sd, state, krouting)
>          {
>                  v4l2_subdev_set_routing(krouting);
> 
>          }
> 
>          int set_routing(sd, state, which, krouting)
>          {
>                  _set_routing(sd, state, krouting);
>                  if (which == ACTIVE)
>                          apply_to_hw();
>          }
> 
>          pad_ops ops = {
>                  .set_routing = set_routing,
>          };
> 
>          int init_cfg(sd, state)
>          {
>                  routes = {
>                          ...
>                  };
> 
>                  krouting routing {
>                          .routes = routes,
>                          .num_routes = 1,
>                  };
> 
>                  _set_routing(sd, state, &routing);
>          }

Yes, although I would guess that the likely use of which in set_routing is

if (which == ACTIVE && priv->streaming)
	return -EBUSY;

> We're moving the issue with init_cfg() not being aware of the
> active/try to the set_routing() operation signature (and in cascade to
> all operation that operate on krouting from where 'which' had been
> removed to comply with init_cfg).

Hmm, what operations? set_routing() subdev op is the only place that 
needs the which, afaics. The issue with the previous series was that we 
needed 'which' in places where we shouldn't. In the v9, that issue is gone.

Or do you see issues with your series caused by this change?

> I was actually advocating instead for adding back which to
> krouting and have all the other v4l2_subdev functions that operates on
> routing and do not care about 'which' to use the raw routes and their
> number
> 
> 
>          --- v4l2-subdev.h/c ---
> 
>          struct krouting {
>                  which;
>                  num_routes;
>                  routes;
>          };
> 
>          int v4l2_subdev_set_routing(sd, state, routes, num_routes)
>          {
> 
>                  /* Copy routes into state */
> 
>          }
> 
>          ---- subdevice driver ----
> 
>          int _set_routing(sd, state, routes, num_routes)
>          {
>                  return v4l2_subdev_set_routing(sd, state, routes,
>                                                 num_routes);
> 
>          }
> 
>          int set_routing(sd, state, krouting)
>          {
>                  _set_routing(sd, state, krouting->routes, krouting->num_routes)
> 
>                  if (krouting->which == ACTIVE)
>                          apply_to_hw();
>          }
> 
>          pad_ops ops = {
>                  .set_routing = set_routing,
>          };
> 
>          int init_cfg(sd, state)
>          {
>                  routes routing[] = {
>                          ...
>                  };
> 
>                  _set_routing(sd, state, routing, ARRAY_SIZE(routing));
>          }
> 
> So that
> - krouting contains 'which' but is only used in the set_routing
>    operation
> - init_cfg doesn't have to initialize a krouting just for the purpose
>    of pleasing the v4l2_subdev function signatures

Why do you want the routes and num_routes handled separately? Isn't it 
nicer if they're grouped together in a struct?

> It requires to remove krouting from all the v4l2_subdev_*route*()
> functions in v4l2_subdev.c and have them work on the raw routes
> ('routes' and 'num_routes' could as well be grouped in one structure
> like you had in v8).

If they're grouped, then... Wouldn't we just be back in the case I 
described in the mail you linked, having a struct for the sole purpose 
of passing parameters to set_routing?

> As you asked for opinions and I failed to provide one in v8 it
> wouldn't be fair to ask you to backtrack just to see how it looks
> like, so here you have a patch to be applied on top of your branch for
> you to take into consideration (test on my gmsl work on top of your
> v9).

So it's not quite clear to me what's the issue you see here.

Is it just that you don't like passing 'which' separately to 
set_routing(), but other ops get it in a struct? If that's a problem, we 
can create the extra struct used solely for calling set_routing.

Or do you think it's better to have routes and num_routes used 
separately, as you do in your patch? If so, why, what's the benefit?

  Tomi
