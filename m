Return-Path: <linux-media+bounces-237-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 673417E9D83
	for <lists+linux-media@lfdr.de>; Mon, 13 Nov 2023 14:45:11 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 975181C208A3
	for <lists+linux-media@lfdr.de>; Mon, 13 Nov 2023 13:45:10 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 166FA208CE;
	Mon, 13 Nov 2023 13:45:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="FItN93Hb"
X-Original-To: linux-media@vger.kernel.org
Received: from lindbergh.monkeyblade.net (lindbergh.monkeyblade.net [23.128.96.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E199B208B6
	for <linux-media@vger.kernel.org>; Mon, 13 Nov 2023 13:45:02 +0000 (UTC)
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [IPv6:2001:4b98:dc2:55:216:3eff:fef7:d647])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D6D7FD72
	for <linux-media@vger.kernel.org>; Mon, 13 Nov 2023 05:45:00 -0800 (PST)
Received: from [192.168.1.112] (unknown [103.86.18.179])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 7C3EF10A;
	Mon, 13 Nov 2023 14:44:30 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1699883073;
	bh=ch6zJbBqN1DdUu9MhTHHKxPQCBRUc3S7zD6M5xb59I8=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=FItN93Hblc2ZJxVX/Ewx5KBpuq1ZJRCgrzeAU9yi36ID0vAMJ2OfIgS2HssjFBfdy
	 gTzWErTIZ03Kni2RhJgMjfAVrtr3XwFk4AFpM0bPXP61JyuwxBQIEg8pu9yaWdfkYt
	 yKgdqgcajzSRdjbTMvMpJKLlKSpVgYyND/CM7p5Y=
Message-ID: <0ebd8679-279f-f4a4-f3bf-c7015c6f41d5@ideasonboard.com>
Date: Mon, 13 Nov 2023 19:14:50 +0530
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
Content-Language: en-US
To: Stefan Wahren <wahrenst@gmx.net>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc: linux-staging@lists.linux.dev, linux-rpi-kernel@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org, linux-media@vger.kernel.org,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Dan Carpenter <error27@gmail.com>,
 Kieran Bingham <kieran.bingham@ideasonboard.com>,
 Phil Elwell <phil@raspberrypi.com>,
 Dave Stevenson <dave.stevenson@raspberrypi.com>
References: <20231107095156.365492-1-umang.jain@ideasonboard.com>
 <20231107095156.365492-6-umang.jain@ideasonboard.com>
 <20231107122551.GA3051@pendragon.ideasonboard.com>
 <20231107123627.GB3051@pendragon.ideasonboard.com>
 <a122dc9a-724d-4f57-b0c2-0b6676a4ea83@gmx.net>
From: Umang Jain <umang.jain@ideasonboard.com>
In-Reply-To: <a122dc9a-724d-4f57-b0c2-0b6676a4ea83@gmx.net>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

Hi Stefan

On 11/10/23 3:51 PM, Stefan Wahren wrote:
> Hi Umang,
>
> Am 07.11.23 um 13:36 schrieb Laurent Pinchart:
>> On Tue, Nov 07, 2023 at 02:25:52PM +0200, Laurent Pinchart wrote:
>>> On Tue, Nov 07, 2023 at 04:51:52AM -0500, Umang Jain wrote:
>>>> vchiq_add_connected_callback() logs using vchiq_log_error() macro,
>>>> but passes NULL instead of a struct device pointer. Fix it.
>>>>
>>>> vchiq_add_connected_callback() is not used anywhere in the 
>>>> vc04_services
>>>> as of now. It will be used when we add new drivers(VC shared memory 
>>>> and
>>>> bcm2835-isp), hence it kept as it is for now.
>>>>
>>>> Fixes: 1d8915cf8899 ("staging: vc04: Convert vchiq_log_error() to 
>>>> use dynamic debug")
>>>> Signed-off-by: Umang Jain <umang.jain@ideasonboard.com>
>>>> ---
>>>> .../vc04_services/interface/vchiq_arm/vchiq_connected.c | 4 ++--
>>>> .../vc04_services/interface/vchiq_arm/vchiq_connected.h | 4 +++-
>>>>   2 files changed, 5 insertions(+), 3 deletions(-)
>>>>
>>>> diff --git 
>>>> a/drivers/staging/vc04_services/interface/vchiq_arm/vchiq_connected.c 
>>>> b/drivers/staging/vc04_services/interface/vchiq_arm/vchiq_connected.c
>>>> index b3928bd8c9c6..21f9fa1a1713 100644
>>>> --- 
>>>> a/drivers/staging/vc04_services/interface/vchiq_arm/vchiq_connected.c
>>>> +++ 
>>>> b/drivers/staging/vc04_services/interface/vchiq_arm/vchiq_connected.c
>>>> @@ -27,7 +27,7 @@ static void connected_init(void)
>>>>    * be made immediately, otherwise it will be deferred until
>>>>    * vchiq_call_connected_callbacks is called.
>>>>    */
>>>> -void vchiq_add_connected_callback(void (*callback)(void))
>>>> +void vchiq_add_connected_callback(struct vchiq_device *device, 
>>>> void (*callback)(void))
>>>
>>> You're changing the prototype of the function, but the patch doesn't
>>> update any user. If the function is unused, it looks like you can drop
>>> it instead. Looking at the rest of the vchiq_connected.c file, I think
>>> you can actually drop the whole file.
>>
>> Except that the vc-sm-cma driver will use it. I'm curious though, that
>> driver will have no way to acquire a pointer to a vchiq_device, so I
>> don't see how this will be usable. pr_err() may be a better pick here.
>
> in case there is currently no user, but vc-sm-cma will be then i'm
> convinced that moving this driver into staging before vchiq is out is a
> good idea.
>
> AFAIK your main goal is to get bcm2835-isp into mainline, so it would be
> faster to have it in staging, so everyone could fix the style issues.

This would really *really* help me. In the sense that, once the 
bcm2835-isp is in staging, I wouldn't need to keep the bcm2835-isp 
patches rebased on my local computer and keep re-sending the series 
again on the list.

If the bcm2835-isp series looks in good shape, I prefer getting them in 
staging and my focus will solely be on continuing working the de-staging 
part, so that the churn is minimized on my end.
>
> My initial concern about importing new drivers was that after moving it
> into staging nobody wants to finish the job. But currently i've a good
> feeling that vchiq is on a good way.
>
> Best regards
>
>>
>>>>   {
>>>>       connected_init();
>>>>
>>>> @@ -39,7 +39,7 @@ void vchiq_add_connected_callback(void 
>>>> (*callback)(void))
>>>>           callback();
>>>>       } else {
>>>>           if (g_num_deferred_callbacks >= MAX_CALLBACKS) {
>>>> -            vchiq_log_error(NULL, VCHIQ_CORE,
>>>> +            vchiq_log_error(&device->dev, VCHIQ_CORE,
>>>>                       "There already %d callback registered - 
>>>> please increase MAX_CALLBACKS",
>>>>                       g_num_deferred_callbacks);
>>>>           } else {
>>>> diff --git 
>>>> a/drivers/staging/vc04_services/interface/vchiq_arm/vchiq_connected.h 
>>>> b/drivers/staging/vc04_services/interface/vchiq_arm/vchiq_connected.h
>>>> index 4caf5e30099d..e4ed56446f8a 100644
>>>> --- 
>>>> a/drivers/staging/vc04_services/interface/vchiq_arm/vchiq_connected.h
>>>> +++ 
>>>> b/drivers/staging/vc04_services/interface/vchiq_arm/vchiq_connected.h
>>>> @@ -1,10 +1,12 @@
>>>>   /* SPDX-License-Identifier: GPL-2.0 OR BSD-3-Clause */
>>>>   /* Copyright (c) 2010-2012 Broadcom. All rights reserved. */
>>>>
>>>> +#include "vchiq_bus.h"
>>>> +
>>>>   #ifndef VCHIQ_CONNECTED_H
>>>>   #define VCHIQ_CONNECTED_H
>>>>
>>>> -void vchiq_add_connected_callback(void (*callback)(void));
>>>> +void vchiq_add_connected_callback(struct vchiq_device *device, 
>>>> void (*callback)(void));
>>>>   void vchiq_call_connected_callbacks(void);
>>>>
>>>>   #endif /* VCHIQ_CONNECTED_H */
>>


