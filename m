Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 0BA3D31C4AD
	for <lists+linux-media@lfdr.de>; Tue, 16 Feb 2021 01:43:37 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229771AbhBPAmL (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 15 Feb 2021 19:42:11 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43792 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229777AbhBPAmJ (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 15 Feb 2021 19:42:09 -0500
Received: from mail-ej1-x62f.google.com (mail-ej1-x62f.google.com [IPv6:2a00:1450:4864:20::62f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0085EC0613D6
        for <linux-media@vger.kernel.org>; Mon, 15 Feb 2021 16:41:26 -0800 (PST)
Received: by mail-ej1-x62f.google.com with SMTP id y26so13952507eju.13
        for <linux-media@vger.kernel.org>; Mon, 15 Feb 2021 16:41:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=eL2pgzoqyKjHiUCF8fqjOru2d/Jf4iHw3GSNtjisKjk=;
        b=imz8aMjnCzR9FStruEp288GrP6OhGGt5P0YSEOAaqUDn8NS9zuJt65KUhksWhxNFvj
         ITn0DcZGRujU7t7FEa+rdNGQ3Y1w0Vv20an5TJlID6ZtTA1Iz0PH7Ey/tfUV9nJZvLyi
         H7MYbqbpUKBbVy0NLOGv3FRSSRjmea8qGH01UFMCPVQ8uRHoMvRqCYV4O+X9LB0lrz1Q
         4Xw8IVgz8eL6Fa+38OIe7Fc4ECUlFUN18e5sQQDfa4bdFqMhGCtXUNCN6FZAd8uc/fjl
         P3pxJPgWwEhGYG1flE2n37vNk7RtOBs7WDmDVIfC+WIJXUZ4IWbwHXgu/3bnkcqBaQz6
         j1OA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=eL2pgzoqyKjHiUCF8fqjOru2d/Jf4iHw3GSNtjisKjk=;
        b=tD5c6PyRlojKjrtSKGrSFaM5/r0jW1L63lcyL0HLyvFK8Wv0+Ko1cXJsOiHOOjF6VO
         G6V/24w0pgnTx5G1KK4Rtu3HM0fbOlinnw8lyPee0/qLh2x9OJTkxt1zkQjXhp9xnJa0
         2rK8CrfSCQ0OU2xefXdVKMiuJpcBzQl+PzfKfrx/fLMP43gbRUXJ3iCSzj010qeC7SPW
         1/4Jru0HCB63trQXHmXAA+NK04XZs2PFPudZyKpTyV/IPYqSASRYg4+RB39FTb8rIi7m
         1DtFseFBcpkwSjMsbdgZVhj1BN6RUTMtYn5yv0Z7jGctdATEGbXQi7KLByNav7RjQrYf
         gUpw==
X-Gm-Message-State: AOAM530RHeOKpvfOgqjU9EM9VzEZiM3F0OdIzUZZXu7Ci3M/jxdGIqUV
        P4zLin8PH2VDu+V3r8XOg+LPXq1xNrRSLzoWkIw=
X-Google-Smtp-Source: ABdhPJyDD2+VgT+vWrbD+B+m0mfA/eeZWT4SIJ9iV+4vggrQRYnp79lKMkcR4LJg/WiGDQ3fll/jBlWU65GI4MMO//w=
X-Received: by 2002:a17:906:fa03:: with SMTP id lo3mr7698432ejb.187.1613436085615;
 Mon, 15 Feb 2021 16:41:25 -0800 (PST)
MIME-Version: 1.0
References: <CALAySuL==xc7W+_m=z_Y9VbnmXffAgdzUZxWyfKZDgFtGPJUng@mail.gmail.com>
 <362d8b30-67a3-5c5a-80e8-2ed414cc53a7@xs4all.nl> <CALAySuKE7j1E7AxW7bFExqOBy2LZkA24V2UEr2KXSf1b2cXN3Q@mail.gmail.com>
In-Reply-To: <CALAySuKE7j1E7AxW7bFExqOBy2LZkA24V2UEr2KXSf1b2cXN3Q@mail.gmail.com>
From:   Vincent Fortier <th0ma7@gmail.com>
Date:   Mon, 15 Feb 2021 19:41:14 -0500
Message-ID: <CALAySuJ=s_bJgnUTdfrcKSEsyXbDFXnWGc2JqRaizhDw-PA-zQ@mail.gmail.com>
Subject: Re: 4.4.59 backport issue - build system for media drivers
To:     Hans Verkuil <hverkuil@xs4all.nl>
Cc:     linux-media@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Follow-up on this one, it ends-up I needed the following two patches
with most recent snapshot:

001-config-mycompat.patch
diff -uprN ../linuxtv-gitea2766f182b3a4e03543be2ded0845fca4d4fa80-ORIG/v4l/=
config-mycompat.h
./v4l/config-mycompat.h
--- ../linuxtv-gitea2766f182b3a4e03543be2ded0845fca4d4fa80-ORIG/v4l/config-=
mycompat.h
   1970-01-01 00:00:00.000000000 +0000
+++ ./v4l/config-mycompat.h    2020-07-27 19:04:26.148264906 +0000
@@ -0,0 +1,4 @@
+
+#define GPIOD_FLAGS_BIT_OPEN_DRAIN      BIT(3)
+
+#define GPIOD_OUT_HIGH_OPEN_DRAIN (GPIOD_OUT_HIGH | GPIOD_FLAGS_BIT_OPEN_D=
RAIN)


002-disable-user_pages_flag.patch
--- backports/backports.txt-orig    2021-01-22 16:56:29.373941502 +0000
+++ backports/backports.txt    2021-01-22 16:48:18.631173349 +0000
@@ -132,6 +132,10 @@ add v4.5_vb2_cpu_access.patch
 add v4.4_gpio_chip_parent.patch
 add v4.4_user_pages_flag.patch

+[4.4.59]
+delete v4.11_vb2_kmap.patch
+delete v4.4_user_pages_flag.patch
+
 [4.3.255]
 delete v4.4_user_pages_flag.patch
 add v4.3_bt87x_const_fix.patch

- vin

Le lun. 24 ao=C3=BBt 2020 =C3=A0 17:50, Vincent Fortier <th0ma7@gmail.com> =
a =C3=A9crit :
>
> Thnx Hans, you were right-on!
> The following solved the issue for me.
>
> - viin
> (sorry for top-posting)
>
> =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
>
> --- backports/backports.txt.old    2020-07-20 08:26:22.000000000 +0000
> +++ backports/backports.txt    2020-08-24 20:50:42.676026795 +0000
> @@ -114,6 +114,8 @@ add v4.5_copy_to_user_warning.patch
>
>  [4.4.255]
>  add v4.4_gpio_chip_parent.patch
> +
> +[4.4.58]
>  add v4.4_user_pages_flag.patch
>
>  [4.3.255]
>
> Le lun. 24 ao=C3=BBt 2020 =C3=A0 05:01, Hans Verkuil <hverkuil@xs4all.nl>=
 a =C3=A9crit :
> >
> > On 23/08/2020 22:42, Vincent Fortier wrote:
> > > Hi all,
> > >
> > > Not sure if I am at the right place to ask but I have issues using th=
e
> > > experimental build system for media drivers on a 4.4.59 kernel for
> > > Synology NAS (DSM-6.2+ with associate toolchain). Note that it used t=
o
> > > work really well around a year ago but somehow it stopped since.
> > >
> > > Synology's kernel source used is here:
> > > https://sourceforge.net/projects/dsgpl/files/Synology%20NAS%20GPL%20S=
ource/24922branch/apollolake-source/linux-4.4.x.txz/download
> > >
> > > It fails to build on CONFIG_VIDEOBUF2_MEMOPS and
> > > CONFIG_VIDEOBUF_DMA_SG modules, essential for me to get going.
> > >
> > > Thnx a lot in advance!
> > >
> > > - vin
> > >
> > > ---
> > > Automatically applied patches:
> > > Applying patches for kernel 4.4.59
> > > patch -s -f -N -p1 -i ../backports/api_version.patch
> > > patch -s -f -N -p1 -i ../backports/pr_fmt.patch
> > > patch -s -f -N -p1 -i ../backports/debug.patch
> > > patch -s -f -N -p1 -i ../backports/drx39xxj.patch
> > > patch -s -f -N -p1 -i ../backports/v5.7_mmap_read_lock.patch
> > > patch -s -f -N -p1 -i ../backports/v5.7_vm_map_ram.patch
> > > patch -s -f -N -p1 -i ../backports/v5.7_pin_user_pages.patch
> > > patch -s -f -N -p1 -i ../backports/v5.6_pin_user_pages.patch
> > > patch -s -f -N -p1 -i ../backports/v5.6_const_fb_ops.patch
> > > patch -s -f -N -p1 -i ../backports/v5.6_pm_runtime_get_if_active.patc=
h
> > > patch -s -f -N -p1 -i ../backports/v5.5_alsa_pcm_api_updates.patch
> > > patch -s -f -N -p1 -i ../backports/v5.5_memtype_h.patch
> > > patch -s -f -N -p1 -i ../backports/v5.4_revert_spi_transfer.patch
> > > patch -s -f -N -p1 -i ../backports/v5.1_vm_map_pages.patch
> > > patch -s -f -N -p1 -i ../backports/v5.1_devm_i2c_new_dummy_device.pat=
ch
> > > patch -s -f -N -p1 -i ../backports/v5.0_ipu3-cio2.patch
> > > patch -s -f -N -p1 -i ../backports/v5.0_time32.patch
> > > patch -s -f -N -p1 -i ../backports/v4.20_access_ok.patch
> > > patch -s -f -N -p1 -i ../backports/v4.18_fwnode_args_args.patch
> > > patch -s -f -N -p1 -i ../backports/v4.18_smiapp_bitops.patch
> > > patch -s -f -N -p1 -i ../backports/v4.17_i2c_check_num_msgs.patch
> > > patch -s -f -N -p1 -i ../backports/v4.15_pmdown_time.patch
> > > patch -s -f -N -p1 -i ../backports/v4.14_saa7146_timer_cast.patch
> > > patch -s -f -N -p1 -i ../backports/v4.14_module_param_call.patch
> > > patch -s -f -N -p1 -i ../backports/v4.14_fwnode_handle_get.patch
> > > patch -s -f -N -p1 -i ../backports/v4.13_remove_nospec_h.patch
> > > patch -s -f -N -p1 -i ../backports/v4.13_drmP.patch
> > > patch -s -f -N -p1 -i ../backports/v4.13_fwnode_graph_get_port_parent=
.patch
> > > patch -s -f -N -p1 -i ../backports/v4.12_revert_solo6x10_copykernelus=
er.patch
> > > patch -s -f -N -p1 -i ../backports/v4.11_drop_drm_file.patch
> > > patch -s -f -N -p1 -i ../backports/v4.10_sched_signal.patch
> > > patch -s -f -N -p1 -i ../backports/v4.10_fault_page.patch
> > > patch -s -f -N -p1 -i ../backports/v4.10_refcount.patch
> > > patch -s -f -N -p1 -i ../backports/v4.9_mm_address.patch
> > > patch -s -f -N -p1 -i ../backports/v4.9_dvb_net_max_mtu.patch
> > > patch -s -f -N -p1 -i ../backports/v4.9_probe_new.patch
> > > patch -s -f -N -p1 -i ../backports/v4.8_user_pages_flag.patch
> > > patch -s -f -N -p1 -i ../backports/v4.8_em28xx_bitfield.patch
> > > patch -s -f -N -p1 -i ../backports/v4.8_dma_map_resource.patch
> > > patch -s -f -N -p1 -i ../backports/v4.8_drm_crtc.patch
> > > patch -s -f -N -p1 -i ../backports/v4.7_dma_attrs.patch
> > > patch -s -f -N -p1 -i ../backports/v4.7_pci_alloc_irq_vectors.patch
> > > patch -s -f -N -p1 -i ../backports/v4.7_copy_to_user_warning.patch
> > > patch -s -f -N -p1 -i ../backports/v4.7_objtool_warning.patch
> > > patch -s -f -N -p1 -i ../backports/v4.6_i2c_mux.patch
> > > patch -s -f -N -p1 -i ../backports/v4.5_gpiochip_data_pointer.patch
> > > patch -s -f -N -p1 -i ../backports/v4.5_get_user_pages.patch
> > > patch -s -f -N -p1 -i ../backports/v4.5_uvc_super_plus.patch
> > > patch -s -f -N -p1 -i ../backports/v4.5_copy_to_user_warning.patch
> > > patch -s -f -N -p1 -i ../backports/v4.4_gpio_chip_parent.patch
> > > patch -s -f -N -p1 -i ../backports/v4.4_user_pages_flag.patch
> > > Patched drivers/media/dvb-core/dvbdev.c
> > > Patched drivers/media/v4l2-core/v4l2-dev.c
> > > Patched drivers/media/rc/rc-main.c
> > >
> > >
> > > BUILD ERRORS
> > > =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> > > Errors for CONFIG_VIDEOBUF2_MEMOPS are:
> > > LD [M]  /home/spksrc/git-linuxtv/spksrc/spk/linuxtv/work-apollolake-6=
.2.2/linuxtv-gitea2766f182b3a4e03543be2ded0845fca4d4fa80/v4l/smsmdtv.o
> > >   CC [M]  /home/spksrc/git-linuxtv/spksrc/spk/linuxtv/work-apollolake=
-6.2.2/linuxtv-gitea2766f182b3a4e03543be2ded0845fca4d4fa80/v4l/smsdvb-main.=
o
> > >   LD [M]  /home/spksrc/git-linuxtv/spksrc/spk/linuxtv/work-apollolake=
-6.2.2/linuxtv-gitea2766f182b3a4e03543be2ded0845fca4d4fa80/v4l/smsdvb.o
> > >   CC [M]  /home/spksrc/git-linuxtv/spksrc/spk/linuxtv/work-apollolake=
-6.2.2/linuxtv-gitea2766f182b3a4e03543be2ded0845fca4d4fa80/v4l/v4l2-tpg-cor=
e.o
> > >   CC [M]  /home/spksrc/git-linuxtv/spksrc/spk/linuxtv/work-apollolake=
-6.2.2/linuxtv-gitea2766f182b3a4e03543be2ded0845fca4d4fa80/v4l/v4l2-tpg-col=
ors.o
> > >   LD [M]  /home/spksrc/git-linuxtv/spksrc/spk/linuxtv/work-apollolake=
-6.2.2/linuxtv-gitea2766f182b3a4e03543be2ded0845fca4d4fa80/v4l/v4l2-tpg.o
> > >   CC [M]  /home/spksrc/git-linuxtv/spksrc/spk/linuxtv/work-apollolake=
-6.2.2/linuxtv-gitea2766f182b3a4e03543be2ded0845fca4d4fa80/v4l/videobuf2-co=
re.o
> > >   LD [M]  /home/spksrc/git-linuxtv/spksrc/spk/linuxtv/work-apollolake=
-6.2.2/linuxtv-gitea2766f182b3a4e03543be2ded0845fca4d4fa80/v4l/videobuf2-co=
mmon.o
> > >   CC [M]  /home/spksrc/git-linuxtv/spksrc/spk/linuxtv/work-apollolake=
-6.2.2/linuxtv-gitea2766f182b3a4e03543be2ded0845fca4d4fa80/v4l/videobuf2-v4=
l2.o
> > > /home/spksrc/git-linuxtv/spksrc/spk/linuxtv/work-apollolake-6.2.2/lin=
uxtv-gitea2766f182b3a4e03543be2ded0845fca4d4fa80/v4l/videobuf2-v4l2.c:
> > > In function 'vb2_queue_init_name':
> > > /home/spksrc/git-linuxtv/spksrc/spk/linuxtv/work-apollolake-6.2.2/lin=
uxtv-gitea2766f182b3a4e03543be2ded0845fca4d4fa80/v4l/videobuf2-v4l2.c:939:3=
:
> > > warning: ignoring return value of 'strscpy', declared with attribute
> > > warn_unused_result [-Wunused-result]
> > >    strscpy(q->name, name, sizeof(q->name));
> > >    ^
> >
> > From v4l/compat.h:
> >
> > #if LINUX_VERSION_CODE < KERNEL_VERSION(4, 16, 0)
> > /* we got a lot of warnings for Kernels older than 4.16 because strscpy=
 has
> >  * been declared with "__must_check" prior to 4.16. In fact it is reall=
y not
> >  * necessary to check the return value of strscpy, so we clear the
> >  * "__must_check" definition.
> >  */
> > #undef __must_check
> > #define __must_check
> > #endif
> >
> > So I'm not sure where this warning comes from, v4l/compat.h should have=
 taken care of that.
> >
> > > /home/spksrc/git-linuxtv/spksrc/spk/linuxtv/work-apollolake-6.2.2/lin=
uxtv-gitea2766f182b3a4e03543be2ded0845fca4d4fa80/v4l/videobuf2-v4l2.c:
> > > At top level:
> > > cc1: warning: unrecognized command line option "-Wno-format-truncatio=
n"
> > >   CC [M]  /home/spksrc/git-linuxtv/spksrc/spk/linuxtv/work-apollolake=
-6.2.2/linuxtv-gitea2766f182b3a4e03543be2ded0845fca4d4fa80/v4l/videobuf2-me=
mops.o
> > > /home/spksrc/git-linuxtv/spksrc/spk/linuxtv/work-apollolake-6.2.2/lin=
uxtv-gitea2766f182b3a4e03543be2ded0845fca4d4fa80/v4l/videobuf2-memops.c:
> > > In function 'vb2_create_framevec':
> > > /home/spksrc/git-linuxtv/spksrc/spk/linuxtv/work-apollolake-6.2.2/lin=
uxtv-gitea2766f182b3a4e03543be2ded0845fca4d4fa80/v4l/videobuf2-memops.c:51:=
8:
> > > error: too few arguments to function 'get_vaddr_frames'
> > >   ret =3D get_vaddr_frames(start & PAGE_MASK, nr, flags, vec);
> > >         ^
> > > In file included from include/linux/scatterlist.h:7:0,
> > >                  from include/linux/dma-mapping.h:10,
> > >                  from include/linux/skbuff.h:34,
> > >                  from include/linux/if_ether.h:23,
> > >                  from
> > > /home/spksrc/git-linuxtv/spksrc/spk/linuxtv/work-apollolake-6.2.2/lin=
uxtv-gitea2766f182b3a4e03543be2ded0845fca4d4fa80/v4l/compat.h:1735,
> > >                  from <command-line>:0:
> > > include/linux/mm.h:969:5: note: declared here
> > >  int get_vaddr_frames(unsigned long start, unsigned int nr_pfns,
> > >      ^
> >
> > I suspect that backports/v4.4_user_pages_flag.patch may not be necessar=
y here.
> > If memory serves, then some mainline patches were backported to 4.4, re=
quiring
> > this patch. 4.4.59 probably doesn't contain those backported patches ye=
t.
> >
> > Regards,
> >
> >         Hans
> >
> > > /home/spksrc/git-linuxtv/spksrc/spk/linuxtv/work-apollolake-6.2.2/lin=
uxtv-gitea2766f182b3a4e03543be2ded0845fca4d4fa80/v4l/videobuf2-memops.c:
> > > At top level:
> > > cc1: warning: unrecognized command line option "-Wno-format-truncatio=
n"
> > > make[6]: *** [scripts/Makefile.build:276:
> > > /home/spksrc/git-linuxtv/spksrc/spk/linuxtv/work-apollolake-6.2.2/lin=
uxtv-gitea2766f182b3a4e03543be2ded0845fca4d4fa80/v4l/videobuf2-memops.o]
> > > Error 1
> > > make[5]: *** [Makefile:1411:
> > > _module_/home/spksrc/git-linuxtv/spksrc/spk/linuxtv/work-apollolake-6=
.2.2/linuxtv-gitea2766f182b3a4e03543be2ded0845fca4d4fa80/v4l]
> > > Error 2
> > > make[5]: Leaving directory
> > > '/home/spksrc/git-linuxtv/spksrc/kernel/syno-apollolake-6.2.2/work/so=
urce/linux'
> > > make[4]: *** [Makefile:53: default] Error 2
> > > make[4]: Leaving directory
> > > '/home/spksrc/git-linuxtv/spksrc/spk/linuxtv/work-apollolake-6.2.2/li=
nuxtv-gitea2766f182b3a4e03543be2ded0845fca4d4fa80/v4l'
> > > make[3]: *** [Makefile:26: all] Error 2
> > > make[3]: Leaving directory
> > > '/home/spksrc/git-linuxtv/spksrc/spk/linuxtv/work-apollolake-6.2.2/li=
nuxtv-gitea2766f182b3a4e03543be2ded0845fca4d4fa80'
> > > make[2]: *** [Makefile:70: linuxtv_compile] Error 2
> > > make[2]: Leaving directory '/home/spksrc/git-linuxtv/spksrc/cross/lin=
uxtv'
> > > make[1]: *** [../../mk/spksrc.depend.mk:44: depend_target] Error 2
> > > make[1]: Leaving directory '/home/spksrc/git-linuxtv/spksrc/spk/linux=
tv'
> > > make: [../../mk/spksrc.spk.mk:436: arch-apollolake-6.2.2] Error 2 (ig=
nored)
> > >
> > >
> > >
> > > And errors for CONFIG_VIDEOBUF_DMA_SG are:
> > > CC [M]  /home/spksrc/git-linuxtv/spksrc/spk/linuxtv/work-apollolake-6=
.2.2/linuxtv-gitea2766f182b3a4e03543be2ded0845fca4d4fa80/v4l/v4l2-common.o
> > > /home/spksrc/git-linuxtv/spksrc/spk/linuxtv/work-apollolake-6.2.2/lin=
uxtv-gitea2766f182b3a4e03543be2ded0845fca4d4fa80/v4l/v4l2-common.c:
> > > In function 'v4l2_ctrl_query_fill':
> > > /home/spksrc/git-linuxtv/spksrc/spk/linuxtv/work-apollolake-6.2.2/lin=
uxtv-gitea2766f182b3a4e03543be2ded0845fca4d4fa80/v4l/v4l2-common.c:84:2:
> > > warning: ignoring return value of 'strscpy', declared with attribute
> > > warn_unused_result [-Wunused-result]
> > >   strscpy(qctrl->name, name, sizeof(qctrl->name));
> > >   ^
> > > /home/spksrc/git-linuxtv/spksrc/spk/linuxtv/work-apollolake-6.2.2/lin=
uxtv-gitea2766f182b3a4e03543be2ded0845fca4d4fa80/v4l/v4l2-common.c:
> > > At top level:
> > > cc1: warning: unrecognized command line option "-Wno-format-truncatio=
n"
> > >   CC [M]  /home/spksrc/git-linuxtv/spksrc/spk/linuxtv/work-apollolake=
-6.2.2/linuxtv-gitea2766f182b3a4e03543be2ded0845fca4d4fa80/v4l/v4l2-compat-=
ioctl32.o
> > >   CC [M]  /home/spksrc/git-linuxtv/spksrc/spk/linuxtv/work-apollolake=
-6.2.2/linuxtv-gitea2766f182b3a4e03543be2ded0845fca4d4fa80/v4l/v4l2-mc.o
> > >   CC [M]  /home/spksrc/git-linuxtv/spksrc/spk/linuxtv/work-apollolake=
-6.2.2/linuxtv-gitea2766f182b3a4e03543be2ded0845fca4d4fa80/v4l/v4l2-spi.o
> > >   CC [M]  /home/spksrc/git-linuxtv/spksrc/spk/linuxtv/work-apollolake=
-6.2.2/linuxtv-gitea2766f182b3a4e03543be2ded0845fca4d4fa80/v4l/v4l2-i2c.o
> > > /home/spksrc/git-linuxtv/spksrc/spk/linuxtv/work-apollolake-6.2.2/lin=
uxtv-gitea2766f182b3a4e03543be2ded0845fca4d4fa80/v4l/v4l2-i2c.c:
> > > In function 'v4l2_i2c_new_subdev':
> > > /home/spksrc/git-linuxtv/spksrc/spk/linuxtv/work-apollolake-6.2.2/lin=
uxtv-gitea2766f182b3a4e03543be2ded0845fca4d4fa80/v4l/v4l2-i2c.c:132:2:
> > > warning: ignoring return value of 'strscpy', declared with attribute
> > > warn_unused_result [-Wunused-result]
> > >   strscpy(info.type, client_type, sizeof(info.type));
> > >   ^
> > > /home/spksrc/git-linuxtv/spksrc/spk/linuxtv/work-apollolake-6.2.2/lin=
uxtv-gitea2766f182b3a4e03543be2ded0845fca4d4fa80/v4l/v4l2-i2c.c:
> > > At top level:
> > > cc1: warning: unrecognized command line option "-Wno-format-truncatio=
n"
> > >   LD [M]  /home/spksrc/git-linuxtv/spksrc/spk/linuxtv/work-apollolake=
-6.2.2/linuxtv-gitea2766f182b3a4e03543be2ded0845fca4d4fa80/v4l/videodev.o
> > >   CC [M]  /home/spksrc/git-linuxtv/spksrc/spk/linuxtv/work-apollolake=
-6.2.2/linuxtv-gitea2766f182b3a4e03543be2ded0845fca4d4fa80/v4l/v4l2-dv-timi=
ngs.o
> > >   CC [M]  /home/spksrc/git-linuxtv/spksrc/spk/linuxtv/work-apollolake=
-6.2.2/linuxtv-gitea2766f182b3a4e03543be2ded0845fca4d4fa80/v4l/tuner-core.o
> > >   LD [M]  /home/spksrc/git-linuxtv/spksrc/spk/linuxtv/work-apollolake=
-6.2.2/linuxtv-gitea2766f182b3a4e03543be2ded0845fca4d4fa80/v4l/tuner.o
> > >   CC [M]  /home/spksrc/git-linuxtv/spksrc/spk/linuxtv/work-apollolake=
-6.2.2/linuxtv-gitea2766f182b3a4e03543be2ded0845fca4d4fa80/v4l/v4l2-mem2mem=
.o
> > >   CC [M]  /home/spksrc/git-linuxtv/spksrc/spk/linuxtv/work-apollolake=
-6.2.2/linuxtv-gitea2766f182b3a4e03543be2ded0845fca4d4fa80/v4l/v4l2-jpeg.o
> > >   CC [M]  /home/spksrc/git-linuxtv/spksrc/spk/linuxtv/work-apollolake=
-6.2.2/linuxtv-gitea2766f182b3a4e03543be2ded0845fca4d4fa80/v4l/videobuf-cor=
e.o
> > >   CC [M]  /home/spksrc/git-linuxtv/spksrc/spk/linuxtv/work-apollolake=
-6.2.2/linuxtv-gitea2766f182b3a4e03543be2ded0845fca4d4fa80/v4l/videobuf-dma=
-sg.o
> > > /home/spksrc/git-linuxtv/spksrc/spk/linuxtv/work-apollolake-6.2.2/lin=
uxtv-gitea2766f182b3a4e03543be2ded0845fca4d4fa80/v4l/videobuf-dma-sg.c:
> > > In function 'videobuf_dma_init_user_locked':
> > > /home/spksrc/git-linuxtv/spksrc/spk/linuxtv/work-apollolake-6.2.2/lin=
uxtv-gitea2766f182b3a4e03543be2ded0845fca4d4fa80/v4l/videobuf-dma-sg.c:188:=
16:
> > > warning: passing argument 6 of 'get_user_pages' makes integer from
> > > pointer without a cast
> > >          flags, dma->pages, NULL);
> > >                 ^
> > > In file included from include/linux/scatterlist.h:7:0,
> > >                  from include/linux/dma-mapping.h:10,
> > >                  from include/linux/skbuff.h:34,
> > >                  from include/linux/if_ether.h:23,
> > >                  from
> > > /home/spksrc/git-linuxtv/spksrc/spk/linuxtv/work-apollolake-6.2.2/lin=
uxtv-gitea2766f182b3a4e03543be2ded0845fca4d4fa80/v4l/compat.h:1735,
> > >                  from <command-line>:0:
> > > include/linux/mm.h:941:6: note: expected 'int' but argument is of typ=
e
> > > 'struct page **'
> > >  long get_user_pages(struct task_struct *tsk, struct mm_struct *mm,
> > >       ^
> > > /home/spksrc/git-linuxtv/spksrc/spk/linuxtv/work-apollolake-6.2.2/lin=
uxtv-gitea2766f182b3a4e03543be2ded0845fca4d4fa80/v4l/videobuf-dma-sg.c:186:=
8:
> > > error: too few arguments to function 'get_user_pages'
> > >   err =3D get_user_pages(current, current->mm,
> > >         ^
> > > In file included from include/linux/scatterlist.h:7:0,
> > >                  from include/linux/dma-mapping.h:10,
> > >                  from include/linux/skbuff.h:34,
> > >                  from include/linux/if_ether.h:23,
> > >                  from
> > > /home/spksrc/git-linuxtv/spksrc/spk/linuxtv/work-apollolake-6.2.2/lin=
uxtv-gitea2766f182b3a4e03543be2ded0845fca4d4fa80/v4l/compat.h:1735,
> > >                  from <command-line>:0:
> > > include/linux/mm.h:941:6: note: declared here
> > >  long get_user_pages(struct task_struct *tsk, struct mm_struct *mm,
> > >       ^
> > > /home/spksrc/git-linuxtv/spksrc/spk/linuxtv/work-apollolake-6.2.2/lin=
uxtv-gitea2766f182b3a4e03543be2ded0845fca4d4fa80/v4l/videobuf-dma-sg.c:
> > > At top level:
> > > cc1: warning: unrecognized command line option "-Wno-format-truncatio=
n"
> > > make[6]: *** [scripts/Makefile.build:276:
> > > /home/spksrc/git-linuxtv/spksrc/spk/linuxtv/work-apollolake-6.2.2/lin=
uxtv-gitea2766f182b3a4e03543be2ded0845fca4d4fa80/v4l/videobuf-dma-sg.o]
> > > Error 1
> > > make[5]: *** [Makefile:1411:
> > > _module_/home/spksrc/git-linuxtv/spksrc/spk/linuxtv/work-apollolake-6=
.2.2/linuxtv-gitea2766f182b3a4e03543be2ded0845fca4d4fa80/v4l]
> > > Error 2
> > > make[5]: Leaving directory
> > > '/home/spksrc/git-linuxtv/spksrc/kernel/syno-apollolake-6.2.2/work/so=
urce/linux'
> > > make[4]: *** [Makefile:53: default] Error 2
> > > make[4]: Leaving directory
> > > '/home/spksrc/git-linuxtv/spksrc/spk/linuxtv/work-apollolake-6.2.2/li=
nuxtv-gitea2766f182b3a4e03543be2ded0845fca4d4fa80/v4l'
> > > make[3]: *** [Makefile:26: all] Error 2
> > > make[3]: Leaving directory
> > > '/home/spksrc/git-linuxtv/spksrc/spk/linuxtv/work-apollolake-6.2.2/li=
nuxtv-gitea2766f182b3a4e03543be2ded0845fca4d4fa80'
> > > make[2]: *** [Makefile:70: linuxtv_compile] Error 2
> > > make[2]: Leaving directory '/home/spksrc/git-linuxtv/spksrc/cross/lin=
uxtv'
> > > make[1]: *** [../../mk/spksrc.depend.mk:44: depend_target] Error 2
> > > make[1]: Leaving directory '/home/spksrc/git-linuxtv/spksrc/spk/linux=
tv'
> > > make: [../../mk/spksrc.spk.mk:436: arch-apollolake-6.2.2] Error 2 (ig=
nored)
> > >
> >
