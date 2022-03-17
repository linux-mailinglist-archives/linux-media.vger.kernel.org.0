Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 717CD4DC332
	for <lists+linux-media@lfdr.de>; Thu, 17 Mar 2022 10:45:38 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232174AbiCQJqn (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 17 Mar 2022 05:46:43 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49458 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232172AbiCQJqm (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 17 Mar 2022 05:46:42 -0400
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 47F871AECBA
        for <linux-media@vger.kernel.org>; Thu, 17 Mar 2022 02:45:26 -0700 (PDT)
Received: from [192.168.1.111] (91-156-85-209.elisa-laajakaista.fi [91.156.85.209])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 43AAA493;
        Thu, 17 Mar 2022 10:45:24 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1647510324;
        bh=M+DP0I2AtcJy+KpcV70u2keQR9grDyKJM9rc1QZ6ZBA=;
        h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
        b=eaAz0ruOYa2ic7qbNjfnxddAU2JA6bSq9s/zVuYW1+HkpDI8K66Cj/AGEYCtBuY84
         x0wzqt/ugmopQgmAq6GcIjEUBWdkMXzwRwhtyumR6jRv94/NsbINNnuz2Ucuarn0WC
         BtzuhP5g9ye7xwP1Ojjbj6w+V82cce5YU6Vp8MXk=
Message-ID: <71b68c2c-7b27-1217-617e-f0b9fcb48f2c@ideasonboard.com>
Date:   Thu, 17 Mar 2022 11:45:21 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [PATCH v11 36/36] media: v4l2-subdev: Add
 v4l2_subdev_s_stream_helper() function
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
 <20220301161156.1119557-37-tomi.valkeinen@ideasonboard.com>
 <20220316121030.tc2srm7ajmuqhfdf@uno.localdomain>
From:   Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
In-Reply-To: <20220316121030.tc2srm7ajmuqhfdf@uno.localdomain>
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

On 16/03/2022 14:10, Jacopo Mondi wrote:
> Hi Laurent,
> 
> On Tue, Mar 01, 2022 at 06:11:56PM +0200, Tomi Valkeinen wrote:
>> From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
>>
>> The v4l2_subdev_s_stream_helper() helper can be used by subdevs that
>> implement the stream-aware .enable_streams() and .disable_streams()
>> operations to implement .s_stream(). This is limited to subdevs that
>> have a single source pad.
>>
>> Signed-off-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
>> Signed-off-by: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
>> ---
>>   drivers/media/v4l2-core/v4l2-subdev.c | 40 +++++++++++++++++++++++++++
>>   include/media/v4l2-subdev.h           | 17 ++++++++++++
>>   2 files changed, 57 insertions(+)
>>
>> diff --git a/drivers/media/v4l2-core/v4l2-subdev.c b/drivers/media/v4l2-core/v4l2-subdev.c
>> index f75a1995a70b..270445821f06 100644
>> --- a/drivers/media/v4l2-core/v4l2-subdev.c
>> +++ b/drivers/media/v4l2-core/v4l2-subdev.c
>> @@ -1914,6 +1914,46 @@ int v4l2_subdev_disable_streams(struct v4l2_subdev *sd, u32 pad,
>>   }
>>   EXPORT_SYMBOL_GPL(v4l2_subdev_disable_streams);
>>
>> +int v4l2_subdev_s_stream_helper(struct v4l2_subdev *sd, int enable)
>> +{
>> +	struct v4l2_subdev_state *state;
>> +	struct v4l2_subdev_route *route;
>> +	struct media_pad *pad;
>> +	u64 source_mask = 0;
>> +	int pad_index = -1;
>> +
>> +	/*
>> +	 * Find the source pad. This helper is meant for subdevs that have a
>> +	 * single source pad, so failures shouldn't happen, but catch them
>> +	 * loudly nonetheless as they indicate a driver bug.
>> +	 */
>> +	media_entity_for_each_pad(&sd->entity, pad) {
>> +		if (pad->flags & MEDIA_PAD_FL_SOURCE) {
>> +			pad_index = pad->index;
>> +			break;
>> +		}
>> +	}
>> +
>> +	if (WARN_ON(pad_index == -1))
>> +		return -EINVAL;
>> +
>> +	/*
>> +	 * As there's a single source pad, just collect all the source streams.
>> +	 */
>> +	state = v4l2_subdev_lock_and_get_active_state(sd);
>> +
>> +	for_each_active_route(&state->routing, route)
>> +		source_mask |= BIT(route->source_stream);
>> +
>> +	v4l2_subdev_unlock_state(state);
>> +
>> +	if (enable)
>> +		return v4l2_subdev_enable_streams(sd, pad_index, source_mask);
>> +	else
>> +		return v4l2_subdev_disable_streams(sd, pad_index, source_mask);
> 
> Or
>          return enable ? ...
>                        : ... ;

I'm not sure if that's any better...

>> +}
>> +EXPORT_SYMBOL_GPL(v4l2_subdev_s_stream_helper);
>> +
>>   #endif /* CONFIG_MEDIA_CONTROLLER */
>>
>>   void v4l2_subdev_init(struct v4l2_subdev *sd, const struct v4l2_subdev_ops *ops)
>> diff --git a/include/media/v4l2-subdev.h b/include/media/v4l2-subdev.h
>> index bb1713863973..817452ec30bb 100644
>> --- a/include/media/v4l2-subdev.h
>> +++ b/include/media/v4l2-subdev.h
>> @@ -1674,6 +1674,23 @@ int v4l2_subdev_enable_streams(struct v4l2_subdev *sd, u32 pad,
>>   int v4l2_subdev_disable_streams(struct v4l2_subdev *sd, u32 pad,
>>   				u64 streams_mask);
>>
>> +/**
>> + * v4l2_subdev_s_stream_helper() - Helper to implement the subdev s_stream
>> + *	operation using enable_streams and disable_streams
>> + * @sd: The subdevice
>> + * @enable: Enable to disable streaming
> 
> Enable or disable

Thanks.

  Tomi
