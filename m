Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 00E42310979
	for <lists+linux-media@lfdr.de>; Fri,  5 Feb 2021 11:50:03 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231739AbhBEKsW (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 5 Feb 2021 05:48:22 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33454 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231220AbhBEKqR (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Fri, 5 Feb 2021 05:46:17 -0500
Received: from mail-wm1-x32c.google.com (mail-wm1-x32c.google.com [IPv6:2a00:1450:4864:20::32c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id EB08DC061221
        for <linux-media@vger.kernel.org>; Fri,  5 Feb 2021 02:44:55 -0800 (PST)
Received: by mail-wm1-x32c.google.com with SMTP id w4so5611938wmi.4
        for <linux-media@vger.kernel.org>; Fri, 05 Feb 2021 02:44:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=YKFr1OaX41tKIse84FOjUPRg1BE34jxdlTucijfIY9A=;
        b=ZepuP1vJJm3kKPUewIRk46pmuLELCyDb+Qh9AsLM6E5TR3XN4ukpfm1PWxj/2NhwJU
         X862Ccf7p9drsc7jDclJofPfFVKW7s5JVT8Up9PFCmmDX088CELK6Uhb4VGOoao9cQCq
         q7ZRgiNYUKbmZ68Y9OYRCDKBZARd5UYWMmA2/y6c+HAYz0isjUfNE1ApANz/8Mvz7Nl6
         LIOO3ivKWpKQnuBCKrMePdV/TMfuNtyULlKJCXIBPJLqHdyI3qUfLQFrFMI5PPJqkCo+
         1991EE67qnEW/ClGxQgfURYK/ATpJW0+Sp2IG8yDGB1wVXyNri281n4QgofowG9Vy4lX
         ZsPw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=YKFr1OaX41tKIse84FOjUPRg1BE34jxdlTucijfIY9A=;
        b=AxseypVhuFuCxBQAyzrXgujC1QXROXCaXhlQs8l+bwe8cTOpBF4TB83b5P7CCLyUrL
         3B5Kcg1Cv9i1+zaRRB4sSx1wC6kLTmcdMV03yslAcXQax6u05IBqe5nNvpVlNkBtb2kH
         QUzdJv8n7bsueXg/nFAhrlkkYd4YEFArM6+JgzZuzRjaWzOQmko4vEO0GZn4LE9NlR8+
         7KnXtVCQsK8Pl3/D6xze1BD5Bvjn056R1748bYWfnHZVIjvHUT+5tpm19y1Y8x73DWA4
         Dj6+vFzNs5/y4zAT7LSYpmpTepuEGx3OnZg8bID9y3Zd6Wdf+WfraypnWgpmq0abmEaE
         ZBPQ==
X-Gm-Message-State: AOAM530EFZ0k8vFrggCxPHc3OwGyS3zZAGXCOw5WC5gmvweyulvRNJAr
        AApnDdD92Q70YLBLO8sThhiPYQ==
X-Google-Smtp-Source: ABdhPJwlCOKamyupKZ2Uo+UtUm6KwnvfAAWbkfOPy8aBH2EzhpfKFerl3ZdGkANan2etSduuZMnawg==
X-Received: by 2002:a1c:6a09:: with SMTP id f9mr3026083wmc.104.1612521894738;
        Fri, 05 Feb 2021 02:44:54 -0800 (PST)
Received: from localhost.localdomain ([2a02:2450:102f:d6a:38fd:e0db:ea01:afc8])
        by smtp.gmail.com with ESMTPSA id u4sm11300233wrr.37.2021.02.05.02.44.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 05 Feb 2021 02:44:54 -0800 (PST)
From:   Robert Foss <robert.foss@linaro.org>
To:     robert.foss@linaro.org, todor.too@gmail.com, agross@kernel.org,
        bjorn.andersson@linaro.org, mchehab@kernel.org, robh+dt@kernel.org,
        angelogioacchino.delregno@somainline.org,
        linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        AngeloGioacchino Del Regno <kholk11@gmail.com>,
        Rob Herring <robh@kernel.org>,
        Sakari Ailus <sakari.ailus@iki.fi>,
        Nicolas Boichat <drinkcat@chromium.org>,
        Andrey Konovalov <andrey.konovalov@linaro.org>
Cc:     Tomasz Figa <tfiga@chromium.org>,
        Azam Sadiq Pasha Kapatrala Syed <akapatra@quicinc.com>,
        Sarvesh Sridutt <Sarvesh.Sridutt@smartwirelesscompute.com>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Jonathan Marek <jonathan@marek.ca>
Subject: [PATCH v4 03/22] media: camss: Replace trace_printk() with dev_dbg()
Date:   Fri,  5 Feb 2021 11:43:55 +0100
Message-Id: <20210205104414.299732-4-robert.foss@linaro.org>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20210205104414.299732-1-robert.foss@linaro.org>
References: <20210205104414.299732-1-robert.foss@linaro.org>
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
---

Changes since v3:
 - Nicolas: Create this patch


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

