Return-Path: <linux-media+bounces-60616-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id oN8iOjdG+2lPYgMAu9opvQ
	(envelope-from <linux-media+bounces-60616-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Wed, 06 May 2026 15:46:31 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 8DCB14DB471
	for <lists+linux-media@lfdr.de>; Wed, 06 May 2026 15:46:31 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id C427B309FA40
	for <lists+linux-media@lfdr.de>; Wed,  6 May 2026 13:43:10 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F1BDA47ECE3;
	Wed,  6 May 2026 13:42:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Ap1J+KX6"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5CE0346AF16;
	Wed,  6 May 2026 13:42:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778074970; cv=none; b=i76Tx5XQdOaZzWoQDLryaolNGL4KvBK41iKrfLLYCUYiKNIhUP6tIQKflnKe3NIrcLlAt4PCB1IM+VSsUOy4GGO8FZLbLmN6znM/kAWzH/oeoyAzJkdwBbaE5KNzR9yRWbdXObiuIfAzFhirrWUdf2/ONkUycDrS4YAI/SLbfGs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778074970; c=relaxed/simple;
	bh=8clIhaG9YT+RicfNbrRJG1fzZK7c593cBoVydv8+je0=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=HbmR5a7wwnZOTFKcK/ODwBahQkm3yAYZ0hJz6rzTDrDK0eGAS+A0+91JO5maoOjilEHvpxTcY6hT0AyjZl8KDTn/N3NXjI1Km8C7oQtZuG00XFWa/n6ZAbammHLow8Ouesq7JzziYaZ8mawxDNhY/gl0NU5xT1091QGGsb8SHm0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Ap1J+KX6; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E8FC5C2BCB8;
	Wed,  6 May 2026 13:42:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1778074970;
	bh=8clIhaG9YT+RicfNbrRJG1fzZK7c593cBoVydv8+je0=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=Ap1J+KX6D+abcfbsFFSliI+BiD2p3yOoMy3Zr3WwBOdo7/3uM79CwAn9N/CuoOZ+/
	 woEtsubpWmET1bjIwaDT3nUjkbtsek7AQqyUrtpDdUqmD/rqyurnYTG+qUb/bqUxwc
	 prlRSEdKiu1Az141DnKzbkYm4QgM/sfXdV7/vjH2+sRsKfaYUZSIaPQJZQjcVnqFxU
	 /1pM5CeXE4Txr85tZz8V/CM5haea7bjmY6rAVUyf7GLIIILvN2iaxQy1s5NZuLWDA9
	 N3+O4jN3oEiJmZzO51mJVmlZ5bYcAf5BFFS0OFrR2axBZg58qVlP8NRYojchETbIMw
	 bUzGk6fQ4K0iA==
From: Thierry Reding <thierry.reding@kernel.org>
Date: Wed, 06 May 2026 15:42:00 +0200
Subject: [PATCH 9/9] soc/tegra: pmc: Move legacy code behind CONFIG_ARM
 guard
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260506-pmc-v1-9-a6de5da7216b@nvidia.com>
References: <20260506-pmc-v1-0-a6de5da7216b@nvidia.com>
In-Reply-To: <20260506-pmc-v1-0-a6de5da7216b@nvidia.com>
To: Damien Le Moal <dlemoal@kernel.org>, Niklas Cassel <cassel@kernel.org>, 
 Thierry Reding <thierry.reding@kernel.org>, 
 Jonathan Hunter <jonathanh@nvidia.com>, Lyude Paul <lyude@redhat.com>, 
 Danilo Krummrich <dakr@kernel.org>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Mikko Perttunen <mperttunen@nvidia.com>, Dmitry Osipenko <digetx@gmail.com>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>, 
 Lorenzo Pieralisi <lpieralisi@kernel.org>, 
 =?utf-8?q?Krzysztof_Wilczy=C5=84ski?= <kwilczynski@kernel.org>, 
 Manivannan Sadhasivam <mani@kernel.org>, Rob Herring <robh@kernel.org>, 
 Bjorn Helgaas <bhelgaas@google.com>, 
 Mathias Nyman <mathias.nyman@intel.com>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 Philipp Zabel <p.zabel@pengutronix.de>
Cc: linux-ide@vger.kernel.org, linux-tegra@vger.kernel.org, 
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org, 
 nouveau@lists.freedesktop.org, linux-media@vger.kernel.org, 
 linux-pci@vger.kernel.org, linux-usb@vger.kernel.org, 
 Thierry Reding <treding@nvidia.com>
X-Mailer: b4 0.15.1
X-Developer-Signature: v=1; a=openpgp-sha256; l=11347; i=treding@nvidia.com;
 h=from:subject:message-id; bh=rnaTW07ykMQIUMrTm2x41oL5ZIPzV0A53TZ/cWTcvIk=;
 b=owEBbQKS/ZANAwAKAd0jrNd/PrOhAcsmYgBp+0Uw+Om1CC6cWGLXkcsRH4QOzUfPEehLKUXB+
 /aWRr/jutiJAjMEAAEKAB0WIQSI6sMIAUnM98CNyJ/dI6zXfz6zoQUCaftFMAAKCRDdI6zXfz6z
 ofO5D/4n6GWlwbtRKEFnXQPHzN+4U2vIXY7E/Q4XCMNpcLlktsuaOWLcAUr6cafqI7LOf5XGcPS
 Wj9loKFIMs7ozQCBRafPYWCy+8kPy9kUHsjf6JznJ9u9fymj3R6NgZVIv5WQYsg4LlMB93lp48M
 eYqGkGxih+tFqNhINd2FETG/86cTg2QDw1C3dnnSg2HxW1tDiYJmIRbkjcMs9JPBNxUk7pVHvss
 zqSzgxXSLbIQvh62YHNMqWWpX+guAPedavt1Duzas2P0hl7Fe8PIfUcnDdXZNrzf68hw4IT8XD3
 4GYVr3knvs1mmWvaA8fCnsyFDUmQKUFIfSjR4R/RGecba/fhcr9Ma+92jUhfRXeD7j4hn+lsRod
 S9i4uEG2UlEu+V6QUaJ+CC0okb27pU7Q/G16Ws2UBZcIaEr0jlSo0BERJfvKN4FfZibw2TMiGRU
 h2l00BFL7BZ8FMqEIvKU1GXAjyGEtV+ydWaimoMaz7msHmdC/Ggw9IfWAPpq0PtbwPlQ5aBEDdR
 NMAaaZsy8LA3KyTBm4YW+IrPGDYzsiNHg8qvnba0IzjOopAnv1I948Zgg74LvJrxDjVkOFAIDgo
 6Y6Qg65xdFlvMgVglXomSHtYoKqg/lbE3RxgRxnhNI9m8gmEwZDV2PshyeaTYtSylMM8fVN/l7B
 /Roh/kWUeC0ipUw==
X-Developer-Key: i=treding@nvidia.com; a=openpgp;
 fpr=88EAC3080149CCF7C08DC89FDD23ACD77F3EB3A1
X-Rspamd-Queue-Id: 8DCB14DB471
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FREEMAIL_TO(0.00)[kernel.org,nvidia.com,redhat.com,linux.intel.com,suse.de,gmail.com,ffwll.ch,google.com,intel.com,linuxfoundation.org,pengutronix.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-60616-lists,linux-media=lfdr.de];
	RCPT_COUNT_TWELVE(0.00)[31];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[thierry.reding@kernel.org,linux-media@vger.kernel.org];
	DKIM_TRACE(0.00)[kernel.org:+];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-media];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[nvidia.com:mid,nvidia.com:email,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns]

