Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id D79964F7767
	for <lists+linux-media@lfdr.de>; Thu,  7 Apr 2022 09:24:30 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S241736AbiDGHZ2 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 7 Apr 2022 03:25:28 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58634 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S241727AbiDGHZ0 (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Thu, 7 Apr 2022 03:25:26 -0400
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [IPv6:2001:4b98:dc2:55:216:3eff:fef7:d647])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A4A76B8
        for <linux-media@vger.kernel.org>; Thu,  7 Apr 2022 00:23:27 -0700 (PDT)
Received: from [192.168.1.111] (91-156-85-209.elisa-laajakaista.fi [91.156.85.209])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 63DF8499;
        Thu,  7 Apr 2022 09:23:24 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1649316204;
        bh=ByAH4htT5VHM+EUY/2stp9dbZCthozjtzgdOstzYvio=;
        h=Date:Subject:To:References:From:In-Reply-To:From;
        b=PytsPOBHED67wpICI1PgwJsLesIYbRc8F6Mnqo7QwsPhl1twYflunI42G7TIbMmpk
         pAamMAvl+HtH7WYOT2YjrpB7Cuy+/3Tbd+mXnUBj6T/pchTDSPMJ4gCclK14GZxuH7
         9AI4yXSAHwJlFsauVahdzOgW+T5AepU4PvlvpNE8=
Message-ID: <7a27ab34-7c74-232d-2ae6-9812d6813739@ideasonboard.com>
Date:   Thu, 7 Apr 2022 10:23:20 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.7.0
Subject: Re: [PATCH v6 7/8] media: subdev: add v4l2_subdev_get_fmt() helper
 function
Content-Language: en-US
To:     Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        linux-media@vger.kernel.org, sakari.ailus@linux.intel.com,
        Jacopo Mondi <jacopo+renesas@jmondi.org>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        niklas.soderlund+renesas@ragnatech.se,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Pratyush Yadav <p.yadav@ti.com>
References: <20220324080030.216716-1-tomi.valkeinen@ideasonboard.com>
 <20220324080030.216716-8-tomi.valkeinen@ideasonboard.com>
 <691afa22-09b2-1e07-a7fe-0c50cdf950a4@xs4all.nl>
From:   Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
In-Reply-To: <691afa22-09b2-1e07-a7fe-0c50cdf950a4@xs4all.nl>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-5.0 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,SPF_HELO_PASS,
        SPF_PASS,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On 06/04/2022 16:51, Hans Verkuil wrote:
> 
> 
> On 24/03/2022 09:00, Tomi Valkeinen wrote:
>> Add v4l2_subdev_get_fmt() helper function which implements
>> v4l2_subdev_pad_ops.get_fmt using active state. Subdev drivers that
>> support active state and do not need to do anything special in their
>> get_fmt op can use this helper directly for v4l2_subdev_pad_ops.get_fmt.
>>
>> Signed-off-by: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
>> ---
>>   drivers/media/v4l2-core/v4l2-subdev.c | 18 ++++++++++++++++++
>>   include/media/v4l2-subdev.h           | 17 +++++++++++++++++
>>   2 files changed, 35 insertions(+)
>>
>> diff --git a/drivers/media/v4l2-core/v4l2-subdev.c b/drivers/media/v4l2-core/v4l2-subdev.c
>> index d8d1c9ef4dc4..cbc5ebff0656 100644
>> --- a/drivers/media/v4l2-core/v4l2-subdev.c
>> +++ b/drivers/media/v4l2-core/v4l2-subdev.c
>> @@ -1029,6 +1029,24 @@ void v4l2_subdev_cleanup(struct v4l2_subdev *sd)
>>   }
>>   EXPORT_SYMBOL_GPL(v4l2_subdev_cleanup);
>>   
>> +int v4l2_subdev_get_fmt(struct v4l2_subdev *sd, struct v4l2_subdev_state *state,
>> +			struct v4l2_subdev_format *format)
>> +{
>> +	struct v4l2_mbus_framefmt *fmt;
>> +
>> +	if (format->pad >= sd->entity.num_pads)
>> +		return -EINVAL;
>> +
>> +	fmt = v4l2_subdev_get_try_format(sd, state, format->pad);
> 
> Let's use the new v4l2_subdev_get_pad_format helper here.

Right.

>> +	if (!fmt)
>> +		return -EINVAL;
>> +
>> +	format->format = *fmt;
>> +
>> +	return 0;
>> +}
>> +EXPORT_SYMBOL_GPL(v4l2_subdev_get_fmt);
>> +
>>   #endif /* CONFIG_MEDIA_CONTROLLER */
>>   
>>   void v4l2_subdev_init(struct v4l2_subdev *sd, const struct v4l2_subdev_ops *ops)
>> diff --git a/include/media/v4l2-subdev.h b/include/media/v4l2-subdev.h
>> index 700ce376b22c..491bdbb1670c 100644
>> --- a/include/media/v4l2-subdev.h
>> +++ b/include/media/v4l2-subdev.h
>> @@ -1300,6 +1300,23 @@ v4l2_subdev_lock_and_get_active_state(struct v4l2_subdev *sd)
>>   	return sd->active_state;
>>   }
>>   
>> +/**
>> + * v4l2_subdev_get_fmt() - Fill format based on state
>> + * @sd: subdevice
>> + * @state: subdevice state
>> + * @format: pointer to &struct v4l2_subdev_format
>> + *
>> + * Fill @format->format field based on the information in the @format struct.
>> + *
>> + * This function can be used by the subdev drivers which support active state to
>> + * implement v4l2_subdev_pad_ops.get_fmt if the subdev driver does not need to
>> + * do anything special in their get_fmt op.
>> + *
>> + * Returns 0 on success, error value otherwise.
>> + */
>> +int v4l2_subdev_get_fmt(struct v4l2_subdev *sd, struct v4l2_subdev_state *state,
>> +			struct v4l2_subdev_format *format);
> 
> My main concern here is the function name: perhaps a prefix like
> v4l2_subdev_pad_op_get_fmt (or perhaps just _op_ without 'pad') makes
> it easier to see that this is a pad op helper.

The function can and will be used also in other places. E.g. driver's 
set_fmt may use it to allow only setting the sink pad:

if (format->pad == MY_SOURCE_PAD)
	return v4l2_subdev_get_fmt(sd, state, format);

That's perhaps the only other use for the function, as it takes struct 
v4l2_subdev_format as a parameter, and I think usually that struct is 
only used with the set_fmt/get_fmt pad ops.

So, I guess "v4l2_subdev_pad_op_get_fmt" is suitable even in the example 
use case above. Then again, we do have other similar helper funcs 
without any extra prefixes, e.g. media_entity_operations:

	.get_fwnode_pad = v4l2_subdev_get_fwnode_pad_1_to_1,
	.link_validate = v4l2_subdev_link_validate,
	.has_route = v4l2_subdev_has_route

  Tomi
