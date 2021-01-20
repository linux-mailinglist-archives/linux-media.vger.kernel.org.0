Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 798662FDA86
	for <lists+linux-media@lfdr.de>; Wed, 20 Jan 2021 21:13:24 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730388AbhATUMK (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 20 Jan 2021 15:12:10 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47302 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2389666AbhATODU (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 20 Jan 2021 09:03:20 -0500
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [IPv6:2001:4b98:dc2:55:216:3eff:fef7:d647])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 96EA0C0613D3
        for <linux-media@vger.kernel.org>; Wed, 20 Jan 2021 06:02:04 -0800 (PST)
Received: from [192.168.0.20] (cpc89244-aztw30-2-0-cust3082.18-1.cable.virginm.net [86.31.172.11])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 4F7C1813;
        Wed, 20 Jan 2021 15:02:02 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1611151322;
        bh=zw3kmVrXgAcDxx71QbNPImY69vVpbkJ7Yl19yD+9T7E=;
        h=Reply-To:Subject:To:Cc:References:From:Date:In-Reply-To:From;
        b=ek3/0SeMLHiVIYI/WeM6bM4scDwL/msliHFwmBBhT0niluRSj9wuvaB4ICUD5ehkK
         7vacFtWuQgFbCLpBLX8bkPe+5x/Xk63gnSqA3O2EtvqODXPIwIuyHJf3NiCodNjt+B
         m5AYEu8/yxf0jEOOeeqNAXVx04WMkwMNIR/q66L0=
Reply-To: kieran.bingham+renesas@ideasonboard.com
Subject: Re: [PATCH] media: v4l2-async: Safely unregister an non-registered
 async subdev
To:     Sakari Ailus <sakari.ailus@linux.intel.com>
Cc:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        linux-media@vger.kernel.org,
        Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
References: <20210107225458.4485-1-laurent.pinchart@ideasonboard.com>
 <ec851753-b344-ea01-0551-7fb9ffa477bb@ideasonboard.com>
 <20210120133716.GK11878@paasikivi.fi.intel.com>
From:   Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>
Organization: Ideas on Board
Message-ID: <9eee9dbf-a30b-cd5e-aa7f-dda2b2d10229@ideasonboard.com>
Date:   Wed, 20 Jan 2021 14:02:00 +0000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20210120133716.GK11878@paasikivi.fi.intel.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-GB
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On 20/01/2021 13:37, Sakari Ailus wrote:
> Hi Kieran,
> 
> On Wed, Jan 20, 2021 at 11:14:39AM +0000, Kieran Bingham wrote:
>> Hi Laurent,
>>
>> On 07/01/2021 22:54, Laurent Pinchart wrote:
>>> From: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
>>>
>>> Make the V4L2 async framework a bit more robust by allowing to
>>> unregister a non-registered async subdev. Otherwise the
>>> v4l2_async_cleanup() will attempt to delete the async subdev from the
>>> subdev_list with the corresponding list_head not initialized.
>>>
>>> Signed-off-by: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
>>> ---
>>>  drivers/media/v4l2-core/v4l2-async.c | 3 +++
>>>  1 file changed, 3 insertions(+)
>>>
>>> diff --git a/drivers/media/v4l2-core/v4l2-async.c b/drivers/media/v4l2-core/v4l2-async.c
>>> index 8bde33c21ce4..fc4525c4a75f 100644
>>> --- a/drivers/media/v4l2-core/v4l2-async.c
>>> +++ b/drivers/media/v4l2-core/v4l2-async.c
>>> @@ -750,6 +750,9 @@ EXPORT_SYMBOL(v4l2_async_register_subdev);
>>>  
>>>  void v4l2_async_unregister_subdev(struct v4l2_subdev *sd)
>>>  {
>>> +	if (!sd->async_list.next)
>>> +		return;
>>
>> This is a bit opaque for anyone reading the code alone.
>>
>> It could easily read as:
>>
>> "If we don't have a following item in the async list - then don't
>> unregister?", which seems a bit nonsensical.
>>
>> Hopefully that would make someone question what it's actually checking
>> but still.
>>
>> I think I've seen you reference this pattern a couple of times so
>> perhaps having a way to check if a list is initialised would be worth
>> having as a helper in the list.
>>
>> Otherwise, at least a comment to say that we're using the initialisation
>> of the list to determine if the async subdevice is already registered or
>> not. (perhaps a bit more briefly ;D)
>>
>>
>> Anyway, with that all in mind - I always like being able to simplify
>> error and clean up paths, so
>>
>> Reviewed-by: Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>
> 
> Thanks.
> 
> I think the patch is good as-is but I wouldn't mind to see such a list
> helper either. V4L2-async could later on use it.

Yes, I don't think a list-helper is 'required' for this patch (though a
comment would be nice otherwise as described above).

Checking an internal object's list's next pointer to determine if the
object is already registered is quite opaque. That was my only concern.

--
Kieran

