Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id EA5C735295E
	for <lists+linux-media@lfdr.de>; Fri,  2 Apr 2021 12:05:52 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234867AbhDBKFf (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 2 Apr 2021 06:05:35 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45460 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234506AbhDBKF3 (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Fri, 2 Apr 2021 06:05:29 -0400
Received: from mail-wr1-x42a.google.com (mail-wr1-x42a.google.com [IPv6:2a00:1450:4864:20::42a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5FCA0C0613AA
        for <linux-media@vger.kernel.org>; Fri,  2 Apr 2021 03:05:26 -0700 (PDT)
Received: by mail-wr1-x42a.google.com with SMTP id v11so4296216wro.7
        for <linux-media@vger.kernel.org>; Fri, 02 Apr 2021 03:05:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=8FFDLZB/vHm0pWu0rgOmQ3F7+I8O6+iIXPof9tEB6Pw=;
        b=F83GTV9ORyhd5EWryfWuRGx3v7/9FByVfUDvcXjbSTYuCsqLL0ZAiHw+9Ermx9hGDh
         wPLUTfN1LQtC7XPQ7JrM75svfALU7yudwhGtcg/FKA+Me39aJ3MXDosjBOMuMN6JXhud
         9A7nNpV1+7ouoaTYJr8FhPW38S1a+1XS3e2xsgX7JaOiSo2S+rh6JOTbzbntTCoTWEEK
         /kPyiH56HBFTzUIrPENUvTZEdyjT1XFZ4ZDNAdlrt2QS+SqX6XoWnNa7RAl6hRcIaFQo
         8Aym4rFXzlcohdQfqW5hSRzRgJhOZjs4NIs2zyVCCj+TMPiQD6iYBS2C3WPlq/+KMpVN
         Bk0w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=8FFDLZB/vHm0pWu0rgOmQ3F7+I8O6+iIXPof9tEB6Pw=;
        b=CCPJkOisjMcssTn2DWey7phFE0xml9wgCmp7IP50xzmkTwiIzwoKVwcxEMg9ZW3TOw
         78XOcz+5mzxJUpUEwV1L6VGphfG65MOiJkYgZwK+bbbjnDHK7xby1qhfHc8zLyEkQQvr
         b6yO3bqBwdH08EKXYuHRXX+15LiKbUaoEK4H/kBmkQ4ovJhY9W/8VJyGcJZ+65z/0nfe
         tHA3wrGrH+4n17MT6PvdQXZIwYZdLbgvhutympkVUyA6PJy4X+k8AlJkOHmmgR3dGw6v
         mxzrcdK1dJrn+YrYazvTtcWVjm4x8BdG7h6lFZrOBZO7E5E7bLeFe7pAjj0WmolILRPr
         XROg==
X-Gm-Message-State: AOAM532XbsdOEIaGrkdvJwsbv65VAHB4YQ3CN8zOIstCreOiIgyu+M9k
        ukSjvrC2Cpk7B6zGwmpf7JEn0g==
X-Google-Smtp-Source: ABdhPJwIjJeIKF5imDRak5quEnC0BAQB9Jk94FKTbfBG/qrdYz65XcSHLJgT/ia3AEXzUeqtFykhaA==
X-Received: by 2002:a5d:5256:: with SMTP id k22mr14726134wrc.162.1617357925162;
        Fri, 02 Apr 2021 03:05:25 -0700 (PDT)
Received: from sagittarius-a.chello.ie (188-141-3-169.dynamic.upc.ie. [188.141.3.169])
        by smtp.gmail.com with ESMTPSA id v18sm15466618wrf.41.2021.04.02.03.05.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 02 Apr 2021 03:05:24 -0700 (PDT)
From:   Bryan O'Donoghue <bryan.odonoghue@linaro.org>
To:     stanimir.varbanov@linaro.org, agross@kernel.org,
        bjorn.andersson@linaro.org, mchehab@kernel.org,
        linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org
Cc:     bryan.odonoghue@linaro.org, dikshita@codeaurora.org,
        jonathan@marek.ca, vgarodia@codeaurora.org
Subject: [PATCH v3 08/25] media: venus: core: Add differentiator IS_V6(core)
Date:   Fri,  2 Apr 2021 11:06:31 +0100
Message-Id: <20210402100648.1815854-9-bryan.odonoghue@linaro.org>
X-Mailer: git-send-email 2.30.1
In-Reply-To: <20210402100648.1815854-1-bryan.odonoghue@linaro.org>
References: <20210402100648.1815854-1-bryan.odonoghue@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

This commit adds the macro helper IS_V6() which will be used to
differentiate iris2/v6 silicon from previous versions.

Signed-off-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Acked-by: Stanimir Varbanov <stanimir.varbanov@linaro.org>
---
 drivers/media/platform/qcom/venus/core.h | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/media/platform/qcom/venus/core.h b/drivers/media/platform/qcom/venus/core.h
index 110287279f05..85047806142f 100644
--- a/drivers/media/platform/qcom/venus/core.h
+++ b/drivers/media/platform/qcom/venus/core.h
@@ -420,6 +420,7 @@ struct venus_inst {
 #define IS_V1(core)	((core)->res->hfi_version == HFI_VERSION_1XX)
 #define IS_V3(core)	((core)->res->hfi_version == HFI_VERSION_3XX)
 #define IS_V4(core)	((core)->res->hfi_version == HFI_VERSION_4XX)
+#define IS_V6(core)	((core)->res->hfi_version == HFI_VERSION_6XX)
 
 #define ctrl_to_inst(ctrl)	\
 	container_of((ctrl)->handler, struct venus_inst, ctrl_handler)
-- 
2.30.1

