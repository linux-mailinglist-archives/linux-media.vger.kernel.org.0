Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 6E28A337BDA
	for <lists+linux-media@lfdr.de>; Thu, 11 Mar 2021 19:11:11 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230436AbhCKSKd (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 11 Mar 2021 13:10:33 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50732 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230152AbhCKSKE (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 11 Mar 2021 13:10:04 -0500
Received: from mail-ej1-x62f.google.com (mail-ej1-x62f.google.com [IPv6:2a00:1450:4864:20::62f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7703EC061760
        for <linux-media@vger.kernel.org>; Thu, 11 Mar 2021 10:10:04 -0800 (PST)
Received: by mail-ej1-x62f.google.com with SMTP id dx17so48193121ejb.2
        for <linux-media@vger.kernel.org>; Thu, 11 Mar 2021 10:10:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=mxyW1onhXDiHAxxUJjBsSs0nMCqFkArlx/FPrMEURJM=;
        b=ffIVGKH+PAc55h8ya/6dZjK1asTfvVkhbxgO3eRZizelpZ3TGUki0MWSGCLa4l/CuS
         Yf82tXquF0O/T024aBvlgDbqYC9igocLnta6PBX4TTgm5EuRvsH39iGAaxPv+bMUCQ8Y
         qqZ7Htbj6gLHNOaNs3V+3xnSt4caDEDhlYTbM5Nl49YPGXvJuGOnPCFhl8GtJ8zn0rE8
         zXBvjIr8fxREcpgxOvR1VUkRiD72Ya5Yf3Xi2ZmmcbRpI5KYGHgLxPe3KMR9nF+/ciAz
         5mPwbuHMFKgWB3IQMSRPoLyUFmDBWentjn1rIHJWM/Jp0ryK38uj7X05US8LLc98zEss
         kzLg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=mxyW1onhXDiHAxxUJjBsSs0nMCqFkArlx/FPrMEURJM=;
        b=lDedzK9PjKcVPv1JAeOnWAbUfc8I8uCKsv7UVjYnQsKNqELQeSRxKRKZfPpMf23Umv
         oZVW/nPrBDtRU7tM7beYvdFkicK4/+DrYixoUf9Q96wk47S3SaCI1IRS918a16OCk7kr
         3frSYRANWZ/2QCkPCffzGndB7KUW6FHti5ip/3lwimVSgm3aG2bDIFHdNVHCmTw0YfpG
         YToB4gP5sAhuyLtUHk1jmgfeBCoUx7AlLGjl1RvD3mg42sqEG0KrWa84tXlTyZBr20/j
         WYr8UKx48FqQIyj5z7w5H4SnChKL8i0Vt06FdLBSPKAi2Ul23F9qQCn3UKfz6/LsVMyy
         dS/A==
X-Gm-Message-State: AOAM530lJT7YadVNqA6syrSRVp+IB5YgRVLDyWU30KnN7aoL5ae4DvmB
        YHISlcuw1kHH0HVIIq8Wrh5kFQ==
X-Google-Smtp-Source: ABdhPJy/dlypMzsYZr3/egrO3Nl4kZwV8QnJ9VJENuT4NRzYuwYvtFLLt76D+07NzxchA3peWq1Cgg==
X-Received: by 2002:a17:906:4117:: with SMTP id j23mr4443860ejk.10.1615486203151;
        Thu, 11 Mar 2021 10:10:03 -0800 (PST)
Received: from localhost.localdomain ([2a02:2454:3e3:5f00:8e01:34c:da50:eb7e])
        by smtp.gmail.com with ESMTPSA id a22sm1741290ejr.89.2021.03.11.10.10.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 11 Mar 2021 10:10:02 -0800 (PST)
From:   Robert Foss <robert.foss@linaro.org>
To:     agross@kernel.org, bjorn.andersson@linaro.org,
        robert.foss@linaro.org, todor.too@gmail.com, mchehab@kernel.org,
        robh+dt@kernel.org, angelogioacchino.delregno@somainline.org,
        linux-arm-msm@vger.kernel.org, linux-media@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        AngeloGioacchino Del Regno <kholk11@gmail.com>,
        Sakari Ailus <sakari.ailus@iki.fi>,
        Andrey Konovalov <andrey.konovalov@linaro.org>,
        Hans Verkuil <hverkuil@xs4all.nl>
Cc:     Rob Herring <robh@kernel.org>, Tomasz Figa <tfiga@chromium.org>,
        Azam Sadiq Pasha Kapatrala Syed <akapatra@quicinc.com>,
        Sarvesh Sridutt <Sarvesh.Sridutt@smartwirelesscompute.com>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Jonathan Marek <jonathan@marek.ca>,
        Nicolas Boichat <drinkcat@chromium.org>
Subject: [PATCH v7 03/22] media: camss: Replace trace_printk() with dev_dbg()
Date:   Thu, 11 Mar 2021 19:09:29 +0100
Message-Id: <20210311180948.268343-4-robert.foss@linaro.org>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20210311180948.268343-1-robert.foss@linaro.org>
References: <20210311180948.268343-1-robert.foss@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

trace_printk() should not be used in production code,
since extra memory is used for special buffers whenever
trace_puts() is used.

Replace it with dev_dbg() which provides all of the desired
debugging functionality.

Signed-off-by: Robert Foss <robert.foss@linaro.org>
Suggested-by: Nicolas Boichat <drinkcat@chromium.org>
Reviewed-by: Nicolas Boichat <drinkcat@chromium.org>
---

Changes since v3:
 - Nicolas: Create this patch

Changes since v4:
 - Nicolas: Add r-b


 drivers/media/platform/qcom/camss/camss-vfe-4-1.c | 5 +++--
 drivers/media/platform/qcom/camss/camss-vfe-4-7.c | 5 +++--
 2 files changed, 6 insertions(+), 4 deletions(-)

diff --git a/drivers/media/platform/qcom/camss/camss-vfe-4-1.c b/drivers/media/platform/qcom/camss/camss-vfe-4-1.c
index a1b56b89130d..85b9bcbc7321 100644
--- a/drivers/media/platform/qcom/camss/camss-vfe-4-1.c
+++ b/drivers/media/platform/qcom/camss/camss-vfe-4-1.c
@@ -12,6 +12,7 @@
 #include <linux/io.h>
 #include <linux/iopoll.h>
 
+#include "camss.h"
 #include "camss-vfe.h"
 
 #define VFE_0_HW_VERSION		0x000
@@ -936,8 +937,8 @@ static irqreturn_t vfe_isr(int irq, void *dev)
 
 	vfe->ops->isr_read(vfe, &value0, &value1);
 
-	trace_printk("VFE: status0 = 0x%08x, status1 = 0x%08x\n",
-		     value0, value1);
+	dev_dbg(vfe->camss->dev, "VFE: status0 = 0x%08x, status1 = 0x%08x\n",
+		value0, value1);
 
 	if (value0 & VFE_0_IRQ_STATUS_0_RESET_ACK)
 		vfe->isr_ops.reset_ack(vfe);
diff --git a/drivers/media/platform/qcom/camss/camss-vfe-4-7.c b/drivers/media/platform/qcom/camss/camss-vfe-4-7.c
index 84c33b8f9fe3..f7e00a2de393 100644
--- a/drivers/media/platform/qcom/camss/camss-vfe-4-7.c
+++ b/drivers/media/platform/qcom/camss/camss-vfe-4-7.c
@@ -12,6 +12,7 @@
 #include <linux/io.h>
 #include <linux/iopoll.h>
 
+#include "camss.h"
 #include "camss-vfe.h"
 
 #define VFE_0_HW_VERSION		0x000
@@ -1069,8 +1070,8 @@ static irqreturn_t vfe_isr(int irq, void *dev)
 
 	vfe->ops->isr_read(vfe, &value0, &value1);
 
-	trace_printk("VFE: status0 = 0x%08x, status1 = 0x%08x\n",
-		     value0, value1);
+	dev_dbg(vfe->camss->dev, "VFE: status0 = 0x%08x, status1 = 0x%08x\n",
+		value0, value1);
 
 	if (value0 & VFE_0_IRQ_STATUS_0_RESET_ACK)
 		vfe->isr_ops.reset_ack(vfe);
-- 
2.27.0

