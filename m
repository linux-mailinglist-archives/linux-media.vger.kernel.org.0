Return-Path: <linux-media+bounces-51830-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 6InQJnyqfGkaOQIAu9opvQ
	(envelope-from <linux-media+bounces-51830-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Fri, 30 Jan 2026 13:56:28 +0100
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id B9B57BAC73
	for <lists+linux-media@lfdr.de>; Fri, 30 Jan 2026 13:56:27 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 83E263064F14
	for <lists+linux-media@lfdr.de>; Fri, 30 Jan 2026 12:50:27 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CB8E73803C0;
	Fri, 30 Jan 2026 12:50:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="BguKJBlW"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-wr1-f41.google.com (mail-wr1-f41.google.com [209.85.221.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 50F7E37F73B
	for <linux-media@vger.kernel.org>; Fri, 30 Jan 2026 12:50:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769777406; cv=none; b=Oe2o1mHPvyCyiZCRTIx/K0zHvWfeoGWMpL9oLC/iWPUrdMJ0LqPHOJJ7DoWN/7F2I/7V93rV9kU/qrf3RFOl7svVLai3FOXhHWyaOdhgLoehoDLBqKUiRStLs1j9jtjEBCpKQjlHIRw4AFdfg0MEMnu1s9U2MUWJkhFgQdssSC4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769777406; c=relaxed/simple;
	bh=oY85USD0gXJXDDNe9s6acMW/Ocv30mpMkYhRB0pufxk=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=NVRT/ayKIET65qCm6D7BjKbl5cT7DYSS6RhZzbt0v4iWaL90TDbxtqbB8darWUzLk5GaM+NaEsA96qhuNL5plGmTa3Fif5CGZ6e2ys5FnjlHp+WhorZ5IKQB8bS/BYYlWe/f93b1NQ8Lm3bHQOHJ1T2uX77Se3e/KXCApGPhB/4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=BguKJBlW; arc=none smtp.client-ip=209.85.221.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wr1-f41.google.com with SMTP id ffacd0b85a97d-42fbbc3df8fso1615202f8f.2
        for <linux-media@vger.kernel.org>; Fri, 30 Jan 2026 04:50:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1769777400; x=1770382200; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=izZNO3eL3oHzsJUrKxHV6Tqswim5VPWikLvVKcA1Uj0=;
        b=BguKJBlWuUunwAk6T8VDW6MM1dOuW0fduoARNkDp9tbCT+B1RzGs466o5vAVRs4OlC
         i63LlhXBV0HwZug00xo+qIkp5BwSvvNSMCrAsACm+4+OeLSYjY/OgG+p8+pLNL7lnFjI
         9J8XgV0qqyBDa3McbeREsLBz9SjdSoz21/nLuD7zgnLwVgQgBr6nkCHdziyVg1PYbisV
         SnrnS4fTtB+W8H+tZ+VTk26VzZ7b8UEBS8ZibrKLwmTIGGUnMJsiU8TudHxJAVQOR3/l
         +iEmKeBpwohp4QlgmXD4mkxWCS8bCKzQ+vN7g74UwZVxL+ESG5B+/71AmrnjFDN8ly/p
         CfUQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769777400; x=1770382200;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=izZNO3eL3oHzsJUrKxHV6Tqswim5VPWikLvVKcA1Uj0=;
        b=VzrithbtVVmusx7fmfYSsoloVA2kHYtotBKd0yiq4SeI5BMgGqUYiheGsVFABj8eX0
         TqrdH3kB4bh8yS4XjyGJTrmIdpaRgepKjKNJwmTWrsQfVf2r8izmR/i6cqNk8J6NQ8kC
         9x7WFrPxn/bR0tghbb+53GLgaG22rzbPFQLBn7yXMHk2GIGU2ozjnztwBj42wC4ZcjOc
         yGVv14nhJFfJhoqJ224+LoALioETgvuk6yjarrJLXAgvE6TsN+N1IalRO3bD8gK3rOtF
         twvCSXtnBEGnYThnyoiqsplM+03IoFO+erjFqZ9ujfEQsoaDdumyJun7NpoRi8eDi8z2
         USMg==
X-Forwarded-Encrypted: i=1; AJvYcCWmhrOGZspfErjt98dCH1NV2WAyZhZbrt7yyvrNbHvDg28jBFKPJmgqM8r6KE1kki8JCRp6afbech317w==@vger.kernel.org
X-Gm-Message-State: AOJu0YxA/wBPOSLjQrJxsVe7Tw+Xu1tlJVp4G/9AfYnjKKPvYPPYCN63
	o12jCMOMXqWmB/IR1ewrPwjibYxK998XjvuFAaot7D50yYF638oOPvI7
X-Gm-Gg: AZuq6aIoZyG4gIERTvhGYtxTvrivpvuMkyVGFATDKwk/zUkBffV1zaXYuTPYVaB80pE
	F9BB5Vh3CWwG6iDYrtAQ45KPjYd2OucMTEVwmpy1AtJiu18NPYCwaZcgCay535EUrrLg5O4sOrK
	jhupos12iMkjvm34txy3eqe/uvLhJ868JKgUahrly/po8BfI2+N+c2znLEUJ52KiWNI0iDI3J0R
	DqjEjSqWthjSd+7R/mcGIi30WTitnLGcULMjSN8drj4c422e/37ya1TeecoM4M1vddTJQ77QA2M
	ARbr899Hu++wQdhTvkYH+fbJOXOMi7wyhGQY7igD6s/pZzoer8I+66HjnXHgkQk7fgsE8tU12PZ
	DoYUqRVqQvqTtVsOMdz011PlEPqTKRUrfj08cv29lkvZdcxHFmVWky5LQE/6SssUdBXHwDOxNE6
	dH
X-Received: by 2002:a05:6000:2404:b0:430:fc63:8d3 with SMTP id ffacd0b85a97d-435f3aaa5bamr3926407f8f.30.1769777400075;
        Fri, 30 Jan 2026 04:50:00 -0800 (PST)
Received: from xeon ([188.163.112.49])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-435e10e4757sm22738783f8f.5.2026.01.30.04.49.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 30 Jan 2026 04:49:59 -0800 (PST)
From: Svyatoslav Ryhel <clamor95@gmail.com>
To: Thierry Reding <thierry.reding@gmail.com>,
	Mikko Perttunen <mperttunen@nvidia.com>,
	David Airlie <airlied@gmail.com>,
	Simona Vetter <simona@ffwll.ch>,
	Jonathan Hunter <jonathanh@nvidia.com>,
	Sowjanya Komatineni <skomatineni@nvidia.com>,
	Luca Ceresoli <luca.ceresoli@bootlin.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Hans Verkuil <hverkuil+cisco@kernel.org>,
	Svyatoslav Ryhel <clamor95@gmail.com>
Cc: linux-kernel@vger.kernel.org,
	dri-devel@lists.freedesktop.org,
	linux-tegra@vger.kernel.org,
	linux-media@vger.kernel.org,
	linux-staging@lists.linux.dev
Subject: [PATCH v6 05/15] gpu: host1x: convert MIPI to use operation function pointers
Date: Fri, 30 Jan 2026 14:49:22 +0200
Message-ID: <20260130124932.351328-6-clamor95@gmail.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20260130124932.351328-1-clamor95@gmail.com>
References: <20260130124932.351328-1-clamor95@gmail.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [0.84 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20230601];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_FROM(0.00)[gmail.com];
	MIME_TRACE(0.00)[0:+];
	TAGGED_FROM(0.00)[bounces-51830-lists,linux-media=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[16];
	FREEMAIL_TO(0.00)[gmail.com,nvidia.com,ffwll.ch,bootlin.com,kernel.org,linuxfoundation.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[clamor95@gmail.com,linux-media@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[gmail.com:+];
	RCVD_COUNT_FIVE(0.00)[5];
	TAGGED_RCPT(0.00)[linux-media,cisco];
	NEURAL_HAM(-0.00)[-1.000];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[bootlin.com:email,nvidia.com:email,provider.np:url,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,args.np:url]
X-Rspamd-Queue-Id: B9B57BAC73
X-Rspamd-Action: no action

Convert existing MIPI code to use operation function pointers, a necessary
step for supporting Tegra20/Tegra30 SoCs. All common MIPI configuration
that is SoC-independent remains in mipi.c, while all SoC-specific code is
moved to tegra114-mipi.c (The naming matches the first SoC generation with
a dedicated calibration block). Shared structures and function calls are
placed into tegra-mipi-cal.h.

Tested-by: Luca Ceresoli <luca.ceresoli@bootlin.com> # tegra20, parallel camera
Signed-off-by: Svyatoslav Ryhel <clamor95@gmail.com>
Acked-by: Mikko Perttunen <mperttunen@nvidia.com>
---
 drivers/gpu/drm/tegra/dsi.c             |   1 +
 drivers/gpu/host1x/Makefile             |   1 +
 drivers/gpu/host1x/mipi.c               | 525 +++---------------------
 drivers/gpu/host1x/tegra114-mipi.c      | 483 ++++++++++++++++++++++
 drivers/staging/media/tegra-video/csi.c |   1 +
 include/linux/host1x.h                  |  10 -
 include/linux/tegra-mipi-cal.h          |  57 +++
 7 files changed, 599 insertions(+), 479 deletions(-)
 create mode 100644 drivers/gpu/host1x/tegra114-mipi.c
 create mode 100644 include/linux/tegra-mipi-cal.h

diff --git a/drivers/gpu/drm/tegra/dsi.c b/drivers/gpu/drm/tegra/dsi.c
index 8ee96b59fdbc..2735aa351d8b 100644
--- a/drivers/gpu/drm/tegra/dsi.c
+++ b/drivers/gpu/drm/tegra/dsi.c
@@ -14,6 +14,7 @@
 #include <linux/pm_runtime.h>
 #include <linux/regulator/consumer.h>
 #include <linux/reset.h>
+#include <linux/tegra-mipi-cal.h>
 
 #include <video/mipi_display.h>
 
diff --git a/drivers/gpu/host1x/Makefile b/drivers/gpu/host1x/Makefile
index ee5286ffe08d..fead483af0b4 100644
--- a/drivers/gpu/host1x/Makefile
+++ b/drivers/gpu/host1x/Makefile
@@ -9,6 +9,7 @@ host1x-y = \
 	job.o \
 	debug.o \
 	mipi.o \
+	tegra114-mipi.o \
 	fence.o \
 	hw/host1x01.o \
 	hw/host1x02.o \
diff --git a/drivers/gpu/host1x/mipi.c b/drivers/gpu/host1x/mipi.c
index e51b43dd15a3..8d32072e2244 100644
--- a/drivers/gpu/host1x/mipi.c
+++ b/drivers/gpu/host1x/mipi.c
@@ -1,215 +1,65 @@
+// SPDX-License-Identifier: GPL-2.0-only
 /*
  * Copyright (C) 2013 NVIDIA Corporation
- *
- * Permission to use, copy, modify, distribute, and sell this software and its
- * documentation for any purpose is hereby granted without fee, provided that
- * the above copyright notice appear in all copies and that both that copyright
- * notice and this permission notice appear in supporting documentation, and
- * that the name of the copyright holders not be used in advertising or
- * publicity pertaining to distribution of the software without specific,
- * written prior permission.  The copyright holders make no representations
- * about the suitability of this software for any purpose.  It is provided "as
- * is" without express or implied warranty.
- *
- * THE COPYRIGHT HOLDERS DISCLAIM ALL WARRANTIES WITH REGARD TO THIS SOFTWARE,
- * INCLUDING ALL IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS, IN NO
- * EVENT SHALL THE COPYRIGHT HOLDERS BE LIABLE FOR ANY SPECIAL, INDIRECT OR
- * CONSEQUENTIAL DAMAGES OR ANY DAMAGES WHATSOEVER RESULTING FROM LOSS OF USE,
- * DATA OR PROFITS, WHETHER IN AN ACTION OF CONTRACT, NEGLIGENCE OR OTHER
- * TORTIOUS ACTION, ARISING OUT OF OR IN CONNECTION WITH THE USE OR PERFORMANCE
- * OF THIS SOFTWARE.
+ * Copyright (C) 2025 Svyatoslav Ryhel <clamor95@gmail.com>
  */
 
 #include <linux/clk.h>
-#include <linux/host1x.h>
 #include <linux/io.h>
 #include <linux/iopoll.h>
+#include <linux/module.h>
+#include <linux/of.h>
 #include <linux/of_platform.h>
 #include <linux/platform_device.h>
 #include <linux/slab.h>
+#include <linux/tegra-mipi-cal.h>
 
-#include "dev.h"
+/* only need to support one provider */
+static struct {
+	struct device_node *np;
+	const struct tegra_mipi_ops *ops;
+} provider;
 
-#define MIPI_CAL_CTRL			0x00
-#define MIPI_CAL_CTRL_NOISE_FILTER(x)	(((x) & 0xf) << 26)
-#define MIPI_CAL_CTRL_PRESCALE(x)	(((x) & 0x3) << 24)
-#define MIPI_CAL_CTRL_CLKEN_OVR		(1 << 4)
-#define MIPI_CAL_CTRL_START		(1 << 0)
-
-#define MIPI_CAL_AUTOCAL_CTRL		0x01
-
-#define MIPI_CAL_STATUS			0x02
-#define MIPI_CAL_STATUS_DONE		(1 << 16)
-#define MIPI_CAL_STATUS_ACTIVE		(1 <<  0)
-
-#define MIPI_CAL_CONFIG_CSIA		0x05
-#define MIPI_CAL_CONFIG_CSIB		0x06
-#define MIPI_CAL_CONFIG_CSIC		0x07
-#define MIPI_CAL_CONFIG_CSID		0x08
-#define MIPI_CAL_CONFIG_CSIE		0x09
-#define MIPI_CAL_CONFIG_CSIF		0x0a
-#define MIPI_CAL_CONFIG_DSIA		0x0e
-#define MIPI_CAL_CONFIG_DSIB		0x0f
-#define MIPI_CAL_CONFIG_DSIC		0x10
-#define MIPI_CAL_CONFIG_DSID		0x11
-
-#define MIPI_CAL_CONFIG_DSIA_CLK	0x19
-#define MIPI_CAL_CONFIG_DSIB_CLK	0x1a
-#define MIPI_CAL_CONFIG_CSIAB_CLK	0x1b
-#define MIPI_CAL_CONFIG_DSIC_CLK	0x1c
-#define MIPI_CAL_CONFIG_CSICD_CLK	0x1c
-#define MIPI_CAL_CONFIG_DSID_CLK	0x1d
-#define MIPI_CAL_CONFIG_CSIE_CLK	0x1d
-
-/* for data and clock lanes */
-#define MIPI_CAL_CONFIG_SELECT		(1 << 21)
-
-/* for data lanes */
-#define MIPI_CAL_CONFIG_HSPDOS(x)	(((x) & 0x1f) << 16)
-#define MIPI_CAL_CONFIG_HSPUOS(x)	(((x) & 0x1f) <<  8)
-#define MIPI_CAL_CONFIG_TERMOS(x)	(((x) & 0x1f) <<  0)
-
-/* for clock lanes */
-#define MIPI_CAL_CONFIG_HSCLKPDOSD(x)	(((x) & 0x1f) <<  8)
-#define MIPI_CAL_CONFIG_HSCLKPUOSD(x)	(((x) & 0x1f) <<  0)
-
-#define MIPI_CAL_BIAS_PAD_CFG0		0x16
-#define MIPI_CAL_BIAS_PAD_PDVCLAMP	(1 << 1)
-#define MIPI_CAL_BIAS_PAD_E_VCLAMP_REF	(1 << 0)
-
-#define MIPI_CAL_BIAS_PAD_CFG1		0x17
-#define MIPI_CAL_BIAS_PAD_DRV_DN_REF(x) (((x) & 0x7) << 16)
-#define MIPI_CAL_BIAS_PAD_DRV_UP_REF(x) (((x) & 0x7) << 8)
-
-#define MIPI_CAL_BIAS_PAD_CFG2		0x18
-#define MIPI_CAL_BIAS_PAD_VCLAMP(x)	(((x) & 0x7) << 16)
-#define MIPI_CAL_BIAS_PAD_VAUXP(x)	(((x) & 0x7) << 4)
-#define MIPI_CAL_BIAS_PAD_PDVREG	(1 << 1)
-
-struct tegra_mipi_pad {
-	unsigned long data;
-	unsigned long clk;
-};
-
-struct tegra_mipi_soc {
-	bool has_clk_lane;
-	const struct tegra_mipi_pad *pads;
-	unsigned int num_pads;
-
-	bool clock_enable_override;
-	bool needs_vclamp_ref;
-
-	/* bias pad configuration settings */
-	u8 pad_drive_down_ref;
-	u8 pad_drive_up_ref;
-
-	u8 pad_vclamp_level;
-	u8 pad_vauxp_level;
-
-	/* calibration settings for data lanes */
-	u8 hspdos;
-	u8 hspuos;
-	u8 termos;
-
-	/* calibration settings for clock lanes */
-	u8 hsclkpdos;
-	u8 hsclkpuos;
-};
-
-struct tegra_mipi {
-	const struct tegra_mipi_soc *soc;
-	struct device *dev;
-	void __iomem *regs;
-	struct mutex lock;
-	struct clk *clk;
-
-	unsigned long usage_count;
-};
-
-struct tegra_mipi_device {
-	struct platform_device *pdev;
-	struct tegra_mipi *mipi;
-	struct device *device;
-	unsigned long pads;
-};
-
-static inline u32 tegra_mipi_readl(struct tegra_mipi *mipi,
-				   unsigned long offset)
+int tegra_mipi_enable(struct tegra_mipi_device *device)
 {
-	return readl(mipi->regs + (offset << 2));
-}
+	if (device->ops->enable)
+		return device->ops->enable(device);
 
-static inline void tegra_mipi_writel(struct tegra_mipi *mipi, u32 value,
-				     unsigned long offset)
-{
-	writel(value, mipi->regs + (offset << 2));
+	return 0;
 }
+EXPORT_SYMBOL(tegra_mipi_enable);
 
-static int tegra_mipi_power_up(struct tegra_mipi *mipi)
+int tegra_mipi_disable(struct tegra_mipi_device *device)
 {
-	u32 value;
-	int err;
-
-	err = clk_enable(mipi->clk);
-	if (err < 0)
-		return err;
-
-	value = tegra_mipi_readl(mipi, MIPI_CAL_BIAS_PAD_CFG0);
-	value &= ~MIPI_CAL_BIAS_PAD_PDVCLAMP;
-
-	if (mipi->soc->needs_vclamp_ref)
-		value |= MIPI_CAL_BIAS_PAD_E_VCLAMP_REF;
-
-	tegra_mipi_writel(mipi, value, MIPI_CAL_BIAS_PAD_CFG0);
-
-	value = tegra_mipi_readl(mipi, MIPI_CAL_BIAS_PAD_CFG2);
-	value &= ~MIPI_CAL_BIAS_PAD_PDVREG;
-	tegra_mipi_writel(mipi, value, MIPI_CAL_BIAS_PAD_CFG2);
-
-	clk_disable(mipi->clk);
+	if (device->ops->disable)
+		return device->ops->disable(device);
 
 	return 0;
 }
+EXPORT_SYMBOL(tegra_mipi_disable);
 
-static int tegra_mipi_power_down(struct tegra_mipi *mipi)
+int tegra_mipi_start_calibration(struct tegra_mipi_device *device)
 {
-	u32 value;
-	int err;
+	if (device->ops->start_calibration)
+		return device->ops->start_calibration(device);
 
-	err = clk_enable(mipi->clk);
-	if (err < 0)
-		return err;
-
-	/*
-	 * The MIPI_CAL_BIAS_PAD_PDVREG controls a voltage regulator that
-	 * supplies the DSI pads. This must be kept enabled until none of the
-	 * DSI lanes are used anymore.
-	 */
-	value = tegra_mipi_readl(mipi, MIPI_CAL_BIAS_PAD_CFG2);
-	value |= MIPI_CAL_BIAS_PAD_PDVREG;
-	tegra_mipi_writel(mipi, value, MIPI_CAL_BIAS_PAD_CFG2);
-
-	/*
-	 * MIPI_CAL_BIAS_PAD_PDVCLAMP and MIPI_CAL_BIAS_PAD_E_VCLAMP_REF
-	 * control a regulator that supplies current to the pre-driver logic.
-	 * Powering down this regulator causes DSI to fail, so it must remain
-	 * powered on until none of the DSI lanes are used anymore.
-	 */
-	value = tegra_mipi_readl(mipi, MIPI_CAL_BIAS_PAD_CFG0);
-
-	if (mipi->soc->needs_vclamp_ref)
-		value &= ~MIPI_CAL_BIAS_PAD_E_VCLAMP_REF;
+	return 0;
+}
+EXPORT_SYMBOL(tegra_mipi_start_calibration);
 
-	value |= MIPI_CAL_BIAS_PAD_PDVCLAMP;
-	tegra_mipi_writel(mipi, value, MIPI_CAL_BIAS_PAD_CFG0);
+int tegra_mipi_finish_calibration(struct tegra_mipi_device *device)
+{
+	if (device->ops->finish_calibration)
+		return device->ops->finish_calibration(device);
 
 	return 0;
 }
+EXPORT_SYMBOL(tegra_mipi_finish_calibration);
 
 struct tegra_mipi_device *tegra_mipi_request(struct device *device,
 					     struct device_node *np)
 {
-	struct tegra_mipi_device *dev;
+	struct tegra_mipi_device *mipidev;
 	struct of_phandle_args args;
 	int err;
 
@@ -219,321 +69,58 @@ struct tegra_mipi_device *tegra_mipi_request(struct device *device,
 	if (err < 0)
 		return ERR_PTR(err);
 
-	dev = kzalloc(sizeof(*dev), GFP_KERNEL);
-	if (!dev) {
+	if (provider.np != args.np)
+		return ERR_PTR(-ENODEV);
+
+	mipidev = kzalloc(sizeof(*mipidev), GFP_KERNEL);
+	if (!mipidev) {
 		err = -ENOMEM;
 		goto out;
 	}
 
-	dev->pdev = of_find_device_by_node(args.np);
-	if (!dev->pdev) {
+	mipidev->pdev = of_find_device_by_node(args.np);
+	if (!mipidev->pdev) {
 		err = -ENODEV;
 		goto free;
 	}
 
-	dev->mipi = platform_get_drvdata(dev->pdev);
-	if (!dev->mipi) {
-		err = -EPROBE_DEFER;
-		goto put;
-	}
-
 	of_node_put(args.np);
 
-	dev->pads = args.args[0];
-	dev->device = device;
+	mipidev->ops = provider.ops;
+	mipidev->pads = args.args[0];
 
-	return dev;
+	return mipidev;
 
-put:
-	platform_device_put(dev->pdev);
 free:
-	kfree(dev);
+	kfree(mipidev);
 out:
 	of_node_put(args.np);
 	return ERR_PTR(err);
 }
 EXPORT_SYMBOL(tegra_mipi_request);
 
-void tegra_mipi_free(struct tegra_mipi_device *device)
+void tegra_mipi_free(struct tegra_mipi_device *mipidev)
 {
-	platform_device_put(device->pdev);
-	kfree(device);
+	platform_device_put(mipidev->pdev);
+	kfree(mipidev);
 }
 EXPORT_SYMBOL(tegra_mipi_free);
 
-int tegra_mipi_enable(struct tegra_mipi_device *dev)
+static void tegra_mipi_remove_provider(void *data)
 {
-	int err = 0;
-
-	mutex_lock(&dev->mipi->lock);
-
-	if (dev->mipi->usage_count++ == 0)
-		err = tegra_mipi_power_up(dev->mipi);
-
-	mutex_unlock(&dev->mipi->lock);
-
-	return err;
-
+	provider.np = NULL;
+	provider.ops = NULL;
 }
-EXPORT_SYMBOL(tegra_mipi_enable);
 
-int tegra_mipi_disable(struct tegra_mipi_device *dev)
+int devm_tegra_mipi_add_provider(struct device *device, struct device_node *np,
+				 const struct tegra_mipi_ops *ops)
 {
-	int err = 0;
-
-	mutex_lock(&dev->mipi->lock);
-
-	if (--dev->mipi->usage_count == 0)
-		err = tegra_mipi_power_down(dev->mipi);
+	if (provider.np)
+		return -EBUSY;
 
-	mutex_unlock(&dev->mipi->lock);
+	provider.np = np;
+	provider.ops = ops;
 
-	return err;
-
-}
-EXPORT_SYMBOL(tegra_mipi_disable);
-
-int tegra_mipi_finish_calibration(struct tegra_mipi_device *device)
-{
-	struct tegra_mipi *mipi = device->mipi;
-	void __iomem *status_reg = mipi->regs + (MIPI_CAL_STATUS << 2);
-	u32 value;
-	int err;
-
-	err = readl_relaxed_poll_timeout(status_reg, value,
-					 !(value & MIPI_CAL_STATUS_ACTIVE) &&
-					 (value & MIPI_CAL_STATUS_DONE), 50,
-					 250000);
-	mutex_unlock(&device->mipi->lock);
-	clk_disable(device->mipi->clk);
-
-	return err;
-}
-EXPORT_SYMBOL(tegra_mipi_finish_calibration);
-
-int tegra_mipi_start_calibration(struct tegra_mipi_device *device)
-{
-	const struct tegra_mipi_soc *soc = device->mipi->soc;
-	unsigned int i;
-	u32 value;
-	int err;
-
-	err = clk_enable(device->mipi->clk);
-	if (err < 0)
-		return err;
-
-	mutex_lock(&device->mipi->lock);
-
-	value = MIPI_CAL_BIAS_PAD_DRV_DN_REF(soc->pad_drive_down_ref) |
-		MIPI_CAL_BIAS_PAD_DRV_UP_REF(soc->pad_drive_up_ref);
-	tegra_mipi_writel(device->mipi, value, MIPI_CAL_BIAS_PAD_CFG1);
-
-	value = tegra_mipi_readl(device->mipi, MIPI_CAL_BIAS_PAD_CFG2);
-	value &= ~MIPI_CAL_BIAS_PAD_VCLAMP(0x7);
-	value &= ~MIPI_CAL_BIAS_PAD_VAUXP(0x7);
-	value |= MIPI_CAL_BIAS_PAD_VCLAMP(soc->pad_vclamp_level);
-	value |= MIPI_CAL_BIAS_PAD_VAUXP(soc->pad_vauxp_level);
-	tegra_mipi_writel(device->mipi, value, MIPI_CAL_BIAS_PAD_CFG2);
-
-	for (i = 0; i < soc->num_pads; i++) {
-		u32 clk = 0, data = 0;
-
-		if (device->pads & BIT(i)) {
-			data = MIPI_CAL_CONFIG_SELECT |
-			       MIPI_CAL_CONFIG_HSPDOS(soc->hspdos) |
-			       MIPI_CAL_CONFIG_HSPUOS(soc->hspuos) |
-			       MIPI_CAL_CONFIG_TERMOS(soc->termos);
-			clk = MIPI_CAL_CONFIG_SELECT |
-			      MIPI_CAL_CONFIG_HSCLKPDOSD(soc->hsclkpdos) |
-			      MIPI_CAL_CONFIG_HSCLKPUOSD(soc->hsclkpuos);
-		}
-
-		tegra_mipi_writel(device->mipi, data, soc->pads[i].data);
-
-		if (soc->has_clk_lane && soc->pads[i].clk != 0)
-			tegra_mipi_writel(device->mipi, clk, soc->pads[i].clk);
-	}
-
-	value = tegra_mipi_readl(device->mipi, MIPI_CAL_CTRL);
-	value &= ~MIPI_CAL_CTRL_NOISE_FILTER(0xf);
-	value &= ~MIPI_CAL_CTRL_PRESCALE(0x3);
-	value |= MIPI_CAL_CTRL_NOISE_FILTER(0xa);
-	value |= MIPI_CAL_CTRL_PRESCALE(0x2);
-
-	if (!soc->clock_enable_override)
-		value &= ~MIPI_CAL_CTRL_CLKEN_OVR;
-	else
-		value |= MIPI_CAL_CTRL_CLKEN_OVR;
-
-	tegra_mipi_writel(device->mipi, value, MIPI_CAL_CTRL);
-
-	/* clear any pending status bits */
-	value = tegra_mipi_readl(device->mipi, MIPI_CAL_STATUS);
-	tegra_mipi_writel(device->mipi, value, MIPI_CAL_STATUS);
-
-	value = tegra_mipi_readl(device->mipi, MIPI_CAL_CTRL);
-	value |= MIPI_CAL_CTRL_START;
-	tegra_mipi_writel(device->mipi, value, MIPI_CAL_CTRL);
-
-	/*
-	 * Wait for min 72uS to let calibration logic finish calibration
-	 * sequence codes before waiting for pads idle state to apply the
-	 * results.
-	 */
-	usleep_range(75, 80);
-
-	return 0;
-}
-EXPORT_SYMBOL(tegra_mipi_start_calibration);
-
-static const struct tegra_mipi_pad tegra114_mipi_pads[] = {
-	{ .data = MIPI_CAL_CONFIG_CSIA },
-	{ .data = MIPI_CAL_CONFIG_CSIB },
-	{ .data = MIPI_CAL_CONFIG_CSIC },
-	{ .data = MIPI_CAL_CONFIG_CSID },
-	{ .data = MIPI_CAL_CONFIG_CSIE },
-	{ .data = MIPI_CAL_CONFIG_DSIA },
-	{ .data = MIPI_CAL_CONFIG_DSIB },
-	{ .data = MIPI_CAL_CONFIG_DSIC },
-	{ .data = MIPI_CAL_CONFIG_DSID },
-};
-
-static const struct tegra_mipi_soc tegra114_mipi_soc = {
-	.has_clk_lane = false,
-	.pads = tegra114_mipi_pads,
-	.num_pads = ARRAY_SIZE(tegra114_mipi_pads),
-	.clock_enable_override = true,
-	.needs_vclamp_ref = true,
-	.pad_drive_down_ref = 0x2,
-	.pad_drive_up_ref = 0x0,
-	.pad_vclamp_level = 0x0,
-	.pad_vauxp_level = 0x0,
-	.hspdos = 0x0,
-	.hspuos = 0x4,
-	.termos = 0x5,
-	.hsclkpdos = 0x0,
-	.hsclkpuos = 0x4,
-};
-
-static const struct tegra_mipi_pad tegra124_mipi_pads[] = {
-	{ .data = MIPI_CAL_CONFIG_CSIA, .clk = MIPI_CAL_CONFIG_CSIAB_CLK },
-	{ .data = MIPI_CAL_CONFIG_CSIB, .clk = MIPI_CAL_CONFIG_CSIAB_CLK },
-	{ .data = MIPI_CAL_CONFIG_CSIC, .clk = MIPI_CAL_CONFIG_CSICD_CLK },
-	{ .data = MIPI_CAL_CONFIG_CSID, .clk = MIPI_CAL_CONFIG_CSICD_CLK },
-	{ .data = MIPI_CAL_CONFIG_CSIE, .clk = MIPI_CAL_CONFIG_CSIE_CLK  },
-	{ .data = MIPI_CAL_CONFIG_DSIA, .clk = MIPI_CAL_CONFIG_DSIA_CLK  },
-	{ .data = MIPI_CAL_CONFIG_DSIB, .clk = MIPI_CAL_CONFIG_DSIB_CLK  },
-};
-
-static const struct tegra_mipi_soc tegra124_mipi_soc = {
-	.has_clk_lane = true,
-	.pads = tegra124_mipi_pads,
-	.num_pads = ARRAY_SIZE(tegra124_mipi_pads),
-	.clock_enable_override = true,
-	.needs_vclamp_ref = true,
-	.pad_drive_down_ref = 0x2,
-	.pad_drive_up_ref = 0x0,
-	.pad_vclamp_level = 0x0,
-	.pad_vauxp_level = 0x0,
-	.hspdos = 0x0,
-	.hspuos = 0x0,
-	.termos = 0x0,
-	.hsclkpdos = 0x1,
-	.hsclkpuos = 0x2,
-};
-
-static const struct tegra_mipi_soc tegra132_mipi_soc = {
-	.has_clk_lane = true,
-	.pads = tegra124_mipi_pads,
-	.num_pads = ARRAY_SIZE(tegra124_mipi_pads),
-	.clock_enable_override = false,
-	.needs_vclamp_ref = false,
-	.pad_drive_down_ref = 0x0,
-	.pad_drive_up_ref = 0x3,
-	.pad_vclamp_level = 0x0,
-	.pad_vauxp_level = 0x0,
-	.hspdos = 0x0,
-	.hspuos = 0x0,
-	.termos = 0x0,
-	.hsclkpdos = 0x3,
-	.hsclkpuos = 0x2,
-};
-
-static const struct tegra_mipi_pad tegra210_mipi_pads[] = {
-	{ .data = MIPI_CAL_CONFIG_CSIA, .clk = 0 },
-	{ .data = MIPI_CAL_CONFIG_CSIB, .clk = 0 },
-	{ .data = MIPI_CAL_CONFIG_CSIC, .clk = 0 },
-	{ .data = MIPI_CAL_CONFIG_CSID, .clk = 0 },
-	{ .data = MIPI_CAL_CONFIG_CSIE, .clk = 0 },
-	{ .data = MIPI_CAL_CONFIG_CSIF, .clk = 0 },
-	{ .data = MIPI_CAL_CONFIG_DSIA, .clk = MIPI_CAL_CONFIG_DSIA_CLK },
-	{ .data = MIPI_CAL_CONFIG_DSIB, .clk = MIPI_CAL_CONFIG_DSIB_CLK },
-	{ .data = MIPI_CAL_CONFIG_DSIC, .clk = MIPI_CAL_CONFIG_DSIC_CLK },
-	{ .data = MIPI_CAL_CONFIG_DSID, .clk = MIPI_CAL_CONFIG_DSID_CLK },
-};
-
-static const struct tegra_mipi_soc tegra210_mipi_soc = {
-	.has_clk_lane = true,
-	.pads = tegra210_mipi_pads,
-	.num_pads = ARRAY_SIZE(tegra210_mipi_pads),
-	.clock_enable_override = true,
-	.needs_vclamp_ref = false,
-	.pad_drive_down_ref = 0x0,
-	.pad_drive_up_ref = 0x3,
-	.pad_vclamp_level = 0x1,
-	.pad_vauxp_level = 0x1,
-	.hspdos = 0x0,
-	.hspuos = 0x2,
-	.termos = 0x0,
-	.hsclkpdos = 0x0,
-	.hsclkpuos = 0x2,
-};
-
-static const struct of_device_id tegra_mipi_of_match[] = {
-	{ .compatible = "nvidia,tegra114-mipi", .data = &tegra114_mipi_soc },
-	{ .compatible = "nvidia,tegra124-mipi", .data = &tegra124_mipi_soc },
-	{ .compatible = "nvidia,tegra132-mipi", .data = &tegra132_mipi_soc },
-	{ .compatible = "nvidia,tegra210-mipi", .data = &tegra210_mipi_soc },
-	{ },
-};
-
-static int tegra_mipi_probe(struct platform_device *pdev)
-{
-	const struct of_device_id *match;
-	struct tegra_mipi *mipi;
-
-	match = of_match_node(tegra_mipi_of_match, pdev->dev.of_node);
-	if (!match)
-		return -ENODEV;
-
-	mipi = devm_kzalloc(&pdev->dev, sizeof(*mipi), GFP_KERNEL);
-	if (!mipi)
-		return -ENOMEM;
-
-	mipi->soc = match->data;
-	mipi->dev = &pdev->dev;
-
-	mipi->regs = devm_platform_get_and_ioremap_resource(pdev, 0, NULL);
-	if (IS_ERR(mipi->regs))
-		return PTR_ERR(mipi->regs);
-
-	mutex_init(&mipi->lock);
-
-	mipi->clk = devm_clk_get_prepared(&pdev->dev, NULL);
-	if (IS_ERR(mipi->clk)) {
-		dev_err(&pdev->dev, "failed to get clock\n");
-		return PTR_ERR(mipi->clk);
-	}
-
-	platform_set_drvdata(pdev, mipi);
-
-	return 0;
+	return devm_add_action_or_reset(device, tegra_mipi_remove_provider, NULL);
 }
-
-struct platform_driver tegra_mipi_driver = {
-	.driver = {
-		.name = "tegra-mipi",
-		.of_match_table = tegra_mipi_of_match,
-	},
-	.probe = tegra_mipi_probe,
-};
+EXPORT_SYMBOL(devm_tegra_mipi_add_provider);
diff --git a/drivers/gpu/host1x/tegra114-mipi.c b/drivers/gpu/host1x/tegra114-mipi.c
new file mode 100644
index 000000000000..c084a09784d1
--- /dev/null
+++ b/drivers/gpu/host1x/tegra114-mipi.c
@@ -0,0 +1,483 @@
+/*
+ * Copyright (C) 2013 NVIDIA Corporation
+ *
+ * Permission to use, copy, modify, distribute, and sell this software and its
+ * documentation for any purpose is hereby granted without fee, provided that
+ * the above copyright notice appear in all copies and that both that copyright
+ * notice and this permission notice appear in supporting documentation, and
+ * that the name of the copyright holders not be used in advertising or
+ * publicity pertaining to distribution of the software without specific,
+ * written prior permission.  The copyright holders make no representations
+ * about the suitability of this software for any purpose.  It is provided "as
+ * is" without express or implied warranty.
+ *
+ * THE COPYRIGHT HOLDERS DISCLAIM ALL WARRANTIES WITH REGARD TO THIS SOFTWARE,
+ * INCLUDING ALL IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS, IN NO
+ * EVENT SHALL THE COPYRIGHT HOLDERS BE LIABLE FOR ANY SPECIAL, INDIRECT OR
+ * CONSEQUENTIAL DAMAGES OR ANY DAMAGES WHATSOEVER RESULTING FROM LOSS OF USE,
+ * DATA OR PROFITS, WHETHER IN AN ACTION OF CONTRACT, NEGLIGENCE OR OTHER
+ * TORTIOUS ACTION, ARISING OUT OF OR IN CONNECTION WITH THE USE OR PERFORMANCE
+ * OF THIS SOFTWARE.
+ */
+
+#include <linux/clk.h>
+#include <linux/host1x.h>
+#include <linux/io.h>
+#include <linux/iopoll.h>
+#include <linux/of_platform.h>
+#include <linux/platform_device.h>
+#include <linux/slab.h>
+#include <linux/tegra-mipi-cal.h>
+
+#include "dev.h"
+
+#define MIPI_CAL_CTRL			0x00
+#define MIPI_CAL_CTRL_NOISE_FILTER(x)	(((x) & 0xf) << 26)
+#define MIPI_CAL_CTRL_PRESCALE(x)	(((x) & 0x3) << 24)
+#define MIPI_CAL_CTRL_CLKEN_OVR		BIT(4)
+#define MIPI_CAL_CTRL_START		BIT(0)
+
+#define MIPI_CAL_AUTOCAL_CTRL		0x01
+
+#define MIPI_CAL_STATUS			0x02
+#define MIPI_CAL_STATUS_DONE		BIT(16)
+#define MIPI_CAL_STATUS_ACTIVE		BIT(0)
+
+#define MIPI_CAL_CONFIG_CSIA		0x05
+#define MIPI_CAL_CONFIG_CSIB		0x06
+#define MIPI_CAL_CONFIG_CSIC		0x07
+#define MIPI_CAL_CONFIG_CSID		0x08
+#define MIPI_CAL_CONFIG_CSIE		0x09
+#define MIPI_CAL_CONFIG_CSIF		0x0a
+#define MIPI_CAL_CONFIG_DSIA		0x0e
+#define MIPI_CAL_CONFIG_DSIB		0x0f
+#define MIPI_CAL_CONFIG_DSIC		0x10
+#define MIPI_CAL_CONFIG_DSID		0x11
+
+#define MIPI_CAL_CONFIG_DSIA_CLK	0x19
+#define MIPI_CAL_CONFIG_DSIB_CLK	0x1a
+#define MIPI_CAL_CONFIG_CSIAB_CLK	0x1b
+#define MIPI_CAL_CONFIG_DSIC_CLK	0x1c
+#define MIPI_CAL_CONFIG_CSICD_CLK	0x1c
+#define MIPI_CAL_CONFIG_DSID_CLK	0x1d
+#define MIPI_CAL_CONFIG_CSIE_CLK	0x1d
+
+/* for data and clock lanes */
+#define MIPI_CAL_CONFIG_SELECT		BIT(21)
+
+/* for data lanes */
+#define MIPI_CAL_CONFIG_HSPDOS(x)	(((x) & 0x1f) << 16)
+#define MIPI_CAL_CONFIG_HSPUOS(x)	(((x) & 0x1f) <<  8)
+#define MIPI_CAL_CONFIG_TERMOS(x)	(((x) & 0x1f) <<  0)
+
+/* for clock lanes */
+#define MIPI_CAL_CONFIG_HSCLKPDOSD(x)	(((x) & 0x1f) <<  8)
+#define MIPI_CAL_CONFIG_HSCLKPUOSD(x)	(((x) & 0x1f) <<  0)
+
+#define MIPI_CAL_BIAS_PAD_CFG0		0x16
+#define MIPI_CAL_BIAS_PAD_PDVCLAMP	BIT(1)
+#define MIPI_CAL_BIAS_PAD_E_VCLAMP_REF	BIT(0)
+
+#define MIPI_CAL_BIAS_PAD_CFG1		0x17
+#define MIPI_CAL_BIAS_PAD_DRV_DN_REF(x) (((x) & 0x7) << 16)
+#define MIPI_CAL_BIAS_PAD_DRV_UP_REF(x) (((x) & 0x7) << 8)
+
+#define MIPI_CAL_BIAS_PAD_CFG2		0x18
+#define MIPI_CAL_BIAS_PAD_VCLAMP(x)	(((x) & 0x7) << 16)
+#define MIPI_CAL_BIAS_PAD_VAUXP(x)	(((x) & 0x7) << 4)
+#define MIPI_CAL_BIAS_PAD_PDVREG	BIT(1)
+
+struct tegra_mipi_pad {
+	unsigned long data;
+	unsigned long clk;
+};
+
+struct tegra_mipi_soc {
+	bool has_clk_lane;
+	const struct tegra_mipi_pad *pads;
+	unsigned int num_pads;
+
+	bool clock_enable_override;
+	bool needs_vclamp_ref;
+
+	/* bias pad configuration settings */
+	u8 pad_drive_down_ref;
+	u8 pad_drive_up_ref;
+
+	u8 pad_vclamp_level;
+	u8 pad_vauxp_level;
+
+	/* calibration settings for data lanes */
+	u8 hspdos;
+	u8 hspuos;
+	u8 termos;
+
+	/* calibration settings for clock lanes */
+	u8 hsclkpdos;
+	u8 hsclkpuos;
+};
+
+struct tegra_mipi {
+	const struct tegra_mipi_soc *soc;
+	struct device *dev;
+	void __iomem *regs;
+	struct mutex lock; /* for register access */
+	struct clk *clk;
+
+	unsigned long usage_count;
+};
+
+static inline u32 tegra_mipi_readl(struct tegra_mipi *mipi,
+				   unsigned long offset)
+{
+	return readl(mipi->regs + (offset << 2));
+}
+
+static inline void tegra_mipi_writel(struct tegra_mipi *mipi, u32 value,
+				     unsigned long offset)
+{
+	writel(value, mipi->regs + (offset << 2));
+}
+
+static int tegra114_mipi_power_up(struct tegra_mipi *mipi)
+{
+	u32 value;
+	int err;
+
+	err = clk_enable(mipi->clk);
+	if (err < 0)
+		return err;
+
+	value = tegra_mipi_readl(mipi, MIPI_CAL_BIAS_PAD_CFG0);
+	value &= ~MIPI_CAL_BIAS_PAD_PDVCLAMP;
+
+	if (mipi->soc->needs_vclamp_ref)
+		value |= MIPI_CAL_BIAS_PAD_E_VCLAMP_REF;
+
+	tegra_mipi_writel(mipi, value, MIPI_CAL_BIAS_PAD_CFG0);
+
+	value = tegra_mipi_readl(mipi, MIPI_CAL_BIAS_PAD_CFG2);
+	value &= ~MIPI_CAL_BIAS_PAD_PDVREG;
+	tegra_mipi_writel(mipi, value, MIPI_CAL_BIAS_PAD_CFG2);
+
+	clk_disable(mipi->clk);
+
+	return 0;
+}
+
+static int tegra114_mipi_power_down(struct tegra_mipi *mipi)
+{
+	u32 value;
+	int err;
+
+	err = clk_enable(mipi->clk);
+	if (err < 0)
+		return err;
+
+	/*
+	 * The MIPI_CAL_BIAS_PAD_PDVREG controls a voltage regulator that
+	 * supplies the DSI pads. This must be kept enabled until none of the
+	 * DSI lanes are used anymore.
+	 */
+	value = tegra_mipi_readl(mipi, MIPI_CAL_BIAS_PAD_CFG2);
+	value |= MIPI_CAL_BIAS_PAD_PDVREG;
+	tegra_mipi_writel(mipi, value, MIPI_CAL_BIAS_PAD_CFG2);
+
+	/*
+	 * MIPI_CAL_BIAS_PAD_PDVCLAMP and MIPI_CAL_BIAS_PAD_E_VCLAMP_REF
+	 * control a regulator that supplies current to the pre-driver logic.
+	 * Powering down this regulator causes DSI to fail, so it must remain
+	 * powered on until none of the DSI lanes are used anymore.
+	 */
+	value = tegra_mipi_readl(mipi, MIPI_CAL_BIAS_PAD_CFG0);
+
+	if (mipi->soc->needs_vclamp_ref)
+		value &= ~MIPI_CAL_BIAS_PAD_E_VCLAMP_REF;
+
+	value |= MIPI_CAL_BIAS_PAD_PDVCLAMP;
+	tegra_mipi_writel(mipi, value, MIPI_CAL_BIAS_PAD_CFG0);
+
+	return 0;
+}
+
+static int tegra114_mipi_enable(struct tegra_mipi_device *mipidev)
+{
+	struct tegra_mipi *mipi = platform_get_drvdata(mipidev->pdev);
+	int err = 0;
+
+	mutex_lock(&mipi->lock);
+
+	if (mipi->usage_count++ == 0)
+		err = tegra114_mipi_power_up(mipi);
+
+	mutex_unlock(&mipi->lock);
+
+	return err;
+}
+
+static int tegra114_mipi_disable(struct tegra_mipi_device *mipidev)
+{
+	struct tegra_mipi *mipi = platform_get_drvdata(mipidev->pdev);
+	int err = 0;
+
+	mutex_lock(&mipi->lock);
+
+	if (--mipi->usage_count == 0)
+		err = tegra114_mipi_power_down(mipi);
+
+	mutex_unlock(&mipi->lock);
+
+	return err;
+}
+
+static int tegra114_mipi_finish_calibration(struct tegra_mipi_device *mipidev)
+{
+	struct tegra_mipi *mipi = platform_get_drvdata(mipidev->pdev);
+	void __iomem *status_reg = mipi->regs + (MIPI_CAL_STATUS << 2);
+	u32 value;
+	int err;
+
+	err = readl_relaxed_poll_timeout(status_reg, value,
+					 !(value & MIPI_CAL_STATUS_ACTIVE) &&
+					 (value & MIPI_CAL_STATUS_DONE), 50,
+					 250000);
+	mutex_unlock(&mipi->lock);
+	clk_disable(mipi->clk);
+
+	return err;
+}
+
+static int tegra114_mipi_start_calibration(struct tegra_mipi_device *mipidev)
+{
+	struct tegra_mipi *mipi = platform_get_drvdata(mipidev->pdev);
+	const struct tegra_mipi_soc *soc = mipi->soc;
+	unsigned int i;
+	u32 value;
+	int err;
+
+	err = clk_enable(mipi->clk);
+	if (err < 0)
+		return err;
+
+	mutex_lock(&mipi->lock);
+
+	value = MIPI_CAL_BIAS_PAD_DRV_DN_REF(soc->pad_drive_down_ref) |
+		MIPI_CAL_BIAS_PAD_DRV_UP_REF(soc->pad_drive_up_ref);
+	tegra_mipi_writel(mipi, value, MIPI_CAL_BIAS_PAD_CFG1);
+
+	value = tegra_mipi_readl(mipi, MIPI_CAL_BIAS_PAD_CFG2);
+	value &= ~MIPI_CAL_BIAS_PAD_VCLAMP(0x7);
+	value &= ~MIPI_CAL_BIAS_PAD_VAUXP(0x7);
+	value |= MIPI_CAL_BIAS_PAD_VCLAMP(soc->pad_vclamp_level);
+	value |= MIPI_CAL_BIAS_PAD_VAUXP(soc->pad_vauxp_level);
+	tegra_mipi_writel(mipi, value, MIPI_CAL_BIAS_PAD_CFG2);
+
+	for (i = 0; i < soc->num_pads; i++) {
+		u32 clk = 0, data = 0;
+
+		if (mipidev->pads & BIT(i)) {
+			data = MIPI_CAL_CONFIG_SELECT |
+			       MIPI_CAL_CONFIG_HSPDOS(soc->hspdos) |
+			       MIPI_CAL_CONFIG_HSPUOS(soc->hspuos) |
+			       MIPI_CAL_CONFIG_TERMOS(soc->termos);
+			clk = MIPI_CAL_CONFIG_SELECT |
+			      MIPI_CAL_CONFIG_HSCLKPDOSD(soc->hsclkpdos) |
+			      MIPI_CAL_CONFIG_HSCLKPUOSD(soc->hsclkpuos);
+		}
+
+		tegra_mipi_writel(mipi, data, soc->pads[i].data);
+
+		if (soc->has_clk_lane && soc->pads[i].clk != 0)
+			tegra_mipi_writel(mipi, clk, soc->pads[i].clk);
+	}
+
+	value = tegra_mipi_readl(mipi, MIPI_CAL_CTRL);
+	value &= ~MIPI_CAL_CTRL_NOISE_FILTER(0xf);
+	value &= ~MIPI_CAL_CTRL_PRESCALE(0x3);
+	value |= MIPI_CAL_CTRL_NOISE_FILTER(0xa);
+	value |= MIPI_CAL_CTRL_PRESCALE(0x2);
+
+	if (!soc->clock_enable_override)
+		value &= ~MIPI_CAL_CTRL_CLKEN_OVR;
+	else
+		value |= MIPI_CAL_CTRL_CLKEN_OVR;
+
+	tegra_mipi_writel(mipi, value, MIPI_CAL_CTRL);
+
+	/* clear any pending status bits */
+	value = tegra_mipi_readl(mipi, MIPI_CAL_STATUS);
+	tegra_mipi_writel(mipi, value, MIPI_CAL_STATUS);
+
+	value = tegra_mipi_readl(mipi, MIPI_CAL_CTRL);
+	value |= MIPI_CAL_CTRL_START;
+	tegra_mipi_writel(mipi, value, MIPI_CAL_CTRL);
+
+	/*
+	 * Wait for min 72uS to let calibration logic finish calibration
+	 * sequence codes before waiting for pads idle state to apply the
+	 * results.
+	 */
+	usleep_range(75, 80);
+
+	return 0;
+}
+
+static const struct tegra_mipi_ops tegra114_mipi_ops = {
+	.enable = tegra114_mipi_enable,
+	.disable = tegra114_mipi_disable,
+	.start_calibration = tegra114_mipi_start_calibration,
+	.finish_calibration = tegra114_mipi_finish_calibration,
+};
+
+static const struct tegra_mipi_pad tegra114_mipi_pads[] = {
+	{ .data = MIPI_CAL_CONFIG_CSIA },
+	{ .data = MIPI_CAL_CONFIG_CSIB },
+	{ .data = MIPI_CAL_CONFIG_CSIC },
+	{ .data = MIPI_CAL_CONFIG_CSID },
+	{ .data = MIPI_CAL_CONFIG_CSIE },
+	{ .data = MIPI_CAL_CONFIG_DSIA },
+	{ .data = MIPI_CAL_CONFIG_DSIB },
+	{ .data = MIPI_CAL_CONFIG_DSIC },
+	{ .data = MIPI_CAL_CONFIG_DSID },
+};
+
+static const struct tegra_mipi_soc tegra114_mipi_soc = {
+	.has_clk_lane = false,
+	.pads = tegra114_mipi_pads,
+	.num_pads = ARRAY_SIZE(tegra114_mipi_pads),
+	.clock_enable_override = true,
+	.needs_vclamp_ref = true,
+	.pad_drive_down_ref = 0x2,
+	.pad_drive_up_ref = 0x0,
+	.pad_vclamp_level = 0x0,
+	.pad_vauxp_level = 0x0,
+	.hspdos = 0x0,
+	.hspuos = 0x4,
+	.termos = 0x5,
+	.hsclkpdos = 0x0,
+	.hsclkpuos = 0x4,
+};
+
+static const struct tegra_mipi_pad tegra124_mipi_pads[] = {
+	{ .data = MIPI_CAL_CONFIG_CSIA, .clk = MIPI_CAL_CONFIG_CSIAB_CLK },
+	{ .data = MIPI_CAL_CONFIG_CSIB, .clk = MIPI_CAL_CONFIG_CSIAB_CLK },
+	{ .data = MIPI_CAL_CONFIG_CSIC, .clk = MIPI_CAL_CONFIG_CSICD_CLK },
+	{ .data = MIPI_CAL_CONFIG_CSID, .clk = MIPI_CAL_CONFIG_CSICD_CLK },
+	{ .data = MIPI_CAL_CONFIG_CSIE, .clk = MIPI_CAL_CONFIG_CSIE_CLK  },
+	{ .data = MIPI_CAL_CONFIG_DSIA, .clk = MIPI_CAL_CONFIG_DSIA_CLK  },
+	{ .data = MIPI_CAL_CONFIG_DSIB, .clk = MIPI_CAL_CONFIG_DSIB_CLK  },
+};
+
+static const struct tegra_mipi_soc tegra124_mipi_soc = {
+	.has_clk_lane = true,
+	.pads = tegra124_mipi_pads,
+	.num_pads = ARRAY_SIZE(tegra124_mipi_pads),
+	.clock_enable_override = true,
+	.needs_vclamp_ref = true,
+	.pad_drive_down_ref = 0x2,
+	.pad_drive_up_ref = 0x0,
+	.pad_vclamp_level = 0x0,
+	.pad_vauxp_level = 0x0,
+	.hspdos = 0x0,
+	.hspuos = 0x0,
+	.termos = 0x0,
+	.hsclkpdos = 0x1,
+	.hsclkpuos = 0x2,
+};
+
+static const struct tegra_mipi_soc tegra132_mipi_soc = {
+	.has_clk_lane = true,
+	.pads = tegra124_mipi_pads,
+	.num_pads = ARRAY_SIZE(tegra124_mipi_pads),
+	.clock_enable_override = false,
+	.needs_vclamp_ref = false,
+	.pad_drive_down_ref = 0x0,
+	.pad_drive_up_ref = 0x3,
+	.pad_vclamp_level = 0x0,
+	.pad_vauxp_level = 0x0,
+	.hspdos = 0x0,
+	.hspuos = 0x0,
+	.termos = 0x0,
+	.hsclkpdos = 0x3,
+	.hsclkpuos = 0x2,
+};
+
+static const struct tegra_mipi_pad tegra210_mipi_pads[] = {
+	{ .data = MIPI_CAL_CONFIG_CSIA, .clk = 0 },
+	{ .data = MIPI_CAL_CONFIG_CSIB, .clk = 0 },
+	{ .data = MIPI_CAL_CONFIG_CSIC, .clk = 0 },
+	{ .data = MIPI_CAL_CONFIG_CSID, .clk = 0 },
+	{ .data = MIPI_CAL_CONFIG_CSIE, .clk = 0 },
+	{ .data = MIPI_CAL_CONFIG_CSIF, .clk = 0 },
+	{ .data = MIPI_CAL_CONFIG_DSIA, .clk = MIPI_CAL_CONFIG_DSIA_CLK },
+	{ .data = MIPI_CAL_CONFIG_DSIB, .clk = MIPI_CAL_CONFIG_DSIB_CLK },
+	{ .data = MIPI_CAL_CONFIG_DSIC, .clk = MIPI_CAL_CONFIG_DSIC_CLK },
+	{ .data = MIPI_CAL_CONFIG_DSID, .clk = MIPI_CAL_CONFIG_DSID_CLK },
+};
+
+static const struct tegra_mipi_soc tegra210_mipi_soc = {
+	.has_clk_lane = true,
+	.pads = tegra210_mipi_pads,
+	.num_pads = ARRAY_SIZE(tegra210_mipi_pads),
+	.clock_enable_override = true,
+	.needs_vclamp_ref = false,
+	.pad_drive_down_ref = 0x0,
+	.pad_drive_up_ref = 0x3,
+	.pad_vclamp_level = 0x1,
+	.pad_vauxp_level = 0x1,
+	.hspdos = 0x0,
+	.hspuos = 0x2,
+	.termos = 0x0,
+	.hsclkpdos = 0x0,
+	.hsclkpuos = 0x2,
+};
+
+static const struct of_device_id tegra_mipi_of_match[] = {
+	{ .compatible = "nvidia,tegra114-mipi", .data = &tegra114_mipi_soc },
+	{ .compatible = "nvidia,tegra124-mipi", .data = &tegra124_mipi_soc },
+	{ .compatible = "nvidia,tegra132-mipi", .data = &tegra132_mipi_soc },
+	{ .compatible = "nvidia,tegra210-mipi", .data = &tegra210_mipi_soc },
+	{ },
+};
+
+static int tegra_mipi_probe(struct platform_device *pdev)
+{
+	const struct of_device_id *match;
+	struct tegra_mipi *mipi;
+
+	match = of_match_node(tegra_mipi_of_match, pdev->dev.of_node);
+	if (!match)
+		return -ENODEV;
+
+	mipi = devm_kzalloc(&pdev->dev, sizeof(*mipi), GFP_KERNEL);
+	if (!mipi)
+		return -ENOMEM;
+
+	mipi->soc = match->data;
+	mipi->dev = &pdev->dev;
+
+	mipi->regs = devm_platform_get_and_ioremap_resource(pdev, 0, NULL);
+	if (IS_ERR(mipi->regs))
+		return PTR_ERR(mipi->regs);
+
+	mutex_init(&mipi->lock);
+
+	mipi->clk = devm_clk_get_prepared(&pdev->dev, NULL);
+	if (IS_ERR(mipi->clk)) {
+		dev_err(&pdev->dev, "failed to get clock\n");
+		return PTR_ERR(mipi->clk);
+	}
+
+	platform_set_drvdata(pdev, mipi);
+
+	return devm_tegra_mipi_add_provider(&pdev->dev, pdev->dev.of_node,
+					    &tegra114_mipi_ops);
+}
+
+struct platform_driver tegra_mipi_driver = {
+	.driver = {
+		.name = "tegra-mipi",
+		.of_match_table = tegra_mipi_of_match,
+	},
+	.probe = tegra_mipi_probe,
+};
diff --git a/drivers/staging/media/tegra-video/csi.c b/drivers/staging/media/tegra-video/csi.c
index 894583d48b35..9fdc8ac1c754 100644
--- a/drivers/staging/media/tegra-video/csi.c
+++ b/drivers/staging/media/tegra-video/csi.c
@@ -12,6 +12,7 @@
 #include <linux/of_graph.h>
 #include <linux/platform_device.h>
 #include <linux/pm_runtime.h>
+#include <linux/tegra-mipi-cal.h>
 
 #include <media/v4l2-fwnode.h>
 
diff --git a/include/linux/host1x.h b/include/linux/host1x.h
index 5e7a63143a4a..1f5f55917d1c 100644
--- a/include/linux/host1x.h
+++ b/include/linux/host1x.h
@@ -453,16 +453,6 @@ void host1x_client_unregister(struct host1x_client *client);
 int host1x_client_suspend(struct host1x_client *client);
 int host1x_client_resume(struct host1x_client *client);
 
-struct tegra_mipi_device;
-
-struct tegra_mipi_device *tegra_mipi_request(struct device *device,
-					     struct device_node *np);
-void tegra_mipi_free(struct tegra_mipi_device *device);
-int tegra_mipi_enable(struct tegra_mipi_device *device);
-int tegra_mipi_disable(struct tegra_mipi_device *device);
-int tegra_mipi_start_calibration(struct tegra_mipi_device *device);
-int tegra_mipi_finish_calibration(struct tegra_mipi_device *device);
-
 /* host1x memory contexts */
 
 struct host1x_memory_context {
diff --git a/include/linux/tegra-mipi-cal.h b/include/linux/tegra-mipi-cal.h
new file mode 100644
index 000000000000..2a540b50f65d
--- /dev/null
+++ b/include/linux/tegra-mipi-cal.h
@@ -0,0 +1,57 @@
+/* SPDX-License-Identifier: GPL-2.0 */
+
+#ifndef __TEGRA_MIPI_CAL_H_
+#define __TEGRA_MIPI_CAL_H_
+
+struct tegra_mipi_device {
+	const struct tegra_mipi_ops *ops;
+	struct platform_device *pdev;
+	unsigned long pads;
+};
+
+/**
+ * Operations for Tegra MIPI calibration device
+ */
+struct tegra_mipi_ops {
+	/**
+	 * @enable:
+	 *
+	 * Enable MIPI calibration device
+	 */
+	int (*enable)(struct tegra_mipi_device *device);
+
+	/**
+	 * @disable:
+	 *
+	 * Disable MIPI calibration device
+	 */
+	int (*disable)(struct tegra_mipi_device *device);
+
+	/**
+	 * @start_calibration:
+	 *
+	 * Start MIPI calibration
+	 */
+	int (*start_calibration)(struct tegra_mipi_device *device);
+
+	/**
+	 * @finish_calibration:
+	 *
+	 * Finish MIPI calibration
+	 */
+	int (*finish_calibration)(struct tegra_mipi_device *device);
+};
+
+int devm_tegra_mipi_add_provider(struct device *device, struct device_node *np,
+				 const struct tegra_mipi_ops *ops);
+
+struct tegra_mipi_device *tegra_mipi_request(struct device *device,
+					     struct device_node *np);
+void tegra_mipi_free(struct tegra_mipi_device *device);
+
+int tegra_mipi_enable(struct tegra_mipi_device *device);
+int tegra_mipi_disable(struct tegra_mipi_device *device);
+int tegra_mipi_start_calibration(struct tegra_mipi_device *device);
+int tegra_mipi_finish_calibration(struct tegra_mipi_device *device);
+
+#endif /* __TEGRA_MIPI_CAL_H_ */
-- 
2.51.0


