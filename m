Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id DB7D033C0C4
	for <lists+linux-media@lfdr.de>; Mon, 15 Mar 2021 17:01:14 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232168AbhCOQAk (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 15 Mar 2021 12:00:40 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42704 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231741AbhCOQA1 (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 15 Mar 2021 12:00:27 -0400
Received: from mail-lf1-x130.google.com (mail-lf1-x130.google.com [IPv6:2a00:1450:4864:20::130])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 600C3C061764
        for <linux-media@vger.kernel.org>; Mon, 15 Mar 2021 09:00:27 -0700 (PDT)
Received: by mail-lf1-x130.google.com with SMTP id t18so9895570lfl.3
        for <linux-media@vger.kernel.org>; Mon, 15 Mar 2021 09:00:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=ej7xOSZO0R65foWhNJ0JMxxsG9s/H1fy7cCdiAqZQjQ=;
        b=iWKapvP5snj2BIegwBWCgs7oi835uqSMcSh0tRpH9TF8ZFMi/OB/adnXNyeaJasmCZ
         G9zjQBLzL0HyrhTV/dzhVTlowodLzArFqYiU2ManJyMeZ+/wVBv905JlQANb76YL3ebi
         bSm7fCeuBdeXNG9lZjdbjLAuNx0qK3YVvgwBqDUVKJrpY2YL3Xi4vEdWIvCuUT7AC72D
         IZO6YWANVll46/Jv9bZgO/asi+bZQFykufGLi/IwJiI9ClxeFzzkKoD7WlcQGEgHIJG9
         hTINplvsNVKyBqTLnHmUq8qq8fQjZBWXqh/ZilbBjunXfpTXIvJYINcrqFXGcXjY7xwL
         6xRw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=ej7xOSZO0R65foWhNJ0JMxxsG9s/H1fy7cCdiAqZQjQ=;
        b=feU6kCNXE3pthXRkVMan7tL3KHHHGFipaVkQc5ADqFvlJFrUE+NOxrsKzGEm7NAX88
         o1ev5p3cQS705vh2SQMdimbAj/53IzTLrzivgmewZlmaQKigo/MlbNJ29ZQd5ukcx5e9
         eZEHS02tC/ZEnUFXfN0b9dfB9Uc8ze8yG2DnX4eAfUMrLi9Mvy3ZES3bb4V6/W9Slt9q
         XHwHdU2wmq5gHmfPoFGWAHIzWlenYZmi9f5V5bxdBJzp/6UZXacN8TiMPk+EgvbEpxLc
         yMjW0hDrM7npwq9a/BOFNExWGz2cn5vuNwaVL++rJYCbJ5+QtwUCcINdFVQrpHdtNgCP
         5DSw==
X-Gm-Message-State: AOAM533oqM1FqbAU07MUnlMnk1DHJkLnN4LldEsWP8KlC1PNRFZtuUB+
        Uato4Sd3s2UONcOeXEoPRsp4XsE90LVW+c4h
X-Google-Smtp-Source: ABdhPJzIFd4GdXjImyS5V/ylrcnu5ig9YRXguDEslHtI5BsU0aEPUqsWb8v2XHw4ceGD+okMXubhPg==
X-Received: by 2002:aa7:c907:: with SMTP id b7mr31371404edt.37.1615824015097;
        Mon, 15 Mar 2021 09:00:15 -0700 (PDT)
Received: from localhost.localdomain ([37.120.1.234])
        by smtp.gmail.com with ESMTPSA id r5sm8456445eds.49.2021.03.15.09.00.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 15 Mar 2021 09:00:14 -0700 (PDT)
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
Subject: [PATCH v8 03/22] media: camss: Replace trace_printk() with dev_dbg()
Date:   Mon, 15 Mar 2021 16:59:24 +0100
Message-Id: <20210315155942.640889-4-robert.foss@linaro.org>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20210315155942.640889-1-robert.foss@linaro.org>
References: <20210315155942.640889-1-robert.foss@linaro.org>
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

