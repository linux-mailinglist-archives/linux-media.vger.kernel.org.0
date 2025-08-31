Return-Path: <linux-media+bounces-41384-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 0A265B3D3B5
	for <lists+linux-media@lfdr.de>; Sun, 31 Aug 2025 15:42:00 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 4A1841899146
	for <lists+linux-media@lfdr.de>; Sun, 31 Aug 2025 13:42:20 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C95B9258EF0;
	Sun, 31 Aug 2025 13:41:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="AQPqoCKh"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-ej1-f43.google.com (mail-ej1-f43.google.com [209.85.218.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 190FE1D6AA;
	Sun, 31 Aug 2025 13:41:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756647712; cv=none; b=BisiS7n3ZflIbifs3OilJS7js1/k7g2mH9JmWrulBRMzsYVkC3PbHIxJtBrbBo0vzSlydKxfbM2yKWt58cbcthpCHrwcll9QxKiYW+9nLgRi6RCXAQyME6iNm/sIaIoSmHrb3Owo0jKpeWU5VGK+dcb4D/4/O/ZRo3nXfDbXehQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756647712; c=relaxed/simple;
	bh=tXkH5w9TaJEP2oSrz+TpDMe/NDq35TmJciUSUm/MTII=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=N54W6uIk6egvGTz/8WL+RKrSGs9x0LqC2yZkuLo5YTM4aDRDMYMffyQqjhuxvoEK7hXdepWWN8NZ1z22mmtXhkDwISuqZPtPCuPrxbgFP2m75ooTamCQAFpxKviLen7Dn+roZI9XRwekQPsEawpC0c6eYov59Lr4USNQWxae3Kk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=AQPqoCKh; arc=none smtp.client-ip=209.85.218.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ej1-f43.google.com with SMTP id a640c23a62f3a-b040df389easo144089466b.3;
        Sun, 31 Aug 2025 06:41:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1756647708; x=1757252508; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=EnbydnDT854VS8PEEGR+FGKunvPfuyw4qjErwlaR9OE=;
        b=AQPqoCKhHUvFqCtc84f4OO2gfHGef+rwlyPNA3Xsuc1JtrXTSX/lW8GRq+8Fvlmq0Q
         1T29aWYJn/FCL23vOiNJBjpKl0s918k55QvNNLwTHPi1Aexr77t6Yr3WR+t+F/5kh9S5
         CkEOZ+vbahm0ZvNTburGNPMBVCSXIRWsv/1aT8iIRooBO0Ic3+AE2YGj4xPC+37kjM34
         SeT0ubEKL4dI6QDepVr7v56BhgkTQSCz3LHD700PbtNvTqkNIwqnwORLhPclpO0C8CRI
         7xV7cnzzpPoo8YYbpSILV7sv0M7A6Dkgw6CT52ETpbHiWWSB37mmiY3BVX/89r1QxR4p
         Vikw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756647708; x=1757252508;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=EnbydnDT854VS8PEEGR+FGKunvPfuyw4qjErwlaR9OE=;
        b=MSlp2+GA3bevizkLsV2dibL1QU+ldyPRM2j4GZdQDjE2OCrl33m5dv+YCJ6zAWMARo
         i36E11FWQqJBos3/loDLQrdktQ16ojlnLTRp3NexMDhpPBaK2ymFzFlPVfpMVho58rzH
         GUMVePSdom7au4L32BbULChN51pC1K7DiFKGin4mVGT4Hw2KOaU0Wg/nWK85Pzhd0mDz
         O0icT7WRXlF5i2IswpEHJKDhUKHu6nQjwuJcLRU9mp1KjvJDhnrpQAbJ9s20qhMEMumr
         ecYiil4w80t0vypDcnSRc5KDMFKkt1PRAw+5tq8BJaTbZTXYxtQjPedHTOZn1ZH6CaGr
         bgPw==
X-Forwarded-Encrypted: i=1; AJvYcCUHydUegjeksLwaiDnbzuoZuSskdai+beM5ia2vcjAV0VrBJ1HE+vDa4a6lDG4PYd9FkBclntY3mtElE5Y=@vger.kernel.org, AJvYcCWSfdO3ZfxyR2L77SSxeNa6f4lvARzE8RkIJz2fQY+/z/jkj3dKunLjNrtyPBYw5or2KpkpirLkl0FgABk=@vger.kernel.org
X-Gm-Message-State: AOJu0YwnMv79U9JEUG8SqDYnlfNRZjN531Aeq+c/i5xFqRYRsnQWSfyc
	IlrlOoLtrLhbzpqkSPInh4b7OHHxJqC+fNH4Ms6IIlutFnGfavl5mGhgamv8HBCYr8Y=
X-Gm-Gg: ASbGncswE8sTe8BZbY04YqZlHrBj5OBqVZ//7+7Cu9HLFsIwsx7+40/9hVHXwstk8ZQ
	D0oOIRPfV8/gKKx7haVyTAedrpPZ44iokttgli3Ado9pIhDPEBMtC9jMliMI4b0uFbY1t2zdhOB
	R0hsVZu48ghv5oIWCyqF1W6mVP0KqczagMN9UhmVwTyrzUWJu9IF88tr4L62bhkR899hqX4IklV
	rjHixciiACRkVM0bSgN9OwZuHsH+i19F+RC++i+cDuFDYfxQcVDVIocy3euDMnwe8eXwtCJCo5P
	vSlSqBKYrvjtee6O47MU/csoh33zykzO6BZ634928xdRoboa5EP0i6Ci+Fgcf3Bm3KBr5XbqwJu
	Cxnic+cLs8Su3zBzRVZeK4usAb7056YQio67j/ZXnO0rDnCGh
X-Google-Smtp-Source: AGHT+IE1NpmG9gcZ3OZ7C9aBoNLuBQ5tHfgQjk0mffqHtqgSe3CPpFtrMN2bDZY2gJuCqddKffhKUA==
X-Received: by 2002:a17:906:48c9:b0:b04:10d9:48d4 with SMTP id a640c23a62f3a-b0410d9523dmr238090666b.35.1756647707975;
        Sun, 31 Aug 2025 06:41:47 -0700 (PDT)
Received: from ?IPV6:2a06:a005:1084:800::67d? ([2a06:a005:1084:800::67d])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b03fa921a32sm308446366b.31.2025.08.31.06.41.43
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 31 Aug 2025 06:41:47 -0700 (PDT)
Message-ID: <5f0a5f6b-a84b-414d-a028-1e65833f0d22@gmail.com>
Date: Sun, 31 Aug 2025 18:41:41 +0500
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 0/7] Add AMD ISP4 driver
To: Bin Du <Bin.Du@amd.com>, mchehab@kernel.org, hverkuil@xs4all.nl,
 laurent.pinchart+renesas@ideasonboard.com, bryan.odonoghue@linaro.org,
 sakari.ailus@linux.intel.com, prabhakar.mahadev-lad.rj@bp.renesas.com,
 linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
 sultan@kerneltoast.com
Cc: pratap.nirujogi@amd.com, benjamin.chan@amd.com, king.li@amd.com,
 gjorgji.rosikopulos@amd.com, Phil.Jawich@amd.com, Dominic.Antony@amd.com,
 mario.limonciello@amd.com, richard.gong@amd.com, anson.tsao@amd.com
References: <20250828084507.94552-1-Bin.Du@amd.com>
Content-Language: en-US
From: Alexey Zagorodnikov <xglooom@gmail.com>
In-Reply-To: <20250828084507.94552-1-Bin.Du@amd.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hello,

I have tested this patch on my HP ZBook Ultra G1a, and webcam now works 
great, thank you!

One trick that I noticed, mkinitcpio does not include isp_4_1_1.bin 
firmware inside the image, however, other amdgpu firmware files are 
present. So I need to manually add via config.

Should be "MODULE_FIRMWARE("amdgpu/isp_4_1_1.bin");" added in 
isp_v4_1_1.c like other firmware, for work right out of the box?

On 8/28/25 13:45, Bin Du wrote:
> Hello,
>
> AMD ISP4 is the AMD image processing gen 4 which can be found in HP ZBook Ultra G1a 14 inch Mobile Workstation PC ( Ryzen AI Max 385)
> (https://ubuntu.com/certified/202411-36043)
> This patch series introduces the initial driver support for the AMD ISP4.
>
> Patch summary:
> - Powers up/off and initializes ISP HW
> - Configures and kicks off ISP FW
> - Interacts with APP using standard V4l2 interface by video node
> - Controls ISP HW and interacts with ISP FW to do image processing
> - Support enum/set output image format and resolution
> - Support queueing buffer from app and dequeueing ISP filled buffer to App
> - It supports libcamera ver0.2 SimplePipeline
> - It is verified on qv4l2, cheese and qcam
> - It is verified together with following patches
> 	platform/x86: Add AMD ISP platform config (https://lore.kernel.org/all/20250514215623.522746-1-pratap.nirujogi@amd.com/)
> 	pinctrl: amd: isp411: Add amdisp GPIO pinctrl (https://github.com/torvalds/linux/commit/e97435ab09f3ad7b6a588dd7c4e45a96699bbb4a)
> 	drm/amd/amdgpu: Add GPIO resources required for amdisp (https://gitlab.freedesktop.org/agd5f/linux/-/commit/ad0f5966ed8297aa47b3184192b00b7379ae0758)
>
> AMD ISP4 Key features:
> - Processes bayer raw data from the connected sensor and output them to different YUV formats
> - Downscale input image to different output image resolution
> - Pipeline to do image processing on the input image including demosaic, denoise, 3A, etc
>
> ----------
>
> Changes v2 -> v3:
>
> - All the dependent patches in other modules (drm/amd/amdgpu, platform/x86, pinctrl/amd) merged on upstream mainline kernel (https://github.com/torvalds/linux) v6.17.
> - Removed usage of amdgpu structs in ISP driver. Added helper functions in amdgpu accepting opaque params from ISP driver to allocate and release ISP GART buffers.
> - Moved sensor and MIPI phy control entirely into ISP FW instead of the previous hybrid approach controlling sensor from both FW and x86 (sensor driver).
> - Removed phy configuration and sensor binding as x86 (sensor driver) had relinquished the sensor control for ISP FW. With this approach the driver will be exposed as web camera like interface.
> - New FW with built-in sensor driver is submitted on upstream linux-firmware repo (https://gitlab.com/kernel-firmware/linux-firmware/).
> - Please note the new FW submitted is not directly compatible with OEM Kernel ISP4.0 (https://github.com/amd/Linux_ISP_Kernel/tree/4.0) and the previous ISP V2 patch series.
> - If intend to use the new FW, please rebuild OEM ISP4.0 Kernel with CONFIG_VIDEO_OV05C10=N and CONFIG_PINCTRL_AMDISP=Y.
> - Included critical fixes from Sultan Alsawaf branch (https://github.com/kerneltoast/kernel_x86_laptop.git) related to managing lifetime of isp buffers.
>        media: amd: isp4: Add missing refcount tracking to mmap memop
>        media: amd: isp4: Don't put or unmap the dmabuf when detaching
>        media: amd: isp4: Don't increment refcount when dmabuf export fails
>        media: amd: isp4: Fix possible use-after-free in isp4vid_vb2_put()
>        media: amd: isp4: Always export a new dmabuf from get_dmabuf memop
>        media: amd: isp4: Fix implicit dmabuf lifetime tracking
>        media: amd: isp4: Fix possible use-after-free when putting implicit dmabuf
>        media: amd: isp4: Simplify isp4vid_get_dmabuf() arguments
>        media: amd: isp4: Move up buf->vaddr check in isp4vid_get_dmabuf()
>        media: amd: isp4: Remove unused userptr memops
>        media: amd: isp4: Add missing cleanup on error in isp4vid_vb2_alloc()
>        media: amd: isp4: Release queued buffers on error in start_streaming
> - Addressed all code related upstream comments
> - Fix typo errors and other cosmetic issue.
>
>
> Changes v1 -> v2:
>
> - Fix media CI test errors and valid warnings
> - Reduce patch number in the series from 9 to 8 by merging MAINTAINERS adding patch to the first patch
> - In patch 5
> 	- do modification to use remote endpoint instead of local endpoint
> 	- use link frequency and port number as start phy parameter instead of extra added phy-id and phy-bit-rate property of endpoint
>
> ----------
>
> It passes v4l2 compliance test, the test reports for:
>
> (a) amd_isp_capture device /dev/video0
>
> Compliance test for amd_isp_capture device /dev/video0:
> -------------------------------------------------------
>
> atg@atg-HP-PV:~/bin$ ./v4l2-compliance -d /dev/video0
> v4l2-compliance 1.29.0-5348, 64 bits, 64-bit time_t
> v4l2-compliance SHA: 75e3f0e2c2cb 2025-03-17 18:12:17
>
> Compliance test for amd_isp_capture device /dev/video0:
>
> Driver Info:
>          Driver name      : amd_isp_capture
>          Card type        : amd_isp_capture
>          Bus info         : platform:amd_isp_capture
>          Driver version   : 6.14.0
>          Capabilities     : 0xa4200001
>                  Video Capture
>                  I/O MC
>                  Streaming
>                  Extended Pix Format
>                  Device Capabilities
>          Device Caps      : 0x24200001
>                  Video Capture
>                  I/O MC
>                  Streaming
>                  Extended Pix Format
> Media Driver Info:
>          Driver name      : amd_isp_capture
>          Model            : amd_isp41_mdev
>          Serial           :
>          Bus info         : platform:amd_isp_capture
>          Media version    : 6.14.0
>          Hardware revision: 0x00000000 (0)
>          Driver version   : 6.14.0
> Interface Info:
>          ID               : 0x03000005
>          Type             : V4L Video
> Entity Info:
>          ID               : 0x00000003 (3)
>          Name             : Preview
>          Function         : V4L2 I/O
>          Pad 0x01000004   : 0: Sink
>            Link 0x02000007: from remote pad 0x1000002 of entity 'amd isp4' (Image Signal Processor): Data, Enabled, Immutable
>
> Required ioctls:
>          test MC information (see 'Media Driver Info' above): OK
>          test VIDIOC_QUERYCAP: OK
>          test invalid ioctls: OK
>
> Allow for multiple opens:
>          test second /dev/video0 open: OK
>          test VIDIOC_QUERYCAP: OK
>          test VIDIOC_G/S_PRIORITY: OK
>          test for unlimited opens: OK
>
> Debug ioctls:
>          test VIDIOC_DBG_G/S_REGISTER: OK (Not Supported)
>          test VIDIOC_LOG_STATUS: OK (Not Supported)
>
> Input ioctls:
>          test VIDIOC_G/S_TUNER/ENUM_FREQ_BANDS: OK (Not Supported)
>          test VIDIOC_G/S_FREQUENCY: OK (Not Supported)
>          test VIDIOC_S_HW_FREQ_SEEK: OK (Not Supported)
>          test VIDIOC_ENUMAUDIO: OK (Not Supported)
>          test VIDIOC_G/S/ENUMINPUT: OK
>          test VIDIOC_G/S_AUDIO: OK (Not Supported)
>          Inputs: 1 Audio Inputs: 0 Tuners: 0
>
> Output ioctls:
>          test VIDIOC_G/S_MODULATOR: OK (Not Supported)
>          test VIDIOC_G/S_FREQUENCY: OK (Not Supported)
>          test VIDIOC_ENUMAUDOUT: OK (Not Supported)
>          test VIDIOC_G/S/ENUMOUTPUT: OK (Not Supported)
>          test VIDIOC_G/S_AUDOUT: OK (Not Supported)
>          Outputs: 0 Audio Outputs: 0 Modulators: 0
>
> Input/Output configuration ioctls:
>          test VIDIOC_ENUM/G/S/QUERY_STD: OK (Not Supported)
>          test VIDIOC_ENUM/G/S/QUERY_DV_TIMINGS: OK (Not Supported)
>          test VIDIOC_DV_TIMINGS_CAP: OK (Not Supported)
>          test VIDIOC_G/S_EDID: OK (Not Supported)
>
> Control ioctls (Input 0):
>          test VIDIOC_QUERY_EXT_CTRL/QUERYMENU: OK (Not Supported)
>          test VIDIOC_QUERYCTRL: OK (Not Supported)
>          test VIDIOC_G/S_CTRL: OK (Not Supported)
>          test VIDIOC_G/S/TRY_EXT_CTRLS: OK (Not Supported)
>          test VIDIOC_(UN)SUBSCRIBE_EVENT/DQEVENT: OK (Not Supported)
>          test VIDIOC_G/S_JPEGCOMP: OK (Not Supported)
>          Standard Controls: 0 Private Controls: 0
>
> Format ioctls (Input 0):
>          test VIDIOC_ENUM_FMT/FRAMESIZES/FRAMEINTERVALS: OK
>          test VIDIOC_G/S_PARM: OK
>          test VIDIOC_G_FBUF: OK (Not Supported)
>          test VIDIOC_G_FMT: OK
>          test VIDIOC_TRY_FMT: OK
>          test VIDIOC_S_FMT: OK
>          test VIDIOC_G_SLICED_VBI_CAP: OK (Not Supported)
>          test Cropping: OK (Not Supported)
>          test Composing: OK (Not Supported)
>          test Scaling: OK (Not Supported)
>
> Codec ioctls (Input 0):
>          test VIDIOC_(TRY_)ENCODER_CMD: OK (Not Supported)
>          test VIDIOC_G_ENC_INDEX: OK (Not Supported)
>          test VIDIOC_(TRY_)DECODER_CMD: OK (Not Supported)
>
> Buffer ioctls (Input 0):
>          test VIDIOC_REQBUFS/CREATE_BUFS/QUERYBUF: OK
>          test CREATE_BUFS maximum buffers: OK
>          test VIDIOC_REMOVE_BUFS: OK
>          test VIDIOC_EXPBUF: OK
>          test Requests: OK (Not Supported)
>          test blocking wait: OK
>
> Total for amd_isp_capture device /dev/video0: 49, Succeeded: 49, Failed: 0, Warnings: 0
>
> Please review and provide feedback.
>
> Many thanks,
>
> Bin Du (7):
>    media: platform: amd: Introduce amd isp4 capture driver
>    media: platform: amd: low level support for isp4 firmware
>    media: platform: amd: Add isp4 fw and hw interface
>    media: platform: amd: isp4 subdev and firmware loading handling added
>    media: platform: amd: isp4 video node and buffers handling added
>    media: platform: amd: isp4 debug fs logging and  more descriptive
>      errors
>    Documentation: add documentation of AMD isp 4 driver
>
>   Documentation/admin-guide/media/amdisp4-1.rst |   66 +
>   Documentation/admin-guide/media/amdisp4.dot   |    8 +
>   .../admin-guide/media/v4l-drivers.rst         |    1 +
>   MAINTAINERS                                   |   25 +
>   drivers/media/platform/Kconfig                |    1 +
>   drivers/media/platform/Makefile               |    1 +
>   drivers/media/platform/amd/Kconfig            |    3 +
>   drivers/media/platform/amd/Makefile           |    3 +
>   drivers/media/platform/amd/isp4/Kconfig       |   13 +
>   drivers/media/platform/amd/isp4/Makefile      |   10 +
>   drivers/media/platform/amd/isp4/isp4.c        |  237 ++++
>   drivers/media/platform/amd/isp4/isp4.h        |   26 +
>   drivers/media/platform/amd/isp4/isp4_debug.c  |  272 ++++
>   drivers/media/platform/amd/isp4/isp4_debug.h  |   41 +
>   .../platform/amd/isp4/isp4_fw_cmd_resp.h      |  314 +++++
>   drivers/media/platform/amd/isp4/isp4_hw_reg.h |  125 ++
>   .../media/platform/amd/isp4/isp4_interface.c  |  972 +++++++++++++
>   .../media/platform/amd/isp4/isp4_interface.h  |  149 ++
>   drivers/media/platform/amd/isp4/isp4_subdev.c | 1198 ++++++++++++++++
>   drivers/media/platform/amd/isp4/isp4_subdev.h |  133 ++
>   drivers/media/platform/amd/isp4/isp4_video.c  | 1213 +++++++++++++++++
>   drivers/media/platform/amd/isp4/isp4_video.h  |   87 ++
>   22 files changed, 4898 insertions(+)
>   create mode 100644 Documentation/admin-guide/media/amdisp4-1.rst
>   create mode 100644 Documentation/admin-guide/media/amdisp4.dot
>   create mode 100644 drivers/media/platform/amd/Kconfig
>   create mode 100644 drivers/media/platform/amd/Makefile
>   create mode 100644 drivers/media/platform/amd/isp4/Kconfig
>   create mode 100644 drivers/media/platform/amd/isp4/Makefile
>   create mode 100644 drivers/media/platform/amd/isp4/isp4.c
>   create mode 100644 drivers/media/platform/amd/isp4/isp4.h
>   create mode 100644 drivers/media/platform/amd/isp4/isp4_debug.c
>   create mode 100644 drivers/media/platform/amd/isp4/isp4_debug.h
>   create mode 100644 drivers/media/platform/amd/isp4/isp4_fw_cmd_resp.h
>   create mode 100644 drivers/media/platform/amd/isp4/isp4_hw_reg.h
>   create mode 100644 drivers/media/platform/amd/isp4/isp4_interface.c
>   create mode 100644 drivers/media/platform/amd/isp4/isp4_interface.h
>   create mode 100644 drivers/media/platform/amd/isp4/isp4_subdev.c
>   create mode 100644 drivers/media/platform/amd/isp4/isp4_subdev.h
>   create mode 100644 drivers/media/platform/amd/isp4/isp4_video.c
>   create mode 100644 drivers/media/platform/amd/isp4/isp4_video.h
>

