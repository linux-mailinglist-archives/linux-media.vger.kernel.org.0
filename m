Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E6A022DD723
	for <lists+linux-media@lfdr.de>; Thu, 17 Dec 2020 19:14:09 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730317AbgLQSIy (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 17 Dec 2020 13:08:54 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41964 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1730248AbgLQSIq (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 17 Dec 2020 13:08:46 -0500
Received: from mail-lf1-x135.google.com (mail-lf1-x135.google.com [IPv6:2a00:1450:4864:20::135])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 86B31C0619D5;
        Thu, 17 Dec 2020 10:07:42 -0800 (PST)
Received: by mail-lf1-x135.google.com with SMTP id s26so25134640lfc.8;
        Thu, 17 Dec 2020 10:07:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=FMQPVkzhrHffuF4mwShq8rfapz+oLLOiBA35EvDkN1g=;
        b=T6C/xdTyr28sjOcJqBGBh+2bCLRgFaTIcBewPv/x+1L1QOyKReuP1MfG2tkzSw/dwF
         83LYY12BDsUDtf5UsTlPOdvdoSknRLL4Ub7pCG7DrdRyrNQWwS4h2r1LZTkODsd2kCpm
         u/tYnt96D3DAW0wWnLMhHeI2ukJZsL5LRAR7Z0BKq5dc256IqLpTzp3LPwjXw+Ia/TAQ
         LRe2WyKapRKlf2YaXsf6Z3H30F5rC5i6iHfKfaF7tBIKlrsio1o5JMMvvWxaNqwdeWSd
         tDMz+vhqPBWL72wWDyYqY3O2tJDobLVBzsYu5+PxlLFQWd3q52ONqjCl1uZ2LI6KEKTH
         ixzQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=FMQPVkzhrHffuF4mwShq8rfapz+oLLOiBA35EvDkN1g=;
        b=QzCHnEJ66nWLSu/yedfQBacKHPeMjRtuU+Qihpm9quKiPJjHgtQjPqqOg2iLJFKbPx
         OgM4/ETR1pL9L1JmldeF8IDvtWwLmlvTOYsTVPYB/GNUFQ0yTJO7s0428fv/VuNH8uzj
         p9L/LkK63TtAvgdanzdpNCI6A8ysKbCCrHKha1GeTyo/2N3NdL0Lo+hJ2npgrttcdDct
         hpwvOamQx+xSLbxyQwct+xgqPHpdLgJADJE8Wljvlmqfh8LaRRS6RFhJvWz3nkLhByB/
         wHTjoGzKItBiXh2p7wUioBqtn1KGAWeM6RCaooza9GL3a9pmulvojYDIWsj7cMXki7Kv
         E/hQ==
X-Gm-Message-State: AOAM5332v78k/iPo4M9IwxngLUWdKoYOBnANvd6+GetAtJHdGymJzJS6
        fmjBrIpEu3s3qBpw6a0ljDY=
X-Google-Smtp-Source: ABdhPJyWgcRAhgB2jbviKjj3cRVPK5uBYXP0sKAFflQv0Ic12rG9QDo0/dmYvrRqWl5AtvkglHHK6w==
X-Received: by 2002:a2e:58f:: with SMTP id 137mr196424ljf.469.1608228459627;
        Thu, 17 Dec 2020 10:07:39 -0800 (PST)
Received: from localhost.localdomain (109-252-192-57.dynamic.spd-mgts.ru. [109.252.192.57])
        by smtp.gmail.com with ESMTPSA id u5sm655596lff.78.2020.12.17.10.07.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 17 Dec 2020 10:07:39 -0800 (PST)
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
Subject: [PATCH v2 17/48] opp: Correct debug message in _opp_add_static_v2()
Date:   Thu, 17 Dec 2020 21:06:07 +0300
Message-Id: <20201217180638.22748-18-digetx@gmail.com>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20201217180638.22748-1-digetx@gmail.com>
References: <20201217180638.22748-1-digetx@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

The debug message always prints rate=0 instead of a proper value, fix it.

Signed-off-by: Dmitry Osipenko <digetx@gmail.com>
---
 drivers/opp/of.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/opp/of.c b/drivers/opp/of.c
index 3b5a4c8bc62f..1f2038a4420b 100644
--- a/drivers/opp/of.c
+++ b/drivers/opp/of.c
@@ -755,7 +755,6 @@ static struct dev_pm_opp *_opp_add_static_v2(struct opp_table *opp_table,
 		struct device *dev, struct device_node *np)
 {
 	struct dev_pm_opp *new_opp;
-	u64 rate = 0;
 	u32 val;
 	int ret;
 	bool rate_not_available = false;
@@ -772,7 +771,8 @@ static struct dev_pm_opp *_opp_add_static_v2(struct opp_table *opp_table,
 
 	/* Check if the OPP supports hardware's hierarchy of versions or not */
 	if (!_opp_is_supported(dev, opp_table, np)) {
-		dev_dbg(dev, "OPP not supported by hardware: %llu\n", rate);
+		dev_dbg(dev, "OPP not supported by hardware: %lu\n",
+			new_opp->rate);
 		goto free_opp;
 	}
 
-- 
2.29.2

