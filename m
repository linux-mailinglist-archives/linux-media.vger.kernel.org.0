Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 586B743DB4F
	for <lists+linux-media@lfdr.de>; Thu, 28 Oct 2021 08:40:31 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229791AbhJ1Gmx (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 28 Oct 2021 02:42:53 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36938 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229586AbhJ1Gmv (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 28 Oct 2021 02:42:51 -0400
Received: from mail-pf1-x435.google.com (mail-pf1-x435.google.com [IPv6:2607:f8b0:4864:20::435])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6B8A7C061570;
        Wed, 27 Oct 2021 23:40:25 -0700 (PDT)
Received: by mail-pf1-x435.google.com with SMTP id b1so1523611pfm.6;
        Wed, 27 Oct 2021 23:40:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=TPysl08iPk8HUR2rAwTxqTaZwzgk21PETj/BHWf2oVE=;
        b=Y0oeto+FlB1nikNoDdE9Q9ujUmDPTlVzCCjEU7X+kKZDsezagtdybLve3ccHStFFwC
         w8Z86qgmvKZv97VzPYZgs9pMdZhrcZW71DNae8hOziJAoD4W9+MHK0M0ZwiqMaN+YQ/b
         WtODAyxcReLxWbn4JcNE/jBPU1R6igySyvAjDE5YpZ/4/KHPf+jWHo2sG4dTqqiqQKta
         a/B/JLh0SnkVe2XoQ/iFD7BSlmYMmHBhKJhSwWO5Od5HqlsaatGiEb4/0C2ENj4gjdLe
         V78AoeUk9ZiFZ6iNEnKvE78nsm9XQGeRGTqsN38Qj3aBvO0ovGvWZNKgYWuUqh21RoiT
         l1GQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=TPysl08iPk8HUR2rAwTxqTaZwzgk21PETj/BHWf2oVE=;
        b=Rn1q9MccqCL9iIucrIhuDIcdcvnNfXEMtmh6hqpoUACukLbTurF7RGMXusXAqlVWFw
         MVqZWmL912lZDyRlC+WtYgaPs4hS7+Et7XrMZsVUKgOUhIl82zkhvo5UUKEiXzVvTzKS
         6zR612h2YqKbRVcq9qwPnjxY62lLxLO1HZQV1itw8C4LjowJqXuzf3CjjKmm9IpFCp7o
         lppv2k6LqRWmJaNxc6iElKQ7yjfGIfqhofD2KoPZkBhoja1kuI3JHTcWiQGfO0nDylUG
         xtp/B09lIZHmTrPdU3qI1dYcsyo8ag/iRa2a4cs1Id0dAjRC8PlUsiurHMUUNB/y0aXl
         zgww==
X-Gm-Message-State: AOAM533jQT4tY7yGInjJM8SlQ/wcu4kzQoyhV7Upnflm6lu8m6Zsf1yx
        wtlt5OMEtNjFi0BeOnj6zcI=
X-Google-Smtp-Source: ABdhPJzsMNCkHdzwiHJhYQUu4MHHxENVNh5cKtewR5lEoCcRnD2gIJ//6iLIdBrMUNnBjHlfiBpYww==
X-Received: by 2002:a62:5ec2:0:b0:44d:47e2:4b3b with SMTP id s185-20020a625ec2000000b0044d47e24b3bmr2449024pfb.38.1635403225012;
        Wed, 27 Oct 2021 23:40:25 -0700 (PDT)
Received: from fmin-TravelMate-B115-M.nreal.work ([137.59.103.165])
        by smtp.gmail.com with ESMTPSA id l17sm2222289pfc.94.2021.10.27.23.40.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 27 Oct 2021 23:40:24 -0700 (PDT)
From:   Dillon Min <dillon.minfei@gmail.com>
To:     mchehab@kernel.org, hverkuil-cisco@xs4all.nl
Cc:     acourbot@chromium.org, arnd@arndb.de, stanimir.varbanov@linaro.org,
        linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
        kernel test robot <lkp@intel.com>
Subject: [linux-next][PATCH] media: stm32-dma2d: fix compile-testing failed
Date:   Thu, 28 Oct 2021 14:40:20 +0800
Message-Id: <20211028064020.681499-1-dillon.minfei@gmail.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

get compile-test failed report from lkp@intel.com after the driver
submitted.

"ld.lld: error: undefined symbol: v4l2_fh_init"

so, make CONFIG_STM32_DMA2D depends on CONFIG_VIDEO_DEV and
CONFIG_VIDEO_V4L2 to fix this compile error.

Fixes: bdbbd511ef0c ("media: stm32-dma2d: STM32 DMA2D driver")
Reported-by: kernel test robot <lkp@intel.com>
Signed-off-by: Dillon Min <dillon.minfei@gmail.com>
---
Hi Hans

I found the dma2d driver was merged to linux-next.
so submit this patch based on linux-next/master, to fix the compile test error.

hope it's not too late for 5.16.

Thanks & Best Regards
Dillon

 drivers/media/platform/Kconfig | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/media/platform/Kconfig b/drivers/media/platform/Kconfig
index 68f16aef8754..9fbdba0fd1e7 100644
--- a/drivers/media/platform/Kconfig
+++ b/drivers/media/platform/Kconfig
@@ -494,7 +494,8 @@ endif # VIDEO_STI_DELTA
 
 config VIDEO_STM32_DMA2D
 	tristate "STM32 Chrom-Art Accelerator (DMA2D)"
-	depends on (VIDEO_DEV && VIDEO_V4L2 && ARCH_STM32) || COMPILE_TEST
+	depends on VIDEO_DEV && VIDEO_V4L2
+	depends on ARCH_STM32 || COMPILE_TEST
 	select VIDEOBUF2_DMA_CONTIG
 	select V4L2_MEM2MEM_DEV
 	help
-- 
2.25.1

