Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 9A4EF2DD7C5
	for <lists+linux-media@lfdr.de>; Thu, 17 Dec 2020 19:15:25 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730256AbgLQSMa (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 17 Dec 2020 13:12:30 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41998 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1730362AbgLQSI5 (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 17 Dec 2020 13:08:57 -0500
Received: from mail-lf1-x12d.google.com (mail-lf1-x12d.google.com [IPv6:2a00:1450:4864:20::12d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4F7B8C0617A7;
        Thu, 17 Dec 2020 10:07:50 -0800 (PST)
Received: by mail-lf1-x12d.google.com with SMTP id o17so56901752lfg.4;
        Thu, 17 Dec 2020 10:07:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=6bihTvUOG89oM9Y/xPaskNMPx8lkVh3OwDTHQ+rUz0Q=;
        b=YgQsVYInkk2m03hroKiBAdfDFB0PzOxzZdQWbW80OhGLnIy3SbqjhUVrhoSZeXa/0W
         QptR34QOdICKwEMJUmDxpjneCiq75Y7dTMq7ocCew51i7k6af4lsmH5StFCUi9OTDhVb
         fkffM7TvBqgMrqtPjxPVzHIrvwZiJjnMgj7xb07gyClRUZltKNMvyRF6okcKk1aStAZd
         mp728vEPg8JQCyoih6cV4ja0h8WnBc1s6FIBhCFwdaw3v0fMvuWj2P6nkduHjFPSOjQS
         keUpNhEJqrXcP7lE7tFFikb8lcCmKC63UC7B+C+1vO13XTwgbK+khXS51cmtHSOxZQKa
         Bzbw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=6bihTvUOG89oM9Y/xPaskNMPx8lkVh3OwDTHQ+rUz0Q=;
        b=di3oLX7dDgGVCI5lsfOBXq10DP5clK2XOB6EjRflxBPDSRffBPqf2Nu6bG3wyHtnsk
         apuxOhVVErbOrrbOUqxrm3V1vhWOAfRvTazzFbsL6k90eBaWrV08T5ai5XzWN/KqDEfu
         K47dcx7C5XA1bIoRdsNUM1GsL7ISMktlaG+X9WmMMbp3dXewO/wfv/0JsbipN+Gbk9cc
         xFgF/bGMqjm0qfKiGpADb/XvinuTQbQu+PQd5BJ9sXfLTi6ffTE/gLuKuulYGXZtKIdC
         jXIx3djUNM4NV64dGz7bxy5EUtcK9/oAXTa6UHCps58xfJUoZarSNzvCOp0NK6350ZTq
         7eng==
X-Gm-Message-State: AOAM530LY0pQlcEdt7lPKKuapRBdLEdWe0XtlcVtp2Snt0mQTSGtXj6C
        xA36ZyQfDoxQC8zov4ZYE9SprQ3Gp9w=
X-Google-Smtp-Source: ABdhPJzce1teuxCCTBwGEaaplQ9RyWEJB7D0DJvqSLoeEK+KGIZsCfWwh4vgsDqV4p/wJQUKuj+Jzg==
X-Received: by 2002:ac2:5547:: with SMTP id l7mr7724553lfk.313.1608228468872;
        Thu, 17 Dec 2020 10:07:48 -0800 (PST)
Received: from localhost.localdomain (109-252-192-57.dynamic.spd-mgts.ru. [109.252.192.57])
        by smtp.gmail.com with ESMTPSA id u5sm655596lff.78.2020.12.17.10.07.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 17 Dec 2020 10:07:48 -0800 (PST)
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
Subject: [PATCH v2 25/48] soc/tegra: pmc: Print out domain name when reset fails to acquire
Date:   Thu, 17 Dec 2020 21:06:15 +0300
Message-Id: <20201217180638.22748-26-digetx@gmail.com>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20201217180638.22748-1-digetx@gmail.com>
References: <20201217180638.22748-1-digetx@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Print out domain name when reset fails to acquire for debugging purposes
and to make formatting of GENPD errors consistent in the driver.

Signed-off-by: Dmitry Osipenko <digetx@gmail.com>
---
 drivers/soc/tegra/pmc.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/soc/tegra/pmc.c b/drivers/soc/tegra/pmc.c
index 8edcd5b319f6..4f96dc7745c4 100644
--- a/drivers/soc/tegra/pmc.c
+++ b/drivers/soc/tegra/pmc.c
@@ -821,7 +821,8 @@ static int tegra_genpd_power_off(struct generic_pm_domain *domain)
 
 	err = reset_control_acquire(pg->reset);
 	if (err < 0) {
-		pr_err("failed to acquire resets: %d\n", err);
+		dev_err(dev, "failed to acquire resets for PM domain %s: %d\n",
+			pg->genpd.name, err);
 		return err;
 	}
 
-- 
2.29.2

