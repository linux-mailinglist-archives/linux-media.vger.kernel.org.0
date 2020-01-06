Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id C539213144B
	for <lists+linux-media@lfdr.de>; Mon,  6 Jan 2020 16:02:52 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726608AbgAFPCv (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 6 Jan 2020 10:02:51 -0500
Received: from lb2-smtp-cloud9.xs4all.net ([194.109.24.26]:34825 "EHLO
        lb2-smtp-cloud9.xs4all.net" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1726303AbgAFPCv (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 6 Jan 2020 10:02:51 -0500
Received: from [192.168.2.10] ([62.249.185.68])
        by smtp-cloud9.xs4all.net with ESMTPA
        id oTu1iK2fiVPvpoTu5iqW1m; Mon, 06 Jan 2020 16:02:49 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=xs4all.nl; s=s1;
        t=1578322969; bh=Dt0CFVhqdLI8Xl8UAPeUVRN3u5yvp0/ievSplYySRkg=;
        h=Subject:To:From:Message-ID:Date:MIME-Version:Content-Type:From:
         Subject;
        b=OcJ76CKePy06bFUgoGK5X1j7wWcqG7jKIRoYUHmQTIVurYrcc2WK3GJdOUl3M61ff
         +zfc3gSSMh844EtY9mff0XREuSCkL/R7ZEqRkSrqjmKC7XuAC08acAzF77gvdDu+0O
         4PIEEXHaIGY2NCiC/SY/o9naedckvb/5EzTTYdDJznjZFNWhqVi3b+o9UKgoHm94iA
         Ea8+0dQQy4OoNM56omlsCI07Zc8sZGiX3Dys9LBzIeJ7GMmgYr/qoXOFrrwkJ44HQL
         nlLWMLBCXCMPWnaTyEqBqXncvZ0qCDJCcdZRGhfkNkyj/+tT3Y4JWGYWDAhMwjG564
         qY3joXymJ+CIQ==
Subject: Re: [PATCH 0/5] Stateful Encoding: final bits
To:     Michael Tretter <m.tretter@pengutronix.de>
Cc:     linux-media@vger.kernel.org, kernel@pengutronix.de,
        Nicolas Dufresne <nicolas@ndufresne.ca>
References: <20191119113457.57833-1-hverkuil-cisco@xs4all.nl>
 <20191220144734.31667e9c@litschi.hi.pengutronix.de>
From:   Hans Verkuil <hverkuil-cisco@xs4all.nl>
Message-ID: <eeb55c72-2abd-8ce9-a352-1247a366ce9a@xs4all.nl>
Date:   Mon, 6 Jan 2020 16:02:45 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <20191220144734.31667e9c@litschi.hi.pengutronix.de>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-CMAE-Envelope: MS4wfMazK6vbxPfq4TDXzaIwHN0TA8NnGKut8JiV9kv0R1J/Ncehopwjed5sZh4ZvROLjhXKAQkOdwyrmb69TFd2reSuYc/btidtHZtbX1YG9n5BshKGNqYS
 GYGNeQMH0jixD2zA1qSjRKM4q6PuI4hWzp7muokGJLgXjRbg3VEvOb8qNSLlC2dpbnTOINmTA9SlXi0c+a0yrZKJlUy7/6ZakjcIIAt9RSFXF8Gea3nQZ0U5
 32IPxn1z8C28dqlbH/z38bhnVJXbC7xq6bamJVUt1iIxn/xMuPeG39mF/0peFr4L
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

(Added Nicolas as I'd like his input as well)

Reply below:

On 12/20/19 2:47 PM, Michael Tretter wrote:
> Hello Hans,
> 
> On Tue, 19 Nov 2019 12:34:52 +0100, Hans Verkuil wrote:
>> This series adds support for fractions in the control framework,
>> and a way to obtain the min and max values of compound controls
>> such as v4l2_fract.
>>
>> Next it adds the V4L2_CID_MPEG_VIDEO_ENC_FRAME_RATE control to
>> set the framerate for the encoder.
>>
>> The next patch adds support for the V4L2_BUF_FLAG_TOO_SMALL flag
>> to signal that the capture buffer was too small.
>>
>> The final patch adds the encoder spec (unchanged from v3).
>>
>> Michael, can you add support for V4L2_CID_MPEG_VIDEO_ENC_FRAME_RATE
>> to your encoder driver? Let me know if something isn't working.
> 
> I implemented the control and hooked it up with S_PARM as well. The
> implementation was straightforward without any real issues. I'll send a
> patch in reply to this mail. Having a control for configuring the frame
> rate that is encoded into the SPS feels correct. This is in line with
> configuring the bitrate, level, etc.
> 
> However, after seeing the implementation and fiddling around with it in
> userspace, I am not convinced that S_PARM should be used signal the
> rate at which frames are submitted.
> 
> Setting the frame submission rate to something different than the
> frame rate of the stream would be most interesting for transcoding use
> cases. The user space would either want to run the encoding as fast as
> possible or, if there are multiple encoding processes, as fast as
> possible with properly shared resources. Boiling this information down
> into a single number (and calling is "rate at which frames are
> submitted") sounds kind of wrong, because the userspace does not know
> which submission rate would lead to a good result.
> 
> Using the frame rate for such a setting seems pretty unique to the
> allegro encoder. Other encoders might use different mechanisms to boost
> the encoding speed, e.g., might be able to temporarily increase the
> clock rate of the codec. In these cases, the driver would need to
> translate the "framerate" set via S_PARM to a clock rate for the codec.
> This does not sound right.
> 
> However, in the end, this would lead to exposing single parameters that
> allow to tune the codec via generic controls. This does not seem to be
> the right way, at all. Maybe we could have a control that tells the
> encoder to "run as fast as possible" or to "run with as little
> resources as possible", which would be applicable to more encoders and
> the driver would have to decide how to implement this "profile".
> 
> Still, I am not really sure, if this is the proper way to solve this.

I think you raise good points.

So this means that we need this new control (required for stateful encoders)
and optionally allow S_PARM to be used as an alternative way to set the
same control.

I prefer to make S_PARM optional and require the control, since I hate S_PARM :-)

It would mean that all existing stateful encoders need to implement this new
control, but I think that's a good idea anyway.

> 
>> I need to add a test control for this to vivid as well and add support
>> for this to v4l2-ctl, that's on my TODO list.
>>
>> Open questions:
>>
>> 1) Existing encoder drivers use S_PARM to signal the frameperiod,
>> but as discussed in Lyon this should be the rate at which frames are
>> submitted for encoding, which can be different from
>> V4L2_CID_MPEG_VIDEO_ENC_FRAME_RATE. But given the current use-cases
>> I was wondering if calling S_PARM should set the ENC_FRAME_RATE
>> control as well, and you would need to explicitly set the control
>> after S_PARM if the two are not the same. This would mean that
>> existing applications that don't know about the control can keep working.
> 
> In the patch I did exactly that and we should be backwards compatible
> to applications that use only S_PARM.
> 
> Michael
> 

Thanks for working on this!

Happy New Year,

	Hans
