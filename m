Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 155C232D254
	for <lists+linux-media@lfdr.de>; Thu,  4 Mar 2021 13:09:08 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S239970AbhCDMGo (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 4 Mar 2021 07:06:44 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60014 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S239909AbhCDMGR (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Thu, 4 Mar 2021 07:06:17 -0500
Received: from mail-ej1-x62c.google.com (mail-ej1-x62c.google.com [IPv6:2a00:1450:4864:20::62c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4FE9AC061763
        for <linux-media@vger.kernel.org>; Thu,  4 Mar 2021 04:05:37 -0800 (PST)
Received: by mail-ej1-x62c.google.com with SMTP id c10so22378613ejx.9
        for <linux-media@vger.kernel.org>; Thu, 04 Mar 2021 04:05:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=8e4PPUtgYSubDxzdU/QA0Sb+7wTbzZIX4nY3IAQXL6o=;
        b=b+Ik4tSIdjjXFBDtJHdZpZjpYoZ75tILu50BS8TA13Den5QErSSbkPLXicOXsy6eih
         RoMcqWIqL0nh29j7JabpIXN3ONuYOygfLbW8IqDq4SRoAoB01/s36k6Z9ZQMbf9K7I7N
         J2v5tYtMz0FSFMN+22bmg9tdLkYhWAl6ck+bK5xVMAp/63Z1yUDOqqaiwk3rGXdq99TO
         2cOSY3a3L/W6u+yzsZmANmLSdvrDbLS1YU1DFtInVGgar8Cjb37rgDz0BDgsGcu9hVIj
         pET/3kqH2BlyrxA2bwGIhx18b461pbXrjM9ax3UWR0jkTqPugTYYbPvuTJqrE7TIBPI7
         JHzw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=8e4PPUtgYSubDxzdU/QA0Sb+7wTbzZIX4nY3IAQXL6o=;
        b=CZNpQEIoFFkZZ7AioLi8wCDjzBQWY9Vg6ArgLXwHhsgQ0QeboCiUpyksismCE+Saix
         bpjALX4ZciQrFIdF8yBJP3973e7UzXo9PSawzyXODlBu5ZRgXfcqvWTgPzDw6/hVgjy4
         C01+jgbOJ5OllCXi3Cn8zPyoUMPC3VbU0zxQjkrxtjqtxkvxw1rw43p78n83KyyvPFoA
         8+M/l2Z3D9dhV6s38WOg+9Ucfosm5b0Hv+L+REy5SvageASfkL9zA4SJUbk/H7edft+n
         SIIsEMJW4/0PiahCdz/4lOPC/NzYC7n5/LOl1937JHBXlow0xuANcGPUY6Z4GF6pO/sM
         mJFg==
X-Gm-Message-State: AOAM53272815kIVYs3CBJoSo5rf56dnopnFRFQl/Nf2HiT6BPk2LuC+7
        nrDssKS4qLExLCJlId5u1QdbtA==
X-Google-Smtp-Source: ABdhPJwYU88JLxec/eWcDh7B5kt3uF1xbGBE19bSZWATu6nii5HKVDj85hDwPbHHZ6xw3jC4NFyN7A==
X-Received: by 2002:a17:906:d71:: with SMTP id s17mr3980257ejh.126.1614859536097;
        Thu, 04 Mar 2021 04:05:36 -0800 (PST)
Received: from localhost.localdomain ([2a02:2450:102f:d6a:470a:340b:1b:29dd])
        by smtp.gmail.com with ESMTPSA id cf6sm20464447edb.92.2021.03.04.04.05.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 04 Mar 2021 04:05:35 -0800 (PST)
From:   Robert Foss <robert.foss@linaro.org>
To:     agross@kernel.org, bjorn.andersson@linaro.org,
        robert.foss@linaro.org, todor.too@gmail.com, mchehab@kernel.org,
        robh+dt@kernel.org, angelogioacchino.delregno@somainline.org,
        linux-arm-msm@vger.kernel.org, linux-media@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        AngeloGioacchino Del Regno <kholk11@gmail.com>,
        Sakari Ailus <sakari.ailus@iki.fi>,
        Andrey Konovalov <andrey.konovalov@linaro.org>
Cc:     Rob Herring <robh@kernel.org>, Tomasz Figa <tfiga@chromium.org>,
        Azam Sadiq Pasha Kapatrala Syed <akapatra@quicinc.com>,
        Sarvesh Sridutt <Sarvesh.Sridutt@smartwirelesscompute.com>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Jonathan Marek <jonathan@marek.ca>,
        Nicolas Boichat <drinkcat@chromium.org>
Subject: [PATCH v6 03/22] media: camss: Replace trace_printk() with dev_dbg()
Date:   Thu,  4 Mar 2021 13:03:09 +0100
Message-Id: <20210304120326.153966-4-robert.foss@linaro.org>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20210304120326.153966-1-robert.foss@linaro.org>
References: <20210304120326.153966-1-robert.foss@linaro.org>
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

