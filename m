Return-Path: <linux-media+bounces-3398-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id CC4DB8285F6
	for <lists+linux-media@lfdr.de>; Tue,  9 Jan 2024 13:21:45 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 767EA286F1E
	for <lists+linux-media@lfdr.de>; Tue,  9 Jan 2024 12:21:44 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CB9D7381B9;
	Tue,  9 Jan 2024 12:21:38 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 821C9374FE
	for <linux-media@vger.kernel.org>; Tue,  9 Jan 2024 12:21:38 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8317EC43390;
	Tue,  9 Jan 2024 12:21:37 +0000 (UTC)
Message-ID: <93eaf63b-eeb3-44e3-8b5e-915b1c5ad1b4@xs4all.nl>
Date: Tue, 9 Jan 2024 13:21:35 +0100
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: qv4l2 crashes if output device implements VIDIOC_ENUM_FRAMESIZES
Content-Language: en-US
To: =?UTF-8?Q?Martin_T=C5=AFma?= <tumic@gpxsee.org>,
 linux-media@vger.kernel.org
References: <59383033-924d-45fb-a44f-7c274bb44517@gpxsee.org>
 <73b9fa71-20e3-4805-9feb-ef2692f4cb0a@xs4all.nl>
 <cde7a790-b24f-45d0-af33-5a92869ff10c@gpxsee.org>
From: Hans Verkuil <hverkuil@xs4all.nl>
In-Reply-To: <cde7a790-b24f-45d0-af33-5a92869ff10c@gpxsee.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 1/9/24 12:46, Martin Tůma wrote:
> Hi Hans,
> 
> On 09. 01. 24 11:43, Hans Verkuil wrote:
>> Hi Martin,
>>
>> On 1/9/24 11:17, Martin Tůma wrote:
>>> Hi,
>>> If a driver implements VIDIOC_ENUM_FRAMESIZES for a output device, qv4l2
>>> crashes in general-tab.cpp:2169 due to m_frameSize being 0. As all other
>>> usages of m_frameSize in the GeneralTab::updateFrameSize() function are
>>> guarded by "NULL checks" an obvious fix would be to guard the "addItem
>>> while cycle" as well. But maybe a better solution would be to add the
>>> frame size combobox to output devices as well. Or are the output devices
>>> not supposed to have frame sizes enumeration?
>>
>> You do not expect to see it for output devices. Those will typically use
>> VIDIOC_ENUMSTD or VIDIOC_ENUM_DV_TIMINGS. VIDIOC_ENUM_FRAMESIZES is something
>> that only makes sense for output devices if they do not support ENUMSTD or
>> ENUM_DV_TIMINGS, i.e. it has some very odd output hardware. In particular
>> vivid doesn't support this for the emulated video output.
>>
>> I don't think v4l2-compliance has a check for this. I think it should at
>> least issue a warning if the video output devices supports ENUM_FRAMESIZES
>> and also ENUMSTD or ENUM_DV_TIMINGS.
>>
>> In any case, qv4l2 shouldn't crash, so an initial fix should be to check
>> for m_frameSize being 0. A patch is welcome.
>>
> 
> Ok, I will add the check, test it with my current driver (see below) 
> that triggers it and send a patch.
> 
>> Which driver is this? I assume it is an out-of-tree driver, since I am
>> not aware of any mainline drivers that do this.
>>
> 
> I came across this when fiddling with our mgb4 driver. We have updated 
> the FW to support YUV in addition to RGB and added independent timers 
> for frame dropping (the current driver is "wrong" as it provides 
> VIDIOC_G_PARM/VIDIOC_S_PARM with V4L2_CAP_TIMEPERFRAME but can not in 
> fact set it with the original FW). The inputs in mgb4 have 
> ENUM_FRAMESIZES and a request from a card user to add the callback to 
> the outputs to be "symmetrical" with the inputs.
> 
>  From what you wrote above I get the message that the "proper" way how 
> to extend the output callbacks is rather to add ENUM_DV_TIMINGS (which 
> is also missing, the driver implements it only for the inputs at the 
> moment), but the question "what to do with ENUM_FRAMESIZES?" stays. I 
> would like to either have it implemented for both the inputs/outputs or 
> for none of them. And adding the callback to the output looks to me as a 
> better solution than to remove it from the input as some people already 
> use it. But to call this a bug and remove it is also ok for me (the 
> driver will at least work with the current, unpatched, version of qv4l2).

Your hardware is rather odd :-) so let me describe how it is supposed
to work for 'normal' capture hardware first:

ENUM_FRAMESIZES is typically only supported for sensor inputs since sensors
usually have a discrete set of sizes that they support. And you also need
that since you typically explicitly set the size that you want from the
sensor, so you need to know what is supported.

For video capture it is different: the video source typically decides what
size to transmit. For analog video through e.g. S-Video that's typically
PAL or NTSC, so for that you need ENUMSTD and QUERYSTD ioctls to handle that.
For e.g. HDMI or similar interfaces it is the DV Timings API that you need.

In both cases you do not have any control over what video size the source
will transmit, you have to detect it with the QUERYSTD or QUERY_DV_TIMINGS
ioctls.

So ENUM_FRAMESIZES makes no sense for standard analog or digital video
capture devices.

For output video it is similar: for analog video you just set the standard
(e.g. PAL or NTSC), and that defines the size automatically. For e.g. HDMI
you set it as well based on the capabilities reported by the display through
the EDID. Again, ENUM_FRAMESIZES makes no sense, this is driven by the
analog or digital video timings.

ENUM_FRAMESIZES for something that is not a sensor would only make sense
if it is some specialized interface that supports a limited set of sizes
and has no concept of PAL/NTSC or Digital Video Timings.

Regards,

	Hans

> 
> M.
> 
>> Regards,
>>
>> 	Hans
>>
> 
> 


