Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 8264448ADE5
	for <lists+linux-media@lfdr.de>; Tue, 11 Jan 2022 13:50:16 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S239946AbiAKMuO (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 11 Jan 2022 07:50:14 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33488 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S239931AbiAKMuN (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 11 Jan 2022 07:50:13 -0500
Received: from mail-wr1-x432.google.com (mail-wr1-x432.google.com [IPv6:2a00:1450:4864:20::432])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3DDC1C06173F
        for <linux-media@vger.kernel.org>; Tue, 11 Jan 2022 04:50:13 -0800 (PST)
Received: by mail-wr1-x432.google.com with SMTP id h10so22610576wrb.1
        for <linux-media@vger.kernel.org>; Tue, 11 Jan 2022 04:50:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=2hVfjk6Ds3Q/9NOybYedsIavjEctt501pPYWOlmfyBc=;
        b=GasET0YrbihBZMU63HFqb+bazGntYPxEZOCs+912DvIbdCnDztspJaR1/D+s5crrjj
         mdFTR/UnglpC9WF6ufGHIy/ZE5yQ+MkfPC0Bv3VhddPPUf8JMh+IVJsaXAOH2aBSlsO8
         Vqlqo65/SNGTBnK3+8Y+0G6OjMaCM0pUQ9CntcqeCKFj/5qWwoJVQMfPZK1hHckr8MDA
         BcKOID1lqnhHRSRJlPmOLceLYhPqqF/Y6BeSAudslkopg54ZZwXmitoQeC2scOGcrbcF
         ovFRjRk1UqDaJeFKScgVEvB1KrF2ohC7iikHz7LYXqGEAAXyUI15EAAhVvlB7YkrY0jF
         0FsA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=2hVfjk6Ds3Q/9NOybYedsIavjEctt501pPYWOlmfyBc=;
        b=5i5IMZfpab7r8bsxb5KPPzlumRKfnqAwvr8tdxoy/4XN8DULuQE43C5quf8KStWUe8
         UzAaTjrb4urs+a89spLcwY8R8hNHF5IB23Rttj6rzpWLW0rhIPgmfdwyUg3+EPEal5MO
         LkbwC+p9NTR+VqHA2f22Za8COFkhhH5CHuWUEZy/df1RSZPtCURDJpY+Okdi/L20qTC6
         X8gYEBJm5Af+1NBIIKWFYvvcn87ecHFhHMVz09PBNXO83n+25CPDMC6eYeDRmFydai0M
         Ju7DiPTrXObwhlE/MpyonbMh9j0tHVzTMwJK4BaY7Wwt7rqFRqxNBukSGwbw7KlxweQm
         Jqkg==
X-Gm-Message-State: AOAM533tUlCbPEy1L69CTC4C32BLEJug5VY+p8toRdEXBLe7R3AyUZyF
        yPce1WAHum2Avi5cogqoU6d8zw==
X-Google-Smtp-Source: ABdhPJy5TGEEcqAW4NLayEsclSGBFc2BqlXLw+DhFdMtQvR/kke/iQl9ggJEpY2ZwlOrGVkzrJoS+Q==
X-Received: by 2002:a5d:64c3:: with SMTP id f3mr3663386wri.155.1641905411869;
        Tue, 11 Jan 2022 04:50:11 -0800 (PST)
Received: from sagittarius-a.chello.ie (188-141-3-169.dynamic.upc.ie. [188.141.3.169])
        by smtp.gmail.com with ESMTPSA id bg19sm1915252wmb.47.2022.01.11.04.50.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 11 Jan 2022 04:50:11 -0800 (PST)
From:   Bryan O'Donoghue <bryan.odonoghue@linaro.org>
To:     linux-arm-msm@vger.kernel.org, linux-media@vger.kernel.org,
        mchehab@kernel.org, hverkuil@xs4all.nl, robert.foss@linaro.org
Cc:     jonathan@marek.ca, andrey.konovalov@linaro.org,
        todor.too@gmail.com, agross@kernel.org, bjorn.andersson@linaro.org,
        jgrahsl@snap.com, hfink@snap.com, vladimir.zapolskiy@linaro.org,
        dmitry.baryshkov@linaro.org, bryan.odonoghue@linaro.org
Subject: [PATCH v3 8/8] media: camss: Point sm8250 at the correct vdda regulators
Date:   Tue, 11 Jan 2022 12:52:12 +0000
Message-Id: <20220111125212.2343184-9-bryan.odonoghue@linaro.org>
X-Mailer: git-send-email 2.33.0
In-Reply-To: <20220111125212.2343184-1-bryan.odonoghue@linaro.org>
References: <20220111125212.2343184-1-bryan.odonoghue@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Reviewing the RB5 schematic its clear that we have missed out on defining
both of the power-rails associated with the CSI PHY.

Other PHYs such as the UFS, PCIe and USB connect to these rails and define
each regulator individually.

This means if we were to switch off the other various PHYs which enable
these rails, the CAMSS would not appropriately power-on the CSI PHY.

Reviewed-by: Robert Foss <robert.foss@linaro.org>
Signed-off-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
---
 drivers/media/platform/qcom/camss/camss.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/drivers/media/platform/qcom/camss/camss.c b/drivers/media/platform/qcom/camss/camss.c
index 859b397912cc8..a2f97311f7606 100644
--- a/drivers/media/platform/qcom/camss/camss.c
+++ b/drivers/media/platform/qcom/camss/camss.c
@@ -723,7 +723,7 @@ static const struct resources csiphy_res_8250[] = {
 static const struct resources csid_res_8250[] = {
 	/* CSID0 */
 	{
-		.regulators = { NULL },
+		.regulators = { "vdda-phy", "vdda-pll" },
 		.clock = { "vfe0_csid", "vfe0_cphy_rx", "vfe0", "vfe0_areg", "vfe0_ahb" },
 		.clock_rate = { { 400000000 },
 				{ 400000000 },
@@ -735,7 +735,7 @@ static const struct resources csid_res_8250[] = {
 	},
 	/* CSID1 */
 	{
-		.regulators = { NULL },
+		.regulators = { "vdda-phy", "vdda-pll" },
 		.clock = { "vfe1_csid", "vfe1_cphy_rx", "vfe1", "vfe1_areg", "vfe1_ahb" },
 		.clock_rate = { { 400000000 },
 				{ 400000000 },
@@ -747,7 +747,7 @@ static const struct resources csid_res_8250[] = {
 	},
 	/* CSID2 */
 	{
-		.regulators = { NULL },
+		.regulators = { "vdda-phy", "vdda-pll" },
 		.clock = { "vfe_lite_csid", "vfe_lite_cphy_rx", "vfe_lite",  "vfe_lite_ahb" },
 		.clock_rate = { { 400000000 },
 				{ 400000000 },
@@ -758,7 +758,7 @@ static const struct resources csid_res_8250[] = {
 	},
 	/* CSID3 */
 	{
-		.regulators = { NULL },
+		.regulators = { "vdda-phy", "vdda-pll" },
 		.clock = { "vfe_lite_csid", "vfe_lite_cphy_rx", "vfe_lite",  "vfe_lite_ahb" },
 		.clock_rate = { { 400000000 },
 				{ 400000000 },
-- 
2.33.0

