Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 4410E324BBE
	for <lists+linux-media@lfdr.de>; Thu, 25 Feb 2021 09:09:44 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235593AbhBYIIG (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 25 Feb 2021 03:08:06 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56384 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235588AbhBYIIA (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 25 Feb 2021 03:08:00 -0500
Received: from mail-ot1-x330.google.com (mail-ot1-x330.google.com [IPv6:2607:f8b0:4864:20::330])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id ED9EBC06174A;
        Thu, 25 Feb 2021 00:07:19 -0800 (PST)
Received: by mail-ot1-x330.google.com with SMTP id r19so4907596otk.2;
        Thu, 25 Feb 2021 00:07:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=sender:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=Pt3L+h885gw4GcNnVra5W20CxqYIO3PTJPUZw8JgzYI=;
        b=RS+BiMbDt0OcyT1y7i3CmXIJMjXbmhMJRGVysFK0ovhbrqqIdzVRDZT7CEqya36BaD
         iRogBXVNtwJfhi6Lhv09ZGcs8cj7mDVF6iDXjvj/su1xy6zLNBo1a4tdDdlcxu7kgOth
         uck/n2iSJdOyUg/bFM4BSnRzVnIa0cAfmV83VmUVsSTJ51VCTPtFqWWc5sMwu2vD6Izi
         SGS3KHq8VCtTlmqQQrOOJU4GM4h3c3kjIAfAHWQ2yzDWRFXC4atUlIbKbX+Mu84Kl94Y
         bzhVGjL5k5ERkF5jEejU5jecTxQW3aJ7nyWjSVJjR4Fw/xGX+OF9Lg76hg54yCaBe3Jq
         kAZg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
         :mime-version:content-transfer-encoding;
        bh=Pt3L+h885gw4GcNnVra5W20CxqYIO3PTJPUZw8JgzYI=;
        b=iD/xrFI9cNlFWDdgNrC3I5lzMiw7c4J3TcUbhnUFlEuNjNLQFQVw7g/7Xz8MKJD7J7
         L3SoYBeU4/1XprBg+EsxHMdVrXPznbxIImKiNNXkSVQAZ5jG9QZo/WX0FMeGtCXXxbxR
         zR1/uZ6MHx0DZgV7xSE66SUUwVx/C6jRHUwkSKFst5iwSdDjPFvWbTIPGiJWK2JEfzTN
         DCsU2I0jzPL8gQ0sDeWvqZ/ZoV4FioLZ1tAiVm2EzrREREfe9gNhTySPBBkd5DyjD4gX
         sBAgkQ55T7O/rea0aZRz/HCOH6/B8Y4hVZuwsFGrEjiHZh9maL4TtlklaQAwRtCM2yg5
         Eelg==
X-Gm-Message-State: AOAM5317cTRotm9zvmHyQ9IVTwTF3szF4vgAUq5Rz/WXGr/rcmIkG1Ef
        CIFGhGeNIOl1fnrhm0vIX/JJY6KupN/kuEu0
X-Google-Smtp-Source: ABdhPJxuOEspLe2RcRP+rTbvGD1zZkGiOFNp8QjDb9LWob5ZQd2eMI4LR378EKmjLyqTv8DnY0MNzw==
X-Received: by 2002:a9d:6c8b:: with SMTP id c11mr1382966otr.52.1614240437929;
        Thu, 25 Feb 2021 00:07:17 -0800 (PST)
Received: from kde-neon-desktop.orld.fl.wtsky.net ([208.64.158.251])
        by smtp.gmail.com with ESMTPSA id l2sm892628oie.8.2021.02.25.00.07.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 25 Feb 2021 00:07:17 -0800 (PST)
Sender: Julian Braha <julian.braha@gmail.com>
From:   Julian Braha <julianbraha@gmail.com>
To:     mchehab@kernel.org
Cc:     linux-media@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH] drivers: media: pci: sta2x11: fix Kconfig dependency on GPIOLIB
Date:   Thu, 25 Feb 2021 03:06:58 -0500
Message-Id: <20210225080658.22332-1-julianbraha@gmail.com>
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

