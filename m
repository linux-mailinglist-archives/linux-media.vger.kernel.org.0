Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id F34D744DA0E
	for <lists+linux-media@lfdr.de>; Thu, 11 Nov 2021 17:13:55 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234158AbhKKQQo (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 11 Nov 2021 11:16:44 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52458 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234090AbhKKQQm (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 11 Nov 2021 11:16:42 -0500
Received: from mail-wr1-x431.google.com (mail-wr1-x431.google.com [IPv6:2a00:1450:4864:20::431])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4FB23C061766
        for <linux-media@vger.kernel.org>; Thu, 11 Nov 2021 08:13:53 -0800 (PST)
Received: by mail-wr1-x431.google.com with SMTP id d24so10751763wra.0
        for <linux-media@vger.kernel.org>; Thu, 11 Nov 2021 08:13:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=IyMrNXHfU3PNeHdy/Ty0GQWf3Y3SgjyTb8SHPxxX41A=;
        b=qNuQEfx6Gzo43Cna8oVDUPE4IqCVfb4iS5R6Rx4GalRJQ0Ee80hw8ReT1E2i7NlG64
         LitL1Y4at8ysJ2uvJSB322o/S4ojDOqsiBCPK+S5eMyYrZwo2okzzBDkyKAxOZ1+LZPp
         CZSqiIhuJMXpoNhB1DakRuTlV26qdlmP+fBGC/d1jkaYIGo4M0SsRbrKeCXyxK4bkfAx
         wkHvgTS6l5zHgUGC1rhEarjRJVMsiPKy9ZaPc2TzXV/tvlqoVMxJRz7IYdQfaNhUZKei
         9oP/JYQpcKdHM5n6MHCLKwzffr/4AjCGe3hCSDnjXdCOMMIeQQYa2+vwMiSKCFD0RLDj
         Ex4A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=IyMrNXHfU3PNeHdy/Ty0GQWf3Y3SgjyTb8SHPxxX41A=;
        b=3qEii3dn0lOx8+eTOVSmpZN7uJ4CKYK/dbYewhLNLTnjNcK1wa3q+QX6GbVMef4n3C
         TprgiA1CkFOptiufeEs7mdDbUpxoriq+PkXjXPwDauiGnD5QOZTukc3yMD9w7UDzLEDc
         5Rm2QxU7D1kgBZ2NfXjn0ZhykCBgi8rD6I2AAmKa0gSYUyEzWJItPJ00qHTfB3GK1oT8
         dhv1+IVKwokgUutczYwgk9TG/JSIExVwbJvz5YISvNShgf5kk4fpt0daQ2MEnqTM4y/P
         JmdlTb18jawy5OssIAA4c7UqkICaPef88rdyjR709NZcsEqb3knfeFUdcqsvYL7c888p
         f0uw==
X-Gm-Message-State: AOAM5301wMYCJMYqbmj3FrepWapE7WAPlApYEz1Z7LzHEn0SYmIc1gR6
        /nHS7fMo1MOsCO7oUEFMAluonw==
X-Google-Smtp-Source: ABdhPJzluuBALeR8KI4kou22uMuvPqY4SGyj13igsNZWfKo0qZTOuw/X4dORzX1PD7ttd05txb4H3Q==
X-Received: by 2002:a5d:4b82:: with SMTP id b2mr10186662wrt.419.1636647231964;
        Thu, 11 Nov 2021 08:13:51 -0800 (PST)
Received: from sagittarius-a.chello.ie (188-141-3-169.dynamic.upc.ie. [188.141.3.169])
        by smtp.gmail.com with ESMTPSA id o1sm3441451wrn.63.2021.11.11.08.13.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 11 Nov 2021 08:13:51 -0800 (PST)
From:   Bryan O'Donoghue <bryan.odonoghue@linaro.org>
To:     linux-arm-msm@vger.kernel.org, linux-media@vger.kernel.org,
        robert.foss@linaro.org, jonathan@marek.ca
Cc:     andrey.konovalov@linaro.org, todor.too@gmail.com,
        agross@kernel.org, bjorn.andersson@linaro.org, mchehab@kernel.org,
        jgrahsl@snap.com, hfink@snap.com, bryan.odonoghue@linaro.org
Subject: [RESEND PATCH 07/18] media: camss: csid-170: remove stray comment
Date:   Thu, 11 Nov 2021 16:15:31 +0000
Message-Id: <20211111161542.3936425-8-bryan.odonoghue@linaro.org>
X-Mailer: git-send-email 2.33.0
In-Reply-To: <20211111161542.3936425-1-bryan.odonoghue@linaro.org>
References: <20211111161542.3936425-1-bryan.odonoghue@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

From: Jonathan Marek <jonathan@marek.ca>

This is a leftover from my original patches, it doesn't serve any purpose.
(it was a reminder to figure out how downstream sets a particular field in
the register).

Fixes: eebe6d00e9bf ("media: camss: Add support for CSID hardware version Titan 170")
Signed-off-by: Jonathan Marek <jonathan@marek.ca>
Reviewed-by: Robert Foss <robert.foss@linaro.org>
Tested-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Signed-off-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
---
 drivers/media/platform/qcom/camss/camss-csid-170.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/media/platform/qcom/camss/camss-csid-170.c b/drivers/media/platform/qcom/camss/camss-csid-170.c
index a006c8dbceb1..f0c6a72592f9 100644
--- a/drivers/media/platform/qcom/camss/camss-csid-170.c
+++ b/drivers/media/platform/qcom/camss/camss-csid-170.c
@@ -442,7 +442,7 @@ static void csid_configure_stream(struct csid_device *csid, u8 enable)
 
 	val = 1 << CSI2_RX_CFG1_PACKET_ECC_CORRECTION_EN;
 	val |= 1 << CSI2_RX_CFG1_MISR_EN;
-	writel_relaxed(val, csid->base + CSID_CSI2_RX_CFG1); // csi2_vc_mode_shift_val ?
+	writel_relaxed(val, csid->base + CSID_CSI2_RX_CFG1);
 
 	val = 1 << RDI_CTRL_HALT_CMD;
 	writel_relaxed(val, csid->base + CSID_RDI_CTRL(0));
-- 
2.33.0

