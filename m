Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id F1645305814
	for <lists+linux-media@lfdr.de>; Wed, 27 Jan 2021 11:18:42 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235751AbhA0KRy (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 27 Jan 2021 05:17:54 -0500
Received: from lb3-smtp-cloud7.xs4all.net ([194.109.24.31]:53037 "EHLO
        lb3-smtp-cloud7.xs4all.net" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S234345AbhA0KP4 (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 27 Jan 2021 05:15:56 -0500
Received: from cust-b5b5937f ([IPv6:fc0c:c16d:66b8:757f:c639:739b:9d66:799d])
        by smtp-cloud7.xs4all.net with ESMTPA
        id 4hqvllXB81U0p4hqzl03ts; Wed, 27 Jan 2021 11:15:13 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=xs4all.nl; s=s2;
        t=1611742513; bh=chb4sMVKUt+7nsODaRCQOkT3XrCkdu29UyjXR3GrcF4=;
        h=Subject:To:From:Message-ID:Date:MIME-Version:Content-Type:From:
         Subject;
        b=s68/8M72D0V8nFh1vJiuDWFpQ5ZcJXThDs7mD4DZopC/aH4s+z+yLgD/iBiUtrE5V
         9+5kCo3uspWrVgA6zs2VXo6tuLYjznb75rWWKb4jIqRNF6et1sQeFFHx0ZZV/sUcpB
         XAcNjwx2K9FUq7ppG3VArhDWQdD9TXoIvpzAAycqM28O+HsVuM0QJsetCxhuQ+pSq4
         Q+YKqXpdv34bUXxbRKCWsS2JC+J/BfHJkxlxlMygvD9grJfAKzsh31/SspODM4/JtF
         VFUhevjqhpLd9RwWKpsEjS9wafnk1NFt2JIh38Kj5felSSM3ALQneajB7tgnvVhlVM
         civ292PdlTgdQ==
Subject: Re: [PATCH] v4l2-ctl: print delta to current clock in verbose mode
To:     Max Schulze <max.schulze@posteo.de>, linux-media@vger.kernel.org
References: <71a724ea-ffd4-25f5-b1ca-40802a625b62@posteo.de>
 <400c6a61-b778-0400-4ec2-cb254b9c67d5@xs4all.nl>
 <cce03638-168e-f7f7-a917-854310c64745@posteo.de>
From:   Hans Verkuil <hverkuil@xs4all.nl>
Message-ID: <0ccd746f-3555-11e0-9ff7-d2f39ba4685a@xs4all.nl>
Date:   Wed, 27 Jan 2021 11:15:09 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.6.0
MIME-Version: 1.0
In-Reply-To: <cce03638-168e-f7f7-a917-854310c64745@posteo.de>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-CMAE-Envelope: MS4xfHXqqpf5Yx1M5VbXFPDBXpP0GUGrDciBsP4q6aPoJ0sY8PhP8J+3W/OkB9DmHhvD6zOpvQTKitrEqjmo7HkuOEAoxZahD+WH+YhjrLQc/SL9w2Q5MEfJ
 rmHIUwkVi95f8MVLdhUQt46q9KUj4+Z65E9I5QbDUlGIG6pLtY5pvrA88/8rz7amKZI4gvLb+986fx4m7kAQZPaCm132xVoGQo/ekJujd/hcKL1nugg3Q5aT
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On 27/01/2021 10:19, Max Schulze wrote:
> Hello Hans,
> 
> On 27.01.21 10:02, Hans Verkuil wrote:
>> Hi Max,
>>
>> On 26/01/2021 15:24, Max Schulze wrote:
>>> If the Buffer Timestamp Clock is _MONOTONIC, print the delta
>>> to the current clock time. Useful for debugging / insights.
>>>
>>>
>>> Signed-off-by: Max Schuze <max.schulze@posteo.de>
>>> ---
>>>    utils/v4l2-ctl/v4l2-ctl-streaming.cpp | 8 +++++++-
>>>    1 file changed, 7 insertions(+), 1 deletion(-)
>>>
>>> diff --git a/utils/v4l2-ctl/v4l2-ctl-streaming.cpp
>>> b/utils/v4l2-ctl/v4l2-ctl-streaming.cpp
>>> index a3580595..d024f925 100644
>>> --- a/utils/v4l2-ctl/v4l2-ctl-streaming.cpp
>>> +++ b/utils/v4l2-ctl/v4l2-ctl-streaming.cpp
>>> @@ -556,9 +556,15 @@ static void print_concise_buffer(FILE *f,
>>> cv4l_buffer &buf, cv4l_fmt &fmt,
>>>            double ts = buf.g_timestamp().tv_sec +
>>> buf.g_timestamp().tv_usec / 1000000.0;
>>>            fprintf(f, " ts: %.06f", ts);
>>>            if (last_ts <= 0.0)
>>> -            fprintf(f, " delta: %.03f ms", (ts - last_ts) * 1000.0);
>>> +            fprintf(f, " delta last: %.03f ms", (ts - last_ts) * 1000.0);
>>>            last_ts = ts;
>>>
>>> +        if ((buf.g_flags() & V4L2_BUF_FLAG_TIMESTAMP_MASK) ==
>>> V4L2_BUF_FLAG_TIMESTAMP_MONOTONIC) {
>>> +            timespec ts_clock;
>>> +            clock_gettime(CLOCK_MONOTONIC, &ts_clock);
>>> +            fprintf(f, " delta now: %+.03f ms", ((ts_clock.tv_sec +
>>> ts_clock.tv_nsec / 1000000000.0) - ts) * 1000.0);
>> I have no objection to this, but I think this needs to be enabled
>> with a new option (e.g. --stream-show-delta-now) to avoid cluttering
>> the output too much.
>>
> Note we already need to be in verbose mode and not skip_ts .
> 
> Example output:
> 
>> cap dqbuf: 0 seq:      0 bytesused: 512000 ts: 137342.420951 delta 
>> last: 137342420.951 ms delta now: +56.301 ms (ts-monotonic, ts-src-soe)
>> cap dqbuf: 1 seq:      2 bytesused: 512000 ts: 137342.484954 delta 
>> now: +28.171 ms dropped: 1 (ts-monotonic, ts-src-soe)
>> cap dqbuf: 2 seq:      3 bytesused: 512000 ts: 137342.520953 delta 
>> now: +24.296 ms (ts-monotonic, ts-src-soe)
>> cap dqbuf: 3 seq:      4 bytesused: 512000 ts: 137342.556925 delta 
>> now: +24.269 ms (ts-monotonic, ts-src-soe)
>> cap dqbuf: 0 seq:      5 bytesused: 512000 ts: 137342.592909 delta 
>> now: +24.216 ms fps: 29.08 (ts-monotonic, ts-src-soe)
> BTW: is this the supposed way to display the "delta last", [...] "show 
> the timestamp delta between two successive frames." ?

Yes.

> 
> 
> Do you want me to make another patch with mentioned command line option?

Yes please!

Regards,

	Hans

> 
> 
> Best,
> 
> Max
> 

