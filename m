Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 76A7F475426
	for <lists+linux-media@lfdr.de>; Wed, 15 Dec 2021 09:19:01 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S240757AbhLOITA (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 15 Dec 2021 03:19:00 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49748 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235661AbhLOIS7 (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 15 Dec 2021 03:18:59 -0500
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [IPv6:2001:4b98:dc2:55:216:3eff:fef7:d647])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A33C8C061574
        for <linux-media@vger.kernel.org>; Wed, 15 Dec 2021 00:18:59 -0800 (PST)
Received: from [192.168.1.111] (91-156-85-209.elisa-laajakaista.fi [91.156.85.209])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 956E3292;
        Wed, 15 Dec 2021 09:18:57 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1639556338;
        bh=CM2X0QEzLw26rbyhAGrrP0wocFwB65Z77MOQhomLw/g=;
        h=To:Cc:References:From:Subject:Date:In-Reply-To:From;
        b=ocIWhO33r9YhjNaQHaueLnBwtpoPPCem36pc4dUZ50rH0m2Ccm8xTLykIpx5U7u/M
         R5junBzOtPbhIQGUWTeXA5dBAyNsUNjPP3K5PQxQxYlzcX+72lhZhNt9MG5+WV5ueL
         gEOLUR5WwZ26swIYx3iFYY0wUwkFvhemfu7MlH9E=
To:     Jacopo Mondi <jacopo@jmondi.org>
Cc:     linux-media@vger.kernel.org, sakari.ailus@linux.intel.com,
        Jacopo Mondi <jacopo+renesas@jmondi.org>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        niklas.soderlund+renesas@ragnatech.se,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        Pratyush Yadav <p.yadav@ti.com>
References: <20211130141536.891878-1-tomi.valkeinen@ideasonboard.com>
 <20211130141536.891878-5-tomi.valkeinen@ideasonboard.com>
 <20211214074227.onx7erpc5sdc4fcv@uno.localdomain>
From:   Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
Subject: Re: [PATCH v10 04/38] media: subdev: add subdev state locking
Message-ID: <ca790cc8-cf99-5f90-c75f-b8b12dd845b1@ideasonboard.com>
Date:   Wed, 15 Dec 2021 10:18:55 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
MIME-Version: 1.0
In-Reply-To: <20211214074227.onx7erpc5sdc4fcv@uno.localdomain>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On 14/12/2021 09:42, Jacopo Mondi wrote:
> Hi Tomi,
> 
> On Tue, Nov 30, 2021 at 04:15:02PM +0200, Tomi Valkeinen wrote:
>> The V4L2 subdevs have managed without centralized locking for the state
>> (previously pad_config), as the TRY state is supposedly safe (although I
>> believe two TRY ioctls for the same fd would race), and the ACTIVE
>> state, and its locking, is managed by the drivers internally.
>>
>> We now have ACTIVE state in a centralized position, and need locking.
> 
> I would use 'active' instead of ACTIVE

Hmm, yes, the naming I use varies, I guess =). I often use capitalized 
ACTIVE/TRY to make them stand out, and not get mixed with normal words.

With active/try-state it's clear, I believe, especially if I have a dash 
there.

>> Strictly speaking the locking is only needed for new drivers that use
>> the new state, as the current drivers continue behaving as they used to.
>>
>> Add a mutex to the struct v4l2_subdev_state, along with a few helper
>> functions for locking/unlocking.
>>
>> Signed-off-by: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
>> ---
>>   drivers/media/platform/rcar-vin/rcar-v4l2.c |  3 +-
>>   drivers/media/platform/vsp1/vsp1_entity.c   |  4 +-
>>   drivers/media/v4l2-core/v4l2-subdev.c       | 38 +++++++++++++---
>>   drivers/staging/media/tegra-video/vi.c      |  4 +-
>>   include/media/v4l2-subdev.h                 | 50 ++++++++++++++++++++-
>>   5 files changed, 89 insertions(+), 10 deletions(-)
>>
>> diff --git a/drivers/media/platform/rcar-vin/rcar-v4l2.c b/drivers/media/platform/rcar-vin/rcar-v4l2.c
>> index ba1d16ab1651..e6bd94d63e4f 100644
>> --- a/drivers/media/platform/rcar-vin/rcar-v4l2.c
>> +++ b/drivers/media/platform/rcar-vin/rcar-v4l2.c
>> @@ -244,6 +244,7 @@ static int rvin_try_format(struct rvin_dev *vin, u32 which,
>>   {
>>   	struct v4l2_subdev *sd = vin_to_source(vin);
>>   	struct v4l2_subdev_state *sd_state;
>> +	static struct lock_class_key key;
>>   	struct v4l2_subdev_format format = {
>>   		.which = which,
>>   		.pad = vin->parallel.source_pad,
>> @@ -252,7 +253,7 @@ static int rvin_try_format(struct rvin_dev *vin, u32 which,
>>   	u32 width, height;
>>   	int ret;
>>
>> -	sd_state = __v4l2_subdev_state_alloc(sd);
>> +	sd_state = __v4l2_subdev_state_alloc(sd, "rvin:state->lock", &key);
> 
> Is key needed in the callers ? can it be moved to
> __v4l2_subdev_state_alloc() ?

These drivers shouldn't really be using the functions, so I didn't even 
try to make it look neat.

  Tomi
