Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 8FD593C9BBC
	for <lists+linux-media@lfdr.de>; Thu, 15 Jul 2021 11:27:04 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S241109AbhGOJ2t (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 15 Jul 2021 05:28:49 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39772 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S239785AbhGOJ2t (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 15 Jul 2021 05:28:49 -0400
Received: from mail-pl1-x62a.google.com (mail-pl1-x62a.google.com [IPv6:2607:f8b0:4864:20::62a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 31F2AC061760;
        Thu, 15 Jul 2021 02:25:56 -0700 (PDT)
Received: by mail-pl1-x62a.google.com with SMTP id p17so2890401plf.12;
        Thu, 15 Jul 2021 02:25:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=aMXI9Mdj9z/HPVLPURXiRCm4s3Wy5duT1BMDaADDJh8=;
        b=Ad280bKSABKLCLMpJBsFT0sTvaP2B4Yr6QaoxVuUKwmFMMa1w2TUdHDTY6Ev1mtXUG
         pWbET+qABYWxkGhKEeL34lbuYWgsjler/hWqeL7RUzvQjGopW8Rl5EBaQVvuzB9Nx64g
         vFE1fJj83uMG1U8LHveoLcve58URBZmRM7RD/G3qJQ40lnZJcCGdxXO48NU9G2JBh+eO
         i/5t1nXj2phT21JSy0J+++DssTwNY57rxCFbq9q9uQ4hZTu34C0oYLVqYXudgg3zN2nE
         iu8dVILctJ9D2WgMWXD4cclU8ODUSrla2owNRQ5fI9Y3y+J8CGLTrp+FVhNkAoNkUpmf
         Xing==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references;
        bh=aMXI9Mdj9z/HPVLPURXiRCm4s3Wy5duT1BMDaADDJh8=;
        b=h8EzOHh/iPSj+Qh62cm3PNpabzA9LbLKppk4Hi47TyunZxom/5LNDd3EU2a3L054aY
         o9VwUqwKbJ7XrzSLfElhiCXY45D5juL8enyTCzXq2/j5QBAak/I+e+GjbcQoGqucRo2l
         9iWUu2FSmtgrI3RVQSHCGQ9H/NvE9W2VOSB4XwgS1KL2XrV+5sGYfkvQfYkmWkAJRu20
         L9YbQEsiyENsFiIafBDyJ8++9rtqqz5IuH9s4MQJeHIylL79qvKH7oJs/N0ylUIw7E4a
         KI/J0XfCDc33qOvTYrhyldgWJAVPRpu5PHEf/xkNaQ07i7dXKZ2tjVTocM5Qv73SrV48
         i87A==
X-Gm-Message-State: AOAM533tt2irDmYNj5s/jsgqCw/A8IRHrTVb/aFbzPfSZw3OmXZZjuA7
        KIlSeWiwgrJ0PYPjjhVkxuo=
X-Google-Smtp-Source: ABdhPJysCyoNhM0i2lSCi+LeiSv1Ani1Nyw3PAHKsMTj4pTTWSpC4Z7DAv2YdmHxLikUkvpMeU59+g==
X-Received: by 2002:a17:90a:4105:: with SMTP id u5mr9377171pjf.33.1626341155823;
        Thu, 15 Jul 2021 02:25:55 -0700 (PDT)
Received: from fmin-OptiPlex-7060.nreal.work ([137.59.103.165])
        by smtp.gmail.com with ESMTPSA id 11sm6662503pge.7.2021.07.15.02.25.51
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Thu, 15 Jul 2021 02:25:55 -0700 (PDT)
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
Date:   Thu, 15 Jul 2021 17:24:27 +0800
Message-Id: <1626341068-20253-19-git-send-email-dillon.minfei@gmail.com>
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

