Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id EDCE53C9B93
	for <lists+linux-media@lfdr.de>; Thu, 15 Jul 2021 11:26:49 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S240938AbhGOJ2J (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 15 Jul 2021 05:28:09 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39472 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S240939AbhGOJ2D (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 15 Jul 2021 05:28:03 -0400
Received: from mail-pf1-x42c.google.com (mail-pf1-x42c.google.com [IPv6:2607:f8b0:4864:20::42c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 36865C061762;
        Thu, 15 Jul 2021 02:25:11 -0700 (PDT)
Received: by mail-pf1-x42c.google.com with SMTP id 17so4619957pfz.4;
        Thu, 15 Jul 2021 02:25:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=aMXI9Mdj9z/HPVLPURXiRCm4s3Wy5duT1BMDaADDJh8=;
        b=auQS+BROwNqtVRP7Qn84WVKH3Y4tqxm9J/3ZatsQUFmc23gND63/rSF395jr23qOUs
         ouobJ3+L6TTOkBb5B906jVuoJNruU0BAXaGFmvchOy/bmVY6KEUdnN1xW8sTpPjIA4vf
         8Xes0Ul6+EH15JINwsUHfhRVpqhoKopHmHq9UmRveMiLfdnQvQkLH3rXN/biE9YGZtfW
         QeZk3r239/lH8s7kwCxDm1Je/lyDZecU4jKC9FKhz22/bexkHief0fwGAGSd6vFdv1JZ
         cnvO/imLr1LoRnat/+cz7DGyofzi10KLVsEdS0PsP4um6qOckdYuDp7k4aoiSjQ1kaQw
         cXiQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references;
        bh=aMXI9Mdj9z/HPVLPURXiRCm4s3Wy5duT1BMDaADDJh8=;
        b=qRZMuk/y5d03ktLgVAt6SRThKxjwUiCBtPizy4N/n7W9MD6+IXa0D8wXmbIAMtxIcR
         pvMmUJX9cemUvFxODJcqpV1R6YfAmTWH090w+2QFTiAbBKbfqiOKSXOn9INWbMY5srl6
         8niflSNR+u+WYcMJ3mQoPXew4w9XgT9j+9F6A1JcE6Ojq+xfMwwUX18zfqgjNkuMb+wN
         S7MbTvvqNiL8G6Ki7QDQMEzXnpFINZwGr3iQBSvgl3IvAJTJ11Fi6pxRu/RHsjXrQ+oX
         iLMVnpnQu6lsF0klj+lN1h0rYedPmvvOcgOTG/zKK7CV+57KR8Xu54v7Ns5fOnkiY0fP
         h//w==
X-Gm-Message-State: AOAM533SHM/2oj2M8FSlA2D6gLNQIgP6JaeKMcIUhSEL4PmTGw6Jl7Cr
        WqCNd6hR6DlJ6aE9mVvfPwc=
X-Google-Smtp-Source: ABdhPJwLCNI8nTiJiTAxhrCC+BkGgmfpsr4JifdnchvanZM36aqP6C1wxyri8GmOxeiM8heOSrNJGQ==
X-Received: by 2002:a63:1324:: with SMTP id i36mr3677546pgl.8.1626341110807;
        Thu, 15 Jul 2021 02:25:10 -0700 (PDT)
Received: from fmin-OptiPlex-7060.nreal.work ([137.59.103.165])
        by smtp.gmail.com with ESMTPSA id 11sm6662503pge.7.2021.07.15.02.25.06
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Thu, 15 Jul 2021 02:25:10 -0700 (PDT)
From:   dillon.minfei@gmail.com
To:     mchehab@kernel.org, mchehab+huawei@kernel.org,
        hverkuil-cisco@xs4all.nl, ezequiel@collabora.com, gnurou@gmail.com,
        pihsun@chromium.org, mcoquelin.stm32@gmail.com,
        alexandre.torgue@foss.st.com, mturquette@baylibre.com,
        sboyd@kernel.org, robh+dt@kernel.org
Cc:     patrice.chotard@foss.st.com, hugues.fruchet@foss.st.com,
        linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-stm32@st-md-mailman.stormreply.com,
        linux-arm-kernel@lists.infradead.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, Dillon Min <dillon.minfei@gmail.com>
Subject: [PATCH v2 8/9] media: v4l: uapi: Add user control base for stm32 dma2d controls
Date:   Thu, 15 Jul 2021 17:24:17 +0800
Message-Id: <1626341068-20253-9-git-send-email-dillon.minfei@gmail.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1626341068-20253-1-git-send-email-dillon.minfei@gmail.com>
References: <1626341068-20253-1-git-send-email-dillon.minfei@gmail.com>
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

From: Dillon Min <dillon.minfei@gmail.com>

Add a control base for stm32 controls, and reserve 16 controls.

Signed-off-by: Dillon Min <dillon.minfei@gmail.com>
---
v2: reserved 16 ioctls from v4l2-controls.h for stm32, thanks Hans

 include/uapi/linux/stm32-media.h   | 12 ++++++++++++
 include/uapi/linux/v4l2-controls.h |  5 +++++
 2 files changed, 17 insertions(+)
 create mode 100644 include/uapi/linux/stm32-media.h

diff --git a/include/uapi/linux/stm32-media.h b/include/uapi/linux/stm32-media.h
new file mode 100644
index 000000000000..c5a05801a7a4
--- /dev/null
+++ b/include/uapi/linux/stm32-media.h
@@ -0,0 +1,12 @@
+/* SPDX-License-Identifier: GPL-2.0-only WITH Linux-syscall-note */
+/* Copyright (C) 2021 Dillon Min, <dillon.minfei@gmail.com> */
+
+#ifndef __UAPI_STM32_MEDIA_H__
+#define __UAPI_STM32_MEDIA_H__
+
+#include <linux/v4l2-controls.h>
+
+#define V4L2_CID_DMA2D_R2M_COLOR		(V4L2_CID_USER_STM32_BASE + 1)
+#define V4L2_CID_DMA2D_R2M_MODE			(V4L2_CID_USER_STM32_BASE + 2)
+
+#endif
diff --git a/include/uapi/linux/v4l2-controls.h b/include/uapi/linux/v4l2-controls.h
index fdf97a6d7d18..72d0bb095732 100644
--- a/include/uapi/linux/v4l2-controls.h
+++ b/include/uapi/linux/v4l2-controls.h
@@ -212,6 +212,11 @@ enum v4l2_colorfx {
  */
 #define V4L2_CID_USER_CCS_BASE			(V4L2_CID_USER_BASE + 0x10f0)
 
+/* The base for the stm32 dma2d driver controls.
+ * We reserve 16 controls for this driver.
+ */
+#define V4L2_CID_USER_STM32_BASE		(V4L2_CID_USER_BASE + 0x1170)
+
 /* MPEG-class control IDs */
 /* The MPEG controls are applicable to all codec controls
  * and the 'MPEG' part of the define is historical */
-- 
2.7.4

