Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A4AB921375C
	for <lists+linux-media@lfdr.de>; Fri,  3 Jul 2020 11:13:04 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725949AbgGCJND (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 3 Jul 2020 05:13:03 -0400
Received: from lb2-smtp-cloud8.xs4all.net ([194.109.24.25]:49653 "EHLO
        lb2-smtp-cloud8.xs4all.net" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1725648AbgGCJND (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 3 Jul 2020 05:13:03 -0400
Received: from cust-b5b5937f ([IPv6:fc0c:c16d:66b8:757f:c639:739b:9d66:799d])
        by smtp-cloud8.xs4all.net with ESMTPA
        id rHkfj8PxfmVFqrHkjj7SQq; Fri, 03 Jul 2020 11:13:01 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=xs4all.nl; s=s1;
        t=1593767581; bh=4bDIXNeaHXPq6bkZBdy5zZJx+3f/rUGZsjJm/9F+mA4=;
        h=Subject:To:From:Message-ID:Date:MIME-Version:Content-Type:From:
         Subject;
        b=PRpMbt9SkKdZUHbukTl/BIJCqem5f9TCOcr7oDUgjI5xG3z+SXosW6qC8bTtuHa/0
         AxM/d1YT/HBH4nrIh3rPN7Kln6BaFFx2wnnBHvFg5JhTZA5asXIBWDffowlhUQdR23
         d5xqHpLNYntSyEcLCgJj44kXBwvnOeYKKN1ebzc5Nljvzsw/T139b5SqTMChwyF5o/
         a86TYtSqo1Q4hqce894Y92/3B5tATLQTWjLVwyn7K4frRKtkGu5IfMJ+Dbc9gn0X2m
         HPKluMb4jIC/MtZ6cC4BvUGclcrWwwQ3T0UWl8qQ2WV1OX30GdN4V71pEihDJB1KT3
         4G+TZVIyXjcyQ==
Subject: Re: [PATCH] imx274: fix frame interval handling
To:     Luca Ceresoli <luca@lucaceresoli.net>,
        Linux Media Mailing List <linux-media@vger.kernel.org>
Cc:     Sowjanya Komatineni <skomatineni@nvidia.com>,
        Leon Luo <leonl@leopardimaging.com>
References: <9f73f763-3b1f-bf18-0b4e-b69cfa22620b@xs4all.nl>
 <39775903-00ed-20fe-2cad-0795196093cf@lucaceresoli.net>
From:   Hans Verkuil <hverkuil@xs4all.nl>
Message-ID: <bb94191d-8349-55d4-8dff-e8d704ee08b5@xs4all.nl>
Date:   Fri, 3 Jul 2020 11:12:57 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.9.0
MIME-Version: 1.0
In-Reply-To: <39775903-00ed-20fe-2cad-0795196093cf@lucaceresoli.net>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-CMAE-Envelope: MS4wfISGic5b0pmZkEaXinEeKKqFedCBv1F9/8R9m9L6GK8nMFBw6ae0l5p8eWl+rwQHNQVN/MjpuorsHAKBJsOvoziwpFAddOEG/bQmAkMW4jInOZ5J16Co
 LDeb7vuIJkpvJH0sV0c6oOYWjmr3BRtG/eeCwO5lE0Isz3mOGZqbMLRhBoXhdOgPpYcIjjaZL1YeSirGwMQ3jm/kmmvudViLRkeMyiZ3Nw8InXzde1YJDLNG
 dp7sMktS5Wt3wISj0I7jl05fvQ9rNmdJk5VIXBVcYIcPAmHdj9qEo9tyLRtDD9PD
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On 03/07/2020 10:46, Luca Ceresoli wrote:
> Hi Hans,
> 
> [Cc: ing the imx274 maintainer]
> 
> On 02/07/20 15:52, Hans Verkuil wrote:
>> 1) the numerator and/or denominator might be 0, in that case
>>    fall back to the default frame interval. This is per the spec
>>    and this caused a v4l2-compliance failure.
>>
>> 2) the updated frame interval wasn't returned in the s_frame_interval
>>    subdev op.
>>
>> Signed-off-by: Hans Verkuil <hverkuil-cisco@xs4all.nl>
>> ---
>>  drivers/media/i2c/imx274.c | 8 +++++---
>>  1 file changed, 5 insertions(+), 3 deletions(-)
>>
>> diff --git a/drivers/media/i2c/imx274.c b/drivers/media/i2c/imx274.c
>> index 6011cec5e351..a9304b98f7af 100644
>> --- a/drivers/media/i2c/imx274.c
>> +++ b/drivers/media/i2c/imx274.c
>> @@ -1235,6 +1235,8 @@ static int imx274_s_frame_interval(struct v4l2_subdev *sd,
>>  	ret = imx274_set_frame_interval(imx274, fi->interval);
>>
>>  	if (!ret) {
>> +		fi->interval = imx274->frame_interval;
>> +
>>  		/*
>>  		 * exposure time range is decided by frame interval
>>  		 * need to update it after frame interval changes
>> @@ -1730,9 +1732,9 @@ static int imx274_set_frame_interval(struct stimx274 *priv,
>>  		__func__, frame_interval.numerator,
>>  		frame_interval.denominator);
>>
>> -	if (frame_interval.numerator == 0) {
>> -		err = -EINVAL;
>> -		goto fail;
>> +	if (frame_interval.numerator == 0 || frame_interval.denominator) {
> 
> Missing '== 0'?

Oops!

> 
> Please excuse my noobness, but I'm unable to understand which code path
> would lead to calling imx274_set_frame_interval() with a zero here. I'm
> assuming the v4l2 framework won't call imx274_s_frame_interval() with
> numerator or denominator set to zero.
> 

A bridge driver that is called with VIDIOC_S_PARM will just pass on the new
interval to the sensor. And that interval can have either numerator and/or
denominator set to 0 in which case the sensor driver should set the frame
interval to a suitable default value (as per the spec). The bridge driver
doesn't know what a suitable default value is, so this has to be done in the
sensor driver.

I found this when running v4l2-compliance with the imx274 and the upcoming tegra
video input driver.

Regards,

	Hans
