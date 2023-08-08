Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id CC36E7747F5
	for <lists+linux-media@lfdr.de>; Tue,  8 Aug 2023 21:22:42 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235991AbjHHTWg (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 8 Aug 2023 15:22:36 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47120 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236273AbjHHTWK (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Tue, 8 Aug 2023 15:22:10 -0400
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3D32410F218
        for <linux-media@vger.kernel.org>; Tue,  8 Aug 2023 09:45:55 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id 711C362384
        for <linux-media@vger.kernel.org>; Tue,  8 Aug 2023 07:15:48 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 41822C433C8;
        Tue,  8 Aug 2023 07:15:46 +0000 (UTC)
Message-ID: <155a002b-49fd-3af2-c005-895eab63016d@xs4all.nl>
Date:   Tue, 8 Aug 2023 09:15:44 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.12.0
Subject: Re: [PATCH v6 5/8] v4l2-ctl/compliance: Add simple routing test
Content-Language: en-US, nl
To:     Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>,
        linux-media@vger.kernel.org, sakari.ailus@linux.intel.com,
        Jacopo Mondi <jacopo.mondi@ideasonboard.com>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        niklas.soderlund+renesas@ragnatech.se,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        satish.nagireddy@getcruise.com
References: <20230720075044.442021-1-tomi.valkeinen@ideasonboard.com>
 <20230720075044.442021-6-tomi.valkeinen@ideasonboard.com>
 <2c282976-5890-8da9-ac6b-cdc642ab9d99@xs4all.nl>
 <94fefde1-02c9-6034-72cc-e6a30aa3f786@ideasonboard.com>
From:   Hans Verkuil <hverkuil-cisco@xs4all.nl>
In-Reply-To: <94fefde1-02c9-6034-72cc-e6a30aa3f786@ideasonboard.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-8.5 required=5.0 tests=BAYES_00,
        HEADER_FROM_DIFFERENT_DOMAINS,NICE_REPLY_A,RCVD_IN_DNSWL_HI,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On 08/08/2023 07:56, Tomi Valkeinen wrote:
> On 02/08/2023 16:54, Hans Verkuil wrote:
>> On 20/07/2023 09:50, Tomi Valkeinen wrote:
>>> Add a simple test for VIDIOC_SUBDEV_G_ROUTING/VIDIOC_SUBDEV_S_ROUTING.
>>>
>>> We can't (at least at the moment) really know here what kind of routings
>>> the driver would accept, but we can test a VIDIOC_SUBDEV_G_ROUTING call,
>>> followed by a VIDIOC_SUBDEV_S_ROUTING call with the routing we
>>> received.
>>>
>>> Additionally, we can check that the returned pads and flags look fine,
>>> and also that setting obviously invalid routing will fail.
>>>
>>> Signed-off-by: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
>>> ---
>>>   utils/v4l2-compliance/v4l2-compliance.cpp   | 12 ++++
>>>   utils/v4l2-compliance/v4l2-compliance.h     |  1 +
>>>   utils/v4l2-compliance/v4l2-test-subdevs.cpp | 74 +++++++++++++++++++++
>>>   3 files changed, 87 insertions(+)
>>>
>>> diff --git a/utils/v4l2-compliance/v4l2-compliance.cpp b/utils/v4l2-compliance/v4l2-compliance.cpp
>>> index e8359b2f..4b232314 100644
>>> --- a/utils/v4l2-compliance/v4l2-compliance.cpp
>>> +++ b/utils/v4l2-compliance/v4l2-compliance.cpp
>>> @@ -1249,6 +1249,18 @@ void testNode(struct node &node, struct node &node_m2m_cap, struct node &expbuf_
>>>           node.is_passthrough_subdev = has_source && has_sink;
>>>             if (has_routes) {
>>> +            printf("Sub-Device routing ioctls:\n");
>>> +
>>> +            for (unsigned which = V4L2_SUBDEV_FORMAT_TRY;
>>> +                which <= V4L2_SUBDEV_FORMAT_ACTIVE; which++) {
>>> +
>>> +                printf("\ttest %s VIDIOC_SUBDEV_G_ROUTING/VIDIOC_SUBDEV_S_ROUTING: %s\n",
>>> +                       which ? "Active" : "Try",
>>> +                       ok(testSubDevRouting(&node, which)));
>>> +            }
>>> +
>>> +            printf("\n");
>>> +
>>>               for (unsigned which = V4L2_SUBDEV_FORMAT_TRY;
>>>                   which <= V4L2_SUBDEV_FORMAT_ACTIVE; which++) {
>>>   diff --git a/utils/v4l2-compliance/v4l2-compliance.h b/utils/v4l2-compliance/v4l2-compliance.h
>>> index 0cd43980..35b2274b 100644
>>> --- a/utils/v4l2-compliance/v4l2-compliance.h
>>> +++ b/utils/v4l2-compliance/v4l2-compliance.h
>>> @@ -375,6 +375,7 @@ int testSubDevEnum(struct node *node, unsigned which, unsigned pad, unsigned str
>>>   int testSubDevFormat(struct node *node, unsigned which, unsigned pad, unsigned stream);
>>>   int testSubDevSelection(struct node *node, unsigned which, unsigned pad, unsigned stream);
>>>   int testSubDevFrameInterval(struct node *node, unsigned pad, unsigned stream);
>>> +int testSubDevRouting(struct node *node, unsigned which);
>>>     // Buffer ioctl tests
>>>   int testReqBufs(struct node *node);
>>> diff --git a/utils/v4l2-compliance/v4l2-test-subdevs.cpp b/utils/v4l2-compliance/v4l2-test-subdevs.cpp
>>> index 5545b0dc..e59d67f7 100644
>>> --- a/utils/v4l2-compliance/v4l2-test-subdevs.cpp
>>> +++ b/utils/v4l2-compliance/v4l2-test-subdevs.cpp
>>> @@ -551,3 +551,77 @@ int testSubDevSelection(struct node *node, unsigned which, unsigned pad, unsigne
>>>         return have_sel ? 0 : ENOTTY;
>>>   }
>>> +
>>> +int testSubDevRouting(struct node *node, unsigned which)
>>> +{
>>> +    const uint32_t all_route_flags_mask = V4L2_SUBDEV_ROUTE_FL_ACTIVE;
>>> +    struct v4l2_subdev_routing routing = {};
>>> +    struct v4l2_subdev_route routes[NUM_ROUTES_MAX] = {};
>>> +    unsigned int i;
>>> +    int ret;
>>> +
>>> +    routing.which = which;
>>> +    routing.routes = (__u64)&routes;
>>> +    routing.num_routes = 0;
>>> +    memset(routing.reserved, 0xff, sizeof(routing.reserved));
>>> +
>>> +    /*
>>> +     * First test that G_ROUTING either returns success, or ENOSPC and
>>> +     * updates num_routes.
>>> +     */
>>> +
>>> +    ret = doioctl(node, VIDIOC_SUBDEV_G_ROUTING, &routing);
>>> +    fail_on_test(ret && ret != ENOSPC);
>>> +    fail_on_test(ret == ENOSPC && routing.num_routes == 0);
>>> +    fail_on_test(check_0(routing.reserved, sizeof(routing.reserved)));
>>> +
>>> +    if (routing.num_routes)
>>> +        return 0;
>>
>> Shouldn't this be 'if (!routing.num_routes)'?
> 
> Yes...
> 
>>> +
>>> +    /* Then get the actual routes */
>>> +
>>> +    routing.num_routes = NUM_ROUTES_MAX;
>>> +    fail_on_test(doioctl(node, VIDIOC_SUBDEV_G_ROUTING, &routing));
>>
>> I assume that num_routes is always updated to the actual number of routes, right?
> 
> If VIDIOC_SUBDEV_G_ROUTING succeeds, yes, num_routes is updated.
> 
>> That's not actually explained clearly in the spec. It says that if the app provided
>> num_routes is too small, then it is updated, but it says nothing about what happens
>> if the app provided value is too large.
> 
> Ok. I need to update the doc.
> 
>> Assuming I am right, then I would rewrite this code as follows:
>>
>>     __u32 num_routes = routing.num_routes;
>>     routing.num_routes = num_routes + 1;
>>     fail_on_test(doioctl(node, VIDIOC_SUBDEV_G_ROUTING, &routing));
>>     fail_on_test(routing.num_routes != num_routes);
> 
> Yes, I think this looks fine.
> 
> Btw, you use __u32 above. Is there any style guide for these? I used uint32_t in this function for another variable, and I'd use it here too.

It is derived from a kernel structure, and the kernel API uses __u32. So I prefer to
use __u32 for such things. I personally think that is good practice since it helps
indicate that it is a kernel-API-related variable.

I also like it because it is shorter than uint32_t :-)

Regards,

	Hans

> 
>>> +
>>> +    /* Check the validity of route pads and flags */
>>> +
>>> +    if (node->pads) {
>>> +        for (i = 0; i < routing.num_routes; ++i) {
>>> +            const struct v4l2_subdev_route *route = &routes[i];
>>> +            const struct media_pad_desc *sink;
>>> +            const struct media_pad_desc *source;
>>> +
>>> +            fail_on_test(route->sink_pad >= node->entity.pads);
>>> +            fail_on_test(route->source_pad >= node->entity.pads);
>>> +
>>> +            sink = &node->pads[route->sink_pad];
>>> +            source = &node->pads[route->source_pad];
>>> +
>>> +            fail_on_test(!(sink->flags & MEDIA_PAD_FL_SINK));
>>> +            fail_on_test(!(source->flags & MEDIA_PAD_FL_SOURCE));
>>> +            fail_on_test(route->flags & ~all_route_flags_mask);
>>> +        }
>>> +    }
>>> +
>>> +    /* Set the same routes back, which should always succeed. */
>>> +
>>> +    memset(routing.reserved, 0xff, sizeof(routing.reserved));
>>> +    fail_on_test(doioctl(node, VIDIOC_SUBDEV_S_ROUTING, &routing));
>>> +    fail_on_test(check_0(routing.reserved, sizeof(routing.reserved)));
>>> +
>>> +    /* Test setting invalid pads */
>>> +
>>> +    if (node->pads) {
>>> +        for (i = 0; i < routing.num_routes; ++i) {
>>> +            struct v4l2_subdev_route *route = &routes[i];
>>> +
>>> +            route->sink_pad = node->entity.pads + 1;
>>> +        }
>>> +
>>> +        memset(routing.reserved, 0xff, sizeof(routing.reserved));
>>> +        fail_on_test(doioctl(node, VIDIOC_SUBDEV_S_ROUTING, &routing) != EINVAL);
>>> +        fail_on_test(check_0(routing.reserved, sizeof(routing.reserved)));
> 
> After fixing the num_routes check, I noticed that this one is broken too. If S_ROUTING fails early enough, the reserved field won't get cleared, so we can't have this check here.
> 
>>> +    }
>>> +
>>> +    return 0;
>>> +}
>>
>> Regards,
>>
>>     Hans
> 

