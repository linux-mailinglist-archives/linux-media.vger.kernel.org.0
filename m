Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 44828340EFC
	for <lists+linux-media@lfdr.de>; Thu, 18 Mar 2021 21:23:08 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231714AbhCRUWf (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 18 Mar 2021 16:22:35 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47168 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229958AbhCRUW1 (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 18 Mar 2021 16:22:27 -0400
Received: from mail-ed1-x534.google.com (mail-ed1-x534.google.com [IPv6:2a00:1450:4864:20::534])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 17455C06174A
        for <linux-media@vger.kernel.org>; Thu, 18 Mar 2021 13:22:27 -0700 (PDT)
Received: by mail-ed1-x534.google.com with SMTP id l18so53608edc.9
        for <linux-media@vger.kernel.org>; Thu, 18 Mar 2021 13:22:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=7uwOg1mQehd8syJ8ME8ZSJU0IvR4LW2SYhVYJj2Fhdo=;
        b=lIk6Olmx3t+mVkP6jOI0haIsWbY/jZ7rq2PSrpK699hZaRDlxcyz9dAJvuyfOFsJ+O
         kdIyGFFeJA0PRyprsDF7WRtCXzNIqvLjrzypPhRqd4xWqVAOgXwEPIC7dssCD+NaFGG+
         2ENnVPe/ZfiKdiQtARz0elXT/GLJYbClb3wu4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=7uwOg1mQehd8syJ8ME8ZSJU0IvR4LW2SYhVYJj2Fhdo=;
        b=kZaSP4/xPRxxDoagL3j5KdDOHkDnpxvxkpewGxGydVHIVKdbButxI7FM14CLT34ftx
         Zc0Btw80xSpuJKY6BMQ9iAvpbrSam+DVMJzuy3JXplDPiIG7bgBi8z4V3KNMCjyzcitE
         uwFYGKaQ/i4Uu8uOHAoTKaKFOQaAqJPZ3I/zgQhY4pN3sCBwnTq2iikzV3FjsMo5mvf1
         NKb+XKd83ZYk1EWqnPj2sna21zuj0aIHRWoQlFLoxZqFKGk7B+/kJd8RYfQoyhJJern/
         axpdi53/uegaI07HDbZXZwRxkNzKa6b4zirRh8RThLyQtGjBj9dITof9F/5w14WGDvm7
         w7kQ==
X-Gm-Message-State: AOAM532Aynbz3pL3LexfoW9vd63mb5o/LqRzI7/HgBgeCtANDssh3sD6
        un+hykuCyH76Y/FHlNrWDiJJHA==
X-Google-Smtp-Source: ABdhPJyLMGaeXAtuWJUjCCl/7/HsAh0IYcm0EAkC+rWHMt+j1sCFW45WM2/+tNu4wDp2TbMBZV8xtw==
X-Received: by 2002:aa7:cd63:: with SMTP id ca3mr5872545edb.265.1616098945849;
        Thu, 18 Mar 2021 13:22:25 -0700 (PDT)
Received: from alco.lan ([80.71.134.83])
        by smtp.gmail.com with ESMTPSA id e16sm2481120ejc.63.2021.03.18.13.22.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 18 Mar 2021 13:22:25 -0700 (PDT)
From:   Ricardo Ribalda <ribalda@chromium.org>
To:     trivial@kernel.org
Cc:     Ricardo Ribalda <ribalda@chromium.org>, linux-media@vger.kernel.org
Subject: [PATCH 2/9] media: atomisp: Fix typo "accesible"
Date:   Thu, 18 Mar 2021 21:22:16 +0100
Message-Id: <20210318202223.164873-2-ribalda@chromium.org>
X-Mailer: git-send-email 2.31.0.rc2.261.g7f71774620-goog
In-Reply-To: <20210318202223.164873-1-ribalda@chromium.org>
References: <20210318202223.164873-1-ribalda@chromium.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Trivial fix.

Cc: linux-media@vger.kernel.org
Signed-off-by: Ricardo Ribalda <ribalda@chromium.org>
---
 drivers/staging/media/atomisp/pci/input_system_ctrl_defs.h | 2 +-
 drivers/staging/media/atomisp/pci/isp_acquisition_defs.h   | 2 +-
 drivers/staging/media/atomisp/pci/isp_capture_defs.h       | 2 +-
 3 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/staging/media/atomisp/pci/input_system_ctrl_defs.h b/drivers/staging/media/atomisp/pci/input_system_ctrl_defs.h
index c801ddd71192..b2076a96987c 100644
--- a/drivers/staging/media/atomisp/pci/input_system_ctrl_defs.h
+++ b/drivers/staging/media/atomisp/pci/input_system_ctrl_defs.h
@@ -27,7 +27,7 @@
 // Number of registers
 #define ISYS_CTRL_NOF_REGS                              23
 
-// Register id's of MMIO slave accesible registers
+// Register id's of MMIO slave accessible registers
 #define ISYS_CTRL_CAPT_START_ADDR_A_REG_ID              0
 #define ISYS_CTRL_CAPT_START_ADDR_B_REG_ID              1
 #define ISYS_CTRL_CAPT_START_ADDR_C_REG_ID              2
diff --git a/drivers/staging/media/atomisp/pci/isp_acquisition_defs.h b/drivers/staging/media/atomisp/pci/isp_acquisition_defs.h
index 8e4bddc3790d..7e8f6f2178aa 100644
--- a/drivers/staging/media/atomisp/pci/isp_acquisition_defs.h
+++ b/drivers/staging/media/atomisp/pci/isp_acquisition_defs.h
@@ -35,7 +35,7 @@
 
 #define NOF_ACQ_REGS                              12
 
-// Register id's of MMIO slave accesible registers
+// Register id's of MMIO slave accessible registers
 #define ACQ_START_ADDR_REG_ID                     0
 #define ACQ_MEM_REGION_SIZE_REG_ID                1
 #define ACQ_NUM_MEM_REGIONS_REG_ID                2
diff --git a/drivers/staging/media/atomisp/pci/isp_capture_defs.h b/drivers/staging/media/atomisp/pci/isp_capture_defs.h
index 14cbb6390d3e..b9e5ed932702 100644
--- a/drivers/staging/media/atomisp/pci/isp_capture_defs.h
+++ b/drivers/staging/media/atomisp/pci/isp_capture_defs.h
@@ -33,7 +33,7 @@
 // Number of registers
 #define CAPT_NOF_REGS                             16
 
-// Register id's of MMIO slave accesible registers
+// Register id's of MMIO slave accessible registers
 #define CAPT_START_MODE_REG_ID                    0
 #define CAPT_START_ADDR_REG_ID                    1
 #define CAPT_MEM_REGION_SIZE_REG_ID               2
-- 
2.31.0.rc2.261.g7f71774620-goog

