Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E78D2445333
	for <lists+linux-media@lfdr.de>; Thu,  4 Nov 2021 13:40:18 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230091AbhKDMmz (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 4 Nov 2021 08:42:55 -0400
Received: from perceval.ideasonboard.com ([213.167.242.64]:42594 "EHLO
        perceval.ideasonboard.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229505AbhKDMmy (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Thu, 4 Nov 2021 08:42:54 -0400
Received: from [192.168.1.111] (91-158-153-130.elisa-laajakaista.fi [91.158.153.130])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 273D2E52;
        Thu,  4 Nov 2021 13:40:15 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1636029615;
        bh=zPganPJ0qjLghEJV4O4I178N+eqak7BPSNNqkAkqhCc=;
        h=To:Cc:References:From:Subject:Date:In-Reply-To:From;
        b=MUcHRCJDwOFuD2HSwU0vkvHDaq35mPZ52M0B5vob4ygKlVV+8ptUfmRjz6rIGiK0m
         w9CCFHGx/DQELOl1gNcNQD9HilaQdV/yopdlzOR9QGWS6qkAgtWjDZdWjLaB7V0fPZ
         7DQyZ99v2bbDk6et6Gp9EHXyL9LhF7T78/G/z9bw=
To:     Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        linux-media@vger.kernel.org, sakari.ailus@linux.intel.com,
        Jacopo Mondi <jacopo+renesas@jmondi.org>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        niklas.soderlund+renesas@ragnatech.se
Cc:     Mauro Carvalho Chehab <mchehab@kernel.org>,
        Pratyush Yadav <p.yadav@ti.com>
References: <20211005085750.138151-1-tomi.valkeinen@ideasonboard.com>
 <20211005085750.138151-26-tomi.valkeinen@ideasonboard.com>
 <5a49a598-7a2c-7001-296c-02ebce93042d@xs4all.nl>
From:   Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
Subject: Re: [PATCH v9 25/36] media: add V4L2_SUBDEV_FL_MULTIPLEXED
Message-ID: <b9eb00a2-0524-6623-e386-e5d836466557@ideasonboard.com>
Date:   Thu, 4 Nov 2021 14:40:12 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <5a49a598-7a2c-7001-296c-02ebce93042d@xs4all.nl>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On 12/10/2021 17:55, Hans Verkuil wrote:
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
>> + * - Routing ioctls are available
>> + * - Multiple streams per pad are supported
>> + */
>> +#define V4L2_SUBDEV_FL_MULTIPLEXED		(1U << 4)
> 
> This is an internal kAPI flag. But wouldn't it be useful to have this as
> an entity flag instead? E.g. MEDIA_ENT_FL_MULTIPLEXED
> 
> Or perhaps as a Sub-Device Capabilities Flag V4L2_SUBDEV_CAP_MULTIPLEXED.
> Or a combination. It is useful if you can detect this from userspace without
> having to call G_ROUTING to see if that exists.

This is probably true, but I haven't had a need for it yet so I didn't 
add a flag. Another reason is that I'm not quite happy with the 
V4L2_SUBDEV_FL_MULTIPLEXED. We might want to split it to smaller bits, 
perhaps separating routing and multiplexed streams.

So I'd prefer to wait until we actually have a need to detect this from 
the userspace, and hopefully we then know better how these features 
behave and what we want to expose.

This need might come when adding support to v4l2 tools and libcamera.

  Tomi
