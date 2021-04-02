Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 53B6D352976
	for <lists+linux-media@lfdr.de>; Fri,  2 Apr 2021 12:06:02 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235131AbhDBKFp (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 2 Apr 2021 06:05:45 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45506 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234955AbhDBKFi (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Fri, 2 Apr 2021 06:05:38 -0400
Received: from mail-wr1-x42a.google.com (mail-wr1-x42a.google.com [IPv6:2a00:1450:4864:20::42a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 39ABAC0613A5
        for <linux-media@vger.kernel.org>; Fri,  2 Apr 2021 03:05:35 -0700 (PDT)
Received: by mail-wr1-x42a.google.com with SMTP id o16so4331587wrn.0
        for <linux-media@vger.kernel.org>; Fri, 02 Apr 2021 03:05:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=jC/nAoOA5wxgtGfB1JzVVDDrp9E9awsc1iAxv29P8SY=;
        b=pbUhDi5hNO63pJvumcEhmebOG/sfnPRDTUEiG9G9H1q8tbkL/ALrBaKHF/QMBh2kBO
         vVfzer+6nn0to8yY8fzWnADRbApwCyLjgX6InqdKXFYL71Q1pb91qOn1PxNmev5WxC9n
         VP1ehzT9hSgCVTT/ezUC03utkeqXFKJNiFJU8WM6MN1fJqlCZkvManMYM8mqEd7yXB1M
         h8NghO8Nu9OgceGqjqFTQDeezQv2vbXGMk/CQ06n7Vw4/FvgFjTGCxBBSYoYZoAIrKOv
         +sJFaplqCXjA3xHu291kqU/qpY1al7DZyrLe2Plw1Lc0W3e108hX3ngEyqhLu+B+tdIo
         hvqQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=jC/nAoOA5wxgtGfB1JzVVDDrp9E9awsc1iAxv29P8SY=;
        b=dcmDF20Lvfdg4YFTd/JrjE1i51hr+2BzY2qZ+Vu0xKmTqyp4XJOAax1K+w5X35MZUB
         wjIWveUm2KbIqxgV1Vaw5YRtVDnHpEfNGUDIr9WWBZLeclrItwaGHc4VE0mXXtHzU2vN
         axDOXZjh52qnfpdOu+JvSeQPbGIIXeqt46mUniwz8edJcxsJBkJ5QNolPhTotmOsiVS+
         ECEx8JHGGCGiXFLA3VcHDqmElE/4Zy/2ZSwUjTEmNvRyWjwCBDI0/kpQT4YBi9K3+JFO
         NOazTsJsDhJ/NU49oWAsMFNX2MzeYa5boS9iylDUw/U/xboG3Ufy7f+2V5KUh7TYuHHI
         cZNg==
X-Gm-Message-State: AOAM533jUMzoNg/3LSkLJvuX0JUGTZ2qeZOAl2nXvBBaLxTMhYxLAQuX
        LUNhV/dJw8TXkIQyFLCTom+S0Q==
X-Google-Smtp-Source: ABdhPJxriJQmomnT24GnzdPYjF46MNqcPf63SBWyviO2aWfi7K0WyN9Nm+UomV0S2U9ReoP7MZ1+BA==
X-Received: by 2002:a5d:654a:: with SMTP id z10mr14680154wrv.335.1617357934079;
        Fri, 02 Apr 2021 03:05:34 -0700 (PDT)
Received: from sagittarius-a.chello.ie (188-141-3-169.dynamic.upc.ie. [188.141.3.169])
        by smtp.gmail.com with ESMTPSA id v18sm15466618wrf.41.2021.04.02.03.05.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 02 Apr 2021 03:05:33 -0700 (PDT)
From:   Bryan O'Donoghue <bryan.odonoghue@linaro.org>
To:     stanimir.varbanov@linaro.org, agross@kernel.org,
        bjorn.andersson@linaro.org, mchehab@kernel.org,
        linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org
Cc:     bryan.odonoghue@linaro.org, dikshita@codeaurora.org,
        jonathan@marek.ca, vgarodia@codeaurora.org
Subject: [PATCH v3 17/25] media: venus: core,pm: Vote for min clk freq during venus boot
Date:   Fri,  2 Apr 2021 11:06:40 +0100
Message-Id: <20210402100648.1815854-18-bryan.odonoghue@linaro.org>
X-Mailer: git-send-email 2.30.1
In-Reply-To: <20210402100648.1815854-1-bryan.odonoghue@linaro.org>
References: <20210402100648.1815854-1-bryan.odonoghue@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

From: Dikshita Agarwal <dikshita@codeaurora.org>

Vote for min clk frequency for core clks during prepare and enable clocks
at boot sequence. Without this the controller clock runs at very low value
(9.6MHz) which is not sufficient to boot venus.

Signed-off-by: Dikshita Agarwal <dikshita@codeaurora.org>
Signed-off-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Acked-by: Stanimir Varbanov <stanimir.varbanov@linaro.org>
---
 drivers/media/platform/qcom/venus/pm_helpers.c | 14 ++++++++++++++
 1 file changed, 14 insertions(+)

diff --git a/drivers/media/platform/qcom/venus/pm_helpers.c b/drivers/media/platform/qcom/venus/pm_helpers.c
index a23e490b6139..a91dc24de2a4 100644
--- a/drivers/media/platform/qcom/venus/pm_helpers.c
+++ b/drivers/media/platform/qcom/venus/pm_helpers.c
@@ -41,10 +41,24 @@ static int core_clks_get(struct venus_core *core)
 static int core_clks_enable(struct venus_core *core)
 {
 	const struct venus_resources *res = core->res;
+	const struct freq_tbl *freq_tbl = core->res->freq_tbl;
+	unsigned int freq_tbl_size = core->res->freq_tbl_size;
+	unsigned long freq;
 	unsigned int i;
 	int ret;
 
+	if (!freq_tbl)
+		return -EINVAL;
+
+	freq = freq_tbl[freq_tbl_size - 1].freq;
+
 	for (i = 0; i < res->clks_num; i++) {
+		if (IS_V6(core)) {
+			ret = clk_set_rate(core->clks[i], freq);
+			if (ret)
+				goto err;
+		}
+
 		ret = clk_prepare_enable(core->clks[i]);
 		if (ret)
 			goto err;
-- 
2.30.1

