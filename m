Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id EF33533DA93
	for <lists+linux-media@lfdr.de>; Tue, 16 Mar 2021 18:21:14 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238881AbhCPRUi (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 16 Mar 2021 13:20:38 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60680 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S238806AbhCPRUL (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 16 Mar 2021 13:20:11 -0400
Received: from mail-ej1-x62d.google.com (mail-ej1-x62d.google.com [IPv6:2a00:1450:4864:20::62d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 474E6C061756
        for <linux-media@vger.kernel.org>; Tue, 16 Mar 2021 10:20:11 -0700 (PDT)
Received: by mail-ej1-x62d.google.com with SMTP id c10so73400072ejx.9
        for <linux-media@vger.kernel.org>; Tue, 16 Mar 2021 10:20:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=cSV1QKNQjYqrK510Qq0VKMC5Xs02r+/lUWyK45ndNmg=;
        b=EIRbPjVn/nx4YbMFUVcvke42aBxS0e1DiuIxDOz22nIx7Zz1ncyMt4d9fgQLSnP3QQ
         pzgY5VI/Lnl+WZQrYF0yA6ZUr/YQ9nP2lszUtx5Ehgu7HDWHbnsLN9U6MkI/Id0PDA4Q
         5oH4lwj61cW47V1PW229DeMV9mglZhmEDICaM7FbWpJoVlOynpmF5EAWTydxYTPckNgD
         0NOe7n+dSHH/Yi1+RU9U7rVZllo5Yc7hUg/0vzLLziM8dpGo6ZST+fBuajiF7pwcQFqe
         j6GaG0beDE9TJriIFyyPWQNSP65W5lOWXP5yZ5ylNVeGfBXIqslQTH1HtN9gBdTzULop
         1hlA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=cSV1QKNQjYqrK510Qq0VKMC5Xs02r+/lUWyK45ndNmg=;
        b=YHs4oktBwUcG/v0kvFN2tXGcSH4czWilMn17jzVa0erWio7yA/0XT+UaQqnfaQp0rG
         cglJYWwurr20OetF0V3tQmYt5k/0O+YSBT+QRfgl+aBlrRl0TjQbYmG1T1njFGY78wWe
         OoK0jC0AakTSKoLQqwMeWudW02mC3BeYxYpxZQarrc/zzf1QiCTY/XlnjPesWOrxvNqN
         TPorHgmNGe4OvaIb7WNNZUqcpbQF2meYkDnNdJxv63EUN81NBDzruba3u5BgbOQNVrU/
         aj95B2oF7Xxwmst8GO4YhVroZAV0ObENoRtvY5yKFgg0H7Lm2UiJtJlzYHcipEzvTfRE
         WcMg==
X-Gm-Message-State: AOAM532RAtte7Na35i1vWQ0u0mY7GMHez8NAMxUIhiJMuf7L2OKZwC9x
        x8oF9wveS2taE+nyWI1H3b3/sw==
X-Google-Smtp-Source: ABdhPJzEdPps/o6at79IJNVBZNVRihrq3CqNFZ6BL0PEtnfqxr/C7choHU5YGNnfeGct0ZvHXC/VhQ==
X-Received: by 2002:a17:906:5e55:: with SMTP id b21mr14866759eju.289.1615915210080;
        Tue, 16 Mar 2021 10:20:10 -0700 (PDT)
Received: from localhost.localdomain ([37.120.1.234])
        by smtp.gmail.com with ESMTPSA id u1sm10571584edv.90.2021.03.16.10.20.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 16 Mar 2021 10:20:09 -0700 (PDT)
From:   Robert Foss <robert.foss@linaro.org>
To:     robert.foss@linaro.org, todor.too@gmail.com, agross@kernel.org,
        bjorn.andersson@linaro.org, mchehab@kernel.org, robh+dt@kernel.org,
        angelogioacchino.delregno@somainline.org,
        linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
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
Subject: [PATCH v9 03/22] media: camss: Replace trace_printk() with dev_dbg()
Date:   Tue, 16 Mar 2021 18:19:12 +0100
Message-Id: <20210316171931.812748-4-robert.foss@linaro.org>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20210316171931.812748-1-robert.foss@linaro.org>
References: <20210316171931.812748-1-robert.foss@linaro.org>
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

