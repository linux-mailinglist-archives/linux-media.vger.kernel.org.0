Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 3B4CD2DD728
	for <lists+linux-media@lfdr.de>; Thu, 17 Dec 2020 19:14:12 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730385AbgLQSI5 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 17 Dec 2020 13:08:57 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41994 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1730357AbgLQSI5 (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 17 Dec 2020 13:08:57 -0500
Received: from mail-lf1-x12a.google.com (mail-lf1-x12a.google.com [IPv6:2a00:1450:4864:20::12a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E992EC0619DA;
        Thu, 17 Dec 2020 10:07:46 -0800 (PST)
Received: by mail-lf1-x12a.google.com with SMTP id 23so59803909lfg.10;
        Thu, 17 Dec 2020 10:07:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=NX+MS+anU76BlhEILutoJiS/7/Thy1nqdrl3kCzllJ4=;
        b=m+RcrvCN5SVrC4E9GsHQPZphjjmtSgb6vuW0wmrHP3sg/7u7V+Hka3Yz10nHRBIxUV
         8UV768vcIQ+01fjn0PkPPxF+oLpCfOhdiGMGBDnrsILzLvxYhOSOifjhnRxs/HVEVyn6
         3ZsI83oqk77uAHPWY8AhNT3DQe6YpD0gs1NFWahq0b0q9n4yDXnm7aBZCe5eDJG1LvpP
         zjMk/P17UXO40lcqYkyijOIomLa1G4M0uXMPS0E9EQAbEU49va0WIVYn6oBBujqzciPE
         QaxGQKnyhWyxfVKhKid9wYcl1G+4A72GGTAmGaMdNzjWKaK3YvR+eOFL4SdIEwRHHc65
         RtZA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=NX+MS+anU76BlhEILutoJiS/7/Thy1nqdrl3kCzllJ4=;
        b=OTdRJT9dgggE+dza9KYYUaAd41+CCj08bQtLi5drzxwxe7ZHUPvSH4ccPNQMjT2FWR
         FMJ1mu+C+Q5uea0RjCoCpFAEh/8Yd1cyCY+ecBiAnXRN2XeepKvcCmGvuu/Z7ZYUT4ag
         eA7VhXgHiFeg4FlFGzyW9iPx3EU7ooHTf1tmrkN4GDXpfc+UjSUoyQyLqeyAX3gEQ3A3
         bQTpf/pMDI9LTjNn1y5bwVILY0TckSEyDi37/mjVcT/0oqf1rwyoTxYtTZ5QGJJIj4X6
         2H5noTmCWLlfwZNwEUbfuWRDNDynnm1wQUL5RTKnOO/vMCByvwVTQuLYZQSXLVjppSNH
         7zbg==
X-Gm-Message-State: AOAM532SZqG6yRIj/Wn42FOLKFpwLmcMrdNzCz8GH146OK2RjvhSjXp+
        ro+OAGgX45AscyeAV/BDli8=
X-Google-Smtp-Source: ABdhPJzZPdbXPbkUp1eRbNGTe1GkWb+tswPD3NA3JbqvyYw4q06czICReBowWtbbVUqPBOhPjZBhXQ==
X-Received: by 2002:a19:9d8:: with SMTP id 207mr8275690lfj.581.1608228465466;
        Thu, 17 Dec 2020 10:07:45 -0800 (PST)
Received: from localhost.localdomain (109-252-192-57.dynamic.spd-mgts.ru. [109.252.192.57])
        by smtp.gmail.com with ESMTPSA id u5sm655596lff.78.2020.12.17.10.07.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 17 Dec 2020 10:07:45 -0800 (PST)
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
Subject: [PATCH v2 22/48] soc/tegra: pmc: Fix imbalanced clock disabling in error code path
Date:   Thu, 17 Dec 2020 21:06:12 +0300
Message-Id: <20201217180638.22748-23-digetx@gmail.com>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20201217180638.22748-1-digetx@gmail.com>
References: <20201217180638.22748-1-digetx@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

The tegra_powergate_power_up() has a typo in the error code path where it
will try to disable clocks twice, fix it. In practice that error never
happens, so this is a minor correction.

Signed-off-by: Dmitry Osipenko <digetx@gmail.com>
---
 drivers/soc/tegra/pmc.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/soc/tegra/pmc.c b/drivers/soc/tegra/pmc.c
index df9a5ca8c99c..fd2ba3c59178 100644
--- a/drivers/soc/tegra/pmc.c
+++ b/drivers/soc/tegra/pmc.c
@@ -638,7 +638,7 @@ static int tegra_powergate_power_up(struct tegra_powergate *pg,
 
 	err = tegra_powergate_enable_clocks(pg);
 	if (err)
-		goto disable_clks;
+		goto powergate_off;
 
 	usleep_range(10, 20);
 
-- 
2.29.2

