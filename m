Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id EDED42DD6E1
	for <lists+linux-media@lfdr.de>; Thu, 17 Dec 2020 19:08:16 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729589AbgLQSIF (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 17 Dec 2020 13:08:05 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41888 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728081AbgLQSIE (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 17 Dec 2020 13:08:04 -0500
Received: from mail-lf1-x130.google.com (mail-lf1-x130.google.com [IPv6:2a00:1450:4864:20::130])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B8266C061282;
        Thu, 17 Dec 2020 10:07:23 -0800 (PST)
Received: by mail-lf1-x130.google.com with SMTP id m25so59777377lfc.11;
        Thu, 17 Dec 2020 10:07:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=wRLKIZbWYzVgD4/h7Q5pP/dMfh/6wK4T7bMtKrKWFYs=;
        b=nof46WJOEl3Od1rTO/2BYq6/+zk+zJ/AGmoG6erIC0+tgB/oIvdBZAktAlSvQoEZb/
         U6iFxEOBIugW299jwIFrWQ6bsT+VhSHlPUZ5crYO8SLL7E1ykhQSbvIOGz95lEK1CD1l
         xurdMXdFJ5bUbCKqPxQGL7MSkYrWUwxbVJS+pOaZ6U3PnQamubXJPaPBtEvoLE4NlBzS
         h6H+Hw6LLV7UvSbjkYoDkkk0kKwliK4ss66ReUrsUlErK+ZcCXIseijPZVZu6jr9Azfu
         2zvdUbpZW4E4SSI1d19fss7CvalcS3mCXXdnQe9Z374JJpshKOx9EGWBuFbOaGLwTIwv
         xBFg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=wRLKIZbWYzVgD4/h7Q5pP/dMfh/6wK4T7bMtKrKWFYs=;
        b=poafv4JlTrf6bbaHPgd9iSL/tHWr98QP2KMw/dsodnzfhr1jAOLFY29AbA++6m5I2C
         ivVBbpTmkdV25gYy+4RVQahdMmx0OLlGYhnooBNVTu/v4JUJ9vnMI6dBXGTdtkrN7jeA
         tN20p2IuLfNyqZcojNu940BCmfPADFy3tZjUYq6Rg0oOIYXKJX+Ps0Yuw9CDmZOLGDBB
         pQn3iHYArvZ/wqEYdf4S6m+sYEmuWk3aBKwCVWktlxGhqSecH+8hlOth0YP0uolJfQ+O
         eRysnebms93RyYHst1atrBozdHa4RomYMS0Urp5qB7qfz7JcwJ13PYj5WwSTvQ+IjfNT
         3Mog==
X-Gm-Message-State: AOAM531BjCIrbjN0X4WiODXI0nmKZOMvrAkVZXAMisHjpTq+RqcESaw4
        H84FpD8lOjCR+j5tLZXkFfA=
X-Google-Smtp-Source: ABdhPJydLEQpauRBVKAwEa9RLHoou8ZxWlTRtLTcNVXWexn3xCJmbfFa9KYDYb9Npu8cupsJwFP+AQ==
X-Received: by 2002:a2e:908:: with SMTP id 8mr240132ljj.52.1608228442259;
        Thu, 17 Dec 2020 10:07:22 -0800 (PST)
Received: from localhost.localdomain (109-252-192-57.dynamic.spd-mgts.ru. [109.252.192.57])
        by smtp.gmail.com with ESMTPSA id u5sm655596lff.78.2020.12.17.10.07.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 17 Dec 2020 10:07:19 -0800 (PST)
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
Subject: [PATCH v2 02/48] dt-bindings: memory: tegra30: emc: Replace core regulator with power domain
Date:   Thu, 17 Dec 2020 21:05:52 +0300
Message-Id: <20201217180638.22748-3-digetx@gmail.com>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20201217180638.22748-1-digetx@gmail.com>
References: <20201217180638.22748-1-digetx@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Power domain fits much better than a voltage regulator in regards to
a proper hardware description and from a software perspective as well.
Hence replace the core regulator with the power domain. Note that this
doesn't affect any existing DTBs because we haven't started to use the
regulator yet, and thus, it's okay to change it.

Signed-off-by: Dmitry Osipenko <digetx@gmail.com>
---
 .../bindings/memory-controllers/nvidia,tegra30-emc.yaml     | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/Documentation/devicetree/bindings/memory-controllers/nvidia,tegra30-emc.yaml b/Documentation/devicetree/bindings/memory-controllers/nvidia,tegra30-emc.yaml
index 0a2e2c0d0fdd..7b4af9169b0b 100644
--- a/Documentation/devicetree/bindings/memory-controllers/nvidia,tegra30-emc.yaml
+++ b/Documentation/devicetree/bindings/memory-controllers/nvidia,tegra30-emc.yaml
@@ -39,9 +39,9 @@ properties:
     description:
       Phandle of the Memory Controller node.
 
-  core-supply:
+  power-domains:
     description:
-      Phandle of voltage regulator of the SoC "core" power domain.
+      Phandle to the SoC "core" power domain.
 
   operating-points-v2:
     description:
@@ -241,7 +241,7 @@ examples:
 
         nvidia,memory-controller = <&mc>;
         operating-points-v2 = <&dvfs_opp_table>;
-        core-supply = <&vdd_core>;
+        power-domains = <&domain>;
 
         #interconnect-cells = <0>;
 
-- 
2.29.2

