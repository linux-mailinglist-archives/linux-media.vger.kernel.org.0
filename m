Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C0B5B2DD77F
	for <lists+linux-media@lfdr.de>; Thu, 17 Dec 2020 19:14:51 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731462AbgLQSKO (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 17 Dec 2020 13:10:14 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42130 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726548AbgLQSJZ (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 17 Dec 2020 13:09:25 -0500
Received: from mail-lf1-x12c.google.com (mail-lf1-x12c.google.com [IPv6:2a00:1450:4864:20::12c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E7D6FC0619DF;
        Thu, 17 Dec 2020 10:07:54 -0800 (PST)
Received: by mail-lf1-x12c.google.com with SMTP id o19so34210094lfo.1;
        Thu, 17 Dec 2020 10:07:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=Aa+hChpvs0JDUl0QCouhA8Ook0AiIGpyBFoUGyXOUQI=;
        b=RhneqMMMFpT/rGzIIf7uEiGIehQLF+olyu6ZCNFX+oOHPVy1WdgNHVxT9bn1QlEeo8
         4n1SHThx55TK/bXvX0IGfRJ7GoL37rHD2WNc4lkOGHcBMZgFaWTsQ9+uAXZOE3rZqdlW
         hfAUUX5oiGE3CHjG6mziJsZz3/TzHP2qGv3tDSd1VA2XvrZn95KaGn/ZcVxL0pHAGh2t
         BFZLKfM9Wp2fxoMv38KrZ/YCEFInQqRvmkF2W5ssdGnXmVqNYh1slRuTRPDfy7h9LqfK
         9Ij69AfbaRxeblxSU7zdqyMpXBplESP2BswsvcjWDhIg3J1BrpiApycEtaMy4FtWjgRf
         UY9w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=Aa+hChpvs0JDUl0QCouhA8Ook0AiIGpyBFoUGyXOUQI=;
        b=O2GQeMhEejaKkh9GeCd8kVmJHV+QeGKNZOFrXqSy/LQJI3iaBqTQ/aadKB2p7Fqslm
         yp16vmfQbPU6SMsIk/zzbULfXDSG9bsLIdKFvjV0eyWN4FtYMiejPI+JKWKlC9gZlnVe
         gaKZ5XEqd1DfVTPoZtSunDQB/3s6vXP9L89S4A58eaeFULppHPGS4kQQRpYEeOlmgWkU
         ro8vT8WdNaSFOqtlYYUlfwylsHu0K6+dBmFUpLC2gZuqCM9EB2nfIF9GOwnzBVGnzcdR
         wdlcesr87773XqVocAKJYrcmsvyFQl96k7Uib7chazCWJNa7p7T/lZm5rD74FCJhMFxA
         NIdw==
X-Gm-Message-State: AOAM530nEDra3DWvsdcUW8d3kUVqA5yQI/hVNBzRRSRsr3qiOAlzb9UG
        PeDAfF2YKTlax9bL5/zF/Bg=
X-Google-Smtp-Source: ABdhPJxL85GcfJiXMkymH7isdZq+CnfDmDZN1MReJJCcpfCArlmNTx0/MjgW8Yls8T8+SwJfWzuMqQ==
X-Received: by 2002:a19:5e5b:: with SMTP id z27mr16037203lfi.143.1608228473454;
        Thu, 17 Dec 2020 10:07:53 -0800 (PST)
Received: from localhost.localdomain (109-252-192-57.dynamic.spd-mgts.ru. [109.252.192.57])
        by smtp.gmail.com with ESMTPSA id u5sm655596lff.78.2020.12.17.10.07.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 17 Dec 2020 10:07:52 -0800 (PST)
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
Subject: [PATCH v2 29/48] soc/tegra: pmc: Link domains to the parent Core domain
Date:   Thu, 17 Dec 2020 21:06:19 +0300
Message-Id: <20201217180638.22748-30-digetx@gmail.com>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20201217180638.22748-1-digetx@gmail.com>
References: <20201217180638.22748-1-digetx@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

The Core domain is a parent of PMC power domains, hence PMC domains
should be set up as a sub-domains of the parent (Core) domain if
"power-domains" phandle presents in a device-tree node of PMC domain.

This allows to propagate GENPD performance changes to the parent Core
domain if performance change is applied to PMC domain.

Signed-off-by: Dmitry Osipenko <digetx@gmail.com>
---
 drivers/soc/tegra/pmc.c | 19 +++++++++++++++++++
 1 file changed, 19 insertions(+)

diff --git a/drivers/soc/tegra/pmc.c b/drivers/soc/tegra/pmc.c
index 4f96dc7745c4..1a659d1c06d7 100644
--- a/drivers/soc/tegra/pmc.c
+++ b/drivers/soc/tegra/pmc.c
@@ -1236,6 +1236,7 @@ static int tegra_powergate_add(struct tegra_pmc *pmc, struct device_node *np)
 static int tegra_powergate_init(struct tegra_pmc *pmc,
 				struct device_node *parent)
 {
+	struct of_phandle_args child_args, parent_args;
 	struct device_node *np, *child;
 	int err = 0;
 
@@ -1249,6 +1250,24 @@ static int tegra_powergate_init(struct tegra_pmc *pmc,
 			of_node_put(child);
 			break;
 		}
+
+		if (of_parse_phandle_with_args(child, "power-domains",
+					       "#power-domain-cells",
+					       0, &parent_args))
+			continue;
+
+		child_args.np = child;
+		child_args.args_count = 0;
+
+		err = of_genpd_add_subdomain(&parent_args, &child_args);
+		of_node_put(parent_args.np);
+		if (err) {
+			if (err == -ENOENT)
+				err = -EPROBE_DEFER;
+
+			of_node_put(child);
+			break;
+		}
 	}
 
 	of_node_put(np);
-- 
2.29.2

