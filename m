Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 24784242345
	for <lists+linux-media@lfdr.de>; Wed, 12 Aug 2020 02:28:16 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726680AbgHLA14 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 11 Aug 2020 20:27:56 -0400
Received: from hqnvemgate24.nvidia.com ([216.228.121.143]:11653 "EHLO
        hqnvemgate24.nvidia.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726624AbgHLA1x (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 11 Aug 2020 20:27:53 -0400
Received: from hqpgpgate102.nvidia.com (Not Verified[216.228.121.13]) by hqnvemgate24.nvidia.com (using TLS: TLSv1.2, DES-CBC3-SHA)
        id <B5f33371f0001>; Tue, 11 Aug 2020 17:26:07 -0700
Received: from hqmail.nvidia.com ([172.20.161.6])
  by hqpgpgate102.nvidia.com (PGP Universal service);
  Tue, 11 Aug 2020 17:27:53 -0700
X-PGP-Universal: processed;
        by hqpgpgate102.nvidia.com on Tue, 11 Aug 2020 17:27:53 -0700
Received: from HQMAIL101.nvidia.com (172.20.187.10) by HQMAIL105.nvidia.com
 (172.20.187.12) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Wed, 12 Aug
 2020 00:27:53 +0000
Received: from rnnvemgw01.nvidia.com (10.128.109.123) by HQMAIL101.nvidia.com
 (172.20.187.10) with Microsoft SMTP Server (TLS) id 15.0.1473.3 via Frontend
 Transport; Wed, 12 Aug 2020 00:27:52 +0000
Received: from skomatineni-linux.nvidia.com (Not Verified[10.2.172.8]) by rnnvemgw01.nvidia.com with Trustwave SEG (v7,5,8,10121)
        id <B5f3337870001>; Tue, 11 Aug 2020 17:27:52 -0700
From:   Sowjanya Komatineni <skomatineni@nvidia.com>
To:     <skomatineni@nvidia.com>, <thierry.reding@gmail.com>,
        <jonathanh@nvidia.com>, <frankc@nvidia.com>, <hverkuil@xs4all.nl>,
        <sakari.ailus@iki.fi>, <robh+dt@kernel.org>,
        <helen.koike@collabora.com>
CC:     <digetx@gmail.com>, <gregkh@linuxfoundation.org>,
        <linux-media@vger.kernel.org>, <devicetree@vger.kernel.org>,
        <linux-tegra@vger.kernel.org>, <linux-kernel@vger.kernel.org>
Subject: [PATCH v10 08/10] gpu: host1x: mipi: Keep MIPI clock enabled and mutex locked till calibration done
Date:   Tue, 11 Aug 2020 17:27:19 -0700
Message-ID: <1597192041-16949-9-git-send-email-skomatineni@nvidia.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1597192041-16949-1-git-send-email-skomatineni@nvidia.com>
References: <1597192041-16949-1-git-send-email-skomatineni@nvidia.com>
X-NVConfidentiality: public
MIME-Version: 1.0
Content-Type: text/plain
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nvidia.com; s=n1;
        t=1597191967; bh=LTS932fdLvwXI9om1DiK7LN0NCuI1nrSF4ze3h9IP80=;
        h=X-PGP-Universal:From:To:CC:Subject:Date:Message-ID:X-Mailer:
         In-Reply-To:References:X-NVConfidentiality:MIME-Version:
         Content-Type;
        b=ozcIGQkDMsNHsHTRmc/u8DrxAbJUjPuCB8miinv8cKRcJ2fXC/7v09eEK4xtSKfbt
         B2XRySKuEmTyfFKqCuQCwBLXjKvivdJgfch/3hFLU6Bgcj0+/LV5zll39HglmPvxOt
         8x4cDaDWQ1ykcsWe/rJuolNp2CGO9a7YW0Giqhpt5i2N739wZmz81mCSaN5/nhYQ8V
         j45dq/XMlEu6MB6qcjzIMht6WLg6Qc7g+v2t/3dKTjQjm9vUELYUwcLOeU8Am6X3E6
         o8G4AUTRZrBJ5nx6FCZwjNxJxIToNT5CVpL27MWMjS9W0+Ap9rqSB2CzPBnJPF9yt1
         N1VNiDH/QJVmw==
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

With the split of MIPI calibration into tegra_mipi_calibrate() and
tegra_mipi_wait(), MIPI clock is not kept enabled and mutex is not locked
till the calibration is done.

So, this patch keeps MIPI clock enabled and mutex locked after triggering
start of calibration till its done.

To let calibration process go through its finite sequence codes before
calibration logic waiting for pads idle state added wait time of 75usec
to make sure it sees idle state to apply the results.

This patch renames tegra_mipi_calibrate() as tegra_mipi_start_calibration()
and tegra_mipi_wait() as tegra_mipi_finish_calibration() to be inline
with their usage.

Reviewed-by: Dmitry Osipenko <digetx@gmail.com>
Signed-off-by: Sowjanya Komatineni <skomatineni@nvidia.com>
---
 drivers/gpu/drm/tegra/dsi.c |  4 ++--
 drivers/gpu/host1x/mipi.c   | 22 ++++++++++------------
 include/linux/host1x.h      |  4 ++--
 3 files changed, 14 insertions(+), 16 deletions(-)

diff --git a/drivers/gpu/drm/tegra/dsi.c b/drivers/gpu/drm/tegra/dsi.c
index 3820e8d..a7864e9 100644
--- a/drivers/gpu/drm/tegra/dsi.c
+++ b/drivers/gpu/drm/tegra/dsi.c
@@ -694,11 +694,11 @@ static int tegra_dsi_pad_calibrate(struct tegra_dsi *dsi)
 		DSI_PAD_PREEMP_PD(0x03) | DSI_PAD_PREEMP_PU(0x3);
 	tegra_dsi_writel(dsi, value, DSI_PAD_CONTROL_3);
 
-	err = tegra_mipi_calibrate(dsi->mipi);
+	err = tegra_mipi_start_calibration(dsi->mipi);
 	if (err < 0)
 		return err;
 
-	return tegra_mipi_wait(dsi->mipi);
+	return tegra_mipi_finish_calibration(dsi->mipi);
 }
 
 static void tegra_dsi_set_timeout(struct tegra_dsi *dsi, unsigned long bclk,
diff --git a/drivers/gpu/host1x/mipi.c b/drivers/gpu/host1x/mipi.c
index e606464..2efe12d 100644
--- a/drivers/gpu/host1x/mipi.c
+++ b/drivers/gpu/host1x/mipi.c
@@ -293,19 +293,13 @@ int tegra_mipi_disable(struct tegra_mipi_device *dev)
 }
 EXPORT_SYMBOL(tegra_mipi_disable);
 
-int tegra_mipi_wait(struct tegra_mipi_device *device)
+int tegra_mipi_finish_calibration(struct tegra_mipi_device *device)
 {
 	struct tegra_mipi *mipi = device->mipi;
 	void __iomem *status_reg = mipi->regs + (MIPI_CAL_STATUS << 2);
 	u32 value;
 	int err;
 
-	err = clk_enable(device->mipi->clk);
-	if (err < 0)
-		return err;
-
-	mutex_lock(&device->mipi->lock);
-
 	err = readl_relaxed_poll_timeout(status_reg, value,
 					 !(value & MIPI_CAL_STATUS_ACTIVE) &&
 					 (value & MIPI_CAL_STATUS_DONE), 50,
@@ -315,9 +309,9 @@ int tegra_mipi_wait(struct tegra_mipi_device *device)
 
 	return err;
 }
-EXPORT_SYMBOL(tegra_mipi_wait);
+EXPORT_SYMBOL(tegra_mipi_finish_calibration);
 
-int tegra_mipi_calibrate(struct tegra_mipi_device *device)
+int tegra_mipi_start_calibration(struct tegra_mipi_device *device)
 {
 	const struct tegra_mipi_soc *soc = device->mipi->soc;
 	unsigned int i;
@@ -381,12 +375,16 @@ int tegra_mipi_calibrate(struct tegra_mipi_device *device)
 	value |= MIPI_CAL_CTRL_START;
 	tegra_mipi_writel(device->mipi, value, MIPI_CAL_CTRL);
 
-	mutex_unlock(&device->mipi->lock);
-	clk_disable(device->mipi->clk);
+	/*
+	 * Wait for min 72uS to let calibration logic finish calibration
+	 * sequence codes before waiting for pads idle state to apply the
+	 * results.
+	 */
+	usleep_range(75, 80);
 
 	return 0;
 }
-EXPORT_SYMBOL(tegra_mipi_calibrate);
+EXPORT_SYMBOL(tegra_mipi_start_calibration);
 
 static const struct tegra_mipi_pad tegra114_mipi_pads[] = {
 	{ .data = MIPI_CAL_CONFIG_CSIA },
diff --git a/include/linux/host1x.h b/include/linux/host1x.h
index 20c885d..ce59a6a 100644
--- a/include/linux/host1x.h
+++ b/include/linux/host1x.h
@@ -333,7 +333,7 @@ struct tegra_mipi_device *tegra_mipi_request(struct device *device,
 void tegra_mipi_free(struct tegra_mipi_device *device);
 int tegra_mipi_enable(struct tegra_mipi_device *device);
 int tegra_mipi_disable(struct tegra_mipi_device *device);
-int tegra_mipi_calibrate(struct tegra_mipi_device *device);
-int tegra_mipi_wait(struct tegra_mipi_device *device);
+int tegra_mipi_start_calibration(struct tegra_mipi_device *device);
+int tegra_mipi_finish_calibration(struct tegra_mipi_device *device);
 
 #endif
-- 
2.7.4

