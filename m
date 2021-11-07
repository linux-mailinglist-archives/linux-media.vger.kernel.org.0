Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D6AB6447359
	for <lists+linux-media@lfdr.de>; Sun,  7 Nov 2021 15:41:57 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230092AbhKGOoe (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sun, 7 Nov 2021 09:44:34 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35382 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229520AbhKGOod (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Sun, 7 Nov 2021 09:44:33 -0500
Received: from mail-pl1-x62c.google.com (mail-pl1-x62c.google.com [IPv6:2607:f8b0:4864:20::62c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 261D6C061570;
        Sun,  7 Nov 2021 06:41:51 -0800 (PST)
Received: by mail-pl1-x62c.google.com with SMTP id r5so14154773pls.1;
        Sun, 07 Nov 2021 06:41:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=UrbpIa2R21nt9CsUHSpqQAdzhw13K5VFRKU4lZDfbyE=;
        b=oKZrRbI/SUBOu+OiClukmnFZpxRlDN5huFzwvEf0bjZHQXroydaB+/X+a5nqBSumpa
         QjvWhZcmGRxSPzGPu0Ud/9dC/CsqWtAVzi20+5ll6JN6NXddd7lsiRE+QSY4PjbeECeC
         fTAW6sBa/+2ToFws1NBC/2iNVYmFLQs7aS9+Y3eXcER4QXUqMkGcJfkT2/ndZ3Of6Fdf
         NCkfSZ8vcslGJXvEeg5z8Gzr6EnQTJxleM3PbU8uBf+tPO4xxveSTgj7GBkKfSIgNOkz
         cFkFNYMUSonssfnZ1sgVsNUTXEn5Q+9J/Ddl+CyMRD04yJ+Q2ujrbYIuoElPoP33jqxJ
         NFLw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=UrbpIa2R21nt9CsUHSpqQAdzhw13K5VFRKU4lZDfbyE=;
        b=g8lnzI4dt81tfKRhmJi19jNog1C8jeoH3RegCrcDTMPwenm07zHOe3PU/hL2HHgGBP
         lyLv9cBRa1UtyymXakl+WQ1f/XtzoLP2xq0HqPfyTabZwRrIP1UiE1som0pRSSxlJhtW
         MEgCUvrDsFmoNeGfyfg/UvDoBIiU2QrIW+pG5tA53WUZD0jLBP4dzYqQ5ruQE5vOPx09
         15yWMl9Mrzod230cSpVAbNGYKauwSKNyDP3SBLPAuhe5mCYzgSu585LJlA+pDJJx3ueI
         XIwrlEyCtsCnbkS3RnlDLq49jIaZD8QSkpunOpaLtQGzyh+/J/wkjCQGWtaklGIvTCfg
         4lTQ==
X-Gm-Message-State: AOAM530YdRV2RNXCJ6R+VSxy+9SXOTzH8weL+RiYaDDlx83mTg9gp7ma
        3q73y0uSaAjWD25glIdNoJokfu2W6hiKd/LR
X-Google-Smtp-Source: ABdhPJwABYLHqc1afqQP1rkSVQdMHlYkszHG+qtGeTZkZ5Q0jtHqy+7ZaUghWKrcUz5kv9MEl+UQEQ==
X-Received: by 2002:a17:903:2445:b0:142:830:ea8e with SMTP id l5-20020a170903244500b001420830ea8emr37491574pls.54.1636296110594;
        Sun, 07 Nov 2021 06:41:50 -0800 (PST)
Received: from localhost.localdomain ([37.120.154.98])
        by smtp.gmail.com with ESMTPSA id c6sm12669781pfd.114.2021.11.07.06.41.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 07 Nov 2021 06:41:50 -0800 (PST)
From:   Dillon Min <dillon.minfei@gmail.com>
To:     mchehab@kernel.org, hverkuil-cisco@xs4all.nl
Cc:     alexandre.torgue@foss.st.com, mcoquelin.stm32@gmail.com,
        linux-media@vger.kernel.org,
        linux-stm32@st-md-mailman.stormreply.com,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        kernel test robot <lkp@intel.com>
Subject: [PATCH] media: stm32-dma2d: fix compile errors when W=1
Date:   Sun,  7 Nov 2021 22:41:44 +0800
Message-Id: <20211107144144.482969-1-dillon.minfei@gmail.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

remove unused functions to avoid compile errors when W=1.

>> drivers/media/platform/stm32/dma2d/dma2d-hw.c:29:20:
	error: unused function 'reg_set' [-Werror,-Wunused-function]
	static inline void reg_set(void __iomem *base, u32 reg, u32 mask)

>> drivers/media/platform/stm32/dma2d/dma2d-hw.c:34:20:
	error: unused function 'reg_clear' [-Werror,-Wunused-function]
	static inline void reg_clear(void __iomem *base, u32 reg, u32 mask)

Fixes: bdbbd511ef0c ("media: stm32-dma2d: STM32 DMA2D driver")
Reported-by: kernel test robot <lkp@intel.com>
Signed-off-by: Dillon Min <dillon.minfei@gmail.com>
---
 drivers/media/platform/stm32/dma2d/dma2d-hw.c | 10 ----------
 1 file changed, 10 deletions(-)

diff --git a/drivers/media/platform/stm32/dma2d/dma2d-hw.c b/drivers/media/platform/stm32/dma2d/dma2d-hw.c
index 8c1c664ab13b..ea4cc84d8a39 100644
--- a/drivers/media/platform/stm32/dma2d/dma2d-hw.c
+++ b/drivers/media/platform/stm32/dma2d/dma2d-hw.c
@@ -26,16 +26,6 @@ static inline void reg_write(void __iomem *base, u32 reg, u32 val)
 	writel_relaxed(val, base + reg);
 }
 
-static inline void reg_set(void __iomem *base, u32 reg, u32 mask)
-{
-	reg_write(base, reg, reg_read(base, reg) | mask);
-}
-
-static inline void reg_clear(void __iomem *base, u32 reg, u32 mask)
-{
-	reg_write(base, reg, reg_read(base, reg) & ~mask);
-}
-
 static inline void reg_update_bits(void __iomem *base, u32 reg, u32 mask,
 				   u32 val)
 {
-- 
2.25.1

