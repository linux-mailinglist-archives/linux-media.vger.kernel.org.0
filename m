Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 438102DD7AE
	for <lists+linux-media@lfdr.de>; Thu, 17 Dec 2020 19:15:14 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730152AbgLQSL2 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 17 Dec 2020 13:11:28 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42074 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1730869AbgLQSJJ (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 17 Dec 2020 13:09:09 -0500
Received: from mail-lf1-x130.google.com (mail-lf1-x130.google.com [IPv6:2a00:1450:4864:20::130])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2AA09C06138C;
        Thu, 17 Dec 2020 10:08:03 -0800 (PST)
Received: by mail-lf1-x130.google.com with SMTP id y19so59731827lfa.13;
        Thu, 17 Dec 2020 10:08:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=8m4pPEAjUTB+XLxB8Q0FiZSpVZH7FkAsOtVYHU/qlmU=;
        b=M/P4YFEmOmA7dBW3pyL3/h3IvXTD6Uw3VvYBbvCl0IeAwQVfaH0z5SlAicSGEGKVrO
         PmYy2/1eDCaRKhMT1M1squT81Rew4AWs7Wm+QRca1KosrO7Ve9owlVqkmnQoHdTDB+RK
         iyhNgZCusZ3HV9jfoK8VnrnyPDwrxP9L+F5q4WvskKX7dLpwhwV3jmtRxbM3UBOg25Fx
         1vaNyP16U/jwAtLyZ3bfO2XHZqH61jzEJsge/vqE3c8/3bxRllKdwBoder/jXpPkQXLL
         0ytz1nxtKOoHENRiye+Rg9grNeZqq+H/c8wPoH6d7GrIOudLsuDhMENft08UoQTbkggS
         MwDg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=8m4pPEAjUTB+XLxB8Q0FiZSpVZH7FkAsOtVYHU/qlmU=;
        b=OtukfozZEjm0x6jeyAEgsQNi+rjaBIyzd3bIYkXlRXxSYqE3vTdDXbEgnnLl0oZBvf
         xz8ISvfKo/75HFpUzeWv189305nFE/f+KKWGdkvWVpcBTbzccm2uBZHwaqhJy+5pqV3b
         iL1U72TVJrJCcj9W7J5vXYsyknjTxlQkSZoKm/KZdcfxgSTC0NWcssCJasVLrGIwk0Xc
         l+NVmsQ4GcIV16mIxGgs5B7UW/u6GYalfPU0USKhGSjRT5PgBuEPqGDbtZFOxycUvGGE
         jdsOQByeo/zEUUFHsIc6uN2fJPv0bRM32DaASZ29664bQUe4ophglj31p5D7/sI/RoKQ
         T+DQ==
X-Gm-Message-State: AOAM532f0z5ol8qvzkATi3EBmXNZGa8pUXlj23fdNMXASQnv+cd7WSmd
        u9+HwUtdGoR2NKQpjuqDxAY=
X-Google-Smtp-Source: ABdhPJwlFjyxr8NFhrflzRw3CbYaZILp8i9Zi8gDSRSCmi/RtwkwrCtk+vx2Ky5r0OD2SP3QX43g2A==
X-Received: by 2002:a2e:9913:: with SMTP id v19mr194762lji.209.1608228481635;
        Thu, 17 Dec 2020 10:08:01 -0800 (PST)
Received: from localhost.localdomain (109-252-192-57.dynamic.spd-mgts.ru. [109.252.192.57])
        by smtp.gmail.com with ESMTPSA id u5sm655596lff.78.2020.12.17.10.08.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 17 Dec 2020 10:08:01 -0800 (PST)
From:   Dmitry Osipenko <digetx@gmail.com>
To:     Thierry Reding <thierry.reding@gmail.com>,
        Jonathan Hunter <jonathanh@nvidia.com>,
        Mark Brown <broonie@kernel.org>,
        Liam Girdwood <lgirdwood@gmail.com>,
        Ulf Hansson <ulf.hansson@linaro.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Peter Geis <pgwipeout@gmail.com>,
        Nicolas Chauvet <kwizart@gmail.com>,
        Krzysztof Kozlowski <krzk@kernel.org>,
        "Rafael J. Wysocki" <rjw@rjwysocki.net>,
        Kevin Hilman <khilman@kernel.org>,
        Peter De Schrijver <pdeschrijver@nvidia.com>,
        Viresh Kumar <vireshk@kernel.org>,
        Stephen Boyd <sboyd@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>
Cc:     devel@driverdev.osuosl.org, linux-kernel@vger.kernel.org,
        devicetree@vger.kernel.org, dri-devel@lists.freedesktop.org,
        linux-media@vger.kernel.org, linux-tegra@vger.kernel.org,
        linux-clk@vger.kernel.org
Subject: [PATCH v2 36/48] drm/tegra: gr2d: Correct swapped device-tree compatibles
Date:   Thu, 17 Dec 2020 21:06:26 +0300
Message-Id: <20201217180638.22748-37-digetx@gmail.com>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20201217180638.22748-1-digetx@gmail.com>
References: <20201217180638.22748-1-digetx@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

The device-tree compatibles are swapped in the code, correct them.

Tested-by: Peter Geis <pgwipeout@gmail.com>
Tested-by: Nicolas Chauvet <kwizart@gmail.com>
Signed-off-by: Dmitry Osipenko <digetx@gmail.com>
---
 drivers/gpu/drm/tegra/gr2d.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/tegra/gr2d.c b/drivers/gpu/drm/tegra/gr2d.c
index 1a0d3ba6e525..f30aa86e4c9f 100644
--- a/drivers/gpu/drm/tegra/gr2d.c
+++ b/drivers/gpu/drm/tegra/gr2d.c
@@ -162,8 +162,8 @@ static const struct gr2d_soc tegra30_gr2d_soc = {
 };
 
 static const struct of_device_id gr2d_match[] = {
-	{ .compatible = "nvidia,tegra30-gr2d", .data = &tegra20_gr2d_soc },
-	{ .compatible = "nvidia,tegra20-gr2d", .data = &tegra30_gr2d_soc },
+	{ .compatible = "nvidia,tegra30-gr2d", .data = &tegra30_gr2d_soc },
+	{ .compatible = "nvidia,tegra20-gr2d", .data = &tegra20_gr2d_soc },
 	{ },
 };
 MODULE_DEVICE_TABLE(of, gr2d_match);
-- 
2.29.2

