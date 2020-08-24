Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 1EDF924F692
	for <lists+linux-media@lfdr.de>; Mon, 24 Aug 2020 11:01:43 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730212AbgHXJBk (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 24 Aug 2020 05:01:40 -0400
Received: from lb3-smtp-cloud9.xs4all.net ([194.109.24.30]:48367 "EHLO
        lb3-smtp-cloud9.xs4all.net" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1728561AbgHXJBb (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 24 Aug 2020 05:01:31 -0400
Received: from cust-b5b5937f ([IPv6:fc0c:c16d:66b8:757f:c639:739b:9d66:799d])
        by smtp-cloud9.xs4all.net with ESMTPA
        id A8M2kNdcbuuXOA8M4k1eX7; Mon, 24 Aug 2020 11:01:28 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=xs4all.nl; s=s1;
        t=1598259688; bh=OLZf9gHZ72OfXx5n1+UyeePXBFKhoUtsNSd8JMQhtXA=;
        h=Subject:To:From:Message-ID:Date:MIME-Version:Content-Type:From:
         Subject;
        b=R1OqbFkw/g3rXd92jBWzQEezXAmmeDidOsaJQvWEj+QIBZ0tKKxdGpqsxysDsZ1Bz
         QibKDrATWTM3F++N1fCEWtGZo4N9cy71ifKDNvM6DJgREWi75J15GrpWiH1O91gAwo
         3dalIPBOAL0EytlTq56QkqWHRPYg8sbKjp0TozyWhPNtP5Auy+JjYNjt5fsS9ZLE3r
         bxjg42fuhGi8Xs3ofAH3LzheiqA1P+Kub2Xy71aTQ0tZd48RadHx4qtYABN85VUZLx
         qTB+nMs9yrN+nbyqcMON2IvG8Id/CgUR2Si4OpabGLUy4vUVFpVsJwRIwYC3wUS49M
         Kq6CPrhwi3VuA==
Subject: Re: 4.4.59 backport issue - build system for media drivers
To:     Vincent Fortier <th0ma7@gmail.com>, linux-media@vger.kernel.org
References: <CALAySuL==xc7W+_m=z_Y9VbnmXffAgdzUZxWyfKZDgFtGPJUng@mail.gmail.com>
From:   Hans Verkuil <hverkuil@xs4all.nl>
Message-ID: <362d8b30-67a3-5c5a-80e8-2ed414cc53a7@xs4all.nl>
Date:   Mon, 24 Aug 2020 11:01:26 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <CALAySuL==xc7W+_m=z_Y9VbnmXffAgdzUZxWyfKZDgFtGPJUng@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-CMAE-Envelope: MS4wfJiejmPFV7CvROrkGlRnu6/zSU9p4yRKwGeBPSt1HNWXuD4Qzje+mwqc/9PIw6yKVpoVQOYYOod2gMGoAGq4dEnf8dlNKCPHAfiefBd3/MHu8bH9WMAW
 QbeXKgdOJKzmM4bOJPcq/NwR99ZB+z/lBriC4FzZ0/qMj9iiw8P6BU5a1SHO1wXBaqSyddxhSDoT8KisTnWuCHbSNhJwyCzr0OcGazwAKZGe7LyaoZJ0YI8y
 8u5Y15oY0BLT/gewe/HKAfrARJeLK8HCH2aVuf7WbsNWeBWNxJ5qVQK9Yvx8c41/xSvQCwEZjJ5GhjUBsRjoyw==
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On 23/08/2020 22:42, Vincent Fortier wrote:
> Hi all,
> 
> Not sure if I am at the right place to ask but I have issues using the
> experimental build system for media drivers on a 4.4.59 kernel for
> Synology NAS (DSM-6.2+ with associate toolchain). Note that it used to
> work really well around a year ago but somehow it stopped since.
> 
> Synology's kernel source used is here:
> https://sourceforge.net/projects/dsgpl/files/Synology%20NAS%20GPL%20Source/24922branch/apollolake-source/linux-4.4.x.txz/download
> 
> It fails to build on CONFIG_VIDEOBUF2_MEMOPS and
> CONFIG_VIDEOBUF_DMA_SG modules, essential for me to get going.
> 
> Thnx a lot in advance!
> 
> - vin
> 
> ---
> Automatically applied patches:
> Applying patches for kernel 4.4.59
> patch -s -f -N -p1 -i ../backports/api_version.patch
> patch -s -f -N -p1 -i ../backports/pr_fmt.patch
> patch -s -f -N -p1 -i ../backports/debug.patch
> patch -s -f -N -p1 -i ../backports/drx39xxj.patch
> patch -s -f -N -p1 -i ../backports/v5.7_mmap_read_lock.patch
> patch -s -f -N -p1 -i ../backports/v5.7_vm_map_ram.patch
> patch -s -f -N -p1 -i ../backports/v5.7_pin_user_pages.patch
> patch -s -f -N -p1 -i ../backports/v5.6_pin_user_pages.patch
> patch -s -f -N -p1 -i ../backports/v5.6_const_fb_ops.patch
> patch -s -f -N -p1 -i ../backports/v5.6_pm_runtime_get_if_active.patch
> patch -s -f -N -p1 -i ../backports/v5.5_alsa_pcm_api_updates.patch
> patch -s -f -N -p1 -i ../backports/v5.5_memtype_h.patch
> patch -s -f -N -p1 -i ../backports/v5.4_revert_spi_transfer.patch
> patch -s -f -N -p1 -i ../backports/v5.1_vm_map_pages.patch
> patch -s -f -N -p1 -i ../backports/v5.1_devm_i2c_new_dummy_device.patch
> patch -s -f -N -p1 -i ../backports/v5.0_ipu3-cio2.patch
> patch -s -f -N -p1 -i ../backports/v5.0_time32.patch
> patch -s -f -N -p1 -i ../backports/v4.20_access_ok.patch
> patch -s -f -N -p1 -i ../backports/v4.18_fwnode_args_args.patch
> patch -s -f -N -p1 -i ../backports/v4.18_smiapp_bitops.patch
> patch -s -f -N -p1 -i ../backports/v4.17_i2c_check_num_msgs.patch
> patch -s -f -N -p1 -i ../backports/v4.15_pmdown_time.patch
> patch -s -f -N -p1 -i ../backports/v4.14_saa7146_timer_cast.patch
> patch -s -f -N -p1 -i ../backports/v4.14_module_param_call.patch
> patch -s -f -N -p1 -i ../backports/v4.14_fwnode_handle_get.patch
> patch -s -f -N -p1 -i ../backports/v4.13_remove_nospec_h.patch
> patch -s -f -N -p1 -i ../backports/v4.13_drmP.patch
> patch -s -f -N -p1 -i ../backports/v4.13_fwnode_graph_get_port_parent.patch
> patch -s -f -N -p1 -i ../backports/v4.12_revert_solo6x10_copykerneluser.patch
> patch -s -f -N -p1 -i ../backports/v4.11_drop_drm_file.patch
> patch -s -f -N -p1 -i ../backports/v4.10_sched_signal.patch
> patch -s -f -N -p1 -i ../backports/v4.10_fault_page.patch
> patch -s -f -N -p1 -i ../backports/v4.10_refcount.patch
> patch -s -f -N -p1 -i ../backports/v4.9_mm_address.patch
> patch -s -f -N -p1 -i ../backports/v4.9_dvb_net_max_mtu.patch
> patch -s -f -N -p1 -i ../backports/v4.9_probe_new.patch
> patch -s -f -N -p1 -i ../backports/v4.8_user_pages_flag.patch
> patch -s -f -N -p1 -i ../backports/v4.8_em28xx_bitfield.patch
> patch -s -f -N -p1 -i ../backports/v4.8_dma_map_resource.patch
> patch -s -f -N -p1 -i ../backports/v4.8_drm_crtc.patch
> patch -s -f -N -p1 -i ../backports/v4.7_dma_attrs.patch
> patch -s -f -N -p1 -i ../backports/v4.7_pci_alloc_irq_vectors.patch
> patch -s -f -N -p1 -i ../backports/v4.7_copy_to_user_warning.patch
> patch -s -f -N -p1 -i ../backports/v4.7_objtool_warning.patch
> patch -s -f -N -p1 -i ../backports/v4.6_i2c_mux.patch
> patch -s -f -N -p1 -i ../backports/v4.5_gpiochip_data_pointer.patch
> patch -s -f -N -p1 -i ../backports/v4.5_get_user_pages.patch
> patch -s -f -N -p1 -i ../backports/v4.5_uvc_super_plus.patch
> patch -s -f -N -p1 -i ../backports/v4.5_copy_to_user_warning.patch
> patch -s -f -N -p1 -i ../backports/v4.4_gpio_chip_parent.patch
> patch -s -f -N -p1 -i ../backports/v4.4_user_pages_flag.patch
> Patched drivers/media/dvb-core/dvbdev.c
> Patched drivers/media/v4l2-core/v4l2-dev.c
> Patched drivers/media/rc/rc-main.c
> 
> 
> BUILD ERRORS
> =============
> Errors for CONFIG_VIDEOBUF2_MEMOPS are:
> LD [M]  /home/spksrc/git-linuxtv/spksrc/spk/linuxtv/work-apollolake-6.2.2/linuxtv-gitea2766f182b3a4e03543be2ded0845fca4d4fa80/v4l/smsmdtv.o
>   CC [M]  /home/spksrc/git-linuxtv/spksrc/spk/linuxtv/work-apollolake-6.2.2/linuxtv-gitea2766f182b3a4e03543be2ded0845fca4d4fa80/v4l/smsdvb-main.o
>   LD [M]  /home/spksrc/git-linuxtv/spksrc/spk/linuxtv/work-apollolake-6.2.2/linuxtv-gitea2766f182b3a4e03543be2ded0845fca4d4fa80/v4l/smsdvb.o
>   CC [M]  /home/spksrc/git-linuxtv/spksrc/spk/linuxtv/work-apollolake-6.2.2/linuxtv-gitea2766f182b3a4e03543be2ded0845fca4d4fa80/v4l/v4l2-tpg-core.o
>   CC [M]  /home/spksrc/git-linuxtv/spksrc/spk/linuxtv/work-apollolake-6.2.2/linuxtv-gitea2766f182b3a4e03543be2ded0845fca4d4fa80/v4l/v4l2-tpg-colors.o
>   LD [M]  /home/spksrc/git-linuxtv/spksrc/spk/linuxtv/work-apollolake-6.2.2/linuxtv-gitea2766f182b3a4e03543be2ded0845fca4d4fa80/v4l/v4l2-tpg.o
>   CC [M]  /home/spksrc/git-linuxtv/spksrc/spk/linuxtv/work-apollolake-6.2.2/linuxtv-gitea2766f182b3a4e03543be2ded0845fca4d4fa80/v4l/videobuf2-core.o
>   LD [M]  /home/spksrc/git-linuxtv/spksrc/spk/linuxtv/work-apollolake-6.2.2/linuxtv-gitea2766f182b3a4e03543be2ded0845fca4d4fa80/v4l/videobuf2-common.o
>   CC [M]  /home/spksrc/git-linuxtv/spksrc/spk/linuxtv/work-apollolake-6.2.2/linuxtv-gitea2766f182b3a4e03543be2ded0845fca4d4fa80/v4l/videobuf2-v4l2.o
> /home/spksrc/git-linuxtv/spksrc/spk/linuxtv/work-apollolake-6.2.2/linuxtv-gitea2766f182b3a4e03543be2ded0845fca4d4fa80/v4l/videobuf2-v4l2.c:
> In function 'vb2_queue_init_name':
> /home/spksrc/git-linuxtv/spksrc/spk/linuxtv/work-apollolake-6.2.2/linuxtv-gitea2766f182b3a4e03543be2ded0845fca4d4fa80/v4l/videobuf2-v4l2.c:939:3:
> warning: ignoring return value of 'strscpy', declared with attribute
> warn_unused_result [-Wunused-result]
>    strscpy(q->name, name, sizeof(q->name));
>    ^

From v4l/compat.h:

#if LINUX_VERSION_CODE < KERNEL_VERSION(4, 16, 0)
/* we got a lot of warnings for Kernels older than 4.16 because strscpy has
 * been declared with "__must_check" prior to 4.16. In fact it is really not
 * necessary to check the return value of strscpy, so we clear the
 * "__must_check" definition.
 */
#undef __must_check
#define __must_check
#endif

So I'm not sure where this warning comes from, v4l/compat.h should have taken care of that.

> /home/spksrc/git-linuxtv/spksrc/spk/linuxtv/work-apollolake-6.2.2/linuxtv-gitea2766f182b3a4e03543be2ded0845fca4d4fa80/v4l/videobuf2-v4l2.c:
> At top level:
> cc1: warning: unrecognized command line option "-Wno-format-truncation"
>   CC [M]  /home/spksrc/git-linuxtv/spksrc/spk/linuxtv/work-apollolake-6.2.2/linuxtv-gitea2766f182b3a4e03543be2ded0845fca4d4fa80/v4l/videobuf2-memops.o
> /home/spksrc/git-linuxtv/spksrc/spk/linuxtv/work-apollolake-6.2.2/linuxtv-gitea2766f182b3a4e03543be2ded0845fca4d4fa80/v4l/videobuf2-memops.c:
> In function 'vb2_create_framevec':
> /home/spksrc/git-linuxtv/spksrc/spk/linuxtv/work-apollolake-6.2.2/linuxtv-gitea2766f182b3a4e03543be2ded0845fca4d4fa80/v4l/videobuf2-memops.c:51:8:
> error: too few arguments to function 'get_vaddr_frames'
>   ret = get_vaddr_frames(start & PAGE_MASK, nr, flags, vec);
>         ^
> In file included from include/linux/scatterlist.h:7:0,
>                  from include/linux/dma-mapping.h:10,
>                  from include/linux/skbuff.h:34,
>                  from include/linux/if_ether.h:23,
>                  from
> /home/spksrc/git-linuxtv/spksrc/spk/linuxtv/work-apollolake-6.2.2/linuxtv-gitea2766f182b3a4e03543be2ded0845fca4d4fa80/v4l/compat.h:1735,
>                  from <command-line>:0:
> include/linux/mm.h:969:5: note: declared here
>  int get_vaddr_frames(unsigned long start, unsigned int nr_pfns,
>      ^

I suspect that backports/v4.4_user_pages_flag.patch may not be necessary here.
If memory serves, then some mainline patches were backported to 4.4, requiring
this patch. 4.4.59 probably doesn't contain those backported patches yet.

Regards,

	Hans

> /home/spksrc/git-linuxtv/spksrc/spk/linuxtv/work-apollolake-6.2.2/linuxtv-gitea2766f182b3a4e03543be2ded0845fca4d4fa80/v4l/videobuf2-memops.c:
> At top level:
> cc1: warning: unrecognized command line option "-Wno-format-truncation"
> make[6]: *** [scripts/Makefile.build:276:
> /home/spksrc/git-linuxtv/spksrc/spk/linuxtv/work-apollolake-6.2.2/linuxtv-gitea2766f182b3a4e03543be2ded0845fca4d4fa80/v4l/videobuf2-memops.o]
> Error 1
> make[5]: *** [Makefile:1411:
> _module_/home/spksrc/git-linuxtv/spksrc/spk/linuxtv/work-apollolake-6.2.2/linuxtv-gitea2766f182b3a4e03543be2ded0845fca4d4fa80/v4l]
> Error 2
> make[5]: Leaving directory
> '/home/spksrc/git-linuxtv/spksrc/kernel/syno-apollolake-6.2.2/work/source/linux'
> make[4]: *** [Makefile:53: default] Error 2
> make[4]: Leaving directory
> '/home/spksrc/git-linuxtv/spksrc/spk/linuxtv/work-apollolake-6.2.2/linuxtv-gitea2766f182b3a4e03543be2ded0845fca4d4fa80/v4l'
> make[3]: *** [Makefile:26: all] Error 2
> make[3]: Leaving directory
> '/home/spksrc/git-linuxtv/spksrc/spk/linuxtv/work-apollolake-6.2.2/linuxtv-gitea2766f182b3a4e03543be2ded0845fca4d4fa80'
> make[2]: *** [Makefile:70: linuxtv_compile] Error 2
> make[2]: Leaving directory '/home/spksrc/git-linuxtv/spksrc/cross/linuxtv'
> make[1]: *** [../../mk/spksrc.depend.mk:44: depend_target] Error 2
> make[1]: Leaving directory '/home/spksrc/git-linuxtv/spksrc/spk/linuxtv'
> make: [../../mk/spksrc.spk.mk:436: arch-apollolake-6.2.2] Error 2 (ignored)
> 
> 
> 
> And errors for CONFIG_VIDEOBUF_DMA_SG are:
> CC [M]  /home/spksrc/git-linuxtv/spksrc/spk/linuxtv/work-apollolake-6.2.2/linuxtv-gitea2766f182b3a4e03543be2ded0845fca4d4fa80/v4l/v4l2-common.o
> /home/spksrc/git-linuxtv/spksrc/spk/linuxtv/work-apollolake-6.2.2/linuxtv-gitea2766f182b3a4e03543be2ded0845fca4d4fa80/v4l/v4l2-common.c:
> In function 'v4l2_ctrl_query_fill':
> /home/spksrc/git-linuxtv/spksrc/spk/linuxtv/work-apollolake-6.2.2/linuxtv-gitea2766f182b3a4e03543be2ded0845fca4d4fa80/v4l/v4l2-common.c:84:2:
> warning: ignoring return value of 'strscpy', declared with attribute
> warn_unused_result [-Wunused-result]
>   strscpy(qctrl->name, name, sizeof(qctrl->name));
>   ^
> /home/spksrc/git-linuxtv/spksrc/spk/linuxtv/work-apollolake-6.2.2/linuxtv-gitea2766f182b3a4e03543be2ded0845fca4d4fa80/v4l/v4l2-common.c:
> At top level:
> cc1: warning: unrecognized command line option "-Wno-format-truncation"
>   CC [M]  /home/spksrc/git-linuxtv/spksrc/spk/linuxtv/work-apollolake-6.2.2/linuxtv-gitea2766f182b3a4e03543be2ded0845fca4d4fa80/v4l/v4l2-compat-ioctl32.o
>   CC [M]  /home/spksrc/git-linuxtv/spksrc/spk/linuxtv/work-apollolake-6.2.2/linuxtv-gitea2766f182b3a4e03543be2ded0845fca4d4fa80/v4l/v4l2-mc.o
>   CC [M]  /home/spksrc/git-linuxtv/spksrc/spk/linuxtv/work-apollolake-6.2.2/linuxtv-gitea2766f182b3a4e03543be2ded0845fca4d4fa80/v4l/v4l2-spi.o
>   CC [M]  /home/spksrc/git-linuxtv/spksrc/spk/linuxtv/work-apollolake-6.2.2/linuxtv-gitea2766f182b3a4e03543be2ded0845fca4d4fa80/v4l/v4l2-i2c.o
> /home/spksrc/git-linuxtv/spksrc/spk/linuxtv/work-apollolake-6.2.2/linuxtv-gitea2766f182b3a4e03543be2ded0845fca4d4fa80/v4l/v4l2-i2c.c:
> In function 'v4l2_i2c_new_subdev':
> /home/spksrc/git-linuxtv/spksrc/spk/linuxtv/work-apollolake-6.2.2/linuxtv-gitea2766f182b3a4e03543be2ded0845fca4d4fa80/v4l/v4l2-i2c.c:132:2:
> warning: ignoring return value of 'strscpy', declared with attribute
> warn_unused_result [-Wunused-result]
>   strscpy(info.type, client_type, sizeof(info.type));
>   ^
> /home/spksrc/git-linuxtv/spksrc/spk/linuxtv/work-apollolake-6.2.2/linuxtv-gitea2766f182b3a4e03543be2ded0845fca4d4fa80/v4l/v4l2-i2c.c:
> At top level:
> cc1: warning: unrecognized command line option "-Wno-format-truncation"
>   LD [M]  /home/spksrc/git-linuxtv/spksrc/spk/linuxtv/work-apollolake-6.2.2/linuxtv-gitea2766f182b3a4e03543be2ded0845fca4d4fa80/v4l/videodev.o
>   CC [M]  /home/spksrc/git-linuxtv/spksrc/spk/linuxtv/work-apollolake-6.2.2/linuxtv-gitea2766f182b3a4e03543be2ded0845fca4d4fa80/v4l/v4l2-dv-timings.o
>   CC [M]  /home/spksrc/git-linuxtv/spksrc/spk/linuxtv/work-apollolake-6.2.2/linuxtv-gitea2766f182b3a4e03543be2ded0845fca4d4fa80/v4l/tuner-core.o
>   LD [M]  /home/spksrc/git-linuxtv/spksrc/spk/linuxtv/work-apollolake-6.2.2/linuxtv-gitea2766f182b3a4e03543be2ded0845fca4d4fa80/v4l/tuner.o
>   CC [M]  /home/spksrc/git-linuxtv/spksrc/spk/linuxtv/work-apollolake-6.2.2/linuxtv-gitea2766f182b3a4e03543be2ded0845fca4d4fa80/v4l/v4l2-mem2mem.o
>   CC [M]  /home/spksrc/git-linuxtv/spksrc/spk/linuxtv/work-apollolake-6.2.2/linuxtv-gitea2766f182b3a4e03543be2ded0845fca4d4fa80/v4l/v4l2-jpeg.o
>   CC [M]  /home/spksrc/git-linuxtv/spksrc/spk/linuxtv/work-apollolake-6.2.2/linuxtv-gitea2766f182b3a4e03543be2ded0845fca4d4fa80/v4l/videobuf-core.o
>   CC [M]  /home/spksrc/git-linuxtv/spksrc/spk/linuxtv/work-apollolake-6.2.2/linuxtv-gitea2766f182b3a4e03543be2ded0845fca4d4fa80/v4l/videobuf-dma-sg.o
> /home/spksrc/git-linuxtv/spksrc/spk/linuxtv/work-apollolake-6.2.2/linuxtv-gitea2766f182b3a4e03543be2ded0845fca4d4fa80/v4l/videobuf-dma-sg.c:
> In function 'videobuf_dma_init_user_locked':
> /home/spksrc/git-linuxtv/spksrc/spk/linuxtv/work-apollolake-6.2.2/linuxtv-gitea2766f182b3a4e03543be2ded0845fca4d4fa80/v4l/videobuf-dma-sg.c:188:16:
> warning: passing argument 6 of 'get_user_pages' makes integer from
> pointer without a cast
>          flags, dma->pages, NULL);
>                 ^
> In file included from include/linux/scatterlist.h:7:0,
>                  from include/linux/dma-mapping.h:10,
>                  from include/linux/skbuff.h:34,
>                  from include/linux/if_ether.h:23,
>                  from
> /home/spksrc/git-linuxtv/spksrc/spk/linuxtv/work-apollolake-6.2.2/linuxtv-gitea2766f182b3a4e03543be2ded0845fca4d4fa80/v4l/compat.h:1735,
>                  from <command-line>:0:
> include/linux/mm.h:941:6: note: expected 'int' but argument is of type
> 'struct page **'
>  long get_user_pages(struct task_struct *tsk, struct mm_struct *mm,
>       ^
> /home/spksrc/git-linuxtv/spksrc/spk/linuxtv/work-apollolake-6.2.2/linuxtv-gitea2766f182b3a4e03543be2ded0845fca4d4fa80/v4l/videobuf-dma-sg.c:186:8:
> error: too few arguments to function 'get_user_pages'
>   err = get_user_pages(current, current->mm,
>         ^
> In file included from include/linux/scatterlist.h:7:0,
>                  from include/linux/dma-mapping.h:10,
>                  from include/linux/skbuff.h:34,
>                  from include/linux/if_ether.h:23,
>                  from
> /home/spksrc/git-linuxtv/spksrc/spk/linuxtv/work-apollolake-6.2.2/linuxtv-gitea2766f182b3a4e03543be2ded0845fca4d4fa80/v4l/compat.h:1735,
>                  from <command-line>:0:
> include/linux/mm.h:941:6: note: declared here
>  long get_user_pages(struct task_struct *tsk, struct mm_struct *mm,
>       ^
> /home/spksrc/git-linuxtv/spksrc/spk/linuxtv/work-apollolake-6.2.2/linuxtv-gitea2766f182b3a4e03543be2ded0845fca4d4fa80/v4l/videobuf-dma-sg.c:
> At top level:
> cc1: warning: unrecognized command line option "-Wno-format-truncation"
> make[6]: *** [scripts/Makefile.build:276:
> /home/spksrc/git-linuxtv/spksrc/spk/linuxtv/work-apollolake-6.2.2/linuxtv-gitea2766f182b3a4e03543be2ded0845fca4d4fa80/v4l/videobuf-dma-sg.o]
> Error 1
> make[5]: *** [Makefile:1411:
> _module_/home/spksrc/git-linuxtv/spksrc/spk/linuxtv/work-apollolake-6.2.2/linuxtv-gitea2766f182b3a4e03543be2ded0845fca4d4fa80/v4l]
> Error 2
> make[5]: Leaving directory
> '/home/spksrc/git-linuxtv/spksrc/kernel/syno-apollolake-6.2.2/work/source/linux'
> make[4]: *** [Makefile:53: default] Error 2
> make[4]: Leaving directory
> '/home/spksrc/git-linuxtv/spksrc/spk/linuxtv/work-apollolake-6.2.2/linuxtv-gitea2766f182b3a4e03543be2ded0845fca4d4fa80/v4l'
> make[3]: *** [Makefile:26: all] Error 2
> make[3]: Leaving directory
> '/home/spksrc/git-linuxtv/spksrc/spk/linuxtv/work-apollolake-6.2.2/linuxtv-gitea2766f182b3a4e03543be2ded0845fca4d4fa80'
> make[2]: *** [Makefile:70: linuxtv_compile] Error 2
> make[2]: Leaving directory '/home/spksrc/git-linuxtv/spksrc/cross/linuxtv'
> make[1]: *** [../../mk/spksrc.depend.mk:44: depend_target] Error 2
> make[1]: Leaving directory '/home/spksrc/git-linuxtv/spksrc/spk/linuxtv'
> make: [../../mk/spksrc.spk.mk:436: arch-apollolake-6.2.2] Error 2 (ignored)
> 

