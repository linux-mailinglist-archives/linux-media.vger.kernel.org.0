Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id ED6563394E3
	for <lists+linux-media@lfdr.de>; Fri, 12 Mar 2021 18:30:33 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232804AbhCLR36 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 12 Mar 2021 12:29:58 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41824 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232781AbhCLR3a (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 12 Mar 2021 12:29:30 -0500
Received: from mail-wm1-x32e.google.com (mail-wm1-x32e.google.com [IPv6:2a00:1450:4864:20::32e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 043EBC061574
        for <linux-media@vger.kernel.org>; Fri, 12 Mar 2021 09:29:30 -0800 (PST)
Received: by mail-wm1-x32e.google.com with SMTP id d139-20020a1c1d910000b029010b895cb6f2so15620903wmd.5
        for <linux-media@vger.kernel.org>; Fri, 12 Mar 2021 09:29:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=Ih+4JzrKKCuZh71Wtn2Zri+erbNOfm2jAKfFgRpgVkc=;
        b=egAsdi3aEW4JZxfk0q5zHzACd74hnAJZW1BhFludF55G4gZE2j1NYj4XudQchPEh9R
         baHpWh6pmn9rH2KwQ2RxO5iG9mF8GhPkL2w6qFaLF+1JzOH+Topn6nlbT3RC2DCLmAzJ
         OlfxYfmub7ekNglvK6Oa3xw0MXh7RrJQqGD2X7Z8tq5mTQdt7L5aOO1roK+ewYJG8ruB
         e47xxHest9c8GDMktwJfWwDItZ+cuzr5xZMYoRspPu1UzSHsjNAsvdpA7kLtp9vuFJPT
         jRDwXH2ug7Rp0quTdwpSAzAWRNruCxBMQPdzRi6u3MJO5ENsm8rtPBad2XVxR9y8+3OS
         wh0w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=Ih+4JzrKKCuZh71Wtn2Zri+erbNOfm2jAKfFgRpgVkc=;
        b=Y++lt0OeMGQYQctJg3u+jr4hSzUUI2rOC+AoxF5jI7j28FoMy94/C1jK8R8XVFREI1
         EK5ZTNfZtRVHxxSDU+/kI9WS2N91sbrVQmo7scmwnc6tXqGzLs1nUygX34a9ErpysREb
         I/WNSNJNsW1WpAv91l3cJNkQvFMM4Ght9huAer8PFJhgFG3mqX+shLknNUxhQ+BDGLUG
         6hAOdyfOrs9qKPJ2sjp3kQCyOtpWfqxlDQOo4P/GHWWWAuGXo03QgPDMLmPehVKpDsWS
         XMOq++PRnjIiPWAl81uUOvLkFBOLYKrRz0r/B3S3Uj58HYoYUaD2je2H8+4sPiZ6l1vt
         gnsw==
X-Gm-Message-State: AOAM531bh3mtbbqNub1+S/UM8Tki2JhrFr1dT3nAHVavQb9u+3tYVGcw
        E9iRLo03PkEY9mXy9iOf1uWPcw==
X-Google-Smtp-Source: ABdhPJwRSEwuDqq64/lvm+Qbi4gd4VY7jWW0YviF6HyCY6LE8OAOeo6fGZpybkDfTpJSM1UNh8DuyA==
X-Received: by 2002:a05:600c:224e:: with SMTP id a14mr14029517wmm.57.1615570168760;
        Fri, 12 Mar 2021 09:29:28 -0800 (PST)
Received: from sagittarius-a.chello.ie (188-141-3-169.dynamic.upc.ie. [188.141.3.169])
        by smtp.gmail.com with ESMTPSA id 18sm2876375wmj.21.2021.03.12.09.29.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 12 Mar 2021 09:29:28 -0800 (PST)
From:   Bryan O'Donoghue <bryan.odonoghue@linaro.org>
To:     stanimir.varbanov@linaro.org, agross@kernel.org,
        bjorn.andersson@linaro.org, mchehab@kernel.org,
        linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org
Cc:     bryan.odonoghue@linaro.org, dikshita@codeaurora.org,
        jonathan@marek.ca, vgarodia@codeaurora.org
Subject: [PATCH v2 17/25] media: venus: core,pm: Vote for min clk freq during venus boot
Date:   Fri, 12 Mar 2021 17:30:31 +0000
Message-Id: <20210312173039.1387617-18-bryan.odonoghue@linaro.org>
X-Mailer: git-send-email 2.30.1
In-Reply-To: <20210312173039.1387617-1-bryan.odonoghue@linaro.org>
References: <20210312173039.1387617-1-bryan.odonoghue@linaro.org>
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

