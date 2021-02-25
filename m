Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A4813324C55
	for <lists+linux-media@lfdr.de>; Thu, 25 Feb 2021 10:00:02 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232591AbhBYI5c (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 25 Feb 2021 03:57:32 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38722 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229644AbhBYI5Q (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 25 Feb 2021 03:57:16 -0500
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [IPv6:2001:4b98:dc2:55:216:3eff:fef7:d647])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id AE80EC061574;
        Thu, 25 Feb 2021 00:56:36 -0800 (PST)
Received: from [192.168.0.20] (cpc89244-aztw30-2-0-cust3082.18-1.cable.virginm.net [86.31.172.11])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 062C058E;
        Thu, 25 Feb 2021 09:56:33 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1614243394;
        bh=yUTVG65stQzSJoZk2DwuSqJ7mbLyW5rGuDmNK1bm15k=;
        h=Reply-To:Subject:To:Cc:References:From:Date:In-Reply-To:From;
        b=X9qMlTgWca78Z9RN49HNVdZzTislNq4z/4YwzuaCxyEUqKFyWYdWBkwMfB16eV1OY
         nj9qpkpK7palmZ1llp5ezaYo7gNpN9MR5bg1zRbPUfvIprGiu+LUsemOgFtiZ9DwOZ
         a1HqZlGlybRzOMdZqFvFMwq3S7Of3xZF1/35RPFI=
Reply-To: kieran.bingham+renesas@ideasonboard.com
Subject: Re: [PATCH 03/16] media: i2c: rdacm20: Replace goto with a loop
To:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Jacopo Mondi <jacopo@jmondi.org>
Cc:     Jacopo Mondi <jacopo+renesas@jmondi.org>,
        niklas.soderlund+renesas@ragnatech.se, geert@linux-m68k.org,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        linux-media@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20210216174146.106639-1-jacopo+renesas@jmondi.org>
 <20210216174146.106639-4-jacopo+renesas@jmondi.org>
 <c95022bc-3841-4d0a-653c-6d6974e20355@ideasonboard.com>
 <YDMDPymgU/N5wd/i@pendragon.ideasonboard.com>
 <20210222150643.cuv6uye3wpxaykim@uno.localdomain>
 <YDa2qh4onPRSHlXq@pendragon.ideasonboard.com>
From:   Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>
Organization: Ideas on Board
Message-ID: <517b3ef0-cead-0107-1c7b-91eec658bd66@ideasonboard.com>
Date:   Thu, 25 Feb 2021 08:56:31 +0000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <YDa2qh4onPRSHlXq@pendragon.ideasonboard.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-GB
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On 24/02/2021 20:27, Laurent Pinchart wrote:
> Hi Jacopo,
> 
> On Mon, Feb 22, 2021 at 04:06:43PM +0100, Jacopo Mondi wrote:
>> On Mon, Feb 22, 2021 at 03:05:03AM +0200, Laurent Pinchart wrote:
>>> Hi Jacopo,
>>>
>>> Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
>>>
>>> On Wed, Feb 17, 2021 at 01:01:26PM +0000, Kieran Bingham wrote:
>>>> On 16/02/2021 17:41, Jacopo Mondi wrote:
>>>>> During the camera module initialization the image sensor PID is read to
>>>>> verify it can correctly be identified. The current implementation is
>>>>> rather confused and uses a loop implemented with a label and a goto.
>>>>>
>>>>> Replace it with a more compact for() loop.
>>>>>
>>>>> No functional changes intended.
>>>>
>>>> I think there is a functional change in here, but I almost like it.
>>>>
>>>> Before, if the read was successful, it would check to see if the
>>>> OV10635_PID == OV10635_VERSION, and if not it would print that the read
>>>> was successful but a mismatch.
>>>>
>>>> Now - it will retry again instead, and if at the end of the retries it
>>>> still fails then it's a failure.
>>>>
>>>> This means we perhaps don't get told if the device id is not correct in
>>>> the same way, but it also means that if the VERSION was not correct
>>>> because of a read error (which I believe i've seen occur), it will retry.

So - to be clear here, I meant a 'read error', as in perhaps a
one-bit-flip or something else, not an error detected and propogated by
the I2C controllers.

I.e. ... something happening on the bus that gives a different result
but the 'read' was successful.... it's just that it returns a different
value than expected.

Given our noisy bus, not certain bus speeds, etc etc, I believe this can
happen.


>>>
>>> I was going to ask about that, whether we can have a successful I2C read
>>> operation that would return incorrect data. If we do, aren't we screwed
>>> ? If there's a non-negligible probability that reads will return
>>> incorrect data without any way to know about it (for other registers
>>> than the version register of course), then I would consider that writes
>>> could fail the same way, and that would mean an unusable device,
>>> wouldn't it ?
>>>
>>> If, on the other hand, read failures can always (or nearly always,
>>> ignoring space neutrinos and similar niceties) be detected, then I think
>>> we should avoid the functional change.
>>>
>>>> Because there is a functional change you might want to update the
>>>> commit, but I still think this is a good change overall.
>>
>> I'm not sure I got your concerns to be honest :/
>> yes before the code flow was like
>>
>>         ret = ov10635_read();
>>         if (ret < 0) {
>>
>>         }
>>
>>         if (ret != PID) {
>>

And so here you might have had a 'successful' read of the wrong value,
which means that ret > 0 but != PID.

>>         }
>>
>> But the condition ret != PID implied ret < 0 so I don't really get
>> what changes, apart from the fact that in the previous version we
>> could have had two different error messages for the same issue, and yes,
>> I saw ID mistmatch happening but the value of knowing the i2c read
>> didn't fail but the read data was garbage (usually it's 0x01 when it
>> fails iirc) is, well, questionable.
> 
> That's worrying :-S May we should add a warning message when the read
> succeeds but the ID doesn't match, to at least have a way to track the
> issue, and see if other changes get rid of this problem ?
> 

Ok, now I'm confused, that's what I was talking about!

Before we did do this, and now we don't. Ergo - functional change.


>> I'm sorry I didn't fully get this comment.
> 
> You're right, I had missed that the current code retried in case of a
> version number mismatch. There's no functional change.

I still think there's a functional change, but I'm not all too worried
about it.

As I said before, I think it's worth the retry in that event, which
didn't happen before, so my tag still holds.


> Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
> 
>>>> Reviewed-by: Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>
>>>>
>>>>> Signed-off-by: Jacopo Mondi <jacopo+renesas@jmondi.org>
>>>>> ---
>>>>>  drivers/media/i2c/rdacm20.c | 27 ++++++++++-----------------
>>>>>  1 file changed, 10 insertions(+), 17 deletions(-)
>>>>>
>>>>> diff --git a/drivers/media/i2c/rdacm20.c b/drivers/media/i2c/rdacm20.c
>>>>> index 4d9bac87cba8..6504ed0bd3bc 100644
>>>>> --- a/drivers/media/i2c/rdacm20.c
>>>>> +++ b/drivers/media/i2c/rdacm20.c
>>>>> @@ -59,6 +59,8 @@
>>>>>   */
>>>>>  #define OV10635_PIXEL_RATE		(44000000)
>>>>>
>>>>> +#define OV10635_PID_TIMEOUT		3
>>>>> +
>>>>>  static const struct ov10635_reg {
>>>>>  	u16	reg;
>>>>>  	u8	val;
>>>>> @@ -452,7 +454,7 @@ static const struct v4l2_subdev_ops rdacm20_subdev_ops = {
>>>>>
>>>>>  static int rdacm20_initialize(struct rdacm20_device *dev)
>>>>>  {
>>>>> -	unsigned int retry = 3;
>>>>> +	unsigned int i;
>>>>>  	int ret;
>>>>>
>>>>>  	/* Verify communication with the MAX9271: ping to wakeup. */
>>>>> @@ -501,23 +503,14 @@ static int rdacm20_initialize(struct rdacm20_device *dev)
>>>>>  		return ret;
>>>>>  	usleep_range(10000, 15000);
>>>>>
>>>>> -again:
>>>>> -	ret = ov10635_read16(dev, OV10635_PID);
>>>>> -	if (ret < 0) {
>>>>> -		if (retry--)
>>>>> -			goto again;
>>>>> -
>>>>> -		dev_err(dev->dev, "OV10635 ID read failed (%d)\n",
>>>>> -			ret);
>>>>> -		return -ENXIO;
>>>>> +	for (i = 0; i < OV10635_PID_TIMEOUT; ++i) {
>>>>> +		ret = ov10635_read16(dev, OV10635_PID);
>>>>> +		if (ret == OV10635_VERSION)
>>>>> +			break;
>>>>> +		usleep_range(1000, 2000);
>>>>>  	}
>>>>> -
>>>>> -	if (ret != OV10635_VERSION) {
>>>>> -		if (retry--)
>>>>> -			goto again;
>>>>> -
>>>>> -		dev_err(dev->dev, "OV10635 ID mismatch (0x%04x)\n",
>>>>> -			ret);
>>>>> +	if (i == OV10635_PID_TIMEOUT) {
>>>>> +		dev_err(dev->dev, "OV10635 ID read failed (%d)\n", ret);
>>>>>  		return -ENXIO;
>>>>>  	}
>>>>>
> 

