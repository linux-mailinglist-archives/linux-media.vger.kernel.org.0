Return-Path: <linux-media+bounces-50634-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id E7EEDD1C2DE
	for <lists+linux-media@lfdr.de>; Wed, 14 Jan 2026 03:59:24 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id CCDA630060CC
	for <lists+linux-media@lfdr.de>; Wed, 14 Jan 2026 02:59:21 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 00A2B322B8E;
	Wed, 14 Jan 2026 02:59:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (4096-bit key) header.d=canonical.com header.i=@canonical.com header.b="fvbabpKv"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp-relay-internal-1.canonical.com (smtp-relay-internal-1.canonical.com [185.125.188.123])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6A913320CAE
	for <linux-media@vger.kernel.org>; Wed, 14 Jan 2026 02:59:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.125.188.123
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768359560; cv=none; b=sUKDMYz1wV/EG6VEDAW5bQRTBA9gJxCh7QH+MtUzOu3jNbIsloPSxIgwIePDGKIKwUY/5Cleh4okaq7qoXfbJjvrZMsjnM6UvbxhqbrEARPKtEgKpyoAb+csjtSBYb/hkIh5QQQV9nrr1Nl5C9AaqBlpAH/ssLq3HGfIvb7dqXw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768359560; c=relaxed/simple;
	bh=eRx1QC3kTikdQMPrJJPUCvUoJ1F2eJunvA/kAFjwyWQ=;
	h=MIME-Version:From:Date:Message-ID:Subject:To:Cc:Content-Type; b=fDncQS2t3izLlgU5akfkSSMbIwskpiFj3e6ZY+NcQX1fPBxB1FODnmUO/gVV8DrBRXwoV4fJJy9YeStuYlQ0rtaN93xCaK1rfRGamW46Dd8NcXPW9FFyYtTw8yW3OQrSTp1fhtpYpDbrIraN+HbHprUnGp2IZHvSFURBoO50DuA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=canonical.com; spf=pass smtp.mailfrom=canonical.com; dkim=pass (4096-bit key) header.d=canonical.com header.i=@canonical.com header.b=fvbabpKv; arc=none smtp.client-ip=185.125.188.123
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=canonical.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=canonical.com
Received: from mail-yx1-f69.google.com (mail-yx1-f69.google.com [74.125.224.69])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-relay-internal-1.canonical.com (Postfix) with ESMTPS id B6A973F32D
	for <linux-media@vger.kernel.org>; Wed, 14 Jan 2026 02:59:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
	s=20251003; t=1768359548;
	bh=Sj42y+SbQlkdaXpYeFI5yG1gAQs0O5kjT227Q/NLS44=;
	h=MIME-Version:From:Date:Message-ID:Subject:To:Cc:Content-Type;
	b=fvbabpKv74r64S1fND6ga6Yb2S9ecDeb8amQAYJ38d42T4+d03W04BfdVpvdYzvF6
	 noavlSBuEaXsYzY2Dp7ZssMgYpbt8KTw5ilMdQ2CgdHYUMuyrkz+kw/1V3EMj1yZ6U
	 UfEZz8rbkzPewDeYYavmQ8NFVuraro5HU5ytsgdUNqsUNQk88cY8paVK5NR24jDfZO
	 q9eeb43AQ7H12H84L8TUr8Owkpivfl7C7gKeVVQ94HgrYaZ5ub8esfGe+Ls2CrV8uk
	 gvSeRNqtUoB3f7B2q360G0yO5xl0Fqw8hwEUdum0uoXmDnddEjTdET16OR/ARloqD8
	 JWb7SN9hGUtFc+QaOfJ1LqLsb4kffIF0bfAMx+2ZIvhsMstLAnq39Q4xTBUYtkdjI+
	 w86VkykB9+/RB+DF+h0M5ERT5EpdE3sg3XhkQnyWQEoIya7AEQ/i5MwgD0XF+sKPhW
	 eYabmPciKftKTpXpAfy7RvkxUi03I7I/ungENsQkvsQCRFjHlq1uYjxwrbB7Jrq0wq
	 Y+p1PRVkXMynZeHf2RHAkuqaUynvq0se3pliUTTtf+U8Pv+7Bva9fb+GLZ4Hwg+y4W
	 HBk2+OQG4zXYhO3TD6cx73lapM4/g93S6GFlMFzeyMN5El2OasyNmHQHRcHJVlgZRo
	 OrrHTGT7oiow6BUL4lrTkDB0=
