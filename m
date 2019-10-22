Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id BC18FE0656
	for <lists+linux-media@lfdr.de>; Tue, 22 Oct 2019 16:27:19 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727309AbfJVO1R (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 22 Oct 2019 10:27:17 -0400
Received: from lb2-smtp-cloud8.xs4all.net ([194.109.24.25]:39491 "EHLO
        lb2-smtp-cloud8.xs4all.net" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1727154AbfJVO1R (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 22 Oct 2019 10:27:17 -0400
Received: from [IPv6:2001:420:44c1:2577:31:9f59:b53f:5d72]
 ([IPv6:2001:420:44c1:2577:31:9f59:b53f:5d72])
        by smtp-cloud8.xs4all.net with ESMTPA
        id Mv7ui3UH8PduvMv7xiMuSO; Tue, 22 Oct 2019 16:27:14 +0200
Subject: Re: [PATCH v4 01/11] dt-bindings: video-interfaces: Document
 'location' property
To:     Jacopo Mondi <jacopo@jmondi.org>, Pavel Machek <pavel@ucw.cz>
Cc:     Mauro Carvalho Chehab <mchehab@kernel.org>,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        tfiga@google.com,
        "open list:MEDIA INPUT INFRASTRUCTURE (V4L/DVB)" 
        <linux-media@vger.kernel.org>
References: <20191007162913.250743-1-jacopo@jmondi.org>
 <20191007162913.250743-2-jacopo@jmondi.org> <20191008074052.GA633@amd>
 <20191008075828.phxf2m7237ryl6yf@uno.localdomain> <20191008080634.GC633@amd>
 <20191008082041.476a2soclry6qn3v@uno.localdomain>
From:   Hans Verkuil <hverkuil-cisco@xs4all.nl>
Message-ID: <9788aa13-1bc0-02c3-33f5-a875940f2dc3@xs4all.nl>
Date:   Tue, 22 Oct 2019 16:27:10 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <20191008082041.476a2soclry6qn3v@uno.localdomain>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-CMAE-Envelope: MS4wfLGa4032Mp0XiEQuCXj8e4DLf3btuKDNk1yHGoPxPvUC/tVX2wrX3bB5VIOAjg7HzLaRREr0pJ39cm7arX3rpS2N/pI8gEIXK1YOYUQOh+dxa5z2IMl5
 +g+6BXXGXZ39CO6UMjrlw+WuyLq352I7p+ekiyWx7qEA51XYZzzqgnvENWM+vavrRkcjLQyUyT8ymHVavnNOEc6Hetvttj7tK76tmPbD50CSpZ/O3yFm1OU8
 Jh1xC4L78aXXYgZODGJ2Vmbx0Ekn/RC7B8HWFst2Jq0dTnxi3LA5brE+J3sZfyhgUmrkjwlg1/HvO0vv2FTBr7rlPUAsJZg0X5V7fmihgiwGTUpgEtwENBqG
 j2a71Osqi2T7Nes6EPx4UEKRtE039fPDpX2D4zJtzDnAnuXHMRBEhm6g4Ws3tyNJINBlm8Mzk80opraFlolzjkkXiPyrMj6seHfeiXUM0hviF3W5u2XOtmCo
 VgjwbDm3Eg+uCsYp
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On 10/8/19 10:20 AM, Jacopo Mondi wrote:
> On Tue, Oct 08, 2019 at 10:06:34AM +0200, Pavel Machek wrote:
>> On Tue 2019-10-08 09:58:28, Jacopo Mondi wrote:
>>> Pavel,
>>>
>>> On Tue, Oct 08, 2019 at 09:40:52AM +0200, Pavel Machek wrote:
>>>> On Mon 2019-10-07 18:29:03, Jacopo Mondi wrote:
>>>>> Add the 'location' device property, used to specify a device mounting
>>>>> position. The property is particularly meaningful for mobile devices
>>>>> with a well defined usage orientation.
>>>>>
>>>>> Signed-off-by: Jacopo Mondi <jacopo@jmondi.org>
>>>>> ---
>>>>>  .../devicetree/bindings/media/video-interfaces.txt    | 11 +++++++++++
>>>>>  1 file changed, 11 insertions(+)
>>>>>
>>>>> diff --git a/Documentation/devicetree/bindings/media/video-interfaces.txt b/Documentation/devicetree/bindings/media/video-interfaces.txt
>>>>> index f884ada0bffc..1211bdf80722 100644
>>>>> --- a/Documentation/devicetree/bindings/media/video-interfaces.txt
>>>>> +++ b/Documentation/devicetree/bindings/media/video-interfaces.txt
>>>>> @@ -89,6 +89,17 @@ Optional properties
>>>>>    but a number of degrees counter clockwise. Typical values are 0 and 180
>>>>>    (upside down).
>>>>>
>>>>> +- location: The mount location of a device (typically an image sensor or a flash
>>>>> +  LED) expressed as a position relative to the usage orientation of the system
>>>>> +  where the device is installed on.
>>>>> +  Possible values are:
>>>>> +  0 - Front. The device is mounted on the front facing side of the system.
>>>>> +  For mobile devices such as smartphones, tablets and laptops the front side is
>>>>> +  the user facing side.
>>>>> +  1 - Back. The device is mounted on the back side of the system, which is
>>>>> +  defined as the opposite side of the front facing one.
>>>>> +  2 - External. The device is not attached directly to the system but is
>>>>> +  attached in a way that allows it to move freely.
>>>>
>>>> I explained why this is not enough, and it did not change.
>>>
>>> I replied to your email and you did not answered back.
>>>
>>> I appreciate constructive inputs but just NAK, or throwing a proposal
>>> without following up as you did, doesn't help much in improving the end
>>> result.
>>>
>>> I'll paste here my previous reply, so you get a chance to continue the
>>> discussion. Please follow up if you're interested in contributing.
>>
>> Yes, you are basically saying someone can solve those problems in
>> future :-(.
> 
> Not really, what I'm saying is that the property definition itself
> leaves space for future extensions. As of now the accepted property
> values cover the most trivial use case, but they can be expanded to
> accommodate more complex setups, possibly with an extended parameters
> list (in example something like "movable" with an associated rotation
> matrix). In any case, I don't think we're tying anyone's hands by
> adding this new property with the most basic locations that covers
> 99% of devices.
> 
>>
>> I'd add note that for camera-style devices, main sensor would be the
>> "back" one, and that for phones, selfie sensor should be marked as a
>> "front" one.
> 
> I'm not sure if 'main' or 'selfie' as concepts belongs here at all. I
> just want to report where the camera is installed, not the intended
> usage.
> 
> The most common use case is to make simple for application to pick one
> of the cameras based on the position. The front camera in a phone will
> likely be for selfies, but in a laptop will mostly be for
> 'videoconference' or whatever. This is a definition that totally
> belongs to userspace, and kernel should just report the mounting
> location and that's it.
> 
>>
>> Plus, I believe you need to add a value for moving sensors, as there
>> are already devices that use same sensor for "front" and "back".
> 
> I'm skeptical about adding now a property for a device that we don't
> support, because we -now- think it's a good idea. I might be wrong,
> but my assumption is that when someone will want to support an
> 'advanced' device, it's easy to add "movable" or whatever else to the
> list of accepted properties values. Am I wrong in assuming this? As
> long as "front" "back" and "external" will stay supported for backward
> DTB compatibility it should be fine, right ?

The basic rule is that you should not define things unless you KNOW that
they will be needed. So when we actually see new devices for which
"front", "back" or "external" does not fit, then new names can be created.

It's impossible to cover all situations since we can't predict the future.
The best we can do is to allow for future extensions.

I think this looks good.

Regards,

	Hans

> 
> Thanks
>    j
> 
>>
>> 								Pavel
>>
>>
>>> ------------------------------------------------------------------------
>>>> I don't think this is nearly enough of description. We have phones
>>>> with displays and cameras at both sides, where both sides can be used
>>>> to operate the system.
>>>>
>>>> We have phone with display spanning both sides -- Mi Max.
>>>>
>>>> https://www.idnes.cz/mobil/telefony/xiaomi-mi-mix-alpha-predstaveni.A190924_105858_telefony_oma
>>>>
>>>> We have Galaxy Fold.
>>>>
>>>> https://www.samsung.com/global/galaxy/galaxy-fold/
>>>>
>>>> What is front side when device can be used in different
>>>> configurations?
>>>>
>>>> Could we instead say that it is "main" vs "selfie" camera?
>>>
>>> I'm not sure the intended usage is something that belongs to DT. And
>>> 'selfie' implies you have a device side facing you, most like the
>>> 'front' one I have defined here.
>>>
>>> Not to mention again this devices are all but supported by mainline,
>>> which is just a partial justification as they might be an indication
>>> of a trend.
>>>
>>> There is no usable reference place, reference side, reference usage
>>> mode that applies to -all- devices in the world, not one I can think
>>> of.
>>>
>>> I still think defining a location property is not blocking any new
>>> extension that accommodate more advanced use cases. It's not like we're
>>> adding a "front-camera" property, it's a "location" and you can expand
>>> its accepted values with "front-when-device-folded" or whatever you
>>> need for future devices.
>>>
>>> In the description I mentioned the "usage orientation" to leave room
>>> for possible device-specific details in the definition of the values
>>> accepted by the property.
>>>
>>>>> +  location expressed as a position relative to the usage orientation of the
>>>>> +  system where the device is installed on.
>>>
>>> 99% of devices in the world have a front and a back, as well as they
>>> have a top and a bottom. I still don't see why if a device does not
>>> simply has a front it cannot use something different. The property
>>> definition allows you to do so.
>>>
>>> ------------------------------------------------------------------------
>>>
>>>>
>>>> NAK.
>>>> 									Pavel
>>>>
>>>> --
>>>> (english) http://www.livejournal.com/~pavelmachek
>>>> (cesky, pictures) http://atrey.karlin.mff.cuni.cz/~pavel/picture/horses/blog.html
>>>
>>>
>>
>>
>>
>> --
>> DENX Software Engineering GmbH,      Managing Director: Wolfgang Denk
>> HRB 165235 Munich, Office: Kirchenstr.5, D-82194 Groebenzell, Germany
> 
> 

