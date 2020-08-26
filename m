Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 14936252B89
	for <lists+linux-media@lfdr.de>; Wed, 26 Aug 2020 12:42:42 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728363AbgHZKmk (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 26 Aug 2020 06:42:40 -0400
Received: from lb1-smtp-cloud9.xs4all.net ([194.109.24.22]:46607 "EHLO
        lb1-smtp-cloud9.xs4all.net" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1726104AbgHZKmk (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 26 Aug 2020 06:42:40 -0400
Received: from cust-b5b5937f ([IPv6:fc0c:c16d:66b8:757f:c639:739b:9d66:799d])
        by smtp-cloud9.xs4all.net with ESMTPA
        id Ast1kiOFhuuXOAst2kD2fR; Wed, 26 Aug 2020 12:42:37 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=xs4all.nl; s=s1;
        t=1598438557; bh=dksR9w7eRtSk0SaBteKKXpjruMUYkWHUI5pYBGAD9YU=;
        h=To:From:Subject:Message-ID:Date:MIME-Version:Content-Type:From:
         Subject;
        b=VgtJo3vlPqZHmnjsmYZoF36uikfkk8TIMrkP/uA1A1B3lEHd9rDmA9XQydsd0mU/d
         fR+GVibDYZvLdSSO/WLWgWOjY9QNLdgZbcAJRI6/9MEwkeFi2FRq2BOrbQSsnA86Sq
         BWhk/ZEtiD4iLwZ51b54giNA5QFw4tIG+LM7lafNIw7wmdUs5OiU3w4TDiFD2vpW7M
         i22dtVRqtyE+xe9o+dqLgqlIjYLpVym4qKQAEaCW+OyMNt2vGp3BWTSpFmKJyoJu8C
         6sSVEQFq6uWEAmnhQshLYXJucFWTa1Wlf4vbCwjEm2Vt5K1C8coJlJ+Q1kAZnsrXP4
         RGySyXo4XEfIQ==
To:     Linux Media Mailing List <linux-media@vger.kernel.org>
Cc:     Alexandre Courbot <acourbot@chromium.org>,
        Tiffany Lin <tiffany.lin@mediatek.com>
From:   Hans Verkuil <hverkuil@xs4all.nl>
Subject: [GIT PULL FOR v5.10] mtk-vcodec: venc: support for MT8183
Message-ID: <5b4d766c-eeed-11ed-60c6-fa7ee489992f@xs4all.nl>
Date:   Wed, 26 Aug 2020 12:42:35 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-CMAE-Envelope: MS4wfI/3Y73HNH7M1KUwDUpaenjfPQL+XukfrjR7dNF1z+uwfQ0h64AMQTePIGGzxkOd9xzX9krpetseDXI5HMAW7a+42fyqtNK1ER+qRI0KbU1WoxBOMDOX
 NgG5BqHPcxUw8xNzRmj/FUfN9hBZe2tI7HlMJMqX8oqhw60AiMZbtZvfraz/3RFONVp/YvkT33LmcV90kP01GKB1fGER25aRU5Uy2jZj4oi0FqQ6D20SrbP7
 JqQc+3Z8w4YxfsHUT2qAcD9FzjRJCivXHEQYVJM6ot8DTXD/rJTmmP+suzS46wKVeaGPGGrZP93mNUSD2Fji6t7QNcO9EMPgRIScNJUUPiyeS1fkfWGkFfpk
 fUBsdmn3
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

The following changes since commit 9a538b83612c8b5848bf840c2ddcd86dda1c8c76:

  media: venus: core: Add support for opp tables/perf voting (2020-08-18 15:55:56 +0200)

are available in the Git repository at:

  git://linuxtv.org/hverkuil/media_tree.git tags/br-mt8183

for you to fetch changes up to ddd1da79f616f8d9e97aa2428d6fce526a3081e9:

  media: mtk-vcodec: make IRQs disabled upon request (2020-08-26 12:37:35 +0200)

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
 drivers/media/platform/mtk-vcodec/mtk_vcodec_dec_drv.c      |  55 +++++------
 drivers/media/platform/mtk-vcodec/mtk_vcodec_dec_pm.c       |   1 -
 drivers/media/platform/mtk-vcodec/mtk_vcodec_drv.h          |  40 +++++++-
 drivers/media/platform/mtk-vcodec/mtk_vcodec_enc.c          | 211 +++++++++++++++++++---------------------
 drivers/media/platform/mtk-vcodec/mtk_vcodec_enc_drv.c      | 173 +++++++++++++++++++++++----------
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
 26 files changed, 782 insertions(+), 284 deletions(-)
 create mode 100644 drivers/media/platform/mtk-vcodec/mtk_vcodec_fw.c
 create mode 100644 drivers/media/platform/mtk-vcodec/mtk_vcodec_fw.h
