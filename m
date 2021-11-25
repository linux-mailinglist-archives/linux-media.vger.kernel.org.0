Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 2320545D854
	for <lists+linux-media@lfdr.de>; Thu, 25 Nov 2021 11:39:48 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1347648AbhKYKm5 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 25 Nov 2021 05:42:57 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36044 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1354483AbhKYKk5 (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 25 Nov 2021 05:40:57 -0500
Received: from lb1-smtp-cloud9.xs4all.net (lb1-smtp-cloud9.xs4all.net [IPv6:2001:888:0:108::1c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5282EC06173E
        for <linux-media@vger.kernel.org>; Thu, 25 Nov 2021 02:36:05 -0800 (PST)
Received: from cust-b5b5937f ([IPv6:fc0c:c16d:66b8:757f:c639:739b:9d66:799d])
        by smtp-cloud9.xs4all.net with ESMTPA
        id qC6im6cAw1HGJqC6lm33L8; Thu, 25 Nov 2021 11:36:03 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=xs4all.nl; s=s2;
        t=1637836563; bh=DuB3sIV9qAlM1nzK0E28+6fjmKgEolqX/IRiUu6l2Qw=;
        h=To:From:Subject:Message-ID:Date:MIME-Version:Content-Type:From:
         Subject;
        b=wQa88C5xH5aSatJzLeJnF3RB6BhNhoVNALAKholrIweoxdlYauwolj8BMaCkdxnpS
         5mn8b8dG7V+xlOYj2kHNyvw4vX3F7pd6JzVDdS0t4JknCfxMKlDK5mewXd57yo8JxQ
         bdZjBR3PdAkIbh2S9mY734lja25OZkz0i1NNuXUMcLcePgsYzKBZ4rnJMuU1NdPHaX
         Vr14+vR4+OaMqUUCVdgECJ0GY4lWpSedptr/NV8IAxdD9zSjpBgnrIkCNbr6xcRjiF
         9MnOYhKaj3DZk3f79gXsofZErS8z5ySM3o3Xu0P/YQ4sRth3TnP0b4DYxQWdCSzSvr
         N7DqN0wMDODww==
To:     Linux Media Mailing List <linux-media@vger.kernel.org>
Cc:     Fabio Estevam <festevam@gmail.com>,
        Dafna Hirschfeld <dafna.hirschfeld@collabora.com>
From:   Hans Verkuil <hverkuil@xs4all.nl>
Subject: [GIT PULL FOR v5.17] Various fixes and enhancements
Message-ID: <ffd5ab45-3295-2051-e2ce-5395507de975@xs4all.nl>
Date:   Thu, 25 Nov 2021 11:35:59 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Firefox/78.0 Thunderbird/78.14.0
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-CMAE-Envelope: MS4xfOREj9wTlRcXOvvAtZOXfjxQLeEQu0eNQ9EUiBbth/hJLxowHUFoW0wn4Bi3aJDsyoHBwImKd3Qr9dI0fXpw6+n8z+5SGeSvK6sswu792Ie83IXMnj8c
 GL9v8X2ck4NjTY++8l3LGPcsVLeqeZxr5Lo3lhmUPbjfvkVkk0RmfyfwYkSNcDWw588pSm1Fso45S77WhITyxJktii6dFc/ejlQYF7I1LhYEUW5ZCllod206
 vvAZmr/iM5y0Vd1BJY+f/lGzs64L3fiG0m4E6xNkgjQ=
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

The following changes since commit b1b447e2f3e1ec0c3e9716f4f74d056461f69ab3:

  media: mxl5005s: drop some dead code (2021-11-24 20:06:42 +0100)

are available in the Git repository at:

  git://linuxtv.org/hverkuil/media_tree.git tags/br-v5.17d

for you to fetch changes up to e87cda7d5ce3c4fd2ad5e3b4f9c238281cf92c43:

  libv4l-introduction.rst: fix undefined label (2021-11-25 11:33:55 +0100)

----------------------------------------------------------------
Tag branch

----------------------------------------------------------------
Alexandre Courbot (1):
      media: docs: dev-decoder: add restrictions about CAPTURE buffers

Andrzej Hajda (1):
      MAINTAINERS: Update email of Andrzej Hajda

Chen-Yu Tsai (1):
      media: hantro: Hook up RK3399 JPEG encoder output

Christophe JAILLET (1):
      media: mtk-vcodec: Fix an error handling path in 'mtk_vcodec_probe()'

Dafna Hirschfeld (4):
      media: mtk-vcodec: call v4l2_m2m_ctx_release first when file is released
      media: mtk-vcodec: fix debugging defines
      media: mtk-vcodec: replace func vidioc_try_fmt with two funcs for out/cap
      media: mtk-vcodec: don't check return val of mtk_venc_get_q_data

Dmitry Osipenko (1):
      media: staging: tegra-vde: Reorder misc device registration

Dongliang Mu (3):
      driver: hva: add pm_runtime_disable in the error handling code of hva_hw_probe
      driver: bdisp: add pm_runtime_disable in the error handling code
      driver: s3c_camif: move s3c_camif_unregister_subdev out of camif_unregister_media_entities

Fabio Estevam (2):
      media: imx-pxp: Initialize the spinlock prior to using it
      media: imx-pxp: Add rotation support

Guo Zhengkui (1):
      media: imx: fix boolreturn.cocci warning:

Hans Verkuil (5):
      vb2: frame_vector.c: don't overwrite error code
      cec: safely unhook lists in cec_data
      pvrusb2: fix inconsistent indenting
      omap3isp.h: fix kernel-doc warnings
      libv4l-introduction.rst: fix undefined label

James Cowgill (1):
      media: hantro: Avoid global variable for jpeg quantization tables

Philipp Zabel (1):
      media: coda: fix CODA960 JPEG encoder buffer overflow

Rikard Falkeborn (2):
      media: imx: Constify static struct v4l2_m2m_ops
      staging: media: rkvdec: Constify static struct v4l2_m2m_ops

Robert Foss (1):
      media: camss: Remove unused static function

Suresh Udipi (3):
      media: rcar-csi2: Correct the selection of hsfreqrange
      media: rcar-csi2: Add warning for PHY speed less than minimum
      media: rcar-csi2: Optimize the selection PHTW register

Tang Bin (1):
      media: rcar_fdp1: Fix the correct variable assignments

Thierry Reding (2):
      media: staging: tegra-vde: Support reference picture marking
      media: staging: tegra-vde: Properly mark invalid entries

Uwe Kleine-König (1):
      s5c73m3: Drop empty spi_driver remove callback

Xu Wang (1):
      media: mtk-jpeg: Remove unnecessary print function dev_err()

Yang Yingliang (1):
      media: si470x-i2c: fix possible memory leak in si470x_i2c_probe()

 .mailmap                                                      |   1 +
 Documentation/userspace-api/media/v4l/dev-decoder.rst         |  17 ++++++
 Documentation/userspace-api/media/v4l/libv4l-introduction.rst |   2 +-
 MAINTAINERS                                                   |  13 +++--
 drivers/media/cec/core/cec-adap.c                             |   8 ++-
 drivers/media/cec/core/cec-api.c                              |   2 +-
 drivers/media/common/videobuf2/frame_vector.c                 |  15 ++++-
 drivers/media/i2c/s5c73m3/s5c73m3-spi.c                       |   6 --
 drivers/media/platform/coda/coda-common.c                     |   8 ++-
 drivers/media/platform/coda/coda-jpeg.c                       |  21 ++++++-
 drivers/media/platform/imx-pxp.c                              |  35 ++++++++++--
 drivers/media/platform/mtk-jpeg/mtk_jpeg_core.c               |   4 +-
 drivers/media/platform/mtk-vcodec/mtk_vcodec_dec_drv.c        |   5 +-
 drivers/media/platform/mtk-vcodec/mtk_vcodec_enc.c            | 188 +++++++++++++++++++++++++++------------------------------------
 drivers/media/platform/mtk-vcodec/mtk_vcodec_enc_drv.c        |   5 +-
 drivers/media/platform/mtk-vcodec/mtk_vcodec_util.c           |  10 ----
 drivers/media/platform/mtk-vcodec/mtk_vcodec_util.h           |  45 ++++-----------
 drivers/media/platform/mtk-vcodec/vdec/vdec_h264_req_if.c     |   4 +-
 drivers/media/platform/omap3isp/omap3isp.h                    |   2 +
 drivers/media/platform/qcom/camss/camss-vfe-170.c             |   7 ---
 drivers/media/platform/rcar-vin/rcar-csi2.c                   |  22 +++++++-
 drivers/media/platform/rcar_fdp1.c                            |   7 +--
 drivers/media/platform/s3c-camif/camif-core.c                 |   2 +-
 drivers/media/platform/sti/bdisp/bdisp-v4l2.c                 |   1 +
 drivers/media/platform/sti/hva/hva-hw.c                       |   4 +-
 drivers/media/radio/si470x/radio-si470x-i2c.c                 |   3 +-
 drivers/media/usb/pvrusb2/pvrusb2-encoder.c                   |   4 +-
 drivers/media/usb/pvrusb2/pvrusb2-hdw.c                       |  33 ++++++-----
 drivers/staging/media/hantro/hantro_h1_jpeg_enc.c             |   7 +--
 drivers/staging/media/hantro/hantro_hw.h                      |   3 +-
 drivers/staging/media/hantro/hantro_jpeg.c                    |  31 +++--------
 drivers/staging/media/hantro/hantro_jpeg.h                    |   4 +-
 drivers/staging/media/hantro/rockchip_vpu2_hw_jpeg_enc.c      |  22 +++++++-
 drivers/staging/media/hantro/rockchip_vpu_hw.c                |   5 +-
 drivers/staging/media/imx/imx-media-csc-scaler.c              |   2 +-
 drivers/staging/media/imx/imx-media-csi.c                     |   2 +-
 drivers/staging/media/rkvdec/rkvdec.c                         |   2 +-
 drivers/staging/media/tegra-vde/vde.c                         | 147 ++++++++++++++++++++++++++++++++++++++++++++-----
 drivers/staging/media/tegra-vde/vde.h                         |  18 ++++++
 39 files changed, 445 insertions(+), 272 deletions(-)
