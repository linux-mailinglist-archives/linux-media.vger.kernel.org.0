Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 7D44831C4B4
	for <lists+linux-media@lfdr.de>; Tue, 16 Feb 2021 01:53:45 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229721AbhBPAw3 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 15 Feb 2021 19:52:29 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46020 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229720AbhBPAw2 (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 15 Feb 2021 19:52:28 -0500
Received: from mail-ed1-x530.google.com (mail-ed1-x530.google.com [IPv6:2a00:1450:4864:20::530])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A1202C061756
        for <linux-media@vger.kernel.org>; Mon, 15 Feb 2021 16:51:47 -0800 (PST)
Received: by mail-ed1-x530.google.com with SMTP id y10so5422123edt.12
        for <linux-media@vger.kernel.org>; Mon, 15 Feb 2021 16:51:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:from:date:message-id:subject:to;
        bh=sbRkrULW0qIJQTKc8DJJ8ETTf4i36EqKGUfRFBQ05SM=;
        b=KIM+VLUU3DKuYwSyoH47NPsjkHy0LmP5j6rIWf4rRUhMPIomuOkj87q6FmE049OtfE
         1ql51/A2YxAiKHkazn6xd2xjvl5sZwbhcnwemIslgGGIUb2g+RkfuiLpAKLZjsrJH72R
         9xvVPaTL2NDRn8UvjAeJBbdf9PCOz1MV4iPXN22M3bhY0HW4V0e5W4yPsHzlb7c+/57C
         YXVOH8zLp8XCYJu9dKGbZGOwIdHX4EaKTMFWlwYQfaWLJs8OzCdJgq9r+M3nhFViYpei
         IyKXxKxdAxLBucx0/mxOy6JCCUQ5IvABui0gczA0dO1AovyOSf2ZG1rKXiSoQAu9GDtH
         o09w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:from:date:message-id:subject:to;
        bh=sbRkrULW0qIJQTKc8DJJ8ETTf4i36EqKGUfRFBQ05SM=;
        b=fztjGfRYZa/2sGDBRO3ZJELkMhr+yoe3UxeHBpkwct1giYv7+JTFtDUrnLCHIAl4r/
         I48wMmTfzdgZUS5QxPtpoinc3Jqk8V2GHrbWW4k2pMgKjBIsZJdDkfoqh56mKhfi9Sjo
         XXKpaobcoB47SO6ZkaztoVVFbJ++zHwIU6z26ysiQkExYtcNMbDdxkLG/2AFOfHo/bnM
         S0x90chRfDMUiLISIgnv2Yw0vU+KWkfnOtPo5JIAkaCFsOMRgISJP8LbqYVfnfvU7FRo
         hhStMjkwGnRciOahs48gySfAx7ff88ZAEx6Wngtz7NCMJcun9S9bABVjwoCTyj+an4jU
         G67Q==
X-Gm-Message-State: AOAM530Zg1y5zlG5xlsyvN+H85YbX3Igvl+IjSTm8JHqV0ZiwdvBJvQh
        q5ugmteVcAb3Uy7wja5SkgeDxT3NWRkhNx0wpEdelF7FaELEfQ==
X-Google-Smtp-Source: ABdhPJyd0Hs2eASSFzCT+eBUzELNjocwGbQOK/hWzZSC8dGU7mHPDG6z3eF1PE6qKLzRIf0HGzYiTgwg9+OMI+1+DqQ=
X-Received: by 2002:a05:6402:151:: with SMTP id s17mr17775449edu.107.1613436706075;
 Mon, 15 Feb 2021 16:51:46 -0800 (PST)
MIME-Version: 1.0
From:   Vincent Fortier <th0ma7@gmail.com>
Date:   Mon, 15 Feb 2021 19:51:35 -0500
Message-ID: <CALAySu+kFO2aNp59PQ-yuBrcMA3xq5nZLhZS47gRSHdpuhRnDg@mail.gmail.com>
Subject: 4.4.59 backport issue - armada37xx & rtd1296 ARMv8
To:     linux-media@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi all,

Getting the following issue when trying to cross-compile on ARMv8
armada37xx & rtd1296 for 4.4.59 kernel.  Help would be much
appreciated.  Thnx in advance.

- vin

Following patches are being applied:
Applying patches for kernel 4.4.59+
patch -s -f -N -p1 -i ../backports/api_version.patch
patch -s -f -N -p1 -i ../backports/pr_fmt.patch
patch -s -f -N -p1 -i ../backports/debug.patch
patch -s -f -N -p1 -i ../backports/drx39xxj.patch
patch -s -f -N -p1 -i ../backports/ccs.patch
patch -s -f -N -p1 -i ../backports/v5.10_vb2_dma_buf_map.patch
patch -s -f -N -p1 -i ../backports/v5.9_tasklet.patch
patch -s -f -N -p1 -i ../backports/v5.9_netup_unidvb_devm_revert.patch
patch -s -f -N -p1 -i ../backports/v5.7_mmap_read_lock.patch
patch -s -f -N -p1 -i ../backports/v5.7_vm_map_ram.patch
patch -s -f -N -p1 -i ../backports/v5.7_pin_user_pages.patch
patch -s -f -N -p1 -i ../backports/v5.7_define_seq_attribute.patch
patch -s -f -N -p1 -i ../backports/v5.6_pin_user_pages.patch
patch -s -f -N -p1 -i ../backports/v5.6_const_fb_ops.patch
patch -s -f -N -p1 -i ../backports/v5.6_pm_runtime_get_if_active.patch
patch -s -f -N -p1 -i ../backports/v5.5_alsa_pcm_api_updates.patch
patch -s -f -N -p1 -i ../backports/v5.5_memtype_h.patch
patch -s -f -N -p1 -i ../backports/v5.5_dev_printk_h.patch
patch -s -f -N -p1 -i ../backports/v5.5_vb2_kmap.patch
patch -s -f -N -p1 -i ../backports/v5.4_revert_spi_transfer.patch
patch -s -f -N -p1 -i ../backports/v5.1_vm_map_pages.patch
patch -s -f -N -p1 -i ../backports/v5.1_devm_i2c_new_dummy_device.patch
patch -s -f -N -p1 -i ../backports/v5.0_ipu3-cio2.patch
patch -s -f -N -p1 -i ../backports/v5.0_time32.patch
patch -s -f -N -p1 -i ../backports/v5.0_gpio.patch
patch -s -f -N -p1 -i ../backports/v4.20_access_ok.patch
patch -s -f -N -p1 -i ../backports/v4.18_fwnode_args_args.patch
patch -s -f -N -p1 -i ../backports/v4.18_ccs_bitops.patch
patch -s -f -N -p1 -i ../backports/v4.18_vb2_map_atomic.patch
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
patch -s -f -N -p1 -i ../backports/v4.11_pwc.patch
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
patch -s -f -N -p1 -i ../backports/v4.5_vb2_cpu_access.patch
patch -s -f -N -p1 -i ../backports/v4.4_gpio_chip_parent.patch
Patched drivers/media/dvb-core/dvbdev.c
Patched drivers/media/v4l2-core/v4l2-dev.c
Patched drivers/media/rc/rc-main.c

And getting the following error:
  CC [M]  /home/spksrc/spksrc-linuxtv2/spksrc/spk/synokernel-linuxtv/work-armada37xx-6.2.3/linuxtv-gitf6e3542673d19355e8e42be40f5fc78431d611c5/v4l/v4l2-compat-ioctl32.o
/home/spksrc/spksrc-linuxtv2/spksrc/spk/synokernel-linuxtv/work-armada37xx-6.2.3/linuxtv-gitf6e3542673d19355e8e42be40f5fc78431d611c5/v4l/v4l2-compat-ioctl32.c:785:15:
warning: 'struct v4l2_event32' declared inside parameter list
        struct v4l2_event32 __user *p32)
               ^
