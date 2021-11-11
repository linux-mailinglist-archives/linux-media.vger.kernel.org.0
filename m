Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B455944DA04
	for <lists+linux-media@lfdr.de>; Thu, 11 Nov 2021 17:13:53 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234127AbhKKQQl (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 11 Nov 2021 11:16:41 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52422 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234046AbhKKQQg (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 11 Nov 2021 11:16:36 -0500
Received: from mail-wr1-x42b.google.com (mail-wr1-x42b.google.com [IPv6:2a00:1450:4864:20::42b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 248CFC061767
        for <linux-media@vger.kernel.org>; Thu, 11 Nov 2021 08:13:47 -0800 (PST)
Received: by mail-wr1-x42b.google.com with SMTP id w29so10626056wra.12
        for <linux-media@vger.kernel.org>; Thu, 11 Nov 2021 08:13:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=1PWkyNb/J7PSvmzSJf3q7YbRaxnCHfwxjvvPonD7/JE=;
        b=c3b8elNpUVCx7g00Pp6laO7HdRfq4v+0k40YMJqR6kJXngiXMlOZjmhyo666GeyAks
         dQJIKSUJiV1XABx4NPUnYDUUxuXA4YUz+8JCIAtoayZfuBkkwRZVArh1EgBoT/+F9Fym
         9cc2g1bbegao0hGYoz5enpsZ/QDwLi9aOg4TC4VeL1tQyPZSFbzmpX+z6iC8h9lz56fw
         zHj/m9514AxJii4Axznr3G1ZDpghrRrKVGnxMtCzSdetvCRcZosJklQTKmoUZQ7TxKH3
         87roo4jNwsL3h4iOfV5214QH+CKp+ptrp695DzEwYayvkhF6Y9ZnW2tKCxw/smOXSn/v
         2qmg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=1PWkyNb/J7PSvmzSJf3q7YbRaxnCHfwxjvvPonD7/JE=;
        b=RpQ65Er9bc5H8LoopMd+KwreJdPEUiV1CCbHODL8SnWdI9ZQ5zeXviESlhoyrohpEZ
         GZLf28NBjyQB9DDGNokJcQ333K0C7rR2yB67E9I+dePFSfvWFChA+KQyGlQ26kx0RoUG
         PuZHBMfVTCusisCLsgU8j1uAuYnK5sK9PiANoizdJzsgTrRyiS753nJSFRwGuPE3kNjz
         L1jSOKJTcOZu+mHk6TYbCdp8rERhIbf0/ZYOkzFUskCq0iQUSgrluqg5+J7BvSoWa2l+
         KRg9/zcSdwAnCE1ybOfFbztEsi5zda6xs7iQrIvWjCepC5obYHtS12Zkp+HNYhvi1zBc
         0cuA==
X-Gm-Message-State: AOAM5309LZusW8X86EDEG551kg2Gd8oMJPdspxcufdAxfUSlvgkw9Dwq
        kO5inzPpGbk+r7J3lCKgUIalzw==
X-Google-Smtp-Source: ABdhPJyYAoEbSZLi8o2JVHnavvqnFiE50iqRvYDKyebq+uVN7ZKqw3WBDf0f1bbmeUSD37Cfb+Cqgg==
X-Received: by 2002:adf:fe8b:: with SMTP id l11mr9953717wrr.228.1636647225782;
        Thu, 11 Nov 2021 08:13:45 -0800 (PST)
Received: from sagittarius-a.chello.ie (188-141-3-169.dynamic.upc.ie. [188.141.3.169])
        by smtp.gmail.com with ESMTPSA id o1sm3441451wrn.63.2021.11.11.08.13.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 11 Nov 2021 08:13:45 -0800 (PST)
From:   Bryan O'Donoghue <bryan.odonoghue@linaro.org>
To:     linux-arm-msm@vger.kernel.org, linux-media@vger.kernel.org,
        robert.foss@linaro.org, jonathan@marek.ca
Cc:     andrey.konovalov@linaro.org, todor.too@gmail.com,
        agross@kernel.org, bjorn.andersson@linaro.org, mchehab@kernel.org,
        jgrahsl@snap.com, hfink@snap.com, bryan.odonoghue@linaro.org
Subject: [RESEND PATCH 02/18] media: camss: csiphy-3ph: don't print HW version as an error
Date:   Thu, 11 Nov 2021 16:15:26 +0000
Message-Id: <20211111161542.3936425-3-bryan.odonoghue@linaro.org>
X-Mailer: git-send-email 2.33.0
In-Reply-To: <20211111161542.3936425-1-bryan.odonoghue@linaro.org>
References: <20211111161542.3936425-1-bryan.odonoghue@linaro.org>
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

