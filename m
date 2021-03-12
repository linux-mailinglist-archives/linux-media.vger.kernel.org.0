Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B5C893394EB
	for <lists+linux-media@lfdr.de>; Fri, 12 Mar 2021 18:30:36 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232814AbhCLR37 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 12 Mar 2021 12:29:59 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41840 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232348AbhCLR3c (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 12 Mar 2021 12:29:32 -0500
Received: from mail-wr1-x435.google.com (mail-wr1-x435.google.com [IPv6:2a00:1450:4864:20::435])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3BD7FC061574
        for <linux-media@vger.kernel.org>; Fri, 12 Mar 2021 09:29:32 -0800 (PST)
Received: by mail-wr1-x435.google.com with SMTP id d15so5241220wrv.5
        for <linux-media@vger.kernel.org>; Fri, 12 Mar 2021 09:29:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=aAjW4GW8O+sHFwP0oe1kd9Dh6BYS5Lz26CDNq9x7MhQ=;
        b=yeZNMB70f5BCRmJb1J0fsPQGQikVHcGeCNRrqgnUVrnZAjbPnUA5xhTiXtjpmp9wqY
         oZS2RVdqzB3Pa/X5He9+hmhD4d37fDszTNwcDm2laR+7I7K3MO6tYQ0fbrElex+VAB3x
         YInapK7FzunSoV2C68ZJLiK9XbCs8YHcb//GJZ8RcdGFRbaETHs4XwJTanbqwQoYTVKt
         m2YxSWKVrZRKwLHQ6JgA31UzjKoqf8q5c/mfSJsaSi11QzHktSM0wjMnO2+e+R7r4x/g
         J6Pxt2EelkWgEw7JjfOCRLqg6JYM3iGB6XE+y2H6BbcuRfT6g8PRjDthmgGPV8EcfIyH
         SRcw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=aAjW4GW8O+sHFwP0oe1kd9Dh6BYS5Lz26CDNq9x7MhQ=;
        b=takspaUFLnbLoBnUKJkXlLchA4LTN5m4SratuUZPZEXmgOM8VKnZ6xNElq6IaisN7G
         MDR7yT3nLIwUWhB6Jjz+PKWz0NVIlvRzJQBpvpYbVrwF4NAGlfABrEK+796sNQG2TULz
         D4Rorf854lK7Ew9+NMbkp196wn4fqUW6qDmT/g0RXUPsWtCweacGxJx/TBRAM8AcCdQx
         qsoLvjeYqFLNfQ42MamdvaV5A2NLXsM96xF5+1+pdFbx0B3S9/6BWmuopduxoR6TjFc2
         dI9xz08p80aniXIv4pN5/7ZAjypSoikBi24igr7+tpfAYjX4wP9vuKWk3guDI1eAJJOL
         qH6Q==
X-Gm-Message-State: AOAM5316VJkaGNpZROVik3wZNyrf22MvB766dlQlSjQiy6DOay0nSPXp
        RIMIAJpTa/rgUB0oFwViUs51LA==
X-Google-Smtp-Source: ABdhPJzoxUEPdbzDasCwHG4HEcfsMeFtAjoyhGRW1k43GalTTAEHFV3CFAcJ6fxKTtnGdroKLvA/RA==
X-Received: by 2002:a5d:4686:: with SMTP id u6mr15015847wrq.60.1615570171020;
        Fri, 12 Mar 2021 09:29:31 -0800 (PST)
Received: from sagittarius-a.chello.ie (188-141-3-169.dynamic.upc.ie. [188.141.3.169])
        by smtp.gmail.com with ESMTPSA id 18sm2876375wmj.21.2021.03.12.09.29.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 12 Mar 2021 09:29:30 -0800 (PST)
From:   Bryan O'Donoghue <bryan.odonoghue@linaro.org>
To:     stanimir.varbanov@linaro.org, agross@kernel.org,
        bjorn.andersson@linaro.org, mchehab@kernel.org,
        linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org
Cc:     bryan.odonoghue@linaro.org, dikshita@codeaurora.org,
        jonathan@marek.ca, vgarodia@codeaurora.org
Subject: [PATCH v2 19/25] media: venus: pm: Toggle 6xx wrapper power in vcodec_control
Date:   Fri, 12 Mar 2021 17:30:33 +0000
Message-Id: <20210312173039.1387617-20-bryan.odonoghue@linaro.org>
X-Mailer: git-send-email 2.30.1
In-Reply-To: <20210312173039.1387617-1-bryan.odonoghue@linaro.org>
References: <20210312173039.1387617-1-bryan.odonoghue@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

From: Dikshita Agarwal <dikshita@codeaurora.org>

When in vcodec_control_v4() on the 4xx path we select between one of two
vcodec cores to toggle power control bits. In 6xx there is only one core
which offsets the relevant control registers to a slightly different
address.

This patch accounts for the address offset for 6xx silicon.

Signed-off-by: Dikshita Agarwal <dikshita@codeaurora.org>
Co-developed-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Signed-off-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
---
 drivers/media/platform/qcom/venus/pm_helpers.c | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/drivers/media/platform/qcom/venus/pm_helpers.c b/drivers/media/platform/qcom/venus/pm_helpers.c
index a91dc24de2a4..dfe3ee84eeb6 100644
--- a/drivers/media/platform/qcom/venus/pm_helpers.c
+++ b/drivers/media/platform/qcom/venus/pm_helpers.c
@@ -414,7 +414,10 @@ static int vcodec_control_v4(struct venus_core *core, u32 coreid, bool enable)
 	u32 val;
 	int ret;
 
-	if (coreid == VIDC_CORE_ID_1) {
+	if (IS_V6(core)) {
+		ctrl = core->wrapper_base + WRAPPER_CORE_POWER_CONTROL_V6;
+		stat = core->wrapper_base + WRAPPER_CORE_POWER_STATUS_V6;
+	} else if (coreid == VIDC_CORE_ID_1) {
 		ctrl = core->wrapper_base + WRAPPER_VCODEC0_MMCC_POWER_CONTROL;
 		stat = core->wrapper_base + WRAPPER_VCODEC0_MMCC_POWER_STATUS;
 	} else {
-- 
2.30.1

