Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 3A0453E459A
	for <lists+linux-media@lfdr.de>; Mon,  9 Aug 2021 14:28:47 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235133AbhHIM3G (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 9 Aug 2021 08:29:06 -0400
Received: from lb2-smtp-cloud7.xs4all.net ([194.109.24.28]:57339 "EHLO
        lb2-smtp-cloud7.xs4all.net" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S235361AbhHIM3F (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 9 Aug 2021 08:29:05 -0400
Received: from cust-b5b5937f ([IPv6:fc0c:c16d:66b8:757f:c639:739b:9d66:799d])
        by smtp-cloud7.xs4all.net with ESMTPA
        id D4OWm0UBU4SnAD4OammRtK; Mon, 09 Aug 2021 14:28:44 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=xs4all.nl; s=s2;
        t=1628512124; bh=uIVo65t8w9oq0oCsQyz5D+5t8L2wh9JsWusJ1xpibQY=;
        h=To:From:Subject:Message-ID:Date:MIME-Version:Content-Type:From:
         Subject;
        b=qpkDJCBQ+HEYOiT4/+gF6qgP7+4vk8KdllluUC9FIbADmp2h3VJpVXrpa/8TqFspw
         0dY97OJ6dVYRliIxsy3gwjOyZ8sfF8sWrFKdaFaI7ej7jIHD8T6EI6W1pXC5zW6TA5
         lyu+5na7TTEq0jxxKJTYiQaPhcGi93V6LuMQQuXGN9wGFYU4523ORe+A7DF46VQq/I
         zUFCqTOf3X1cVpLdrEqmV654FptFRY51rKLD+n/BWAUFl33umdBp5oOvE1BTaA4xkN
         wa9Jw/bazQhBEV38NMUsbtH2aqKtCpz08wIP8kyv1/uP/LCF7V0gfA/BqDzhX+1/Wx
         0QhDAjAHj35ug==
To:     Linux Media Mailing List <linux-media@vger.kernel.org>
Cc:     Tzung-Bi Shih <tzungbi@google.com>,
        Alexandre Courbot <acourbot@chromium.org>
From:   Hans Verkuil <hverkuil@xs4all.nl>
Subject: [GIT PULL FOR v5.15] mtk-vcodec: support for MT8183 decoder
Message-ID: <97ed8ac5-32ce-0603-f7a1-e9763016b71f@xs4all.nl>
Date:   Mon, 9 Aug 2021 14:28:40 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Firefox/78.0 Thunderbird/78.12.0
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-CMAE-Envelope: MS4xfHZTZNCNfmlUFkLyhNe1322+/4sLbvdXB9X+34ZsgROTG/0wUheCS6zFCzfPOnb4Zp6f0913+7891RdCI4X0s7Hv9bOgbDXM89l0nD53lK07zqpWDHqR
 G75LAdPuCBKgAV5eG9D/52lF3FvysYHU9wUJogDSbo7AqBM//X5k9SSTNLviF2aVM9bR9rzvJklpYLtrMPqtg8+IO3XQEfHxtQmGNq1XqJnWw+NRMH2hQP8M
 VFdMIUxB70utBgVqrhLUPg==
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

The following changes since commit 6daa9f32282ac76b8996f5291fb387d685786288:

  media: Clean V4L2_PIX_FMT_NV12MT documentation (2021-08-06 10:54:04 +0200)

are available in the Git repository at:

  git://linuxtv.org/hverkuil/media_tree.git tags/br-v5.15g

for you to fetch changes up to ab7cbbc9a178b68c08aafcce6570d4bdeb0c92f8:

  media: mtk-vcodec: enable MT8183 decoder (2021-08-09 13:26:09 +0200)

----------------------------------------------------------------
Tag branch

----------------------------------------------------------------
Alexandre Courbot (8):
      media: mtk-vcodec: vdec: use helpers in VIDIOC_(TRY_)DECODER_CMD
      media: mtk-vcodec: vdec: clamp OUTPUT resolution to hardware limits
      media: mtk-vcodec: make flush buffer reusable by encoder
      media: mtk-vcodec: venc: support START and STOP commands
      media: mtk-vcodec: vdec: handle firmware version field
      media: mtk-vcodec: support version 2 of decoder firmware ABI
      media: add Mediatek's MM21 format
      dt-bindings: media: document mediatek,mt8183-vcodec-dec

Hirokazu Honda (1):
      media: mtk-vcodec: vdec: Support H264 profile control

Yunfei Dong (5):
      media: mtk-vcodec: vdec: move stateful ops into their own file
      media: mtk-vcodec: vdec: support stateless API
      media: mtk-vcodec: vdec: support stateless H.264 decoding
      media: mtk-vcodec: vdec: add media device if using stateless api
      media: mtk-vcodec: enable MT8183 decoder

 Documentation/devicetree/bindings/media/mediatek-vcodec.txt  |   1 +
 Documentation/userspace-api/media/v4l/pixfmt-reserved.rst    |   7 +
 drivers/media/platform/Kconfig                               |   3 +
 drivers/media/platform/mtk-vcodec/Makefile                   |   3 +
 drivers/media/platform/mtk-vcodec/mtk_vcodec_dec.c           | 820 ++++++---------------------------------
 drivers/media/platform/mtk-vcodec/mtk_vcodec_dec.h           |  25 +-
 drivers/media/platform/mtk-vcodec/mtk_vcodec_dec_drv.c       |  68 +++-
 drivers/media/platform/mtk-vcodec/mtk_vcodec_dec_stateful.c  | 628 ++++++++++++++++++++++++++++++
 drivers/media/platform/mtk-vcodec/mtk_vcodec_dec_stateless.c | 360 +++++++++++++++++
 drivers/media/platform/mtk-vcodec/mtk_vcodec_drv.h           |  58 ++-
 drivers/media/platform/mtk-vcodec/mtk_vcodec_enc.c           | 140 ++++++-
 drivers/media/platform/mtk-vcodec/mtk_vcodec_enc_drv.c       |   6 +-
 drivers/media/platform/mtk-vcodec/vdec/vdec_h264_req_if.c    | 774 ++++++++++++++++++++++++++++++++++++
 drivers/media/platform/mtk-vcodec/vdec_drv_if.c              |   3 +
 drivers/media/platform/mtk-vcodec/vdec_drv_if.h              |   1 +
 drivers/media/platform/mtk-vcodec/vdec_ipi_msg.h             |  23 +-
 drivers/media/platform/mtk-vcodec/vdec_vpu_if.c              |  43 +-
 drivers/media/platform/mtk-vcodec/vdec_vpu_if.h              |   5 +
 drivers/media/v4l2-core/v4l2-ioctl.c                         |   1 +
 include/uapi/linux/videodev2.h                               |   1 +
 20 files changed, 2241 insertions(+), 729 deletions(-)
 create mode 100644 drivers/media/platform/mtk-vcodec/mtk_vcodec_dec_stateful.c
 create mode 100644 drivers/media/platform/mtk-vcodec/mtk_vcodec_dec_stateless.c
 create mode 100644 drivers/media/platform/mtk-vcodec/vdec/vdec_h264_req_if.c
