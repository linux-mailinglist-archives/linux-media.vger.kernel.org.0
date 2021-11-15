Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 6F9C64506DD
	for <lists+linux-media@lfdr.de>; Mon, 15 Nov 2021 15:28:18 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229864AbhKOObI (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 15 Nov 2021 09:31:08 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55242 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236544AbhKOOaB (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 15 Nov 2021 09:30:01 -0500
Received: from lb1-smtp-cloud9.xs4all.net (lb1-smtp-cloud9.xs4all.net [IPv6:2001:888:0:108::1c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 207EDC061204;
        Mon, 15 Nov 2021 06:27:00 -0800 (PST)
Received: from cust-b5b5937f ([IPv6:fc0c:c16d:66b8:757f:c639:739b:9d66:799d])
        by smtp-cloud9.xs4all.net with ESMTPA
        id mcwfmFZqdfwDFmcwjmOmT7; Mon, 15 Nov 2021 15:26:57 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=xs4all.nl; s=s2;
        t=1636986417; bh=yt66QPdhR4bWjw3Jg75p2YF2TSn5XOreYDy+26vO64Q=;
        h=Subject:To:From:Message-ID:Date:MIME-Version:Content-Type:From:
         Subject;
        b=dQ4kbmg81D23hzdX1s6E7CdYkRfr4c0wz01LErCyzAErUgijpsq4lYxlgAukAOG2t
         V7tf1yF4t2zygdse+Z5qRfbuWS4uzq1c5VrAddmjhxNgQWeX1jF1PdN0vIlRU8TsMQ
         YY52ZZc0oQhoxDACok5wZGCFu8gMQpF9q/ZEYe2uBaT3R5ia1fWMx/gPnimks/JBs+
         yQBXMbLIcZIAmefeFWr1DgMdkzoofNSqdW5jpS6Gv7XbCutn2H/S4CGh2WKRqmys3h
         FAAQgSZNSS5caUVWUR018q+PpPwSK1oSdwFcE/La/NJOtXIhECMfksgD9yyjgKjCMf
         RMjs0CYC6ihcw==
Subject: Re: [PATCH 3/4] rcar-vin: Stop stream when subdevice signal transfer
 error
To:     =?UTF-8?Q?Niklas_S=c3=b6derlund?= 
        <niklas.soderlund+renesas@ragnatech.se>
Cc:     linux-media@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
        Jacopo Mondi <jacopo+renesas@jmondi.org>
References: <20211108160220.767586-1-niklas.soderlund+renesas@ragnatech.se>
 <20211108160220.767586-4-niklas.soderlund+renesas@ragnatech.se>
 <1fddc966-5a23-63b4-185e-c17aa6d65b54@xs4all.nl>
 <YYlvqY21JvTtKysK@oden.dyn.berto.se>
From:   Hans Verkuil <hverkuil-cisco@xs4all.nl>
Message-ID: <9e405ed3-fb65-c16d-f84f-2530adbdc9b7@xs4all.nl>
Date:   Mon, 15 Nov 2021 15:26:53 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Firefox/78.0 Thunderbird/78.14.0
MIME-Version: 1.0
In-Reply-To: <YYlvqY21JvTtKysK@oden.dyn.berto.se>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-CMAE-Envelope: MS4xfLzrv5RgFYBTjHm5M0TRnO/589PSagQFSYYoNQ2fFSnMtLUv5zD2sg0IFGXN/fQU5+LQ13DjXIrTIIc8Y3iCW+F5p1kFrwuBhT3GjfthXy8ibw7rjMF4
 yep4WC65yi7HLzfGI95cQuz7hqLqib1ehFmqh0IQiG3k7l3cuZ6HIdDiv2fPJCEo+/SlU4eWDGxpHmPrEQ/37YUf1Ct3zl4r+Ww1I4O9g7qnA/JPRn3FVfXj
 CmVp4loe0aLceYplDiTINfAw5A2v1wuyHTrCJdlhxwnqxmontfB4GADlzadHaI81aEYATLwM3jNPApbqu+BkQT36l8WAhCdSwUJsx9rzEW+K8BABqL7xzcrh
 +0F9mg1f
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On 08/11/2021 19:42, Niklas Söderlund wrote:
> Hi Hans,
> 
> On 2021-11-08 18:36:25 +0100, Hans Verkuil wrote:
>> On 08/11/2021 17:02, Niklas Söderlund wrote:
>>> When a subdevice signals a transfer error stop the VIN in addition to
>>> informing user-space of the event.
>>>
>>> Signed-off-by: Niklas Söderlund <niklas.soderlund+renesas@ragnatech.se>
>>> Reviewed-by: Jacopo Mondi <jacopo+renesas@jmondi.org>
>>> ---
>>> * Changes since v3
>>> - Switch to new V4L2_EVENT_XFER_ERROR from V4L2_EVENT_EOS.
>>> - Call vb2_queue_error() when encountering the event.
>>>
>>> * Changes since v2
>>> - Log using vin_dbg() instead of v4l2_info().
>>> ---
>>>  drivers/media/platform/rcar-vin/rcar-v4l2.c | 17 ++++++++++++++++-
>>>  1 file changed, 16 insertions(+), 1 deletion(-)
>>>
>>> diff --git a/drivers/media/platform/rcar-vin/rcar-v4l2.c b/drivers/media/platform/rcar-vin/rcar-v4l2.c
>>> index a5bfa76fdac6e55a..bf17fdefe90aabf5 100644
>>> --- a/drivers/media/platform/rcar-vin/rcar-v4l2.c
>>> +++ b/drivers/media/platform/rcar-vin/rcar-v4l2.c
>>> @@ -992,9 +992,24 @@ void rvin_v4l2_unregister(struct rvin_dev *vin)
>>>  static void rvin_notify_video_device(struct rvin_dev *vin,
>>>  				     unsigned int notification, void *arg)
>>>  {
>>> +	const struct v4l2_event *event;
>>> +
>>>  	switch (notification) {
>>>  	case V4L2_DEVICE_NOTIFY_EVENT:
>>> -		v4l2_event_queue(&vin->vdev, arg);
>>> +		event = arg;
>>> +
>>> +		switch (event->type) {
>>> +		case V4L2_EVENT_XFER_ERROR:
>>> +			vin_dbg(vin,
>>> +				"Subdevice signaled transfer error, stopping.\n");
>>> +			rvin_stop_streaming(vin);
>>> +			vb2_queue_error(&vin->queue);
>>
>> Hmm, wouldn't it be the case that every driver that calls vb2_queue_error()
>> would also have to send this new event? Would it be possible to modify
>> vb2_queue_error() to raise this event? I haven't analyzed all the drivers
>> that call this function to see if that makes sense.
>>
>> Perhaps a separate new function vb2_queue_error_with_event() would also be
>> an option.
> 
> I think that maybe a good idea, but I think that would be needed on-top 
> of this work as I can't really test it. Here the rcar-csi2.ko is a 
> subdevice which detects the error condition and generates the event. And 
> this code is in rcar-vin.ko, the video device driver which reacts to the 
> event and then forwards it to user-space.
> 
> Or am I misunderstanding you? And you think I should remove the 
> v4l2_event_queue() below in favor of a new vb2_queue_error_with_event() 
> call?

Yes. And use vb2_queue_error_with_event in other drivers as well where
applicable. Hmm, it can't be called vb2_ since it is v4l2_ specific, so
perhaps v4l2_queue_error which takes a video_device and a vb2_queue as
arguments. I don't want this just in rcar since it makes perfect sense
as a generic event for such situations.

Regards,

	Hans

> 
>>
>> Regards,
>>
>> 	Hans
>>
>>> +			break;
>>> +		default:
>>> +			break;
>>> +		}
>>> +
>>> +		v4l2_event_queue(&vin->vdev, event);
>>>  		break;
>>>  	default:
>>>  		break;
>>>
>>
> 

