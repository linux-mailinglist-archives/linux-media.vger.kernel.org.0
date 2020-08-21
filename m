Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 60E7824D2E5
	for <lists+linux-media@lfdr.de>; Fri, 21 Aug 2020 12:39:46 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728469AbgHUKjk (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 21 Aug 2020 06:39:40 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36308 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728462AbgHUKgd (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 21 Aug 2020 06:36:33 -0400
Received: from mail-pj1-x1044.google.com (mail-pj1-x1044.google.com [IPv6:2607:f8b0:4864:20::1044])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3CCE9C061385
        for <linux-media@vger.kernel.org>; Fri, 21 Aug 2020 03:36:33 -0700 (PDT)
Received: by mail-pj1-x1044.google.com with SMTP id kr4so643375pjb.2
        for <linux-media@vger.kernel.org>; Fri, 21 Aug 2020 03:36:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=TQjFo6yGcilxeaDCvb6ghdOgX7HhmMppcLzjn5i6JYM=;
        b=OZ2ABoprclPRMEzlullrokDKt0lNah7j7qrBqsq2hWXnuSVJGgdK7loFewlKIeMGMh
         ifg0RT+/F71+dGA9NzOi5CTx+QbcwXY9FD8CLOPEBaCzLpqp5gwa5h9iegeGX4o2CoXI
         AzttIs2raE9Qg6HEVMIAHoVQWq3ogLwFOdZk0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=TQjFo6yGcilxeaDCvb6ghdOgX7HhmMppcLzjn5i6JYM=;
        b=dkOvdwPYjkICA1Tgnc9yW3BgWqGU9pI+7aIgjOp6WH7km9c/qlTm0p37EPWWzvYjpm
         n8FapghHZpMaT3puS8ueqZ9XRf0ouOIk2HnIPiUDUs+9IbccXd/xVMHOg9WwelalNmIZ
         wUoeQcOc/1k04W7MgrFke3d/gahSxEjQVzXVIo45/+MMVsLjCo/EEchr4d4jgoJaJeWs
         m9ENndqTYTUSz6QL3SCp2CSZ0fOdTyfO//i53xJSA7kdLPRDoy6SmYryNDW0bmmApWkd
         DBt8SH1wU2ZQB6KSB+xCfVK+trIakt8NA6XIiRlwc4FMU12193pheynYmu2t4BB8550A
         ytUg==
X-Gm-Message-State: AOAM530yJFsJWxqz9xEmb18a77ZjFGW1eyEq9S9fL+ykxdBQ5Fq2lWk9
        ubrVf+uK/gElrCjBRrD/0JRnsw==
X-Google-Smtp-Source: ABdhPJx0l0EyLUfcpftdOtoC2F29QCf70eHCTCROL65lsXat+QdASxquATcDzNcsV77LRyg9Uh5xQQ==
X-Received: by 2002:a17:90b:951:: with SMTP id dw17mr1965256pjb.9.1598006192690;
        Fri, 21 Aug 2020 03:36:32 -0700 (PDT)
Received: from acourbot.tok.corp.google.com ([2401:fa00:8f:203:eeb1:d7ff:fe57:b7e5])
        by smtp.gmail.com with ESMTPSA id y20sm2081525pfn.183.2020.08.21.03.36.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 21 Aug 2020 03:36:31 -0700 (PDT)
From:   Alexandre Courbot <acourbot@chromium.org>
To:     Tiffany Lin <tiffany.lin@mediatek.com>,
        Andrew-CT Chen <andrew-ct.chen@mediatek.com>,
        Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        Yunfei Dong <yunfei.dong@mediatek.com>,
        Maoguang Meng <maoguang.meng@mediatek.com>,
        Matthias Brugger <matthias.bgg@gmail.com>
Cc:     linux-media@vger.kernel.org, linux-mediatek@lists.infradead.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Alexandre Courbot <acourbot@chromium.org>
Subject: [PATCH v4 00/17] media: mtk-vcodec: venc: support for MT8183
Date:   Fri, 21 Aug 2020 19:35:51 +0900
Message-Id: <20200821103608.2310097-1-acourbot@chromium.org>
X-Mailer: git-send-email 2.28.0.297.g1956fa8f8d-goog
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Here is new respin of the MT8183 encoder support and v4l2-compliance fixes
series, addressing issues raised during the v3 review (thanks in particular
to Ezequiel for the feedback!). With this version I hope to complete the
collection of Acked-by from respective maintainers. A few driver patches still
need approval for the mtk-vcodec maintainer, and so does the patch adding the
device tree node (9/17) that is new to this series.

This series has been tested and confirmed to work on both Hana (MT8173) and
Krane (MT8183) Chromebooks. v4l2-compliance also passed successfully on both
devices.

Changes since v3:
* Link mtk_vcodec_fw.o to the mtk_vcodec_common module
* Add some documentation to structures used for firmware communication
* Remove some on-the-spot variables renamings that were distracting
* Add device tree nodes for MT8183 boards
* Carry new Acked-bys

Changes since v2:
* Carried new Acked-bys from mtk-vcodec maintainer
* Removed 2 patches that were triggered by a bug in v4l2-compliance
* Moved DT bindings patches before the code implementing them

Changes since v1:
* Checked that no regressions against v4l2-compliance were introduced,
* Fixed 9 failing v4l2-compliance tests,
* Removed 1 cleanup patch of contested utility,
* Carried Acked-bys and Reviewed-bys from mtk-vcodec maintainer.

Alexandre Courbot (13):
  dt-bindings: media: mtk-vcodec: document SCP node
  media: mtk-vcodec: venc: handle firmware version field
  media: mtk-vcodec: venc: specify bitrate range per-chip
  media: mtk-vcodec: venc: specify supported formats per-chip
  dt-bindings: media: document mediatek,mt8183-vcodec-enc
  arm64: dts: mt8183: add encoder node
  Revert "media: mtk-vcodec: Remove extra area allocation in an input
    buffer on encoding"
  media: mtk-vcodec: venc support MIN_OUTPUT_BUFFERS control
  media: mtk-vcodec: venc: set OUTPUT buffers field to V4L2_FIELD_NONE
  media: mtk-vcodec: venc: use platform data for ENUM_FRAMESIZES
  media: mtk-vcodec: venc: support ENUM_FRAMESIZES on OUTPUT formats
  media: mtk-vcodec: venc: set default time per frame
  media: mtk-vcodec: venc: fix invalid time per frame in S_PARM

Yunfei Dong (4):
  media: mtk-vcodec: abstract firmware interface
  media: mtk-vcodec: add SCP firmware ops
  media: mtk-vcodec: venc: support SCP firmware
  media: mtk-vcodec: add support for MT8183 encoder

 .../bindings/media/mediatek-vcodec.txt        |   9 +-
 arch/arm64/boot/dts/mediatek/mt8183-evb.dts   |  10 +
 .../arm64/boot/dts/mediatek/mt8183-kukui.dtsi |  12 +
 arch/arm64/boot/dts/mediatek/mt8183.dtsi      |  36 +++
 drivers/media/platform/Kconfig                |   1 +
 drivers/media/platform/mtk-vcodec/Makefile    |   6 +-
 .../platform/mtk-vcodec/mtk_vcodec_dec_drv.c  |  53 ++--
 .../platform/mtk-vcodec/mtk_vcodec_dec_pm.c   |   1 -
 .../platform/mtk-vcodec/mtk_vcodec_drv.h      |  40 ++-
 .../platform/mtk-vcodec/mtk_vcodec_enc.c      | 211 ++++++++--------
 .../platform/mtk-vcodec/mtk_vcodec_enc_drv.c  | 173 +++++++++----
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
 .../platform/mtk-vcodec/venc/venc_h264_if.c   |  68 +++++-
 .../platform/mtk-vcodec/venc/venc_vp8_if.c    |  11 +-
 .../media/platform/mtk-vcodec/venc_drv_if.c   |   1 -
 .../media/platform/mtk-vcodec/venc_drv_if.h   |  13 +
 .../media/platform/mtk-vcodec/venc_ipi_msg.h  |  27 ++-
 .../media/platform/mtk-vcodec/venc_vpu_if.c   | 141 ++++++++---
 .../media/platform/mtk-vcodec/venc_vpu_if.h   |   8 +-
 29 files changed, 836 insertions(+), 283 deletions(-)
 create mode 100644 drivers/media/platform/mtk-vcodec/mtk_vcodec_fw.c
 create mode 100644 drivers/media/platform/mtk-vcodec/mtk_vcodec_fw.h

--
2.28.0.297.g1956fa8f8d-goog

