Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id AE708E17C
	for <lists+linux-media@lfdr.de>; Mon, 29 Apr 2019 13:42:00 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727913AbfD2Llu (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 29 Apr 2019 07:41:50 -0400
Received: from vps-vb.mhejs.net ([37.28.154.113]:54462 "EHLO vps-vb.mhejs.net"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727895AbfD2Llt (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Mon, 29 Apr 2019 07:41:49 -0400
Received: from MUA
        by vps-vb.mhejs.net with esmtps (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128)
        (Exim 4.90_1)
        (envelope-from <mail@maciej.szmigiero.name>)
        id 1hL4fJ-0002Hd-Id; Mon, 29 Apr 2019 13:41:45 +0200
Subject: Re: [PATCH v11 2/7] cx25840: g_std operation really implements
 querystd operation
To:     Hans Verkuil <hverkuil@xs4all.nl>
Cc:     Michael Krufky <mkrufky@linuxtv.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Andy Walls <awalls@md.metrocast.net>,
        linux-kernel <linux-kernel@vger.kernel.org>,
        linux-media@vger.kernel.org
References: <cover.1556365459.git.mail@maciej.szmigiero.name>
 <9490ba236364690f582815c125b3e5208a4778a2.1556365459.git.mail@maciej.szmigiero.name>
 <7ae66245-e524-cecd-70dd-be33fe6589d9@xs4all.nl>
From:   "Maciej S. Szmigiero" <mail@maciej.szmigiero.name>
Openpgp: preference=signencrypt
Autocrypt: addr=mail@maciej.szmigiero.name; prefer-encrypt=mutual; keydata=
 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 PA==
Message-ID: <2b34d7d0-18b7-d403-4186-6a851c1520eb@maciej.szmigiero.name>
Date:   Mon, 29 Apr 2019 13:41:39 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <7ae66245-e524-cecd-70dd-be33fe6589d9@xs4all.nl>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On 29.04.2019 10:05, Hans Verkuil wrote:
> On 4/27/19 4:50 PM, Maciej S. Szmigiero wrote:
>> cx25840 driver g_std operation queries the currently detected video signal,
>> however this is what querystd operation should do, so let's rename the
>> handler.
>>
>> None of the existing cx25840 driver users ever called the g_std operation,
>> one of them calls querystd on each of its subdevs but then the result is
>> only used to implement VIDIOC_QUERYSTD (as it should).
>>
>> Signed-off-by: Maciej S. Szmigiero <mail@maciej.szmigiero.name>
>> ---
>>  drivers/media/i2c/cx25840/cx25840-core.c | 9 +++++----
>>  1 file changed, 5 insertions(+), 4 deletions(-)
>>
>> diff --git a/drivers/media/i2c/cx25840/cx25840-core.c b/drivers/media/i2c/cx25840/cx25840-core.c
>> index 0bf30222cf93..2bcaf239b0d2 100644
>> --- a/drivers/media/i2c/cx25840/cx25840-core.c
>> +++ b/drivers/media/i2c/cx25840/cx25840-core.c
>> @@ -1772,7 +1772,7 @@ static int cx25840_s_stream(struct v4l2_subdev *sd, int enable)
>>  }
>>  
>>  /* Query the current detected video format */
>> -static int cx25840_g_std(struct v4l2_subdev *sd, v4l2_std_id *std)
>> +static int cx25840_querystd(struct v4l2_subdev *sd, v4l2_std_id *std)
>>  {
>>  	struct i2c_client *client = v4l2_get_subdevdata(sd);
>>  
>> @@ -1800,8 +1800,9 @@ static int cx25840_g_std(struct v4l2_subdev *sd, v4l2_std_id *std)
>>  	u32 fmt = (cx25840_read4(client, 0x40c) >> 8) & 0xf;
>>  	*std = stds[ fmt ];
>>  
>> -	v4l_dbg(1, cx25840_debug, client, "g_std fmt = %x, v4l2_std_id = 0x%x\n",
>> -		fmt, (unsigned int)stds[ fmt ]);
>> +	v4l_dbg(1, cx25840_debug, client,
>> +		"querystd fmt = %x, v4l2_std_id = 0x%x\n",
>> +		fmt, (unsigned int)stds[fmt]);
>>  
>>  	return 0;
>>  }
>> @@ -5081,7 +5082,7 @@ static const struct v4l2_subdev_audio_ops cx25840_audio_ops = {
>>  
>>  static const struct v4l2_subdev_video_ops cx25840_video_ops = {
>>  	.s_std = cx25840_s_std,
>> -	.g_std = cx25840_g_std,
>> +	.querystd = cx25840_querystd,
>>  	.s_routing = cx25840_s_video_routing,
>>  	.s_stream = cx25840_s_stream,
>>  	.g_input_status = cx25840_g_input_status,
>>
> 
> Hmm, you are right, g_std really implements querystd. I wondered why this wasn't
> noticed before, and it appears that no bridge driver ever calls the g_std op of the
> cx25840 driver. It's all handled inside the bridge driver itself.
> 
> Can you add a new cx25840_g_std() op here that just returns state->std?
> 
> That would make much more sense.
> 
> You also need to use g_std in patch 6/7 (see my comments there)

Will do, but a small comment here:
Currently, when somebody passes a set of multiple standards to s_std,
let's say V4L2_STD_ALL the chip isn't configured for "every standard
possible".

It is set for a specific, single standard from this set of standards.
There is a "if" tree at the begging of set_v4lstd() that implements,
effectively, a list of priorities when selecting a single standard
from a set of multiple.

That's why I think the incoming standard should be selected upfront
according to this priority list in s_std handler and only this
effective value should be set in state->std so g_std actually
returns what the device is set for.

> Regards,
> 
> 	Hans
> 

Thanks,
Maciej
