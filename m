Return-Path: <linux-media+bounces-60615-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 0ImPKpdG+2lPYgMAu9opvQ
	(envelope-from <linux-media+bounces-60615-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Wed, 06 May 2026 15:48:07 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 337DC4DB4E0
	for <lists+linux-media@lfdr.de>; Wed, 06 May 2026 15:48:07 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id C2D2B30C0067
	for <lists+linux-media@lfdr.de>; Wed,  6 May 2026 13:42:57 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0ADC047DF98;
	Wed,  6 May 2026 13:42:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="u4raWXQI"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 593B647DD6A;
	Wed,  6 May 2026 13:42:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778074965; cv=none; b=XlfpGKGNsKw/HZjpnqgpqLno9WtT2TObpb3Bp3cuN5F2OlG7tkT49DCl6TT99D5UaOWnOMHIN5mkcXZmhJ7XJaGt+g9JmdUYvzwkZ3XlFgw2rDap/3t4aRS1ylsmddIWc1R+FVvJKAXjDcaYT+4xAHpFA4h7+NJcPu208IwLdC0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778074965; c=relaxed/simple;
	bh=dhMIYzn0naroh7wEiEyD8mkr0lrPyoEZWpMhxfeiflg=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=SQmWgBwME1EeypvyrbyhFvp73HuvfMLyl8gKvv5V59nBMgRp5jlLKVVUYza6CcgQPfVGqQMtpXw1Ivgn9WmHkblao0jR/ENtk+xRblRINiNf0eEw75IY5vFFfNKE4w+rhvD8VnTLJykjtXEil+nqHc8CkeyrXg4LKJsIie7mzBc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=u4raWXQI; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C6A44C2BCF4;
	Wed,  6 May 2026 13:42:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1778074964;
	bh=dhMIYzn0naroh7wEiEyD8mkr0lrPyoEZWpMhxfeiflg=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=u4raWXQI2Wdg2bSaXn1HETF5GEiFQ72ibwRAa47bfqpVI5SWMD22kH7/5OHnxWAuA
	 1nkPxWf2dUD6NBJrnsoj5jr2nmWTyQA5D4J1WGXVYy03x3+80bBhsvg4qklXeIIfFL
	 lQ37+dZSZSLw+NvBFwKbyRufAjNV7Fv4SY06xl9H2YOnZPBomHdcPMDEd1lYXRpuCj
	 zqrf9woH9IGS6n3JI8+N9SmSpfBfLQJwdaZHD0AwqFezKLnqFo5J3wa2c3Y2IF9nN0
	 BeSgqxoIq/OsSo1iBpgfRUd61q0JkOZWtXUorD1+XhaQW0Q+QAapdQg3L7D+QySIMX
	 N9rvPBR1683CQ==
From: Thierry Reding <thierry.reding@kernel.org>
Date: Wed, 06 May 2026 15:41:59 +0200
Subject: [PATCH 8/9] soc/tegra: pmc: Remove unused legacy functions
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260506-pmc-v1-8-a6de5da7216b@nvidia.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=6033; i=treding@nvidia.com;
 h=from:subject:message-id; bh=dxlHQ75ERZaZquoLYGMUADgl07hpLeMdSph/VRfteA4=;
 b=owEBbQKS/ZANAwAKAd0jrNd/PrOhAcsmYgBp+0UwuL+I1tfaN0jTu1yVVepluyb/zMAaRVo8U
 1kKyKV8KLKJAjMEAAEKAB0WIQSI6sMIAUnM98CNyJ/dI6zXfz6zoQUCaftFMAAKCRDdI6zXfz6z
 oWAfEACW9hIvJoBpm7XmtiXmDNPsqhddpmCXDTVkthnNVLlro96hP5Dv2CUNMRM8pGdOeH3dsVQ
 a5gNS6b6IH6+37XFlyJZ4zzfwUGP/uUt/KFi4npTpNj1I6n2TIjaqQRrrPUvETmr3r1s4EjerZu
 /CRCiQBfKAz7cUL/uefUs6gpvhYNSFOeh1a4v5hfk6NHT95PfuF8VSN4MiHrdSckuM5OaMkcIfT
 u7sX/Y3KelzOdwiOXvnTyf0GPKLm7jdMk91HBp2yRJcTOmDVVQ3XeF82n4QObPwLfXwKOFktinm
 wtJSIWqlDX41pnlaSl7dZFHFbXXSBfQXty9ThTbf/hFbeDn4NvSTDTEKt/x/g1egVMFIR5JMhNN
 58uO/Eada7kc4dTr9Mu8M44pRimV6u/fhm17Sq6IGe9KwEer/UUzHPtlHt3gI5WnnomTx6EwqyN
 1XkFTVwtIVpytMnRpxkmWN6+Egflui44aLVnJNBg+Ldt2Oiux6hEmJQdvZyXBUq6rH9/xpBKQbt
 UbYABWRui3RMG5NgXP2lUNNh8r9hSnEovvU+PxWgK1nolDjr3ZAqXMCVz0tSrKV6bJpu+jD5Ryt
 +D0Ylz+OFFthcaFZD0bdvmLftdoqwWDTAzUl1O/ANMam/Hth1tc0M8VThOMJojdQYbOylxM9JMO
 MiFRUXJb9h0ke1w==
X-Developer-Key: i=treding@nvidia.com; a=openpgp;
 fpr=88EAC3080149CCF7C08DC89FDD23ACD77F3EB3A1
X-Rspamd-Queue-Id: 337DC4DB4E0
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FREEMAIL_TO(0.00)[kernel.org,nvidia.com,redhat.com,linux.intel.com,suse.de,gmail.com,ffwll.ch,google.com,intel.com,linuxfoundation.org,pengutronix.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-60615-lists,linux-media=lfdr.de];
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
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,nvidia.com:mid,nvidia.com:email]

