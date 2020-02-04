Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 15BE4152075
	for <lists+linux-media@lfdr.de>; Tue,  4 Feb 2020 19:32:41 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727376AbgBDSck (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 4 Feb 2020 13:32:40 -0500
Received: from lb1-smtp-cloud9.xs4all.net ([194.109.24.22]:57213 "EHLO
        lb1-smtp-cloud9.xs4all.net" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1727308AbgBDSck (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 4 Feb 2020 13:32:40 -0500
Received: from [192.168.2.10] ([46.9.235.248])
        by smtp-cloud9.xs4all.net with ESMTPA
        id z2zziugQd2Mf2z302ibbQI; Tue, 04 Feb 2020 19:32:38 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=xs4all.nl; s=s1;
        t=1580841158; bh=XK6EJMC+jOQ8GO6EaC1UPbfUMggJ3AL0L3/WL0OGrAQ=;
        h=Subject:To:From:Message-ID:Date:MIME-Version:Content-Type:From:
         Subject;
        b=ZMJyhEf4Zi5Q361AZ3vhzi5uhppgHnbnU9DdBzkRdlRHUBYAPa54/bCeHivFch13C
         A7gEYzcmieg7+Dep7r2jOhYZHJz3IdL8loOAz9k0z2A6BQ6vTkDVeLrvVQhcNE3wmo
         GkB5/VPYpiU4LGrzUv/SCbU7KNSrP9eaPfw3O9S6fAFS20dO5W+XSoZfdnNU7JkQpN
         fvH/g5oRUlc0VaynqejKyfhX7sRt32sARik4DIEZ6qiq9J60kmexVYtdUswTrBnVyT
         AtC8LzMCQL8prlOYN6iwsTnUvf97QUZIN4h3c2wluAhSBWZj7mrQ4/YqyytDDuaorf
         4a4RPKIYhEugw==
Subject: Re: [PATCH for v5.6] mc-entity.c: use & to check pad flags, not ==
To:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc:     Linux Media Mailing List <linux-media@vger.kernel.org>,
        Sakari Ailus <sakari.ailus@linux.intel.com>
References: <ac1e8940-91c6-b07c-e3ae-55f32931f9c1@xs4all.nl>
 <20200204182355.GD20396@pendragon.ideasonboard.com>
From:   Hans Verkuil <hverkuil@xs4all.nl>
Message-ID: <84aee083-3ed9-bba7-8c44-a9f69809375b@xs4all.nl>
Date:   Tue, 4 Feb 2020 19:32:34 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <20200204182355.GD20396@pendragon.ideasonboard.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-CMAE-Envelope: MS4wfJ88PlOIaT0INaO1I2o5HeKgwln7QZ2e7HwRmYRrzxj4PAAf54TNST08Cu1T6PQEHyJ4bPg78sBN04i8SOyh5L06JzdY2p6ZAni5O8mc7bS6qTnuqjtL
 rtk8lHkUhwXnjC4qy/PJmRf6A1eEwzOQOfGT1AWOj0zGw3YoJoj5HMwuTSQp3x4bOflUHT+8Nq4+BB3ntTyLbV8g0E7w3Tr2FKqHYNcfGmZFemOJe7j606cU
 /iEfpRo+VoLOvXb7dT4L9AW/ZX/AHE0WM5ldGmyauSk=
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On 2/4/20 7:23 PM, Laurent Pinchart wrote:
> Hi Hans,
> 
> Thank you for the patch.
> 
> On Tue, Feb 04, 2020 at 07:19:22PM +0100, Hans Verkuil wrote:
>> These are bits so to test if a pad is a sink you use & but not ==.
>>
>> It looks like the only reason this hasn't caused problems before is that
>> media_get_pad_index() is currently only used with pads that do not set the
>> MEDIA_PAD_FL_MUST_CONNECT flag. So a pad really had only the SINK or SOURCE
>> flag set and nothing else.
>>
>> Signed-off-by: Hans Verkuil <hverkuil-cisco@xs4all.nl>
>> Cc: <stable@vger.kernel.org>      # for v5.3 and up
>> ---
>> diff --git a/drivers/media/mc/mc-entity.c b/drivers/media/mc/mc-entity.c
>> index 7c429ce98bae..0f1461ac00f0 100644
>> --- a/drivers/media/mc/mc-entity.c
>> +++ b/drivers/media/mc/mc-entity.c
>> @@ -639,9 +639,9 @@ int media_get_pad_index(struct media_entity *entity, bool is_sink,
>>  		return -EINVAL;
>>
>>  	for (i = 0; i < entity->num_pads; i++) {
>> -		if (entity->pads[i].flags == MEDIA_PAD_FL_SINK)
>> +		if (entity->pads[i].flags & MEDIA_PAD_FL_SINK)
>>  			pad_is_sink = true;
>> -		else if (entity->pads[i].flags == MEDIA_PAD_FL_SOURCE)
>> +		else if (entity->pads[i].flags & MEDIA_PAD_FL_SOURCE)
> 
> What if MEDIA_PAD_FL_SINK and MEDIA_PAD_FL_SOURCE are both set ? Is that
> acceptable ?

No, that's not allowed. v4l2-compliance checks against that.

Regards,

	Hans

> 
>>  			pad_is_sink = false;
>>  		else
>>  			continue;	/* This is an error! */
> 

