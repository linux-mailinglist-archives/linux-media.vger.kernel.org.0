Return-Path: <linux-media+bounces-38441-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 010DBB11A6E
	for <lists+linux-media@lfdr.de>; Fri, 25 Jul 2025 11:01:35 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 1FD765A20B6
	for <lists+linux-media@lfdr.de>; Fri, 25 Jul 2025 09:01:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BE8C91FF7BC;
	Fri, 25 Jul 2025 09:01:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=jjverkuil.nl header.i=@jjverkuil.nl header.b="tiqGIqQe"
X-Original-To: linux-media@vger.kernel.org
Received: from dane.soverin.net (dane.soverin.net [185.233.34.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 66F6E1FC3;
	Fri, 25 Jul 2025 09:01:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.233.34.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753434087; cv=none; b=OScrVUkcrRepz9YNB0XXtKPW/sVbGX/AeZ3tYg3CQF9yKN6MTcu8lItBHMFK2OzscqwZNBv9ZVuCklKTpWSdprmd0nNeAaw4qP0O8Tp/4aYK32JR+sUur2m99+EDQo5MVt4gBKfk+WQNmq2irNhUvtlA3WONcySU/4CWjA5DwCU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753434087; c=relaxed/simple;
	bh=aapyBRhPC6boNtWln0Sna1KVKIZYKIeI5KqZzl377Ug=;
	h=Message-ID:Date:MIME-Version:From:Subject:To:Cc:References:
	 In-Reply-To:Content-Type; b=czDQHBcXTxdgf32NKpABZdYbgY7icyQgjMUZTeXWYLatKpgaJ2vRZHDVZdR7iXlLNP5kYoPd21PnCSqaCZBVySbYx99bCyhE38cRQVDTekD4Q5BxOu/9NKOWJY4ANdjHXcrZhm5jUZswFurVkzW3uRLNOx+ltlHO4o0csgThLn8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=jjverkuil.nl; spf=pass smtp.mailfrom=jjverkuil.nl; dkim=pass (2048-bit key) header.d=jjverkuil.nl header.i=@jjverkuil.nl header.b=tiqGIqQe; arc=none smtp.client-ip=185.233.34.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=jjverkuil.nl
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=jjverkuil.nl
Received: from smtp.freedom.nl (unknown [10.10.4.74])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits))
	(No client certificate requested)
	by dane.soverin.net (Postfix) with ESMTPS id 4bpML60J8vz10dk;
	Fri, 25 Jul 2025 09:01:18 +0000 (UTC)
Received: from smtp.freedom.nl (smtp.freedom.nl [10.10.4.108]) by freedom.nl (Postfix) with ESMTPSA id 4bpML53jwKz2xMl;
	Fri, 25 Jul 2025 09:01:17 +0000 (UTC)
Authentication-Results: smtp.freedom.nl;
	dkim=pass (2048-bit key; unprotected) header.d=jjverkuil.nl header.i=@jjverkuil.nl header.a=rsa-sha256 header.s=soverin1 header.b=tiqGIqQe;
	dkim-atps=neutral
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=jjverkuil.nl;
	s=soverin1; t=1753434077;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=mWjknV5/6V9ie98tvg71C6g6oYwg1U4f7a4DFf5FQyQ=;
	b=tiqGIqQea6Wf1djBF3nFTXHd1o64HEVECY1QQ8wglxRg+b1yTME6EqRVFvEntPqRXng3Xr
	0K8a5v9M32q7//gA5Y7V9wWNl2Wh8IZJe9VxaU/phaNyCgsQkBCAHnKEun1ZwCVImhCIes
	5pcTLKVxl+7WMYMUDJrccblZwZ7MPORyn6U2S5pN46cnqs9iQzrThD/8pgK8FyriSHrRxM
	RUu6boJIkptFwlTbKlVyhjrMTqldgtFPEfctDi1phIgftGUZHXfOi4qVqluj/dGsOcUxR4
	Xkndnwey8ISRG1hwED3AnWMM4qDC0Mjxe+92EEiIL91E9npKh9mPuZPOB3Rt3w==
