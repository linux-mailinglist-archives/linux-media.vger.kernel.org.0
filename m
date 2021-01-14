Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id AFB262F6EFD
	for <lists+linux-media@lfdr.de>; Fri, 15 Jan 2021 00:36:07 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730953AbhANXex (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 14 Jan 2021 18:34:53 -0500
Received: from gloria.sntech.de ([185.11.138.130]:53554 "EHLO gloria.sntech.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1730834AbhANXew (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Thu, 14 Jan 2021 18:34:52 -0500
Received: from ip5f5aa64a.dynamic.kabel-deutschland.de ([95.90.166.74] helo=phil.sntech)
        by gloria.sntech.de with esmtpsa (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.92)
        (envelope-from <heiko@sntech.de>)
        id 1l0C82-0001lf-Nk; Fri, 15 Jan 2021 00:34:10 +0100
From:   Heiko Stuebner <heiko@sntech.de>
To:     dafna.hirschfeld@collabora.com, helen.koike@collabora.com,
        linux-media@vger.kernel.org, mchehab@kernel.org,
        Laurent.pinchart@ideasonboard.com, hverkuil@xs4all.nl
Cc:     linux-rockchip@lists.infradead.org, ezequiel@collabora.com,
        christoph.muellner@theobroma-systems.com, heiko@sntech.de,
        tfiga@chromium.org,
        Heiko Stuebner <heiko.stuebner@theobroma-systems.com>
Subject: [PATCH 1/2] media: rockchip: rkisp1: carry ip version information
Date:   Fri, 15 Jan 2021 00:33:44 +0100
Message-Id: <20210114233345.160223-5-heiko@sntech.de>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20210114233345.160223-1-heiko@sntech.de>
References: <20210114233345.160223-1-heiko@sntech.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

From: Heiko Stuebner <heiko.stuebner@theobroma-systems.com>

The IP block evolved from its rk3288/rk3399 base and the vendor
designates them with a numerical version. rk3399 for example
is designated V10 probably meaning V1.0.

There doesn't seem to be an actual version register we could read that
information from, so allow the match_data to carry that information
for future differentiation.

Also carry that information in the hw_revision field of the media-
controller API, so that userspace also has access to that.

The added versions are:
- V10: at least rk3288 + rk3399
- V11: seemingly unused as of now, but probably appeared in some soc
- V12: at least rk3326 + px30
- V13: at least rk1808

Signed-off-by: Heiko Stuebner <heiko.stuebner@theobroma-systems.com>
---
changes since rfc:
- move rkisp1_version enum into uapo
- show version in media-api hw_revision

 .../platform/rockchip/rkisp1/rkisp1-common.h  |  1 +
 .../platform/rockchip/rkisp1/rkisp1-dev.c     | 22 +++++++++++--------
 include/uapi/linux/rkisp1-config.h            |  7 ++++++
 3 files changed, 21 insertions(+), 9 deletions(-)

diff --git a/drivers/media/platform/rockchip/rkisp1/rkisp1-common.h b/drivers/media/platform/rockchip/rkisp1/rkisp1-common.h
index 038c303a8aed..bad1bd468f2f 100644
--- a/drivers/media/platform/rockchip/rkisp1/rkisp1-common.h
+++ b/drivers/media/platform/rockchip/rkisp1/rkisp1-common.h
@@ -354,6 +354,7 @@ struct rkisp1_device {
 	void __iomem *base_addr;
 	int irq;
 	struct device *dev;
+	enum rkisp1_cif_isp_version isp_ver;
 	unsigned int clk_size;
 	struct clk_bulk_data clks[RKISP1_MAX_BUS_CLK];
 	struct v4l2_device v4l2_dev;
diff --git a/drivers/media/platform/rockchip/rkisp1/rkisp1-dev.c b/drivers/media/platform/rockchip/rkisp1/rkisp1-dev.c
index 68da1eed753d..f594d7cd03d0 100644
--- a/drivers/media/platform/rockchip/rkisp1/rkisp1-dev.c
+++ b/drivers/media/platform/rockchip/rkisp1/rkisp1-dev.c
@@ -104,6 +104,7 @@
 struct rkisp1_match_data {
 	const char * const *clks;
 	unsigned int size;
+	enum rkisp1_cif_isp_version isp_ver;
 };
 
 /* ----------------------------------------------------------------------------
@@ -411,15 +412,16 @@ static const char * const rk3399_isp_clks[] = {
 	"hclk",
 };
 
-static const struct rkisp1_match_data rk3399_isp_clk_data = {
+static const struct rkisp1_match_data rk3399_isp_match_data = {
 	.clks = rk3399_isp_clks,
 	.size = ARRAY_SIZE(rk3399_isp_clks),
+	.isp_ver = RKISP1_V10,
 };
 
 static const struct of_device_id rkisp1_of_match[] = {
 	{
 		.compatible = "rockchip,rk3399-cif-isp",
-		.data = &rk3399_isp_clk_data,
+		.data = &rk3399_isp_match_data,
 	},
 	{},
 };
@@ -457,15 +459,15 @@ static void rkisp1_debug_init(struct rkisp1_device *rkisp1)
 
 static int rkisp1_probe(struct platform_device *pdev)
 {
-	const struct rkisp1_match_data *clk_data;
+	const struct rkisp1_match_data *match_data;
 	struct device *dev = &pdev->dev;
 	struct rkisp1_device *rkisp1;
 	struct v4l2_device *v4l2_dev;
 	unsigned int i;
 	int ret, irq;
 
-	clk_data = of_device_get_match_data(&pdev->dev);
-	if (!clk_data)
+	match_data = of_device_get_match_data(&pdev->dev);
+	if (!match_data)
 		return -ENODEV;
 
 	rkisp1 = devm_kzalloc(dev, sizeof(*rkisp1), GFP_KERNEL);
@@ -494,15 +496,17 @@ static int rkisp1_probe(struct platform_device *pdev)
 
 	rkisp1->irq = irq;
 
-	for (i = 0; i < clk_data->size; i++)
-		rkisp1->clks[i].id = clk_data->clks[i];
-	ret = devm_clk_bulk_get(dev, clk_data->size, rkisp1->clks);
+	for (i = 0; i < match_data->size; i++)
+		rkisp1->clks[i].id = match_data->clks[i];
+	ret = devm_clk_bulk_get(dev, match_data->size, rkisp1->clks);
 	if (ret)
 		return ret;
-	rkisp1->clk_size = clk_data->size;
+	rkisp1->clk_size = match_data->size;
+	rkisp1->isp_ver = match_data->isp_ver;
 
 	pm_runtime_enable(&pdev->dev);
 
+	rkisp1->media_dev.hw_revision = rkisp1->isp_ver;
 	strscpy(rkisp1->media_dev.model, RKISP1_DRIVER_NAME,
 		sizeof(rkisp1->media_dev.model));
 	rkisp1->media_dev.dev = &pdev->dev;
diff --git a/include/uapi/linux/rkisp1-config.h b/include/uapi/linux/rkisp1-config.h
index 6e449e784260..bad46aadf838 100644
--- a/include/uapi/linux/rkisp1-config.h
+++ b/include/uapi/linux/rkisp1-config.h
@@ -124,6 +124,13 @@
 #define RKISP1_CIF_ISP_STAT_AFM           (1U << 2)
 #define RKISP1_CIF_ISP_STAT_HIST          (1U << 3)
 
+enum rkisp1_cif_isp_version {
+	RKISP1_V10 = 0,
+	RKISP1_V11,
+	RKISP1_V12,
+	RKISP1_V13,
+};
+
 enum rkisp1_cif_isp_histogram_mode {
 	RKISP1_CIF_ISP_HISTOGRAM_MODE_DISABLE,
 	RKISP1_CIF_ISP_HISTOGRAM_MODE_RGB_COMBINED,
-- 
2.29.2

