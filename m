Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id C7990F0F3
	for <lists+linux-media@lfdr.de>; Tue, 30 Apr 2019 09:12:18 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726262AbfD3HKk (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 30 Apr 2019 03:10:40 -0400
Received: from mail-lj1-f195.google.com ([209.85.208.195]:35545 "EHLO
        mail-lj1-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725996AbfD3HKk (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 30 Apr 2019 03:10:40 -0400
Received: by mail-lj1-f195.google.com with SMTP id z26so11776666ljj.2
        for <linux-media@vger.kernel.org>; Tue, 30 Apr 2019 00:10:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:from:date:message-id:subject:to:cc;
        bh=AAEBm4fikJXyLjzi5P80VcRJzOXO5JftWtkBOWC0wf4=;
        b=xbNda5QhdsE64EoTj7fwTiiTy59GBAPQg9LWuiSoeK8GEuTBOVH3Ctm86QAfZYfucn
         2H/oXbSEYnk1jK9K2ejWKA9lJolJ2AKg6idKVabhAKpIWY5U1NgUd3zX4hfK6TFPTD8V
         ItUDPbGj2RugOm6rtDSJE4NcN7SR5TIBQHNMRLJpLYvWGM6zuv4lPuYIM5HE5XHlptkq
         AB1bZLEqllw4YHWe8VQUBQ1MNzxX1eX/fEVZn/LTdzRllQKMFxxvTzRTxpFLo81FbHaO
         O5QvlEk0cJ/Bw9V13af3elPWMM4F/QTjtch8i5QfqvHFkN31PS5KZmnupuxUWEUd7v/8
         /qoA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:from:date:message-id:subject:to:cc;
        bh=AAEBm4fikJXyLjzi5P80VcRJzOXO5JftWtkBOWC0wf4=;
        b=E7wNnMCBke+cizfFItJKeYs/ObmXLZ5PRB/7ZvdfrrfoxWJBp7gYP/4hGkYEVXm93p
         AOVWsfS3cqF2BNll5a1GpIABUu7otmvezR3PB+1gHh2MQqV88ZHTkgagtwZYroSbVkMb
         DD5LhUHBl/83L4icYGhNuxyA0RQ6OU/gWm8zsRWRXcvMPTkItx0rAiyGpHSlNM9mW7pf
         LJWL8kZJ9UMQaxrhLGRWYbJGs9aCd6lWq/XAEgNxQlg5EnnGbdOm84rDpLlWD7Wzapxh
         IxfHOLbq903q0pwOkwboyU7wAsEM/Nq5juchT5cxww5O4BvrOA0Te2sRgnsO0GSt+z6o
         kDBQ==
X-Gm-Message-State: APjAAAXK4ocWaxx+RhKSVzaXdh9NezWDWEk55eEn2raMlZK7kEnneupH
        Dj0B9Z0NNRfW6+RB19Ty6FNUWOlkiZhWVfP+wbfN8Q==
X-Google-Smtp-Source: APXvYqwD3wrNL/z/0s6FMtN5R3Gbbl7h0X701DfEvS1eeYIShEtsDOYkE6MerrSlNaoHthg0MwGK5NV7Rpeo9ZSIpCQ=
X-Received: by 2002:a2e:9dcb:: with SMTP id x11mr754253ljj.123.1556608237401;
 Tue, 30 Apr 2019 00:10:37 -0700 (PDT)
MIME-Version: 1.0
From:   Naresh Kamboju <naresh.kamboju@linaro.org>
Date:   Tue, 30 Apr 2019 12:40:26 +0530
Message-ID: <CA+G9fYuZhS+QfgM0HrNm4B8Yb+0kwScxaURJDYXKPY-ML_L0cQ@mail.gmail.com>
Subject: vidioc_g_edid: BUG: Unable to handle kernel NULL pointer dereference
 at virtual address 00000716
To:     open list <linux-kernel@vger.kernel.org>,
        linux-media@vger.kernel.org
Cc:     samitolvanen@google.com, paul.kocialkowski@bootlin.com,
        ezequiel@collabora.com, treding@nvidia.com,
        niklas.soderlund+renesas@ragnatech.se,
        sakari.ailus@linux.intel.com,
        Hans Verkuil <hans.verkuil@cisco.com>, mchehab@kernel.org,
        lkft-triage@lists.linaro.org, hverkuil-cisco@xs4all.nl
Content-Type: text/plain; charset="UTF-8"
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

v4l2-compliance test running on linux stable 4.9 reported kernel bug.
The crash is pointing to kernel module "vivid.ko" which was loaded by
test case. (  modprobe vivid.ko)

Test passes on 4.4, 4.14, 4.19 and 5.0.
steps to reproduce:

       # boot 4.9 kernel on x86_64 / Juno / hikey /  device
       #  install v4l-utils package
       # modprobe vivid.ko no_error_inj=1
       # v4l2-compliance -v -d /dev/video0
       # you will get BUG: Unable to handle kernel NULL pointer dereference

arm64 juno-r2 test output log,
----------------------------------------
INFO: Running v4l2-compliance device test...
[   48.574093] vivid-000: =================  START STATUS  =================
[   48.580866] vivid-000: Test Pattern: 75% Colorbar
...
[   48.730569] tpg RGB range: 0/2
[   48.733592] vivid-000: ==================  END STATUS  ==================
[   48.753649] BUG: Unable to handle kernel NULL pointer dereference
at virtual address 00000716
[   48.761689] pgd = ffff80094d113000
[   48.765097] [00000716] *pgd=00000009f4300003,
*pud=00000009f513c003, *pmd=0000000000000000
[   48.773666] Internal error: Oops: 96000006 [#1] PREEMPT SMP
[   48.779186] Modules linked in: vivid videobuf2_vmalloc
videobuf2_memops v4l2_tpg videobuf2_v4l2 videobuf2_core fuse
[   48.789574] CPU: 5 PID: 2278 Comm: v4l2-compliance Not tainted 4.9.169-rc1 #1
[   48.796637] Hardware name: ARM Juno development board (r2) (DT)
[   48.802496] task: ffff8009741e5800 task.stack: ffff80096ec9c000
[   48.808405] PC is at vidioc_g_edid+0xb8/0x150 [vivid]
[   48.813445] LR is at vidioc_g_edid+0xb4/0x150 [vivid]
[   48.818444] pc : [<ffff000000bffc80>] lr : [<ffff000000bffc7c>]
pstate: 40000145
[   48.825764] sp : ffff80096ec9fbc0
[   48.829043] x29: ffff80096ec9fbc0 x28: 0000000000000000
[   48.834311] x27: ffff800972fd0590 x26: 0000000000000028
[   48.839580] x25: 0000000000000000 x24: ffff000009289eb0
[   48.844849] x23: ffff80096ec9fd10 x22: ffff80096ec9fd10
[   48.850118] x21: 0000000000000000 x20: ffff800972fd0000
[   48.855387] x19: ffff80096ec9fd10 x18: 0000ffffc63f1d4f
[   48.860656] x17: 0000ffffb0186910 x16: ffff0000082c9840
[   48.865924] x15: 000000000000000a x14: 2700000000000000
[   48.871193] x13: 0000001c0000321c x12: c000358040201cd0
[   48.876461] x11: 5180001d1a1a0000 x10: 321cc00035203040
[   48.881730] x9 : 1f3870a080361a1e x8 : 0000321cc0003520
[   48.886998] x7 : 30803e70f0a000d0 x6 : ffff800972dbdc00
[   48.892267] x5 : ffff800972ca0000 x4 : 0000000000000000
[   48.897534] x3 : 0000000000000002 x2 : ffffffffffffffc0
[   48.902803] x1 : ffff00000ba83100 x0 : ffff800972dbdb00
[   48.908069]
[   48.909543] Process v4l2-compliance (pid: 2278, stack limit =
0xffff80096ec9c020)
[   48.916951] Stack: (0xffff80096ec9fbc0 to 0xffff80096eca0000)
[   48.922642] fbc0: ffff80096ec9fbf0 ffff000008900194
00000000c0285628 ffff80097537aa80
...
...
...
[   49.272633] [<ffff000000bffc80>] vidioc_g_edid+0xb8/0x150 [vivid]
[   49.278672] [<ffff000008900194>] __video_do_ioctl+0x204/0x2f8
[   49.284362] [<ffff0000088ff990>] video_usercopy+0x230/0x7e0
[   49.289879] [<ffff0000088fff7c>] video_ioctl2+0x3c/0x50
[   49.295052] [<ffff0000088fa394>] v4l2_ioctl+0x8c/0x128
[   49.300143] [<ffff0000082c9060>] do_vfs_ioctl+0xb0/0x890
[   49.305404] [<ffff0000082c98cc>] SyS_ioctl+0x8c/0xa8
[   49.310321] [<ffff0000080841dc>] __sys_trace_return+0x0/0x4
[   49.315841] Code: 53196042 f9401260 95e37502 f9401260 (794e2ea2)
[   49.321877] ---[ end trace 2f24332f5b488208 ]---


Full test log,
https://qa-reports.linaro.org/lkft/linux-stable-rc-4.9-oe/build/v4.9.168-78-g6ecae2ce7b5a/testrun/680319/log

Linux kernel version,
Linux version 4.9.169-rc1 (oe-user@oe-host) (gcc version 7.3.0 (GCC) )
#1 SMP Tue Apr 16 18:34:31 UTC 2019

Code snippet:
long video_ioctl2(struct file *file,
      unsigned int cmd, unsigned long arg)
{
return video_usercopy(file, cmd, arg, __video_do_ioctl);
}
EXPORT_SYMBOL(video_ioctl2);


Test logs from each device,
Juno-r2: arm64
https://lkft.validation.linaro.org/scheduler/job/680319#L1389

X86_64:
https://lkft.validation.linaro.org/scheduler/job/680361#L1143

Hikey: arm64
https://lkft.validation.linaro.org/scheduler/job/680287#L1564

BeagleBoard-x15: arm32
https://lkft.validation.linaro.org/scheduler/job/680377#L1540

Best regards
Naresh Kamboju
