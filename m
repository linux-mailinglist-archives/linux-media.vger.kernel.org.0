Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 35A422DD75F
	for <lists+linux-media@lfdr.de>; Thu, 17 Dec 2020 19:14:37 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731286AbgLQSJ2 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 17 Dec 2020 13:09:28 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42112 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1731119AbgLQSJW (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 17 Dec 2020 13:09:22 -0500
Received: from mail-lf1-x133.google.com (mail-lf1-x133.google.com [IPv6:2a00:1450:4864:20::133])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BBA84C0619D9;
        Thu, 17 Dec 2020 10:07:45 -0800 (PST)
Received: by mail-lf1-x133.google.com with SMTP id a12so59837505lfl.6;
        Thu, 17 Dec 2020 10:07:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=4FYxQew+p18AO5FBSec7kTxg/87GRcpO76q4A6IgDv4=;
        b=cOKXXBVSpDRg0y9isOFdN9ypZc0EDS0wcBFXXnpHA5gHfe4rMBp0KSj+DDdWOL11DO
         14H+OQC2eE39/MWECC9kqvFurVIqFvJ2WndhK/heNmgpBhaBuetfvjX3bSbDChUGYlOl
         M03g7jnK6aEYOl3VVMYqgb92F5jHXviJ0kadHsCvkB6DjdIkY3a6/yN0ivwTWZMQPNas
         0wbcDxjvzueYloI0q/vTGlIggkOTjoKgB+9h6hdCf1lTJRXhHWJAjOP8NmnXryCCK0tq
         y7aL9Gb5rsb/CvF+4IQm84UqG1pgiogHxaF3WzjOcQgVdkCBNmmODR0H0IjN3ODbgQKH
         YcOA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=4FYxQew+p18AO5FBSec7kTxg/87GRcpO76q4A6IgDv4=;
        b=krr/kRgNcDpPqORYEt3/6UET9Ups7ctNVJseTeiI0CUrf7cbiKYO/r8YYgW9Ybwdp6
         +BLqCoQaQTFojJjGbQJCXuLbkkXS0Q58sVeFl994SAwx5mXcdwblxnh/9AHcROB2rKy2
         ldLpr9pIN228gNec5LGgKl3DoVD3LNZ8OMdwszU1uXyr0wjxDKgJhdQj4eo7n3IKmFQi
         VLWNPWLIuNhJ/mNJXkM1wb5MkRJmInH4tD2miU07Dr6dBNiAMJohD8q8DMffAUNKuCyc
         It/DUn/jQ30HSITjm/Pka1bPMMiXHndpkam59E+gngGpszsGyQcqsmqsLLGecOV/x9cS
         lGuQ==
X-Gm-Message-State: AOAM532zw9ofK+NCqzJHVGJHefeUqI4ijVVWqHmeaPIfsJ4ZbkvN9M1G
        y+bVLhME9G63gTwY90O5Y54=
X-Google-Smtp-Source: ABdhPJwJR2PqCRmXe5Tfarwrq+QmAbDDyYK3hcoSttNokb6f8iiftpP/z20ln6MtYTWY0f0cfPKVTg==
X-Received: by 2002:a2e:712:: with SMTP id 18mr205136ljh.165.1608228464322;
        Thu, 17 Dec 2020 10:07:44 -0800 (PST)
Received: from localhost.localdomain (109-252-192-57.dynamic.spd-mgts.ru. [109.252.192.57])
        by smtp.gmail.com with ESMTPSA id u5sm655596lff.78.2020.12.17.10.07.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 17 Dec 2020 10:07:43 -0800 (PST)
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
Subject: [PATCH v2 21/48] PM: domains: Add "performance" column to debug summary
Date:   Thu, 17 Dec 2020 21:06:11 +0300
Message-Id: <20201217180638.22748-22-digetx@gmail.com>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20201217180638.22748-1-digetx@gmail.com>
References: <20201217180638.22748-1-digetx@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Add "performance" column to debug summary which shows performance state
of all power domains and theirs devices.

Signed-off-by: Dmitry Osipenko <digetx@gmail.com>
---
 drivers/base/power/domain.c | 22 +++++++++++++++++-----
 1 file changed, 17 insertions(+), 5 deletions(-)

diff --git a/drivers/base/power/domain.c b/drivers/base/power/domain.c
index a3e1bfc233d4..1c60dae8540c 100644
--- a/drivers/base/power/domain.c
+++ b/drivers/base/power/domain.c
@@ -2951,7 +2951,15 @@ static void rtpm_status_str(struct seq_file *s, struct device *dev)
 	else
 		WARN_ON(1);
 
-	seq_puts(s, p);
+	seq_printf(s, "%-25s  ", p);
+}
+
+static void perf_status_str(struct seq_file *s, struct device *dev)
+{
+	struct generic_pm_domain_data *gpd_data;
+
+	gpd_data = to_gpd_data(dev->power.subsys_data->domain_data);
+	seq_put_decimal_ull(s, "", gpd_data->performance_state);
 }
 
 static int genpd_summary_one(struct seq_file *s,
@@ -2979,7 +2987,7 @@ static int genpd_summary_one(struct seq_file *s,
 	else
 		snprintf(state, sizeof(state), "%s",
 			 status_lookup[genpd->status]);
-	seq_printf(s, "%-30s  %-15s ", genpd->name, state);
+	seq_printf(s, "%-30s  %-50s %u", genpd->name, state, genpd->performance_state);
 
 	/*
 	 * Modifications on the list require holding locks on both
@@ -2987,7 +2995,10 @@ static int genpd_summary_one(struct seq_file *s,
 	 * Also genpd->name is immutable.
 	 */
 	list_for_each_entry(link, &genpd->parent_links, parent_node) {
-		seq_printf(s, "%s", link->child->name);
+		if (list_is_first(&link->parent_node, &genpd->parent_links))
+			seq_printf(s, "\n%50s ", link->child->name);
+		else
+			seq_printf(s, "%s", link->child->name);
 		if (!list_is_last(&link->parent_node, &genpd->parent_links))
 			seq_puts(s, ", ");
 	}
@@ -3001,6 +3012,7 @@ static int genpd_summary_one(struct seq_file *s,
 
 		seq_printf(s, "\n    %-50s  ", kobj_path);
 		rtpm_status_str(s, pm_data->dev);
+		perf_status_str(s, pm_data->dev);
 		kfree(kobj_path);
 	}
 
@@ -3016,9 +3028,9 @@ static int summary_show(struct seq_file *s, void *data)
 	struct generic_pm_domain *genpd;
 	int ret = 0;
 
-	seq_puts(s, "domain                          status          children\n");
+	seq_puts(s, "domain                          status          children                           performance\n");
 	seq_puts(s, "    /device                                             runtime status\n");
-	seq_puts(s, "----------------------------------------------------------------------\n");
+	seq_puts(s, "----------------------------------------------------------------------------------------------\n");
 
 	ret = mutex_lock_interruptible(&gpd_list_lock);
 	if (ret)
-- 
2.29.2

