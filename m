Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 1181C10918E
	for <lists+linux-media@lfdr.de>; Mon, 25 Nov 2019 17:05:16 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728802AbfKYQFM (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 25 Nov 2019 11:05:12 -0500
Received: from lb3-smtp-cloud9.xs4all.net ([194.109.24.30]:38207 "EHLO
        lb3-smtp-cloud9.xs4all.net" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1728533AbfKYQFL (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 25 Nov 2019 11:05:11 -0500
Received: from [192.168.2.10] ([46.9.232.237])
        by smtp-cloud9.xs4all.net with ESMTPA
        id ZGrJiMniVLwWdZGrMiWFqH; Mon, 25 Nov 2019 17:05:09 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=xs4all.nl; s=s1;
        t=1574697909; bh=5JK0Z6JtEdDEZ8KHXzEQxSUtkK89o7DFJUvrrUzmBKU=;
        h=Subject:To:From:Message-ID:Date:MIME-Version:Content-Type:From:
         Subject;
        b=SbLk8pMbfu5HpAgWmAO1v/6390pjK238R48Cv6PSr6+7suHtIAp2Z/HCPxgK5bGMw
         vPY56Wi9WNOLyB3r1o30xP+cYodfww98+XYI/iXRprknv1dA2+rRPI7N+IHQpsHMkb
         zfYeZdLaV1chfD8rDHibwFIVD+gSFBA0UVcyLPXEte1yyArmAqjDhqykFoPzyW3wDg
         l4NIzfD3d4pKAz4kLhAqKfTJCPfw6TxTq/i3k7pgs5AhZvTarOpCitSb7bfZQd3tCB
         fAIONRM1Zr9XZdlPgbwVIX/SLhz4s5arFGwOKidTct79gmW1xTjmzYX9qsF94GOhPB
         X8TZNxq3G92Ww==
Subject: Re: [PATCH v2] media: adv7604: extend deep color mode to ADV7611
To:     "Ardelean, Alexandru" <alexandru.Ardelean@analog.com>,
        "linux-media@vger.kernel.org" <linux-media@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Cc:     "mchehab@kernel.org" <mchehab@kernel.org>,
        "Bogdan, Dragos" <Dragos.Bogdan@analog.com>
References: <20191018112157.31657-1-alexandru.ardelean@analog.com>
 <20191018112955.13652-1-alexandru.ardelean@analog.com>
 <6a524aedf79ba40f3286bf0ad4c7b320b561caf1.camel@analog.com>
From:   Hans Verkuil <hverkuil-cisco@xs4all.nl>
Message-ID: <5278491a-5d48-b171-2194-fe4806397424@xs4all.nl>
Date:   Mon, 25 Nov 2019 17:05:05 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <6a524aedf79ba40f3286bf0ad4c7b320b561caf1.camel@analog.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-CMAE-Envelope: MS4wfKrVKdJJ5SaaBumnQ1xyG6UtjZlhuG0KGRRhyKe/jGKJOwg6VN6OgfXEZFxRj2P8k+ttghoGvpx3cywUFhbtH/sFR/tlMzVYHl8mPfGywo1gR2v5oGc6
 MpEGu7uul6w2a+vzuFaqmUG9R16YVQXvcoi2RcTx+8RGN7AZ6YfvyrGM0sTsEewZQ5b4lnmPl0KNoVKGqnFQTcQ42ZYIbF6dlBYD9G51160Qc6/7isYDjTvL
 PweQvOyrXHhnhc6VZjCmu5FXkQxOFgtd5HE4s1yNfVFkMYzMDeW772MZR/U5+xdU4GhLfAqEMHLThtJfUTW6XgG/9qeI+CvwOGtDDtKFqk0=
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On 11/25/19 4:06 PM, Ardelean, Alexandru wrote:
> On Fri, 2019-10-18 at 14:29 +0300, Alexandru Ardelean wrote:
>> From: Dragos Bogdan <dragos.bogdan@analog.com>
>>
>> The AD7611 chip supports the same Deep Color Mode settings as the AD7604.
>> This change extends support for this feature to the AD7611 by adding a
>> wrapper function for the `read_hdmi_pixelclock` hook and adding the same
>> frequency adjustment logic.
>>
> 
> ping here

Not forgotten, it's on my TODO list. But I need some time to dig a bit
deeper into this code.

Regards,

	Hans

> 
>> Signed-off-by: Dragos Bogdan <dragos.bogdan@analog.com>
>> Signed-off-by: Alexandru Ardelean <alexandru.ardelean@analog.com>
>> ---
>>
>> Changelog v1 -> v2:
>> * address checkpatch complaints about 80 col limit and
>>   use of `unsigned` vs `unsigned int`
>>
>>  drivers/media/i2c/adv7604.c | 32 +++++++++++++++++++++-----------
>>  1 file changed, 21 insertions(+), 11 deletions(-)
>>
>> diff --git a/drivers/media/i2c/adv7604.c b/drivers/media/i2c/adv7604.c
>> index 28a84bf9f8a9..c6fe3aa69733 100644
>> --- a/drivers/media/i2c/adv7604.c
>> +++ b/drivers/media/i2c/adv7604.c
>> @@ -1503,23 +1503,14 @@ static void
>> adv76xx_fill_optional_dv_timings_fields(struct v4l2_subdev *sd,
>>  
>>  static unsigned int adv7604_read_hdmi_pixelclock(struct v4l2_subdev *sd)
>>  {
>> -	unsigned int freq;
>>  	int a, b;
>>  
>>  	a = hdmi_read(sd, 0x06);
>>  	b = hdmi_read(sd, 0x3b);
>>  	if (a < 0 || b < 0)
>>  		return 0;
>> -	freq =  a * 1000000 + ((b & 0x30) >> 4) * 250000;
>>  
>> -	if (is_hdmi(sd)) {
>> -		/* adjust for deep color mode */
>> -		unsigned bits_per_channel = ((hdmi_read(sd, 0x0b) & 0x60)
>>>> 4) + 8;
>> -
>> -		freq = freq * 8 / bits_per_channel;
>> -	}
>> -
>> -	return freq;
>> +	return a * 1000000 + ((b & 0x30) >> 4) * 250000;
>>  }
>>  
>>  static unsigned int adv7611_read_hdmi_pixelclock(struct v4l2_subdev *sd)
>> @@ -1530,9 +1521,28 @@ static unsigned int
>> adv7611_read_hdmi_pixelclock(struct v4l2_subdev *sd)
>>  	b = hdmi_read(sd, 0x52);
>>  	if (a < 0 || b < 0)
>>  		return 0;
>> +
>>  	return ((a << 1) | (b >> 7)) * 1000000 + (b & 0x7f) * 1000000 /
>> 128;
>>  }
>>  
>> +static unsigned int adv76xx_read_hdmi_pixelclock(struct v4l2_subdev *sd)
>> +{
>> +	struct adv76xx_state *state = to_state(sd);
>> +	const struct adv76xx_chip_info *info = state->info;
>> +	unsigned int freq, bits_per_channel, pixelrepetition;
>> +
>> +	freq = info->read_hdmi_pixelclock(sd);
>> +	if (is_hdmi(sd)) {
>> +		/* adjust for deep color mode and pixel repetition */
>> +		bits_per_channel = ((hdmi_read(sd, 0x0b) & 0x60) >> 4) + 8;
>> +		pixelrepetition = (hdmi_read(sd, 0x05) & 0x0f) + 1;
>> +
>> +		freq = freq * 8 / bits_per_channel / pixelrepetition;
>> +	}
>> +
>> +	return freq;
>> +}
>> +
>>  static int adv76xx_query_dv_timings(struct v4l2_subdev *sd,
>>  			struct v4l2_dv_timings *timings)
>>  {
>> @@ -1579,7 +1589,7 @@ static int adv76xx_query_dv_timings(struct
>> v4l2_subdev *sd,
>>  
>>  		bt->width = w;
>>  		bt->height = h;
>> -		bt->pixelclock = info->read_hdmi_pixelclock(sd);
>> +		bt->pixelclock = adv76xx_read_hdmi_pixelclock(sd);
>>  		bt->hfrontporch = hdmi_read16(sd, 0x20, info-
>>> hfrontporch_mask);
>>  		bt->hsync = hdmi_read16(sd, 0x22, info->hsync_mask);
>>  		bt->hbackporch = hdmi_read16(sd, 0x24, info-
>>> hbackporch_mask);

