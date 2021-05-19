Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 85E0D3890D4
	for <lists+linux-media@lfdr.de>; Wed, 19 May 2021 16:30:39 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1347569AbhESOb6 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 19 May 2021 10:31:58 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41430 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1347552AbhESOb5 (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 19 May 2021 10:31:57 -0400
Received: from mail-pf1-x429.google.com (mail-pf1-x429.google.com [IPv6:2607:f8b0:4864:20::429])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D57B0C06175F
        for <linux-media@vger.kernel.org>; Wed, 19 May 2021 07:30:37 -0700 (PDT)
Received: by mail-pf1-x429.google.com with SMTP id b13so6276033pfv.4
        for <linux-media@vger.kernel.org>; Wed, 19 May 2021 07:30:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=Rt/H9kqo4opNwZCAYpaq4Dm1MqGgRfPs4hw8Yb8ixao=;
        b=i0PtYZ6fhrKb5OBqzIORwwCTePqgZ28Sr0YjIbiqyA18fd+tgipwr3YBxDp2CxqrPy
         iJMwNeyV/wYkmLGrf6aq+iYJdi0Rq9l5Se7RJErRSEvoDDpCIBFf4AX0h80/7pFbnqtS
         XcKbtm+IYOO4uwK/MoYML+C6EL5FXReGS2zPU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=Rt/H9kqo4opNwZCAYpaq4Dm1MqGgRfPs4hw8Yb8ixao=;
        b=s+Ry6Rjc7hHytYaERreylLoZHKTe3uZ9Nu6tlUxRaJ9M3ZLk9j3Ra287kloWfL644N
         pq6Mg/Lze6sSM6pSIjIlYY5GHhgStSPneLcRYf5425bc7LunSSUVaHwcSvcibAnPd+J0
         X969Dg8xZ3fzrQpl4r/jOknPfbLuVg/RJbPC0d1qcTMnG0URRjUTwoxM7njHG1NA+KP0
         flm8D6p5ApHHvCZAjjYw9Wepaa35mpWblV9XxFrzKxoJ4KN3l7cxOXi7G2SXBgxFRte5
         /3pbY/EwPAmMUWybbug11hiy2ARQfML7lbdHXaNRCgH2BSDN+DrjVm6jLueh4xWOUPXI
         L/PQ==
X-Gm-Message-State: AOAM532eBvqFj/CjW8u/ONfyVXXTfeofd5XXC3kQXmog6r4B5RHKWzsr
        +xEkqnMoeG6Nm+UGi+uAtVrgWL3yW3GkJw==
X-Google-Smtp-Source: ABdhPJzOpymkaL4fPwyPa2NIrifUr+bc66RUEBAnS8XP3YyYvp0CA6ioy/nE/sd6OZw+h1dVPo1UcQ==
X-Received: by 2002:aa7:8b56:0:b029:2b9:77be:d305 with SMTP id i22-20020aa78b560000b02902b977bed305mr10940065pfd.61.1621434637343;
        Wed, 19 May 2021 07:30:37 -0700 (PDT)
Received: from acourbot.tok.corp.google.com ([2401:fa00:8f:203:87ab:ff82:1544:697])
        by smtp.gmail.com with ESMTPSA id 3sm14337661pff.132.2021.05.19.07.30.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 19 May 2021 07:30:36 -0700 (PDT)
From:   Alexandre Courbot <acourbot@chromium.org>
To:     Tiffany Lin <tiffany.lin@mediatek.com>,
        Andrew-CT Chen <andrew-ct.chen@mediatek.com>,
        Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        Dafna Hirschfeld <dafna.hirschfeld@collabora.com>,
        Yunfei Dong <yunfei.dong@mediatek.com>
Cc:     Mauro Carvalho Chehab <mchehab@kernel.org>,
        linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-mediatek@lists.infradead.org,
        Alexandre Courbot <acourbot@chromium.org>
Subject: [PATCH v5 00/14] media: mtk-vcodec: support for MT8183 decoder
Date:   Wed, 19 May 2021 23:29:57 +0900
Message-Id: <20210519143011.1175546-1-acourbot@chromium.org>
X-Mailer: git-send-email 2.31.1.751.gd2f1c929bd-goog
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
spotted.

Patches 1-5 fix a few compliance issues with the decoder and encoder, most
notably by adding support for the START and STOP command for the latter. These
patches were last in the previous series but have been moved to the beginning so
they can be applied sooner.

Patches 6-9 separates the "stateful" part of the driver into its own file and
add support for the new firmware and pixel format used by MT8183.

Patches 10-14 add support for H.264 stateless decoding and MT8183.

Changes since v4:
* Moved compliance fix patches to the head of the series.
* Select MEDIA_CONTROLLER_REQUEST_API.
* Properly capitalize MM21's format description string.
* Reorganize stateless code as suggested by Hans.
* Fix compilation errors when DEBUG is defined.
* Merge double-free fixup patch into the patch that introduced the issue (was
  a separate patch coming right after the one introducing the issue).

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

 .../bindings/media/mediatek-vcodec.txt        |   1 +
 .../media/v4l/pixfmt-reserved.rst             |   7 +
 drivers/media/platform/Kconfig                |   3 +
 drivers/media/platform/mtk-vcodec/Makefile    |   3 +
 .../platform/mtk-vcodec/mtk_vcodec_dec.c      | 817 +++---------------
 .../platform/mtk-vcodec/mtk_vcodec_dec.h      |  27 +-
 .../platform/mtk-vcodec/mtk_vcodec_dec_drv.c  |  66 +-
 .../mtk-vcodec/mtk_vcodec_dec_stateful.c      | 668 ++++++++++++++
 .../mtk-vcodec/mtk_vcodec_dec_stateless.c     | 366 ++++++++
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
 20 files changed, 2290 insertions(+), 722 deletions(-)
 create mode 100644 drivers/media/platform/mtk-vcodec/mtk_vcodec_dec_stateful.c
 create mode 100644 drivers/media/platform/mtk-vcodec/mtk_vcodec_dec_stateless.c
 create mode 100644 drivers/media/platform/mtk-vcodec/vdec/vdec_h264_req_if.c

--
2.31.1.751.gd2f1c929bd-goog

