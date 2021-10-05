Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 0CBE2422037
	for <lists+linux-media@lfdr.de>; Tue,  5 Oct 2021 10:11:20 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233438AbhJEINF (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 5 Oct 2021 04:13:05 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39848 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233352AbhJEINB (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Tue, 5 Oct 2021 04:13:01 -0400
Received: from mail-ed1-x533.google.com (mail-ed1-x533.google.com [IPv6:2a00:1450:4864:20::533])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B448AC061745
        for <linux-media@vger.kernel.org>; Tue,  5 Oct 2021 01:11:10 -0700 (PDT)
Received: by mail-ed1-x533.google.com with SMTP id v18so73971142edc.11
        for <linux-media@vger.kernel.org>; Tue, 05 Oct 2021 01:11:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=Ls8RstZxqwEUsOoWPu8ndBv6d6AzlNnldZDH8PTFT0s=;
        b=nO4PomRi8oyFYlAiKXx3pgeRDpA6tK4u/+itS+BRrE3bXCb44RNKaDruBFZ49gqxZU
         dfwndLroqe4h5ihs8+0PLL3U8FcjbkLNr4JTAhvoT4/wNPPRaXmRK1D9qHByepPzOvwz
         sigWiLZIMlmuVAMOVYW4CoB/Y2iEyrgdJUMX1V7vHvOMV75yhgIQY57oOvSpKTp9QCmc
         0H2He5ZxubbvMovD+e/2Fz5WTqiVkDMIcw3mdNnZCEsbow/CxIdKnZ0OCdVVfKiaCpJl
         ZkghlpXCH3t38FKJPT4w8H1JD6wgQOgzoqplAF2d9s8UOiYx+Ii06g+vTi7EahvV7zFM
         aMkw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=Ls8RstZxqwEUsOoWPu8ndBv6d6AzlNnldZDH8PTFT0s=;
        b=upc4M9lvJa6xQB3wZ8jv/DXhzHved8E5RGz2MOomwhOrkJTaRNW/fMs+wyzDrpv4Tf
         h6rwIhnuxtXg70o6+nm9rvIN6WhTjuRQJC6NSpCcGDM2pAyXs33LFlJb56c0r+TRK8UD
         WsFMFqpeGEgkeQcY2QGdDxy5E47JUjlW4OZ7dVfjIvwe5tJv0N4BuW+lLLiX38LQKvZ1
         Jm+eqGQFyhO4mRJd280gy+sJ1II/Ir1oS5oq07wKlhzq+LOAyoxdt9BFBpqi+y9s6X6Y
         B6Vi7O5TaR/fh0ZzWJ8bbrK/7lKOpcpfa9IR4xJMFDDpFjF4MXlGMRgionFPbyWPihTw
         JGlg==
X-Gm-Message-State: AOAM5323oxPxRE8O8m340TUUkNvu1a5Zg9+Xn4dpJ8Uk73WLC9dmi4xg
        n8kzhH7DuTJNS45QMG3Dj2uR4X0Azht9zA==
X-Google-Smtp-Source: ABdhPJyckDi2ds1mQmeg1dj3SRksmDbvdNoYJGhzAFsHs7NmG8BLc4++eLGXCqVX3PoAxzTNmoyyEA==
X-Received: by 2002:a17:906:6dd4:: with SMTP id j20mr22885943ejt.316.1633421468984;
        Tue, 05 Oct 2021 01:11:08 -0700 (PDT)
Received: from localhost.localdomain ([84.238.208.199])
        by smtp.gmail.com with ESMTPSA id f1sm3096258edz.47.2021.10.05.01.11.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 05 Oct 2021 01:11:08 -0700 (PDT)
From:   Stanimir Varbanov <stanimir.varbanov@linaro.org>
To:     linux-media@vger.kernel.org
Cc:     linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        vgarodia@codeaurora.org,
        Dikshita Agarwal <dikshita@codeaurora.org>,
        Mansur Alisha Shaik <mansur@codeaurora.org>,
        Stanimir Varbanov <stanimir.varbanov@linaro.org>
Subject: [PATCH v5 4/7] media: venus: hfi: Skip AON register programming for V6 1pipe
Date:   Tue,  5 Oct 2021 11:10:45 +0300
Message-Id: <20211005081048.3095252-5-stanimir.varbanov@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20211005081048.3095252-1-stanimir.varbanov@linaro.org>
References: <20211005081048.3095252-1-stanimir.varbanov@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

From: Dikshita Agarwal <dikshita@codeaurora.org>

AON register programming is used to set NOC to low power mode
during V6 power off sequence. However AON register memory map
is not applicable to 1pipe, hence skipping AON register programming.

Co-developed-by: Mansur Alisha Shaik <mansur@codeaurora.org>
Signed-off-by: Mansur Alisha Shaik <mansur@codeaurora.org>
Co-developed-by: Vikash Garodia <vgarodia@codeaurora.org>
Signed-off-by: Vikash Garodia <vgarodia@codeaurora.org>
Signed-off-by: Dikshita Agarwal <dikshita@codeaurora.org>
Acked-by: Stanimir Varbanov <stanimir.varbanov@linaro.org>
Signed-off-by: Stanimir Varbanov <stanimir.varbanov@linaro.org>
---
 drivers/media/platform/qcom/venus/hfi_venus.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/drivers/media/platform/qcom/venus/hfi_venus.c b/drivers/media/platform/qcom/venus/hfi_venus.c
index ce98c523b3c6..3a75a27632fb 100644
--- a/drivers/media/platform/qcom/venus/hfi_venus.c
+++ b/drivers/media/platform/qcom/venus/hfi_venus.c
@@ -551,6 +551,9 @@ static int venus_halt_axi(struct venus_hfi_device *hdev)
 	if (IS_V6(hdev->core)) {
 		writel(0x3, cpu_cs_base + CPU_CS_X2RPMH_V6);
 
+		if (hdev->core->res->num_vpp_pipes == 1)
+			goto skip_aon_mvp_noc;
+
 		writel(0x1, aon_base + AON_WRAPPER_MVP_NOC_LPI_CONTROL);
 		ret = readl_poll_timeout(aon_base + AON_WRAPPER_MVP_NOC_LPI_STATUS,
 					 val,
@@ -560,6 +563,7 @@ static int venus_halt_axi(struct venus_hfi_device *hdev)
 		if (ret)
 			return -ETIMEDOUT;
 
+skip_aon_mvp_noc:
 		mask_val = (BIT(2) | BIT(1) | BIT(0));
 		writel(mask_val, wrapper_base + WRAPPER_DEBUG_BRIDGE_LPI_CONTROL_V6);
 
-- 
2.25.1

