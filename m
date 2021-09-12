Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 780174080B2
	for <lists+linux-media@lfdr.de>; Sun, 12 Sep 2021 22:14:45 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236330AbhILULC (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sun, 12 Sep 2021 16:11:02 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53860 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236266AbhILUK4 (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Sun, 12 Sep 2021 16:10:56 -0400
Received: from mail-wm1-x329.google.com (mail-wm1-x329.google.com [IPv6:2a00:1450:4864:20::329])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id DF830C061574;
        Sun, 12 Sep 2021 13:09:41 -0700 (PDT)
Received: by mail-wm1-x329.google.com with SMTP id v20-20020a1cf714000000b002e71f4d2026so4053786wmh.1;
        Sun, 12 Sep 2021 13:09:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=+whg/vR1lDDJUCWuilT5Vzp2lbX9lxYPieEOT99+gTQ=;
        b=V5Aa4YrasEF2oAFxijDRlvhEgMLA7I6pw6CbcE3pvDx1ziFBju9LNloAq2VknotN7f
         38aCc6QBuqukFCW3K57M5bZ36l0Re3YLoWL7GWh1vCHdifl5CmsmmBhF152dzXW923Fd
         Fp4ybtVuWxeHS2oS4y2PC9JXwLwKhnOEdgMIFud5Oa/A1XKFvm5IYhQa3SfZOQGuIcsv
         XhiBPEkkbdhzx8tuLkBpTD9Az/IRiOWEnOGwvP9Vab8oAbXKPyfW8t6pUhLIRAlv3P2g
         RfDsnsJlGcDox4xCmFZ/Sa8ZiXr3G0n2BA9fjxFdYbhandYfEorXaDTWbWYKWeiEuhMr
         fLxw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=+whg/vR1lDDJUCWuilT5Vzp2lbX9lxYPieEOT99+gTQ=;
        b=4Q2BwsuoZVt5lTEIbN9j8uW3nJmFkKVDyZNi7kmtXzWx3xtulU2ml3ACLf02eUxEpG
         XEYbOGuGcrcQUnDS73esboU9b3Eo0t8kNJTHmTTzCqbrfVZnELSa8OawD6PjGeqEkJm0
         P1Dxi27KqAzpeYG+2X4R6ZVc8NgioIHS1LZiOH526abjaG5TEBWTT52ccms1F//pqxUR
         OWYbU/9KWxKO2GlgfaxDCIuSQ98zbTxRWhH6/wnnbzNzDA7nifK/hp73SCyvWo8gR9RH
         S481aEseGjg6iseOMJ8mLf3nSgiHay8Jtx0rrnMaHZlQfePqfdzeiffPQFZaE0bUFU9+
         eYzQ==
X-Gm-Message-State: AOAM5320wQpf4Rh5oJy/3DpkoUE6r5/TlPjrMsy4QqVPaNgaqRF8iysz
        AQsAddIleG5DcAGREPTxBvY=
X-Google-Smtp-Source: ABdhPJyUSupdqTypNZScVZTiK5D0yEZxdKj/mEB3TUIXMX8PnKbwR9X93zXb/+VgwZ4ZoDBHSQSkmA==
X-Received: by 2002:a1c:28a:: with SMTP id 132mr7935009wmc.101.1631477380517;
        Sun, 12 Sep 2021 13:09:40 -0700 (PDT)
Received: from localhost.localdomain (46-138-83-36.dynamic.spd-mgts.ru. [46.138.83.36])
        by smtp.gmail.com with ESMTPSA id v10sm5463476wrg.15.2021.09.12.13.09.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 12 Sep 2021 13:09:40 -0700 (PDT)
From:   Dmitry Osipenko <digetx@gmail.com>
To:     Thierry Reding <thierry.reding@gmail.com>,
        Jonathan Hunter <jonathanh@nvidia.com>,
        Ulf Hansson <ulf.hansson@linaro.org>,
        Viresh Kumar <vireshk@kernel.org>,
        Stephen Boyd <sboyd@kernel.org>,
        Peter De Schrijver <pdeschrijver@nvidia.com>,
        Mikko Perttunen <mperttunen@nvidia.com>,
        Peter Chen <peter.chen@kernel.org>,
        Mark Brown <broonie@kernel.org>,
        Lee Jones <lee.jones@linaro.org>,
        =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= 
        <u.kleine-koenig@pengutronix.de>, Nishanth Menon <nm@ti.com>,
        Vignesh Raghavendra <vigneshr@ti.com>,
        Richard Weinberger <richard@nod.at>,
        Miquel Raynal <miquel.raynal@bootlin.com>,
        Lucas Stach <dev@lynxeye.de>, Stefan Agner <stefan@agner.ch>,
        Adrian Hunter <adrian.hunter@intel.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>
Cc:     linux-kernel@vger.kernel.org, linux-tegra@vger.kernel.org,
        linux-pm@vger.kernel.org, linux-usb@vger.kernel.org,
        linux-staging@lists.linux.dev, linux-spi@vger.kernel.org,
        linux-pwm@vger.kernel.org, linux-mtd@lists.infradead.org,
        linux-mmc@vger.kernel.org, linux-media@vger.kernel.org,
        dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
        linux-clk@vger.kernel.org
Subject: [PATCH v11 03/34] soc/tegra: pmc: Disable PMC state syncing
Date:   Sun, 12 Sep 2021 23:08:01 +0300
Message-Id: <20210912200832.12312-4-digetx@gmail.com>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20210912200832.12312-1-digetx@gmail.com>
References: <20210912200832.12312-1-digetx@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Disable PMC state syncing in order to ensure that we won't break older
kernels once device-trees will be updated with the addition of the power
domains. This also allows to apply device-tree PM patches independently
from the driver patches.

Signed-off-by: Dmitry Osipenko <digetx@gmail.com>
---
 drivers/soc/tegra/pmc.c | 17 +++++++++++++++++
 1 file changed, 17 insertions(+)

diff --git a/drivers/soc/tegra/pmc.c b/drivers/soc/tegra/pmc.c
index 50091c4ec948..fb8faf7b226a 100644
--- a/drivers/soc/tegra/pmc.c
+++ b/drivers/soc/tegra/pmc.c
@@ -360,6 +360,7 @@ struct tegra_pmc_soc {
 	unsigned int num_pmc_clks;
 	bool has_blink_output;
 	bool has_usb_sleepwalk;
+	bool supports_core_domain;
 };
 
 /**
@@ -3041,6 +3042,7 @@ static void tegra20_pmc_setup_irq_polarity(struct tegra_pmc *pmc,
 }
 
 static const struct tegra_pmc_soc tegra20_pmc_soc = {
+	.supports_core_domain = false,
 	.num_powergates = ARRAY_SIZE(tegra20_powergates),
 	.powergates = tegra20_powergates,
 	.num_cpu_powergates = 0,
@@ -3101,6 +3103,7 @@ static const char * const tegra30_reset_sources[] = {
 };
 
 static const struct tegra_pmc_soc tegra30_pmc_soc = {
+	.supports_core_domain = false,
 	.num_powergates = ARRAY_SIZE(tegra30_powergates),
 	.powergates = tegra30_powergates,
 	.num_cpu_powergates = ARRAY_SIZE(tegra30_cpu_powergates),
@@ -3157,6 +3160,7 @@ static const u8 tegra114_cpu_powergates[] = {
 };
 
 static const struct tegra_pmc_soc tegra114_pmc_soc = {
+	.supports_core_domain = false,
 	.num_powergates = ARRAY_SIZE(tegra114_powergates),
 	.powergates = tegra114_powergates,
 	.num_cpu_powergates = ARRAY_SIZE(tegra114_cpu_powergates),
@@ -3273,6 +3277,7 @@ static const struct pinctrl_pin_desc tegra124_pin_descs[] = {
 };
 
 static const struct tegra_pmc_soc tegra124_pmc_soc = {
+	.supports_core_domain = false,
 	.num_powergates = ARRAY_SIZE(tegra124_powergates),
 	.powergates = tegra124_powergates,
 	.num_cpu_powergates = ARRAY_SIZE(tegra124_cpu_powergates),
@@ -3398,6 +3403,7 @@ static const struct tegra_wake_event tegra210_wake_events[] = {
 };
 
 static const struct tegra_pmc_soc tegra210_pmc_soc = {
+	.supports_core_domain = false,
 	.num_powergates = ARRAY_SIZE(tegra210_powergates),
 	.powergates = tegra210_powergates,
 	.num_cpu_powergates = ARRAY_SIZE(tegra210_cpu_powergates),
@@ -3555,6 +3561,7 @@ static const struct tegra_wake_event tegra186_wake_events[] = {
 };
 
 static const struct tegra_pmc_soc tegra186_pmc_soc = {
+	.supports_core_domain = false,
 	.num_powergates = 0,
 	.powergates = NULL,
 	.num_cpu_powergates = 0,
@@ -3689,6 +3696,7 @@ static const struct tegra_wake_event tegra194_wake_events[] = {
 };
 
 static const struct tegra_pmc_soc tegra194_pmc_soc = {
+	.supports_core_domain = false,
 	.num_powergates = 0,
 	.powergates = NULL,
 	.num_cpu_powergates = 0,
@@ -3757,6 +3765,7 @@ static const char * const tegra234_reset_sources[] = {
 };
 
 static const struct tegra_pmc_soc tegra234_pmc_soc = {
+	.supports_core_domain = false,
 	.num_powergates = 0,
 	.powergates = NULL,
 	.num_cpu_powergates = 0,
@@ -3803,6 +3812,14 @@ static void tegra_pmc_sync_state(struct device *dev)
 {
 	int err;
 
+	/*
+	 * Newer device-trees have power domains, but we need to prepare all
+	 * device drivers with runtime PM and OPP support first, otherwise
+	 * state syncing is unsafe.
+	 */
+	if (!pmc->soc->supports_core_domain)
+		return;
+
 	/*
 	 * Older device-trees don't have core PD, and thus, there are
 	 * no dependencies that will block the state syncing. We shouldn't
-- 
2.32.0

