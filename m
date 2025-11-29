Return-Path: <linux-media+bounces-47893-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id E71E3C93711
	for <lists+linux-media@lfdr.de>; Sat, 29 Nov 2025 04:10:26 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 9375F3A8B0B
	for <lists+linux-media@lfdr.de>; Sat, 29 Nov 2025 03:10:25 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0A106223DEC;
	Sat, 29 Nov 2025 03:10:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kerneltoast.com header.i=@kerneltoast.com header.b="Rr3RfJtt"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-qk1-f174.google.com (mail-qk1-f174.google.com [209.85.222.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BE148221DB9
	for <linux-media@vger.kernel.org>; Sat, 29 Nov 2025 03:10:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764385822; cv=none; b=lh/zJv0SqDkBQVgiABdSxXrlEARXC4TTd1FpC1mfb2lEYlxd1i6E4yPusyHmC5pwSzTY2We8ZsUfkt1ZPAM9CeEdQv/ER7E9ho4+hs5TBg/rljyYa0Ny478gWVPWqvvlylMI8CO1gA2HwqnkUjzjWGO7CETmxrINqT5iQFfnZ70=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764385822; c=relaxed/simple;
	bh=wfoWLGCybrI+u/sVVJX23DkRcRN0pnHr8ZWN5lrTG7c=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=UVtkjjcP57Ae92s8YjqbYWb1VVI965Rvw0GCgVkbH28sqVtGreDVdZHmB/Xa8eLW6uLLfF1Z9wL5XJ3gK+0s5ynAB9D3Z/66ZSnh0H/QT4fWWwPJnPJyT9bXPbANqrnDUc/dwadAGVhhgfxRbGIwDeisFTMJzA1KVX3gxfWvCo8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=kerneltoast.com; spf=pass smtp.mailfrom=kerneltoast.com; dkim=pass (2048-bit key) header.d=kerneltoast.com header.i=@kerneltoast.com header.b=Rr3RfJtt; arc=none smtp.client-ip=209.85.222.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=kerneltoast.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kerneltoast.com
Received: by mail-qk1-f174.google.com with SMTP id af79cd13be357-8b2f2c5ec36so241964885a.1
        for <linux-media@vger.kernel.org>; Fri, 28 Nov 2025 19:10:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kerneltoast.com; s=google; t=1764385818; x=1764990618; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=EvlsbkbngJU89nYTX4Rf2TzeNQD4cIGYYT/rSCYXpSo=;
        b=Rr3RfJtt2DGOaXL47OfZncbESDf/9Md3K6jBzmzOx/+OawL66Y9UzFNNZdz2qBXBx4
         3p/XLEWz6R2QEZY7vUaeaZAJggdJKaV56eDjU7P4dCWMx+s1RbozB1mw1ec7QWbkUczf
         2n8BlVyEyqHYlsAQTeqF1lbprjs3hjH8ulosRd7GY+UamZXjOfs5YY4W51VjREUH1Mka
         3/ElC05TfhWqTdKebFzqDqgl/vneK2+5F2DvpunuRqD7qIIP/3UlkKa1eZ4TNcYWD2cG
         S16LCPUtG3qVrzWcl/AnNDcclCssYHrK3a7FSD0R48tbVgVHanR+gxjTnmt3S+n3c9vQ
         g0Cg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764385818; x=1764990618;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=EvlsbkbngJU89nYTX4Rf2TzeNQD4cIGYYT/rSCYXpSo=;
        b=ABhsrRI4mi+V4UXzkUvQqyNsq6LRVoBl1cBu+c6aa1eHIF39e6gowfEBf7yfyES/Hd
         4Okdoq5yrZuiZ/mYyqCKL0Hce822M100dDDOxlvWRpbNlsscTKUFx/wsHLxO19TPRIBm
         H3VgHuejXQEJc2SmOYoaqIeiHDCf5E6A3oHHU7GXk7iY9crljLl+8K1YxhVsb/BZfqKM
         a24X9ZNLkxjrPI4Vb8IPxhGHmxXzrg4nUSA0zayngnURfbktU5K6aYgZODRdR4P/2KK2
         NeIpDm9EN+erG9iujkWpsAOy/1wmG/ntOEVD5yHOFi9a5SeEsszH1ssUx8Z2qMggOE+S
         aHgA==
X-Forwarded-Encrypted: i=1; AJvYcCV5SGu+2MWaK4MYFveFihTuSxObR5SRUBq05I9nuhAzXJjAfbjWpdw4wPPe4K0+Iqbh7K3dDGHnm9gKqQ==@vger.kernel.org
X-Gm-Message-State: AOJu0Yx899KcDt7S9IU4qJbk/vDOTLASyB9GfKVqGV4oX1rjReGkopxz
	TRiUSG4yw4UCH0xzzsimw/bPRCevJG6wmQybt/zIg3yHWvg+BdNxH5BUdFEeQpVWQa40
X-Gm-Gg: ASbGnctVfOPHAedE7QptgN1G50NmKnH29SBX9N+B5fiIh0e2SRNr1YwSDgYdE6aPd1y
	OaG1STnqVYDBWh80UU3dWTo7HUTk/krwbOOEpl8upOZwa9TcGsDD3LRbchVFKwes7VLFv06k+kH
	2fFB9R8MRiIa4pqci1wi1yJSjCHWlWdPArruOHWRysFb4TnvF6DLaCwJnDklTesmHwO64aZ2KFq
	HC8R4GRPqpU9GjHeQaPDl8FD/gE62AOWhskywxI1V4tv6r0WhbEDoiT0+Y8+6/NHrET30kDaBu1
	o76TBOppXqG+7Xjyo0Gr/t3wavDNjoHeRUjH2CHTL5JFu4KPhZqwwUzRkZy7L8u0y1yZbEXi+HB
	JCxm+uCrp8cvYnYXJn4y9xEwZUTQCJAGMbnbPpM0nMIEIWtL4+VcdSphq9MLkPdf6M+QQ4LYX65
	2/PZML+Ob9YI7jBLpH
X-Google-Smtp-Source: AGHT+IHt5Hd7YWYYRivJxjDh5Dl7RKVxfIEW+7cFLpLuK6l+dm63vAtbaf79uWdSPIG4MdvNW35TLQ==
X-Received: by 2002:a05:620a:29c9:b0:8a4:6ac1:aeb with SMTP id af79cd13be357-8b33d5e52ddmr3549674185a.74.1764385818369;
        Fri, 28 Nov 2025 19:10:18 -0800 (PST)
Received: from sultan-box ([2607:fb91:1dc7:976c:2974:c645:2638:1b43])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-8b5299946dbsm430187085a.7.2025.11.28.19.10.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 28 Nov 2025 19:10:17 -0800 (PST)
Date: Fri, 28 Nov 2025 19:09:55 -0800
From: Sultan Alsawaf <sultan@kerneltoast.com>
To: Bin Du <Bin.Du@amd.com>
Cc: mchehab@kernel.org, hverkuil@xs4all.nl,
	laurent.pinchart+renesas@ideasonboard.com,
	bryan.odonoghue@linaro.org, sakari.ailus@linux.intel.com,
	prabhakar.mahadev-lad.rj@bp.renesas.com,
	linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
	pratap.nirujogi@amd.com, benjamin.chan@amd.com, king.li@amd.com,
	gjorgji.rosikopulos@amd.com, Phil.Jawich@amd.com,
	Dominic.Antony@amd.com, mario.limonciello@amd.com,
	richard.gong@amd.com, anson.tsao@amd.com
Subject: Re: [PATCH v6 0/7] Add AMD ISP4 driver
Message-ID: <aSpkA2pGzCwMcCdI@sultan-box>
References: <20251128091929.165272-1-Bin.Du@amd.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="KQI2aslnUu62hlMz"
Content-Disposition: inline
In-Reply-To: <20251128091929.165272-1-Bin.Du@amd.com>


--KQI2aslnUu62hlMz
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Fri, Nov 28, 2025 at 05:19:22PM +0800, Bin Du wrote:
> Hello,
> 
> AMD ISP4 is the AMD image processing gen 4 which can be found in HP ZBook Ultra G1a 14 inch Mobile Workstation PC (Ryzen AI Max 300 Series)
> (https://ubuntu.com/certified/202411-36043)
> This patch series introduces the initial driver support for the AMD ISP4.
> 
> Patch summary:
> - Powers up/off and initializes ISP HW
> - Configures and kicks off ISP FW
> - Interacts with APP using standard V4l2 interface by video node
> - Controls ISP HW and interacts with ISP FW to do image processing
> - Supports enum/set output image format and resolution
> - Supports queueing buffer from app and dequeuing ISP filled buffer to App
> - It is verified on qv4l2, cheese and qcam
> - It is verified together with following patches
> 	platform/x86: Add AMD ISP platform config (https://lore.kernel.org/all/20250514215623.522746-1-pratap.nirujogi@amd.com/)
> 	pinctrl: amd: isp411: Add amdisp GPIO pinctrl (https://github.com/torvalds/linux/commit/e97435ab09f3ad7b6a588dd7c4e45a96699bbb4a)
> 	drm/amd/amdgpu: Add GPIO resources required for amdisp (https://gitlab.freedesktop.org/agd5f/linux/-/commit/ad0f5966ed8297aa47b3184192b00b7379ae0758)
> 	drm/amd/amdgpu: Declare isp firmware binary file (https://gitlab.freedesktop.org/agd5f/linux/-/commit/35345917bc9f7c86152b270d9d93c220230b667f)
> 
> AMD ISP4 Key features:
> - Processes bayer raw data from the connected sensor and output them to different YUV formats
> - Downscale input image to different output image resolution
> - Pipeline to do image processing on the input image including demosaic, denoise, 3A, etc.
> 
> ----------
> 
> Changes v5 -> v6:
> 
> - Lowered FW mempool buffer size from 200M to 100M (actual usage).
> - Added an irq_enabled member to the ISP subdev for proper IRQ disable handling in both normal and error cases.
> - Removed unnecessary .owner assignment from isp4_capture_drv definition
> - Updated IRQ handling to enable and disable interrupts via the ISP register for improved performance.
> - Revised ring buffer management in isp4if_f2h_resp(), addressing safety checks to ensure the read pointer is validated before memcpy operations, reducing the risk of out-of-bounds access. The ring buffer logic was also streamlined significantly.
> - Modified ring buffer handling in isp4if_is_cmdq_rb_full(), correcting an off-by-one error in safety checks that previously allowed rd_ptr to equal wr_ptr when the buffer was full.
> - Refactored ring buffer handling in isp4if_insert_isp_fw_cmd(), simplifying overall logic.
> - Resolved a regression from v4 to v5 where isp4if_dequeue_buffer() did not protect list_del with bufq_lock.
> - Addressed a subtle use-after-free issue that could occur if a timeout on a synchronous command coincided with completion.
> - Added missing pm_runtime_disable() calls to isp4_capture_remove() and to the error path in isp4_capture_probe().
> - Removed stray semicolons following closing curly braces.
> - Improved and clarified macro definitions in isp4_interface.h.
> - Eliminated unnecessary (u8 *) casts.
> - Added missing memset for firmware command structures in isp4sd_stop_stream().
> - Excluded streams 2 and 3 from ISP4IF_FW_RESP_RB_IRQ_EN_MASK, preventing their activation in the interrupt enable register.
> - Enhanced error handling to clean up kthreads in the event of startup failure.
> - Corrected a race condition during kthread creation where waitqueue head initialization could be delayed, as it was performed by the kthread itself.
> - Removed status checks in isp4sd_pwroff_and_deinit() that were always false.
> - Ensured isp4sd_init_stream() is only invoked once per stream start and reordered corresponding status checks in isp4sd_start_stream().
> - Improved error handling in isp4sd_start_stream() to propagate errors from failed functions.
> - Relocated debugging messages in isp4sd_stop_stream() to execute under lock protection due to access to output_info->start_status.
> - Eliminated redundant GET_REG_BASE() macros.
> - Removed isp4sd_is_stream_running() function.
> - Corrected error message in isp4sd_init_stream() caused by copy/paste.
> - Refined struct isp4_interface to remove firmware ring buffer configurations.
> - Removed obsolete isp4sd_is_stream_running function.
> - Removed pdev member from struct isp4_device, as it is unnecessary.
> - Fixed typo in 'isp_mmip' parameter name within isp4if_init().
> - Removed gap in struct isp4_subdev definition.
> - Performed extensive dead code removal and minor style improvements throughout the codebase.
> 
> 
> Changes v4 -> v5:
> 
> - Transitioned VIDEOBUF2_V4L2 from 'depends' to 'select' within Kconfig.
> - Standardized object file naming conventions in the Makefile and sorted entries alphabetically.
> - Removed the unused macro definition to_isp4_device.
> - Eliminated unused members mem_domain and mem_align from struct isp4if_gpu_mem_info.
> - Deleted unused fields mc_addr and gpu_pkg from struct isp4if_cmd_element.
> - Removed obsolete pltf_data, i2c_nb, and notifier elements from struct isp4_device.
> - Updated platform_get_irq failure handling to return its actual result rather than -ENODEV.
> - Refined inclusion of header files for clarity and efficiency.
> - Appended comments following #endif statements in header files.
> - Improved implementation of isp4if_gpu_mem_free and isp4if_dealloc_fw_gpumem.
> - Removed isp4if_append_cmd_2_cmdq and revised isp4if_send_fw_cmd accordingly.
> - Enhanced isp4if_clear_cmdq and isp4if_clear_bufq by eliminating unnecessary list_del operations.
> - Adopted completion mechanism instead of wait queue and condition for command completion notifications.
> - Employed memset to ensure proper zeroing of padding bits in structures shared between ISP driver and firmware.
> - Streamlined IRQs, reducing total from four to two, retaining only essential ones.
> - Optimized IRQ handler logic using a while loop for greater efficiency.
> - Introduced dynamic IRQ enable/disable functionality based on camera status (open/close).
> - Applied distinct identifiers to differentiate multiple threads and IRQs.
> - Removed unnecessary initialization of local variables.
> - Refined camera start/stop workflow to mitigate potential synchronization concerns.
> - Replaced all remaining mutex with guard mutex.
> - Enhanced command and buffer queue performance by substituting mutexes with spinlocks.
> - Removed redundant isp4sd_init_meta_buf function and its references.
> - Limited firmware logging activities to the stream1 thread.
> - Relocated v4l2_device_unregister_subdev() and media_entity_cleanup() calls from isp4_capture_remove to isp4sd_deinit.
> - Resolved media device registration sequence issues.
> - Modified stream processing thread behavior to await IRQ without a timeout.
> - Addressed cleanup procedures in video device initialization and deinitialization routines.
> - Corrected typos and made other cosmetic improvements.
> 
> 
> Changes v3 -> v4:
> 
> - Replace one mutex with guard mutex.
> - Remove unnecessary bus_info initialization of v4l2_capability.
> - Drop V4L2_CAP_IO_MC from capabilities of v4l2_capability.
> - Modify document with better SOC description.
> - Fix Test x86 failure in Media CI test https://linux-media.pages.freedesktop.org/-/users/patchwork/-/jobs/83470456/artifacts/report.htm
> - Modify some commit messages by describing changes in imperative mood.
> - Add media-ctl output in cover letter.
> - Create separated dedicated amdgpu patch to add declaration MODULE_FIRMWARE("amdgpu/isp_4_1_1.bin");
> - Fix typo errors and other cosmetic issues.
> - Add DRM_AMD_ISP dependency in Kconfig.
> 
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
>       media: amd: isp4: Add missing refcount tracking to mmap memop
>       media: amd: isp4: Don't put or unmap the dmabuf when detaching
>       media: amd: isp4: Don't increment refcount when dmabuf export fails
>       media: amd: isp4: Fix possible use-after-free in isp4vid_vb2_put()
>       media: amd: isp4: Always export a new dmabuf from get_dmabuf memop
>       media: amd: isp4: Fix implicit dmabuf lifetime tracking
>       media: amd: isp4: Fix possible use-after-free when putting implicit dmabuf
>       media: amd: isp4: Simplify isp4vid_get_dmabuf() arguments
>       media: amd: isp4: Move up buf->vaddr check in isp4vid_get_dmabuf()
>       media: amd: isp4: Remove unused userptr memops
>       media: amd: isp4: Add missing cleanup on error in isp4vid_vb2_alloc()
>       media: amd: isp4: Release queued buffers on error in start_streaming
> - Addressed all code related upstream comments
> - Fix typo errors and other cosmetic issues.
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
>         Driver name      : amd_isp_capture
>         Card type        : amd_isp_capture
>         Bus info         : platform:amd_isp_capture
>         Driver version   : 6.14.0
>         Capabilities     : 0xa4200001
>                 Video Capture
>                 I/O MC
>                 Streaming
>                 Extended Pix Format
>                 Device Capabilities
>         Device Caps      : 0x24200001
>                 Video Capture
>                 I/O MC
>                 Streaming
>                 Extended Pix Format
> Media Driver Info:
>         Driver name      : amd_isp_capture
>         Model            : amd_isp41_mdev
>         Serial           :
>         Bus info         : platform:amd_isp_capture
>         Media version    : 6.14.0
>         Hardware revision: 0x00000000 (0)
>         Driver version   : 6.14.0
> Interface Info:
>         ID               : 0x03000005
>         Type             : V4L Video
> Entity Info:
>         ID               : 0x00000003 (3)
>         Name             : Preview
>         Function         : V4L2 I/O
>         Pad 0x01000004   : 0: Sink
>           Link 0x02000007: from remote pad 0x1000002 of entity 'amd isp4' (Image Signal Processor): Data, Enabled, Immutable
> 
> Required ioctls:
>         test MC information (see 'Media Driver Info' above): OK
>         test VIDIOC_QUERYCAP: OK
>         test invalid ioctls: OK
> 
> Allow for multiple opens:
>         test second /dev/video0 open: OK
>         test VIDIOC_QUERYCAP: OK
>         test VIDIOC_G/S_PRIORITY: OK
>         test for unlimited opens: OK
> 
> Debug ioctls:
>         test VIDIOC_DBG_G/S_REGISTER: OK (Not Supported)
>         test VIDIOC_LOG_STATUS: OK (Not Supported)
> 
> Input ioctls:
>         test VIDIOC_G/S_TUNER/ENUM_FREQ_BANDS: OK (Not Supported)
>         test VIDIOC_G/S_FREQUENCY: OK (Not Supported)
>         test VIDIOC_S_HW_FREQ_SEEK: OK (Not Supported)
>         test VIDIOC_ENUMAUDIO: OK (Not Supported)
>         test VIDIOC_G/S/ENUMINPUT: OK
>         test VIDIOC_G/S_AUDIO: OK (Not Supported)
>         Inputs: 1 Audio Inputs: 0 Tuners: 0
> 
> Output ioctls:
>         test VIDIOC_G/S_MODULATOR: OK (Not Supported)
>         test VIDIOC_G/S_FREQUENCY: OK (Not Supported)
>         test VIDIOC_ENUMAUDOUT: OK (Not Supported)
>         test VIDIOC_G/S/ENUMOUTPUT: OK (Not Supported)
>         test VIDIOC_G/S_AUDOUT: OK (Not Supported)
>         Outputs: 0 Audio Outputs: 0 Modulators: 0
> 
> Input/Output configuration ioctls:
>         test VIDIOC_ENUM/G/S/QUERY_STD: OK (Not Supported)
>         test VIDIOC_ENUM/G/S/QUERY_DV_TIMINGS: OK (Not Supported)
>         test VIDIOC_DV_TIMINGS_CAP: OK (Not Supported)
>         test VIDIOC_G/S_EDID: OK (Not Supported)
> 
> Control ioctls (Input 0):
>         test VIDIOC_QUERY_EXT_CTRL/QUERYMENU: OK (Not Supported)
>         test VIDIOC_QUERYCTRL: OK (Not Supported)
>         test VIDIOC_G/S_CTRL: OK (Not Supported)
>         test VIDIOC_G/S/TRY_EXT_CTRLS: OK (Not Supported)
>         test VIDIOC_(UN)SUBSCRIBE_EVENT/DQEVENT: OK (Not Supported)
>         test VIDIOC_G/S_JPEGCOMP: OK (Not Supported)
>         Standard Controls: 0 Private Controls: 0
> 
> Format ioctls (Input 0):
>         test VIDIOC_ENUM_FMT/FRAMESIZES/FRAMEINTERVALS: OK
>         test VIDIOC_G/S_PARM: OK
>         test VIDIOC_G_FBUF: OK (Not Supported)
>         test VIDIOC_G_FMT: OK
>         test VIDIOC_TRY_FMT: OK
>         test VIDIOC_S_FMT: OK
>         test VIDIOC_G_SLICED_VBI_CAP: OK (Not Supported)
>         test Cropping: OK (Not Supported)
>         test Composing: OK (Not Supported)
>         test Scaling: OK (Not Supported)
> 
> Codec ioctls (Input 0):
>         test VIDIOC_(TRY_)ENCODER_CMD: OK (Not Supported)
>         test VIDIOC_G_ENC_INDEX: OK (Not Supported)
>         test VIDIOC_(TRY_)DECODER_CMD: OK (Not Supported)
> 
> Buffer ioctls (Input 0):
>         test VIDIOC_REQBUFS/CREATE_BUFS/QUERYBUF: OK
>         test CREATE_BUFS maximum buffers: OK
>         test VIDIOC_REMOVE_BUFS: OK
>         test VIDIOC_EXPBUF: OK
>         test Requests: OK (Not Supported)
>         test blocking wait: OK
> 
> Total for amd_isp_capture device /dev/video0: 49, Succeeded: 49, Failed: 0, Warnings: 0
> 
> The media-ctl output of media device /dev/media0:
> -------------------------------------------------------
> 
> atg@atg-HP-PV:~$ media-ctl -p -d /dev/media0
> Media controller API version 6.17.0
> 
> Media device information
> ------------------------
> driver          amd_isp_capture
> model           amd_isp41_mdev
> serial
> bus info        platform:amd_isp_capture
> hw revision     0x0
> driver version  6.17.0
> 
> Device topology
> - entity 1: amd isp4 (1 pad, 1 link, 0 routes)
>             type V4L2 subdev subtype Unknown flags 0
>         pad0: Source
>                 -> "Preview":0 [ENABLED,IMMUTABLE]
> 
> - entity 3: Preview (1 pad, 1 link)
>             type Node subtype V4L flags 0
>             device node name /dev/video0
>         pad0: Sink
>                 <- "amd isp4":0 [ENABLED,IMMUTABLE]
> 
> Please review and provide feedback.
> 
> Many thanks,
> 
> Bin Du (7):
>   media: platform: amd: Introduce amd isp4 capture driver
>   media: platform: amd: low level support for isp4 firmware
>   media: platform: amd: Add isp4 fw and hw interface
>   media: platform: amd: isp4 subdev and firmware loading handling added
>   media: platform: amd: isp4 video node and buffers handling added
>   media: platform: amd: isp4 debug fs logging and  more descriptive
>     errors
>   Documentation: add documentation of AMD isp 4 driver
> 
>  Documentation/admin-guide/media/amdisp4-1.rst |   63 +
>  Documentation/admin-guide/media/amdisp4.dot   |    6 +
>  .../admin-guide/media/v4l-drivers.rst         |    1 +
>  MAINTAINERS                                   |   25 +
>  drivers/media/platform/Kconfig                |    1 +
>  drivers/media/platform/Makefile               |    1 +
>  drivers/media/platform/amd/Kconfig            |    3 +
>  drivers/media/platform/amd/Makefile           |    3 +
>  drivers/media/platform/amd/isp4/Kconfig       |   14 +
>  drivers/media/platform/amd/isp4/Makefile      |   10 +
>  drivers/media/platform/amd/isp4/isp4.c        |  234 ++++
>  drivers/media/platform/amd/isp4/isp4.h        |   20 +
>  drivers/media/platform/amd/isp4/isp4_debug.c  |  271 ++++
>  drivers/media/platform/amd/isp4/isp4_debug.h  |   41 +
>  .../platform/amd/isp4/isp4_fw_cmd_resp.h      |  314 +++++
>  drivers/media/platform/amd/isp4/isp4_hw_reg.h |  124 ++
>  .../media/platform/amd/isp4/isp4_interface.c  |  787 +++++++++++
>  .../media/platform/amd/isp4/isp4_interface.h  |  140 ++
>  drivers/media/platform/amd/isp4/isp4_subdev.c | 1087 ++++++++++++++++
>  drivers/media/platform/amd/isp4/isp4_subdev.h |  130 ++
>  drivers/media/platform/amd/isp4/isp4_video.c  | 1158 +++++++++++++++++
>  drivers/media/platform/amd/isp4/isp4_video.h  |   65 +
>  22 files changed, 4498 insertions(+)
>  create mode 100644 Documentation/admin-guide/media/amdisp4-1.rst
>  create mode 100644 Documentation/admin-guide/media/amdisp4.dot
>  create mode 100644 drivers/media/platform/amd/Kconfig
>  create mode 100644 drivers/media/platform/amd/Makefile
>  create mode 100644 drivers/media/platform/amd/isp4/Kconfig
>  create mode 100644 drivers/media/platform/amd/isp4/Makefile
>  create mode 100644 drivers/media/platform/amd/isp4/isp4.c
>  create mode 100644 drivers/media/platform/amd/isp4/isp4.h
>  create mode 100644 drivers/media/platform/amd/isp4/isp4_debug.c
>  create mode 100644 drivers/media/platform/amd/isp4/isp4_debug.h
>  create mode 100644 drivers/media/platform/amd/isp4/isp4_fw_cmd_resp.h
>  create mode 100644 drivers/media/platform/amd/isp4/isp4_hw_reg.h
>  create mode 100644 drivers/media/platform/amd/isp4/isp4_interface.c
>  create mode 100644 drivers/media/platform/amd/isp4/isp4_interface.h
>  create mode 100644 drivers/media/platform/amd/isp4/isp4_subdev.c
>  create mode 100644 drivers/media/platform/amd/isp4/isp4_subdev.h
>  create mode 100644 drivers/media/platform/amd/isp4/isp4_video.c
>  create mode 100644 drivers/media/platform/amd/isp4/isp4_video.h
> 
> -- 
> 2.34.1
> 

Hi Bin,

I have attached a small patch with a fix for an old issue I noticed now while
reading the v6 code and some remaining style nitpicks addressed. And some
duplicated code on stream stop removed.

This is the last change from me, I promise. :)

Otherwise, v6 is looking very good! Good catches with the error handling too,
with the irq_enabled flag and v4l2_device_register() error cleanup.

Thanks,
Sultan

--KQI2aslnUu62hlMz
Content-Type: text/plain; charset=us-ascii
Content-Disposition: attachment;
	filename=media-platform-amd-Small-subdev-changes-on-top-of-v6.patch

From ccd92ac77ba5875ca25e9928d12858232fce17ba Mon Sep 17 00:00:00 2001
From: Sultan Alsawaf <sultan@kerneltoast.com>
Date: Fri, 28 Nov 2025 18:40:33 -0800
Subject: [PATCH] media: platform: amd: Small subdev changes on top of v6
 driver

-Fixed buf_sent_cnt not getting reset when the stream is stopped, even
 though start_stream_cmd_sent would get reset
-Removed duplicate start_stream_cmd_sent and buf_sent_cnt reset in
 isp4sd_pwron_and_init(), the same two lines appear lower in the function
 and the duplication isn't needed
-Removed duplicate call to isp4sd_reset_stream_info() when the stream is
 stopped. Achieved this and removed duplicate status setting in the process
 by rolling isp4sd_reset_stream_info() and isp4sd_reset_camera_info() into
 isp4sd_uninit_stream()
-Removed always-false status check in isp4sd_uninit_stream()
-A few small style cleanups

Signed-off-by: Sultan Alsawaf <sultan@kerneltoast.com>
---
 drivers/media/platform/amd/isp4/isp4_subdev.c | 70 +++++--------------
 1 file changed, 19 insertions(+), 51 deletions(-)

diff --git a/drivers/media/platform/amd/isp4/isp4_subdev.c b/drivers/media/platform/amd/isp4/isp4_subdev.c
index 2612ca283fc0..7d48ad0d5c42 100644
--- a/drivers/media/platform/amd/isp4/isp4_subdev.c
+++ b/drivers/media/platform/amd/isp4/isp4_subdev.c
@@ -60,7 +60,7 @@ static int isp4sd_setup_fw_mem_pool(struct isp4_subdev *isp_subdev)
 	isp4if_split_addr64(ispif->fw_mem_pool->gpu_mc_addr,
 			    &buf_type.buffer.buf_base_a_lo,
 			    &buf_type.buffer.buf_base_a_hi);
-	buf_type.buffer.buf_size_a = (u32)ispif->fw_mem_pool->mem_size;
+	buf_type.buffer.buf_size_a = ispif->fw_mem_pool->mem_size;
 
 	ret = isp4if_send_command(ispif, CMD_ID_SEND_BUFFER,
 				  &buf_type, sizeof(buf_type));
@@ -124,10 +124,10 @@ static int isp4sd_send_meta_buf(struct isp4_subdev *isp_subdev)
 		}
 		buf_type.buffer_type = BUFFER_TYPE_META_INFO;
 		buf_type.buffer.vmid_space.bit.space = ADDR_SPACE_TYPE_GPU_VA;
-		isp4if_split_addr64(isp_subdev->ispif.meta_info_buf[i]->gpu_mc_addr,
+		isp4if_split_addr64(meta_info_buf->gpu_mc_addr,
 				    &buf_type.buffer.buf_base_a_lo,
 				    &buf_type.buffer.buf_base_a_hi);
-		buf_type.buffer.buf_size_a = (u32)isp_subdev->ispif.meta_info_buf[i]->mem_size;
+		buf_type.buffer.buf_size_a = meta_info_buf->mem_size;
 		ret = isp4if_send_command(ispif, CMD_ID_SEND_BUFFER,
 					  &buf_type, sizeof(buf_type));
 		if (ret) {
@@ -205,8 +205,7 @@ static int isp4sd_kickoff_stream(struct isp4_subdev *isp_subdev, u32 w, u32 h)
 	sensor_info->status = ISP4SD_START_STATUS_OFF;
 
 	if (!sensor_info->start_stream_cmd_sent &&
-	    sensor_info->buf_sent_cnt >=
-	    ISP4SD_MIN_BUF_CNT_BEF_START_STREAM) {
+	    sensor_info->buf_sent_cnt >= ISP4SD_MIN_BUF_CNT_BEF_START_STREAM) {
 		int ret = isp4if_send_command(ispif, CMD_ID_START_STREAM,
 					      NULL, 0);
 		if (ret) {
@@ -324,7 +323,7 @@ static int isp4sd_init_stream(struct isp4_subdev *isp_subdev)
 	struct device *dev = isp_subdev->dev;
 	int ret;
 
-	ret  = isp4sd_setup_fw_mem_pool(isp_subdev);
+	ret = isp4sd_setup_fw_mem_pool(isp_subdev);
 	if (ret) {
 		dev_err(dev, "fail to setup fw mem pool\n");
 		return ret;
@@ -339,10 +338,12 @@ static int isp4sd_init_stream(struct isp4_subdev *isp_subdev)
 	return 0;
 }
 
-static void isp4sd_reset_stream_info(struct isp4_subdev *isp_subdev,
-				     struct v4l2_subdev_state *state, u32 pad)
+static void isp4sd_uninit_stream(struct isp4_subdev *isp_subdev,
+				 struct v4l2_subdev_state *state, u32 pad)
 {
 	struct isp4sd_sensor_info *sensor_info = &isp_subdev->sensor_info;
+	struct isp4sd_output_info *output_info = &sensor_info->output_info;
+	struct isp4_interface *ispif = &isp_subdev->ispif;
 	struct v4l2_mbus_framefmt *format;
 
 	format = v4l2_subdev_state_get_format(state, pad, 0);
@@ -353,35 +354,14 @@ static void isp4sd_reset_stream_info(struct isp4_subdev *isp_subdev,
 		format->code = MEDIA_BUS_FMT_YUYV8_1_5X8;
 	}
 
-	sensor_info->output_info.start_status = ISP4SD_START_STATUS_OFF;
-}
-
-static void isp4sd_reset_camera_info(struct isp4_subdev *isp_subdev,
-				     struct v4l2_subdev_state *state, u32 pad)
-{
-	struct isp4sd_sensor_info *sensor_info = &isp_subdev->sensor_info;
-
-	sensor_info->status = ISP4SD_START_STATUS_OFF;
-	isp4sd_reset_stream_info(isp_subdev, state, pad);
+	isp4if_clear_bufq(ispif);
+	isp4if_clear_cmdq(ispif);
 
 	sensor_info->start_stream_cmd_sent = false;
-}
-
-static int isp4sd_uninit_stream(struct isp4_subdev *isp_subdev,
-				struct v4l2_subdev_state *state, u32 pad)
-{
-	struct isp4sd_output_info *output_info = &isp_subdev->sensor_info.output_info;
-	struct isp4_interface *ispif = &isp_subdev->ispif;
-	struct device *dev = isp_subdev->dev;
-
-	if (output_info->start_status == ISP4SD_START_STATUS_STARTED) {
-		dev_dbg(dev, "fail for stream is still running\n");
-		return -EINVAL;
-	}
+	sensor_info->buf_sent_cnt = 0;
 
-	isp4sd_reset_camera_info(isp_subdev, state, pad);
-	isp4if_clear_cmdq(ispif);
-	return 0;
+	sensor_info->status = ISP4SD_START_STATUS_OFF;
+	output_info->start_status = ISP4SD_START_STATUS_OFF;
 }
 
 static void isp4sd_fw_resp_cmd_done(struct isp4_subdev *isp_subdev,
@@ -461,7 +441,7 @@ static void isp4sd_fw_resp_frame_done(struct isp4_subdev *isp_subdev,
 	struct device *dev = isp_subdev->dev;
 	struct isp4if_img_buf_node *prev;
 	struct isp4fw_meta_info *meta;
-	u64 mc = 0;
+	u64 mc;
 
 	mc = isp4if_join_addr64(para->package_addr_lo, para->package_addr_hi);
 	meta = isp4sd_get_meta_by_mc(isp_subdev, mc);
@@ -685,9 +665,6 @@ static int isp4sd_pwron_and_init(struct isp4_subdev *isp_subdev)
 
 	isp4sd_module_enable(isp_subdev, true);
 
-	isp_subdev->sensor_info.start_stream_cmd_sent = false;
-	isp_subdev->sensor_info.buf_sent_cnt = 0;
-
 	if (ispif->status < ISP4IF_STATUS_PWR_ON) {
 		unsigned int perf_state = ISP4SD_PERFORMANCE_STATE_HIGH;
 
@@ -739,17 +716,17 @@ static int isp4sd_pwron_and_init(struct isp4_subdev *isp_subdev)
 static int isp4sd_stop_stream(struct isp4_subdev *isp_subdev,
 			      struct v4l2_subdev_state *state, u32 pad)
 {
-	struct isp4sd_output_info *output_info =
-			&isp_subdev->sensor_info.output_info;
+	struct isp4sd_sensor_info *sensor_info = &isp_subdev->sensor_info;
+	struct isp4sd_output_info *output_info = &sensor_info->output_info;
 	struct isp4_interface *ispif = &isp_subdev->ispif;
 	struct device *dev = isp_subdev->dev;
-	int ret = 0;
 
 	guard(mutex)(&isp_subdev->ops_mutex);
 	dev_dbg(dev, "status %i\n", output_info->start_status);
 
 	if (output_info->start_status == ISP4SD_START_STATUS_STARTED) {
 		struct isp4fw_cmd_enable_out_ch cmd_ch_disable;
+		int ret;
 
 		/*
 		 * The struct will be shared with ISP FW, use memset() to guarantee
@@ -774,11 +751,6 @@ static int isp4sd_stop_stream(struct isp4_subdev *isp_subdev,
 			dev_dbg(dev, "wait stop stream suc\n");
 	}
 
-	isp4if_clear_bufq(ispif);
-
-	output_info->start_status = ISP4SD_START_STATUS_OFF;
-	isp4sd_reset_stream_info(isp_subdev, state, pad);
-
 	isp4sd_uninit_stream(isp_subdev, state, pad);
 
 	/*
@@ -870,7 +842,6 @@ static int isp4sd_ioc_send_img_buf(struct v4l2_subdev *sd,
 		    ISP4SD_MIN_BUF_CNT_BEF_START_STREAM) {
 			ret = isp4if_send_command(ispif, CMD_ID_START_STREAM,
 						  NULL, 0);
-
 			if (ret) {
 				dev_err(dev, "fail to START_STREAM");
 				goto error_release_buf_node;
@@ -1000,8 +971,8 @@ static const struct isp4vid_ops isp4sd_isp4vid_ops = {
 int isp4sd_init(struct isp4_subdev *isp_subdev, struct v4l2_device *v4l2_dev,
 		int irq[ISP4SD_MAX_FW_RESP_STREAM_NUM])
 {
+	struct isp4sd_sensor_info *sensor_info = &isp_subdev->sensor_info;
 	struct isp4_interface *ispif = &isp_subdev->ispif;
-	struct isp4sd_sensor_info *sensor_info;
 	struct device *dev = v4l2_dev->dev;
 	int ret;
 
@@ -1034,12 +1005,9 @@ int isp4sd_init(struct isp4_subdev *isp_subdev, struct v4l2_device *v4l2_dev,
 		goto err_media_clean_up;
 	}
 
-	sensor_info = &isp_subdev->sensor_info;
-
 	isp4if_init(ispif, dev, isp_subdev->mmio);
 
 	mutex_init(&isp_subdev->ops_mutex);
-	sensor_info->start_stream_cmd_sent = false;
 	sensor_info->status = ISP4SD_START_STATUS_OFF;
 
 	/* create ISP enable gpio control */
-- 
2.52.0


--KQI2aslnUu62hlMz--

