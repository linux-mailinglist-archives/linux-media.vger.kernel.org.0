Return-Path: <linux-media+bounces-49792-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 1B5B3CEB9EF
	for <lists+linux-media@lfdr.de>; Wed, 31 Dec 2025 10:04:06 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id F2E3030334CD
	for <lists+linux-media@lfdr.de>; Wed, 31 Dec 2025 09:04:01 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B70B8315D23;
	Wed, 31 Dec 2025 09:04:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="JK26xoV9";
	dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b="JoT97YRF"
X-Original-To: linux-media@vger.kernel.org
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9F40730F927
	for <linux-media@vger.kernel.org>; Wed, 31 Dec 2025 09:03:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767171840; cv=none; b=EDLtt6SHjWgT3+LQKbMDagOyFihOfLpAwRvOpRsJfAcABunkqALR/MzuZkmG2CSotinZHFq2jO1oiswRyIR0v6b1ymwjd8sGCe+u6OFyjlUfjwqFo0LpFTFkKGIeXBSh6XIQ64GpaQkgYrecev+o7sDl59JZjiEdFR6K41qZ+CE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767171840; c=relaxed/simple;
	bh=2bCTceGErZ9ZF9C0ysaP+DdCw3h3NAJxx66bNQW1RGA=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=sJ+uyx0AzPD9qrXUI0rMclvz+w7kUl3PMXtijU349KATusNLCYoBeyvkMotVAVWc5b7Y7sX2+dMYd3MTgpoCNETFolbLGI0N0iEEAWRRUoGzDgE/ExfC3SWVa1dKeW7fklcJwKhkmmzFIHDS8G8PloV7k8UxTF6QfVTNd8mItpE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=JK26xoV9; dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b=JoT97YRF; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1767171836;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=d5+HwOIvqh+5R3xOM03vsO+/4IPxC1gDW+D11z3Y0QU=;
	b=JK26xoV9RQahArLDE3Y5sYk4h/Bvw2CepPFFmgamSHhk3zhnC4qKs8H4mkND3xEQrfIrQ7
	iVHZ7ZXTZaGw8+43Y5fLGb1UuFHNr+cjwZwitpEzYlsroXMcvKd8vSgeD9w37oXacG3VYE
	fRA6MXn8hSvN57pd7RkFheOS9YZBm9o=
