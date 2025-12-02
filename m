Return-Path: <linux-media+bounces-48016-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id D47F8C9A69F
	for <lists+linux-media@lfdr.de>; Tue, 02 Dec 2025 08:22:35 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 8D7033A540C
	for <lists+linux-media@lfdr.de>; Tue,  2 Dec 2025 07:22:34 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 872F02FD7CA;
	Tue,  2 Dec 2025 07:22:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kerneltoast.com header.i=@kerneltoast.com header.b="DFEbafcu"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-pg1-f173.google.com (mail-pg1-f173.google.com [209.85.215.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 51B2224E4C4
	for <linux-media@vger.kernel.org>; Tue,  2 Dec 2025 07:22:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764660149; cv=none; b=cvAVrccUgC+l2cyEJfWY+x+3iNT1pcx515+cR6KcWTe7B/Hks6ljxUQKpoyOHFb2J2AytJne+CiE9N/YLgAlbom0rqPJwUsce6L17GHS4gR3nTzGyI2WxfU0AqjVQLO0tlYpPmusdWmE/S/jQ0VdxERRS8RLSWcgBgigUka5lnY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764660149; c=relaxed/simple;
	bh=QN1ZgNMcLc5M2oYf+skdXj6YROXcsrI8FTn09x3kBDA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Z2TmDJswyswCpXHKAt2/TnMx+iMjDv06X2vUgNZqsFvULr9MXG0cugAxGIUTSk+K7mJVjutivVMs4NxAZtWa9DCSefbkPGxwxDsnJp7FLzeJ8hpxa53BSkgwA5SoG10S2Z/3dNJmBc1MkYWeSj+B/3ju5lzf7hxF8mxZOLs62H8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=kerneltoast.com; spf=pass smtp.mailfrom=kerneltoast.com; dkim=pass (2048-bit key) header.d=kerneltoast.com header.i=@kerneltoast.com header.b=DFEbafcu; arc=none smtp.client-ip=209.85.215.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=kerneltoast.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kerneltoast.com
Received: by mail-pg1-f173.google.com with SMTP id 41be03b00d2f7-bc8ceb76c04so3391816a12.1
        for <linux-media@vger.kernel.org>; Mon, 01 Dec 2025 23:22:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kerneltoast.com; s=google; t=1764660145; x=1765264945; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=fxvnQ4Lm9QlG5FDAGzQHgiwVgAZbYoUCEXPoW9iMbc0=;
        b=DFEbafcuIny38gn+wo5zsD1ajBLk6SZlz7bYgFsSt8YxUGqIqQwxqMIqicY4iYKgG3
         Q0sM7cz5p1RFWTKMWp84wVwMsqH9jtu7sx53Q4y4YuZw/xAyuHxxaDvi0FeuuOn0xien
         bGqI/TxW2Um5hzrRazeXFtjvPbB9VXV359Q3LZlBBg8XjnwHnq2aM00h4mKh7n9gnbeP
         dKEo0VOOOeaFRjzW7jjxk4SgLjXCs1hFtyn1kzWq1c1Fzan3WC/PR3pk3OFvD2Bi8nPT
         HG1AFtToavnk/X229DMY6zrLevWzzfDwtFfdhiQP91J6Gh6u8hruJ/ewNKPcxJ86Usn5
         6MjQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764660145; x=1765264945;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=fxvnQ4Lm9QlG5FDAGzQHgiwVgAZbYoUCEXPoW9iMbc0=;
        b=AD6Il/fFTaHpsVnABFoaJWJVgIX4F1YhV0Vqxk2QY3u/rKRgxt3XmG2Oi/JZgBtq6D
         ebiEwWD0CqbHGuxgFkPZenov5DRr+mrEZezvR+lxuNmAWZFLjzcNxmSXUYHMr628yufo
         v9nH20OgOVSV0xfnn9cFqagPiUKfRF79pS+/Tn10V+89qbN6mUBiQ7TFeom8+YAuFkOX
         6yUm+ftDERskQjgIgDzZhft2ooUpH8ObV9ML63UR+dApvx3GmUplIpzjPtVFm9VOJEzC
         Qy0R5W8MUJp7ap8CisWKS5vfL7Oy2MIAajZ4rJPxSfhi4z2/qvhxNvwiVmex3tUCmIOS
         uqfg==
X-Forwarded-Encrypted: i=1; AJvYcCV3QrLJHSyzG6ScTJcl+TaPSpqtNZN15zQ704dq23Zo7H4E5XGIw9ZmgtY+vc0aswK9yqK2cCUsghkoBA==@vger.kernel.org
X-Gm-Message-State: AOJu0YzzymswKDxel0jL2C2p8qP309IrpRIBEqX6eVjKWkYTIztRyYuX
	tqdth5VxbUgpwZCAB6cpFHXNcG0cZj0YhSlHVo2n3RFXDCP4RJpUAKT0n0T/CCL4Hw0j
X-Gm-Gg: ASbGncvp2Rc2dqdGPM3qZOJCwhikvH2I7j3oaxFkxzNitCjaJEXYm2K/czgcPdQSZVf
	OVlwFyZNh2qfa7SylnrY9p4cMP9q0Po54y19IQT9FvCn4w8MNBVRrMHWDEhPKfWtwxwgWV5j5N4
	xnpr1d4gxlqTvfzpw/cEIjiHhGBsXRgv5akLOjaMb/6TsZAEKeWH7cEhlFm280VWMQmsxailI3/
	raLIRkor6O5SyqcjIXutBEoi6IwWUIN8V1wVt7iVADMsHnxPyP67KhqRU7b0EQCbeV+sKiKTMrD
	04usbn7DfYzMaALOHSvItY8tArKyroZPOrl7zcYfYXVds839uAfZBkmZX3HFjjWbXK7jnBMZLR4
	Li1kQ4i8XAdyT/OJ19s7hf86CfQhUhpxD+/DxIjNciVc2xbdnS0BZUNV6XAwikN87sUV9rmdeF9
	yg+CMXxhY9emgVD7i/WMXvJx/1
X-Google-Smtp-Source: AGHT+IHMYdfJy/H40fnCS8MzOntykPvjqbyuAnrsCMCbnTHufKHhKxeuVcpfZ30+KCh7TOIfByEVpA==
X-Received: by 2002:a05:693c:808d:b0:2a4:3593:c7d4 with SMTP id 5a478bee46e88-2a7195cb24amr22615515eec.20.1764660145072;
        Mon, 01 Dec 2025 23:22:25 -0800 (PST)
Received: from sultan-box ([142.147.89.233])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-2a9653ca11esm51072946eec.0.2025.12.01.23.22.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 01 Dec 2025 23:22:24 -0800 (PST)
Date: Mon, 1 Dec 2025 23:22:20 -0800
From: Sultan Alsawaf <sultan@kerneltoast.com>
To: "Du, Bin" <bin.du@amd.com>
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
Message-ID: <aS6TrNMyPXq9i9kY@sultan-box>
References: <20251128091929.165272-1-Bin.Du@amd.com>
 <aSpkA2pGzCwMcCdI@sultan-box>
 <f5e80d6a-da3e-4596-8779-00094e5794a7@amd.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <f5e80d6a-da3e-4596-8779-00094e5794a7@amd.com>

On Mon, Dec 01, 2025 at 02:16:22PM +0800, Du, Bin wrote:
> 
> 
> On 11/29/2025 11:09 AM, Sultan Alsawaf wrote:
> > On Fri, Nov 28, 2025 at 05:19:22PM +0800, Bin Du wrote:
> > > Hello,
> > > 
> > > AMD ISP4 is the AMD image processing gen 4 which can be found in HP ZBook Ultra G1a 14 inch Mobile Workstation PC (Ryzen AI Max 300 Series)
> > > (https://ubuntu.com/certified/202411-36043)
> > > This patch series introduces the initial driver support for the AMD ISP4.
> > > 
> > > Patch summary:
> > > - Powers up/off and initializes ISP HW
> > > - Configures and kicks off ISP FW
> > > - Interacts with APP using standard V4l2 interface by video node
> > > - Controls ISP HW and interacts with ISP FW to do image processing
> > > - Supports enum/set output image format and resolution
> > > - Supports queueing buffer from app and dequeuing ISP filled buffer to App
> > > - It is verified on qv4l2, cheese and qcam
> > > - It is verified together with following patches
> > > 	platform/x86: Add AMD ISP platform config (https://lore.kernel.org/all/20250514215623.522746-1-pratap.nirujogi@amd.com/)
> > > 	pinctrl: amd: isp411: Add amdisp GPIO pinctrl (https://github.com/torvalds/linux/commit/e97435ab09f3ad7b6a588dd7c4e45a96699bbb4a)
> > > 	drm/amd/amdgpu: Add GPIO resources required for amdisp (https://gitlab.freedesktop.org/agd5f/linux/-/commit/ad0f5966ed8297aa47b3184192b00b7379ae0758)
> > > 	drm/amd/amdgpu: Declare isp firmware binary file (https://gitlab.freedesktop.org/agd5f/linux/-/commit/35345917bc9f7c86152b270d9d93c220230b667f)
> > > 
> > > AMD ISP4 Key features:
> > > - Processes bayer raw data from the connected sensor and output them to different YUV formats
> > > - Downscale input image to different output image resolution
> > > - Pipeline to do image processing on the input image including demosaic, denoise, 3A, etc.
> > > 
> > > ----------
> > > 
> > > Changes v5 -> v6:
> > > 
> > > - Lowered FW mempool buffer size from 200M to 100M (actual usage).
> > > - Added an irq_enabled member to the ISP subdev for proper IRQ disable handling in both normal and error cases.
> > > - Removed unnecessary .owner assignment from isp4_capture_drv definition
> > > - Updated IRQ handling to enable and disable interrupts via the ISP register for improved performance.
> > > - Revised ring buffer management in isp4if_f2h_resp(), addressing safety checks to ensure the read pointer is validated before memcpy operations, reducing the risk of out-of-bounds access. The ring buffer logic was also streamlined significantly.
> > > - Modified ring buffer handling in isp4if_is_cmdq_rb_full(), correcting an off-by-one error in safety checks that previously allowed rd_ptr to equal wr_ptr when the buffer was full.
> > > - Refactored ring buffer handling in isp4if_insert_isp_fw_cmd(), simplifying overall logic.
> > > - Resolved a regression from v4 to v5 where isp4if_dequeue_buffer() did not protect list_del with bufq_lock.
> > > - Addressed a subtle use-after-free issue that could occur if a timeout on a synchronous command coincided with completion.
> > > - Added missing pm_runtime_disable() calls to isp4_capture_remove() and to the error path in isp4_capture_probe().
> > > - Removed stray semicolons following closing curly braces.
> > > - Improved and clarified macro definitions in isp4_interface.h.
> > > - Eliminated unnecessary (u8 *) casts.
> > > - Added missing memset for firmware command structures in isp4sd_stop_stream().
> > > - Excluded streams 2 and 3 from ISP4IF_FW_RESP_RB_IRQ_EN_MASK, preventing their activation in the interrupt enable register.
> > > - Enhanced error handling to clean up kthreads in the event of startup failure.
> > > - Corrected a race condition during kthread creation where waitqueue head initialization could be delayed, as it was performed by the kthread itself.
> > > - Removed status checks in isp4sd_pwroff_and_deinit() that were always false.
> > > - Ensured isp4sd_init_stream() is only invoked once per stream start and reordered corresponding status checks in isp4sd_start_stream().
> > > - Improved error handling in isp4sd_start_stream() to propagate errors from failed functions.
> > > - Relocated debugging messages in isp4sd_stop_stream() to execute under lock protection due to access to output_info->start_status.
> > > - Eliminated redundant GET_REG_BASE() macros.
> > > - Removed isp4sd_is_stream_running() function.
> > > - Corrected error message in isp4sd_init_stream() caused by copy/paste.
> > > - Refined struct isp4_interface to remove firmware ring buffer configurations.
> > > - Removed obsolete isp4sd_is_stream_running function.
> > > - Removed pdev member from struct isp4_device, as it is unnecessary.
> > > - Fixed typo in 'isp_mmip' parameter name within isp4if_init().
> > > - Removed gap in struct isp4_subdev definition.
> > > - Performed extensive dead code removal and minor style improvements throughout the codebase.
> > > 
> > > 
> > > Changes v4 -> v5:
> > > 
> > > - Transitioned VIDEOBUF2_V4L2 from 'depends' to 'select' within Kconfig.
> > > - Standardized object file naming conventions in the Makefile and sorted entries alphabetically.
> > > - Removed the unused macro definition to_isp4_device.
> > > - Eliminated unused members mem_domain and mem_align from struct isp4if_gpu_mem_info.
> > > - Deleted unused fields mc_addr and gpu_pkg from struct isp4if_cmd_element.
> > > - Removed obsolete pltf_data, i2c_nb, and notifier elements from struct isp4_device.
> > > - Updated platform_get_irq failure handling to return its actual result rather than -ENODEV.
> > > - Refined inclusion of header files for clarity and efficiency.
> > > - Appended comments following #endif statements in header files.
> > > - Improved implementation of isp4if_gpu_mem_free and isp4if_dealloc_fw_gpumem.
> > > - Removed isp4if_append_cmd_2_cmdq and revised isp4if_send_fw_cmd accordingly.
> > > - Enhanced isp4if_clear_cmdq and isp4if_clear_bufq by eliminating unnecessary list_del operations.
> > > - Adopted completion mechanism instead of wait queue and condition for command completion notifications.
> > > - Employed memset to ensure proper zeroing of padding bits in structures shared between ISP driver and firmware.
> > > - Streamlined IRQs, reducing total from four to two, retaining only essential ones.
> > > - Optimized IRQ handler logic using a while loop for greater efficiency.
> > > - Introduced dynamic IRQ enable/disable functionality based on camera status (open/close).
> > > - Applied distinct identifiers to differentiate multiple threads and IRQs.
> > > - Removed unnecessary initialization of local variables.
> > > - Refined camera start/stop workflow to mitigate potential synchronization concerns.
> > > - Replaced all remaining mutex with guard mutex.
> > > - Enhanced command and buffer queue performance by substituting mutexes with spinlocks.
> > > - Removed redundant isp4sd_init_meta_buf function and its references.
> > > - Limited firmware logging activities to the stream1 thread.
> > > - Relocated v4l2_device_unregister_subdev() and media_entity_cleanup() calls from isp4_capture_remove to isp4sd_deinit.
> > > - Resolved media device registration sequence issues.
> > > - Modified stream processing thread behavior to await IRQ without a timeout.
> > > - Addressed cleanup procedures in video device initialization and deinitialization routines.
> > > - Corrected typos and made other cosmetic improvements.
> > > 
> > > 
> > > Changes v3 -> v4:
> > > 
> > > - Replace one mutex with guard mutex.
> > > - Remove unnecessary bus_info initialization of v4l2_capability.
> > > - Drop V4L2_CAP_IO_MC from capabilities of v4l2_capability.
> > > - Modify document with better SOC description.
> > > - Fix Test x86 failure in Media CI test https://linux-media.pages.freedesktop.org/-/users/patchwork/-/jobs/83470456/artifacts/report.htm
> > > - Modify some commit messages by describing changes in imperative mood.
> > > - Add media-ctl output in cover letter.
> > > - Create separated dedicated amdgpu patch to add declaration MODULE_FIRMWARE("amdgpu/isp_4_1_1.bin");
> > > - Fix typo errors and other cosmetic issues.
> > > - Add DRM_AMD_ISP dependency in Kconfig.
> > > 
> > > 
> > > Changes v2 -> v3:
> > > 
> > > - All the dependent patches in other modules (drm/amd/amdgpu, platform/x86, pinctrl/amd) merged on upstream mainline kernel (https://github.com/torvalds/linux) v6.17.
> > > - Removed usage of amdgpu structs in ISP driver. Added helper functions in amdgpu accepting opaque params from ISP driver to allocate and release ISP GART buffers.
> > > - Moved sensor and MIPI phy control entirely into ISP FW instead of the previous hybrid approach controlling sensor from both FW and x86 (sensor driver).
> > > - Removed phy configuration and sensor binding as x86 (sensor driver) had relinquished the sensor control for ISP FW. With this approach the driver will be exposed as web camera like interface.
> > > - New FW with built-in sensor driver is submitted on upstream linux-firmware repo (https://gitlab.com/kernel-firmware/linux-firmware/).
> > > - Please note the new FW submitted is not directly compatible with OEM Kernel ISP4.0 (https://github.com/amd/Linux_ISP_Kernel/tree/4.0) and the previous ISP V2 patch series.
> > > - If intend to use the new FW, please rebuild OEM ISP4.0 Kernel with CONFIG_VIDEO_OV05C10=N and CONFIG_PINCTRL_AMDISP=Y.
> > > - Included critical fixes from Sultan Alsawaf branch (https://github.com/kerneltoast/kernel_x86_laptop.git) related to managing lifetime of isp buffers.
> > >        media: amd: isp4: Add missing refcount tracking to mmap memop
> > >        media: amd: isp4: Don't put or unmap the dmabuf when detaching
> > >        media: amd: isp4: Don't increment refcount when dmabuf export fails
> > >        media: amd: isp4: Fix possible use-after-free in isp4vid_vb2_put()
> > >        media: amd: isp4: Always export a new dmabuf from get_dmabuf memop
> > >        media: amd: isp4: Fix implicit dmabuf lifetime tracking
> > >        media: amd: isp4: Fix possible use-after-free when putting implicit dmabuf
> > >        media: amd: isp4: Simplify isp4vid_get_dmabuf() arguments
> > >        media: amd: isp4: Move up buf->vaddr check in isp4vid_get_dmabuf()
> > >        media: amd: isp4: Remove unused userptr memops
> > >        media: amd: isp4: Add missing cleanup on error in isp4vid_vb2_alloc()
> > >        media: amd: isp4: Release queued buffers on error in start_streaming
> > > - Addressed all code related upstream comments
> > > - Fix typo errors and other cosmetic issues.
> > > 
> > > 
> > > Changes v1 -> v2:
> > > 
> > > - Fix media CI test errors and valid warnings
> > > - Reduce patch number in the series from 9 to 8 by merging MAINTAINERS adding patch to the first patch
> > > - In patch 5
> > > 	- do modification to use remote endpoint instead of local endpoint
> > > 	- use link frequency and port number as start phy parameter instead of extra added phy-id and phy-bit-rate property of endpoint
> > > 
> > > ----------
> > > 
> > > It passes v4l2 compliance test, the test reports for:
> > > 
> > > (a) amd_isp_capture device /dev/video0
> > > 
> > > Compliance test for amd_isp_capture device /dev/video0:
> > > -------------------------------------------------------
> > > 
> > > atg@atg-HP-PV:~/bin$ ./v4l2-compliance -d /dev/video0
> > > v4l2-compliance 1.29.0-5348, 64 bits, 64-bit time_t
> > > v4l2-compliance SHA: 75e3f0e2c2cb 2025-03-17 18:12:17
> > > 
> > > Compliance test for amd_isp_capture device /dev/video0:
> > > 
> > > Driver Info:
> > >          Driver name      : amd_isp_capture
> > >          Card type        : amd_isp_capture
> > >          Bus info         : platform:amd_isp_capture
> > >          Driver version   : 6.14.0
> > >          Capabilities     : 0xa4200001
> > >                  Video Capture
> > >                  I/O MC
> > >                  Streaming
> > >                  Extended Pix Format
> > >                  Device Capabilities
> > >          Device Caps      : 0x24200001
> > >                  Video Capture
> > >                  I/O MC
> > >                  Streaming
> > >                  Extended Pix Format
> > > Media Driver Info:
> > >          Driver name      : amd_isp_capture
> > >          Model            : amd_isp41_mdev
> > >          Serial           :
> > >          Bus info         : platform:amd_isp_capture
> > >          Media version    : 6.14.0
> > >          Hardware revision: 0x00000000 (0)
> > >          Driver version   : 6.14.0
> > > Interface Info:
> > >          ID               : 0x03000005
> > >          Type             : V4L Video
> > > Entity Info:
> > >          ID               : 0x00000003 (3)
> > >          Name             : Preview
> > >          Function         : V4L2 I/O
> > >          Pad 0x01000004   : 0: Sink
> > >            Link 0x02000007: from remote pad 0x1000002 of entity 'amd isp4' (Image Signal Processor): Data, Enabled, Immutable
> > > 
> > > Required ioctls:
> > >          test MC information (see 'Media Driver Info' above): OK
> > >          test VIDIOC_QUERYCAP: OK
> > >          test invalid ioctls: OK
> > > 
> > > Allow for multiple opens:
> > >          test second /dev/video0 open: OK
> > >          test VIDIOC_QUERYCAP: OK
> > >          test VIDIOC_G/S_PRIORITY: OK
> > >          test for unlimited opens: OK
> > > 
> > > Debug ioctls:
> > >          test VIDIOC_DBG_G/S_REGISTER: OK (Not Supported)
> > >          test VIDIOC_LOG_STATUS: OK (Not Supported)
> > > 
> > > Input ioctls:
> > >          test VIDIOC_G/S_TUNER/ENUM_FREQ_BANDS: OK (Not Supported)
> > >          test VIDIOC_G/S_FREQUENCY: OK (Not Supported)
> > >          test VIDIOC_S_HW_FREQ_SEEK: OK (Not Supported)
> > >          test VIDIOC_ENUMAUDIO: OK (Not Supported)
> > >          test VIDIOC_G/S/ENUMINPUT: OK
> > >          test VIDIOC_G/S_AUDIO: OK (Not Supported)
> > >          Inputs: 1 Audio Inputs: 0 Tuners: 0
> > > 
> > > Output ioctls:
> > >          test VIDIOC_G/S_MODULATOR: OK (Not Supported)
> > >          test VIDIOC_G/S_FREQUENCY: OK (Not Supported)
> > >          test VIDIOC_ENUMAUDOUT: OK (Not Supported)
> > >          test VIDIOC_G/S/ENUMOUTPUT: OK (Not Supported)
> > >          test VIDIOC_G/S_AUDOUT: OK (Not Supported)
> > >          Outputs: 0 Audio Outputs: 0 Modulators: 0
> > > 
> > > Input/Output configuration ioctls:
> > >          test VIDIOC_ENUM/G/S/QUERY_STD: OK (Not Supported)
> > >          test VIDIOC_ENUM/G/S/QUERY_DV_TIMINGS: OK (Not Supported)
> > >          test VIDIOC_DV_TIMINGS_CAP: OK (Not Supported)
> > >          test VIDIOC_G/S_EDID: OK (Not Supported)
> > > 
> > > Control ioctls (Input 0):
> > >          test VIDIOC_QUERY_EXT_CTRL/QUERYMENU: OK (Not Supported)
> > >          test VIDIOC_QUERYCTRL: OK (Not Supported)
> > >          test VIDIOC_G/S_CTRL: OK (Not Supported)
> > >          test VIDIOC_G/S/TRY_EXT_CTRLS: OK (Not Supported)
> > >          test VIDIOC_(UN)SUBSCRIBE_EVENT/DQEVENT: OK (Not Supported)
> > >          test VIDIOC_G/S_JPEGCOMP: OK (Not Supported)
> > >          Standard Controls: 0 Private Controls: 0
> > > 
> > > Format ioctls (Input 0):
> > >          test VIDIOC_ENUM_FMT/FRAMESIZES/FRAMEINTERVALS: OK
> > >          test VIDIOC_G/S_PARM: OK
> > >          test VIDIOC_G_FBUF: OK (Not Supported)
> > >          test VIDIOC_G_FMT: OK
> > >          test VIDIOC_TRY_FMT: OK
> > >          test VIDIOC_S_FMT: OK
> > >          test VIDIOC_G_SLICED_VBI_CAP: OK (Not Supported)
> > >          test Cropping: OK (Not Supported)
> > >          test Composing: OK (Not Supported)
> > >          test Scaling: OK (Not Supported)
> > > 
> > > Codec ioctls (Input 0):
> > >          test VIDIOC_(TRY_)ENCODER_CMD: OK (Not Supported)
> > >          test VIDIOC_G_ENC_INDEX: OK (Not Supported)
> > >          test VIDIOC_(TRY_)DECODER_CMD: OK (Not Supported)
> > > 
> > > Buffer ioctls (Input 0):
> > >          test VIDIOC_REQBUFS/CREATE_BUFS/QUERYBUF: OK
> > >          test CREATE_BUFS maximum buffers: OK
> > >          test VIDIOC_REMOVE_BUFS: OK
> > >          test VIDIOC_EXPBUF: OK
> > >          test Requests: OK (Not Supported)
> > >          test blocking wait: OK
> > > 
> > > Total for amd_isp_capture device /dev/video0: 49, Succeeded: 49, Failed: 0, Warnings: 0
> > > 
> > > The media-ctl output of media device /dev/media0:
> > > -------------------------------------------------------
> > > 
> > > atg@atg-HP-PV:~$ media-ctl -p -d /dev/media0
> > > Media controller API version 6.17.0
> > > 
> > > Media device information
> > > ------------------------
> > > driver          amd_isp_capture
> > > model           amd_isp41_mdev
> > > serial
> > > bus info        platform:amd_isp_capture
> > > hw revision     0x0
> > > driver version  6.17.0
> > > 
> > > Device topology
> > > - entity 1: amd isp4 (1 pad, 1 link, 0 routes)
> > >              type V4L2 subdev subtype Unknown flags 0
> > >          pad0: Source
> > >                  -> "Preview":0 [ENABLED,IMMUTABLE]
> > > 
> > > - entity 3: Preview (1 pad, 1 link)
> > >              type Node subtype V4L flags 0
> > >              device node name /dev/video0
> > >          pad0: Sink
> > >                  <- "amd isp4":0 [ENABLED,IMMUTABLE]
> > > 
> > > Please review and provide feedback.
> > > 
> > > Many thanks,
> > > 
> > > Bin Du (7):
> > >    media: platform: amd: Introduce amd isp4 capture driver
> > >    media: platform: amd: low level support for isp4 firmware
> > >    media: platform: amd: Add isp4 fw and hw interface
> > >    media: platform: amd: isp4 subdev and firmware loading handling added
> > >    media: platform: amd: isp4 video node and buffers handling added
> > >    media: platform: amd: isp4 debug fs logging and  more descriptive
> > >      errors
> > >    Documentation: add documentation of AMD isp 4 driver
> > > 
> > >   Documentation/admin-guide/media/amdisp4-1.rst |   63 +
> > >   Documentation/admin-guide/media/amdisp4.dot   |    6 +
> > >   .../admin-guide/media/v4l-drivers.rst         |    1 +
> > >   MAINTAINERS                                   |   25 +
> > >   drivers/media/platform/Kconfig                |    1 +
> > >   drivers/media/platform/Makefile               |    1 +
> > >   drivers/media/platform/amd/Kconfig            |    3 +
> > >   drivers/media/platform/amd/Makefile           |    3 +
> > >   drivers/media/platform/amd/isp4/Kconfig       |   14 +
> > >   drivers/media/platform/amd/isp4/Makefile      |   10 +
> > >   drivers/media/platform/amd/isp4/isp4.c        |  234 ++++
> > >   drivers/media/platform/amd/isp4/isp4.h        |   20 +
> > >   drivers/media/platform/amd/isp4/isp4_debug.c  |  271 ++++
> > >   drivers/media/platform/amd/isp4/isp4_debug.h  |   41 +
> > >   .../platform/amd/isp4/isp4_fw_cmd_resp.h      |  314 +++++
> > >   drivers/media/platform/amd/isp4/isp4_hw_reg.h |  124 ++
> > >   .../media/platform/amd/isp4/isp4_interface.c  |  787 +++++++++++
> > >   .../media/platform/amd/isp4/isp4_interface.h  |  140 ++
> > >   drivers/media/platform/amd/isp4/isp4_subdev.c | 1087 ++++++++++++++++
> > >   drivers/media/platform/amd/isp4/isp4_subdev.h |  130 ++
> > >   drivers/media/platform/amd/isp4/isp4_video.c  | 1158 +++++++++++++++++
> > >   drivers/media/platform/amd/isp4/isp4_video.h  |   65 +
> > >   22 files changed, 4498 insertions(+)
> > >   create mode 100644 Documentation/admin-guide/media/amdisp4-1.rst
> > >   create mode 100644 Documentation/admin-guide/media/amdisp4.dot
> > >   create mode 100644 drivers/media/platform/amd/Kconfig
> > >   create mode 100644 drivers/media/platform/amd/Makefile
> > >   create mode 100644 drivers/media/platform/amd/isp4/Kconfig
> > >   create mode 100644 drivers/media/platform/amd/isp4/Makefile
> > >   create mode 100644 drivers/media/platform/amd/isp4/isp4.c
> > >   create mode 100644 drivers/media/platform/amd/isp4/isp4.h
> > >   create mode 100644 drivers/media/platform/amd/isp4/isp4_debug.c
> > >   create mode 100644 drivers/media/platform/amd/isp4/isp4_debug.h
> > >   create mode 100644 drivers/media/platform/amd/isp4/isp4_fw_cmd_resp.h
> > >   create mode 100644 drivers/media/platform/amd/isp4/isp4_hw_reg.h
> > >   create mode 100644 drivers/media/platform/amd/isp4/isp4_interface.c
> > >   create mode 100644 drivers/media/platform/amd/isp4/isp4_interface.h
> > >   create mode 100644 drivers/media/platform/amd/isp4/isp4_subdev.c
> > >   create mode 100644 drivers/media/platform/amd/isp4/isp4_subdev.h
> > >   create mode 100644 drivers/media/platform/amd/isp4/isp4_video.c
> > >   create mode 100644 drivers/media/platform/amd/isp4/isp4_video.h
> > > 
> > > -- 
> > > 2.34.1
> > > 
> > 
> > Hi Bin,
> > 
> > I have attached a small patch with a fix for an old issue I noticed now while
> > reading the v6 code and some remaining style nitpicks addressed. And some
> > duplicated code on stream stop removed.
> > 
> > This is the last change from me, I promise. :)
> > 
> 
> Alright, I'll trust you the last time, LOL :) Never mind, they are small
> changes and every single one brings the code closer to perfection.
> I'll wait for feedback from other reviewers so I can incorporate them all
> into next version.

Great, then maybe I'm not getting coal for xmas! :)

BTW, there is something else I noticed while making that patch: the min buffers
handling seems a bit odd. q->min_queued_buffers is set to 2, but then there is
ISP4SD_MIN_BUF_CNT_BEF_START_STREAM set to 4. Why isn't q->min_queued_buffers
just set to 4 instead of using the macro?

And then what seems weirder is that isp4sd_ioc_send_img_buf() sends
CMD_ID_START_STREAM once 4 buffers are queued. But isp4sd_ioc_send_img_buf() is
called from the buf_queue callback, not the enable_streams callback, so why is
it sending the stream start command to FW?

It looks like isp4sd_start_stream() will send CMD_ID_START_STREAM unless it was
already done by isp4sd_ioc_send_img_buf(), so I'm wondering why
isp4sd_ioc_send_img_buf() needs to do it at all, especially before the
start_streaming callback (which is what indirectly calls enable_streams).

Also, when isp4sd_ioc_send_img_buf() is the one to send CMD_ID_START_STREAM,
isp4sd_init_stream() and isp4sd_setup_output() will be skipped in
isp4sd_start_stream(). Is it okay for those to be skipped? :\

> > Otherwise, v6 is looking very good! Good catches with the error handling too,
> > with the irq_enabled flag and v4l2_device_register() error cleanup.
> > 
> 
> Yes, I believe so. I received two warnings from the Media CI checks;
> however, it appears that the issue is related to the CI system itself.
> 
> # Test static:test-smatch
> drivers/media/platform/amd/isp4/isp4_interface.c:439 isp4if_send_fw_cmd()
> warn: '&ele->list' not removed from list
> 
> # Test static:test-coccinelle
> ./platform/amd/isp4/isp4_subdev.c:404:6-25: WARNING: atomic_dec_and_test
> variation before object free at line 405.
> ./i2c/ds90ub953.c:779:44-51: WARNING: Consider using %pe to print PTR_ERR()
> ...
> If you believe that the CI is wrong, kindly open an issue at
> 	/-/issues or reply-all
> to this message.

Yes, both of those are false positives. The atomic_dec_and_test one is funny
actually because it's just a refcount before freeing the object, which is a very
normal thing, heh.

Thanks,
Sultan

