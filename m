Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C9EF220EE5D
	for <lists+linux-media@lfdr.de>; Tue, 30 Jun 2020 08:27:40 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730211AbgF3G13 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 30 Jun 2020 02:27:29 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35686 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1730205AbgF3G12 (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 30 Jun 2020 02:27:28 -0400
Received: from mail-pf1-x444.google.com (mail-pf1-x444.google.com [IPv6:2607:f8b0:4864:20::444])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B72EDC03E979
        for <linux-media@vger.kernel.org>; Mon, 29 Jun 2020 23:27:28 -0700 (PDT)
Received: by mail-pf1-x444.google.com with SMTP id 67so4904925pfg.5
        for <linux-media@vger.kernel.org>; Mon, 29 Jun 2020 23:27:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=hg7CQ36HAUaDvVl3zakOjg0qflU7yL+WVY/tnMLNwI8=;
        b=VQLPANUcPwGyfihSpiowndFQuKQQlvaJDJVH+Xj9W82xesq8Lxh0JcEYDFqaOm/ffp
         31I1pWYeloSOSrQLqcckVP9O/0F6SXSCVCGgqXXHFt6gqvNCTOW33usD/xRTNRheGE69
         r8FNBfYSleHJnpgxYpjkABIdOagdhvwZPTEFY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=hg7CQ36HAUaDvVl3zakOjg0qflU7yL+WVY/tnMLNwI8=;
        b=ogSXESWoG7g/mpuXdD95SuXV4IgWufPMtD8xIfPDok81SARgg9p2OWlsSnUsFTMe5O
         ZacuXRbfzgb9aZN9y+Wo1Cg2icXLc67h7y4dFl1q4j2ELi13WgWo/1OksBiwI0ItAPYa
         Lp6nZK2JRGO/6k0erx9Puta0tu9dj4QKOFgzOHAdHssZXz/fvHxqSDx8vdyqfiiVa+XB
         /SuTxL0T/De79tlfZyBUOwaoj8ouvZEO95HMpMCY6RHeMxPmFadjAskXMYCOup3jrIPJ
         KpckmMquBANkGywlfbSXYA8B0oraubmZrXCujgb7pB4rQx7uYkc3cmiv5az0YLjom31F
         R3YA==
X-Gm-Message-State: AOAM530HDKpOZprki7gqpGs/f1IhY7q5DAPVZdRVr7p8hp35fzYko2qd
        stBzoxhFPMTORffjHktdFVO9bg==
X-Google-Smtp-Source: ABdhPJzv0kiTrJPLtzkcKyiSl8wmXSRMplwPojwu7/9fWXDbT6YJQ4ox4bXbQCWa5+f/h9RXQiPz8w==
X-Received: by 2002:a65:664a:: with SMTP id z10mr13445440pgv.352.1593498447562;
        Mon, 29 Jun 2020 23:27:27 -0700 (PDT)
Received: from acourbot.tok.corp.google.com ([2401:fa00:8f:203:93d9:de4d:e834:3086])
        by smtp.gmail.com with ESMTPSA id d1sm1463366pfq.113.2020.06.29.23.27.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 29 Jun 2020 23:27:26 -0700 (PDT)
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
Subject: [PATCH 0/9] media: mtk-vcodec: vdec: support for MT8183
Date:   Tue, 30 Jun 2020 15:27:02 +0900
Message-Id: <20200630062711.4169601-1-acourbot@chromium.org>
X-Mailer: git-send-email 2.27.0.212.ge8ba1cc988-goog
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

This patch series adds support for the H.264 stateless decoder found in MT8183.
It depends on the MT8183 encoder support series [1] and should thus be applied
on top of it.

Contrary to MT8173 which is stateful, MT8183 is a stateless decoder. So the
first patches take care of splitting the stateful-relevant code into its own
source file, and to add support for the stateless API. Then support for sending
the H.264 decoder is added, taking advantage of the H.264 helper functions to
build the reference lists.

No regressions to v4l2-compliance have been introduced by this series for
MT8173, and we could also confirm that decoding was still working as expected
on this chip. Following this series will be another one that fixes the remaining
v4l2-compliance issues for both encoder and decoder.

[1] https://lkml.org/lkml/2020/6/26/152

Alexandre Courbot (4):
  media: mtk-vcodec: vdec: handle firmware version field
  media: mtk-vcodec: support version 2 of decoder firmware ABI
  media: add Mediatek's MM21 format
  dt-bindings: media: document mediatek,mt8183-vcodec-dec

Yunfei Dong (5):
  media: mtk-vcodec: vdec: move stateful ops into their own file
  media: mtk-vcodec: vdec: support stateless API
  media: mtk-vcodec: vdec: support stateless H.264 decoding
  media: mtk-vcodec: vdec: add media device if using stateless api
  media: mtk-vcodec: enable MT8183 decoder

 .../bindings/media/mediatek-vcodec.txt        |   1 +
 drivers/media/platform/Kconfig                |   2 +
 drivers/media/platform/mtk-vcodec/Makefile    |   3 +
 .../platform/mtk-vcodec/mtk_vcodec_dec.c      | 763 +++--------------
 .../platform/mtk-vcodec/mtk_vcodec_dec.h      |  28 +-
 .../platform/mtk-vcodec/mtk_vcodec_dec_drv.c  |  54 +-
 .../mtk-vcodec/mtk_vcodec_dec_stateful.c      | 634 ++++++++++++++
 .../mtk-vcodec/mtk_vcodec_dec_stateless.c     | 469 ++++++++++
 .../platform/mtk-vcodec/mtk_vcodec_drv.h      |  50 ++
 .../mtk-vcodec/vdec/vdec_h264_req_if.c        | 802 ++++++++++++++++++
 .../media/platform/mtk-vcodec/vdec_drv_if.c   |   3 +
 .../media/platform/mtk-vcodec/vdec_drv_if.h   |   1 +
 .../media/platform/mtk-vcodec/vdec_ipi_msg.h  |  23 +-
 .../media/platform/mtk-vcodec/vdec_vpu_if.c   |  43 +-
 .../media/platform/mtk-vcodec/vdec_vpu_if.h   |   5 +
 drivers/media/v4l2-core/v4l2-ioctl.c          |   1 +
 include/uapi/linux/videodev2.h                |   1 +
 17 files changed, 2226 insertions(+), 657 deletions(-)
 create mode 100644 drivers/media/platform/mtk-vcodec/mtk_vcodec_dec_stateful.c
 create mode 100644 drivers/media/platform/mtk-vcodec/mtk_vcodec_dec_stateless.c
 create mode 100644 drivers/media/platform/mtk-vcodec/vdec/vdec_h264_req_if.c

--
2.27.0.212.ge8ba1cc988-goog

