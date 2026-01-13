Return-Path: <linux-media+bounces-50565-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 6C166D19539
	for <lists+linux-media@lfdr.de>; Tue, 13 Jan 2026 15:13:02 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id CA384302AFE0
	for <lists+linux-media@lfdr.de>; Tue, 13 Jan 2026 14:11:34 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 474FD3921DB;
	Tue, 13 Jan 2026 14:11:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="Ls4dDE7I";
	dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b="CyftjrPs"
X-Original-To: linux-media@vger.kernel.org
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 61B48326D70
	for <linux-media@vger.kernel.org>; Tue, 13 Jan 2026 14:11:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768313493; cv=none; b=YTz3HiYdxPS+uSqfclWzH97eLqtxNIB9PakVJx0hzj0dgRJ78k57QeNgpdHYii48VpyzEyfsSuaMBPyxPL+bfY+7fiPXd/hZw1UQA7CWk2RM87SCTxyvkh9ELTKIQkuZu+kCugcjmVzDFAvLy25tGHR2bVJk8It/5+36ZQA+AC0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768313493; c=relaxed/simple;
	bh=jsjMSZfXwVOYRLUc4vcqAcO84zvL6MPLqMoh0l3rLIE=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=HWwBGdHxEed1adtHlcuDqr5qtBmUGZS02vAzvkQBoQKAmmtjZlG+D2g8X6dActMYRaJZoD7jCjB7S0ADalXye+xwlq7B0Wv78JpG3xLmchSD6nOCyOISFGh+eQtTWXeRRtEeC4/dMRmRZmQbdkKU8zHtGnQFuO7q3bXWcrlGveM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=Ls4dDE7I; dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b=CyftjrPs; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1768313490;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=UXY+4lcwRxiKMqBcuzR1oNEnyfZolkxJmmxt8pSf6ac=;
	b=Ls4dDE7IcGqQ13mcOV1L+dXYa3PpVFQw5J2Y8LmuNe9MasZ0nmcKvPKruZKPdFB/Wn6fvL
	KCN8VKinUA3T/nxAY6VCatwdv1ARMcR1IfzBaNi843cyf3jDk4oUC7K6GXvfEUh75yN/T0
	9duD8QVRO2lKjdnk+JuBrcmuS2xBz+0=
