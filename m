Return-Path: <linux-media+bounces-16133-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id DC4D894EB84
	for <lists+linux-media@lfdr.de>; Mon, 12 Aug 2024 12:55:45 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 97669282630
	for <lists+linux-media@lfdr.de>; Mon, 12 Aug 2024 10:55:44 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A51EB175D27;
	Mon, 12 Aug 2024 10:55:21 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from mx.gpxsee.org (mx.gpxsee.org [37.205.14.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F4090170A22;
	Mon, 12 Aug 2024 10:55:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=37.205.14.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1723460121; cv=none; b=dfOkxWhY7W4odF66YpYVGS5ShPR5QubbzmEpsx9D81ieoDRUnR4JAUXAy+Urdf/Fe0ID+wmPiur0JF+LpklVVER6EhsDD9at4XaWFQW7g4Mi5XR+UQ19eLOw4eOMio0AV/u8mfB71Wh+u0o8l7G7l8G17+JcAT97MgTQ/lykHGo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1723460121; c=relaxed/simple;
	bh=G88gQMi5erAUXunLjZkWGC4L+HhGskuQ+RYOFqK4jC4=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=L/a+tMp6J/RBpm+pAJGYAaj+cudXxrhhG4bil6fox5DXRI7iGL2kiJ0WxEED2DOC2tBwN7T3TL9JMAFxweBFEosK2XWIZZnCBIszG/ye6tYKXNA1Qo0sxS/o7U/Kd2U8k05tPUFb56gcRnqUM8W3+GL4x+sUC9A/GizIy5w8dRI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=gpxsee.org; spf=pass smtp.mailfrom=gpxsee.org; arc=none smtp.client-ip=37.205.14.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=gpxsee.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gpxsee.org
Received: from [192.168.4.14] (unknown [62.77.71.229])
	by mx.gpxsee.org (Postfix) with ESMTPSA id 51B803DC3B;
	Mon, 12 Aug 2024 12:55:09 +0200 (CEST)
Message-ID: <045e20e2-52b0-4f6a-90ea-0cf96112b4f6@gpxsee.org>
Date: Mon, 12 Aug 2024 12:55:08 +0200
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 0/4 RESEND] media: mgb4: YUV and variable framerate
 support
To: Hans Verkuil <hverkuil@xs4all.nl>,
 Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
 =?UTF-8?Q?Martin_T=C5=AFma?= <martin.tuma@digiteqautomotive.com>
References: <20240805154054.8633-1-tumic@gpxsee.org>
 <e4f6f76a-0bad-4629-b438-a048ee683123@xs4all.nl>
Content-Language: en-US
From: =?UTF-8?Q?Martin_T=C5=AFma?= <tumic@gpxsee.org>
In-Reply-To: <e4f6f76a-0bad-4629-b438-a048ee683123@xs4all.nl>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

===== INPUT =====

v4l2-compliance 1.26.1, 64 bits, 64-bit time_t

Compliance test for mgb4 device /dev/video0:

Driver Info:
	Driver name      : mgb4
	Card type        : MGB4 PCIe Card
	Bus info         : PCI:0000:01:00.0
	Driver version   : 6.10.0
	Capabilities     : 0x85200001
		Video Capture
		Read/Write
		Streaming
		Extended Pix Format
		Device Capabilities
	Device Caps      : 0x05200001
		Video Capture
		Read/Write
		Streaming
		Extended Pix Format

Required ioctls:
	test VIDIOC_QUERYCAP: OK
	test invalid ioctls: OK

Allow for multiple opens:
	test second /dev/video0 open: OK
	test VIDIOC_QUERYCAP: OK
	test VIDIOC_G/S_PRIORITY: OK
	test for unlimited opens: OK

Debug ioctls:
	test VIDIOC_DBG_G/S_REGISTER: OK (Not Supported)
	test VIDIOC_LOG_STATUS: OK (Not Supported)

Input ioctls:
	test VIDIOC_G/S_TUNER/ENUM_FREQ_BANDS: OK (Not Supported)
	test VIDIOC_G/S_FREQUENCY: OK (Not Supported)
	test VIDIOC_S_HW_FREQ_SEEK: OK (Not Supported)
	test VIDIOC_ENUMAUDIO: OK (Not Supported)
	test VIDIOC_G/S/ENUMINPUT: OK
	test VIDIOC_G/S_AUDIO: OK (Not Supported)
	Inputs: 1 Audio Inputs: 0 Tuners: 0

Output ioctls:
	test VIDIOC_G/S_MODULATOR: OK (Not Supported)
	test VIDIOC_G/S_FREQUENCY: OK (Not Supported)
	test VIDIOC_ENUMAUDOUT: OK (Not Supported)
	test VIDIOC_G/S/ENUMOUTPUT: OK (Not Supported)
	test VIDIOC_G/S_AUDOUT: OK (Not Supported)
	Outputs: 0 Audio Outputs: 0 Modulators: 0

Input/Output configuration ioctls:
	test VIDIOC_ENUM/G/S/QUERY_STD: OK (Not Supported)
	test VIDIOC_ENUM/G/S/QUERY_DV_TIMINGS: OK
	test VIDIOC_DV_TIMINGS_CAP: OK
	test VIDIOC_G/S_EDID: OK (Not Supported)

Control ioctls (Input 0):
	test VIDIOC_QUERY_EXT_CTRL/QUERYMENU: OK (Not Supported)
	test VIDIOC_QUERYCTRL: OK (Not Supported)
	test VIDIOC_G/S_CTRL: OK (Not Supported)
	test VIDIOC_G/S/TRY_EXT_CTRLS: OK (Not Supported)
		warn: v4l2-test-controls.cpp(1139): V4L2_CID_DV_RX_POWER_PRESENT not 
found for input 0
	test VIDIOC_(UN)SUBSCRIBE_EVENT/DQEVENT: OK (Not Supported)
	test VIDIOC_G/S_JPEGCOMP: OK (Not Supported)
	Standard Controls: 0 Private Controls: 0

Format ioctls (Input 0):
	test VIDIOC_ENUM_FMT/FRAMESIZES/FRAMEINTERVALS: OK
	test VIDIOC_G/S_PARM: OK
	test VIDIOC_G_FBUF: OK (Not Supported)
	test VIDIOC_G_FMT: OK
	test VIDIOC_TRY_FMT: OK
	test VIDIOC_S_FMT: OK
	test VIDIOC_G_SLICED_VBI_CAP: OK (Not Supported)
	test Cropping: OK (Not Supported)
	test Composing: OK (Not Supported)
	test Scaling: OK (Not Supported)

Codec ioctls (Input 0):
	test VIDIOC_(TRY_)ENCODER_CMD: OK (Not Supported)
	test VIDIOC_G_ENC_INDEX: OK (Not Supported)
	test VIDIOC_(TRY_)DECODER_CMD: OK (Not Supported)

Buffer ioctls (Input 0):
	test VIDIOC_REQBUFS/CREATE_BUFS/QUERYBUF: OK
	test CREATE_BUFS maximum buffers: OK
	test VIDIOC_EXPBUF: OK
	test Requests: OK (Not Supported)

Total for mgb4 device /dev/video0: 46, Succeeded: 46, Failed: 0, Warnings: 1

===== OUTPUT =====

v4l2-compliance 1.26.1, 64 bits, 64-bit time_t

Compliance test for mgb4 device /dev/video2:

Driver Info:
	Driver name      : mgb4
	Card type        : MGB4 PCIe Card
	Bus info         : PCI:0000:01:00.0
	Driver version   : 6.10.0
	Capabilities     : 0x85200002
		Video Output
		Read/Write
		Streaming
		Extended Pix Format
		Device Capabilities
	Device Caps      : 0x05200002
		Video Output
		Read/Write
		Streaming
		Extended Pix Format

Required ioctls:
	test VIDIOC_QUERYCAP: OK
	test invalid ioctls: OK

Allow for multiple opens:
	test second /dev/video2 open: OK
	test VIDIOC_QUERYCAP: OK
	test VIDIOC_G/S_PRIORITY: OK
	test for unlimited opens: OK

Debug ioctls:
	test VIDIOC_DBG_G/S_REGISTER: OK (Not Supported)
	test VIDIOC_LOG_STATUS: OK (Not Supported)

Input ioctls:
	test VIDIOC_G/S_TUNER/ENUM_FREQ_BANDS: OK (Not Supported)
	test VIDIOC_G/S_FREQUENCY: OK (Not Supported)
	test VIDIOC_S_HW_FREQ_SEEK: OK (Not Supported)
	test VIDIOC_ENUMAUDIO: OK (Not Supported)
	test VIDIOC_G/S/ENUMINPUT: OK (Not Supported)
	test VIDIOC_G/S_AUDIO: OK (Not Supported)
	Inputs: 0 Audio Inputs: 0 Tuners: 0

Output ioctls:
	test VIDIOC_G/S_MODULATOR: OK (Not Supported)
	test VIDIOC_G/S_FREQUENCY: OK (Not Supported)
	test VIDIOC_ENUMAUDOUT: OK (Not Supported)
	test VIDIOC_G/S/ENUMOUTPUT: OK
	test VIDIOC_G/S_AUDOUT: OK (Not Supported)
	Outputs: 1 Audio Outputs: 0 Modulators: 0

Input/Output configuration ioctls:
	test VIDIOC_ENUM/G/S/QUERY_STD: OK (Not Supported)
	test VIDIOC_ENUM/G/S/QUERY_DV_TIMINGS: OK
	test VIDIOC_DV_TIMINGS_CAP: OK
	test VIDIOC_G/S_EDID: OK (Not Supported)

Control ioctls (Output 0):
	test VIDIOC_QUERY_EXT_CTRL/QUERYMENU: OK (Not Supported)
	test VIDIOC_QUERYCTRL: OK (Not Supported)
	test VIDIOC_G/S_CTRL: OK (Not Supported)
	test VIDIOC_G/S/TRY_EXT_CTRLS: OK (Not Supported)
		warn: v4l2-test-controls.cpp(1144): V4L2_CID_DV_TX_HOTPLUG not found 
for output 0
		warn: v4l2-test-controls.cpp(1147): V4L2_CID_DV_TX_EDID_PRESENT not 
found for output 0
	test VIDIOC_(UN)SUBSCRIBE_EVENT/DQEVENT: OK (Not Supported)
	test VIDIOC_G/S_JPEGCOMP: OK (Not Supported)
	Standard Controls: 0 Private Controls: 0

Format ioctls (Output 0):
	test VIDIOC_ENUM_FMT/FRAMESIZES/FRAMEINTERVALS: OK
		warn: v4l2-test-formats.cpp(1421): S_PARM is supported for buftype 2, 
but not for ENUM_FRAMEINTERVALS
	test VIDIOC_G/S_PARM: OK
	test VIDIOC_G_FBUF: OK (Not Supported)
	test VIDIOC_G_FMT: OK
	test VIDIOC_TRY_FMT: OK
	test VIDIOC_S_FMT: OK
	test VIDIOC_G_SLICED_VBI_CAP: OK (Not Supported)
	test Cropping: OK (Not Supported)
	test Composing: OK (Not Supported)
	test Scaling: OK (Not Supported)

Codec ioctls (Output 0):
	test VIDIOC_(TRY_)ENCODER_CMD: OK (Not Supported)
	test VIDIOC_G_ENC_INDEX: OK (Not Supported)
	test VIDIOC_(TRY_)DECODER_CMD: OK (Not Supported)

Buffer ioctls (Output 0):
	test VIDIOC_REQBUFS/CREATE_BUFS/QUERYBUF: OK
	test CREATE_BUFS maximum buffers: OK
	test VIDIOC_EXPBUF: OK
	test Requests: OK (Not Supported)

Total for mgb4 device /dev/video2: 46, Succeeded: 46, Failed: 0, Warnings: 3

On 12. 08. 24 8:53 dop., Hans Verkuil wrote:
> Hi Martin,
> 
> Before I merge this series, I would like to see the v4l2-compliance output for
> each video device.
> 
> Can you reply with that output?
> 
> I want to make sure that all the g/s_parm and dv_timings changes are correct
> according to v4l2-compliance. And of course, if it isn't, then please fix
> any reported issue and post a v7.
> 
> Regards,
> 
> 	Hans
> 
> On 05/08/2024 17:40, tumic@gpxsee.org wrote:
>> From: Martin Tůma <martin.tuma@digiteqautomotive.com>
>>
>> Recent mgb4 FW update added support for the YUV image format and variable
>> framerates independent of the signal framerate. The following patches extend
>> the mgb4 driver with support for both features.
>>
>> Changes in V6:
>> - Properly handle the timings when no signal is present.
>>
>> Changes in V5:
>> - Removed surplus v4l2_format.type checks.
>> - Improved the patch descriptions.
>> - Splitted the frame rate limit patch into separate code/documentation parts.
>>
>> Changes in V4:
>> - Splitted the output frame_rate handling fix from the variable frame rate
>>    addition patch.
>>
>> Changes in V3:
>> - Use div_u64() for 64b division (fixes build error on ARM32)
>>
>> Changes in V2:
>> - Added missing stride limit
>>
>> Martin Tůma (4):
>>    media: mgb4: Add support for YUV image formats
>>    media: mgb4: Add support for V4L2_CAP_TIMEPERFRAME
>>    media: mgb4: Fixed signal frame rate limit handling
>>    media: admin-guide: mgb4: Outputs DV timings documentation update
>>
>>   Documentation/admin-guide/media/mgb4.rst |  23 +-
>>   drivers/media/pci/mgb4/mgb4_core.c       |   2 +-
>>   drivers/media/pci/mgb4/mgb4_core.h       |   2 +
>>   drivers/media/pci/mgb4/mgb4_io.h         |  29 ++-
>>   drivers/media/pci/mgb4/mgb4_sysfs_out.c  |   9 +-
>>   drivers/media/pci/mgb4/mgb4_vin.c        | 193 +++++++++++---
>>   drivers/media/pci/mgb4/mgb4_vin.h        |   3 +-
>>   drivers/media/pci/mgb4/mgb4_vout.c       | 309 ++++++++++++++++++++---
>>   drivers/media/pci/mgb4/mgb4_vout.h       |   5 +-
>>   9 files changed, 482 insertions(+), 93 deletions(-)
>>
>>
>> base-commit: 1613e604df0cd359cf2a7fbd9be7a0bcfacfabd0
> 


