Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A8E2644520C
	for <lists+linux-media@lfdr.de>; Thu,  4 Nov 2021 12:15:26 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230365AbhKDLSD (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 4 Nov 2021 07:18:03 -0400
Received: from perceval.ideasonboard.com ([213.167.242.64]:39402 "EHLO
        perceval.ideasonboard.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229809AbhKDLSC (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Thu, 4 Nov 2021 07:18:02 -0400
Received: from [192.168.1.111] (91-158-153-130.elisa-laajakaista.fi [91.158.153.130])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 55019E52;
        Thu,  4 Nov 2021 12:15:23 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1636024523;
        bh=nph+u4URquIEYSjUS19NZVPUXcG8EpkTz0UGuQia/NU=;
        h=Subject:To:Cc:References:From:Date:In-Reply-To:From;
        b=T5FSlLBJkQJSKT/49BkmqvUZ9x0I/SAWTfrj6PBBkQJ2eUi+iLRy+9Zr5S8K/hk75
         ZiAglFjHwzZ1TyJXaWk+4Ff1gqA9wGikCcBg20RITCZORoxENSg7W9md5MA0KikVXt
         6Ph0JElWEDPImzlv5U2+qv1hJpxqXLOk/cO270W0=
Subject: Re: [PATCH v9 05/36] media: subdev: Add
 v4l2_subdev_validate_and_lock_state()
To:     Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        linux-media@vger.kernel.org, sakari.ailus@linux.intel.com,
        Jacopo Mondi <jacopo+renesas@jmondi.org>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        niklas.soderlund+renesas@ragnatech.se
Cc:     Mauro Carvalho Chehab <mchehab@kernel.org>,
        Pratyush Yadav <p.yadav@ti.com>
References: <20211005085750.138151-1-tomi.valkeinen@ideasonboard.com>
 <20211005085750.138151-6-tomi.valkeinen@ideasonboard.com>
 <c09d0bef-ad85-64aa-2165-beee40097e51@xs4all.nl>
From:   Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
Message-ID: <b1ef0360-9a4b-67ec-6b8f-8d6661cc34d0@ideasonboard.com>
Date:   Thu, 4 Nov 2021 13:15:20 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <c09d0bef-ad85-64aa-2165-beee40097e51@xs4all.nl>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On 12/10/2021 17:16, Hans Verkuil wrote:
> On 05/10/2021 10:57, Tomi Valkeinen wrote:
>> All suitable subdev ops are now passed either the TRY or the ACTIVE
>> state by the v4l2 core. However, other subdev drivers can still call the
>> ops passing NULL as the state, implying the active case.
>>
>> For all current upstream drivers this doesn't matter, as they do not
>> expect to get a valid state for ACTIVE case. But future drivers which
>> support multiplexed streaming and routing will depend on getting a state
>> for both active and try cases.
>>
>> For new drivers we can mandate that the pipelines where the drivers are
>> used need to pass the state properly, or preferably, not call such
>> subdev ops at all.
>>
>> However, if an existing subdev driver is changed to support multiplexed
>> streams, the driver has to consider cases where its ops will be called
>> with NULL state. The problem can easily be solved by using the
>> v4l2_subdev_validate_and_lock_state() helper, introduced here.
>>
>> Signed-off-by: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
>> ---
>>   include/media/v4l2-subdev.h | 33 +++++++++++++++++++++++++++++++++
>>   1 file changed, 33 insertions(+)
>>
>> diff --git a/include/media/v4l2-subdev.h b/include/media/v4l2-subdev.h
>> index a6e8f531a396..b75eeaee492b 100644
>> --- a/include/media/v4l2-subdev.h
>> +++ b/include/media/v4l2-subdev.h
>> @@ -1313,4 +1313,37 @@ void v4l2_subdev_lock_state(struct v4l2_subdev_state *state);
>>    */
>>   void v4l2_subdev_unlock_state(struct v4l2_subdev_state *state);
>>   
>> +/**
>> + * v4l2_subdev_validate_and_lock_state() - Gets locked TRY or ACTIVE subdev
> 
> I think this name is confusing since it isn't validating anything.
> 
> I'd call it v4l2_subdev_lock_and_return_state().

Yes, I really didn't like the name either.

v4l2_subdev_lock_and_return_state() isn't quite perfect either, as it 
sounds like it just locks and returns the given state. But I think it's 
better than the current name, so I'll change.

  Tomi
