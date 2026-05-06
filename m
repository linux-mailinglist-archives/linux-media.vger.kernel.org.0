Return-Path: <linux-media+bounces-60614-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id YCjMFNBF+2kFYwMAu9opvQ
	(envelope-from <linux-media+bounces-60614-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Wed, 06 May 2026 15:44:48 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id B7DF64DB3DC
	for <lists+linux-media@lfdr.de>; Wed, 06 May 2026 15:44:47 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id D41ED308243B
	for <lists+linux-media@lfdr.de>; Wed,  6 May 2026 13:42:49 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D272347CC6F;
	Wed,  6 May 2026 13:42:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="QROSwP7d"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2F67F477E41;
	Wed,  6 May 2026 13:42:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778074961; cv=none; b=ui2MMFN1qw0U6p5qc+k0iGmrNUGl11w4NAg0Gb3Vq4PjVdI3DqE6hhKknBtDdYYXHlLNaphgvpVGZUWYqRp7Xv9MjsTmyX/yWcd3yha1VbMZFhCm3NVpVEinHe8dn+1O+/wwTchYMVwrfX+CJHgPMtAFsIqEaAHwlnomnS8L+z8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778074961; c=relaxed/simple;
	bh=GzvYqLBHa10ogEHwvgCnoArzT31y2X8S61UB92LEw+0=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=KuuWCGy5z4t3sQo5BROjBN9xW/9JHCoxdK42BZUOL+AzUg3CmoWEq21xd6bO5/2EZKevsczleidYBD8et5iTuVp/wg16DV2Ws5EmvUflnA6NOFkhckYwRTGslFs8V/dmInB2SwvNV7B77T4sCS2Ly04vsJXEFpChE7qM47op1Q0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=QROSwP7d; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A467BC2BCB8;
	Wed,  6 May 2026 13:42:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1778074960;
	bh=GzvYqLBHa10ogEHwvgCnoArzT31y2X8S61UB92LEw+0=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=QROSwP7dCYpy++6YGkFnlerA6jokOc9Q5MpG9kpJq3pAdpp97nzKQaK+9Kw/sYwqU
	 GZA9YJkVu10OqqVyCi1j+MLedrSpwPJBL80Jvciq8jRHQWCj+5YbUB0wa7zPQy4F9f
	 lQlQfqvQG/L+VuJx2g03QD8re3gJCkZD+7w727QoTSteoscZOx8RHNRISumA6EPAlM
	 mbeS2czuAHh2BqxEU2CK8VSkHLjbqjdIBbYRcZH60bxXBvYOH5pLwQWsIN8jeRQF/Q
	 gmr8nwxbDiLtdxN94k6B9uINsJVInCkX+aYHnOEXi28/kXXfRni8gFvYKf4rRRpr47
	 +Vza1leGoQt3g==
From: Thierry Reding <thierry.reding@kernel.org>
Date: Wed, 06 May 2026 15:41:58 +0200
Subject: [PATCH 7/9] soc/tegra: pmc: Create PMC context dynamically
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260506-pmc-v1-7-a6de5da7216b@nvidia.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=12390; i=treding@nvidia.com;
 h=from:subject:message-id; bh=ieQNrDMUI2HLi2qVsTf9kfTL6HO37KXQx0E4QZcdDNY=;
 b=owEBbQKS/ZANAwAKAd0jrNd/PrOhAcsmYgBp+0UwJ11ZPOdKaa8TMCKvQdd/49Wr5o9NxpDbN
 0T9dNqMg8WJAjMEAAEKAB0WIQSI6sMIAUnM98CNyJ/dI6zXfz6zoQUCaftFMAAKCRDdI6zXfz6z
 oYmuEACQSBnFEOjhklSxB5iUwVE6ZYi/7wScPINyFetgzAPyQqJXwbdrPIHmq/Vg5AEIvqDHvY/
 IRdCm388t/X67AThMIbcu/zzv+T+wM5ADI2CY2p+xNqLyfDJJHkt0y6MwU/l2jei6oyeBbUQfpj
 GLHQR9B8uoCJxTvcaZ2ZqtfOGHMdfYx7OevSu0i4Now1AE+wFSll4o9ZwOXH+YoVSF0G0TbzELc
 GYLuGBJcAwXC/yscD7S+bJFax7tA9TP39/4filRhG5BqRVmoxOWJohXbOT4geLuAIBrr2yWlpRw
 Y1Lv1blKbavUOMgFFR4z0AEdpqL5EyadOg72hT8cSB9j+l4nwJfN9RGMQuQHG7f7j33R5ysDA18
 jn0EmJla8T3O4xDcWj9tUQmvhaiuQ/CRHVSHMZS/7+UK49GANW06TJ3ksyOZ9cQnHUzxAPXriN4
 aQPXqU5dvirKtSA+XfFDYt1qsBilkcUP2PqMsomD3Bnx1wGKbw5oR7gnso9hKeRwHvwN9p0L7uo
 fiV8cEM9a8A4moa1iSqvi7hVCpUSTCZ3UAeJ06NjkJ3JTaLKA+WrQVT1rYXS7bprsg/UKZrz06l
 G/qMUn3glYOSIRrIW3A5uGjDmQIJmaEYgT3vSQLnnRMoKYp8s/qJblQmk+7I6GIG/YThXQPaoZY
 QjQn/4E2iEAG8LA==
X-Developer-Key: i=treding@nvidia.com; a=openpgp;
 fpr=88EAC3080149CCF7C08DC89FDD23ACD77F3EB3A1
X-Rspamd-Queue-Id: B7DF64DB3DC
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FREEMAIL_TO(0.00)[kernel.org,nvidia.com,redhat.com,linux.intel.com,suse.de,gmail.com,ffwll.ch,google.com,intel.com,linuxfoundation.org,pengutronix.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-60614-lists,linux-media=lfdr.de];
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
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,nvidia.com:mid,nvidia.com:email]

