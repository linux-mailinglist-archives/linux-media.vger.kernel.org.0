Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E5E5F3BB6CD
	for <lists+linux-media@lfdr.de>; Mon,  5 Jul 2021 07:33:25 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229743AbhGEFf5 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 5 Jul 2021 01:35:57 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45080 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229447AbhGEFf5 (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Mon, 5 Jul 2021 01:35:57 -0400
Received: from mail-pl1-x62c.google.com (mail-pl1-x62c.google.com [IPv6:2607:f8b0:4864:20::62c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 20ABAC061574
        for <linux-media@vger.kernel.org>; Sun,  4 Jul 2021 22:33:21 -0700 (PDT)
Received: by mail-pl1-x62c.google.com with SMTP id a14so9437103pls.4
        for <linux-media@vger.kernel.org>; Sun, 04 Jul 2021 22:33:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=Jj9aELhqiUOwAwWUz7FLYaAN0+uAFYBs/cDsEz9Fq0s=;
        b=msPEPOptPzS91PUpFvqqrbJBeavJ5p3xmecsA5ghMsbA3Y9Zr7TSp+FVm3BDSyn6UZ
         1x1GJpK5E1Xd1yuJUD2qwY2QiOaoFQzrDYY7JdIEJshnJmwWnhUs4ZL56gl8qbl/X0bN
         ni0zWu71xAoT7EeS8T93Qh4ogiOBrfF6d+6SI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=Jj9aELhqiUOwAwWUz7FLYaAN0+uAFYBs/cDsEz9Fq0s=;
        b=DThdqNOkoQY9Saa+7TqmpaRdiQRa8mbW7sETNKfPm+mFzACSvjqd8OgSF/IxTQtTkW
         SJoApnABRdO5jpdHzb5RcQ10WFVeUZmQh7kT5bKfSXXHe44JQlL/AWgeFwGXb9q74Mid
         rzLJpsmvFh5r86lRX3ZT6Lr+SJrbyDLdqCKkTyT5LVZ2z/4p68yl6gOXyTOqbyHLfIEX
         9edD5ZckBnZ+TBOvTY5OEfSR7+ojHSCLl6A6xT/uWdBeafj7jgjpadXDHplVoY75Z54s
         f7BK4D42xhgiIjvJcC9naVkB55aMPzUReqGBe5HeWKHobpgL6lZ3H+0TLOJtbm4THNnl
         c7ZQ==
X-Gm-Message-State: AOAM531ZdOC+WnPlyNnUG2IGalrnWD7AW9qCbEsTsKy8AYmKSWOMc0im
        ye8O6jd8j3Htl7xYyi/xMoLg+g==
X-Google-Smtp-Source: ABdhPJyKRLxGOd7bnNtEgwR5plxK2t7P8kZ6ucF5rlrtKtLzNgUEvAvPocDDwP82wLHk9ljkPKw/Ug==
X-Received: by 2002:a17:90a:a418:: with SMTP id y24mr10231856pjp.15.1625463200548;
        Sun, 04 Jul 2021 22:33:20 -0700 (PDT)
Received: from acourbot.tok.corp.google.com ([2401:fa00:8f:203:3fed:7130:60f:265a])
        by smtp.gmail.com with ESMTPSA id x19sm6805245pfp.115.2021.07.04.22.33.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 04 Jul 2021 22:33:20 -0700 (PDT)
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
Subject: [PATCH v6 00/14] media: mtk-vcodec: support for MT8183 decoder
Date:   Mon,  5 Jul 2021 14:32:44 +0900
Message-Id: <20210705053258.1614177-1-acourbot@chromium.org>
X-Mailer: git-send-email 2.32.0.93.g670b81a890-goog
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
 .../platform/mtk-vcodec/mtk_vcodec_dec_drv.c  |  65 +-
 .../mtk-vcodec/mtk_vcodec_dec_stateful.c      | 626 +++++++++++++
 .../mtk-vcodec/mtk_vcodec_dec_stateless.c     | 360 ++++++++
 .../platform/mtk-vcodec/mtk_vcodec_drv.h      |  58 +-
 .../platform/mtk-vcodec/mtk_vcodec_enc.c      | 140 ++-
 .../platform/mtk-vcodec/mtk_vcodec_enc_drv.c  |   6 +-
 .../mtk-vcodec/vdec/vdec_h264_req_if.c        | 771 ++++++++++++++++
 .../media/platform/mtk-vcodec/vdec_drv_if.c   |   3 +
 .../media/platform/mtk-vcodec/vdec_drv_if.h   |   1 +
 .../media/platform/mtk-vcodec/vdec_ipi_msg.h  |  23 +-
 .../media/platform/mtk-vcodec/vdec_vpu_if.c   |  43 +-
 .../media/platform/mtk-vcodec/vdec_vpu_if.h   |   5 +
 drivers/media/v4l2-core/v4l2-ioctl.c          |   1 +
 include/uapi/linux/videodev2.h                |   1 +
 20 files changed, 2235 insertions(+), 727 deletions(-)
 create mode 100644 drivers/media/platform/mtk-vcodec/mtk_vcodec_dec_stateful.c
 create mode 100644 drivers/media/platform/mtk-vcodec/mtk_vcodec_dec_stateless.c
 create mode 100644 drivers/media/platform/mtk-vcodec/vdec/vdec_h264_req_if.c

--
2.32.0.93.g670b81a890-goog

