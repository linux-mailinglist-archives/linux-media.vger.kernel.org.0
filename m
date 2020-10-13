Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 7322528CE9A
	for <lists+linux-media@lfdr.de>; Tue, 13 Oct 2020 14:44:45 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727845AbgJMMoo (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 13 Oct 2020 08:44:44 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48044 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727028AbgJMMoj (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 13 Oct 2020 08:44:39 -0400
Received: from mail-pj1-x1043.google.com (mail-pj1-x1043.google.com [IPv6:2607:f8b0:4864:20::1043])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9107EC0613D0
        for <linux-media@vger.kernel.org>; Tue, 13 Oct 2020 05:44:39 -0700 (PDT)
Received: by mail-pj1-x1043.google.com with SMTP id a1so2128522pjd.1
        for <linux-media@vger.kernel.org>; Tue, 13 Oct 2020 05:44:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=kROrNp0/vnBVDqgh6bMB0Lv2qonHQWx62hPvR0JVLiY=;
        b=JBmDR5ZcqT+4GTHKuB+FFmQCvAlkmIgjMAlqirZ8kwu91L7bvvvrfNwZPKo13RgEzC
         IOEmqZPnyu5dNhNMFgjhQlwOnOZlxzt9Fl4tO+jc/+6p7XZM96jpwtFpCEIM667Z+lDT
         7gyjHo0935+9qEBN0Gi/B74PjwgZrFmkjbjs8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=kROrNp0/vnBVDqgh6bMB0Lv2qonHQWx62hPvR0JVLiY=;
        b=n7RitKe+P4Hmbv3xxKD1vzaqdN/ViTPJMlvfCZnEm/XvcrunVC/DDE2wWlo3qIzoWa
         huVQPQH9iu3c7Ygw5cP0A60cLpH33EOvr7kYtxRk2JXhFhi0XVddTzGV8bgrUOzyuj1+
         kM4tV3cYY3egT+BKQjZvqIg/5/uBpFGwai0D4NE6xShOGBbgseBsKFB0U6vAN0B5PrLM
         qYwEh3PnNBfUk89Hmn/Ow83Dsw0or1C+m2cEckRWZg4/o+rf6zYBIsMhDrg+2LWHcVI5
         ZquenqMd+gjKJRoH35haJU1Nem1tiMUA8d8j6RKdbpnC1sMzOSQ3ajGwE76pzg6liJ84
         AESg==
X-Gm-Message-State: AOAM532NYial2q/FQRTBbo725Tzk+TZRg9Wry1q8skEYbyBqHnV59SOZ
        eTkTTS0DrgV+4r2JwzsO7G6H2w==
X-Google-Smtp-Source: ABdhPJzoAbnC6phIDBdMm/XQSDq3CThGjLMNwHM+FB8/E3vUaoqNolC/D6w3MUMgFcIZGCXg98d4ow==
X-Received: by 2002:a17:90a:ff92:: with SMTP id hf18mr26653376pjb.171.1602593079032;
        Tue, 13 Oct 2020 05:44:39 -0700 (PDT)
Received: from acourbot.tok.corp.google.com ([2401:fa00:8f:203:eeb1:d7ff:fe57:b7e5])
        by smtp.gmail.com with ESMTPSA id b20sm18914536pjo.37.2020.10.13.05.44.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 13 Oct 2020 05:44:38 -0700 (PDT)
From:   Alexandre Courbot <acourbot@chromium.org>
To:     Tiffany Lin <tiffany.lin@mediatek.com>,
        Andrew-CT Chen <andrew-ct.chen@mediatek.com>,
        Sakari Ailus <sakari.ailus@linux.intel.com>
Cc:     Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-mediatek@lists.infradead.org,
        Alexandre Courbot <acourbot@chromium.org>
Subject: [PATCH v4 0/2] media: mtk-vcodec: fix builds when remoteproc is disabled
Date:   Tue, 13 Oct 2020 21:44:26 +0900
Message-Id: <20201013124428.783025-1-acourbot@chromium.org>
X-Mailer: git-send-email 2.29.0.rc1.297.gfa9743e501-goog
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

No functional changes since v3, but it does the job at fixing the build
breakage. :) Please kindly take a look.

Changes since v3:
* Removed obsolete Acked-bys
* Fixed indentation in Kconfig file

Changes since v2:
* Use the FOO || !FOO magic suggested by Hans to ensure a built-in
  module does not try to link against symbols in a module,
* Added a patch to split the VPU and SCP ops into their own source files
  and make the optional build cleaner,
* Control the build of firmware implementations using two new transparent
  Kconfig symbols.

Changes since v1:
* Added Acked-by from Randy.
* Fixed typo in Kconfig description.

Alexandre Courbot (2):
  media: mtk-vcodec: move firmware implementations into their own files
  media: mtk-vcodec: fix build breakage when one of VPU or SCP is
    enabled

 drivers/media/platform/Kconfig                |  28 ++-
 drivers/media/platform/mtk-vcodec/Makefile    |  10 +-
 .../platform/mtk-vcodec/mtk_vcodec_dec_drv.c  |   2 +-
 .../platform/mtk-vcodec/mtk_vcodec_enc_drv.c  |   2 +-
 .../media/platform/mtk-vcodec/mtk_vcodec_fw.c | 174 +-----------------
 .../media/platform/mtk-vcodec/mtk_vcodec_fw.h |   7 +-
 .../platform/mtk-vcodec/mtk_vcodec_fw_priv.h  |  52 ++++++
 .../platform/mtk-vcodec/mtk_vcodec_fw_scp.c   |  73 ++++++++
 .../platform/mtk-vcodec/mtk_vcodec_fw_vpu.c   | 109 +++++++++++
 9 files changed, 277 insertions(+), 180 deletions(-)
 create mode 100644 drivers/media/platform/mtk-vcodec/mtk_vcodec_fw_priv.h
 create mode 100644 drivers/media/platform/mtk-vcodec/mtk_vcodec_fw_scp.c
 create mode 100644 drivers/media/platform/mtk-vcodec/mtk_vcodec_fw_vpu.c

--
2.29.0.rc1.297.gfa9743e501-goog

