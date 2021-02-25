Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 53ACB324BA1
	for <lists+linux-media@lfdr.de>; Thu, 25 Feb 2021 09:00:26 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235265AbhBYIAP (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 25 Feb 2021 03:00:15 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54674 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235322AbhBYIAG (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 25 Feb 2021 03:00:06 -0500
Received: from mail-qk1-x732.google.com (mail-qk1-x732.google.com [IPv6:2607:f8b0:4864:20::732])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 18380C061786;
        Wed, 24 Feb 2021 23:59:26 -0800 (PST)
Received: by mail-qk1-x732.google.com with SMTP id h8so4862838qkk.6;
        Wed, 24 Feb 2021 23:59:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=sender:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=Pt3L+h885gw4GcNnVra5W20CxqYIO3PTJPUZw8JgzYI=;
        b=a36fTa/EyMk7R3JtCzTa1z/R+UvpNCGFc4fxm7ciTOOORcPlb9IOHfXT0wmGLpORxJ
         bTUeecWa1xeFHQ88mWiPCXNMIRlLuwAPyP6jxCVrldcNb5v6Do1hyNdJvxbeXpgGBUOR
         BRTRwMu7GUxD7b/k/6gnyMzxWvfxaTkS/HdwBZ/3A0/Bm9+nhh01DRYPfsFavMpE4Hm+
         9QSwCIprhZPzZbE5asKWvefTpUPRmaMoIUbPAQRql2qWBdQ/2rtsD0bqJXy/BsVneeKP
         xc5ePkR7TFr9m8KeYXzb1pJrUosNcSonOZSv/HgNLq0t6orcfx7JzOMQbZD0vnDAt55n
         VcjA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
         :mime-version:content-transfer-encoding;
        bh=Pt3L+h885gw4GcNnVra5W20CxqYIO3PTJPUZw8JgzYI=;
        b=EYSsIu8Gp8gCqqmK4m83OU50NmaJFicQ0A4BM6wXxe0SbGimI+FzV1fFJuIQSMXXVt
         RpwWQhipR3P2kjSMR4PiTZVX02yl/DYF21Zq8PuV7G/h6sVVaZYXGQjEXRm14cy4y/Hl
         qnjjz27SW6RxwD7a3mFBG+WUE8vwMjhx3bBN56uexvMPqXvRTEv3I0W4jqk54l3h8X78
         oN23oyqTxqnkZJlz43lSmoZvC/ep+kHQ3/3g3VU4tnqSOAfxRV2C5rKCvv9aUsQVfrY7
         bNlPKKAYsNOl7Atnd0IQiCnfRgEZcgQ6+viFXtT/eEAht07SmC70shYOSsS/UHn8w4ju
         ZHCw==
X-Gm-Message-State: AOAM533YQ59Z2emlHWi+Fvs2xoU3gexNPCdtvf1wEvO8HsvbduVmGzMG
        ZB9e5Xkvs6GNtjfPsHJJCro=
X-Google-Smtp-Source: ABdhPJz9ljLDmYsbtXEk9ie3r/vA5ZfGoti9lrBm+pCX6t/4Cq5pZfN83Usnf/sVutzY2W5s+MCovQ==
X-Received: by 2002:a37:9b0c:: with SMTP id d12mr1567754qke.215.1614239965202;
        Wed, 24 Feb 2021 23:59:25 -0800 (PST)
Received: from kde-neon-desktop.orld.fl.wtsky.net ([208.64.158.251])
        by smtp.gmail.com with ESMTPSA id b7sm3431943qkj.115.2021.02.24.23.59.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 24 Feb 2021 23:59:24 -0800 (PST)
Sender: Julian Braha <julian.braha@gmail.com>
From:   Julian Braha <julianbraha@gmail.com>
To:     mchehab@kernel.org
Cc:     linux-media@vger.kernel.org, kernel@vger.kernel.org
Subject: [PATCH] drivers: media: pci: sta2x11: fix Kconfig dependency on GPIOLIB
Date:   Thu, 25 Feb 2021 02:59:15 -0500
Message-Id: <20210225075915.20886-1-julianbraha@gmail.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

When STA2X11_VIP is enabled, and GPIOLIB is disabled,
Kbuild gives the following warning:

WARNING: unmet direct dependencies detected for VIDEO_ADV7180
  Depends on [n]: MEDIA_SUPPORT [=y] && GPIOLIB [=n] && VIDEO_V4L2 [=y] && I2C [=y]
  Selected by [y]:
  - STA2X11_VIP [=y] && MEDIA_SUPPORT [=y] && MEDIA_PCI_SUPPORT [=y] && MEDIA_CAMERA_SUPPORT [=y] && PCI [=y] && VIDEO_V4L2 [=y] && VIRT_TO_BUS [=y] && I2C [=y] && (STA2X11 [=n] || COMPILE_TEST [=y]) && MEDIA_SUBDRV_AUTOSELECT [=y]

This is because STA2X11_VIP selects VIDEO_ADV7180
without selecting or depending on GPIOLIB,
despite VIDEO_ADV7180 depending on GPIOLIB.

Signed-off-by: Julian Braha <julianbraha@gmail.com>
---
 drivers/media/pci/sta2x11/Kconfig | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/media/pci/sta2x11/Kconfig b/drivers/media/pci/sta2x11/Kconfig
index 4dd98f94a91e..27bb78513631 100644
--- a/drivers/media/pci/sta2x11/Kconfig
+++ b/drivers/media/pci/sta2x11/Kconfig
@@ -3,6 +3,7 @@ config STA2X11_VIP
 	tristate "STA2X11 VIP Video For Linux"
 	depends on PCI && VIDEO_V4L2 && VIRT_TO_BUS && I2C
 	depends on STA2X11 || COMPILE_TEST
+	select GPIOLIB if MEDIA_SUBDRV_AUTOSELECT
 	select VIDEO_ADV7180 if MEDIA_SUBDRV_AUTOSELECT
 	select VIDEOBUF2_DMA_CONTIG
 	select MEDIA_CONTROLLER
-- 
2.27.0

