Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 33A1A47CA5E
	for <lists+linux-media@lfdr.de>; Wed, 22 Dec 2021 01:36:02 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S239846AbhLVAgA (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 21 Dec 2021 19:36:00 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44418 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S239736AbhLVAf7 (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 21 Dec 2021 19:35:59 -0500
Received: from mail-wm1-x32d.google.com (mail-wm1-x32d.google.com [IPv6:2a00:1450:4864:20::32d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4F8B9C061574
        for <linux-media@vger.kernel.org>; Tue, 21 Dec 2021 16:35:59 -0800 (PST)
Received: by mail-wm1-x32d.google.com with SMTP id l4so485036wmq.3
        for <linux-media@vger.kernel.org>; Tue, 21 Dec 2021 16:35:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=ZcMjdQkiVJ7cNLB1yHDfiaYLmc+S+ohuC3EPTWpGpPI=;
        b=uGLYwEHUGWL3hJKDRTmqALg8GjuUFchbwJOaaZpqZV1WTCi85OUq9A6iONJqqKv9Bf
         HVninYUseLQRjSBACXt82+okddgEi71NVJ5mhYKcV7NANy1SVxhcHfeMGFtjtJnr0Rxe
         GDv7oGYO+qKY3LLr+dWYzu/1sWj9gozfSuOgpg0rsMtlkQyCg0Sp+P/egiPRP7MD6DzY
         JHh9WeclZOXJ0op/hz1D3LcJtl2zwHz6Db94D5GEpkZ4jdAwgD04an+sXH8DUTdnqEh0
         ad2y7kqW8bPHp2m2IaXnAC1E5MB9lH9yYMCOUWZ7cgbDJt+qyj2nsg92Wungq11XNu/W
         v1Ag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=ZcMjdQkiVJ7cNLB1yHDfiaYLmc+S+ohuC3EPTWpGpPI=;
        b=REos3t5csVoAw0FrVw9uqKvmJpKl5unmi1Wi7LFAu+N0k5Cpao4ISfsqeCjDsKeWy0
         MjraHS/pjAiYMPm0FBBwydMiUEzXJ6N/uO24UJfNEfjY2yimfxXZEuVaCMM8eX1DRtXu
         UiAXCFV2/xWyP1nIlEsuwaQIM0XUoD9ZhPhHwSZKcx6kALzXgF23HnMyk5KXD6m/JXzx
         qyRQs/9I+HEGwjKK2l7qwY03Is944AZQgT4fIotLIUDuM34OB3TRfXBtLhgFa5m3sVw6
         sTcRzCcEuVAtpirRgd3pFzexvxU6WpNTOWg4a3qBVr+7vseqDoDb+/Mcx1XeLpboG3P2
         BArA==
X-Gm-Message-State: AOAM533cuBl3O+SaDTDHKZgdmqpVRVhEoE9i3axaC9jxRTARJ5ApjtVW
        2tC6ZxQTpSyMIQA9y6Qi4IbZwtxC/CDW7Q==
X-Google-Smtp-Source: ABdhPJwbaGQpNGFvenUhVv+jd8ZLoY1uREh2zVL6M1OQGYss/jpOf/1GnCYYVSSUt8b8jx4j/hb8Ow==
X-Received: by 2002:a7b:c101:: with SMTP id w1mr412682wmi.149.1640133357926;
        Tue, 21 Dec 2021 16:35:57 -0800 (PST)
Received: from sagittarius-a.chello.ie (188-141-3-169.dynamic.upc.ie. [188.141.3.169])
        by smtp.gmail.com with ESMTPSA id n7sm282825wms.45.2021.12.21.16.35.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 21 Dec 2021 16:35:57 -0800 (PST)
From:   Bryan O'Donoghue <bryan.odonoghue@linaro.org>
To:     linux-arm-msm@vger.kernel.org, linux-media@vger.kernel.org,
        mchehab@kernel.org, hverkuil@xs4all.nl, robert.foss@linaro.org
Cc:     jonathan@marek.ca, andrey.konovalov@linaro.org,
        todor.too@gmail.com, agross@kernel.org, bjorn.andersson@linaro.org,
        jgrahsl@snap.com, hfink@snap.com, vladimir.zapolskiy@linaro.org,
        dmitry.baryshkov@linaro.org, bryan.odonoghue@linaro.org
Subject: [PATCH v3 11/19] media: camss: remove vdda-csiN from sdm845 resources
Date:   Wed, 22 Dec 2021 00:37:43 +0000
Message-Id: <20211222003751.2461466-12-bryan.odonoghue@linaro.org>
X-Mailer: git-send-email 2.33.0
In-Reply-To: <20211222003751.2461466-1-bryan.odonoghue@linaro.org>
References: <20211222003751.2461466-1-bryan.odonoghue@linaro.org>
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
Tested-by: Julian Grahsl <jgrahsl@snap.com>
Tested-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Signed-off-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
---
 drivers/media/platform/qcom/camss/camss.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/media/platform/qcom/camss/camss.c b/drivers/media/platform/qcom/camss/camss.c
index be091c50a3c0c..71c6109b05260 100644
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

