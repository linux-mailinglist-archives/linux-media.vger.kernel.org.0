Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D87D53F05E2
	for <lists+linux-media@lfdr.de>; Wed, 18 Aug 2021 16:12:02 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238701AbhHROMc (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 18 Aug 2021 10:12:32 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46340 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S238812AbhHROM3 (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 18 Aug 2021 10:12:29 -0400
Received: from mail-pj1-x1033.google.com (mail-pj1-x1033.google.com [IPv6:2607:f8b0:4864:20::1033])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2C404C0613CF
        for <linux-media@vger.kernel.org>; Wed, 18 Aug 2021 07:11:54 -0700 (PDT)
Received: by mail-pj1-x1033.google.com with SMTP id mq2-20020a17090b3802b0290178911d298bso2430209pjb.1
        for <linux-media@vger.kernel.org>; Wed, 18 Aug 2021 07:11:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=pathpartnertech.com; s=google;
        h=mime-version:from:to:cc:subject:date:message-id;
        bh=QcwSbPxWcyCiQlx40vgLiu0D1/qtaBvovjk2c4PYfGM=;
        b=YSqXYtkzLdBKyiB07T/eRaPzpcz27mCmoMd54o8B9/VLjtQuEXci8YQB725sy2iP8N
         7TUu0dzqIlSz4WhzuvZ9KMRk2Yj2fwZWZ62ny/7HnjAAu3BfL1y2k7Fg2+RZFsY2qHIL
         8DmksIkvFl8XypbLgEmxncCce6RsO50k3DvCI6AWFLZH8v9wp8xsDJXzvYmuCoRqwMqe
         wfgXPPVKErDj5cNuMnwATZ3hsR9gWphar5vmuSv6ZhU39gzIHEojG1WoxJtlRqKYV+hu
         mVIw+9NMRuihg3J0r+sNdwY4GPZRkJwweI3LD++ACpZxE4901Wk9e5Jums6OcLhYhEbY
         r+Cg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=mime-version:x-gm-message-state:from:to:cc:subject:date:message-id;
        bh=QcwSbPxWcyCiQlx40vgLiu0D1/qtaBvovjk2c4PYfGM=;
        b=lNDWGJhQLJ96L8/2bX+iiUd5SpitgJ4pcPPWguTafeUGJ29Tx9QTfjJwBa3+o28UFR
         aun8SJZZQrCEcxKORPzbGrGELx92kdt6rBsXoMZgr2uw4OM0JIOwlXo4ynrhHMZzAJ7H
         SZiqWUoaMAyG27uQ8EVs/k0LNHSqrMDpJzEhpjFUXZ3Ih1egfFHrb4+HNTCmnnVaAglK
         jevrTuJ1I3MpCYmTCs+D/incZF9/OZ95y9xL53+BuS9PNiqql+RCd6KVL34+JBoGuvt7
         qHfZTf3Xln3r5uWNL59NbfWGsBv1tddqakozfx79wxI7tX3Aof65OodFZeZ8DKTOL07z
         6new==
MIME-Version: 1.0
X-Gm-Message-State: AOAM531jZPYI4KYEIdnLlfbvAcfkJmwh9OD3h1IcYFptY5KlsIFcpZq2
        xdAp3ZEyxRlnsbQ14qmdwTXoiHEuQ5T1s7vicxTNF/LCcGtqKZf4ycKN8CSeWhcnUmA9kWjf0Gh
        Jm1gIfUtLbAooOgw82iDAgQ0JxPA=
X-Google-Smtp-Source: ABdhPJxnvxcjdTSevV513RWyKbyjWN+0/Z7wdWq4NSE8AuaMNULyX6ZCpBYuUa1j7AkGLL4fgWOKQw==
X-Received: by 2002:a17:90b:3b92:: with SMTP id pc18mr9242436pjb.149.1629295913584;
        Wed, 18 Aug 2021 07:11:53 -0700 (PDT)
Received: from localhost.localdomain ([49.207.214.181])
        by smtp.gmail.com with ESMTPSA id e8sm8084343pgg.31.2021.08.18.07.11.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 18 Aug 2021 07:11:53 -0700 (PDT)
From:   sidraya.bj@pathpartnertech.com
To:     gregkh@linuxfoundation.org, linux-staging@lists.linux.dev,
        linux-kernel@vger.kernel.org
Cc:     prashanth.ka@pathpartnertech.com, praneeth@ti.com,
        mchehab@kernel.org, linux-media@vger.kernel.org,
        praveen.ap@pathpartnertech.com,
        Sidraya <sidraya.bj@pathpartnertech.com>
Subject: [PATCH 00/30] TI Video Decoder driver upstreaming to v5.14-rc6 kernel
Date:   Wed, 18 Aug 2021 19:40:07 +0530
Message-Id: <20210818141037.19990-1-sidraya.bj@pathpartnertech.com>
X-Mailer: git-send-email 2.17.1
Content-Type: text/plain; charset="US-ASCII"
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

From: Sidraya <sidraya.bj@pathpartnertech.com>

This series of patches implements v4l2 based Decoder driver for H264,
H265 and MJPEG decoding standards.This Driver is for D5520 H/W decoder on
DRA8x SOC of J721e platform.
This driver has been tested on v5.14-rc6 kernel for following
decoding standards on v4l2 based Gstreamer 1.16 plug-in.
1. H264
2. H265
3. MJPEG

Note:
Currently Driver uses list, map and queue custom data structure APIs
implementation and IOMMU custom framework.We are working on replacing
customised APIs with Linux kernel generic framework APIs.
Meanwhile would like to address review comments from
reviewers before merging to main media/platform subsystem.

Sidraya (30):
  dt-bindings: Add binding for img,d5500-vxd for DRA8x
  v4l: vxd-dec: Create mmu programming helper library
  v4l: vxd-dec: Create vxd_dec Mem Manager helper library
  v4l: vxd-dec: Add vxd helper library
  v4l: vxd-dec: Add IMG VXD Video Decoder mem to mem drive
  v4l: vxd-dec: Add hardware control modules
  v4l: vxd-dec: Add vxd core module
  v4l: vxd-dec: Add translation control modules
  v4l: vxd-dec: Add idgen api modules
  v4l: vxd-dec: Add utility modules
  v4l: vxd-dec: Add TALMMU module
  v4l: vxd-dec: Add VDEC MMU wrapper
  v4l: vxd-dec: Add Bistream Preparser (BSPP) module
  v4l: vxd-dec: Add common headers
  v4l: vxd-dec: Add firmware interface headers
  v4l: vxd-dec: Add pool api modules
  v4l: vxd-dec: This patch implements resource manage component
  v4l: vxd-dec: This patch implements pixel processing library
  v4l:vxd-dec:vdecdd utility library
  v4l:vxd-dec:Decoder resource component
  v4l:vxd-dec:Decoder Core Component
  v4l:vxd-dec:vdecdd headers added
  v4l:vxd-dec:Decoder Component
  v4l:vxd-dec: Add resource manager
  v4l: videodev2: Add 10bit definitions for NV12 and NV16 color formats
  media: Kconfig: Add Video decoder kconfig and Makefile entries
  media: platform: vxd: Kconfig: Add Video decoder Kconfig and Makefile
  IMG DEC V4L2 Interface function implementations
  arm64: dts: dra82: Add v4l2 vxd_dec device node
  ARM64: ti_sdk_arm64_release_defconfig: Enable d5520 video decoder
    driver

 .../bindings/media/img,d5520-vxd.yaml         |   52 +
 MAINTAINERS                                   |  114 +
 arch/arm64/boot/dts/ti/k3-j721e-main.dtsi     |    9 +
 .../configs/ti_sdk_arm64_release_defconfig    | 7407 +++++++++++++++++
 drivers/media/v4l2-core/v4l2-ioctl.c          |    2 +
 drivers/staging/media/Kconfig                 |    2 +
 drivers/staging/media/Makefile                |    1 +
 drivers/staging/media/vxd/common/addr_alloc.c |  499 ++
 drivers/staging/media/vxd/common/addr_alloc.h |  238 +
 drivers/staging/media/vxd/common/dq.c         |  248 +
 drivers/staging/media/vxd/common/dq.h         |   36 +
 drivers/staging/media/vxd/common/hash.c       |  481 ++
 drivers/staging/media/vxd/common/hash.h       |   86 +
 drivers/staging/media/vxd/common/idgen_api.c  |  449 +
 drivers/staging/media/vxd/common/idgen_api.h  |   59 +
 drivers/staging/media/vxd/common/img_errors.h |  104 +
 drivers/staging/media/vxd/common/img_mem.h    |   43 +
 .../staging/media/vxd/common/img_mem_man.c    | 1124 +++
 .../staging/media/vxd/common/img_mem_man.h    |  231 +
 .../media/vxd/common/img_mem_unified.c        |  276 +
 drivers/staging/media/vxd/common/imgmmu.c     |  782 ++
 drivers/staging/media/vxd/common/imgmmu.h     |  180 +
 drivers/staging/media/vxd/common/lst.c        |  119 +
 drivers/staging/media/vxd/common/lst.h        |   37 +
 drivers/staging/media/vxd/common/pool.c       |  228 +
 drivers/staging/media/vxd/common/pool.h       |   66 +
 drivers/staging/media/vxd/common/pool_api.c   |  709 ++
 drivers/staging/media/vxd/common/pool_api.h   |  113 +
 drivers/staging/media/vxd/common/ra.c         |  972 +++
 drivers/staging/media/vxd/common/ra.h         |  200 +
 drivers/staging/media/vxd/common/resource.c   |  576 ++
 drivers/staging/media/vxd/common/resource.h   |   66 +
 drivers/staging/media/vxd/common/rman_api.c   |  620 ++
 drivers/staging/media/vxd/common/rman_api.h   |   66 +
 drivers/staging/media/vxd/common/talmmu_api.c |  753 ++
 drivers/staging/media/vxd/common/talmmu_api.h |  246 +
 drivers/staging/media/vxd/common/vid_buf.h    |   42 +
 drivers/staging/media/vxd/common/work_queue.c |  188 +
 drivers/staging/media/vxd/common/work_queue.h |   66 +
 drivers/staging/media/vxd/decoder/Kconfig     |   13 +
 drivers/staging/media/vxd/decoder/Makefile    |  129 +
 drivers/staging/media/vxd/decoder/bspp.c      | 2479 ++++++
 drivers/staging/media/vxd/decoder/bspp.h      |  363 +
 drivers/staging/media/vxd/decoder/bspp_int.h  |  514 ++
 drivers/staging/media/vxd/decoder/core.c      | 3656 ++++++++
 drivers/staging/media/vxd/decoder/core.h      |   72 +
 .../staging/media/vxd/decoder/dec_resources.c |  554 ++
 .../staging/media/vxd/decoder/dec_resources.h |   46 +
 drivers/staging/media/vxd/decoder/decoder.c   | 4622 ++++++++++
 drivers/staging/media/vxd/decoder/decoder.h   |  375 +
 .../staging/media/vxd/decoder/fw_interface.h  |  818 ++
 drivers/staging/media/vxd/decoder/h264_idx.h  |   60 +
 .../media/vxd/decoder/h264_secure_parser.c    | 3051 +++++++
 .../media/vxd/decoder/h264_secure_parser.h    |  278 +
 drivers/staging/media/vxd/decoder/h264_vlc.h  |  604 ++
 .../staging/media/vxd/decoder/h264fw_data.h   |  652 ++
 .../media/vxd/decoder/h264fw_data_shared.h    |  759 ++
 .../media/vxd/decoder/hevc_secure_parser.c    | 2895 +++++++
 .../media/vxd/decoder/hevc_secure_parser.h    |  455 +
 .../staging/media/vxd/decoder/hevcfw_data.h   |  472 ++
 .../media/vxd/decoder/hevcfw_data_shared.h    |  767 ++
 .../staging/media/vxd/decoder/hw_control.c    | 1211 +++
 .../staging/media/vxd/decoder/hw_control.h    |  144 +
 .../media/vxd/decoder/img_dec_common.h        |  278 +
 .../media/vxd/decoder/img_msvdx_cmds.h        |  279 +
 .../media/vxd/decoder/img_msvdx_core_regs.h   |   22 +
 .../media/vxd/decoder/img_msvdx_vdmc_regs.h   |   26 +
 .../media/vxd/decoder/img_msvdx_vec_regs.h    |   60 +
 .../staging/media/vxd/decoder/img_pixfmts.h   |  195 +
 .../media/vxd/decoder/img_profiles_levels.h   |   33 +
 .../media/vxd/decoder/img_pvdec_core_regs.h   |   60 +
 .../media/vxd/decoder/img_pvdec_pixel_regs.h  |   35 +
 .../media/vxd/decoder/img_pvdec_test_regs.h   |   39 +
 .../media/vxd/decoder/img_vdec_fw_msg.h       |  192 +
 .../vxd/decoder/img_video_bus4_mmu_regs.h     |  120 +
 .../media/vxd/decoder/jpeg_secure_parser.c    |  645 ++
 .../media/vxd/decoder/jpeg_secure_parser.h    |   37 +
 .../staging/media/vxd/decoder/jpegfw_data.h   |   83 +
 .../media/vxd/decoder/jpegfw_data_shared.h    |   84 +
 drivers/staging/media/vxd/decoder/mem_io.h    |   42 +
 drivers/staging/media/vxd/decoder/mmu_defs.h  |   42 +
 drivers/staging/media/vxd/decoder/pixel_api.c |  895 ++
 drivers/staging/media/vxd/decoder/pixel_api.h |  152 +
 .../media/vxd/decoder/pvdec_entropy_regs.h    |   33 +
 drivers/staging/media/vxd/decoder/pvdec_int.h |   82 +
 .../media/vxd/decoder/pvdec_vec_be_regs.h     |   35 +
 drivers/staging/media/vxd/decoder/reg_io2.h   |   74 +
 .../staging/media/vxd/decoder/scaler_setup.h  |   59 +
 drivers/staging/media/vxd/decoder/swsr.c      | 1657 ++++
 drivers/staging/media/vxd/decoder/swsr.h      |  278 +
 .../media/vxd/decoder/translation_api.c       | 1725 ++++
 .../media/vxd/decoder/translation_api.h       |   42 +
 drivers/staging/media/vxd/decoder/vdec_defs.h |  548 ++
 .../media/vxd/decoder/vdec_mmu_wrapper.c      |  829 ++
 .../media/vxd/decoder/vdec_mmu_wrapper.h      |  174 +
 .../staging/media/vxd/decoder/vdecdd_defs.h   |  446 +
 .../staging/media/vxd/decoder/vdecdd_utils.c  |   95 +
 .../staging/media/vxd/decoder/vdecdd_utils.h  |   93 +
 .../media/vxd/decoder/vdecdd_utils_buf.c      |  897 ++
 .../staging/media/vxd/decoder/vdecfw_share.h  |   36 +
 .../staging/media/vxd/decoder/vdecfw_shared.h |  893 ++
 drivers/staging/media/vxd/decoder/vxd_core.c  | 1683 ++++
 drivers/staging/media/vxd/decoder/vxd_dec.c   |  185 +
 drivers/staging/media/vxd/decoder/vxd_dec.h   |  477 ++
 drivers/staging/media/vxd/decoder/vxd_ext.h   |   74 +
 drivers/staging/media/vxd/decoder/vxd_int.c   | 1137 +++
 drivers/staging/media/vxd/decoder/vxd_int.h   |  128 +
 .../staging/media/vxd/decoder/vxd_mmu_defs.h  |   30 +
 drivers/staging/media/vxd/decoder/vxd_props.h |   80 +
 drivers/staging/media/vxd/decoder/vxd_pvdec.c | 1745 ++++
 .../media/vxd/decoder/vxd_pvdec_priv.h        |  126 +
 .../media/vxd/decoder/vxd_pvdec_regs.h        |  779 ++
 drivers/staging/media/vxd/decoder/vxd_v4l2.c  | 2129 +++++
 include/uapi/linux/videodev2.h                |    2 +
 114 files changed, 62369 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/media/img,d5520-vxd.yaml
 create mode 100644 arch/arm64/configs/ti_sdk_arm64_release_defconfig
 create mode 100644 drivers/staging/media/vxd/common/addr_alloc.c
 create mode 100644 drivers/staging/media/vxd/common/addr_alloc.h
 create mode 100644 drivers/staging/media/vxd/common/dq.c
 create mode 100644 drivers/staging/media/vxd/common/dq.h
 create mode 100644 drivers/staging/media/vxd/common/hash.c
 create mode 100644 drivers/staging/media/vxd/common/hash.h
 create mode 100644 drivers/staging/media/vxd/common/idgen_api.c
 create mode 100644 drivers/staging/media/vxd/common/idgen_api.h
 create mode 100644 drivers/staging/media/vxd/common/img_errors.h
 create mode 100644 drivers/staging/media/vxd/common/img_mem.h
 create mode 100644 drivers/staging/media/vxd/common/img_mem_man.c
 create mode 100644 drivers/staging/media/vxd/common/img_mem_man.h
 create mode 100644 drivers/staging/media/vxd/common/img_mem_unified.c
 create mode 100644 drivers/staging/media/vxd/common/imgmmu.c
 create mode 100644 drivers/staging/media/vxd/common/imgmmu.h
 create mode 100644 drivers/staging/media/vxd/common/lst.c
 create mode 100644 drivers/staging/media/vxd/common/lst.h
 create mode 100644 drivers/staging/media/vxd/common/pool.c
 create mode 100644 drivers/staging/media/vxd/common/pool.h
 create mode 100644 drivers/staging/media/vxd/common/pool_api.c
 create mode 100644 drivers/staging/media/vxd/common/pool_api.h
 create mode 100644 drivers/staging/media/vxd/common/ra.c
 create mode 100644 drivers/staging/media/vxd/common/ra.h
 create mode 100644 drivers/staging/media/vxd/common/resource.c
 create mode 100644 drivers/staging/media/vxd/common/resource.h
 create mode 100644 drivers/staging/media/vxd/common/rman_api.c
 create mode 100644 drivers/staging/media/vxd/common/rman_api.h
 create mode 100644 drivers/staging/media/vxd/common/talmmu_api.c
 create mode 100644 drivers/staging/media/vxd/common/talmmu_api.h
 create mode 100644 drivers/staging/media/vxd/common/vid_buf.h
 create mode 100644 drivers/staging/media/vxd/common/work_queue.c
 create mode 100644 drivers/staging/media/vxd/common/work_queue.h
 create mode 100644 drivers/staging/media/vxd/decoder/Kconfig
 create mode 100644 drivers/staging/media/vxd/decoder/Makefile
 create mode 100644 drivers/staging/media/vxd/decoder/bspp.c
 create mode 100644 drivers/staging/media/vxd/decoder/bspp.h
 create mode 100644 drivers/staging/media/vxd/decoder/bspp_int.h
 create mode 100644 drivers/staging/media/vxd/decoder/core.c
 create mode 100644 drivers/staging/media/vxd/decoder/core.h
 create mode 100644 drivers/staging/media/vxd/decoder/dec_resources.c
 create mode 100644 drivers/staging/media/vxd/decoder/dec_resources.h
 create mode 100644 drivers/staging/media/vxd/decoder/decoder.c
 create mode 100644 drivers/staging/media/vxd/decoder/decoder.h
 create mode 100644 drivers/staging/media/vxd/decoder/fw_interface.h
 create mode 100644 drivers/staging/media/vxd/decoder/h264_idx.h
 create mode 100644 drivers/staging/media/vxd/decoder/h264_secure_parser.c
 create mode 100644 drivers/staging/media/vxd/decoder/h264_secure_parser.h
 create mode 100644 drivers/staging/media/vxd/decoder/h264_vlc.h
 create mode 100644 drivers/staging/media/vxd/decoder/h264fw_data.h
 create mode 100644 drivers/staging/media/vxd/decoder/h264fw_data_shared.h
 create mode 100644 drivers/staging/media/vxd/decoder/hevc_secure_parser.c
 create mode 100644 drivers/staging/media/vxd/decoder/hevc_secure_parser.h
 create mode 100644 drivers/staging/media/vxd/decoder/hevcfw_data.h
 create mode 100644 drivers/staging/media/vxd/decoder/hevcfw_data_shared.h
 create mode 100644 drivers/staging/media/vxd/decoder/hw_control.c
 create mode 100644 drivers/staging/media/vxd/decoder/hw_control.h
 create mode 100644 drivers/staging/media/vxd/decoder/img_dec_common.h
 create mode 100644 drivers/staging/media/vxd/decoder/img_msvdx_cmds.h
 create mode 100644 drivers/staging/media/vxd/decoder/img_msvdx_core_regs.h
 create mode 100644 drivers/staging/media/vxd/decoder/img_msvdx_vdmc_regs.h
 create mode 100644 drivers/staging/media/vxd/decoder/img_msvdx_vec_regs.h
 create mode 100644 drivers/staging/media/vxd/decoder/img_pixfmts.h
 create mode 100644 drivers/staging/media/vxd/decoder/img_profiles_levels.h
 create mode 100644 drivers/staging/media/vxd/decoder/img_pvdec_core_regs.h
 create mode 100644 drivers/staging/media/vxd/decoder/img_pvdec_pixel_regs.h
 create mode 100644 drivers/staging/media/vxd/decoder/img_pvdec_test_regs.h
 create mode 100644 drivers/staging/media/vxd/decoder/img_vdec_fw_msg.h
 create mode 100644 drivers/staging/media/vxd/decoder/img_video_bus4_mmu_regs.h
 create mode 100644 drivers/staging/media/vxd/decoder/jpeg_secure_parser.c
 create mode 100644 drivers/staging/media/vxd/decoder/jpeg_secure_parser.h
 create mode 100644 drivers/staging/media/vxd/decoder/jpegfw_data.h
 create mode 100644 drivers/staging/media/vxd/decoder/jpegfw_data_shared.h
 create mode 100644 drivers/staging/media/vxd/decoder/mem_io.h
 create mode 100644 drivers/staging/media/vxd/decoder/mmu_defs.h
 create mode 100644 drivers/staging/media/vxd/decoder/pixel_api.c
 create mode 100644 drivers/staging/media/vxd/decoder/pixel_api.h
 create mode 100644 drivers/staging/media/vxd/decoder/pvdec_entropy_regs.h
 create mode 100644 drivers/staging/media/vxd/decoder/pvdec_int.h
 create mode 100644 drivers/staging/media/vxd/decoder/pvdec_vec_be_regs.h
 create mode 100644 drivers/staging/media/vxd/decoder/reg_io2.h
 create mode 100644 drivers/staging/media/vxd/decoder/scaler_setup.h
 create mode 100644 drivers/staging/media/vxd/decoder/swsr.c
 create mode 100644 drivers/staging/media/vxd/decoder/swsr.h
 create mode 100644 drivers/staging/media/vxd/decoder/translation_api.c
 create mode 100644 drivers/staging/media/vxd/decoder/translation_api.h
 create mode 100644 drivers/staging/media/vxd/decoder/vdec_defs.h
 create mode 100644 drivers/staging/media/vxd/decoder/vdec_mmu_wrapper.c
 create mode 100644 drivers/staging/media/vxd/decoder/vdec_mmu_wrapper.h
 create mode 100644 drivers/staging/media/vxd/decoder/vdecdd_defs.h
 create mode 100644 drivers/staging/media/vxd/decoder/vdecdd_utils.c
 create mode 100644 drivers/staging/media/vxd/decoder/vdecdd_utils.h
 create mode 100644 drivers/staging/media/vxd/decoder/vdecdd_utils_buf.c
 create mode 100644 drivers/staging/media/vxd/decoder/vdecfw_share.h
 create mode 100644 drivers/staging/media/vxd/decoder/vdecfw_shared.h
 create mode 100644 drivers/staging/media/vxd/decoder/vxd_core.c
 create mode 100644 drivers/staging/media/vxd/decoder/vxd_dec.c
 create mode 100644 drivers/staging/media/vxd/decoder/vxd_dec.h
 create mode 100644 drivers/staging/media/vxd/decoder/vxd_ext.h
 create mode 100644 drivers/staging/media/vxd/decoder/vxd_int.c
 create mode 100644 drivers/staging/media/vxd/decoder/vxd_int.h
 create mode 100644 drivers/staging/media/vxd/decoder/vxd_mmu_defs.h
 create mode 100644 drivers/staging/media/vxd/decoder/vxd_props.h
 create mode 100644 drivers/staging/media/vxd/decoder/vxd_pvdec.c
 create mode 100644 drivers/staging/media/vxd/decoder/vxd_pvdec_priv.h
 create mode 100644 drivers/staging/media/vxd/decoder/vxd_pvdec_regs.h
 create mode 100644 drivers/staging/media/vxd/decoder/vxd_v4l2.c

-- 
2.17.1


-- 






This
message contains confidential information and is intended only 
for the
individual(s) named. If you are not the intended
recipient, you are 
notified that disclosing, copying, distributing or taking any
action in 
reliance on the contents of this mail and attached file/s is strictly
prohibited. Please notify the
sender immediately and delete this e-mail 
from your system. E-mail transmission
cannot be guaranteed to be secured or 
error-free as information could be
intercepted, corrupted, lost, destroyed, 
arrive late or incomplete, or contain
viruses. The sender therefore does 
not accept liability for any errors or
omissions in the contents of this 
message, which arise as a result of e-mail
transmission.
