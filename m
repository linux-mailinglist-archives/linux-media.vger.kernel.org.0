Return-Path: <linux-media+bounces-50656-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id DFF6BD1D63A
	for <lists+linux-media@lfdr.de>; Wed, 14 Jan 2026 10:10:53 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 64CD8309BC8C
	for <lists+linux-media@lfdr.de>; Wed, 14 Jan 2026 08:59:35 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8AB7F37F8C1;
	Wed, 14 Jan 2026 08:59:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="L5qEOdtW";
	dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b="fHomUvt6"
X-Original-To: linux-media@vger.kernel.org
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8FFD737F8D5
	for <linux-media@vger.kernel.org>; Wed, 14 Jan 2026 08:59:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768381170; cv=none; b=I51r6uix2L3B65CzqT2gEikkpbmVfZwypqd/ICWU6Fq0XNg2K1aVmT6gYhnlumLqh6d6hh1JwchlFdsn6UudpzQzfLmEPMD7bgbDmOgYIr+PjqlxwFFGAL6sSMTUfILTGq7b3xPj6UY6FuRHaUOcWjvrXQbDjxGnoC+r+AcPwCo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768381170; c=relaxed/simple;
	bh=e8a6hzNBcKDQdHEzeVYSRgg8DxEAY0sfDkYMx11NzT0=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=pMQLM51RmP5ZGP0yS+K5WN6ct/YcFzlm3NI0G/dwgn+8QThM26M456iVW8cl5SIMN+RVrIHoPdoQk9F5pQDkUGLVc2Z8uJHPVHp+R7HZSFR0hCzVUY1sqfItIfXnDTdnVwqg4xSoFsaYFe7mMns/yc0W6JgnLjgXunS9kXlwT5M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=L5qEOdtW; dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b=fHomUvt6; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1768381162;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=c5lCsPPg/TqJI/1pjevEqPJD+Gc5pmURIlTgqsmygFo=;
	b=L5qEOdtWn/7Y/sa5GwtBRG0F2b6Zx2qiMwcaMgFPnM9lHX8jfwhwswlyUp/jAM/4ewQuoa
	bMVlWyr5MhaaKTvTJdtCN/iJDAt5XqV+g67UAbAzrDTpeYDJxq84nBdbv+IOcPu87mt3fn
	On0gH2e0IDELaR2AQR3vuvT6cDC+Bpc=
