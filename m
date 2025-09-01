Return-Path: <linux-media+bounces-41423-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 716DFB3E13D
	for <lists+linux-media@lfdr.de>; Mon,  1 Sep 2025 13:14:29 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 1A0DC7ACADC
	for <lists+linux-media@lfdr.de>; Mon,  1 Sep 2025 11:12:52 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6AAFF23C513;
	Mon,  1 Sep 2025 11:14:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ursulin-net.20230601.gappssmtp.com header.i=@ursulin-net.20230601.gappssmtp.com header.b="vvSDvi8X"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com [209.85.128.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7FF7E3F9C5
	for <linux-media@vger.kernel.org>; Mon,  1 Sep 2025 11:14:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756725261; cv=none; b=KU8rscTn3bJabWGU+RhjHljKuelkV5P+df/6la0oqPHi2SZbnnk8/wKEaixQpC9o1b2nc9+E2U8wp4wONapWtxGyqfjbgrikdM37SZ53ENomgkfPuJIK1Oe9rY8znJIQ+HTqEJLW4JegkwA+Iu64Eq3CiSH95Y/vXe/fhlsE6J8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756725261; c=relaxed/simple;
	bh=oYbjxAT48KmfbNdBRqygud6X+JUUIVRjQb1UCiFZi80=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=AWODdmCrZ8N8pxxa5qUKMbEU8eZLamA9YWiVZE2RNu0JQSLzMEvGS9t0xzoihaVbZ7BIWgUIjpCvoS/eJd8IABec6Arw5wKkJ8JKxGsXeCM5yYYlYgD83K480Bp3VF2UnY+iamQX11QPGdYCyLHVEDj3jybqw3vfc6yLZSnAFAw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ursulin.net; spf=none smtp.mailfrom=ursulin.net; dkim=pass (2048-bit key) header.d=ursulin-net.20230601.gappssmtp.com header.i=@ursulin-net.20230601.gappssmtp.com header.b=vvSDvi8X; arc=none smtp.client-ip=209.85.128.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ursulin.net
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=ursulin.net
Received: by mail-wm1-f44.google.com with SMTP id 5b1f17b1804b1-45b7ebe667cso25052315e9.3
        for <linux-media@vger.kernel.org>; Mon, 01 Sep 2025 04:14:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ursulin-net.20230601.gappssmtp.com; s=20230601; t=1756725258; x=1757330058; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=xBkwqjsaZDNhTrLuqiVAJvU1qg51uqafesNIgxktokA=;
        b=vvSDvi8XcT9GEhsZ4Szn2kChBq3ulef0uKWGSlrl/tvWRG/w+bJXWMPCiBwcUB6VkW
         GhG15hHj3r0c9mSVlVnzB2R//gkRs76+8t3f6RMBJ6LZ3+ULL/76iSoAq++hnU2QfKdh
         YmpXu/SnSizE5QJTgQDsFaZ25zlD4/j6e6dIWMylozMEnrh2sk1neObGI5VI6dxspOW4
         XTXMeeRhlIEyGY7PuIR2dMP+3GxdEq6mHRulAsQm6CQjVmlApsjx80qwsppiEG+Ro2In
         xgQcenOCQIoyeyGObXSGA2kjQOVZTY9GbWU+nJmXz68WNx+G7PvvsHFTzZA3TviWj0Jm
         /C/Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756725258; x=1757330058;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=xBkwqjsaZDNhTrLuqiVAJvU1qg51uqafesNIgxktokA=;
        b=mAKydZft/UMrbcKz68OF4TbhfpfRoJZOlk1Xt+6KNnUYg/XTwf/6ASu2XUd9NU6rBV
         WFXfb4LxbizjflYGAjoOaPX4rZ5m+pQL+tsUrGHqZNal8/GZB3Gt+v240ofUI+5UmdX8
         DeX5fxoQbANo7t38OlcK8ht7oSEvdnRTpuBicx9QG7MoYvRDiUnAZ1yjLkWb13XqJiSl
         QrKcrsEDeJ2tMkQtoPFvff7MpsLrI9t/6L24jlx5aqtRQ2a4QXPf6ra0nhOjAnm7ibYo
         5IRkuB8071WEP6uqxTfLxIBtle0bRY8GWvCvNXi+vOAzelkcBBuigazDCCGpHS2DCrwk
         k7Zg==
X-Forwarded-Encrypted: i=1; AJvYcCUURC24aHQc0Nm1W8MGBE3Rby/51yT5vTNgGyi3S+X3MmWFM8VtSy5HZJD010Dp/nFa/Mp8VeyNjS2TaQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YxCBoq0gLX+/l9aq2qBe5WkMI5GYJ1lTwy1zc0J7ClZGQfsavE6
	Ut3l1tRGuczx7cPjx1T5qTJTJ67lGYkQEMxyXhm8/Pxr+wec8uNk+XWG1W4U0DU/zwM=
X-Gm-Gg: ASbGnctkepq1wMqsDTgrHwj9tqNgljHFWM7hlrPe7DpHt4fBp+PtnrXWMAikUtK8+Na
	ZfqUOuMrctKutSArbg0ty1R9R/146+nQfUzq5knLtKpvBWpZBHdAMdAQiHm8YNCxNRFy+/+9EWz
	7ooOjokGp29Q7JOEBCMqU8fF/iu44AJeI1ymxmKCKO6D9hocDEI28osbOp3RLI/5z76DN6hLT2F
	0sQfXuA9xCRjIu4xhs6bhsJJIA+Q5ICnlgi2CYHrP38hRfwYzcO54Z+SmGBct5MdjBIbTXR1ZkW
	lTRZGLQtN/ebph9Gkz1DTkcWTwEAs2NzTuJmscsiQ/623JwmzfDNSrjqyrK4QGUDWJk1Bg8OrDF
	HkDWutvVny3ryoQg/KcG9fvjFs1Jhy58UG7o=
X-Google-Smtp-Source: AGHT+IEAILM6Jf6ZqkuW3x0Apw3b+DywTCqewxFbm6qZWu0XmBBDdNmEf2BLvNJg+lqzsUsPfcbz4w==
X-Received: by 2002:a05:600c:4588:b0:45b:86ee:4181 with SMTP id 5b1f17b1804b1-45b86ee4497mr59846715e9.22.1756725257287;
        Mon, 01 Sep 2025 04:14:17 -0700 (PDT)
Received: from [192.168.0.101] ([84.66.36.92])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-45b7c461edasm96341605e9.9.2025.09.01.04.14.15
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 01 Sep 2025 04:14:16 -0700 (PDT)
Message-ID: <7e828c84-6dbb-4a0c-9733-4fa0d2b2d07f@ursulin.net>
Date: Mon, 1 Sep 2025 12:14:14 +0100
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/2] dma-buf: add warning when dma_fence is signaled from
 IOCTL
