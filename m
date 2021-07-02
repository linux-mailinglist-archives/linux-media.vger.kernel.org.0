Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 89C423B9D97
	for <lists+linux-media@lfdr.de>; Fri,  2 Jul 2021 10:34:22 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230237AbhGBIgx (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 2 Jul 2021 04:36:53 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46758 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230166AbhGBIgw (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Fri, 2 Jul 2021 04:36:52 -0400
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [IPv6:2001:4b98:dc2:55:216:3eff:fef7:d647])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E006FC061762
        for <linux-media@vger.kernel.org>; Fri,  2 Jul 2021 01:34:20 -0700 (PDT)
Received: from [192.168.1.111] (91-158-153-130.elisa-laajakaista.fi [91.158.153.130])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 9E9D84AB;
        Fri,  2 Jul 2021 10:34:18 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1625214859;
        bh=sn90vurJhPXfKIOGkT31JEXAPlKyFrkylF4oVu0go60=;
        h=Subject:To:Cc:References:From:Date:In-Reply-To:From;
        b=vaf72xV/Zufqdr2Rx6WCNRQN3Iy6TjVQIYJrXA/3r44Wvn0D5oKOkvuL/jaw+FPX4
         BdtmFkXBER87gMaMwYl7K71meYirXAsB7yehPts7733nLC9rVWS6yTsVITjemRb9sz
         HHp/At+09VWHlZmhH7cqwNcjES2lLRT5En7x99c8=
Subject: Re: [PATCH v7 25/27] v4l: subdev: add routing & stream config to
 v4l2_subdev_state
To:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc:     linux-media@vger.kernel.org, sakari.ailus@linux.intel.com,
        Jacopo Mondi <jacopo+renesas@jmondi.org>,
        niklas.soderlund+renesas@ragnatech.se,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        Pratyush Yadav <p.yadav@ti.com>,
        Lokesh Vutla <lokeshvutla@ti.com>
References: <20210524104408.599645-1-tomi.valkeinen@ideasonboard.com>
 <20210524104408.599645-26-tomi.valkeinen@ideasonboard.com>
 <YLwQVl7i7IBNVvMl@pendragon.ideasonboard.com>
From:   Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
Message-ID: <2b6bf318-81fd-9d52-2694-9abb712ab6ab@ideasonboard.com>
Date:   Fri, 2 Jul 2021 11:34:16 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <YLwQVl7i7IBNVvMl@pendragon.ideasonboard.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi,

On 06/06/2021 03:01, Laurent Pinchart wrote:
> Hi Tomi,
> 
> Thank you for the patch.
> 
> On Mon, May 24, 2021 at 01:44:06PM +0300, Tomi Valkeinen wrote:
>> Add routing and stream_configs to struct v4l2_subdev_state. This lets
>> the drivers to implement V4L2_SUBDEV_FORMAT_TRY support for routing and
>> the stream configurations.
>>
>> Signed-off-by: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
>> ---
>>   drivers/media/v4l2-core/v4l2-subdev.c | 3 +++
>>   include/media/v4l2-subdev.h           | 4 ++++
>>   2 files changed, 7 insertions(+)
>>
>> diff --git a/drivers/media/v4l2-core/v4l2-subdev.c b/drivers/media/v4l2-core/v4l2-subdev.c
>> index b30b456d8d99..13cffe9d9b89 100644
>> --- a/drivers/media/v4l2-core/v4l2-subdev.c
>> +++ b/drivers/media/v4l2-core/v4l2-subdev.c
>> @@ -1227,6 +1227,9 @@ EXPORT_SYMBOL_GPL(v4l2_subdev_alloc_state);
>>   
>>   void v4l2_subdev_free_state(struct v4l2_subdev_state *state)
>>   {
>> +	v4l2_subdev_free_routing(&state->routing);
>> +	v4l2_uninit_stream_configs(&state->stream_configs);
>> +
>>   	kvfree(state->pads);
>>   	kvfree(state);
>>   }
>> diff --git a/include/media/v4l2-subdev.h b/include/media/v4l2-subdev.h
>> index 39c6b811463a..973db58c2d9b 100644
>> --- a/include/media/v4l2-subdev.h
>> +++ b/include/media/v4l2-subdev.h
>> @@ -712,6 +712,8 @@ struct v4l2_subdev_krouting {
>>    * struct v4l2_subdev_state - Used for storing subdev information.
>>    *
>>    * @pads: &struct v4l2_subdev_pad_config array
>> + * @routing: routing table for the subdev
>> + * @stream_configs: stream configurations (only for V4L2_SUBDEV_FL_MULTIPLEXED)
>>    *
>>    * This structure only needs to be passed to the pad op if the 'which' field
>>    * of the main argument is set to %V4L2_SUBDEV_FORMAT_TRY. For
>> @@ -719,6 +721,8 @@ struct v4l2_subdev_krouting {
>>    */
>>   struct v4l2_subdev_state {
>>   	struct v4l2_subdev_pad_config *pads;
>> +	struct v4l2_subdev_krouting routing;
>> +	struct v4l2_subdev_stream_configs stream_configs;
> 
> stream_configs duplicates the information contained in pads. This is
> possibly acceptable for the time being, but needs to be abstracted from
> drivers completely.

Only one of them will be allocated, and a driver will only use one of 
them, so there's no duplication in practice.

Abstracting this from the drivers is possible but will be challenging, 
as many drivers use the pads array directly.

  Tomi
