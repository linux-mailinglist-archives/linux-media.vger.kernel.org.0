Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id AF48E3C9B8F
	for <lists+linux-media@lfdr.de>; Thu, 15 Jul 2021 11:26:48 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S240915AbhGOJ2A (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 15 Jul 2021 05:28:00 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39446 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S240908AbhGOJ17 (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 15 Jul 2021 05:27:59 -0400
Received: from mail-pl1-x631.google.com (mail-pl1-x631.google.com [IPv6:2607:f8b0:4864:20::631])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C4C55C061762;
        Thu, 15 Jul 2021 02:25:06 -0700 (PDT)
Received: by mail-pl1-x631.google.com with SMTP id e14so150863plh.8;
        Thu, 15 Jul 2021 02:25:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=nuloZLenal/UheIEhaBZVdFRbceClqyoioQrDZ98xwM=;
        b=YX6Dv7CoBYCPBMVzgSnETwLBtpDq3GHnrDQWprPjwKYVdT8DjPy/lxOP8RSBnB0XbH
         z9k6L3NBuo3qPRyMB6i2S9A5X/BKcNZnbbHyI+SPaTOAdZ+nN9/wQOsQGCVO23XIkCh4
         Q+ZBIIaQSA2Xqbv5D8mXvVw3jDc4NoZbUNoD4TVY+PwV3pmmTB8DlovyBvUjHFam1bl+
         7W1OWL2LJLKAKeYbQpTjwZeuwHvCGZQWI2ntWFHF+VM+F5qL2LBy8DcNJeVfVC9XV/a2
         ACFhTKYcM0usP9v4RynjvsbP+zDoqtESZMq5rBrtpWyEPnlvHeMdPPpzzoUQSeoHjRAQ
         CCdg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references;
        bh=nuloZLenal/UheIEhaBZVdFRbceClqyoioQrDZ98xwM=;
        b=ERd+R87Iy+XTvoN8umxQZ1MjVCiF3PZ/Su50jkFqSzlN7ok6aMBEqiORTJBme2QfI0
         6pDsa+6uY05CYAQZ4Q/DRdmMJfv0m/7CfrdLwBO0H0TM4ghWGV8BDHEs7BemY+3EYhLc
         YswkMW8rbAeKGgIhyn0T9EEQItxofCd3vhj7E6ecfDe9Kbcp3KLZfRCA42BqBQTYD4yT
         iHVknyP7MfLjKklp7qjN+exbZbcK2p3SIaGxHQlOVBZs8Uc9OSoXjBrxWsi8KcXVwpW+
         6Am2ACvwUu5Avuxy/WSysue/djKWMmvAW7rejtrJ7n+jjsmO8C02+iGsXvl5QJ52cAGP
         zxkA==
X-Gm-Message-State: AOAM533Ti3J9BbsqzS5nx7u5rA4w6oECrWXcvyPU6EDOE9AkZCAWHaCI
        I57wCrDSF44gBboYzpkl30U=
X-Google-Smtp-Source: ABdhPJzlKUuZqqZ0SeRjLt0pUzE1LDwnOSdCyljcnofT5mqCIEhUZDeISmb/o2e79VB5I+2NfDmrrg==
X-Received: by 2002:a17:902:6acb:b029:fc:4d8c:cfba with SMTP id i11-20020a1709026acbb02900fc4d8ccfbamr2633129plt.29.1626341106357;
        Thu, 15 Jul 2021 02:25:06 -0700 (PDT)
Received: from fmin-OptiPlex-7060.nreal.work ([137.59.103.165])
        by smtp.gmail.com with ESMTPSA id 11sm6662503pge.7.2021.07.15.02.25.02
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Thu, 15 Jul 2021 02:25:06 -0700 (PDT)
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
Date:   Thu, 15 Jul 2021 17:24:16 +0800
Message-Id: <1626341068-20253-8-git-send-email-dillon.minfei@gmail.com>
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

