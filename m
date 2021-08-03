Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id F3D913DE723
	for <lists+linux-media@lfdr.de>; Tue,  3 Aug 2021 09:20:02 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234082AbhHCHUM (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 3 Aug 2021 03:20:12 -0400
Received: from lb1-smtp-cloud8.xs4all.net ([194.109.24.21]:42471 "EHLO
        lb1-smtp-cloud8.xs4all.net" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S234137AbhHCHTQ (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 3 Aug 2021 03:19:16 -0400
Received: from cust-b5b5937f ([IPv6:fc0c:c16d:66b8:757f:c639:739b:9d66:799d])
        by smtp-cloud8.xs4all.net with ESMTPA
        id AohXmSdcGXTlcAohYmkBo8; Tue, 03 Aug 2021 09:19:01 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=xs4all.nl; s=s2;
        t=1627975141; bh=YAGVKGywEqKgl9SJ6IqrRElA+hIl/FDR4omEORVtCTk=;
        h=Subject:To:From:Message-ID:Date:MIME-Version:Content-Type:From:
         Subject;
        b=ua2ZAGmq7ZU6wkcP6TqjBwmLyn2lTX8s5Kj9iBLghvPhzPFRfo/WM2crT1okPhTxL
         0bTPwdkt+FxGnyk/TRu7ipEJOROW75uANTf4JSh6FX1XkzsuHyCgNPhddP8ANWxi5x
         R+zTaii4HyPDCbGV0KYV6tm5AmJF6ylvQJJvfwps+Zv+LjREBI3Sw1sPR9gx3RD1wH
         b6aeTt6NEoJqJIBLEKqsyKkR9+qZfJm5FU6Ch2bVmXknqVIhncmZd5vWNilbmArS0i
         1ciuBaLtDDJ8ZSR8osthNIuI2FyvuyZYflfuB/criPRZYY0eldJGposVn4kDG/t2Bk
         43GeRAVmm4E9Q==
Subject: Re: [PATCH] drivers/input: Remove all strcpy() uses in favor of
 strscpy()
To:     Kees Cook <keescook@chromium.org>, Len Baker <len.baker@gmx.com>
Cc:     "Russell King (Oracle)" <linux@armlinux.org.uk>,
        Dmitry Torokhov <dmitry.torokhov@gmail.com>,
        Lee Jones <lee.jones@linaro.org>,
        =?UTF-8?Q?Uwe_Kleine-K=c3=b6nig?= <u.kleine-koenig@pengutronix.de>,
        linux-hardening@vger.kernel.org, linux-input@vger.kernel.org,
        linux-kernel@vger.kernel.org, Joe Perches <joe@perches.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        linux-media@vger.kernel.org
References: <20210801144316.12841-1-len.baker@gmx.com>
 <20210801145959.GI22278@shell.armlinux.org.uk> <20210801155732.GA16547@titan>
 <202108010934.FA668DEB28@keescook> <202108022354.49612943B7@keescook>
From:   Hans Verkuil <hverkuil@xs4all.nl>
Message-ID: <1c5ad456-3b3c-00e1-abce-3fc897d381c1@xs4all.nl>
Date:   Tue, 3 Aug 2021 09:18:59 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <202108022354.49612943B7@keescook>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-CMAE-Envelope: MS4xfMGrZqL/FiQElRRgP7rZrR6EKMvKNJB9cL7M2k0xUKYQZBlx4HPK7llWgBMWfYgq1csRfB2Fk3JhzivHOpJj/4c5AatVRkTrY00olMGAy0ooH6k3t5xS
 SdwuwKYoyoQGGavdAiZSgo7yd5i3wDMf20vpDAajs7RhRZD2eM1qag6MWSkwkhS1OdnqmBOF4KZCCnzpAM85qIFwHMqJd6hWL1KEaUIBKsuXuwpTVj3d4/Sk
 aOg8q/+IsoYwrqE+PgjxUJZ+Yo0PelLfgl+ILtRGQ40tpEOCEYhlgTv1QBu+Y9UmkxlPtKwSDGzq2x4jXtvuu07rKDp1fJ6zv2JrCTDHrhgwTRXbFNtsQeFc
 Oa4WH1hmyEDHXHXM42QEx/p2hR+Fi8ECxK54DSMmXXvq/sjb8/T0DLSxYWLGnlBDjouN6iL3wdlpQWFxXx4WOCF9ZuFeLFJrnO32vZIyiosZyHVC/5vvFZlO
 2Gs3RHw0FCvNUo5FjvcCzwz/Vz9mu0oWLwA5sunMpRHG0ly5+vLgNIQjLGL9SZLsm5pupjm83dVn4amB+cT1RMVlLIBUUDkZ9mHaxARSGBvGXDL3ewdy6NPO
 wz1GRJUZJ6SQH1luWkfuX57p61uMEqks4msgHmF/0YCPL1ERs88M/22TtY9/nkwmkeTwey2kQjVjLnfkDPz2ex2eMesukD5Bz5IYieHb6UdOSg==
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On 03/08/2021 09:07, Kees Cook wrote:
> On Sun, Aug 01, 2021 at 09:44:33AM -0700, Kees Cook wrote:
>> On Sun, Aug 01, 2021 at 05:57:32PM +0200, Len Baker wrote:
>>> Hi,
>>>
>>> On Sun, Aug 01, 2021 at 04:00:00PM +0100, Russell King (Oracle) wrote:
>>>> On Sun, Aug 01, 2021 at 04:43:16PM +0200, Len Baker wrote:
>>>>> strcpy() performs no bounds checking on the destination buffer. This
>>>>> could result in linear overflows beyond the end of the buffer, leading
>>>>> to all kinds of misbehaviors. The safe replacement is strscpy().
>>>>>
>>>>> Signed-off-by: Len Baker <len.baker@gmx.com>
>>>>> ---
>>>>> This is a task of the KSPP [1]
>>>>>
>>>>> [1] https://github.com/KSPP/linux/issues/88
>>>>>
>>>>>  drivers/input/keyboard/locomokbd.c | 2 +-
>>>>>  1 file changed, 1 insertion(+), 1 deletion(-)
>>>>>
>>>>> diff --git a/drivers/input/keyboard/locomokbd.c b/drivers/input/keyboard/locomokbd.c
>>>>> index dae053596572..dbb3dc48df12 100644
>>>>> --- a/drivers/input/keyboard/locomokbd.c
>>>>> +++ b/drivers/input/keyboard/locomokbd.c
>>>>> @@ -254,7 +254,7 @@ static int locomokbd_probe(struct locomo_dev *dev)
>>>>>  	locomokbd->suspend_jiffies = jiffies;
>>>>>
>>>>>  	locomokbd->input = input_dev;
>>>>> -	strcpy(locomokbd->phys, "locomokbd/input0");
>>>>> +	strscpy(locomokbd->phys, "locomokbd/input0", sizeof(locomokbd->phys));
>>>>
>>>> So if the string doesn't fit, it's fine to silently truncate it?
>>>
>>> I think it is better than overflow :)
>>>
>>>> Rather than converting every single strcpy() in the kernel to
>>>> strscpy(), maybe there should be some consideration given to how the
>>>> issue of a strcpy() that overflows the buffer should be handled.
>>>> E.g. in the case of a known string such as the above, if it's longer
>>>> than the destination, should we find a way to make the compiler issue
>>>> a warning at compile time?
>>>
>>> Good point. I am a kernel newbie and have no experience. So this
>>> question should be answered by some kernel hacker :) But I agree
>>> with your proposals.
>>>
>>> Kees and folks: Any comments?
>>>
>>> Note: Kees is asked the same question in [2]
>>>
>>> [2] https://lore.kernel.org/lkml/20210731135957.GB1979@titan/
>>
>> Hi!
>>
>> Sorry for the delay at looking into this. It didn't use to be a problem
>> (there would always have been a compile-time warning generated for
>> known-too-small cases), but that appears to have regressed when,
>> ironically, strscpy() coverage was added. I've detailed it in the bug
>> report:
>> https://github.com/KSPP/linux/issues/88
>>
>> So, bottom line: we need to fix the missing compile-time warnings for
>> strcpy() and strscpy() under CONFIG_FORTIFY_SOURCE=y.
> 
> I've got these fixed now, and will send them out likely tomorrow, but I
> did, in fact, find 4 cases of truncation, all in v4l, and all appear to
> have been truncated since introduction:
> 
> struct v4l2_capability {
> ...
>         __u8    card[32];
> (stores 31 characters)
> 
> drivers/media/radio/radio-wl1273.c:1282
> wl1273_fm_vidioc_querycap()
>             strscpy(capability->card, "Texas Instruments Wl1273 FM Radio",
>                     sizeof(capability->card));
> 33 characters, getting truncated to:
> Texas Instruments Wl1273 FM Rad
> 87d1a50ce45168cbaec10397e876286a398052c1

I'd change this to: "TI WL1273 FM Radio"

> 
> drivers/media/radio/si470x/radio-si470x-usb.c:514
> si470x_vidioc_querycap()
> #define DRIVER_CARD "Silicon Labs Si470x FM Radio Receiver"
>             strscpy(capability->card, DRIVER_CARD,
> sizeof(capability->card));
> 37 characters, getting truncated to:
> Silicon Labs Si470x FM Radio Re
> 78656acdcf4852547a29e929a1b7a98d5ac65f17

This to "Silicon Labs Si470x FM Radio"

> 
> drivers/media/radio/si470x/radio-si470x-i2c.c:225
> si470x_vidioc_querycap()
> #define DRIVER_CARD "Silicon Labs Si470x FM Radio Receiver"
>             strscpy(capability->card, DRIVER_CARD,
> sizeof(capability->card));
> 37 characters, getting truncated to:
> Silicon Labs Si470x FM Radio Re
> cc35bbddfe10f77d949f0190764b252cd2b70c3c

Ditto.

> 
> drivers/media/usb/tm6000/tm6000-video.c:855
> vidioc_querycap()
>             strscpy(cap->card, "Trident TVMaster TM5600/6000/6010",
>                     sizeof(cap->card));
> 33 characters, getting truncated to:
> Trident TVMaster TM5600/6000/60
> e28f49b0b2a8e678af62745ffdc4e4f36d7283a6

And this to: "Trident TM5600/6000/6010"

The truncation doesn't hurt anything, it's just looks a bit ugly.
These shorter names should solve this issue.

Regards,

	Hans

> 
> How should these be handled? I assume v4l2_capability::card can't be
> resized since it's part of IOCTL response, so likely all the string just
> need to be shortened in some way? Seems like dropping the manufacturer
> name makes the most sense, since manufacturer can be kind of derived
> from the driver names.
> 
> Thoughts?
> 
> -Kees
> 