To: =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>,
 simona.vetter@ffwll.ch
Cc: oe-lkp@lists.linux.dev, lkp@intel.com, linux-media@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linaro-mm-sig@lists.linaro.org,
 ltp@lists.linux.it, tvrtko.ursulin@igalia.com, phasta@mailbox.org,
 airlied@gmail.com, dakr@kernel.org, sumit.semwal@linaro.org
References: <202508200843.8b006132-lkp@intel.com>
 <7a193321-f9fa-43db-a495-594b1c586735@amd.com>
Content-Language: en-GB
From: Tvrtko Ursulin <tursulin@ursulin.net>
In-Reply-To: <7a193321-f9fa-43db-a495-594b1c586735@amd.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit


On 21/08/2025 14:00, Christian König wrote:
> Hi Sima,
> 
> I need your opinion on this here. Adding the warning to not signal a fence from IOCTL context yielded it's first victim.
> 
> Skimming through the code what i915 does here is to signal a dma_fence from an error handling path. E.g. the dma_fence was allocated, initialized, the vma code finds that something is wrong and signals the fence and frees it's reference.
> 
> The function which does that has the following comment:
> 
> /**
>   * dma_fence_work_commit_imm: Commit the fence, and if possible execute locally.
>   * @f: the fenced worker
>   *
>   * Instead of always scheduling a worker to execute the callback (see
>   * dma_fence_work_commit()), we try to execute the callback immediately in
>   * the local context. It is required that the fence be committed before it
>   * is published, and that no other threads try to tamper with the number
>   * of asynchronous waits on the fence (or else the callback will be
>   * executed in the wrong context, i.e. not the callers).
>   */
> 
> This works technically, but I would say that this is absolutely not the best practice.
> 
> We have some oportunity to unify dma_fence_work logic between i915 and amdgpu here, but I'm pretty sure I don't want to allow such stuff in amdgpu even if it saves a few of CPU cycles in an error cleanup path.

