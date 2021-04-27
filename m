Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 5828736C4C5
	for <lists+linux-media@lfdr.de>; Tue, 27 Apr 2021 13:15:41 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235469AbhD0LQW (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 27 Apr 2021 07:16:22 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39750 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235097AbhD0LQV (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 27 Apr 2021 07:16:21 -0400
Received: from mail-pf1-x431.google.com (mail-pf1-x431.google.com [IPv6:2607:f8b0:4864:20::431])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1DD3AC061574
        for <linux-media@vger.kernel.org>; Tue, 27 Apr 2021 04:15:37 -0700 (PDT)
Received: by mail-pf1-x431.google.com with SMTP id 10so5705492pfl.1
        for <linux-media@vger.kernel.org>; Tue, 27 Apr 2021 04:15:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=xfEaEDQVwiPeknn/7rxsBjQT1YtGx/uq9boloX7WxVM=;
        b=fzagj6SrztFzR6Z2jFqhcDdT94/7HWAM+FEIiDIM1HlVgwA3tIpSPcLl9rX0/e9QnT
         Cqm6X4Ic5TYc/NasXdjqtrQo/XaXbNxEjy+uIwuoY1LxqM+tgHi/JWsqjuAMhk/LM3JY
         k0CkRFGs4EuNsQ2n/AZXjJcwJhac8OHj9Shsc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=xfEaEDQVwiPeknn/7rxsBjQT1YtGx/uq9boloX7WxVM=;
        b=fW84vDylmiu7xOwlaiz1mmTls9Q+UULPmMl4e1/GwgHlw4xH9vuR52jLo/w3ffylRz
         VCqHA+sJDuLUzBRstx5rWtU49uz+SpBSgWuJ4aLNAh64SguF7OZfS1pLqAUxEUd0jP+f
         3kgAh0mg8aRhGldPqUDRhdDkYbVR/sph60LKYsQ0OiDPQcxcaTclquINS5wyzqX3FCMJ
         yZ3YnEs5gbcovzlNPdJktkaGqnf7WvBy4LzLdulT50Kp/nqQE974IsfVAPfmsurLu/E1
         wVQstjEfdSMBo6Baqqb/YQIM2vfzlmyvgjOqGjok166IVr2nTKLLSrlAL81M7PxZ3TsH
         0u8g==
X-Gm-Message-State: AOAM530HYrpM8qbWM+4K5+wB/xyH/7ba+xeUHS5coaIcugKNFSV/fFPz
        PA9ROSlohOY3yObQoUv/+WKpLA==
X-Google-Smtp-Source: ABdhPJwjgH60e415wDWfXcaFd6uM2R/hmfsiR2RRRkWnmOvdM+507BfL9a7kjLcmbCn6jt8Uc6Pirw==
X-Received: by 2002:a62:e40a:0:b029:263:e573:e1c9 with SMTP id r10-20020a62e40a0000b0290263e573e1c9mr22903946pfh.74.1619522136692;
        Tue, 27 Apr 2021 04:15:36 -0700 (PDT)
Received: from acourbot.tok.corp.google.com ([2401:fa00:8f:203:b182:d363:32d0:53a2])
        by smtp.gmail.com with ESMTPSA id c21sm2347210pfc.165.2021.04.27.04.15.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 27 Apr 2021 04:15:36 -0700 (PDT)
From:   Alexandre Courbot <acourbot@chromium.org>
To:     Tiffany Lin <tiffany.lin@mediatek.com>,
        Andrew-CT Chen <andrew-ct.chen@mediatek.com>,
        Rob Herring <robh+dt@kernel.org>,
        Yunfei Dong <yunfei.dong@mediatek.com>
Cc:     Mauro Carvalho Chehab <mchehab@kernel.org>,
        Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-mediatek@lists.infradead.org,
        Alexandre Courbot <acourbot@chromium.org>
Subject: [PATCH v4 00/15] media: mtk-vcodec: support for MT8183 decoder
Date:   Tue, 27 Apr 2021 20:15:11 +0900
Message-Id: <20210427111526.1772293-1-acourbot@chromium.org>
X-Mailer: git-send-email 2.31.1.498.g6c1eba8ee3d-goog
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

This series adds support for the stateless API into mtk-vcodec, by first
separating the stateful ops into their own source file, and introducing
a new set of ops suitable for stateless decoding. As such, support for
stateful decoders should remain completely unaffected.

This series has been tested with both MT8183 and MT8173. Decoding was
working for both chips, and in the case of MT8173 no regression has been
noticed.

Patches 1-9 add MT8183 support to the decoder using the stateless API.
MT8183 only support H.264 acceleration.

Patches 10-15 are follow-ups that further improve compliance for the
decoder and encoder, by fixing support for commands on both. Patch 11
also makes sure that supported H.264 profiles are exported on MT8173.

Changes since v3:
* Stop checking that controls are set for every request.
* Add V4L2_CID_STATELESS_H264_START_CODE control.
* Stop mapping OUTPUT buffers and getting the NAL type from them, use the
  nal_ref_idc field instead.
* Make V4L2_CID_MIN_BUFFERS_FOR_CAPTURE control stateful-only.
* Set vb2_buffer's field to V4L2_FIELD_NONE in buffer validation hook.

Changes since v2:
* Add follow-up patches fixing support for START/STOP commands for the
  encoder, and stateful decoder.

Alexandre Courbot (8):
  media: mtk-vcodec: vdec: handle firmware version field
  media: mtk-vcodec: support version 2 of decoder firmware ABI
  media: add Mediatek's MM21 format
  dt-bindings: media: document mediatek,mt8183-vcodec-dec
  media: mtk-vcodec: vdec: use helpers in VIDIOC_(TRY_)DECODER_CMD
  media: mtk-vcodec: vdec: clamp OUTPUT resolution to hardware limits
  media: mtk-vcodec: make flush buffer reusable by encoder
  media: mtk-vcodec: venc: support START and STOP commands

Hirokazu Honda (1):
  media: mtk-vcodec: vdec: Support H264 profile control

Hsin-Yi Wang (1):
  media: mtk-vcodec: venc: make sure buffer exists in list before
    removing

Yunfei Dong (5):
  media: mtk-vcodec: vdec: move stateful ops into their own file
  media: mtk-vcodec: vdec: support stateless API
  media: mtk-vcodec: vdec: support stateless H.264 decoding
  media: mtk-vcodec: vdec: add media device if using stateless api
  media: mtk-vcodec: enable MT8183 decoder

 .../bindings/media/mediatek-vcodec.txt        |   1 +
 .../media/v4l/pixfmt-reserved.rst             |   7 +
 drivers/media/platform/Kconfig                |   2 +
 drivers/media/platform/mtk-vcodec/Makefile    |   3 +
 .../platform/mtk-vcodec/mtk_vcodec_dec.c      | 818 +++---------------
 .../platform/mtk-vcodec/mtk_vcodec_dec.h      |  28 +-
 .../platform/mtk-vcodec/mtk_vcodec_dec_drv.c  |  66 +-
 .../mtk-vcodec/mtk_vcodec_dec_stateful.c      | 667 ++++++++++++++
 .../mtk-vcodec/mtk_vcodec_dec_stateless.c     | 370 ++++++++
 .../platform/mtk-vcodec/mtk_vcodec_drv.h      |  58 +-
 .../platform/mtk-vcodec/mtk_vcodec_enc.c      | 135 ++-
 .../platform/mtk-vcodec/mtk_vcodec_enc_drv.c  |   4 +
 .../mtk-vcodec/vdec/vdec_h264_req_if.c        | 780 +++++++++++++++++
 .../media/platform/mtk-vcodec/vdec_drv_if.c   |   3 +
 .../media/platform/mtk-vcodec/vdec_drv_if.h   |   1 +
 .../media/platform/mtk-vcodec/vdec_ipi_msg.h  |  23 +-
 .../media/platform/mtk-vcodec/vdec_vpu_if.c   |  43 +-
 .../media/platform/mtk-vcodec/vdec_vpu_if.h   |   5 +
 drivers/media/v4l2-core/v4l2-ioctl.c          |   1 +
 include/uapi/linux/videodev2.h                |   1 +
 20 files changed, 2293 insertions(+), 723 deletions(-)
 create mode 100644 drivers/media/platform/mtk-vcodec/mtk_vcodec_dec_stateful.c
 create mode 100644 drivers/media/platform/mtk-vcodec/mtk_vcodec_dec_stateless.c
 create mode 100644 drivers/media/platform/mtk-vcodec/vdec/vdec_h264_req_if.c

--
2.31.1.498.g6c1eba8ee3d-goog

