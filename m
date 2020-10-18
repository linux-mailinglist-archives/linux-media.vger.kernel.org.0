Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 75588291780
	for <lists+linux-media@lfdr.de>; Sun, 18 Oct 2020 14:54:05 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726794AbgJRMxO (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sun, 18 Oct 2020 08:53:14 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57982 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726709AbgJRMws (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Sun, 18 Oct 2020 08:52:48 -0400
Received: from mail-wm1-x343.google.com (mail-wm1-x343.google.com [IPv6:2a00:1450:4864:20::343])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 66821C0613D3;
        Sun, 18 Oct 2020 05:52:48 -0700 (PDT)
Received: by mail-wm1-x343.google.com with SMTP id d81so7706713wmc.1;
        Sun, 18 Oct 2020 05:52:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=N7xv68tWBewz/GeA48bq8PQRHwqrfz4hriEOmLuQ28Y=;
        b=mugo8nze+fjR6Wx/dWsPwWxXnGP/l5l1LWq31lWFHS2kLRgbe+nT5/lhIJAeI2dikl
         1KOtLx8BnSZN6txnQ/eTmDOAhlRmsdCfj7XyS4DYyZRSZDdQF5wcrs8yY4WJJa+YfwRA
         X018hpLcQWqeP1x0n/l+ew2+YWYrHw+w6sfVY7PMBeFbKN9f3QKl2AJAF/HYS/OylqNk
         xVIRmWmuN4AIjMjP72Rfw7+v3SQroch5tF2JwHGM8toeA0tNSjiglNPE4nk0GaHQb1w7
         Av62wN8XNwr6HnRrk5Rb0eSsfAwfshI28z67IYBwpkMVQpSNc7aBGjiG2fltZMiF93Xi
         QxuQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=N7xv68tWBewz/GeA48bq8PQRHwqrfz4hriEOmLuQ28Y=;
        b=rgLYXXnQP21NK3YpxrP+pKdrhewoFnkIs266ZplGv5mt3GoO+bqSd9DIHcKCHLdWiv
         8h2V5iCiTG2pl5NY4+5oDzoiZd3GqBqOaQxTxLIl3sV4aFlCPrdOWd3LT0Rh5wL5FdxY
         /H6jNyjkGIJHfzITXvelPTXbIFcIJU2+RLrioOFxiSg3XEw+I1cYg6+legt6B/MMcBp9
         HNvLl9VPUmMIq5JhYsgpxtQF9pb0k4fUzVvArZbeISsb3pyrhX4TemS4DEdOyARw0+sY
         yyxW4yeDYOhNDA6eTviD2ILijW2VoyW9zBlBCZS5UQ1Az5nfMX3XHqJb2oE1YNrmPFWt
         CVoA==
X-Gm-Message-State: AOAM530zg5OQhJQKYVSa3aMt9KCahdUlQxliDifHneODXmD4+9hwSYyI
        a3ZItYxlJpznGn7CEmrkFgrX31MjwIw8lZee
X-Google-Smtp-Source: ABdhPJxpHbBhE0qZR2xNZ1nASrvUppNtEOwODRkka8Om+C9N9qGVwHlQeKGjsYaIKq2FhYoZdOvQmg==
X-Received: by 2002:a7b:cc89:: with SMTP id p9mr13452008wma.4.1603025567080;
        Sun, 18 Oct 2020 05:52:47 -0700 (PDT)
Received: from IcarusMOD.eternityproject.eu ([2.237.20.237])
        by smtp.gmail.com with ESMTPSA id u2sm11940158wme.1.2020.10.18.05.52.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 18 Oct 2020 05:52:46 -0700 (PDT)
From:   kholk11@gmail.com
To:     todor.too@gmail.com
Cc:     agross@kernel.org, bjorn.andersson@linaro.org, mchehab@kernel.org,
        robh+dt@kernel.org, marijns95@gmail.com, konradybcio@gmail.com,
        martin.botka1@gmail.com, linux-arm-msm@vger.kernel.org,
        linux-media@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        AngeloGioacchino Del Regno <kholk11@gmail.com>
Subject: [PATCH 6/6] media: camss: csiphy: Set rate on csiX_phy clock on SDM630/660
Date:   Sun, 18 Oct 2020 14:52:37 +0200
Message-Id: <20201018125237.16717-7-kholk11@gmail.com>
X-Mailer: git-send-email 2.28.0
In-Reply-To: <20201018125237.16717-1-kholk11@gmail.com>
References: <20201018125237.16717-1-kholk11@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

From: AngeloGioacchino Del Regno <kholk11@gmail.com>

The SDM630/660 SoCs (and variants) have another clock source
for the PHY, which must be set to a rate that's equal or
greater than the CSI PHY timer clock: failing to do this
will produce PHY overflows when trying to get a stream from
a very high bandwidth camera sensor and outputting no frame
or a partial one.

Since I haven't found any usecase in which the csiX_phy
clock needs to be higher than the csiXphy_timer, let's just
set the same rate on both, which seems to work just perfect.

Signed-off-by: AngeloGioacchino Del Regno <kholk11@gmail.com>
---
 .../media/platform/qcom/camss/camss-csiphy.c  | 22 ++++++++++++++++---
 .../media/platform/qcom/camss/camss-csiphy.h  |  1 +
 2 files changed, 20 insertions(+), 3 deletions(-)

diff --git a/drivers/media/platform/qcom/camss/camss-csiphy.c b/drivers/media/platform/qcom/camss/camss-csiphy.c
index c00f25aac21b..a5d717d022a5 100644
--- a/drivers/media/platform/qcom/camss/camss-csiphy.c
+++ b/drivers/media/platform/qcom/camss/camss-csiphy.c
@@ -113,9 +113,7 @@ static int csiphy_set_clock_rates(struct csiphy_device *csiphy)
 	for (i = 0; i < csiphy->nclocks; i++) {
 		struct camss_clock *clock = &csiphy->clock[i];
 
-		if (!strcmp(clock->name, "csiphy0_timer") ||
-		    !strcmp(clock->name, "csiphy1_timer") ||
-		    !strcmp(clock->name, "csiphy2_timer")) {
+		if (csiphy->rate_set[i]) {
 			u8 bpp = csiphy_get_bpp(csiphy->formats,
 					csiphy->nformats,
 					csiphy->fmt[MSM_CSIPHY_PAD_SINK].code);
@@ -611,6 +609,13 @@ int msm_csiphy_subdev_init(struct camss *camss,
 	if (!csiphy->clock)
 		return -ENOMEM;
 
+	csiphy->rate_set = devm_kcalloc(dev,
+					csiphy->nclocks,
+					sizeof(*csiphy->rate_set),
+					GFP_KERNEL);
+	if (!csiphy->rate_set)
+		return -ENOMEM;
+
 	for (i = 0; i < csiphy->nclocks; i++) {
 		struct camss_clock *clock = &csiphy->clock[i];
 
@@ -638,6 +643,17 @@ int msm_csiphy_subdev_init(struct camss *camss,
 
 		for (j = 0; j < clock->nfreqs; j++)
 			clock->freq[j] = res->clock_rate[i][j];
+
+		if (!strcmp(clock->name, "csiphy0_timer") ||
+		    !strcmp(clock->name, "csiphy1_timer") ||
+		    !strcmp(clock->name, "csiphy2_timer"))
+			csiphy->rate_set[i] = true;
+
+		if (camss->version == CAMSS_660 &&
+		    (!strcmp(clock->name, "csi0_phy") ||
+		     !strcmp(clock->name, "csi1_phy") ||
+		     !strcmp(clock->name, "csi2_phy")))
+			csiphy->rate_set[i] = true;
 	}
 
 	return 0;
diff --git a/drivers/media/platform/qcom/camss/camss-csiphy.h b/drivers/media/platform/qcom/camss/camss-csiphy.h
index 376f865ad383..f7967ef836dc 100644
--- a/drivers/media/platform/qcom/camss/camss-csiphy.h
+++ b/drivers/media/platform/qcom/camss/camss-csiphy.h
@@ -66,6 +66,7 @@ struct csiphy_device {
 	u32 irq;
 	char irq_name[30];
 	struct camss_clock *clock;
+	bool *rate_set;
 	int nclocks;
 	u32 timer_clk_rate;
 	struct csiphy_config cfg;
-- 
2.28.0

