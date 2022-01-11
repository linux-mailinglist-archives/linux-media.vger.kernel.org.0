Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 90CA848ADE2
	for <lists+linux-media@lfdr.de>; Tue, 11 Jan 2022 13:50:15 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S239945AbiAKMuO (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 11 Jan 2022 07:50:14 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33478 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S239919AbiAKMuM (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 11 Jan 2022 07:50:12 -0500
Received: from mail-wm1-x330.google.com (mail-wm1-x330.google.com [IPv6:2a00:1450:4864:20::330])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2BCEDC061756
        for <linux-media@vger.kernel.org>; Tue, 11 Jan 2022 04:50:12 -0800 (PST)
Received: by mail-wm1-x330.google.com with SMTP id c66so10916964wma.5
        for <linux-media@vger.kernel.org>; Tue, 11 Jan 2022 04:50:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=dNqGcUsdmcRhL2qBo94c5F4kwjUDaPqQbHn1/VWcNsk=;
        b=d5zXphNT5LOWG9e+hJq+/JGoZZ59sE58qo6IL/EgqOy3rfSBLeGODBIPf/Jq0LEPDA
         k9rmy9yYeVcA6Rj2VpFo+gGtK/ffUV3tRPNoWnxNnpi+KwvZ6bevcna3w1+yf+9DIf/h
         40mt19aAYUc2DIwxAqzcLayOEbGYi1MxGkiump58a8JcSBcxqkkinlQ87SCwfHmUYl/z
         4Q0EOzcvosWXaT9tVWFwvE84eFf9tip/4C/CF0oe8QsKZ794wolvQRYIDhx6PDSLOK6X
         4sFIa3jKJOSwtbg3b0f7qGp98KFmqBTFH7rY61fto4XRjp0dMCX3zlGSgMo5p5AU71X0
         /0ig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=dNqGcUsdmcRhL2qBo94c5F4kwjUDaPqQbHn1/VWcNsk=;
        b=OyVul1aR3Rln4tlwwKh0FjlsZVoh0+BwxorUB/lfipxhbTp/lIk626V+9qF5IIkZdw
         O6aL6hyIgrIbS9GnXDUuvxKiSGziW5GfSGC/jWPdD9khfE7s2CG7nFTZaDrO5evPLXC9
         TYZavRiKtEVJvbMhOI1BywdqE/UqJbNmxPNtoLsjzL9WxgiUwdisCdHa/f0hIQzXGYvf
         OPMQqyEOQDkzgqR7CWftshvukk/YsVWbWtKlpz42t1JQ9MhMYDgQdXHzlRpxuAMEFBwP
         F2snXDKEQ0CmHuP6BW0TgILlIV0ANLYbHcxpsNPDhdBQP6iwn+Z2TMqI0wsDsL974M2S
         NAKQ==
X-Gm-Message-State: AOAM530eY58P5EKNkwrMk7J854OCcBnX7qYUCHXPlXK1PImPANJy4NQV
        5X8CPs+TdVAYu4XaxSXKa+37mw==
X-Google-Smtp-Source: ABdhPJzhFraG1OX3/MpomQO9humBNE4DNX/SuHyhktCdLAJWC2PN9+oDiamv+ZdcJAk/gc/zyBTQ+Q==
X-Received: by 2002:a05:600c:354c:: with SMTP id i12mr2361486wmq.139.1641905410781;
        Tue, 11 Jan 2022 04:50:10 -0800 (PST)
Received: from sagittarius-a.chello.ie (188-141-3-169.dynamic.upc.ie. [188.141.3.169])
        by smtp.gmail.com with ESMTPSA id bg19sm1915252wmb.47.2022.01.11.04.50.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 11 Jan 2022 04:50:10 -0800 (PST)
From:   Bryan O'Donoghue <bryan.odonoghue@linaro.org>
To:     linux-arm-msm@vger.kernel.org, linux-media@vger.kernel.org,
        mchehab@kernel.org, hverkuil@xs4all.nl, robert.foss@linaro.org
Cc:     jonathan@marek.ca, andrey.konovalov@linaro.org,
        todor.too@gmail.com, agross@kernel.org, bjorn.andersson@linaro.org,
        jgrahsl@snap.com, hfink@snap.com, vladimir.zapolskiy@linaro.org,
        dmitry.baryshkov@linaro.org, bryan.odonoghue@linaro.org
Subject: [PATCH v3 7/8] media: camss: Point sdm845 at the correct vdda regulators
Date:   Tue, 11 Jan 2022 12:52:11 +0000
Message-Id: <20220111125212.2343184-8-bryan.odonoghue@linaro.org>
X-Mailer: git-send-email 2.33.0
In-Reply-To: <20220111125212.2343184-1-bryan.odonoghue@linaro.org>
References: <20220111125212.2343184-1-bryan.odonoghue@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Reviewing the RB3 schematic its clear that we have missed out on defining
one of the power-rails associated with the CSI PHY.

Other PHYs such as the UFS, PCIe and USB connect to these rails and define
each regulator individually.

This means if we were to switch off the other various PHYs which enable
these rails, the CAMSS would not appropriately power-on the CSI PHY.

Reviewed-by: Robert Foss <robert.foss@linaro.org>
Signed-off-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
---
 drivers/media/platform/qcom/camss/camss.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/media/platform/qcom/camss/camss.c b/drivers/media/platform/qcom/camss/camss.c
index dcb37a739c95b..859b397912cc8 100644
--- a/drivers/media/platform/qcom/camss/camss.c
+++ b/drivers/media/platform/qcom/camss/camss.c
@@ -543,7 +543,7 @@ static const struct resources csiphy_res_845[] = {
 static const struct resources csid_res_845[] = {
 	/* CSID0 */
 	{
-		.regulators = { NULL },
+		.regulators = { "vdda-phy", "vdda-pll" },
 		.clock = { "cpas_ahb", "cphy_rx_src", "slow_ahb_src",
 				"soc_ahb", "vfe0", "vfe0_src",
 				"vfe0_cphy_rx", "csi0",
@@ -563,7 +563,7 @@ static const struct resources csid_res_845[] = {
 
 	/* CSID1 */
 	{
-		.regulators = { NULL },
+		.regulators = { "vdda-phy", "vdda-pll" },
 		.clock = { "cpas_ahb", "cphy_rx_src", "slow_ahb_src",
 				"soc_ahb", "vfe1", "vfe1_src",
 				"vfe1_cphy_rx", "csi1",
@@ -583,7 +583,7 @@ static const struct resources csid_res_845[] = {
 
 	/* CSID2 */
 	{
-		.regulators = { NULL },
+		.regulators = { "vdda-phy", "vdda-pll" },
 		.clock = { "cpas_ahb", "cphy_rx_src", "slow_ahb_src",
 				"soc_ahb", "vfe_lite", "vfe_lite_src",
 				"vfe_lite_cphy_rx", "csi2",
-- 
2.33.0

