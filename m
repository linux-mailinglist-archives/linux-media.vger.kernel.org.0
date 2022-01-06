Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 4FD24486E24
	for <lists+linux-media@lfdr.de>; Fri,  7 Jan 2022 00:53:51 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1343558AbiAFXxu (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 6 Jan 2022 18:53:50 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45026 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S245687AbiAFXxm (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Thu, 6 Jan 2022 18:53:42 -0500
Received: from mail-wr1-x42a.google.com (mail-wr1-x42a.google.com [IPv6:2a00:1450:4864:20::42a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 320F9C0611FF
        for <linux-media@vger.kernel.org>; Thu,  6 Jan 2022 15:53:41 -0800 (PST)
Received: by mail-wr1-x42a.google.com with SMTP id w20so7820008wra.9
        for <linux-media@vger.kernel.org>; Thu, 06 Jan 2022 15:53:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=zbDm820lh/1R1PbuB190FVHw4DIJK+VMDUkanKQM9EE=;
        b=Wxd9AYxtNoH54uR9HIPhb6G3I/Uk4pQ9JLrSQSxPECaZG12JuitteUjLWJU4r0lyMG
         5o9CSl64XRyhb8lQEAT22AQ1jACr/EYMduigI7D0pQWy8H7hPCX8g2cHPrLSIh7kHuU0
         by5/Ks/sSWoVX7pPXg/fQvFb9sZw2c4rXgPTWAXcpoaE4Ixi+7c1KbnGHEVSy/ke8Y3y
         j4m0TRPxgiGOi145LYmF5E/NQKavuRMl+vHeed5/AjxchhzOV4KkXoYTDKZoxT4IqnpI
         eP7jRpMcSr2TxVFCxrYdFWrYTn+tKwaRqY9nZcs6fOwsCKKmWlV836FIf0DybHlfLCki
         oTTQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=zbDm820lh/1R1PbuB190FVHw4DIJK+VMDUkanKQM9EE=;
        b=bLhWWv8fT3QVJtL4rpu+2O5dLzPr+YtnUp1hWNH/DvNAbflCLSwYnpp4BnfjbF3e1N
         Bkn1aqH+NNJdNBzNKtDc4kLWC2xcYx3D2PTGqueHEd4rG2zLA/lozLJyQ475BAP1IdX3
         vcmD4oc+pHJZYoz6PU8vdLCpANcQ4Knf9x5YNQJ7lG3kAoCbT0DFgX736bAEUcSyqCTg
         azxE3/nWrUrva4TlUp5LL+4at7gHzrhLrwy7P2tgGiYFdTF2ABeZYKwjfyxg7UeB8q1k
         /ow6b8KeA97todSBLjvVmCN627QZNcEr5jQdoLZkgpv5Wpcc89OUJ2d2QmTQWJngDhmR
         vMhw==
X-Gm-Message-State: AOAM53293uSe5n/KuwU0hNirgrJZm8Oku2KzW0OJXHfFDw6ZawIhPa2A
        T3pn+AlY44/P5lJK+1Fx7v8Jx5s74N/FGw==
X-Google-Smtp-Source: ABdhPJwxKvFJozRXC/w3qW/s98oTYefv/EmsOBswZrNPNGeLKEzptFAhz78oPiSj+GGeEx8a7hUPCA==
X-Received: by 2002:a5d:5610:: with SMTP id l16mr29866184wrv.418.1641513219863;
        Thu, 06 Jan 2022 15:53:39 -0800 (PST)
Received: from sagittarius-a.chello.ie (188-141-3-169.dynamic.upc.ie. [188.141.3.169])
        by smtp.gmail.com with ESMTPSA id a71sm335893wme.39.2022.01.06.15.53.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 06 Jan 2022 15:53:39 -0800 (PST)
From:   Bryan O'Donoghue <bryan.odonoghue@linaro.org>
To:     linux-arm-msm@vger.kernel.org, linux-media@vger.kernel.org,
        mchehab@kernel.org, hverkuil@xs4all.nl, robert.foss@linaro.org
Cc:     jonathan@marek.ca, andrey.konovalov@linaro.org,
        todor.too@gmail.com, agross@kernel.org, bjorn.andersson@linaro.org,
        jgrahsl@snap.com, hfink@snap.com, vladimir.zapolskiy@linaro.org,
        dmitry.baryshkov@linaro.org, bryan.odonoghue@linaro.org
Subject: [PATCH 7/7] media: camss: Point sm8250 at the correct vdda regulators
Date:   Thu,  6 Jan 2022 23:55:40 +0000
Message-Id: <20220106235540.1567839-8-bryan.odonoghue@linaro.org>
X-Mailer: git-send-email 2.33.0
In-Reply-To: <20220106235540.1567839-1-bryan.odonoghue@linaro.org>
References: <20220106235540.1567839-1-bryan.odonoghue@linaro.org>
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
index 6de257502e88b..412c8ee7c182d 100644
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