Jumping in a bit. I had a quick look to remind myself of this area. 
Unfortunately it is not an error cleanup path but the goto labels are a 
bit misleadingly named. The immediate path triggers quite a lot in 
practice so to remove this would need some testing to ensure no regressions.

Regards,

Tvrtko

> 
> What's your opinion on that?
> 
> Thanks,
> Christian.
> 
> On 20.08.25 09:27, kernel test robot wrote:
>>
>>
>> Hello,
>>
>> kernel test robot noticed "WARNING:at_drivers/dma-buf/dma-fence.c:#dma_fence_signal" on:
>>
>> commit: 409db68e04bdf052bc03f620e70339764b598ade ("[PATCH 2/2] dma-buf: add warning when dma_fence is signaled from IOCTL")
>> url: https://github.com/intel-lab-lkp/linux/commits/Christian-K-nig/dma-buf-add-warning-when-dma_fence-is-signaled-from-IOCTL/20250812-223543
>> base: https://git.kernel.org/cgit/linux/kernel/git/torvalds/linux.git 53e760d8949895390e256e723e7ee46618310361
>> patch link: https://lore.kernel.org/all/20250812143402.8619-2-christian.koenig@amd.com/
>> patch subject: [PATCH 2/2] dma-buf: add warning when dma_fence is signaled from IOCTL
>>
>> in testcase: ltp
>> version: ltp-x86_64-9f512c1d8-1_20250809
>> with following parameters:
>>
>> 	test: syscalls-ipc-msgstress
>>
>>
>>
>> config: x86_64-rhel-9.4-ltp
>> compiler: gcc-12
>> test machine: 8 threads 1 sockets Intel(R) Core(TM) i7-4770 CPU @ 3.40GHz (Haswell) with 16G memory
>>
>> (please refer to attached dmesg/kmsg for entire log/backtrace)
>>
>>
>> If you fix the issue in a separate patch/commit (i.e. not just a new version of
>> the same patch/commit), kindly add following tags
>> | Reported-by: kernel test robot <oliver.sang@intel.com>
>> | Closes: https://lore.kernel.org/oe-lkp/202508200843.8b006132-lkp@intel.com
>>
>>
>> [   51.636268][  T218] ------------[ cut here ]------------
>> [ 51.636273][ T218] WARNING: CPU: 3 PID: 218 at drivers/dma-buf/dma-fence.c:420 dma_fence_signal (drivers/dma-buf/dma-fence.c:420 drivers/dma-buf/dma-fence.c:502)
>> [   51.636292][  T218] Modules linked in: coretemp sd_mod snd_hda_codec_realtek_lib snd_hda_codec_generic sg ipmi_devintf kvm_intel snd_hda_intel ipmi_msghandler platform_profile i915(+) kvm snd_hda_codec intel_gtt dell_wmi snd_hda_core drm_buddy binfmt_misc dell_smbios snd_intel_dspcfg ttm dell_wmi_descriptor snd_intel_sdw_acpi snd_hwdep mei_wdt sparse_keymap irqbypass drm_display_helper ahci ghash_clmulni_intel snd_pcm libahci rfkill cec mei_me rapl intel_cstate dcdbas snd_timer drm_client_lib libata intel_uncore mei snd drm_kms_helper i2c_i801 i2c_smbus pcspkr lpc_ich soundcore video wmi fuse drm loop dm_mod
>> [   51.636385][  T218] CPU: 3 UID: 0 PID: 218 Comm: (udev-worker) Not tainted 6.17.0-rc1-00006-g409db68e04bd #1 PREEMPT(voluntary)
>> [   51.636395][  T218] Hardware name: Dell Inc. OptiPlex 9020/0DNKMN, BIOS A05 12/05/2013
>> [ 51.636399][ T218] RIP: 0010:dma_fence_signal (drivers/dma-buf/dma-fence.c:420 drivers/dma-buf/dma-fence.c:502)
>> [ 51.636415][ T218] Code: 00 fc ff df 80 3c 02 00 75 36 48 8b 3b 4c 89 e6 e8 10 33 27 01 89 e8 5b 5d 41 5c c3 cc cc cc cc e8 b0 2e 77 fe 48 85 c0 75 bc <0f> 0b eb b8 0f 0b bd ea ff ff ff 5b 89 e8 5d 41 5c c3 cc cc cc cc
>> All code
>> ========
>>     0:	00 fc                	add    %bh,%ah
>>     2:	ff                   	(bad)
>>     3:	df 80 3c 02 00 75    	filds  0x7500023c(%rax)
>>     9:	36 48 8b 3b          	ss mov (%rbx),%rdi
>>     d:	4c 89 e6             	mov    %r12,%rsi
>>    10:	e8 10 33 27 01       	call   0x1273325
>>    15:	89 e8                	mov    %ebp,%eax
>>    17:	5b                   	pop    %rbx
>>    18:	5d                   	pop    %rbp
>>    19:	41 5c                	pop    %r12
>>    1b:	c3                   	ret
>>    1c:	cc                   	int3
>>    1d:	cc                   	int3
>>    1e:	cc                   	int3
>>    1f:	cc                   	int3
>>    20:	e8 b0 2e 77 fe       	call   0xfffffffffe772ed5
>>    25:	48 85 c0             	test   %rax,%rax
>>    28:	75 bc                	jne    0xffffffffffffffe6
>>    2a:*	0f 0b                	ud2		<-- trapping instruction
>>    2c:	eb b8                	jmp    0xffffffffffffffe6
>>    2e:	0f 0b                	ud2
>>    30:	bd ea ff ff ff       	mov    $0xffffffea,%ebp
>>    35:	5b                   	pop    %rbx
>>    36:	89 e8                	mov    %ebp,%eax
>>    38:	5d                   	pop    %rbp
>>    39:	41 5c                	pop    %r12
>>    3b:	c3                   	ret
>>    3c:	cc                   	int3
>>    3d:	cc                   	int3
>>    3e:	cc                   	int3
>>    3f:	cc                   	int3
>>
>> Code starting with the faulting instruction
>> ===========================================
>>     0:	0f 0b                	ud2
>>     2:	eb b8                	jmp    0xffffffffffffffbc
>>     4:	0f 0b                	ud2
>>     6:	bd ea ff ff ff       	mov    $0xffffffea,%ebp
>>     b:	5b                   	pop    %rbx
>>     c:	89 e8                	mov    %ebp,%eax
>>     e:	5d                   	pop    %rbp
>>     f:	41 5c                	pop    %r12
>>    11:	c3                   	ret
>>    12:	cc                   	int3
>>    13:	cc                   	int3
>>    14:	cc                   	int3
>>    15:	cc                   	int3
>> [   51.636420][  T218] RSP: 0018:ffffc90000a9ed30 EFLAGS: 00010046
>> [   51.636428][  T218] RAX: 0000000000000000 RBX: ffff88811750fc00 RCX: 0000000000000018
>> [   51.636437][  T218] RDX: 0000000000000000 RSI: 0000000000000004 RDI: ffff88810691512c
>> [   51.636440][  T218] RBP: 0000000be56b1408 R08: 0000000000000001 R09: fffff52000153d9a
>> [   51.636445][  T218] R10: 0000000000000003 R11: ffff888108145000 R12: 0000000000000246
>> [   51.636452][  T218] R13: ffffffffc1c9b060 R14: ffff88810406ba0c R15: 1ffff92000153dc2
>> [   51.636455][  T218] FS:  00007efd90c038c0(0000) GS:ffff8883e4077000(0000) knlGS:0000000000000000
>> [   51.636459][  T218] CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
>> [   51.636462][  T218] CR2: 00007f5bd8238c20 CR3: 000000040ed8a005 CR4: 00000000001726f0
>> [   51.636466][  T218] Call Trace:
>> [   51.636469][  T218]  <TASK>
>> [ 51.636477][ T218] fence_work (include/linux/dma-fence.h:272 drivers/gpu/drm/i915/i915_sw_fence_work.c:23) i915
>> [ 51.637304][ T218] fence_notify (drivers/gpu/drm/i915/i915_sw_fence_work.c:39) i915
>> [ 51.637827][ T218] __i915_sw_fence_complete (drivers/gpu/drm/i915/i915_sw_fence.c:201) i915
>> [ 51.638300][ T218] i915_vma_pin_ww (drivers/gpu/drm/i915/i915_vma.c:1601) i915
>> [ 51.638763][ T218] ? __pfx_i915_vma_pin_ww (drivers/gpu/drm/i915/i915_vma.c:1434) i915
>> [ 51.639218][ T218] ? i915_gem_object_make_unshrinkable (include/linux/list.h:215 include/linux/list.h:287 drivers/gpu/drm/i915/gem/i915_gem_shrinker.c:500) i915
>> [ 51.639648][ T218] ? i915_vma_make_unshrinkable (drivers/gpu/drm/i915/i915_vma.c:2292) i915
>> [ 51.640091][ T218] ? intel_ring_pin (drivers/gpu/drm/i915/gt/intel_ring.c:73) i915
>> [ 51.640505][ T218] intel_ring_submission_setup (drivers/gpu/drm/i915/gt/intel_ring_submission.c:1290 drivers/gpu/drm/i915/gt/intel_ring_submission.c:1421) i915
>> [ 51.640918][ T218] ? __pfx_intel_ring_submission_setup (drivers/gpu/drm/i915/gt/intel_ring_submission.c:1349) i915
>> [   51.641232][   T65] sd 0:0:0:0: [sda] Mode Sense: 00 3a 00 00
>> [ 51.641321][ T218] ? intel_engine_init_whitelist (drivers/gpu/drm/i915/gt/intel_workarounds.c:2104) i915
>> [ 51.641735][ T218] ? __intel_wakeref_init (arch/x86/include/asm/atomic.h:28 include/linux/atomic/atomic-arch-fallback.h:503 include/linux/atomic/atomic-instrumented.h:68 drivers/gpu/drm/i915/intel_wakeref.c:109) i915
>> [ 51.642126][ T218] intel_engines_init (drivers/gpu/drm/i915/gt/intel_engine_cs.c:1514) i915
>> [ 51.642521][ T218] ? i915_gem_object_make_unshrinkable (arch/x86/include/asm/atomic.h:93 include/linux/atomic/atomic-arch-fallback.h:667 include/linux/atomic/atomic-arch-fallback.h:1119 include/linux/atomic/atomic-instrumented.h:524 drivers/gpu/drm/i915/gem/i915_gem_shrinker.c:498) i915
>> [ 51.642929][ T218] ? __pfx_intel_ring_submission_setup (drivers/gpu/drm/i915/gt/intel_ring_submission.c:1349) i915
>> [ 51.643331][ T218] intel_gt_init (drivers/gpu/drm/i915/gt/intel_gt.c:719) i915
>> [ 51.643728][ T218] i915_gem_init (drivers/gpu/drm/i915/i915_gem.c:1191) i915
>> [ 51.644140][ T218] i915_driver_probe (drivers/gpu/drm/i915/i915_driver.c:831) i915
>> [ 51.644524][ T218] ? __pfx_i915_driver_probe (drivers/gpu/drm/i915/i915_driver.c:780) i915
>> [ 51.644903][ T218] ? drm_privacy_screen_get (drivers/gpu/drm/drm_privacy_screen.c:169) drm
>> [ 51.645047][ T218] ? intel_display_driver_probe_defer (drivers/gpu/drm/i915/display/intel_display_driver.c:84) i915
>> [ 51.645483][ T218] ? i915_pci_probe (drivers/gpu/drm/i915/i915_pci.c:995) i915
>> [ 51.645876][ T218] ? __pfx_i915_pci_probe (drivers/gpu/drm/i915/i915_pci.c:956) i915
>> [ 51.646267][ T218] local_pci_probe (drivers/pci/pci-driver.c:324)
>> [ 51.646283][ T218] pci_call_probe (drivers/pci/pci-driver.c:392)
>> [ 51.646295][ T218] ? _raw_spin_lock (arch/x86/include/asm/atomic.h:107 include/linux/atomic/atomic-arch-fallback.h:2170 include/linux/atomic/atomic-instrumented.h:1302 include/asm-generic/qspinlock.h:111 include/linux/spinlock.h:187 include/linux/spinlock_api_smp.h:134 kernel/locking/spinlock.c:154)
>> [ 51.646308][ T218] ? __pfx_pci_call_probe (drivers/pci/pci-driver.c:352)
>> [ 51.646321][ T218] ? kernfs_add_one (fs/kernfs/dir.c:834)
>> [ 51.646337][ T218] ? pci_assign_irq (drivers/pci/irq.c:149)
>> [ 51.646350][ T218] ? pci_match_device (drivers/pci/pci-driver.c:159 (discriminator 1))
>> [ 51.646362][ T218] ? kernfs_put (arch/x86/include/asm/atomic.h:67 (discriminator 1) include/linux/atomic/atomic-arch-fallback.h:2278 (discriminator 1) include/linux/atomic/atomic-instrumented.h:1384 (discriminator 1) fs/kernfs/dir.c:569 (discriminator 1))
>> [ 51.646368][ T218] pci_device_probe (drivers/pci/pci-driver.c:452)
>> [ 51.646377][ T218] really_probe (drivers/base/dd.c:581 drivers/base/dd.c:659)
>> [ 51.646391][ T218] __driver_probe_device (drivers/base/dd.c:801)
>> [ 51.646404][ T218] driver_probe_device (drivers/base/dd.c:831)
>> [ 51.646416][ T218] __driver_attach (drivers/base/dd.c:1218)
>> [ 51.646424][ T218] ? __pfx___driver_attach (drivers/base/dd.c:1158)
>> [ 51.646428][ T218] bus_for_each_dev (drivers/base/bus.c:369)
>> [ 51.646441][ T218] ? __pfx_bus_for_each_dev (drivers/base/bus.c:358)
>> [ 51.646444][ T218] ? __kmalloc_cache_noprof (arch/x86/include/asm/jump_label.h:46 include/linux/memcontrol.h:1714 mm/slub.c:2210 mm/slub.c:4190 mm/slub.c:4229 mm/slub.c:4391)
>> [ 51.646456][ T218] ? klist_add_tail (include/linux/list.h:150 include/linux/list.h:183 lib/klist.c:104 lib/klist.c:137)
>> [ 51.646468][ T218] bus_add_driver (drivers/base/bus.c:678)
>> [ 51.646482][ T218] driver_register (drivers/base/driver.c:249)
>> [ 51.646490][ T218] i915_init (drivers/gpu/drm/i915/i915_driver.c:1428) i915
>> [ 51.646891][ T218] ? __pfx_i915_init (drivers/gpu/drm/i915/i915_config.c:13) i915
>> [   51.647101][   T67] sd 2:0:0:0: [sdb] Write cache: enabled, read cache: enabled, doesn't support DPO or FUA
>> [ 51.647277][ T218] do_one_initcall (init/main.c:1269)
>> [ 51.647292][ T218] ? kfree (mm/slub.c:4680 mm/slub.c:4879)
>> [ 51.647304][ T218] ? __pfx_do_one_initcall (init/main.c:1260)
>> [ 51.647315][ T218] ? kasan_unpoison (mm/kasan/shadow.c:156 mm/kasan/shadow.c:182)
>> [ 51.647327][ T218] ? __kasan_slab_alloc (mm/kasan/common.c:329 mm/kasan/common.c:356)
>> [ 51.647340][ T218] ? __kmalloc_cache_noprof (mm/slub.c:4180 mm/slub.c:4229 mm/slub.c:4391)
>> [ 51.647352][ T218] ? kasan_save_track (arch/x86/include/asm/current.h:25 mm/kasan/common.c:60 mm/kasan/common.c:69)
>> [ 51.647365][ T218] ? kasan_unpoison (mm/kasan/shadow.c:156 mm/kasan/shadow.c:182)
>> [ 51.647377][ T218] do_init_module (kernel/module/main.c:3039)
>> [ 51.647388][ T218] ? __pfx_do_init_module (kernel/module/main.c:3011)
>> [ 51.647402][ T218] ? kfree (mm/slub.c:4680 mm/slub.c:4879)
>> [ 51.647414][ T218] ? klp_module_coming (kernel/livepatch/core.c:1317)
>> [ 51.647426][ T218] ? load_module (kernel/module/main.c:2468 kernel/module/main.c:2463 kernel/module/main.c:3504)
>> [ 51.647441][ T218] load_module (kernel/module/main.c:3509)
>> [ 51.647449][ T218] ? ima_post_read_file (security/integrity/ima/ima_main.c:896 security/integrity/ima/ima_main.c:878)
>> [ 51.647466][ T218] ? __pfx_load_module (kernel/module/main.c:3353)
>> [ 51.647478][ T218] ? __pfx_kernel_read_file (fs/kernel_read_file.c:38)
>> [ 51.647489][ T218] ? init_module_from_file (kernel/module/main.c:3701)
>> [ 51.647499][ T218] init_module_from_file (kernel/module/main.c:3701)
>> [ 51.647514][ T218] ? __pfx_init_module_from_file (kernel/module/main.c:3677)
>> [ 51.647525][ T218] ? mm_get_unmapped_area (arch/x86/include/asm/bitops.h:206 arch/x86/include/asm/bitops.h:238 include/asm-generic/bitops/instrumented-non-atomic.h:142 mm/mmap.c:805 mm/mmap.c:871)
>> [ 51.647540][ T218] ? _raw_spin_lock (arch/x86/include/asm/atomic.h:107 include/linux/atomic/atomic-arch-fallback.h:2170 include/linux/atomic/atomic-instrumented.h:1302 include/asm-generic/qspinlock.h:111 include/linux/spinlock.h:187 include/linux/spinlock_api_smp.h:134 kernel/locking/spinlock.c:154)
>> [ 51.647547][ T218] ? __pfx__raw_spin_lock (kernel/locking/spinlock.c:153)
>> [ 51.647560][ T218] idempotent_init_module (kernel/module/main.c:3713)
>> [ 51.647573][ T218] ? __pfx_idempotent_init_module (kernel/module/main.c:3705)
>> [ 51.647582][ T218] ? __pfx___seccomp_filter (kernel/seccomp.c:1244)
>> [ 51.647590][ T218] ? fdget (include/linux/atomic/atomic-arch-fallback.h:479 include/linux/atomic/atomic-instrumented.h:50 fs/file.c:1167 fs/file.c:1181)
>> [ 51.647607][ T218] ? security_capable (security/security.c:1142)
>> [ 51.647615][ T218] __x64_sys_finit_module (include/linux/file.h:62 include/linux/file.h:83 kernel/module/main.c:3736 kernel/module/main.c:3723 kernel/module/main.c:3723)
>> [ 51.647627][ T218] ? syscall_trace_enter (kernel/entry/syscall-common.c:44)
>> [ 51.647640][ T218] do_syscall_64 (arch/x86/entry/syscall_64.c:63 arch/x86/entry/syscall_64.c:94)
>> [ 51.647657][ T218] ? fput (arch/x86/include/asm/atomic64_64.h:79 include/linux/atomic/atomic-arch-fallback.h:2913 include/linux/atomic/atomic-arch-fallback.h:3364 include/linux/atomic/atomic-long.h:698 include/linux/atomic/atomic-instrumented.h:3767 include/linux/file_ref.h:157 fs/file_table.c:544)
>> [ 51.647668][ T218] ? ksys_mmap_pgoff (mm/mmap.c:609)
>> [ 51.647682][ T218] ? do_syscall_64 (arch/x86/entry/syscall_64.c:63 arch/x86/entry/syscall_64.c:94)
>> [ 51.647694][ T218] ? from_kgid_munged (kernel/user_namespace.c:535)
>> [ 51.647708][ T218] ? _copy_to_user (arch/x86/include/asm/uaccess_64.h:126 arch/x86/include/asm/uaccess_64.h:147 include/linux/uaccess.h:197 lib/usercopy.c:26)
>> [ 51.647722][ T218] ? cp_new_stat (fs/stat.c:471)
>> [ 51.647732][ T218] ? __pfx_cp_new_stat (fs/stat.c:471)
>>
>>
>> The kernel config and materials to reproduce are available at:
>> https://download.01.org/0day-ci/archive/20250820/202508200843.8b006132-lkp@intel.com
>>
>>
>>
> 


