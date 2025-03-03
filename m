Return-Path: <linux-media+bounces-27322-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 42F1CA4BA1B
	for <lists+linux-media@lfdr.de>; Mon,  3 Mar 2025 09:58:53 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 658357A3526
	for <lists+linux-media@lfdr.de>; Mon,  3 Mar 2025 08:55:58 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C41DD1F4170;
	Mon,  3 Mar 2025 08:53:11 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6C4A61F0E43
	for <linux-media@vger.kernel.org>; Mon,  3 Mar 2025 08:53:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740991991; cv=none; b=SZ17fjsAPiaR53mmNwCUNjWzjWdmuR4gM0orcfWsVhh9oaFTvaBPqQ2wiG+xcknbOrBhZzQ+p7/4E7pGoEFnbb0pydhUvXoe2iUSWEz9TsD8UsXV47zo+Bsp12P9uikm7G0fUO6B3rNJZp/MM8oLwS5wr3aK1sjLrZRKW88jCvY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740991991; c=relaxed/simple;
	bh=pD+krQ2KcuFhx3qAzctR4Qd2+haGwhUcILZxuv7ZV+A=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=AhsCKEJyXts4TFuf1l2pla3MeIYtFRVZGbvMCCGZH2l8DsHmOLW+zPMzf0xR1/n33KLxuaA4OM9Y2XitpDvxjQCg0ofDCCV/4h7HhEMVqlAPmf9SOb/RyD0aH8ytlfcFHrHrkO4RLDIW4qmEB0wqio2nd6Wte+z9gelW6vdC5Kc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2AA44C4CED6;
	Mon,  3 Mar 2025 08:53:09 +0000 (UTC)
Message-ID: <6c46d313-d6be-440a-98e5-18c265ca32ba@xs4all.nl>
Date: Mon, 3 Mar 2025 09:53:07 +0100
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [GIT,PULL,FOR,v6.15] uvcvideo improvements
To: Ricardo Ribalda <ribalda@chromium.org>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc: linux-media@vger.kernel.org, linuxtv-commits@linuxtv.org
References: <20250301222207.GA15528@pendragon.ideasonboard.com>
 <67c3a1e6.050a0220.15f6f9.275d@mx.google.com>
 <20250302001737.GB18557@pendragon.ideasonboard.com>
 <CANiDSCtArdsVs5BBKRVov1N_4pnbaG=uiHKrVgCN9yTmch3q-Q@mail.gmail.com>
Content-Language: en-US, nl
From: Hans Verkuil <hverkuil@xs4all.nl>
Autocrypt: addr=hverkuil@xs4all.nl; keydata=
 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
