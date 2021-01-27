Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id DF28D3056C2
	for <lists+linux-media@lfdr.de>; Wed, 27 Jan 2021 10:22:56 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234382AbhA0JWM (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 27 Jan 2021 04:22:12 -0500
Received: from mout02.posteo.de ([185.67.36.66]:52325 "EHLO mout02.posteo.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S234988AbhA0JUG (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Wed, 27 Jan 2021 04:20:06 -0500
Received: from submission (posteo.de [89.146.220.130]) 
        by mout02.posteo.de (Postfix) with ESMTPS id 5275B240105
        for <linux-media@vger.kernel.org>; Wed, 27 Jan 2021 10:19:04 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=posteo.de; s=2017;
        t=1611739144; bh=WYkrlWWaZh0Lt4BNwCtC5c2iKfDy3t4cdyb0a7pXz7Y=;
        h=Subject:To:From:Date:From;
        b=hz2XO+0QZCOIXUBWNlIy8TVtPWF/eWnLlTrAWZ5W5cG6UZV2+aKkZXPnMMqin/HOx
         T5hIbj+eHLfON2JnfwN8RZVklmQsreIZlqSHBXgcvoNEIzKIGvozNTgTxpn8c3oFHt
         KTvyvJQMw54+CGvvJURMmpzcGLFdvJyprQR4U93ZrwceAXRkpbLc4Mf+r2UchVM5s/
         /GQBbfnHcA6g0l3aBgKRVwa4P+wY5/hzpsl3SJal//1IKvAHzPLozLhyYdG5FY32dh
         fP+rkblHm3JOTozUbKGMBbW1h7wJhnXVeaf8Dlf1w8Cp6R1rn6zdVSIZLBLrR/wkL4
         rSkfA2CuVbRqQ==
Received: from customer (localhost [127.0.0.1])
        by submission (posteo.de) with ESMTPSA id 4DQdMW3vLdz6tmk;
        Wed, 27 Jan 2021 10:19:03 +0100 (CET)
Subject: Re: [PATCH] v4l2-ctl: print delta to current clock in verbose mode
To:     Hans Verkuil <hverkuil@xs4all.nl>, linux-media@vger.kernel.org
References: <71a724ea-ffd4-25f5-b1ca-40802a625b62@posteo.de>
 <400c6a61-b778-0400-4ec2-cb254b9c67d5@xs4all.nl>
From:   Max Schulze <max.schulze@posteo.de>
Message-ID: <cce03638-168e-f7f7-a917-854310c64745@posteo.de>
Date:   Wed, 27 Jan 2021 10:19:03 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.1
MIME-Version: 1.0
In-Reply-To: <400c6a61-b778-0400-4ec2-cb254b9c67d5@xs4all.nl>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hello Hans,

On 27.01.21 10:02, Hans Verkuil wrote:
> Hi Max,
>
> On 26/01/2021 15:24, Max Schulze wrote:
>> If the Buffer Timestamp Clock is _MONOTONIC, print the delta
>> to the current clock time. Useful for debugging / insights.
>>
>>
>> Signed-off-by: Max Schuze <max.schulze@posteo.de>
>> ---
>>    utils/v4l2-ctl/v4l2-ctl-streaming.cpp | 8 +++++++-
>>    1 file changed, 7 insertions(+), 1 deletion(-)
>>
>> diff --git a/utils/v4l2-ctl/v4l2-ctl-streaming.cpp
>> b/utils/v4l2-ctl/v4l2-ctl-streaming.cpp
>> index a3580595..d024f925 100644
>> --- a/utils/v4l2-ctl/v4l2-ctl-streaming.cpp
>> +++ b/utils/v4l2-ctl/v4l2-ctl-streaming.cpp
>> @@ -556,9 +556,15 @@ static void print_concise_buffer(FILE *f,
>> cv4l_buffer &buf, cv4l_fmt &fmt,
>>            double ts = buf.g_timestamp().tv_sec +
>> buf.g_timestamp().tv_usec / 1000000.0;
>>            fprintf(f, " ts: %.06f", ts);
>>            if (last_ts <= 0.0)
>> -            fprintf(f, " delta: %.03f ms", (ts - last_ts) * 1000.0);
>> +            fprintf(f, " delta last: %.03f ms", (ts - last_ts) * 1000.0);
>>            last_ts = ts;
>>
>> +        if ((buf.g_flags() & V4L2_BUF_FLAG_TIMESTAMP_MASK) ==
>> V4L2_BUF_FLAG_TIMESTAMP_MONOTONIC) {
>> +            timespec ts_clock;
>> +            clock_gettime(CLOCK_MONOTONIC, &ts_clock);
>> +            fprintf(f, " delta now: %+.03f ms", ((ts_clock.tv_sec +
>> ts_clock.tv_nsec / 1000000000.0) - ts) * 1000.0);
> I have no objection to this, but I think this needs to be enabled
> with a new option (e.g. --stream-show-delta-now) to avoid cluttering
> the output too much.
>
Note we already need to be in verbose mode and not skip_ts .

Example output:

> cap dqbuf: 0 seq:      0 bytesused: 512000 ts: 137342.420951 delta 
> last: 137342420.951 ms delta now: +56.301 ms (ts-monotonic, ts-src-soe)
> cap dqbuf: 1 seq:      2 bytesused: 512000 ts: 137342.484954 delta 
> now: +28.171 ms dropped: 1 (ts-monotonic, ts-src-soe)
> cap dqbuf: 2 seq:      3 bytesused: 512000 ts: 137342.520953 delta 
> now: +24.296 ms (ts-monotonic, ts-src-soe)
> cap dqbuf: 3 seq:      4 bytesused: 512000 ts: 137342.556925 delta 
> now: +24.269 ms (ts-monotonic, ts-src-soe)
> cap dqbuf: 0 seq:      5 bytesused: 512000 ts: 137342.592909 delta 
> now: +24.216 ms fps: 29.08 (ts-monotonic, ts-src-soe)
BTW: is this the supposed way to display the "delta last", [...] "show 
the timestamp delta between two successive frames." ?


Do you want me to make another patch with mentioned command line option?


Best,

Max

