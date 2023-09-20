Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 29B527A78A0
	for <lists+linux-media@lfdr.de>; Wed, 20 Sep 2023 12:09:55 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234128AbjITKJ6 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 20 Sep 2023 06:09:58 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39196 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233786AbjITKJ5 (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 20 Sep 2023 06:09:57 -0400
Received: from inva021.nxp.com (inva021.nxp.com [92.121.34.21])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id EAA95AD;
        Wed, 20 Sep 2023 03:09:50 -0700 (PDT)
Received: from inva021.nxp.com (localhost [127.0.0.1])
        by inva021.eu-rdc02.nxp.com (Postfix) with ESMTP id 63D11200B77;
        Wed, 20 Sep 2023 12:09:48 +0200 (CEST)
Received: from aprdc01srsp001v.ap-rdc01.nxp.com (aprdc01srsp001v.ap-rdc01.nxp.com [165.114.16.16])
        by inva021.eu-rdc02.nxp.com (Postfix) with ESMTP id 092EB200B82;
        Wed, 20 Sep 2023 12:09:48 +0200 (CEST)
Received: from localhost.localdomain (shlinux2.ap.freescale.net [10.192.224.44])
        by aprdc01srsp001v.ap-rdc01.nxp.com (Postfix) with ESMTP id 2632A180327D;
        Wed, 20 Sep 2023 18:09:46 +0800 (+08)
From:   Shengjiu Wang <shengjiu.wang@nxp.com>
To:     hverkuil@xs4all.nl, sakari.ailus@iki.fi, tfiga@chromium.org,
        m.szyprowski@samsung.com, mchehab@kernel.org,
        linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
        shengjiu.wang@gmail.com, Xiubo.Lee@gmail.com, festevam@gmail.com,
        nicoleotsuka@gmail.com, lgirdwood@gmail.com, broonie@kernel.org,
        perex@perex.cz, tiwai@suse.com, alsa-devel@alsa-project.org,
        linuxppc-dev@lists.ozlabs.org
Subject: [RFC PATCH v4 00/11] Add audio support in v4l2 framework
Date:   Wed, 20 Sep 2023 17:32:39 +0800
Message-Id: <1695202370-24678-1-git-send-email-shengjiu.wang@nxp.com>
X-Mailer: git-send-email 2.7.4
X-Virus-Scanned: ClamAV using ClamSMTP
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,
        RCVD_IN_DNSWL_BLOCKED,SPF_HELO_NONE,SPF_PASS autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Audio signal processing also has the requirement for memory to
memory similar as Video.

This asrc memory to memory (memory ->asrc->memory) case is a non
real time use case.

User fills the input buffer to the asrc module, after conversion, then asrc
sends back the output buffer to user. So it is not a traditional ALSA playback
and capture case.

It is a specific use case,  there is no reference in current kernel.
v4l2 memory to memory is the closed implementation,  v4l2 current
support video, image, radio, tuner, touch devices, so it is not
complicated to add support for this specific audio case.

Because we had implemented the "memory -> asrc ->i2s device-> codec"
use case in ALSA.  Now the "memory->asrc->memory" needs
to reuse the code in asrc driver, so the first 3 patches is for refining
the code to make it can be shared by the "memory->asrc->memory"
driver.

The main change is in the v4l2 side, A /dev/vl4-audioX will be created,
user applications only use the ioctl of v4l2 framework.

Other change is to add memory to memory support for two kinds of i.MX ASRC
module.

changes in v4:
- update document style
- separate V4L2_AUDIO_FMT_LPCM and V4L2_CAP_AUDIO_M2M in separate commit

changes in v3:
- Modify documents for adding audio m2m support
- Add audio virtual m2m driver
- Defined V4L2_AUDIO_FMT_LPCM format type for audio.
- Defined V4L2_CAP_AUDIO_M2M capability type for audio m2m case.
- with modification in v4l-utils, pass v4l2-compliance test.

changes in v2:
- decouple the implementation in v4l2 and ALSA
- implement the memory to memory driver as a platfrom driver
  and move it to driver/media
- move fsl_asrc_common.h to include/sound folder

Shengjiu Wang (11):
  ASoC: fsl_asrc: define functions for memory to memory usage
  ASoC: fsl_easrc: define functions for memory to memory usage
  ASoC: fsl_asrc: move fsl_asrc_common.h to include/sound
  ASoC: fsl_asrc: register m2m platform device
  ASoC: fsl_easrc: register m2m platform device
  media: uapi: Add V4L2_CAP_AUDIO_M2M capability flag
  media: uapi: Add V4L2_AUDIO_FMT_LPCM fourcc format
  media: v4l2: Add audio capture and output support
  media: uapi: Add V4L2_CID_USER_IMX_ASRC_RATIO_MOD control
  media: audm2m: add virtual driver for audio memory to memory
  media: imx-asrc: Add memory to memory driver

 .../userspace-api/media/v4l/audio-formats.rst |   15 +
 .../userspace-api/media/v4l/buffer.rst        |    6 +
 .../userspace-api/media/v4l/control.rst       |    5 +
 .../userspace-api/media/v4l/dev-audio.rst     |   63 +
 .../userspace-api/media/v4l/devices.rst       |    1 +
 .../media/v4l/pixfmt-aud-lpcm.rst             |   61 +
 .../userspace-api/media/v4l/pixfmt.rst        |    1 +
 .../media/v4l/vidioc-enum-fmt.rst             |    2 +
 .../userspace-api/media/v4l/vidioc-g-fmt.rst  |    4 +
 .../media/v4l/vidioc-querycap.rst             |    3 +
 .../media/videodev2.h.rst.exceptions          |    3 +
 .../media/common/videobuf2/videobuf2-v4l2.c   |    4 +
 drivers/media/platform/nxp/Kconfig            |   12 +
 drivers/media/platform/nxp/Makefile           |    1 +
 drivers/media/platform/nxp/imx-asrc.c         | 1058 +++++++++++++++++
 drivers/media/test-drivers/Kconfig            |    9 +
 drivers/media/test-drivers/Makefile           |    1 +
 drivers/media/test-drivers/audm2m.c           |  767 ++++++++++++
 drivers/media/v4l2-core/v4l2-ctrls-defs.c     |    1 +
 drivers/media/v4l2-core/v4l2-dev.c            |   17 +
 drivers/media/v4l2-core/v4l2-ioctl.c          |   53 +
 include/media/v4l2-dev.h                      |    2 +
 include/media/v4l2-ioctl.h                    |   34 +
 .../fsl => include/sound}/fsl_asrc_common.h   |   54 +
 include/uapi/linux/v4l2-controls.h            |    1 +
 include/uapi/linux/videodev2.h                |   25 +
 sound/soc/fsl/fsl_asrc.c                      |  162 +++
 sound/soc/fsl/fsl_asrc.h                      |    4 +-
 sound/soc/fsl/fsl_asrc_dma.c                  |    2 +-
 sound/soc/fsl/fsl_easrc.c                     |  239 ++++
 sound/soc/fsl/fsl_easrc.h                     |    8 +-
 31 files changed, 2615 insertions(+), 3 deletions(-)
 create mode 100644 Documentation/userspace-api/media/v4l/audio-formats.rst
 create mode 100644 Documentation/userspace-api/media/v4l/dev-audio.rst
 create mode 100644 Documentation/userspace-api/media/v4l/pixfmt-aud-lpcm.rst
 create mode 100644 drivers/media/platform/nxp/imx-asrc.c
 create mode 100644 drivers/media/test-drivers/audm2m.c
 rename {sound/soc/fsl => include/sound}/fsl_asrc_common.h (60%)

-- 
2.34.1