From: Thierry Reding <treding@nvidia.com>

For legacy purposes, an early PMC context is needed to support certain
drivers and functionalities. However, when the PMC driver is probed in
the later boot stages, the early context is no longer needed. Allocate
the PMC context dynamically at probe time so that it can be used going
forward.

While at it, rename the early PMC context to more accurately reflect
what it is used for. It's technically not only for early boot stages,
but also to support some code that doesn't have a way of obtaining the
correct context otherwise (e.g. no access to device tree).

Signed-off-by: Thierry Reding <treding@nvidia.com>
---
 drivers/soc/tegra/pmc.c | 163 ++++++++++++++++++++++++++----------------------
 1 file changed, 88 insertions(+), 75 deletions(-)

diff --git a/drivers/soc/tegra/pmc.c b/drivers/soc/tegra/pmc.c
index 2ee6539d796a..50969b07fd8c 100644
--- a/drivers/soc/tegra/pmc.c
+++ b/drivers/soc/tegra/pmc.c
@@ -512,7 +512,7 @@ struct tegra_pmc {
 	u32 *wake_status;
 };
 
-static struct tegra_pmc *pmc = &(struct tegra_pmc) {
+static struct tegra_pmc *early_pmc = &(struct tegra_pmc) {
 	.base = NULL,
 	.suspend_mode = TEGRA_SUSPEND_NOT_READY,
 };
@@ -1069,7 +1069,7 @@ EXPORT_SYMBOL(tegra_pmc_powergate_power_on);
  */
 int tegra_powergate_power_on(unsigned int id)
 {
-	return tegra_pmc_powergate_power_on(pmc, id);
+	return tegra_pmc_powergate_power_on(early_pmc, id);
 }
 EXPORT_SYMBOL(tegra_powergate_power_on);
 
@@ -1093,7 +1093,7 @@ EXPORT_SYMBOL(tegra_pmc_powergate_power_off);
  */
 int tegra_powergate_power_off(unsigned int id)
 {
-	return tegra_pmc_powergate_power_off(pmc, id);
+	return tegra_pmc_powergate_power_off(early_pmc, id);
 }
 EXPORT_SYMBOL(tegra_powergate_power_off);
 
@@ -1130,7 +1130,7 @@ EXPORT_SYMBOL(tegra_pmc_powergate_remove_clamping);
  */
 int tegra_powergate_remove_clamping(unsigned int id)
 {
-	return tegra_pmc_powergate_remove_clamping(pmc, id);
+	return tegra_pmc_powergate_remove_clamping(early_pmc, id);
 }
 EXPORT_SYMBOL(tegra_powergate_remove_clamping);
 
@@ -1192,7 +1192,7 @@ EXPORT_SYMBOL(tegra_pmc_powergate_sequence_power_up);
 int tegra_powergate_sequence_power_up(unsigned int id, struct clk *clk,
 				      struct reset_control *rst)
 {
-	return tegra_pmc_powergate_sequence_power_up(pmc, id, clk, rst);
+	return tegra_pmc_powergate_sequence_power_up(early_pmc, id, clk, rst);
 }
 EXPORT_SYMBOL(tegra_powergate_sequence_power_up);
 
@@ -1221,11 +1221,11 @@ bool tegra_pmc_cpu_is_powered(unsigned int cpuid)
 {
 	int id;
 
-	id = tegra_get_cpu_powergate_id(pmc, cpuid);
+	id = tegra_get_cpu_powergate_id(early_pmc, cpuid);
 	if (id < 0)
 		return false;
 
-	return tegra_powergate_is_powered(pmc, id);
+	return tegra_powergate_is_powered(early_pmc, id);
 }
 
 /**
@@ -1236,11 +1236,11 @@ int tegra_pmc_cpu_power_on(unsigned int cpuid)
 {
 	int id;
 
-	id = tegra_get_cpu_powergate_id(pmc, cpuid);
+	id = tegra_get_cpu_powergate_id(early_pmc, cpuid);
 	if (id < 0)
 		return id;
 
-	return tegra_powergate_set(pmc, id, true);
+	return tegra_powergate_set(early_pmc, id, true);
 }
 
 /**
@@ -1251,11 +1251,11 @@ int tegra_pmc_cpu_remove_clamping(unsigned int cpuid)
 {
 	int id;
 
-	id = tegra_get_cpu_powergate_id(pmc, cpuid);
+	id = tegra_get_cpu_powergate_id(early_pmc, cpuid);
 	if (id < 0)
 		return id;
 
-	return tegra_powergate_remove_clamping(id);
+	return tegra_pmc_powergate_remove_clamping(early_pmc, id);
 }
 
 static void tegra_pmc_program_reboot_reason(struct tegra_pmc *pmc,
@@ -1533,7 +1533,7 @@ static int tegra_powergate_add(struct tegra_pmc *pmc, struct device_node *np)
 
 bool tegra_pmc_core_domain_state_synced(void)
 {
-	return pmc->core_domain_state_synced;
+	return early_pmc->core_domain_state_synced;
 }
 
 static int
@@ -1831,7 +1831,7 @@ EXPORT_SYMBOL(tegra_pmc_io_pad_power_enable);
  */
 int tegra_io_pad_power_enable(enum tegra_io_pad id)
 {
-	return tegra_pmc_io_pad_power_enable(pmc, id);
+	return tegra_pmc_io_pad_power_enable(early_pmc, id);
 }
 EXPORT_SYMBOL(tegra_io_pad_power_enable);
 
@@ -1887,7 +1887,7 @@ EXPORT_SYMBOL(tegra_pmc_io_pad_power_disable);
  */
 int tegra_io_pad_power_disable(enum tegra_io_pad id)
 {
-	return tegra_pmc_io_pad_power_disable(pmc, id);
+	return tegra_pmc_io_pad_power_disable(early_pmc, id);
 }
 EXPORT_SYMBOL(tegra_io_pad_power_disable);
 
@@ -1976,7 +1976,7 @@ static int tegra_io_pad_get_voltage(struct tegra_pmc *pmc, enum tegra_io_pad id)
 #ifdef CONFIG_PM_SLEEP
 enum tegra_suspend_mode tegra_pmc_get_suspend_mode(void)
 {
-	return pmc->suspend_mode;
+	return early_pmc->suspend_mode;
 }
 
 void tegra_pmc_set_suspend_mode(enum tegra_suspend_mode mode)
@@ -1984,7 +1984,7 @@ void tegra_pmc_set_suspend_mode(enum tegra_suspend_mode mode)
 	if (mode < TEGRA_SUSPEND_NONE || mode >= TEGRA_MAX_SUSPEND_MODE)
 		return;
 
-	pmc->suspend_mode = mode;
+	early_pmc->suspend_mode = mode;
 }
 
 void tegra_pmc_enter_suspend_mode(enum tegra_suspend_mode mode)
