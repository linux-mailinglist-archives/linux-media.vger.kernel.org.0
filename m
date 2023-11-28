Return-Path: <linux-media+bounces-1184-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id BADFA7FB1E5
	for <lists+linux-media@lfdr.de>; Tue, 28 Nov 2023 07:23:06 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 48866B2125A
	for <lists+linux-media@lfdr.de>; Tue, 28 Nov 2023 06:23:04 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B0685125DB;
	Tue, 28 Nov 2023 06:23:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="lHtafvVB"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 67AB110E4
	for <linux-media@vger.kernel.org>; Mon, 27 Nov 2023 22:22:55 -0800 (PST)
Received: from [192.168.1.105] (unknown [103.251.226.78])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 34E9CBB2;
	Tue, 28 Nov 2023 07:22:13 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1701152537;
	bh=F+pmNEwJIb2yCOcNQbyNuU2Mg/PxW+M9YK0VOsv00IY=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=lHtafvVB/qxtTUccEmnX9MGq5fvXxBzieW9UvvtXCZjo4C+fDjY+XZKR1XG3z4ixl
	 mS+h4jUECWqjH8qV3BWQR9D+sNqHtK4zAzLIbrJtvJVq813lxfrj70OCFgvV4YKqE0
	 i5PK7sHhpuSTFEIkG2DPpGx7aD/sSmh4P38lknOM=
Message-ID: <9a3e3e6f-3b30-1795-a9e9-56d0773b7173@ideasonboard.com>
Date: Tue, 28 Nov 2023 11:52:43 +0530
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.0
Subject: Re: [PATCH 5/9] staging: vc04_services: Do not pass NULL to
 vchiq_log_error()
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc: linux-staging@lists.linux.dev, linux-rpi-kernel@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org, linux-media@vger.kernel.org,
 Stefan Wahren <stefan.wahren@i2se.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Dan Carpenter <error27@gmail.com>,
 Kieran Bingham <kieran.bingham@ideasonboard.com>,
 Phil Elwell <phil@raspberrypi.com>,
 Dave Stevenson <dave.stevenson@raspberrypi.com>
References: <20231107095156.365492-1-umang.jain@ideasonboard.com>
 <20231107095156.365492-6-umang.jain@ideasonboard.com>
 <20231107122551.GA3051@pendragon.ideasonboard.com>
 <20231107123627.GB3051@pendragon.ideasonboard.com>
Content-Language: en-US
From: Umang Jain <umang.jain@ideasonboard.com>
In-Reply-To: <20231107123627.GB3051@pendragon.ideasonboard.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi Laurent,

On 11/7/23 6:06 PM, Laurent Pinchart wrote:
> On Tue, Nov 07, 2023 at 02:25:52PM +0200, Laurent Pinchart wrote:
>> On Tue, Nov 07, 2023 at 04:51:52AM -0500, Umang Jain wrote:
>>> vchiq_add_connected_callback() logs using vchiq_log_error() macro,
>>> but passes NULL instead of a struct device pointer. Fix it.
>>>
>>> vchiq_add_connected_callback() is not used anywhere in the vc04_services
>>> as of now. It will be used when we add new drivers(VC shared memory and
>>> bcm2835-isp), hence it kept as it is for now.
>>>
>>> Fixes: 1d8915cf8899 ("staging: vc04: Convert vchiq_log_error() to use dynamic debug")
>>> Signed-off-by: Umang Jain <umang.jain@ideasonboard.com>
>>> ---
>>>   .../vc04_services/interface/vchiq_arm/vchiq_connected.c       | 4 ++--
>>>   .../vc04_services/interface/vchiq_arm/vchiq_connected.h       | 4 +++-
>>>   2 files changed, 5 insertions(+), 3 deletions(-)
>>>
>>> diff --git a/drivers/staging/vc04_services/interface/vchiq_arm/vchiq_connected.c b/drivers/staging/vc04_services/interface/vchiq_arm/vchiq_connected.c
>>> index b3928bd8c9c6..21f9fa1a1713 100644
>>> --- a/drivers/staging/vc04_services/interface/vchiq_arm/vchiq_connected.c
>>> +++ b/drivers/staging/vc04_services/interface/vchiq_arm/vchiq_connected.c
>>> @@ -27,7 +27,7 @@ static void connected_init(void)
>>>    * be made immediately, otherwise it will be deferred until
>>>    * vchiq_call_connected_callbacks is called.
>>>    */
>>> -void vchiq_add_connected_callback(void (*callback)(void))
>>> +void vchiq_add_connected_callback(struct vchiq_device *device, void (*callback)(void))
>> You're changing the prototype of the function, but the patch doesn't
>> update any user. If the function is unused, it looks like you can drop
>> it instead. Looking at the rest of the vchiq_connected.c file, I think
>> you can actually drop the whole file.
> Except that the vc-sm-cma driver will use it. I'm curious though, that
> driver will have no way to acquire a pointer to a vchiq_device, so I
> don't see how this will be usable. pr_err() may be a better pick here.

vc-sm-cma probe function is called through vchiq_device, hence access to 
dev pointer is established.

https://git.uk.ideasonboard.com/uajain/linux/src/branch/uajain/rpi3/staging-next/isp/drivers/staging/vc04_services/vc-sm-cma/vc_sm.c#L676

>>>   {
>>>   	connected_init();
>>>   
>>> @@ -39,7 +39,7 @@ void vchiq_add_connected_callback(void (*callback)(void))
>>>   		callback();
>>>   	} else {
>>>   		if (g_num_deferred_callbacks >= MAX_CALLBACKS) {
>>> -			vchiq_log_error(NULL, VCHIQ_CORE,
>>> +			vchiq_log_error(&device->dev, VCHIQ_CORE,
>>>   					"There already %d callback registered - please increase MAX_CALLBACKS",
>>>   					g_num_deferred_callbacks);
>>>   		} else {
>>> diff --git a/drivers/staging/vc04_services/interface/vchiq_arm/vchiq_connected.h b/drivers/staging/vc04_services/interface/vchiq_arm/vchiq_connected.h
>>> index 4caf5e30099d..e4ed56446f8a 100644
>>> --- a/drivers/staging/vc04_services/interface/vchiq_arm/vchiq_connected.h
>>> +++ b/drivers/staging/vc04_services/interface/vchiq_arm/vchiq_connected.h
>>> @@ -1,10 +1,12 @@
>>>   /* SPDX-License-Identifier: GPL-2.0 OR BSD-3-Clause */
>>>   /* Copyright (c) 2010-2012 Broadcom. All rights reserved. */
>>>   
>>> +#include "vchiq_bus.h"
>>> +
>>>   #ifndef VCHIQ_CONNECTED_H
>>>   #define VCHIQ_CONNECTED_H
>>>   
>>> -void vchiq_add_connected_callback(void (*callback)(void));
>>> +void vchiq_add_connected_callback(struct vchiq_device *device, void (*callback)(void));
>>>   void vchiq_call_connected_callbacks(void);
>>>   
>>>   #endif /* VCHIQ_CONNECTED_H */


