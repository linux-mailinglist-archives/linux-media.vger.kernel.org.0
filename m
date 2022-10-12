Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 81B1F5FC079
	for <lists+linux-media@lfdr.de>; Wed, 12 Oct 2022 08:15:40 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229504AbiJLGPi (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 12 Oct 2022 02:15:38 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48158 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229491AbiJLGPh (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 12 Oct 2022 02:15:37 -0400
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [IPv6:2001:4b98:dc2:55:216:3eff:fef7:d647])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7E05458B58
        for <linux-media@vger.kernel.org>; Tue, 11 Oct 2022 23:15:36 -0700 (PDT)
Received: from [192.168.1.15] (91-158-154-79.elisa-laajakaista.fi [91.158.154.79])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 1D1324DB;
        Wed, 12 Oct 2022 08:15:34 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1665555334;
        bh=1/bGvAQN+I9ldmBaK/hqi6rhEX5xR3KbVjGTcz3j9Vc=;
        h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
        b=FXBFIjWsW37q0u4GYtgUMlhjdIO13M1nB3bRw6WHdxdHia9YgqXYl7ZQx3V8z0dfB
         gtkaWX5qIfw0pkJEpFrBAosd2chKpx5nHHeTjHTWMT4z477L5WBWTZSu8hIuWm929S
         tRXIq1q7lPhCq/kBsw+y7817mtCg/ijHjQ5Qnn04=
Message-ID: <c8a132f8-0f42-a720-72d1-06c29a90c5fc@ideasonboard.com>
Date:   Wed, 12 Oct 2022 09:15:31 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.2.2
Subject: Re: [PATCH v15 08/19] media: subdev: Add for_each_active_route()
 macro
Content-Language: en-US
To:     Dafna Hirschfeld <dafna@fastmail.com>
Cc:     linux-media@vger.kernel.org, sakari.ailus@linux.intel.com,
        Jacopo Mondi <jacopo+renesas@jmondi.org>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        niklas.soderlund+renesas@ragnatech.se,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        Kishon Vijay Abraham <kishon@ti.com>,
        satish.nagireddy@getcruise.com, Tomasz Figa <tfiga@chromium.org>
References: <20221003121852.616745-1-tomi.valkeinen@ideasonboard.com>
 <20221003121852.616745-9-tomi.valkeinen@ideasonboard.com>
 <20221009053859.fmiiwdu4rjxe5c7g@guri>
From:   Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
In-Reply-To: <20221009053859.fmiiwdu4rjxe5c7g@guri>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-5.0 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,SPF_HELO_PASS,
        SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On 09/10/2022 08:38, Dafna Hirschfeld wrote:
> On 03.10.2022 15:18, Tomi Valkeinen wrote:
>> From: Jacopo Mondi <jacopo+renesas@jmondi.org>
>>
>> Add a for_each_active_route() macro to replace the repeated pattern
>> of iterating on the active routes of a routing table.
>>
>> Signed-off-by: Jacopo Mondi <jacopo+renesas@jmondi.org>
>> Signed-off-by: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
>> ---
>> .clang-format                         |  1 +
>> drivers/media/v4l2-core/v4l2-subdev.c | 20 ++++++++++++++++++++
>> include/media/v4l2-subdev.h           | 13 +++++++++++++
>> 3 files changed, 34 insertions(+)
>>
>> diff --git a/.clang-format b/.clang-format
>> index 1247d54f9e49..31f39ae78f7b 100644
>> --- a/.clang-format
>> +++ b/.clang-format
>> @@ -190,6 +190,7 @@ ForEachMacros:
>>   - 'for_each_active_dev_scope'
>>   - 'for_each_active_drhd_unit'
>>   - 'for_each_active_iommu'
>> +  - 'for_each_active_route'
>>   - 'for_each_aggr_pgid'
>>   - 'for_each_available_child_of_node'
>>   - 'for_each_bench'
>> diff --git a/drivers/media/v4l2-core/v4l2-subdev.c 
>> b/drivers/media/v4l2-core/v4l2-subdev.c
>> index 3ae4f39a50e4..1049c07d2e49 100644
>> --- a/drivers/media/v4l2-core/v4l2-subdev.c
>> +++ b/drivers/media/v4l2-core/v4l2-subdev.c
>> @@ -1212,6 +1212,26 @@ int v4l2_subdev_set_routing(struct v4l2_subdev 
>> *sd,
>> }
>> EXPORT_SYMBOL_GPL(v4l2_subdev_set_routing);
>>
>> +struct v4l2_subdev_route *
>> +__v4l2_subdev_next_active_route(const struct v4l2_subdev_krouting 
>> *routing,
>> +                struct v4l2_subdev_route *route)
>> +{
>> +    if (route)
>> +        ++route;
>> +    else
>> +        route = &routing->routes[0];
>> +
>> +    for (; route < routing->routes + routing->num_routes; ++route) {
>> +        if (!(route->flags & V4L2_SUBDEV_ROUTE_FL_ACTIVE))
>> +            continue;
>> +
>> +        return route;
>> +    }
>> +
>> +    return NULL;
>> +}
>> +EXPORT_SYMBOL_GPL(__v4l2_subdev_next_active_route);
>> +
>> #endif /* CONFIG_VIDEO_V4L2_SUBDEV_API */
>>
>> #endif /* CONFIG_MEDIA_CONTROLLER */
>> diff --git a/include/media/v4l2-subdev.h b/include/media/v4l2-subdev.h
>> index 7962e6572bda..89e58208e330 100644
>> --- a/include/media/v4l2-subdev.h
>> +++ b/include/media/v4l2-subdev.h
>> @@ -1435,6 +1435,19 @@ int v4l2_subdev_set_routing(struct v4l2_subdev 
>> *sd,
>>                 struct v4l2_subdev_state *state,
>>                 const struct v4l2_subdev_krouting *routing);
>>
>> +struct v4l2_subdev_route *
>> +__v4l2_subdev_next_active_route(const struct v4l2_subdev_krouting 
>> *routing,
>> +                struct v4l2_subdev_route *route);
>> +
>> +/**
>> + * for_each_active_route - iterate on all active routes of a routing 
>> table
>> + * @routing: The routing table
>> + * @route: The route iterator
>> + */
>> +#define for_each_active_route(routing, route) \
>> +    for ((route) = NULL;                  \
>> +         ((route) = __v4l2_subdev_next_active_route((routing), 
>> (route)));)
> Hi, shouldn't it be something like:
>      for ((route) = NULL; (route) ; (route) = 
> __v4l2_subdev_next_active_route((routing), (route)))

What you suggest would never do anything: you initialize route to NULL, 
and then check if the route is !NULL.

I also find the current version a bit "interesting", but afaics, it 
works correctly.

  Tomi

