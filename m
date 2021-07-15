Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 791723C9BB9
	for <lists+linux-media@lfdr.de>; Thu, 15 Jul 2021 11:27:03 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S241101AbhGOJ2s (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 15 Jul 2021 05:28:48 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39740 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S241094AbhGOJ2o (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 15 Jul 2021 05:28:44 -0400
Received: from mail-pf1-x42c.google.com (mail-pf1-x42c.google.com [IPv6:2607:f8b0:4864:20::42c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9E36FC061762;
        Thu, 15 Jul 2021 02:25:51 -0700 (PDT)
Received: by mail-pf1-x42c.google.com with SMTP id y4so4611577pfi.9;
        Thu, 15 Jul 2021 02:25:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=nuloZLenal/UheIEhaBZVdFRbceClqyoioQrDZ98xwM=;
        b=uXnGQkzYNmsMJKICRXmd3BH6KXt8tIFLfh2fMQhm3++vG3AnNv0GzPqKBvzCW79C/r
         RW3jvPfH8gp6D/udSl83C2ij6BtOT/OtA8lnJc9yXGhMIQvpgPLxy8sNaH+bWowJ3CGB
         78L+0xjSoIYNlU1OLm1TIK/RZh/y8uSyoQYoibEa1pjMavVaUEIUsl4Zj05mrpI1aKae
         lQ37CYAhbJMNk204z6E8q+w61JWtbQwr+yefBYkRLlI3XiBIYvThGSz2A0sdbym7F8/y
         shGdlpJ0ZEFwqAPN2FT+ayg1uLX5jVgf5cUFYn2AX6XY2yiVvXPzl7jMIYRzci6HgOBf
         5NbA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references;
        bh=nuloZLenal/UheIEhaBZVdFRbceClqyoioQrDZ98xwM=;
        b=rMzIhrzNftCOCwIJfzLLM2M3l0PaouOb2ksC09BTq8LweaDqnCbwzuRttw4Fryu9II
         hb5CuZAKVvJ0/enxk/Nhf1msuvrjcOHmtzdI1i2rVEdPwbcfmLTTaB3qdTa9ZbyVNczZ
         fqCYN3nO6RIT6vCGapIQtbqTc+Wi4IrANJJy/7mY2wrAA4qgjy3XVvtQFFMpTdEvRAzO
         omjGLpRf26SURoHBBDJgFjhkt8NbB93aQV9nCHUkyVNy4jkDm7QM/0Wk3FdDGZBoekPU
         h1yyAZb0ugmYThSXQ/lpQIJSdowP92H7zfMYEnw5EOhR+9eCFq00r7Mlxrp6+0kVal7x
         Vn4w==
X-Gm-Message-State: AOAM533/wJAunEn3SEjOr4T1KbTpX+nenf8iPX/iGnlL42xoyE344V7B
        UKv9a2bisgpiUyE9/JoLA/s=
X-Google-Smtp-Source: ABdhPJyM339cZ1aNdZTnqG+yNazb0nafEo1b2RjEhB7z1jbjxjLw9A+wAJAWz65wNYippvM8w5U9wA==
X-Received: by 2002:a65:61ab:: with SMTP id i11mr3635137pgv.168.1626341151234;
        Thu, 15 Jul 2021 02:25:51 -0700 (PDT)
Received: from fmin-OptiPlex-7060.nreal.work ([137.59.103.165])
        by smtp.gmail.com with ESMTPSA id 11sm6662503pge.7.2021.07.15.02.25.47
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Thu, 15 Jul 2021 02:25:50 -0700 (PDT)
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
Subject: [PATCH v2 7/9] media: docs: add doc for the stm32 dma2d driver
Date:   Thu, 15 Jul 2021 17:24:26 +0800
Message-Id: <1626341068-20253-18-git-send-email-dillon.minfei@gmail.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1626341068-20253-1-git-send-email-dillon.minfei@gmail.com>
References: <1626341068-20253-1-git-send-email-dillon.minfei@gmail.com>
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

From: Dillon Min <dillon.minfei@gmail.com>

add stm32-uapi.rst for stm32's dma2d driver, explain the details of ioctl
V4L2_CID_DMA2D_R2M_MODE, V4L2_CID_DMA2D_R2M_COLOR.

Signed-off-by: Dillon Min <dillon.minfei@gmail.com>
---
v2: introduce the stm32-uapi.rst to explain the detail of dma2d's ioctl.

 .../userspace-api/media/drivers/index.rst          |  1 +
 .../userspace-api/media/drivers/stm32-uapi.rst     | 22 ++++++++++++++++++++++
 2 files changed, 23 insertions(+)
 create mode 100644 Documentation/userspace-api/media/drivers/stm32-uapi.rst

diff --git a/Documentation/userspace-api/media/drivers/index.rst b/Documentation/userspace-api/media/drivers/index.rst
index 12e3c512d718..ce42915d48f4 100644
--- a/Documentation/userspace-api/media/drivers/index.rst
+++ b/Documentation/userspace-api/media/drivers/index.rst
@@ -38,4 +38,5 @@ For more details see the file COPYING in the source distribution of Linux.
 	max2175
 	meye-uapi
 	omap3isp-uapi
+	stm32-uapi
 	uvcvideo
diff --git a/Documentation/userspace-api/media/drivers/stm32-uapi.rst b/Documentation/userspace-api/media/drivers/stm32-uapi.rst
new file mode 100644
index 000000000000..d7a4f717387d
--- /dev/null
+++ b/Documentation/userspace-api/media/drivers/stm32-uapi.rst
@@ -0,0 +1,22 @@
+.. SPDX-License-Identifier: GPL-2.0
+
+STM32 Chrom-Art 2D Graphics Accelerator unit (DMA2D) driver
+================================================
+
+The DMA2D driver implements the following driver-specific controls:
+
+``V4L2_CID_DMA2D_R2M_MODE``
+-------------------------
+    Enable/Disable the Register-To-Memory mode, filling a part or the
+    whole of a destination image with a specific color.
+
+    1 for enable, 0 for disable.
+
+``V4L2_CID_DMA2D_R2M_COLOR``
+-------------------------------
+    Set the color to fill a part or the whole of a destination image.
+    only used under Register-To-Memory mode, to set the DMA2D_OCOLR register
+    (RED, GREEN, BLUE) which is:
+
+    31 .. 24    23 .. 16  15 .. 8     7 .. 0
+    ALPHA[7:0]  RED[7:0]  GREEN[7:0]  BLUE[7:0]
-- 
2.7.4