Received: by mail-yx1-f69.google.com with SMTP id 956f58d0204a3-6465127b47dso11839937d50.0
        for <linux-media@vger.kernel.org>; Tue, 13 Jan 2026 18:59:08 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768359548; x=1768964348;
        h=cc:to:subject:message-id:date:from:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Sj42y+SbQlkdaXpYeFI5yG1gAQs0O5kjT227Q/NLS44=;
        b=b04mb/ycsXLUaKd9qX3hnp/MBy2RDxA6kuSFYouQ1BECPeHEOiWARYQnEhFf9sdA3e
         0TH2qIRR/MU4X9OhDdkUV/ZO8gHMm2Uk7NEptCP9frQAOZs3fDysZwMGAc0Qz2f6lDwr
         q5U0DHWpLh8N9vN6iveWR0sl2w6OqneJ6kFnYglj0hoNfe+pmJTwB3kCqng8lFxcWRIi
         tyufWlKkT7VJ8po3D/3lUnddoO15W3NDVM+rQeml/HLUshrfYXBR0JMIkp263+wDLDIZ
         RRjUod67edafoUisr2bzqM+JXZts6baYO4TnX6H5K6+ZcTNPhLLx+Y+r4V3TXL3g0nyk
         1Isg==
X-Forwarded-Encrypted: i=1; AJvYcCVinXbPftTZxLvvd4/ZbVgBpT9ryVzHIIs8iIs0lixYrtWzJXb9+3EwkPhxzqbTotqTB/r0uA47F9bJ9Q==@vger.kernel.org
X-Gm-Message-State: AOJu0Yz6fjR5JZLRv1SUS3KpnCAcMUKVxRyVRbfn0yCoPfr6iIZpJnD0
	n2XAerAsMlEAaqZQZPGDdGPeNEGXP+JedTh7tuU8h8Jlj/lMjc8XqS9u2mL/KYYfmIGh/a9Objp
	vxJSglmO5jUftfw6xfdarmIY2gytLqzsK6I0zPRvT01VBh+K3laTPA3QQv8/ExgjApc1vWap4ch
	5tMJcNChoC6zrXmBTk4knL4cQV9FDxncK6OgCPwdCe0OctrmiSpznMnC0=
X-Gm-Gg: AY/fxX6rr2v8uHhM4kDv5yGRALn6P2VVHl4BPwEjp+kRYzrMpxKrrqfVB4psgTysZ+9
	J6ZFb/bd0l+x+lE/J1sx+Q69lCyoUVetjhooRlSI/4l5cKiByuuqOpQvven0sZMuNuWPSzEsDcj
	x359ubxBNFmvOuBbpNnY2+AG3zeE2YUh9j5uCKF4om20lge8YwfFN2I8/AwJX6smqgwQ==
X-Received: by 2002:a05:690e:bc7:b0:63c:ed4b:e53 with SMTP id 956f58d0204a3-64901ab9e1amr1146859d50.25.1768359547686;
        Tue, 13 Jan 2026 18:59:07 -0800 (PST)
X-Received: by 2002:a05:690e:bc7:b0:63c:ed4b:e53 with SMTP id
 956f58d0204a3-64901ab9e1amr1146852d50.25.1768359547326; Tue, 13 Jan 2026
 18:59:07 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
From: Atlas Yu <atlas.yu@canonical.com>
Date: Wed, 14 Jan 2026 10:58:56 +0800
X-Gm-Features: AZwV_QiWS6hgGkdXm7hFNjLqETXu0bjwtP6w8dPWVWn0JjGgoXC5LFbQ26MgMOI
Message-ID: <CAB55eyVGjSBbRpG4eAsVWCe25RKDGb=hj35wzrHk5j64mSxH0w@mail.gmail.com>
Subject: [BUG] media: staging/ipu7: system core dumped when starting
 v4l2-relayd service
To: Sakari Ailus <sakari.ailus@linux.intel.com>
Cc: Bingbu Cao <bingbu.cao@intel.com>, linux-media@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Hi Sakari,

I encountered a system coredump when using the in-tree staging ipu7
module, while using the OOT module from
https://github.com/intel/ipu7-drivers turns out to be fine. Wonder if
you may look into this, I am glad to help provide logs and test
patches if needed.

You may find my setup for (ipu7-camera-bins, ipu7-camera-hal, etc..)
here: https://github.com/NixOS/nixpkgs/pull/479283
Thank you for maintaining this module.

* Kernel version: 6.18.4
* CPU: Intel(R) Core(TM) Ultra 7 258V
* Camera (ov08x40 sensor):
00:05.0 0480: 8086:645d (rev 04)
        Subsystem: 17aa:233a
        Flags: bus master, fast devsel, latency 0, IRQ 202, IOMMU group 1
        Memory at 204e000000 (64-bit, non-prefetchable) [size=32M]
        Memory at 2051d80000 (64-bit, non-prefetchable) [size=4K]
        Capabilities: [80] Power Management version 3
        Capabilities: [90] Vendor Specific Information: Intel <unknown>
        Capabilities: [d0] MSI: Enable+ Count=1/1 Maskable+ 64bit+
        Capabilities: [40] Express Root Complex Integrated Endpoint, IntMsgNum 0
        Capabilities: [100] Address Translation Service (ATS)
        Kernel driver in use: intel-ipu7
        Kernel modules: intel_ipu7
