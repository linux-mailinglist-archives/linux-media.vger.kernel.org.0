Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 952914666A0
	for <lists+linux-media@lfdr.de>; Thu,  2 Dec 2021 16:35:47 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S241736AbhLBPjI (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 2 Dec 2021 10:39:08 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52012 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236658AbhLBPjH (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Thu, 2 Dec 2021 10:39:07 -0500
Received: from mail-wm1-x32d.google.com (mail-wm1-x32d.google.com [IPv6:2a00:1450:4864:20::32d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 730C1C061757
        for <linux-media@vger.kernel.org>; Thu,  2 Dec 2021 07:35:44 -0800 (PST)
Received: by mail-wm1-x32d.google.com with SMTP id g191-20020a1c9dc8000000b0032fbf912885so48496wme.4
        for <linux-media@vger.kernel.org>; Thu, 02 Dec 2021 07:35:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=xIsh/cU40ccDZcwP6YbI9udJahz0E6Lgg6Vk1iR/MMI=;
        b=QvVwiENC7HYhao6oUNhSdM3Y6QzOgdLQO/1HUljXGvQq2Obr+NOXkO18jp41PPlxKU
         qj8Vqw8GFnRjfgGo/CUnx7OiPjLZr2yxb1XwlBR82sdPkAD0QGEJnns88PZ0iGaoFjgY
         1B5cwWZ6CCe6dXcQg88u0WcPFBEQgGurxReF/nINsJ7bnujOPhjYaTCtHGHEWsQIiyUn
         3sfzjBgu5o8LAAHRgwduC7px+3udxjfTjeiOXcMYn7JWMJonFCJgxEAGS9MyfuS/jcGP
         j7J8ZX8Oxfyyfo/uA4EXXrp63lyZxPsl39lEpIe9DlsKq/ZnnTkeVmnsJKt5eghdsiZ1
         wUHg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=xIsh/cU40ccDZcwP6YbI9udJahz0E6Lgg6Vk1iR/MMI=;
        b=AQBjHQm3R4rPClxgReI7C7i3RLLjzY8YHglfSRbkVWko7tewk0CP5BL6XARXDKGJb9
         aKGiDPAxVqNDYyA/89MBo1J2+oLFpKFd8eVO8EdUnyso3QpR7toKbq9MYoROuVfne6Ql
         c/3ZSa6YxUXCucXOUtsToWjNZpKt8s9cNIAFGB5ZydYMGHGb7IDUcdCPadLBsd7pXmk6
         Bx4Sz0IGU/LclEuuaeaUBtCTpdH7+wPps9IJ0j8j5CrEeaMOBSSAt7zcDl/M4Q+9vjmx
         bSNZs1foH6q9wN914uw5FLuAOiIiPzo2AooVwlLtMdTMCy/+Rs/JSuxkrk/jNOK3x/4M
         Icmg==
X-Gm-Message-State: AOAM5329mCX8PKZAtzbneQkZvrcMV0VpOJhHIT2aR2UwmsRFvOc2Tk8C
        F59Om6JStYejixLhzhne7++rdA==
X-Google-Smtp-Source: ABdhPJw5os3NF3AH8osi5REnp0NbNQOObKy5GmQVech7OdfoVIbDk2yarrzX/eq5FF4hwuhmYg1C/g==
X-Received: by 2002:a05:600c:500b:: with SMTP id n11mr7220376wmr.38.1638459343015;
        Thu, 02 Dec 2021 07:35:43 -0800 (PST)
Received: from sagittarius-a.chello.ie (188-141-3-169.dynamic.upc.ie. [188.141.3.169])
        by smtp.gmail.com with ESMTPSA id bd18sm3662wmb.43.2021.12.02.07.35.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 02 Dec 2021 07:35:42 -0800 (PST)
From:   Bryan O'Donoghue <bryan.odonoghue@linaro.org>
To:     linux-arm-msm@vger.kernel.org, linux-media@vger.kernel.org,
        robert.foss@linaro.org, jonathan@marek.ca
Cc:     andrey.konovalov@linaro.org, todor.too@gmail.com,
        agross@kernel.org, bjorn.andersson@linaro.org, mchehab@kernel.org,
        jgrahsl@snap.com, hfink@snap.com, bryan.odonoghue@linaro.org
Subject: [RESEND PATCH v2 02/19] media: camss: csiphy-3ph: don't print HW version as an error
Date:   Thu,  2 Dec 2021 15:37:12 +0000
Message-Id: <20211202153729.3362372-3-bryan.odonoghue@linaro.org>
X-Mailer: git-send-email 2.33.0
In-Reply-To: <20211202153729.3362372-1-bryan.odonoghue@linaro.org>
References: <20211202153729.3362372-1-bryan.odonoghue@linaro.org>
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
index e318c822ab04..5948abdcd220 100644
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

