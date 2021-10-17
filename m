Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 013A1430AB1
	for <lists+linux-media@lfdr.de>; Sun, 17 Oct 2021 18:24:59 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1344236AbhJQQ1G (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sun, 17 Oct 2021 12:27:06 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36196 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1344217AbhJQQ1G (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Sun, 17 Oct 2021 12:27:06 -0400
Received: from mail-pj1-x102d.google.com (mail-pj1-x102d.google.com [IPv6:2607:f8b0:4864:20::102d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 584CEC06161C;
        Sun, 17 Oct 2021 09:24:56 -0700 (PDT)
Received: by mail-pj1-x102d.google.com with SMTP id oa4so10617939pjb.2;
        Sun, 17 Oct 2021 09:24:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=jAGZLpI+mWq1MhIyGaZ8+MrIr8zz341QTD21w5g9v7I=;
        b=k7lHEWNelHHScIxzx2DAsM06/oTYFECwlRLQ9YEvKG0dGVeoKLI+LbO1BYaIoMy0gd
         AzGxKWPMFM/rXRXI7byNQq8jtjBnGb1ae6FHc/IME+PTAUIB5NvkptP9hFJMdepKRSkA
         mX7abZELYwBk67jEpS5DsSQaayvlOp3cM78u4EHQRhuBgRMI2adV8lZWjUkCg59pmfFC
         vVytPEP21TtmXwFhTnjqvDrtfGcRVsnFdswhIg9OVPNIZCxOy/aWEx8HbQQVs90i99o1
         aTeLsikkFViHqJcJ6J1iXVx4z7d1R9n1zpaSTHHYm8IRjVWkQITYJ9W4iB3LDTeIJPT/
         lIVg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=jAGZLpI+mWq1MhIyGaZ8+MrIr8zz341QTD21w5g9v7I=;
        b=10XZB3JVG3Q8IJDURy/PyZ+3FIkCZTZ+SMF39IESKByG9wFloenD7pBuYU9+BH3W25
         jGLyPPC4eS8gpLldx7+2NhqAE7mAHjK+Zrl/2bDaJfFC3Pmdd2LazkKynHDNdUsHLgPL
         7wZUU74+vt/B3XKYwmJQWLrIt1aVTR8j0NGmw3c7lBh+sI2lgdr2bKI+hbresNjOEZkx
         VxRLzApFYI+dyUWKfQK9Q/w8xdbxf/Q9sUTv45am/dQAPLR9F7HGGq95sXd//GMiePTN
         5qBEU8mIF7DfjI00fcJFzre3UYnIx71kedDmIKGJn1J0Gb8/CXmCPVQDhFekbZMhBagX
         FR0w==
X-Gm-Message-State: AOAM531BTW4f16Hmae8k0IbVmnxt1z95e8pM0P1r0m5xxYuLCTs7FSBf
        H53foexG5vKCNXOJZxhEOFE=
X-Google-Smtp-Source: ABdhPJw3x0qwawUL0DC06W1UbWd0MFLYZXGmurbzqsfsx+52YkFIX68On7k/avBx+jbC9Ogq42tlbA==
X-Received: by 2002:a17:902:c402:b0:13f:1c07:5a25 with SMTP id k2-20020a170902c40200b0013f1c075a25mr22034609plk.38.1634487895777;
        Sun, 17 Oct 2021 09:24:55 -0700 (PDT)
Received: from sbwpb-arch.flets-east.jp ([2400:4052:6980:3800:dba7:2b1f:3f26:a5ec])
        by smtp.gmail.com with ESMTPSA id f30sm10814332pfq.142.2021.10.17.09.24.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 17 Oct 2021 09:24:55 -0700 (PDT)
From:   Tsuchiya Yuto <kitakar@gmail.com>
Cc:     Hans de Goede <hdegoede@redhat.com>,
        Patrik Gfeller <patrik.gfeller@gmail.com>,
        Tsuchiya Yuto <kitakar@gmail.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Peter Zijlstra <peterz@infradead.org>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Kaixu Xia <kaixuxia@tencent.com>,
        Arnd Bergmann <arnd@arndb.de>,
        Dan Carpenter <dan.carpenter@oracle.com>,
        linux-media@vger.kernel.org, linux-staging@lists.linux.dev,
        linux-kernel@vger.kernel.org
Subject: [BUG 4/5] [BUG] media: atomisp: `modprobe -r` not working well (dup video4linux, ATOMISP_SUBDEV_{0,1})
Date:   Mon, 18 Oct 2021 01:23:35 +0900
Message-Id: <20211017162337.44860-5-kitakar@gmail.com>
X-Mailer: git-send-email 2.33.1
In-Reply-To: <20211017162337.44860-1-kitakar@gmail.com>
References: <20211017162337.44860-1-kitakar@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
To:     unlisted-recipients:; (no To-header on input)
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

This is just a BUG report and I don't have any patch for this issue.
For now, I use rmmod/insmod to reload atomisp modules.

When I use `modprobe -r` to unload atomisp drivers like the following,

        $ sudo modprobe -r atomisp
        $ sudo modprobe -r atomisp-ar0330
        $ sudo modprobe -r atomisp-ov883x

it will fail to initialize on next load (with both modprobe and insmod).

Steps to reproduce:

  1. boot without denylisting any atomisp modules (or load modules using
     modprobe manually)
  2. unload drivers with `modprobe -r`
  3. try to load drivers (modprobe or insmod)
  4. probe fails saying "duplicate filename [...] video4linux"
     (log available below)

Note:

  1. `modprobe -r` works when booting with denylisting then insmod-ing
  2. rmmod always works without errors

Here is the dmesg log:

        kern  :warn  : [  150.326240] sysfs: cannot create duplicate filename '/devices/pci0000:00/0000:00:03.0/video4linux'
        kern  :warn  : [  150.326246] CPU: 1 PID: 2739 Comm: modprobe Tainted: G         C OE     5.15.0-rc3-1-surface-mainline #1 22942c127770b6216143942411a0f5916a743a60
        kern  :warn  : [  150.326257] Hardware name: OEMB OEMB/OEMB, BIOS 1.51116.238 03/09/2015
        kern  :warn  : [  150.326262] Call Trace:
        kern  :warn  : [  150.326276]  dump_stack_lvl+0x46/0x5a
        kern  :warn  : [  150.326292]  sysfs_warn_dup.cold+0x17/0x24
        kern  :warn  : [  150.326304]  sysfs_create_dir_ns+0xcc/0xe0
        kern  :warn  : [  150.326318]  kobject_add_internal+0xbd/0x2b0
        kern  :warn  : [  150.326330]  kobject_add+0x98/0xd0
        kern  :warn  : [  150.326338]  ? kmem_cache_alloc_trace+0x15c/0x2f0
        kern  :warn  : [  150.326352]  get_device_parent+0x15e/0x1c0
        kern  :warn  : [  150.326365]  device_add+0xd9/0x9a0
        kern  :warn  : [  150.326375]  __video_register_device+0x8ee/0x11f0 [videodev 2ea57a870000384ef8d27d4d70e6e51a68e3f718]
        kern  :warn  : [  150.326420]  atomisp_subdev_register_entities+0x83/0x220 [atomisp 752573cebc128314ca99d40a85c7801ade7015b0]
        kern  :warn  : [  150.326528]  atomisp_pci_probe.cold+0xec3/0x1492 [atomisp 752573cebc128314ca99d40a85c7801ade7015b0]
        kern  :warn  : [  150.326625]  local_pci_probe+0x45/0x80
        kern  :warn  : [  150.326634]  ? pci_match_device+0xd7/0x130
        kern  :warn  : [  150.326640]  pci_device_probe+0xfa/0x1b0
        kern  :warn  : [  150.326650]  really_probe+0x1f5/0x3f0
        kern  :warn  : [  150.326661]  __driver_probe_device+0xfe/0x180
        kern  :warn  : [  150.326667]  driver_probe_device+0x1e/0x90
        kern  :warn  : [  150.326674]  __driver_attach+0xc0/0x1c0
        kern  :warn  : [  150.326680]  ? __device_attach_driver+0xe0/0xe0
        kern  :warn  : [  150.326685]  ? __device_attach_driver+0xe0/0xe0
        kern  :warn  : [  150.326691]  bus_for_each_dev+0x89/0xd0
        kern  :warn  : [  150.326698]  bus_add_driver+0x12b/0x1e0
        kern  :warn  : [  150.326704]  driver_register+0x8f/0xe0
        kern  :warn  : [  150.326712]  ? 0xffffffffc09e6000
        kern  :warn  : [  150.326717]  do_one_initcall+0x57/0x220
        kern  :warn  : [  150.326733]  do_init_module+0x5c/0x260
        kern  :warn  : [  150.326745]  load_module+0x24bd/0x26a0
        kern  :warn  : [  150.326760]  ? __do_sys_finit_module+0xae/0x110
        kern  :warn  : [  150.326766]  __do_sys_finit_module+0xae/0x110
        kern  :warn  : [  150.326777]  do_syscall_64+0x5c/0x80
        kern  :warn  : [  150.326789]  ? __audit_syscall_exit+0x24d/0x2a0
        kern  :warn  : [  150.326796]  ? syscall_exit_to_user_mode+0x23/0x40
        kern  :warn  : [  150.326804]  ? do_syscall_64+0x69/0x80
        kern  :warn  : [  150.326810]  ? do_syscall_64+0x69/0x80
        kern  :warn  : [  150.326816]  entry_SYSCALL_64_after_hwframe+0x44/0xae
        kern  :warn  : [  150.326824] RIP: 0033:0x7f33b9de918d
        kern  :warn  : [  150.326832] Code: b4 0c 00 0f 05 eb a9 66 0f 1f 44 00 00 f3 0f 1e fa 48 89 f8 48 89 f7 48 89 d6 48 89 ca 4d 89 c2 4d 89 c8 4c 8b 4c 24 08 0f 05 <48> 3d 01 f0 ff ff 73 01 c3 48 8b 0d b3 6c 0c 00 f7 d8 64 89 01 48
        kern  :warn  : [  150.326836] RSP: 002b:00007fffce4b44a8 EFLAGS: 00000246 ORIG_RAX: 0000000000000139
        kern  :warn  : [  150.326846] RAX: ffffffffffffffda RBX: 00005643ae549e10 RCX: 00007f33b9de918d
        kern  :warn  : [  150.326851] RDX: 0000000000000000 RSI: 00005643acc65270 RDI: 0000000000000005
        kern  :warn  : [  150.326854] RBP: 0000000000040000 R08: 0000000000000000 R09: 00005643ae549f20
        kern  :warn  : [  150.326858] R10: 0000000000000005 R11: 0000000000000246 R12: 00005643acc65270
        kern  :warn  : [  150.326861] R13: 0000000000000000 R14: 00005643ae549cc0 R15: 00005643ae549e10
        kern  :err   : [  150.326871] kobject_add_internal failed for video4linux with -EEXIST, don't try to register things with the same name in the same directory.
        kern  :err   : [  150.326878] videodev: __video_register_device: device_register failed
        kern  :err   : [  150.326903] atomisp-isp2 0000:00:03.0: atomisp_subdev_register_entities fail
        kern  :err   : [  150.326918] atomisp-isp2 0000:00:03.0: atomisp_register_entities failed (-17)
        kern  :warn  : [  150.328150] atomisp-isp2: probe of 0000:00:03.0 failed with error -17

Later, I found that after unloading atomisp module (by both
rmmod and `modprobe -r`), ATOMISP_SUBDEV_0 and ATOMISP_SUBDEV_1 were left
under /sys/class/video4linux directory:

        # list v4l device names
        $ grep . /sys/class/video4linux/*/name
        /sys/class/video4linux/v4l-subdev7/name:ATOMISP_SUBDEV_0
        /sys/class/video4linux/v4l-subdev8/name:ATOMISP_SUBDEV_1

These files will be added every time I reload atomisp module using
rmmod/insmod:

        /sys/class/video4linux/v4l-subdev7/name:ATOMISP_SUBDEV_0
        /sys/class/video4linux/v4l-subdev8/name:ATOMISP_SUBDEV_1
        /sys/class/video4linux/v4l-subdev9/name:ATOMISP_SUBDEV_0
        /sys/class/video4linux/v4l-subdev10/name:ATOMISP_SUBDEV_1

Note 1:
  Somehow I can't reproduce this issue on Android kernel (using
  Mi Pad 2) and my port of intel-aero atomisp [1].

[1] https://github.com/kitakar5525/linux-kernel/tree/mainline+aero_atomisp_wo_kapi_changes-2021-10-11

Note 2:
  Here is the complete reload script (using rmmod/insmod) I use on
  Surface 3:

	# reload atomisp camera modules
	# somehow `modprobe -r` does not work well
	sudo rmmod atomisp
	sudo rmmod atomisp-ar0330
	sudo rmmod atomisp-ov883x
	sudo rmmod atomisp_gmin_platform

	# load drivers needed for atomisp first for insmod
	# for sensor drivers
	sudo modprobe media # needed for older LTS
	sudo modprobe videodev
	sudo modprobe v4l2_common # needed for older LTS
	sudo modprobe v4l2_async # if using async_register
	# for atomisp pci driver
	sudo modprobe videobuf-core
	sudo modprobe videobuf-vmalloc

	# insmod upstreamed atomisp
	sudo insmod upst/atomisp_gmin_platform.ko
	sudo insmod upst/surface3/atomisp-ar0330.ko
	sudo insmod upst/surface3/atomisp-ov883x.ko
	sudo insmod upst/atomisp.ko dbg_level=1 #dyndbg
-- 
2.33.1

