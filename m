Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 6739E2DD73A
	for <lists+linux-media@lfdr.de>; Thu, 17 Dec 2020 19:14:20 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730788AbgLQSJD (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 17 Dec 2020 13:09:03 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41956 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1730728AbgLQSJA (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 17 Dec 2020 13:09:00 -0500
Received: from mail-lf1-x12c.google.com (mail-lf1-x12c.google.com [IPv6:2a00:1450:4864:20::12c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 177EAC0619E0;
        Thu, 17 Dec 2020 10:07:56 -0800 (PST)
Received: by mail-lf1-x12c.google.com with SMTP id a12so59838968lfl.6;
        Thu, 17 Dec 2020 10:07:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=G4bkjkogJjxhucwk91y1cMW03U1PPlta2j9gVHq9Ll8=;
        b=rCQoU2/mmvaocNvlxnid7FO29LSc024mSugBl0tdXdcytFbXH2gOlnpwvt8N+30PAg
         yb7ttQI7FzhzKZR924B0d/3R9LNPoRgpBoGk0IOcVJPsgsWCQsxmEeE2TiSNUf6U2zEk
         UAcyUD0vHfvlRRaoHCc/jZeM8FZ6u+jxT5WvXS4q07C3L49UI1+T4YyeAM47/km2IUMY
         +h1CezyjEzhVg+SazrlVF4o2uUgbBVRUzc6A6H4zBIs3ZtIXUR4lCvTjP1X8Ma8ljpX9
         s1nx5sADEfu0hG1dR8Px9QD2KFwkR1jqfRP1a8gQc0nLBI4Jl41CHBYNpt0S5HTVpgKO
         Zxqw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=G4bkjkogJjxhucwk91y1cMW03U1PPlta2j9gVHq9Ll8=;
        b=D8mfas+qbdsqplY0WMy08me3O0uooIHO6iiB1FkvJlAfES8mUOi9NvOk0RkAf5xMpz
         oE3zwYm7A0FX0pe26tweC/WYXQaDJ4jHFYD+n67WQjb9Aj1PuXHM0BLO2zm1gok8RroD
         bpBhuPUI8Zx4rpxgfDeRrmxJrSoiOypJ136acS4jLLmawr/anCzl7sVxYxhoccLY4frf
         92Jwglv0zRD5sIvD4RhRhSyZB08hyp77mgpaFSnyeUU8g9u/oDDwtEOB9q0zFMkWTDxo
         g0FUB8OH9X9l91irRJsolz92RrLFGHY+AfvgJffd3cJ+HaE2hZk6IbagyQb5pAjTGFEN
         gQrA==
X-Gm-Message-State: AOAM5303lGJv+QknzbRmuwWLXWxTMe8BGXykk5fznRQqkvKpsg9Q4yKJ
        rUW1E1CftrZKbnKIbvbWnqfL/dc/Tn8=
X-Google-Smtp-Source: ABdhPJyqYsSi5e5FbU0bmUx3znLJH35GGikhngE/ppL8K7VwQ0KK0y3SqjiWzxI9i0uAFK/MRB0qlg==
X-Received: by 2002:a2e:9b4d:: with SMTP id o13mr200509ljj.163.1608228474656;
        Thu, 17 Dec 2020 10:07:54 -0800 (PST)
Received: from localhost.localdomain (109-252-192-57.dynamic.spd-mgts.ru. [109.252.192.57])
        by smtp.gmail.com with ESMTPSA id u5sm655596lff.78.2020.12.17.10.07.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 17 Dec 2020 10:07:54 -0800 (PST)
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
Subject: [PATCH v2 30/48] soc/tegra: regulators: Fix locking up when voltage-spread is out of range
Date:   Thu, 17 Dec 2020 21:06:20 +0300
Message-Id: <20201217180638.22748-31-digetx@gmail.com>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20201217180638.22748-1-digetx@gmail.com>
References: <20201217180638.22748-1-digetx@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Fix voltage coupler lockup which happens when voltage-spread is out
of range due to a bug in the code. The max-spread requirement shall be
accounted when CPU regulator doesn't have consumers. This problem is
observed on Tegra30 Ouya game console once system-wide DVFS is enabled
in a device-tree.

Fixes: 783807436f36 ("soc/tegra: regulators: Add regulators coupler for Tegra30")
Cc: stable@vger.kernel.org
Tested-by: Peter Geis <pgwipeout@gmail.com>
Reported-by: Peter Geis <pgwipeout@gmail.com>
Signed-off-by: Dmitry Osipenko <digetx@gmail.com>
---
 drivers/soc/tegra/regulators-tegra30.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/soc/tegra/regulators-tegra30.c b/drivers/soc/tegra/regulators-tegra30.c
index 7f21f31de09d..0e776b20f625 100644
--- a/drivers/soc/tegra/regulators-tegra30.c
+++ b/drivers/soc/tegra/regulators-tegra30.c
@@ -178,7 +178,7 @@ static int tegra30_voltage_update(struct tegra_regulator_coupler *tegra,
 	 * survive the voltage drop if it's running on a higher frequency.
 	 */
 	if (!cpu_min_uV_consumers)
-		cpu_min_uV = cpu_uV;
+		cpu_min_uV = max(cpu_uV, cpu_min_uV);
 
 	/*
 	 * Bootloader shall set up voltages correctly, but if it
-- 
2.29.2

