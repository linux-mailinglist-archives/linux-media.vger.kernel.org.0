Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 8F4272DD720
	for <lists+linux-media@lfdr.de>; Thu, 17 Dec 2020 19:14:08 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730267AbgLQSIt (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 17 Dec 2020 13:08:49 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41958 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1730247AbgLQSIq (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 17 Dec 2020 13:08:46 -0500
Received: from mail-lf1-x136.google.com (mail-lf1-x136.google.com [IPv6:2a00:1450:4864:20::136])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 05872C0619D4;
        Thu, 17 Dec 2020 10:07:40 -0800 (PST)
Received: by mail-lf1-x136.google.com with SMTP id s26so25134272lfc.8;
        Thu, 17 Dec 2020 10:07:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=vhvv1h1Ziyi3xIAcsdjZjVcJ6AYQzdZqyFUMLjoR+gU=;
        b=mCQHS9XkKqyMibnw8kWGhj0y5I5wUfHzs6EhcQAYTQrcxVGcZQ4sqpiS8Cn8Tx/Vgc
         K8vwNkiSYNNJLkRBebbt09t3sVsBqdUNSNtsPjqMLKXOGXGV4dlGjyEDXXYRM2cC+SVU
         bE7Bn38TobzyFp1dohD8XSvG7rfjlxqF8Sm5uiY7d0VEfNNCo7wJa0PKHjj81i2bPo2J
         WJzx7XbQlxIrFuM2MUM/VGJ6PIZV7KS/8a4B0rV1qmtskhY18YraI8ioH6itChj/t1k5
         +kj1PiLcFY2+E3YsGxSymTnxRSL+MsXiAZJ6U7ldnz2pCqgj8mOKqfeXFPi+Xs7hEWeL
         jjKA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=vhvv1h1Ziyi3xIAcsdjZjVcJ6AYQzdZqyFUMLjoR+gU=;
        b=gMogBSHEtcDuNnUycg4LEnp6vSpNE2cJaaSeP//rloM7+KayMkgn4FwkfuSRQyc2az
         JdefHj8HEYgUPnBvSySi4fHYnn/sf2gT1KChcMBBeCEpO0wK/E2jc7e6xdJJzbMCq3xs
         4mFRN/c7EXcZgMRUrr9d2QSNh9rkrqPDhaUyCN4+Q8x0zccgp3dLWpOEeM2zzXsm58El
         rSC3B1hK5FMseSnWz0c+oDFVyRS+oSFAmU3W0rY3227wdEB1yAQFWajfkN379X45P4z6
         RtdrrWK9po0NHNfMAqtRqTW3s+gDbfrKnAb7inqD4Nld2IuLZ7jSh55BAboNpgP9hxaJ
         mCcQ==
X-Gm-Message-State: AOAM533LuRdI3ul44QKuThJZZS5K4gOvSAdZn455GYXbUFPgdhXm08Lb
        JUynWd7/sfqN6nnh0i4HSRs=
X-Google-Smtp-Source: ABdhPJwSqAw1lTij00AzVyWzgJA9yaLaIRHjYRL5G+gORDC0ff9W8dsUk7apucQlnXvHedXq3oMDVQ==
X-Received: by 2002:a2e:8512:: with SMTP id j18mr212691lji.31.1608228458488;
        Thu, 17 Dec 2020 10:07:38 -0800 (PST)
Received: from localhost.localdomain (109-252-192-57.dynamic.spd-mgts.ru. [109.252.192.57])
        by smtp.gmail.com with ESMTPSA id u5sm655596lff.78.2020.12.17.10.07.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 17 Dec 2020 10:07:38 -0800 (PST)
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
Subject: [PATCH v2 16/48] opp: Handle missing OPP table in dev_pm_opp_xlate_performance_state()
Date:   Thu, 17 Dec 2020 21:06:06 +0300
Message-Id: <20201217180638.22748-17-digetx@gmail.com>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20201217180638.22748-1-digetx@gmail.com>
References: <20201217180638.22748-1-digetx@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

NVIDIA Tegra SoCs have a power domains topology such that child domains
only clamp a power rail, while parent domain controls shared performance
state of the multiple child domains. In this case child's domain doesn't
need to have OPP table. Hence we want to allow children power domains to
pass performance state to the parent domain if child's domain doesn't have
OPP table.

The dev_pm_opp_xlate_performance_state() gets src_table=NULL if a child
power domain doesn't have OPP table and in this case we should pass the
performance state to the parent domain.

Signed-off-by: Dmitry Osipenko <digetx@gmail.com>
---
 drivers/opp/core.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/opp/core.c b/drivers/opp/core.c
index 625dae7a5ecb..34f7e530d941 100644
--- a/drivers/opp/core.c
+++ b/drivers/opp/core.c
@@ -2255,7 +2255,7 @@ int dev_pm_opp_xlate_performance_state(struct opp_table *src_table,
 	 * and so none of them have the "required-opps" property set. Return the
 	 * pstate of the src_table as it is in such cases.
 	 */
-	if (!src_table->required_opp_count)
+	if (!src_table || !src_table->required_opp_count)
 		return pstate;
 
 	for (i = 0; i < src_table->required_opp_count; i++) {
-- 
2.29.2

