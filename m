Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B417B36A288
	for <lists+linux-media@lfdr.de>; Sat, 24 Apr 2021 20:20:48 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232546AbhDXSUV (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sat, 24 Apr 2021 14:20:21 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36472 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231814AbhDXSUU (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Sat, 24 Apr 2021 14:20:20 -0400
Received: from mail-qt1-x82f.google.com (mail-qt1-x82f.google.com [IPv6:2607:f8b0:4864:20::82f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 28516C061574;
        Sat, 24 Apr 2021 11:19:42 -0700 (PDT)
Received: by mail-qt1-x82f.google.com with SMTP id d6so20474459qtx.13;
        Sat, 24 Apr 2021 11:19:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=8RXOlSm03VbeMbySXyCFRFEgeMcD59AdNwl/nJLNOYw=;
        b=eFNW4N0ao0mYhI2AqP1eZXrblovrzgcVjtokOMYUpvRnR9Nes8Qn75ap3G+Iu2v8wr
         TtiXtZnkQssUx5nqkAAtogoZjOPIVivEsg1K1Yb69odrA1+/6RLpKG+Y3bof5GV/tp3l
         7pu+tzkU2nw/WXZ11LR6mtX1gBGdMEyF5LTrO/STURUa4+ZsylpHTC79q8nblQ0mmBDT
         BQRc2tL4r9AtN2TiE31Xm2wegcROcxYaqIc2wKEroFbo6mCPFjaEKaRVm2mgmD+LnGUB
         6c7j/GkQrSgjok9Dc+OOClJBpe/Q1+RsjYrl3zhU+ObJylBnuTTFn+cjXglTFP1UphH8
         wnHA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=8RXOlSm03VbeMbySXyCFRFEgeMcD59AdNwl/nJLNOYw=;
        b=SDJ+egj1Mgu8KHFxvBa0wEMPxaaPaCpfPwNsGBkjHKobawfhsMfVdgD3oIjYmOmaH+
         m4mc8+myAwT+PJGEoZ2kpgtFxhJOMqmji2BbTd+T1gaHpCFwgpyHSYYJ2CoNXijdX1ai
         zCoEiFP5neoRhXy3wiyaC+LZJIqUrRR3Upm4fcExocdtI+/Rq8Mz5q8DWBiUKlcli2I8
         RHFlrApBugZmB3M6thc/x0Meo/wIOfymJedh1sGHL77cpF7i2T9qMoZB1fIzduo7Efo5
         pMVsDPV806atjG4QejHQ4soWDmBB/rzJdzsnTiXm3lyzH/Dl1tiv6UNWexUeT9i5vVFU
         u5qQ==
X-Gm-Message-State: AOAM531GOb+RojxR0VTXE6z2CMKXf1wFpz+lvwuqJliqUtFA+YXaBFAO
        H0ZeU7wUUGb1mxtECNNbqpU=
X-Google-Smtp-Source: ABdhPJxNt9CR9bI1aojKn6K6sSFRLVkrcTpKc47KQYxuIxRTaeKPGkF03kQgZE0MXY8J+gK9pnl2/Q==
X-Received: by 2002:aed:2043:: with SMTP id 61mr2163587qta.308.1619288381155;
        Sat, 24 Apr 2021 11:19:41 -0700 (PDT)
Received: from localhost.localdomain ([187.74.38.55])
        by smtp.googlemail.com with ESMTPSA id i21sm6355041qtr.94.2021.04.24.11.19.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 24 Apr 2021 11:19:40 -0700 (PDT)
From:   Rodrigo Figueiredo Zaiden <rodrigoffzz@gmail.com>
To:     mchehab@kernel.org, sakari.ailus@linux.intel.com,
        gregkh@linuxfoundation.org
Cc:     linux-media@vger.kernel.org, linux-staging@lists.linux.dev,
        linux-kernel@vger.kernel.org, rodrigoffzz@gmail.com
Subject: [PATCH] media: atomisp: add ibuf_ctrl_rmgr.c to ISP2401 build only
Date:   Sat, 24 Apr 2021 15:18:52 -0300
Message-Id: <20210424181852.64472-1-rodrigoffzz@gmail.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

When CONFIG_VIDEO_ATOMISP_ISP2401 is not set, sparse shows
the following warnings:

drivers/staging/media/atomisp/pci/runtime/isys/src/ibuf_ctrl_rmgr.c:34:6: warning: symbol 'ia_css_isys_ibuf_rmgr_init' was not declared. Should it be static?
drivers/staging/media/atomisp/pci/runtime/isys/src/ibuf_ctrl_rmgr.c:40:6: warning: symbol 'ia_css_isys_ibuf_rmgr_uninit' was not declared. Should it be static?
drivers/staging/media/atomisp/pci/runtime/isys/src/ibuf_ctrl_rmgr.c:46:6: warning: symbol 'ia_css_isys_ibuf_rmgr_acquire' was not declared. Should it be static?
drivers/staging/media/atomisp/pci/runtime/isys/src/ibuf_ctrl_rmgr.c:106:6: warning: symbol 'ia_css_isys_ibuf_rmgr_release' was not declared. Should it be static?

The symbols stated as not declared are actually declared
under ISP2401 definition in ia_css_isys.h.
So, the file ibuf_ctrl_rmgr.c should be compiled only when
ISP2401 is enabled.

Signed-off-by: Rodrigo Figueiredo Zaiden <rodrigoffzz@gmail.com>
---
 drivers/staging/media/atomisp/Makefile | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/staging/media/atomisp/Makefile b/drivers/staging/media/atomisp/Makefile
index 1dfad0dd02d0..555f2efa35b7 100644
--- a/drivers/staging/media/atomisp/Makefile
+++ b/drivers/staging/media/atomisp/Makefile
@@ -126,7 +126,6 @@ atomisp-objs += \
 	pci/runtime/inputfifo/src/inputfifo.o \
 	pci/runtime/isp_param/src/isp_param.o \
 	pci/runtime/isys/src/csi_rx_rmgr.o \
-	pci/runtime/isys/src/ibuf_ctrl_rmgr.o \
 	pci/runtime/isys/src/isys_dma_rmgr.o \
 	pci/runtime/isys/src/isys_init.o \
 	pci/runtime/isys/src/isys_stream2mmio_rmgr.o \
@@ -175,7 +174,8 @@ obj-cht = \
 	pci/css_2401_system/host/ibuf_ctrl.o \
 	pci/css_2401_system/host/isys_dma.o \
 	pci/css_2401_system/host/isys_irq.o \
-	pci/css_2401_system/host/isys_stream2mmio.o
+	pci/css_2401_system/host/isys_stream2mmio.o \
+	pci/runtime/isys/src/ibuf_ctrl_rmgr.o
 
 INCLUDES += \
 	-I$(atomisp)/ \
-- 
2.25.1