X-CM-Envelope: MS4xfEvRKi8lvbPWCYws1uvVlDImyr3B/QTMUH4wFulWBovc+Q4tqWfC7vJg8dpGfIymdRsxFUe1XAUs5qywVB9eDrRtbgz+5oOMctIArDnl2PB4WTs2R18R vFQhtd0IvNFqGd4/Jx/VGZCj1zVbYBpY4gO+PSscUgSH1ZHkai2yXvSSIbRWqED1dXBnCXeTjhx7181EwyJTs16/VPY16XaA3xrVNVSeECpwhMSIuSq0vpCe M4Fs79QZbllZUkUMdjlBGwqkD1adK7ne7AWC1kKoeuRRWi6fMWQSTqyeZp/7K2tmDKQ2YyIR9MK0hDW/fLbpOx2cL+S/MVV3AROLzFCVWwap/BhfQZ9War82 hQZZehEFY1Z70oZH0pPE8EZZAjSLqGgPN8TDVJ9Diz5rJ59Q+3bCB14Srm+Im12RiX33RiZx8Xuhs4VeI3ya+5MoB7E9ab+mTfdbLkE5HZCFULRNTWmIXtlN jxeEKBdD6TBZypm9pC9sJF7QQL9/9vm9EaCa2gMdZG5Grev0g3yLLSzRxYSVaJlHRofpwc7A4Ha1BEY1AY4d7M25hykgLBkY6eh8/F9pzTnRZjXPxsp5n6ZW RTkqM+yovj5FL0rLlbJLWJn1dP0AuOzBgpT2GfD624xDQL9F3izLuyzZmAfSJs4tLmuqa2fsFv7Pi0CzbK0tcup1y22lUbdXwGsNPyxIy9paYhutNeWra/Nm evozYKKcJABgrdZbj4tLJFH5oixssiFI
X-CM-Analysis: v=2.4 cv=UsCZN/wB c=1 sm=1 tr=0 ts=688347dd a=FeCTsR0yliqZQd7G3+UDAA==:617 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10 a=SP3DJ-cdnuwgAGiMDlsA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
Message-ID: <ae5ce461-0be5-4e00-8f6b-9c65ec6e66dc@jjverkuil.nl>
Date: Fri, 25 Jul 2025 11:01:11 +0200
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
From: hans@jjverkuil.nl
Subject: Re: [RFC 0/2] Add standard exposure and gain controls for multiple
 captures
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Julien Vuillaumier <julien.vuillaumier@nxp.com>
Cc: Mirela Rabulea <mirela.rabulea@nxp.com>, mchehab@kernel.org,
 sakari.ailus@linux.intel.com, hverkuil-cisco@xs4all.nl,
 ribalda@chromium.org, jai.luthra@ideasonboard.com, laurentiu.palcu@nxp.com,
 linux-media@vger.kernel.org, linux-kernel@vger.kernel.org, LnxRevLi@nxp.com,
 celine.laurencin@nxp.com
References: <20250710220544.89066-1-mirela.rabulea@nxp.com>
 <20250715235952.GE19299@pendragon.ideasonboard.com>
 <20250716001205.GG19299@pendragon.ideasonboard.com>
 <38e022d0-cc8f-4df2-8a81-69513c854035@nxp.com>
 <dddcad1a-1f0a-4ecc-8093-8a75ec24d2ec@nxp.com>
 <20250723150206.GE6719@pendragon.ideasonboard.com>
Content-Language: en-US, nl
Autocrypt: addr=hans@jjverkuil.nl; keydata=
 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
In-Reply-To: <20250723150206.GE6719@pendragon.ideasonboard.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Spampanel-Class: ham

