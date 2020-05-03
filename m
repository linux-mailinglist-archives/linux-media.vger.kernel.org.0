Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 07F8C1C2AE4
	for <lists+linux-media@lfdr.de>; Sun,  3 May 2020 11:24:01 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727961AbgECJXf (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sun, 3 May 2020 05:23:35 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36090 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-FAIL-OK-FAIL)
        by vger.kernel.org with ESMTP id S1726445AbgECJXf (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Sun, 3 May 2020 05:23:35 -0400
Received: from mail-wm1-x341.google.com (mail-wm1-x341.google.com [IPv6:2a00:1450:4864:20::341])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 375F8C061A0C;
        Sun,  3 May 2020 02:23:33 -0700 (PDT)
Received: by mail-wm1-x341.google.com with SMTP id x4so4959024wmj.1;
        Sun, 03 May 2020 02:23:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=message-id:subject:from:to:cc:date:in-reply-to:references
         :user-agent:mime-version:content-transfer-encoding;
        bh=ktTn8Ehx7akoO5dY7P43Sww8Rhx3bMwhg3LAOtgumAw=;
        b=kGyykj/VY2Yuckk+1Se7/l+WmsLGIi1DcU+S7obKFNj4mcdZxSIFpMnBlXutz3WGPY
         Gn1vN0cGlVXPfJwZS6LDuv0uAPNetekW/DlXdb1GoqZ8BrIj7QWf1ktW0dBMK4M5Udbh
         3jX5WXEAvqhe/h0JnbUXsJOfaua6p0huteNWQznV0e54nDMtng0l1alexMz3QFnhf1HC
         LaiuUF/eGbTRXVdtgJeMdeRErqOCm+zPBSyr8aVDlDTky47be7mcWj1w45p62VuxhPbi
         +mmHjk1JvKPKycqk/iCOQxLUQGWdmNRi/ttudVaaRFoqCqOnbEPZ41EjEahJCkk2PbWu
         Psog==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
         :references:user-agent:mime-version:content-transfer-encoding;
        bh=ktTn8Ehx7akoO5dY7P43Sww8Rhx3bMwhg3LAOtgumAw=;
        b=TTc7WeMTXhIhXFhO9gvyWuukTgEDyJnZSjEUUe1Obvb7ViMVo9Pohcq/VDr3x5/Mn2
         GgfV/Z1aanJ6NdGOgeG+FxZrVKb7T9WVt6CIdVC7i/x4Gwml/M9us3A4HZWumscJ0FjN
         z6uAj/aYxNCjTOIGgwvSwC4gCvnf89foGUiB8WKomQlbgdOUiBC6aqqYBrRfBr4QUu6X
         QQC/ckFzIYcFeo1llCf2RNbi0DwdBHP1M4+lrD7gXFu2aNZi4s4ZLQFdJqQGeEvEruvv
         bYmSDedDEtB1t6rwPAbeD90Ib4IeVUmHsLh3lLNnIsaXVTW8goF21w/z5Pr6rmsckkwB
         jE4g==
X-Gm-Message-State: AGi0PuYZUioCm9/d7CohlG53pgmun0mHyPejzeMq0f0uXDHm/dtwbtQq
        yH5qdMsQwQlAdaEF6FfDnEg=
X-Google-Smtp-Source: APiQypJFZwuerCje1wuiqoKT7H0lQPHIMGy6xShYWLLljvp42iiTYGqmQbdny9x/DbQxraI3h8MlAw==
X-Received: by 2002:a1c:c302:: with SMTP id t2mr8912917wmf.85.1588497809510;
        Sun, 03 May 2020 02:23:29 -0700 (PDT)
Received: from Z77-PRO3.lan (host249-81-dynamic.58-82-r.retail.telecomitalia.it. [82.58.81.249])
        by smtp.gmail.com with ESMTPSA id t17sm12883060wro.2.2020.05.03.02.23.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 03 May 2020 02:23:28 -0700 (PDT)
Message-ID: <aa8e79400b5c5ce7f573fc61935689e3f53bee01.camel@gmail.com>
Subject: Re: [GIT PULL] Ressurect the atomisp staging driver
From:   bosconovic@gmail.com
To:     Mauro Carvalho Chehab <mchehab@kernel.org>,
        Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
Cc:     linux-media@vger.kernel.org, Greg KH <gregkh@linuxfoundation.org>,
        Alan Cox <alan@linux.intel.com>,
        Alan Cox <gnomes@lxorguk.ukuu.org.uk>,
        linux-kernel@vger.kernel.org
Date:   Sun, 03 May 2020 11:23:27 +0200
In-Reply-To: <20200501215741.3be05695@coco.lan>
References: <20200501215741.3be05695@coco.lan>
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.36.2 
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi ! 

Thanks for this, it is very appreciated !! 

I have a bay trail 2in1 (namely, the acer aspire swtich 10 sw5-012,
with an OV2722 module, so supported by the driver) on top of which I
run android-x86-q so I would be able to help a bit with testing the
driver.

I tried to pull in your changes on top of my 5.7-rc2 here : 
https://gitlab.com/lineageos-x86/android_kernel_common/-/commits/5.7-media

but I did not understood how to correctly enable the driver.
According
to Kconfig help, there is still the hardcoded switch between ISP2401
and ISP2400, so for my Bay Trail tablet I should set :

#
CONFIG_VIDEO_ATOMISP_ISP2401 is not set

but settings this breaks compilation with : 

ERROR: modpost:
"ia_css_configure_sc"[drivers/staging/media/atomisp/atomisp.ko]
undefined!

Looking at commit history, I noticed that the driver should be able to
recognize at runtime the ISP version, so what I tried next was to set
CONFIG_VIDEO_ATOMISP_ISP2401=y, and the compilation went fine.
I was able to boot the kernel (and I also added both
shisp_2400b0_v21.bin and shisp_2401a0_v21.bin from an android tablet
dump).

The kernel booted fine, the ov2722 module is loaded, but according to
dmesg it is not able to initialize the hardware : 
https://pastebin.com/VBMD1bau

Unfortunately I am not too experienced in kernel\driver development but
I would be happy to help to debug this, with guidance, if possible.

Il giorno ven, 01/05/2020 alle 21.57 +0200, Mauro Carvalho Chehab ha
scritto:
> This driver is simply too big for it to be sent to the ML via e-
> mails. Those
> will very likely be rejected due to the e-mail sizes.
> 
> So, instead, I'm sending a "GIT PULL" to myself, at the ML.
> 
> This series basically "resurrect" this driver from the death, giving
> it a
> second chance to survive.
> 
> I did a lot of cleanups on it during my spare time, and changed it to
> be
> able to work with ISP2401 (version A0). Several duplicated files got
> removed,
> several checkpatch warnings solved, and lots of other random things.
> 
> My current plans are to have people at the community testing and
> contributing with fixes, while I'll keep focused on cleaning its
> code and allow to support all ISP variants at the same time
> (right now, it requires a build time decision).
> 
> That's said, I don't have any Atom hardware with cameras myself, and
> it
> seems that there's at least one version of ISP2401 that may require
> some changes (version B0).
> 
> So, we don't know if this works or not, but this also applies to any
> other
> driver at staging, as warned when someone tries to use it:
> 
> 	[    9.270599] atomisp_ov2680: module is from the staging
> directory, the quality is unknown, you have been warned.
> 	[    9.350464] atomisp: module is from the staging directory,
> the quality is unknown, you have been warned.
> 
> So, use with care.
> 
> Regards,
> Mauro
> 
> -
> 
> 
> The following changes since commit
> ceab3ac1e60d70afb4e25147d60817c513f235f7:
> 
>   media: dvb-frontends: DUMMY_FE should depends on DVB_CORE (2020-04-
> 17 09:21:47 +0200)
> 
> are available in the Git repository at:
> 
>   git://linuxtv.org/mchehab/experimental.git atomisp_v2
> 
> 
> for you to fetch changes up to
> d3151587fa106c2b71169e5ea7d7de799152745f:
> 
>   atomisp: remove some file duplication and do more dir renames
> (2020-05-01 14:24:58 +0200)
> 
> ----------------------------------------------------------------
> Mauro Carvalho Chehab (69):
>       Revert "media: staging: atomisp: Remove driver"
>       media: atomisp: fix usage of access_ok() kAPI
>       media: atomisp: totalram_pages is now a function
>       media: atomisp: replace VFL_TYPE_GRABBER by VFL_TYPE_VIDEO
>       media: atomisp: Fix support for time 64 API
>       media: atomisp: use cpu_latency_qos_*() instead of
> pm_qos_update*()
>       media: atomisp: use new ida API
>       media: atomisp: fix a broken compat32 code
>       media: atomisp: allow building the driver again
>       media: atomisp: fix several typos
>       media: atomisp: fix several coding style issues
>       media: atomisp: do lots of other coding style cleanups
>       media: atomisp: remove some dead code
>       media: atomisp: simplify math_support.h
>       media: atomisp: add a way for the driver to know the chipset
> version
>       media: atomisp: atomisp_cmd.c test ISP version in runtime
>       media: atomisp: atomisp_dfs_tables.h: don't depend on ISP
> version
>       media: atomisp: pci/atomisp2/*.h remove #ifdef ISP2401
>       media: atomisp: atomisp_ioctl.c: get rid of a ISP2400/ISP2401
> dependency
>       media: atomisp: atomisp_v4l2.c: set wdt timers according with
> ISP version
>       media: atomisp: atomisp_subdev.c check ISP version on runtime
>       media: atomisp: atomisp_csi2.c: remove useless ifdefs
>       media: atomisp: atomisp_compat_css20.c: detect ISP at runtime
>       media: atomisp: atomisp_compat_ioctl32.c: be independent of ISP
> version
>       media: atomisp: sh_css_defs.h: get rid of build time
> dependencies
>       media: atomisp: make sh_css_struct.h independent of ISP version
>       media: atomisp: make sh_css_sp_init_pipeline() ISP version
> independent
>       media: atomisp: remove ISP version macros from sh_css_legacy.h
>       media: atomisp: remove table duplication from dfs tables
>       media: atomisp: unify sh_css_params_shading_id_table_generate()
>       media: atomisp: sh_css_param_dvs.h remove ISP version macros
>       media: atomisp: print css_version in runtime
>       media: atomisp: add support for possible new names
>       media: atomisp: css_trace.h: use the newest tracing code
>       media: atomisp: ia_css_binary_get_shading_info(): don't test
> version
>       media: atomisp: get rid of some non-existing functions for
> ISP2401
>       media: atomisp: make util.c work with ISP2401 runtime detection
>       media: atomisp: sh_css: detect ISP version at runtime
>       media: atomisp: isp_const.h: get rid of an unused big define
> list
>       media: atomisp: get rid of several typedef-style defines
>       media: atomisp: get rid of trivial ISP2401 dependencies on
> header files
>       media: atomisp: get rid of unused header files
>       media: atomisp: remove unused definitions at
> */isp_capture_defs.h
>       media: atomisp: remove several duplicated files
>       media: atomisp: remove unused hive_isp_css_host_ids_hrt.h
>       media: atomisp: hive_isp_css_defs.h: keep just one copy of it
>       media: atomisp: get finish de-duplication of hrt/hive*.h
>       media: atomisp: add Asus Transform T101HA ACPI vars
>       media: atomisp: use regulator_get_optional() for first attempt
>       media: atomisp: remove bayer_io_ls duplication
>       media: atomisp: rename anr2 param header file
>       media: atomisp: get rid of io_ls/ subdir
>       media: atomisp: remove unused duplicated files
>       media: atomisp: get rid of trivial version checks at *.h
>       media: atomisp: get rid of ia_css_sc_param.h version dependency
>       media: atomisp: get rid of ISP_VMEM_IS_BAMEM unused defines
>       media: atomisp: get rid of __ISP define tests
>       media: atomisp: make all file names unique at atomisp driver
>       media: atomisp: simplify makefiles
>       media: atomisp: cleanup directory hierarchy
>       media: atomisp: get rid of some broken code
>       media: atomisp: change function worders and fix include
>       media: atomisp: allow building for isp2401
>       media: atomisp: cleanup contents of css_2400_system/
>       media: atomisp: cleanup contents of css_2401_csi2p_system
>       media: atomisp: cleanup contents of css_2401_system
>       media: atomisp: get rid of most checks for ISP2401 version
>       media: atomisp: add firmware load code for ISP2401 rev B0
>       atomisp: remove some file duplication and do more dir renames
> 
>  MAINTAINERS                                        |     7 +
>  drivers/staging/media/Kconfig                      |     2 +
>  drivers/staging/media/Makefile                     |     1 +
>  drivers/staging/media/atomisp/Kconfig              |    35 +
>  drivers/staging/media/atomisp/Makefile             |   366 +
>  drivers/staging/media/atomisp/TODO                 |    74 +
>  drivers/staging/media/atomisp/i2c/Kconfig          |    86 +
>  drivers/staging/media/atomisp/i2c/Makefile         |    18 +
>  drivers/staging/media/atomisp/i2c/atomisp-gc0310.c |  1395 +++
>  drivers/staging/media/atomisp/i2c/atomisp-gc2235.c |  1128 ++
>  .../media/atomisp/i2c/atomisp-libmsrlisthelper.c   |   207 +
>  drivers/staging/media/atomisp/i2c/atomisp-lm3554.c |   961 ++
>  .../staging/media/atomisp/i2c/atomisp-mt9m114.c    |  1899 ++++
>  drivers/staging/media/atomisp/i2c/atomisp-ov2680.c |  1472 +++
>  drivers/staging/media/atomisp/i2c/atomisp-ov2722.c |  1277 +++
>  drivers/staging/media/atomisp/i2c/gc0310.h         |   404 +
>  drivers/staging/media/atomisp/i2c/gc2235.h         |   680 ++
>  drivers/staging/media/atomisp/i2c/mt9m114.h        |  1791 +++
>  drivers/staging/media/atomisp/i2c/ov2680.h         |   855 ++
>  drivers/staging/media/atomisp/i2c/ov2722.h         |  1272 +++
>  drivers/staging/media/atomisp/i2c/ov5693/Kconfig   |    11 +
>  drivers/staging/media/atomisp/i2c/ov5693/Makefile  |     2 +
>  drivers/staging/media/atomisp/i2c/ov5693/ad5823.h  |    62 +
>  .../media/atomisp/i2c/ov5693/atomisp-ov5693.c      |  1995 ++++
>  drivers/staging/media/atomisp/i2c/ov5693/ov5693.h  |  1391 +++
>  drivers/staging/media/atomisp/include/hmm/hmm.h    |   102 +
>  drivers/staging/media/atomisp/include/hmm/hmm_bo.h |   315 +
>  .../staging/media/atomisp/include/hmm/hmm_common.h |    96 +
>  .../staging/media/atomisp/include/hmm/hmm_pool.h   |   115 +
>  drivers/staging/media/atomisp/include/hmm/hmm_vm.h |    65 +
>  .../staging/media/atomisp/include/linux/atomisp.h  |  1359 +++
>  .../atomisp/include/linux/atomisp_gmin_platform.h  |    36 +
>  .../media/atomisp/include/linux/atomisp_platform.h |   247 +
>  .../media/atomisp/include/linux/libmsrlisthelper.h |    27 +
>  .../staging/media/atomisp/include/media/lm3554.h   |   130 +
>  .../staging/media/atomisp/include/mmu/isp_mmu.h    |   169 +
>  .../media/atomisp/include/mmu/sh_mmu_mrfld.h       |    24 +
>  drivers/staging/media/atomisp/pci/atomisp-regs.h   |   199 +
>  drivers/staging/media/atomisp/pci/atomisp_acc.c    |   605 +
>  drivers/staging/media/atomisp/pci/atomisp_acc.h    |   119 +
>  drivers/staging/media/atomisp/pci/atomisp_cmd.c    |  6629
> +++++++++++
>  drivers/staging/media/atomisp/pci/atomisp_cmd.h    |   442 +
>  drivers/staging/media/atomisp/pci/atomisp_common.h |    74 +
>  drivers/staging/media/atomisp/pci/atomisp_compat.h |   663 ++
>  .../media/atomisp/pci/atomisp_compat_css20.c       |  4704 ++++++++
>  .../media/atomisp/pci/atomisp_compat_css20.h       |   277 +
>  .../media/atomisp/pci/atomisp_compat_ioctl32.c     |  1177 ++
>  .../media/atomisp/pci/atomisp_compat_ioctl32.h     |   367 +
>  drivers/staging/media/atomisp/pci/atomisp_csi2.c   |   426 +
>  drivers/staging/media/atomisp/pci/atomisp_csi2.h   |    58 +
>  .../staging/media/atomisp/pci/atomisp_dfs_tables.h |    40 +
>  drivers/staging/media/atomisp/pci/atomisp_drvfs.c  |   205 +
>  drivers/staging/media/atomisp/pci/atomisp_drvfs.h  |    24 +
>  drivers/staging/media/atomisp/pci/atomisp_file.c   |   227 +
>  drivers/staging/media/atomisp/pci/atomisp_file.h   |    43 +
>  drivers/staging/media/atomisp/pci/atomisp_fops.c   |  1305 +++
>  drivers/staging/media/atomisp/pci/atomisp_fops.h   |    50 +
>  drivers/staging/media/atomisp/pci/atomisp_helper.h |    28 +
>  .../staging/media/atomisp/pci/atomisp_internal.h   |   307 +
>  drivers/staging/media/atomisp/pci/atomisp_ioctl.c  |  3103 +++++
>  drivers/staging/media/atomisp/pci/atomisp_ioctl.h  |    66 +
>  drivers/staging/media/atomisp/pci/atomisp_subdev.c |  1423 +++
>  drivers/staging/media/atomisp/pci/atomisp_subdev.h |   466 +
>  drivers/staging/media/atomisp/pci/atomisp_tables.h |   187 +
>  drivers/staging/media/atomisp/pci/atomisp_tpg.c    |   163 +
>  drivers/staging/media/atomisp/pci/atomisp_tpg.h    |    38 +
>  .../media/atomisp/pci/atomisp_trace_event.h        |   127 +
>  drivers/staging/media/atomisp/pci/atomisp_v4l2.c   |  1969 ++++
>  drivers/staging/media/atomisp/pci/atomisp_v4l2.h   |    40 +
>  .../pci/base/circbuf/interface/ia_css_circbuf.h    |   376 +
>  .../base/circbuf/interface/ia_css_circbuf_comm.h   |    58 +
>  .../base/circbuf/interface/ia_css_circbuf_desc.h   |   173 +
>  .../media/atomisp/pci/base/circbuf/src/circbuf.c   |   320 +
>  .../pci/base/refcount/interface/ia_css_refcount.h  |    83 +
>  .../media/atomisp/pci/base/refcount/src/refcount.c |   275 +
>  drivers/staging/media/atomisp/pci/bits.h           |   104 +
>  .../camera/pipe/interface/ia_css_pipe_binarydesc.h |   297 +
>  .../camera/pipe/interface/ia_css_pipe_stagedesc.h  |    51 +
>  .../pci/camera/pipe/interface/ia_css_pipe_util.h   |    39 +
>  .../atomisp/pci/camera/pipe/src/pipe_binarydesc.c  |   873 ++
>  .../atomisp/pci/camera/pipe/src/pipe_stagedesc.c   |   118 +
>  .../media/atomisp/pci/camera/pipe/src/pipe_util.c  |    50 +
>  .../pci/camera/util/interface/ia_css_util.h        |   141 +
>  .../media/atomisp/pci/camera/util/src/util.c       |   225 +
>  drivers/staging/media/atomisp/pci/cell_params.h    |    40 +
>  .../pci/css_2400_system/hive/ia_css_isp_configs.c  |   385 +
>  .../pci/css_2400_system/hive/ia_css_isp_params.c   |  3419 ++++++
>  .../pci/css_2400_system/hive/ia_css_isp_states.c   |   223 +
>  .../hrt/hive_isp_css_irq_types_hrt.h               |    68 +
>  .../css_2400_system/hrt/isp2400_mamoiada_params.h  |   228 +
>  .../media/atomisp/pci/css_2400_system/spmem_dump.c |  1935 ++++
>  .../atomisp/pci/css_2401_system/csi_rx_global.h    |    63 +
>  .../pci/css_2401_system/hive/ia_css_isp_configs.c  |   413 +
>  .../pci/css_2401_system/hive/ia_css_isp_params.c   |  3366 ++++++
>  .../pci/css_2401_system/hive/ia_css_isp_states.c   |   223 +
>  .../atomisp/pci/css_2401_system/host/csi_rx.c      |    40 +
>  .../pci/css_2401_system/host/csi_rx_local.h        |    62 +
>  .../pci/css_2401_system/host/csi_rx_private.h      |   305 +
>  .../atomisp/pci/css_2401_system/host/ibuf_ctrl.c   |    22 +
>  .../pci/css_2401_system/host/ibuf_ctrl_local.h     |    58 +
>  .../pci/css_2401_system/host/ibuf_ctrl_private.h   |   267 +
>  .../atomisp/pci/css_2401_system/host/isys_dma.c    |    40 +
>  .../pci/css_2401_system/host/isys_dma_local.h      |    20 +
>  .../pci/css_2401_system/host/isys_dma_private.h    |    61 +
>  .../atomisp/pci/css_2401_system/host/isys_irq.c    |    43 +
>  .../pci/css_2401_system/host/isys_irq_local.h      |    35 +
>  .../pci/css_2401_system/host/isys_irq_private.h    |   106 +
>  .../pci/css_2401_system/host/isys_stream2mmio.c    |    21 +
>  .../css_2401_system/host/isys_stream2mmio_local.h  |    36 +
>  .../host/isys_stream2mmio_private.h                |   167 +
>  .../pci/css_2401_system/host/pixelgen_local.h      |    50 +
>  .../pci/css_2401_system/host/pixelgen_private.h    |   182 +
>  .../css_2401_system/hrt/PixelGen_SysBlock_defs.h   |   113 +
>  .../pci/css_2401_system/hrt/ibuf_cntrl_defs.h      |   134 +
>  .../css_2401_system/hrt/mipi_backend_common_defs.h |   205 +
>  .../pci/css_2401_system/hrt/mipi_backend_defs.h    |   208 +
>  .../atomisp/pci/css_2401_system/hrt/rx_csi_defs.h  |   169 +
>  .../pci/css_2401_system/hrt/stream2mmio_defs.h     |    68 +
>  .../atomisp/pci/css_2401_system/ibuf_ctrl_global.h |    79 +
>  .../atomisp/pci/css_2401_system/isys_dma_global.h  |    89 +
>  .../atomisp/pci/css_2401_system/isys_irq_global.h  |    35 +
>  .../pci/css_2401_system/isys_stream2mmio_global.h  |    39 +
>  .../atomisp/pci/css_2401_system/pixelgen_global.h  |    90 +
>  .../media/atomisp/pci/css_2401_system/spmem_dump.c |  1965 ++++
>  .../atomisp/pci/css_receiver_2400_common_defs.h    |   198 +
>  .../media/atomisp/pci/css_receiver_2400_defs.h     |   256 +
>  drivers/staging/media/atomisp/pci/css_trace.h      |   278 +
>  drivers/staging/media/atomisp/pci/defs.h           |    36 +
>  drivers/staging/media/atomisp/pci/dma_v2_defs.h    |   199 +
>  drivers/staging/media/atomisp/pci/gdc_v2_defs.h    |   163 +
>  drivers/staging/media/atomisp/pci/gp_timer_defs.h  |    36 +
>  .../staging/media/atomisp/pci/gpio_block_defs.h    |    41 +
>  .../atomisp/pci/hive_isp_css_2401_irq_types_hrt.h  |    68 +
>  .../atomisp/pci/hive_isp_css_common/debug_global.h |    81 +
>  .../atomisp/pci/hive_isp_css_common/dma_global.h   |   254 +
>  .../pci/hive_isp_css_common/event_fifo_global.h    |    20 +
>  .../pci/hive_isp_css_common/fifo_monitor_global.h  |    32 +
>  .../atomisp/pci/hive_isp_css_common/gdc_global.h   |    89 +
>  .../pci/hive_isp_css_common/gp_device_global.h     |    84 +
>  .../pci/hive_isp_css_common/gp_timer_global.h      |    33 +
>  .../atomisp/pci/hive_isp_css_common/gpio_global.h  |    45 +
>  .../atomisp/pci/hive_isp_css_common/hmem_global.h  |    45 +
>  .../atomisp/pci/hive_isp_css_common/host/debug.c   |    71 +
>  .../pci/hive_isp_css_common/host/debug_local.h     |    20 +
>  .../pci/hive_isp_css_common/host/debug_private.h   |   126 +
>  .../atomisp/pci/hive_isp_css_common/host/dma.c     |   299 +
>  .../pci/hive_isp_css_common/host/dma_local.h       |   207 +
>  .../pci/hive_isp_css_common/host/dma_private.h     |    41 +
>  .../pci/hive_isp_css_common/host/event_fifo.c      |    19 +
>  .../hive_isp_css_common/host/event_fifo_local.h    |    61 +
>  .../hive_isp_css_common/host/event_fifo_private.h  |    77 +
>  .../pci/hive_isp_css_common/host/fifo_monitor.c    |   569 +
>  .../hive_isp_css_common/host/fifo_monitor_local.h  |    99 +
>  .../host/fifo_monitor_private.h                    |    80 +
>  .../atomisp/pci/hive_isp_css_common/host/gdc.c     |   125 +
>  .../pci/hive_isp_css_common/host/gdc_local.h       |    20 +
>  .../pci/hive_isp_css_common/host/gdc_private.h     |    20 +
>  .../pci/hive_isp_css_common/host/gp_device.c       |   108 +
>  .../pci/hive_isp_css_common/host/gp_device_local.h |   143 +
>  .../hive_isp_css_common/host/gp_device_private.h   |    46 +
>  .../pci/hive_isp_css_common/host/gp_timer.c        |    70 +
>  .../pci/hive_isp_css_common/host/gp_timer_local.h  |    43 +
>  .../hive_isp_css_common/host/gp_timer_private.h    |    22 +
>  .../pci/hive_isp_css_common/host/gpio_local.h      |    20 +
>  .../pci/hive_isp_css_common/host/gpio_private.h    |    44 +
>  .../atomisp/pci/hive_isp_css_common/host/hmem.c    |    19 +
>  .../pci/hive_isp_css_common/host/hmem_local.h      |    20 +
>  .../pci/hive_isp_css_common/host/hmem_private.h    |    30 +
>  .../pci/hive_isp_css_common/host/input_formatter.c |   241 +
>  .../host/input_formatter_local.h                   |   121 +
>  .../host/input_formatter_private.h                 |    46 +
>  .../pci/hive_isp_css_common/host/input_system.c    |  1849 +++
>  .../atomisp/pci/hive_isp_css_common/host/irq.c     |   451 +
>  .../pci/hive_isp_css_common/host/irq_local.h       |   134 +
>  .../pci/hive_isp_css_common/host/irq_private.h     |    44 +
>  .../atomisp/pci/hive_isp_css_common/host/isp.c     |   128 +
>  .../pci/hive_isp_css_common/host/isp_local.h       |    57 +
>  .../pci/hive_isp_css_common/host/isp_private.h     |   160 +
>  .../atomisp/pci/hive_isp_css_common/host/mmu.c     |    46 +
>  .../pci/hive_isp_css_common/host/mmu_local.h       |    20 +
>  .../atomisp/pci/hive_isp_css_common/host/sp.c      |    81 +
>  .../pci/hive_isp_css_common/host/sp_local.h        |   101 +
>  .../pci/hive_isp_css_common/host/sp_private.h      |   166 +
>  .../pci/hive_isp_css_common/host/timed_ctrl.c      |    74 +
>  .../hive_isp_css_common/host/timed_ctrl_local.h    |    20 +
>  .../hive_isp_css_common/host/timed_ctrl_private.h  |    34 +
>  .../pci/hive_isp_css_common/host/vamem_local.h     |    20 +
>  .../atomisp/pci/hive_isp_css_common/host/vmem.c    |   276 +
>  .../pci/hive_isp_css_common/host/vmem_local.h      |    57 +
>  .../pci/hive_isp_css_common/host/vmem_private.h    |    20 +
>  .../hive_isp_css_common/input_formatter_global.h   |   114 +
>  .../atomisp/pci/hive_isp_css_common/irq_global.h   |    45 +
>  .../atomisp/pci/hive_isp_css_common/isp_global.h   |   109 +
>  .../atomisp/pci/hive_isp_css_common/mmu_global.h   |    22 +
>  .../atomisp/pci/hive_isp_css_common/sp_global.h    |    93 +
>  .../pci/hive_isp_css_common/timed_ctrl_global.h    |    54 +
>  .../atomisp/pci/hive_isp_css_common/vamem_global.h |    34 +
>  .../atomisp/pci/hive_isp_css_common/vmem_global.h  |    28 +
>  .../staging/media/atomisp/pci/hive_isp_css_defs.h  |   411 +
>  .../pci/hive_isp_css_include/assert_support.h      |    73 +
>  .../pci/hive_isp_css_include/bitop_support.h       |    24 +
>  .../atomisp/pci/hive_isp_css_include/csi_rx.h      |    42 +
>  .../media/atomisp/pci/hive_isp_css_include/debug.h |    46 +
>  .../device_access/device_access.h                  |   177 +
>  .../media/atomisp/pci/hive_isp_css_include/dma.h   |    46 +
>  .../pci/hive_isp_css_include/error_support.h       |    39 +
>  .../atomisp/pci/hive_isp_css_include/event_fifo.h  |    45 +
>  .../pci/hive_isp_css_include/fifo_monitor.h        |    45 +
>  .../atomisp/pci/hive_isp_css_include/gdc_device.h  |    47 +
>  .../atomisp/pci/hive_isp_css_include/gp_device.h   |    45 +
>  .../atomisp/pci/hive_isp_css_include/gp_timer.h    |    45 +
>  .../media/atomisp/pci/hive_isp_css_include/gpio.h  |    45 +
>  .../media/atomisp/pci/hive_isp_css_include/hmem.h  |    45 +
>  .../pci/hive_isp_css_include/host/csi_rx_public.h  |   135 +
>  .../pci/hive_isp_css_include/host/debug_public.h   |    98 +
>  .../pci/hive_isp_css_include/host/dma_public.h     |    72 +
>  .../hive_isp_css_include/host/event_fifo_public.h  |    79 +
>  .../host/fifo_monitor_public.h                     |   110 +
>  .../pci/hive_isp_css_include/host/gdc_public.h     |    59 +
>  .../hive_isp_css_include/host/gp_device_public.h   |    58 +
>  .../hive_isp_css_include/host/gp_timer_public.h    |    33 +
>  .../pci/hive_isp_css_include/host/gpio_public.h    |    45 +
>  .../pci/hive_isp_css_include/host/hmem_public.h    |    32 +
>  .../hive_isp_css_include/host/ibuf_ctrl_public.h   |    93 +
>  .../host/input_formatter_public.h                  |   115 +
>  .../pci/hive_isp_css_include/host/irq_public.h     |   184 +
>  .../pci/hive_isp_css_include/host/isp_public.h     |   185 +
>  .../hive_isp_css_include/host/isys_dma_public.h    |    38 +
>  .../hive_isp_css_include/host/isys_irq_public.h    |    45 +
>  .../pci/hive_isp_css_include/host/isys_public.h    |    37 +
>  .../host/isys_stream2mmio_public.h                 |   101 +
>  .../pci/hive_isp_css_include/host/mmu_public.h     |    94 +
>  .../hive_isp_css_include/host/pixelgen_public.h    |    79 +
>  .../pci/hive_isp_css_include/host/sp_public.h      |   223 +
>  .../pci/hive_isp_css_include/host/tag_public.h     |    40 +
>  .../hive_isp_css_include/host/timed_ctrl_public.h  |    59 +
>  .../pci/hive_isp_css_include/host/vamem_public.h   |    18 +
>  .../pci/hive_isp_css_include/host/vmem_public.h    |    20 +
>  .../atomisp/pci/hive_isp_css_include/ibuf_ctrl.h   |    46 +
>  .../pci/hive_isp_css_include/input_formatter.h     |    45 +
>  .../pci/hive_isp_css_include/input_system.h        |    45 +
>  .../media/atomisp/pci/hive_isp_css_include/irq.h   |    45 +
>  .../media/atomisp/pci/hive_isp_css_include/isp.h   |    45 +
>  .../atomisp/pci/hive_isp_css_include/isys_dma.h    |    46 +
>  .../atomisp/pci/hive_isp_css_include/isys_irq.h    |    39 +
>  .../pci/hive_isp_css_include/isys_stream2mmio.h    |    46 +
>  .../pci/hive_isp_css_include/math_support.h        |   153 +
>  .../memory_access/memory_access.h                  |   174 +
>  .../pci/hive_isp_css_include/memory_realloc.h      |    38 +
>  .../pci/hive_isp_css_include/misc_support.h        |    26 +
>  .../atomisp/pci/hive_isp_css_include/mmu_device.h  |    39 +
>  .../atomisp/pci/hive_isp_css_include/pixelgen.h    |    46 +
>  .../pci/hive_isp_css_include/platform_support.h    |    36 +
>  .../pci/hive_isp_css_include/print_support.h       |    41 +
>  .../media/atomisp/pci/hive_isp_css_include/queue.h |    45 +
>  .../atomisp/pci/hive_isp_css_include/resource.h    |    46 +
>  .../media/atomisp/pci/hive_isp_css_include/sp.h    |    45 +
>  .../pci/hive_isp_css_include/string_support.h      |   165 +
>  .../pci/hive_isp_css_include/system_types.h        |    24 +
>  .../media/atomisp/pci/hive_isp_css_include/tag.h   |    44 +
>  .../atomisp/pci/hive_isp_css_include/timed_ctrl.h  |    45 +
>  .../pci/hive_isp_css_include/type_support.h        |    40 +
>  .../media/atomisp/pci/hive_isp_css_include/vamem.h |    36 +
>  .../media/atomisp/pci/hive_isp_css_include/vmem.h  |    45 +
>  .../pci/hive_isp_css_shared/host/queue_local.h     |    20 +
>  .../pci/hive_isp_css_shared/host/queue_private.h   |    18 +
>  .../atomisp/pci/hive_isp_css_shared/host/tag.c     |    91 +
>  .../pci/hive_isp_css_shared/host/tag_local.h       |    22 +
>  .../pci/hive_isp_css_shared/host/tag_private.h     |    18 +
>  .../atomisp/pci/hive_isp_css_shared/queue_global.h |    18 +
>  .../pci/hive_isp_css_shared/sw_event_global.h      |    35 +
>  .../atomisp/pci/hive_isp_css_shared/tag_global.h   |    56 +
>  .../pci/hive_isp_css_streaming_to_mipi_types_hrt.h |    26 +
>  drivers/staging/media/atomisp/pci/hive_types.h     |   128 +
>  drivers/staging/media/atomisp/pci/hmm/hmm.c        |   727 ++
>  drivers/staging/media/atomisp/pci/hmm/hmm_bo.c     |  1522 +++
>  .../media/atomisp/pci/hmm/hmm_dynamic_pool.c       |   233 +
>  .../media/atomisp/pci/hmm/hmm_reserved_pool.c      |   252 +
>  drivers/staging/media/atomisp/pci/hmm/hmm_vm.c     |   212 +
>  .../atomisp/pci/hrt/hive_isp_css_custom_host_hrt.h |   106 +
>  .../media/atomisp/pci/hrt/hive_isp_css_mm_hrt.c    |   124 +
>  .../media/atomisp/pci/hrt/hive_isp_css_mm_hrt.h    |    57 +
>  drivers/staging/media/atomisp/pci/ia_css.h         |    57 +
>  drivers/staging/media/atomisp/pci/ia_css_3a.h      |   189 +
>  .../staging/media/atomisp/pci/ia_css_acc_types.h   |   476 +
>  drivers/staging/media/atomisp/pci/ia_css_buffer.h  |    85 +
>  drivers/staging/media/atomisp/pci/ia_css_control.h |   156 +
>  .../media/atomisp/pci/ia_css_device_access.c       |    95 +
>  .../media/atomisp/pci/ia_css_device_access.h       |    60 +
>  drivers/staging/media/atomisp/pci/ia_css_dvs.h     |   297 +
>  drivers/staging/media/atomisp/pci/ia_css_env.h     |    94 +
>  drivers/staging/media/atomisp/pci/ia_css_err.h     |    63 +
>  .../media/atomisp/pci/ia_css_event_public.h        |   196 +
>  .../staging/media/atomisp/pci/ia_css_firmware.h    |    74 +
>  drivers/staging/media/atomisp/pci/ia_css_frac.h    |    37 +
>  .../media/atomisp/pci/ia_css_frame_format.h        |   101 +
>  .../media/atomisp/pci/ia_css_frame_public.h        |   353 +
>  .../staging/media/atomisp/pci/ia_css_host_data.h   |    45 +
>  .../staging/media/atomisp/pci/ia_css_input_port.h  |    60 +
>  drivers/staging/media/atomisp/pci/ia_css_irq.h     |   235 +
>  .../staging/media/atomisp/pci/ia_css_isp_configs.h |   191 +
>  .../staging/media/atomisp/pci/ia_css_isp_params.h  |   394 +
>  .../staging/media/atomisp/pci/ia_css_isp_states.h  |    73 +
>  .../media/atomisp/pci/ia_css_memory_access.c       |    85 +
>  .../staging/media/atomisp/pci/ia_css_metadata.h    |    72 +
>  drivers/staging/media/atomisp/pci/ia_css_mipi.h    |    82 +
>  drivers/staging/media/atomisp/pci/ia_css_mmu.h     |    32 +
>  .../staging/media/atomisp/pci/ia_css_mmu_private.h |    29 +
>  drivers/staging/media/atomisp/pci/ia_css_morph.h   |    39 +
>  drivers/staging/media/atomisp/pci/ia_css_pipe.h    |   189 +
>  .../staging/media/atomisp/pci/ia_css_pipe_public.h |   569 +
>  drivers/staging/media/atomisp/pci/ia_css_prbs.h    |    53 +
>  .../staging/media/atomisp/pci/ia_css_properties.h  |    41 +
>  drivers/staging/media/atomisp/pci/ia_css_shading.h |    40 +
>  drivers/staging/media/atomisp/pci/ia_css_stream.h  |   111 +
>  .../media/atomisp/pci/ia_css_stream_format.h       |    29 +
>  .../media/atomisp/pci/ia_css_stream_public.h       |   585 +
>  drivers/staging/media/atomisp/pci/ia_css_timer.h   |    68 +
>  drivers/staging/media/atomisp/pci/ia_css_tpg.h     |    78 +
>  drivers/staging/media/atomisp/pci/ia_css_types.h   |   605 +
>  drivers/staging/media/atomisp/pci/ia_css_version.h |    40 +
>  .../media/atomisp/pci/ia_css_version_data.h        |    27 +
>  drivers/staging/media/atomisp/pci/if_defs.h        |    22 +
>  .../atomisp/pci/input_formatter_subsystem_defs.h   |    53 +
>  .../media/atomisp/pci/input_selector_defs.h        |    88 +
>  .../media/atomisp/pci/input_switch_2400_defs.h     |    30 +
>  .../media/atomisp/pci/input_system_ctrl_defs.h     |   243 +
>  .../staging/media/atomisp/pci/input_system_defs.h  |   126 +
>  .../media/atomisp/pci/input_system_global.h        |    10 +
>  .../staging/media/atomisp/pci/input_system_local.h |    10 +
>  .../media/atomisp/pci/input_system_private.h       |    10 +
>  .../media/atomisp/pci/input_system_public.h        |     8 +
>  .../media/atomisp/pci/irq_controller_defs.h        |    28 +
>  .../pci/isp/kernels/aa/aa_2/ia_css_aa2.host.c      |    31 +
>  .../pci/isp/kernels/aa/aa_2/ia_css_aa2.host.h      |    27 +
>  .../pci/isp/kernels/aa/aa_2/ia_css_aa2_param.h     |    24 +
>  .../pci/isp/kernels/aa/aa_2/ia_css_aa2_types.h     |    46 +
>  .../pci/isp/kernels/anr/anr_1.0/ia_css_anr.host.c  |    61 +
>  .../pci/isp/kernels/anr/anr_1.0/ia_css_anr.host.h  |    39 +
>  .../pci/isp/kernels/anr/anr_1.0/ia_css_anr_param.h |    25 +
>  .../pci/isp/kernels/anr/anr_1.0/ia_css_anr_types.h |    35 +
>  .../pci/isp/kernels/anr/anr_2/ia_css_anr2.host.c   |    46 +
>  .../pci/isp/kernels/anr/anr_2/ia_css_anr2.host.h   |    35 +
>  .../pci/isp/kernels/anr/anr_2/ia_css_anr2_param.h  |    27 +
>  .../isp/kernels/anr/anr_2/ia_css_anr2_table.host.c |    55 +
>  .../isp/kernels/anr/anr_2/ia_css_anr2_table.host.h |    22 +
>  .../pci/isp/kernels/anr/anr_2/ia_css_anr2_types.h  |    31 +
>  .../pci/isp/kernels/bh/bh_2/ia_css_bh.host.c       |    66 +
>  .../pci/isp/kernels/bh/bh_2/ia_css_bh.host.h       |    32 +
>  .../pci/isp/kernels/bh/bh_2/ia_css_bh_param.h      |    40 +
>  .../pci/isp/kernels/bh/bh_2/ia_css_bh_types.h      |    35 +
>  .../pci/isp/kernels/bnlm/ia_css_bnlm.host.c        |   196 +
>  .../pci/isp/kernels/bnlm/ia_css_bnlm.host.h        |    40 +
>  .../pci/isp/kernels/bnlm/ia_css_bnlm_param.h       |    64 +
>  .../pci/isp/kernels/bnlm/ia_css_bnlm_types.h       |   106 +
>  .../isp/kernels/bnr/bnr2_2/ia_css_bnr2_2.host.c    |   131 +
>  .../isp/kernels/bnr/bnr2_2/ia_css_bnr2_2.host.h    |    35 +
>  .../isp/kernels/bnr/bnr2_2/ia_css_bnr2_2_param.h   |    47 +
>  .../isp/kernels/bnr/bnr2_2/ia_css_bnr2_2_types.h   |    71 +
>  .../pci/isp/kernels/bnr/bnr_1.0/ia_css_bnr.host.c  |    64 +
>  .../pci/isp/kernels/bnr/bnr_1.0/ia_css_bnr.host.h  |    34 +
>  .../pci/isp/kernels/bnr/bnr_1.0/ia_css_bnr_param.h |    30 +
>  .../pci/isp/kernels/cnr/cnr_1.0/ia_css_cnr.host.c  |    28 +
>  .../pci/isp/kernels/cnr/cnr_1.0/ia_css_cnr.host.h  |    25 +
>  .../pci/isp/kernels/cnr/cnr_1.0/ia_css_cnr_param.h |    24 +
>  .../pci/isp/kernels/cnr/cnr_2/ia_css_cnr2.host.c   |    73 +
>  .../pci/isp/kernels/cnr/cnr_2/ia_css_cnr2.host.h   |    43 +
>  .../pci/isp/kernels/cnr/cnr_2/ia_css_cnr2_param.h  |    32 +
>  .../pci/isp/kernels/cnr/cnr_2/ia_css_cnr2_types.h  |    54 +
>  .../conversion_1.0/ia_css_conversion.host.c        |    36 +
>  .../conversion_1.0/ia_css_conversion.host.h        |    29 +
>  .../conversion_1.0/ia_css_conversion_param.h       |    28 +
>  .../conversion_1.0/ia_css_conversion_types.h       |    32 +
>  .../copy_output_1.0/ia_css_copy_output.host.c      |    46 +
>  .../copy_output_1.0/ia_css_copy_output.host.h      |    34 +
>  .../copy_output_1.0/ia_css_copy_output_param.h     |    26 +
>  .../isp/kernels/crop/crop_1.0/ia_css_crop.host.c   |    64 +
>  .../isp/kernels/crop/crop_1.0/ia_css_crop.host.h   |    41 +
>  .../isp/kernels/crop/crop_1.0/ia_css_crop_param.h  |    32 +
>  .../isp/kernels/crop/crop_1.0/ia_css_crop_types.h  |    34 +
>  .../pci/isp/kernels/csc/csc_1.0/ia_css_csc.host.c  |   127 +
>  .../pci/isp/kernels/csc/csc_1.0/ia_css_csc.host.h  |    54 +
>  .../pci/isp/kernels/csc/csc_1.0/ia_css_csc_param.h |    33 +
>  .../pci/isp/kernels/csc/csc_1.0/ia_css_csc_types.h |    78 +
>  .../isp/kernels/ctc/ctc1_5/ia_css_ctc1_5.host.c    |   121 +
>  .../isp/kernels/ctc/ctc1_5/ia_css_ctc1_5.host.h    |    33 +
>  .../isp/kernels/ctc/ctc1_5/ia_css_ctc1_5_param.h   |    46 +
>  .../pci/isp/kernels/ctc/ctc2/ia_css_ctc2.host.c    |   157 +
>  .../pci/isp/kernels/ctc/ctc2/ia_css_ctc2.host.h    |    33 +
>  .../pci/isp/kernels/ctc/ctc2/ia_css_ctc2_param.h   |    48 +
>  .../pci/isp/kernels/ctc/ctc2/ia_css_ctc2_types.h   |    54 +
>  .../pci/isp/kernels/ctc/ctc_1.0/ia_css_ctc.host.c  |    58 +
>  .../pci/isp/kernels/ctc/ctc_1.0/ia_css_ctc.host.h  |    36 +
>  .../pci/isp/kernels/ctc/ctc_1.0/ia_css_ctc_param.h |    44 +
>  .../kernels/ctc/ctc_1.0/ia_css_ctc_table.host.c    |   214 +
>  .../kernels/ctc/ctc_1.0/ia_css_ctc_table.host.h    |    24 +
>  .../pci/isp/kernels/ctc/ctc_1.0/ia_css_ctc_types.h |   110 +
>  .../pci/isp/kernels/de/de_1.0/ia_css_de.host.c     |    78 +
>  .../pci/isp/kernels/de/de_1.0/ia_css_de.host.h     |    44 +
>  .../pci/isp/kernels/de/de_1.0/ia_css_de_param.h    |    27 +
>  .../pci/isp/kernels/de/de_1.0/ia_css_de_types.h    |    42 +
>  .../pci/isp/kernels/de/de_2/ia_css_de2.host.c      |    53 +
>  .../pci/isp/kernels/de/de_2/ia_css_de2.host.h      |    38 +
>  .../pci/isp/kernels/de/de_2/ia_css_de2_param.h     |    30 +
>  .../pci/isp/kernels/de/de_2/ia_css_de2_types.h     |    41 +
>  .../pci/isp/kernels/dp/dp_1.0/ia_css_dp.host.c     |   131 +
>  .../pci/isp/kernels/dp/dp_1.0/ia_css_dp.host.h     |    47 +
>  .../pci/isp/kernels/dp/dp_1.0/ia_css_dp_param.h    |    36 +
>  .../pci/isp/kernels/dp/dp_1.0/ia_css_dp_types.h    |    48 +
>  .../pci/isp/kernels/dpc2/ia_css_dpc2.host.c        |    65 +
>  .../pci/isp/kernels/dpc2/ia_css_dpc2.host.h        |    39 +
>  .../pci/isp/kernels/dpc2/ia_css_dpc2_param.h       |    51 +
>  .../pci/isp/kernels/dpc2/ia_css_dpc2_types.h       |    59 +
>  .../pci/isp/kernels/dvs/dvs_1.0/ia_css_dvs.host.c  |   301 +
>  .../pci/isp/kernels/dvs/dvs_1.0/ia_css_dvs.host.h  |    60 +
>  .../pci/isp/kernels/dvs/dvs_1.0/ia_css_dvs_param.h |    32 +
>  .../pci/isp/kernels/dvs/dvs_1.0/ia_css_dvs_types.h |    29 +
>  .../pci/isp/kernels/eed1_8/ia_css_eed1_8.host.c    |   338 +
>  .../pci/isp/kernels/eed1_8/ia_css_eed1_8.host.h    |    45 +
>  .../pci/isp/kernels/eed1_8/ia_css_eed1_8_param.h   |   153 +
>  .../pci/isp/kernels/eed1_8/ia_css_eed1_8_types.h   |    87 +
>  .../isp/kernels/fc/fc_1.0/ia_css_formats.host.c    |    63 +
>  .../isp/kernels/fc/fc_1.0/ia_css_formats.host.h    |    44 +
>  .../isp/kernels/fc/fc_1.0/ia_css_formats_param.h   |    25 +
>  .../isp/kernels/fc/fc_1.0/ia_css_formats_types.h   |    38 +
>  .../fixedbds/fixedbds_1.0/ia_css_fixedbds_param.h  |    32 +
>  .../fixedbds/fixedbds_1.0/ia_css_fixedbds_types.h  |    24 +
>  .../pci/isp/kernels/fpn/fpn_1.0/ia_css_fpn.host.c  |    88 +
>  .../pci/isp/kernels/fpn/fpn_1.0/ia_css_fpn.host.h  |    44 +
>  .../pci/isp/kernels/fpn/fpn_1.0/ia_css_fpn_param.h |    35 +
>  .../pci/isp/kernels/fpn/fpn_1.0/ia_css_fpn_types.h |    52 +
>  .../pci/isp/kernels/gc/gc_1.0/ia_css_gc.host.c     |   117 +
>  .../pci/isp/kernels/gc/gc_1.0/ia_css_gc.host.h     |    65 +
>  .../pci/isp/kernels/gc/gc_1.0/ia_css_gc_param.h    |    61 +
>  .../isp/kernels/gc/gc_1.0/ia_css_gc_table.host.c   |   213 +
>  .../isp/kernels/gc/gc_1.0/ia_css_gc_table.host.h   |    24 +
>  .../pci/isp/kernels/gc/gc_1.0/ia_css_gc_types.h    |    97 +
>  .../pci/isp/kernels/gc/gc_2/ia_css_gc2.host.c      |   109 +
>  .../pci/isp/kernels/gc/gc_2/ia_css_gc2.host.h      |    79 +
>  .../pci/isp/kernels/gc/gc_2/ia_css_gc2_param.h     |    43 +
>  .../isp/kernels/gc/gc_2/ia_css_gc2_table.host.c    |   131 +
>  .../isp/kernels/gc/gc_2/ia_css_gc2_table.host.h    |    26 +
>  .../pci/isp/kernels/gc/gc_2/ia_css_gc2_types.h     |    54 +
>  .../atomisp/pci/isp/kernels/hdr/ia_css_hdr.host.c  |    41 +
>  .../atomisp/pci/isp/kernels/hdr/ia_css_hdr.host.h  |    31 +
>  .../atomisp/pci/isp/kernels/hdr/ia_css_hdr_param.h |    59 +
>  .../atomisp/pci/isp/kernels/hdr/ia_css_hdr_types.h |    70 +
>  .../ipu2_io_ls/bayer_io_ls/ia_css_bayer_io.host.c  |    93 +
>  .../ipu2_io_ls/bayer_io_ls/ia_css_bayer_io.host.h  |    28 +
>  .../ipu2_io_ls/bayer_io_ls/ia_css_bayer_io_param.h |    20 +
>  .../ipu2_io_ls/bayer_io_ls/ia_css_bayer_io_types.h |    20 +
>  .../ipu2_io_ls/common/ia_css_common_io_param.h     |    20 +
>  .../ipu2_io_ls/common/ia_css_common_io_types.h     |    29 +
>  .../yuv444_io_ls/ia_css_yuv444_io.host.c           |    93 +
>  .../yuv444_io_ls/ia_css_yuv444_io.host.h           |    28 +
>  .../yuv444_io_ls/ia_css_yuv444_io_param.h          |    20 +
>  .../yuv444_io_ls/ia_css_yuv444_io_types.h          |    20 +
>  .../iterator/iterator_1.0/ia_css_iterator.host.c   |    80 +
>  .../iterator/iterator_1.0/ia_css_iterator.host.h   |    34 +
>  .../iterator/iterator_1.0/ia_css_iterator_param.h  |    38 +
>  .../isp/kernels/macc/macc1_5/ia_css_macc1_5.host.c |    74 +
>  .../isp/kernels/macc/macc1_5/ia_css_macc1_5.host.h |    41 +
>  .../kernels/macc/macc1_5/ia_css_macc1_5_param.h    |    31 +
>  .../macc/macc1_5/ia_css_macc1_5_table.host.c       |    34 +
>  .../macc/macc1_5/ia_css_macc1_5_table.host.h       |    22 +
>  .../kernels/macc/macc1_5/ia_css_macc1_5_types.h    |    73 +
>  .../isp/kernels/macc/macc_1.0/ia_css_macc.host.c   |    49 +
>  .../isp/kernels/macc/macc_1.0/ia_css_macc.host.h   |    41 +
>  .../isp/kernels/macc/macc_1.0/ia_css_macc_param.h  |    25 +
>  .../kernels/macc/macc_1.0/ia_css_macc_table.host.c |    51 +
>  .../kernels/macc/macc_1.0/ia_css_macc_table.host.h |    23 +
>  .../isp/kernels/macc/macc_1.0/ia_css_macc_types.h  |    63 +
>  .../isp/kernels/norm/norm_1.0/ia_css_norm.host.c   |    15 +
>  .../isp/kernels/norm/norm_1.0/ia_css_norm.host.h   |    20 +
>  .../isp/kernels/norm/norm_1.0/ia_css_norm_param.h  |    18 +
>  .../pci/isp/kernels/ob/ob2/ia_css_ob2.host.c       |    76 +
>  .../pci/isp/kernels/ob/ob2/ia_css_ob2.host.h       |    40 +
>  .../pci/isp/kernels/ob/ob2/ia_css_ob2_param.h      |    28 +
>  .../pci/isp/kernels/ob/ob2/ia_css_ob2_types.h      |    44 +
>  .../pci/isp/kernels/ob/ob_1.0/ia_css_ob.host.c     |   154 +
>  .../pci/isp/kernels/ob/ob_1.0/ia_css_ob.host.h     |    53 +
>  .../pci/isp/kernels/ob/ob_1.0/ia_css_ob_param.h    |    47 +
>  .../pci/isp/kernels/ob/ob_1.0/ia_css_ob_types.h    |    68 +
>  .../kernels/output/output_1.0/ia_css_output.host.c |   163 +
>  .../kernels/output/output_1.0/ia_css_output.host.h |    75 +
>  .../output/output_1.0/ia_css_output_param.h        |    36 +
>  .../output/output_1.0/ia_css_output_types.h        |    47 +
>  .../kernels/qplane/qplane_2/ia_css_qplane.host.c   |    61 +
>  .../kernels/qplane/qplane_2/ia_css_qplane.host.h   |    43 +
>  .../kernels/qplane/qplane_2/ia_css_qplane_param.h  |    30 +
>  .../kernels/qplane/qplane_2/ia_css_qplane_types.h  |    31 +
>  .../pci/isp/kernels/raw/raw_1.0/ia_css_raw.host.c  |   135 +
>  .../pci/isp/kernels/raw/raw_1.0/ia_css_raw.host.h  |    38 +
>  .../pci/isp/kernels/raw/raw_1.0/ia_css_raw_param.h |    38 +
>  .../pci/isp/kernels/raw/raw_1.0/ia_css_raw_types.h |    36 +
>  .../raw_aa_binning_1.0/ia_css_raa.host.c           |    35 +
>  .../raw_aa_binning_1.0/ia_css_raa.host.h           |    27 +
>  .../pci/isp/kernels/ref/ref_1.0/ia_css_ref.host.c  |    76 +
>  .../pci/isp/kernels/ref/ref_1.0/ia_css_ref.host.h  |    41 +
>  .../pci/isp/kernels/ref/ref_1.0/ia_css_ref_param.h |    36 +
>  .../pci/isp/kernels/ref/ref_1.0/ia_css_ref_state.h |    26 +
>  .../pci/isp/kernels/ref/ref_1.0/ia_css_ref_types.h |    25 +
>  .../pci/isp/kernels/s3a/s3a_1.0/ia_css_s3a.host.c  |   386 +
>  .../pci/isp/kernels/s3a/s3a_1.0/ia_css_s3a.host.h  |    77 +
>  .../pci/isp/kernels/s3a/s3a_1.0/ia_css_s3a_param.h |    53 +
>  .../pci/isp/kernels/s3a/s3a_1.0/ia_css_s3a_types.h |   221 +
>  .../pci/isp/kernels/sc/sc_1.0/ia_css_sc.host.c     |   129 +
>  .../pci/isp/kernels/sc/sc_1.0/ia_css_sc.host.h     |    77 +
>  .../pci/isp/kernels/sc/sc_1.0/ia_css_sc_param.h    |    42 +
>  .../pci/isp/kernels/sc/sc_1.0/ia_css_sc_types.h    |   134 +
>  .../kernels/sdis/common/ia_css_sdis_common.host.h  |   101 +
>  .../kernels/sdis/common/ia_css_sdis_common_types.h |   220 +
>  .../isp/kernels/sdis/sdis_1.0/ia_css_sdis.host.c   |   437 +
>  .../isp/kernels/sdis/sdis_1.0/ia_css_sdis.host.h   |   101 +
>  .../isp/kernels/sdis/sdis_1.0/ia_css_sdis_types.h  |    55 +
>  .../isp/kernels/sdis/sdis_2/ia_css_sdis2.host.c    |   350 +
>  .../isp/kernels/sdis/sdis_2/ia_css_sdis2.host.h    |    95 +
>  .../isp/kernels/sdis/sdis_2/ia_css_sdis2_types.h   |    75 +
>  .../pci/isp/kernels/tdf/tdf_1.0/ia_css_tdf.host.c  |    74 +
>  .../pci/isp/kernels/tdf/tdf_1.0/ia_css_tdf.host.h  |    38 +
>  .../pci/isp/kernels/tdf/tdf_1.0/ia_css_tdf_param.h |    43 +
>  .../pci/isp/kernels/tdf/tdf_1.0/ia_css_tdf_types.h |    52 +
>  .../pci/isp/kernels/tnr/tnr3/ia_css_tnr3_types.h   |    63 +
>  .../pci/isp/kernels/tnr/tnr_1.0/ia_css_tnr.host.c  |   120 +
>  .../pci/isp/kernels/tnr/tnr_1.0/ia_css_tnr.host.h  |    56 +
>  .../pci/isp/kernels/tnr/tnr_1.0/ia_css_tnr_param.h |    40 +
>  .../pci/isp/kernels/tnr/tnr_1.0/ia_css_tnr_state.h |    26 +
>  .../pci/isp/kernels/tnr/tnr_1.0/ia_css_tnr_types.h |    57 +
>  .../pci/isp/kernels/uds/uds_1.0/ia_css_uds_param.h |    31 +
>  .../pci/isp/kernels/vf/vf_1.0/ia_css_vf.host.c     |   138 +
>  .../pci/isp/kernels/vf/vf_1.0/ia_css_vf.host.h     |    47 +
>  .../pci/isp/kernels/vf/vf_1.0/ia_css_vf_param.h    |    37 +
>  .../pci/isp/kernels/vf/vf_1.0/ia_css_vf_types.h    |    31 +
>  .../pci/isp/kernels/wb/wb_1.0/ia_css_wb.host.c     |    86 +
>  .../pci/isp/kernels/wb/wb_1.0/ia_css_wb.host.h     |    39 +
>  .../pci/isp/kernels/wb/wb_1.0/ia_css_wb_param.h    |    29 +
>  .../pci/isp/kernels/wb/wb_1.0/ia_css_wb_types.h    |    46 +
>  .../pci/isp/kernels/xnr/xnr_1.0/ia_css_xnr.host.c  |    65 +
>  .../pci/isp/kernels/xnr/xnr_1.0/ia_css_xnr.host.h  |    47 +
>  .../pci/isp/kernels/xnr/xnr_1.0/ia_css_xnr_param.h |    50 +
>  .../kernels/xnr/xnr_1.0/ia_css_xnr_table.host.c    |    81 +
>  .../kernels/xnr/xnr_1.0/ia_css_xnr_table.host.h    |    22 +
>  .../pci/isp/kernels/xnr/xnr_1.0/ia_css_xnr_types.h |    70 +
>  .../pci/isp/kernels/xnr/xnr_3.0/ia_css_xnr3.host.c |   249 +
>  .../pci/isp/kernels/xnr/xnr_3.0/ia_css_xnr3.host.h |    41 +
>  .../isp/kernels/xnr/xnr_3.0/ia_css_xnr3_param.h    |    83 +
>  .../isp/kernels/xnr/xnr_3.0/ia_css_xnr3_types.h    |    97 +
>  .../pci/isp/kernels/ynr/ynr_1.0/ia_css_ynr.host.c  |   217 +
>  .../pci/isp/kernels/ynr/ynr_1.0/ia_css_ynr.host.h  |    60 +
>  .../pci/isp/kernels/ynr/ynr_1.0/ia_css_ynr_param.h |    49 +
>  .../pci/isp/kernels/ynr/ynr_1.0/ia_css_ynr_types.h |    80 +
>  .../pci/isp/kernels/ynr/ynr_2/ia_css_ynr2.host.c   |   118 +
>  .../pci/isp/kernels/ynr/ynr_2/ia_css_ynr2.host.h   |    56 +
>  .../pci/isp/kernels/ynr/ynr_2/ia_css_ynr2_param.h  |    45 +
>  .../pci/isp/kernels/ynr/ynr_2/ia_css_ynr2_types.h  |    93 +
>  .../pci/isp/modes/interface/input_buf.isp.h        |    37 +
>  .../atomisp/pci/isp/modes/interface/isp_const.h    |   180 +
>  .../atomisp/pci/isp/modes/interface/isp_types.h    |    79 +
>  .../atomisp/pci/isp2400_input_system_global.h      |   155 +
>  .../media/atomisp/pci/isp2400_input_system_local.h |   539 +
>  .../atomisp/pci/isp2400_input_system_private.h     |   122 +
>  .../atomisp/pci/isp2400_input_system_public.h      |   369 +
>  .../staging/media/atomisp/pci/isp2400_support.h    |    38 +
>  .../media/atomisp/pci/isp2400_system_global.h      |   348 +
>  .../media/atomisp/pci/isp2400_system_local.h       |   325 +
>  .../atomisp/pci/isp2401_input_system_global.h      |   205 +
>  .../media/atomisp/pci/isp2401_input_system_local.h |   106 +
>  .../atomisp/pci/isp2401_input_system_private.h     |   129 +
>  .../media/atomisp/pci/isp2401_mamoiada_params.h    |   228 +
>  .../media/atomisp/pci/isp2401_system_global.h      |   457 +
>  .../media/atomisp/pci/isp2401_system_local.h       |   406 +
>  .../media/atomisp/pci/isp_acquisition_defs.h       |   229 +
>  .../staging/media/atomisp/pci/isp_capture_defs.h   |   278 +
>  drivers/staging/media/atomisp/pci/memory_realloc.c |    81 +
>  drivers/staging/media/atomisp/pci/mmu/isp_mmu.c    |   581 +
>  .../staging/media/atomisp/pci/mmu/sh_mmu_mrfld.c   |    77 +
>  drivers/staging/media/atomisp/pci/mmu_defs.h       |    23 +
>  .../pci/runtime/binary/interface/ia_css_binary.h   |   228 +
>  .../media/atomisp/pci/runtime/binary/src/binary.c  |  1852 +++
>  .../pci/runtime/bufq/interface/ia_css_bufq.h       |   177 +
>  .../pci/runtime/bufq/interface/ia_css_bufq_comm.h  |    50 +
>  .../media/atomisp/pci/runtime/bufq/src/bufq.c      |   566 +
>  .../pci/runtime/debug/interface/ia_css_debug.h     |   502 +
>  .../debug/interface/ia_css_debug_internal.h        |    15 +
>  .../runtime/debug/interface/ia_css_debug_pipe.h    |    67 +
>  .../atomisp/pci/runtime/debug/src/ia_css_debug.c   |  3544 ++++++
>  .../pci/runtime/event/interface/ia_css_event.h     |    30 +
>  .../media/atomisp/pci/runtime/event/src/event.c    |   112 +
>  .../pci/runtime/eventq/interface/ia_css_eventq.h   |    53 +
>  .../media/atomisp/pci/runtime/eventq/src/eventq.c  |    77 +
>  .../pci/runtime/frame/interface/ia_css_frame.h     |   163 +
>  .../runtime/frame/interface/ia_css_frame_comm.h    |   115 +
>  .../media/atomisp/pci/runtime/frame/src/frame.c    |   989 ++
>  .../pci/runtime/ifmtr/interface/ia_css_ifmtr.h     |    33 +
>  .../media/atomisp/pci/runtime/ifmtr/src/ifmtr.c    |   552 +
>  .../runtime/inputfifo/interface/ia_css_inputfifo.h |    53 +
>  .../atomisp/pci/runtime/inputfifo/src/inputfifo.c  |   538 +
>  .../runtime/isp_param/interface/ia_css_isp_param.h |   102 +
>  .../isp_param/interface/ia_css_isp_param_types.h   |    81 +
>  .../atomisp/pci/runtime/isp_param/src/isp_param.c  |   216 +
>  .../pci/runtime/isys/interface/ia_css_isys.h       |   184 +
>  .../pci/runtime/isys/interface/ia_css_isys_comm.h  |    53 +
>  .../atomisp/pci/runtime/isys/src/csi_rx_rmgr.c     |   167 +
>  .../atomisp/pci/runtime/isys/src/csi_rx_rmgr.h     |    26 +
>  .../atomisp/pci/runtime/isys/src/ibuf_ctrl_rmgr.c  |   121 +
>  .../atomisp/pci/runtime/isys/src/ibuf_ctrl_rmgr.h  |    38 +
>  .../atomisp/pci/runtime/isys/src/isys_dma_rmgr.c   |    87 +
>  .../atomisp/pci/runtime/isys/src/isys_dma_rmgr.h   |    24 +
>  .../media/atomisp/pci/runtime/isys/src/isys_init.c |   123 +
>  .../pci/runtime/isys/src/isys_stream2mmio_rmgr.c   |    89 +
>  .../pci/runtime/isys/src/isys_stream2mmio_rmgr.h   |    24 +
>  .../media/atomisp/pci/runtime/isys/src/rx.c        |   600 +
>  .../atomisp/pci/runtime/isys/src/virtual_isys.c    |   892 ++
>  .../atomisp/pci/runtime/isys/src/virtual_isys.h    |    24 +
>  .../runtime/pipeline/interface/ia_css_pipeline.h   |   286 +
>  .../pipeline/interface/ia_css_pipeline_common.h    |    27 +
>  .../atomisp/pci/runtime/pipeline/src/pipeline.c    |   786 ++
>  .../pci/runtime/queue/interface/ia_css_queue.h     |   175 +
>  .../runtime/queue/interface/ia_css_queue_comm.h    |    53 +
>  .../media/atomisp/pci/runtime/queue/src/queue.c    |   422 +
>  .../atomisp/pci/runtime/queue/src/queue_access.c   |   176 +
>  .../atomisp/pci/runtime/queue/src/queue_access.h   |    85 +
>  .../pci/runtime/rmgr/interface/ia_css_rmgr.h       |    72 +
>  .../pci/runtime/rmgr/interface/ia_css_rmgr_vbuf.h  |    99 +
>  .../media/atomisp/pci/runtime/rmgr/src/rmgr.c      |    39 +
>  .../media/atomisp/pci/runtime/rmgr/src/rmgr_vbuf.c |   336 +
>  .../pci/runtime/spctrl/interface/ia_css_spctrl.h   |    68 +
>  .../runtime/spctrl/interface/ia_css_spctrl_comm.h  |    45 +
>  .../media/atomisp/pci/runtime/spctrl/src/spctrl.c  |   182 +
>  .../tagger/interface/ia_css_tagger_common.h        |    43 +
>  .../media/atomisp/pci/runtime/timer/src/timer.c    |    31 +
>  .../atomisp/pci/scalar_processor_2400_params.h     |    20 +
>  drivers/staging/media/atomisp/pci/sh_css.c         | 11179
> +++++++++++++++++++
>  drivers/staging/media/atomisp/pci/sh_css_defs.h    |   410 +
>  .../staging/media/atomisp/pci/sh_css_dvs_info.h    |    36 +
>  .../staging/media/atomisp/pci/sh_css_firmware.c    |   331 +
>  .../staging/media/atomisp/pci/sh_css_firmware.h    |    55 +
>  drivers/staging/media/atomisp/pci/sh_css_frac.h    |    40 +
>  .../staging/media/atomisp/pci/sh_css_host_data.c   |    42 +
>  drivers/staging/media/atomisp/pci/sh_css_hrt.c     |    85 +
>  drivers/staging/media/atomisp/pci/sh_css_hrt.h     |    34 +
>  .../staging/media/atomisp/pci/sh_css_internal.h    |  1061 ++
>  drivers/staging/media/atomisp/pci/sh_css_legacy.h  |    70 +
>  .../staging/media/atomisp/pci/sh_css_metadata.c    |    16 +
>  drivers/staging/media/atomisp/pci/sh_css_metrics.c |   175 +
>  drivers/staging/media/atomisp/pci/sh_css_metrics.h |    55 +
>  drivers/staging/media/atomisp/pci/sh_css_mipi.c    |   757 ++
>  drivers/staging/media/atomisp/pci/sh_css_mipi.h    |    49 +
>  drivers/staging/media/atomisp/pci/sh_css_mmu.c     |    60 +
>  drivers/staging/media/atomisp/pci/sh_css_morph.c   |    16 +
>  .../staging/media/atomisp/pci/sh_css_param_dvs.c   |   286 +
>  .../staging/media/atomisp/pci/sh_css_param_dvs.h   |    85 +
>  .../media/atomisp/pci/sh_css_param_shading.c       |   402 +
>  .../media/atomisp/pci/sh_css_param_shading.h       |    34 +
>  drivers/staging/media/atomisp/pci/sh_css_params.c  |  5247 +++++++++
>  drivers/staging/media/atomisp/pci/sh_css_params.h  |   188 +
>  .../media/atomisp/pci/sh_css_params_internal.h     |    21 +
>  drivers/staging/media/atomisp/pci/sh_css_pipe.c    |    16 +
>  .../staging/media/atomisp/pci/sh_css_properties.c  |    43 +
>  drivers/staging/media/atomisp/pci/sh_css_shading.c |    16 +
>  drivers/staging/media/atomisp/pci/sh_css_sp.c      |  1829 +++
>  drivers/staging/media/atomisp/pci/sh_css_sp.h      |   248 +
>  drivers/staging/media/atomisp/pci/sh_css_stream.c  |    16 +
>  .../media/atomisp/pci/sh_css_stream_format.c       |    76 +
>  .../media/atomisp/pci/sh_css_stream_format.h       |    23 +
>  drivers/staging/media/atomisp/pci/sh_css_struct.h  |    85 +
>  drivers/staging/media/atomisp/pci/sh_css_uds.h     |    37 +
>  drivers/staging/media/atomisp/pci/sh_css_version.c |    37 +
>  drivers/staging/media/atomisp/pci/str2mem_defs.h   |    39 +
>  .../media/atomisp/pci/streaming_to_mipi_defs.h     |    28 +
>  drivers/staging/media/atomisp/pci/system_global.h  |    10 +
>  drivers/staging/media/atomisp/pci/system_local.h   |    10 +
>  .../media/atomisp/pci/timed_controller_defs.h      |    22 +
>  drivers/staging/media/atomisp/pci/version.h        |    20 +
>  drivers/staging/media/atomisp/platform/Makefile    |     5 +
>  .../media/atomisp/platform/intel-mid/Makefile      |     4 +
>  .../platform/intel-mid/atomisp_gmin_platform.c     |   810 ++
>  677 files changed, 147292 insertions(+)
>  create mode 100644 drivers/staging/media/atomisp/Kconfig
>  create mode 100644 drivers/staging/media/atomisp/Makefile
>  create mode 100644 drivers/staging/media/atomisp/TODO
>  create mode 100644 drivers/staging/media/atomisp/i2c/Kconfig
>  create mode 100644 drivers/staging/media/atomisp/i2c/Makefile
>  create mode 100644 drivers/staging/media/atomisp/i2c/atomisp-
> gc0310.c
>  create mode 100644 drivers/staging/media/atomisp/i2c/atomisp-
> gc2235.c
>  create mode 100644 drivers/staging/media/atomisp/i2c/atomisp-
> libmsrlisthelper.c
>  create mode 100644 drivers/staging/media/atomisp/i2c/atomisp-
> lm3554.c
>  create mode 100644 drivers/staging/media/atomisp/i2c/atomisp-
> mt9m114.c
>  create mode 100644 drivers/staging/media/atomisp/i2c/atomisp-
> ov2680.c
>  create mode 100644 drivers/staging/media/atomisp/i2c/atomisp-
> ov2722.c
>  create mode 100644 drivers/staging/media/atomisp/i2c/gc0310.h
>  create mode 100644 drivers/staging/media/atomisp/i2c/gc2235.h
>  create mode 100644 drivers/staging/media/atomisp/i2c/mt9m114.h
>  create mode 100644 drivers/staging/media/atomisp/i2c/ov2680.h
>  create mode 100644 drivers/staging/media/atomisp/i2c/ov2722.h
>  create mode 100644 drivers/staging/media/atomisp/i2c/ov5693/Kconfig
>  create mode 100644 drivers/staging/media/atomisp/i2c/ov5693/Makefile
>  create mode 100644 drivers/staging/media/atomisp/i2c/ov5693/ad5823.h
>  create mode 100644 drivers/staging/media/atomisp/i2c/ov5693/atomisp-
> ov5693.c
>  create mode 100644 drivers/staging/media/atomisp/i2c/ov5693/ov5693.h
>  create mode 100644 drivers/staging/media/atomisp/include/hmm/hmm.h
>  create mode 100644
> drivers/staging/media/atomisp/include/hmm/hmm_bo.h
>  create mode 100644
> drivers/staging/media/atomisp/include/hmm/hmm_common.h
>  create mode 100644
> drivers/staging/media/atomisp/include/hmm/hmm_pool.h
>  create mode 100644
> drivers/staging/media/atomisp/include/hmm/hmm_vm.h
>  create mode 100644
> drivers/staging/media/atomisp/include/linux/atomisp.h
>  create mode 100644
> drivers/staging/media/atomisp/include/linux/atomisp_gmin_platform.h
>  create mode 100644
> drivers/staging/media/atomisp/include/linux/atomisp_platform.h
>  create mode 100644
> drivers/staging/media/atomisp/include/linux/libmsrlisthelper.h
>  create mode 100644
> drivers/staging/media/atomisp/include/media/lm3554.h
>  create mode 100644
> drivers/staging/media/atomisp/include/mmu/isp_mmu.h
>  create mode 100644
> drivers/staging/media/atomisp/include/mmu/sh_mmu_mrfld.h
>  create mode 100644 drivers/staging/media/atomisp/pci/atomisp-regs.h
>  create mode 100644 drivers/staging/media/atomisp/pci/atomisp_acc.c
>  create mode 100644 drivers/staging/media/atomisp/pci/atomisp_acc.h
>  create mode 100644 drivers/staging/media/atomisp/pci/atomisp_cmd.c
>  create mode 100644 drivers/staging/media/atomisp/pci/atomisp_cmd.h
>  create mode 100644
> drivers/staging/media/atomisp/pci/atomisp_common.h
>  create mode 100644
> drivers/staging/media/atomisp/pci/atomisp_compat.h
>  create mode 100644
> drivers/staging/media/atomisp/pci/atomisp_compat_css20.c
>  create mode 100644
> drivers/staging/media/atomisp/pci/atomisp_compat_css20.h
>  create mode 100644
> drivers/staging/media/atomisp/pci/atomisp_compat_ioctl32.c
>  create mode 100644
> drivers/staging/media/atomisp/pci/atomisp_compat_ioctl32.h
>  create mode 100644 drivers/staging/media/atomisp/pci/atomisp_csi2.c
>  create mode 100644 drivers/staging/media/atomisp/pci/atomisp_csi2.h
>  create mode 100644
> drivers/staging/media/atomisp/pci/atomisp_dfs_tables.h
>  create mode 100644 drivers/staging/media/atomisp/pci/atomisp_drvfs.c
>  create mode 100644 drivers/staging/media/atomisp/pci/atomisp_drvfs.h
>  create mode 100644 drivers/staging/media/atomisp/pci/atomisp_file.c
>  create mode 100644 drivers/staging/media/atomisp/pci/atomisp_file.h
>  create mode 100644 drivers/staging/media/atomisp/pci/atomisp_fops.c
>  create mode 100644 drivers/staging/media/atomisp/pci/atomisp_fops.h
>  create mode 100644
> drivers/staging/media/atomisp/pci/atomisp_helper.h
>  create mode 100644
> drivers/staging/media/atomisp/pci/atomisp_internal.h
>  create mode 100644 drivers/staging/media/atomisp/pci/atomisp_ioctl.c
>  create mode 100644 drivers/staging/media/atomisp/pci/atomisp_ioctl.h
>  create mode 100644
> drivers/staging/media/atomisp/pci/atomisp_subdev.c
>  create mode 100644
> drivers/staging/media/atomisp/pci/atomisp_subdev.h
>  create mode 100644
> drivers/staging/media/atomisp/pci/atomisp_tables.h
>  create mode 100644 drivers/staging/media/atomisp/pci/atomisp_tpg.c
>  create mode 100644 drivers/staging/media/atomisp/pci/atomisp_tpg.h
>  create mode 100644
> drivers/staging/media/atomisp/pci/atomisp_trace_event.h
>  create mode 100644 drivers/staging/media/atomisp/pci/atomisp_v4l2.c
>  create mode 100644 drivers/staging/media/atomisp/pci/atomisp_v4l2.h
>  create mode 100644
> drivers/staging/media/atomisp/pci/base/circbuf/interface/ia_css_circb
> uf.h
>  create mode 100644
> drivers/staging/media/atomisp/pci/base/circbuf/interface/ia_css_circb
> uf_comm.h
>  create mode 100644
> drivers/staging/media/atomisp/pci/base/circbuf/interface/ia_css_circb
> uf_desc.h
>  create mode 100644
> drivers/staging/media/atomisp/pci/base/circbuf/src/circbuf.c
>  create mode 100644
> drivers/staging/media/atomisp/pci/base/refcount/interface/ia_css_refc
> ount.h
>  create mode 100644
> drivers/staging/media/atomisp/pci/base/refcount/src/refcount.c
>  create mode 100644 drivers/staging/media/atomisp/pci/bits.h
>  create mode 100644
> drivers/staging/media/atomisp/pci/camera/pipe/interface/ia_css_pipe_b
> inarydesc.h
>  create mode 100644
> drivers/staging/media/atomisp/pci/camera/pipe/interface/ia_css_pipe_s
> tagedesc.h
>  create mode 100644
> drivers/staging/media/atomisp/pci/camera/pipe/interface/ia_css_pipe_u
> til.h
>  create mode 100644
> drivers/staging/media/atomisp/pci/camera/pipe/src/pipe_binarydesc.c
>  create mode 100644
> drivers/staging/media/atomisp/pci/camera/pipe/src/pipe_stagedesc.c
>  create mode 100644
> drivers/staging/media/atomisp/pci/camera/pipe/src/pipe_util.c
>  create mode 100644
> drivers/staging/media/atomisp/pci/camera/util/interface/ia_css_util.h
>  create mode 100644
> drivers/staging/media/atomisp/pci/camera/util/src/util.c
>  create mode 100644 drivers/staging/media/atomisp/pci/cell_params.h
>  create mode 100644
> drivers/staging/media/atomisp/pci/css_2400_system/hive/ia_css_isp_con
> figs.c
>  create mode 100644
> drivers/staging/media/atomisp/pci/css_2400_system/hive/ia_css_isp_par
> ams.c
>  create mode 100644
> drivers/staging/media/atomisp/pci/css_2400_system/hive/ia_css_isp_sta
> tes.c
>  create mode 100644
> drivers/staging/media/atomisp/pci/css_2400_system/hrt/hive_isp_css_ir
> q_types_hrt.h
>  create mode 100644
> drivers/staging/media/atomisp/pci/css_2400_system/hrt/isp2400_mamoiad
> a_params.h
>  create mode 100644
> drivers/staging/media/atomisp/pci/css_2400_system/spmem_dump.c
>  create mode 100644
> drivers/staging/media/atomisp/pci/css_2401_system/csi_rx_global.h
>  create mode 100644
> drivers/staging/media/atomisp/pci/css_2401_system/hive/ia_css_isp_con
> figs.c
>  create mode 100644
> drivers/staging/media/atomisp/pci/css_2401_system/hive/ia_css_isp_par
> ams.c
>  create mode 100644
> drivers/staging/media/atomisp/pci/css_2401_system/hive/ia_css_isp_sta
> tes.c
>  create mode 100644
> drivers/staging/media/atomisp/pci/css_2401_system/host/csi_rx.c
>  create mode 100644
> drivers/staging/media/atomisp/pci/css_2401_system/host/csi_rx_local.h
>  create mode 100644
> drivers/staging/media/atomisp/pci/css_2401_system/host/csi_rx_private
> .h
>  create mode 100644
> drivers/staging/media/atomisp/pci/css_2401_system/host/ibuf_ctrl.c
>  create mode 100644
> drivers/staging/media/atomisp/pci/css_2401_system/host/ibuf_ctrl_loca
> l.h
>  create mode 100644
> drivers/staging/media/atomisp/pci/css_2401_system/host/ibuf_ctrl_priv
> ate.h
>  create mode 100644
> drivers/staging/media/atomisp/pci/css_2401_system/host/isys_dma.c
>  create mode 100644
> drivers/staging/media/atomisp/pci/css_2401_system/host/isys_dma_local
> .h
>  create mode 100644
> drivers/staging/media/atomisp/pci/css_2401_system/host/isys_dma_priva
> te.h
>  create mode 100644
> drivers/staging/media/atomisp/pci/css_2401_system/host/isys_irq.c
>  create mode 100644
> drivers/staging/media/atomisp/pci/css_2401_system/host/isys_irq_local
> .h
>  create mode 100644
> drivers/staging/media/atomisp/pci/css_2401_system/host/isys_irq_priva
> te.h
>  create mode 100644
> drivers/staging/media/atomisp/pci/css_2401_system/host/isys_stream2mm
> io.c
>  create mode 100644
> drivers/staging/media/atomisp/pci/css_2401_system/host/isys_stream2mm
> io_local.h
>  create mode 100644
> drivers/staging/media/atomisp/pci/css_2401_system/host/isys_stream2mm
> io_private.h
>  create mode 100644
> drivers/staging/media/atomisp/pci/css_2401_system/host/pixelgen_local
> .h
>  create mode 100644
> drivers/staging/media/atomisp/pci/css_2401_system/host/pixelgen_priva
> te.h
>  create mode 100644
> drivers/staging/media/atomisp/pci/css_2401_system/hrt/PixelGen_SysBlo
> ck_defs.h
>  create mode 100644
> drivers/staging/media/atomisp/pci/css_2401_system/hrt/ibuf_cntrl_defs
> .h
>  create mode 100644
> drivers/staging/media/atomisp/pci/css_2401_system/hrt/mipi_backend_co
> mmon_defs.h
>  create mode 100644
> drivers/staging/media/atomisp/pci/css_2401_system/hrt/mipi_backend_de
> fs.h
>  create mode 100644
> drivers/staging/media/atomisp/pci/css_2401_system/hrt/rx_csi_defs.h
>  create mode 100644
> drivers/staging/media/atomisp/pci/css_2401_system/hrt/stream2mmio_def
> s.h
>  create mode 100644
> drivers/staging/media/atomisp/pci/css_2401_system/ibuf_ctrl_global.h
>  create mode 100644
> drivers/staging/media/atomisp/pci/css_2401_system/isys_dma_global.h
>  create mode 100644
> drivers/staging/media/atomisp/pci/css_2401_system/isys_irq_global.h
>  create mode 100644
> drivers/staging/media/atomisp/pci/css_2401_system/isys_stream2mmio_gl
> obal.h
>  create mode 100644
> drivers/staging/media/atomisp/pci/css_2401_system/pixelgen_global.h
>  create mode 100644
> drivers/staging/media/atomisp/pci/css_2401_system/spmem_dump.c
>  create mode 100644
> drivers/staging/media/atomisp/pci/css_receiver_2400_common_defs.h
>  create mode 100644
> drivers/staging/media/atomisp/pci/css_receiver_2400_defs.h
>  create mode 100644 drivers/staging/media/atomisp/pci/css_trace.h
>  create mode 100644 drivers/staging/media/atomisp/pci/defs.h
>  create mode 100644 drivers/staging/media/atomisp/pci/dma_v2_defs.h
>  create mode 100644 drivers/staging/media/atomisp/pci/gdc_v2_defs.h
>  create mode 100644 drivers/staging/media/atomisp/pci/gp_timer_defs.h
>  create mode 100644
> drivers/staging/media/atomisp/pci/gpio_block_defs.h
>  create mode 100644
> drivers/staging/media/atomisp/pci/hive_isp_css_2401_irq_types_hrt.h
>  create mode 100644
> drivers/staging/media/atomisp/pci/hive_isp_css_common/debug_global.h
>  create mode 100644
> drivers/staging/media/atomisp/pci/hive_isp_css_common/dma_global.h
>  create mode 100644
> drivers/staging/media/atomisp/pci/hive_isp_css_common/event_fifo_glob
> al.h
>  create mode 100644
> drivers/staging/media/atomisp/pci/hive_isp_css_common/fifo_monitor_gl
> obal.h
>  create mode 100644
> drivers/staging/media/atomisp/pci/hive_isp_css_common/gdc_global.h
>  create mode 100644
> drivers/staging/media/atomisp/pci/hive_isp_css_common/gp_device_globa
> l.h
>  create mode 100644
> drivers/staging/media/atomisp/pci/hive_isp_css_common/gp_timer_global
> .h
>  create mode 100644
> drivers/staging/media/atomisp/pci/hive_isp_css_common/gpio_global.h
>  create mode 100644
> drivers/staging/media/atomisp/pci/hive_isp_css_common/hmem_global.h
>  create mode 100644
> drivers/staging/media/atomisp/pci/hive_isp_css_common/host/debug.c
>  create mode 100644
> drivers/staging/media/atomisp/pci/hive_isp_css_common/host/debug_loca
> l.h
>  create mode 100644
> drivers/staging/media/atomisp/pci/hive_isp_css_common/host/debug_priv
> ate.h
>  create mode 100644
> drivers/staging/media/atomisp/pci/hive_isp_css_common/host/dma.c
>  create mode 100644
> drivers/staging/media/atomisp/pci/hive_isp_css_common/host/dma_local.
> h
>  create mode 100644
> drivers/staging/media/atomisp/pci/hive_isp_css_common/host/dma_privat
> e.h
>  create mode 100644
> drivers/staging/media/atomisp/pci/hive_isp_css_common/host/event_fifo
> .c
>  create mode 100644
> drivers/staging/media/atomisp/pci/hive_isp_css_common/host/event_fifo
> _local.h
>  create mode 100644
> drivers/staging/media/atomisp/pci/hive_isp_css_common/host/event_fifo
> _private.h
>  create mode 100644
> drivers/staging/media/atomisp/pci/hive_isp_css_common/host/fifo_monit
> or.c
>  create mode 100644
> drivers/staging/media/atomisp/pci/hive_isp_css_common/host/fifo_monit
> or_local.h
>  create mode 100644
> drivers/staging/media/atomisp/pci/hive_isp_css_common/host/fifo_monit
> or_private.h
>  create mode 100644
> drivers/staging/media/atomisp/pci/hive_isp_css_common/host/gdc.c
>  create mode 100644
> drivers/staging/media/atomisp/pci/hive_isp_css_common/host/gdc_local.
> h
>  create mode 100644
> drivers/staging/media/atomisp/pci/hive_isp_css_common/host/gdc_privat
> e.h
>  create mode 100644
> drivers/staging/media/atomisp/pci/hive_isp_css_common/host/gp_device.
> c
>  create mode 100644
> drivers/staging/media/atomisp/pci/hive_isp_css_common/host/gp_device_
> local.h
>  create mode 100644
> drivers/staging/media/atomisp/pci/hive_isp_css_common/host/gp_device_
> private.h
>  create mode 100644
> drivers/staging/media/atomisp/pci/hive_isp_css_common/host/gp_timer.c
>  create mode 100644
> drivers/staging/media/atomisp/pci/hive_isp_css_common/host/gp_timer_l
> ocal.h
>  create mode 100644
> drivers/staging/media/atomisp/pci/hive_isp_css_common/host/gp_timer_p
> rivate.h
>  create mode 100644
> drivers/staging/media/atomisp/pci/hive_isp_css_common/host/gpio_local
> .h
>  create mode 100644
> drivers/staging/media/atomisp/pci/hive_isp_css_common/host/gpio_priva
> te.h
>  create mode 100644
> drivers/staging/media/atomisp/pci/hive_isp_css_common/host/hmem.c
>  create mode 100644
> drivers/staging/media/atomisp/pci/hive_isp_css_common/host/hmem_local
> .h
>  create mode 100644
> drivers/staging/media/atomisp/pci/hive_isp_css_common/host/hmem_priva
> te.h
>  create mode 100644
> drivers/staging/media/atomisp/pci/hive_isp_css_common/host/input_form
> atter.c
>  create mode 100644
> drivers/staging/media/atomisp/pci/hive_isp_css_common/host/input_form
> atter_local.h
>  create mode 100644
> drivers/staging/media/atomisp/pci/hive_isp_css_common/host/input_form
> atter_private.h
>  create mode 100644
> drivers/staging/media/atomisp/pci/hive_isp_css_common/host/input_syst
> em.c
>  create mode 100644
> drivers/staging/media/atomisp/pci/hive_isp_css_common/host/irq.c
>  create mode 100644
> drivers/staging/media/atomisp/pci/hive_isp_css_common/host/irq_local.
> h
>  create mode 100644
> drivers/staging/media/atomisp/pci/hive_isp_css_common/host/irq_privat
> e.h
>  create mode 100644
> drivers/staging/media/atomisp/pci/hive_isp_css_common/host/isp.c
>  create mode 100644
> drivers/staging/media/atomisp/pci/hive_isp_css_common/host/isp_local.
> h
>  create mode 100644
> drivers/staging/media/atomisp/pci/hive_isp_css_common/host/isp_privat
> e.h
>  create mode 100644
> drivers/staging/media/atomisp/pci/hive_isp_css_common/host/mmu.c
>  create mode 100644
> drivers/staging/media/atomisp/pci/hive_isp_css_common/host/mmu_local.
> h
>  create mode 100644
> drivers/staging/media/atomisp/pci/hive_isp_css_common/host/sp.c
>  create mode 100644
> drivers/staging/media/atomisp/pci/hive_isp_css_common/host/sp_local.h
>  create mode 100644
> drivers/staging/media/atomisp/pci/hive_isp_css_common/host/sp_private
> .h
>  create mode 100644
> drivers/staging/media/atomisp/pci/hive_isp_css_common/host/timed_ctrl
> .c
>  create mode 100644
> drivers/staging/media/atomisp/pci/hive_isp_css_common/host/timed_ctrl
> _local.h
>  create mode 100644
> drivers/staging/media/atomisp/pci/hive_isp_css_common/host/timed_ctrl
> _private.h
>  create mode 100644
> drivers/staging/media/atomisp/pci/hive_isp_css_common/host/vamem_loca
> l.h
>  create mode 100644
> drivers/staging/media/atomisp/pci/hive_isp_css_common/host/vmem.c
>  create mode 100644
> drivers/staging/media/atomisp/pci/hive_isp_css_common/host/vmem_local
> .h
>  create mode 100644
> drivers/staging/media/atomisp/pci/hive_isp_css_common/host/vmem_priva
> te.h
>  create mode 100644
> drivers/staging/media/atomisp/pci/hive_isp_css_common/input_formatter
> _global.h
>  create mode 100644
> drivers/staging/media/atomisp/pci/hive_isp_css_common/irq_global.h
>  create mode 100644
> drivers/staging/media/atomisp/pci/hive_isp_css_common/isp_global.h
>  create mode 100644
> drivers/staging/media/atomisp/pci/hive_isp_css_common/mmu_global.h
>  create mode 100644
> drivers/staging/media/atomisp/pci/hive_isp_css_common/sp_global.h
>  create mode 100644
> drivers/staging/media/atomisp/pci/hive_isp_css_common/timed_ctrl_glob
> al.h
>  create mode 100644
> drivers/staging/media/atomisp/pci/hive_isp_css_common/vamem_global.h
>  create mode 100644
> drivers/staging/media/atomisp/pci/hive_isp_css_common/vmem_global.h
>  create mode 100644
> drivers/staging/media/atomisp/pci/hive_isp_css_defs.h
>  create mode 100644
> drivers/staging/media/atomisp/pci/hive_isp_css_include/assert_support
> .h
>  create mode 100644
> drivers/staging/media/atomisp/pci/hive_isp_css_include/bitop_support.
> h
>  create mode 100644
> drivers/staging/media/atomisp/pci/hive_isp_css_include/csi_rx.h
>  create mode 100644
> drivers/staging/media/atomisp/pci/hive_isp_css_include/debug.h
>  create mode 100644
> drivers/staging/media/atomisp/pci/hive_isp_css_include/device_access/
> device_access.h
>  create mode 100644
> drivers/staging/media/atomisp/pci/hive_isp_css_include/dma.h
>  create mode 100644
> drivers/staging/media/atomisp/pci/hive_isp_css_include/error_support.
> h
>  create mode 100644
> drivers/staging/media/atomisp/pci/hive_isp_css_include/event_fifo.h
>  create mode 100644
> drivers/staging/media/atomisp/pci/hive_isp_css_include/fifo_monitor.h
>  create mode 100644
> drivers/staging/media/atomisp/pci/hive_isp_css_include/gdc_device.h
>  create mode 100644
> drivers/staging/media/atomisp/pci/hive_isp_css_include/gp_device.h
>  create mode 100644
> drivers/staging/media/atomisp/pci/hive_isp_css_include/gp_timer.h
>  create mode 100644
> drivers/staging/media/atomisp/pci/hive_isp_css_include/gpio.h
>  create mode 100644
> drivers/staging/media/atomisp/pci/hive_isp_css_include/hmem.h
>  create mode 100644
> drivers/staging/media/atomisp/pci/hive_isp_css_include/host/csi_rx_pu
> blic.h
>  create mode 100644
> drivers/staging/media/atomisp/pci/hive_isp_css_include/host/debug_pub
> lic.h
>  create mode 100644
> drivers/staging/media/atomisp/pci/hive_isp_css_include/host/dma_publi
> c.h
>  create mode 100644
> drivers/staging/media/atomisp/pci/hive_isp_css_include/host/event_fif
> o_public.h
>  create mode 100644
> drivers/staging/media/atomisp/pci/hive_isp_css_include/host/fifo_moni
> tor_public.h
>  create mode 100644
> drivers/staging/media/atomisp/pci/hive_isp_css_include/host/gdc_publi
> c.h
>  create mode 100644
> drivers/staging/media/atomisp/pci/hive_isp_css_include/host/gp_device
> _public.h
>  create mode 100644
> drivers/staging/media/atomisp/pci/hive_isp_css_include/host/gp_timer_
> public.h
>  create mode 100644
> drivers/staging/media/atomisp/pci/hive_isp_css_include/host/gpio_publ
> ic.h
>  create mode 100644
> drivers/staging/media/atomisp/pci/hive_isp_css_include/host/hmem_publ
> ic.h
>  create mode 100644
> drivers/staging/media/atomisp/pci/hive_isp_css_include/host/ibuf_ctrl
> _public.h
>  create mode 100644
> drivers/staging/media/atomisp/pci/hive_isp_css_include/host/input_for
> matter_public.h
>  create mode 100644
> drivers/staging/media/atomisp/pci/hive_isp_css_include/host/irq_publi
> c.h
>  create mode 100644
> drivers/staging/media/atomisp/pci/hive_isp_css_include/host/isp_publi
> c.h
>  create mode 100644
> drivers/staging/media/atomisp/pci/hive_isp_css_include/host/isys_dma_
> public.h
>  create mode 100644
> drivers/staging/media/atomisp/pci/hive_isp_css_include/host/isys_irq_
> public.h
>  create mode 100644
> drivers/staging/media/atomisp/pci/hive_isp_css_include/host/isys_publ
> ic.h
>  create mode 100644
> drivers/staging/media/atomisp/pci/hive_isp_css_include/host/isys_stre
> am2mmio_public.h
>  create mode 100644
> drivers/staging/media/atomisp/pci/hive_isp_css_include/host/mmu_publi
> c.h
>  create mode 100644
> drivers/staging/media/atomisp/pci/hive_isp_css_include/host/pixelgen_
> public.h
>  create mode 100644
> drivers/staging/media/atomisp/pci/hive_isp_css_include/host/sp_public
> .h
>  create mode 100644
> drivers/staging/media/atomisp/pci/hive_isp_css_include/host/tag_publi
> c.h
>  create mode 100644
> drivers/staging/media/atomisp/pci/hive_isp_css_include/host/timed_ctr
> l_public.h
>  create mode 100644
> drivers/staging/media/atomisp/pci/hive_isp_css_include/host/vamem_pub
> lic.h
>  create mode 100644
> drivers/staging/media/atomisp/pci/hive_isp_css_include/host/vmem_publ
> ic.h
>  create mode 100644
> drivers/staging/media/atomisp/pci/hive_isp_css_include/ibuf_ctrl.h
>  create mode 100644
> drivers/staging/media/atomisp/pci/hive_isp_css_include/input_formatte
> r.h
>  create mode 100644
> drivers/staging/media/atomisp/pci/hive_isp_css_include/input_system.h
>  create mode 100644
> drivers/staging/media/atomisp/pci/hive_isp_css_include/irq.h
>  create mode 100644
> drivers/staging/media/atomisp/pci/hive_isp_css_include/isp.h
>  create mode 100644
> drivers/staging/media/atomisp/pci/hive_isp_css_include/isys_dma.h
>  create mode 100644
> drivers/staging/media/atomisp/pci/hive_isp_css_include/isys_irq.h
>  create mode 100644
> drivers/staging/media/atomisp/pci/hive_isp_css_include/isys_stream2mm
> io.h
>  create mode 100644
> drivers/staging/media/atomisp/pci/hive_isp_css_include/math_support.h
>  create mode 100644
> drivers/staging/media/atomisp/pci/hive_isp_css_include/memory_access/
> memory_access.h
>  create mode 100644
> drivers/staging/media/atomisp/pci/hive_isp_css_include/memory_realloc
> .h
>  create mode 100644
> drivers/staging/media/atomisp/pci/hive_isp_css_include/misc_support.h
>  create mode 100644
> drivers/staging/media/atomisp/pci/hive_isp_css_include/mmu_device.h
>  create mode 100644
> drivers/staging/media/atomisp/pci/hive_isp_css_include/pixelgen.h
>  create mode 100644
> drivers/staging/media/atomisp/pci/hive_isp_css_include/platform_suppo
> rt.h
>  create mode 100644
> drivers/staging/media/atomisp/pci/hive_isp_css_include/print_support.
> h
>  create mode 100644
> drivers/staging/media/atomisp/pci/hive_isp_css_include/queue.h
>  create mode 100644
> drivers/staging/media/atomisp/pci/hive_isp_css_include/resource.h
>  create mode 100644
> drivers/staging/media/atomisp/pci/hive_isp_css_include/sp.h
>  create mode 100644
> drivers/staging/media/atomisp/pci/hive_isp_css_include/string_support
> .h
>  create mode 100644
> drivers/staging/media/atomisp/pci/hive_isp_css_include/system_types.h
>  create mode 100644
> drivers/staging/media/atomisp/pci/hive_isp_css_include/tag.h
>  create mode 100644
> drivers/staging/media/atomisp/pci/hive_isp_css_include/timed_ctrl.h
>  create mode 100644
> drivers/staging/media/atomisp/pci/hive_isp_css_include/type_support.h
>  create mode 100644
> drivers/staging/media/atomisp/pci/hive_isp_css_include/vamem.h
>  create mode 100644
> drivers/staging/media/atomisp/pci/hive_isp_css_include/vmem.h
>  create mode 100644
> drivers/staging/media/atomisp/pci/hive_isp_css_shared/host/queue_loca
> l.h
>  create mode 100644
> drivers/staging/media/atomisp/pci/hive_isp_css_shared/host/queue_priv
> ate.h
>  create mode 100644
> drivers/staging/media/atomisp/pci/hive_isp_css_shared/host/tag.c
>  create mode 100644
> drivers/staging/media/atomisp/pci/hive_isp_css_shared/host/tag_local.
> h
>  create mode 100644
> drivers/staging/media/atomisp/pci/hive_isp_css_shared/host/tag_privat
> e.h
>  create mode 100644
> drivers/staging/media/atomisp/pci/hive_isp_css_shared/queue_global.h
>  create mode 100644
> drivers/staging/media/atomisp/pci/hive_isp_css_shared/sw_event_global
> .h
>  create mode 100644
> drivers/staging/media/atomisp/pci/hive_isp_css_shared/tag_global.h
>  create mode 100644
> drivers/staging/media/atomisp/pci/hive_isp_css_streaming_to_mipi_type
> s_hrt.h
>  create mode 100644 drivers/staging/media/atomisp/pci/hive_types.h
>  create mode 100644 drivers/staging/media/atomisp/pci/hmm/hmm.c
>  create mode 100644 drivers/staging/media/atomisp/pci/hmm/hmm_bo.c
>  create mode 100644
> drivers/staging/media/atomisp/pci/hmm/hmm_dynamic_pool.c
>  create mode 100644
> drivers/staging/media/atomisp/pci/hmm/hmm_reserved_pool.c
>  create mode 100644 drivers/staging/media/atomisp/pci/hmm/hmm_vm.c
>  create mode 100644
> drivers/staging/media/atomisp/pci/hrt/hive_isp_css_custom_host_hrt.h
>  create mode 100644
> drivers/staging/media/atomisp/pci/hrt/hive_isp_css_mm_hrt.c
>  create mode 100644
> drivers/staging/media/atomisp/pci/hrt/hive_isp_css_mm_hrt.h
>  create mode 100644 drivers/staging/media/atomisp/pci/ia_css.h
>  create mode 100644 drivers/staging/media/atomisp/pci/ia_css_3a.h
>  create mode 100644
> drivers/staging/media/atomisp/pci/ia_css_acc_types.h
>  create mode 100644 drivers/staging/media/atomisp/pci/ia_css_buffer.h
>  create mode 100644
> drivers/staging/media/atomisp/pci/ia_css_control.h
>  create mode 100644
> drivers/staging/media/atomisp/pci/ia_css_device_access.c
>  create mode 100644
> drivers/staging/media/atomisp/pci/ia_css_device_access.h
>  create mode 100644 drivers/staging/media/atomisp/pci/ia_css_dvs.h
>  create mode 100644 drivers/staging/media/atomisp/pci/ia_css_env.h
>  create mode 100644 drivers/staging/media/atomisp/pci/ia_css_err.h
>  create mode 100644
> drivers/staging/media/atomisp/pci/ia_css_event_public.h
>  create mode 100644
> drivers/staging/media/atomisp/pci/ia_css_firmware.h
>  create mode 100644 drivers/staging/media/atomisp/pci/ia_css_frac.h
>  create mode 100644
> drivers/staging/media/atomisp/pci/ia_css_frame_format.h
>  create mode 100644
> drivers/staging/media/atomisp/pci/ia_css_frame_public.h
>  create mode 100644
> drivers/staging/media/atomisp/pci/ia_css_host_data.h
>  create mode 100644
> drivers/staging/media/atomisp/pci/ia_css_input_port.h
>  create mode 100644 drivers/staging/media/atomisp/pci/ia_css_irq.h
>  create mode 100644
> drivers/staging/media/atomisp/pci/ia_css_isp_configs.h
>  create mode 100644
> drivers/staging/media/atomisp/pci/ia_css_isp_params.h
>  create mode 100644
> drivers/staging/media/atomisp/pci/ia_css_isp_states.h
>  create mode 100644
> drivers/staging/media/atomisp/pci/ia_css_memory_access.c
>  create mode 100644
> drivers/staging/media/atomisp/pci/ia_css_metadata.h
>  create mode 100644 drivers/staging/media/atomisp/pci/ia_css_mipi.h
>  create mode 100644 drivers/staging/media/atomisp/pci/ia_css_mmu.h
>  create mode 100644
> drivers/staging/media/atomisp/pci/ia_css_mmu_private.h
>  create mode 100644 drivers/staging/media/atomisp/pci/ia_css_morph.h
>  create mode 100644 drivers/staging/media/atomisp/pci/ia_css_pipe.h
>  create mode 100644
> drivers/staging/media/atomisp/pci/ia_css_pipe_public.h
>  create mode 100644 drivers/staging/media/atomisp/pci/ia_css_prbs.h
>  create mode 100644
> drivers/staging/media/atomisp/pci/ia_css_properties.h
>  create mode 100644
> drivers/staging/media/atomisp/pci/ia_css_shading.h
>  create mode 100644 drivers/staging/media/atomisp/pci/ia_css_stream.h
>  create mode 100644
> drivers/staging/media/atomisp/pci/ia_css_stream_format.h
>  create mode 100644
> drivers/staging/media/atomisp/pci/ia_css_stream_public.h
>  create mode 100644 drivers/staging/media/atomisp/pci/ia_css_timer.h
>  create mode 100644 drivers/staging/media/atomisp/pci/ia_css_tpg.h
>  create mode 100644 drivers/staging/media/atomisp/pci/ia_css_types.h
>  create mode 100644
> drivers/staging/media/atomisp/pci/ia_css_version.h
>  create mode 100644
> drivers/staging/media/atomisp/pci/ia_css_version_data.h
>  create mode 100644 drivers/staging/media/atomisp/pci/if_defs.h
>  create mode 100644
> drivers/staging/media/atomisp/pci/input_formatter_subsystem_defs.h
>  create mode 100644
> drivers/staging/media/atomisp/pci/input_selector_defs.h
>  create mode 100644
> drivers/staging/media/atomisp/pci/input_switch_2400_defs.h
>  create mode 100644
> drivers/staging/media/atomisp/pci/input_system_ctrl_defs.h
>  create mode 100644
> drivers/staging/media/atomisp/pci/input_system_defs.h
>  create mode 100644
> drivers/staging/media/atomisp/pci/input_system_global.h
>  create mode 100644
> drivers/staging/media/atomisp/pci/input_system_local.h
>  create mode 100644
> drivers/staging/media/atomisp/pci/input_system_private.h
>  create mode 100644
> drivers/staging/media/atomisp/pci/input_system_public.h
>  create mode 100644
> drivers/staging/media/atomisp/pci/irq_controller_defs.h
>  create mode 100644
> drivers/staging/media/atomisp/pci/isp/kernels/aa/aa_2/ia_css_aa2.host
> .c
>  create mode 100644
> drivers/staging/media/atomisp/pci/isp/kernels/aa/aa_2/ia_css_aa2.host
> .h
>  create mode 100644
> drivers/staging/media/atomisp/pci/isp/kernels/aa/aa_2/ia_css_aa2_para
> m.h
>  create mode 100644
> drivers/staging/media/atomisp/pci/isp/kernels/aa/aa_2/ia_css_aa2_type
> s.h
>  create mode 100644
> drivers/staging/media/atomisp/pci/isp/kernels/anr/anr_1.0/ia_css_anr.
> host.c
>  create mode 100644
> drivers/staging/media/atomisp/pci/isp/kernels/anr/anr_1.0/ia_css_anr.
> host.h
>  create mode 100644
> drivers/staging/media/atomisp/pci/isp/kernels/anr/anr_1.0/ia_css_anr_
> param.h
>  create mode 100644
> drivers/staging/media/atomisp/pci/isp/kernels/anr/anr_1.0/ia_css_anr_
> types.h
>  create mode 100644
> drivers/staging/media/atomisp/pci/isp/kernels/anr/anr_2/ia_css_anr2.h
> ost.c
>  create mode 100644
> drivers/staging/media/atomisp/pci/isp/kernels/anr/anr_2/ia_css_anr2.h
> ost.h
>  create mode 100644
> drivers/staging/media/atomisp/pci/isp/kernels/anr/anr_2/ia_css_anr2_p
> aram.h
>  create mode 100644
> drivers/staging/media/atomisp/pci/isp/kernels/anr/anr_2/ia_css_anr2_t
> able.host.c
>  create mode 100644
> drivers/staging/media/atomisp/pci/isp/kernels/anr/anr_2/ia_css_anr2_t
> able.host.h
>  create mode 100644
> drivers/staging/media/atomisp/pci/isp/kernels/anr/anr_2/ia_css_anr2_t
> ypes.h
>  create mode 100644
> drivers/staging/media/atomisp/pci/isp/kernels/bh/bh_2/ia_css_bh.host.
> c
>  create mode 100644
> drivers/staging/media/atomisp/pci/isp/kernels/bh/bh_2/ia_css_bh.host.
> h
>  create mode 100644
> drivers/staging/media/atomisp/pci/isp/kernels/bh/bh_2/ia_css_bh_param
> .h
>  create mode 100644
> drivers/staging/media/atomisp/pci/isp/kernels/bh/bh_2/ia_css_bh_types
> .h
>  create mode 100644
> drivers/staging/media/atomisp/pci/isp/kernels/bnlm/ia_css_bnlm.host.c
>  create mode 100644
> drivers/staging/media/atomisp/pci/isp/kernels/bnlm/ia_css_bnlm.host.h
>  create mode 100644
> drivers/staging/media/atomisp/pci/isp/kernels/bnlm/ia_css_bnlm_param.
> h
>  create mode 100644
> drivers/staging/media/atomisp/pci/isp/kernels/bnlm/ia_css_bnlm_types.
> h
>  create mode 100644
> drivers/staging/media/atomisp/pci/isp/kernels/bnr/bnr2_2/ia_css_bnr2_
> 2.host.c
>  create mode 100644
> drivers/staging/media/atomisp/pci/isp/kernels/bnr/bnr2_2/ia_css_bnr2_
> 2.host.h
>  create mode 100644
> drivers/staging/media/atomisp/pci/isp/kernels/bnr/bnr2_2/ia_css_bnr2_
> 2_param.h
>  create mode 100644
> drivers/staging/media/atomisp/pci/isp/kernels/bnr/bnr2_2/ia_css_bnr2_
> 2_types.h
>  create mode 100644
> drivers/staging/media/atomisp/pci/isp/kernels/bnr/bnr_1.0/ia_css_bnr.
> host.c
>  create mode 100644
> drivers/staging/media/atomisp/pci/isp/kernels/bnr/bnr_1.0/ia_css_bnr.
> host.h
>  create mode 100644
> drivers/staging/media/atomisp/pci/isp/kernels/bnr/bnr_1.0/ia_css_bnr_
> param.h
>  create mode 100644
> drivers/staging/media/atomisp/pci/isp/kernels/cnr/cnr_1.0/ia_css_cnr.
> host.c
>  create mode 100644
> drivers/staging/media/atomisp/pci/isp/kernels/cnr/cnr_1.0/ia_css_cnr.
> host.h
>  create mode 100644
> drivers/staging/media/atomisp/pci/isp/kernels/cnr/cnr_1.0/ia_css_cnr_
> param.h
>  create mode 100644
> drivers/staging/media/atomisp/pci/isp/kernels/cnr/cnr_2/ia_css_cnr2.h
> ost.c
>  create mode 100644
> drivers/staging/media/atomisp/pci/isp/kernels/cnr/cnr_2/ia_css_cnr2.h
> ost.h
>  create mode 100644
> drivers/staging/media/atomisp/pci/isp/kernels/cnr/cnr_2/ia_css_cnr2_p
> aram.h
>  create mode 100644
> drivers/staging/media/atomisp/pci/isp/kernels/cnr/cnr_2/ia_css_cnr2_t
> ypes.h
>  create mode 100644
> drivers/staging/media/atomisp/pci/isp/kernels/conversion/conversion_1
> .0/ia_css_conversion.host.c
>  create mode 100644
> drivers/staging/media/atomisp/pci/isp/kernels/conversion/conversion_1
> .0/ia_css_conversion.host.h
>  create mode 100644
> drivers/staging/media/atomisp/pci/isp/kernels/conversion/conversion_1
> .0/ia_css_conversion_param.h
>  create mode 100644
> drivers/staging/media/atomisp/pci/isp/kernels/conversion/conversion_1
> .0/ia_css_conversion_types.h
>  create mode 100644
> drivers/staging/media/atomisp/pci/isp/kernels/copy_output/copy_output
> _1.0/ia_css_copy_output.host.c
>  create mode 100644
> drivers/staging/media/atomisp/pci/isp/kernels/copy_output/copy_output
> _1.0/ia_css_copy_output.host.h
>  create mode 100644
> drivers/staging/media/atomisp/pci/isp/kernels/copy_output/copy_output
> _1.0/ia_css_copy_output_param.h
>  create mode 100644
> drivers/staging/media/atomisp/pci/isp/kernels/crop/crop_1.0/ia_css_cr
> op.host.c
>  create mode 100644
> drivers/staging/media/atomisp/pci/isp/kernels/crop/crop_1.0/ia_css_cr
> op.host.h
>  create mode 100644
> drivers/staging/media/atomisp/pci/isp/kernels/crop/crop_1.0/ia_css_cr
> op_param.h
>  create mode 100644
> drivers/staging/media/atomisp/pci/isp/kernels/crop/crop_1.0/ia_css_cr
> op_types.h
>  create mode 100644
> drivers/staging/media/atomisp/pci/isp/kernels/csc/csc_1.0/ia_css_csc.
> host.c
>  create mode 100644
> drivers/staging/media/atomisp/pci/isp/kernels/csc/csc_1.0/ia_css_csc.
> host.h
>  create mode 100644
> drivers/staging/media/atomisp/pci/isp/kernels/csc/csc_1.0/ia_css_csc_
> param.h
>  create mode 100644
> drivers/staging/media/atomisp/pci/isp/kernels/csc/csc_1.0/ia_css_csc_
> types.h
>  create mode 100644
> drivers/staging/media/atomisp/pci/isp/kernels/ctc/ctc1_5/ia_css_ctc1_
> 5.host.c
>  create mode 100644
> drivers/staging/media/atomisp/pci/isp/kernels/ctc/ctc1_5/ia_css_ctc1_
> 5.host.h
>  create mode 100644
> drivers/staging/media/atomisp/pci/isp/kernels/ctc/ctc1_5/ia_css_ctc1_
> 5_param.h
>  create mode 100644
> drivers/staging/media/atomisp/pci/isp/kernels/ctc/ctc2/ia_css_ctc2.ho
> st.c
>  create mode 100644
> drivers/staging/media/atomisp/pci/isp/kernels/ctc/ctc2/ia_css_ctc2.ho
> st.h
>  create mode 100644
> drivers/staging/media/atomisp/pci/isp/kernels/ctc/ctc2/ia_css_ctc2_pa
> ram.h
>  create mode 100644
> drivers/staging/media/atomisp/pci/isp/kernels/ctc/ctc2/ia_css_ctc2_ty
> pes.h
>  create mode 100644
> drivers/staging/media/atomisp/pci/isp/kernels/ctc/ctc_1.0/ia_css_ctc.
> host.c
>  create mode 100644
> drivers/staging/media/atomisp/pci/isp/kernels/ctc/ctc_1.0/ia_css_ctc.
> host.h
>  create mode 100644
> drivers/staging/media/atomisp/pci/isp/kernels/ctc/ctc_1.0/ia_css_ctc_
> param.h
>  create mode 100644
> drivers/staging/media/atomisp/pci/isp/kernels/ctc/ctc_1.0/ia_css_ctc_
> table.host.c
>  create mode 100644
> drivers/staging/media/atomisp/pci/isp/kernels/ctc/ctc_1.0/ia_css_ctc_
> table.host.h
>  create mode 100644
> drivers/staging/media/atomisp/pci/isp/kernels/ctc/ctc_1.0/ia_css_ctc_
> types.h
>  create mode 100644
> drivers/staging/media/atomisp/pci/isp/kernels/de/de_1.0/ia_css_de.hos
> t.c
>  create mode 100644
> drivers/staging/media/atomisp/pci/isp/kernels/de/de_1.0/ia_css_de.hos
> t.h
>  create mode 100644
> drivers/staging/media/atomisp/pci/isp/kernels/de/de_1.0/ia_css_de_par
> am.h
>  create mode 100644
> drivers/staging/media/atomisp/pci/isp/kernels/de/de_1.0/ia_css_de_typ
> es.h
>  create mode 100644
> drivers/staging/media/atomisp/pci/isp/kernels/de/de_2/ia_css_de2.host
> .c
>  create mode 100644
> drivers/staging/media/atomisp/pci/isp/kernels/de/de_2/ia_css_de2.host
> .h
>  create mode 100644
> drivers/staging/media/atomisp/pci/isp/kernels/de/de_2/ia_css_de2_para
> m.h
>  create mode 100644
> drivers/staging/media/atomisp/pci/isp/kernels/de/de_2/ia_css_de2_type
> s.h
>  create mode 100644
> drivers/staging/media/atomisp/pci/isp/kernels/dp/dp_1.0/ia_css_dp.hos
> t.c
>  create mode 100644
> drivers/staging/media/atomisp/pci/isp/kernels/dp/dp_1.0/ia_css_dp.hos
> t.h
>  create mode 100644
> drivers/staging/media/atomisp/pci/isp/kernels/dp/dp_1.0/ia_css_dp_par
> am.h
>  create mode 100644
> drivers/staging/media/atomisp/pci/isp/kernels/dp/dp_1.0/ia_css_dp_typ
> es.h
>  create mode 100644
> drivers/staging/media/atomisp/pci/isp/kernels/dpc2/ia_css_dpc2.host.c
>  create mode 100644
> drivers/staging/media/atomisp/pci/isp/kernels/dpc2/ia_css_dpc2.host.h
>  create mode 100644
> drivers/staging/media/atomisp/pci/isp/kernels/dpc2/ia_css_dpc2_param.
> h
>  create mode 100644
> drivers/staging/media/atomisp/pci/isp/kernels/dpc2/ia_css_dpc2_types.
> h
>  create mode 100644
> drivers/staging/media/atomisp/pci/isp/kernels/dvs/dvs_1.0/ia_css_dvs.
> host.c
>  create mode 100644
> drivers/staging/media/atomisp/pci/isp/kernels/dvs/dvs_1.0/ia_css_dvs.
> host.h
>  create mode 100644
> drivers/staging/media/atomisp/pci/isp/kernels/dvs/dvs_1.0/ia_css_dvs_
> param.h
>  create mode 100644
> drivers/staging/media/atomisp/pci/isp/kernels/dvs/dvs_1.0/ia_css_dvs_
> types.h
>  create mode 100644
> drivers/staging/media/atomisp/pci/isp/kernels/eed1_8/ia_css_eed1_8.ho
> st.c
>  create mode 100644
> drivers/staging/media/atomisp/pci/isp/kernels/eed1_8/ia_css_eed1_8.ho
> st.h
>  create mode 100644
> drivers/staging/media/atomisp/pci/isp/kernels/eed1_8/ia_css_eed1_8_pa
> ram.h
>  create mode 100644
> drivers/staging/media/atomisp/pci/isp/kernels/eed1_8/ia_css_eed1_8_ty
> pes.h
>  create mode 100644
> drivers/staging/media/atomisp/pci/isp/kernels/fc/fc_1.0/ia_css_format
> s.host.c
>  create mode 100644
> drivers/staging/media/atomisp/pci/isp/kernels/fc/fc_1.0/ia_css_format
> s.host.h
>  create mode 100644
> drivers/staging/media/atomisp/pci/isp/kernels/fc/fc_1.0/ia_css_format
> s_param.h
>  create mode 100644
> drivers/staging/media/atomisp/pci/isp/kernels/fc/fc_1.0/ia_css_format
> s_types.h
>  create mode 100644
> drivers/staging/media/atomisp/pci/isp/kernels/fixedbds/fixedbds_1.0/i
> a_css_fixedbds_param.h
>  create mode 100644
> drivers/staging/media/atomisp/pci/isp/kernels/fixedbds/fixedbds_1.0/i
> a_css_fixedbds_types.h
>  create mode 100644
> drivers/staging/media/atomisp/pci/isp/kernels/fpn/fpn_1.0/ia_css_fpn.
> host.c
>  create mode 100644
> drivers/staging/media/atomisp/pci/isp/kernels/fpn/fpn_1.0/ia_css_fpn.
> host.h
>  create mode 100644
> drivers/staging/media/atomisp/pci/isp/kernels/fpn/fpn_1.0/ia_css_fpn_
> param.h
>  create mode 100644
> drivers/staging/media/atomisp/pci/isp/kernels/fpn/fpn_1.0/ia_css_fpn_
> types.h
>  create mode 100644
> drivers/staging/media/atomisp/pci/isp/kernels/gc/gc_1.0/ia_css_gc.hos
> t.c
>  create mode 100644
> drivers/staging/media/atomisp/pci/isp/kernels/gc/gc_1.0/ia_css_gc.hos
> t.h
>  create mode 100644
> drivers/staging/media/atomisp/pci/isp/kernels/gc/gc_1.0/ia_css_gc_par
> am.h
>  create mode 100644
> drivers/staging/media/atomisp/pci/isp/kernels/gc/gc_1.0/ia_css_gc_tab
> le.host.c
>  create mode 100644
> drivers/staging/media/atomisp/pci/isp/kernels/gc/gc_1.0/ia_css_gc_tab
> le.host.h
>  create mode 100644
> drivers/staging/media/atomisp/pci/isp/kernels/gc/gc_1.0/ia_css_gc_typ
> es.h
>  create mode 100644
> drivers/staging/media/atomisp/pci/isp/kernels/gc/gc_2/ia_css_gc2.host
> .c
>  create mode 100644
> drivers/staging/media/atomisp/pci/isp/kernels/gc/gc_2/ia_css_gc2.host
> .h
>  create mode 100644
> drivers/staging/media/atomisp/pci/isp/kernels/gc/gc_2/ia_css_gc2_para
> m.h
>  create mode 100644
> drivers/staging/media/atomisp/pci/isp/kernels/gc/gc_2/ia_css_gc2_tabl
> e.host.c
>  create mode 100644
> drivers/staging/media/atomisp/pci/isp/kernels/gc/gc_2/ia_css_gc2_tabl
> e.host.h
>  create mode 100644
> drivers/staging/media/atomisp/pci/isp/kernels/gc/gc_2/ia_css_gc2_type
> s.h
>  create mode 100644
> drivers/staging/media/atomisp/pci/isp/kernels/hdr/ia_css_hdr.host.c
>  create mode 100644
> drivers/staging/media/atomisp/pci/isp/kernels/hdr/ia_css_hdr.host.h
>  create mode 100644
> drivers/staging/media/atomisp/pci/isp/kernels/hdr/ia_css_hdr_param.h
>  create mode 100644
> drivers/staging/media/atomisp/pci/isp/kernels/hdr/ia_css_hdr_types.h
>  create mode 100644
> drivers/staging/media/atomisp/pci/isp/kernels/ipu2_io_ls/bayer_io_ls/
> ia_css_bayer_io.host.c
>  create mode 100644
> drivers/staging/media/atomisp/pci/isp/kernels/ipu2_io_ls/bayer_io_ls/
> ia_css_bayer_io.host.h
>  create mode 100644
> drivers/staging/media/atomisp/pci/isp/kernels/ipu2_io_ls/bayer_io_ls/
> ia_css_bayer_io_param.h
>  create mode 100644
> drivers/staging/media/atomisp/pci/isp/kernels/ipu2_io_ls/bayer_io_ls/
> ia_css_bayer_io_types.h
>  create mode 100644
> drivers/staging/media/atomisp/pci/isp/kernels/ipu2_io_ls/common/ia_cs
> s_common_io_param.h
>  create mode 100644
> drivers/staging/media/atomisp/pci/isp/kernels/ipu2_io_ls/common/ia_cs
> s_common_io_types.h
>  create mode 100644
> drivers/staging/media/atomisp/pci/isp/kernels/ipu2_io_ls/yuv444_io_ls
> /ia_css_yuv444_io.host.c
>  create mode 100644
> drivers/staging/media/atomisp/pci/isp/kernels/ipu2_io_ls/yuv444_io_ls
> /ia_css_yuv444_io.host.h
>  create mode 100644
> drivers/staging/media/atomisp/pci/isp/kernels/ipu2_io_ls/yuv444_io_ls
> /ia_css_yuv444_io_param.h
>  create mode 100644
> drivers/staging/media/atomisp/pci/isp/kernels/ipu2_io_ls/yuv444_io_ls
> /ia_css_yuv444_io_types.h
>  create mode 100644
> drivers/staging/media/atomisp/pci/isp/kernels/iterator/iterator_1.0/i
> a_css_iterator.host.c
>  create mode 100644
> drivers/staging/media/atomisp/pci/isp/kernels/iterator/iterator_1.0/i
> a_css_iterator.host.h
>  create mode 100644
> drivers/staging/media/atomisp/pci/isp/kernels/iterator/iterator_1.0/i
> a_css_iterator_param.h
>  create mode 100644
> drivers/staging/media/atomisp/pci/isp/kernels/macc/macc1_5/ia_css_mac
> c1_5.host.c
>  create mode 100644
> drivers/staging/media/atomisp/pci/isp/kernels/macc/macc1_5/ia_css_mac
> c1_5.host.h
>  create mode 100644
> drivers/staging/media/atomisp/pci/isp/kernels/macc/macc1_5/ia_css_mac
> c1_5_param.h
>  create mode 100644
> drivers/staging/media/atomisp/pci/isp/kernels/macc/macc1_5/ia_css_mac
> c1_5_table.host.c
>  create mode 100644
> drivers/staging/media/atomisp/pci/isp/kernels/macc/macc1_5/ia_css_mac
> c1_5_table.host.h
>  create mode 100644
> drivers/staging/media/atomisp/pci/isp/kernels/macc/macc1_5/ia_css_mac
> c1_5_types.h
>  create mode 100644
> drivers/staging/media/atomisp/pci/isp/kernels/macc/macc_1.0/ia_css_ma
> cc.host.c
>  create mode 100644
> drivers/staging/media/atomisp/pci/isp/kernels/macc/macc_1.0/ia_css_ma
> cc.host.h
>  create mode 100644
> drivers/staging/media/atomisp/pci/isp/kernels/macc/macc_1.0/ia_css_ma
> cc_param.h
>  create mode 100644
> drivers/staging/media/atomisp/pci/isp/kernels/macc/macc_1.0/ia_css_ma
> cc_table.host.c
>  create mode 100644
> drivers/staging/media/atomisp/pci/isp/kernels/macc/macc_1.0/ia_css_ma
> cc_table.host.h
>  create mode 100644
> drivers/staging/media/atomisp/pci/isp/kernels/macc/macc_1.0/ia_css_ma
> cc_types.h
>  create mode 100644
> drivers/staging/media/atomisp/pci/isp/kernels/norm/norm_1.0/ia_css_no
> rm.host.c
>  create mode 100644
> drivers/staging/media/atomisp/pci/isp/kernels/norm/norm_1.0/ia_css_no
> rm.host.h
>  create mode 100644
> drivers/staging/media/atomisp/pci/isp/kernels/norm/norm_1.0/ia_css_no
> rm_param.h
>  create mode 100644
> drivers/staging/media/atomisp/pci/isp/kernels/ob/ob2/ia_css_ob2.host.
> c
>  create mode 100644
> drivers/staging/media/atomisp/pci/isp/kernels/ob/ob2/ia_css_ob2.host.
> h
>  create mode 100644
> drivers/staging/media/atomisp/pci/isp/kernels/ob/ob2/ia_css_ob2_param
> .h
>  create mode 100644
> drivers/staging/media/atomisp/pci/isp/kernels/ob/ob2/ia_css_ob2_types
> .h
>  create mode 100644
> drivers/staging/media/atomisp/pci/isp/kernels/ob/ob_1.0/ia_css_ob.hos
> t.c
>  create mode 100644
> drivers/staging/media/atomisp/pci/isp/kernels/ob/ob_1.0/ia_css_ob.hos
> t.h
>  create mode 100644
> drivers/staging/media/atomisp/pci/isp/kernels/ob/ob_1.0/ia_css_ob_par
> am.h
>  create mode 100644
> drivers/staging/media/atomisp/pci/isp/kernels/ob/ob_1.0/ia_css_ob_typ
> es.h
>  create mode 100644
> drivers/staging/media/atomisp/pci/isp/kernels/output/output_1.0/ia_cs
> s_output.host.c
>  create mode 100644
> drivers/staging/media/atomisp/pci/isp/kernels/output/output_1.0/ia_cs
> s_output.host.h
>  create mode 100644
> drivers/staging/media/atomisp/pci/isp/kernels/output/output_1.0/ia_cs
> s_output_param.h
>  create mode 100644
> drivers/staging/media/atomisp/pci/isp/kernels/output/output_1.0/ia_cs
> s_output_types.h
>  create mode 100644
> drivers/staging/media/atomisp/pci/isp/kernels/qplane/qplane_2/ia_css_
> qplane.host.c
>  create mode 100644
> drivers/staging/media/atomisp/pci/isp/kernels/qplane/qplane_2/ia_css_
> qplane.host.h
>  create mode 100644
> drivers/staging/media/atomisp/pci/isp/kernels/qplane/qplane_2/ia_css_
> qplane_param.h
>  create mode 100644
> drivers/staging/media/atomisp/pci/isp/kernels/qplane/qplane_2/ia_css_
> qplane_types.h
>  create mode 100644
> drivers/staging/media/atomisp/pci/isp/kernels/raw/raw_1.0/ia_css_raw.
> host.c
>  create mode 100644
> drivers/staging/media/atomisp/pci/isp/kernels/raw/raw_1.0/ia_css_raw.
> host.h
>  create mode 100644
> drivers/staging/media/atomisp/pci/isp/kernels/raw/raw_1.0/ia_css_raw_
> param.h
>  create mode 100644
> drivers/staging/media/atomisp/pci/isp/kernels/raw/raw_1.0/ia_css_raw_
> types.h
>  create mode 100644
> drivers/staging/media/atomisp/pci/isp/kernels/raw_aa_binning/raw_aa_b
> inning_1.0/ia_css_raa.host.c
>  create mode 100644
> drivers/staging/media/atomisp/pci/isp/kernels/raw_aa_binning/raw_aa_b
> inning_1.0/ia_css_raa.host.h
>  create mode 100644
> drivers/staging/media/atomisp/pci/isp/kernels/ref/ref_1.0/ia_css_ref.
> host.c
>  create mode 100644
> drivers/staging/media/atomisp/pci/isp/kernels/ref/ref_1.0/ia_css_ref.
> host.h
>  create mode 100644
> drivers/staging/media/atomisp/pci/isp/kernels/ref/ref_1.0/ia_css_ref_
> param.h
>  create mode 100644
> drivers/staging/media/atomisp/pci/isp/kernels/ref/ref_1.0/ia_css_ref_
> state.h
>  create mode 100644
> drivers/staging/media/atomisp/pci/isp/kernels/ref/ref_1.0/ia_css_ref_
> types.h
>  create mode 100644
> drivers/staging/media/atomisp/pci/isp/kernels/s3a/s3a_1.0/ia_css_s3a.
> host.c
>  create mode 100644
> drivers/staging/media/atomisp/pci/isp/kernels/s3a/s3a_1.0/ia_css_s3a.
> host.h
>  create mode 100644
> drivers/staging/media/atomisp/pci/isp/kernels/s3a/s3a_1.0/ia_css_s3a_
> param.h
>  create mode 100644
> drivers/staging/media/atomisp/pci/isp/kernels/s3a/s3a_1.0/ia_css_s3a_
> types.h
>  create mode 100644
> drivers/staging/media/atomisp/pci/isp/kernels/sc/sc_1.0/ia_css_sc.hos
> t.c
>  create mode 100644
> drivers/staging/media/atomisp/pci/isp/kernels/sc/sc_1.0/ia_css_sc.hos
> t.h
>  create mode 100644
> drivers/staging/media/atomisp/pci/isp/kernels/sc/sc_1.0/ia_css_sc_par
> am.h
>  create mode 100644
> drivers/staging/media/atomisp/pci/isp/kernels/sc/sc_1.0/ia_css_sc_typ
> es.h
>  create mode 100644
> drivers/staging/media/atomisp/pci/isp/kernels/sdis/common/ia_css_sdis
> _common.host.h
>  create mode 100644
> drivers/staging/media/atomisp/pci/isp/kernels/sdis/common/ia_css_sdis
> _common_types.h
>  create mode 100644
> drivers/staging/media/atomisp/pci/isp/kernels/sdis/sdis_1.0/ia_css_sd
> is.host.c
>  create mode 100644
> drivers/staging/media/atomisp/pci/isp/kernels/sdis/sdis_1.0/ia_css_sd
> is.host.h
>  create mode 100644
> drivers/staging/media/atomisp/pci/isp/kernels/sdis/sdis_1.0/ia_css_sd
> is_types.h
>  create mode 100644
> drivers/staging/media/atomisp/pci/isp/kernels/sdis/sdis_2/ia_css_sdis
> 2.host.c
>  create mode 100644
> drivers/staging/media/atomisp/pci/isp/kernels/sdis/sdis_2/ia_css_sdis
> 2.host.h
>  create mode 100644
> drivers/staging/media/atomisp/pci/isp/kernels/sdis/sdis_2/ia_css_sdis
> 2_types.h
>  create mode 100644
> drivers/staging/media/atomisp/pci/isp/kernels/tdf/tdf_1.0/ia_css_tdf.
> host.c
>  create mode 100644
> drivers/staging/media/atomisp/pci/isp/kernels/tdf/tdf_1.0/ia_css_tdf.
> host.h
>  create mode 100644
> drivers/staging/media/atomisp/pci/isp/kernels/tdf/tdf_1.0/ia_css_tdf_
> param.h
>  create mode 100644
> drivers/staging/media/atomisp/pci/isp/kernels/tdf/tdf_1.0/ia_css_tdf_
> types.h
>  create mode 100644
> drivers/staging/media/atomisp/pci/isp/kernels/tnr/tnr3/ia_css_tnr3_ty
> pes.h
>  create mode 100644
> drivers/staging/media/atomisp/pci/isp/kernels/tnr/tnr_1.0/ia_css_tnr.
> host.c
>  create mode 100644
> drivers/staging/media/atomisp/pci/isp/kernels/tnr/tnr_1.0/ia_css_tnr.
> host.h
>  create mode 100644
> drivers/staging/media/atomisp/pci/isp/kernels/tnr/tnr_1.0/ia_css_tnr_
> param.h
>  create mode 100644
> drivers/staging/media/atomisp/pci/isp/kernels/tnr/tnr_1.0/ia_css_tnr_
> state.h
>  create mode 100644
> drivers/staging/media/atomisp/pci/isp/kernels/tnr/tnr_1.0/ia_css_tnr_
> types.h
>  create mode 100644
> drivers/staging/media/atomisp/pci/isp/kernels/uds/uds_1.0/ia_css_uds_
> param.h
>  create mode 100644
> drivers/staging/media/atomisp/pci/isp/kernels/vf/vf_1.0/ia_css_vf.hos
> t.c
>  create mode 100644
> drivers/staging/media/atomisp/pci/isp/kernels/vf/vf_1.0/ia_css_vf.hos
> t.h
>  create mode 100644
> drivers/staging/media/atomisp/pci/isp/kernels/vf/vf_1.0/ia_css_vf_par
> am.h
>  create mode 100644
> drivers/staging/media/atomisp/pci/isp/kernels/vf/vf_1.0/ia_css_vf_typ
> es.h
>  create mode 100644
> drivers/staging/media/atomisp/pci/isp/kernels/wb/wb_1.0/ia_css_wb.hos
> t.c
>  create mode 100644
> drivers/staging/media/atomisp/pci/isp/kernels/wb/wb_1.0/ia_css_wb.hos
> t.h
>  create mode 100644
> drivers/staging/media/atomisp/pci/isp/kernels/wb/wb_1.0/ia_css_wb_par
> am.h
>  create mode 100644
> drivers/staging/media/atomisp/pci/isp/kernels/wb/wb_1.0/ia_css_wb_typ
> es.h
>  create mode 100644
> drivers/staging/media/atomisp/pci/isp/kernels/xnr/xnr_1.0/ia_css_xnr.
> host.c
>  create mode 100644
> drivers/staging/media/atomisp/pci/isp/kernels/xnr/xnr_1.0/ia_css_xnr.
> host.h
>  create mode 100644
> drivers/staging/media/atomisp/pci/isp/kernels/xnr/xnr_1.0/ia_css_xnr_
> param.h
>  create mode 100644
> drivers/staging/media/atomisp/pci/isp/kernels/xnr/xnr_1.0/ia_css_xnr_
> table.host.c
>  create mode 100644
> drivers/staging/media/atomisp/pci/isp/kernels/xnr/xnr_1.0/ia_css_xnr_
> table.host.h
>  create mode 100644
> drivers/staging/media/atomisp/pci/isp/kernels/xnr/xnr_1.0/ia_css_xnr_
> types.h
>  create mode 100644
> drivers/staging/media/atomisp/pci/isp/kernels/xnr/xnr_3.0/ia_css_xnr3
> .host.c
>  create mode 100644
> drivers/staging/media/atomisp/pci/isp/kernels/xnr/xnr_3.0/ia_css_xnr3
> .host.h
>  create mode 100644
> drivers/staging/media/atomisp/pci/isp/kernels/xnr/xnr_3.0/ia_css_xnr3
> _param.h
>  create mode 100644
> drivers/staging/media/atomisp/pci/isp/kernels/xnr/xnr_3.0/ia_css_xnr3
> _types.h
>  create mode 100644
> drivers/staging/media/atomisp/pci/isp/kernels/ynr/ynr_1.0/ia_css_ynr.
> host.c
>  create mode 100644
> drivers/staging/media/atomisp/pci/isp/kernels/ynr/ynr_1.0/ia_css_ynr.
> host.h
>  create mode 100644
> drivers/staging/media/atomisp/pci/isp/kernels/ynr/ynr_1.0/ia_css_ynr_
> param.h
>  create mode 100644
> drivers/staging/media/atomisp/pci/isp/kernels/ynr/ynr_1.0/ia_css_ynr_
> types.h
>  create mode 100644
> drivers/staging/media/atomisp/pci/isp/kernels/ynr/ynr_2/ia_css_ynr2.h
> ost.c
>  create mode 100644
> drivers/staging/media/atomisp/pci/isp/kernels/ynr/ynr_2/ia_css_ynr2.h
> ost.h
>  create mode 100644
> drivers/staging/media/atomisp/pci/isp/kernels/ynr/ynr_2/ia_css_ynr2_p
> aram.h
>  create mode 100644
> drivers/staging/media/atomisp/pci/isp/kernels/ynr/ynr_2/ia_css_ynr2_t
> ypes.h
>  create mode 100644
> drivers/staging/media/atomisp/pci/isp/modes/interface/input_buf.isp.h
>  create mode 100644
> drivers/staging/media/atomisp/pci/isp/modes/interface/isp_const.h
>  create mode 100644
> drivers/staging/media/atomisp/pci/isp/modes/interface/isp_types.h
>  create mode 100644
> drivers/staging/media/atomisp/pci/isp2400_input_system_global.h
>  create mode 100644
> drivers/staging/media/atomisp/pci/isp2400_input_system_local.h
>  create mode 100644
> drivers/staging/media/atomisp/pci/isp2400_input_system_private.h
>  create mode 100644
> drivers/staging/media/atomisp/pci/isp2400_input_system_public.h
>  create mode 100644
> drivers/staging/media/atomisp/pci/isp2400_support.h
>  create mode 100644
> drivers/staging/media/atomisp/pci/isp2400_system_global.h
>  create mode 100644
> drivers/staging/media/atomisp/pci/isp2400_system_local.h
>  create mode 100644
> drivers/staging/media/atomisp/pci/isp2401_input_system_global.h
>  create mode 100644
> drivers/staging/media/atomisp/pci/isp2401_input_system_local.h
>  create mode 100644
> drivers/staging/media/atomisp/pci/isp2401_input_system_private.h
>  create mode 100644
> drivers/staging/media/atomisp/pci/isp2401_mamoiada_params.h
>  create mode 100644
> drivers/staging/media/atomisp/pci/isp2401_system_global.h
>  create mode 100644
> drivers/staging/media/atomisp/pci/isp2401_system_local.h
>  create mode 100644
> drivers/staging/media/atomisp/pci/isp_acquisition_defs.h
>  create mode 100644
> drivers/staging/media/atomisp/pci/isp_capture_defs.h
>  create mode 100644
> drivers/staging/media/atomisp/pci/memory_realloc.c
>  create mode 100644 drivers/staging/media/atomisp/pci/mmu/isp_mmu.c
>  create mode 100644
> drivers/staging/media/atomisp/pci/mmu/sh_mmu_mrfld.c
>  create mode 100644 drivers/staging/media/atomisp/pci/mmu_defs.h
>  create mode 100644
> drivers/staging/media/atomisp/pci/runtime/binary/interface/ia_css_bin
> ary.h
>  create mode 100644
> drivers/staging/media/atomisp/pci/runtime/binary/src/binary.c
>  create mode 100644
> drivers/staging/media/atomisp/pci/runtime/bufq/interface/ia_css_bufq.
> h
>  create mode 100644
> drivers/staging/media/atomisp/pci/runtime/bufq/interface/ia_css_bufq_
> comm.h
>  create mode 100644
> drivers/staging/media/atomisp/pci/runtime/bufq/src/bufq.c
>  create mode 100644
> drivers/staging/media/atomisp/pci/runtime/debug/interface/ia_css_debu
> g.h
>  create mode 100644
> drivers/staging/media/atomisp/pci/runtime/debug/interface/ia_css_debu
> g_internal.h
>  create mode 100644
> drivers/staging/media/atomisp/pci/runtime/debug/interface/ia_css_debu
> g_pipe.h
>  create mode 100644
> drivers/staging/media/atomisp/pci/runtime/debug/src/ia_css_debug.c
>  create mode 100644
> drivers/staging/media/atomisp/pci/runtime/event/interface/ia_css_even
> t.h
>  create mode 100644
> drivers/staging/media/atomisp/pci/runtime/event/src/event.c
>  create mode 100644
> drivers/staging/media/atomisp/pci/runtime/eventq/interface/ia_css_eve
> ntq.h
>  create mode 100644
> drivers/staging/media/atomisp/pci/runtime/eventq/src/eventq.c
>  create mode 100644
> drivers/staging/media/atomisp/pci/runtime/frame/interface/ia_css_fram
> e.h
>  create mode 100644
> drivers/staging/media/atomisp/pci/runtime/frame/interface/ia_css_fram
> e_comm.h
>  create mode 100644
> drivers/staging/media/atomisp/pci/runtime/frame/src/frame.c
>  create mode 100644
> drivers/staging/media/atomisp/pci/runtime/ifmtr/interface/ia_css_ifmt
> r.h
>  create mode 100644
> drivers/staging/media/atomisp/pci/runtime/ifmtr/src/ifmtr.c
>  create mode 100644
> drivers/staging/media/atomisp/pci/runtime/inputfifo/interface/ia_css_
> inputfifo.h
>  create mode 100644
> drivers/staging/media/atomisp/pci/runtime/inputfifo/src/inputfifo.c
>  create mode 100644
> drivers/staging/media/atomisp/pci/runtime/isp_param/interface/ia_css_
> isp_param.h
>  create mode 100644
> drivers/staging/media/atomisp/pci/runtime/isp_param/interface/ia_css_
> isp_param_types.h
>  create mode 100644
> drivers/staging/media/atomisp/pci/runtime/isp_param/src/isp_param.c
>  create mode 100644
> drivers/staging/media/atomisp/pci/runtime/isys/interface/ia_css_isys.
> h
>  create mode 100644
> drivers/staging/media/atomisp/pci/runtime/isys/interface/ia_css_isys_
> comm.h
>  create mode 100644
> drivers/staging/media/atomisp/pci/runtime/isys/src/csi_rx_rmgr.c
>  create mode 100644
> drivers/staging/media/atomisp/pci/runtime/isys/src/csi_rx_rmgr.h
>  create mode 100644
> drivers/staging/media/atomisp/pci/runtime/isys/src/ibuf_ctrl_rmgr.c
>  create mode 100644
> drivers/staging/media/atomisp/pci/runtime/isys/src/ibuf_ctrl_rmgr.h
>  create mode 100644
> drivers/staging/media/atomisp/pci/runtime/isys/src/isys_dma_rmgr.c
>  create mode 100644
> drivers/staging/media/atomisp/pci/runtime/isys/src/isys_dma_rmgr.h
>  create mode 100644
> drivers/staging/media/atomisp/pci/runtime/isys/src/isys_init.c
>  create mode 100644
> drivers/staging/media/atomisp/pci/runtime/isys/src/isys_stream2mmio_r
> mgr.c
>  create mode 100644
> drivers/staging/media/atomisp/pci/runtime/isys/src/isys_stream2mmio_r
> mgr.h
>  create mode 100644
> drivers/staging/media/atomisp/pci/runtime/isys/src/rx.c
>  create mode 100644
> drivers/staging/media/atomisp/pci/runtime/isys/src/virtual_isys.c
>  create mode 100644
> drivers/staging/media/atomisp/pci/runtime/isys/src/virtual_isys.h
>  create mode 100644
> drivers/staging/media/atomisp/pci/runtime/pipeline/interface/ia_css_p
> ipeline.h
>  create mode 100644
> drivers/staging/media/atomisp/pci/runtime/pipeline/interface/ia_css_p
> ipeline_common.h
>  create mode 100644
> drivers/staging/media/atomisp/pci/runtime/pipeline/src/pipeline.c
>  create mode 100644
> drivers/staging/media/atomisp/pci/runtime/queue/interface/ia_css_queu
> e.h
>  create mode 100644
> drivers/staging/media/atomisp/pci/runtime/queue/interface/ia_css_queu
> e_comm.h
>  create mode 100644
> drivers/staging/media/atomisp/pci/runtime/queue/src/queue.c
>  create mode 100644
> drivers/staging/media/atomisp/pci/runtime/queue/src/queue_access.c
>  create mode 100644
> drivers/staging/media/atomisp/pci/runtime/queue/src/queue_access.h
>  create mode 100644
> drivers/staging/media/atomisp/pci/runtime/rmgr/interface/ia_css_rmgr.
> h
>  create mode 100644
> drivers/staging/media/atomisp/pci/runtime/rmgr/interface/ia_css_rmgr_
> vbuf.h
>  create mode 100644
> drivers/staging/media/atomisp/pci/runtime/rmgr/src/rmgr.c
>  create mode 100644
> drivers/staging/media/atomisp/pci/runtime/rmgr/src/rmgr_vbuf.c
>  create mode 100644
> drivers/staging/media/atomisp/pci/runtime/spctrl/interface/ia_css_spc
> trl.h
>  create mode 100644
> drivers/staging/media/atomisp/pci/runtime/spctrl/interface/ia_css_spc
> trl_comm.h
>  create mode 100644
> drivers/staging/media/atomisp/pci/runtime/spctrl/src/spctrl.c
>  create mode 100644
> drivers/staging/media/atomisp/pci/runtime/tagger/interface/ia_css_tag
> ger_common.h
>  create mode 100644
> drivers/staging/media/atomisp/pci/runtime/timer/src/timer.c
>  create mode 100644
> drivers/staging/media/atomisp/pci/scalar_processor_2400_params.h
>  create mode 100644 drivers/staging/media/atomisp/pci/sh_css.c
>  create mode 100644 drivers/staging/media/atomisp/pci/sh_css_defs.h
>  create mode 100644
> drivers/staging/media/atomisp/pci/sh_css_dvs_info.h
>  create mode 100644
> drivers/staging/media/atomisp/pci/sh_css_firmware.c
>  create mode 100644
> drivers/staging/media/atomisp/pci/sh_css_firmware.h
>  create mode 100644 drivers/staging/media/atomisp/pci/sh_css_frac.h
>  create mode 100644
> drivers/staging/media/atomisp/pci/sh_css_host_data.c
>  create mode 100644 drivers/staging/media/atomisp/pci/sh_css_hrt.c
>  create mode 100644 drivers/staging/media/atomisp/pci/sh_css_hrt.h
>  create mode 100644
> drivers/staging/media/atomisp/pci/sh_css_internal.h
>  create mode 100644 drivers/staging/media/atomisp/pci/sh_css_legacy.h
>  create mode 100644
> drivers/staging/media/atomisp/pci/sh_css_metadata.c
>  create mode 100644
> drivers/staging/media/atomisp/pci/sh_css_metrics.c
>  create mode 100644
> drivers/staging/media/atomisp/pci/sh_css_metrics.h
>  create mode 100644 drivers/staging/media/atomisp/pci/sh_css_mipi.c
>  create mode 100644 drivers/staging/media/atomisp/pci/sh_css_mipi.h
>  create mode 100644 drivers/staging/media/atomisp/pci/sh_css_mmu.c
>  create mode 100644 drivers/staging/media/atomisp/pci/sh_css_morph.c
>  create mode 100644
> drivers/staging/media/atomisp/pci/sh_css_param_dvs.c
>  create mode 100644
> drivers/staging/media/atomisp/pci/sh_css_param_dvs.h
>  create mode 100644
> drivers/staging/media/atomisp/pci/sh_css_param_shading.c
>  create mode 100644
> drivers/staging/media/atomisp/pci/sh_css_param_shading.h
>  create mode 100644 drivers/staging/media/atomisp/pci/sh_css_params.c
>  create mode 100644 drivers/staging/media/atomisp/pci/sh_css_params.h
>  create mode 100644
> drivers/staging/media/atomisp/pci/sh_css_params_internal.h
>  create mode 100644 drivers/staging/media/atomisp/pci/sh_css_pipe.c
>  create mode 100644
> drivers/staging/media/atomisp/pci/sh_css_properties.c
>  create mode 100644
> drivers/staging/media/atomisp/pci/sh_css_shading.c
>  create mode 100644 drivers/staging/media/atomisp/pci/sh_css_sp.c
>  create mode 100644 drivers/staging/media/atomisp/pci/sh_css_sp.h
>  create mode 100644 drivers/staging/media/atomisp/pci/sh_css_stream.c
>  create mode 100644
> drivers/staging/media/atomisp/pci/sh_css_stream_format.c
>  create mode 100644
> drivers/staging/media/atomisp/pci/sh_css_stream_format.h
>  create mode 100644 drivers/staging/media/atomisp/pci/sh_css_struct.h
>  create mode 100644 drivers/staging/media/atomisp/pci/sh_css_uds.h
>  create mode 100644
> drivers/staging/media/atomisp/pci/sh_css_version.c
>  create mode 100644 drivers/staging/media/atomisp/pci/str2mem_defs.h
>  create mode 100644
> drivers/staging/media/atomisp/pci/streaming_to_mipi_defs.h
>  create mode 100644 drivers/staging/media/atomisp/pci/system_global.h
>  create mode 100644 drivers/staging/media/atomisp/pci/system_local.h
>  create mode 100644
> drivers/staging/media/atomisp/pci/timed_controller_defs.h
>  create mode 100644 drivers/staging/media/atomisp/pci/version.h
>  create mode 100644 drivers/staging/media/atomisp/platform/Makefile
>  create mode 100644 drivers/staging/media/atomisp/platform/intel-
> mid/Makefile
>  create mode 100644 drivers/staging/media/atomisp/platform/intel-
> mid/atomisp_gmin_platform.c
> 
> Thanks,
> Mauro