From: Thierry Reding <treding@nvidia.com>

All callers of these functions have been replaced by their variants
taking a PMC context as an input, so they are no longer used and can be
removed.

Signed-off-by: Thierry Reding <treding@nvidia.com>
---
 drivers/soc/tegra/pmc.c | 69 -------------------------------------------------
 include/soc/tegra/pmc.h | 47 ---------------------------------
 2 files changed, 116 deletions(-)

diff --git a/drivers/soc/tegra/pmc.c b/drivers/soc/tegra/pmc.c
index 50969b07fd8c..f25c8e73475c 100644
--- a/drivers/soc/tegra/pmc.c
+++ b/drivers/soc/tegra/pmc.c
@@ -1063,16 +1063,6 @@ int tegra_pmc_powergate_power_on(struct tegra_pmc *pmc, unsigned int id)
 }
 EXPORT_SYMBOL(tegra_pmc_powergate_power_on);
 
-/**
- * tegra_powergate_power_on() - power on partition
- * @id: partition ID
- */
-int tegra_powergate_power_on(unsigned int id)
-{
-	return tegra_pmc_powergate_power_on(early_pmc, id);
-}
-EXPORT_SYMBOL(tegra_powergate_power_on);
-
 /**
  * tegra_pmc_powergate_power_off() - power off partition
  * @pmc: power management controller
@@ -1087,16 +1077,6 @@ int tegra_pmc_powergate_power_off(struct tegra_pmc *pmc, unsigned int id)
 }
 EXPORT_SYMBOL(tegra_pmc_powergate_power_off);
 
-/**
- * tegra_powergate_power_off() - power off partition
- * @id: partition ID
- */
-int tegra_powergate_power_off(unsigned int id)
-{
-	return tegra_pmc_powergate_power_off(early_pmc, id);
-}
-EXPORT_SYMBOL(tegra_powergate_power_off);
-
 /**
  * tegra_powergate_is_powered() - check if partition is powered
  * @pmc: power management controller
@@ -1124,16 +1104,6 @@ int tegra_pmc_powergate_remove_clamping(struct tegra_pmc *pmc, unsigned int id)
 }
 EXPORT_SYMBOL(tegra_pmc_powergate_remove_clamping);
 
-/**
- * tegra_powergate_remove_clamping() - remove power clamps for partition
- * @id: partition ID
- */
-int tegra_powergate_remove_clamping(unsigned int id)
-{
-	return tegra_pmc_powergate_remove_clamping(early_pmc, id);
-}
-EXPORT_SYMBOL(tegra_powergate_remove_clamping);
-
 /**
  * tegra_pmc_powergate_sequence_power_up() - power up partition
  * @pmc: power management controller
@@ -1181,21 +1151,6 @@ int tegra_pmc_powergate_sequence_power_up(struct tegra_pmc *pmc,
 }
 EXPORT_SYMBOL(tegra_pmc_powergate_sequence_power_up);
 
-/**
- * tegra_powergate_sequence_power_up() - power up partition
- * @id: partition ID
- * @clk: clock for partition
- * @rst: reset for partition
- *
- * Must be called with clk disabled, and returns with clk enabled.
- */
-int tegra_powergate_sequence_power_up(unsigned int id, struct clk *clk,
-				      struct reset_control *rst)
-{
-	return tegra_pmc_powergate_sequence_power_up(early_pmc, id, clk, rst);
-}
-EXPORT_SYMBOL(tegra_powergate_sequence_power_up);
-
 /**
  * tegra_get_cpu_powergate_id() - convert from CPU ID to partition ID
  * @pmc: power management controller
@@ -1823,18 +1778,6 @@ int tegra_pmc_io_pad_power_enable(struct tegra_pmc *pmc, enum tegra_io_pad id)
 }
 EXPORT_SYMBOL(tegra_pmc_io_pad_power_enable);
 
-/**
- * tegra_io_pad_power_enable() - enable power to I/O pad
- * @id: Tegra I/O pad ID for which to enable power
- *
- * Returns: 0 on success or a negative error code on failure.
- */
-int tegra_io_pad_power_enable(enum tegra_io_pad id)
-{
-	return tegra_pmc_io_pad_power_enable(early_pmc, id);
-}
-EXPORT_SYMBOL(tegra_io_pad_power_enable);
-
 /**
  * tegra_pmc_io_pad_power_disable() - disable power to I/O pad
  * @pmc: power management controller
@@ -1879,18 +1822,6 @@ int tegra_pmc_io_pad_power_disable(struct tegra_pmc *pmc, enum tegra_io_pad id)
 }
 EXPORT_SYMBOL(tegra_pmc_io_pad_power_disable);
 
-/**
- * tegra_io_pad_power_disable() - disable power to I/O pad
- * @id: Tegra I/O pad ID for which to disable power
- *
- * Returns: 0 on success or a negative error code on failure.
- */
-int tegra_io_pad_power_disable(enum tegra_io_pad id)
-{
-	return tegra_pmc_io_pad_power_disable(early_pmc, id);
-}
-EXPORT_SYMBOL(tegra_io_pad_power_disable);
-
 static int tegra_io_pad_is_powered(struct tegra_pmc *pmc, enum tegra_io_pad id)
 {
 	const struct tegra_io_pad_soc *pad;
diff --git a/include/soc/tegra/pmc.h b/include/soc/tegra/pmc.h
index 1fd21be02577..8b4bcdea849e 100644
--- a/include/soc/tegra/pmc.h
+++ b/include/soc/tegra/pmc.h
@@ -164,16 +164,6 @@ int tegra_pmc_io_pad_power_enable(struct tegra_pmc *pmc, enum tegra_io_pad id);
 int tegra_pmc_io_pad_power_disable(struct tegra_pmc *pmc, enum tegra_io_pad id);
 
 /* legacy */
-int tegra_powergate_power_on(unsigned int id);
-int tegra_powergate_power_off(unsigned int id);
-int tegra_powergate_remove_clamping(unsigned int id);
-
-int tegra_powergate_sequence_power_up(unsigned int id, struct clk *clk,
-				      struct reset_control *rst);
-
-int tegra_io_pad_power_enable(enum tegra_io_pad id);
-int tegra_io_pad_power_disable(enum tegra_io_pad id);
-
 void tegra_pmc_set_suspend_mode(enum tegra_suspend_mode mode);
 void tegra_pmc_enter_suspend_mode(enum tegra_suspend_mode mode);
 
@@ -224,43 +214,6 @@ tegra_pmc_io_pad_power_disable(struct tegra_pmc *pmc, enum tegra_io_pad id)
 	return -ENOSYS;
 }
 
-static inline int tegra_powergate_power_on(unsigned int id)
-{
-	return -ENOSYS;
-}
-
-static inline int tegra_powergate_power_off(unsigned int id)
-{
-	return -ENOSYS;
-}
-
-static inline int tegra_powergate_remove_clamping(unsigned int id)
-{
-	return -ENOSYS;
-}
-
-static inline int tegra_powergate_sequence_power_up(unsigned int id,
-						    struct clk *clk,
-						    struct reset_control *rst)
-{
-	return -ENOSYS;
-}
-
-static inline int tegra_io_pad_power_enable(enum tegra_io_pad id)
-{
-	return -ENOSYS;
-}
-
-static inline int tegra_io_pad_power_disable(enum tegra_io_pad id)
-{
-	return -ENOSYS;
-}
-
-static inline int tegra_io_pad_get_voltage(enum tegra_io_pad id)
-{
-	return -ENOSYS;
-}
-
 static inline void tegra_pmc_set_suspend_mode(enum tegra_suspend_mode mode)
 {
 }

-- 
2.52.0


