Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id CA6E2476692
	for <lists+linux-media@lfdr.de>; Thu, 16 Dec 2021 00:35:47 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232085AbhLOXfq (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 15 Dec 2021 18:35:46 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37512 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232073AbhLOXfq (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 15 Dec 2021 18:35:46 -0500
Received: from mail-qk1-x732.google.com (mail-qk1-x732.google.com [IPv6:2607:f8b0:4864:20::732])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B7235C061574
        for <linux-media@vger.kernel.org>; Wed, 15 Dec 2021 15:35:45 -0800 (PST)
Received: by mail-qk1-x732.google.com with SMTP id m186so21740342qkb.4
        for <linux-media@vger.kernel.org>; Wed, 15 Dec 2021 15:35:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=sender:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=u/AH9wrTDXjufS8cGkvVASvLa0xf/37kmJtfJgtModw=;
        b=ivYp+OtuI3d281zt8M+NM8TtoXt2oNc4KJeGOD3n7u3KcNNh16w11AYLhI9HFLmcaB
         hHcNG1k+qiAPES1WsNqTZHXTqfmfkFN/ZqWkKp/oNV5hw3hNrERHoZcmKcF2NtELWgUx
         /NFvS4XowjJLMbB9D8jkQm24HsyQb15NNnflFK3a621O79+7zqpigw6VNSBeJWXCVK3B
         DtXI58QdPUJoqlRin6QhdaTRIBiKlOCQ+j8aQFMQ1iTMPHDU6DZk+7DWQ3zLp+yMDMZ+
         P/XD+pZKJN/H8+DnClzJZSZyiunXKMDoza5KyWiuswNWpHGo073upm4p89CjNI+h7tvc
         wb7Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
         :mime-version:content-transfer-encoding;
        bh=u/AH9wrTDXjufS8cGkvVASvLa0xf/37kmJtfJgtModw=;
        b=ScMvXAK5OLuqoQzsFSm0xM5JcUJzB5vQc5SgApQSZNbFIwZn5l0fBuH8bWyKw9B32Q
         A85Er0K6M/FfYXcKxJIJ+C4okmlBMmHHo1wx53K9BO7p10eIgA8iEKThMw8PvHs2YM5q
         xRFiClv27+My1bZINsV1yz6UfxtkXsiP6plcW8p3ftfUKa41FS0qBsLgvLT/lrS3mqWP
         wOcPsd9DzbNnf5pDoq7SwJOMQ8+86hukiTB8qKOKBOpjRAOTqhmv25txhbyA3rBa7l3T
         W95aHlaZRw/itNpDp8C9qRwG645WM01MrF/p/u+x/aGVmkY7jgeRR1IyrPDfxSyzl7z6
         ca6g==
X-Gm-Message-State: AOAM532om7ufNQUXApmgQupFKrwqeW6QhLVxKWA/viZ2Sp6u3FDYATdw
        twFlqfwg9X6m2epjvbw5VQMEFwtnIEUe7wS004E=
X-Google-Smtp-Source: ABdhPJzpqbpjEAV/ZJiuuF/uPFA0DRVQppLYaOaO3rHZVNqSuCpE5CAAwZC64fDo85mzCAe3jHbCUg==
X-Received: by 2002:a05:620a:1192:: with SMTP id b18mr10433114qkk.393.1639611344834;
        Wed, 15 Dec 2021 15:35:44 -0800 (PST)
Received: from kubuntu-laptop.. ([67.8.38.84])
        by smtp.gmail.com with ESMTPSA id y18sm2851290qtx.19.2021.12.15.15.35.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 15 Dec 2021 15:35:44 -0800 (PST)
Sender: Julian Braha <julian.braha@gmail.com>
From:   Julian Braha <julianbraha@gmail.com>
To:     mchehab@kernel.org, gregkh@linuxfoundation.org,
        niklas.soderlund+renesas@ragnatech.se,
        sakari.ailus@linux.intel.com,
        kieran.bingham+renesas@ideasonboard.com
Cc:     linux-media@vger.kernel.org, linux-staging@lists.linux.dev,
        failyildiran@gmail.com
Subject: [PATCH] media: max96712: fix unmet dependency on VIDEO_DEV for VIDEO_V4L2_SUBDEV_API
Date:   Wed, 15 Dec 2021 18:35:43 -0500
Message-Id: <20211215233543.163578-1-julianbraha@gmail.com>
X-Mailer: git-send-email 2.32.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

When VIDEO_MAX96712 is selected,
and VIDEO_DEV is not selected,
Kbuild gives the following warning:

WARNING: unmet direct dependencies detected for VIDEO_V4L2_SUBDEV_API
  Depends on [n]: MEDIA_SUPPORT [=y] && VIDEO_DEV [=n] && MEDIA_CONTROLLER [=y]
  Selected by [y]:
  - VIDEO_MAX96712 [=y] && STAGING [=y] && STAGING_MEDIA [=y] && MEDIA_SUPPORT [=y] && I2C [=y] && OF_GPIO [=y]

This is because VIDEO_MAX96712 selects VIDEO_V4L2_SUBDEV_API,
without selecting or depending on VIDEO_DEV, despite
VIDEO_V4L2_SUBDEV_API depending on VIDEO_DEV.

This unmet dependency bug was detected by Kismet,
a static analysis tool for Kconfig. Please advise
if this is not the appropriate solution.

Signed-off-by: Julian Braha <julianbraha@gmail.com>
---
 drivers/staging/media/max96712/Kconfig | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/staging/media/max96712/Kconfig b/drivers/staging/media/max96712/Kconfig
index 258d47644cbd..117fadf81bd0 100644
--- a/drivers/staging/media/max96712/Kconfig
+++ b/drivers/staging/media/max96712/Kconfig
@@ -3,6 +3,7 @@ config VIDEO_MAX96712
 	tristate "Maxim MAX96712 Quad GMSL2 Deserializer support"
 	depends on I2C
 	depends on OF_GPIO
+	depends on VIDEO_DEV
 	select V4L2_FWNODE
 	select VIDEO_V4L2_SUBDEV_API
 	select MEDIA_CONTROLLER
-- 
2.32.0

