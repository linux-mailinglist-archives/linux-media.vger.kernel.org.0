Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 633688FCDA
	for <lists+linux-media@lfdr.de>; Fri, 16 Aug 2019 09:57:15 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726684AbfHPH5O (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 16 Aug 2019 03:57:14 -0400
Received: from lb1-smtp-cloud9.xs4all.net ([194.109.24.22]:32889 "EHLO
        lb1-smtp-cloud9.xs4all.net" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1725829AbfHPH5O (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 16 Aug 2019 03:57:14 -0400
Received: from [192.168.2.10] ([46.9.232.237])
        by smtp-cloud9.xs4all.net with ESMTPA
        id yX6gh0ti2zaKOyX6lhlGen; Fri, 16 Aug 2019 09:57:12 +0200
Subject: Re: [PATCH] media: video-i2c: add mlx90640 subpage data to output
To:     Matt Ranostay <matt.ranostay@konsulko.com>
Cc:     linux-media@vger.kernel.org
References: <20190811071015.3303-1-matt.ranostay@konsulko.com>
 <0630c968-1d47-a2c7-cc47-964a08085f13@xs4all.nl>
 <CAJCx=g=XOU72ZETpOHCdFfhC-9vkxAk09nTjaap4yGKB9+RKBA@mail.gmail.com>
From:   Hans Verkuil <hverkuil@xs4all.nl>
Message-ID: <1e1c0962-5b13-3d49-f946-a7a5896e8489@xs4all.nl>
Date:   Fri, 16 Aug 2019 09:57:06 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <CAJCx=g=XOU72ZETpOHCdFfhC-9vkxAk09nTjaap4yGKB9+RKBA@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-CMAE-Envelope: MS4wfIiseX70DTM0cBOC3iTZMl1Gna6qckD3p6OMsXvb2SE6OWmFpR6VYdFJk5VQ7pyEsEBsjf3wZsN8RsmOY5TWTawAtnHUZqN7hstoD3LvIxZ0KirGOjNV
 +3fQeUMF7RYjcZgfrtBLRlbw9myaFszWDWpFoQJfbYuxptLIlzU3lnSpdXIRHGptRPgQhZygMZkWAHmC5wBnhq7Fs0LZop2HxO9Jm3022KdbmITUe6lqDL5C
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On 8/15/19 8:23 AM, Matt Ranostay wrote:
> On Mon, Aug 12, 2019 at 6:05 AM Hans Verkuil <hverkuil@xs4all.nl> wrote:
>>
>> Hi Matt,
>>
>> On 8/11/19 9:10 AM, Matt Ranostay wrote:
>>> Add current subpage data via the status register to the video
>>> frame in the last word of data, which seems to be unused
>>> undocumented reserved data.
>>
>> I don't really understand from this description what is going on
>> here.
> 
> Probably can make it more verbose if requested.
> 
> But simple overview is that all the frame data is from 0x400 read but
> there is a some status register data that is from 0x8000
> that needs to be read.
> 
> So mostly from the latter read (which can have an unlikely race
> condition and be incorrect) is to confirm which sub frame that is
> being read which can be one or two. You need the previous subpage
> magic values to process that respective frame temperature data.

But 1) you are overwriting the last pixel value of the frame with this
status value and 2) it is undocumented so how would applications handle
this?

As far as I can tell you are just replacing the last 'pixel' in the
buffer with a magic value without explaining what it is or what userspace
should do with it. And exposing low-level register information to userspace
is almost always wrong.

So: what is this status value? How should it be used?

Regards,

	Hans

> 
>>
>> mlx90640_xfer() reads the buffer data from the i2c device, but
>> that data is split over two different addresses? Or does
>> 0x8000 contain something else with a different meaning compared
>> to what is read from 0x400?
>>
>>>
>>> Signed-off-by: Matt Ranostay <matt.ranostay@konsulko.com>
>>> ---
>>>  drivers/media/i2c/video-i2c.c | 12 ++++++++++--
>>>  1 file changed, 10 insertions(+), 2 deletions(-)
>>>
>>> diff --git a/drivers/media/i2c/video-i2c.c b/drivers/media/i2c/video-i2c.c
>>> index 078141712c88..8bc7b228ba40 100644
>>> --- a/drivers/media/i2c/video-i2c.c
>>> +++ b/drivers/media/i2c/video-i2c.c
>>> @@ -168,8 +168,16 @@ static int amg88xx_xfer(struct video_i2c_data *data, char *buf)
>>>
>>>  static int mlx90640_xfer(struct video_i2c_data *data, char *buf)
>>>  {
>>> -     return regmap_bulk_read(data->regmap, 0x400, buf,
>>> -                             data->chip->buffer_size);
>>> +     int ret = regmap_bulk_read(data->regmap, 0x400, buf,
>>> +                                data->chip->buffer_size);
>>
>> Shouldn't this be data->chip->buffer_size - size, since the last
>> 'size' bytes will be overwritten anyway?
> 
> Yes that is true but don't see in datasheet that you can just not read
> the last two bytes of the transaction.
> Probably totally fine to not do so but who knows.
> 
> - Matt
> 
>>
>>> +     int size = data->chip->bpp / 8;
>>> +
>>> +     if (ret)
>>> +             return ret;
>>> +
>>> +     /* read status register, which contains subpage that is read */
>>> +     return regmap_bulk_read(data->regmap, 0x8000,
>>> +                             &buf[data->chip->buffer_size - size], size);
>>>  }
>>>
>>>  static int amg88xx_setup(struct video_i2c_data *data)
>>>
>>
>> Regards,
>>
>>         Hans