/home/spksrc/spksrc-linuxtv2/spksrc/spk/synokernel-linuxtv/work-armada37xx-6.2.3/linuxtv-gitf6e3542673d19355e8e42be40f5fc78431d611c5/v4l/v4l2-compat-ioctl32.c:785:15:
warning: its scope is only this definition or declaration, which is
probably not what you want
In file included from include/net/checksum.h:25:0,
                 from include/linux/skbuff.h:31,
                 from include/linux/if_ether.h:23,
                 from
/home/spksrc/spksrc-linuxtv2/spksrc/spk/synokernel-linuxtv/work-armada37xx-6.2.3/linuxtv-gitf6e3542673d19355e8e42be40f5fc78431d611c5/v4l/compat.h:1721,
                 from <command-line>:0:
/home/spksrc/spksrc-linuxtv2/spksrc/spk/synokernel-linuxtv/work-armada37xx-6.2.3/linuxtv-gitf6e3542673d19355e8e42be40f5fc78431d611c5/v4l/v4l2-compat-ioctl32.c:
In function 'put_v4l2_event32':
/home/spksrc/spksrc-linuxtv2/spksrc/spk/synokernel-linuxtv/work-armada37xx-6.2.3/linuxtv-gitf6e3542673d19355e8e42be40f5fc78431d611c5/v4l/v4l2-compat-ioctl32.c:787:30:
error: dereferencing pointer to incomplete type
  if (put_user(p64->type, &p32->type) ||
                              ^
./arch/armada37xx/include/asm/uaccess.h:243:15: note: in definition of
macro 'put_user'
  __typeof__(*(ptr)) __user *__p = (ptr);    \
               ^
/home/spksrc/spksrc-linuxtv2/spksrc/spk/synokernel-linuxtv/work-armada37xx-6.2.3/linuxtv-gitf6e3542673d19355e8e42be40f5fc78431d611c5/v4l/v4l2-compat-ioctl32.c:787:30:
error: dereferencing pointer to incomplete type
  if (put_user(p64->type, &p32->type) ||
                              ^
./arch/armada37xx/include/asm/uaccess.h:243:36: note: in definition of
macro 'put_user'
  __typeof__(*(ptr)) __user *__p = (ptr);    \
                                    ^
/home/spksrc/spksrc-linuxtv2/spksrc/spk/synokernel-linuxtv/work-armada37xx-6.2.3/linuxtv-gitf6e3542673d19355e8e42be40f5fc78431d611c5/v4l/v4l2-compat-ioctl32.c:788:23:
error: dereferencing pointer to incomplete type
      copy_to_user(&p32->u, &p64->u, sizeof(p64->u)) ||
                       ^
In file included from include/net/checksum.h:25:0,
                 from include/linux/skbuff.h:31,
                 from include/linux/if_ether.h:23,
                 from
/home/spksrc/spksrc-linuxtv2/spksrc/spk/synokernel-linuxtv/work-armada37xx-6.2.3/linuxtv-gitf6e3542673d19355e8e42be40f5fc78431d611c5/v4l/compat.h:1721,
                 from <command-line>:0:
/home/spksrc/spksrc-linuxtv2/spksrc/spk/synokernel-linuxtv/work-armada37xx-6.2.3/linuxtv-gitf6e3542673d19355e8e42be40f5fc78431d611c5/v4l/v4l2-compat-ioctl32.c:789:33:
error: dereferencing pointer to incomplete type
      put_user(p64->pending, &p32->pending) ||
                                 ^
./arch/armada37xx/include/asm/uaccess.h:243:15: note: in definition of
macro 'put_user'
  __typeof__(*(ptr)) __user *__p = (ptr);    \
               ^
/home/spksrc/spksrc-linuxtv2/spksrc/spk/synokernel-linuxtv/work-armada37xx-6.2.3/linuxtv-gitf6e3542673d19355e8e42be40f5fc78431d611c5/v4l/v4l2-compat-ioctl32.c:789:33:
error: dereferencing pointer to incomplete type
      put_user(p64->pending, &p32->pending) ||
                                 ^
./arch/armada37xx/include/asm/uaccess.h:243:36: note: in definition of
macro 'put_user'
  __typeof__(*(ptr)) __user *__p = (ptr);    \
                                    ^
/home/spksrc/spksrc-linuxtv2/spksrc/spk/synokernel-linuxtv/work-armada37xx-6.2.3/linuxtv-gitf6e3542673d19355e8e42be40f5fc78431d611c5/v4l/v4l2-compat-ioctl32.c:790:34:
error: dereferencing pointer to incomplete type
      put_user(p64->sequence, &p32->sequence) ||
                                  ^
./arch/armada37xx/include/asm/uaccess.h:243:15: note: in definition of
macro 'put_user'
  __typeof__(*(ptr)) __user *__p = (ptr);    \
               ^
/home/spksrc/spksrc-linuxtv2/spksrc/spk/synokernel-linuxtv/work-armada37xx-6.2.3/linuxtv-gitf6e3542673d19355e8e42be40f5fc78431d611c5/v4l/v4l2-compat-ioctl32.c:790:34:
error: dereferencing pointer to incomplete type
      put_user(p64->sequence, &p32->sequence) ||
                                  ^
./arch/armada37xx/include/asm/uaccess.h:243:36: note: in definition of
macro 'put_user'
  __typeof__(*(ptr)) __user *__p = (ptr);    \
                                    ^
/home/spksrc/spksrc-linuxtv2/spksrc/spk/synokernel-linuxtv/work-armada37xx-6.2.3/linuxtv-gitf6e3542673d19355e8e42be40f5fc78431d611c5/v4l/v4l2-compat-ioctl32.c:791:42:
error: dereferencing pointer to incomplete type
      put_user(p64->timestamp.tv_sec, &p32->timestamp.tv_sec) ||
                                          ^
./arch/armada37xx/include/asm/uaccess.h:243:15: note: in definition of
macro 'put_user'
  __typeof__(*(ptr)) __user *__p = (ptr);    \
               ^
/home/spksrc/spksrc-linuxtv2/spksrc/spk/synokernel-linuxtv/work-armada37xx-6.2.3/linuxtv-gitf6e3542673d19355e8e42be40f5fc78431d611c5/v4l/v4l2-compat-ioctl32.c:791:42:
error: dereferencing pointer to incomplete type
      put_user(p64->timestamp.tv_sec, &p32->timestamp.tv_sec) ||
                                          ^
./arch/armada37xx/include/asm/uaccess.h:243:36: note: in definition of
macro 'put_user'
  __typeof__(*(ptr)) __user *__p = (ptr);    \
                                    ^
/home/spksrc/spksrc-linuxtv2/spksrc/spk/synokernel-linuxtv/work-armada37xx-6.2.3/linuxtv-gitf6e3542673d19355e8e42be40f5fc78431d611c5/v4l/v4l2-compat-ioctl32.c:792:43:
error: dereferencing pointer to incomplete type
      put_user(p64->timestamp.tv_nsec, &p32->timestamp.tv_nsec) ||
                                           ^
./arch/armada37xx/include/asm/uaccess.h:243:15: note: in definition of
macro 'put_user'
  __typeof__(*(ptr)) __user *__p = (ptr);    \
               ^
/home/spksrc/spksrc-linuxtv2/spksrc/spk/synokernel-linuxtv/work-armada37xx-6.2.3/linuxtv-gitf6e3542673d19355e8e42be40f5fc78431d611c5/v4l/v4l2-compat-ioctl32.c:792:43:
error: dereferencing pointer to incomplete type
      put_user(p64->timestamp.tv_nsec, &p32->timestamp.tv_nsec) ||
                                           ^
./arch/armada37xx/include/asm/uaccess.h:243:36: note: in definition of
macro 'put_user'
  __typeof__(*(ptr)) __user *__p = (ptr);    \
                                    ^
/home/spksrc/spksrc-linuxtv2/spksrc/spk/synokernel-linuxtv/work-armada37xx-6.2.3/linuxtv-gitf6e3542673d19355e8e42be40f5fc78431d611c5/v4l/v4l2-compat-ioctl32.c:793:28:
error: dereferencing pointer to incomplete type
      put_user(p64->id, &p32->id) ||
                            ^
./arch/armada37xx/include/asm/uaccess.h:243:15: note: in definition of
macro 'put_user'
  __typeof__(*(ptr)) __user *__p = (ptr);    \
               ^
/home/spksrc/spksrc-linuxtv2/spksrc/spk/synokernel-linuxtv/work-armada37xx-6.2.3/linuxtv-gitf6e3542673d19355e8e42be40f5fc78431d611c5/v4l/v4l2-compat-ioctl32.c:793:28:
error: dereferencing pointer to incomplete type
      put_user(p64->id, &p32->id) ||
                            ^
./arch/armada37xx/include/asm/uaccess.h:243:36: note: in definition of
macro 'put_user'
  __typeof__(*(ptr)) __user *__p = (ptr);    \
                                    ^
/home/spksrc/spksrc-linuxtv2/spksrc/spk/synokernel-linuxtv/work-armada37xx-6.2.3/linuxtv-gitf6e3542673d19355e8e42be40f5fc78431d611c5/v4l/v4l2-compat-ioctl32.c:794:22:
error: dereferencing pointer to incomplete type
      copy_to_user(p32->reserved, p64->reserved, sizeof(p32->reserved)))
                      ^
/home/spksrc/spksrc-linuxtv2/spksrc/spk/synokernel-linuxtv/work-armada37xx-6.2.3/linuxtv-gitf6e3542673d19355e8e42be40f5fc78431d611c5/v4l/v4l2-compat-ioctl32.c:794:59:
error: dereferencing pointer to incomplete type
      copy_to_user(p32->reserved, p64->reserved, sizeof(p32->reserved)))
                                                           ^
