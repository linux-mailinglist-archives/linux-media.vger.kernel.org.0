Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 546F88EDD6
	for <lists+linux-media@lfdr.de>; Thu, 15 Aug 2019 16:12:37 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1732804AbfHOOM0 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 15 Aug 2019 10:12:26 -0400
Received: from lb2-smtp-cloud8.xs4all.net ([194.109.24.25]:47759 "EHLO
        lb2-smtp-cloud8.xs4all.net" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1730032AbfHOOMZ (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 15 Aug 2019 10:12:25 -0400
Received: from [IPv6:2001:420:44c1:2579:f038:4b04:f67a:276f] ([IPv6:2001:420:44c1:2579:f038:4b04:f67a:276f])
        by smtp-cloud8.xs4all.net with ESMTPA
        id yGUGhwEcsDqPeyGUJhYSGh; Thu, 15 Aug 2019 16:12:23 +0200
Subject: Re: [RFC 3/5] media: v4l2-ctrls: Add support for V4L2_CID_LOCATION
To:     Jacopo Mondi <jacopo@jmondi.org>
Cc:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
        "open list:MEDIA INPUT INFRASTRUCTURE (V4L/DVB)" 
        <linux-media@vger.kernel.org>,
        open list <linux-kernel@vger.kernel.org>
References: <20190814202815.32491-1-jacopo@jmondi.org>
 <20190814202815.32491-4-jacopo@jmondi.org>
 <20190814225353.GE5015@pendragon.ideasonboard.com>
 <20190815130245.usat55oqffe4abvi@uno.localdomain>
 <f16bc961-1410-a38b-9973-eddb7293b4b2@xs4all.nl>
 <20190815135004.7o57rff4ce5sb5bb@uno.localdomain>
From:   Hans Verkuil <hverkuil-cisco@xs4all.nl>
Message-ID: <fc368043-5240-1214-9cce-1c989b04aaa3@xs4all.nl>
Date:   Thu, 15 Aug 2019 16:12:20 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.5.1
MIME-Version: 1.0
In-Reply-To: <20190815135004.7o57rff4ce5sb5bb@uno.localdomain>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-CMAE-Envelope: MS4wfBm7SE98EffSew+2c3tauV5oPpbf1RcHdbcYCWWaT2ZwtsAafOOhTDZ93Zq09UC8jKM1gcE+he+pkKu3/FHGwgYHfkXYUx635TDoUEyhYj3a1mNRN5l0
 CpzXXMWm0doF1GzTVOIuxPA/QTf8vGeg9kuKltkXo7FtmvgeyfOOZQv2q0yFgJO8fy+OuZ3Sw17d7QLcifOmIrGScNs7XlAc7nIUjI70pb8wm5SvnIkgaBAL
 Gsz6zO46cTtjzo9b+Nha8/bK1nohkGluLLSsYoxM7QjLqg9syXhYQDoSo6/AJm44ZDux7KVDuT+1FC1BzXnUzCEr1y9mqqBJj1RDdWKeLE2xrMGm4DbklEWQ
 olOqn9eJFz9ebYgUQVpJjJX6PKAh8Hma+DSG2Q5aKL+jh7wVbGrekjI59YlXeGBQ2YsfdT3WD3O2hCdRHf2Kjf+J5QrzrICIshI44Hrf3RNDAetNXNX72cCm
 czd3Mog6ZWy+7esK
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On 8/15/19 3:50 PM, Jacopo Mondi wrote:
> Hi Hans,
> 
> On Thu, Aug 15, 2019 at 03:41:53PM +0200, Hans Verkuil wrote:
>> On 8/15/19 3:02 PM, Jacopo Mondi wrote:
>>> Hi Laurent,
>>>
>>> On Thu, Aug 15, 2019 at 01:53:53AM +0300, Laurent Pinchart wrote:
>>>> Hi Jacopo,
>>>>
>>>> Thank you for the patch.
>>>>
>>>> On Wed, Aug 14, 2019 at 10:28:13PM +0200, Jacopo Mondi wrote:
>>>>> Add support for the newly defined V4L2_CID_LOCATION read-only control
>>>>> used to report the camera device mounting position.
>>>>>
>>>>> Signed-off-by: Jacopo Mondi <jacopo@jmondi.org>
>>>>> ---
>>>>>  drivers/media/v4l2-core/v4l2-ctrls.c | 7 +++++++
>>>>>  include/uapi/linux/v4l2-controls.h   | 4 ++++
>>>>>  2 files changed, 11 insertions(+)
>>>>>
>>>>> diff --git a/drivers/media/v4l2-core/v4l2-ctrls.c b/drivers/media/v4l2-core/v4l2-ctrls.c
>>>>> index 7d3a33258748..8ab0857df59a 100644
>>>>> --- a/drivers/media/v4l2-core/v4l2-ctrls.c
>>>>> +++ b/drivers/media/v4l2-core/v4l2-ctrls.c
>>>>> @@ -943,6 +943,7 @@ const char *v4l2_ctrl_get_name(u32 id)
>>>>>  	case V4L2_CID_AUTO_FOCUS_RANGE:		return "Auto Focus, Range";
>>>>>  	case V4L2_CID_PAN_SPEED:		return "Pan, Speed";
>>>>>  	case V4L2_CID_TILT_SPEED:		return "Tilt, Speed";
>>>>> +	case V4L2_CID_LOCATION:			return "Location";
>>>>
>>>> Depending on what we decide to name the control (see review of 2/5), you
>>>> should adjust the description accordingly.
>>>>
>>>>>
>>>>>  	/* FM Radio Modulator controls */
>>>>>  	/* Keep the order of the 'case's the same as in v4l2-controls.h! */
>>>>> @@ -1300,6 +1301,12 @@ void v4l2_ctrl_fill(u32 id, const char **name, enum v4l2_ctrl_type *type,
>>>>>  		break;
>>>>>  	case V4L2_CID_MPEG_VIDEO_FWHT_PARAMS:
>>>>>  		*type = V4L2_CTRL_TYPE_FWHT_PARAMS;
>>>>> +	case V4L2_CID_LOCATION:
>>>>> +		*type = V4L2_CTRL_TYPE_INTEGER;
>>>>> +		*flags |= V4L2_CTRL_FLAG_READ_ONLY;
>>>>> +		*min = V4L2_LOCATION_FRONT;
>>>>> +		*max = V4L2_LOCATION_BACK;
>>>>
>>>> I don't think the control should have a min and a max different than the
>>>> current value, as it's a fully static control. I'd drop those two lines
>>>> here, and drivers will have to set value = min = max = V4L2_LOCATION_xxx
>>>> when creating the control. That why you should be able to collapse this
>>>> with V4L2_CID_MIN_BUFFERS_FOR_OUTPUT.
>>>>
>>>
>>> Ah, I thought min/max should report the actual control values limits.
>>> Anyway, if we move this to be an integer menu control with an helper
>>> to parse the DT property and register the control on behalf of
>>> drivers, this will change.
>>>
>>>>> +		*step = 1;
>>>>>  		break;
>>>>>  	default:
>>>>>  		*type = V4L2_CTRL_TYPE_INTEGER;
>>>>> diff --git a/include/uapi/linux/v4l2-controls.h b/include/uapi/linux/v4l2-controls.h
>>>>> index 37807f23231e..5c4c7b245921 100644
>>>>> --- a/include/uapi/linux/v4l2-controls.h
>>>>> +++ b/include/uapi/linux/v4l2-controls.h
>>>>> @@ -889,6 +889,10 @@ enum v4l2_auto_focus_range {
>>>>>  #define V4L2_CID_PAN_SPEED			(V4L2_CID_CAMERA_CLASS_BASE+32)
>>>>>  #define V4L2_CID_TILT_SPEED			(V4L2_CID_CAMERA_CLASS_BASE+33)
>>>>>
>>>>> +#define V4L2_CID_LOCATION			(V4L2_CID_CAMERA_CLASS_BASE+34)
>>>>> +#define V4L2_LOCATION_FRONT			(0 << 0)
>>>>> +#define V4L2_LOCATION_BACK			(1 << 0)
>>>>
>>>> Why not just 0 and 1 ?
>>>
>>> Or why not BIT(). I saw that the (1 << x) style is the mostly used one in
>>> this header file when defining macros like this one so I went for
>>> consistency with the existing code.
>>
>> Definitely not right. This is an enumeration, so just number from 0, 1, 2, ...
>>
>> Nothing to do with bits/bitmasks.
> 
> Aren't these enumerations too?
> 
> #define V4L2_CID_3A_LOCK			(V4L2_CID_CAMERA_CLASS_BASE+27)
> #define V4L2_LOCK_EXPOSURE			(1 << 0)
> #define V4L2_LOCK_WHITE_BALANCE			(1 << 1)
> #define V4L2_LOCK_FOCUS				(1 << 2)
> 
> #define V4L2_CID_AUTO_FOCUS_START		(V4L2_CID_CAMERA_CLASS_BASE+28)
> #define V4L2_CID_AUTO_FOCUS_STOP		(V4L2_CID_CAMERA_CLASS_BASE+29)
> #define V4L2_CID_AUTO_FOCUS_STATUS		(V4L2_CID_CAMERA_CLASS_BASE+30)
> #define V4L2_AUTO_FOCUS_STATUS_IDLE		(0 << 0)
> #define V4L2_AUTO_FOCUS_STATUS_BUSY		(1 << 0)
> #define V4L2_AUTO_FOCUS_STATUS_REACHED		(1 << 1)
> #define V4L2_AUTO_FOCUS_STATUS_FAILED		(1 << 2)

No, these are bitmasks for bitmask controls. So one or more
status/lock bits can be 1.

Regards,

	Hans

> 
> Anyway, I'm happy to change them to plain numbers.
> 
>>
>> Regards,
>>
>> 	Hans
>>
>>>
>>>>
>>>>> +
>>>>>  /* FM Modulator class control IDs */
>>>>>
>>>>>  #define V4L2_CID_FM_TX_CLASS_BASE		(V4L2_CTRL_CLASS_FM_TX | 0x900)
>>>>
>>>> --
>>>> Regards,
>>>>
>>>> Laurent Pinchart
>>

