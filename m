Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 7179E2DD7D4
	for <lists+linux-media@lfdr.de>; Thu, 17 Dec 2020 19:15:32 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730566AbgLQSMu (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 17 Dec 2020 13:12:50 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42012 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1730216AbgLQSIo (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 17 Dec 2020 13:08:44 -0500
Received: from mail-lf1-x134.google.com (mail-lf1-x134.google.com [IPv6:2a00:1450:4864:20::134])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4B7C4C0611CF;
        Thu, 17 Dec 2020 10:07:35 -0800 (PST)
Received: by mail-lf1-x134.google.com with SMTP id o13so36631787lfr.3;
        Thu, 17 Dec 2020 10:07:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=vPD7hQ8b5N25hcZTdVSAqhZrBeZE9ONbNkTdFW8v87g=;
        b=ChchZyVri0yi/O25dvPeSHNQEk3sLXfZVskKc7CN57GBdMMTmWURalf2IM6i2rgvhh
         qfcMtU+PS/OCGaJjeaVHDM2wBUNa8Tg9f7+ONq/dSM6byM/Y8iogLVMrfOj4dNFwy2Xm
         Ps6rz8w/7z9Mz8vRMGfOZ86sU3M3S0FpRWA4hoISaf7GtzBRBYpB/pOJM78wLmrasMEr
         /gb3uNc548kJHGE9V2DfBbDDkAnqUyLpzfbxhrKpEumO23OdI8D7by5pViVe1cJ16DXd
         4yhnxob5KSGfDuhxWiH1oLSuAV4B7pIQHOcN3N/ZWY1erLsW1JFmbo1HRGSDSIF6T5LI
         wT3w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=vPD7hQ8b5N25hcZTdVSAqhZrBeZE9ONbNkTdFW8v87g=;
        b=SknprHSEzF813dbEmKVR1JbvWnI34zRa9YWnAE7c0uFxk6I0GkBc24q2CvBtc511J5
         WlZ34fOn5+MLmtHiM648i8FkRNBi1axD8aup8S4PUG5fptuol1cSBWmV77hwYAl6eAn9
         g3Bznq0myyO0LD2d/DLgJa35rTZSTTS7GC2LYHCHDSHErA0rVou6ZQVAdv+l4gGALfaL
         +Hrt47Vb1vSHIpWMudUTGAVhDZ2RjqvoSCbvG8scoUJPlkL13STEGhK+Ejela91U85yb
         wC2/D5aITrX42+Zmvhsu4kZCqPtp4Z4yz0pgS/C249UPgKUr3BsjZxgAaHVzbAZ/KYSL
         7bVw==
X-Gm-Message-State: AOAM530pXJl6ZcpKPpybxC+WNrHEcx1AT4GSh/og57XtKJpLbjYKmwsQ
        WqhyPMvakO2BCGUEszECrNQ=
X-Google-Smtp-Source: ABdhPJzFSNM0TMMoSxcYKoyhk7r0wzOQ4M8gA685Cb16wgK+4tnur3IzXUR06VdXp1ulyFqi9mnu/A==
X-Received: by 2002:a2e:a404:: with SMTP id p4mr220062ljn.260.1608228453811;
        Thu, 17 Dec 2020 10:07:33 -0800 (PST)
Received: from localhost.localdomain (109-252-192-57.dynamic.spd-mgts.ru. [109.252.192.57])
        by smtp.gmail.com with ESMTPSA id u5sm655596lff.78.2020.12.17.10.07.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 17 Dec 2020 10:07:33 -0800 (PST)
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
Subject: [PATCH v2 12/48] opp: Add dev_pm_opp_get_required_pstate()
Date:   Thu, 17 Dec 2020 21:06:02 +0300
Message-Id: <20201217180638.22748-13-digetx@gmail.com>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20201217180638.22748-1-digetx@gmail.com>
References: <20201217180638.22748-1-digetx@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Add dev_pm_opp_get_required_pstate() which allows OPP users to retrieve
required performance state of a given OPP.

Signed-off-by: Dmitry Osipenko <digetx@gmail.com>
---
 drivers/opp/core.c     | 22 ++++++++++++++++++++++
 include/linux/pm_opp.h | 10 ++++++++++
 2 files changed, 32 insertions(+)

diff --git a/drivers/opp/core.c b/drivers/opp/core.c
index 0783a4ac819a..4774701ec82d 100644
--- a/drivers/opp/core.c
+++ b/drivers/opp/core.c
@@ -145,6 +145,28 @@ unsigned int dev_pm_opp_get_level(struct dev_pm_opp *opp)
 }
 EXPORT_SYMBOL_GPL(dev_pm_opp_get_level);
 
+/**
+ * dev_pm_opp_get_required_pstate() - Gets the required performance state
+ *                                    corresponding to an available opp
+ * @opp:	opp for which performance state has to be returned for
+ * @index:	index of the required opp
+ *
+ * Return: performance state read from device tree corresponding to the
+ * required opp, else return 0.
+ */
+unsigned int dev_pm_opp_get_required_pstate(struct dev_pm_opp *opp,
+					    unsigned int index)
+{
+	if (IS_ERR_OR_NULL(opp) || !opp->available ||
+	    index >= opp->opp_table->required_opp_count) {
+		pr_err("%s: Invalid parameters\n", __func__);
+		return 0;
+	}
+
+	return opp->required_opps[index]->pstate;
+}
+EXPORT_SYMBOL_GPL(dev_pm_opp_get_required_pstate);
+
 /**
  * dev_pm_opp_is_turbo() - Returns if opp is turbo OPP or not
  * @opp: opp for which turbo mode is being verified
diff --git a/include/linux/pm_opp.h b/include/linux/pm_opp.h
index a17d92d923cc..0298b426fba3 100644
--- a/include/linux/pm_opp.h
+++ b/include/linux/pm_opp.h
@@ -98,6 +98,9 @@ unsigned long dev_pm_opp_get_freq(struct dev_pm_opp *opp);
 
 unsigned int dev_pm_opp_get_level(struct dev_pm_opp *opp);
 
+unsigned int dev_pm_opp_get_required_pstate(struct dev_pm_opp *opp,
+					    unsigned int index);
+
 bool dev_pm_opp_is_turbo(struct dev_pm_opp *opp);
 
 int dev_pm_opp_get_opp_count(struct device *dev);
@@ -188,6 +191,13 @@ static inline unsigned int dev_pm_opp_get_level(struct dev_pm_opp *opp)
 	return 0;
 }
 
+static inline
+unsigned int dev_pm_opp_get_required_pstate(struct dev_pm_opp *opp,
+					    unsigned int index)
+{
+	return 0;
+}
+
 static inline bool dev_pm_opp_is_turbo(struct dev_pm_opp *opp)
 {
 	return false;
-- 
2.29.2

