Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 1D836356BBB
	for <lists+linux-media@lfdr.de>; Wed,  7 Apr 2021 14:06:05 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1351994AbhDGMGM (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 7 Apr 2021 08:06:12 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44480 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233233AbhDGMGL (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Wed, 7 Apr 2021 08:06:11 -0400
Received: from mail-qt1-x834.google.com (mail-qt1-x834.google.com [IPv6:2607:f8b0:4864:20::834])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E140BC061756
        for <linux-media@vger.kernel.org>; Wed,  7 Apr 2021 05:06:01 -0700 (PDT)
Received: by mail-qt1-x834.google.com with SMTP id u8so13457067qtq.12
        for <linux-media@vger.kernel.org>; Wed, 07 Apr 2021 05:06:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=Y+YARt14fmokAsOvseCZEIRHDfC26a2yk9eKE6iP1dw=;
        b=pRO2bWn8iJcs3cub1vzOqJU9Oy9Z9vOMUkxt4ycqCLvsT2j1iDCYPQ4c6yXZZA8DYX
         hgP8oWbkpjaTPuydhEFJ2Hxhm2QmY7eV2PsXFst/LQqGaecTStpsBHpVdzeFng7m+SRM
         kHOQNjcQmgCbHtKWKJ3rxKsnkx+J9OMl+PKphO8fdBM+yQx7SOzWXZ+mhC+OpaAEZF8z
         Z0P6p3hFwpcjVXM8W1sgd8ne3I+PR4ZxW07w4Fib0vk6BxQgeSNjKBS8bEw5nbkbMNJo
         rLpH3nqL2K7C3CxwKfXwzXthk48A4w40yjDmRBsrMYD9cl7ilR0+YEqJWi7e6FDTQ0ef
         JQlA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=Y+YARt14fmokAsOvseCZEIRHDfC26a2yk9eKE6iP1dw=;
        b=UtlXIEBstBHDLnU/pLur51bc/Fmw85khTxeGmkmErP0iCnQdqJO521h7rFUeBp9Cib
         KV90ApRu4Jfavj8XMVLpW+0V+rXdSkXpdCzQwHylSwKCAhmhN4UOICvcKOAx78pBmms2
         GHSOEJCE7eR3wH76CIGedPdzXkYtPLccVxuIIoLulVL1OxfxgDghZX4ZcGet8M2wT1ih
         hR5cb61qH3ewf0lWLFIlpEfxkF2tEYhOCLR8Xl6kVh/RuXO1xo0s8iEfV2wA6Haw1gIy
         fdzrqzUB50KylnOosvhDUguQz/iHlaF5DuejA/NV9Pn27HhtQ5HoCScOFf9CqMvWZjy8
         0zGQ==
X-Gm-Message-State: AOAM532FlYJQn9GnV61KUOSIlmF5PpSPCZI1dE6o8JSr/V0/Kwb/aDa/
        huACXNnJfXHevw1IbIhpn6U=
X-Google-Smtp-Source: ABdhPJyiRRRuB6Q4KlrFtBD2el/M/ZuEMxYNUrwMP5bADhgLasPonvDAtRmoePWbIOuGvHAC0qzg3g==
X-Received: by 2002:ac8:703:: with SMTP id g3mr2368183qth.167.1617797161121;
        Wed, 07 Apr 2021 05:06:01 -0700 (PDT)
Received: from localhost.localdomain ([2804:14c:482:919:40fe:63:1f2b:cd67])
        by smtp.gmail.com with ESMTPSA id b1sm18667036qkk.117.2021.04.07.05.05.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 07 Apr 2021 05:06:00 -0700 (PDT)
From:   Fabio Estevam <festevam@gmail.com>
To:     stanimir.varbanov@linaro.org
Cc:     bryan.odonoghue@linaro.org, linux-media@vger.kernel.org,
        Fabio Estevam <festevam@gmail.com>,
        kernel test robot <lkp@intel.com>
Subject: [PATCH] media: venus: core: Use NULL for pointers
Date:   Wed,  7 Apr 2021 09:05:51 -0300
Message-Id: <20210407120551.510049-1-festevam@gmail.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

core->wrapper_tz_base and core->aon_base are pointers, so use NULL
instead of 0 to fix the following sparse warning:

>> drivers/media/platform/qcom/venus/core.c:218:33: sparse: sparse: Using plain integer as NULL pointer

Reported-by: kernel test robot <lkp@intel.com>
Signed-off-by: Fabio Estevam <festevam@gmail.com>
---
 drivers/media/platform/qcom/venus/core.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/media/platform/qcom/venus/core.c b/drivers/media/platform/qcom/venus/core.c
index f5b88b96f5f7..4451e3c11bc0 100644
--- a/drivers/media/platform/qcom/venus/core.c
+++ b/drivers/media/platform/qcom/venus/core.c
@@ -224,8 +224,8 @@ static void venus_assign_register_offsets(struct venus_core *core)
 		core->cpu_cs_base = core->base + CPU_CS_BASE;
 		core->cpu_ic_base = core->base + CPU_IC_BASE;
 		core->wrapper_base = core->base + WRAPPER_BASE;
-		core->wrapper_tz_base = 0;
-		core->aon_base = 0;
+		core->wrapper_tz_base = NULL;
+		core->aon_base = NULL;
 	}
 }
 
-- 
2.25.1

