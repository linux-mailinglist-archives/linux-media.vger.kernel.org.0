Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id AF061F144
	for <lists+linux-media@lfdr.de>; Tue, 30 Apr 2019 09:28:32 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726012AbfD3H2b (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 30 Apr 2019 03:28:31 -0400
Received: from lb3-smtp-cloud9.xs4all.net ([194.109.24.30]:54925 "EHLO
        lb3-smtp-cloud9.xs4all.net" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1725906AbfD3H2b (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 30 Apr 2019 03:28:31 -0400
Received: from [192.168.2.10] ([46.9.232.72])
        by smtp-cloud9.xs4all.net with ESMTPA
        id LNBfhiXQLNExlLNBihg6L5; Tue, 30 Apr 2019 09:28:28 +0200
Subject: Re: vidioc_g_edid: BUG: Unable to handle kernel NULL pointer
 dereference at virtual address 00000716
To:     Naresh Kamboju <naresh.kamboju@linaro.org>,
        open list <linux-kernel@vger.kernel.org>,
        linux-media@vger.kernel.org
Cc:     samitolvanen@google.com, paul.kocialkowski@bootlin.com,
        ezequiel@collabora.com, treding@nvidia.com,
        niklas.soderlund+renesas@ragnatech.se,
        sakari.ailus@linux.intel.com,
        Hans Verkuil <hans.verkuil@cisco.com>, mchehab@kernel.org,
        lkft-triage@lists.linaro.org
References: <CA+G9fYuZhS+QfgM0HrNm4B8Yb+0kwScxaURJDYXKPY-ML_L0cQ@mail.gmail.com>
From:   Hans Verkuil <hverkuil-cisco@xs4all.nl>
Message-ID: <35ebc45a-5894-e2ab-3a97-2ce3f7efda44@xs4all.nl>
Date:   Tue, 30 Apr 2019 09:28:23 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.4.0
MIME-Version: 1.0
In-Reply-To: <CA+G9fYuZhS+QfgM0HrNm4B8Yb+0kwScxaURJDYXKPY-ML_L0cQ@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-CMAE-Envelope: MS4wfNcaqkc+M5ISByQuxrsmDIIoiFR5tHgVJM3vxMNh5gDKvc1kKh24BCS0XZIBa12jxfAbQLfRxjDW1yiojiCegam3vO2avyYAcEZn8JVKwaZR1ZQkjLyt
 ImxL4/U6xg1mm6fkb/iJdqFFVWf5ubri/ZW+hWM697t/TpaWmzPZF5nhl+322415Daeef710VYKoc8frfm2WTJrcuVD7P09bSMas5BntZrL6PaiBHB9CiMUW
 DlpCZHTONQsWmnsrrpGDGA9GwCrxtV0Kj2E8sgJWIV84AwHo3Yss1rrbwwT6FFD+e8zvCOCffAtcJ+QdseNJ6x81p4xEWRCkCzFiQRgvXiKK7agy0Kw7OcQh
 uHqxZUx9uwhPh+QoJXf6BwPe7jQL9jtUE5BmyTrxrziUrL7qFGxY6AOAWaSsV5dJtG/igAZ7uj5ioy4D+wCTtPjzUN4mwQKNoS4MQG+IbmVB+y7RJva2zdll
 f2dMaqDYCgakBKItdLuSJmF5t7xkqdVdzPV34ux9ml09yYDYvJnnc/IP8rf7KcApw0u8881yuUtvJ39niigplSsyPomLJ2SNRjlNNRDjLTO2l0jbeHWJO5CW
 sDjyLKYFpbb1HELhmrbfrj49
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On 4/30/19 9:10 AM, Naresh Kamboju wrote:
> v4l2-compliance test running on linux stable 4.9 reported kernel bug.
> The crash is pointing to kernel module "vivid.ko" which was loaded by
> test case. (  modprobe vivid.ko)
> 
> Test passes on 4.4, 4.14, 4.19 and 5.0.
> steps to reproduce:
> 
>        # boot 4.9 kernel on x86_64 / Juno / hikey /  device
>        #  install v4l-utils package
>        # modprobe vivid.ko no_error_inj=1
>        # v4l2-compliance -v -d /dev/video0
>        # you will get BUG: Unable to handle kernel NULL pointer dereference
> 
> arm64 juno-r2 test output log,
> ----------------------------------------
> INFO: Running v4l2-compliance device test...
> [   48.574093] vivid-000: =================  START STATUS  =================
> [   48.580866] vivid-000: Test Pattern: 75% Colorbar
> ...
> [   48.730569] tpg RGB range: 0/2
> [   48.733592] vivid-000: ==================  END STATUS  ==================
> [   48.753649] BUG: Unable to handle kernel NULL pointer dereference
> at virtual address 00000716
> [   48.761689] pgd = ffff80094d113000
> [   48.765097] [00000716] *pgd=00000009f4300003,
> *pud=00000009f513c003, *pmd=0000000000000000
> [   48.773666] Internal error: Oops: 96000006 [#1] PREEMPT SMP
> [   48.779186] Modules linked in: vivid videobuf2_vmalloc
> videobuf2_memops v4l2_tpg videobuf2_v4l2 videobuf2_core fuse
> [   48.789574] CPU: 5 PID: 2278 Comm: v4l2-compliance Not tainted 4.9.169-rc1 #1
> [   48.796637] Hardware name: ARM Juno development board (r2) (DT)
> [   48.802496] task: ffff8009741e5800 task.stack: ffff80096ec9c000
> [   48.808405] PC is at vidioc_g_edid+0xb8/0x150 [vivid]
> [   48.813445] LR is at vidioc_g_edid+0xb4/0x150 [vivid]
> [   48.818444] pc : [<ffff000000bffc80>] lr : [<ffff000000bffc7c>]
> pstate: 40000145
> [   48.825764] sp : ffff80096ec9fbc0
> [   48.829043] x29: ffff80096ec9fbc0 x28: 0000000000000000
> [   48.834311] x27: ffff800972fd0590 x26: 0000000000000028
> [   48.839580] x25: 0000000000000000 x24: ffff000009289eb0
> [   48.844849] x23: ffff80096ec9fd10 x22: ffff80096ec9fd10
> [   48.850118] x21: 0000000000000000 x20: ffff800972fd0000
> [   48.855387] x19: ffff80096ec9fd10 x18: 0000ffffc63f1d4f
> [   48.860656] x17: 0000ffffb0186910 x16: ffff0000082c9840
> [   48.865924] x15: 000000000000000a x14: 2700000000000000
> [   48.871193] x13: 0000001c0000321c x12: c000358040201cd0
> [   48.876461] x11: 5180001d1a1a0000 x10: 321cc00035203040
> [   48.881730] x9 : 1f3870a080361a1e x8 : 0000321cc0003520
> [   48.886998] x7 : 30803e70f0a000d0 x6 : ffff800972dbdc00
> [   48.892267] x5 : ffff800972ca0000 x4 : 0000000000000000
> [   48.897534] x3 : 0000000000000002 x2 : ffffffffffffffc0
> [   48.902803] x1 : ffff00000ba83100 x0 : ffff800972dbdb00
> [   48.908069]
> [   48.909543] Process v4l2-compliance (pid: 2278, stack limit =
> 0xffff80096ec9c020)
> [   48.916951] Stack: (0xffff80096ec9fbc0 to 0xffff80096eca0000)
> [   48.922642] fbc0: ffff80096ec9fbf0 ffff000008900194
> 00000000c0285628 ffff80097537aa80
> ...
> ...
> ...
> [   49.272633] [<ffff000000bffc80>] vidioc_g_edid+0xb8/0x150 [vivid]
> [   49.278672] [<ffff000008900194>] __video_do_ioctl+0x204/0x2f8
> [   49.284362] [<ffff0000088ff990>] video_usercopy+0x230/0x7e0
> [   49.289879] [<ffff0000088fff7c>] video_ioctl2+0x3c/0x50
> [   49.295052] [<ffff0000088fa394>] v4l2_ioctl+0x8c/0x128
> [   49.300143] [<ffff0000082c9060>] do_vfs_ioctl+0xb0/0x890
> [   49.305404] [<ffff0000082c98cc>] SyS_ioctl+0x8c/0xa8
> [   49.310321] [<ffff0000080841dc>] __sys_trace_return+0x0/0x4
> [   49.315841] Code: 53196042 f9401260 95e37502 f9401260 (794e2ea2)
> [   49.321877] ---[ end trace 2f24332f5b488208 ]---
> 
> 
> Full test log,
> https://qa-reports.linaro.org/lkft/linux-stable-rc-4.9-oe/build/v4.9.168-78-g6ecae2ce7b5a/testrun/680319/log
> 
> Linux kernel version,
> Linux version 4.9.169-rc1 (oe-user@oe-host) (gcc version 7.3.0 (GCC) )
> #1 SMP Tue Apr 16 18:34:31 UTC 2019
> 
> Code snippet:
> long video_ioctl2(struct file *file,
>       unsigned int cmd, unsigned long arg)
> {
> return video_usercopy(file, cmd, arg, __video_do_ioctl);
> }
> EXPORT_SYMBOL(video_ioctl2);
> 
> 
> Test logs from each device,
> Juno-r2: arm64
> https://lkft.validation.linaro.org/scheduler/job/680319#L1389
> 
> X86_64:
> https://lkft.validation.linaro.org/scheduler/job/680361#L1143
> 
> Hikey: arm64
> https://lkft.validation.linaro.org/scheduler/job/680287#L1564
> 
> BeagleBoard-x15: arm32
> https://lkft.validation.linaro.org/scheduler/job/680377#L1540
> 
> Best regards
> Naresh Kamboju
> 

It's a CEC related bug, this vivid patch should fix it. It's a backport of
commit ed356f110403 ("media: vivid: check if the cec_adapter is valid"). This
commit was only backported to 4.12 and up since it didn't apply to older kernels.

Feel free to post this patch (after testing!) to the stable mailinglist for
inclusion into 4.9.

Regards,

	Hans

Signed-off-by: Hans Verkuil <hverkuil-cisco@xs4all.nl>
---
--- a/drivers/media/platform/vivid/vivid-vid-common.c	2019-04-30 09:23:37.296797292 +0200
+++ b/drivers/media/platform/vivid/vivid-vid-common.c	2019-04-30 09:24:09.581261759 +0200
@@ -841,6 +841,7 @@
 	if (edid->start_block + edid->blocks > dev->edid_blocks)
 		edid->blocks = dev->edid_blocks - edid->start_block;
 	memcpy(edid->edid, dev->edid, edid->blocks * 128);
-	cec_set_edid_phys_addr(edid->edid, edid->blocks * 128, adap->phys_addr);
+	if (adap)
+		cec_set_edid_phys_addr(edid->edid, edid->blocks * 128, adap->phys_addr);
 	return 0;
 }
