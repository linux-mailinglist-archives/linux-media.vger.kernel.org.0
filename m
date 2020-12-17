Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 67D762DD745
	for <lists+linux-media@lfdr.de>; Thu, 17 Dec 2020 19:14:25 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730913AbgLQSJM (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 17 Dec 2020 13:09:12 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42084 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1730874AbgLQSJL (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 17 Dec 2020 13:09:11 -0500
Received: from mail-lf1-x132.google.com (mail-lf1-x132.google.com [IPv6:2a00:1450:4864:20::132])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A0100C0619D7;
        Thu, 17 Dec 2020 10:07:43 -0800 (PST)
Received: by mail-lf1-x132.google.com with SMTP id y19so59728949lfa.13;
        Thu, 17 Dec 2020 10:07:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=O54hHe3GwNNHKPGqkz2B7DU6dvwXex7DZOGprtr/GmM=;
        b=OeNoXEbagvqP4DcdFhxII/42gkuzezO/PqnbWTRx0INOXQdREbZ9WUQtGqRW9XC4zu
         qwqGe/LBGPelVABYeoE0DFhmP9frBpJpDLpxjZNEzjx2+8qfHOLYxleJzaXHkyivn7MV
         5Wx+7w3s6l4rWpcim8ghNJ6etTTkdS0O3EKA3rmH4m0vpOdsClXW+OmZRnXCmX54UcIZ
         YIzRp3emr7EG0FQVREe03LqbyinxlxDppx97t00aAoZs/8z1kq05RI6LRx430jN4MrGe
         yKib5DtjYjwWT1KHHaTrKl53ri2GUuh6aSw6+bQaGldmbatKakYdHzLHJ4nT9jbN9T1g
         77OA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=O54hHe3GwNNHKPGqkz2B7DU6dvwXex7DZOGprtr/GmM=;
        b=QyBlJhfWtHDb6VUtK0HLs59bqn28Kxm78/cg6st1yPVGzdw7lRZav3BZiGjcHVjR62
         QhuCMDIUD9uoGzgretaYaH83Ms9Z3Lkffn7ysAd8gfPfOrKwneOXe1wJAokmL/NeqymG
         zvxASxwPpyjwChwMRDSnsJPIC/VLZ2FN2Pl90iLHZwp9mQ5fhJWyn6NcJ7VBA0zLc0uP
         OY0kZ8WcxRgbWx1zdkl0141+gKSn/Ahtlp72G0vEw/6/nQMsDHOOLa8piCKTgLbfYuYC
         NFj04QFyjEjAKgztcO/k8A5+Hwctmjv5Mdiq6dtUoxQMgGIK/ioOdqYx4Pu+QBCWkZJ2
         jGng==
X-Gm-Message-State: AOAM5327XMVfl4WMdKrCk2kzGKShDUFpsDzOEhnGfNWw6D2eAKu5J3+F
        vQW9sDmi4DIzq+YLZs/uzKQ=
X-Google-Smtp-Source: ABdhPJwgr1JYd3dkFtKpuRIk58HS8VFkfsWUOGAgiyXDw3hUSYyQyK1uR0tRGdUSz8JFZo5ENDfzNg==
X-Received: by 2002:a2e:b80d:: with SMTP id u13mr209747ljo.143.1608228460744;
        Thu, 17 Dec 2020 10:07:40 -0800 (PST)
Received: from localhost.localdomain (109-252-192-57.dynamic.spd-mgts.ru. [109.252.192.57])
        by smtp.gmail.com with ESMTPSA id u5sm655596lff.78.2020.12.17.10.07.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 17 Dec 2020 10:07:40 -0800 (PST)
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
Subject: [PATCH v2 18/48] opp: Print OPP level in debug message of _opp_add_static_v2()
Date:   Thu, 17 Dec 2020 21:06:08 +0300
Message-Id: <20201217180638.22748-19-digetx@gmail.com>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20201217180638.22748-1-digetx@gmail.com>
References: <20201217180638.22748-1-digetx@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Print OPP level in debug message of _opp_add_static_v2(). This helps to
chase GENPD bugs.

Signed-off-by: Dmitry Osipenko <digetx@gmail.com>
---
 drivers/opp/of.c | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/drivers/opp/of.c b/drivers/opp/of.c
index 1f2038a4420b..56b153ea5c56 100644
--- a/drivers/opp/of.c
+++ b/drivers/opp/of.c
@@ -822,10 +822,11 @@ static struct dev_pm_opp *_opp_add_static_v2(struct opp_table *opp_table,
 	if (new_opp->clock_latency_ns > opp_table->clock_latency_ns_max)
 		opp_table->clock_latency_ns_max = new_opp->clock_latency_ns;
 
-	pr_debug("%s: turbo:%d rate:%lu uv:%lu uvmin:%lu uvmax:%lu latency:%lu\n",
+	pr_debug("%s: turbo:%d rate:%lu uv:%lu uvmin:%lu uvmax:%lu latency:%lu level:%u\n",
 		 __func__, new_opp->turbo, new_opp->rate,
 		 new_opp->supplies[0].u_volt, new_opp->supplies[0].u_volt_min,
-		 new_opp->supplies[0].u_volt_max, new_opp->clock_latency_ns);
+		 new_opp->supplies[0].u_volt_max, new_opp->clock_latency_ns,
+		 new_opp->level);
 
 	/*
 	 * Notify the changes in the availability of the operable
-- 
2.29.2

