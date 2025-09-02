Return-Path: <linux-media+bounces-41599-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id C255CB409C7
	for <lists+linux-media@lfdr.de>; Tue,  2 Sep 2025 17:53:49 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 418BE1B619E3
	for <lists+linux-media@lfdr.de>; Tue,  2 Sep 2025 15:54:10 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6649832A825;
	Tue,  2 Sep 2025 15:53:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="e7yZ59ec"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A4BE52F530E;
	Tue,  2 Sep 2025 15:53:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756828422; cv=none; b=exmbAC8YPqPANV5ewIJRVvycIW15lcIJ3KxoR4+SsI7U/cTH7uJzW8dcWWqXJl9NBaB20lH8nibWosybkpBTJf8jFJCszXdH2mZ9QBmlJkgEHGbTxIZhL0dhbd0MG6RW+CsANQ7e2Zj9wQv2OOZFANtyEmUBqiRmoV6GyN02HHI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756828422; c=relaxed/simple;
	bh=k967DAt4rwczEf8YqDD7OJRDqumLz4pIOyT/YeYOOY0=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=gDN+dbMBePI72k3+JMYFwTSbuV6E3ZdgLnN0cQrPsfljlVrlgPY4K28IbvASVdOLHhqvn0GhYz7pYCrjlEp4RhRbSUFeKJgEQeTHo/jFiLi484pXzp5PWgUlKcsYVX4uqXcDix3rvJ3dAR2OtkVHOSzpdPXC4Go99IEez9Zsbjk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=e7yZ59ec; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4EB56C4CEED;
	Tue,  2 Sep 2025 15:53:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1756828422;
	bh=k967DAt4rwczEf8YqDD7OJRDqumLz4pIOyT/YeYOOY0=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=e7yZ59ecMI/K31tu2zZJ6JdY8Kt+3CW0V2fvSYiIX7Q+7u+p99ArGGd98bJ/faDCg
	 7w9ZFCHROE/GEOewZBD5Bc1dViLTxP7X0OkSfs+Gpi5jtsfgIQqYvqjVc+4iDSkLGP
	 irLCLHqzyffszHPr6LK8AReHEBxQwqm7Y3pvJAeTqXRg+EkF/qBoWqY1tLCkrBJa3O
	 eYBcbftopVh1VmPRYig3QIp2LKgZD6QKR/yMCEyMtxzWdC65q3sxvm99o4YDMRXy47
	 3OytVmQIVKZlt4AFGq6rcdcYdq+o3SGuIFlokL1nXmPU4s51k3+yvi47dMhVwotq+H
	 km9X7Zpkp36BQ==
Message-ID: <b2175a9a-f110-4103-ac2d-24971ee41fc9@kernel.org>
Date: Tue, 2 Sep 2025 10:53:39 -0500
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 0/7] Add AMD ISP4 driver
To: "Du, Bin" <bin.du@amd.com>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc: mchehab@kernel.org, hverkuil@xs4all.nl, bryan.odonoghue@linaro.org,
 sakari.ailus@linux.intel.com, prabhakar.mahadev-lad.rj@bp.renesas.com,
 linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
 sultan@kerneltoast.com, pratap.nirujogi@amd.com, benjamin.chan@amd.com,
 king.li@amd.com, gjorgji.rosikopulos@amd.com, Phil.Jawich@amd.com,
 Dominic.Antony@amd.com, richard.gong@amd.com, anson.tsao@amd.com
References: <20250828084507.94552-1-Bin.Du@amd.com>
 <20250828165605.GA9916@pendragon.ideasonboard.com>
 <20250828165850.GA14246@pendragon.ideasonboard.com>
 <0a10bae2-600c-4ca2-8437-411e9c236d5c@amd.com>
Content-Language: en-US
From: Mario Limonciello <superm1@kernel.org>
In-Reply-To: <0a10bae2-600c-4ca2-8437-411e9c236d5c@amd.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit


