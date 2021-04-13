Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 30C6135DDD7
	for <lists+linux-media@lfdr.de>; Tue, 13 Apr 2021 13:37:03 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S240493AbhDMLhU (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 13 Apr 2021 07:37:20 -0400
Received: from lb1-smtp-cloud8.xs4all.net ([194.109.24.21]:40349 "EHLO
        lb1-smtp-cloud8.xs4all.net" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S238804AbhDMLhU (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 13 Apr 2021 07:37:20 -0400
Received: from cust-b5b5937f ([IPv6:fc0c:c16d:66b8:757f:c639:739b:9d66:799d])
        by smtp-cloud8.xs4all.net with ESMTPA
        id WHLZl2arGgIC3WHLdlK9yi; Tue, 13 Apr 2021 13:36:59 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=xs4all.nl; s=s2;
        t=1618313819; bh=jEUsARIo0JqIZNXOI5Z7E9R8FXqpJXDcunTU6TakZCI=;
        h=Subject:To:From:Message-ID:Date:MIME-Version:Content-Type:From:
         Subject;
        b=FJjeQgCcrWefEKdYcTCPe0sXNHegTK5THWBZmsWQag211egilwQ1JWKk/5wbq54rJ
         2vBT/bL+WCyJuYI6pthfbMWFg0PrkjwVnpOdOhPrFMhFPNYNv0mWDfgEfhdBJCScWC
         z9U4ExtvcOdnZSc2WBbHbyEaVyTV/5NXL69lTArDwB8aesSRIx7weJsmaZ+k03XSKB
         0l8Q/gJVKnTqFjptYp3yX9goLXZX8nG+UzARnmuwaOJTHd1RPLV8dnp8zfDgyRuW5u
         7nCpAIftktP4Jf7KIWIAnNA+wMFGOVjyvKVtbd75jFR6nbhu1Pz/mwGFZORTbHtShp
         8wYUYyi6k7PLA==
Subject: Re: Subject: [PATCH v2] staging: media: meson: vdec: declare u32 as
 static const appropriately
To:     Mitali Borkar <mitaliborkar810@gmail.com>,
        martin.blumenstingl@googlemail.com, narmstrong@baylibre.com,
        mchehab@kernel.org, gregkh@linuxfoundation.org,
        khilman@baylibre.com
Cc:     linux-media@vger.kernel.org, linux-staging@lists.linux.dev,
        linux-kernel@vger.kernel.org, outreachy-kernel@googlegroups.com,
        linux-amlogic@lists.infradead.org, mitali_s@me.iitr.ac.in
References: <YHU56OM+C2zY34VP@kali>
 <00c8a239-49d3-fedb-ec67-076e8b823efa@xs4all.nl> <YHV734NB4flpFjbF@kali>
From:   Hans Verkuil <hverkuil@xs4all.nl>
Message-ID: <69ffded9-548f-7595-8333-aebedae38de3@xs4all.nl>
Date:   Tue, 13 Apr 2021 13:36:45 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Firefox/78.0 Thunderbird/78.9.0
MIME-Version: 1.0
In-Reply-To: <YHV734NB4flpFjbF@kali>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-CMAE-Envelope: MS4xfBrAWRFULFyzrMwuXAr8Edg0IHLgsOAWxz9vm67BceqYT5KtpoJkstULGPzKJz439fksL/vvNLimI/2gGi8RO0WV+4keMKsPyVvdd63EHY0MeGKgutgC
 pgjT3Z96R6s4I8htah7RLuo9P3apfswKmmLJxVu1nLWVfPcLvdU3lP9dD0kCwWpwjm4jp2aDY7KAZ6rf9joucnExbJFQ5gjUVz5rxpDiv9FASOqAWJaY0WpA
 txDRMJeLKUFWhV9U/8pRAcuLpu7M5bvHyad7DgMVbDL3EiYk11z9bVU7EYvAfKUBE8LtNKK3PuIS+ntiXGUmrvhj4Y+BsIB2ONFTBM0y1GZu5UlKWAIqBVcv
 roUWo/UKEvKCtpx4cDUkIjacc/q/uF2t2V8C9rvm3sCLxtWtV75JvJLPQPpJ5Ewa+3p7cX/P955+7zN12JPYXMDLH9I3mohrhdLNxtfAB1YWWdJ/R+H5Nih3
 LE47ZSj9PTmuujS/kb8zbFvUtzXENpQ5T6nOwnI5lGhjwrnzAmg/bLuJPC0UpWlBhs2B6bQIajt8q06bS6LibM932mCYhzOyn2oFigUtik9bJM7n7OOdN2++
 aj6QIEXKySeT2+66c6WSW1+pif3EBvOPcxWwpSVT71uwYfPLZIo9MPnEGDfXJljcSko=
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On 13/04/2021 13:09, Mitali Borkar wrote:
> On Tue, Apr 13, 2021 at 09:26:01AM +0200, Hans Verkuil wrote:
>> On 13/04/2021 08:27, Mitali Borkar wrote:
>>> Declared 32 bit unsigned int as static constant inside a function
>>> appropriately.
>>>
>>> Reported-by: kernel test robot <lkp@intel.com>
>>> Signed-off-by: Mitali Borkar <mitaliborkar810@gmail.com>
>>> ---
>>>
>>> Changes from v1:- Rectified the mistake by declaring u32 as static const
>>> properly.
>>>
>>>  drivers/staging/media/meson/vdec/codec_h264.c | 4 ++--
>>>  1 file changed, 2 insertions(+), 2 deletions(-)
>>>
>>> diff --git a/drivers/staging/media/meson/vdec/codec_h264.c b/drivers/staging/media/meson/vdec/codec_h264.c
>>> index ea86e9e1c447..80141b89a9f6 100644
>>> --- a/drivers/staging/media/meson/vdec/codec_h264.c
>>> +++ b/drivers/staging/media/meson/vdec/codec_h264.c
>>> @@ -287,8 +287,8 @@ static void codec_h264_resume(struct amvdec_session *sess)
>>>  	struct amvdec_core *core = sess->core;
>>>  	struct codec_h264 *h264 = sess->priv;
>>>  	u32 mb_width, mb_height, mb_total;
>>> -	static const u32[] canvas3 = { ANCO_CANVAS_ADDR, 0 };
>>> -	static const u32[] canvas4 = { 24, 0 };
>>> +	static const u32 canvas3[] = { ANCO_CANVAS_ADDR, 0 };
>>> +	static const u32 canvas4[] = { 24, 0 };
>>
>> This is a patch on top of your previous (v1) patch. That won't work
>> since the v1 is not merged, you need to make a patch against the current
>> mainline code.
>>
> But Sir, since I have made changes in the code, and committed them, now,
> if I open that file, it will contain those changes. Then should I
> rewrite the patch body more accurately? 

You only committed the v1 change in your own repository, it's not in the
upstream repository. And the patches you post must be against the upstream
repository, not your own.

'git rebase -i' can be your friend here, it makes it easy to fold the
second patch into the first, and then you only have to post the final
version.

Regards,

	Hans

> 
>> Regards,
>>
>> 	Hans
>>
>>>  
>>>  	amvdec_set_canvases(sess, canvas3, canvas4);
>>>  
>>>
>>

