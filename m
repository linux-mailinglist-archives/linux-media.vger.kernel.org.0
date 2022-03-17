Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id AF7634DC26D
	for <lists+linux-media@lfdr.de>; Thu, 17 Mar 2022 10:15:44 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229484AbiCQJQs (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 17 Mar 2022 05:16:48 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39800 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231799AbiCQJQq (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 17 Mar 2022 05:16:46 -0400
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id EA1D4111DCE
        for <linux-media@vger.kernel.org>; Thu, 17 Mar 2022 02:15:27 -0700 (PDT)
Received: from [192.168.1.111] (91-156-85-209.elisa-laajakaista.fi [91.156.85.209])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id E10A4493;
        Thu, 17 Mar 2022 10:15:25 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1647508526;
        bh=FoyF7ljRJtX+GVDq+xVsDQMmh6qHi9VKCNt8S+hK4IU=;
        h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
        b=sYiBat78x0EUSZWyYaiyq+wG3z7itoMtBpuXYD7oAZCwMN/5Ynhc8ku7rPNC6bM3R
         ScrGLMyNj4Oe2GVJuE6Nkk6Kro/OOZiQ/jQZ63s1ZFn0p4wI9XnQe8h35hpNBYXPPV
         oV0OctZCqIKesQ9ta+8qxWNakt3mlSq4Cpna3F78=
Message-ID: <98eb688c-ead4-b230-3602-1d19c540129d@ideasonboard.com>
Date:   Thu, 17 Mar 2022 11:15:23 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [PATCH v11 32/36] media: subdev: add
 v4l2_subdev_routing_validate() helper
Content-Language: en-US
To:     Jacopo Mondi <jacopo@jmondi.org>
Cc:     linux-media@vger.kernel.org, sakari.ailus@linux.intel.com,
        Jacopo Mondi <jacopo+renesas@jmondi.org>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        niklas.soderlund+renesas@ragnatech.se,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        Pratyush Yadav <p.yadav@ti.com>
References: <20220301161156.1119557-1-tomi.valkeinen@ideasonboard.com>
 <20220301161156.1119557-33-tomi.valkeinen@ideasonboard.com>
 <20220316111042.gi6sjgp6nditlut4@uno.localdomain>
From:   Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
In-Reply-To: <20220316111042.gi6sjgp6nditlut4@uno.localdomain>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,SPF_HELO_PASS,
        SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On 16/03/2022 13:10, Jacopo Mondi wrote:
> Hi Tomi
> 
> On Tue, Mar 01, 2022 at 06:11:52PM +0200, Tomi Valkeinen wrote:
>> From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
>>
>> Add a v4l2_subdev_routing_validate() helper for verifying routing for
>> common cases like only allowing non-overlapping 1-to-1 streams.
>>
>> Signed-off-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
>> Signed-off-by: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
>> ---
>>   drivers/media/v4l2-core/v4l2-subdev.c | 102 ++++++++++++++++++++++++++
>>   include/media/v4l2-subdev.h           |  39 ++++++++++
>>   2 files changed, 141 insertions(+)
>>
>> diff --git a/drivers/media/v4l2-core/v4l2-subdev.c b/drivers/media/v4l2-core/v4l2-subdev.c
>> index 1ceee8313246..a19236cf11b8 100644
>> --- a/drivers/media/v4l2-core/v4l2-subdev.c
>> +++ b/drivers/media/v4l2-core/v4l2-subdev.c
>> @@ -1551,6 +1551,108 @@ int v4l2_subdev_get_fmt(struct v4l2_subdev *sd, struct v4l2_subdev_state *state,
>>   }
>>   EXPORT_SYMBOL_GPL(v4l2_subdev_get_fmt);
>>
>> +int v4l2_subdev_routing_validate(struct v4l2_subdev *sd,
>> +				 const struct v4l2_subdev_krouting *routing,
>> +				 enum v4l2_subdev_routing_restriction disallow)
>> +{
>> +	u32 *remote_pads = NULL;
>> +	unsigned int i, j;
>> +	int ret = -EINVAL;
>> +
>> +	if (disallow & V4L2_SUBDEV_ROUTING_NO_STREAM_MIX) {
>> +		remote_pads = kcalloc(sd->entity.num_pads, sizeof(*remote_pads),
>> +				      GFP_KERNEL);
>> +		if (!remote_pads)
>> +			return -ENOMEM;
>> +
>> +		for (i = 0; i < sd->entity.num_pads; ++i)
>> +			remote_pads[i] = U32_MAX;
>> +	}
>> +
>> +	for (i = 0; i < routing->num_routes; ++i) {
>> +		const struct v4l2_subdev_route *route = &routing->routes[i];
> 
> I guess validating non-active routes is intentional.

I think it's better to ensure non-active routes are valid too.

  Tomi
