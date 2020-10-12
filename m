Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id CEC3528ADC1
	for <lists+linux-media@lfdr.de>; Mon, 12 Oct 2020 07:36:17 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726501AbgJLFgI (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 12 Oct 2020 01:36:08 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41040 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726186AbgJLFgI (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 12 Oct 2020 01:36:08 -0400
Received: from mail-pg1-x52d.google.com (mail-pg1-x52d.google.com [IPv6:2607:f8b0:4864:20::52d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4819BC0613CE
        for <linux-media@vger.kernel.org>; Sun, 11 Oct 2020 22:36:08 -0700 (PDT)
Received: by mail-pg1-x52d.google.com with SMTP id o3so3193659pgr.11
        for <linux-media@vger.kernel.org>; Sun, 11 Oct 2020 22:36:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=6EDjuo7QPESC8K8qyRI6HiwLWK0gooF7JvZrFVR/Meo=;
        b=nRZ3xxZU1hOl1MIuV0VOWC/OWpGvHy07Tnj2ZBej0arSaT2KQZg8q1O4KB+CzGrwqH
         +hOfvJyYx4rL/0ahnGNFed+xLVv7XLlz64ktt358nx53oFeeXpt7Vwwdt7nJw6Rw90W3
         N5ZEdHXruxiRFEbeu7qiW9soI9k6gYjuL5w0s=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=6EDjuo7QPESC8K8qyRI6HiwLWK0gooF7JvZrFVR/Meo=;
        b=fsNzOyNeZyaPBUYrXvJJhEaboGmCsoL37rAaKv5AfQVajd96rBI+S3HhQWozevRqSo
         N/eIMCLwA2h9oOR3Hw2jP8P2B4RsfqKxwiop0YKKQNwmcI4FR7f46i9+NKIPQnhkIiTZ
         7gbnk88GRfPukkn79WTfXPmEi+4bQb5prysmb6+YJou03ubBAQd+tKRavTPE+v3n7sWm
         C/3Nmx14Se0a98mTMml/yGGbGyuVvAsqFoPeDlUoPHFOIwImNOSrYqKVSczHERsmu82v
         YY90L10S13k+nMQ7OvfDZo6RLSiwEeNxvsqA8zL34Kverqb4hVeGI4hJyjybXIMAkHVw
         9dMg==
X-Gm-Message-State: AOAM530O4d0f5c3TRpccwMU4zPCSv30IaC25DFeB3CdM4wcFCFuW45OQ
        eDlEVNIPhvAYcvP6JVveFZ1/ZA==
X-Google-Smtp-Source: ABdhPJxLZBlW9zTWil/tP+yEcKqzVuTCnvW/h5p6275mT48wsa8c9ScBfnqxufdPYtHf1TfZLOrHgQ==
X-Received: by 2002:aa7:9af1:0:b029:152:6101:ad17 with SMTP id y17-20020aa79af10000b02901526101ad17mr22435879pfp.25.1602480967681;
        Sun, 11 Oct 2020 22:36:07 -0700 (PDT)
Received: from acourbot.tok.corp.google.com ([2401:fa00:8f:203:eeb1:d7ff:fe57:b7e5])
        by smtp.gmail.com with ESMTPSA id z1sm17646817pgu.80.2020.10.11.22.36.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 11 Oct 2020 22:36:07 -0700 (PDT)
From:   Alexandre Courbot <acourbot@chromium.org>
To:     Tiffany Lin <tiffany.lin@mediatek.com>,
        Andrew-CT Chen <andrew-ct.chen@mediatek.com>,
        Sakari Ailus <sakari.ailus@linux.intel.com>
Cc:     Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-mediatek@lists.infradead.org, gnurou@gmail.com,
        Alexandre Courbot <acourbot@chromium.org>
Subject: [PATCH v3 0/2] media: mtk-vcodec: fix builds when remoteproc is disabled
Date:   Mon, 12 Oct 2020 14:35:55 +0900
Message-Id: <20201012053557.4102148-1-acourbot@chromium.org>
X-Mailer: git-send-email 2.28.0.1011.ga647a8990f-goog
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Thanks everyone for the feedback on v2. This version has grown a little bit, but
most of the added lines is just code moving around to new files. All in all this
certainly makes the driver a little bit cleaner.

Tested on both MT8173 and MT8183 and confirmed that the decoder was working on
both.

Changes since v2:
* Use the FOO || !FOO magic suggested by Hans to ensure a built-in module does
  not try to link against symbols in a module,
* Added a patch to split the VPU and SCP ops into their own source files and
  make the optional build cleaner,
* Control the build of firmware implementations using two new transparent
  Kconfig symbols.

Changes since v1:
* Added Acked-by from Randy.
* Fixed typo in Kconfig description.

Alexandre Courbot (2):
  media: mtk-vcodec: move firmware implementations into their own files
  media: mtk-vcodec: fix build breakage when one of VPU or SCP is
    enabled

 drivers/media/platform/Kconfig                |  22 ++-
 drivers/media/platform/mtk-vcodec/Makefile    |  10 +-
 .../platform/mtk-vcodec/mtk_vcodec_dec_drv.c  |   2 +-
 .../platform/mtk-vcodec/mtk_vcodec_enc_drv.c  |   2 +-
 .../media/platform/mtk-vcodec/mtk_vcodec_fw.c | 174 +-----------------
 .../media/platform/mtk-vcodec/mtk_vcodec_fw.h |   7 +-
 .../platform/mtk-vcodec/mtk_vcodec_fw_priv.h  |  52 ++++++
 .../platform/mtk-vcodec/mtk_vcodec_fw_scp.c   |  73 ++++++++
 .../platform/mtk-vcodec/mtk_vcodec_fw_vpu.c   | 109 +++++++++++
 9 files changed, 274 insertions(+), 177 deletions(-)
 create mode 100644 drivers/media/platform/mtk-vcodec/mtk_vcodec_fw_priv.h
 create mode 100644 drivers/media/platform/mtk-vcodec/mtk_vcodec_fw_scp.c
 create mode 100644 drivers/media/platform/mtk-vcodec/mtk_vcodec_fw_vpu.c

--
2.28.0.1011.ga647a8990f-goog