@@ -1999,7 +1999,7 @@ void tegra_pmc_enter_suspend_mode(enum tegra_suspend_mode mode)
 		break;
 
 	case TEGRA_SUSPEND_LP2:
-		rate = pmc->rate;
+		rate = early_pmc->rate;
 		break;
 
 	default:
@@ -2009,18 +2009,18 @@ void tegra_pmc_enter_suspend_mode(enum tegra_suspend_mode mode)
 	if (WARN_ON_ONCE(rate == 0))
 		rate = 100000000;
 
-	ticks = pmc->cpu_good_time * rate + USEC_PER_SEC - 1;
+	ticks = early_pmc->cpu_good_time * rate + USEC_PER_SEC - 1;
 	do_div(ticks, USEC_PER_SEC);
-	tegra_pmc_writel(pmc, ticks, PMC_CPUPWRGOOD_TIMER);
+	tegra_pmc_writel(early_pmc, ticks, PMC_CPUPWRGOOD_TIMER);
 
-	ticks = pmc->cpu_off_time * rate + USEC_PER_SEC - 1;
+	ticks = early_pmc->cpu_off_time * rate + USEC_PER_SEC - 1;
 	do_div(ticks, USEC_PER_SEC);
-	tegra_pmc_writel(pmc, ticks, PMC_CPUPWROFF_TIMER);
+	tegra_pmc_writel(early_pmc, ticks, PMC_CPUPWROFF_TIMER);
 
