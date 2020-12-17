Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D50152DD7B6
	for <lists+linux-media@lfdr.de>; Thu, 17 Dec 2020 19:15:17 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731637AbgLQSLm (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 17 Dec 2020 13:11:42 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42076 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1730867AbgLQSJJ (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 17 Dec 2020 13:09:09 -0500
Received: from mail-lf1-x131.google.com (mail-lf1-x131.google.com [IPv6:2a00:1450:4864:20::131])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BE56EC0619D2;
        Thu, 17 Dec 2020 10:07:38 -0800 (PST)
Received: by mail-lf1-x131.google.com with SMTP id a9so59799937lfh.2;
        Thu, 17 Dec 2020 10:07:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=NlDMl6XjPevCn3rRvWT/f1VR4LdbuUD4/E02zVLuVCI=;
        b=RTWkhu3VqMqpDCA4Qo24BTJf+2HuJmLcparbZ+4myGwK1DNAzIGrgipPwwDKIIjrKS
         ePerczxp+6zHrPN6Dqn9OXFrwkqgqVZKTxDtaFeEELTEv5tlBstMf0P3QwYRzM20vWTM
         BliaLVxvI1nhJVyskHZ3FMESXBjgr+oWdWqVqRNm2rlei11rc3wpmZbdQ4odalL2zKWD
         GwaPJoY/LSJ0dqPxg3Bq/HrsjDS7nXr5Uxa2HsKYjBt0fe7/MWnpeLhAWQ//k18Hkb4W
         Qgu8Q7C+KU3jCZyrFKxqARUQD6npMHl2BNPx+eMXU587ADHJ5fD/w80+TTFH/cNU5wLn
         gbKQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=NlDMl6XjPevCn3rRvWT/f1VR4LdbuUD4/E02zVLuVCI=;
        b=G7jf1bFIuhwN4SatgeYauYCcWNpDkKAKZNP4v/Br7tH1xLeMZ73g8EE6aD/gr+hs3V
         43EPV509HSnhBqughvICoAv6R9DLoAnWkmgKmov3SN0/KJDz0ThAZxaw2rk+nonJI0l5
         waYM3D1WI5vAeEuPQVqgfnVBqLWWQkfGGKaLWRm7EfaMbeUoRIbdXYw1ypsXEsFpnMhH
         m0R1Vs9pgTPFKLR5H4q8izPBET7sKT/FXJhOvYwppSMyDfXcmUl1u1RzX9Q3i+f3dO6q
         MVde+pMTcKlzrWg0G+KibpZMsUKEkKYoCLlxOaxfAtKSvvPAUuw9ZKmueVpJJR9c8fry
         hIbg==
X-Gm-Message-State: AOAM533yqW7Sf1lcW9m+t8tw9RIBsK5kfxphR/VoRt7hZI712xxyA1ks
        9aYzSAEmyArtFM+ZXFmvKrk=
X-Google-Smtp-Source: ABdhPJwLHLuEJNjyRdVPWt6WXEB6a0huo4TKPk5vwaRTMIFRcOi8N+JmP0jdXRGsy84KSAUugIUQMQ==
X-Received: by 2002:a05:651c:2dc:: with SMTP id f28mr207871ljo.13.1608228457280;
        Thu, 17 Dec 2020 10:07:37 -0800 (PST)
Received: from localhost.localdomain (109-252-192-57.dynamic.spd-mgts.ru. [109.252.192.57])
        by smtp.gmail.com with ESMTPSA id u5sm655596lff.78.2020.12.17.10.07.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 17 Dec 2020 10:07:36 -0800 (PST)
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
Subject: [PATCH v2 15/48] opp: Support set_opp() customization without requiring to use regulators
Date:   Thu, 17 Dec 2020 21:06:05 +0300
Message-Id: <20201217180638.22748-16-digetx@gmail.com>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20201217180638.22748-1-digetx@gmail.com>
References: <20201217180638.22748-1-digetx@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Support set_opp() customization without requiring to use regulators. This
is needed by drivers which want to use dev_pm_opp_set_rate() for changing
rates of a multiple clocks and don't need to touch regulator.

One example is NVIDIA Tegra30/114 SoCs which have two sibling 3D hardware
units which should be use to the same clock rate, meanwhile voltage
scaling is done using a power domain. In this case OPP table doesn't have
a regulator, causing a NULL dereference in _set_opp_custom().

Signed-off-by: Dmitry Osipenko <digetx@gmail.com>
---
 drivers/opp/core.c | 16 ++++++++++++----
 1 file changed, 12 insertions(+), 4 deletions(-)

diff --git a/drivers/opp/core.c b/drivers/opp/core.c
index 3d02fe33630b..625dae7a5ecb 100644
--- a/drivers/opp/core.c
+++ b/drivers/opp/core.c
@@ -828,17 +828,25 @@ static int _set_opp_custom(const struct opp_table *opp_table,
 			   struct dev_pm_opp_supply *old_supply,
 			   struct dev_pm_opp_supply *new_supply)
 {
-	struct dev_pm_set_opp_data *data;
+	struct dev_pm_set_opp_data *data, tmp_data;
+	unsigned int regulator_count;
 	int size;
 
-	data = opp_table->set_opp_data;
+	if (opp_table->set_opp_data) {
+		data = opp_table->set_opp_data;
+		regulator_count = opp_table->regulator_count;
+	} else {
+		data = &tmp_data;
+		regulator_count = 0;
+	}
+
 	data->regulators = opp_table->regulators;
-	data->regulator_count = opp_table->regulator_count;
+	data->regulator_count = regulator_count;
 	data->clk = opp_table->clk;
 	data->dev = dev;
 
 	data->old_opp.rate = old_freq;
-	size = sizeof(*old_supply) * opp_table->regulator_count;
+	size = sizeof(*old_supply) * regulator_count;
 	if (!old_supply)
 		memset(data->old_opp.supplies, 0, size);
 	else
-- 
2.29.2

