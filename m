Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 427162DD7D8
	for <lists+linux-media@lfdr.de>; Thu, 17 Dec 2020 19:15:34 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729839AbgLQSMv (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 17 Dec 2020 13:12:51 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42010 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1730214AbgLQSIo (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 17 Dec 2020 13:08:44 -0500
Received: from mail-lf1-x12d.google.com (mail-lf1-x12d.google.com [IPv6:2a00:1450:4864:20::12d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2E165C0611CE;
        Thu, 17 Dec 2020 10:07:34 -0800 (PST)
Received: by mail-lf1-x12d.google.com with SMTP id 23so59802044lfg.10;
        Thu, 17 Dec 2020 10:07:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=ONUdIoYLvrymxxGuA1rEkpRERKvXdxShg+niqiRuWWw=;
        b=p2/N6zxOWQ1TNgCgwvZcMNpOSboPM0BuGbUpXZAXVfrMIdLcbf/m3p1KC2nQL3v0I6
         wH1TSHHk9uUDfjeo0lwnQ0kiY1X7T1gJ0S/JHcoaGZ4DP/tjco2gS2i2yzvshR66pv8H
         o7Ot28qeR/sxxzMguphR4oIYAhkMO1eRB0/hIWpVDKS1QyUuLObjGKCKgnRASusUidVU
         zxN0pLs8ZQtIA8ikRgKkDPtzOC4nV6kqtQoNiegpJLjHVQYfklIPYqMmLIHmcd5+/Oej
         3yksetlAGp6u9VKhXKgNKCbMKS7HuKmgo1KBLhzMJFWqIiExd6/+V5ueg7KJkhXGyUiJ
         Ddig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=ONUdIoYLvrymxxGuA1rEkpRERKvXdxShg+niqiRuWWw=;
        b=Ai0OUCwtGd75S3PxhIZ8j3oLnXziBX9+r1w5G2qK8DJuqS4dCh4jN+5eCLXxbAH5rz
         3CiZpyEZgNeR0z3jYjn70cBWUI0Re7iq5Apo6F6Tp1aAy/1GpP4o68G7w5Rj/TSz6w/A
         ajid0N3WJvmWn3oDhrK2G7JJydLnLdQwCfN8fvgpm/tsmo/LpsN7LkG4ElqrHKQXrIpz
         39R/RFekUV+njkff/dEv88Bn9rYla0pHVflzkKfXvCdQoxQg99AGVyG/Ma5w6jvk+6J0
         GHbN1ELwBfVoF4CI5nFK2E/JP9otshDpwvxNQ62poKWWXRiYmJWtJwFmBP6d9W1pQuQw
         4Ftw==
X-Gm-Message-State: AOAM532AxL10n0bi+MjAtVA+lvC2i7SixUKXT8P8BoNb0G3ncpU8vYYj
        l9qiObTQu4va/kTBSgyhdGw=
X-Google-Smtp-Source: ABdhPJx4DSg+fZJTBkNxhuc6g3ezsqDW5hpdLf96cj7krLJwspxwSptzE1H7fpBWtPpK43NibJSC9A==
X-Received: by 2002:a2e:82d0:: with SMTP id n16mr210409ljh.474.1608228452689;
        Thu, 17 Dec 2020 10:07:32 -0800 (PST)
Received: from localhost.localdomain (109-252-192-57.dynamic.spd-mgts.ru. [109.252.192.57])
        by smtp.gmail.com with ESMTPSA id u5sm655596lff.78.2020.12.17.10.07.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 17 Dec 2020 10:07:32 -0800 (PST)
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
Subject: [PATCH v2 11/48] opp: Add dev_pm_opp_find_level_ceil()
Date:   Thu, 17 Dec 2020 21:06:01 +0300
Message-Id: <20201217180638.22748-12-digetx@gmail.com>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20201217180638.22748-1-digetx@gmail.com>
References: <20201217180638.22748-1-digetx@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Add a ceil version of the dev_pm_opp_find_level(). It's handy to have if
levels don't start from 0 in OPP table and zero usually means a minimal
level.

Signed-off-by: Dmitry Osipenko <digetx@gmail.com>
---
 drivers/opp/core.c     | 49 ++++++++++++++++++++++++++++++++++++++++++
 include/linux/pm_opp.h |  8 +++++++
 2 files changed, 57 insertions(+)

diff --git a/drivers/opp/core.c b/drivers/opp/core.c
index eab37b3a27bb..0783a4ac819a 100644
--- a/drivers/opp/core.c
+++ b/drivers/opp/core.c
@@ -449,6 +449,55 @@ struct dev_pm_opp *dev_pm_opp_find_level_exact(struct device *dev,
 }
 EXPORT_SYMBOL_GPL(dev_pm_opp_find_level_exact);
 
+/**
+ * dev_pm_opp_find_level_ceil() - search for an rounded up level
+ * @dev:		device for which we do this operation
+ * @level:		level to search for
+ *
+ * Return: Searches for rounded up match in the opp table and returns pointer
+ * to the  matching opp if found, else returns ERR_PTR in case of error and
+ * should be handled using IS_ERR. Error return values can be:
+ * EINVAL:	for bad pointer
+ * ERANGE:	no match found for search
+ * ENODEV:	if device not found in list of registered devices
+ *
+ * The callers are required to call dev_pm_opp_put() for the returned OPP after
+ * use.
+ */
+struct dev_pm_opp *dev_pm_opp_find_level_ceil(struct device *dev,
+					      unsigned int *level)
+{
+	struct opp_table *opp_table;
+	struct dev_pm_opp *temp_opp, *opp = ERR_PTR(-ERANGE);
+
+	opp_table = _find_opp_table(dev);
+	if (IS_ERR(opp_table)) {
+		int r = PTR_ERR(opp_table);
+
+		dev_err(dev, "%s: OPP table not found (%d)\n", __func__, r);
+		return ERR_PTR(r);
+	}
+
+	mutex_lock(&opp_table->lock);
+
+	list_for_each_entry(temp_opp, &opp_table->opp_list, node) {
+		if (temp_opp->available && temp_opp->level >= *level) {
+			opp = temp_opp;
+			*level = opp->level;
+
+			/* Increment the reference count of OPP */
+			dev_pm_opp_get(opp);
+			break;
+		}
+	}
+
+	mutex_unlock(&opp_table->lock);
+	dev_pm_opp_put_opp_table(opp_table);
+
+	return opp;
+}
+EXPORT_SYMBOL_GPL(dev_pm_opp_find_level_ceil);
+
 static noinline struct dev_pm_opp *_find_freq_ceil(struct opp_table *opp_table,
 						   unsigned long *freq)
 {
diff --git a/include/linux/pm_opp.h b/include/linux/pm_opp.h
index f311a8b2ca04..a17d92d923cc 100644
--- a/include/linux/pm_opp.h
+++ b/include/linux/pm_opp.h
@@ -111,6 +111,8 @@ struct dev_pm_opp *dev_pm_opp_find_freq_exact(struct device *dev,
 					      bool available);
 struct dev_pm_opp *dev_pm_opp_find_level_exact(struct device *dev,
 					       unsigned int level);
+struct dev_pm_opp *dev_pm_opp_find_level_ceil(struct device *dev,
+					      unsigned int *level);
 
 struct dev_pm_opp *dev_pm_opp_find_freq_floor(struct device *dev,
 					      unsigned long *freq);
@@ -228,6 +230,12 @@ static inline struct dev_pm_opp *dev_pm_opp_find_level_exact(struct device *dev,
 	return ERR_PTR(-ENOTSUPP);
 }
 
+static inline struct dev_pm_opp *dev_pm_opp_find_level_ceil(struct device *dev,
+					unsigned int *level)
+{
+	return ERR_PTR(-ENOTSUPP);
+}
+
 static inline struct dev_pm_opp *dev_pm_opp_find_freq_floor(struct device *dev,
 					unsigned long *freq)
 {
-- 
2.29.2

