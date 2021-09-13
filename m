Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id EE28C408AE0
	for <lists+linux-media@lfdr.de>; Mon, 13 Sep 2021 14:17:09 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S239916AbhIMMSX (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 13 Sep 2021 08:18:23 -0400
Received: from perceval.ideasonboard.com ([213.167.242.64]:36230 "EHLO
        perceval.ideasonboard.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S237090AbhIMMSW (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 13 Sep 2021 08:18:22 -0400
Received: from [192.168.1.111] (91-158-153-130.elisa-laajakaista.fi [91.158.153.130])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 4218E9E;
        Mon, 13 Sep 2021 14:17:05 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1631535425;
        bh=LakUeivZT+kpqe1bt7UJMEXifq6EyhbIr6N+NcgSSvA=;
        h=To:Cc:References:From:Subject:Date:In-Reply-To:From;
        b=iKN3H6nOm8ES7UEI1np4u3Ruw4K5qEcbQSPYGz4ID6FmwrrFiggtKw9l70C1qKXyt
         dalv448MjYsYjGmWwSYJFJHqbpi6YbOWxnu5Fa/8ZyWCRBXor/de3af/nBERD4cIX8
         YfzSIuYAA+n6z+vThcw5UDphKzH+pzCHsp+sfmmc=
To:     Jacopo Mondi <jacopo@jmondi.org>
Cc:     linux-media@vger.kernel.org, sakari.ailus@linux.intel.com,
        Jacopo Mondi <jacopo+renesas@jmondi.org>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        niklas.soderlund+renesas@ragnatech.se,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        Pratyush Yadav <p.yadav@ti.com>,
        Lokesh Vutla <lokeshvutla@ti.com>
References: <20210830110116.488338-1-tomi.valkeinen@ideasonboard.com>
 <20210830110116.488338-4-tomi.valkeinen@ideasonboard.com>
 <20210913114154.ovffxjoghgdud4js@uno.localdomain>
From:   Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
Subject: Re: [PATCH v8 03/36] media: subdev: add 'which' to subdev state
Message-ID: <0733ae28-bcd9-6dc8-fb6a-0fa43beb1191@ideasonboard.com>
Date:   Mon, 13 Sep 2021 15:17:01 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <20210913114154.ovffxjoghgdud4js@uno.localdomain>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On 13/09/2021 14:41, Jacopo Mondi wrote:
> Hi Tomi,
> 
> On Mon, Aug 30, 2021 at 02:00:43PM +0300, Tomi Valkeinen wrote:
>> The subdev state is passed to functions in the media drivers, and
>> usually either V4L2_SUBDEV_FORMAT_ACTIVE or V4L2_SUBDEV_FORMAT_TRY is
>> also given to the function in one way or another.
>>
>> One op where this is not the case is v4l2_subdev_pad_ops.init_cfg. One
>> could argue that the initialization of the state should be the same for
>> both ACTIVE and TRY cases, but unfortunately that is not the case:
>>
>> - Some drivers do also other things than just touch the state when
>> dealing with ACTIVE, e.g. if there is extra state outside the standard
>> subdev state.
>> - Some drivers might need to create, say, struct v4l2_subdev_format
>> which has 'which' field, and that needs to be filled with either ACTIVE
>> or TRY.
>>
>> Currently init_cfg is only called for TRY case from the v4l2 framework,
>> passing the TRY state. Some drivers call their own init_cfg, passing
>> NULL as the state, which is used to indicate ACTIVE case.
>>
>> In the future we want to pass subdev's active state from the v4l2
>> framework side, so we need a solution to this.
>>
>> We could change the init_cfg() to include the TRY/ACTIVE value, which
>> would require changing more or less all the drivers. Instead, I have
>> added 'which' field to the subdev state itself, filled at state
>> allocation time, which only requires changes to the drivers that
>> allocate a state themselves.
>>
>> Signed-off-by: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
>> ---
>>   drivers/media/platform/rcar-vin/rcar-v4l2.c |  2 +-
>>   drivers/media/platform/vsp1/vsp1_entity.c   |  2 +-
>>   drivers/media/v4l2-core/v4l2-subdev.c       | 10 +++++++---
>>   drivers/staging/media/tegra-video/vi.c      |  2 +-
>>   include/media/v4l2-subdev.h                 |  7 ++++++-
>>   5 files changed, 16 insertions(+), 7 deletions(-)
>>
>> diff --git a/drivers/media/platform/rcar-vin/rcar-v4l2.c b/drivers/media/platform/rcar-vin/rcar-v4l2.c
>> index 5f4fa8c48f68..1de30d5b437f 100644
>> --- a/drivers/media/platform/rcar-vin/rcar-v4l2.c
>> +++ b/drivers/media/platform/rcar-vin/rcar-v4l2.c
>> @@ -252,7 +252,7 @@ static int rvin_try_format(struct rvin_dev *vin, u32 which,
>>   	u32 width, height;
>>   	int ret;
>>
>> -	sd_state = v4l2_alloc_subdev_state(sd);
>> +	sd_state = v4l2_alloc_subdev_state(sd, V4L2_SUBDEV_FORMAT_ACTIVE);
> 
> Shouldn't the 'which' parameters be used to decide if either ACTIVE or
> TRY have to be used ? this function is also used to set TRY formats,
> in example...
> 
> Oh, maybe I got how it works, the state's which is not
> relevant but the v4l2_subdev_format's which is, as it will be used in
> the next patch to decide if the subdev's state of the file-handle's
> state should be passed to the ioctl.

Yes. It's messy, but it's how it worked before also.

The drivers can't really allocate TRY state as it must come from the 
core, based on the filehandle. Now as I say that, makes me wonder why 
even expose the option to drivers. Maybe v4l2_alloc_subdev_state() 
should take just the sd parameter, and always allocate ACTIVE state, and 
the v4l2 core can use another way to create the TRY state.

>>   	if (IS_ERR(sd_state))
>>   		return PTR_ERR(sd_state);
>>
>> diff --git a/drivers/media/platform/vsp1/vsp1_entity.c b/drivers/media/platform/vsp1/vsp1_entity.c
>> index e40bca254b8b..63ea5e472c33 100644
>> --- a/drivers/media/platform/vsp1/vsp1_entity.c
>> +++ b/drivers/media/platform/vsp1/vsp1_entity.c
>> @@ -675,7 +675,7 @@ int vsp1_entity_init(struct vsp1_device *vsp1, struct vsp1_entity *entity,
>>   	 * Allocate the pad configuration to store formats and selection
>>   	 * rectangles.
>>   	 */
>> -	entity->config = v4l2_alloc_subdev_state(&entity->subdev);
>> +	entity->config = v4l2_alloc_subdev_state(&entity->subdev, V4L2_SUBDEV_FORMAT_ACTIVE);
>>   	if (IS_ERR(entity->config)) {
>>   		media_entity_cleanup(&entity->subdev.entity);
>>   		return PTR_ERR(entity->config);
>> diff --git a/drivers/media/v4l2-core/v4l2-subdev.c b/drivers/media/v4l2-core/v4l2-subdev.c
>> index e1a794f69815..04ad319fb150 100644
>> --- a/drivers/media/v4l2-core/v4l2-subdev.c
>> +++ b/drivers/media/v4l2-core/v4l2-subdev.c
>> @@ -28,7 +28,7 @@ static int subdev_fh_init(struct v4l2_subdev_fh *fh, struct v4l2_subdev *sd)
>>   {
>>   	struct v4l2_subdev_state *state;
>>
>> -	state = v4l2_alloc_subdev_state(sd);
>> +	state = v4l2_alloc_subdev_state(sd, V4L2_SUBDEV_FORMAT_TRY);
> 
> At the same time I'm not sure I get the purpose of this. Don't
> init_cfg() callback implementations deal with try formats themeselves
> ? I mean, it's not a fixed rule, they can as well initialize their
> default 'active' formats, but what matters is that they initialize
> their per-fh try states ?

That is what they do currently. init_cfg() only deals with TRY state, as 
that's the only "state" (i.e. pad_config) there used to be from v4l2 
core's perspective.

> Shouldn't init_cfg receive the fh's state so that it can initialize
> it, and just in case they need to, access their subdev's state and
> initialize them ? I'm missing what the purpose of the flag is tbh.

Now we have (a possibility to have) state for both TRY and ACTIVE on the 
v4l2 core side. The active state has to be initialized also, and a 
logical way to do that is to use the init_cfg().

So now, for drivers that support the new active state, init_cfg() can 
get either TRY or ACTIVE state. And if you want to call, say, the 
driver's set_routing() to setup the routing in the state, you have to 
set the 'which' in the routing struct to a value. So somehow init_cfg 
needs to know if it's initializing an ACTIVE or TRY state.

  Tomi
