Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 949794452B0
	for <lists+linux-media@lfdr.de>; Thu,  4 Nov 2021 13:06:47 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231643AbhKDMJY (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 4 Nov 2021 08:09:24 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39214 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231626AbhKDMJN (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Thu, 4 Nov 2021 08:09:13 -0400
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [IPv6:2001:4b98:dc2:55:216:3eff:fef7:d647])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D1EC7C06120D
        for <linux-media@vger.kernel.org>; Thu,  4 Nov 2021 05:06:35 -0700 (PDT)
Received: from [192.168.1.111] (91-158-153-130.elisa-laajakaista.fi [91.158.153.130])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 473B8D8B;
        Thu,  4 Nov 2021 13:06:32 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1636027593;
        bh=btuS+2dQolQjMmzNCi3BS3UDKB2HvM3ZQFDGoNSJeGI=;
        h=To:Cc:References:From:Subject:Date:In-Reply-To:From;
        b=pVHMbVS2ORkUeB7a/idynQRXwlgK1PKCGGgEnovmdMi6Z49r3rM13zuR1f1V1jQMG
         b9Z4wBoEKednVgD4ZWO4u91w7IcWHZo7leE83GOQFJWtNtlAJMWK2wsMLqr4iGH8uC
         vY3zzvsRKW5jppW6k5iXSiPw94yHMr1pv0aqvzNs=
To:     Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        linux-media@vger.kernel.org, sakari.ailus@linux.intel.com,
        Jacopo Mondi <jacopo+renesas@jmondi.org>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        niklas.soderlund+renesas@ragnatech.se
Cc:     Mauro Carvalho Chehab <mchehab@kernel.org>,
        Pratyush Yadav <p.yadav@ti.com>
References: <20211005085750.138151-1-tomi.valkeinen@ideasonboard.com>
 <20211005085750.138151-26-tomi.valkeinen@ideasonboard.com>
 <c3f939a1-81ac-d2a1-d669-9ae59143c07f@xs4all.nl>
From:   Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
Subject: Re: [PATCH v9 25/36] media: add V4L2_SUBDEV_FL_MULTIPLEXED
Message-ID: <ed32f24a-da36-3218-7887-0aed23fe87ec@ideasonboard.com>
Date:   Thu, 4 Nov 2021 14:06:29 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <c3f939a1-81ac-d2a1-d669-9ae59143c07f@xs4all.nl>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On 12/10/2021 17:48, Hans Verkuil wrote:
> On 05/10/2021 10:57, Tomi Valkeinen wrote:
>> Add subdev flag V4L2_SUBDEV_FL_MULTIPLEXED. It is used to indicate that
>> the subdev supports the new API with multiplexed streams (routing,
>> stream configs).
>>
>> Signed-off-by: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
>> ---
>>   include/media/v4l2-subdev.h | 11 +++++++++++
>>   1 file changed, 11 insertions(+)
>>
>> diff --git a/include/media/v4l2-subdev.h b/include/media/v4l2-subdev.h
>> index b3a72c98a2d3..7f9c83fac020 100644
>> --- a/include/media/v4l2-subdev.h
>> +++ b/include/media/v4l2-subdev.h
>> @@ -888,6 +888,17 @@ struct v4l2_subdev_internal_ops {
>>    * should set this flag.
>>    */
>>   #define V4L2_SUBDEV_FL_HAS_EVENTS		(1U << 3)
>> +/*
>> + * Set this flag if this subdev supports multiplexed streams. This means
>> + * that the driver supports routing and handles the stream parameter in its
>> + * v4l2_subdev_pad_ops handlers. More specifically, this means:
>> + *
>> + * - Centrally managed active state is enabled
>> + * - Legacy pad config is _not_ supported (state->pads)
> 
> I'm not sure what is meant with this. Can you elaborate?

It means that a subdev with V4L2_SUBDEV_FL_MULTIPLEXED cannot use the 
legacy pads array in the state (state->pads is NULL), as multiplexed 
streams requires streams support. For streams you need the routing & 
stream configs, added in the following patches.

  Tomi

> Regards,
> 
> 	Hans
> 
>> + * - Routing ioctls are available
>> + * - Multiple streams per pad are supported
>> + */
>> +#define V4L2_SUBDEV_FL_MULTIPLEXED		(1U << 4)
>>   
>>   struct regulator_bulk_data;
>>   
>>
> 

