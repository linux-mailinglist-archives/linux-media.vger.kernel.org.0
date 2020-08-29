Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id DA7E625661D
	for <lists+linux-media@lfdr.de>; Sat, 29 Aug 2020 10:43:17 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726333AbgH2InQ (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sat, 29 Aug 2020 04:43:16 -0400
Received: from lb3-smtp-cloud7.xs4all.net ([194.109.24.31]:45471 "EHLO
        lb3-smtp-cloud7.xs4all.net" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1726083AbgH2InQ (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Sat, 29 Aug 2020 04:43:16 -0400
Received: from cust-b5b5937f ([IPv6:fc0c:c16d:66b8:757f:c639:739b:9d66:799d])
        by smtp-cloud7.xs4all.net with ESMTPA
        id BwS8k7BpwooQSBwS9kHVD5; Sat, 29 Aug 2020 10:43:13 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=xs4all.nl; s=s1;
        t=1598690593; bh=CiCaKRJ5MPFZiBWoEzsEFO4ffq3CjutVhh/qnsAzC+k=;
        h=To:From:Subject:Message-ID:Date:MIME-Version:Content-Type:From:
         Subject;
        b=ndVCdTw0LlgKGtdW7+EZKDkAOIrNFfOGOsEbHbMkWI9w+fSSRZ+fZwU70OlzPvzDr
         PRcjXcc+5ecMOPk3Bag0YDGP93W+XA5VVTXAzUqrqV9JmnbQl4Ruxho9Io8LILN8TE
         fDNpJKiq1zmIFekKKvY3LIvNrlqOEDHoaxAXYt4uMIx/npEnLz9UW4cWOIjmB/0DLa
         rCDWr3G6vRuG6KrXukZXQ07KtIKDkp4lyWGrEuEI8ZVvqguE8vC0Yn/JgpXZRZICwb
         K07x4n3g1+qAVFHAMWAU7p0OauSfqTW0USbWyhSQ68Z7rZRenUn1x2oiZ+0Mz85JpV
         5ztMgOXoYQTww==
To:     Linux Media Mailing List <linux-media@vger.kernel.org>
Cc:     Alexandre Courbot <acourbot@chromium.org>
From:   Hans Verkuil <hverkuil@xs4all.nl>
Subject: [GIT PULL FOR v5.10 (v2)] mtk-vcodec: venc: support for MT8183
Message-ID: <22861790-3ae1-2009-a4db-c124067771b2@xs4all.nl>
Date:   Sat, 29 Aug 2020 10:43:12 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-CMAE-Envelope: MS4wfMukcbH3fLOhNw9xhnuHnkwL8HJChb6SXqfWt6qK2wTv3FkAntkZMxNkRffAYjK0gE9RmHkvYi6gVFiImO1EIjnn5Afjw/8QdUKU8QlxVVgdWSc9w7oD
 5qG6tNM0X4RgN9KEYnyctq3qho6i7i/CZTg2zknO4tyK8bIJeM579aKzee3XnCvPpPMk2S63vaEDXJbxgkbPPl+PA87PI2Y4wKtbJLpL5cNay9zW3zjanlS+
 HWQtfBcQmlxv+N8K9lh4gXayI+a7Y3WmS6fwIjbt62N47Wz/Z+mj0jSx3B45oypuxvFCaCe5eqR7CK3Es7LlZA==
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Note 1: the MTK_SCP config option causes COMPILE_TEST to fail, but a patch for that
is pending for the remoteproc tree: https://lkml.org/lkml/2020/8/21/489
I've verified that that patch fixes the COMPILE_TEST failure.

Note 2: the firmware is added to linux-firmware:
https://git.kernel.org/pub/scm/linux/kernel/git/firmware/linux-firmware.git/commit/?h=master&id=3c213aa59661c4641f0c2166a315140ac0445230

Regards,

	Hans

Changes since v1: fixed merge conflicts with patch 1 (media: mtk-vcodec: abstract
firmware interface)

The following changes since commit a0009a133a2d4c3410682c87c2e2904a1e012f47:

  media: venus: Make debug infrastructure more flexible (2020-08-29 10:12:24 +0200)

are available in the Git repository at:

  git://linuxtv.org/hverkuil/media_tree.git tags/br-mt8183

for you to fetch changes up to e06368754756c4fedebb04c7561a1e359102e72e:

  media: mtk-vcodec: make IRQs disabled upon request (2020-08-29 10:39:34 +0200)

----------------------------------------------------------------
Tag branch

----------------------------------------------------------------
Alexandre Courbot (13):
      dt-bindings: media: mtk-vcodec: document SCP node
      media: mtk-vcodec: venc: handle firmware version field
      media: mtk-vcodec: venc: specify bitrate range per-chip
      media: mtk-vcodec: venc: specify supported formats per-chip
      dt-bindings: media: document mediatek,mt8183-vcodec-enc
      Revert "media: mtk-vcodec: Remove extra area allocation in an input buffer on encoding"
      media: mtk-vcodec: venc support MIN_OUTPUT_BUFFERS control
      media: mtk-vcodec: venc: set OUTPUT buffers field to V4L2_FIELD_NONE
      media: mtk-vcodec: venc: use platform data for ENUM_FRAMESIZES
      media: mtk-vcodec: venc: support ENUM_FRAMESIZES on OUTPUT formats
      media: mtk-vcodec: venc: set default time per frame
      media: mtk-vcodec: venc: fix invalid time per frame in S_PARM
      media: mtk-vcodec: make IRQs disabled upon request

Yunfei Dong (4):
      media: mtk-vcodec: abstract firmware interface
      media: mtk-vcodec: add SCP firmware ops
      media: mtk-vcodec: venc: support SCP firmware
      media: mtk-vcodec: add support for MT8183 encoder

 Documentation/devicetree/bindings/media/mediatek-vcodec.txt |   9 +-
 drivers/media/platform/Kconfig                              |   1 +
 drivers/media/platform/mtk-vcodec/Makefile                  |   6 +-
 drivers/media/platform/mtk-vcodec/mtk_vcodec_dec_drv.c      |  54 +++++------
 drivers/media/platform/mtk-vcodec/mtk_vcodec_dec_pm.c       |   1 -
 drivers/media/platform/mtk-vcodec/mtk_vcodec_drv.h          |  40 +++++++-
 drivers/media/platform/mtk-vcodec/mtk_vcodec_enc.c          | 211 +++++++++++++++++++---------------------
 drivers/media/platform/mtk-vcodec/mtk_vcodec_enc_drv.c      | 172 +++++++++++++++++++++++----------
 drivers/media/platform/mtk-vcodec/mtk_vcodec_enc_pm.c       |   2 -
 drivers/media/platform/mtk-vcodec/mtk_vcodec_fw.c           | 231 ++++++++++++++++++++++++++++++++++++++++++++
 drivers/media/platform/mtk-vcodec/mtk_vcodec_fw.h           |  38 ++++++++
 drivers/media/platform/mtk-vcodec/mtk_vcodec_util.c         |   1 -
 drivers/media/platform/mtk-vcodec/vdec/vdec_h264_if.c       |   1 -
 drivers/media/platform/mtk-vcodec/vdec/vdec_vp8_if.c        |   1 -
 drivers/media/platform/mtk-vcodec/vdec/vdec_vp9_if.c        |   1 -
 drivers/media/platform/mtk-vcodec/vdec_drv_base.h           |   2 -
 drivers/media/platform/mtk-vcodec/vdec_drv_if.c             |   1 -
 drivers/media/platform/mtk-vcodec/vdec_vpu_if.c             |  12 ++-
 drivers/media/platform/mtk-vcodec/vdec_vpu_if.h             |  11 ++-
 drivers/media/platform/mtk-vcodec/venc/venc_h264_if.c       |  68 ++++++++++---
 drivers/media/platform/mtk-vcodec/venc/venc_vp8_if.c        |  11 ++-
 drivers/media/platform/mtk-vcodec/venc_drv_if.c             |   1 -
 drivers/media/platform/mtk-vcodec/venc_drv_if.h             |  13 +++
 drivers/media/platform/mtk-vcodec/venc_ipi_msg.h            |  27 +++++-
 drivers/media/platform/mtk-vcodec/venc_vpu_if.c             | 141 ++++++++++++++++++++-------
 drivers/media/platform/mtk-vcodec/venc_vpu_if.h             |   8 +-
 26 files changed, 782 insertions(+), 282 deletions(-)
 create mode 100644 drivers/media/platform/mtk-vcodec/mtk_vcodec_fw.c
 create mode 100644 drivers/media/platform/mtk-vcodec/mtk_vcodec_fw.h
