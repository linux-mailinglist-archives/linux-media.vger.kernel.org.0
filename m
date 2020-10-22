Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C4CFF2963EB
	for <lists+linux-media@lfdr.de>; Thu, 22 Oct 2020 19:47:34 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S369305AbgJVRr3 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 22 Oct 2020 13:47:29 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35958 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S369293AbgJVRrZ (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 22 Oct 2020 13:47:25 -0400
Received: from mail-wr1-x442.google.com (mail-wr1-x442.google.com [IPv6:2a00:1450:4864:20::442])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 71934C0613CE;
        Thu, 22 Oct 2020 10:47:25 -0700 (PDT)
Received: by mail-wr1-x442.google.com with SMTP id g12so3558795wrp.10;
        Thu, 22 Oct 2020 10:47:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=7YjewDVNXnLPS6j3JMUZb2TiI2kCa5vslud7X2TBnuk=;
        b=FxDIzdm2Q50U+/lMxsxQR7HR+B6zIS5Vw8t85zJUIrHldByK+AU9JA4kTi1u/uuAuq
         pINCjvKGw60tF4r+sYyiEDIMx1mX2RbBWNxkbwuGd3H4JLuvzCvxmRRMDRaQmM2rV2i7
         xpdkXrViPK7TQxuDXs1zaQ2qFrHUgM+DeHAbW9xWfixCmwPH3QGy3cgloUPdN8elPrHj
         QwMmlm4ZsJS17fHxBDJpmXwV1sPZ4y/9d4+0jCCQJ2gIYFnP3bVA9NLGIyPpl+9hrC5+
         yJZONOfFzvXBnvplL+I8SAJAqS0eRaXTh53QiepPP0a7AdmWA5L2pkhwUB2WtB5pFqKb
         ml0A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=7YjewDVNXnLPS6j3JMUZb2TiI2kCa5vslud7X2TBnuk=;
        b=Ez0zYzDbAuiYudwyf4pzEdhy2pj7LzobF1vPlUFSZhA66ww09G1UQFcPM/mxRh+im8
         4FNAWaMBK+DNobPYaaUeqmCDrjX5XWB3tB2zFWH9r8UFh0GAC7DOky+CwCdKfY6IypYq
         2vZcwQriA2nK1ShM0wAfk87kBZ/rG31jdoDFg9gX2xoJ7gpZlpCV9x5wZeFrQJDP0AGC
         wwYnax9wH4JEV1SlTju7jT4TONRhxYH9yBQZey6c4qd7H6uQtMM/jlRZBfLl5Ockx8hP
         5gRsMZ1/khMN/deglcRK+FoV0gKNryrv9D2DpKabOBUjLsp9uTEpcPF/4pAv94UjMM1c
         5Y3A==
X-Gm-Message-State: AOAM532de2dCMPr/v44Eq8fCwZPJApFhMCY4csuM1RzGd5olBhANUGZm
        XOMj7FKn4FZAF8Q9DdNdXIk=
X-Google-Smtp-Source: ABdhPJwSYXFRWSTNYKqurzQ0Sd5ugX7LE8hYit5NxhtsR8Q8bVYdHQa4BKgKh1Xzvwrd591v9BIcJg==
X-Received: by 2002:adf:9793:: with SMTP id s19mr4045177wrb.139.1603388844131;
        Thu, 22 Oct 2020 10:47:24 -0700 (PDT)
Received: from IcarusMOD.eternityproject.eu ([2.237.20.237])
        by smtp.gmail.com with ESMTPSA id u202sm5368355wmu.23.2020.10.22.10.47.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 22 Oct 2020 10:47:23 -0700 (PDT)
From:   kholk11@gmail.com
To:     todor.too@gmail.com
Cc:     agross@kernel.org, bjorn.andersson@linaro.org, mchehab@kernel.org,
        robh+dt@kernel.org, marijns95@gmail.com, konradybcio@gmail.com,
        martin.botka1@gmail.com, linux-arm-msm@vger.kernel.org,
        linux-media@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, robert.foss@linaro.org,
        AngeloGioacchino Del Regno <kholk11@gmail.com>
Subject: [PATCH v2 7/7] media: camss: csiphy: Set rate on csiX_phy clock on SDM630/660
Date:   Thu, 22 Oct 2020 19:47:06 +0200
Message-Id: <20201022174706.8813-8-kholk11@gmail.com>
X-Mailer: git-send-email 2.28.0
In-Reply-To: <20201022174706.8813-1-kholk11@gmail.com>
References: <20201022174706.8813-1-kholk11@gmail.com>
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
Reviewed-by: Robert Foss <robert.foss@linaro.org>
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

