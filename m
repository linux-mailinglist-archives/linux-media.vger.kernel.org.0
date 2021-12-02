Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 31A294666AA
	for <lists+linux-media@lfdr.de>; Thu,  2 Dec 2021 16:35:53 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1359058AbhLBPjN (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 2 Dec 2021 10:39:13 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52058 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S239731AbhLBPjM (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Thu, 2 Dec 2021 10:39:12 -0500
Received: from mail-wm1-x330.google.com (mail-wm1-x330.google.com [IPv6:2a00:1450:4864:20::330])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 11444C06174A
        for <linux-media@vger.kernel.org>; Thu,  2 Dec 2021 07:35:50 -0800 (PST)
Received: by mail-wm1-x330.google.com with SMTP id i8-20020a7bc948000000b0030db7b70b6bso2643904wml.1
        for <linux-media@vger.kernel.org>; Thu, 02 Dec 2021 07:35:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=VaypeNrUOCg7S0K8f6ZLIMgJdldXUrMIgt398GOYj4Q=;
        b=pkJARG9jtpqaheccmuyhSef7yV288L4VBLPZYyottTvHVBRxLjYf7w3roqYlfH/Yf9
         rqwW0i+oHVofPsyebn7F2cp8UybQKC4fQKBhf3R/hmKA3kUG22d8OH9rOqo4ge1TnUPd
         yIaccR0zTl3LtMbxIxkf92aHsF93oufpBXB8EmlOLtB0mLpgDz4mIOkmjNidoXrMJ0Uv
         N4WpFA2Ep22/bIFOQL12UhquZ4Kviygad4dqutG8sZ+e3OsjUXfJ5j/A1wtTxho0Cwgu
         erZVShMYxdZnfUdoYfp3I2iT7vj7Mm2CQzSc72iJbdmjGSBbwuIqEKxTNTYkG2y2NTQF
         koPQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=VaypeNrUOCg7S0K8f6ZLIMgJdldXUrMIgt398GOYj4Q=;
        b=BY51uF1GBcwlaf3mJ3hIEjMMI9ScTNxYxA5wF+hPECSOOSdHENwgkB+bD2gvk38qmj
         JuNxkOEMk3kMXMeAOws7qH2QmJk58g90oVrEhH+8qEpyVuOPMJB9wR9uoKTYg/Z1gpGi
         ZDHUfFsgKSysr17I0BR8qjpTPJTLg+XDYcr4aIKNiZ90Gau/4qfATqwg+s1iM+Bwy+FE
         IsosDfzMXWUVw2f3ZGnPfzoKpEwjW+vUA6ESonRMmm1AMjwcsCFm0pZzoilrDz+R2ZxC
         DpLYl2AeX+b1QjDuyj3iDHhPwIio0zs29PAKT9agBWnsDM08yY1KUEYZEV5n04BhWUUQ
         GKgg==
X-Gm-Message-State: AOAM531Lv8Xco4DZusa3FUbNOez/0G2vpPtwiA1aHA4P+AVCbMkEUAuG
        vk0jhMDbqe4OY6fgafc6eD7JAw==
X-Google-Smtp-Source: ABdhPJwMIfjMdAawPEOhiXZKfdNjFQ2QDWunurtXGXbMHPXMmeVJSEG1ShNizbmyKhMLgttb4fMUUQ==
X-Received: by 2002:a05:600c:4e4a:: with SMTP id e10mr7001348wmq.176.1638459348554;
        Thu, 02 Dec 2021 07:35:48 -0800 (PST)
Received: from sagittarius-a.chello.ie (188-141-3-169.dynamic.upc.ie. [188.141.3.169])
        by smtp.gmail.com with ESMTPSA id bd18sm3662wmb.43.2021.12.02.07.35.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 02 Dec 2021 07:35:48 -0800 (PST)
From:   Bryan O'Donoghue <bryan.odonoghue@linaro.org>
To:     linux-arm-msm@vger.kernel.org, linux-media@vger.kernel.org,
        robert.foss@linaro.org, jonathan@marek.ca
Cc:     andrey.konovalov@linaro.org, todor.too@gmail.com,
        agross@kernel.org, bjorn.andersson@linaro.org, mchehab@kernel.org,
        jgrahsl@snap.com, hfink@snap.com, bryan.odonoghue@linaro.org
Subject: [RESEND PATCH v2 07/19] media: camss: csid-170: remove stray comment
Date:   Thu,  2 Dec 2021 15:37:17 +0000
Message-Id: <20211202153729.3362372-8-bryan.odonoghue@linaro.org>
X-Mailer: git-send-email 2.33.0
In-Reply-To: <20211202153729.3362372-1-bryan.odonoghue@linaro.org>
References: <20211202153729.3362372-1-bryan.odonoghue@linaro.org>
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
Tested-by: Julian Grahsl <jgrahsl@snap.com>
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

