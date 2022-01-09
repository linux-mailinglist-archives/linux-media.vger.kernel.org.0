Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 4602E488778
	for <lists+linux-media@lfdr.de>; Sun,  9 Jan 2022 03:47:15 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235122AbiAICrO (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sat, 8 Jan 2022 21:47:14 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42192 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235119AbiAICrL (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Sat, 8 Jan 2022 21:47:11 -0500
Received: from mail-wr1-x42a.google.com (mail-wr1-x42a.google.com [IPv6:2a00:1450:4864:20::42a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 48E8DC06173F
        for <linux-media@vger.kernel.org>; Sat,  8 Jan 2022 18:47:11 -0800 (PST)
Received: by mail-wr1-x42a.google.com with SMTP id q8so19433551wra.12
        for <linux-media@vger.kernel.org>; Sat, 08 Jan 2022 18:47:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=q6pzBpJsPUyBc32ZE0G76KeXutFs52xl30UBTdS8LR0=;
        b=O+bI3wXZmZ9pVJDVdaJzY6+grGkmTeHICEi1rtCC8ClyzkPJmmI3l58GgUxhwKEaKG
         bWD1y2s1fHEgMLHewkte4gC8XgUB69FMiLvvjfi+zbDIKXfX3Su9yWqQ84RS3OdB9cPP
         cXOnHG/d9lEUqdvPBASqUTWi2+jUC9DsbBHbFHysag06jMtEhuZHJisS0gNcDP7BQDA6
         mFQivYolzrmueYcYyKo9GAiPkCXvs2en7/f1Sex5EP9x9g3EmyjJZNMpY/e7l9CyxkYU
         bzeuah6AFqN21TsOosrTeJXpBaq1fQ0L/B3Ne+lzP75G/LBy817liS7rCEPM35Dk73z/
         OYvQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=q6pzBpJsPUyBc32ZE0G76KeXutFs52xl30UBTdS8LR0=;
        b=PArmSURfGkbPYOJprTtVJbz0iZ43YbgGGSmMOUJ7W3dw7aetlMRtV+6pC9IRMB2XBQ
         38PpXVOIgtUmQ5ctmfWjvozfGD5BoyqNH/LSgAduGfG1qMK7zqr+SR/ex9w4Qfdk/3Bu
         wkxYmbLAL3HiwLVlaPZQzd9JJValbHsuPaemhn1/s/buQ2ey+FRX9eIJktDIHL0nsyvA
         VEIhMY605jgg/rbxdpuk4USE8OX/4TsXCLCyvXkggpa2wo8qCtU0oaL/k97PbhM2oBX+
         j/SNjclA6T+bj2I32Y+s3wqrDv1j6vJYk3V/NF+RE3JNr065HPxHZdVu8DY2R4wIw0Dj
         iFWQ==
X-Gm-Message-State: AOAM533fIoD4LDGNw1g/V7/c9LltJ0MdGytKmquZ6VTmJ4zw+HAHN/i6
        1svU9Xdft1QXxMNuiqs8bln5hA==
X-Google-Smtp-Source: ABdhPJxlYagK6+ZmEp1LAvshB+t0LIiES2j7oohSsICpK6XtYO0S4etcGpI/2VrJ79PHqx73s29tew==
X-Received: by 2002:a05:6000:18cd:: with SMTP id w13mr33258890wrq.199.1641696429945;
        Sat, 08 Jan 2022 18:47:09 -0800 (PST)
Received: from sagittarius-a.chello.ie (188-141-3-169.dynamic.upc.ie. [188.141.3.169])
        by smtp.gmail.com with ESMTPSA id l13sm3341748wrs.73.2022.01.08.18.47.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 08 Jan 2022 18:47:09 -0800 (PST)
From:   Bryan O'Donoghue <bryan.odonoghue@linaro.org>
To:     linux-arm-msm@vger.kernel.org, linux-media@vger.kernel.org,
        mchehab@kernel.org, hverkuil@xs4all.nl, robert.foss@linaro.org
Cc:     jonathan@marek.ca, andrey.konovalov@linaro.org,
        todor.too@gmail.com, agross@kernel.org, bjorn.andersson@linaro.org,
        jgrahsl@snap.com, hfink@snap.com, vladimir.zapolskiy@linaro.org,
        dmitry.baryshkov@linaro.org, bryan.odonoghue@linaro.org
Subject: [PATCH v2 8/8] media: camss: Point sm8250 at the correct vdda regulators
Date:   Sun,  9 Jan 2022 02:49:10 +0000
Message-Id: <20220109024910.2041763-9-bryan.odonoghue@linaro.org>
X-Mailer: git-send-email 2.33.0
In-Reply-To: <20220109024910.2041763-1-bryan.odonoghue@linaro.org>
References: <20220109024910.2041763-1-bryan.odonoghue@linaro.org>
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