* Error log:
Process 4327 (v4l2-relayd) of user 0 dumped core.
Module /nix/store/kxim96j6x1d5xyksjx4s4c3f3hfk5j1n-v4l2-relayd-0.1.3/bin/v4l2-relayd
without build-id.
Module libjsoncpp.so.26 without build-id.
Module libexpat.so.1 without build-id.
Module ipu7x.so without build-id.
Module libpciaccess.so.0 without build-id.
Module libgcc_s.so.1 without build-id.
Module libstdc++.so.6 without build-id.
Module libcamhal.so.0 without build-id.
Module libdrm_intel.so.1 without build-id.
Module libgsticamerainterface-1.0.so.1 without build-id.
Module libgsticamerasrc.so without build-id.
Module libgstimagefreeze.so without build-id.
Module libpng16.so.16 without build-id.
Module libgstpng.so without build-id.
Module libjpeg.so.62 without build-id.
Module libcap.so.2 without build-id.
Module libv4lconvert.so.0 without build-id.
Module libdrm.so.2 without build-id.
Module libv4l2.so.0 without build-id.
Module libgudev-1.0.so.0 without build-id.
Module libgstvideo4linux2.so without build-id.
Module libbz2.so.1 without build-id.
Module libzstd.so.1 without build-id.
Module liblzma.so.5 without build-id.
Module libpcre2-8.so.0 without build-id.
Module libffi.so.8 without build-id.
Module libunwind.so.8 without build-id.
Module liborc-0.4.so.0 without build-id.
Module libselinux.so.1 without build-id.
Module libz.so.1 without build-id.
Stack trace of thread 4350:
#0  0x00007fe4e03aa862
_ZN7icamera11PipeManager17bindExternalPortsERKSt6vectorIjSaIjEERKS1_ISt4pairIjjESaIS7_EE
(ipu7x.so + 0xc1862)
#1  0x00007fe4e03ab02b _ZN7icamera11PipeManager18analyzeConnectionsEv
(ipu7x.so + 0xc202b)
#2  0x00007fe4e03ac017
_ZN7icamera11PipeManager9configureERKSt3mapIjNS_8stream_tESt4lessIjESaISt4pairIKjS2_EEESB_NS_34camera_stream_configuration_mode_tENS_10TuningModeEPSA_
(ipu7x.so + 0xc3017)
#3  0x00007fe4e0388568
_ZN7icamera14ProcessingUnit9configureERKSt3mapIjNS_8stream_tESt4lessIjESaISt4pairIKjS2_EEESB_NS_34camera_stream_configuration_mode_tE
(ipu7x.so + 0x9f568)
#4  0x00007fe4e0374a08
_ZN7icamera12CameraDevice9configureEPNS_15stream_config_tE (ipu7x.so +
0x8ba08)
#5  0x00007fe4e03bf0ed
_ZN7icamera9CameraHal19deviceConfigStreamsEiPNS_15stream_config_tE
(ipu7x.so + 0xd60ed)
#6  0x00007fe4e03bff7d camera_device_config_streams (ipu7x.so + 0xd6f7d)
#7  0x00007fe4e055bb92 n/a (libgsticamerasrc.so + 0x14b92)
#8  0x00007fe4e056ccc4
_Z25gst_cam_base_src_set_capsP14_GstCamBaseSrcP7_GstPadP8_GstCaps
(libgsticamerasrc.so + 0x25cc4)
#9  0x00007fe4e056d176 n/a (libgsticamerasrc.so + 0x26176)
#10 0x00007fe4e05569fc n/a (libgsticamerasrc.so + 0xf9fc)
#11 0x00007fe4e0564abc n/a (libgsticamerasrc.so + 0x1dabc)
#12 0x00007fe4e056bc5f n/a (libgsticamerasrc.so + 0x24c5f)
#13 0x00007fe4e25700bc gst_task_func (libgstreamer-1.0.so.0 + 0xdd0bc)
#14 0x00007fe4e23670b2 g_thread_pool_thread_proxy (libglib-2.0.so.0 + 0x9a0b2)
#15 0x00007fe4e236689d g_thread_proxy (libglib-2.0.so.0 + 0x9989d)
#16 0x00007fe4e209a97a start_thread (libc.so.6 + 0x9a97a)
#17 0x00007fe4e2122d2c __clone3 (libc.so.6 + 0x122d2c)

