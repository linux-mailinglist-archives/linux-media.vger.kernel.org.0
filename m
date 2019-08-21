Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id C85629747C
	for <lists+linux-media@lfdr.de>; Wed, 21 Aug 2019 10:15:44 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726371AbfHUIO2 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 21 Aug 2019 04:14:28 -0400
Received: from lb2-smtp-cloud7.xs4all.net ([194.109.24.28]:36775 "EHLO
        lb2-smtp-cloud7.xs4all.net" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1726217AbfHUIO2 (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 21 Aug 2019 04:14:28 -0400
Received: from [192.168.2.10] ([46.9.232.237])
        by smtp-cloud7.xs4all.net with ESMTPA
        id 0Ll8iRxu9Thuu0LlBieWWo; Wed, 21 Aug 2019 10:14:26 +0200
Subject: Re: [PATCH] media: video-i2c: add mlx90640 subpage data to output
To:     Matt Ranostay <matt.ranostay@konsulko.com>
Cc:     linux-media@vger.kernel.org
References: <20190811071015.3303-1-matt.ranostay@konsulko.com>
 <0630c968-1d47-a2c7-cc47-964a08085f13@xs4all.nl>
 <CAJCx=g=A7qEq4jpGzHNiCbngCXoM4d3epGVSVKggdBT1qpSYqg@mail.gmail.com>
From:   Hans Verkuil <hverkuil@xs4all.nl>
Message-ID: <be0ef534-a4d7-fbaa-5961-aae237dc1c6e@xs4all.nl>
Date:   Wed, 21 Aug 2019 10:14:22 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <CAJCx=g=A7qEq4jpGzHNiCbngCXoM4d3epGVSVKggdBT1qpSYqg@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-CMAE-Envelope: MS4wfKSSMrr2mgU0pTogvBtxcpg1OpwdokzfJnB1MMwMpkp/K86q8oPSSKOr1yEdP+B8QL7P0XBVWBioLjEctzHSz2GNrVpKECkJkfeRxRZVYe0oG9tpyz0S
 Yad1wIUhlqalw8v/zFFF+sjFwIbb9DcRIL2McsfdsCvapS1YZ12gGRhPNnB8qv4l62FGJkEnyG0jUCiGrlpza00U97IFCpNQUGQBEwwJfHt94d8kTPTYeHz3
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On 8/21/19 7:59 AM, Matt Ranostay wrote:
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
>>
>> mlx90640_xfer() reads the buffer data from the i2c device, but
>> that data is split over two different addresses? Or does
>> 0x8000 contain something else with a different meaning compared
>> to what is read from 0x400?
> 
> So the status register contains the bit on if subpage one or two is in
> the reading, so in reality a 8 fps reading in v4l2
> space is only a 4 fps processed images.

Isn't it the job of the driver to ensure both subpages are read in the
correct order before returning the full frame? It makes no sense to
off-load this to userspace, this definitely is a job for the driver.

Also, you report V4L2_PIX_FMT_Y16_BE as the format, but it clearly
isn't luma data at all, it is a specialized format which includes
metadata as well. This needs a new pixel format, just for this device.
Luckily the datasheet is public, so you can refer to it, but you can't
just use Y16_BE here.

There is a similar issue with V4L2_PIX_FMT_Y12 for the other device.
It is a much simpler format, but it still needs its own pixelformat.
If nothing else, these values are signed, not unsigned.

Regards,

	Hans

> 
> This is important for userspace processing because it needs to know it
> has a subpage one and two to process the thermal data.
> Can't do it with subpage two and one in that order per the algorithms,
> and also since it is polling it is possible a frame will be dropped.
> 
> - Matt
> 
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

