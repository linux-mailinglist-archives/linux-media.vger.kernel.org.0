Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id C0AF14D1855
	for <lists+linux-media@lfdr.de>; Tue,  8 Mar 2022 13:52:35 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S244985AbiCHMxa (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 8 Mar 2022 07:53:30 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55692 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230080AbiCHMx3 (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Tue, 8 Mar 2022 07:53:29 -0500
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9EF99E1E;
        Tue,  8 Mar 2022 04:52:30 -0800 (PST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ams.source.kernel.org (Postfix) with ESMTPS id 36C67B818B1;
        Tue,  8 Mar 2022 12:52:29 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9DCB0C340EB;
        Tue,  8 Mar 2022 12:52:26 +0000 (UTC)
Message-ID: <c4368e33-f6bf-5810-85cb-cd31359a42f7@xs4all.nl>
Date:   Tue, 8 Mar 2022 13:52:24 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.6.0
Subject: Re: [PATCH] media: av7110: av7110_av: Fix Switch and Case Same Indent
 Style Error
Content-Language: en-US
To:     Ahamed Husni <ahamedhusni73@gmail.com>
Cc:     mchehab@kernel.org, Greg KH <gregkh@linuxfoundation.org>,
        linux-media@vger.kernel.org, linux-staging@lists.linux.dev,
        linux-kernel@vger.kernel.org
References: <20220225155622.585621-1-ahamedhusni73@gmail.com>
 <818eb53d-0ca5-d0dc-4a06-37615a5c4c3b@xs4all.nl>
 <CAFjpAKpyDeEKvA9TEK0KbKVHFN8KSMDZKF=L2Azq_7cuAhHH4A@mail.gmail.com>
From:   Hans Verkuil <hverkuil@xs4all.nl>
In-Reply-To: <CAFjpAKpyDeEKvA9TEK0KbKVHFN8KSMDZKF=L2Azq_7cuAhHH4A@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-6.7 required=5.0 tests=BAYES_00,
        HEADER_FROM_DIFFERENT_DOMAINS,NICE_REPLY_A,RCVD_IN_DNSWL_HI,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On 3/8/22 13:50, Ahamed Husni wrote:
> Hello Hans,
> 
> On Mon, Mar 7, 2022 at 12:58 PM Hans Verkuil <hverkuil@xs4all.nl> wrote:
>>
>> Hi Husni,
>>
>> Thank you for the patch.
>>
>> The Subject line needs some work: either name the source ('av7110_av.c:') or
>> driver ('av7110:'), but not both. Also just stick to lower case, so:
>> "media: av7110_av.c: fix switch indentation"
>>
>> That gives all the relevant information, and is a lot shorter.
> Noted with thanks. I'll update the subject line in the V2 of the patch.
> 
>>
>> On 2/25/22 16:56, Husni Faiz wrote:
>>> This patch fixes "switch and case should be at the same indent"
>>> checkpatch error.
>>>
>>> Signed-off-by: Husni Faiz <ahamedhusni73@gmail.com>
>>> ---
>>>  drivers/staging/media/av7110/av7110_av.c | 30 ++++++++++++------------
>>>  1 file changed, 15 insertions(+), 15 deletions(-)
>>>
>>> diff --git a/drivers/staging/media/av7110/av7110_av.c b/drivers/staging/media/av7110/av7110_av.c
>>> index 91f4866c7e59..1d42862e9669 100644
>>> --- a/drivers/staging/media/av7110/av7110_av.c
>>> +++ b/drivers/staging/media/av7110/av7110_av.c
>>> @@ -770,22 +770,22 @@ static void p_to_t(u8 const *buf, long int length, u16 pid, u8 *counter,
>>>       if (length > 3 &&
>>>            buf[0] == 0x00 && buf[1] == 0x00 && buf[2] == 0x01)
>>>               switch (buf[3]) {
>>> -                     case PROG_STREAM_MAP:
>>> -                     case PRIVATE_STREAM2:
>>> -                     case PROG_STREAM_DIR:
>>> -                     case ECM_STREAM     :
>>> -                     case EMM_STREAM     :
>>> -                     case PADDING_STREAM :
>>> -                     case DSM_CC_STREAM  :
>>> -                     case ISO13522_STREAM:
>>> -                     case PRIVATE_STREAM1:
>>> -                     case AUDIO_STREAM_S ... AUDIO_STREAM_E:
>>> -                     case VIDEO_STREAM_S ... VIDEO_STREAM_E:
>>> -                             pes_start = 1;
>>> -                             break;
>>> +             case PROG_STREAM_MAP:
>>> +             case PRIVATE_STREAM2:
>>> +             case PROG_STREAM_DIR:
>>> +             case ECM_STREAM     :
>>> +             case EMM_STREAM     :
>>> +             case PADDING_STREAM :
>>> +             case DSM_CC_STREAM  :
>>> +             case ISO13522_STREAM:
>>> +             case PRIVATE_STREAM1:
>>> +             case AUDIO_STREAM_S ... AUDIO_STREAM_E:
>>> +             case VIDEO_STREAM_S ... VIDEO_STREAM_E:
>>> +                     pes_start = 1;
>>> +                     break;
>>>
>>> -                     default:
>>> -                             break;
>>> +             default:
>>> +                     break;
>>>               }
>>>
>>>       while (c < length) {
>>
>> Running checkpatch.pl over this patch give me:
>>
>> ERROR: space prohibited before that ':' (ctx:WxE)
>> #40: FILE: drivers/staging/media/av7110/av7110_av.c:776:
>> +               case ECM_STREAM     :
>>                                     ^
>>
>> ERROR: space prohibited before that ':' (ctx:WxE)
>> #41: FILE: drivers/staging/media/av7110/av7110_av.c:777:
>> +               case EMM_STREAM     :
>>                                     ^
>>
>> ERROR: space prohibited before that ':' (ctx:WxE)
>> #42: FILE: drivers/staging/media/av7110/av7110_av.c:778:
>> +               case PADDING_STREAM :
>>                                     ^
>>
>> ERROR: space prohibited before that ':' (ctx:WxE)
>> #43: FILE: drivers/staging/media/av7110/av7110_av.c:779:
>> +               case DSM_CC_STREAM  :
>>                                     ^
>> Can you fix that as well in a v2 of this patch?
> It seems that these spaces are deliberately added by the author to
> keep the case statements' colons aligned.
> Some other lines in the file where the same approach has been taken
> are [line 598,599,600,601] and [line 662, 663, 664, 665].
> Should we leave these spaces as it is?

Either just fix it here, or post a second patch that removes the spaces
throughout this driver. It's a very old driver, predating the much more
strict enforcement of coding style that we have today.

Regards,

	Hans

> 
> Thanks,
> Husni.

