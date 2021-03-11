Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 3C14B337395
	for <lists+linux-media@lfdr.de>; Thu, 11 Mar 2021 14:18:42 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233369AbhCKNSI (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 11 Mar 2021 08:18:08 -0500
Received: from lb2-smtp-cloud8.xs4all.net ([194.109.24.25]:48687 "EHLO
        lb2-smtp-cloud8.xs4all.net" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S233139AbhCKNRq (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 11 Mar 2021 08:17:46 -0500
Received: from cust-b5b5937f ([IPv6:fc0c:c16d:66b8:757f:c639:739b:9d66:799d])
        by smtp-cloud8.xs4all.net with ESMTPA
        id KLC9lP5n45C8yKLCDleYWH; Thu, 11 Mar 2021 14:17:45 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=xs4all.nl; s=s2;
        t=1615468665; bh=FyWq1F/yZuBVQnqwFMk1cF/U6HFyUbVDrNZzEG6LORU=;
        h=Subject:To:From:Message-ID:Date:MIME-Version:Content-Type:From:
         Subject;
        b=Rjrx9qPrQRRWyahiTMmyFDKaAUllRvoLvDds6xPmWm0hCExlyymCwSTvUk79Wq+tx
         BFSr15FUlxwdVYsF80K5IvPiBRumU4NUBJp/shAH/HZSnvGB0gdZwzNo5cuThpEjN7
         QySaWNSDl7bDn15QqmCvTdMZTANENIwnRNjHOntVYsnG3+AU3GhxAotQmSMkriPnaV
         SsrxmWCJS9rVJODjmWedIjQVZAtOfo3ynsK7iFGj34ic+PO4uwq4Kj0oBXpoVQlkzM
         GdLHkyTRj5o+Z0u0NFjfgASDzvK91jDtL+defvdcBv3U3UuxhpdX24sVUuSrdwGWxc
         EXF9fqR+3HA1g==
Subject: Re: [PATCH] v4l2-compliance: Fix V4L2_CTRL_WHICH_DEF_VAL in
 multi_classes
To:     Ricardo Ribalda <ribalda@chromium.org>
Cc:     Linux Media Mailing List <linux-media@vger.kernel.org>
References: <20210310212450.1220416-1-ribalda@chromium.org>
 <cbabd1db-5fda-309b-50bc-8398e8d1580c@xs4all.nl>
 <CANiDSCuCvbYJp8CDKZV7_8dsxxzgUTG--insgLiEwqh2RrQ7Qw@mail.gmail.com>
From:   Hans Verkuil <hverkuil-cisco@xs4all.nl>
Message-ID: <a1021cbe-1ae6-a5bf-c890-21bb1b48d6d0@xs4all.nl>
Date:   Thu, 11 Mar 2021 14:17:41 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Firefox/78.0 Thunderbird/78.7.1
MIME-Version: 1.0
In-Reply-To: <CANiDSCuCvbYJp8CDKZV7_8dsxxzgUTG--insgLiEwqh2RrQ7Qw@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-CMAE-Envelope: MS4xfBayyxvGIvIhJvNMmE7QG9jkkaUaX6mDONNYf9FGJpYwWWB2WZhdQrVvawA1Pr4eYL+AWN8jzGDpKuP9NCtPh8eAu7U+9inctJFwS2rK+mcXg6yONuLY
 Inxf+fQND7oR9bC3nb0bpDzDL0C0r8V3JWDGbhJOMs9ccCjePtTbDpvoIbx4TnWDy7ejCZ+oX/RK4DAVV49VDPySNOW+pQtig/n9eyWezorCyrquqMV9eUuZ
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On 11/03/2021 14:06, Ricardo Ribalda wrote:
> Hi Hans
> 
> Thanks for your review!
> 
> 
> On Thu, Mar 11, 2021 at 1:57 PM Hans Verkuil <hverkuil-cisco@xs4all.nl> wrote:
>>
>> On 10/03/2021 22:24, Ricardo Ribalda wrote:
>>> If there are multiple classes, the ioctl should fail.
>>
>> It shouldn't matter if there are multiple classes or not, it should
>> work.
> 
> I believe this is the part of the kernel that is triggering the issue:
> 
> https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/drivers/media/v4l2-core/v4l2-ioctl.c#n929
> 
> I can send a patch if that is not the intended behaviour ;)
> 
> /* Check that all controls are from the same control class. */
> for (i = 0; i < c->count; i++) {
> if (V4L2_CTRL_ID2WHICH(c->controls[i].id) != c->which) {
> c->error_idx = i;
> return 0;

Ah, and this is only called for drivers that do not use the control framework.

This is a bug, just before that for-loop it says:

        if (!c->which)
                return 1;

This should be:

	if (!c->which || c->which == V4L2_CTRL_WHICH_DEF_VAL)
                return 1;
	if (c->which == V4L2_CTRL_WHICH_REQUEST_VAL)
		return 0;

Regards,

	Hans

> 
>>
>> What is the exact error you get with which driver?
> 
> I am trying to fix uvc compliance
> 
>  fail: v4l2-test-controls.cpp(813): doioctl(node, VIDIOC_G_EXT_CTRLS, &ctrls)
> test VIDIOC_G/S/TRY_EXT_CTRLS: FAIL
> 
> 
>>
>> Regards,
> 
> Best regards!
> 
>>
>>         Hans
>>
>>>
>>> Fixes: 0884b19adada ("v4l2-compliance: add test for V4L2_CTRL_WHICH_DEF_VAL")
>>> Signed-off-by: Ricardo Ribalda <ribalda@chromium.org>
>>> ---
>>>  utils/v4l2-compliance/v4l2-test-controls.cpp | 5 ++++-
>>>  1 file changed, 4 insertions(+), 1 deletion(-)
>>>
>>> diff --git a/utils/v4l2-compliance/v4l2-test-controls.cpp b/utils/v4l2-compliance/v4l2-test-controls.cpp
>>> index 9a68b7e847b0..79982bc15054 100644
>>> --- a/utils/v4l2-compliance/v4l2-test-controls.cpp
>>> +++ b/utils/v4l2-compliance/v4l2-test-controls.cpp
>>> @@ -793,7 +793,10 @@ int testExtendedControls(struct node *node)
>>>       ctrls.which = V4L2_CTRL_WHICH_DEF_VAL;
>>>       fail_on_test(!doioctl(node, VIDIOC_S_EXT_CTRLS, &ctrls));
>>>       fail_on_test(!doioctl(node, VIDIOC_TRY_EXT_CTRLS, &ctrls));
>>> -     fail_on_test(doioctl(node, VIDIOC_G_EXT_CTRLS, &ctrls));
>>> +     if (multiple_classes)
>>> +             fail_on_test(!doioctl(node, VIDIOC_G_EXT_CTRLS, &ctrls));
>>> +     else
>>> +             fail_on_test(doioctl(node, VIDIOC_G_EXT_CTRLS, &ctrls));
>>>       return 0;
>>>  }
>>>
>>>
>>
> 
> 

