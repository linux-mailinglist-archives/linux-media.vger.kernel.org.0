Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D7F3944DA15
	for <lists+linux-media@lfdr.de>; Thu, 11 Nov 2021 17:14:00 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234200AbhKKQQs (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 11 Nov 2021 11:16:48 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52496 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234185AbhKKQQr (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 11 Nov 2021 11:16:47 -0500
Received: from mail-wr1-x42c.google.com (mail-wr1-x42c.google.com [IPv6:2a00:1450:4864:20::42c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 400C9C061766
        for <linux-media@vger.kernel.org>; Thu, 11 Nov 2021 08:13:58 -0800 (PST)
Received: by mail-wr1-x42c.google.com with SMTP id s13so10691653wrb.3
        for <linux-media@vger.kernel.org>; Thu, 11 Nov 2021 08:13:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=+O8/xSFUN+536RypK30oIaenAOc8Xl+Jm2zjSJytkY0=;
        b=kMiU3YsB30hdj7qHxensgex8vQbWKc62k5OZXHND81O45CObR2EtM1pUqXFse4BH84
         vq6fEXR8SiPwAMtGOwNKXNQe0CLs0TVx4ERqCNCA+9YIP0b1ZsUfj2pQv4s7PzEBWsny
         pYTuI6M3lj86hli43SOY+5TVbLhmntz9VzpQgHdLJ38ayTAkXpMB1wXojP3hP4tS53jA
         5YmUTPYjwHzvgPP5EmeiDuvcg9TRXlQkMyjc0eN5N3hAX6meSXJi452I5dgS/FnzJVpI
         lgN5voiCecoKYAsP8dnfDfjffWLpl/o3/YCducP5OU5edLgn5Oj644GZ0MZIVVpRF5WV
         J5MA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=+O8/xSFUN+536RypK30oIaenAOc8Xl+Jm2zjSJytkY0=;
        b=p6XWOlBaNRImATsDxeGHVCtp7WV05smilgl8XkwrLv7Lia18Ao/Fg18XvdLDQSZLVR
         GJOq4QyPptUjKilIWEbq/jaeOI57vYVtvuEnd+tI58riGk1Hl1wElOee4WJat3uP+wi1
         mGxhzT0XA1pNVC1AiIThr8I6Zo5Yoe1gOuBGeX+7GxrES0zJgu1fsaopmn5gINjBdcIz
         v0QY8pIAwTJwOai1pbW8gkDh6gEr3429vnDSptydLYuqNuw8aU2G/mfmyvYkp4flo9Ai
         cK6/bwJLFwVgL3BN183Pdw7HQk8JLFZtsYh/QPhJFyeOpJK1KTvBglJDeaDhfhUgK/Gi
         /f2w==
X-Gm-Message-State: AOAM532h2wi2Iq7zxGMvpDVRy+2SNhW/0GOhWt/E96F7DNp7tRYsJi9I
        vRaoIYzg1xV6lpHb2Vn4mcdXbQ==
X-Google-Smtp-Source: ABdhPJyjN2o+URtFlgwqfdc6lV7+Syy3qtENoTsuKcLu8l8Akr4XwXv9U7fTQhKbtVE3Dy3ZOhObjw==
X-Received: by 2002:a5d:568c:: with SMTP id f12mr9950780wrv.240.1636647236867;
        Thu, 11 Nov 2021 08:13:56 -0800 (PST)
Received: from sagittarius-a.chello.ie (188-141-3-169.dynamic.upc.ie. [188.141.3.169])
        by smtp.gmail.com with ESMTPSA id o1sm3441451wrn.63.2021.11.11.08.13.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 11 Nov 2021 08:13:56 -0800 (PST)
From:   Bryan O'Donoghue <bryan.odonoghue@linaro.org>
To:     linux-arm-msm@vger.kernel.org, linux-media@vger.kernel.org,
        robert.foss@linaro.org, jonathan@marek.ca
Cc:     andrey.konovalov@linaro.org, todor.too@gmail.com,
        agross@kernel.org, bjorn.andersson@linaro.org, mchehab@kernel.org,
        jgrahsl@snap.com, hfink@snap.com, bryan.odonoghue@linaro.org
Subject: [RESEND PATCH 11/18] media: camss: remove vdda-csiN from sdm845 resources
Date:   Thu, 11 Nov 2021 16:15:35 +0000
Message-Id: <20211111161542.3936425-12-bryan.odonoghue@linaro.org>
X-Mailer: git-send-email 2.33.0
In-Reply-To: <20211111161542.3936425-1-bryan.odonoghue@linaro.org>
References: <20211111161542.3936425-1-bryan.odonoghue@linaro.org>
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

