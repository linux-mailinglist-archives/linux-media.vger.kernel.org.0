Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 9DD3F2EF836
	for <lists+linux-media@lfdr.de>; Fri,  8 Jan 2021 20:36:13 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728942AbhAHTe1 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 8 Jan 2021 14:34:27 -0500
Received: from gloria.sntech.de ([185.11.138.130]:59468 "EHLO gloria.sntech.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1728931AbhAHTe1 (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Fri, 8 Jan 2021 14:34:27 -0500
Received: from ip5f5aa64a.dynamic.kabel-deutschland.de ([95.90.166.74] helo=phil.lan)
        by gloria.sntech.de with esmtpsa (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.92)
        (envelope-from <heiko@sntech.de>)
        id 1kxxVx-0004Zr-7V; Fri, 08 Jan 2021 20:33:37 +0100
From:   Heiko Stuebner <heiko@sntech.de>
To:     ezequiel@collabora.com, dafna.hirschfeld@collabora.com,
        helen.koike@collabora.com, Laurent.pinchart@ideasonboard.com
Cc:     linux-rockchip@lists.infradead.org,
        christoph.muellner@theobroma-systems.com,
        linux-media@vger.kernel.org, mchehab@kernel.org, heiko@sntech.de,
        Heiko Stuebner <heiko.stuebner@theobroma-systems.com>
Subject: [PATCH RFC 07/11] media: rockchip: rkisp1: carry ip version information
Date:   Fri,  8 Jan 2021 20:33:07 +0100
Message-Id: <20210108193311.3423236-8-heiko@sntech.de>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20210108193311.3423236-1-heiko@sntech.de>
References: <20210108193311.3423236-1-heiko@sntech.de>
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

Signed-off-by: Heiko Stuebner <heiko.stuebner@theobroma-systems.com>
---
 drivers/media/platform/rockchip/rkisp1/rkisp1-common.h | 5 +++++
 drivers/media/platform/rockchip/rkisp1/rkisp1-dev.c    | 7 +++++--
 2 files changed, 10 insertions(+), 2 deletions(-)

diff --git a/drivers/media/platform/rockchip/rkisp1/rkisp1-common.h b/drivers/media/platform/rockchip/rkisp1/rkisp1-common.h
index 44f333bf5d6a..7678eabc9ffc 100644
--- a/drivers/media/platform/rockchip/rkisp1/rkisp1-common.h
+++ b/drivers/media/platform/rockchip/rkisp1/rkisp1-common.h
@@ -59,6 +59,10 @@
 					 RKISP1_CIF_ISP_EXP_END |	\
 					 RKISP1_CIF_ISP_HIST_MEASURE_RDY)
 
+enum rkisp1_isp_ver {
+	RKISP1_V10 = 0,
+};
+
 /* enum for the resizer pads */
 enum rkisp1_rsz_pad {
 	RKISP1_RSZ_PAD_SINK,
@@ -355,6 +359,7 @@ struct rkisp1_device {
 	void __iomem *base_addr;
 	int irq;
 	struct device *dev;
+	enum rkisp1_isp_ver isp_ver;
 	unsigned int clk_size;
 	struct clk_bulk_data clks[RKISP1_MAX_BUS_CLK];
 	struct v4l2_device v4l2_dev;
diff --git a/drivers/media/platform/rockchip/rkisp1/rkisp1-dev.c b/drivers/media/platform/rockchip/rkisp1/rkisp1-dev.c
index 96afc1d1a914..0a01ffbc2cae 100644
--- a/drivers/media/platform/rockchip/rkisp1/rkisp1-dev.c
+++ b/drivers/media/platform/rockchip/rkisp1/rkisp1-dev.c
@@ -104,6 +104,7 @@
 struct rkisp1_match_data {
 	const char * const *clks;
 	unsigned int size;
+	enum rkisp1_isp_ver isp_ver;
 };
 
 /* ----------------------------------------------------------------------------
@@ -408,15 +409,16 @@ static const char * const rk3399_isp_clks[] = {
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
@@ -532,6 +534,7 @@ static int rkisp1_probe(struct platform_device *pdev)
 	if (ret)
 		return ret;
 	rkisp1->clk_size = clk_data->size;
+	rkisp1->isp_ver = clk_data->isp_ver;
 
 	pm_runtime_enable(&pdev->dev);
 
-- 
2.29.2

