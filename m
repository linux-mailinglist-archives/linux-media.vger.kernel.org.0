Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 1BE3124EFB6
	for <lists+linux-media@lfdr.de>; Sun, 23 Aug 2020 22:43:11 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726788AbgHWUnJ (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sun, 23 Aug 2020 16:43:09 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37624 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726483AbgHWUnH (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Sun, 23 Aug 2020 16:43:07 -0400
Received: from mail-ej1-x644.google.com (mail-ej1-x644.google.com [IPv6:2a00:1450:4864:20::644])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E68D7C061573
        for <linux-media@vger.kernel.org>; Sun, 23 Aug 2020 13:43:06 -0700 (PDT)
Received: by mail-ej1-x644.google.com with SMTP id u21so8656388ejz.0
        for <linux-media@vger.kernel.org>; Sun, 23 Aug 2020 13:43:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:from:date:message-id:subject:to;
        bh=UzkpbCxYWsYtII7jXEOX2bSiX8VJJPnH5eIK54j2e2E=;
        b=AdPOBvIDurSbvh3Cdy9M2IKQGD6vUE/pujI5e5BEpqJUztqfyoI6dd794gHMJ9ggUt
         sNflk3ZZ7mbR+kxAuMRpzSIU8gHthB5QwvSoj+q5ko7CCO7kRnIZHuJEa6dI94Z2SefV
         wpG4yhTpz5lS/X8j6AtLfp9oxdTNjFcwAqzUZuC7gML17nEF/QgfYxvPCoO57VQbGtyp
         4adLLApfEpHvCpI6O838bNaOKhAN5rSQPnVidtJ0qVUd+fRcs40Jci3OAtI3C+6qytp0
         GkVgyOhWM3HLDqyWFZZ5gq1ZWSs3H1lBh3vpCdCZYPyN3qhN3+4VBEcGxrWTVRevXKrN
         f2vQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:from:date:message-id:subject:to;
        bh=UzkpbCxYWsYtII7jXEOX2bSiX8VJJPnH5eIK54j2e2E=;
        b=XMTDICr46J37I84/XTvpk4Fje6RECeXL98rUWRAgGO+chDcfOg2Dntzqi/GMObXXNb
         RwpnbeZej8lTxyRGRzoXh4CQwnbhSqmbCKOzMmTTAdjOm2i9v4yIhz+6CyP+RoAdzss1
         ZqR3xP/GgSWsecBFneuEcfrXT6IHdRVTqve1/AAzvf241jn5ugZWXYrjlqjOKApfTrdZ
         eUT/7jJxN+MeuuZ3HCIsZfbU6GF9uab4m7rWr4RjdkcSRg3pw7ILNrZwpu3epwMtlkSB
         UtDnCmPFp6IiS+DSxZlFWO7qdDpqet8t33Dp80RwhvpE4xO7/FojQCn9Y/E4sMQBzCjm
         u+HQ==
X-Gm-Message-State: AOAM530V8QQ67L/t7b3vNnZFDSp5qMIX1sTpFqjOZ7nJrEGeDTlFClp5
        wAOjLTr9bh7n2Aaq50DK3keNRUqfp8du4/n7w1yvxiVPf/egBw==
X-Google-Smtp-Source: ABdhPJwAG6XWt7wmf8zRpqbFo152bm9aGeMzpF3s5QQLfA/d6V7PSvflh8srUN9QtIq3uskMdgX3aaFquWPF3JKYwuo=
X-Received: by 2002:a17:906:fa0a:: with SMTP id lo10mr2713520ejb.172.1598215385056;
 Sun, 23 Aug 2020 13:43:05 -0700 (PDT)
MIME-Version: 1.0
From:   Vincent Fortier <th0ma7@gmail.com>
Date:   Sun, 23 Aug 2020 16:42:54 -0400
Message-ID: <CALAySuL==xc7W+_m=z_Y9VbnmXffAgdzUZxWyfKZDgFtGPJUng@mail.gmail.com>
Subject: 4.4.59 backport issue - build system for media drivers
To:     linux-media@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi all,

Not sure if I am at the right place to ask but I have issues using the
experimental build system for media drivers on a 4.4.59 kernel for
Synology NAS (DSM-6.2+ with associate toolchain). Note that it used to
work really well around a year ago but somehow it stopped since.

Synology's kernel source used is here:
https://sourceforge.net/projects/dsgpl/files/Synology%20NAS%20GPL%20Source/24922branch/apollolake-source/linux-4.4.x.txz/download

It fails to build on CONFIG_VIDEOBUF2_MEMOPS and
CONFIG_VIDEOBUF_DMA_SG modules, essential for me to get going.

Thnx a lot in advance!

- vin

---
Automatically applied patches:
Applying patches for kernel 4.4.59
patch -s -f -N -p1 -i ../backports/api_version.patch
patch -s -f -N -p1 -i ../backports/pr_fmt.patch
patch -s -f -N -p1 -i ../backports/debug.patch
patch -s -f -N -p1 -i ../backports/drx39xxj.patch
patch -s -f -N -p1 -i ../backports/v5.7_mmap_read_lock.patch
patch -s -f -N -p1 -i ../backports/v5.7_vm_map_ram.patch
patch -s -f -N -p1 -i ../backports/v5.7_pin_user_pages.patch
patch -s -f -N -p1 -i ../backports/v5.6_pin_user_pages.patch
patch -s -f -N -p1 -i ../backports/v5.6_const_fb_ops.patch
patch -s -f -N -p1 -i ../backports/v5.6_pm_runtime_get_if_active.patch
patch -s -f -N -p1 -i ../backports/v5.5_alsa_pcm_api_updates.patch
patch -s -f -N -p1 -i ../backports/v5.5_memtype_h.patch
patch -s -f -N -p1 -i ../backports/v5.4_revert_spi_transfer.patch
patch -s -f -N -p1 -i ../backports/v5.1_vm_map_pages.patch
patch -s -f -N -p1 -i ../backports/v5.1_devm_i2c_new_dummy_device.patch
patch -s -f -N -p1 -i ../backports/v5.0_ipu3-cio2.patch
patch -s -f -N -p1 -i ../backports/v5.0_time32.patch
patch -s -f -N -p1 -i ../backports/v4.20_access_ok.patch
patch -s -f -N -p1 -i ../backports/v4.18_fwnode_args_args.patch
patch -s -f -N -p1 -i ../backports/v4.18_smiapp_bitops.patch
patch -s -f -N -p1 -i ../backports/v4.17_i2c_check_num_msgs.patch
patch -s -f -N -p1 -i ../backports/v4.15_pmdown_time.patch
patch -s -f -N -p1 -i ../backports/v4.14_saa7146_timer_cast.patch
patch -s -f -N -p1 -i ../backports/v4.14_module_param_call.patch
patch -s -f -N -p1 -i ../backports/v4.14_fwnode_handle_get.patch
patch -s -f -N -p1 -i ../backports/v4.13_remove_nospec_h.patch
patch -s -f -N -p1 -i ../backports/v4.13_drmP.patch
patch -s -f -N -p1 -i ../backports/v4.13_fwnode_graph_get_port_parent.patch
patch -s -f -N -p1 -i ../backports/v4.12_revert_solo6x10_copykerneluser.patch
patch -s -f -N -p1 -i ../backports/v4.11_drop_drm_file.patch
patch -s -f -N -p1 -i ../backports/v4.10_sched_signal.patch
patch -s -f -N -p1 -i ../backports/v4.10_fault_page.patch
patch -s -f -N -p1 -i ../backports/v4.10_refcount.patch
patch -s -f -N -p1 -i ../backports/v4.9_mm_address.patch
patch -s -f -N -p1 -i ../backports/v4.9_dvb_net_max_mtu.patch
patch -s -f -N -p1 -i ../backports/v4.9_probe_new.patch
patch -s -f -N -p1 -i ../backports/v4.8_user_pages_flag.patch
patch -s -f -N -p1 -i ../backports/v4.8_em28xx_bitfield.patch
patch -s -f -N -p1 -i ../backports/v4.8_dma_map_resource.patch
patch -s -f -N -p1 -i ../backports/v4.8_drm_crtc.patch
patch -s -f -N -p1 -i ../backports/v4.7_dma_attrs.patch
patch -s -f -N -p1 -i ../backports/v4.7_pci_alloc_irq_vectors.patch
patch -s -f -N -p1 -i ../backports/v4.7_copy_to_user_warning.patch
patch -s -f -N -p1 -i ../backports/v4.7_objtool_warning.patch
patch -s -f -N -p1 -i ../backports/v4.6_i2c_mux.patch
patch -s -f -N -p1 -i ../backports/v4.5_gpiochip_data_pointer.patch
patch -s -f -N -p1 -i ../backports/v4.5_get_user_pages.patch
patch -s -f -N -p1 -i ../backports/v4.5_uvc_super_plus.patch
patch -s -f -N -p1 -i ../backports/v4.5_copy_to_user_warning.patch
patch -s -f -N -p1 -i ../backports/v4.4_gpio_chip_parent.patch
patch -s -f -N -p1 -i ../backports/v4.4_user_pages_flag.patch
Patched drivers/media/dvb-core/dvbdev.c
Patched drivers/media/v4l2-core/v4l2-dev.c
Patched drivers/media/rc/rc-main.c


BUILD ERRORS
=============
Errors for CONFIG_VIDEOBUF2_MEMOPS are:
LD [M]  /home/spksrc/git-linuxtv/spksrc/spk/linuxtv/work-apollolake-6.2.2/linuxtv-gitea2766f182b3a4e03543be2ded0845fca4d4fa80/v4l/smsmdtv.o
  CC [M]  /home/spksrc/git-linuxtv/spksrc/spk/linuxtv/work-apollolake-6.2.2/linuxtv-gitea2766f182b3a4e03543be2ded0845fca4d4fa80/v4l/smsdvb-main.o
  LD [M]  /home/spksrc/git-linuxtv/spksrc/spk/linuxtv/work-apollolake-6.2.2/linuxtv-gitea2766f182b3a4e03543be2ded0845fca4d4fa80/v4l/smsdvb.o
  CC [M]  /home/spksrc/git-linuxtv/spksrc/spk/linuxtv/work-apollolake-6.2.2/linuxtv-gitea2766f182b3a4e03543be2ded0845fca4d4fa80/v4l/v4l2-tpg-core.o
  CC [M]  /home/spksrc/git-linuxtv/spksrc/spk/linuxtv/work-apollolake-6.2.2/linuxtv-gitea2766f182b3a4e03543be2ded0845fca4d4fa80/v4l/v4l2-tpg-colors.o
  LD [M]  /home/spksrc/git-linuxtv/spksrc/spk/linuxtv/work-apollolake-6.2.2/linuxtv-gitea2766f182b3a4e03543be2ded0845fca4d4fa80/v4l/v4l2-tpg.o
  CC [M]  /home/spksrc/git-linuxtv/spksrc/spk/linuxtv/work-apollolake-6.2.2/linuxtv-gitea2766f182b3a4e03543be2ded0845fca4d4fa80/v4l/videobuf2-core.o
  LD [M]  /home/spksrc/git-linuxtv/spksrc/spk/linuxtv/work-apollolake-6.2.2/linuxtv-gitea2766f182b3a4e03543be2ded0845fca4d4fa80/v4l/videobuf2-common.o
  CC [M]  /home/spksrc/git-linuxtv/spksrc/spk/linuxtv/work-apollolake-6.2.2/linuxtv-gitea2766f182b3a4e03543be2ded0845fca4d4fa80/v4l/videobuf2-v4l2.o
/home/spksrc/git-linuxtv/spksrc/spk/linuxtv/work-apollolake-6.2.2/linuxtv-gitea2766f182b3a4e03543be2ded0845fca4d4fa80/v4l/videobuf2-v4l2.c:
In function 'vb2_queue_init_name':
/home/spksrc/git-linuxtv/spksrc/spk/linuxtv/work-apollolake-6.2.2/linuxtv-gitea2766f182b3a4e03543be2ded0845fca4d4fa80/v4l/videobuf2-v4l2.c:939:3:
warning: ignoring return value of 'strscpy', declared with attribute
warn_unused_result [-Wunused-result]
   strscpy(q->name, name, sizeof(q->name));
   ^
/home/spksrc/git-linuxtv/spksrc/spk/linuxtv/work-apollolake-6.2.2/linuxtv-gitea2766f182b3a4e03543be2ded0845fca4d4fa80/v4l/videobuf2-v4l2.c:
At top level:
cc1: warning: unrecognized command line option "-Wno-format-truncation"
  CC [M]  /home/spksrc/git-linuxtv/spksrc/spk/linuxtv/work-apollolake-6.2.2/linuxtv-gitea2766f182b3a4e03543be2ded0845fca4d4fa80/v4l/videobuf2-memops.o
/home/spksrc/git-linuxtv/spksrc/spk/linuxtv/work-apollolake-6.2.2/linuxtv-gitea2766f182b3a4e03543be2ded0845fca4d4fa80/v4l/videobuf2-memops.c:
In function 'vb2_create_framevec':
/home/spksrc/git-linuxtv/spksrc/spk/linuxtv/work-apollolake-6.2.2/linuxtv-gitea2766f182b3a4e03543be2ded0845fca4d4fa80/v4l/videobuf2-memops.c:51:8:
error: too few arguments to function 'get_vaddr_frames'
  ret = get_vaddr_frames(start & PAGE_MASK, nr, flags, vec);
        ^
In file included from include/linux/scatterlist.h:7:0,
                 from include/linux/dma-mapping.h:10,
                 from include/linux/skbuff.h:34,
                 from include/linux/if_ether.h:23,
                 from
/home/spksrc/git-linuxtv/spksrc/spk/linuxtv/work-apollolake-6.2.2/linuxtv-gitea2766f182b3a4e03543be2ded0845fca4d4fa80/v4l/compat.h:1735,
                 from <command-line>:0:
include/linux/mm.h:969:5: note: declared here
 int get_vaddr_frames(unsigned long start, unsigned int nr_pfns,
     ^
/home/spksrc/git-linuxtv/spksrc/spk/linuxtv/work-apollolake-6.2.2/linuxtv-gitea2766f182b3a4e03543be2ded0845fca4d4fa80/v4l/videobuf2-memops.c:
At top level:
cc1: warning: unrecognized command line option "-Wno-format-truncation"
make[6]: *** [scripts/Makefile.build:276:
/home/spksrc/git-linuxtv/spksrc/spk/linuxtv/work-apollolake-6.2.2/linuxtv-gitea2766f182b3a4e03543be2ded0845fca4d4fa80/v4l/videobuf2-memops.o]
Error 1
make[5]: *** [Makefile:1411:
_module_/home/spksrc/git-linuxtv/spksrc/spk/linuxtv/work-apollolake-6.2.2/linuxtv-gitea2766f182b3a4e03543be2ded0845fca4d4fa80/v4l]
Error 2
make[5]: Leaving directory
'/home/spksrc/git-linuxtv/spksrc/kernel/syno-apollolake-6.2.2/work/source/linux'
make[4]: *** [Makefile:53: default] Error 2
make[4]: Leaving directory
'/home/spksrc/git-linuxtv/spksrc/spk/linuxtv/work-apollolake-6.2.2/linuxtv-gitea2766f182b3a4e03543be2ded0845fca4d4fa80/v4l'
make[3]: *** [Makefile:26: all] Error 2
make[3]: Leaving directory
'/home/spksrc/git-linuxtv/spksrc/spk/linuxtv/work-apollolake-6.2.2/linuxtv-gitea2766f182b3a4e03543be2ded0845fca4d4fa80'
make[2]: *** [Makefile:70: linuxtv_compile] Error 2
make[2]: Leaving directory '/home/spksrc/git-linuxtv/spksrc/cross/linuxtv'
make[1]: *** [../../mk/spksrc.depend.mk:44: depend_target] Error 2
make[1]: Leaving directory '/home/spksrc/git-linuxtv/spksrc/spk/linuxtv'
make: [../../mk/spksrc.spk.mk:436: arch-apollolake-6.2.2] Error 2 (ignored)



And errors for CONFIG_VIDEOBUF_DMA_SG are:
CC [M]  /home/spksrc/git-linuxtv/spksrc/spk/linuxtv/work-apollolake-6.2.2/linuxtv-gitea2766f182b3a4e03543be2ded0845fca4d4fa80/v4l/v4l2-common.o
/home/spksrc/git-linuxtv/spksrc/spk/linuxtv/work-apollolake-6.2.2/linuxtv-gitea2766f182b3a4e03543be2ded0845fca4d4fa80/v4l/v4l2-common.c:
In function 'v4l2_ctrl_query_fill':
/home/spksrc/git-linuxtv/spksrc/spk/linuxtv/work-apollolake-6.2.2/linuxtv-gitea2766f182b3a4e03543be2ded0845fca4d4fa80/v4l/v4l2-common.c:84:2:
warning: ignoring return value of 'strscpy', declared with attribute
warn_unused_result [-Wunused-result]
  strscpy(qctrl->name, name, sizeof(qctrl->name));
  ^
/home/spksrc/git-linuxtv/spksrc/spk/linuxtv/work-apollolake-6.2.2/linuxtv-gitea2766f182b3a4e03543be2ded0845fca4d4fa80/v4l/v4l2-common.c:
At top level:
cc1: warning: unrecognized command line option "-Wno-format-truncation"
  CC [M]  /home/spksrc/git-linuxtv/spksrc/spk/linuxtv/work-apollolake-6.2.2/linuxtv-gitea2766f182b3a4e03543be2ded0845fca4d4fa80/v4l/v4l2-compat-ioctl32.o
  CC [M]  /home/spksrc/git-linuxtv/spksrc/spk/linuxtv/work-apollolake-6.2.2/linuxtv-gitea2766f182b3a4e03543be2ded0845fca4d4fa80/v4l/v4l2-mc.o
  CC [M]  /home/spksrc/git-linuxtv/spksrc/spk/linuxtv/work-apollolake-6.2.2/linuxtv-gitea2766f182b3a4e03543be2ded0845fca4d4fa80/v4l/v4l2-spi.o
  CC [M]  /home/spksrc/git-linuxtv/spksrc/spk/linuxtv/work-apollolake-6.2.2/linuxtv-gitea2766f182b3a4e03543be2ded0845fca4d4fa80/v4l/v4l2-i2c.o
/home/spksrc/git-linuxtv/spksrc/spk/linuxtv/work-apollolake-6.2.2/linuxtv-gitea2766f182b3a4e03543be2ded0845fca4d4fa80/v4l/v4l2-i2c.c:
In function 'v4l2_i2c_new_subdev':
/home/spksrc/git-linuxtv/spksrc/spk/linuxtv/work-apollolake-6.2.2/linuxtv-gitea2766f182b3a4e03543be2ded0845fca4d4fa80/v4l/v4l2-i2c.c:132:2:
warning: ignoring return value of 'strscpy', declared with attribute
warn_unused_result [-Wunused-result]
  strscpy(info.type, client_type, sizeof(info.type));
  ^
/home/spksrc/git-linuxtv/spksrc/spk/linuxtv/work-apollolake-6.2.2/linuxtv-gitea2766f182b3a4e03543be2ded0845fca4d4fa80/v4l/v4l2-i2c.c:
At top level:
cc1: warning: unrecognized command line option "-Wno-format-truncation"
  LD [M]  /home/spksrc/git-linuxtv/spksrc/spk/linuxtv/work-apollolake-6.2.2/linuxtv-gitea2766f182b3a4e03543be2ded0845fca4d4fa80/v4l/videodev.o
  CC [M]  /home/spksrc/git-linuxtv/spksrc/spk/linuxtv/work-apollolake-6.2.2/linuxtv-gitea2766f182b3a4e03543be2ded0845fca4d4fa80/v4l/v4l2-dv-timings.o
  CC [M]  /home/spksrc/git-linuxtv/spksrc/spk/linuxtv/work-apollolake-6.2.2/linuxtv-gitea2766f182b3a4e03543be2ded0845fca4d4fa80/v4l/tuner-core.o
  LD [M]  /home/spksrc/git-linuxtv/spksrc/spk/linuxtv/work-apollolake-6.2.2/linuxtv-gitea2766f182b3a4e03543be2ded0845fca4d4fa80/v4l/tuner.o
  CC [M]  /home/spksrc/git-linuxtv/spksrc/spk/linuxtv/work-apollolake-6.2.2/linuxtv-gitea2766f182b3a4e03543be2ded0845fca4d4fa80/v4l/v4l2-mem2mem.o
  CC [M]  /home/spksrc/git-linuxtv/spksrc/spk/linuxtv/work-apollolake-6.2.2/linuxtv-gitea2766f182b3a4e03543be2ded0845fca4d4fa80/v4l/v4l2-jpeg.o
  CC [M]  /home/spksrc/git-linuxtv/spksrc/spk/linuxtv/work-apollolake-6.2.2/linuxtv-gitea2766f182b3a4e03543be2ded0845fca4d4fa80/v4l/videobuf-core.o
  CC [M]  /home/spksrc/git-linuxtv/spksrc/spk/linuxtv/work-apollolake-6.2.2/linuxtv-gitea2766f182b3a4e03543be2ded0845fca4d4fa80/v4l/videobuf-dma-sg.o
/home/spksrc/git-linuxtv/spksrc/spk/linuxtv/work-apollolake-6.2.2/linuxtv-gitea2766f182b3a4e03543be2ded0845fca4d4fa80/v4l/videobuf-dma-sg.c:
In function 'videobuf_dma_init_user_locked':
/home/spksrc/git-linuxtv/spksrc/spk/linuxtv/work-apollolake-6.2.2/linuxtv-gitea2766f182b3a4e03543be2ded0845fca4d4fa80/v4l/videobuf-dma-sg.c:188:16:
warning: passing argument 6 of 'get_user_pages' makes integer from
pointer without a cast
         flags, dma->pages, NULL);
                ^
In file included from include/linux/scatterlist.h:7:0,
                 from include/linux/dma-mapping.h:10,
                 from include/linux/skbuff.h:34,
                 from include/linux/if_ether.h:23,
                 from
/home/spksrc/git-linuxtv/spksrc/spk/linuxtv/work-apollolake-6.2.2/linuxtv-gitea2766f182b3a4e03543be2ded0845fca4d4fa80/v4l/compat.h:1735,
                 from <command-line>:0:
include/linux/mm.h:941:6: note: expected 'int' but argument is of type
'struct page **'
 long get_user_pages(struct task_struct *tsk, struct mm_struct *mm,
      ^
/home/spksrc/git-linuxtv/spksrc/spk/linuxtv/work-apollolake-6.2.2/linuxtv-gitea2766f182b3a4e03543be2ded0845fca4d4fa80/v4l/videobuf-dma-sg.c:186:8:
error: too few arguments to function 'get_user_pages'
  err = get_user_pages(current, current->mm,
        ^
In file included from include/linux/scatterlist.h:7:0,
                 from include/linux/dma-mapping.h:10,
                 from include/linux/skbuff.h:34,
                 from include/linux/if_ether.h:23,
                 from
/home/spksrc/git-linuxtv/spksrc/spk/linuxtv/work-apollolake-6.2.2/linuxtv-gitea2766f182b3a4e03543be2ded0845fca4d4fa80/v4l/compat.h:1735,
                 from <command-line>:0:
include/linux/mm.h:941:6: note: declared here
 long get_user_pages(struct task_struct *tsk, struct mm_struct *mm,
      ^
/home/spksrc/git-linuxtv/spksrc/spk/linuxtv/work-apollolake-6.2.2/linuxtv-gitea2766f182b3a4e03543be2ded0845fca4d4fa80/v4l/videobuf-dma-sg.c:
At top level:
cc1: warning: unrecognized command line option "-Wno-format-truncation"
make[6]: *** [scripts/Makefile.build:276:
/home/spksrc/git-linuxtv/spksrc/spk/linuxtv/work-apollolake-6.2.2/linuxtv-gitea2766f182b3a4e03543be2ded0845fca4d4fa80/v4l/videobuf-dma-sg.o]
Error 1
make[5]: *** [Makefile:1411:
_module_/home/spksrc/git-linuxtv/spksrc/spk/linuxtv/work-apollolake-6.2.2/linuxtv-gitea2766f182b3a4e03543be2ded0845fca4d4fa80/v4l]
Error 2
make[5]: Leaving directory
'/home/spksrc/git-linuxtv/spksrc/kernel/syno-apollolake-6.2.2/work/source/linux'
make[4]: *** [Makefile:53: default] Error 2
make[4]: Leaving directory
'/home/spksrc/git-linuxtv/spksrc/spk/linuxtv/work-apollolake-6.2.2/linuxtv-gitea2766f182b3a4e03543be2ded0845fca4d4fa80/v4l'
make[3]: *** [Makefile:26: all] Error 2
make[3]: Leaving directory
'/home/spksrc/git-linuxtv/spksrc/spk/linuxtv/work-apollolake-6.2.2/linuxtv-gitea2766f182b3a4e03543be2ded0845fca4d4fa80'
make[2]: *** [Makefile:70: linuxtv_compile] Error 2
make[2]: Leaving directory '/home/spksrc/git-linuxtv/spksrc/cross/linuxtv'
make[1]: *** [../../mk/spksrc.depend.mk:44: depend_target] Error 2
make[1]: Leaving directory '/home/spksrc/git-linuxtv/spksrc/spk/linuxtv'
make: [../../mk/spksrc.spk.mk:436: arch-apollolake-6.2.2] Error 2 (ignored)
