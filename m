Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 8D8272C563E
	for <lists+linux-media@lfdr.de>; Thu, 26 Nov 2020 14:45:30 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2390890AbgKZNnR (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 26 Nov 2020 08:43:17 -0500
Received: from lb2-smtp-cloud7.xs4all.net ([194.109.24.28]:44353 "EHLO
        lb2-smtp-cloud7.xs4all.net" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S2390852AbgKZNnQ (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 26 Nov 2020 08:43:16 -0500
Received: from cust-b5b5937f ([IPv6:fc0c:c16d:66b8:757f:c639:739b:9d66:799d])
        by smtp-cloud7.xs4all.net with ESMTPA
        id iHYEkPGqVN7XgiHYIkYuBb; Thu, 26 Nov 2020 14:43:14 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=xs4all.nl; s=s2;
        t=1606398194; bh=n6ExoS7yvmPB1/EfgzBEXRHusmyGXXucfBRt/PjJREQ=;
        h=From:Subject:To:Message-ID:Date:MIME-Version:Content-Type:From:
         Subject;
        b=IeM61rFREtgLlGiL2Ucj5sxwxbEwRwkhgEsiM9edWJjAXbfbQzkWRRuyJJnL9hL1v
         N0CXDtG2uKs27OoKwQCo75rxscRvpBdJLU5b1yonYQIEp96Qah0RngNA17pzs+AwUG
         BPVZsJRG3oI9epFbQCocStT3mtg/GVak4wBCPKWM27Lm3karDJzqgW+4B7Exydn96h
         LANPVBKs21ae2IqlIVqxRRwHPEhUjTM733zzWKvQn0tt3huaZ7PFnQfWMDsDxZdN6P
         PTKSnO2onPs3ND2elW8JwQue0yOV6ZfSY2/o23QPyPPdi8yCdeXxvEjrxLvPS0/rRP
         9wkb7uogjzNqA==
From:   Hans Verkuil <hverkuil@xs4all.nl>
Subject: [GIT PULL FOR v5.11] De-stage H.264 and FWHT stateless codec APIs
To:     Linux Media Mailing List <linux-media@vger.kernel.org>
Cc:     Ezequiel Garcia <ezequiel@collabora.com>
Message-ID: <d68da172-b251-000f-653d-38a8a4c7b715@xs4all.nl>
Date:   Thu, 26 Nov 2020 14:43:10 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.12.0
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-CMAE-Envelope: MS4xfAfmXei734nzcDDRZKXQMMzUIR0TLIi6TwSRQrA9qzddXNyemDc1tLNNL1z0K9yP/8zUjTgToC2bpbtPxA/X+ohrRACk9qlceQ4QAQiAVSfR3Ev0+pYz
 yA1ecRgNFiSiglzUpq4a9hnrTKNoVLoQvXpi23IvL0g2YtNLReX4Rm9QwooES62kGQIw9/GOMgVyMCCCH0daHDlTG5IWc07bXEc45xnIkoopZWtwHgqk7elv
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

This series de-stages the H.264 and FWHT (as used in vicodec) stateless codec APIs.

This means that the APIs for these stateless codecs are now considered stable.

Many thanks to Ezequiel and others who worked hard on making this possible.
The H.264 is probably the most commonly used codec, so having this as part of
the public API is a major step forward.

The de-staging of the FWHT codec is primarily useful for regression testing of
the stateless codec API with the vicodec driver.

The expectation is that MPEG-2 and VP8 will follow soon (although likely not
for 5.11). HEVC and VP9 will take (a lot?) longer.

Besides the patches for H.264 and FWHT there are also some related patches
for doc fixes and a fix for VP8 type initialization (fixes a compliance issue).

Regards,

	Hans

The following changes since commit 4863b93cfd2dfe88557f820b3399c3fa2163ec43:

  media: camss: csiphy: Set rate on csiX_phy clock on SDM630/660 (2020-11-25 15:02:44 +0100)

are available in the Git repository at:

  git://linuxtv.org/hverkuil/media_tree.git tags/br-v5.11b

for you to fetch changes up to b7f6989ec69a25b37350a1a210a74c5823e1f090:

  userspace-api/media: finalize stateless FWHT codec docs (2020-11-26 14:26:17 +0100)

----------------------------------------------------------------
Tag branch

----------------------------------------------------------------
Ezequiel Garcia (13):
      media: controls: Add VP8 stateless type initialization
      media: controls: Add validate failure debug message
      media: cedrus: h264: Support profile controls
      media: Rename stateful codec control macros
      media: Clean stateless control includes
      media: controls: Validate H264 stateless controls
      media: controls: Add the stateless codec control class
      media: uapi: Move parsed H264 pixel format out of staging
      media: doc: Replace symbol for V4L2_CTRL_TYPE_H264_PRED_WEIGHTS
      media: uapi: Move the H264 stateless control types out of staging
      media: controls: Log H264 stateless controls in .std_log
      media: uapi: move H264 stateless controls out of staging
      media: docs: Move the H264 stateless codec uAPI

Hans Verkuil (8):
      media: vidioc-g-ext-ctrls.rst: document V4L2_CTRL_CLASS_DETECT
      media: ext-ctrls-image-source.rst: document v4l2_area
      vicodec: add V4L2_ prefix before FWHT_VERSION and FWHT_FL_*
      vicodec: mark the stateless FWHT API as stable
      ext-ctrls-codec.rst: move FWHT docs to ext-ctrls-codec-stateless.rst
      pixfmt-compressed.rst: fix 'bullet' formatting
      vidioc-g-ext-ctrls.rst: add missing 'struct' before the types
      userspace-api/media: finalize stateless FWHT codec docs

Helen Koike (1):
      media: admin-guide/pixfmt-meta-rkisp1.rst: pixfmt reference conforming with macro

Jonas Karlman (1):
      media: rkvdec: h264: Support profile and level controls

 Documentation/admin-guide/media/rkisp1.rst                          |   4 +-
 Documentation/userspace-api/media/v4l/common.rst                    |   1 +
 Documentation/userspace-api/media/v4l/dev-mem2mem.rst               |   2 +-
 Documentation/userspace-api/media/v4l/ext-ctrls-codec-stateless.rst | 793 +++++++++++++++++++++++++++++
 Documentation/userspace-api/media/v4l/ext-ctrls-codec.rst           | 817 +-----------------------------
 Documentation/userspace-api/media/v4l/ext-ctrls-image-source.rst    |  16 +
 Documentation/userspace-api/media/v4l/extended-controls.rst         |   8 +-
 Documentation/userspace-api/media/v4l/pixfmt-compressed.rst         |  37 +-
 Documentation/userspace-api/media/v4l/pixfmt-meta-rkisp1.rst        |   4 +-
 Documentation/userspace-api/media/v4l/vidioc-g-ext-ctrls.rst        |  44 +-
 Documentation/userspace-api/media/v4l/vidioc-queryctrl.rst          |   6 +
 Documentation/userspace-api/media/videodev2.h.rst.exceptions        |   2 +
 drivers/media/common/cx2341x.c                                      |   4 +-
 drivers/media/platform/s5p-mfc/s5p_mfc_dec.c                        |   2 +-
 drivers/media/platform/s5p-mfc/s5p_mfc_enc.c                        |   2 +-
 drivers/media/test-drivers/vicodec/codec-fwht.c                     |  13 +-
 drivers/media/test-drivers/vicodec/codec-fwht.h                     |  32 --
 drivers/media/test-drivers/vicodec/codec-v4l2-fwht.c                |  88 ++--
 drivers/media/test-drivers/vicodec/vicodec-core.c                   |  46 +-
 drivers/media/v4l2-core/v4l2-ctrls.c                                | 229 ++++++++-
 drivers/staging/media/hantro/hantro_drv.c                           |  26 +-
 drivers/staging/media/hantro/hantro_h264.c                          |   8 +-
 drivers/staging/media/hantro/hantro_hw.h                            |   4 +-
 drivers/staging/media/rkvdec/rkvdec-h264.c                          |   8 +-
 drivers/staging/media/rkvdec/rkvdec.c                               |  39 +-
 drivers/staging/media/sunxi/cedrus/cedrus.c                         |  43 +-
 drivers/staging/media/sunxi/cedrus/cedrus_dec.c                     |  12 +-
 include/media/fwht-ctrls.h                                          |  31 --
 include/media/h264-ctrls.h                                          | 406 ---------------
 include/media/hevc-ctrls.h                                          |  10 +-
 include/media/mpeg2-ctrls.h                                         |   4 +-
 include/media/v4l2-ctrls.h                                          |   2 -
 include/media/v4l2-h264.h                                           |   2 +-
 include/media/vp8-ctrls.h                                           |   2 +-
 include/uapi/linux/v4l2-controls.h                                  | 867 ++++++++++++++++++++++++--------
 include/uapi/linux/videodev2.h                                      |  17 +
 36 files changed, 1948 insertions(+), 1683 deletions(-)
 create mode 100644 Documentation/userspace-api/media/v4l/ext-ctrls-codec-stateless.rst
 delete mode 100644 include/media/fwht-ctrls.h
 delete mode 100644 include/media/h264-ctrls.h
