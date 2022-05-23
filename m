Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 93741530AF4
	for <lists+linux-media@lfdr.de>; Mon, 23 May 2022 10:02:05 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231528AbiEWHnA (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 23 May 2022 03:43:00 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51532 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230281AbiEWHm4 (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 23 May 2022 03:42:56 -0400
Received: from dfw.source.kernel.org (dfw.source.kernel.org [IPv6:2604:1380:4641:c500::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A6BD3B41
        for <linux-media@vger.kernel.org>; Mon, 23 May 2022 00:42:53 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id 000EF611EE
        for <linux-media@vger.kernel.org>; Mon, 23 May 2022 07:42:52 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 24402C34115
        for <linux-media@vger.kernel.org>; Mon, 23 May 2022 07:42:51 +0000 (UTC)
Message-ID: <8c59ebc3-6279-b085-0d51-35cc4db3ec19@xs4all.nl>
Date:   Mon, 23 May 2022 09:42:50 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.1
Content-Language: en-US
To:     Linux Media Mailing List <linux-media@vger.kernel.org>
From:   Hans Verkuil <hverkuil@xs4all.nl>
Subject: [GIT PULL FOR v5.20] Various fixes/enhancements
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-6.7 required=5.0 tests=BAYES_00,
        HEADER_FROM_DIFFERENT_DOMAINS,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_PASS,
        T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

The following changes since commit 340ce50f75a6bdfe6d1850ca49ef37a8e2765dd1:

  media: hantro: Enable HOLD_CAPTURE_BUF for H.264 (2022-05-17 10:11:19 +0200)

are available in the Git repository at:

  git://linuxtv.org/hverkuil/media_tree.git for-v5.20a

for you to fetch changes up to 0a2a449b157a498018be645742e95379ef857c91:

  media: vivid.rst: document HDMI Video Guard Band control (2022-05-23 09:32:53 +0200)

----------------------------------------------------------------
Benjamin Gaignard (1):
      media: Add P010 video format

Benjamin Marty (1):
      media: i2c: adv7180: fix reserved bit in Video Selection 2

Colin Ian King (1):
      media: platform: exynos-gsc: remove redundant initializations of f_chk_len and f_chk_addr

Eugen Hristev (1):
      media: atmel: atmel-sama7g5-isc: fix warning in configs without OF

Guo Zhengkui (1):
      media: platform: samsung: s5p-jpeg: replace ternary operator with max()

Hans Verkuil (6):
      adv7604: try all infoframe types
      media: cec-adap.c: log when claiming LA fails unexpectedly
      media: v4l2-tpg: add HDMI Video Guard Band test pattern
      media: vivid: add HDMI Video Guard Band control
      media: stkwebcam: deprecate driver, move to staging
      media: vivid.rst: document HDMI Video Guard Band control

Ian Cowan (4):
      staging: media: zoran: add logging macros
      staging: media: zoran: setup videocodec header for debugging macros
      staging: media: zoran: replace all pr_err with zrdev_err as appropriate
      staging: media: zoran: replace dprintk with new debugging macros

Jorge Maidana (2):
      media: cx88: Fix PAL-Nc standard
      media: usbtv: Add PAL-Nc standard

Krzysztof Kozlowski (1):
      media: dt-bindings: qcom,sdm660-camss: document interconnects

Ming Qian (3):
      media: imx-jpeg: Don't fill the description field in struct v4l2_fmtdesc
      media: amphion: support for reloading module
      media: imx-jpeg: Encoder support to set jpeg quality

Vladimir Zapolskiy (1):
      media: camss: Allocate power domain resources dynamically

Wan Jiabing (1):
      st-delta: Remove unneeded NULL check in delta-v4l2

Yang Li (1):
      media: atmel: atmel-isc-base: remove unneeded semicolon

Yang Yingliang (2):
      media: camss: csid: fix wrong size passed to devm_kmalloc_array()
      media: davinci: vpif: add missing of_node_put() in vpif_probe()

Zheyu Ma (1):
      media: TDA1997x: Fix the error handling in tda1997x_probe()

 Documentation/admin-guide/media/vivid.rst                      |  14 ++++++
 Documentation/devicetree/bindings/media/qcom,sdm660-camss.yaml |   7 +++
 Documentation/userspace-api/media/v4l/pixfmt-yuv-planar.rst    |  54 +++++++++++++++++++++
 drivers/media/cec/core/cec-adap.c                              |   5 +-
 drivers/media/common/v4l2-tpg/v4l2-tpg-core.c                  |  38 +++++++++++++++
 drivers/media/i2c/adv7180.c                                    |   5 +-
 drivers/media/i2c/adv7604.c                                    |   5 +-
 drivers/media/i2c/tda1997x.c                                   |   1 +
 drivers/media/pci/cx88/cx88-core.c                             |  22 +++++++--
 drivers/media/platform/amphion/vpu_core.c                      |  11 ++---
 drivers/media/platform/atmel/atmel-isc-base.c                  |   2 +-
 drivers/media/platform/atmel/atmel-sama7g5-isc.c               |   2 +
 drivers/media/platform/nxp/imx-jpeg/mxc-jpeg-hw.c              |  11 +++--
 drivers/media/platform/nxp/imx-jpeg/mxc-jpeg-hw.h              |   1 +
 drivers/media/platform/nxp/imx-jpeg/mxc-jpeg.c                 |  64 ++++++++++++++++++++++++-
 drivers/media/platform/nxp/imx-jpeg/mxc-jpeg.h                 |   2 +
 drivers/media/platform/qcom/camss/camss-csid.c                 |   2 +-
 drivers/media/platform/qcom/camss/camss.c                      |  38 ++++++++-------
 drivers/media/platform/qcom/camss/camss.h                      |   7 ++-
 drivers/media/platform/samsung/exynos-gsc/gsc-core.c           |   3 +-
 drivers/media/platform/samsung/s5p-jpeg/jpeg-core.c            |   2 +-
 drivers/media/platform/st/sti/delta/delta-v4l2.c               |  24 ++++------
 drivers/media/platform/ti/davinci/vpif.c                       |   1 +
 drivers/media/test-drivers/vivid/vivid-ctrls.c                 |  14 ++++++
 drivers/media/usb/Kconfig                                      |   1 -
 drivers/media/usb/Makefile                                     |   1 -
 drivers/media/usb/usbtv/usbtv-video.c                          |   5 +-
 drivers/media/usb/usbtv/usbtv.h                                |   3 +-
 drivers/media/v4l2-core/v4l2-common.c                          |   1 +
 drivers/media/v4l2-core/v4l2-ioctl.c                           |   1 +
 drivers/staging/media/Kconfig                                  |  12 +++--
 drivers/staging/media/Makefile                                 |   1 +
 drivers/{media/usb => staging/media}/stkwebcam/Kconfig         |   8 +++-
 drivers/{media/usb => staging/media}/stkwebcam/Makefile        |   2 +-
 drivers/staging/media/stkwebcam/TODO                           |  12 +++++
 drivers/{media/usb => staging/media}/stkwebcam/stk-sensor.c    |   0
 drivers/{media/usb => staging/media}/stkwebcam/stk-webcam.c    |   0
 drivers/{media/usb => staging/media}/stkwebcam/stk-webcam.h    |   0
 drivers/staging/media/zoran/videocodec.c                       |  93 +++++++++++++++++++-----------------
 drivers/staging/media/zoran/videocodec.h                       |  15 ++++++
 drivers/staging/media/zoran/zoran.h                            |  14 ++++++
 drivers/staging/media/zoran/zr36016.c                          |  91 ++++++++++++++++++-----------------
 drivers/staging/media/zoran/zr36050.c                          | 144 ++++++++++++++++++++++++++++----------------------------
 drivers/staging/media/zoran/zr36060.c                          |  97 ++++++++++++++++++++------------------
 include/media/tpg/v4l2-tpg.h                                   |  16 +++++++
 include/uapi/linux/videodev2.h                                 |   1 +
 46 files changed, 573 insertions(+), 280 deletions(-)
 rename drivers/{media/usb => staging/media}/stkwebcam/Kconfig (68%)
 rename drivers/{media/usb => staging/media}/stkwebcam/Makefile (63%)
 create mode 100644 drivers/staging/media/stkwebcam/TODO
 rename drivers/{media/usb => staging/media}/stkwebcam/stk-sensor.c (100%)
 rename drivers/{media/usb => staging/media}/stkwebcam/stk-webcam.c (100%)
 rename drivers/{media/usb => staging/media}/stkwebcam/stk-webcam.h (100%)
