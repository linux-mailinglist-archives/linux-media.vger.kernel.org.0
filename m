Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id EFB1631D82D
	for <lists+linux-media@lfdr.de>; Wed, 17 Feb 2021 12:26:13 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230328AbhBQLZH (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 17 Feb 2021 06:25:07 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36818 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231772AbhBQLX3 (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 17 Feb 2021 06:23:29 -0500
Received: from mail-ed1-x534.google.com (mail-ed1-x534.google.com [IPv6:2a00:1450:4864:20::534])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9F009C0617AA
        for <linux-media@vger.kernel.org>; Wed, 17 Feb 2021 03:22:01 -0800 (PST)
Received: by mail-ed1-x534.google.com with SMTP id c6so16001572ede.0
        for <linux-media@vger.kernel.org>; Wed, 17 Feb 2021 03:22:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=nrHbWWbk2rn4IgAeIJ5AADSHdSvYjEee+qi1skngB4w=;
        b=wi3Vn+F/Dy9291Ae5vqGlad1VjtNnqArapfUeVTKnZonu3StWp+o5fkfgyyKIpl8a2
         G3QyFAjEVWT+iGFno5mOQwwWHnGvAwbkknvHN2xRLvLuSzAR4PF2CLRffaVihW1jlkM+
         bj1oU/KdXxngIuNf0dWdoYvG3B7MrgZCh8mBLabiNEVReNJvHyl0JgIJGwnj+tJuz4qN
         hqJ8mgIwunqKE5ahQ31kSOhCgwlMPBFdQqOJ6JqjzjUn6C631MLb8h2MP0CxBriIG+by
         esaYgqHRQrlZwg5Bg5tUh5MC4C/A3BHzhPvnb0yI72ozjPJppORXE98+AE3n8RTfChYR
         V8ag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=nrHbWWbk2rn4IgAeIJ5AADSHdSvYjEee+qi1skngB4w=;
        b=WzYYXJMcJQtv/bXs7Y+C3tuuzzyJBvF6cILA8JJqEToRzzjyQEIXVvR/Esz5Z24NPg
         Mdpfc67wSfHiyD/TUpPkUOe7064zkaL3Kb/woKFlR/DvmBqcWxhnHiCpadomBexjonaB
         3bacDPOeX8fCtvZeHPRQYGnhVZUwF90kJ3Bh+liPy6SWcudaLLu8nMa6FdogLWPSk0hw
         pGEIsUKx9AmjuM3S0n0SW3jTGkDGy0s7Y/Rd/YlyEyVuP6uuDnTgckAjkr8bmSs3hcON
         t18CSIhK6YzZ2d4Ueo2KjtU/p6mmVvNuCu/Lxqo5fhSW7G6PpA47Wao30GKxfxJHm0Q5
         1oTQ==
X-Gm-Message-State: AOAM532etbX9b3tU9jDxIUaHnrRmk36vEPrwD6flJOk40olqGtOQTXmY
        NO+cVr9jIP88JkHF0Onz2BYM2Q==
X-Google-Smtp-Source: ABdhPJzhdttO5wMrvTWdZ7JsrvGMzIM1OSMmoxQijsQM3/rkYH62jhNow+MectoAHczZAkRiscBa0Q==
X-Received: by 2002:a50:ee10:: with SMTP id g16mr25760918eds.62.1613560920427;
        Wed, 17 Feb 2021 03:22:00 -0800 (PST)
Received: from localhost.localdomain ([2a02:2450:102f:d6a:4815:d4dc:ff5a:704a])
        by smtp.gmail.com with ESMTPSA id h10sm934344edk.45.2021.02.17.03.21.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 17 Feb 2021 03:22:00 -0800 (PST)
From:   Robert Foss <robert.foss@linaro.org>
To:     agross@kernel.org, bjorn.andersson@linaro.org,
        robert.foss@linaro.org, todor.too@gmail.com, mchehab@kernel.org,
        robh+dt@kernel.org, angelogioacchino.delregno@somainline.org,
        linux-arm-msm@vger.kernel.org, linux-media@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        AngeloGioacchino Del Regno <kholk11@gmail.com>,
        Sakari Ailus <sakari.ailus@iki.fi>,
        Nicolas Boichat <drinkcat@chromium.org>,
        Andrey Konovalov <andrey.konovalov@linaro.org>
Cc:     Rob Herring <robh@kernel.org>, Tomasz Figa <tfiga@chromium.org>,
        Azam Sadiq Pasha Kapatrala Syed <akapatra@quicinc.com>,
        Sarvesh Sridutt <Sarvesh.Sridutt@smartwirelesscompute.com>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Jonathan Marek <jonathan@marek.ca>
Subject: [PATCH v5 03/22] media: camss: Replace trace_printk() with dev_dbg()
Date:   Wed, 17 Feb 2021 12:21:03 +0100
Message-Id: <20210217112122.424236-4-robert.foss@linaro.org>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20210217112122.424236-1-robert.foss@linaro.org>
References: <20210217112122.424236-1-robert.foss@linaro.org>
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
 - Nicolas: Added r-b


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

