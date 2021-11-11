Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A66F444D9E9
	for <lists+linux-media@lfdr.de>; Thu, 11 Nov 2021 17:09:01 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234163AbhKKQLo (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 11 Nov 2021 11:11:44 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51298 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234129AbhKKQLn (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 11 Nov 2021 11:11:43 -0500
Received: from mail-wr1-x42d.google.com (mail-wr1-x42d.google.com [IPv6:2a00:1450:4864:20::42d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 472F6C061766
        for <linux-media@vger.kernel.org>; Thu, 11 Nov 2021 08:08:54 -0800 (PST)
Received: by mail-wr1-x42d.google.com with SMTP id d24so10724385wra.0
        for <linux-media@vger.kernel.org>; Thu, 11 Nov 2021 08:08:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=+O8/xSFUN+536RypK30oIaenAOc8Xl+Jm2zjSJytkY0=;
        b=CoHeTBvMKCWPVY3ImyUhEv6/mCpEEZs+efX5xAMcsrltAYoIbG5SZP6N24nf9P0ig/
         FIB4kFxi7umBCYxwU1KF1jiyMHL2F59PuKpqFnXLknlXxEUF8leYnp6nyG1TVdV9N0SG
         kKqr4/sXm3vAOFKzO75HCtGDU97EZ7EkZ4dLxcL3mlz40k76lfgkItop8/2DmDjUaeg8
         ZN/QGBPfhs1WmMLbadHixtdMbB0a5vO11eAhaNtR8/0n2+rLRDjwdNGkcHBgTDKAMu70
         bEKMd6OP41lEO6NUAEpcHJq9VWkc+sVK4ecUswDFTfn4c3X/zh3nN5QxK3gDDVoc/+6M
         juRA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=+O8/xSFUN+536RypK30oIaenAOc8Xl+Jm2zjSJytkY0=;
        b=DHK4sFHtIjDOItkQN8Q5/n7+7FoxvwmB4SYvfDFflVBYkrnROos97bGMEs3FzVJkAo
         e7T/xO0em+jdBVKFiPhw1XHvzEGusZHOU5NeCDYiVMf6H/mewNtAPDbbxfA33D/iY91T
         j0cbbQJWKcEMxQw6KxDmaP2tBj+mcNqDcjilJEL7pEL2/ZKFxw0NpQsHpmFQ91DBcz87
         rgn+tPTS6rrv8EaNuWMnhUdsk0Tin99+jCDmYq8NtFVpRVmYVbOF/21+Sm/iHp3zTJxH
         OKhBXV/AyrYi4A21JOSM5FanOzBq/Pzt85iLJNXRUIaEw99CGbtQhd8PqUHCuIAYEA+d
         801w==
X-Gm-Message-State: AOAM530f0ohvw6R1PatRWUpsT+IZdmmWfwFFNy8EtWNaVskxXNd0b6KY
        6AP7npXf4DE8X9yrxhzK0MHIlw==
X-Google-Smtp-Source: ABdhPJxNCMfYEc3WJMjTcyVpOVOrWgJhdrkGSgY418uBSe4IMTF4Grr9tpYRKb1den3h/P+d2kzhPQ==
X-Received: by 2002:a5d:4b45:: with SMTP id w5mr9840982wrs.272.1636646932905;
        Thu, 11 Nov 2021 08:08:52 -0800 (PST)
Received: from sagittarius-a.chello.ie (188-141-3-169.dynamic.upc.ie. [188.141.3.169])
        by smtp.gmail.com with ESMTPSA id x8sm3245558wrw.6.2021.11.11.08.08.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 11 Nov 2021 08:08:52 -0800 (PST)
From:   Bryan O'Donoghue <bryan.odonoghue@linaro.org>
To:     inux-arm-msm@vger.kernel.org, linux-media@vger.kernel.org,
        robert.foss@linaro.org, jonathan@marek.ca
Cc:     andrey.konovalov@linaro.org, todor.too@gmail.com,
        agross@kernel.org, bjorn.andersson@linaro.org, mchehab@kernel.org,
        jgrahsl@snap.com, hfink@snap.com, bryan.odonoghue@linaro.org
Subject: [PATCH 11/18] media: camss: remove vdda-csiN from sdm845 resources
Date:   Thu, 11 Nov 2021 16:10:31 +0000
Message-Id: <20211111161038.3936217-12-bryan.odonoghue@linaro.org>
X-Mailer: git-send-email 2.33.0
In-Reply-To: <20211111161038.3936217-1-bryan.odonoghue@linaro.org>
References: <20211111161038.3936217-1-bryan.odonoghue@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

From: Jonathan Marek <jonathan@marek.ca>

This isn't used and only works because devm_regulator_get() returns a dummy
regulator.

Signed-off-by: Jonathan Marek <jonathan@marek.ca>
Reviewed-by: Robert Foss <robert.foss@linaro.org>
Tested-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Signed-off-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
---
 drivers/media/platform/qcom/camss/camss.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/media/platform/qcom/camss/camss.c b/drivers/media/platform/qcom/camss/camss.c
index be091c50a3c0..71c6109b0526 100644
--- a/drivers/media/platform/qcom/camss/camss.c
+++ b/drivers/media/platform/qcom/camss/camss.c
@@ -542,7 +542,7 @@ static const struct resources csiphy_res_845[] = {
 static const struct resources csid_res_845[] = {
 	/* CSID0 */
 	{
-		.regulator = { "vdda-csi0" },
+		.regulator = { NULL },
 		.clock = { "cpas_ahb", "cphy_rx_src", "slow_ahb_src",
 				"soc_ahb", "vfe0", "vfe0_src",
 				"vfe0_cphy_rx", "csi0",
@@ -562,7 +562,7 @@ static const struct resources csid_res_845[] = {
 
 	/* CSID1 */
 	{
-		.regulator = { "vdda-csi1" },
+		.regulator = { NULL },
 		.clock = { "cpas_ahb", "cphy_rx_src", "slow_ahb_src",
 				"soc_ahb", "vfe1", "vfe1_src",
 				"vfe1_cphy_rx", "csi1",
@@ -582,7 +582,7 @@ static const struct resources csid_res_845[] = {
 
 	/* CSID2 */
 	{
-		.regulator = { "vdda-csi2" },
+		.regulator = { NULL },
 		.clock = { "cpas_ahb", "cphy_rx_src", "slow_ahb_src",
 				"soc_ahb", "vfe_lite", "vfe_lite_src",
 				"vfe_lite_cphy_rx", "csi2",
-- 
2.33.0

