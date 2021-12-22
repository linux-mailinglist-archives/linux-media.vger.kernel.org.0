Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 9F64947CA4C
	for <lists+linux-media@lfdr.de>; Wed, 22 Dec 2021 01:35:50 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S239600AbhLVAft (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 21 Dec 2021 19:35:49 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44342 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S239485AbhLVAft (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 21 Dec 2021 19:35:49 -0500
Received: from mail-wr1-x42e.google.com (mail-wr1-x42e.google.com [IPv6:2a00:1450:4864:20::42e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 20D90C061574
        for <linux-media@vger.kernel.org>; Tue, 21 Dec 2021 16:35:49 -0800 (PST)
Received: by mail-wr1-x42e.google.com with SMTP id d9so1430434wrb.0
        for <linux-media@vger.kernel.org>; Tue, 21 Dec 2021 16:35:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=aVnKjjfoMlWOYQorgJz5dVMTeV/85OY8LLZz6SkWXLo=;
        b=yr71G2JKx3ZVmqqySQbjemfvCIKKbVIgMyLMbdnkrNDHq8wY3Ve8fWwgFD/m8XAfEY
         +uyYzQBBunWsEp1+1jOqJ5rLKmvJtt+caPNqWELsCqkxp2a7DNMJh8/aS90kzVDLvalK
         1YTfq0LQtxzdbSaWhLfRYLtGmBPkXqrtn7NpDMRmud9v+THzXH8L6Nbm1G1Zo1wCstLE
         X0/kc96msWhcCXsco+4YXv4v7l/h06xwqW+f05b81ZtJSr1dcE4ZLnZsGVkEzHlYRim+
         XlTCumTG9MYCaYztp0cQMfifoKJIfYxeUY4C6YCdpICbDswmmaHXIxGBDaRjcZh3L363
         zvuw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=aVnKjjfoMlWOYQorgJz5dVMTeV/85OY8LLZz6SkWXLo=;
        b=PbxAtTab+WMwVOk/w7Y2e/W7uSgeNC7hxdn5/cfYFNd+Ycf40hmRLDMH7cPMSMl+vb
         kJDB+8FSv1wdwAvhk3XBKRSWD/WlJ5Lek1AKFBXy14L41IrJWQ2jFLNJs/KOH169rZc/
         4ZSjkzeGC06OsWs8G+VcqnYPWNSCIT/g8BdFC3tkVjbHV4Hv6R3seOBhY0L768gf0NpW
         /TCZND/oMNjP2kBDZzBx4RrlByHRsIDZ4QrMXgQCpG+IMTzZij4lCGNgHF7ltgkQ3eY8
         rDC6oTWDc35u9x6XhoWc4nLzNeJM9XJCne146rXQNNolw0FnILvzNbRgpNS1tdV12qdu
         Qz8Q==
X-Gm-Message-State: AOAM532DZKObRtVwwdEfr0gvbGPRL0f/1WoL1vQibfBp7+TwiWPlLyIg
        D/XY/7GO72q374XTt1TEnMGvzQ==
X-Google-Smtp-Source: ABdhPJxCkJKPNyUP5zGNfZgGF/ZFQsdsuhOsIUW37s5n+JTSnni/B6DaGwswSq6ujDp2ccO7gYz5ZQ==
X-Received: by 2002:a5d:6d05:: with SMTP id e5mr407022wrq.46.1640133347679;
        Tue, 21 Dec 2021 16:35:47 -0800 (PST)
Received: from sagittarius-a.chello.ie (188-141-3-169.dynamic.upc.ie. [188.141.3.169])
        by smtp.gmail.com with ESMTPSA id n7sm282825wms.45.2021.12.21.16.35.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 21 Dec 2021 16:35:47 -0800 (PST)
From:   Bryan O'Donoghue <bryan.odonoghue@linaro.org>
To:     linux-arm-msm@vger.kernel.org, linux-media@vger.kernel.org,
        mchehab@kernel.org, hverkuil@xs4all.nl, robert.foss@linaro.org
Cc:     jonathan@marek.ca, andrey.konovalov@linaro.org,
        todor.too@gmail.com, agross@kernel.org, bjorn.andersson@linaro.org,
        jgrahsl@snap.com, hfink@snap.com, vladimir.zapolskiy@linaro.org,
        dmitry.baryshkov@linaro.org, bryan.odonoghue@linaro.org
Subject: [PATCH v3 02/19] media: camss: csiphy-3ph: don't print HW version as an error
Date:   Wed, 22 Dec 2021 00:37:34 +0000
Message-Id: <20211222003751.2461466-3-bryan.odonoghue@linaro.org>
X-Mailer: git-send-email 2.33.0
In-Reply-To: <20211222003751.2461466-1-bryan.odonoghue@linaro.org>
References: <20211222003751.2461466-1-bryan.odonoghue@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

From: Jonathan Marek <jonathan@marek.ca>

Avoid unnecessary noise in normal usage (it prints every time CSIPHY is
powered on).

Signed-off-by: Jonathan Marek <jonathan@marek.ca>
Reviewed-by: Robert Foss <robert.foss@linaro.org>
Tested-by: Julian Grahsl <jgrahsl@snap.com>
Tested-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Signed-off-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
---
 drivers/media/platform/qcom/camss/camss-csiphy-3ph-1-0.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/media/platform/qcom/camss/camss-csiphy-3ph-1-0.c b/drivers/media/platform/qcom/camss/camss-csiphy-3ph-1-0.c
index e318c822ab04c..5948abdcd2206 100644
--- a/drivers/media/platform/qcom/camss/camss-csiphy-3ph-1-0.c
+++ b/drivers/media/platform/qcom/camss/camss-csiphy-3ph-1-0.c
@@ -163,7 +163,7 @@ static void csiphy_hw_version_read(struct csiphy_device *csiphy,
 	hw_version |= readl_relaxed(csiphy->base +
 				   CSIPHY_3PH_CMN_CSI_COMMON_STATUSn(15)) << 24;
 
-	dev_err(dev, "CSIPHY 3PH HW Version = 0x%08x\n", hw_version);
+	dev_dbg(dev, "CSIPHY 3PH HW Version = 0x%08x\n", hw_version);
 }
 
 /*
-- 
2.33.0