Received: from mail-oo1-f72.google.com (mail-oo1-f72.google.com
 [209.85.161.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-692-WvnKa8r9OtaWl6emZ77SVQ-1; Wed, 31 Dec 2025 04:03:54 -0500
X-MC-Unique: WvnKa8r9OtaWl6emZ77SVQ-1
X-Mimecast-MFC-AGG-ID: WvnKa8r9OtaWl6emZ77SVQ_1767171834
Received: by mail-oo1-f72.google.com with SMTP id 006d021491bc7-656b7cf5c66so17447744eaf.2
        for <linux-media@vger.kernel.org>; Wed, 31 Dec 2025 01:03:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1767171834; x=1767776634; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=d5+HwOIvqh+5R3xOM03vsO+/4IPxC1gDW+D11z3Y0QU=;
        b=JoT97YRFg/ZV9BMWH6NKP6n30mxStoXQgR+dbz6BqGck0EFnipKUdCmfc++9t6OYm5
         hWdfuhNSSaYXxM+2TbX525j1VkN/eYYThuqPcXDOinJSAFUx5y3grGzuaZ5PQYCk36wp
         YhNbJY3ew/ruhVcJC0iNt5uhaOgHdkT0udIdz2W+1a2hedJ9fhSYKD2U2B76kIpLb2dz
         xr7CJyNVg5us8p2xf5Ui2g9ue/JJ8gCifT9pzfd762+NxD8Vw4YWgnYMKHNoviqCCNGF
         wZ+YR17bAU9uig2DiycCZw+UcmVR5tTqmDMb4vysd4+N974xqNnt7lj09iFNdCQTsXci
         d3Ig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767171834; x=1767776634;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=d5+HwOIvqh+5R3xOM03vsO+/4IPxC1gDW+D11z3Y0QU=;
        b=sw7apSNWOiyGc5NWhEojdK7MSgbiDD8rq0duA7aSehq4cGr5HdXQURH5Kzv/b2rgGk
         QJ4xCxeg6bYufO/3cRVP3vwyTdQ+hn2fLJNtrzGHtHi01BSEEna9iiRBwJhr3nUAmPd2
         vVyX0Q9JU4ISyW3EHZFQ6l2E+dGO/YoJXVBUmh2analT+9cXBNVEj8jjSMtJlYrtvENK
         +NAdVOvkFcofwD6cs0dfsB1zrRogwIDtYfPxGC216GGQaq9tFuu331DzaF/4Y/colqed
         PQ4eF6KyFK3IFB8QlXxjDGwpeEr8z1aTE87n5umWEQoBzvTIz8R0iSDBNQj+LE6Yqds0
         OhOQ==
X-Forwarded-Encrypted: i=1; AJvYcCUlgXhjMZa6Rr7tx+WT+ZEUH7xEGdh/U3uKp8dsGMnCX88vDafj9vEVrB/L4POUrpa9+EV1GyIC6TBaUA==@vger.kernel.org
X-Gm-Message-State: AOJu0Yz4Saf+tJPih4aUBlP0zMhBP+aq6a3BCe8CcfJ9WmblnjtizIR6
	GXEsidmrTJiXaYTacOMoI0b+afCtDz8xDI7ndqHofktpwvlj0HoOm7/oW7mwWTns4XkzHBLEfrV
	pLJy/igIH2Vb5xCsow8Jdlu1nyV8fsAtwYRcsYOjYU7rUuI9joqVCPT427IPn4DrUKtAEdRuHZ6
	8E85Cj9tiGUgU/ZaHWykVraK6Aa4nb9XDQD+fZZow=
X-Gm-Gg: AY/fxX52BlLgsf7usBuh21ycebhKEp9TDITO2SGNJQj4a2FRfdlhXIoKP74r67BNiy0
	mf2VV6C5PDwarChJiVfas+h1NErHUA2Kn8up8IHF6QRpFFvjbxZhPIkpU663Ijr0xxQVKpob/09
	EmBrFSbN839LD9YzBOG+w3+Z0Z9Cu7eT+1LS8Ox1THtJK21ouAt/LjpQGtil8/vGsoMQ==
X-Received: by 2002:a05:6820:2225:b0:659:9a49:8f28 with SMTP id 006d021491bc7-65d0eab99c4mr14789865eaf.57.1767171833915;
        Wed, 31 Dec 2025 01:03:53 -0800 (PST)
X-Google-Smtp-Source: AGHT+IGD8i/wlxHggYtP+0KCZPGL8Nw7EcCiOanMD2I/3Y4N5HUkHxuvjvRRY6wMswrGclUFQ0LfTpNhFUh/d1Q3tUw=
X-Received: by 2002:a05:6820:2225:b0:659:9a49:8f28 with SMTP id
 006d021491bc7-65d0eab99c4mr14789854eaf.57.1767171833415; Wed, 31 Dec 2025
 01:03:53 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20251216091326.111977-1-Bin.Du@amd.com>
In-Reply-To: <20251216091326.111977-1-Bin.Du@amd.com>
From: Kate Hsuan <hpa@redhat.com>
Date: Wed, 31 Dec 2025 17:03:42 +0800
X-Gm-Features: AQt7F2pdrGYnPnF63k9EX53xcVoE-oD3EP5Xb3PjiqlU5vUbqw1tGtG7tMVFBMs
Message-ID: <CAEth8oGuoFH1R1NXVmFFrDmZeKLZSHnJO=wuXdaFYLFXi4upGA@mail.gmail.com>
Subject: Re: [PATCH v7 0/7] Add AMD ISP4 driver
To: Bin Du <Bin.Du@amd.com>
Cc: mchehab@kernel.org, hverkuil@xs4all.nl, 
	laurent.pinchart+renesas@ideasonboard.com, bryan.odonoghue@linaro.org, 
	sakari.ailus@linux.intel.com, prabhakar.mahadev-lad.rj@bp.renesas.com, 
	linux-media@vger.kernel.org, linux-kernel@vger.kernel.org, 
	sultan@kerneltoast.com, pratap.nirujogi@amd.com, benjamin.chan@amd.com, 
	king.li@amd.com, gjorgji.rosikopulos@amd.com, Phil.Jawich@amd.com, 
	Dominic.Antony@amd.com, mario.limonciello@amd.com, richard.gong@amd.com, 
	anson.tsao@amd.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Dec 16, 2025 at 5:14=E2=80=AFPM Bin Du <Bin.Du@amd.com> wrote:
>
> Hello,
>
> AMD ISP4 is the AMD image processing gen 4 which can be found in HP ZBook=
 Ultra G1a 14 inch Mobile Workstation PC (Ryzen AI Max 300 Series)
> (https://ubuntu.com/certified/202411-36043)
> This patch series introduces the initial driver support for the AMD ISP4.
>
> Patch summary:
> - Powers up/off and initializes ISP HW
> - Configures and kicks off ISP FW
> - Interacts with APP using standard V4l2 interface by video node
> - Controls ISP HW and interacts with ISP FW to do image processing
> - Supports enum/set output image format and resolution
> - Supports queueing buffer from app and dequeuing ISP filled buffer to Ap=
p
> - It is verified on qv4l2, cheese and qcam
> - It is verified together with following patches
>         platform/x86: Add AMD ISP platform config (https://lore.kernel.or=
g/all/20250514215623.522746-1-pratap.nirujogi@amd.com/)
>         pinctrl: amd: isp411: Add amdisp GPIO pinctrl (https://github.com=
/torvalds/linux/commit/e97435ab09f3ad7b6a588dd7c4e45a96699bbb4a)
>         drm/amd/amdgpu: Add GPIO resources required for amdisp (https://g=
itlab.freedesktop.org/agd5f/linux/-/commit/ad0f5966ed8297aa47b3184192b00b73=
79ae0758)
>         drm/amd/amdgpu: Declare isp firmware binary file (https://gitlab.=
freedesktop.org/agd5f/linux/-/commit/35345917bc9f7c86152b270d9d93c220230b66=
7f)
>
> AMD ISP4 Key features:
> - Processes bayer raw data from the connected sensor and output them to d=
ifferent YUV formats
> - Downscale input image to different output image resolution
> - Pipeline to do image processing on the input image including demosaic, =
denoise, 3A, etc.
>
> ----------
>
> Changes v6 -> v7:
>
> - Added missed blank line after some if statements.
> - Changed the pm_runtime_disable() order in isp4_capture_remove() to alig=
n with initialization.
> - Reset buf_sent_cnt and start_stream_cmd_sent on stream stop.
> - Removed duplicate buf_sent_cnt and start_stream_cmd_sent reset in isp4s=
d_pwron_and_init().
> - Combined isp4sd_reset_stream_info() and isp4sd_reset_camera_info() into=
 isp4sd_uninit_stream() to eliminate redundant stream info reset.
> - Removed always-false status check in isp4sd_uninit_stream().
> - Minor style improvements.
>
>
> Changes v5 -> v6:
>
> - Lowered FW mempool buffer size from 200M to 100M (actual usage).
> - Added an irq_enabled member to the ISP subdev for proper IRQ disable ha=
ndling in both normal and error cases.
> - Removed unnecessary .owner assignment from isp4_capture_drv definition
> - Updated IRQ handling to enable and disable interrupts via the ISP regis=
ter for improved performance.
> - Revised ring buffer management in isp4if_f2h_resp(), addressing safety =
checks to ensure the read pointer is validated before memcpy operations, re=
ducing the risk of out-of-bounds access. The ring buffer logic was also str=
eamlined significantly.
> - Modified ring buffer handling in isp4if_is_cmdq_rb_full(), correcting a=
n off-by-one error in safety checks that previously allowed rd_ptr to equal=
 wr_ptr when the buffer was full.
> - Refactored ring buffer handling in isp4if_insert_isp_fw_cmd(), simplify=
ing overall logic.
> - Resolved a regression from v4 to v5 where isp4if_dequeue_buffer() did n=
ot protect list_del with bufq_lock.
> - Addressed a subtle use-after-free issue that could occur if a timeout o=
n a synchronous command coincided with completion.
> - Added missing pm_runtime_disable() calls to isp4_capture_remove() and t=
o the error path in isp4_capture_probe().
> - Removed stray semicolons following closing curly braces.
> - Improved and clarified macro definitions in isp4_interface.h.
> - Eliminated unnecessary (u8 *) casts.
> - Added missing memset for firmware command structures in isp4sd_stop_str=
eam().
> - Excluded streams 2 and 3 from ISP4IF_FW_RESP_RB_IRQ_EN_MASK, preventing=
 their activation in the interrupt enable register.
> - Enhanced error handling to clean up kthreads in the event of startup fa=
ilure.
> - Corrected a race condition during kthread creation where waitqueue head=
 initialization could be delayed, as it was performed by the kthread itself=
.
> - Removed status checks in isp4sd_pwroff_and_deinit() that were always fa=
lse.
> - Ensured isp4sd_init_stream() is only invoked once per stream start and =
reordered corresponding status checks in isp4sd_start_stream().
> - Improved error handling in isp4sd_start_stream() to propagate errors fr=
om failed functions.
> - Relocated debugging messages in isp4sd_stop_stream() to execute under l=
ock protection due to access to output_info->start_status.
> - Eliminated redundant GET_REG_BASE() macros.
> - Removed isp4sd_is_stream_running() function.
> - Corrected error message in isp4sd_init_stream() caused by copy/paste.
> - Refined struct isp4_interface to remove firmware ring buffer configurat=
ions.
> - Removed obsolete isp4sd_is_stream_running function.
> - Removed pdev member from struct isp4_device, as it is unnecessary.
> - Fixed typo in 'isp_mmip' parameter name within isp4if_init().
> - Removed gap in struct isp4_subdev definition.
> - Performed extensive dead code removal and minor style improvements thro=
ughout the codebase.
>
>
> Changes v4 -> v5:
>
> - Transitioned VIDEOBUF2_V4L2 from 'depends' to 'select' within Kconfig.
> - Standardized object file naming conventions in the Makefile and sorted =
entries alphabetically.
> - Removed the unused macro definition to_isp4_device.
> - Eliminated unused members mem_domain and mem_align from struct isp4if_g=
pu_mem_info.
> - Deleted unused fields mc_addr and gpu_pkg from struct isp4if_cmd_elemen=
t.
> - Removed obsolete pltf_data, i2c_nb, and notifier elements from struct i=
sp4_device.
> - Updated platform_get_irq failure handling to return its actual result r=
ather than -ENODEV.
> - Refined inclusion of header files for clarity and efficiency.
> - Appended comments following #endif statements in header files.
> - Improved implementation of isp4if_gpu_mem_free and isp4if_dealloc_fw_gp=
umem.
> - Removed isp4if_append_cmd_2_cmdq and revised isp4if_send_fw_cmd accordi=
ngly.
> - Enhanced isp4if_clear_cmdq and isp4if_clear_bufq by eliminating unneces=
sary list_del operations.
> - Adopted completion mechanism instead of wait queue and condition for co=
mmand completion notifications.
> - Employed memset to ensure proper zeroing of padding bits in structures =
shared between ISP driver and firmware.
> - Streamlined IRQs, reducing total from four to two, retaining only essen=
tial ones.
> - Optimized IRQ handler logic using a while loop for greater efficiency.
> - Introduced dynamic IRQ enable/disable functionality based on camera sta=
tus (open/close).
> - Applied distinct identifiers to differentiate multiple threads and IRQs=
.
> - Removed unnecessary initialization of local variables.
> - Refined camera start/stop workflow to mitigate potential synchronizatio=
n concerns.
> - Replaced all remaining mutex with guard mutex.
> - Enhanced command and buffer queue performance by substituting mutexes w=
ith spinlocks.
> - Removed redundant isp4sd_init_meta_buf function and its references.
> - Limited firmware logging activities to the stream1 thread.
> - Relocated v4l2_device_unregister_subdev() and media_entity_cleanup() ca=
lls from isp4_capture_remove to isp4sd_deinit.
> - Resolved media device registration sequence issues.
> - Modified stream processing thread behavior to await IRQ without a timeo=
ut.
> - Addressed cleanup procedures in video device initialization and deiniti=
alization routines.
> - Corrected typos and made other cosmetic improvements.
>
>
> Changes v3 -> v4:
>
> - Replace one mutex with guard mutex.
> - Remove unnecessary bus_info initialization of v4l2_capability.
> - Drop V4L2_CAP_IO_MC from capabilities of v4l2_capability.
> - Modify document with better SOC description.
> - Fix Test x86 failure in Media CI test https://linux-media.pages.freedes=
ktop.org/-/users/patchwork/-/jobs/83470456/artifacts/report.htm
> - Modify some commit messages by describing changes in imperative mood.
> - Add media-ctl output in cover letter.
> - Create separated dedicated amdgpu patch to add declaration MODULE_FIRMW=
ARE("amdgpu/isp_4_1_1.bin");
> - Fix typo errors and other cosmetic issues.
> - Add DRM_AMD_ISP dependency in Kconfig.
>
>
> Changes v2 -> v3:
>
> - All the dependent patches in other modules (drm/amd/amdgpu, platform/x8=
6, pinctrl/amd) merged on upstream mainline kernel (https://github.com/torv=
alds/linux) v6.17.
> - Removed usage of amdgpu structs in ISP driver. Added helper functions i=
n amdgpu accepting opaque params from ISP driver to allocate and release IS=
P GART buffers.
> - Moved sensor and MIPI phy control entirely into ISP FW instead of the p=
revious hybrid approach controlling sensor from both FW and x86 (sensor dri=
ver).
> - Removed phy configuration and sensor binding as x86 (sensor driver) had=
 relinquished the sensor control for ISP FW. With this approach the driver =
will be exposed as web camera like interface.
> - New FW with built-in sensor driver is submitted on upstream linux-firmw=
are repo (https://gitlab.com/kernel-firmware/linux-firmware/).
> - Please note the new FW submitted is not directly compatible with OEM Ke=
rnel ISP4.0 (https://github.com/amd/Linux_ISP_Kernel/tree/4.0) and the prev=
ious ISP V2 patch series.
> - If intend to use the new FW, please rebuild OEM ISP4.0 Kernel with CONF=
IG_VIDEO_OV05C10=3DN and CONFIG_PINCTRL_AMDISP=3DY.
> - Included critical fixes from Sultan Alsawaf branch (https://github.com/=
kerneltoast/kernel_x86_laptop.git) related to managing lifetime of isp buff=
ers.
>       media: amd: isp4: Add missing refcount tracking to mmap memop
>       media: amd: isp4: Don't put or unmap the dmabuf when detaching
>       media: amd: isp4: Don't increment refcount when dmabuf export fails
>       media: amd: isp4: Fix possible use-after-free in isp4vid_vb2_put()
>       media: amd: isp4: Always export a new dmabuf from get_dmabuf memop
>       media: amd: isp4: Fix implicit dmabuf lifetime tracking
>       media: amd: isp4: Fix possible use-after-free when putting implicit=
 dmabuf
>       media: amd: isp4: Simplify isp4vid_get_dmabuf() arguments
>       media: amd: isp4: Move up buf->vaddr check in isp4vid_get_dmabuf()
>       media: amd: isp4: Remove unused userptr memops
>       media: amd: isp4: Add missing cleanup on error in isp4vid_vb2_alloc=
()
>       media: amd: isp4: Release queued buffers on error in start_streamin=
g
> - Addressed all code related upstream comments
> - Fix typo errors and other cosmetic issues.
>
>
> Changes v1 -> v2:
>
> - Fix media CI test errors and valid warnings
> - Reduce patch number in the series from 9 to 8 by merging MAINTAINERS ad=
ding patch to the first patch
> - In patch 5
>         - do modification to use remote endpoint instead of local endpoin=
t
>         - use link frequency and port number as start phy parameter inste=
ad of extra added phy-id and phy-bit-rate property of endpoint
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
>           Link 0x02000007: from remote pad 0x1000002 of entity 'amd isp4'=
 (Image Signal Processor): Data, Enabled, Immutable
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
> Total for amd_isp_capture device /dev/video0: 49, Succeeded: 49, Failed: =
0, Warnings: 0
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
>  drivers/media/platform/amd/isp4/isp4.c        |  235 ++++
>  drivers/media/platform/amd/isp4/isp4.h        |   20 +
>  drivers/media/platform/amd/isp4/isp4_debug.c  |  271 ++++
>  drivers/media/platform/amd/isp4/isp4_debug.h  |   41 +
>  .../platform/amd/isp4/isp4_fw_cmd_resp.h      |  314 +++++
>  drivers/media/platform/amd/isp4/isp4_hw_reg.h |  124 ++
>  .../media/platform/amd/isp4/isp4_interface.c  |  789 +++++++++++
>  .../media/platform/amd/isp4/isp4_interface.h  |  141 ++
>  drivers/media/platform/amd/isp4/isp4_subdev.c | 1057 +++++++++++++++
>  drivers/media/platform/amd/isp4/isp4_subdev.h |  131 ++
>  drivers/media/platform/amd/isp4/isp4_video.c  | 1165 +++++++++++++++++
>  drivers/media/platform/amd/isp4/isp4_video.h  |   65 +
>  22 files changed, 4480 insertions(+)
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
>

v7 worked on my HP ZBook Ultra G1a 14 inch Mobile Workstation PC and
the camera worked fine.
It was tested with the latest upstream firmware [1] and 6.19-rc3 kernel.

[1] https://git.kernel.org/pub/scm/linux/kernel/git/firmware/linux-firmware=
.git/tree/amdgpu/isp_4_1_1.bin

Thank you for your work :)

--=20
BR,
Kate


