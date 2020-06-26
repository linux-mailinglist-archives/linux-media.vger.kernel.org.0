Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E642320ADD3
	for <lists+linux-media@lfdr.de>; Fri, 26 Jun 2020 10:05:41 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728936AbgFZIFa (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 26 Jun 2020 04:05:30 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40612 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728901AbgFZIFa (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 26 Jun 2020 04:05:30 -0400
Received: from mail-pj1-x1041.google.com (mail-pj1-x1041.google.com [IPv6:2607:f8b0:4864:20::1041])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 77331C08C5DB
        for <linux-media@vger.kernel.org>; Fri, 26 Jun 2020 01:05:30 -0700 (PDT)
Received: by mail-pj1-x1041.google.com with SMTP id b92so4621257pjc.4
        for <linux-media@vger.kernel.org>; Fri, 26 Jun 2020 01:05:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=03vmF/xJtrW7TxKJ7ORVagTSJF1iyHBUoz7bXZv7j/M=;
        b=JGfM1XPbikiN9aaUpji02wfEtcW3z/uTaGoNwWt4d2L+2waHQkN3RQKw8bDPMKrtra
         3dvvTJsgEbM4dMcSxNvLWUXO0DnGMNG5Vmmjp/GyG1VZAYHYuqA27oNtV5kuDiaOM4ku
         gdO6F9b51zZZwrk5uwj5joFv/BsLmwj6609mY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=03vmF/xJtrW7TxKJ7ORVagTSJF1iyHBUoz7bXZv7j/M=;
        b=mBVkO0J1opK/g5TheXzx7DAMFZ756zq04HvBjZiQCrcmE6Cs8GPTewdhPNQZDL+ISJ
         32/L7nIXGlZiutK/OEd0alH91rKzygTxiZnfkVUQ5VqBZ32u9E7Yn6WMFTLuBucsshHK
         /rlLdUqGHZkyXPlWHtAFW7/3zjkHYHbT06FVALjWtzjyNA+elr+TCFSqUFnw20ttse1P
         FqQGtA2T6pQycOYlMl7fIITCUe8BOBehE60tZ0TjaZG5RJFK6h6oIVUttMqHx6IB8Mcq
         +cAng08gsYNt8qphS9F2PYgpE82Bl4AGAAffWtwbVXKff8Bh8OiMJ9bp8rZ3L1y6Sr3U
         LUmg==
X-Gm-Message-State: AOAM531XkQINOm6hiebf0ysUnSLKuzLs19dqfH6DyTROIGE8I1zUTbQ+
        Z4+EjfdYuAzozpbbvkBrBi/gnw==
X-Google-Smtp-Source: ABdhPJzzos0vx8gDmMLPE+o8X+HuOkVKt5pQdiTIqQ6bCa8H5Mp+j4F5kBDXTyFbH4A3j1Zd0I03HQ==
X-Received: by 2002:a17:90a:6a03:: with SMTP id t3mr2129478pjj.174.1593158729825;
        Fri, 26 Jun 2020 01:05:29 -0700 (PDT)
Received: from acourbot.tok.corp.google.com ([2401:fa00:8f:203:93d9:de4d:e834:3086])
        by smtp.gmail.com with ESMTPSA id 137sm21809843pgg.72.2020.06.26.01.05.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 26 Jun 2020 01:05:28 -0700 (PDT)
From:   Alexandre Courbot <acourbot@chromium.org>
To:     Tiffany Lin <tiffany.lin@mediatek.com>,
        Andrew-CT Chen <andrew-ct.chen@mediatek.com>,
        Rui Wang <gtk_ruiwang@mediatek.com>,
        Yunfei Dong <yunfei.dong@mediatek.com>,
        Pi-Hsun Shih <pihsun@chromium.org>,
        Maoguang Meng <maoguang.meng@mediatek.com>
Cc:     linux-media@vger.kernel.org, linux-mediatek@lists.infradead.org,
        linux-kernel@vger.kernel.org,
        Alexandre Courbot <acourbot@chromium.org>
Subject: [PATCH v2 00/18] media: mtk-vcodec: venc: support for MT8183 and v4l2-compliance fixes
Date:   Fri, 26 Jun 2020 17:04:24 +0900
Message-Id: <20200626080442.292309-1-acourbot@chromium.org>
X-Mailer: git-send-email 2.27.0.212.ge8ba1cc988-goog
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

This is the second revision of the series adding support for the MT8183 encoder
(patches 1-9). It also fixes 9 v4l2-compliance failures (patches 10-18). Of note
is patch 10 which reverts a previous patch that seems to have been merged by
mistake (see https://lore.kernel.org/linux-media/CAPBb6MWuhJGq_etJN4WX0NOBXK0cA7rxVCMx70xCg7Uzmj_cMw@mail.gmail.com/T/#me1b4a97adb119c25dc79826d49746216dd94bd26).

As mentioned in v1's discussion, this time v4l2-compliance has been run before
and after each patch to make sure no regressions are introduced. The latest
v4l2-compliance does find quite a few errors on the current mainline though, and
the second half of this series fixes several of them.

After this series the following v4l2-compliance failures remain:

* VIDIOC_(TRY_)ENCODER_CMD fails because there is no support for encoder
  commands. I have a patch fixing this but it depends on some extra refactoring
  introduced by the decoder series (that will follow this one), so it will be
  submitted along with it.
* VIDIOC_(UN)SUBSCRIBE_EVENT/DQEVENT also fails because one cannot subscribe to
  the EOS event. This depends on encoder commands to be properly sent, so the
  fix will also follow.

Changes since v1:
* Checked that no regressions against v4l2-compliance were introduced,
* Fixed 9 failing v4l2-compliance tests,
* Removed 1 cleanup patch of contested utility,
* Carried Acked-bys and Reviewed-bys from mtk-vcodec maintainer.

Alexandre Courbot (14):
  media: mtk-vcodec: venc: handle firmware version field
  media: mtk-vcodec: venc: specify bitrate range per-chip
  media: mtk-vcodec: venc: specify supported formats per-chip
  media: dt-bindings: mtk-vcodec: specify SCP node
  media: dt-bindings: mtk-vcodec: document mediatek,mt8183-vcodec-enc
  Revert "media: mtk-vcodec: Remove extra area allocation in an input
    buffer on encoding"
  media: mtk-vcodec: venc support MIN_OUTPUT_BUFFERS control
  media: mtk-vcodec: venc: set OUTPUT buffers field to V4L2_FIELD_NONE
  media: mtk-vcodec: venc: use platform data for ENUM_FRAMESIZES
  media: mtk-vcodec: venc: support ENUM_FRAMESIZES on OUTPUT formats
  media: mtk-vcodec: venc: support G_PARM on CAPTURE queue
  media: mtk-vcodec: venc: make S_PARM return -ENOTTY for CAPTURE queue
  media: mtk-vcodec: venc: set default time per frame
  media: mtk-vcodec: venc: fix invalid time per frame in S_PARM

Yunfei Dong (4):
  media: mtk-vcodec: abstract firmware interface
  media: mtk-vcodec: add SCP firmware ops
  media: mtk-vcodec: venc: support SCP firmware
  media: mtk-vcodec: add support for MT8183 encoder

 .../bindings/media/mediatek-vcodec.txt        |   9 +-
 drivers/media/platform/Kconfig                |   1 +
 drivers/media/platform/mtk-vcodec/Makefile    |   4 +-
 .../platform/mtk-vcodec/mtk_vcodec_dec_drv.c  |  53 ++--
 .../platform/mtk-vcodec/mtk_vcodec_dec_pm.c   |   1 -
 .../platform/mtk-vcodec/mtk_vcodec_drv.h      |  38 ++-
 .../platform/mtk-vcodec/mtk_vcodec_enc.c      | 217 ++++++++---------
 .../platform/mtk-vcodec/mtk_vcodec_enc_drv.c  | 149 ++++++++----
 .../platform/mtk-vcodec/mtk_vcodec_enc_pm.c   |   2 -
 .../media/platform/mtk-vcodec/mtk_vcodec_fw.c | 228 ++++++++++++++++++
 .../media/platform/mtk-vcodec/mtk_vcodec_fw.h |  38 +++
 .../platform/mtk-vcodec/mtk_vcodec_util.c     |   1 -
 .../platform/mtk-vcodec/vdec/vdec_h264_if.c   |   1 -
 .../platform/mtk-vcodec/vdec/vdec_vp8_if.c    |   1 -
 .../platform/mtk-vcodec/vdec/vdec_vp9_if.c    |   1 -
 .../media/platform/mtk-vcodec/vdec_drv_base.h |   2 -
 .../media/platform/mtk-vcodec/vdec_drv_if.c   |   1 -
 .../media/platform/mtk-vcodec/vdec_vpu_if.c   |  12 +-
 .../media/platform/mtk-vcodec/vdec_vpu_if.h   |  11 +-
 .../platform/mtk-vcodec/venc/venc_h264_if.c   |  80 ++++--
 .../platform/mtk-vcodec/venc/venc_vp8_if.c    |  11 +-
 .../media/platform/mtk-vcodec/venc_drv_if.c   |   1 -
 .../media/platform/mtk-vcodec/venc_drv_if.h   |   6 +
 .../media/platform/mtk-vcodec/venc_ipi_msg.h  |  24 +-
 .../media/platform/mtk-vcodec/venc_vpu_if.c   | 141 ++++++++---
 .../media/platform/mtk-vcodec/venc_vpu_if.h   |   8 +-
 26 files changed, 760 insertions(+), 281 deletions(-)
 create mode 100644 drivers/media/platform/mtk-vcodec/mtk_vcodec_fw.c
 create mode 100644 drivers/media/platform/mtk-vcodec/mtk_vcodec_fw.h

--
2.27.0.212.ge8ba1cc988-goog

