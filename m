Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 9FFEE352977
	for <lists+linux-media@lfdr.de>; Fri,  2 Apr 2021 12:06:02 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234902AbhDBKFq (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 2 Apr 2021 06:05:46 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45488 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234724AbhDBKFj (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Fri, 2 Apr 2021 06:05:39 -0400
Received: from mail-wr1-x429.google.com (mail-wr1-x429.google.com [IPv6:2a00:1450:4864:20::429])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id AF809C061794
        for <linux-media@vger.kernel.org>; Fri,  2 Apr 2021 03:05:38 -0700 (PDT)
Received: by mail-wr1-x429.google.com with SMTP id c8so4291134wrq.11
        for <linux-media@vger.kernel.org>; Fri, 02 Apr 2021 03:05:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=Z7UGuQOdemv2oMoc8naE5ESdlFA5KVU47RowvDDBw/A=;
        b=RZWnwEPMTOD/SqfAAtj8lLmPKW1RgZzkRNMlIvQVskMyjVR9Pfuba1H64f6O8U8XAV
         TZd1V1WkcMxJ/pB/0iEtxQh0CDK5DCKS46sXB7hNg38Yb614O8KICbgYPg4+wKCJ/1U8
         v/G7PtMBNPh1EpmOcWtTEB/HezTpcN/68HJueRGkNPImoVBxFOiAhXFW+qcF39hZJ/sj
         gbN/zV+bIgUAMebyDjwEFbxZ9jN8933kY4VUVHhlhul15w7ojmfgavQfeh5KqUTV69Nu
         yNFVWzYdxK4LMyqtMcc0q/hJmfraJUh4pSdIxcKCniWCKwG/+Xv7R+7raZuT48132TUa
         CeAg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=Z7UGuQOdemv2oMoc8naE5ESdlFA5KVU47RowvDDBw/A=;
        b=qiJGT78qNlckD6RuePfNVy+E6n4WB3xY7l0VFRaP/dL4wziVuj6DDnMdGFc36YJi1j
         I2qUMVV9huKQdJ4LzY2OuFneaOLPRpJF0e6Z2p5QWLjZOVbk8cDu7dP/TkZNORFM4DBz
         QvH3tcul0LibzdGSHufKIKVttdiHh4J2W5wUUUfntnswJi9+4SQGi8cYHYPfzHGJLpLP
         TyI6DwRNMBJlG8eZ50tP8CaVhSOfCSzY495k/EnMOfHa0YQu36SyXbwNgJbe0QXBfp/2
         mpKNk4Sy30Ymh7vCexyO7J3r66f/W1bhvmyKR7E2Qrvl2kRLbr7WDjcoiW738PxYFU5S
         X8jA==
X-Gm-Message-State: AOAM5323NTOgcBHwiU+XCAj7cLUCcr8wzk42yOOw65K0CivHmLmddXhV
        5WlLIPn7Z/mp86tFu4bDF05P8w==
X-Google-Smtp-Source: ABdhPJzIHTvmDD9e2LzC1lgTzAGkC2mxdXk6HJgTG5efd+S4WGD38D8sVsR05QKEFcQLAFs0PlqYow==
X-Received: by 2002:a05:6000:1acd:: with SMTP id i13mr14378178wry.48.1617357937428;
        Fri, 02 Apr 2021 03:05:37 -0700 (PDT)
Received: from sagittarius-a.chello.ie (188-141-3-169.dynamic.upc.ie. [188.141.3.169])
        by smtp.gmail.com with ESMTPSA id v18sm15466618wrf.41.2021.04.02.03.05.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 02 Apr 2021 03:05:37 -0700 (PDT)
From:   Bryan O'Donoghue <bryan.odonoghue@linaro.org>
To:     stanimir.varbanov@linaro.org, agross@kernel.org,
        bjorn.andersson@linaro.org, mchehab@kernel.org,
        linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org
Cc:     bryan.odonoghue@linaro.org, dikshita@codeaurora.org,
        jonathan@marek.ca, vgarodia@codeaurora.org
Subject: [PATCH v3 20/25] media: venus: firmware: Do not toggle WRAPPER_A9SS_SW_RESET on 6xx
Date:   Fri,  2 Apr 2021 11:06:43 +0100
Message-Id: <20210402100648.1815854-21-bryan.odonoghue@linaro.org>
X-Mailer: git-send-email 2.30.1
In-Reply-To: <20210402100648.1815854-1-bryan.odonoghue@linaro.org>
References: <20210402100648.1815854-1-bryan.odonoghue@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

From: Dikshita Agarwal <dikshita@codeaurora.org>

Do not toggle the WRAPPER_A9SS_SW_RESET on 6xx.

Signed-off-by: Dikshita Agarwal <dikshita@codeaurora.org>
Signed-off-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Acked-by: Stanimir Varbanov <stanimir.varbanov@linaro.org>
---
 drivers/media/platform/qcom/venus/firmware.c | 8 +++++---
 1 file changed, 5 insertions(+), 3 deletions(-)

diff --git a/drivers/media/platform/qcom/venus/firmware.c b/drivers/media/platform/qcom/venus/firmware.c
index 8c2c68114bbd..227bd3b3f84c 100644
--- a/drivers/media/platform/qcom/venus/firmware.c
+++ b/drivers/media/platform/qcom/venus/firmware.c
@@ -53,10 +53,12 @@ int venus_set_hw_state(struct venus_core *core, bool resume)
 		return ret;
 	}
 
-	if (resume)
+	if (resume) {
 		venus_reset_cpu(core);
-	else
-		writel(1, core->wrapper_base + WRAPPER_A9SS_SW_RESET);
+	} else {
+		if (!IS_V6(core))
+			writel(1, core->wrapper_base + WRAPPER_A9SS_SW_RESET);
+	}
 
 	return 0;
 }
-- 
2.30.1

