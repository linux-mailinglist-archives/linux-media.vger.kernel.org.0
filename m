Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 9A4822DD7DB
	for <lists+linux-media@lfdr.de>; Thu, 17 Dec 2020 19:15:35 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731562AbgLQSMv (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 17 Dec 2020 13:12:51 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41956 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1730210AbgLQSIo (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 17 Dec 2020 13:08:44 -0500
Received: from mail-lf1-x12b.google.com (mail-lf1-x12b.google.com [IPv6:2a00:1450:4864:20::12b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A75A2C0611BB;
        Thu, 17 Dec 2020 10:07:37 -0800 (PST)
Received: by mail-lf1-x12b.google.com with SMTP id l11so59858859lfg.0;
        Thu, 17 Dec 2020 10:07:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=pyhIAorEBtf9lvlliXp3a/E9KosdNviFUVTLwzCMWu4=;
        b=KBFsuU+VjlIdBBBqzZxU8fjyUNxV2GYS1K8Z7YQLuOAUMr50erguvS8eg5lipX2IzF
         wUJXnioL5pZGD/Km96I24RKaP0oAWM4mVWYg5Lwi1t+/D5N5Jk9k/aWAJCSWNgl+6Ag9
         Ul+TTXmwIB4/L6tLNavF1vvHuiaDPvO1IYmGAGIQ6IjffbXmmXs+G+t+xYVRe1XCiLUT
         TTtBHS6GvMaXs7btcbzdBpOt1vRgkH9ELTMrtOzYa5YunqIgyj0rI6fTA1UyrDJBGKzG
         NsTRPdNroHWqtup4JrKq4hCihZ/I8rG1hzY9GLcahCmccGNQRN37v+O1tg2GPp/B1ZlZ
         I1Bw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=pyhIAorEBtf9lvlliXp3a/E9KosdNviFUVTLwzCMWu4=;
        b=qazeeqAqkk3nGSFgJo2u9bTYNJgThLRwEEItIadJncK6WT5gLMnUzZ+xUk7pN2lXX5
         W5KKgKxeepZ+qL8D3HoWwBfF9v1XgpJTCDSc7C+YX/jc56Rdgah2mHVaYPEpF0Zu0wxg
         8RQvPtnlKz+4gyOWz09IeYZo0Z2q+PSR6Bv+RBlDMoyzYe44C/l/A5Af020/vOGh5oTC
         6bYvh3yK8nR8W8YALHDSuNTtWTmgiOOlI7NLbnTf4gD+c3HZ6ElksydP3sQyNunLcK2N
         0KncuCxSaQV2K0PLByzuf3xAI6jFMMgTxnBcE4+sD/4NNoc1dP4zCpB9iZGV6O+ZWtM2
         lO4A==
X-Gm-Message-State: AOAM530U0T0ccDI8TMMiQidAJGKjGDJyCmt5/E5815f9ubYwKif5zfuw
        UWIFCqQHMbkXtj/gzdMkzDU=
X-Google-Smtp-Source: ABdhPJyLU/4FC56tDazvyGbryuQ04uANev9KjoowVlnl0s+BVYhQ5t9V+9Mz7a+xus7YmajAeqhwKw==
X-Received: by 2002:ac2:54b9:: with SMTP id w25mr1838lfk.8.1608228456153;
        Thu, 17 Dec 2020 10:07:36 -0800 (PST)
Received: from localhost.localdomain (109-252-192-57.dynamic.spd-mgts.ru. [109.252.192.57])
        by smtp.gmail.com with ESMTPSA id u5sm655596lff.78.2020.12.17.10.07.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 17 Dec 2020 10:07:35 -0800 (PST)
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
Subject: [PATCH v2 14/48] opp: Filter out OPPs based on availability of a required-OPP
Date:   Thu, 17 Dec 2020 21:06:04 +0300
Message-Id: <20201217180638.22748-15-digetx@gmail.com>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20201217180638.22748-1-digetx@gmail.com>
References: <20201217180638.22748-1-digetx@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

A required OPP may not be available, and thus, all OPPs which are using
this required OPP should be unavailable too.

Signed-off-by: Dmitry Osipenko <digetx@gmail.com>
---
 drivers/opp/core.c | 11 ++++++++++-
 1 file changed, 10 insertions(+), 1 deletion(-)

diff --git a/drivers/opp/core.c b/drivers/opp/core.c
index d9feb7639598..3d02fe33630b 100644
--- a/drivers/opp/core.c
+++ b/drivers/opp/core.c
@@ -1588,7 +1588,7 @@ int _opp_add(struct device *dev, struct dev_pm_opp *new_opp,
 	     struct opp_table *opp_table, bool rate_not_available)
 {
 	struct list_head *head;
-	int ret;
+	int i, ret;
 
 	mutex_lock(&opp_table->lock);
 	head = &opp_table->opp_list;
@@ -1615,6 +1615,15 @@ int _opp_add(struct device *dev, struct dev_pm_opp *new_opp,
 			 __func__, new_opp->rate);
 	}
 
+	for (i = 0; i < opp_table->required_opp_count && new_opp->available; i++) {
+		if (new_opp->required_opps[i]->available)
+			continue;
+
+		new_opp->available = false;
+		dev_warn(dev, "%s: OPP not supported by required OPP %pOF (%lu)\n",
+			 __func__, new_opp->required_opps[i]->np, new_opp->rate);
+	}
+
 	return 0;
 }
 
-- 
2.29.2

