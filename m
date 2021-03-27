Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D5E2134B700
	for <lists+linux-media@lfdr.de>; Sat, 27 Mar 2021 13:03:43 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231615AbhC0MDm (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sat, 27 Mar 2021 08:03:42 -0400
Received: from lb1-smtp-cloud7.xs4all.net ([194.109.24.24]:53627 "EHLO
        lb1-smtp-cloud7.xs4all.net" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S230350AbhC0MDm (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Sat, 27 Mar 2021 08:03:42 -0400
Received: from cust-b5b5937f ([IPv6:fc0c:c16d:66b8:757f:c639:739b:9d66:799d])
        by smtp-cloud7.xs4all.net with ESMTPA
        id Q7fElxXRLMxedQ7fHlWCIN; Sat, 27 Mar 2021 13:03:40 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=xs4all.nl; s=s2;
        t=1616846620; bh=v0Q8bcxVLOayXXnu2XsIW6WScN+QiqA4ECCm0EfKzYw=;
        h=Subject:To:From:Message-ID:Date:MIME-Version:Content-Type:From:
         Subject;
        b=MpSLYHiHKjLzWSIR7CBtWeX7tl78jxGc242moM+gAzI+vVnN/9e+thpOTzJ9rDsa5
         KkNvCh0aWW3dxGw0DgbJtSY9fTvXg16TvDmSj/BjZP1lCvRhfLP2epJncvN0AluSWW
         47LF9M4Q3lydy5J9pmjD8UIYOdiXU767BdN/Ag8C3/3p86k2kLXoREGdqgy9CjFRl1
         KBzTQ59G/n0x7LM+UvamFgGDkQVfH7s68FHPZ3cGLHDqXVrGexmuDno01BEo/z6LP3
         oaaNkEzZsqmBeCfn6NOY01blplKDuzdpnauWWdg6T1pj+0U9XNfI9QVzE29aDBdH1z
         Pm+jm3jF6ui8Q==
Subject: Re: [PATCH v9 17/22] media: docs: Document the behaviour of uvcdriver
To:     Ricardo Ribalda <ribalda@chromium.org>
Cc:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Sergey Senozhatsky <sergey.senozhatsky@gmail.com>,
        Linux Media Mailing List <linux-media@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Tomasz Figa <tfiga@chromium.org>
References: <20210326095840.364424-1-ribalda@chromium.org>
 <20210326095840.364424-18-ribalda@chromium.org>
 <417be36b-850a-84b2-dc68-c1bec85e2edb@xs4all.nl>
 <CANiDSCsikQaCMFKdrKfqYv=NuhCxy2v--QBUPd00c5jAo6OGnQ@mail.gmail.com>
From:   Hans Verkuil <hverkuil-cisco@xs4all.nl>
Message-ID: <46df0dba-f9c0-5b78-a2b8-e1a22acbacff@xs4all.nl>
Date:   Sat, 27 Mar 2021 13:03:36 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Firefox/78.0 Thunderbird/78.7.1
MIME-Version: 1.0
In-Reply-To: <CANiDSCsikQaCMFKdrKfqYv=NuhCxy2v--QBUPd00c5jAo6OGnQ@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-CMAE-Envelope: MS4xfJuhj2UQBHg/my06FUqio2VI++jdqxNWbZBvZmWPXkVQIcvA0HcPA+CpJiKFu+B4gQjhGrm8kET1hWFIGoJYguToqwyA6RZry/yjLnSKhO+XPuVl/TmF
 44Esm68lkOph2qdVn1G5BIeN2jxzGbQ1RhEDrmL7Fs4hOZvdIUCML2DgD/oBoONdaY3YHHNFBBFOxHDPs1lTco/6U3HBh5CBeesTNzDjI8ydnQSiys4ridLF
 vnziC73mvsAOfVpTeam1gcUB7zESaO+YB+CdXwzwZ7gBkJRlHBybF/2optzWDPX904L8J0ipVeSGW2JMSnCFVljegDvpSHbifd1oakFRbpL06oHEg+ccqkjq
 jxdXdZaPc3j2G4BwpjVwHRh4fwi7+wtLnk2UMh3k8HkfNci1Wtsa5IB8uZ0PPLDSqCcnr8LK
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On 27/03/2021 13:01, Ricardo Ribalda wrote:
> Hi Hans
> 
> Thanks for your review!
> 
> On Sat, Mar 27, 2021 at 12:19 PM Hans Verkuil <hverkuil-cisco@xs4all.nl> wrote:
>>
>> On 26/03/2021 10:58, Ricardo Ribalda wrote:
>>> The uvc driver relies on the camera firmware to keep the control states
>>> and therefore is not capable of changing an inactive control.
>>>
>>> Allow returning -EACESS in those cases.
>>
>> -EACCES
> 
> This british people that like to have a lot of double consonants :)
> 
> I have updated the series at:
> 
> https://git.kernel.org/pub/scm/linux/kernel/git/ribalda/linux.git/log/?h=uvc-compliance-v10

For v10:

Reviewed-by: Hans Verkuil <hverkuil-cisco@xs4all.nl>

Thanks!

	Hans

> 
> Will not post until there is more feedback to avoid spamming the list.
> 
> Thanks :)
> 
>>
>>>
>>> Signed-off-by: Ricardo Ribalda <ribalda@chromium.org>
>>> ---
>>>  Documentation/userspace-api/media/v4l/vidioc-g-ctrl.rst      | 5 +++++
>>>  Documentation/userspace-api/media/v4l/vidioc-g-ext-ctrls.rst | 5 +++++
>>>  2 files changed, 10 insertions(+)
>>>
>>> diff --git a/Documentation/userspace-api/media/v4l/vidioc-g-ctrl.rst b/Documentation/userspace-api/media/v4l/vidioc-g-ctrl.rst
>>> index 4f1bed53fad5..8c0a203385c2 100644
>>> --- a/Documentation/userspace-api/media/v4l/vidioc-g-ctrl.rst
>>> +++ b/Documentation/userspace-api/media/v4l/vidioc-g-ctrl.rst
>>> @@ -95,3 +95,8 @@ EBUSY
>>>
>>>  EACCES
>>>      Attempt to set a read-only control or to get a write-only control.
>>> +
>>> +    Or if there is an attempt to set an inactive control and the driver is
>>> +    not capable of keeping the new value until the control is active again.
>>
>> keeping: 'caching' or 'storing' are better words, I think.
>>
>>> +    This is the case for drivers that do not use the standard control
>>> +    framework and rely purely on the hardware to keep the controls' state.
>>
>> I would drop that last sentence. It is not relevant information to the users of
>> the API.
>>
>>> diff --git a/Documentation/userspace-api/media/v4l/vidioc-g-ext-ctrls.rst b/Documentation/userspace-api/media/v4l/vidioc-g-ext-ctrls.rst
>>> index b9c62affbb5a..bb7de7a25241 100644
>>> --- a/Documentation/userspace-api/media/v4l/vidioc-g-ext-ctrls.rst
>>> +++ b/Documentation/userspace-api/media/v4l/vidioc-g-ext-ctrls.rst
>>> @@ -438,3 +438,8 @@ EACCES
>>>
>>>      Or the ``which`` field was set to ``V4L2_CTRL_WHICH_REQUEST_VAL`` but the
>>>      device does not support requests.
>>> +
>>> +    Or if there is an attempt to set an inactive control and the driver is
>>> +    not capable of keeping the new value until the control is active again.
>>> +    This is the case for drivers that do not use the standard control
>>> +    framework and rely purely on the hardware to keep the controls' state.
>>
>> Same comments as above.
>>
>>>
>>
>> Regards,
>>
>>         Hans
> 
> 
> 