/home/spksrc/spksrc-linuxtv2/spksrc/spk/synokernel-linuxtv/work-armada37xx-6.2.3/linuxtv-gitf6e3542673d19355e8e42be40f5fc78431d611c5/v4l/v4l2-compat-ioctl32.c:
At top level:
/home/spksrc/spksrc-linuxtv2/spksrc/spk/synokernel-linuxtv/work-armada37xx-6.2.3/linuxtv-gitf6e3542673d19355e8e42be40f5fc78431d611c5/v4l/v4l2-compat-ioctl32.c:784:12:
warning: 'put_v4l2_event32' defined but not used [-Wunused-function]
 static int put_v4l2_event32(struct v4l2_event *p64,
            ^
cc1: warning: unrecognized command line option "-Wno-format-truncation"
make[6]: *** [scripts/Makefile.build:270:
/home/spksrc/spksrc-linuxtv2/spksrc/spk/synokernel-linuxtv/work-armada37xx-6.2.3/linuxtv-gitf6e3542673d19355e8e42be40f5fc78431d611c5/v4l/v4l2-compat-ioctl32.o]
Error 1
make[5]: *** [Makefile:1411:
_module_/home/spksrc/spksrc-linuxtv2/spksrc/spk/synokernel-linuxtv/work-armada37xx-6.2.3/linuxtv-gitf6e3542673d19355e8e42be40f5fc78431d611c5/v4l]
Error 2
make[5]: Leaving directory
'/home/spksrc/spksrc-linuxtv2/spksrc/spk/synokernel-linuxtv/work-armada37xx-6.2.3/linux'
make[4]: *** [Makefile:53: default] Error 2
make[4]: Leaving directory
'/home/spksrc/spksrc-linuxtv2/spksrc/spk/synokernel-linuxtv/work-armada37xx-6.2.3/linuxtv-gitf6e3542673d19355e8e42be40f5fc78431d611c5/v4l'
make[3]: *** [Makefile:26: all] Error 2
make[3]: Leaving directory
'/home/spksrc/spksrc-linuxtv2/spksrc/spk/synokernel-linuxtv/work-armada37xx-6.2.3/linuxtv-gitf6e3542673d19355e8e42be40f5fc78431d611c5'
make[2]: *** [Makefile:81: linuxtv_compile] Error 2
make[2]: Leaving directory '/home/spksrc/spksrc-linuxtv2/spksrc/cross/linuxtv'
make[1]: *** [../../mk/spksrc.depend.mk:51: depend_target] Error 2
make[1]: Leaving directory
'/home/spksrc/spksrc-linuxtv2/spksrc/spk/synokernel-linuxtv'
make: [../../mk/spksrc.spk.mk:434: arch-armada37xx-6.2.3] Error 2 (ignored)
