Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 7C6CB1DAD49
	for <lists+linux-media@lfdr.de>; Wed, 20 May 2020 10:27:48 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726548AbgETI1o (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 20 May 2020 04:27:44 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55994 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726435AbgETI1n (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 20 May 2020 04:27:43 -0400
Received: from mail-pl1-x630.google.com (mail-pl1-x630.google.com [IPv6:2607:f8b0:4864:20::630])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6EFFDC061A0F
        for <linux-media@vger.kernel.org>; Wed, 20 May 2020 01:27:43 -0700 (PDT)
Received: by mail-pl1-x630.google.com with SMTP id m7so1024122plt.5
        for <linux-media@vger.kernel.org>; Wed, 20 May 2020 01:27:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=W2TWoJ++yCYlqy8IovrEqTMl5U//d+cGmQ0zGQQyDsY=;
        b=TJbE5e7IxHnNUAvEVy2/RQIeUCM4MNlNOXUaTmuJYTmjEpUVqMfOAYJYRSgpSKNSoW
         TkZC1UZ3hEr4bePFqABOBKLFsMiKT2D3lp2fQ3aVG/ruYaWCMnveW+d/F4hL5a7E1htw
         9JP89xPealRW2AuM10T0r5XIx6ymvmsifSmxE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=W2TWoJ++yCYlqy8IovrEqTMl5U//d+cGmQ0zGQQyDsY=;
        b=rUF/t/b8TlzjI961ViTlBqmKFR8n9fHz5MySwDIleZ+37ueMGGG+/hYdPKIcxAU48v
         +4AxqGTyrd5QOzZBgMDp6t/9LamhuG9fFr3FWWOFE1M977Ba9MSKZr8thh9ghCxv+4/3
         xgDKv+k0TXy7r2edHxujsq5fcNb/jSNF9/XcL6uD+xS8+nluzRx+8rIRL9psdm7HP+Cq
         dp1697LxPDb/C88zLrH9hVW4LOEc3UaFbHPhd4THndl9zdu56jaO4ViSoXVmZcnAMmcV
         MjHZ1TeZz4r/JvRD1n/3+jyH6fA+xIZ4alV4FW4ZhCv8PGocpehCg5IbVFnL9jwzIRYc
         3Hbg==
X-Gm-Message-State: AOAM532g3BuPdHi73NZMPfHdc9dBwIjGEfRBdTSNp2ixdKQOW8wdoPr7
        MNhwWPhBQdDvF1hrNZelY1JSnA==
X-Google-Smtp-Source: ABdhPJzkPFl6N48LcAsZjEnXY2hRPodn8awaoLgxgwKuQhYsJD9GptcjVbLdJYnmBFtDqE2ZvKBcRQ==
X-Received: by 2002:a17:90a:3563:: with SMTP id q90mr4254436pjb.0.1589963262833;
        Wed, 20 May 2020 01:27:42 -0700 (PDT)
Received: from acourbot.tok.corp.google.com ([2401:fa00:8f:203:93d9:de4d:e834:3086])
        by smtp.gmail.com with ESMTPSA id gg8sm1447775pjb.39.2020.05.20.01.27.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 20 May 2020 01:27:42 -0700 (PDT)
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
Subject: [PATCH 00/10] media: mtk-vcodec: venc: support for MT8183
Date:   Wed, 20 May 2020 17:27:13 +0900
Message-Id: <20200520082723.96136-1-acourbot@chromium.org>
X-Mailer: git-send-email 2.26.2.761.g0e0b3e54be-goog
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

This series adds support for the encoder present on MT8183. It is very similar
to the one in MT8173, but with different capabilities and using a new firmware
interface (SCP, while MT8173 talked to the VPU).

So this series starts with some preparatory work by putting the firmware
interface behind a small abstraction layer instead of directly talking to the
VPU, and by adding support for the SCP firmware. Next platform data is completed
with features that differ between the chips, like supported formats and bitrate,
before support for MT8183 is added.

Alexandre Courbot (6):
  media: mtk-vcodec: venc: handle firmware version field
  media: mtk-vcodec: venc: specify bitrate range per-chip
  media: mtk-vcodec: venc: specify supported formats per-chip
  media: mtk-vcodec: venc: remove redundant code
  media: dt-bindings: mtk-vcodec: specify SCP node
  media: dt-bindings: mtk-vcodec: document mediatek,mt8183-vcodec-enc

Yunfei Dong (4):
  media: mtk-vcodec: abstract firmware interface
  media: mtk-vcodec: add SCP firmware ops
  media: mtk-vcodec: venc: support SCP firmware
  media: mtk-vcodec: add support for MT8183 encoder

 .../bindings/media/mediatek-vcodec.txt        |   9 +-
 drivers/media/platform/Kconfig                |   2 +
 drivers/media/platform/mtk-vcodec/Makefile    |   4 +-
 .../platform/mtk-vcodec/mtk_vcodec_dec_drv.c  |  53 ++--
 .../platform/mtk-vcodec/mtk_vcodec_dec_pm.c   |   1 -
 .../platform/mtk-vcodec/mtk_vcodec_drv.h      |  38 ++-
 .../platform/mtk-vcodec/mtk_vcodec_enc.c      | 141 ++++-------
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
 26 files changed, 711 insertions(+), 255 deletions(-)
 create mode 100644 drivers/media/platform/mtk-vcodec/mtk_vcodec_fw.c
 create mode 100644 drivers/media/platform/mtk-vcodec/mtk_vcodec_fw.h

--
2.26.2.761.g0e0b3e54be-goog

