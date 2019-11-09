Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id C88B3F5F9F
	for <lists+linux-media@lfdr.de>; Sat,  9 Nov 2019 16:02:04 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726349AbfKIPCD (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sat, 9 Nov 2019 10:02:03 -0500
Received: from lb3-smtp-cloud8.xs4all.net ([194.109.24.29]:41301 "EHLO
        lb3-smtp-cloud8.xs4all.net" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1726282AbfKIPCD (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Sat, 9 Nov 2019 10:02:03 -0500
Received: from [192.168.2.10] ([46.9.232.237])
        by smtp-cloud8.xs4all.net with ESMTPA
        id TSFSiLJxCXYiTTSFVi2uYp; Sat, 09 Nov 2019 16:02:01 +0100
To:     Linux Media Mailing List <linux-media@vger.kernel.org>
From:   Hans Verkuil <hverkuil@xs4all.nl>
Subject: [GIT PULL FOR v5.5] Various fixes and enhancements
Message-ID: <ff5eacbd-f3c5-f5d9-88a1-a74ff6ff36f7@xs4all.nl>
Date:   Sat, 9 Nov 2019 16:01:58 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-CMAE-Envelope: MS4wfNFH6xmtaRAyJZ8Wpd2FKuaDyV8xGujQFUOf/UAgdKWKcU/rAgvNHrtIIhd/k2zf6n9QnIeBYy+dc1t1GEPSQXyVamBOPEhJgyAvdHLnvvJPUsaZhnzS
 zRK4KONIoYxPixdu3zeQ1neAMLXG6YYqAbRu3E6v5tsa+FsIh0SbJ1eDP9TpPDIFOaQX8Pk2DlkyeQ==
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

The following changes since commit b0b1c88f1c19aeedb260d1889a7d19838617c97c:

  media: arm64: dts: allwinner: beelink-gs1: Add rc-beelink-gs1 keymap (2019-11-09 09:17:26 +0100)

are available in the Git repository at:

  git://linuxtv.org/hverkuil/media_tree.git tags/br-v5.5r

for you to fetch changes up to abcad34ef8966113959c8deed3592ae661fb2f1d:

  vicodec: media_device_cleanup was called too early (2019-11-09 15:29:09 +0100)

----------------------------------------------------------------
Tag branch

----------------------------------------------------------------
Chuhong Yuan (1):
      media: si470x-i2c: add missed operations in remove

Dafna Hirschfeld (1):
      media: vimc: upon streaming, check that the pipeline starts with a source entity

Hans Verkuil (3):
      v4l2-ioctl.c: zero reserved fields for S/TRY_FMT
      vim2m: media_device_cleanup was called too early
      vicodec: media_device_cleanup was called too early

Hirokazu Honda (1):
      media: mtk-vcodec: Remove extra area allocation in an input buffer on encoding

Jernej Skrabec (3):
      media: cedrus: Properly signal size in mode register
      media: cedrus: Fix H264 4k support
      media: cedrus: Increase maximum supported size

Navid Emamdoost (1):
      media: aspeed-video: Fix memory leaks in aspeed_video_probe

Philipp Zabel (2):
      media: coda: disable encoder compose selections
      media: coda: disable decoder crop selections

Pi-Hsun Shih (1):
      media: v4l2-ctrl: Lock main_hdl on operations of requests_queued.

Pragnesh Patel (1):
      media: dt-bindings: Fix building error for dt_binding_check

Simon Horman (1):
      dt-bindings: sh-mobile-ceu: Remove now unimplemented bindings documentation

zhong jiang (1):
      media: v4l2: Use FIELD_SIZEOF directly

 Documentation/devicetree/bindings/media/allwinner,sun4i-a10-csi.yaml |  2 +-
 Documentation/devicetree/bindings/media/sh_mobile_ceu.txt            | 17 ------
 drivers/media/platform/aspeed-video.c                                |  3 +-
 drivers/media/platform/coda/coda-common.c                            |  6 ++-
 drivers/media/platform/mtk-vcodec/mtk_vcodec_enc.c                   |  9 ++--
 drivers/media/platform/vicodec/vicodec-core.c                        |  4 +-
 drivers/media/platform/vim2m.c                                       |  4 +-
 drivers/media/platform/vimc/vimc-common.c                            | 10 ++++
 drivers/media/platform/vimc/vimc-common.h                            |  8 +++
 drivers/media/platform/vimc/vimc-streamer.c                          | 13 ++++-
 drivers/media/radio/si470x/radio-si470x-i2c.c                        |  2 +
 drivers/media/v4l2-core/v4l2-ctrls.c                                 |  7 +++
 drivers/media/v4l2-core/v4l2-ioctl.c                                 | 26 ++++-----
 drivers/staging/media/sunxi/cedrus/cedrus.h                          |  7 +++
 drivers/staging/media/sunxi/cedrus/cedrus_h264.c                     | 93 ++++++++++++++++++++++++++++----
 drivers/staging/media/sunxi/cedrus/cedrus_h265.c                     |  2 +-
 drivers/staging/media/sunxi/cedrus/cedrus_hw.c                       |  9 +++-
 drivers/staging/media/sunxi/cedrus/cedrus_hw.h                       |  2 +-
 drivers/staging/media/sunxi/cedrus/cedrus_mpeg2.c                    |  2 +-
 drivers/staging/media/sunxi/cedrus/cedrus_regs.h                     | 13 +++++
 drivers/staging/media/sunxi/cedrus/cedrus_video.c                    |  4 +-
 21 files changed, 183 insertions(+), 60 deletions(-)
 delete mode 100644 Documentation/devicetree/bindings/media/sh_mobile_ceu.txt
