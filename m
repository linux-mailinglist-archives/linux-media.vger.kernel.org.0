Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 03B382DD7DE
	for <lists+linux-media@lfdr.de>; Thu, 17 Dec 2020 19:15:37 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731666AbgLQSMw (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 17 Dec 2020 13:12:52 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41954 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729977AbgLQSIo (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 17 Dec 2020 13:08:44 -0500
Received: from mail-lf1-x12f.google.com (mail-lf1-x12f.google.com [IPv6:2a00:1450:4864:20::12f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8C8B1C0611D0;
        Thu, 17 Dec 2020 10:07:36 -0800 (PST)
Received: by mail-lf1-x12f.google.com with SMTP id m25so59779180lfc.11;
        Thu, 17 Dec 2020 10:07:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=hbxvYRbm+qHovJ5Bd8gaI9FGWNmpZH6jYdB85zhzP8c=;
        b=RcuUW6tjagcGLt0JVEzp/bxthI8GUxwuNBiCXvFCkAbgvDKS9y9wdk97W/gzcUMn3E
         aEf7AcoFWbTfg4scDxr2IjKklb/dmsJVrjW/kKZ72HFcoaqwjTd7OqHhJhWaF5CN6nZw
         Q/DwEQlowQVp9Rbz1UgsfLeHJYBBWEv8w26dHTlF/Bf9M9E0Jxv8tKVHj+bk5nJHM3To
         i0WtZEJc/jCxaHmWoNX1b2UVyQn9P/7VJn30S6lh7GeOaDAn/ccTQ80jCyY34MBPOHaU
         o3LOXIt1OQKqOgMa093fZLjrXTW6mBRn6pnnL4tIyftM4s6H96K50bDK2F0m2usQymp0
         cPGQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=hbxvYRbm+qHovJ5Bd8gaI9FGWNmpZH6jYdB85zhzP8c=;
        b=FsL6DADFWc9ahB7zssXxPxk4bwG7H0KbH58mQ1l1fvMP0ewqlvLVmm2MogBmCX1BDP
         F/Bg4grt83voEk8yqUWDVaZ42WTsu/7S9kZtjyXPM8iEbhp4AXc7oIEOTloWDI+0qPSJ
         u7sYEvx2cThFuBPH6qhFyWqfoY8hV4d/xhmEo7Pfibkz22pxXqLcQQ8ngUI2FyNi1qtC
         uO7i/AmIy1vQxNj1ac6biwYg74uXIDhFvFoZk6l1IqLb4EiV76p8VO/jlDGsHjN7sEMJ
         V+Hw1jsGqfptxULceOoX0/yhCQqYJwrCpD5IDe1/Yu5n53ERp+tRuJF3oardp/7kj74I
         xXSw==
X-Gm-Message-State: AOAM531AhnpEwsG7Z9lgAeTj0953c8eQbUdjiEgqSC+U1R9AzEXaoUhc
        K4Dyuf5+J8OCIZS9EKDb8V4=
X-Google-Smtp-Source: ABdhPJxCgrKrbtjoSxSSQjtIU8Nv/gsZyLfuGnObK/F/pPmmqJzu4QT8VQAcZqL/Wb1Eiigfx+s0AQ==
X-Received: by 2002:a2e:9195:: with SMTP id f21mr209650ljg.191.1608228454992;
        Thu, 17 Dec 2020 10:07:34 -0800 (PST)
Received: from localhost.localdomain (109-252-192-57.dynamic.spd-mgts.ru. [109.252.192.57])
        by smtp.gmail.com with ESMTPSA id u5sm655596lff.78.2020.12.17.10.07.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 17 Dec 2020 10:07:34 -0800 (PST)
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
Subject: [PATCH v2 13/48] opp: Add resource-managed versions of OPP API functions
Date:   Thu, 17 Dec 2020 21:06:03 +0300
Message-Id: <20201217180638.22748-14-digetx@gmail.com>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20201217180638.22748-1-digetx@gmail.com>
References: <20201217180638.22748-1-digetx@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Add resource-managed versions of OPP API functions. This removes a need
from drivers to store and manage OPP table pointers.

Signed-off-by: Dmitry Osipenko <digetx@gmail.com>
---
 drivers/opp/core.c     | 173 +++++++++++++++++++++++++++++++++++++++++
 drivers/opp/of.c       |  25 ++++++
 include/linux/pm_opp.h |  51 ++++++++++++
 3 files changed, 249 insertions(+)

diff --git a/drivers/opp/core.c b/drivers/opp/core.c
index 4774701ec82d..d9feb7639598 100644
--- a/drivers/opp/core.c
+++ b/drivers/opp/core.c
@@ -2664,3 +2664,176 @@ int dev_pm_opp_set_voltage(struct device *dev, struct dev_pm_opp *opp)
 	return ret;
 }
 EXPORT_SYMBOL_GPL(dev_pm_opp_set_voltage);
+
+/**
+ * devm_pm_opp_get_opp_table() - Get OPP table of a device
+ * @dev:	device for which we do this operation
+ *
+ * This is a resource-managed version of dev_pm_opp_get_opp_table().
+ *
+ * Return: pointer to 'struct opp_table' if found and -ENODEV otherwise.
+ */
+struct opp_table *devm_pm_opp_get_opp_table(struct device *dev)
+{
+	struct opp_table *opp_table;
+	int err;
+
+	opp_table = dev_pm_opp_get_opp_table(dev);
+	if (IS_ERR(opp_table))
+		return opp_table;
+
+	err = devm_add_action_or_reset(dev, (void *)dev_pm_opp_put_opp_table,
+				       opp_table);
+	if (err)
+		return ERR_PTR(err);
+
+	return opp_table;
+}
+EXPORT_SYMBOL_GPL(devm_pm_opp_get_opp_table);
+
+/**
+ * devm_pm_opp_set_regulators() - Set regulator names for the device
+ * @dev: Device for which regulator name is being set.
+ * @names: Array of pointers to the names of the regulator.
+ * @count: Number of regulators.
+ *
+ * This is a resource-managed version of dev_pm_opp_set_regulators().
+ *
+ * Return: pointer to 'struct opp_table' on success and errorno otherwise.
+ */
+struct opp_table *
+devm_pm_opp_set_regulators(struct device *dev, const char * const names[],
+			   unsigned int count)
+{
+	struct opp_table *opp_table;
+	int err;
+
+	opp_table = dev_pm_opp_set_regulators(dev, names, count);
+	if (IS_ERR(opp_table))
+		return opp_table;
+
+	err = devm_add_action_or_reset(dev, (void *)dev_pm_opp_put_regulators,
+				       opp_table);
+	if (err)
+		return ERR_PTR(err);
+
+	return opp_table;
+}
+EXPORT_SYMBOL_GPL(devm_pm_opp_set_regulators);
+
+/**
+ * devm_pm_opp_set_supported_hw() - Set supported platforms
+ * @dev: Device for which supported-hw has to be set.
+ * @versions: Array of hierarchy of versions to match.
+ * @count: Number of elements in the array.
+ *
+ * This is a resource-managed version of dev_pm_opp_set_supported_hw().
+ *
+ * Return: pointer to 'struct opp_table' on success and errorno otherwise.
+ */
+struct opp_table *
+devm_pm_opp_set_supported_hw(struct device *dev, const u32 *versions,
+			     unsigned int count)
+{
+	struct opp_table *opp_table;
+	int err;
+
+	opp_table = dev_pm_opp_set_supported_hw(dev, versions, count);
+	if (IS_ERR(opp_table))
+		return opp_table;
+
+	err = devm_add_action_or_reset(dev, (void *)dev_pm_opp_put_supported_hw,
+				       opp_table);
+	if (err)
+		return ERR_PTR(err);
+
+	return opp_table;
+}
+EXPORT_SYMBOL_GPL(devm_pm_opp_set_supported_hw);
+
+/**
+ * devm_pm_opp_set_clkname() - Set clk name for the device
+ * @dev: Device for which clk name is being set.
+ * @name: Clk name.
+ *
+ * This is a resource-managed version of dev_pm_opp_set_clkname().
+ *
+ * Return: pointer to 'struct opp_table' on success and errorno otherwise.
+ */
+struct opp_table *
+devm_pm_opp_set_clkname(struct device *dev, const char *name)
+{
+	struct opp_table *opp_table;
+	int err;
+
+	opp_table = dev_pm_opp_set_clkname(dev, name);
+	if (IS_ERR(opp_table))
+		return opp_table;
+
+	err = devm_add_action_or_reset(dev, (void *)dev_pm_opp_put_clkname,
+				       opp_table);
+	if (err)
+		return ERR_PTR(err);
+
+	return opp_table;
+}
+EXPORT_SYMBOL_GPL(devm_pm_opp_set_clkname);
+
+/**
+ * devm_pm_opp_register_set_opp_helper() - Register custom set OPP helper
+ * @dev: Device for which the helper is getting registered.
+ * @set_opp: Custom set OPP helper.
+ *
+ * This is a resource-managed version of dev_pm_opp_register_set_opp_helper().
+ *
+ * Return: pointer to 'struct opp_table' on success and errorno otherwise.
+ */
+struct opp_table *
+devm_pm_opp_register_set_opp_helper(struct device *dev,
+				    int (*set_opp)(struct dev_pm_set_opp_data *data))
+{
+	struct opp_table *opp_table;
+	int err;
+
+	opp_table = dev_pm_opp_register_set_opp_helper(dev, set_opp);
+	if (IS_ERR(opp_table))
+		return opp_table;
+
+	err = devm_add_action_or_reset(dev, (void *)dev_pm_opp_unregister_set_opp_helper,
+				       opp_table);
+	if (err)
+		return ERR_PTR(err);
+
+	return opp_table;
+}
+EXPORT_SYMBOL_GPL(devm_pm_opp_register_set_opp_helper);
+
+/**
+ * devm_pm_opp_attach_genpd - Attach genpd(s) for the device and save virtual device pointer
+ * @dev: Consumer device for which the genpd is getting attached.
+ * @names: Null terminated array of pointers containing names of genpd to attach.
+ * @virt_devs: Pointer to return the array of virtual devices.
+ *
+ * This is a resource-managed version of dev_pm_opp_attach_genpd().
+ *
+ * Return: pointer to 'struct opp_table' on success and errorno otherwise.
+ */
+struct opp_table *
+devm_pm_opp_attach_genpd(struct device *dev, const char **names,
+			 struct device ***virt_devs)
+{
+	struct opp_table *opp_table;
+	int err;
+
+	opp_table = dev_pm_opp_attach_genpd(dev, names, virt_devs);
+	if (IS_ERR(opp_table))
+		return opp_table;
+
+	err = devm_add_action_or_reset(dev, (void *)dev_pm_opp_detach_genpd,
+				       opp_table);
+	if (err)
+		return ERR_PTR(err);
+
+	return opp_table;
+}
+EXPORT_SYMBOL_GPL(devm_pm_opp_attach_genpd);
diff --git a/drivers/opp/of.c b/drivers/opp/of.c
index 03cb387236c4..3b5a4c8bc62f 100644
--- a/drivers/opp/of.c
+++ b/drivers/opp/of.c
@@ -1350,3 +1350,28 @@ int dev_pm_opp_of_register_em(struct device *dev, struct cpumask *cpus)
 	return ret;
 }
 EXPORT_SYMBOL_GPL(dev_pm_opp_of_register_em);
+
+/**
+ * devm_pm_opp_of_add_table() - Initialize opp table from device tree
+ * @dev:	device pointer used to lookup OPP table.
+ *
+ * This is a resource-managed version of dev_pm_opp_of_add_table().
+ *
+ * Return: 0 on success and errorno otherwise.
+ */
+int devm_pm_opp_of_add_table(struct device *dev)
+{
+	int err;
+
+	err = dev_pm_opp_of_add_table(dev);
+	if (err)
+		return err;
+
+	err = devm_add_action_or_reset(dev, (void *)dev_pm_opp_remove_table,
+				       dev);
+	if (err)
+		return err;
+
+	return 0;
+}
+EXPORT_SYMBOL_GPL(devm_pm_opp_of_add_table);
diff --git a/include/linux/pm_opp.h b/include/linux/pm_opp.h
index 0298b426fba3..0d42fbda0134 100644
--- a/include/linux/pm_opp.h
+++ b/include/linux/pm_opp.h
@@ -163,6 +163,12 @@ void dev_pm_opp_remove_table(struct device *dev);
 void dev_pm_opp_cpumask_remove_table(const struct cpumask *cpumask);
 int dev_pm_opp_sync_regulators(struct device *dev);
 int dev_pm_opp_set_voltage(struct device *dev, struct dev_pm_opp *opp);
+struct opp_table *devm_pm_opp_get_opp_table(struct device *dev);
+struct opp_table *devm_pm_opp_set_regulators(struct device *dev, const char * const names[], unsigned int count);
+struct opp_table *devm_pm_opp_set_supported_hw(struct device *dev, const u32 *versions, unsigned int count);
+struct opp_table *devm_pm_opp_set_clkname(struct device *dev, const char *name);
+struct opp_table *devm_pm_opp_register_set_opp_helper(struct device *dev, int (*set_opp)(struct dev_pm_set_opp_data *data));
+struct opp_table *devm_pm_opp_attach_genpd(struct device *dev, const char **names, struct device ***virt_devs);
 #else
 static inline struct opp_table *dev_pm_opp_get_opp_table(struct device *dev)
 {
@@ -396,9 +402,49 @@ static inline int dev_pm_opp_set_voltage(struct device *dev, struct dev_pm_opp *
 	return -ENOTSUPP;
 }
 
+static inline struct opp_table *devm_pm_opp_get_opp_table(struct device *dev)
+{
+	return ERR_PTR(-ENOTSUPP);
+}
+
+static inline struct opp_table *
+devm_pm_opp_set_regulators(struct device *dev, const char * const names[],
+			   unsigned int count)
+{
+	return ERR_PTR(-ENOTSUPP);
+}
+
+static inline struct opp_table *
+devm_pm_opp_set_supported_hw(struct device *dev, const u32 *versions,
+			     unsigned int count)
+{
+	return ERR_PTR(-ENOTSUPP);
+}
+
+static inline struct opp_table *
+devm_pm_opp_set_clkname(struct device *dev, const char *name)
+{
+	return ERR_PTR(-ENOTSUPP);
+}
+
+static inline struct opp_table *
+devm_pm_opp_register_set_opp_helper(struct device *dev,
+				    int (*set_opp)(struct dev_pm_set_opp_data *data))
+{
+	return ERR_PTR(-ENOTSUPP);
+}
+
+static inline struct opp_table *
+devm_pm_opp_attach_genpd(struct device *dev, const char **names,
+			 struct device ***virt_devs)
+{
+	return ERR_PTR(-ENOTSUPP);
+}
+
 #endif		/* CONFIG_PM_OPP */
 
 #if defined(CONFIG_PM_OPP) && defined(CONFIG_OF)
+int devm_pm_opp_of_add_table(struct device *dev);
 int dev_pm_opp_of_add_table(struct device *dev);
 int dev_pm_opp_of_add_table_indexed(struct device *dev, int index);
 void dev_pm_opp_of_remove_table(struct device *dev);
@@ -472,6 +518,11 @@ static inline int dev_pm_opp_of_find_icc_paths(struct device *dev, struct opp_ta
 {
 	return -ENOTSUPP;
 }
+
+static inline int devm_pm_opp_of_add_table(struct device *dev)
+{
+	return -ENOTSUPP;
+}
 #endif
 
 #endif		/* __LINUX_OPP_H__ */
-- 
2.29.2

