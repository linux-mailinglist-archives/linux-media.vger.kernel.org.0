Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 12A7C2DD72C
	for <lists+linux-media@lfdr.de>; Thu, 17 Dec 2020 19:14:14 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730473AbgLQSI6 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 17 Dec 2020 13:08:58 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41992 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1730356AbgLQSI4 (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 17 Dec 2020 13:08:56 -0500
Received: from mail-lf1-x132.google.com (mail-lf1-x132.google.com [IPv6:2a00:1450:4864:20::132])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9032DC0619D8;
        Thu, 17 Dec 2020 10:07:44 -0800 (PST)
Received: by mail-lf1-x132.google.com with SMTP id u18so59831574lfd.9;
        Thu, 17 Dec 2020 10:07:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=ic3kTPXawx4sKcxOaKN7fFyaFOYLW2jZWk2kyZRzIN8=;
        b=pDPXQoxWtm8qgegOQQnLPP2iNl8IcQFs8OGUq2CcE/tO41E62bEBO32YvUgCVcHJ+V
         YPtVtozDo2n+wZJ4WQmT4rbG7S/div+wwrks6vq0KVL+VFD7En3oQrxCR9XkycdVzhsW
         S6BmQauT0TOzAZHGgiEusPxXhQOSZMTP5TD6YEKytzyzXfypbZ+5zUfDdkPIIU8s3+Ou
         mqnXy8OLojNQRx7M8z4L+fND+7tQ+nvxgScaL4ixkM3YRwx7uRc1TLy61azneCrZUo4c
         Hlcrvlhj6vwXBTq4+eZfHetTjVFqobaSbAbt7owq2Uhx4ROsy0JCVwjBqThP2hwltppM
         s2mA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=ic3kTPXawx4sKcxOaKN7fFyaFOYLW2jZWk2kyZRzIN8=;
        b=UUqGURPoq1CW4m9Yw4uM5CUmNPlpWryGMgcp+MaeySfoOYlQLSMdWOVR3TjSElJmqx
         SDKSkSoxYSI8O2BZX0mArULKMZ8gBFTn8CzxtGv5SFJW4AbTO8T2oqBTTnFzk7lexjIC
         7ATxlC8VREHmgpv5bLwAHMEYy6wHOnsTTds/QTNIiECVU6Ja3SSIpF+C+2U5H6Kc5p9N
         6aO+qzg9Pgh03mT/Mk0DSJyVrN873E5Va8Zo9xReyni7mpbPE+lsZETefvFtA+d/ScSr
         3XkGRmqNWLHlOBxk7mnn1prvFXpwsUhkG++dSbnXqSk+fF9mYmVbWVxyG3CWttHsOp+Z
         LbYw==
X-Gm-Message-State: AOAM530kcy8A0C1AzbhC1w5fUZzfcboc0tO9QjVaWyzmkhsPMWTgUVv6
        AQCa1JJxXGOLR0Eo720c72E=
X-Google-Smtp-Source: ABdhPJwellNh5faxAJj9vvQwVQ45t8eRtpsRvTnCcKlBjZrYp1XD+vvrxTLHfCwLKBFNaDRVWiD1zw==
X-Received: by 2002:a2e:a407:: with SMTP id p7mr226531ljn.78.1608228463135;
        Thu, 17 Dec 2020 10:07:43 -0800 (PST)
Received: from localhost.localdomain (109-252-192-57.dynamic.spd-mgts.ru. [109.252.192.57])
        by smtp.gmail.com with ESMTPSA id u5sm655596lff.78.2020.12.17.10.07.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 17 Dec 2020 10:07:42 -0800 (PST)
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
Subject: [PATCH v2 20/48] PM: domains: Make set_performance_state() callback optional
Date:   Thu, 17 Dec 2020 21:06:10 +0300
Message-Id: <20201217180638.22748-21-digetx@gmail.com>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20201217180638.22748-1-digetx@gmail.com>
References: <20201217180638.22748-1-digetx@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Make set_performance_state() callback optional in order to remove the
need from power domain drivers to implement a dummy callback. If callback
isn't implemented by a GENPD driver, then the performance state is passed
to the parent domain.

Signed-off-by: Dmitry Osipenko <digetx@gmail.com>
---
 drivers/base/power/domain.c | 11 +++++------
 1 file changed, 5 insertions(+), 6 deletions(-)

diff --git a/drivers/base/power/domain.c b/drivers/base/power/domain.c
index 9a14eedacb92..a3e1bfc233d4 100644
--- a/drivers/base/power/domain.c
+++ b/drivers/base/power/domain.c
@@ -339,9 +339,11 @@ static int _genpd_set_performance_state(struct generic_pm_domain *genpd,
 			goto err;
 	}
 
-	ret = genpd->set_performance_state(genpd, state);
-	if (ret)
-		goto err;
+	if (genpd->set_performance_state) {
+		ret = genpd->set_performance_state(genpd, state);
+		if (ret)
+			goto err;
+	}
 
 	genpd->performance_state = state;
 	return 0;
@@ -399,9 +401,6 @@ int dev_pm_genpd_set_performance_state(struct device *dev, unsigned int state)
 	if (!genpd)
 		return -ENODEV;
 
-	if (unlikely(!genpd->set_performance_state))
-		return -EINVAL;
-
 	if (WARN_ON(!dev->power.subsys_data ||
 		     !dev->power.subsys_data->domain_data))
 		return -EINVAL;
-- 
2.29.2

