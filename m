Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 6E4C832D245
	for <lists+linux-media@lfdr.de>; Thu,  4 Mar 2021 13:09:02 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S239861AbhCDMGK (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 4 Mar 2021 07:06:10 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59876 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S239859AbhCDMFn (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Thu, 4 Mar 2021 07:05:43 -0500
Received: from mail-ed1-x534.google.com (mail-ed1-x534.google.com [IPv6:2a00:1450:4864:20::534])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 406C5C0613DB
        for <linux-media@vger.kernel.org>; Thu,  4 Mar 2021 04:04:57 -0800 (PST)
Received: by mail-ed1-x534.google.com with SMTP id d13so29435300edp.4
        for <linux-media@vger.kernel.org>; Thu, 04 Mar 2021 04:04:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=hzjOsw+gZMqd2RylzSWRrirjORZcFF3uOV1qZMXwFSE=;
        b=cOig0olZK241cTC8s091pSXhHsUUF8f4jXtl4THVtokvO1oc/XH46Wg6SPFB1at20y
         cbD+XhKIestTtTqqURzLTSZtW1xhCiuDGSlSPnkr3ABqyQdfHHI778Ex4tDj9M9jJgrv
         5wTXKBSA3D3LR8BKRiqI20tez2LlJCWEwmgQzpOJjJe/fqZX/Cx7dILk2ITMGWZq9svd
         eoUtLcMq5Mtieq1npKlSVQlifbl8mgFEK2U3ojJbVv4gnGlWpkJ+Gm5lM1V+9eZi0A1S
         NLvxTLT1Aeu8GX6O6Zmlssdu0QyGTeDXhw7U8h83OBJWF00is9pdUZbaZfi3VEoNKEPW
         gSAQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=hzjOsw+gZMqd2RylzSWRrirjORZcFF3uOV1qZMXwFSE=;
        b=E/AUVUBnHyVUjkIOx50UrqBYqhqwpnpEFiMCqEhttOOwkO7wdHmiCO4tYEtaqMCk9d
         KxrwBU6FjKqrPGQVE+bvXF3HKHI9vipHjuCMQXjsGmuVyCSYWgq30B8wKZrLPtYdwXrd
         NCsZC406PSHf6IwV9A+wjihVPJhEmNxA1LKXvBU67eudBO2KuV6HZde126q7tbe22jsm
         vqyW+QrsXVlB9G+t1AIeGBXcrwnQtCARAgI7RtD+2jcRjY7Wz57G6UWjomYjX45lFy4e
         YUos4p2zKUNWmESM7TeWR7ydEOorA04z9k6P/5welHKu+SIhCLFFCsF0jTCmCmilW+y4
         RbgA==
X-Gm-Message-State: AOAM5313FNFx7RwOyLdiI90Nhb1Afv8QRylbOUoUauNPbyYq3nJ7wynl
        ryJaNqDwHw+4WDI2C4eHijpnhQ==
X-Google-Smtp-Source: ABdhPJyoJ1K4UTjNQoCPHQNj6xjrxkubbDYxnRDI9zqIBkGIDzULnT3VwWgfqhEQjPHiIo4m/r8h5w==
X-Received: by 2002:a05:6402:2076:: with SMTP id bd22mr3863384edb.378.1614859495997;
        Thu, 04 Mar 2021 04:04:55 -0800 (PST)
Received: from localhost.localdomain ([2a02:2450:102f:d6a:470a:340b:1b:29dd])
        by smtp.gmail.com with ESMTPSA id cf6sm20464447edb.92.2021.03.04.04.04.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 04 Mar 2021 04:04:55 -0800 (PST)
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
        Jonathan Marek <jonathan@marek.ca>
Subject: [PATCH v6 02/22] media: camss: Fix vfe_isr comment typo
Date:   Thu,  4 Mar 2021 13:03:07 +0100
Message-Id: <20210304120326.153966-3-robert.foss@linaro.org>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20210304120326.153966-1-robert.foss@linaro.org>
References: <20210304120326.153966-1-robert.foss@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Comment refers to ISPIF, but this is incorrect. Only
the VFE interrupts are handled by this function.

Signed-off-by: Robert Foss <robert.foss@linaro.org>
Reviewed-by: Bjorn Andersson <bjorn.andersson@linaro.org>
---

Changes since v1
 - Bjorn: Add r-b

 drivers/media/platform/qcom/camss/camss-vfe-4-1.c | 2 +-
 drivers/media/platform/qcom/camss/camss-vfe-4-7.c | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/media/platform/qcom/camss/camss-vfe-4-1.c b/drivers/media/platform/qcom/camss/camss-vfe-4-1.c
index 174a36be6f5d..a1b56b89130d 100644
--- a/drivers/media/platform/qcom/camss/camss-vfe-4-1.c
+++ b/drivers/media/platform/qcom/camss/camss-vfe-4-1.c
@@ -922,7 +922,7 @@ static void vfe_violation_read(struct vfe_device *vfe)
 }
 
 /*
- * vfe_isr - ISPIF module interrupt handler
+ * vfe_isr - VFE module interrupt handler
  * @irq: Interrupt line
  * @dev: VFE device
  *
diff --git a/drivers/media/platform/qcom/camss/camss-vfe-4-7.c b/drivers/media/platform/qcom/camss/camss-vfe-4-7.c
index b5704a2f119b..84c33b8f9fe3 100644
--- a/drivers/media/platform/qcom/camss/camss-vfe-4-7.c
+++ b/drivers/media/platform/qcom/camss/camss-vfe-4-7.c
@@ -1055,7 +1055,7 @@ static void vfe_violation_read(struct vfe_device *vfe)
 }
 
 /*
- * vfe_isr - ISPIF module interrupt handler
+ * vfe_isr - VFE module interrupt handler
  * @irq: Interrupt line
  * @dev: VFE device
  *
-- 
2.27.0

