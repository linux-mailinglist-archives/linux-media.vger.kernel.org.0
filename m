Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 234513E225D
	for <lists+linux-media@lfdr.de>; Fri,  6 Aug 2021 06:15:55 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S242343AbhHFEQI (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 6 Aug 2021 00:16:08 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59928 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229836AbhHFEQI (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Fri, 6 Aug 2021 00:16:08 -0400
Received: from mail-yb1-xb4a.google.com (mail-yb1-xb4a.google.com [IPv6:2607:f8b0:4864:20::b4a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2B136C061798
        for <linux-media@vger.kernel.org>; Thu,  5 Aug 2021 21:15:53 -0700 (PDT)
Received: by mail-yb1-xb4a.google.com with SMTP id f3-20020a25cf030000b029055a2303fc2dso8345444ybg.11
        for <linux-media@vger.kernel.org>; Thu, 05 Aug 2021 21:15:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20161025;
        h=date:message-id:mime-version:subject:from:to:cc;
        bh=DHya/hoF1LeBPMXz4YTDp72VS75LjFpDtDFk0VuSfn4=;
        b=u56rS8kna/BGA7+TfF+WLwx2MDfeETn+2o1Te0czNN5U77CJpXg4SdgzJBdSOMXvRl
         iBWN1lPTKHfOAB3En7quz5zBHh1lcpxLDAAjd7B4VzY+SC5Tpb0JP0CMOH6IhwZn1PeX
         fZg78LAvDygebVuPwxyF+JlmNzlNB0HCO9fxxHzwADubcpXoniUvXwXM89Tyy1BimE1Q
         IyJwsnOf1Z8aI3alsDnJS4wKzKFYS9k9lAcJnhGeJZN3CCyDwFMKpRs1Hu0z1giHrRtt
         4rgYcJeaFXkzahLdk4FNrR840p/OZEwGv+85F67WK7MCO6JaqAp2hrHQpSJ6GabEIozv
         KF8A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:message-id:mime-version:subject:from:to:cc;
        bh=DHya/hoF1LeBPMXz4YTDp72VS75LjFpDtDFk0VuSfn4=;
        b=CGk/47smggXRlsKyBU4Y+Robw7NkhTxR82ZJ1LIp/sbtrGulvlZ+ywbZJ3jIGuv+2y
         pjrJwLX0lUzOazaC9Nhx/4ufUzMMniiQKT9k6WPysr8tR6VG078oH3JDQF0NqDVuyZLm
         /IDoDBqtruPI257iD869RCAvmouar48a5fGzf2eWY6GU516JRyV/MIGWw3EhxbI/uiQE
         dci2+LkGKTWYoJ2LNC6Rcfboxla8qtvayWUWlUx1dmAQwZMswnFWs5HubrtJ5u1FZU7W
         GC27ak21vmCPYrAdrqjUuawQKdIrDpUuBAGNNjgpuAVciNrfGSv0xU9m/D2yAStOVN14
         JM5g==
X-Gm-Message-State: AOAM530FkGxxloJt0AszprZlewD8Q6139jI25RJrhrWWDINwmXu/968D
        dyxR6q/U/wwGF848lhm5ejGqtDFRZcCY
X-Google-Smtp-Source: ABdhPJxqAg+C66m0Q2/Z7CVajksZirZN7CWUQJwJfcxiA2BzCiRBO58KrLV63u0xGifnL8GnX8J1JXBSpxLj
X-Received: from tzungbi-z840.tpe.corp.google.com ([2401:fa00:1:10:ebc2:859f:4153:773e])
 (user=tzungbi job=sendgmr) by 2002:a25:b70d:: with SMTP id
 t13mr10444163ybj.204.1628223352389; Thu, 05 Aug 2021 21:15:52 -0700 (PDT)
Date:   Fri,  6 Aug 2021 12:15:16 +0800
Message-Id: <20210806041530.4170869-1-tzungbi@google.com>
Mime-Version: 1.0
X-Mailer: git-send-email 2.32.0.605.g8dce9f2422-goog
Subject: [PATCH v7 00/14] media: mtk-vcodec: support for MT8183 decoder
From:   Tzung-Bi Shih <tzungbi@google.com>
To:     hverkuil-cisco@xs4all.nl, yunfei.dong@mediatek.com,
        acourbot@chromium.org
Cc:     tiffany.lin@mediatek.com, andrew-ct.chen@mediatek.com,
        dafna.hirschfeld@collabora.com, mchehab@kernel.org,
        linux-media@vger.kernel.org, linux-mediatek@lists.infradead.org,
        linux-arm-kernel@lists.infradead.org, tzungbi@google.com
Content-Type: text/plain; charset="UTF-8"
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
patches were last up until v4 but have been moved to the beginning so they can
be applied sooner.

Patches 6-9 separates the "stateful" part of the driver into its own file and
add support for the new firmware and pixel format used by MT8183.

Patches 10-14 add support for H.264 stateless decoding and MT8183.

Note that a few checkpatch issues have been left unadressed on purpose:
* Conversion from e.g. uint32_t to u32 can't be done without breaking
  consistency. This should be done by a driver-wide patch.
* Some macro warning suggesting parentheses for parameters expanded as struct
  members, which is obviously not applicable here.
* Warnings about adding new files without an update the MAINTAINERS, which is
  irrelevant as the new files are already covered by the existing wildcards.

Changes since v6:
(https://patchwork.linuxtv.org/project/linux-media/cover/20210705053258.1614177-1-acourbot@chromium.org/)
* Fix errors from 'checkpatch.pl --strict'.
* Fix missing kerneldoc issue.
* Fix wrong device minor number reference.

Changes since v5:
* Rebased against latest media tree.
* Applied most suggestions of `checkpatch.pl --strict`. Some proposed fixes were
  not applied because they would require a larger refactoring (i.e. large-scale
  type changes) of the code.
* Applied Reviewed-by and fix suggestions from Tzung-bi.
* Check for ABORT state in vidioc_encoder_cmd.

Changes since v4:
* Reorganized fixup patches first.
* Select MEDIA_CONTROLLER_REQUEST_API.
* Properly capitalize MM21's format description string.
* Reorganize stateless code as suggested by Hans.
* Fix compilation errors when DEBUG is defined.
* Merge double-free fixup patch into the patch that introduced the issue.

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
 .../platform/mtk-vcodec/mtk_vcodec_dec.c      | 820 +++---------------
 .../platform/mtk-vcodec/mtk_vcodec_dec.h      |  25 +-
 .../platform/mtk-vcodec/mtk_vcodec_dec_drv.c  |  68 +-
 .../mtk-vcodec/mtk_vcodec_dec_stateful.c      | 628 ++++++++++++++
 .../mtk-vcodec/mtk_vcodec_dec_stateless.c     | 360 ++++++++
 .../platform/mtk-vcodec/mtk_vcodec_drv.h      |  58 +-
 .../platform/mtk-vcodec/mtk_vcodec_enc.c      | 140 ++-
 .../platform/mtk-vcodec/mtk_vcodec_enc_drv.c  |   6 +-
 .../mtk-vcodec/vdec/vdec_h264_req_if.c        | 774 +++++++++++++++++
 .../media/platform/mtk-vcodec/vdec_drv_if.c   |   3 +
 .../media/platform/mtk-vcodec/vdec_drv_if.h   |   1 +
 .../media/platform/mtk-vcodec/vdec_ipi_msg.h  |  23 +-
 .../media/platform/mtk-vcodec/vdec_vpu_if.c   |  43 +-
 .../media/platform/mtk-vcodec/vdec_vpu_if.h   |   5 +
 drivers/media/v4l2-core/v4l2-ioctl.c          |   1 +
 include/uapi/linux/videodev2.h                |   1 +
 20 files changed, 2241 insertions(+), 729 deletions(-)
 create mode 100644 drivers/media/platform/mtk-vcodec/mtk_vcodec_dec_stateful.c
 create mode 100644 drivers/media/platform/mtk-vcodec/mtk_vcodec_dec_stateless.c
 create mode 100644 drivers/media/platform/mtk-vcodec/vdec/vdec_h264_req_if.c

-- 
2.32.0.605.g8dce9f2422-goog