In-Reply-To: <CANiDSCtArdsVs5BBKRVov1N_4pnbaG=uiHKrVgCN9yTmch3q-Q@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 03/03/2025 09:31, Ricardo Ribalda wrote:
> Hi Laurent
> 
> On Sun, 2 Mar 2025 at 01:17, Laurent Pinchart
> <laurent.pinchart@ideasonboard.com> wrote:
>>
>> Ricardo, should I drop those patches and wait for a new version, or is
>> everybody happy ignoring those warnings ? Some of the warnings look
>> reasonable to me, were they ignored, or was the last version of the
>> series run through CI ?
> 
> I am happy ignoring the changes. All the versions went through CI.
> 
> They are just checkpatch warnings, CI will pass.
> 
> Regards!
> 
> 
> 
>>
>> On Sat, Mar 01, 2025 at 04:10:14PM -0800, Patchwork Integration wrote:
>>> Dear Laurent Pinchart:
>>>
>>> Thanks for your patches! Unfortunately the Media CI robot detected some
>>> issues:
>>>
>>> # Test checkpatch:./0001-media-v4l2_ctrl-Add-V4L2_CTRL_TYPE_RECT.patch checkpatch
>>> WARNING: Avoid logging continuation uses where feasible
>>> #83: FILE: drivers/media/v4l2-core/v4l2-ctrls-core.c:374:
>>> +pr_cont("%ux%u@%dx%d",
>>>
>>> total: 0 errors, 1 warnings, 0 checks, 98 lines checked
>>>
>>> # Test checkpatch:./0002-media-v4l2-ctrls-add-support-for-V4L2_CTRL_WHICH_MIN.patch checkpatch
>>> CHECK: Alignment should match open parenthesis
>>> #286: FILE: drivers/media/v4l2-core/v4l2-ctrls-core.c:186:
>>> +static void std_min_compound(const struct v4l2_ctrl *ctrl, u32 idx,
>>> +    union v4l2_ctrl_ptr ptr)
>>>
>>> CHECK: Alignment should match open parenthesis
>>> #297: FILE: drivers/media/v4l2-core/v4l2-ctrls-core.c:197:
>>> +static void std_max_compound(const struct v4l2_ctrl *ctrl, u32 idx,
>>>      union v4l2_ctrl_ptr ptr)

I fixed up these two alignment warnings, the others I left as-is since they
are reasonable.

I'm currently running the pipeline. Note that I am also testing it with a
patch v4l-utils to test the new 'which' values:

https://patchwork.linuxtv.org/project/linux-media/cover/20241106061537.211002-1-ming.qian@oss.nxp.com/

Regards,

	Hans

>>>
>>> total: 0 errors, 0 warnings, 2 checks, 598 lines checked
>>>
>>> # Test checkpatch:./0008-media-uvcvideo-Support-any-size-for-mapping-get-set.patch checkpatch
>>> CHECK: Alignment should match open parenthesis
>>> #282: FILE: drivers/media/usb/uvc/uvc_ctrl.c:1406:
>>> +v4l2_ctrl->default_value = uvc_mapping_get_s32(mapping,
>>> +UVC_GET_DEF, uvc_ctrl_data(ctrl, UVC_CTRL_DATA_DEF));
>>>
>>> CHECK: Alignment should match open parenthesis
>>> #293: FILE: drivers/media/usb/uvc/uvc_ctrl.c:1440:
>>> +v4l2_ctrl->minimum = uvc_mapping_get_s32(mapping, UVC_GET_MIN,
>>> +uvc_ctrl_data(ctrl, UVC_CTRL_DATA_MIN));
>>>
>>> CHECK: Alignment should match open parenthesis
>>> #299: FILE: drivers/media/usb/uvc/uvc_ctrl.c:1444:
>>> +v4l2_ctrl->maximum = uvc_mapping_get_s32(mapping, UVC_GET_MAX,
>>> +uvc_ctrl_data(ctrl, UVC_CTRL_DATA_MAX));
>>>
>>> CHECK: Alignment should match open parenthesis
>>> #305: FILE: drivers/media/usb/uvc/uvc_ctrl.c:1448:
>>> +v4l2_ctrl->step = uvc_mapping_get_s32(mapping, UVC_GET_RES,
>>> +uvc_ctrl_data(ctrl, UVC_CTRL_DATA_RES));
>>>
>>> total: 0 errors, 0 warnings, 4 checks, 332 lines checked
>>>
>>> # Test checkpatch:./0017-media-uvcvideo-document-UVC-v1.5-ROI.patch checkpatch
>>> WARNING: Prefer a maximum 75 chars per line (possible unwrapped commit description?)
>>> #10:
>>> https://chromium.googlesource.com/chromiumos/platform2/+/refs/heads/release-R121-15699.B/camera/hal/usb/
>>>
>>> total: 0 errors, 1 warnings, 0 checks, 73 lines checked
>>>
>>>
>>>
>>> Please fix your series, and upload a new version. If you have a patchwork
>>> account, do not forget to mark the current series as Superseded.
>>>
>>> For more details, check the full report at:
>>> https://linux-media.pages.freedesktop.org/-/users/patchwork/-/jobs/72096058/artifacts/report.htm .
>>>
>>>
>>>
>>> Best regards, and Happy Hacking!
>>> Media CI robot on behalf of the linux-media community.
>>>
>>> ---
>>> Check the latest rules for contributing your patches at:
>>> https://docs.kernel.org/driver-api/media/maintainer-entry-profile.html
>>>
>>> If you believe that the CI is wrong, kindly open an issue at
>>> https://gitlab.freedesktop.org/linux-media/media-ci/-/issues or reply-all
>>> to this message.
>>
>> --
>> Regards,
>>
>> Laurent Pinchart
> 
> 
> 


