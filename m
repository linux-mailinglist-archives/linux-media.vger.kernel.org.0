Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 4A5F04C3A1D
	for <lists+linux-media@lfdr.de>; Fri, 25 Feb 2022 01:08:22 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233433AbiBYAIv (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 24 Feb 2022 19:08:51 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33812 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229479AbiBYAIt (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 24 Feb 2022 19:08:49 -0500
Received: from mail-wm1-x32d.google.com (mail-wm1-x32d.google.com [IPv6:2a00:1450:4864:20::32d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 01388145AF1
        for <linux-media@vger.kernel.org>; Thu, 24 Feb 2022 16:08:18 -0800 (PST)
Received: by mail-wm1-x32d.google.com with SMTP id l1-20020a7bcf01000000b0037f881182a8so752717wmg.2
        for <linux-media@vger.kernel.org>; Thu, 24 Feb 2022 16:08:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=fxrx0mJQXblDfZAAktrJE72+pDq/+qz7U44eWbjfq4o=;
        b=QxmVA6DtuSd5U5qmRxW+W6i3lQ0GuwoaZlQs6EmqL5ULDd1e0V9krowuljwdKEafgZ
         jH9OEpIihKZlOHPVBfOsKT7bnvnL7tFVFxTpqa3hIT4wOo6fDLpfBB1Z9C7rG3QC0DuZ
         aYrWfRXmj9oN3HXcr2WbjpK/rwS1hBe811DYGGQ4Y4o7aciN86D4pk779QqvHZ9wEDMg
         amuaMJNJZHAMc1k/m7cahubGytZYfY+pT/gwuEdCIC/6CcS5FeXKf+3Is9tClrRSkGhU
         o6uuvbDPnxCLkbVc3G9X7XXy/JaJ475OfLhAp32YMRRoV/v8ryIs10jPfLgqPJ7p7POa
         pRYg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=fxrx0mJQXblDfZAAktrJE72+pDq/+qz7U44eWbjfq4o=;
        b=eAIaSMf/fA5Fk7qPZCRBomjfJgdCsd9PGgCTpJADC2v54DI1wkXlRCScmq+VjwTOw4
         mE8FMumB7K4b6o2NyBPD5RuDyLHqDWeI2PcLdjd23oKLMQUyhTbNvOMUUEL6F6b+S8fM
         oPcY9ieNvERohIl4AH2IavRtKdyxKQZ6l+Q11AzORwlUyK1G0354HR2tAL9foYp8YeXD
         Q5FrnFrSe/gwh979PJa1TPjPaf4h+NJh0AKE/KH24kLJRzcFL9tYXUGiIEnx8gTRddIj
         RM7lD4IVck6HQaIjthKdWyveOGaDXPPhVRwnEfHaffXX3RcNt7WVSVWPOA7Ltdezl5aR
         gkMQ==
X-Gm-Message-State: AOAM530QYC3y/Q0dWVbmGbgVr7sbFAMts2QGn1eAnowXuqujXFMUnzDG
        aaLUOO7pzC9hygVI6+MiDgGerg/R9LMZAA==
X-Google-Smtp-Source: ABdhPJxB3XyPSWP66ouyKwKdWpaXjbRZmEtQo/SZ5goXy5bgFCYMkD+ePBxNfJgAbRokKwkQxugMTg==
X-Received: by 2002:a1c:f413:0:b0:37b:d1de:5762 with SMTP id z19-20020a1cf413000000b0037bd1de5762mr401701wma.108.1645747696643;
        Thu, 24 Feb 2022 16:08:16 -0800 (PST)
Received: from localhost.localdomain (cpc141996-chfd3-2-0-cust928.12-3.cable.virginm.net. [86.13.91.161])
        by smtp.gmail.com with ESMTPSA id a3-20020adfe5c3000000b001e68a5e1c20sm742668wrn.4.2022.02.24.16.08.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 24 Feb 2022 16:08:16 -0800 (PST)
From:   Daniel Scally <djrscally@gmail.com>
To:     linux-media@vger.kernel.org
Cc:     yong.zhi@intel.com, sakari.ailus@linux.intel.com,
        bingbu.cao@intel.com, tian.shu.qiu@intel.com,
        andriy.shevchenko@linux.intel.com, hverkuil-cisco@xs4all.nl
Subject: [PATCH v2 02/11] media: ipu3-cio2: Add support for V4L2_PIX_FMT_IPU3_Y10
Date:   Fri, 25 Feb 2022 00:07:44 +0000
Message-Id: <20220225000753.511996-3-djrscally@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220225000753.511996-1-djrscally@gmail.com>
References: <20220225000753.511996-1-djrscally@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,
        RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

We have platforms where a camera sensor transmits Y10 data to
the CIO2 device - add support for that (packed) format to the
ipu3-cio2 driver.

Signed-off-by: Daniel Scally <djrscally@gmail.com>
---
Changes in v2:

	- None

 drivers/media/pci/intel/ipu3/ipu3-cio2-main.c | 7 ++++++-
 1 file changed, 6 insertions(+), 1 deletion(-)

diff --git a/drivers/media/pci/intel/ipu3/ipu3-cio2-main.c b/drivers/media/pci/intel/ipu3/ipu3-cio2-main.c
index 0e9b0503b62a..ea2f9f70a64e 100644
--- a/drivers/media/pci/intel/ipu3/ipu3-cio2-main.c
+++ b/drivers/media/pci/intel/ipu3/ipu3-cio2-main.c
@@ -65,7 +65,12 @@ static const struct ipu3_cio2_fmt formats[] = {
 		.fourcc		= V4L2_PIX_FMT_IPU3_SRGGB10,
 		.mipicode	= 0x2b,
 		.bpp		= 10,
-	},
+	}, {
+		.mbus_code	= MEDIA_BUS_FMT_Y10_1X10,
+		.fourcc		= V4L2_PIX_FMT_IPU3_Y10,
+		.mipicode	= 0x2b,
+		.bpp		= 10,
+	}
 };
 
 /*
-- 
2.25.1

