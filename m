Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 1FFE877A797
	for <lists+linux-media@lfdr.de>; Sun, 13 Aug 2023 17:46:42 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231582AbjHMPqh (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sun, 13 Aug 2023 11:46:37 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37740 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231473AbjHMPqh (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Sun, 13 Aug 2023 11:46:37 -0400
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E0922E63
        for <linux-media@vger.kernel.org>; Sun, 13 Aug 2023 08:45:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1691941552;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding;
        bh=St8xxNmqeyJB2gQfSicpz0/NMyy6ifsoHRq0EJIYaCs=;
        b=agEM0lNQq2vrMPEqllZCmMRMzb6sfwxDQ8ahS83ChnpbReac8J/djCi3AWA5fElkKyswXe
        8RUWLf7RoAGEn9wnsfKVWBsNUgA6DIZjrxgkm+9xRkueGGL3Y1vq+g8YjrChQN855C3uO0
        qV/MEyBf5WWBCfsI2rg5vt3Us+70P3w=
Received: from mail-ej1-f69.google.com (mail-ej1-f69.google.com
 [209.85.218.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-10-eISMW8NtPRGG4109vq76zA-1; Sun, 13 Aug 2023 11:45:50 -0400
X-MC-Unique: eISMW8NtPRGG4109vq76zA-1
Received: by mail-ej1-f69.google.com with SMTP id a640c23a62f3a-94a355c9028so218005266b.3
        for <linux-media@vger.kernel.org>; Sun, 13 Aug 2023 08:45:50 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1691941549; x=1692546349;
        h=content-transfer-encoding:content-language:cc:to:subject:from
         :user-agent:mime-version:date:message-id:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=St8xxNmqeyJB2gQfSicpz0/NMyy6ifsoHRq0EJIYaCs=;
        b=iVVUAf3N0wSMQGveG0EjX1zfx+tk3lsi+SCZUsuRtg8HJAx7ZIVWY8BkpITgOHKXsV
         rESEgd5B53VEHqrj/Qe0QsyuoT9LCdeVoVd+CTqyAbfsbRGpuJkSu2f7fGTZvSiTKQ6Z
         7xrEQnI3ZHXY4GrKyrc16JUxqeRx2NUBbJfK6ayfVwttBSzoZuxlD6Ha/aYCIY7QLowc
         PShbDETc/x2egLGp/qi6MfpSpWy/EMVVEscnbd7nLx8rWn8uY/Bas1/6N+uCDNL9R50T
         ix+L3vTRrkr9HmH39Zk+xvzz/ZJp90MkRw6bc86dJQFeIY1q8tLRd5Ty3ryf6u102jDD
         Y8Rw==
X-Gm-Message-State: AOJu0Yz/FAUUEb3DSdL4LhEyK32mwxKIQ7j4BoPpVnDR+AdC0mAiqoJH
        JRbE5GiK4UULJhgEG94i/uffGeRiKMq6Flx+PPvEjVND/jy5jGF8A2mZnWe0zKs5k3o009hSgZI
        IZ8GQv0SijwX1WpK5zO2s8E8=
X-Received: by 2002:a17:907:9715:b0:99b:db4f:68b8 with SMTP id jg21-20020a170907971500b0099bdb4f68b8mr7561350ejc.76.1691941548692;
        Sun, 13 Aug 2023 08:45:48 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEkc2LBXdVSftTlJYRTbPzcOUkV6jgsBMvSytTJ+Pv40aNiEOedaI1g1fSQ+quEU0wvxe5F/w==
X-Received: by 2002:a17:907:9715:b0:99b:db4f:68b8 with SMTP id jg21-20020a170907971500b0099bdb4f68b8mr7561338ejc.76.1691941548347;
        Sun, 13 Aug 2023 08:45:48 -0700 (PDT)
Received: from ?IPV6:2001:1c00:c32:7800:5bfa:a036:83f0:f9ec? (2001-1c00-0c32-7800-5bfa-a036-83f0-f9ec.cable.dynamic.v6.ziggo.nl. [2001:1c00:c32:7800:5bfa:a036:83f0:f9ec])
        by smtp.gmail.com with ESMTPSA id e27-20020a170906375b00b0099caf5bed64sm4694355ejc.57.2023.08.13.08.45.47
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 13 Aug 2023 08:45:47 -0700 (PDT)
Message-ID: <9fbc59f1-abb5-8966-8810-a3b8f57775fc@redhat.com>
Date:   Sun, 13 Aug 2023 17:45:47 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
From:   Hans de Goede <hdegoede@redhat.com>
Subject: [GIT PULL] media: atomisp: Changes for 6.6-1
To:     Mauro Carvalho Chehab <mchehab@kernel.org>,
        Linux Media Mailing List <linux-media@vger.kernel.org>
Cc:     Sakari Ailus <sakari.ailus@linux.intel.com>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        linux-staging@lists.linux.dev, Kate Hsuan <hpa@redhat.com>
Content-Language: en-US, nl
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        RCVD_IN_MSPIKE_H4,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_NONE
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Mauro,

Here are the atomisp changes for 6.6. Most of the patches are from
Kate Hsuan this cycle.

Highlights:
- Complete #ifdef ISP2401 removal work (Kate Hsuan),
  no more CONFIG_VIDEO_ATOMISP_ISP2401. Instead a single build
  now works on both the ISP2400(BYT) and ISP2401(CHT)!
- The ACPI DSDT -> v4l2-subdev fwnode translation code (ipu-bridge) is
  now shared with the IPU3 code (already merged through Sakari's tree)
- Drop the atomisp-ov2680 driver, instead the main ov2680 driver
  can now be used (already merged through Sakari's tree)
- Drop the atomisp-ov5693 driver, instead the main ov5693 driver
  can now be used

Regards,

Hans


The following changes since commit c816786c3b46ebe42c4887933e50a79b35c0a1c3:

  media: i2c: rdacm21: Fix uninitialized value (2023-08-11 13:36:19 +0200)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/hansg/linux.git tags/media-atomisp-6.6-1

for you to fetch changes up to f0bfb0e19c8921468404a10f3c4e8ee4e417249d:

  media: atomisp: Drop atomisp-ov5693 sensor driver (2023-08-13 17:30:38 +0200)

----------------------------------------------------------------
atomisp staging driver changes for 6.6

Highlights:
- Complete #ifdef ISP2401 removal work (Kate Hsuan),
  no more CONFIG_VIDEO_ATOMISP_ISP2401. Instead a single build
  now works on both the ISP2400(BYT) and ISP2401(CHT)!
- The ACPI DSDT -> v4l2-subdev fwnode translation code (ipu-bridge) is
  now shared with the IPU3 code (already merged through Sakari's tree)
- Drop the atomisp-ov2680 driver, instead the main ov2680 driver
  can now be used (already merged through Sakari's tree)
- Drop the atomisp-ov5693 driver, instead the main ov5693 driver
  can now be used

----------------------------------------------------------------
Hans de Goede (15):
      media: atomisp: Fix missing v4l2_fh_release() in atomisp_open() error exit
      media: atomisp: Clamp width to max 1920 pixels when in ATOMISP_RUN_MODE_PREVIEW
      media: atomisp: Change atomisp_enum_framesizes() too small cut off from 2/3th to 5/8th
      media: atomisp: Add some higher resolutions to atomisp_enum_framesizes()
      media: atomisp: Remove support for custom run-mode v4l2-ctrl on sensors
      media: atomisp: Remove v4l2_ctrl_s_ctrl(asd->run_mode) calls from atomisp_open()
      media: atomisp: Remove empty isys_public.h
      media: atomisp: Remove aliases for MIPI_FORMAT_2400_CUSTOM0
      media: atomisp: Mark ia_css_isys_240?_init() static
      media: atomisp: Simplify some if (IS_ISP2401...) statements
      media: atomisp: Drop ia_css_debug_dump_debug_info() and functions only used by it
      media: atomisp: Drop VIDEO_ATOMISP_ISP2401 Kconfig option
      media: atomisp: gc0310: Stop setting v4l2_subdev.fwnode to the endpoint fwnode
      media: atomisp: Disable VCM for OV5693 for now
      media: atomisp: Drop atomisp-ov5693 sensor driver

Kate Hsuan (26):
      media: atomisp: ia_css_debug: Removed unused codes for debug
      media: atomisp: Removed unused HAS_WATCHDOG_SP_THREAD_DEBUG debug
      media: atomisp: sh_css_internal: sh_css_params: Unifying sh_css_sp_group data structure
      media: atomisp: ia_css_debug: Removed debug codes for dumping status
      media: atomisp: Make two individual enum to define the MIPI format
      media: atomisp: Included both input system headers
      media: atomisp: css_2401_system: Remove #ifdef ISP2401 to make the driver generic
      media: atomisp: isys: Removed #if defined(ISP2401) to make driver generic
      media: atomisp: hive_isp_css_common: Removed #if defined(ISP2401) to make driver generic
      media: atomisp: pipeline: Removed #if defined(ISP2401) to make driver generic
      media: atomisp: ifmtr: Removed #if defined(ISP2401) to make driver generic
      media: atomisp: Compile the object codes for a generic driver
      media: atomisp: rx: Removed #if defined(ISP2401) to make driver generic
      media: atomisp: isys_init: Initiate atomisp in a generic manner
      media: atomisp: ia_css_raw.host: Remove #ifdef ISP2401 to make the driver generic
      media: atomisp: binary: Removed #ifdef ISP2401 to make driver generic
      media: atomisp: hive_isp_css_include: Removed #ifdef ISP2401 to make driver generic
      media: atomisp: atomisp_compat_css20: Removed #ifdef ISP2401 to make driver generic
      media: atomisp: sh_css_mipi: Removed unused code ia_css_mipi_frame_enable_check_on_size()
      media: atomisp: sh_css: Removed #ifdef ISP2401 to make the driver generic
      media: atomisp: sh_css_sp: Remove #ifdef ISP2401 to make driver generic
      media: atomisp: sh_css: Removed #ifdef ISP2401 to make driver generic
      media: atomisp: sh_css: Renamed sh_css_config_input_network()
      media: atomisp: sh_css: Removed #ifdef ISP2401 to make code generic
      media: atomisp: sh_css: Removed #ifdef ISP2401 to make the driver generic
      media: atomisp: atomisp_v4l2: Removed unnecessary code

 drivers/staging/media/atomisp/Kconfig              |   12 -
 drivers/staging/media/atomisp/Makefile             |   16 +-
 drivers/staging/media/atomisp/TODO                 |    3 -
 drivers/staging/media/atomisp/i2c/Kconfig          |   12 -
 drivers/staging/media/atomisp/i2c/Makefile         |    1 -
 drivers/staging/media/atomisp/i2c/atomisp-gc0310.c |   20 +-
 drivers/staging/media/atomisp/i2c/ov5693/Makefile  |    2 -
 drivers/staging/media/atomisp/i2c/ov5693/ad5823.h  |   63 -
 .../media/atomisp/i2c/ov5693/atomisp-ov5693.c      | 1763 --------------------
 drivers/staging/media/atomisp/i2c/ov5693/ov5693.h  | 1331 ---------------
 .../staging/media/atomisp/include/linux/atomisp.h  |   10 -
 drivers/staging/media/atomisp/pci/atomisp_cmd.c    |   26 +-
 drivers/staging/media/atomisp/pci/atomisp_cmd.h    |   13 -
 .../media/atomisp/pci/atomisp_compat_css20.c       |   14 +-
 .../media/atomisp/pci/atomisp_csi2_bridge.c        |    7 +-
 drivers/staging/media/atomisp/pci/atomisp_fops.c   |    7 +-
 drivers/staging/media/atomisp/pci/atomisp_ioctl.c  |   21 +-
 drivers/staging/media/atomisp/pci/atomisp_subdev.c |   48 -
 drivers/staging/media/atomisp/pci/atomisp_subdev.h |    2 -
 drivers/staging/media/atomisp/pci/atomisp_v4l2.c   |   19 -
 .../pci/css_2401_system/host/isys_irq_local.h      |    3 -
 .../pci/css_2401_system/host/isys_irq_private.h    |    2 -
 .../atomisp/pci/css_2401_system/isys_irq_global.h  |    2 -
 .../atomisp/pci/hive_isp_css_common/debug_global.h |    7 -
 .../atomisp/pci/hive_isp_css_common/host/dma.c     |  266 ---
 .../pci/hive_isp_css_common/host/dma_local.h       |  116 --
 .../pci/hive_isp_css_common/host/input_formatter.c |    2 -
 .../pci/hive_isp_css_common/host/input_system.c    |  446 -----
 .../atomisp/pci/hive_isp_css_common/host/irq.c     |   19 -
 .../pci/hive_isp_css_common/host/irq_local.h       |    8 -
 .../atomisp/pci/hive_isp_css_common/host/isp.c     |   60 -
 .../pci/hive_isp_css_common/host/isp_local.h       |   31 -
 .../atomisp/pci/hive_isp_css_common/host/sp.c      |   47 -
 .../pci/hive_isp_css_common/host/sp_local.h        |   26 -
 .../pci/hive_isp_css_include/host/csi_rx_public.h  |    2 -
 .../pci/hive_isp_css_include/host/dma_public.h     |   13 -
 .../pci/hive_isp_css_include/host/irq_public.h     |   10 -
 .../pci/hive_isp_css_include/host/isp_public.h     |   13 -
 .../hive_isp_css_include/host/isys_dma_public.h    |    2 -
 .../hive_isp_css_include/host/isys_irq_public.h    |    2 -
 .../pci/hive_isp_css_include/host/isys_public.h    |   38 -
 .../hive_isp_css_include/host/pixelgen_public.h    |    2 -
 .../pci/hive_isp_css_include/host/sp_public.h      |   16 -
 .../atomisp/pci/hive_isp_css_include/isys_irq.h    |    2 -
 .../staging/media/atomisp/pci/ia_css_acc_types.h   |    6 +-
 drivers/staging/media/atomisp/pci/ia_css_mipi.h    |   16 -
 .../staging/media/atomisp/pci/input_system_local.h |    7 +-
 .../media/atomisp/pci/input_system_private.h       |    7 +-
 .../media/atomisp/pci/input_system_public.h        |    4 +-
 .../pci/isp/kernels/raw/raw_1.0/ia_css_raw.host.c  |   21 +-
 .../media/atomisp/pci/isp2400_input_system_local.h |  198 +--
 .../atomisp/pci/isp2400_input_system_private.h     |    4 +-
 .../atomisp/pci/isp2400_input_system_public.h      |   42 +-
 .../media/atomisp/pci/isp2401_input_system_local.h |   88 +-
 .../atomisp/pci/isp2401_input_system_private.h     |  112 +-
 .../media/atomisp/pci/runtime/binary/src/binary.c  |   15 +-
 .../pci/runtime/debug/interface/ia_css_debug.h     |   85 -
 .../atomisp/pci/runtime/debug/src/ia_css_debug.c   | 1493 -----------------
 .../media/atomisp/pci/runtime/ifmtr/src/ifmtr.c    |    2 -
 .../pci/runtime/isys/interface/ia_css_isys.h       |    9 +-
 .../pci/runtime/isys/interface/ia_css_isys_comm.h  |    2 -
 .../atomisp/pci/runtime/isys/src/csi_rx_rmgr.c     |    2 -
 .../atomisp/pci/runtime/isys/src/isys_dma_rmgr.c   |    2 -
 .../media/atomisp/pci/runtime/isys/src/isys_init.c |   35 +-
 .../pci/runtime/isys/src/isys_stream2mmio_rmgr.c   |    2 -
 .../media/atomisp/pci/runtime/isys/src/rx.c        |  265 +--
 .../atomisp/pci/runtime/isys/src/virtual_isys.c    |    8 +-
 .../runtime/pipeline/interface/ia_css_pipeline.h   |    2 -
 .../atomisp/pci/runtime/pipeline/src/pipeline.c    |    2 -
 drivers/staging/media/atomisp/pci/sh_css.c         |  236 ++-
 .../staging/media/atomisp/pci/sh_css_internal.h    |   41 +-
 drivers/staging/media/atomisp/pci/sh_css_mipi.c    |   29 -
 drivers/staging/media/atomisp/pci/sh_css_params.c  |   41 +-
 drivers/staging/media/atomisp/pci/sh_css_sp.c      |   62 +-
 drivers/staging/media/atomisp/pci/sh_css_sp.h      |    4 -
 75 files changed, 485 insertions(+), 6882 deletions(-)
 delete mode 100644 drivers/staging/media/atomisp/i2c/ov5693/Makefile
 delete mode 100644 drivers/staging/media/atomisp/i2c/ov5693/ad5823.h
 delete mode 100644 drivers/staging/media/atomisp/i2c/ov5693/atomisp-ov5693.c
 delete mode 100644 drivers/staging/media/atomisp/i2c/ov5693/ov5693.h
 delete mode 100644 drivers/staging/media/atomisp/pci/hive_isp_css_include/host/isys_public.h