-	value = tegra_pmc_readl(pmc, PMC_CNTRL);
+	value = tegra_pmc_readl(early_pmc, PMC_CNTRL);
 	value &= ~PMC_CNTRL_SIDE_EFFECT_LP0;
 	value |= PMC_CNTRL_CPU_PWRREQ_OE;
-	tegra_pmc_writel(pmc, value, PMC_CNTRL);
+	tegra_pmc_writel(early_pmc, value, PMC_CNTRL);
 }
 #endif
 
@@ -3110,6 +3110,44 @@ static int tegra_pmc_regmap_init(struct tegra_pmc *pmc)
 	return 0;
 }
 
+static bool tegra_pmc_detect_tz_only(struct tegra_pmc *pmc)
+{
+	u32 value, saved;
+
+	saved = readl(pmc->base + pmc->soc->regs->scratch0);
+	value = saved ^ 0xffffffff;
+
+	if (value == 0xffffffff)
+		value = 0xdeadbeef;
+
+	/* write pattern and read it back */
+	writel(value, pmc->base + pmc->soc->regs->scratch0);
+	value = readl(pmc->base + pmc->soc->regs->scratch0);
+
+	/* if we read all-zeroes, access is restricted to TZ only */
+	if (value == 0) {
+		pr_info("access to PMC is restricted to TZ\n");
+		return true;
+	}
+
+	/* restore original value */
+	writel(saved, pmc->base + pmc->soc->regs->scratch0);
+
+	return false;
+}
+
+static void tegra_pmc_init_common(struct tegra_pmc *pmc)
+{
+	unsigned int i;
+
+	pmc->tz_only = tegra_pmc_detect_tz_only(pmc);
+
+	/* Create a bitmap of the available and valid partitions */
+	for (i = 0; i < pmc->soc->num_powergates; i++)
+		if (pmc->soc->powergates[i])
+			set_bit(i, pmc->powergates_available);
+}
+
 static void tegra_pmc_reset_suspend_mode(void *data)
 {
 	struct tegra_pmc *pmc = data;
@@ -3119,7 +3157,7 @@ static void tegra_pmc_reset_suspend_mode(void *data)
 
 static int tegra_pmc_probe(struct platform_device *pdev)
 {
-	void __iomem *base;
+	struct tegra_pmc *pmc;
 	struct resource *res;
 	int err;
 
@@ -3128,9 +3166,16 @@ static int tegra_pmc_probe(struct platform_device *pdev)
 	 * register mapping and setup the soc data pointer. If these
 	 * are not valid then something went badly wrong!
 	 */
-	if (WARN_ON(!pmc->base || !pmc->soc))
+	if (WARN_ON(!early_pmc->base || !early_pmc->soc))
 		return -ENODEV;
 
+	pmc = devm_kzalloc(&pdev->dev, sizeof(*pmc), GFP_KERNEL);
+	if (!pmc)
+		return -ENOMEM;
+
+	pmc->soc = device_get_match_data(&pdev->dev);
+	tegra_pmc_init_common(pmc);
+
 	err = tegra_pmc_parse_dt(pmc, pdev->dev.of_node);
 	if (err < 0)
 		return err;
@@ -3141,14 +3186,14 @@ static int tegra_pmc_probe(struct platform_device *pdev)
 		return err;
 
 	/* take over the memory region from the early initialization */
-	base = devm_platform_ioremap_resource(pdev, 0);
-	if (IS_ERR(base))
-		return PTR_ERR(base);
+	pmc->base = devm_platform_ioremap_resource(pdev, 0);
+	if (IS_ERR(pmc->base))
+		return PTR_ERR(pmc->base);
 
 	if (pmc->soc->has_single_mmio_aperture) {
-		pmc->wake = base;
-		pmc->aotag = base;
-		pmc->scratch = base;
+		pmc->wake = pmc->base;
+		pmc->aotag = pmc->base;
+		pmc->scratch = pmc->base;
 	} else {
 		pmc->wake = devm_platform_ioremap_resource_byname(pdev, "wake");
 		if (IS_ERR(pmc->wake))
@@ -3167,7 +3212,7 @@ static int tegra_pmc_probe(struct platform_device *pdev)
 
 		/* "scratch" is an optional aperture */
 		res = platform_get_resource_byname(pdev, IORESOURCE_MEM,
-						"scratch");
+						   "scratch");
 		if (res) {
 			pmc->scratch = devm_ioremap_resource(&pdev->dev, res);
 			if (IS_ERR(pmc->scratch))
@@ -3271,10 +3316,10 @@ static int tegra_pmc_probe(struct platform_device *pdev)
 	if (err < 0)
 		goto cleanup_powergates;
 
-	mutex_lock(&pmc->powergates_lock);
-	iounmap(pmc->base);
-	pmc->base = base;
-	mutex_unlock(&pmc->powergates_lock);
+	mutex_lock(&early_pmc->powergates_lock);
+	iounmap(early_pmc->base);
+	early_pmc->base = pmc->base;
+	mutex_unlock(&early_pmc->powergates_lock);
 
 	tegra_pmc_clock_register(pmc, pdev->dev.of_node);
 	platform_set_drvdata(pdev, pmc);
@@ -4799,6 +4844,7 @@ static const struct of_device_id tegra_pmc_match[] = {
 
 static void tegra_pmc_sync_state(struct device *dev)
 {
+	struct tegra_pmc *pmc = dev_get_drvdata(dev);
 	struct device_node *np, *child;
 	int err;
 
@@ -4856,32 +4902,6 @@ static struct platform_driver tegra_pmc_driver = {
 };
 builtin_platform_driver(tegra_pmc_driver);
 
-static bool __init tegra_pmc_detect_tz_only(struct tegra_pmc *pmc)
-{
-	u32 value, saved;
-
-	saved = readl(pmc->base + pmc->soc->regs->scratch0);
-	value = saved ^ 0xffffffff;
-
-	if (value == 0xffffffff)
-		value = 0xdeadbeef;
-
-	/* write pattern and read it back */
-	writel(value, pmc->base + pmc->soc->regs->scratch0);
-	value = readl(pmc->base + pmc->soc->regs->scratch0);
-
-	/* if we read all-zeroes, access is restricted to TZ only */
-	if (value == 0) {
-		pr_info("access to PMC is restricted to TZ\n");
-		return true;
-	}
-
-	/* restore original value */
-	writel(saved, pmc->base + pmc->soc->regs->scratch0);
-
-	return false;
-}
-
 /*
  * Early initialization to allow access to registers in the very early boot
  * process.
@@ -4891,10 +4911,9 @@ static int __init tegra_pmc_early_init(void)
 	const struct of_device_id *match;
 	struct device_node *np;
 	struct resource regs;
-	unsigned int i;
 	bool invert;
 
-	mutex_init(&pmc->powergates_lock);
+	mutex_init(&early_pmc->powergates_lock);
 
 	np = of_find_matching_node_and_match(NULL, tegra_pmc_match, &match);
 	if (!np) {
@@ -4935,23 +4954,17 @@ static int __init tegra_pmc_early_init(void)
 		}
 	}
 
-	pmc->base = ioremap(regs.start, resource_size(&regs));
-	if (!pmc->base) {
+	early_pmc->base = ioremap(regs.start, resource_size(&regs));
+	if (!early_pmc->base) {
 		pr_err("failed to map PMC registers\n");
 		of_node_put(np);
 		return -ENXIO;
 	}
 
 	if (of_device_is_available(np)) {
-		pmc->soc = match->data;
-
-		if (pmc->soc->maybe_tz_only)
-			pmc->tz_only = tegra_pmc_detect_tz_only(pmc);
+		early_pmc->soc = match->data;
 
-		/* Create a bitmap of the available and valid partitions */
-		for (i = 0; i < pmc->soc->num_powergates; i++)
-			if (pmc->soc->powergates[i])
-				set_bit(i, pmc->powergates_available);
+		tegra_pmc_init_common(early_pmc);
 
 		/*
 		 * Invert the interrupt polarity if a PMC device tree node
@@ -4959,7 +4972,7 @@ static int __init tegra_pmc_early_init(void)
 		 */
 		invert = of_property_read_bool(np, "nvidia,invert-interrupt");
 
-		pmc->soc->setup_irq_polarity(pmc, np, invert);
+		early_pmc->soc->setup_irq_polarity(early_pmc, np, invert);
 
 		of_node_put(np);
 	}

-- 
2.52.0