On 9/1/2025 10:39 PM, Du, Bin wrote:
> Hi Laurent Pinchart, sorry for the confusion.
> 
> On 8/29/2025 12:58 AM, Laurent Pinchart wrote:
>> On Thu, Aug 28, 2025 at 06:56:06PM +0200, Laurent Pinchart wrote:
>>> Hi Bin Bu,
>>>
>>> Have you sent out the cover letter only ? I haven't received the rest of
>>> the series, and it's not found on lore.kernel.org either.
>>
>> I've just noticed you sent the rest later and separately, as
>> https://lore.kernel.org/all/20250828100811.95722-1-Bin.Du@amd.com/.
>>
> 
> Before sending the formal ones, i did some internal test, after the 
> cover letter, when i tried to send the rest, i encountered this error, 
> 4.4.2 Message submission rate for this client has exceeded the 
> configured limit. So i had to wait for some time so i could send again.

FYI - this was an AMD I/T SMTP server problem with git send-email.

I understand some other teams were hitting it too and worked with I/T 
and it should be fixed now.  If you have problems the next go around 
raise it I/T again.

> 
>>> On Thu, Aug 28, 2025 at 04:45:00PM +0800, Bin Du wrote:
>>>> Hello,
>>>>
>>>> AMD ISP4 is the AMD image processing gen 4 which can be found in HP 
>>>> ZBook Ultra G1a 14 inch Mobile Workstation PC ( Ryzen AI Max 385)
>>>> (https://ubuntu.com/certified/202411-36043)
>>>> This patch series introduces the initial driver support for the AMD 
>>>> ISP4.
>>>>
>>>> Patch summary:
>>>> - Powers up/off and initializes ISP HW
>>>> - Configures and kicks off ISP FW
>>>> - Interacts with APP using standard V4l2 interface by video node
>>>> - Controls ISP HW and interacts with ISP FW to do image processing
>>>> - Support enum/set output image format and resolution
>>>> - Support queueing buffer from app and dequeueing ISP filled buffer 
>>>> to App
>>>> - It supports libcamera ver0.2 SimplePipeline
>>>> - It is verified on qv4l2, cheese and qcam
>>>> - It is verified together with following patches
>>>>     platform/x86: Add AMD ISP platform config (https:// 
>>>> lore.kernel.org/all/20250514215623.522746-1-pratap.nirujogi@amd.com/)
>>>>     pinctrl: amd: isp411: Add amdisp GPIO pinctrl (https:// 
>>>> github.com/torvalds/linux/commit/ 
>>>> e97435ab09f3ad7b6a588dd7c4e45a96699bbb4a)
>>>>     drm/amd/amdgpu: Add GPIO resources required for amdisp (https:// 
>>>> gitlab.freedesktop.org/agd5f/linux/-/commit/ 
>>>> ad0f5966ed8297aa47b3184192b00b7379ae0758)
>>>>
>>>> AMD ISP4 Key features:
>>>> - Processes bayer raw data from the connected sensor and output them 
>>>> to different YUV formats
>>>> - Downscale input image to different output image resolution
>>>> - Pipeline to do image processing on the input image including 
>>>> demosaic, denoise, 3A, etc
>>>>
>>>> ----------
>>>>
>>>> Changes v2 -> v3:
>>>>
>>>> - All the dependent patches in other modules (drm/amd/amdgpu, 
>>>> platform/x86, pinctrl/amd) merged on upstream mainline kernel 
>>>> (https://github.com/torvalds/linux) v6.17.
>>>> - Removed usage of amdgpu structs in ISP driver. Added helper 
>>>> functions in amdgpu accepting opaque params from ISP driver to 
>>>> allocate and release ISP GART buffers.
>>>> - Moved sensor and MIPI phy control entirely into ISP FW instead of 
>>>> the previous hybrid approach controlling sensor from both FW and x86 
>>>> (sensor driver).
>>>> - Removed phy configuration and sensor binding as x86 (sensor 
>>>> driver) had relinquished the sensor control for ISP FW. With this 
>>>> approach the driver will be exposed as web camera like interface.
>>>> - New FW with built-in sensor driver is submitted on upstream linux- 
>>>> firmware repo (https://gitlab.com/kernel-firmware/linux-firmware/).
>>>> - Please note the new FW submitted is not directly compatible with 
>>>> OEM Kernel ISP4.0 (https://github.com/amd/Linux_ISP_Kernel/tree/4.0) 
>>>> and the previous ISP V2 patch series.
>>>> - If intend to use the new FW, please rebuild OEM ISP4.0 Kernel with 
>>>> CONFIG_VIDEO_OV05C10=N and CONFIG_PINCTRL_AMDISP=Y.
>>>> - Included critical fixes from Sultan Alsawaf branch (https:// 
>>>> github.com/kerneltoast/kernel_x86_laptop.git) related to managing 
>>>> lifetime of isp buffers.
>>>>        media: amd: isp4: Add missing refcount tracking to mmap memop
>>>>        media: amd: isp4: Don't put or unmap the dmabuf when detaching
>>>>        media: amd: isp4: Don't increment refcount when dmabuf export 
>>>> fails
>>>>        media: amd: isp4: Fix possible use-after-free in 
>>>> isp4vid_vb2_put()
>>>>        media: amd: isp4: Always export a new dmabuf from get_dmabuf 
>>>> memop
>>>>        media: amd: isp4: Fix implicit dmabuf lifetime tracking
>>>>        media: amd: isp4: Fix possible use-after-free when putting 
>>>> implicit dmabuf
>>>>        media: amd: isp4: Simplify isp4vid_get_dmabuf() arguments
>>>>        media: amd: isp4: Move up buf->vaddr check in 
>>>> isp4vid_get_dmabuf()
>>>>        media: amd: isp4: Remove unused userptr memops
>>>>        media: amd: isp4: Add missing cleanup on error in 
>>>> isp4vid_vb2_alloc()
>>>>        media: amd: isp4: Release queued buffers on error in 
>>>> start_streaming
>>>> - Addressed all code related upstream comments
>>>> - Fix typo errors and other cosmetic issue.
>>>>
>>>>
>>>> Changes v1 -> v2:
>>>>
>>>> - Fix media CI test errors and valid warnings
>>>> - Reduce patch number in the series from 9 to 8 by merging 
>>>> MAINTAINERS adding patch to the first patch
>>>> - In patch 5
>>>>     - do modification to use remote endpoint instead of local endpoint
>>>>     - use link frequency and port number as start phy parameter 
>>>> instead of extra added phy-id and phy-bit-rate property of endpoint
>>>>
>>>> ----------
>>>>
>>>> It passes v4l2 compliance test, the test reports for:
>>>>
>>>> (a) amd_isp_capture device /dev/video0
>>>>
>>>> Compliance test for amd_isp_capture device /dev/video0:
>>>> -------------------------------------------------------
>>>>
>>>> atg@atg-HP-PV:~/bin$ ./v4l2-compliance -d /dev/video0
>>>> v4l2-compliance 1.29.0-5348, 64 bits, 64-bit time_t
>>>> v4l2-compliance SHA: 75e3f0e2c2cb 2025-03-17 18:12:17
>>>>
>>>> Compliance test for amd_isp_capture device /dev/video0:
>>>>
>>>> Driver Info:
>>>>          Driver name      : amd_isp_capture
>>>>          Card type        : amd_isp_capture
>>>>          Bus info         : platform:amd_isp_capture
>>>>          Driver version   : 6.14.0
>>>>          Capabilities     : 0xa4200001
>>>>                  Video Capture
>>>>                  I/O MC
>>>>                  Streaming
>>>>                  Extended Pix Format
>>>>                  Device Capabilities
>>>>          Device Caps      : 0x24200001
>>>>                  Video Capture
>>>>                  I/O MC
>>>>                  Streaming
>>>>                  Extended Pix Format
>>>> Media Driver Info:
>>>>          Driver name      : amd_isp_capture
>>>>          Model            : amd_isp41_mdev
>>>>          Serial           :
>>>>          Bus info         : platform:amd_isp_capture
>>>>          Media version    : 6.14.0
>>>>          Hardware revision: 0x00000000 (0)
>>>>          Driver version   : 6.14.0
>>>> Interface Info:
>>>>          ID               : 0x03000005
>>>>          Type             : V4L Video
>>>> Entity Info:
>>>>          ID               : 0x00000003 (3)
>>>>          Name             : Preview
>>>>          Function         : V4L2 I/O
>>>>          Pad 0x01000004   : 0: Sink
>>>>            Link 0x02000007: from remote pad 0x1000002 of entity 'amd 
>>>> isp4' (Image Signal Processor): Data, Enabled, Immutable
>>>>
>>>> Required ioctls:
>>>>          test MC information (see 'Media Driver Info' above): OK
>>>>          test VIDIOC_QUERYCAP: OK
>>>>          test invalid ioctls: OK
>>>>
>>>> Allow for multiple opens:
>>>>          test second /dev/video0 open: OK
>>>>          test VIDIOC_QUERYCAP: OK
>>>>          test VIDIOC_G/S_PRIORITY: OK
>>>>          test for unlimited opens: OK
>>>>
>>>> Debug ioctls:
>>>>          test VIDIOC_DBG_G/S_REGISTER: OK (Not Supported)
>>>>          test VIDIOC_LOG_STATUS: OK (Not Supported)
>>>>
>>>> Input ioctls:
>>>>          test VIDIOC_G/S_TUNER/ENUM_FREQ_BANDS: OK (Not Supported)
>>>>          test VIDIOC_G/S_FREQUENCY: OK (Not Supported)
>>>>          test VIDIOC_S_HW_FREQ_SEEK: OK (Not Supported)
>>>>          test VIDIOC_ENUMAUDIO: OK (Not Supported)
>>>>          test VIDIOC_G/S/ENUMINPUT: OK
>>>>          test VIDIOC_G/S_AUDIO: OK (Not Supported)
>>>>          Inputs: 1 Audio Inputs: 0 Tuners: 0
>>>>
>>>> Output ioctls:
>>>>          test VIDIOC_G/S_MODULATOR: OK (Not Supported)
>>>>          test VIDIOC_G/S_FREQUENCY: OK (Not Supported)
>>>>          test VIDIOC_ENUMAUDOUT: OK (Not Supported)
>>>>          test VIDIOC_G/S/ENUMOUTPUT: OK (Not Supported)
>>>>          test VIDIOC_G/S_AUDOUT: OK (Not Supported)
>>>>          Outputs: 0 Audio Outputs: 0 Modulators: 0
>>>>
>>>> Input/Output configuration ioctls:
>>>>          test VIDIOC_ENUM/G/S/QUERY_STD: OK (Not Supported)
>>>>          test VIDIOC_ENUM/G/S/QUERY_DV_TIMINGS: OK (Not Supported)
>>>>          test VIDIOC_DV_TIMINGS_CAP: OK (Not Supported)
>>>>          test VIDIOC_G/S_EDID: OK (Not Supported)
>>>>
>>>> Control ioctls (Input 0):
>>>>          test VIDIOC_QUERY_EXT_CTRL/QUERYMENU: OK (Not Supported)
>>>>          test VIDIOC_QUERYCTRL: OK (Not Supported)
>>>>          test VIDIOC_G/S_CTRL: OK (Not Supported)
>>>>          test VIDIOC_G/S/TRY_EXT_CTRLS: OK (Not Supported)
>>>>          test VIDIOC_(UN)SUBSCRIBE_EVENT/DQEVENT: OK (Not Supported)
>>>>          test VIDIOC_G/S_JPEGCOMP: OK (Not Supported)
>>>>          Standard Controls: 0 Private Controls: 0
>>>>
>>>> Format ioctls (Input 0):
>>>>          test VIDIOC_ENUM_FMT/FRAMESIZES/FRAMEINTERVALS: OK
>>>>          test VIDIOC_G/S_PARM: OK
>>>>          test VIDIOC_G_FBUF: OK (Not Supported)
>>>>          test VIDIOC_G_FMT: OK
>>>>          test VIDIOC_TRY_FMT: OK
>>>>          test VIDIOC_S_FMT: OK
>>>>          test VIDIOC_G_SLICED_VBI_CAP: OK (Not Supported)
>>>>          test Cropping: OK (Not Supported)
>>>>          test Composing: OK (Not Supported)
>>>>          test Scaling: OK (Not Supported)
>>>>
>>>> Codec ioctls (Input 0):
>>>>          test VIDIOC_(TRY_)ENCODER_CMD: OK (Not Supported)
>>>>          test VIDIOC_G_ENC_INDEX: OK (Not Supported)
>>>>          test VIDIOC_(TRY_)DECODER_CMD: OK (Not Supported)
>>>>
>>>> Buffer ioctls (Input 0):
>>>>          test VIDIOC_REQBUFS/CREATE_BUFS/QUERYBUF: OK
>>>>          test CREATE_BUFS maximum buffers: OK
>>>>          test VIDIOC_REMOVE_BUFS: OK
>>>>          test VIDIOC_EXPBUF: OK
>>>>          test Requests: OK (Not Supported)
>>>>          test blocking wait: OK
>>>>
>>>> Total for amd_isp_capture device /dev/video0: 49, Succeeded: 49, 
>>>> Failed: 0, Warnings: 0
>>>>
>>>> Please review and provide feedback.
>>>>
>>>> Many thanks,
>>>>
>>>> Bin Du (7):
>>>>    media: platform: amd: Introduce amd isp4 capture driver
>>>>    media: platform: amd: low level support for isp4 firmware
>>>>    media: platform: amd: Add isp4 fw and hw interface
>>>>    media: platform: amd: isp4 subdev and firmware loading handling 
>>>> added
>>>>    media: platform: amd: isp4 video node and buffers handling added
>>>>    media: platform: amd: isp4 debug fs logging and  more descriptive
>>>>      errors
>>>>    Documentation: add documentation of AMD isp 4 driver
>>>>
>>>>   Documentation/admin-guide/media/amdisp4-1.rst |   66 +
>>>>   Documentation/admin-guide/media/amdisp4.dot   |    8 +
>>>>   .../admin-guide/media/v4l-drivers.rst         |    1 +
>>>>   MAINTAINERS                                   |   25 +
>>>>   drivers/media/platform/Kconfig                |    1 +
>>>>   drivers/media/platform/Makefile               |    1 +
>>>>   drivers/media/platform/amd/Kconfig            |    3 +
>>>>   drivers/media/platform/amd/Makefile           |    3 +
>>>>   drivers/media/platform/amd/isp4/Kconfig       |   13 +
>>>>   drivers/media/platform/amd/isp4/Makefile      |   10 +
>>>>   drivers/media/platform/amd/isp4/isp4.c        |  237 ++++
>>>>   drivers/media/platform/amd/isp4/isp4.h        |   26 +
>>>>   drivers/media/platform/amd/isp4/isp4_debug.c  |  272 ++++
>>>>   drivers/media/platform/amd/isp4/isp4_debug.h  |   41 +
>>>>   .../platform/amd/isp4/isp4_fw_cmd_resp.h      |  314 +++++
>>>>   drivers/media/platform/amd/isp4/isp4_hw_reg.h |  125 ++
>>>>   .../media/platform/amd/isp4/isp4_interface.c  |  972 +++++++++++++
>>>>   .../media/platform/amd/isp4/isp4_interface.h  |  149 ++
>>>>   drivers/media/platform/amd/isp4/isp4_subdev.c | 1198 ++++++++++++++++
>>>>   drivers/media/platform/amd/isp4/isp4_subdev.h |  133 ++
>>>>   drivers/media/platform/amd/isp4/isp4_video.c  | 1213 +++++++++++++ 
>>>> ++++
>>>>   drivers/media/platform/amd/isp4/isp4_video.h  |   87 ++
>>>>   22 files changed, 4898 insertions(+)
>>>>   create mode 100644 Documentation/admin-guide/media/amdisp4-1.rst
>>>>   create mode 100644 Documentation/admin-guide/media/amdisp4.dot
>>>>   create mode 100644 drivers/media/platform/amd/Kconfig
>>>>   create mode 100644 drivers/media/platform/amd/Makefile
>>>>   create mode 100644 drivers/media/platform/amd/isp4/Kconfig
>>>>   create mode 100644 drivers/media/platform/amd/isp4/Makefile
>>>>   create mode 100644 drivers/media/platform/amd/isp4/isp4.c
>>>>   create mode 100644 drivers/media/platform/amd/isp4/isp4.h
>>>>   create mode 100644 drivers/media/platform/amd/isp4/isp4_debug.c
>>>>   create mode 100644 drivers/media/platform/amd/isp4/isp4_debug.h
>>>>   create mode 100644 drivers/media/platform/amd/isp4/isp4_fw_cmd_resp.h
>>>>   create mode 100644 drivers/media/platform/amd/isp4/isp4_hw_reg.h
>>>>   create mode 100644 drivers/media/platform/amd/isp4/isp4_interface.c
>>>>   create mode 100644 drivers/media/platform/amd/isp4/isp4_interface.h
>>>>   create mode 100644 drivers/media/platform/amd/isp4/isp4_subdev.c
>>>>   create mode 100644 drivers/media/platform/amd/isp4/isp4_subdev.h
>>>>   create mode 100644 drivers/media/platform/amd/isp4/isp4_video.c
>>>>   create mode 100644 drivers/media/platform/amd/isp4/isp4_video.h
>>
> 


