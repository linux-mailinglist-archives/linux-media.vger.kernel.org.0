Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id EE39942879A
	for <lists+linux-media@lfdr.de>; Mon, 11 Oct 2021 09:25:56 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234291AbhJKH1z (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 11 Oct 2021 03:27:55 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59026 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231974AbhJKH1z (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 11 Oct 2021 03:27:55 -0400
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [IPv6:2001:4b98:dc2:55:216:3eff:fef7:d647])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 49974C061570
        for <linux-media@vger.kernel.org>; Mon, 11 Oct 2021 00:25:55 -0700 (PDT)
Received: from [192.168.1.111] (91-158-153-130.elisa-laajakaista.fi [91.158.153.130])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 365EE2BD;
        Mon, 11 Oct 2021 09:25:53 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1633937153;
        bh=XqK6AsZi02xpDEXg9Jg05okXheLSVoB/7PLW8yUGkvc=;
        h=Subject:To:Cc:References:From:Date:In-Reply-To:From;
        b=ooJnRZtN7wo9nA1Rr2sxyST4lJUJtOUQTN6HttvoUl6WlTxS6IZPqKdvqH/LKMllA
         wStqZLWrWjjgJcmdiqbWMErxKT74oJk/A5ZfaAoM0G5mB88TuhRNMdVzlbbO2KbOAg
         BDYL+Y6fKTj6pO2uxhYqCZ115Eg9wsDnlqCBQhzg=
Subject: Re: [PATCH v9 36/36] media: subdev: add v4l2_routing_simple_verify()
 helper
To:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc:     linux-media@vger.kernel.org, sakari.ailus@linux.intel.com,
        Jacopo Mondi <jacopo+renesas@jmondi.org>,
        niklas.soderlund+renesas@ragnatech.se,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        Pratyush Yadav <p.yadav@ti.com>
References: <20211005085750.138151-1-tomi.valkeinen@ideasonboard.com>
 <20211005085750.138151-37-tomi.valkeinen@ideasonboard.com>
 <YWJArM0uUL8UebwU@pendragon.ideasonboard.com>
From:   Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
Message-ID: <9a80f21c-49af-5f90-b7e0-f30cc47a8de9@ideasonboard.com>
Date:   Mon, 11 Oct 2021 10:25:49 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <YWJArM0uUL8UebwU@pendragon.ideasonboard.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On 10/10/2021 04:23, Laurent Pinchart wrote:
> Hi Tomi,
> 
> Thank you for the patch.
> 
> On Tue, Oct 05, 2021 at 11:57:50AM +0300, Tomi Valkeinen wrote:
>> Add a helper for verifying routing for the common case of
>> non-overlapping 1-to-1 streams.
>>
>> Signed-off-by: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
>> ---
>>   drivers/media/v4l2-core/v4l2-subdev.c | 24 ++++++++++++++++++++++++
>>   include/media/v4l2-subdev.h           | 14 ++++++++++++++
>>   2 files changed, 38 insertions(+)
>>
>> diff --git a/drivers/media/v4l2-core/v4l2-subdev.c b/drivers/media/v4l2-core/v4l2-subdev.c
>> index 22a9bea0fa85..2a64ff003e4b 100644
>> --- a/drivers/media/v4l2-core/v4l2-subdev.c
>> +++ b/drivers/media/v4l2-core/v4l2-subdev.c
>> @@ -1569,3 +1569,27 @@ int v4l2_subdev_get_fmt(struct v4l2_subdev *sd, struct v4l2_subdev_state *state,
>>   	return 0;
>>   }
>>   EXPORT_SYMBOL_GPL(v4l2_subdev_get_fmt);
>> +
>> +int v4l2_routing_simple_verify(const struct v4l2_subdev_krouting *routing)
>> +{
>> +	unsigned int i, j;
>> +
>> +	for (i = 0; i < routing->num_routes; ++i) {
>> +		const struct v4l2_subdev_route *route = &routing->routes[i];
>> +
>> +		for (j = i + 1; j < routing->num_routes; ++j) {
>> +			const struct v4l2_subdev_route *r = &routing->routes[j];
>> +
>> +			if (route->sink_pad == r->sink_pad &&
>> +			    route->sink_stream == r->sink_stream)
>> +				return -EINVAL;
>> +
>> +			if (route->source_pad == r->source_pad &&
>> +			    route->source_stream == r->source_stream)
>> +				return -EINVAL;
>> +		}
>> +	}
>> +
>> +	return 0;
>> +}
>> +EXPORT_SYMBOL_GPL(v4l2_routing_simple_verify);
>> diff --git a/include/media/v4l2-subdev.h b/include/media/v4l2-subdev.h
>> index 1a4df0aafe8a..5e50f2ded653 100644
>> --- a/include/media/v4l2-subdev.h
>> +++ b/include/media/v4l2-subdev.h
>> @@ -1565,4 +1565,18 @@ v4l2_state_get_opposite_stream_format(struct v4l2_subdev_state *state, u32 pad,
>>   int v4l2_subdev_get_fmt(struct v4l2_subdev *sd, struct v4l2_subdev_state *state,
>>   			struct v4l2_subdev_format *format);
>>   
>> +/**
>> + * v4l2_routing_simple_verify() - Verify that all streams are non-overlapping
>> + *				  1-to-1 streams
> 
> Let's reflect this in the function name then, we can call it
> v4l2_routing_verify_1_to_1(). This will make it possible to add a
> v4l2_subdev_routing_validate_1_to_n() later.

Sounds fine to me.

> I'd rename verify to validate though, and add subdev to the function
> name, calling it v4l2_subdev_routing_validate_1_to_1().

I don't mind changing the name, but what's the difference with verify 
and validate?

  Tomi
