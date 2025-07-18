Return-Path: <linux-media+bounces-38057-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 16F34B0A1B2
	for <lists+linux-media@lfdr.de>; Fri, 18 Jul 2025 13:13:38 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 7AD051C81370
	for <lists+linux-media@lfdr.de>; Fri, 18 Jul 2025 11:13:55 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DDCD129B767;
	Fri, 18 Jul 2025 11:13:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="lhy0/SqA"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-pg1-f169.google.com (mail-pg1-f169.google.com [209.85.215.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7F7CF2BEC33
	for <linux-media@vger.kernel.org>; Fri, 18 Jul 2025 11:13:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752837209; cv=none; b=lrSAWjeDjNsDzYgTgDziP7onKgHhh+VfxNN0rd7zzJXEmWGCnQ4SESrads/odEuAiPOyw4d+aiN87BF4R4mzhDPsKiw9FQGg3/W3XHRO8579QScRDYVSlCgJMJq7QUPc6Sd6mK5xTkizLwTtCkog7u0FERpobUzIuWfcUYZ5oO8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752837209; c=relaxed/simple;
	bh=fyq992ghjiN1KAlcI1YrvA4Yycur+ovMG5WSElQM5M8=;
	h=MIME-Version:From:Date:Message-ID:Subject:To:Cc:Content-Type; b=I32QiTXoIpqOQc2q1BdKP2mX1KjnZGAt801E9eVTgluX3xt6OVZaitlcwGxRUVRlDBYz5rOsDS2Li23TkIpNsyGp/SO4qXjJ8ekpDt7eZ2Vaw7ZHae+4TFA/vGVssZHt6oR6UKhmBRnMkSK/7u7PZpSDwSZKnrAwSkPucPY8z/w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=lhy0/SqA; arc=none smtp.client-ip=209.85.215.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-pg1-f169.google.com with SMTP id 41be03b00d2f7-b321bd36a41so1561777a12.2
        for <linux-media@vger.kernel.org>; Fri, 18 Jul 2025 04:13:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1752837207; x=1753442007; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:mime-version:from:to:cc:subject
         :date:message-id:reply-to;
        bh=2ugICqfFgDIHEho8XiK+TfnaiVKr7b0xokHuPH4p4dU=;
        b=lhy0/SqAjo+Vk67XEpGASp7aZqZj8ncIFsWaDO3g8IKhl2IAsM1DgFhiT1+an40/Ds
         VnDC2uDTE7p5+03bpXvQRlY76mtoyQ6qdO0tDfm/hjEPlEtUlY78by0dc8+CJ7RRjfFS
         X4pn5MXrokCxxjoqBxH8FLVhtS/yUBMECViVyGo52x2KJPVJCgVkpXU6U9Wt2ysl9WXC
         ccSAUk/Wss0cbTTQxcecRMfEzk6+YhP9VH78SxycgA1dcvRv1viibaPTb/e8iVuE+83h
         vKI4D1W6b7xBo90EWVrvYx+QReQzTubMVEwt6XmKnUBWUkEFc2jc1xNL6W+p9sY/20tf
         DaMg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752837207; x=1753442007;
        h=cc:to:subject:message-id:date:from:mime-version:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=2ugICqfFgDIHEho8XiK+TfnaiVKr7b0xokHuPH4p4dU=;
        b=i7imFaVZUek9wNy1aUMxeF+Np3rj74oqx8ZmOODfYVXUM8k4rQmN0nqiob0wnUxMw3
         yDg7x4O8ci7Om7BG0Oe7QEpsckst170yyKorSwhvKUkCZoAzEeYNv3JvtTWXsa38M5hs
         LayKJUG7HXRb2K6gZ2NY41oebkyewZqfpTFDZwELPmg3sesLw4lkE/+v8vwF8+jvh4gx
         CeWpfQe9v66cPB0+KR7U2u5W6GKlqUfSv6AhUZviIPHVJ4+fLbR8+k6Vpl9ZJ8LNiSKp
         D0OD691kSJu9JzhmhjvD0ZDoQTjT6g2fQ4+CtQMUmNnPvhZLFfaXLeffXaN9p+pFOvgD
         T9Ew==
X-Forwarded-Encrypted: i=1; AJvYcCW4VMhx9HTajh5046CjvawDuqDQ2I83qkKyKOrEadJOd3RHS8q1dD6fyhy/f+6ytHkkprRDvvmU8OLLIQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YwE7zGNrTxaozOvAbMqwpggz1e/tmyfcc2DioexmrjKq4cmjUau
	nJzpGgy+7WVTafX0eHWat8VTjrbsFNnp4+eayCNPNRYm284/6vg2lbkRxxwc8/1yy3CASxhULKP
	7mgaeZ0rRJyMeZimKDSinVVedEp0Me8cz1GXAsTgqCg==
X-Gm-Gg: ASbGncu0AnaQTJ+gG3WejV2Tyn0XuVKb7GuMnTROQWDrnabhEhxnJuvpW1nnxJFivZ7
	hUpQaWUx057CGTusdRk0KmdIsuXx/+rWFhRnPavFTgwnJT+7WbW78rp7txAqMk3f6rRAKZ0JxJf
	ouPY4fzHEfiyM6LqDRVaOqKlk4+azYiqOSCRZt9OMaoBwvbqSygU/lBS4BkJRQ5GsvHGMI2RvYB
	QhLq8oLhQ4k4umV4AbZ11WA/FIGK5khAhcmHWdWUxjWE9zIzD4=
X-Google-Smtp-Source: AGHT+IGOkia721AY676t+fmu13gN1NV66S9oFI8NxbveWX6OhwIQaoS76AvEpNR9I6Tz21cUYHEq199KgcfAe2+qFsY=
X-Received: by 2002:a17:90b:3f08:b0:312:e91c:e340 with SMTP id
 98e67ed59e1d1-31c9f4c507bmr14357476a91.35.1752837206629; Fri, 18 Jul 2025
 04:13:26 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
From: Naresh Kamboju <naresh.kamboju@linaro.org>
Date: Fri, 18 Jul 2025 16:43:15 +0530
X-Gm-Features: Ac12FXyn7oadQvZ8ThG2f13b6pdzjNTb1LAR3UQzOj2T0pPa55C9A9OIPclltvQ
Message-ID: <CA+G9fYu5=3n84VY+vTbCAcfFKOq7Us5vgBZgpypY4MveM=eVwg@mail.gmail.com>
Subject: arm64 dragonboard 410c Internal error Oops dev_pm_opp_put core_clks_enable
To: open list <linux-kernel@vger.kernel.org>, lkft-triage@lists.linaro.org, 
	Linux Regressions <regressions@lists.linux.dev>, linux-clk <linux-clk@vger.kernel.org>, 
	linux-arm-msm <linux-arm-msm@vger.kernel.org>, 
	Linux Media Mailing List <linux-media@vger.kernel.org>
Cc: quic_vgarodia@quicinc.com, quic_dikshita@quicinc.com, 
	"Bryan O'Donoghue" <bryan.odonoghue@linaro.org>, Mauro Carvalho Chehab <mchehab@kernel.org>, 
	Arnd Bergmann <arnd@arndb.de>, Anders Roxell <anders.roxell@linaro.org>, 
	Dan Carpenter <dan.carpenter@linaro.org>, Benjamin Copeland <ben.copeland@linaro.org>
Content-Type: text/plain; charset="UTF-8"

The following Boot regressions are noticed on the Linux
next-20250708with gcc-13 and clang-20 toolchains for the dragonboard
410c device.

First seen on the tag next-20250708.
Good: next-20250704
Bad:  next-20250708

Regression Analysis:
- New regression? Yes
- Reproducibility? Yes

Boot regression: arm64 dragonboard 410c Internal error Oops
dev_pm_opp_put core_clks_enable

Reported-by: Linux Kernel Functional Testing <lkft@linaro.org>

## Test log
[   12.512749] Internal error: Oops: 0000000096000004 [#1]  SMP
[   12.518471] Modules linked in: drm_dp_aux_bus qcom_vadc_common
venus_core(+) qcom_pon(+) qmi_helpers videobuf2_dma_sg qnoc_msm8916
qcom_stats drm_display_helper v4l2_mem2mem videobuf2_memops qcom_rng
mdt_loader videobuf2_v4l2 cec videobuf2_common drm_client_lib
display_connector rpmsg_ctrl rpmsg_char ramoops drm_kms_helper socinfo
reed_solomon rmtfs_mem fuse drm backlight ip_tables x_tables
[   12.527390] input: pm8941_resin as
/devices/platform/soc@0/200f000.spmi/spmi-0/0-00/200f000.spmi:pmic@0:pon@800/200f000.spmi:pmic@0:pon@800:resin/input/input2
[   12.536414] CPU: 1 UID: 0 PID: 245 Comm: (udev-worker) Not tainted
6.16.0-rc6-next-20250717 #1 PREEMPT
[   12.536428] Hardware name: Qualcomm Technologies, Inc. APQ 8016 SBC (DT)
[   12.536435] pstate: 60000005 (nZCv daif -PAN -UAO -TCO -DIT -SSBS BTYPE=--)
[   12.536445] pc : dev_pm_opp_put (/builds/linux/drivers/opp/core.c:1685)
[   12.595660] lr : core_clks_enable+0x54/0x148 venus_core
[   12.595754] sp : ffff80008492b600
[   12.595760] x29: ffff80008492b600 x28: ffff80008492bba0 x27: ffff0000047a6138
[   12.595778] x26: 0000000000000000 x25: ffff800082c4fe38 x24: ffff80007b3b8ba0
[   12.595795] x23: ffff00000b2e00c8 x22: ffff00000b2e0080 x21: 0000000000000000
[   12.595811] x20: 0000000000000000 x19: ffffffffffffffee x18: 0000000000000000
[   12.595827] x17: 0000000000000000 x16: 1fffe000006c0ae1 x15: 0000000000000000
[   12.629871] x14: 0000000000000000 x13: 007473696c5f7974 x12: 696e696666615f65
[   12.629890] x11: ffff00003fa551c0 x10: 0000000000000020 x9 : ffff80007b3a5684
[   12.629908] x8 : ffffffffffffffde x7 : ffff000009ade040 x6 : 0000000000000000
[   12.629924] x5 : 0000000000000002 x4 : 00000000c0000000 x3 : 0000000000000001
[   12.629939] x2 : 0000000000000002 x1 : ffffffffffffffde x0 : ffffffffffffffee
[   12.629956] Call trace:
[   12.629962]  dev_pm_opp_put+0x24/0x58 (P)
[   12.629981]  core_clks_enable+0x54/0x148 venus_core
[   12.630064]  core_power_v1+0x78/0x90 venus_core
[   12.691130]  venus_runtime_resume+0x6c/0x98 venus_core
[   12.691214]  pm_generic_runtime_resume+0x34/0x58
[   12.691233]  __genpd_runtime_resume+0x38/0x90
[   12.691247]  genpd_runtime_resume+0xe0/0x2f0
[   12.691261]  __rpm_callback+0x50/0x1f0
[   12.691272]  rpm_callback+0x7c/0x90
[   12.691281]  rpm_resume+0x46c/0x650
[   12.721332]  __pm_runtime_resume+0x58/0xa8
[   12.721345]  venus_probe+0x2d8/0x588 venus_core
[   12.721409]  platform_probe+0x64/0xa8
[   12.721423]  really_probe+0xc8/0x3a0
[   12.721433]  __driver_probe_device+0x84/0x170
[   12.721443]  driver_probe_device+0x44/0x120
[   12.721453]  __driver_attach+0xf8/0x208
[   12.749283]  bus_for_each_dev+0x90/0xf8
[   12.749299]  driver_attach+0x2c/0x40
[   12.749314]  bus_add_driver+0x118/0x248
[   12.749328]  driver_register+0x64/0x138
[   12.749339]  __platform_driver_register+0x2c/0x40
[   12.749350]  qcom_venus_driver_init+0x28/0xfb8 venus_core
[   12.772990]  do_one_initcall+0x60/0x290
[   12.773012]  do_init_module+0x60/0x268
[   12.773028]  load_module+0x1e00/0x2060
[   12.773042]  init_module_from_file+0x90/0xe0
[   12.773057]  __arm64_sys_finit_module+0x270/0x370
[   12.773070]  invoke_syscall+0x50/0x120
[   12.773081]  el0_svc_common.constprop.0+0xc8/0xf0
[   12.773091]  do_el0_svc+0x24/0x38
[   12.773100]  el0_svc+0x3c/0x138
[   12.773116]  el0t_64_sync_handler+0xa0/0xe8
[   12.773130]  el0t_64_sync+0x198/0x1a0
[   12.817608] Code: 910003fd f9000bf3 91004013 aa1303e0 (f9402821)
All code
========
   0: 910003fd mov x29, sp
   4: f9000bf3 str x19, [sp, #16]
   8: 91004013 add x19, x0, #0x10
   c: aa1303e0 mov x0, x19
  10:* f9402821 ldr x1, [x1, #80] <-- trapping instruction

Code starting with the faulting instruction
===========================================
   0: f9402821 ldr x1, [x1, #80]
[   12.817618] ---[ end trace 0000000000000000 ]---

...
[   38.070603] Internal error: Oops: 0000000096000004 [#2]  SMP
[   38.077336] Modules linked in: pm8916_wdt snd_soc_lpass_apq8016
snd_soc_msm8916_digital snd_soc_lpass_cpu snd_soc_msm8916_analog
snd_soc_apq8016_sbc msm qcom_wcnss_pil snd_soc_lpass_platform
snd_soc_qcom_common snd_soc_core snd_compress qrtr coresight_stm
ubwc_config coresight_cpu_debug snd_pcm_dmaengine qcom_q6v5_mss
llcc_qcom stm_core snd_pcm coresight_cti qcom_pil_info ocmem snd_timer
qcom_q6v5 drm_gpuvm adv7511 snd qcom_sysmon drm_exec soundcore
gpu_sched qcom_common qcom_spmi_temp_alarm rtc_pm8xxx qcom_spmi_vadc
qcom_glink_smem qcom_camss drm_dp_aux_bus qcom_vadc_common
venus_core(+) qcom_pon qmi_helpers videobuf2_dma_sg qnoc_msm8916
qcom_stats drm_display_helper v4l2_mem2mem videobuf2_memops qcom_rng
mdt_loader videobuf2_v4l2 cec videobuf2_common drm_client_lib
display_connector rpmsg_ctrl rpmsg_char ramoops drm_kms_helper socinfo
reed_solomon rmtfs_mem fuse drm backlight ip_tables x_tables
[   38.140171] CPU: 0 UID: 0 PID: 1202 Comm: irq/55-3-0039 Tainted: G
    D             6.16.0-rc6-next-20250717 #1 PREEMPT
[   38.162330] Tainted: [D]=DIE
[   38.173246] Hardware name: Qualcomm Technologies, Inc. APQ 8016 SBC (DT)
[   38.176294] pstate: 20000005 (nzCv daif -PAN -UAO -TCO -DIT -SSBS BTYPE=--)
[   38.182980] pc : adv7511_cec_register_volatile+0xc/0x40 adv7511
[   38.189659] lr : regmap_volatile
(/builds/linux/drivers/base/regmap/regmap.c:153)
[   38.195904] sp : ffff8000869e3bf0
[   38.199896] x29: ffff8000869e3bf0 x28: ffff00000b38eeac x27: ffff8000801e1700
[   38.203289] x26: ffff8000801de1b0 x25: ffff8000829a0210 x24: ffff00000a091d80
[   38.210408] x23: 0000000000000070 x22: 0000000000000096 x21: ffff8000869e3cb4
[   38.217525] x20: 0000000000000096 x19: ffff00000366f400 x18: 0000000000000098
[   38.224643] x17: 00000000000000c7 x16: 00000000000000c4 x15: 00000000000000bf
[   38.231761] x14: 00000000000000be x13: 00000000000000ff x12: 00000000000000f6
[   38.238881] x11: 00000000000000f4 x10: 00000000000000cb x9 : ffff800080c83384
[   38.245997] x8 : ffff8000869e3a78 x7 : 0000000000000000 x6 : 0000000000000001
[   38.253115] x5 : ffff8000829a0000 x4 : 0000000000000000 x3 : ffff00000366f400
[   38.260233] x2 : ffff80007b4b74d8 x1 : 0000000000000096 x0 : 0000000000000000
[   38.267353] Call trace:
[   38.274460]  adv7511_cec_register_volatile+0xc/0x40 adv7511 (P)
[   38.276726]  regcache_read+0x3c/0x100
[   38.282973]  _regmap_read+0x90/0x190
[   38.286615]  regmap_read+0x54/0x88
[   38.290260]  adv7511_cec_irq_process+0xb4/0x310 adv7511
[   38.293477]  adv7511_irq_process+0xc4/0x158 adv7511
[   38.298946]  adv7511_irq_handler+0x20/0x40 adv7511
[   38.303979]  irq_thread_fn+0x34/0xb8
[   38.309010]  irq_thread+0x198/0x3b0
[   38.312570]  kthread+0x138/0x228
[   38.315781]  ret_from_fork+0x10/0x20
[   38.319260] Code: ffff8000 aa1e03e9 d503201f f9403c00 (f941cc00)
All code
========
   0: ffff8000 .inst 0xffff8000 ; undefined
   4: aa1e03e9 mov x9, x30
   8: d503201f nop
   c: f9403c00 ldr x0, [x0, #120]
  10:* f941cc00 ldr x0, [x0, #920] <-- trapping instruction

Code starting with the faulting instruction
===========================================
   0: f941cc00 ldr x0, [x0, #920]
[   38.322823] ---[ end trace 0000000000000000 ]---


## Source
* Git tree: https://kernel.googlesource.com/pub/scm/linux/kernel/git/next/linux-next.git
* Project: https://qa-reports.linaro.org/lkft/linux-next-master/build/next-20250717/
* Git sha: 024e09e444bd2b06aee9d1f3fe7b313c7a2df1bb
* Git describe: 6.16.0-rc6-next-20250717
* kernel version: next-20250717
* Architectures: arm64 (Dragonboard 410c)
* Toolchains: clang-20 gcc-13
* Kconfigs: defconfig+lkftconfigs

## Test
* Test log:https://qa-reports.linaro.org/api/testruns/29169813/log_file/
* Test LAVA: https://lkft.validation.linaro.org/scheduler/job/8361760#L3403
* Test run: https://regressions.linaro.org/lkft/linux-next-master/next-20250717/testruns/1662734/
* Test history:
https://regressions.linaro.org/lkft/linux-next-master/next-20250717/log-parser-test/internal-error-oops-oops-smp/history/
* Test plan: https://regressions.linaro.org/lkft/linux-next-master/next-20250717/log-parser-test/internal-error-oops-oops-smp/
* Build link: https://storage.tuxsuite.com/public/linaro/lkft/builds/2zzwEWZON9hQQK9VfaE276a89yt/
* Kernel config:
https://storage.tuxsuite.com/public/linaro/lkft/builds/2zzwEWZON9hQQK9VfaE276a89yt/config


--
Linaro LKFT
https://lkft.linaro.org