Received: from mail-oo1-f71.google.com (mail-oo1-f71.google.com
 [209.85.161.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-128-1jowDl2WOZKUH7WzXWN9zg-1; Wed, 14 Jan 2026 03:59:21 -0500
X-MC-Unique: 1jowDl2WOZKUH7WzXWN9zg-1
X-Mimecast-MFC-AGG-ID: 1jowDl2WOZKUH7WzXWN9zg_1768381160
Received: by mail-oo1-f71.google.com with SMTP id 006d021491bc7-65f6e15ad5bso13528349eaf.1
        for <linux-media@vger.kernel.org>; Wed, 14 Jan 2026 00:59:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1768381160; x=1768985960; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=c5lCsPPg/TqJI/1pjevEqPJD+Gc5pmURIlTgqsmygFo=;
        b=fHomUvt6KeX+GT3DnIo+MkebCBoAof3YMJKBWNRZZCMXPHwOUCa7Dhu58/s/3SbYEQ
         uyPdHNVNJk8obaQMyWsCI61d9d9q/R4piyHBOYLIsfVMcOlhCi1Ms9XHqAJcLNK6HJJ2
         /NGAyGbDsipf9hT0wQ3T4JxODTQFAWYslqWo/AzthuT5HcWg/Y19Qd+nIEZSjhMorrrE
         rYyx2TNeqjm5TIUlLAJK6L+hJol/uf6InvrTQKnJ+Ww38vXwb4UktBrf/jKRtWScj0ts
         +2hKXeKpm6B2yCz6SLBGLWU/Q5K0cZBbs4Gra0CE9F7CiRYUsZLaD0yboJ08FUL9p9vm
         Vgng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768381160; x=1768985960;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=c5lCsPPg/TqJI/1pjevEqPJD+Gc5pmURIlTgqsmygFo=;
        b=lM65a2YByN5h4FWCmdDAfp38YRsJZgvv8yzhgWsMWzgKAyUaWs/UvIr6t/3/Smy5VQ
         oBdrENkLe5ejJbaX8HLhrR48zJ7oT2O3+ahDVNVkcO8G9N84DpFcU/WAiqWCr6Af4ale
         W4u5GKFng6Y6+irQkSjmTjWc8QuN7pv6yFYolSz6jo5+BLL6+Xcsvg3IzZ9jcPAnPin2
         BJ+X7QT8IUecLPCad1xYTHT1CxaRmQUpwzNPI+HeM0/dVdCqXpgUrIJW0BYty6MMgmyM
         0V0O2leSdFo04V507r1cgGpkAt3A0d7ez54FuFx3X0G7sKDqy/6lO37toOLN2MYdMU+Y
         6Oqg==
X-Forwarded-Encrypted: i=1; AJvYcCXW3dKH2yrs/oTb1uLdmyp8qUYQacnDPnnWcF2iQQQ1l1kFTHhXWYPC0+GqsCdQaclh5Qig6J2QZaUfzQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YzusYL0qt9tiDss5EjspIBm9L4tnOQ5NgNvioAf1lUbgUsCT2fD
	KSwuVPaUWYZoH1ll0vfRtC5rCW7KiRQex3cb6fbMuGnXdMnF2Wl5qT/wH2xCMrcItCPWa3qGyyQ
	j7aXkjEgqm/QetytxYutzlegMhNtMB1sPopV9oq/20w5bBGO2yDxeBC7k317GwB2jedvxKKwZwk
	Ps1aNvp3HkOpk7ayMb+/IJFaJTGi9tyttC0gJqVls=
X-Gm-Gg: AY/fxX6vjSMZfs1x30g/qCs/6zOcPk1OFsEyEY9CvHKupPNLEDqqXf9ssV+pZhI3sVt
	EmJBuTYbK5WUBMZ6QxUVk2O5z0v44kv46WLE/HRVLLFSFHBOVR0/jbX/1F8FAb17UK910CCZG12
	bzOi2Fq1MPuRiAL5eOGYydiSomLwZAy46Erq8GnXaSd1xHY2iRBQvpMNvdjoSBoMeW7g==
X-Received: by 2002:a05:6820:1c97:b0:65d:3c7:b57 with SMTP id 006d021491bc7-66102b3b6c7mr1080498eaf.34.1768381159970;
        Wed, 14 Jan 2026 00:59:19 -0800 (PST)
X-Received: by 2002:a05:6820:1c97:b0:65d:3c7:b57 with SMTP id
 006d021491bc7-66102b3b6c7mr1080470eaf.34.1768381159313; Wed, 14 Jan 2026
 00:59:19 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20251216091326.111977-1-Bin.Du@amd.com> <CAEth8oGuoFH1R1NXVmFFrDmZeKLZSHnJO=wuXdaFYLFXi4upGA@mail.gmail.com>
 <CAEth8oHw6zjTYP31sCmpSX_Ac2Vb8QDnf=ZUt=tWGQeO9ApS=w@mail.gmail.com>
 <fcc79419-9f9b-4151-8a95-b287ecb0436b@amd.com> <CAEth8oGMNUuKCiW=wgQqpC29TWxAfRLiVMvy=eF5KX0Psqq3gQ@mail.gmail.com>
 <e2132038-2220-4cb3-b21e-f98848d41970@amd.com>
In-Reply-To: <e2132038-2220-4cb3-b21e-f98848d41970@amd.com>
From: Kate Hsuan <hpa@redhat.com>
Date: Wed, 14 Jan 2026 16:59:08 +0800
X-Gm-Features: AZwV_QisARoKyUW_LahAUpIqdw6PDIGleLgDK95ju8tbKt990tKVRSsdEdPyQAk
Message-ID: <CAEth8oFRY_0ZwgTdP4YmY0W+FoGyH9fy_OCxRg790n3hqb+gww@mail.gmail.com>
Subject: Re: [PATCH v7 0/7] Add AMD ISP4 driver
To: "Nirujogi, Pratap" <pnirujog@amd.com>
Cc: "Du, Bin" <bin.du@amd.com>, mchehab@kernel.org, hverkuil@xs4all.nl, 
	laurent.pinchart+renesas@ideasonboard.com, bryan.odonoghue@linaro.org, 
	sakari.ailus@linux.intel.com, prabhakar.mahadev-lad.rj@bp.renesas.com, 
	linux-media@vger.kernel.org, linux-kernel@vger.kernel.org, 
	sultan@kerneltoast.com, pratap.nirujogi@amd.com, benjamin.chan@amd.com, 
	king.li@amd.com, gjorgji.rosikopulos@amd.com, Phil.Jawich@amd.com, 
	Dominic.Antony@amd.com, mario.limonciello@amd.com, richard.gong@amd.com, 
	anson.tsao@amd.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Pratap,

On Wed, Jan 14, 2026 at 1:14=E2=80=AFAM Nirujogi, Pratap <pnirujog@amd.com>=
 wrote:
>
> Hi Kate,
>
> On 1/13/2026 9:11 AM, Kate Hsuan wrote:
> > Caution: This message originated from an External Source. Use proper ca=
ution when opening attachments, clicking links, or responding.
> >
> >
> > Hi Bin,
> >
> > On Tue, Jan 6, 2026 at 4:35=E2=80=AFPM Du, Bin <bin.du@amd.com> wrote:
> >> Thank you, Kate, for the verification, it gives us more confidence.
> >>
> >> On 1/6/2026 1:49 PM, Kate Hsuan wrote:
> >>> Hi
> >>>
> >>> On Wed, Dec 31, 2025 at 5:03=E2=80=AFPM Kate Hsuan <hpa@redhat.com> w=
rote:
> >>>> On Tue, Dec 16, 2025 at 5:14=E2=80=AFPM Bin Du <Bin.Du@amd.com> wrot=
e:
> >>>>> Hello,
> >>>>>
> >>>>> AMD ISP4 is the AMD image processing gen 4 which can be found in HP=
 ZBook Ultra G1a 14 inch Mobile Workstation PC (Ryzen AI Max 300 Series)
> >>>>> (https://ubuntu.com/certified/202411-36043)
> >>>>> This patch series introduces the initial driver support for the AMD=
 ISP4.
> >>>>>
> >>>>> Patch summary:
> >>>>> - Powers up/off and initializes ISP HW
> >>>>> - Configures and kicks off ISP FW
> >>>>> - Interacts with APP using standard V4l2 interface by video node
> >>>>> - Controls ISP HW and interacts with ISP FW to do image processing
> >>>>> - Supports enum/set output image format and resolution
> >>>>> - Supports queueing buffer from app and dequeuing ISP filled buffer=
 to App
> >>>>> - It is verified on qv4l2, cheese and qcam
> >>>>> - It is verified together with following patches
> >>>>>           platform/x86: Add AMD ISP platform config (https://lore.k=
ernel.org/all/20250514215623.522746-1-pratap.nirujogi@amd.com/)
> >>>>>           pinctrl: amd: isp411: Add amdisp GPIO pinctrl (https://gi=
thub.com/torvalds/linux/commit/e97435ab09f3ad7b6a588dd7c4e45a96699bbb4a)
> >>>>>           drm/amd/amdgpu: Add GPIO resources required for amdisp (h=
ttps://gitlab.freedesktop.org/agd5f/linux/-/commit/ad0f5966ed8297aa47b31841=
92b00b7379ae0758)
> >>>>>           drm/amd/amdgpu: Declare isp firmware binary file (https:/=
/gitlab.freedesktop.org/agd5f/linux/-/commit/35345917bc9f7c86152b270d9d93c2=
20230b667f)
> >>>>>
> >>>>> AMD ISP4 Key features:
> >>>>> - Processes bayer raw data from the connected sensor and output the=
m to different YUV formats
> >>>>> - Downscale input image to different output image resolution
> >>>>> - Pipeline to do image processing on the input image including demo=
saic, denoise, 3A, etc.
> >>>>>
> >>>>> ----------
> >>>>>
> >>>>> Changes v6 -> v7:
> >>>>>
> >>>>> - Added missed blank line after some if statements.
> >>>>> - Changed the pm_runtime_disable() order in isp4_capture_remove() t=
o align with initialization.
> >>>>> - Reset buf_sent_cnt and start_stream_cmd_sent on stream stop.
> >>>>> - Removed duplicate buf_sent_cnt and start_stream_cmd_sent reset in=
 isp4sd_pwron_and_init().
> >>>>> - Combined isp4sd_reset_stream_info() and isp4sd_reset_camera_info(=
) into isp4sd_uninit_stream() to eliminate redundant stream info reset.
> >>>>> - Removed always-false status check in isp4sd_uninit_stream().
> >>>>> - Minor style improvements.
> >>>>>
> >>>>>
> >>>>> Changes v5 -> v6:
> >>>>>
> >>>>> - Lowered FW mempool buffer size from 200M to 100M (actual usage).
> >>>>> - Added an irq_enabled member to the ISP subdev for proper IRQ disa=
ble handling in both normal and error cases.
> >>>>> - Removed unnecessary .owner assignment from isp4_capture_drv defin=
ition
> >>>>> - Updated IRQ handling to enable and disable interrupts via the ISP=
 register for improved performance.
> >>>>> - Revised ring buffer management in isp4if_f2h_resp(), addressing s=
afety checks to ensure the read pointer is validated before memcpy operatio=
ns, reducing the risk of out-of-bounds access. The ring buffer logic was al=
so streamlined significantly.
> >>>>> - Modified ring buffer handling in isp4if_is_cmdq_rb_full(), correc=
ting an off-by-one error in safety checks that previously allowed rd_ptr to=
 equal wr_ptr when the buffer was full.
> >>>>> - Refactored ring buffer handling in isp4if_insert_isp_fw_cmd(), si=
mplifying overall logic.
> >>>>> - Resolved a regression from v4 to v5 where isp4if_dequeue_buffer()=
 did not protect list_del with bufq_lock.
> >>>>> - Addressed a subtle use-after-free issue that could occur if a tim=
eout on a synchronous command coincided with completion.
> >>>>> - Added missing pm_runtime_disable() calls to isp4_capture_remove()=
 and to the error path in isp4_capture_probe().
> >>>>> - Removed stray semicolons following closing curly braces.
> >>>>> - Improved and clarified macro definitions in isp4_interface.h.
> >>>>> - Eliminated unnecessary (u8 *) casts.
> >>>>> - Added missing memset for firmware command structures in isp4sd_st=
op_stream().
> >>>>> - Excluded streams 2 and 3 from ISP4IF_FW_RESP_RB_IRQ_EN_MASK, prev=
enting their activation in the interrupt enable register.
> >>>>> - Enhanced error handling to clean up kthreads in the event of star=
tup failure.
> >>>>> - Corrected a race condition during kthread creation where waitqueu=
e head initialization could be delayed, as it was performed by the kthread =
itself.
> >>>>> - Removed status checks in isp4sd_pwroff_and_deinit() that were alw=
ays false.
> >>>>> - Ensured isp4sd_init_stream() is only invoked once per stream star=
t and reordered corresponding status checks in isp4sd_start_stream().
> >>>>> - Improved error handling in isp4sd_start_stream() to propagate err=
ors from failed functions.
> >>>>> - Relocated debugging messages in isp4sd_stop_stream() to execute u=
nder lock protection due to access to output_info->start_status.
> >>>>> - Eliminated redundant GET_REG_BASE() macros.
> >>>>> - Removed isp4sd_is_stream_running() function.
> >>>>> - Corrected error message in isp4sd_init_stream() caused by copy/pa=
ste.
> >>>>> - Refined struct isp4_interface to remove firmware ring buffer conf=
igurations.
> >>>>> - Removed obsolete isp4sd_is_stream_running function.
> >>>>> - Removed pdev member from struct isp4_device, as it is unnecessary=
.
> >>>>> - Fixed typo in 'isp_mmip' parameter name within isp4if_init().
> >>>>> - Removed gap in struct isp4_subdev definition.
> >>>>> - Performed extensive dead code removal and minor style improvement=
s throughout the codebase.
> >>>>>
> >>>>>
> >>>>> Changes v4 -> v5:
> >>>>>
> >>>>> - Transitioned VIDEOBUF2_V4L2 from 'depends' to 'select' within Kco=
nfig.
> >>>>> - Standardized object file naming conventions in the Makefile and s=
orted entries alphabetically.
> >>>>> - Removed the unused macro definition to_isp4_device.
> >>>>> - Eliminated unused members mem_domain and mem_align from struct is=
p4if_gpu_mem_info.
> >>>>> - Deleted unused fields mc_addr and gpu_pkg from struct isp4if_cmd_=
element.
> >>>>> - Removed obsolete pltf_data, i2c_nb, and notifier elements from st=
ruct isp4_device.
> >>>>> - Updated platform_get_irq failure handling to return its actual re=
sult rather than -ENODEV.
> >>>>> - Refined inclusion of header files for clarity and efficiency.
> >>>>> - Appended comments following #endif statements in header files.
> >>>>> - Improved implementation of isp4if_gpu_mem_free and isp4if_dealloc=
_fw_gpumem.
> >>>>> - Removed isp4if_append_cmd_2_cmdq and revised isp4if_send_fw_cmd a=
ccordingly.
> >>>>> - Enhanced isp4if_clear_cmdq and isp4if_clear_bufq by eliminating u=
nnecessary list_del operations.
> >>>>> - Adopted completion mechanism instead of wait queue and condition =
for command completion notifications.
> >>>>> - Employed memset to ensure proper zeroing of padding bits in struc=
tures shared between ISP driver and firmware.
> >>>>> - Streamlined IRQs, reducing total from four to two, retaining only=
 essential ones.
> >>>>> - Optimized IRQ handler logic using a while loop for greater effici=
ency.
> >>>>> - Introduced dynamic IRQ enable/disable functionality based on came=
ra status (open/close).
> >>>>> - Applied distinct identifiers to differentiate multiple threads an=
d IRQs.
> >>>>> - Removed unnecessary initialization of local variables.
> >>>>> - Refined camera start/stop workflow to mitigate potential synchron=
ization concerns.
> >>>>> - Replaced all remaining mutex with guard mutex.
> >>>>> - Enhanced command and buffer queue performance by substituting mut=
exes with spinlocks.
> >>>>> - Removed redundant isp4sd_init_meta_buf function and its reference=
s.
> >>>>> - Limited firmware logging activities to the stream1 thread.
> >>>>> - Relocated v4l2_device_unregister_subdev() and media_entity_cleanu=
p() calls from isp4_capture_remove to isp4sd_deinit.
> >>>>> - Resolved media device registration sequence issues.
> >>>>> - Modified stream processing thread behavior to await IRQ without a=
 timeout.
> >>>>> - Addressed cleanup procedures in video device initialization and d=
einitialization routines.
> >>>>> - Corrected typos and made other cosmetic improvements.
> >>>>>
> >>>>>
> >>>>> Changes v3 -> v4:
> >>>>>
> >>>>> - Replace one mutex with guard mutex.
> >>>>> - Remove unnecessary bus_info initialization of v4l2_capability.
> >>>>> - Drop V4L2_CAP_IO_MC from capabilities of v4l2_capability.
> >>>>> - Modify document with better SOC description.
> >>>>> - Fix Test x86 failure in Media CI test https://linux-media.pages.f=
reedesktop.org/-/users/patchwork/-/jobs/83470456/artifacts/report.htm
> >>>>> - Modify some commit messages by describing changes in imperative m=
ood.
> >>>>> - Add media-ctl output in cover letter.
> >>>>> - Create separated dedicated amdgpu patch to add declaration MODULE=
_FIRMWARE("amdgpu/isp_4_1_1.bin");
> >>>>> - Fix typo errors and other cosmetic issues.
> >>>>> - Add DRM_AMD_ISP dependency in Kconfig.
> >>>>>
> >>>>>
> >>>>> Changes v2 -> v3:
> >>>>>
> >>>>> - All the dependent patches in other modules (drm/amd/amdgpu, platf=
orm/x86, pinctrl/amd) merged on upstream mainline kernel (https://github.co=
m/torvalds/linux) v6.17.
> >>>>> - Removed usage of amdgpu structs in ISP driver. Added helper funct=
ions in amdgpu accepting opaque params from ISP driver to allocate and rele=
ase ISP GART buffers.
> >>>>> - Moved sensor and MIPI phy control entirely into ISP FW instead of=
 the previous hybrid approach controlling sensor from both FW and x86 (sens=
or driver).
> >>>>> - Removed phy configuration and sensor binding as x86 (sensor drive=
r) had relinquished the sensor control for ISP FW. With this approach the d=
river will be exposed as web camera like interface.
> >>>>> - New FW with built-in sensor driver is submitted on upstream linux=
-firmware repo (https://gitlab.com/kernel-firmware/linux-firmware/).
> >>>>> - Please note the new FW submitted is not directly compatible with =
OEM Kernel ISP4.0 (https://github.com/amd/Linux_ISP_Kernel/tree/4.0) and th=
e previous ISP V2 patch series.
> >>>>> - If intend to use the new FW, please rebuild OEM ISP4.0 Kernel wit=
h CONFIG_VIDEO_OV05C10=3DN and CONFIG_PINCTRL_AMDISP=3DY.
> >>>>> - Included critical fixes from Sultan Alsawaf branch (https://githu=
b.com/kerneltoast/kernel_x86_laptop.git) related to managing lifetime of is=
p buffers.
> >>>>>         media: amd: isp4: Add missing refcount tracking to mmap mem=
op
> >>>>>         media: amd: isp4: Don't put or unmap the dmabuf when detach=
ing
> >>>>>         media: amd: isp4: Don't increment refcount when dmabuf expo=
rt fails
> >>>>>         media: amd: isp4: Fix possible use-after-free in isp4vid_vb=
2_put()
> >>>>>         media: amd: isp4: Always export a new dmabuf from get_dmabu=
f memop
> >>>>>         media: amd: isp4: Fix implicit dmabuf lifetime tracking
> >>>>>         media: amd: isp4: Fix possible use-after-free when putting =
implicit dmabuf
> >>>>>         media: amd: isp4: Simplify isp4vid_get_dmabuf() arguments
> >>>>>         media: amd: isp4: Move up buf->vaddr check in isp4vid_get_d=
mabuf()
> >>>>>         media: amd: isp4: Remove unused userptr memops
> >>>>>         media: amd: isp4: Add missing cleanup on error in isp4vid_v=
b2_alloc()
> >>>>>         media: amd: isp4: Release queued buffers on error in start_=
streaming
> >>>>> - Addressed all code related upstream comments
> >>>>> - Fix typo errors and other cosmetic issues.
> >>>>>
> >>>>>
> >>>>> Changes v1 -> v2:
> >>>>>
> >>>>> - Fix media CI test errors and valid warnings
> >>>>> - Reduce patch number in the series from 9 to 8 by merging MAINTAIN=
ERS adding patch to the first patch
> >>>>> - In patch 5
> >>>>>           - do modification to use remote endpoint instead of local=
 endpoint
> >>>>>           - use link frequency and port number as start phy paramet=
er instead of extra added phy-id and phy-bit-rate property of endpoint
> >>>>>
> >>>>> ----------
> >>>>>
> >>>>> It passes v4l2 compliance test, the test reports for:
> >>>>>
> >>>>> (a) amd_isp_capture device /dev/video0
> >>>>>
> >>>>> Compliance test for amd_isp_capture device /dev/video0:
> >>>>> -------------------------------------------------------
> >>>>>
> >>>>> atg@atg-HP-PV:~/bin$ ./v4l2-compliance -d /dev/video0
> >>>>> v4l2-compliance 1.29.0-5348, 64 bits, 64-bit time_t
> >>>>> v4l2-compliance SHA: 75e3f0e2c2cb 2025-03-17 18:12:17
> >>>>>
> >>>>> Compliance test for amd_isp_capture device /dev/video0:
> >>>>>
> >>>>> Driver Info:
> >>>>>           Driver name      : amd_isp_capture
> >>>>>           Card type        : amd_isp_capture
> >>>>>           Bus info         : platform:amd_isp_capture
> >>>>>           Driver version   : 6.14.0
> >>>>>           Capabilities     : 0xa4200001
> >>>>>                   Video Capture
> >>>>>                   I/O MC
> >>>>>                   Streaming
> >>>>>                   Extended Pix Format
> >>>>>                   Device Capabilities
> >>>>>           Device Caps      : 0x24200001
> >>>>>                   Video Capture
> >>>>>                   I/O MC
> >>>>>                   Streaming
> >>>>>                   Extended Pix Format
> >>>>> Media Driver Info:
> >>>>>           Driver name      : amd_isp_capture
> >>>>>           Model            : amd_isp41_mdev
> >>>>>           Serial           :
> >>>>>           Bus info         : platform:amd_isp_capture
> >>>>>           Media version    : 6.14.0
> >>>>>           Hardware revision: 0x00000000 (0)
> >>>>>           Driver version   : 6.14.0
> >>>>> Interface Info:
> >>>>>           ID               : 0x03000005
> >>>>>           Type             : V4L Video
> >>>>> Entity Info:
> >>>>>           ID               : 0x00000003 (3)
> >>>>>           Name             : Preview
> >>>>>           Function         : V4L2 I/O
> >>>>>           Pad 0x01000004   : 0: Sink
> >>>>>             Link 0x02000007: from remote pad 0x1000002 of entity 'a=
md isp4' (Image Signal Processor): Data, Enabled, Immutable
> >>>>>
> >>>>> Required ioctls:
> >>>>>           test MC information (see 'Media Driver Info' above): OK
> >>>>>           test VIDIOC_QUERYCAP: OK
> >>>>>           test invalid ioctls: OK
> >>>>>
> >>>>> Allow for multiple opens:
> >>>>>           test second /dev/video0 open: OK
> >>>>>           test VIDIOC_QUERYCAP: OK
> >>>>>           test VIDIOC_G/S_PRIORITY: OK
> >>>>>           test for unlimited opens: OK
> >>>>>
> >>>>> Debug ioctls:
> >>>>>           test VIDIOC_DBG_G/S_REGISTER: OK (Not Supported)
> >>>>>           test VIDIOC_LOG_STATUS: OK (Not Supported)
> >>>>>
> >>>>> Input ioctls:
> >>>>>           test VIDIOC_G/S_TUNER/ENUM_FREQ_BANDS: OK (Not Supported)
> >>>>>           test VIDIOC_G/S_FREQUENCY: OK (Not Supported)
> >>>>>           test VIDIOC_S_HW_FREQ_SEEK: OK (Not Supported)
> >>>>>           test VIDIOC_ENUMAUDIO: OK (Not Supported)
> >>>>>           test VIDIOC_G/S/ENUMINPUT: OK
> >>>>>           test VIDIOC_G/S_AUDIO: OK (Not Supported)
> >>>>>           Inputs: 1 Audio Inputs: 0 Tuners: 0
> >>>>>
> >>>>> Output ioctls:
> >>>>>           test VIDIOC_G/S_MODULATOR: OK (Not Supported)
> >>>>>           test VIDIOC_G/S_FREQUENCY: OK (Not Supported)
> >>>>>           test VIDIOC_ENUMAUDOUT: OK (Not Supported)
> >>>>>           test VIDIOC_G/S/ENUMOUTPUT: OK (Not Supported)
> >>>>>           test VIDIOC_G/S_AUDOUT: OK (Not Supported)
> >>>>>           Outputs: 0 Audio Outputs: 0 Modulators: 0
> >>>>>
> >>>>> Input/Output configuration ioctls:
> >>>>>           test VIDIOC_ENUM/G/S/QUERY_STD: OK (Not Supported)
> >>>>>           test VIDIOC_ENUM/G/S/QUERY_DV_TIMINGS: OK (Not Supported)
> >>>>>           test VIDIOC_DV_TIMINGS_CAP: OK (Not Supported)
> >>>>>           test VIDIOC_G/S_EDID: OK (Not Supported)
> >>>>>
> >>>>> Control ioctls (Input 0):
> >>>>>           test VIDIOC_QUERY_EXT_CTRL/QUERYMENU: OK (Not Supported)
> >>>>>           test VIDIOC_QUERYCTRL: OK (Not Supported)
> >>>>>           test VIDIOC_G/S_CTRL: OK (Not Supported)
> >>>>>           test VIDIOC_G/S/TRY_EXT_CTRLS: OK (Not Supported)
> >>>>>           test VIDIOC_(UN)SUBSCRIBE_EVENT/DQEVENT: OK (Not Supporte=
d)
> >>>>>           test VIDIOC_G/S_JPEGCOMP: OK (Not Supported)
> >>>>>           Standard Controls: 0 Private Controls: 0
> >>>>>
> >>>>> Format ioctls (Input 0):
> >>>>>           test VIDIOC_ENUM_FMT/FRAMESIZES/FRAMEINTERVALS: OK
> >>>>>           test VIDIOC_G/S_PARM: OK
> >>>>>           test VIDIOC_G_FBUF: OK (Not Supported)
> >>>>>           test VIDIOC_G_FMT: OK
> >>>>>           test VIDIOC_TRY_FMT: OK
> >>>>>           test VIDIOC_S_FMT: OK
> >>>>>           test VIDIOC_G_SLICED_VBI_CAP: OK (Not Supported)
> >>>>>           test Cropping: OK (Not Supported)
> >>>>>           test Composing: OK (Not Supported)
> >>>>>           test Scaling: OK (Not Supported)
> >>>>>
> >>>>> Codec ioctls (Input 0):
> >>>>>           test VIDIOC_(TRY_)ENCODER_CMD: OK (Not Supported)
> >>>>>           test VIDIOC_G_ENC_INDEX: OK (Not Supported)
> >>>>>           test VIDIOC_(TRY_)DECODER_CMD: OK (Not Supported)
> >>>>>
> >>>>> Buffer ioctls (Input 0):
> >>>>>           test VIDIOC_REQBUFS/CREATE_BUFS/QUERYBUF: OK
> >>>>>           test CREATE_BUFS maximum buffers: OK
> >>>>>           test VIDIOC_REMOVE_BUFS: OK
> >>>>>           test VIDIOC_EXPBUF: OK
> >>>>>           test Requests: OK (Not Supported)
> >>>>>           test blocking wait: OK
> >>>>>
> >>>>> Total for amd_isp_capture device /dev/video0: 49, Succeeded: 49, Fa=
iled: 0, Warnings: 0
> >>>>>
> >>>>> The media-ctl output of media device /dev/media0:
> >>>>> -------------------------------------------------------
> >>>>>
> >>>>> atg@atg-HP-PV:~$ media-ctl -p -d /dev/media0
> >>>>> Media controller API version 6.17.0
> >>>>>
> >>>>> Media device information
> >>>>> ------------------------
> >>>>> driver          amd_isp_capture
> >>>>> model           amd_isp41_mdev
> >>>>> serial
> >>>>> bus info        platform:amd_isp_capture
> >>>>> hw revision     0x0
> >>>>> driver version  6.17.0
> >>>>>
> >>>>> Device topology
> >>>>> - entity 1: amd isp4 (1 pad, 1 link, 0 routes)
> >>>>>               type V4L2 subdev subtype Unknown flags 0
> >>>>>           pad0: Source
> >>>>>                   -> "Preview":0 [ENABLED,IMMUTABLE]
> >>>>>
> >>>>> - entity 3: Preview (1 pad, 1 link)
> >>>>>               type Node subtype V4L flags 0
> >>>>>               device node name /dev/video0
> >>>>>           pad0: Sink
> >>>>>                   <- "amd isp4":0 [ENABLED,IMMUTABLE]
> >>>>>
> >>>>> Please review and provide feedback.
> >>>>>
> >>>>> Many thanks,
> >>>>>
> >>>>> Bin Du (7):
> >>>>>     media: platform: amd: Introduce amd isp4 capture driver
> >>>>>     media: platform: amd: low level support for isp4 firmware
> >>>>>     media: platform: amd: Add isp4 fw and hw interface
> >>>>>     media: platform: amd: isp4 subdev and firmware loading handling=
 added
> >>>>>     media: platform: amd: isp4 video node and buffers handling adde=
d
> >>>>>     media: platform: amd: isp4 debug fs logging and  more descripti=
ve
> >>>>>       errors
> >>>>>     Documentation: add documentation of AMD isp 4 driver
> >>>>>
> >>>>>    Documentation/admin-guide/media/amdisp4-1.rst |   63 +
> >>>>>    Documentation/admin-guide/media/amdisp4.dot   |    6 +
> >>>>>    .../admin-guide/media/v4l-drivers.rst         |    1 +
> >>>>>    MAINTAINERS                                   |   25 +
> >>>>>    drivers/media/platform/Kconfig                |    1 +
> >>>>>    drivers/media/platform/Makefile               |    1 +
> >>>>>    drivers/media/platform/amd/Kconfig            |    3 +
> >>>>>    drivers/media/platform/amd/Makefile           |    3 +
> >>>>>    drivers/media/platform/amd/isp4/Kconfig       |   14 +
> >>>>>    drivers/media/platform/amd/isp4/Makefile      |   10 +
> >>>>>    drivers/media/platform/amd/isp4/isp4.c        |  235 ++++
> >>>>>    drivers/media/platform/amd/isp4/isp4.h        |   20 +
> >>>>>    drivers/media/platform/amd/isp4/isp4_debug.c  |  271 ++++
> >>>>>    drivers/media/platform/amd/isp4/isp4_debug.h  |   41 +
> >>>>>    .../platform/amd/isp4/isp4_fw_cmd_resp.h      |  314 +++++
> >>>>>    drivers/media/platform/amd/isp4/isp4_hw_reg.h |  124 ++
> >>>>>    .../media/platform/amd/isp4/isp4_interface.c  |  789 +++++++++++
> >>>>>    .../media/platform/amd/isp4/isp4_interface.h  |  141 ++
> >>>>>    drivers/media/platform/amd/isp4/isp4_subdev.c | 1057 +++++++++++=
++++
> >>>>>    drivers/media/platform/amd/isp4/isp4_subdev.h |  131 ++
> >>>>>    drivers/media/platform/amd/isp4/isp4_video.c  | 1165 +++++++++++=
++++++
> >>>>>    drivers/media/platform/amd/isp4/isp4_video.h  |   65 +
> >>>>>    22 files changed, 4480 insertions(+)
> >>>>>    create mode 100644 Documentation/admin-guide/media/amdisp4-1.rst
> >>>>>    create mode 100644 Documentation/admin-guide/media/amdisp4.dot
> >>>>>    create mode 100644 drivers/media/platform/amd/Kconfig
> >>>>>    create mode 100644 drivers/media/platform/amd/Makefile
> >>>>>    create mode 100644 drivers/media/platform/amd/isp4/Kconfig
> >>>>>    create mode 100644 drivers/media/platform/amd/isp4/Makefile
> >>>>>    create mode 100644 drivers/media/platform/amd/isp4/isp4.c
> >>>>>    create mode 100644 drivers/media/platform/amd/isp4/isp4.h
> >>>>>    create mode 100644 drivers/media/platform/amd/isp4/isp4_debug.c
> >>>>>    create mode 100644 drivers/media/platform/amd/isp4/isp4_debug.h
> >>>>>    create mode 100644 drivers/media/platform/amd/isp4/isp4_fw_cmd_r=
esp.h
> >>>>>    create mode 100644 drivers/media/platform/amd/isp4/isp4_hw_reg.h
> >>>>>    create mode 100644 drivers/media/platform/amd/isp4/isp4_interfac=
e.c
> >>>>>    create mode 100644 drivers/media/platform/amd/isp4/isp4_interfac=
e.h
> >>>>>    create mode 100644 drivers/media/platform/amd/isp4/isp4_subdev.c
> >>>>>    create mode 100644 drivers/media/platform/amd/isp4/isp4_subdev.h
> >>>>>    create mode 100644 drivers/media/platform/amd/isp4/isp4_video.c
> >>>>>    create mode 100644 drivers/media/platform/amd/isp4/isp4_video.h
> >>>>>
> >>>>> --
> >>>>> 2.34.1
> >>>>>
> >>>>>
> >>>> v7 worked on my HP ZBook Ultra G1a 14 inch Mobile Workstation PC and
> >>>> the camera worked fine.
> >>>> It was tested with the latest upstream firmware [1] and 6.19-rc3 ker=
nel.
> >>>>
> >>>> [1] https://git.kernel.org/pub/scm/linux/kernel/git/firmware/linux-f=
irmware.git/tree/amdgpu/isp_4_1_1.bin
> >>>>
> >>>> Thank you for your work :)
> >>>>
> >>>> --
> >>>> BR,
> >>>> Kate
> >>> Leave a "Tested-by" tag for my previous testing assertion.
> >>>
> >>> Tested-by: Kate Hsuan <hpa@redhat.com>
> >>>
> >>>
> >>>
> >> --
> >> Regards,
> >> Bin
> >>
> > The ISP driver works perfectly with a clear and sharp video. I tested
> > it again, and I found a suspend/resume issue.
> > The ISP can't suspend when the system is set to suspend. The privacy
> > LED is on when the system is suspended. Therefore, the user will see a
> > luminous privacy LED when the system is set to suspend.
> > Today, I made a work to move all the power control to use the runtime
> > PM, including suspend/resume. This work may be humble and may break
> > the finite state machine but it works. The major changes of it
> > include:
> > 1. Support suspend/resume.
> > 2. The power is managed by the runtime PM so the s_power and the relate=
d
> >     callback function were dropped.
> > 3. The enable_isp GPIO pin is controlled by the runtime PM.
> > 4. pm_runtime_get_noresume() is used to get the runtime PM at probe()
> >     since the device doesn't have to be set to power on when initialisi=
ng.
> >
> > This work stops the video stream on suspend and starts the stream on
> > resume so the privacy LED is turned on and turned off with the changes
> > of suspend and resume.
> >
> > Could you please consider this patch and idea?
> >
> > Thank you :)
>
> Thanks for reporting this issue and also providing the patch.
>
> We have addressed this issue recently. I suspect the below fix in AMDGPU
> available in v6.19-rc5 is missing in your build.
>
> https://github.com/torvalds/linux/commit/7ed51e3a1381422278933d0d3ebda026=
8b6825de
>
> I have tested locally and this issue is not observed with this change
> included. Can you please check and feedback if this solves the problem?
>
> This change takes care of handling isp suspend-resume as part of amdgpu
> device suspend-resume instead of genpd, and uses the pm rumtime as you
> have suggested.
>
> Thanks,
>
> Pratap
>
>
> >
> > --
> > BR,
> > Kate
>

I tested again with the patch you mentioned. It works but I found some issu=
es.
I also tested it with my work and the test results were shown as follows.

The test step is
1. start the camera app -> 2. set to suspend -> 3. resume the laptop

The results:
1. rebase to 6.19-RC5 with the fix patch (7ed51e3a1)
It works but I found the logs when stopping the video stream
...
[  527.733851] amd_isp_capture amd_isp_capture: fail to disable stream
...
[  528.237828] amd_isp_capture amd_isp_capture: fail to stop steam
...
The isp4 tries to stop the stream but it fails to write the data to
the firmware.
I think the ISP stops working before the ISP stops the video stream.
So, it cannot write the data to the firmware.

2.  fix patch (7ed51e3a1) + ISP4 runtime PM (my work)
This also works.
The ISP4 complains the error about "static void
isp4if_dealloc_fw_gpumem(struct isp4_interface *ispif)" when suspend.

(This only happens when suspending the system)
[  223.085419] WARNING: drivers/gpu/drm/amd/amdgpu/amdgpu_object.c:517
at amdgpu_bo_free_kernel+0xe9/0x100 [amdgpu], CPU#30:
kworker/u130:4/794
[  223.085552] Modules linked in: uinput(E) rfcomm(E) snd_seq_dummy(E)
snd_hrtimer(E) hid_sensor_gyro_3d(E) hid_sensor_trigger(E)
hid_sensor_iio_common(E) industrialio_triggered_buffer(E) kfifo_buf(E)
industrialio(E) hid_sensor_hub(E) sunrpc(E) nf_conntrack_netbios_ns(E)
nf_conntrack_broadcast(E) nft_fib_inet(E) nft_fib_ipv4(E)

<snip>

[  223.085591] CPU: 30 UID: 0 PID: 794 Comm: kworker/u130:4 Tainted: G
       W   E       6.19.0-rc5+ #92 PREEMPT(lazy)
[  223.085592] Tainted: [W]=3DWARN, [E]=3DUNSIGNED_MODULE
[  223.085592] Hardware name: HP HP ZBook Ultra G1a 14 inch Mobile
Workstation PC/8D01, BIOS X89 Ver. 01.01.00 01/16/2025
[  223.085593] Workqueue: async async_run_entry_fn
[  223.085594] RIP: 0010:amdgpu_bo_free_kernel+0xe9/0x100 [amdgpu]
[  223.085725] Code: f4 ff ff 4d 85 e4 74 08 49 c7 04 24 00 00 00 00
48 85 ed 74 08 48 c7 45 00 00 00 00 00 5b 5d 41 5c 41 5d 41 5e c3 cc
cc cc cc <0f> 0b e9 42 ff ff ff 3d 00 fe ff ff 0f 85 a1 34 95 00 eb bd
0f 1f
[  223.085725] RSP: 0018:ffffcd80413e7ae0 EFLAGS: 00010202
[  223.085726] RAX: 0000000000000000 RBX: 0000000000000005 RCX: 00000000808=
00077
[  223.085726] RDX: ffff8b3719f6eef0 RSI: ffff8b3719f6eee8 RDI: ffff8b3719f=
6eef8
[  223.085727] RBP: ffff8b3719f6eee0 R08: 0000000000000000 R09: ffffffffc05=
58135
[  223.085727] R10: ffff8b3719f6e7a0 R11: ffffef494467db80 R12: ffff8b370ef=
86220
[  223.085727] R13: ffff8b3718003c00 R14: ffff8b372a60ee00 R15: ffff8b370ef=
86220
[  223.085728] FS:  0000000000000000(0000) GS:ffff8b5649311000(0000)
knlGS:0000000000000000
[  223.085728] CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
[  223.085729] CR2: 0000563d26ad9000 CR3: 00000001ace2c000 CR4: 0000000000f=
50ef0
[  223.085730] PKRU: 55555554
[  223.085730] Call Trace:
[  223.085730]  <TASK>
[  223.085731]  isp4if_dealloc_fw_gpumem+0xcd/0x100 [amd_capture]
[  223.085733]  isp4if_stop+0x59/0x70 [amd_capture]
[  223.085735]  isp4sd_pwroff_and_deinit.isra.0+0x99/0x160 [amd_capture]
[  223.085737]  isp4sd_stop_stream+0xbe/0x250 [amd_capture]
[  223.085740]  v4l2_subdev_disable_streams+0x1ad/0x390 [videodev]
[  223.085747]  ? dc_dmub_srv_wait_for_idle+0x50/0x150 [amdgpu]
[  223.085914]  isp4_suspend+0x2d/0x80 [amd_capture]
[  223.085916]  genpd_runtime_suspend+0xe7/0x300
[  223.085917]  ? __pfx_isp_suspend_device+0x10/0x10 [amdgpu]
[  223.086069]  pm_runtime_force_suspend+0x71/0x110
[  223.086070]  ? __pfx_genpd_runtime_suspend+0x10/0x10
[  223.086071]  device_for_each_child+0x71/0xb0
[  223.086073]  isp_v4_1_1_hw_suspend+0x22/0x40 [amdgpu]
[  223.086223]  ? amdgpu_dpm_gfx_state_change+0x49/0x60 [amdgpu]
[  223.086399]  amdgpu_ip_block_suspend+0x27/0x50 [amdgpu]
[  223.086522]  amdgpu_device_ip_suspend_phase2+0x13c/0x3d0 [amdgpu]
[  223.086647]  amdgpu_device_suspend+0x161/0x240 [amdgpu]


Both solutions work but need to be integrated.
ISP4 already enables the runtime PM so the power settings can be moved
to the runtime PM and the s_power callback can be dropped. The runtime
PM can be used to power on and power off the ISP4 for the typical
operations, for example, the user turns on the camera and shutdowns
the camera. If the ISP4 media device manages the power status using
the runtime PM, the video stream can be gracefully stopped to ensure
no error events are propagated to the user apps. Moreover, it resolves
the suspend/resume issues and the runtime PM will manage the
suspend/resume status.














--=20
BR,
Kate


