Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 5B035330BC2
	for <lists+linux-media@lfdr.de>; Mon,  8 Mar 2021 11:53:13 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231556AbhCHKwk (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 8 Mar 2021 05:52:40 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37822 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231532AbhCHKw1 (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Mon, 8 Mar 2021 05:52:27 -0500
Received: from mail-ed1-x532.google.com (mail-ed1-x532.google.com [IPv6:2a00:1450:4864:20::532])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 199D6C061760
        for <linux-media@vger.kernel.org>; Mon,  8 Mar 2021 02:52:27 -0800 (PST)
Received: by mail-ed1-x532.google.com with SMTP id p1so13989132edy.2
        for <linux-media@vger.kernel.org>; Mon, 08 Mar 2021 02:52:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=vu6fN70TTMvQg6UpQaIpvnuDMkcE3D856HE5/O9eVos=;
        b=I9bVMJm2IYuaF1WJONsRrQL9lxbzBYV/KBi6GsajUUxw0G6KcT5pUs9ZV/ft/DNqUN
         6SRVw2/HTp3R3kFqSGekcqHY9vussFZFQJhzRENZrZvWHSgrq0HXXj8MEjqpOlpGD8A8
         6yXsUALVqrNgyJRBmhV12DutvsQsd8kyATyS4Q9N3ms2pA1K9HZOqq1WP+mZTfmVam9r
         tEntzXE5Tn1ni6S4gbqzJvKGSeOh5lo4wZauAve3TF92SQ2HxgukcnYbcBZFS8tBjiju
         7zqxtNWndLT+nXIVXCfJue6XbYCKKwkHpNE8usPmFXIWVFdMWKRxdz7iGFptOqusyefE
         Pp7A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=vu6fN70TTMvQg6UpQaIpvnuDMkcE3D856HE5/O9eVos=;
        b=ZVEO8qQhsA9ynHYLQzZXkFvt3gQaUtr5+gEYEJPyn9om6TFO1qReNmZKRCiXG9V7fg
         LItfzMLE0DsCRhIRr3XwjN+bArwd0tbCrf0jsy3KcSHwcBToonnhJQaiM4xeTVMHa3YB
         4FBLtQB9CkskrruPTlI8v6S2Qf+n9T9nJJ6QOfHuN2G41MXiCB8Ri4wIobuUy/lx0p6o
         czfcshYpjfE0UctHyJPR5WZDtWkIZKnehS/Fd8tiFeH9s2KrQP3+z94ySbclkoUZbnew
         nITVqZtIUUbFjGlJ1zW58gwUgie5lDMNxAKfLEAyJAj29LbXohCrKaNlJAYx4KMFCwwZ
         AdjA==
X-Gm-Message-State: AOAM5303k8m1s9r6zueWZp2QYtwXswGGP/t0jYxUH0oZpiZftgMhUdO1
        G7GATzo8WEBM8SJS4wSsOLoKLXQE0NWwow==
X-Google-Smtp-Source: ABdhPJwhL2yJjXJTiJjVYSSYI9n7E+POvgG58ukPbv0NuTF0mY38Ubq/2l9WWKcywVeoIfMOifTBpw==
X-Received: by 2002:a05:6402:2215:: with SMTP id cq21mr21940639edb.281.1615200745696;
        Mon, 08 Mar 2021 02:52:25 -0800 (PST)
Received: from localhost.localdomain (95-43-196-84.ip.btc-net.bg. [95.43.196.84])
        by smtp.gmail.com with ESMTPSA id y9sm6386297ejd.110.2021.03.08.02.52.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 08 Mar 2021 02:52:25 -0800 (PST)
From:   Stanimir Varbanov <stanimir.varbanov@linaro.org>
To:     linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org
Cc:     bryan.odonoghue@linaro.org,
        Stanimir Varbanov <stanimir.varbanov@linaro.org>,
        stable@vger.kernel.org
Subject: [PATCH 3/5] venus: pm_helpers: Set opp clock name for v1
Date:   Mon,  8 Mar 2021 12:52:03 +0200
Message-Id: <20210308105205.445148-4-stanimir.varbanov@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210308105205.445148-1-stanimir.varbanov@linaro.org>
References: <20210308105205.445148-1-stanimir.varbanov@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

The rate of the core clock is set through devm_pm_opp_set_rate and
to avoid errors from it we have to set the name of the clock via
dev_pm_opp_set_clkname.

Fixes: 9a538b83612c ("media: venus: core: Add support for opp tables/perf voting")
Cc: stable@vger.kernel.org # v5.10+
Signed-off-by: Stanimir Varbanov <stanimir.varbanov@linaro.org>
---
 .../media/platform/qcom/venus/pm_helpers.c    | 20 ++++++++++++++++++-
 1 file changed, 19 insertions(+), 1 deletion(-)

diff --git a/drivers/media/platform/qcom/venus/pm_helpers.c b/drivers/media/platform/qcom/venus/pm_helpers.c
index 43c4e3d9e281..12f6d3ab89ff 100644
--- a/drivers/media/platform/qcom/venus/pm_helpers.c
+++ b/drivers/media/platform/qcom/venus/pm_helpers.c
@@ -280,8 +280,24 @@ static int load_scale_v1(struct venus_inst *inst)
 static int core_get_v1(struct device *dev)
 {
 	struct venus_core *core = dev_get_drvdata(dev);
+	int ret;
+
+	ret = core_clks_get(core);
+	if (ret)
+		return ret;
+
+	core->opp_table = dev_pm_opp_set_clkname(core->dev, "core");
+	if (IS_ERR(core->opp_table))
+		return PTR_ERR(core->opp_table);
 
-	return core_clks_get(core);
+	return 0;
+}
+
+static void core_put_v1(struct device *dev)
+{
+	struct venus_core *core = dev_get_drvdata(dev);
+
+	dev_pm_opp_put_clkname(core->opp_table);
 }
 
 static int core_power_v1(struct device *dev, int on)
@@ -299,6 +315,7 @@ static int core_power_v1(struct device *dev, int on)
 
 static const struct venus_pm_ops pm_ops_v1 = {
 	.core_get = core_get_v1,
+	.core_put = core_put_v1,
 	.core_power = core_power_v1,
 	.load_scale = load_scale_v1,
 };
@@ -371,6 +388,7 @@ static int venc_power_v3(struct device *dev, int on)
 
 static const struct venus_pm_ops pm_ops_v3 = {
 	.core_get = core_get_v1,
+	.core_put = core_put_v1,
 	.core_power = core_power_v1,
 	.vdec_get = vdec_get_v3,
 	.vdec_power = vdec_power_v3,
-- 
2.25.1