From: Thierry Reding <treding@nvidia.com>

None of this legacy code is needed on 64-bit ARM devices, so it can be
moved behind a corresponding preprocessor guard. This more cleanly
separates out the legacy code from code needed on current platforms.

Signed-off-by: Thierry Reding <treding@nvidia.com>
---
Changes in v2:
- fix build issue for ARM && !PM_SLEEP
---
 drivers/soc/tegra/pmc.c | 244 +++++++++++++++++++++++++-----------------------
 include/soc/tegra/pmc.h |  42 ++++-----
 2 files changed, 147 insertions(+), 139 deletions(-)

diff --git a/drivers/soc/tegra/pmc.c b/drivers/soc/tegra/pmc.c
index f25c8e73475c..210ee5124119 100644
--- a/drivers/soc/tegra/pmc.c
+++ b/drivers/soc/tegra/pmc.c
@@ -512,10 +512,12 @@ struct tegra_pmc {
 	u32 *wake_status;
 };
 
+#if defined(CONFIG_ARM)
 static struct tegra_pmc *early_pmc = &(struct tegra_pmc) {
 	.base = NULL,
 	.suspend_mode = TEGRA_SUSPEND_NOT_READY,
 };
+#endif
 
 static inline struct tegra_powergate *
 to_powergate(struct generic_pm_domain *domain)
