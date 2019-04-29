Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 83EC0E19E
	for <lists+linux-media@lfdr.de>; Mon, 29 Apr 2019 13:53:43 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728087AbfD2Lx2 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 29 Apr 2019 07:53:28 -0400
Received: from lb3-smtp-cloud8.xs4all.net ([194.109.24.29]:40343 "EHLO
        lb3-smtp-cloud8.xs4all.net" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1727710AbfD2Lx2 (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 29 Apr 2019 07:53:28 -0400
Received: from [192.168.2.10] ([46.9.232.72])
        by smtp-cloud8.xs4all.net with ESMTPA
        id L4qYhLvtcb8gSL4qbh8V2m; Mon, 29 Apr 2019 13:53:26 +0200
Subject: Re: [PATCH v11 2/7] cx25840: g_std operation really implements
 querystd operation
To:     "Maciej S. Szmigiero" <mail@maciej.szmigiero.name>
Cc:     Michael Krufky <mkrufky@linuxtv.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Andy Walls <awalls@md.metrocast.net>,
        linux-kernel <linux-kernel@vger.kernel.org>,
        linux-media@vger.kernel.org
References: <cover.1556365459.git.mail@maciej.szmigiero.name>
 <9490ba236364690f582815c125b3e5208a4778a2.1556365459.git.mail@maciej.szmigiero.name>
 <7ae66245-e524-cecd-70dd-be33fe6589d9@xs4all.nl>
 <2b34d7d0-18b7-d403-4186-6a851c1520eb@maciej.szmigiero.name>
From:   Hans Verkuil <hverkuil@xs4all.nl>
Message-ID: <fb019af2-fe5c-881d-4f15-81136d3c170d@xs4all.nl>
Date:   Mon, 29 Apr 2019 13:53:22 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.4.0
MIME-Version: 1.0
In-Reply-To: <2b34d7d0-18b7-d403-4186-6a851c1520eb@maciej.szmigiero.name>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-CMAE-Envelope: MS4wfKwA3S2IxZgjZWfqmKEPeqVdJDrLTFoc8t3n+0oGDJdUfvG37o7dh+28wPdouV7Qpllfaw4miwNPEkRAuGzksRzonSsqzJXDtCAI450oT8nVm4jesbfm
 jpckwjfiOsQyBabpqpstAzSKDhirsuRe/KwcAMavbQSc3eSO9L0PQ0rsZDqpfM/1c6bheKHDo2PNSdU0T5pQAVAFyJROymusiQAD0cTqb4H1ehJ3LrAU5iQU
 J5e6KCfD0/xnBHruBv9kX/dFQY+lxMDjagZP9elxWAMk5ffspayKB5FUb9ZAi6FaUBC2hGO5I6l0A8tZZu/okPxkiu9AArmxRV5gibFvc53Cj9YOSEDhjFzi
 brMnlWhp
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On 4/29/19 1:41 PM, Maciej S. Szmigiero wrote:
> On 29.04.2019 10:05, Hans Verkuil wrote:
>> On 4/27/19 4:50 PM, Maciej S. Szmigiero wrote:
>>> cx25840 driver g_std operation queries the currently detected video signal,
>>> however this is what querystd operation should do, so let's rename the
>>> handler.
>>>
>>> None of the existing cx25840 driver users ever called the g_std operation,
>>> one of them calls querystd on each of its subdevs but then the result is
>>> only used to implement VIDIOC_QUERYSTD (as it should).
>>>
>>> Signed-off-by: Maciej S. Szmigiero <mail@maciej.szmigiero.name>
>>> ---
>>>  drivers/media/i2c/cx25840/cx25840-core.c | 9 +++++----
>>>  1 file changed, 5 insertions(+), 4 deletions(-)
>>>
>>> diff --git a/drivers/media/i2c/cx25840/cx25840-core.c b/drivers/media/i2c/cx25840/cx25840-core.c
>>> index 0bf30222cf93..2bcaf239b0d2 100644
>>> --- a/drivers/media/i2c/cx25840/cx25840-core.c
>>> +++ b/drivers/media/i2c/cx25840/cx25840-core.c
>>> @@ -1772,7 +1772,7 @@ static int cx25840_s_stream(struct v4l2_subdev *sd, int enable)
>>>  }
>>>  
>>>  /* Query the current detected video format */
>>> -static int cx25840_g_std(struct v4l2_subdev *sd, v4l2_std_id *std)
>>> +static int cx25840_querystd(struct v4l2_subdev *sd, v4l2_std_id *std)
>>>  {
>>>  	struct i2c_client *client = v4l2_get_subdevdata(sd);
>>>  
>>> @@ -1800,8 +1800,9 @@ static int cx25840_g_std(struct v4l2_subdev *sd, v4l2_std_id *std)
>>>  	u32 fmt = (cx25840_read4(client, 0x40c) >> 8) & 0xf;
>>>  	*std = stds[ fmt ];
>>>  
>>> -	v4l_dbg(1, cx25840_debug, client, "g_std fmt = %x, v4l2_std_id = 0x%x\n",
>>> -		fmt, (unsigned int)stds[ fmt ]);
>>> +	v4l_dbg(1, cx25840_debug, client,
>>> +		"querystd fmt = %x, v4l2_std_id = 0x%x\n",
>>> +		fmt, (unsigned int)stds[fmt]);
>>>  
>>>  	return 0;
>>>  }
>>> @@ -5081,7 +5082,7 @@ static const struct v4l2_subdev_audio_ops cx25840_audio_ops = {
>>>  
>>>  static const struct v4l2_subdev_video_ops cx25840_video_ops = {
>>>  	.s_std = cx25840_s_std,
>>> -	.g_std = cx25840_g_std,
>>> +	.querystd = cx25840_querystd,
>>>  	.s_routing = cx25840_s_video_routing,
>>>  	.s_stream = cx25840_s_stream,
>>>  	.g_input_status = cx25840_g_input_status,
>>>
>>
>> Hmm, you are right, g_std really implements querystd. I wondered why this wasn't
>> noticed before, and it appears that no bridge driver ever calls the g_std op of the
>> cx25840 driver. It's all handled inside the bridge driver itself.
>>
>> Can you add a new cx25840_g_std() op here that just returns state->std?
>>
>> That would make much more sense.
>>
>> You also need to use g_std in patch 6/7 (see my comments there)
> 
> Will do, but a small comment here:
> Currently, when somebody passes a set of multiple standards to s_std,
> let's say V4L2_STD_ALL the chip isn't configured for "every standard
> possible".
> 
> It is set for a specific, single standard from this set of standards.
> There is a "if" tree at the begging of set_v4lstd() that implements,
> effectively, a list of priorities when selecting a single standard
> from a set of multiple.
> 
> That's why I think the incoming standard should be selected upfront
> according to this priority list in s_std handler and only this
> effective value should be set in state->std so g_std actually
> returns what the device is set for.

It's not what happens in other i2c drivers (I looked at saa7115 and adv7180),
so let's just keep it as-is. I want to keep changes in the cx25840 behavior
to a minimum.

Regards,

	Hans

> 
>> Regards,
>>
>> 	Hans
>>
> 
> Thanks,
> Maciej
> 