Received: from mail-oi1-f197.google.com (mail-oi1-f197.google.com
 [209.85.167.197]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-678-BDpWzI6AOz66GQmAWCLwWg-1; Tue, 13 Jan 2026 09:11:28 -0500
X-MC-Unique: BDpWzI6AOz66GQmAWCLwWg-1
X-Mimecast-MFC-AGG-ID: BDpWzI6AOz66GQmAWCLwWg_1768313488
Received: by mail-oi1-f197.google.com with SMTP id 5614622812f47-459df8c820eso9609984b6e.3
        for <linux-media@vger.kernel.org>; Tue, 13 Jan 2026 06:11:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1768313488; x=1768918288; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=UXY+4lcwRxiKMqBcuzR1oNEnyfZolkxJmmxt8pSf6ac=;
        b=CyftjrPsbIEeclWKwB+plVBSgFhuRse1ebiMW/iXgm8f5Fgk1YuuD+DuY7oGsxyeMF
         tFtHSxwOFldmyx5fKLA1SiuWAmfl5cks9P5dT0JvZhqyC6kQ/EQPockUPGo1V0DqcMXZ
         XFDnHbQLfQEQZEtKdhyAX1rPmUCYtVAXvLNw05oeoxLrcWbWRghkS0t6UUhCKVzEBYNq
         CYOoDhJqK8FYuYY685vWyjpR8phFms9KNCJOMUQJ+J/RW5t395/49y9xTanmeVQd7w4u
         BllIzKju7FYdhvX3tGhTupPzlCozl9oRxvX4LZAw/9xO6Do291SvAnyVuWnMBGl4Os7A
         XuXA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768313488; x=1768918288;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=UXY+4lcwRxiKMqBcuzR1oNEnyfZolkxJmmxt8pSf6ac=;
        b=J12E6p7n2dfLguJcRf2wF+Aw6FBdIbhwSA5kKbBwIo1aESal9YeOY1XzuoYv8MlXnd
         ZAofDA0IMTujjRUgPnasUPaX8OoZY/jXTNSkzts3rAjJSlyOXbYtI8De1lwPlf1hP/sO
         JKfzO/fZcXc2kkyGRIX6S7BQtFN2PLPQqfWUi7UY031YltBY/dDzRTS0xoIODNCbKWCw
         Lgjg+i5ofJfd8ck53cjI6IjQYzTsuC1dDo8Ub+fp0V6+oBZE9U5nFN7JBwSTb5RSL+xj
         3poLiiOx6TRyufUVKyYqVz5A9TtnTeqRjIPNgzaUIs5eKZD91JBoa/vG0GOFiOFqqiJg
         W0MA==
X-Forwarded-Encrypted: i=1; AJvYcCVq7KEapgNk8tWIArHYhLl/9CNjfXpJnfSfhiCRFAOujkDwnyms6CRzHT5WFJYd9WedM6j2tv5k+Yhj3w==@vger.kernel.org
X-Gm-Message-State: AOJu0YzHkmvFnLDnF8Z9aS6ndTKc1KIwNazYBsoT+J/I/OuC1dKXjoCj
	VbPAEUwxWVyUS9tAytMOooJDClXkzj+rtvmz3XNMY/ZTRPBs8skhZWvPOoVkudnnZNBwTm+wfhJ
	Qxdq6gykrQ65BIrRVy+8sPvxV7g8uJq+yshFQGFHzmw8yd2YBczxD7WzcDdkJHNmeVB0afkhX5N
	k9kITKQbdVM7RPFiMHpI5ltdQXoqyeksLkeNyZoSs=
X-Gm-Gg: AY/fxX4UgbVe+N+oU09IzLdgeA5TagWCAy2KpLxPWuppMP29+jZVJs7GqkXnSVo8R5I
	bt+XdklzL9gKitr7VwULBda2MklKbvz177iQSIGnNvvdytnm/C0B46JlQxmfzPcCQFKtzvmSIVa
	eqx5tUQO2lKYqS/sKW49kSaEoGNre6u4Z5lVXDF94NU1COouUCwrqhCCyJqxorekhe2A==
X-Received: by 2002:a05:6808:1b1f:b0:451:4c7e:4657 with SMTP id 5614622812f47-45a6bd3f0dcmr11011710b6e.26.1768313487600;
        Tue, 13 Jan 2026 06:11:27 -0800 (PST)
X-Google-Smtp-Source: AGHT+IFveLWUAEjfMMinBkTDE73xT3ltYY/W+2plxcgMrQ9gVplT6juie1l06ykU9ybjMT+zax4IXH6CSki0ljX+DmU=
X-Received: by 2002:a05:6808:1b1f:b0:451:4c7e:4657 with SMTP id
 5614622812f47-45a6bd3f0dcmr11011691b6e.26.1768313486895; Tue, 13 Jan 2026
 06:11:26 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20251216091326.111977-1-Bin.Du@amd.com> <CAEth8oGuoFH1R1NXVmFFrDmZeKLZSHnJO=wuXdaFYLFXi4upGA@mail.gmail.com>
 <CAEth8oHw6zjTYP31sCmpSX_Ac2Vb8QDnf=ZUt=tWGQeO9ApS=w@mail.gmail.com> <fcc79419-9f9b-4151-8a95-b287ecb0436b@amd.com>
In-Reply-To: <fcc79419-9f9b-4151-8a95-b287ecb0436b@amd.com>
From: Kate Hsuan <hpa@redhat.com>
Date: Tue, 13 Jan 2026 22:11:15 +0800
X-Gm-Features: AZwV_Qh1eSKcDDWrVSgUNEf-zFxvrGvoLqBodGSWxhdtquUlHYcWC9jFO0BiGGk
Message-ID: <CAEth8oGMNUuKCiW=wgQqpC29TWxAfRLiVMvy=eF5KX0Psqq3gQ@mail.gmail.com>
Subject: Re: [PATCH v7 0/7] Add AMD ISP4 driver
To: "Du, Bin" <bin.du@amd.com>
Cc: mchehab@kernel.org, hverkuil@xs4all.nl, 
	laurent.pinchart+renesas@ideasonboard.com, bryan.odonoghue@linaro.org, 
	sakari.ailus@linux.intel.com, prabhakar.mahadev-lad.rj@bp.renesas.com, 
	linux-media@vger.kernel.org, linux-kernel@vger.kernel.org, 
	sultan@kerneltoast.com, pratap.nirujogi@amd.com, benjamin.chan@amd.com, 
	king.li@amd.com, gjorgji.rosikopulos@amd.com, Phil.Jawich@amd.com, 
	Dominic.Antony@amd.com, mario.limonciello@amd.com, richard.gong@amd.com, 
	anson.tsao@amd.com
Content-Type: multipart/mixed; boundary="0000000000003d45cc06484591c5"

--0000000000003d45cc06484591c5
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Bin,

On Tue, Jan 6, 2026 at 4:35=E2=80=AFPM Du, Bin <bin.du@amd.com> wrote:
>
> Thank you, Kate, for the verification, it gives us more confidence.
>
> On 1/6/2026 1:49 PM, Kate Hsuan wrote:
> > Hi
> >
> > On Wed, Dec 31, 2025 at 5:03=E2=80=AFPM Kate Hsuan <hpa@redhat.com> wro=
te:
> >>
> >> On Tue, Dec 16, 2025 at 5:14=E2=80=AFPM Bin Du <Bin.Du@amd.com> wrote:
> >>>
> >>> Hello,
> >>>
> >>> AMD ISP4 is the AMD image processing gen 4 which can be found in HP Z=
Book Ultra G1a 14 inch Mobile Workstation PC (Ryzen AI Max 300 Series)
> >>> (https://ubuntu.com/certified/202411-36043)
> >>> This patch series introduces the initial driver support for the AMD I=
SP4.
> >>>
> >>> Patch summary:
> >>> - Powers up/off and initializes ISP HW
> >>> - Configures and kicks off ISP FW
> >>> - Interacts with APP using standard V4l2 interface by video node
> >>> - Controls ISP HW and interacts with ISP FW to do image processing
> >>> - Supports enum/set output image format and resolution
> >>> - Supports queueing buffer from app and dequeuing ISP filled buffer t=
o App
> >>> - It is verified on qv4l2, cheese and qcam
> >>> - It is verified together with following patches
> >>>          platform/x86: Add AMD ISP platform config (https://lore.kern=
el.org/all/20250514215623.522746-1-pratap.nirujogi@amd.com/)
> >>>          pinctrl: amd: isp411: Add amdisp GPIO pinctrl (https://githu=
b.com/torvalds/linux/commit/e97435ab09f3ad7b6a588dd7c4e45a96699bbb4a)
> >>>          drm/amd/amdgpu: Add GPIO resources required for amdisp (http=
s://gitlab.freedesktop.org/agd5f/linux/-/commit/ad0f5966ed8297aa47b3184192b=
00b7379ae0758)
> >>>          drm/amd/amdgpu: Declare isp firmware binary file (https://gi=
tlab.freedesktop.org/agd5f/linux/-/commit/35345917bc9f7c86152b270d9d93c2202=
30b667f)
> >>>
> >>> AMD ISP4 Key features:
> >>> - Processes bayer raw data from the connected sensor and output them =
to different YUV formats
> >>> - Downscale input image to different output image resolution
> >>> - Pipeline to do image processing on the input image including demosa=
ic, denoise, 3A, etc.
> >>>
> >>> ----------
> >>>
> >>> Changes v6 -> v7:
> >>>
> >>> - Added missed blank line after some if statements.
> >>> - Changed the pm_runtime_disable() order in isp4_capture_remove() to =
align with initialization.
> >>> - Reset buf_sent_cnt and start_stream_cmd_sent on stream stop.
> >>> - Removed duplicate buf_sent_cnt and start_stream_cmd_sent reset in i=
sp4sd_pwron_and_init().
> >>> - Combined isp4sd_reset_stream_info() and isp4sd_reset_camera_info() =
into isp4sd_uninit_stream() to eliminate redundant stream info reset.
> >>> - Removed always-false status check in isp4sd_uninit_stream().
> >>> - Minor style improvements.
> >>>
> >>>
> >>> Changes v5 -> v6:
> >>>
> >>> - Lowered FW mempool buffer size from 200M to 100M (actual usage).
> >>> - Added an irq_enabled member to the ISP subdev for proper IRQ disabl=
e handling in both normal and error cases.
> >>> - Removed unnecessary .owner assignment from isp4_capture_drv definit=
ion
> >>> - Updated IRQ handling to enable and disable interrupts via the ISP r=
egister for improved performance.
> >>> - Revised ring buffer management in isp4if_f2h_resp(), addressing saf=
ety checks to ensure the read pointer is validated before memcpy operations=
, reducing the risk of out-of-bounds access. The ring buffer logic was also=
 streamlined significantly.
> >>> - Modified ring buffer handling in isp4if_is_cmdq_rb_full(), correcti=
ng an off-by-one error in safety checks that previously allowed rd_ptr to e=
qual wr_ptr when the buffer was full.
> >>> - Refactored ring buffer handling in isp4if_insert_isp_fw_cmd(), simp=
lifying overall logic.
> >>> - Resolved a regression from v4 to v5 where isp4if_dequeue_buffer() d=
id not protect list_del with bufq_lock.
> >>> - Addressed a subtle use-after-free issue that could occur if a timeo=
ut on a synchronous command coincided with completion.
> >>> - Added missing pm_runtime_disable() calls to isp4_capture_remove() a=
nd to the error path in isp4_capture_probe().
> >>> - Removed stray semicolons following closing curly braces.
> >>> - Improved and clarified macro definitions in isp4_interface.h.
> >>> - Eliminated unnecessary (u8 *) casts.
> >>> - Added missing memset for firmware command structures in isp4sd_stop=
_stream().
> >>> - Excluded streams 2 and 3 from ISP4IF_FW_RESP_RB_IRQ_EN_MASK, preven=
ting their activation in the interrupt enable register.
> >>> - Enhanced error handling to clean up kthreads in the event of startu=
p failure.
> >>> - Corrected a race condition during kthread creation where waitqueue =
head initialization could be delayed, as it was performed by the kthread it=
self.
> >>> - Removed status checks in isp4sd_pwroff_and_deinit() that were alway=
s false.
> >>> - Ensured isp4sd_init_stream() is only invoked once per stream start =
and reordered corresponding status checks in isp4sd_start_stream().
> >>> - Improved error handling in isp4sd_start_stream() to propagate error=
s from failed functions.
> >>> - Relocated debugging messages in isp4sd_stop_stream() to execute und=
er lock protection due to access to output_info->start_status.
> >>> - Eliminated redundant GET_REG_BASE() macros.
> >>> - Removed isp4sd_is_stream_running() function.
> >>> - Corrected error message in isp4sd_init_stream() caused by copy/past=
e.
> >>> - Refined struct isp4_interface to remove firmware ring buffer config=
urations.
> >>> - Removed obsolete isp4sd_is_stream_running function.
> >>> - Removed pdev member from struct isp4_device, as it is unnecessary.
> >>> - Fixed typo in 'isp_mmip' parameter name within isp4if_init().
> >>> - Removed gap in struct isp4_subdev definition.
> >>> - Performed extensive dead code removal and minor style improvements =
throughout the codebase.
> >>>
> >>>
> >>> Changes v4 -> v5:
> >>>
> >>> - Transitioned VIDEOBUF2_V4L2 from 'depends' to 'select' within Kconf=
ig.
> >>> - Standardized object file naming conventions in the Makefile and sor=
ted entries alphabetically.
> >>> - Removed the unused macro definition to_isp4_device.
> >>> - Eliminated unused members mem_domain and mem_align from struct isp4=
if_gpu_mem_info.
> >>> - Deleted unused fields mc_addr and gpu_pkg from struct isp4if_cmd_el=
ement.
> >>> - Removed obsolete pltf_data, i2c_nb, and notifier elements from stru=
ct isp4_device.
> >>> - Updated platform_get_irq failure handling to return its actual resu=
lt rather than -ENODEV.
> >>> - Refined inclusion of header files for clarity and efficiency.
> >>> - Appended comments following #endif statements in header files.
> >>> - Improved implementation of isp4if_gpu_mem_free and isp4if_dealloc_f=
w_gpumem.
> >>> - Removed isp4if_append_cmd_2_cmdq and revised isp4if_send_fw_cmd acc=
ordingly.
> >>> - Enhanced isp4if_clear_cmdq and isp4if_clear_bufq by eliminating unn=
ecessary list_del operations.
> >>> - Adopted completion mechanism instead of wait queue and condition fo=
r command completion notifications.
> >>> - Employed memset to ensure proper zeroing of padding bits in structu=
res shared between ISP driver and firmware.
> >>> - Streamlined IRQs, reducing total from four to two, retaining only e=
ssential ones.
> >>> - Optimized IRQ handler logic using a while loop for greater efficien=
cy.
> >>> - Introduced dynamic IRQ enable/disable functionality based on camera=
 status (open/close).
> >>> - Applied distinct identifiers to differentiate multiple threads and =
IRQs.
> >>> - Removed unnecessary initialization of local variables.
> >>> - Refined camera start/stop workflow to mitigate potential synchroniz=
ation concerns.
> >>> - Replaced all remaining mutex with guard mutex.
> >>> - Enhanced command and buffer queue performance by substituting mutex=
es with spinlocks.
> >>> - Removed redundant isp4sd_init_meta_buf function and its references.
> >>> - Limited firmware logging activities to the stream1 thread.
> >>> - Relocated v4l2_device_unregister_subdev() and media_entity_cleanup(=
) calls from isp4_capture_remove to isp4sd_deinit.
> >>> - Resolved media device registration sequence issues.
> >>> - Modified stream processing thread behavior to await IRQ without a t=
imeout.
> >>> - Addressed cleanup procedures in video device initialization and dei=
nitialization routines.
> >>> - Corrected typos and made other cosmetic improvements.
> >>>
> >>>
> >>> Changes v3 -> v4:
> >>>
> >>> - Replace one mutex with guard mutex.
> >>> - Remove unnecessary bus_info initialization of v4l2_capability.
> >>> - Drop V4L2_CAP_IO_MC from capabilities of v4l2_capability.
> >>> - Modify document with better SOC description.
> >>> - Fix Test x86 failure in Media CI test https://linux-media.pages.fre=
edesktop.org/-/users/patchwork/-/jobs/83470456/artifacts/report.htm
> >>> - Modify some commit messages by describing changes in imperative moo=
d.
> >>> - Add media-ctl output in cover letter.
> >>> - Create separated dedicated amdgpu patch to add declaration MODULE_F=
IRMWARE("amdgpu/isp_4_1_1.bin");
> >>> - Fix typo errors and other cosmetic issues.
> >>> - Add DRM_AMD_ISP dependency in Kconfig.
> >>>
> >>>
> >>> Changes v2 -> v3:
> >>>
> >>> - All the dependent patches in other modules (drm/amd/amdgpu, platfor=
m/x86, pinctrl/amd) merged on upstream mainline kernel (https://github.com/=
torvalds/linux) v6.17.
> >>> - Removed usage of amdgpu structs in ISP driver. Added helper functio=
ns in amdgpu accepting opaque params from ISP driver to allocate and releas=
e ISP GART buffers.
> >>> - Moved sensor and MIPI phy control entirely into ISP FW instead of t=
he previous hybrid approach controlling sensor from both FW and x86 (sensor=
 driver).
> >>> - Removed phy configuration and sensor binding as x86 (sensor driver)=
 had relinquished the sensor control for ISP FW. With this approach the dri=
ver will be exposed as web camera like interface.
> >>> - New FW with built-in sensor driver is submitted on upstream linux-f=
irmware repo (https://gitlab.com/kernel-firmware/linux-firmware/).
> >>> - Please note the new FW submitted is not directly compatible with OE=
M Kernel ISP4.0 (https://github.com/amd/Linux_ISP_Kernel/tree/4.0) and the =
previous ISP V2 patch series.
> >>> - If intend to use the new FW, please rebuild OEM ISP4.0 Kernel with =
CONFIG_VIDEO_OV05C10=3DN and CONFIG_PINCTRL_AMDISP=3DY.
> >>> - Included critical fixes from Sultan Alsawaf branch (https://github.=
com/kerneltoast/kernel_x86_laptop.git) related to managing lifetime of isp =
buffers.
> >>>        media: amd: isp4: Add missing refcount tracking to mmap memop
> >>>        media: amd: isp4: Don't put or unmap the dmabuf when detaching
> >>>        media: amd: isp4: Don't increment refcount when dmabuf export =
fails
> >>>        media: amd: isp4: Fix possible use-after-free in isp4vid_vb2_p=
ut()
> >>>        media: amd: isp4: Always export a new dmabuf from get_dmabuf m=
emop
> >>>        media: amd: isp4: Fix implicit dmabuf lifetime tracking
> >>>        media: amd: isp4: Fix possible use-after-free when putting imp=
licit dmabuf
> >>>        media: amd: isp4: Simplify isp4vid_get_dmabuf() arguments
> >>>        media: amd: isp4: Move up buf->vaddr check in isp4vid_get_dmab=
uf()
> >>>        media: amd: isp4: Remove unused userptr memops
> >>>        media: amd: isp4: Add missing cleanup on error in isp4vid_vb2_=
alloc()
> >>>        media: amd: isp4: Release queued buffers on error in start_str=
eaming
> >>> - Addressed all code related upstream comments
> >>> - Fix typo errors and other cosmetic issues.
> >>>
> >>>
> >>> Changes v1 -> v2:
> >>>
> >>> - Fix media CI test errors and valid warnings
> >>> - Reduce patch number in the series from 9 to 8 by merging MAINTAINER=
S adding patch to the first patch
> >>> - In patch 5
> >>>          - do modification to use remote endpoint instead of local en=
dpoint
> >>>          - use link frequency and port number as start phy parameter =
instead of extra added phy-id and phy-bit-rate property of endpoint
> >>>
> >>> ----------
> >>>
> >>> It passes v4l2 compliance test, the test reports for:
> >>>
> >>> (a) amd_isp_capture device /dev/video0
> >>>
> >>> Compliance test for amd_isp_capture device /dev/video0:
> >>> -------------------------------------------------------
> >>>
> >>> atg@atg-HP-PV:~/bin$ ./v4l2-compliance -d /dev/video0
> >>> v4l2-compliance 1.29.0-5348, 64 bits, 64-bit time_t
> >>> v4l2-compliance SHA: 75e3f0e2c2cb 2025-03-17 18:12:17
> >>>
> >>> Compliance test for amd_isp_capture device /dev/video0:
> >>>
> >>> Driver Info:
> >>>          Driver name      : amd_isp_capture
> >>>          Card type        : amd_isp_capture
> >>>          Bus info         : platform:amd_isp_capture
> >>>          Driver version   : 6.14.0
> >>>          Capabilities     : 0xa4200001
> >>>                  Video Capture
> >>>                  I/O MC
> >>>                  Streaming
> >>>                  Extended Pix Format
> >>>                  Device Capabilities
> >>>          Device Caps      : 0x24200001
> >>>                  Video Capture
> >>>                  I/O MC
> >>>                  Streaming
> >>>                  Extended Pix Format
> >>> Media Driver Info:
> >>>          Driver name      : amd_isp_capture
> >>>          Model            : amd_isp41_mdev
> >>>          Serial           :
> >>>          Bus info         : platform:amd_isp_capture
> >>>          Media version    : 6.14.0
> >>>          Hardware revision: 0x00000000 (0)
> >>>          Driver version   : 6.14.0
> >>> Interface Info:
> >>>          ID               : 0x03000005
> >>>          Type             : V4L Video
> >>> Entity Info:
> >>>          ID               : 0x00000003 (3)
> >>>          Name             : Preview
> >>>          Function         : V4L2 I/O
> >>>          Pad 0x01000004   : 0: Sink
> >>>            Link 0x02000007: from remote pad 0x1000002 of entity 'amd =
isp4' (Image Signal Processor): Data, Enabled, Immutable
> >>>
> >>> Required ioctls:
> >>>          test MC information (see 'Media Driver Info' above): OK
> >>>          test VIDIOC_QUERYCAP: OK
> >>>          test invalid ioctls: OK
> >>>
> >>> Allow for multiple opens:
> >>>          test second /dev/video0 open: OK
> >>>          test VIDIOC_QUERYCAP: OK
> >>>          test VIDIOC_G/S_PRIORITY: OK
> >>>          test for unlimited opens: OK
> >>>
> >>> Debug ioctls:
> >>>          test VIDIOC_DBG_G/S_REGISTER: OK (Not Supported)
> >>>          test VIDIOC_LOG_STATUS: OK (Not Supported)
> >>>
> >>> Input ioctls:
> >>>          test VIDIOC_G/S_TUNER/ENUM_FREQ_BANDS: OK (Not Supported)
> >>>          test VIDIOC_G/S_FREQUENCY: OK (Not Supported)
> >>>          test VIDIOC_S_HW_FREQ_SEEK: OK (Not Supported)
> >>>          test VIDIOC_ENUMAUDIO: OK (Not Supported)
> >>>          test VIDIOC_G/S/ENUMINPUT: OK
> >>>          test VIDIOC_G/S_AUDIO: OK (Not Supported)
> >>>          Inputs: 1 Audio Inputs: 0 Tuners: 0
> >>>
> >>> Output ioctls:
> >>>          test VIDIOC_G/S_MODULATOR: OK (Not Supported)
> >>>          test VIDIOC_G/S_FREQUENCY: OK (Not Supported)
> >>>          test VIDIOC_ENUMAUDOUT: OK (Not Supported)
> >>>          test VIDIOC_G/S/ENUMOUTPUT: OK (Not Supported)
> >>>          test VIDIOC_G/S_AUDOUT: OK (Not Supported)
> >>>          Outputs: 0 Audio Outputs: 0 Modulators: 0
> >>>
> >>> Input/Output configuration ioctls:
> >>>          test VIDIOC_ENUM/G/S/QUERY_STD: OK (Not Supported)
> >>>          test VIDIOC_ENUM/G/S/QUERY_DV_TIMINGS: OK (Not Supported)
> >>>          test VIDIOC_DV_TIMINGS_CAP: OK (Not Supported)
> >>>          test VIDIOC_G/S_EDID: OK (Not Supported)
> >>>
> >>> Control ioctls (Input 0):
> >>>          test VIDIOC_QUERY_EXT_CTRL/QUERYMENU: OK (Not Supported)
> >>>          test VIDIOC_QUERYCTRL: OK (Not Supported)
> >>>          test VIDIOC_G/S_CTRL: OK (Not Supported)
> >>>          test VIDIOC_G/S/TRY_EXT_CTRLS: OK (Not Supported)
> >>>          test VIDIOC_(UN)SUBSCRIBE_EVENT/DQEVENT: OK (Not Supported)
> >>>          test VIDIOC_G/S_JPEGCOMP: OK (Not Supported)
> >>>          Standard Controls: 0 Private Controls: 0
> >>>
> >>> Format ioctls (Input 0):
> >>>          test VIDIOC_ENUM_FMT/FRAMESIZES/FRAMEINTERVALS: OK
> >>>          test VIDIOC_G/S_PARM: OK
> >>>          test VIDIOC_G_FBUF: OK (Not Supported)
> >>>          test VIDIOC_G_FMT: OK
> >>>          test VIDIOC_TRY_FMT: OK
> >>>          test VIDIOC_S_FMT: OK
> >>>          test VIDIOC_G_SLICED_VBI_CAP: OK (Not Supported)
> >>>          test Cropping: OK (Not Supported)
> >>>          test Composing: OK (Not Supported)
> >>>          test Scaling: OK (Not Supported)
> >>>
> >>> Codec ioctls (Input 0):
> >>>          test VIDIOC_(TRY_)ENCODER_CMD: OK (Not Supported)
> >>>          test VIDIOC_G_ENC_INDEX: OK (Not Supported)
> >>>          test VIDIOC_(TRY_)DECODER_CMD: OK (Not Supported)
> >>>
> >>> Buffer ioctls (Input 0):
> >>>          test VIDIOC_REQBUFS/CREATE_BUFS/QUERYBUF: OK
> >>>          test CREATE_BUFS maximum buffers: OK
> >>>          test VIDIOC_REMOVE_BUFS: OK
> >>>          test VIDIOC_EXPBUF: OK
> >>>          test Requests: OK (Not Supported)
> >>>          test blocking wait: OK
> >>>
> >>> Total for amd_isp_capture device /dev/video0: 49, Succeeded: 49, Fail=
ed: 0, Warnings: 0
> >>>
> >>> The media-ctl output of media device /dev/media0:
> >>> -------------------------------------------------------
> >>>
> >>> atg@atg-HP-PV:~$ media-ctl -p -d /dev/media0
> >>> Media controller API version 6.17.0
> >>>
> >>> Media device information
> >>> ------------------------
> >>> driver          amd_isp_capture
> >>> model           amd_isp41_mdev
> >>> serial
> >>> bus info        platform:amd_isp_capture
> >>> hw revision     0x0
> >>> driver version  6.17.0
> >>>
> >>> Device topology
> >>> - entity 1: amd isp4 (1 pad, 1 link, 0 routes)
> >>>              type V4L2 subdev subtype Unknown flags 0
> >>>          pad0: Source
> >>>                  -> "Preview":0 [ENABLED,IMMUTABLE]
> >>>
> >>> - entity 3: Preview (1 pad, 1 link)
> >>>              type Node subtype V4L flags 0
> >>>              device node name /dev/video0
> >>>          pad0: Sink
> >>>                  <- "amd isp4":0 [ENABLED,IMMUTABLE]
> >>>
> >>> Please review and provide feedback.
> >>>
> >>> Many thanks,
> >>>
> >>> Bin Du (7):
> >>>    media: platform: amd: Introduce amd isp4 capture driver
> >>>    media: platform: amd: low level support for isp4 firmware
> >>>    media: platform: amd: Add isp4 fw and hw interface
> >>>    media: platform: amd: isp4 subdev and firmware loading handling ad=
ded
> >>>    media: platform: amd: isp4 video node and buffers handling added
> >>>    media: platform: amd: isp4 debug fs logging and  more descriptive
> >>>      errors
> >>>    Documentation: add documentation of AMD isp 4 driver
> >>>
> >>>   Documentation/admin-guide/media/amdisp4-1.rst |   63 +
> >>>   Documentation/admin-guide/media/amdisp4.dot   |    6 +
> >>>   .../admin-guide/media/v4l-drivers.rst         |    1 +
> >>>   MAINTAINERS                                   |   25 +
> >>>   drivers/media/platform/Kconfig                |    1 +
> >>>   drivers/media/platform/Makefile               |    1 +
> >>>   drivers/media/platform/amd/Kconfig            |    3 +
> >>>   drivers/media/platform/amd/Makefile           |    3 +
> >>>   drivers/media/platform/amd/isp4/Kconfig       |   14 +
> >>>   drivers/media/platform/amd/isp4/Makefile      |   10 +
> >>>   drivers/media/platform/amd/isp4/isp4.c        |  235 ++++
> >>>   drivers/media/platform/amd/isp4/isp4.h        |   20 +
> >>>   drivers/media/platform/amd/isp4/isp4_debug.c  |  271 ++++
> >>>   drivers/media/platform/amd/isp4/isp4_debug.h  |   41 +
> >>>   .../platform/amd/isp4/isp4_fw_cmd_resp.h      |  314 +++++
> >>>   drivers/media/platform/amd/isp4/isp4_hw_reg.h |  124 ++
> >>>   .../media/platform/amd/isp4/isp4_interface.c  |  789 +++++++++++
> >>>   .../media/platform/amd/isp4/isp4_interface.h  |  141 ++
> >>>   drivers/media/platform/amd/isp4/isp4_subdev.c | 1057 ++++++++++++++=
+
> >>>   drivers/media/platform/amd/isp4/isp4_subdev.h |  131 ++
> >>>   drivers/media/platform/amd/isp4/isp4_video.c  | 1165 ++++++++++++++=
+++
> >>>   drivers/media/platform/amd/isp4/isp4_video.h  |   65 +
> >>>   22 files changed, 4480 insertions(+)
> >>>   create mode 100644 Documentation/admin-guide/media/amdisp4-1.rst
> >>>   create mode 100644 Documentation/admin-guide/media/amdisp4.dot
> >>>   create mode 100644 drivers/media/platform/amd/Kconfig
> >>>   create mode 100644 drivers/media/platform/amd/Makefile
> >>>   create mode 100644 drivers/media/platform/amd/isp4/Kconfig
> >>>   create mode 100644 drivers/media/platform/amd/isp4/Makefile
> >>>   create mode 100644 drivers/media/platform/amd/isp4/isp4.c
> >>>   create mode 100644 drivers/media/platform/amd/isp4/isp4.h
> >>>   create mode 100644 drivers/media/platform/amd/isp4/isp4_debug.c
> >>>   create mode 100644 drivers/media/platform/amd/isp4/isp4_debug.h
> >>>   create mode 100644 drivers/media/platform/amd/isp4/isp4_fw_cmd_resp=
.h
> >>>   create mode 100644 drivers/media/platform/amd/isp4/isp4_hw_reg.h
> >>>   create mode 100644 drivers/media/platform/amd/isp4/isp4_interface.c
> >>>   create mode 100644 drivers/media/platform/amd/isp4/isp4_interface.h
> >>>   create mode 100644 drivers/media/platform/amd/isp4/isp4_subdev.c
> >>>   create mode 100644 drivers/media/platform/amd/isp4/isp4_subdev.h
> >>>   create mode 100644 drivers/media/platform/amd/isp4/isp4_video.c
> >>>   create mode 100644 drivers/media/platform/amd/isp4/isp4_video.h
> >>>
> >>> --
> >>> 2.34.1
> >>>
> >>>
> >>
> >> v7 worked on my HP ZBook Ultra G1a 14 inch Mobile Workstation PC and
> >> the camera worked fine.
> >> It was tested with the latest upstream firmware [1] and 6.19-rc3 kerne=
l.
> >>
> >> [1] https://git.kernel.org/pub/scm/linux/kernel/git/firmware/linux-fir=
mware.git/tree/amdgpu/isp_4_1_1.bin
> >>
> >> Thank you for your work :)
> >>
> >> --
> >> BR,
> >> Kate
> > Leave a "Tested-by" tag for my previous testing assertion.
> >
> > Tested-by: Kate Hsuan <hpa@redhat.com>
> >
> >
> >
>
> --
> Regards,
> Bin
>

The ISP driver works perfectly with a clear and sharp video. I tested
it again, and I found a suspend/resume issue.
The ISP can't suspend when the system is set to suspend. The privacy
LED is on when the system is suspended. Therefore, the user will see a
luminous privacy LED when the system is set to suspend.
Today, I made a work to move all the power control to use the runtime
PM, including suspend/resume. This work may be humble and may break
the finite state machine but it works. The major changes of it
include:
1. Support suspend/resume.
2. The power is managed by the runtime PM so the s_power and the related
   callback function were dropped.
3. The enable_isp GPIO pin is controlled by the runtime PM.
4. pm_runtime_get_noresume() is used to get the runtime PM at probe()
   since the device doesn't have to be set to power on when initialising.

This work stops the video stream on suspend and starts the stream on
resume so the privacy LED is turned on and turned off with the changes
of suspend and resume.

Could you please consider this patch and idea?

Thank you :)

--=20
BR,
Kate

--0000000000003d45cc06484591c5
Content-Type: text/x-patch; charset="UTF-8"; 
	name="0001-media-platform-amd-isp4-support-suspend-resume-using.patch"
Content-Disposition: attachment; 
	filename="0001-media-platform-amd-isp4-support-suspend-resume-using.patch"
Content-Transfer-Encoding: base64
Content-ID: <f_mkco0ihs0>
X-Attachment-Id: f_mkco0ihs0

RnJvbSA2MmZmNTNkZWQ1YzU0ZjVhYWZmM2Y0Njc1NGU5NzIwYmIwZTBjYWQ2IE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBLYXRlIEhzdWFuIDxocGFAcmVkaGF0LmNvbT4KRGF0ZTogVHVl
LCAxMyBKYW4gMjAyNiAyMToyMDo0MiArMDgwMApTdWJqZWN0OiBbUEFUQ0hdIG1lZGlhOiBwbGF0
Zm9ybTogYW1kOiBpc3A0OiBzdXBwb3J0IHN1c3BlbmQvcmVzdW1lIHVzaW5nCiBydW50aW1lIFBN
CgpUaGlzIHdvcmsgZW5hYmxlcyB0aGUgc3VzcGVuZC9yZXN1bWUgZmVhdHVyZSBvZiB0aGUgSVNQ
NC4gVGhlIG1ham9yCmNoYW5nZXMgaW5jbHVkZXM6CjEuIFN1cHBvcnQgc3VzcGVuZC9yZXN1bWUu
CjIuIFRoZSBwb3dlciBpcyBtYW5hZ2VkIGJ5IHRoZSBydW50aW1lIFBNIHNvIHRoZSBzX3Bvd2Vy
IGFuZCB0aGUgcmVsYXRlZArCoCDCoGNhbGxiYWNrIGZ1bmN0aW9uIHdlcmUgZHJvcHBlZC4KMy4g
VGhlIGVuYWJsZV9pc3AgR1BJTyBwaW4gaXMgY29udHJvbGxlZCBieSB0aGUgcnVudGltZSBQTS4K
NC4gcG1fcnVudGltZV9nZXRfbm9yZXN1bWUoKSBpcyB1c2VkIHRvIGdldCB0aGUgcnVudGltZSBQ
TSBhdCBwcm9iZSgpCsKgIMKgc2luY2UgdGhlIGRldmljZSBkb2Vzbid0IGhhdmUgdG8gYmUgc2V0
IHRvIHBvd2VyIG9uIHdoZW4gaW5pdGlhbGlzaW5nLgoKU2lnbmVkLW9mZi1ieTogS2F0ZSBIc3Vh
biA8aHBhQHJlZGhhdC5jb20+Ci0tLQogZHJpdmVycy9tZWRpYS9wbGF0Zm9ybS9hbWQvaXNwNC9p
c3A0LmMgICAgICAgIHwgNTUgKysrKysrKysrKysrKysrKysrLQogZHJpdmVycy9tZWRpYS9wbGF0
Zm9ybS9hbWQvaXNwNC9pc3A0X3N1YmRldi5jIHwgNDggKysrKysrKysrLS0tLS0tLQogMiBmaWxl
cyBjaGFuZ2VkLCA4MiBpbnNlcnRpb25zKCspLCAyMSBkZWxldGlvbnMoLSkKCmRpZmYgLS1naXQg
YS9kcml2ZXJzL21lZGlhL3BsYXRmb3JtL2FtZC9pc3A0L2lzcDQuYyBiL2RyaXZlcnMvbWVkaWEv
cGxhdGZvcm0vYW1kL2lzcDQvaXNwNC5jCmluZGV4IGYzNWJjOGYxYTI1OS4uODdhMDdiNTkzNTZm
IDEwMDY0NAotLS0gYS9kcml2ZXJzL21lZGlhL3BsYXRmb3JtL2FtZC9pc3A0L2lzcDQuYworKysg
Yi9kcml2ZXJzL21lZGlhL3BsYXRmb3JtL2FtZC9pc3A0L2lzcDQuYwpAQCAtMTYwLDEwICsxNjAs
MTMgQEAgc3RhdGljIGludCBpc3A0X2NhcHR1cmVfcHJvYmUoc3RydWN0IHBsYXRmb3JtX2Rldmlj
ZSAqcGRldikKIAkJZ290byBlcnJfY2xlYW5fbWVkaWE7CiAJfQogCi0JcG1fcnVudGltZV9zZXRf
c3VzcGVuZGVkKGRldik7Ci0JcG1fcnVudGltZV9lbmFibGUoZGV2KTsKIAlzcGluX2xvY2tfaW5p
dCgmaXNwX3N1YmRldi0+aXJxX2xvY2spOwogCXJldCA9IGlzcDRzZF9pbml0KCZpc3BfZGV2LT5p
c3Bfc3ViZGV2LCAmaXNwX2Rldi0+djRsMl9kZXYsIGlycSk7CisKKwlwbV9ydW50aW1lX3NldF9h
Y3RpdmUoZGV2KTsKKwlwbV9ydW50aW1lX2dldF9ub3Jlc3VtZShkZXYpOworCXBtX3J1bnRpbWVf
ZW5hYmxlKGRldik7CisKIAlpZiAocmV0KSB7CiAJCWRldl9lcnJfcHJvYmUoZGV2LCByZXQsICJm
YWlsIGluaXQgaXNwNCBzdWIgZGV2XG4iKTsKIAkJZ290byBlcnJfcG1fZGlzYWJsZTsKQEAgLTE4
OCw2ICsxOTEsMTAgQEAgc3RhdGljIGludCBpc3A0X2NhcHR1cmVfcHJvYmUoc3RydWN0IHBsYXRm
b3JtX2RldmljZSAqcGRldikKIAlwbGF0Zm9ybV9zZXRfZHJ2ZGF0YShwZGV2LCBpc3BfZGV2KTsK
IAlpc3BfZGVidWdmc19jcmVhdGUoaXNwX2Rldik7CiAKKwlwbV9ydW50aW1lX3NldF9hdXRvc3Vz
cGVuZF9kZWxheShkZXYsIDEwMDApOworCXBtX3J1bnRpbWVfdXNlX2F1dG9zdXNwZW5kKGRldik7
CisJcG1fcnVudGltZV9wdXRfYXV0b3N1c3BlbmQoZGV2KTsKKwogCXJldHVybiAwOwogCiBlcnJf
aXNwNF9kZWluaXQ6CkBAIC0yMDEsNiArMjA4LDQyIEBAIHN0YXRpYyBpbnQgaXNwNF9jYXB0dXJl
X3Byb2JlKHN0cnVjdCBwbGF0Zm9ybV9kZXZpY2UgKnBkZXYpCiAJcmV0dXJuIHJldDsKIH0KIAor
c3RhdGljIGludCBpc3A0X3N1c3BlbmQoc3RydWN0IGRldmljZSAqZGV2KQoreworCXN0cnVjdCBp
c3A0X2RldmljZSAqaXNwX2RldiA9ICBkZXZfZ2V0X2RydmRhdGEoZGV2KTsKKwlzdHJ1Y3QgaXNw
NF9zdWJkZXYgKmlzcF9zdWJkZXYgPSAmaXNwX2Rldi0+aXNwX3N1YmRldjsKKwlpbnQgcmV0ID0g
MDsKKwlkZXZfZGJnKGRldiwgIklTUDQgcG93ZXIgb2ZmXG4iKTsKKworCXY0bDJfc3ViZGV2X2Rp
c2FibGVfc3RyZWFtcyAoJmlzcF9zdWJkZXYtPnNkZXYsIGlzcF9zdWJkZXYtPmlzcF92ZGV2LnZk
ZXZfcGFkLmluZGV4LCBCSVQoMCkpOworCXJldCA9IGdwaW9kX3NldF92YWx1ZShpc3Bfc3ViZGV2
LT5lbmFibGVfZ3BpbywgMCk7CisJaWYgKHJldCkgeworCQlkZXZfZXJyKGRldiwgImZhaWwgdG8g
c2V0IGVuYWJsZV9pc3AgZ3Bpb1xuIik7CisJCXJldHVybiByZXQ7CisJfQorCisJcmV0dXJuIDA7
Cit9CisKK3N0YXRpYyBpbnQgaXNwNF9yZXN1bWUoc3RydWN0IGRldmljZSAqZGV2KQoreworCXN0
cnVjdCBpc3A0X2RldmljZSAqaXNwX2RldiA9ICBkZXZfZ2V0X2RydmRhdGEoZGV2KTsKKwlzdHJ1
Y3QgaXNwNF9zdWJkZXYgKmlzcF9zdWJkZXYgPSAmaXNwX2Rldi0+aXNwX3N1YmRldjsKKwlpbnQg
cmV0OworCWRldl9kYmcoZGV2LCAiSVNQNCBwb3dlciBvbiBcbiIpOworCisJcmV0ID0gIGdwaW9k
X3NldF92YWx1ZShpc3Bfc3ViZGV2LT5lbmFibGVfZ3BpbywgMSk7CisJaWYgKHJldCkgeworCQlk
ZXZfZXJyKGRldiwgImZhaWwgdG8gc2V0IGVuYWJsZV9pc3AgZ3Bpb1xuIik7CisJCXJldHVybiBy
ZXQ7CisJfQorCisJcmV0dXJuIDA7Cit9CisKK3N0YXRpYyBERUZJTkVfUlVOVElNRV9ERVZfUE1f
T1BTKGlzcDRfcG1fb3BzLCBpc3A0X3N1c3BlbmQsCisJaXNwNF9yZXN1bWUsIE5VTEwpOworCiBz
dGF0aWMgdm9pZCBpc3A0X2NhcHR1cmVfcmVtb3ZlKHN0cnVjdCBwbGF0Zm9ybV9kZXZpY2UgKnBk
ZXYpCiB7CiAJc3RydWN0IGlzcDRfZGV2aWNlICppc3BfZGV2ID0gcGxhdGZvcm1fZ2V0X2RydmRh
dGEocGRldik7CkBAIC0yMTMsNiArMjU2LDEzIEBAIHN0YXRpYyB2b2lkIGlzcDRfY2FwdHVyZV9y
ZW1vdmUoc3RydWN0IHBsYXRmb3JtX2RldmljZSAqcGRldikKIAl2NGwyX2RldmljZV91bnJlZ2lz
dGVyKCZpc3BfZGV2LT52NGwyX2Rldik7CiAJbWVkaWFfZGV2aWNlX2NsZWFudXAoJmlzcF9kZXYt
Pm1kZXYpOwogCXBtX3J1bnRpbWVfZGlzYWJsZShkZXYpOworCisJLyoKKwkgKiBFbnN1cmUgdGhl
IHBvd2VyIGlzIG9mZiBiZWZvcmUgcmVtb3ZpbmcgdGhlIGRldmljZS4KKwkgKi8KKwlpZiAoIXBt
X3J1bnRpbWVfc3RhdHVzX3N1c3BlbmRlZChkZXYpKQorCQlpc3A0X3N1c3BlbmQoZGV2KTsKKwlw
bV9ydW50aW1lX3NldF9zdXNwZW5kZWQoZGV2KTsKIH0KIAogc3RhdGljIHN0cnVjdCBwbGF0Zm9y
bV9kcml2ZXIgaXNwNF9jYXB0dXJlX2RydiA9IHsKQEAgLTIyMCw2ICsyNzAsNyBAQCBzdGF0aWMg
c3RydWN0IHBsYXRmb3JtX2RyaXZlciBpc3A0X2NhcHR1cmVfZHJ2ID0gewogCS5yZW1vdmUgPSBp
c3A0X2NhcHR1cmVfcmVtb3ZlLAogCS5kcml2ZXIgPSB7CiAJCS5uYW1lID0gSVNQNF9EUlZfTkFN
RSwKKwkJLnBtID0gcG1fc2xlZXBfcHRyKCZpc3A0X3BtX29wcyksCiAJfQogfTsKIApkaWZmIC0t
Z2l0IGEvZHJpdmVycy9tZWRpYS9wbGF0Zm9ybS9hbWQvaXNwNC9pc3A0X3N1YmRldi5jIGIvZHJp
dmVycy9tZWRpYS9wbGF0Zm9ybS9hbWQvaXNwNC9pc3A0X3N1YmRldi5jCmluZGV4IDI2MTJjYTI4
M2ZjMC4uZDUzZjJhYjY2NzgzIDEwMDY0NAotLS0gYS9kcml2ZXJzL21lZGlhL3BsYXRmb3JtL2Ft
ZC9pc3A0L2lzcDRfc3ViZGV2LmMKKysrIGIvZHJpdmVycy9tZWRpYS9wbGF0Zm9ybS9hbWQvaXNw
NC9pc3A0X3N1YmRldi5jCkBAIC03MzAsNiArNzMwLDEyIEBAIHN0YXRpYyBpbnQgaXNwNHNkX3B3
cm9uX2FuZF9pbml0KHN0cnVjdCBpc3A0X3N1YmRldiAqaXNwX3N1YmRldikKIAkJZW5hYmxlX2ly
cShpc3Bfc3ViZGV2LT5pcnFbaV0pOwogCWlzcF9zdWJkZXYtPmlycV9lbmFibGVkID0gdHJ1ZTsK
IAorCS8qCisJICogSGFyZHdhcmUgcmVxdWlyZXMgYXQgbGVhc3QgYSAyMG1zIGRlbGF5IGJldHdl
ZW4gZGlzYWJsaW5nIGFuZCBlbmFibGluZyB0aGUgbW9kdWxlLAorCSAqIHNvIGEgc2xlZXAgaXMg
YWRkZWQgdG8gZW5zdXJlIElTUCBzdGFiaWxpdHkgZHVyaW5nIHF1aWNrIHJlb3BlbiBzY2VuYXJp
b3MuCisJICovCisJbXNsZWVwKDIwKTsKKwogCXJldHVybiAwOwogZXJyX2RlaW5pdDoKIAlpc3A0
c2RfcHdyb2ZmX2FuZF9kZWluaXQoaXNwX3N1YmRldik7CkBAIC03NDgsNiArNzU0LDExIEBAIHN0
YXRpYyBpbnQgaXNwNHNkX3N0b3Bfc3RyZWFtKHN0cnVjdCBpc3A0X3N1YmRldiAqaXNwX3N1YmRl
diwKIAlndWFyZChtdXRleCkoJmlzcF9zdWJkZXYtPm9wc19tdXRleCk7CiAJZGV2X2RiZyhkZXYs
ICJzdGF0dXMgJWlcbiIsIG91dHB1dF9pbmZvLT5zdGFydF9zdGF0dXMpOwogCisJaWYgKG91dHB1
dF9pbmZvLT5zdGFydF9zdGF0dXMgPT0gSVNQNFNEX1NUQVJUX1NUQVRVU19PRkYpIHsKKwkJZGV2
X2RiZyhkZXYsICJzdHJlYW0gYWxyZWFkeSBzdG9wcGVkLCBkbyBub3RoaW5nXG4iKTsKKwkJcmV0
dXJuIDA7CisJfQorCiAJaWYgKG91dHB1dF9pbmZvLT5zdGFydF9zdGF0dXMgPT0gSVNQNFNEX1NU
QVJUX1NUQVRVU19TVEFSVEVEKSB7CiAJCXN0cnVjdCBpc3A0ZndfY21kX2VuYWJsZV9vdXRfY2gg
Y21kX2NoX2Rpc2FibGU7CiAKQEAgLTc4MSw2ICs3OTIsMTQgQEAgc3RhdGljIGludCBpc3A0c2Rf
c3RvcF9zdHJlYW0oc3RydWN0IGlzcDRfc3ViZGV2ICppc3Bfc3ViZGV2LAogCiAJaXNwNHNkX3Vu
aW5pdF9zdHJlYW0oaXNwX3N1YmRldiwgc3RhdGUsIHBhZCk7CiAKKwlpc3A0c2RfcHdyb2ZmX2Fu
ZF9kZWluaXQoaXNwX3N1YmRldik7CisKKwlyZXQgPSBwbV9ydW50aW1lX3B1dChpc3Bfc3ViZGV2
LT5zZGV2LmRldik7CisJaWYgKHJldCkgeworCQlkZXZfZXJyKGRldiwgImZhaWwgb24gcG1fcnVu
dGltZV9wdXRcbiIpOworCQlyZXR1cm4gcmV0OworCX0KKwogCS8qCiAJICogUmV0dXJuIHN1Y2Nl
c3MgdG8gZW5zdXJlIHRoZSBzdG9wIHByb2Nlc3MgcHJvY2VlZHMsCiAJICogYW5kIGRpc3JlZ2Fy
ZCBhbnkgZXJyb3JzIHNpbmNlIHRoZXkgYXJlIG5vdCBmYXRhbC4KQEAgLTc5OSw5ICs4MTgsMTYg
QEAgc3RhdGljIGludCBpc3A0c2Rfc3RhcnRfc3RyZWFtKHN0cnVjdCBpc3A0X3N1YmRldiAqaXNw
X3N1YmRldiwKIAogCWd1YXJkKG11dGV4KSgmaXNwX3N1YmRldi0+b3BzX211dGV4KTsKIAotCWlm
IChpc3BpZi0+c3RhdHVzICE9IElTUDRJRl9TVEFUVVNfRldfUlVOTklORykgewotCQlkZXZfZXJy
KGRldiwgImZhaWwsIGJhZCBmc20gJWQiLCBpc3BpZi0+c3RhdHVzKTsKLQkJcmV0dXJuIC1FSU5W
QUw7CisJcmV0ID0gcG1fcnVudGltZV9yZXN1bWVfYW5kX2dldChpc3Bfc3ViZGV2LT5zZGV2LmRl
dik7CisJaWYgKHJldCkgeworCQlkZXZfZXJyKGRldiwgImZhaWwgdG8gZ2V0IHJ1bnRpbWUgcG1c
biIpOworCQlyZXR1cm4gcmV0OworCX0KKworCXJldCA9IGlzcDRzZF9wd3Jvbl9hbmRfaW5pdChp
c3Bfc3ViZGV2KTsKKwlpZiAocmV0KSB7CisJCWRldl9lcnIoZGV2LCAiZmFpbCB0byBwb3dlciBv
biBpc3Bfc3ViZGV2IHJldCAlZFxuIiwgcmV0KTsKKwkJcmV0dXJuIHJldDsKIAl9CiAKIAlzd2l0
Y2ggKG91dHB1dF9pbmZvLT5zdGFydF9zdGF0dXMpIHsKQEAgLTg5NCwyMSArOTIwLDYgQEAgc3Rh
dGljIGludCBpc3A0c2RfaW9jX3NlbmRfaW1nX2J1ZihzdHJ1Y3QgdjRsMl9zdWJkZXYgKnNkLAog
CXJldHVybiByZXQ7CiB9CiAKLXN0YXRpYyBpbnQgaXNwNHNkX3NldF9wb3dlcihzdHJ1Y3QgdjRs
Ml9zdWJkZXYgKnNkLCBpbnQgb24pCi17Ci0Jc3RydWN0IGlzcDRfc3ViZGV2ICppc3Bfc3ViZGV2
ID0gdG9faXNwNF9zdWJkZXYoc2QpOwotCi0JZ3VhcmQobXV0ZXgpKCZpc3Bfc3ViZGV2LT5vcHNf
bXV0ZXgpOwotCWlmIChvbikKLQkJcmV0dXJuIGlzcDRzZF9wd3Jvbl9hbmRfaW5pdChpc3Bfc3Vi
ZGV2KTsKLQllbHNlCi0JCXJldHVybiBpc3A0c2RfcHdyb2ZmX2FuZF9kZWluaXQoaXNwX3N1YmRl
dik7Ci19Ci0KLXN0YXRpYyBjb25zdCBzdHJ1Y3QgdjRsMl9zdWJkZXZfY29yZV9vcHMgaXNwNHNk
X2NvcmVfb3BzID0gewotCS5zX3Bvd2VyID0gaXNwNHNkX3NldF9wb3dlciwKLX07Ci0KIHN0YXRp
YyBjb25zdCBzdHJ1Y3QgdjRsMl9zdWJkZXZfdmlkZW9fb3BzIGlzcDRzZF92aWRlb19vcHMgPSB7
CiAJLnNfc3RyZWFtID0gdjRsMl9zdWJkZXZfc19zdHJlYW1faGVscGVyLAogfTsKQEAgLTk3OSw3
ICs5OTAsNiBAQCBzdGF0aWMgY29uc3Qgc3RydWN0IHY0bDJfc3ViZGV2X3BhZF9vcHMgaXNwNHNk
X3BhZF9vcHMgPSB7CiB9OwogCiBzdGF0aWMgY29uc3Qgc3RydWN0IHY0bDJfc3ViZGV2X29wcyBp
c3A0c2Rfc3ViZGV2X29wcyA9IHsKLQkuY29yZSA9ICZpc3A0c2RfY29yZV9vcHMsCiAJLnZpZGVv
ID0gJmlzcDRzZF92aWRlb19vcHMsCiAJLnBhZCA9ICZpc3A0c2RfcGFkX29wcywKIH07Ci0tIAoy
LjUyLjAKCg==
--0000000000003d45cc06484591c5--