On 23/07/2025 17:02, Laurent Pinchart wrote:
> On Tue, Jul 22, 2025 at 11:53:53AM +0200, Julien Vuillaumier wrote:
>> On 20/07/2025 20:56, Mirela Rabulea wrote:
>>> On 7/16/25 03:12, Laurent Pinchart wrote:
>>>> On Wed, Jul 16, 2025 at 02:59:54AM +0300, Laurent Pinchart wrote:
>>>>> On Fri, Jul 11, 2025 at 01:05:42AM +0300, Mirela Rabulea wrote:
>>>>>> Add new standard controls as U32 arrays, for sensors with multiple
>>>>>> captures: V4L2_CID_EXPOSURE_MULTI, V4L2_CID_AGAIN_MULTI and
>>>>>> V4L2_CID_DGAIN_MULTI. These will be particularly useful for sensors
>>>>>> that have multiple captures, but the HDR merge is done inside the 
>>>>>> sensor,
>>>>>> in the end exposing a single stream, but still requiring AEC control
>>>>>> for all captures.
>>>>>
>>>>> It's also useful for sensors supporting DOL or DCG with HDR merge being
>>>>> performed outside of the sensor.
>>>>
>>>> Regarless of where HDR merge is implemented, we will also need controls
>>>> to select the HDR mode. We have V4L2_CID_HDR_SENSOR_MODE, which doesn't
>>>> standardize the values, and that's not good enough. At least for DOL and
>>>> DCG with HDR merge implemented outside of the sensor, we need to
>>>> standardize the modes.
>>>>
>>>> Can you tell which sensor(s) you're working with ?
>>>
>>> We are working mostly with these 3:
>>> Omnivision's os08a20 (2 exposures staggered hdr, each exposure on a 
>>> separate virtual channel, there are also other hdr modes which we do not 
>>> use)
>>> Omnivision ox05b1s (RGB-Ir with context switching based on group holds, 
>>> 1 context optimized for RGB, the other context optimized for Ir, each 
>>> context on a different virtual channel)
>>> Omnivision ox03c10 (4 exposures, hdr merge in sensor).
>>>
>>>>>> All controls are in the same class, so they could all be set
>>>>>> atomically via VIDIOC_S_EXT_CTRLS, this could turn out to be
>>>>>> useful in case of sensors with context switching.
>>>>>
>>>>> Agreed, we should be able to set them all. Are we still unable to set
>>>>> controls from multiple classes atomatically ? I thought that limitation
>>>>> has been lifted.
>>>
>>> Maybe I need some background check on this, but looking at kernel tag 
>>> next-20250718, this comment still lies in the documentation:
>>> "These ioctls allow the caller to get or set multiple controls
>>> atomically. Control IDs are grouped into control classes (see
>>> :ref:`ctrl-class`) and all controls in the control array must belong
>>> to the same control class."
>>>
>>> Maybe it needs to be updated, or not...since there is also this check in 
>>> check_ext_ctrls():
>>>      /* Check that all controls are from the same control class. */
>>>      for (i = 0; i < c->count; i++) {
>>>          if (V4L2_CTRL_ID2WHICH(c->controls[i].id) != c->which) {
>>>              c->error_idx = ioctl == VIDIOC_TRY_EXT_CTRLS ? i :
>>>                                        c->count;
>>>              return false;
>>>          }
>>>      }
> 
> This only when c->which is set to a control class. If you set it to
> V4L2_CTRL_WHICH_CUR_VAL (equal to 0) then you can set (or get) controls
> from multiple classes in one go.

That's correct. Early implementations of the control framework required
that all controls were from the same control class, but later I dropped
that requirement and you can just set 'which' to 0 and it no longer matters.

> 
>>> There is also another inconvenient, the VIDIOC_S_EXT_CTRLS does not 
>>> reach the v4l2 subdevice driver, what we get in the sensor driver is a 
>>> set of .s_ctrl calls. I don't know about other sensors, but for the 
>>> Omivision sensors which I am familiar with, the group holds feature 
>>> could be used to get multiple registers to be applied atomically in the 
>>> same frame, but the sensor driver would need to know when to start and 
>>> when to end filling the group hold with the desired registers. If there 
>>> is some similar feature in other sensors, I think the VIDIOC_S_EXT_CTRLS 
>>> should have a corresponding v4l2-subdev operation, so that it can be 
>>> implemented in the sensor subdevice driver. This would probably require 
>>> some changes in the v4l2 core, as currently the subdev_do_ioctl() 
>>> function does not let the VIDIOC_S_EXT_CTRLS go to the subdevice.
>>>
>>> Laurent, Hans, any thoughts on this?
> 
> I can think of at least 3 ways to handle this.
> 
> The first method would be to group all controls in a cluster. That way
> you will get a single .s_ctrl() call per VIDIOC_S_EXT_CTRLS. You will
> have to iterate over the controls to see which ones have changed, and
> configure the sensor accordingly. This short-circuits the logic in the
> control framework that dispatches individual controls to separate
> .s_ctrl() calls (or rather still goes through that logic, but doesn't
> make use of it), and requires reimplementing it manually in the
> .s_ctrl() handler. It's not ideal.

This should work out-of-the-box.