Stack trace of thread 4347:
#0  0x00007fe4e21208bd syscall (libc.so.6 + 0x1208bd)
#1  0x00007fe4e2366129 g_cond_wait (libglib-2.0.so.0 + 0x99129)
#2  0x00007fe4e22f6cab g_async_queue_pop_intern_unlocked
(libglib-2.0.so.0 + 0x29cab)
#3  0x00007fe4e2366b8f g_thread_pool_spawn_thread (libglib-2.0.so.0 + 0x99b8f)
#4  0x00007fe4e236689d g_thread_proxy (libglib-2.0.so.0 + 0x9989d)
#5  0x00007fe4e209a97a start_thread (libc.so.6 + 0x9a97a)
#6  0x00007fe4e2122d2c __clone3 (libc.so.6 + 0x122d2c)

Stack trace of thread 4327:
#0  0x00007fe4e2114a10 ppoll (libc.so.6 + 0x114a10)
#1  0x00007fe4e2332f68 g_main_context_iterate_unlocked.isra.0
(libglib-2.0.so.0 + 0x65f68)
#2  0x00007fe4e2333967 g_main_loop_run (libglib-2.0.so.0 + 0x66967)
#3  0x00005653a35c7634 main
(/nix/store/kxim96j6x1d5xyksjx4s4c3f3hfk5j1n-v4l2-relayd-0.1.3/bin/v4l2-relayd
+ 0x2634)
#4  0x00007fe4e202a4d8 __libc_start_call_main (libc.so.6 + 0x2a4d8)
#5  0x00007fe4e202a59b __libc_start_main@@GLIBC_2.34 (libc.so.6 + 0x2a59b)
#6  0x00005653a35c7895 _start
(/nix/store/kxim96j6x1d5xyksjx4s4c3f3hfk5j1n-v4l2-relayd-0.1.3/bin/v4l2-relayd
+ 0x2895)

Stack trace of thread 4348:
#0  0x00007fe4e21208bd syscall (libc.so.6 + 0x1208bd)
#1  0x00007fe4e2366129 g_cond_wait (libglib-2.0.so.0 + 0x99129)
#2  0x00007fe4e299a58f gst_app_src_create (libgstapp-1.0.so.0 + 0x758f)
#3  0x00007fe4e286e601 gst_base_src_get_range (libgstbase-1.0.so.0 + 0x48601)
#4  0x00007fe4e2873c02 gst_base_src_loop (libgstbase-1.0.so.0 + 0x4dc02)
#5  0x00007fe4e25700bc gst_task_func (libgstreamer-1.0.so.0 + 0xdd0bc)
#6  0x00007fe4e23670b2 g_thread_pool_thread_proxy (libglib-2.0.so.0 + 0x9a0b2)
#7  0x00007fe4e236689d g_thread_proxy (libglib-2.0.so.0 + 0x9989d)
#8  0x00007fe4e209a97a start_thread (libc.so.6 + 0x9a97a)
#9  0x00007fe4e2122d2c __clone3 (libc.so.6 + 0x122d2c)

Stack trace of thread 4571:
#0  0x00007fe4e2097389 __futex_abstimed_wait_common (libc.so.6 + 0x97389)
#1  0x00007fe4e209a284 pthread_cond_clockwait@GLIBC_2.30 (libc.so.6 + 0x9a284)
#2  0x00007fe4e038a059 _ZN7icamera13RequestThread10threadLoopEv
(ipu7x.so + 0xa1059)
#3  0x00007fe4e03c6755 _ZN7icamera6Thread11_threadLoopEPS0_ (ipu7x.so + 0xdd755)
#4  0x00007fe4da2ed064 execute_native_thread_routine (libstdc++.so.6 + 0xed064)
#5  0x00007fe4e209a97a start_thread (libc.so.6 + 0x9a97a)
#6  0x00007fe4e2122d2c __clone3 (libc.so.6 + 0x122d2c)

Stack trace of thread 4349:
#0  0x00007fe4e21208bd syscall (libc.so.6 + 0x1208bd)
#1  0x00007fe4e2366610 g_cond_wait_until (libglib-2.0.so.0 + 0x99610)
#2  0x00007fe4e22f6c6b g_async_queue_pop_intern_unlocked
(libglib-2.0.so.0 + 0x29c6b)
#3  0x00007fe4e236710a g_thread_pool_thread_proxy (libglib-2.0.so.0 + 0x9a10a)
#4  0x00007fe4e236689d g_thread_proxy (libglib-2.0.so.0 + 0x9989d)
#5  0x00007fe4e209a97a start_thread (libc.so.6 + 0x9a97a)
#6  0x00007fe4e2122d2c __clone3 (libc.so.6 + 0x122d2c)
ELF object binary architecture: AMD x86-64

Sincerely,
Atlas.

