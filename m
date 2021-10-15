Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id AFDF542F105
	for <lists+linux-media@lfdr.de>; Fri, 15 Oct 2021 14:37:13 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235639AbhJOMjS (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 15 Oct 2021 08:39:18 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57268 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233469AbhJOMjL (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 15 Oct 2021 08:39:11 -0400
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [IPv6:2001:4b98:dc2:55:216:3eff:fef7:d647])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 562A2C061570
        for <linux-media@vger.kernel.org>; Fri, 15 Oct 2021 05:37:04 -0700 (PDT)
Received: from [192.168.1.111] (91-158-153-130.elisa-laajakaista.fi [91.158.153.130])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id EB94AB91;
        Fri, 15 Oct 2021 14:37:01 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1634301422;
        bh=3atWV4rEQqh6rNHziiY0XM5j0IdloLfPA9UfwfFixrY=;
        h=To:Cc:References:From:Subject:Date:In-Reply-To:From;
        b=dys8KmHwQWB8cWzAOmC2JbksJivvlIVxPeOAGWkbyJZJEv5izXH1h1VK1pKbG6RnH
         Q+oAxw7vvW8Joo12KAZ7/ZI0VTH0haGP/kmzwlL6DiHnylwgdF0/InTR3t62hNpCt1
         47zSIoj42dIcuveqCzxF6TCBrCFz7js78+fejQu0=
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
From:   Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
Subject: Re: [PATCH v9 27/36] media: subdev: Add [GS]_ROUTING subdev ioctls
 and operations
Message-ID: <465623f3-c022-7ed3-29c3-d82a0cf8c952@ideasonboard.com>
Date:   Fri, 15 Oct 2021 15:36:58 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <20211015121320.c7ctjcvyvwx4mhy4@uno.localdomain>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi,

On 15/10/2021 15:13, Jacopo Mondi wrote:

>> +/**
>> + * struct v4l2_subdev_krouting - subdev routing table
>> + *
>> + * @num_routes: number of routes
>> + * @routes: &struct v4l2_subdev_route
>> + *
>> + * This structure contains the routing table for a subdev.
>> + */
>> +struct v4l2_subdev_krouting {
>> +	unsigned int num_routes;
>> +	struct v4l2_subdev_route *routes;
>> +};
> 
> Re-reading v8
> https://patchwork.linuxtv.org/project/linux-media/patch/20210830110116.488338-3-tomi.valkeinen@ideasonboard.com/#131630
> 
> my understanding was that your intention was to pass to the
> set_routing() op the num_routes, *routes and which and drop
> v4l2_subdev_krouting

No, that was not what I meant. But I did write it a bit unclearly, I 
admit...

I think I meant "drop v4l2_subdev_krouting, and pass 
v4l2_subdev_routing_table to the ops".

>> +
>>   /**
>>    * struct v4l2_subdev_state - Used for storing subdev state information.
>>    *
>>    * @lock: mutex for the state
>>    * @pads: &struct v4l2_subdev_pad_config array
>> + * @routing: routing table for the subdev
>>    *
>>    * This structure only needs to be passed to the pad op if the 'which' field
>>    * of the main argument is set to %V4L2_SUBDEV_FORMAT_TRY. For
>> @@ -707,6 +721,7 @@ struct v4l2_subdev_pad_config {
>>   struct v4l2_subdev_state {
>>   	struct mutex lock;
>>   	struct v4l2_subdev_pad_config *pads;
>> +	struct v4l2_subdev_krouting routing;
>>   };
>>
>>   /**
>> @@ -770,6 +785,9 @@ struct v4l2_subdev_state {
>>    *		     applied to the hardware. The operation shall fail if the
>>    *		     pad index it has been called on is not valid or in case of
>>    *		     unrecoverable failures.
>> + *
>> + * @set_routing: enable or disable data connection routes described in the
>> + *		 subdevice routing table.
>>    */
>>   struct v4l2_subdev_pad_ops {
>>   	int (*init_cfg)(struct v4l2_subdev *sd,
>> @@ -814,6 +832,10 @@ struct v4l2_subdev_pad_ops {
>>   			       struct v4l2_mbus_config *config);
>>   	int (*set_mbus_config)(struct v4l2_subdev *sd, unsigned int pad,
>>   			       struct v4l2_mbus_config *config);
>> +	int (*set_routing)(struct v4l2_subdev *sd,
>> +			   struct v4l2_subdev_state *state,
>> +			   enum v4l2_subdev_format_whence which,
>> +			   struct v4l2_subdev_krouting *route);
> 
> But it seems you've instead coalesced v4l2_subdev_routing_table into
> v4l2_subdev_krouting (which I like!)
> 
> But why keep 'which' as a standalone parameter instead of adding it to
> v4l2_subdev_krouting ? This operation signature is a bit of an
> outliner as other ops have 'which' embedded in op-specific
> structures.

The whole point here was to remove 'which'. Otherwise the routing table 
contains 'which', and the drivers somehow need to come up with a correct 
'which' value, which was causing trouble.

E.g. in init_cfg, you want to set up routing. But init_cfg is supposed 
to be 'which-less', the init should be the same for both active and try 
states.

The only use of 'which' in the routing table is when calling 
set_routing(). It's never needed after that. So it's pointless to store 
the 'which' value in the state.

The other ops have a struct as a parameter that comes directly from the 
userspace, and thus contains the 'which'. But any data they store to the 
state does not contain 'which'.

So, we could do the same, have the structs as they are in the mail you 
linked. But then we have the struct v4l2_subdev_krouting, which is only 
used when calling set_routing, and the only purpose of that struct would 
be to avoid passing 'which' as a parameter to set_routing...

  Tomi