@@ -1151,68 +1153,6 @@ int tegra_pmc_powergate_sequence_power_up(struct tegra_pmc *pmc,
 }
 EXPORT_SYMBOL(tegra_pmc_powergate_sequence_power_up);
 
-/**
- * tegra_get_cpu_powergate_id() - convert from CPU ID to partition ID
- * @pmc: power management controller
- * @cpuid: CPU partition ID
- *
- * Returns the partition ID corresponding to the CPU partition ID or a
- * negative error code on failure.
- */
-static int tegra_get_cpu_powergate_id(struct tegra_pmc *pmc,
-				      unsigned int cpuid)
-{
-	if (pmc->soc && cpuid < pmc->soc->num_cpu_powergates)
-		return pmc->soc->cpu_powergates[cpuid];
-
-	return -EINVAL;
-}
-
-/**
- * tegra_pmc_cpu_is_powered() - check if CPU partition is powered
- * @cpuid: CPU partition ID
- */
-bool tegra_pmc_cpu_is_powered(unsigned int cpuid)
-{
-	int id;
-
-	id = tegra_get_cpu_powergate_id(early_pmc, cpuid);
-	if (id < 0)
-		return false;
-
-	return tegra_powergate_is_powered(early_pmc, id);
-}
-
-/**
- * tegra_pmc_cpu_power_on() - power on CPU partition
- * @cpuid: CPU partition ID
- */
-int tegra_pmc_cpu_power_on(unsigned int cpuid)
-{
-	int id;
-
-	id = tegra_get_cpu_powergate_id(early_pmc, cpuid);
-	if (id < 0)
-		return id;
-
-	return tegra_powergate_set(early_pmc, id, true);
-}
-
-/**
- * tegra_pmc_cpu_remove_clamping() - remove power clamps for CPU partition
- * @cpuid: CPU partition ID
- */
-int tegra_pmc_cpu_remove_clamping(unsigned int cpuid)
-{
-	int id;
-
-	id = tegra_get_cpu_powergate_id(early_pmc, cpuid);
-	if (id < 0)
-		return id;
-
-	return tegra_pmc_powergate_remove_clamping(early_pmc, id);
-}
-
 static void tegra_pmc_program_reboot_reason(struct tegra_pmc *pmc,
 					    const char *cmd)
 {
@@ -1486,11 +1426,6 @@ static int tegra_powergate_add(struct tegra_pmc *pmc, struct device_node *np)
 	return err;
 }
 
-bool tegra_pmc_core_domain_state_synced(void)
-{
-	return early_pmc->core_domain_state_synced;
-}
-
 static int
 tegra_pmc_core_pd_set_performance_state(struct generic_pm_domain *genpd,
 					unsigned int level)
