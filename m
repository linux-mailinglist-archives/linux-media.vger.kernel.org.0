Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 430D2725DC9
	for <lists+linux-media@lfdr.de>; Wed,  7 Jun 2023 13:57:22 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S239729AbjFGL5U (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 7 Jun 2023 07:57:20 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47476 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S238698AbjFGL5T (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Wed, 7 Jun 2023 07:57:19 -0400
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id AADED1BD9
        for <linux-media@vger.kernel.org>; Wed,  7 Jun 2023 04:57:11 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id D887762CB7
        for <linux-media@vger.kernel.org>; Wed,  7 Jun 2023 11:57:10 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AC188C433D2;
        Wed,  7 Jun 2023 11:57:08 +0000 (UTC)
Message-ID: <08ad7e60-56a5-7032-4026-ed4b189ed986@xs4all.nl>
Date:   Wed, 7 Jun 2023 13:57:07 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
Subject: Re: [PATCH v5 4/7] v4l2-ctl/compliance: Add simple routing test
Content-Language: en-US
From:   Hans Verkuil <hverkuil-cisco@xs4all.nl>
To:     Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>,
        linux-media@vger.kernel.org, sakari.ailus@linux.intel.com,
        Jacopo Mondi <jacopo.mondi@ideasonboard.com>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        niklas.soderlund+renesas@ragnatech.se,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        satish.nagireddy@getcruise.com
Cc:     Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
References: <20230529085003.47207-1-tomi.valkeinen@ideasonboard.com>
 <20230529085003.47207-5-tomi.valkeinen@ideasonboard.com>
 <8e2eb443-a245-584c-b418-3fb94d47abd9@xs4all.nl>
 <e2cc9a49-1d89-1b35-32fb-90134d6f61bd@xs4all.nl>
In-Reply-To: <e2cc9a49-1d89-1b35-32fb-90134d6f61bd@xs4all.nl>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-6.8 required=5.0 tests=BAYES_00,
        HEADER_FROM_DIFFERENT_DOMAINS,NICE_REPLY_A,RCVD_IN_DNSWL_HI,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On 07/06/2023 13:48, Hans Verkuil wrote:
> On 07/06/2023 13:35, Hans Verkuil wrote:
>> On 29/05/2023 10:50, Tomi Valkeinen wrote:
>>> Add a very simple test for
>>> VIDIOC_SUBDEV_G_ROUTING/VIDIOC_SUBDEV_S_ROUTING.
>>>
>>> We can't (at least at the moment) really know here what kind of routings
>>> the driver would accept, but we can test a VIDIOC_SUBDEV_G_ROUTING call,
>>> followed by a VIDIOC_SUBDEV_S_ROUTING call with the routing we
>>> received.
>>>
>>> Signed-off-by: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
>>> Reviewed-by: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
>>> ---
>>>  utils/v4l2-compliance/v4l2-compliance.cpp   | 12 ++++++++++++
>>>  utils/v4l2-compliance/v4l2-compliance.h     |  1 +
>>>  utils/v4l2-compliance/v4l2-test-subdevs.cpp | 16 ++++++++++++++++
>>>  3 files changed, 29 insertions(+)
>>>
>>> diff --git a/utils/v4l2-compliance/v4l2-compliance.cpp b/utils/v4l2-compliance/v4l2-compliance.cpp
>>> index d7c10482..f082f569 100644
>>> --- a/utils/v4l2-compliance/v4l2-compliance.cpp
>>> +++ b/utils/v4l2-compliance/v4l2-compliance.cpp
>>> @@ -1249,6 +1249,18 @@ void testNode(struct node &node, struct node &node_m2m_cap, struct node &expbuf_
>>>  		node.is_passthrough_subdev = has_source && has_sink;
>>>  
>>>  		if (has_routes) {
>>> +			printf("Sub-Device routing ioctls:\n");
>>> +
>>> +			for (unsigned which = V4L2_SUBDEV_FORMAT_TRY;
>>> +				which <= V4L2_SUBDEV_FORMAT_ACTIVE; which++) {
>>> +
>>> +				printf("\ttest %s VIDIOC_SUBDEV_G_ROUTING/VIDIOC_SUBDEV_S_ROUTING: %s\n",
>>> +				       which ? "Active" : "Try",
>>> +				       ok(testSubDevRouting(&node, which)));
>>> +			}
>>> +
>>> +			printf("\n");
>>> +
>>>  			for (unsigned which = V4L2_SUBDEV_FORMAT_TRY;
>>>  				which <= V4L2_SUBDEV_FORMAT_ACTIVE; which++) {
>>>  
>>> diff --git a/utils/v4l2-compliance/v4l2-compliance.h b/utils/v4l2-compliance/v4l2-compliance.h
>>> index 0cd43980..35b2274b 100644
>>> --- a/utils/v4l2-compliance/v4l2-compliance.h
>>> +++ b/utils/v4l2-compliance/v4l2-compliance.h
>>> @@ -375,6 +375,7 @@ int testSubDevEnum(struct node *node, unsigned which, unsigned pad, unsigned str
>>>  int testSubDevFormat(struct node *node, unsigned which, unsigned pad, unsigned stream);
>>>  int testSubDevSelection(struct node *node, unsigned which, unsigned pad, unsigned stream);
>>>  int testSubDevFrameInterval(struct node *node, unsigned pad, unsigned stream);
>>> +int testSubDevRouting(struct node *node, unsigned which);
>>>  
>>>  // Buffer ioctl tests
>>>  int testReqBufs(struct node *node);
>>> diff --git a/utils/v4l2-compliance/v4l2-test-subdevs.cpp b/utils/v4l2-compliance/v4l2-test-subdevs.cpp
>>> index 07192bda..962d9244 100644
>>> --- a/utils/v4l2-compliance/v4l2-test-subdevs.cpp
>>> +++ b/utils/v4l2-compliance/v4l2-test-subdevs.cpp
>>> @@ -551,3 +551,19 @@ int testSubDevSelection(struct node *node, unsigned which, unsigned pad, unsigne
>>>  
>>>  	return have_sel ? 0 : ENOTTY;
>>>  }
>>> +
>>> +int testSubDevRouting(struct node *node, unsigned which)
>>> +{
>>> +	struct v4l2_subdev_routing routing = {};
>>> +	struct v4l2_subdev_route routes[256] = {};
>>
>> NUM_ROUTES_MAX
>>
>>> +
>>> +	routing.which = which;
>>> +	routing.routes = (__u64)&routes;
>>> +	routing.num_routes = 256;
>>
>> NUM_ROUTES_MAX
> 
> Actually, you should also test the corner cases of NUM_ROUTES_MAX + 1
> (that should fail, right?) and setting num_routes to 0 and check that
> ENOSPC is returned and num_routes is updated.
> 
> Also verify that 'reserved' is zeroed (i.e. set it to 0xff here, then
> check for 0 after the ioctl).

I assume also that if num_routes is set to 256, then G_ROUTING is called,
num_routes is updated to the actual number of routes? The spec does not
actually state that.

And what should happen when num_routes is set to 0 and S_ROUTING is called?
Would that clear all routes? Or is that an error? And can G_ROUTING actually
return num_routes == 0 as well if there are no routes defined?

Additional checks you can do is to verify that all sink/source pads are valid
and that 'flags' is valid.

Another test is setting a pad or stream to an invalid value and verify that EINVAL
is returned.

Note that the spec says that E2BIG is returned for S_ROUTING, but it is returned
for G_ROUTING as well, that should be updated.

Regards,

	Hans

> 
> Regards,
> 
> 	Hans
> 
>>
>> Regards,
>>
>> 	Hans
>>
>>> +
>>> +	fail_on_test(doioctl(node, VIDIOC_SUBDEV_G_ROUTING, &routing));
>>> +
>>> +	fail_on_test(doioctl(node, VIDIOC_SUBDEV_S_ROUTING, &routing));
>>> +
>>> +	return 0;
>>> +}
>>
> 

