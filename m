Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 6BF482DD7AA
	for <lists+linux-media@lfdr.de>; Thu, 17 Dec 2020 19:15:12 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731569AbgLQSL1 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 17 Dec 2020 13:11:27 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42082 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1730872AbgLQSJL (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 17 Dec 2020 13:09:11 -0500
Received: from mail-lf1-x12f.google.com (mail-lf1-x12f.google.com [IPv6:2a00:1450:4864:20::12f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 73EE0C0619D6;
        Thu, 17 Dec 2020 10:07:43 -0800 (PST)
Received: by mail-lf1-x12f.google.com with SMTP id x20so40285637lfe.12;
        Thu, 17 Dec 2020 10:07:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=PBkFTp9tm3NIEsg9yT0qklFrPErhGsiU6/VwoxR8iVo=;
        b=Wr2PZ5CpiNFJmfsifDPV2pBLJCgPQk0fgJ7q+dzCHxYQ2qxEg6pfh3bKUgDKcdI7K5
         romrhZ+RhBrJbCJ79wNAdtBxL2APvo/0s6vmkXm7kvCQEJ00kIT5J8YB9d3DSTUARd7w
         zqs5xyyHJO7q28hpZ44tT+NdcBCKHrURVoFOYXYvuG9dg/sHWuSDrZaM0htPC1zy/o93
         9c7BLcO6zT3+qWm7cNBTL2gZZePdwFbQSBO+ekT/FYtNGLRJouCO2FL++zN0Z0I6Ba9A
         DEJMGYoSEVBmf48mppl0TcD1BclLXkF2VNJNUOR8iatoMStAkUS2D1S5er6OcumMC1rS
         9hgA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=PBkFTp9tm3NIEsg9yT0qklFrPErhGsiU6/VwoxR8iVo=;
        b=aJqh+Vbfy2tBtyuN2OJYQVB+uQz0AwzFdocKE1v6MVw1wlaw0HAUsnOrdZyrSB4oLF
         G+jWHQrYXydbi/Wwc3thCY/c+T9gALV0WI7p15cEw9V9I6mCD+4k33mIF0V16flXFY6z
         hj13ErAmYCW7fj+z/VAmoc86C7IYP3JUyv5nPiFLWA2H72hvzSBIdrTTDy+uNbQtzPgM
         pyZ+43zqg4B/6Ru2NLhP1rHPhbqmzIprjVXlm+AI1snZNFJ9tYEZRM79j5hFzCYsnrMM
         PfGwCfHB8EX5s0p2lNewqLZ+Ex/1tXgQ/Ui1cBQQgj/HrGOyu6oDuGyYwYEdTZav7Bjj
         qQ4g==
X-Gm-Message-State: AOAM530fXH6ImPe+0hIbiza0GnvcDp+OxPT7Mx8r4QUPf0biUKbEjnzW
        Aytas3UBw0rvESsTwmuOv1Y=
X-Google-Smtp-Source: ABdhPJzI9lQCqVR6L1Wp/rAyjMTzeX+0L0LyqYKCSSzn2J93gimBkGPQS81KvJv88WT1zNQwZK203A==
X-Received: by 2002:a19:670f:: with SMTP id b15mr7791855lfc.340.1608228461978;
        Thu, 17 Dec 2020 10:07:41 -0800 (PST)
Received: from localhost.localdomain (109-252-192-57.dynamic.spd-mgts.ru. [109.252.192.57])
        by smtp.gmail.com with ESMTPSA id u5sm655596lff.78.2020.12.17.10.07.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 17 Dec 2020 10:07:41 -0800 (PST)
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
Subject: [PATCH v2 19/48] opp: Fix adding OPP entries in a wrong order if rate is unavailable
Date:   Thu, 17 Dec 2020 21:06:09 +0300
Message-Id: <20201217180638.22748-20-digetx@gmail.com>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20201217180638.22748-1-digetx@gmail.com>
References: <20201217180638.22748-1-digetx@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Fix adding OPP entries in a wrong (opposite) order if OPP rate is
unavailable. The OPP comparison is erroneously skipped if OPP rate is
missing, thus OPPs are left unsorted.

Signed-off-by: Dmitry Osipenko <digetx@gmail.com>
---
 drivers/opp/core.c | 23 ++++++++++++-----------
 drivers/opp/opp.h  |  2 +-
 2 files changed, 13 insertions(+), 12 deletions(-)

diff --git a/drivers/opp/core.c b/drivers/opp/core.c
index 34f7e530d941..5c7f130a8de2 100644
--- a/drivers/opp/core.c
+++ b/drivers/opp/core.c
@@ -1531,9 +1531,10 @@ static bool _opp_supported_by_regulators(struct dev_pm_opp *opp,
 	return true;
 }
 
-int _opp_compare_key(struct dev_pm_opp *opp1, struct dev_pm_opp *opp2)
+int _opp_compare_key(struct dev_pm_opp *opp1, struct dev_pm_opp *opp2,
+		     bool rate_not_available)
 {
-	if (opp1->rate != opp2->rate)
+	if (!rate_not_available && opp1->rate != opp2->rate)
 		return opp1->rate < opp2->rate ? -1 : 1;
 	if (opp1->bandwidth && opp2->bandwidth &&
 	    opp1->bandwidth[0].peak != opp2->bandwidth[0].peak)
@@ -1545,7 +1546,8 @@ int _opp_compare_key(struct dev_pm_opp *opp1, struct dev_pm_opp *opp2)
 
 static int _opp_is_duplicate(struct device *dev, struct dev_pm_opp *new_opp,
 			     struct opp_table *opp_table,
-			     struct list_head **head)
+			     struct list_head **head,
+			     bool rate_not_available)
 {
 	struct dev_pm_opp *opp;
 	int opp_cmp;
@@ -1559,13 +1561,13 @@ static int _opp_is_duplicate(struct device *dev, struct dev_pm_opp *new_opp,
 	 * loop.
 	 */
 	list_for_each_entry(opp, &opp_table->opp_list, node) {
-		opp_cmp = _opp_compare_key(new_opp, opp);
+		opp_cmp = _opp_compare_key(new_opp, opp, rate_not_available);
 		if (opp_cmp > 0) {
 			*head = &opp->node;
 			continue;
 		}
 
-		if (opp_cmp < 0)
+		if (opp_cmp < 0 || rate_not_available)
 			return 0;
 
 		/* Duplicate OPPs */
@@ -1601,12 +1603,11 @@ int _opp_add(struct device *dev, struct dev_pm_opp *new_opp,
 	mutex_lock(&opp_table->lock);
 	head = &opp_table->opp_list;
 
-	if (likely(!rate_not_available)) {
-		ret = _opp_is_duplicate(dev, new_opp, opp_table, &head);
-		if (ret) {
-			mutex_unlock(&opp_table->lock);
-			return ret;
-		}
+	ret = _opp_is_duplicate(dev, new_opp, opp_table, &head,
+				rate_not_available);
+	if (ret) {
+		mutex_unlock(&opp_table->lock);
+		return ret;
 	}
 
 	list_add(&new_opp->node, head);
diff --git a/drivers/opp/opp.h b/drivers/opp/opp.h
index 4ced7ffa8158..6f5be6c72f13 100644
--- a/drivers/opp/opp.h
+++ b/drivers/opp/opp.h
@@ -219,7 +219,7 @@ struct opp_table *_find_opp_table(struct device *dev);
 struct opp_device *_add_opp_dev(const struct device *dev, struct opp_table *opp_table);
 struct dev_pm_opp *_opp_allocate(struct opp_table *opp_table);
 void _opp_free(struct dev_pm_opp *opp);
-int _opp_compare_key(struct dev_pm_opp *opp1, struct dev_pm_opp *opp2);
+int _opp_compare_key(struct dev_pm_opp *opp1, struct dev_pm_opp *opp2, bool rate_not_available);
 int _opp_add(struct device *dev, struct dev_pm_opp *new_opp, struct opp_table *opp_table, bool rate_not_available);
 int _opp_add_v1(struct opp_table *opp_table, struct device *dev, unsigned long freq, long u_volt, bool dynamic);
 void _dev_pm_opp_cpumask_remove_table(const struct cpumask *cpumask, int last_cpu);
-- 
2.29.2