> 
> The second method would be to add new .begin() and .end() (name to be
> bikeshedded) control operations. I experimented with this a while ago to
> expose group hold to userspace, but never upstreamed the patches as I
> didn't really need them in the end. Alternatively, the VIDIOC_S_EXT_CTRL
> could be exposed to drivers, allowing them to implement begin/end
> operations before and after calling the control framework. I don't have
> a strong preference (maybe Hans would).

I wonder if you could make 'HOLD_BEGIN' and 'HOLD_END' button controls, and
start and end the control array in VIDIOC_S_EXT_CTRLS with it. There are
some issues that need to be figured out, but I think this is doable.

Regards,

	Hans

> 
> I increasingly think that the control framework doesn't provide the best
> value for subdevs. It has been developed for video devices, and for
> subdevs in video-centric devices where subdevs are hidden behind a video
> device, but not for MC-centric use cases where subdevs are exposed to
> userspace. The third option would be to implement something better,
> dropping the useless features and adding support for the needs of modern
> devices, but that would be much more work.
> 
>>>>>> Each element of the array will hold an u32 value (exposure or gain)
>>>>>> for one capture. The size of the array is up to the sensor driver which
>>>>>> will implement the controls and initialize them via 
>>>>>> v4l2_ctrl_new_custom().
>>>>>> With this approach, the user-space will have to set valid values
>>>>>> for all the captures represented in the array.
>>>>>
>>>>> I'll comment on the controls themselves in patch 2/2.
>>>>>
>>>>>> The v4l2-core only supports one scalar min/max/step value for the
>>>>>> entire array, and each element is validated and adjusted to be within
>>>>>> these bounds in v4l2_ctrl_type_op_validate(). The significance for the
>>>>>> maximum value for the exposure control could be "the max value for the
>>>>>> long exposure" or "the max value for the sum of all exposures". If none
>>>>>> of these is ok, the sensor driver can adjust the values as supported and
>>>>>> the user space can use the TRY operation to query the sensor for the
>>>>>> minimum or maximum values.
>>>>>
>>>>> Hmmmm... I wonder if we would need the ability to report different
>>>>> limits for different array elements. There may be over-engineering
>>>>> though, my experience with libcamera is that userspace really needs
>>>>> detailed information about those controls, and attempting to convey the
>>>>> precise information through the kernel-userspace API is bound to fail.
>>>>> That's why we implement a sensor database in libcamera, with information
>>>>> about how to convert control values to real gain and exposure time.
>>>>> Exposing (close to) raw register values and letting userspace handle the
>>>>> rest may be better.
>>>
>>> Julien, any thoughts on this?
>>
>> Reporting min/max value per array element could have made sense for some 
>> controls. For instance we have a HDR sensor whose long capture analog 

Actually, support for this exists. See the VIDIOC_G_EXT_CTRLS documentation
and look for V4L2_CTRL_WHICH_DEF_VAL/V4L2_CTRL_WHICH_MIN_VAL/V4L2_CTRL_WHICH_MAX_VAL.

>> gain range is different from the shorter captures gain. Conversely, it 
>> may not work well for the multi-capture exposure control where the 
>> constraint can be more about the sum of the exposures for each capture 
>> rather than the individual exposure values. In that case, exposing 
>> min/max values per array element does not really help the user space.
>>
>> Thus, having the user space to have the necessary insight into each 
>> sensor specifics for its AEC control seems to be the versatile option.
> 
> Then I think we should look at a libcamera implementation alongside with
> this patch series, and review them together.
> 
>>> If we don't need to report different limits for different array 
>>> elements, we are fine, just we need to document better what those limits 
>>> stand for in case of arrays.
>>>
>>>>>> Mirela Rabulea (2):
>>>>>>    LF-15161-6: media: Add exposure and gain controls for multiple
>>>>>>      captures
>>>>>>    LF-15161-7: Documentation: media: Describe exposure and gain 
>>>>>> controls
>>>>>>      for multiple captures
>>>>>
>>>>> Did you forget to remove the LF-* identifiers ? :-)
>>>
>>> Yes, at least in the cover-letter, my bad :(
>>>
>>> Thanks for feedback.
>>>
>>>>>>
>>>>>>   .../media/v4l/ext-ctrls-image-source.rst             | 12 ++++++++++++
>>>>>>   drivers/media/v4l2-core/v4l2-ctrls-defs.c            |  8 ++++++++
>>>>>>   include/uapi/linux/v4l2-controls.h                   |  3 +++
>>>>>>   3 files changed, 23 insertions(+)
> 