@@ -1904,57 +1839,6 @@ static int tegra_io_pad_get_voltage(struct tegra_pmc *pmc, enum tegra_io_pad id)
 	return TEGRA_IO_PAD_VOLTAGE_3V3;
 }
 
-#ifdef CONFIG_PM_SLEEP
-enum tegra_suspend_mode tegra_pmc_get_suspend_mode(void)
-{
-	return early_pmc->suspend_mode;
-}
-
-void tegra_pmc_set_suspend_mode(enum tegra_suspend_mode mode)
-{
-	if (mode < TEGRA_SUSPEND_NONE || mode >= TEGRA_MAX_SUSPEND_MODE)
-		return;
-
-	early_pmc->suspend_mode = mode;
-}
-
-void tegra_pmc_enter_suspend_mode(enum tegra_suspend_mode mode)
-{
-	unsigned long long rate = 0;
-	u64 ticks;
-	u32 value;
-
-	switch (mode) {
-	case TEGRA_SUSPEND_LP1:
-		rate = 32768;
-		break;
-
-	case TEGRA_SUSPEND_LP2:
-		rate = early_pmc->rate;
-		break;
-
-	default:
-		break;
-	}
-
-	if (WARN_ON_ONCE(rate == 0))
-		rate = 100000000;
-
-	ticks = early_pmc->cpu_good_time * rate + USEC_PER_SEC - 1;
-	do_div(ticks, USEC_PER_SEC);
-	tegra_pmc_writel(early_pmc, ticks, PMC_CPUPWRGOOD_TIMER);
-
-	ticks = early_pmc->cpu_off_time * rate + USEC_PER_SEC - 1;
-	do_div(ticks, USEC_PER_SEC);
-	tegra_pmc_writel(early_pmc, ticks, PMC_CPUPWROFF_TIMER);
-
-	value = tegra_pmc_readl(early_pmc, PMC_CNTRL);
-	value &= ~PMC_CNTRL_SIDE_EFFECT_LP0;
-	value |= PMC_CNTRL_CPU_PWRREQ_OE;
-	tegra_pmc_writel(early_pmc, value, PMC_CNTRL);
-}
-#endif
-
 static int tegra_pmc_parse_dt(struct tegra_pmc *pmc, struct device_node *np)
 {
 	u32 value, values[2];
@@ -3092,6 +2976,7 @@ static int tegra_pmc_probe(struct platform_device *pdev)
 	struct resource *res;
 	int err;
 
+#if defined(CONFIG_ARM)
 	/*
 	 * Early initialisation should have configured an initial
 	 * register mapping and setup the soc data pointer. If these
@@ -3099,6 +2984,7 @@ static int tegra_pmc_probe(struct platform_device *pdev)
 	 */
 	if (WARN_ON(!early_pmc->base || !early_pmc->soc))
 		return -ENODEV;
+#endif
 
 	pmc = devm_kzalloc(&pdev->dev, sizeof(*pmc), GFP_KERNEL);
 	if (!pmc)
@@ -3247,10 +3133,12 @@ static int tegra_pmc_probe(struct platform_device *pdev)
 	if (err < 0)
 		goto cleanup_powergates;
 
+#if defined(CONFIG_ARM)
 	mutex_lock(&early_pmc->powergates_lock);
 	iounmap(early_pmc->base);
 	early_pmc->base = pmc->base;
 	mutex_unlock(&early_pmc->powergates_lock);
+#endif
 
 	tegra_pmc_clock_register(pmc, pdev->dev.of_node);
 	platform_set_drvdata(pdev, pmc);
@@ -4833,6 +4721,125 @@ static struct platform_driver tegra_pmc_driver = {
 };
 builtin_platform_driver(tegra_pmc_driver);
 
+#if defined(CONFIG_ARM)
+/**
+ * tegra_get_cpu_powergate_id() - convert from CPU ID to partition ID
+ * @pmc: power management controller
+ * @cpuid: CPU partition ID
+ *
+ * Returns the partition ID corresponding to the CPU partition ID or a
+ * negative error code on failure.
+ */
+static int tegra_get_cpu_powergate_id(struct tegra_pmc *pmc,
+				      unsigned int cpuid)
+{
+	if (pmc->soc && cpuid < pmc->soc->num_cpu_powergates)
+		return pmc->soc->cpu_powergates[cpuid];
+
+	return -EINVAL;
+}
+
+/**
+ * tegra_pmc_cpu_is_powered() - check if CPU partition is powered
+ * @cpuid: CPU partition ID
+ */
+bool tegra_pmc_cpu_is_powered(unsigned int cpuid)
+{
+	int id;
+
+	id = tegra_get_cpu_powergate_id(early_pmc, cpuid);
+	if (id < 0)
+		return false;
+
+	return tegra_powergate_is_powered(early_pmc, id);
+}
+
+/**
+ * tegra_pmc_cpu_power_on() - power on CPU partition
+ * @cpuid: CPU partition ID
+ */
+int tegra_pmc_cpu_power_on(unsigned int cpuid)
+{
+	int id;
+
+	id = tegra_get_cpu_powergate_id(early_pmc, cpuid);
+	if (id < 0)
+		return id;
+
+	return tegra_powergate_set(early_pmc, id, true);
+}
+
+/**
+ * tegra_pmc_cpu_remove_clamping() - remove power clamps for CPU partition
+ * @cpuid: CPU partition ID
+ */
+int tegra_pmc_cpu_remove_clamping(unsigned int cpuid)
+{
+	int id;
+
+	id = tegra_get_cpu_powergate_id(early_pmc, cpuid);
+	if (id < 0)
+		return id;
+
+	return tegra_pmc_powergate_remove_clamping(early_pmc, id);
+}
+
+bool tegra_pmc_core_domain_state_synced(void)
+{
+	return early_pmc->core_domain_state_synced;
+}
+
+#ifdef CONFIG_PM_SLEEP
+enum tegra_suspend_mode tegra_pmc_get_suspend_mode(void)
+{
+	return early_pmc->suspend_mode;
+}
+
+void tegra_pmc_set_suspend_mode(enum tegra_suspend_mode mode)
+{
+	if (mode < TEGRA_SUSPEND_NONE || mode >= TEGRA_MAX_SUSPEND_MODE)
+		return;
+
+	early_pmc->suspend_mode = mode;
+}
+
+void tegra_pmc_enter_suspend_mode(enum tegra_suspend_mode mode)
+{
+	unsigned long long rate = 0;
+	u64 ticks;
+	u32 value;
+
+	switch (mode) {
+	case TEGRA_SUSPEND_LP1:
+		rate = 32768;
+		break;
+
+	case TEGRA_SUSPEND_LP2:
+		rate = early_pmc->rate;
+		break;
+
+	default:
+		break;
+	}
+
+	if (WARN_ON_ONCE(rate == 0))
+		rate = 100000000;
+
+	ticks = early_pmc->cpu_good_time * rate + USEC_PER_SEC - 1;
+	do_div(ticks, USEC_PER_SEC);
+	tegra_pmc_writel(early_pmc, ticks, PMC_CPUPWRGOOD_TIMER);
+
+	ticks = early_pmc->cpu_off_time * rate + USEC_PER_SEC - 1;
+	do_div(ticks, USEC_PER_SEC);
+	tegra_pmc_writel(early_pmc, ticks, PMC_CPUPWROFF_TIMER);
+
+	value = tegra_pmc_readl(early_pmc, PMC_CNTRL);
+	value &= ~PMC_CNTRL_SIDE_EFFECT_LP0;
+	value |= PMC_CNTRL_CPU_PWRREQ_OE;
+	tegra_pmc_writel(early_pmc, value, PMC_CNTRL);
+}
+#endif /* CONFIG_PM_SLEEP */
+
 /*
  * Early initialization to allow access to registers in the very early boot
  * process.
@@ -4911,3 +4918,4 @@ static int __init tegra_pmc_early_init(void)
 	return 0;
 }
 early_initcall(tegra_pmc_early_init);
+#endif /* CONFIG_ARM */
diff --git a/include/soc/tegra/pmc.h b/include/soc/tegra/pmc.h
index 8b4bcdea849e..4bcbf19d75ac 100644
--- a/include/soc/tegra/pmc.h
+++ b/include/soc/tegra/pmc.h
@@ -18,10 +18,6 @@ struct clk;
 struct reset_control;
 struct tegra_pmc;
 
-bool tegra_pmc_cpu_is_powered(unsigned int cpuid);
-int tegra_pmc_cpu_power_on(unsigned int cpuid);
-int tegra_pmc_cpu_remove_clamping(unsigned int cpuid);
-
 /*
  * powergate and I/O rail APIs
  */
@@ -163,12 +159,6 @@ int tegra_pmc_powergate_sequence_power_up(struct tegra_pmc *pmc,
 int tegra_pmc_io_pad_power_enable(struct tegra_pmc *pmc, enum tegra_io_pad id);
 int tegra_pmc_io_pad_power_disable(struct tegra_pmc *pmc, enum tegra_io_pad id);
 
-/* legacy */
-void tegra_pmc_set_suspend_mode(enum tegra_suspend_mode mode);
-void tegra_pmc_enter_suspend_mode(enum tegra_suspend_mode mode);
-
-bool tegra_pmc_core_domain_state_synced(void);
-
 #else
 static inline struct tegra_pmc *devm_tegra_pmc_get(struct device *dev)
 {
@@ -213,28 +203,38 @@ tegra_pmc_io_pad_power_disable(struct tegra_pmc *pmc, enum tegra_io_pad id)
 {
 	return -ENOSYS;
 }
+#endif /* CONFIG_SOC_TEGRA_PMC */
 
-static inline void tegra_pmc_set_suspend_mode(enum tegra_suspend_mode mode)
+/* 32-bit ARM platforms only */
+#if defined(CONFIG_ARM)
+bool tegra_pmc_cpu_is_powered(unsigned int cpuid);
+int tegra_pmc_cpu_power_on(unsigned int cpuid);
+int tegra_pmc_cpu_remove_clamping(unsigned int cpuid);
+bool tegra_pmc_core_domain_state_synced(void);
+
+#if defined(CONFIG_SOC_TEGRA_PMC) && defined(CONFIG_PM_SLEEP)
+enum tegra_suspend_mode tegra_pmc_get_suspend_mode(void);
+void tegra_pmc_set_suspend_mode(enum tegra_suspend_mode mode);
+void tegra_pmc_enter_suspend_mode(enum tegra_suspend_mode mode);
+#else
+static inline enum tegra_suspend_mode tegra_pmc_get_suspend_mode(void)
 {
+	return TEGRA_SUSPEND_NONE;
 }
 
-static inline void tegra_pmc_enter_suspend_mode(enum tegra_suspend_mode mode)
+static inline void tegra_pmc_set_suspend_mode(enum tegra_suspend_mode mode)
 {
 }
 
-static inline bool tegra_pmc_core_domain_state_synced(void)
+static inline void tegra_pmc_enter_suspend_mode(enum tegra_suspend_mode mode)
 {
-	return false;
 }
-
-#endif /* CONFIG_SOC_TEGRA_PMC */
-
-#if defined(CONFIG_SOC_TEGRA_PMC) && defined(CONFIG_PM_SLEEP)
-enum tegra_suspend_mode tegra_pmc_get_suspend_mode(void);
+#endif
 #else
-static inline enum tegra_suspend_mode tegra_pmc_get_suspend_mode(void)
+/* needed for COMPILE_TEST */
+static inline bool tegra_pmc_core_domain_state_synced(void)
 {
-	return TEGRA_SUSPEND_NONE;
+	return false;
 }
 #endif
 

-- 
2.52.0


