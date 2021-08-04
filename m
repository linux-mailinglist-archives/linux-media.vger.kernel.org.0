Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id DEFF03E03A8
	for <lists+linux-media@lfdr.de>; Wed,  4 Aug 2021 16:46:55 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238251AbhHDOrH (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 4 Aug 2021 10:47:07 -0400
Received: from lb2-smtp-cloud9.xs4all.net ([194.109.24.26]:40979 "EHLO
        lb2-smtp-cloud9.xs4all.net" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S238135AbhHDOrH (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 4 Aug 2021 10:47:07 -0400
Received: from cust-b5b5937f ([IPv6:fc0c:c16d:66b8:757f:c639:739b:9d66:799d])
        by smtp-cloud9.xs4all.net with ESMTPA
        id BIAPmKb754JsbBIAQmoqJf; Wed, 04 Aug 2021 16:46:53 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=xs4all.nl; s=s2;
        t=1628088413; bh=raaawCinAYz+/udl0d3yfxNkRtF06TfKUSkvZAWEHZc=;
        h=To:From:Subject:Message-ID:Date:MIME-Version:Content-Type:From:
         Subject;
        b=XNJKAuAkHA/2JFp7HWYPkibF5r58xIz4514y42nEbZ0nIndWOHbMKffj7CQxONAG+
         RXCq8ni31x/mpm5uhqC8sOjn16vAZUSu57Vv2qW5Cez9mUqg5am4YrrlQfQPwWIaSc
         bERfLbyT/mh79LPrctKCz6uKW7FFARKfjcrt4R/fl9OStuKoMNFFuh6HQn/FwVljvL
         sTgT23Kjez/8Pf1ByvF1IRevnJDYcSQyJRNAYqWULV5eRj/MqKY/J0sPo52Ht59OeC
         3SByqWegUS6QcXzxgUtLQLeKRcisz4X9T4qMLta0R2Byk6lZjuPeKOu7QqpK7ZEmiu
         WKYTwIGZYtd+g==
To:     Linux Media Mailing List <linux-media@vger.kernel.org>
Cc:     Benjamin Gaignard <benjamin.gaignard@linaro.org>,
        Ezequiel Garcia <ezequiel@collabora.com>,
        Robert Foss <robert.foss@linaro.org>,
        Irui Wang <irui.wang@mediatek.com>
From:   Hans Verkuil <hverkuil@xs4all.nl>
Subject: [GIT PULL FOR v5.15] Various fixes/enhancements
Message-ID: <4eac86a6-af7f-fa85-de05-b3db62e70bf0@xs4all.nl>
Date:   Wed, 4 Aug 2021 16:46:45 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-CMAE-Envelope: MS4xfB4YXDorfODuYNPAHlMk4nEnC27CScyKtm5jZYUK6tI1lkAZZBqIFw+uiK7pXTaE5Dw2P6HNHY6Gjr/zO2+SGL6xUW+CfXiqgSZR03c+fkkaGWWUit1W
 OWCn9hkDp/bSCvXSnIJveYy5+vIQUAizSRaV5eUsilaB+EvezeMaF2kg6ENjJbu3nYvhvZgpkJLMaxjt2iIIvgb5uCmj6EpiMtOmO38j+vIkqVp3l2q/KLP5
 nedyA520YN+WtbnUfexnlshcUjrY2L6350mo+NK6oSvaTOJBzHdfbttGGPBAMTUJEAXIFrX1EP6djlDT9da3EQNUS03oofmul+EQe/QPQSaoOAMCTWVct/N+
 5lMQZFp5cAoHpnRzLsHSmav2qLkMaVejqGIcG3H11DatVNGZSjpNn7iC91kUOh1HPY1vfmJTibxqggISEWxETlNqdVG+8A==
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

The following changes since commit bfee75f73c37a2f46a6326eaa06f5db701f76f01:

  media: venus: venc: add support for V4L2_CID_MPEG_VIDEO_H264_8X8_TRANSFORM control (2021-08-04 14:43:52 +0200)

are available in the Git repository at:

  git://linuxtv.org/hverkuil/media_tree.git tags/br-v5.15f

for you to fetch changes up to 5abb281113e0d023c2bb1b95b2bf2a477a8a24df:

  media: mtk-vcodec: Add MT8195 H264 venc driver (2021-08-04 16:33:03 +0200)

----------------------------------------------------------------
Tag branch

----------------------------------------------------------------
Benjamin Gaignard (2):
      media: hevc: Add scaling matrix control
      media: hantro: Add scaling lists feature

Christophe JAILLET (1):
      media: meson-ge2d: Fix rotation parameter changes detection in 'ge2d_s_ctrl()'

Hans Verkuil (3):
      cedrus: drop min_buffers_needed.
      vivid: add module option to set request support mode
      videobuf2-core: sanity checks for requests and qbuf

Irui Wang (3):
      media: mtk-vcodec: Clean redundant encoder format definition
      dt-bindings: media: mtk-vcodec: Add binding for MT8195 VENC
      media: mtk-vcodec: Add MT8195 H264 venc driver

Krzysztof Hałasa (1):
      TDA1997x: fix tda1997x_remove()

Pavel Skripkin (1):
      media: em28xx: add missing em28xx_close_extension

Pete Hemery (1):
      media: gspca/sn9c20x: Add ability to control built-in webcam LEDs

Robert Foss (4):
      media: camss: vfe: Don't read hardware version needlessly
      media: camss: vfe: Decrease priority of of VFE HW version to 'dbg'
      media: camss: vfe: Remove vfe_hw_version_read() argument
      media: camss: vfe: Rework vfe_hw_version_read() function definition

 Documentation/devicetree/bindings/media/mediatek-vcodec.txt |  1 +
 Documentation/userspace-api/media/v4l/ext-ctrls-codec.rst   | 57 +++++++++++++++++++++++++++++++++++++++
 Documentation/userspace-api/media/v4l/vidioc-queryctrl.rst  |  6 +++++
 drivers/media/common/videobuf2/videobuf2-core.c             | 23 +++++++++++++++-
 drivers/media/i2c/tda1997x.c                                |  4 +--
 drivers/media/platform/meson/ge2d/ge2d.c                    |  6 +----
 drivers/media/platform/mtk-vcodec/mtk_vcodec_drv.h          |  1 +
 drivers/media/platform/mtk-vcodec/mtk_vcodec_enc_drv.c      | 63 +++++++++++++++++++++++---------------------
 drivers/media/platform/qcom/camss/camss-vfe-170.c           |  9 ++++---
 drivers/media/platform/qcom/camss/camss-vfe-4-1.c           |  8 +++---
 drivers/media/platform/qcom/camss/camss-vfe-4-7.c           |  8 +++---
 drivers/media/platform/qcom/camss/camss-vfe-4-8.c           |  8 +++---
 drivers/media/platform/qcom/camss/camss-vfe.c               |  3 +--
 drivers/media/platform/qcom/camss/camss-vfe.h               |  2 +-
 drivers/media/test-drivers/vivid/vivid-core.c               | 14 ++++++++--
 drivers/media/usb/em28xx/em28xx-cards.c                     |  5 +++-
 drivers/media/usb/gspca/sn9c20x.c                           | 22 +++++++++++++++-
 drivers/media/v4l2-core/v4l2-ctrls-core.c                   |  6 +++++
 drivers/media/v4l2-core/v4l2-ctrls-defs.c                   |  4 +++
 drivers/staging/media/hantro/hantro_drv.c                   |  8 +++---
 drivers/staging/media/hantro/hantro_g2_hevc_dec.c           | 52 ++++++++++++++++++++++++++++++++++++
 drivers/staging/media/hantro/hantro_hevc.c                  | 21 +++++++++++++++
 drivers/staging/media/hantro/hantro_hw.h                    |  3 +++
 drivers/staging/media/sunxi/cedrus/cedrus_video.c           |  2 --
 include/media/hevc-ctrls.h                                  | 11 ++++++++
 25 files changed, 285 insertions(+), 62 deletions(-)
