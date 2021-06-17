Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C8F9F3AB9AC
	for <lists+linux-media@lfdr.de>; Thu, 17 Jun 2021 18:28:45 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231702AbhFQQaw (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 17 Jun 2021 12:30:52 -0400
Received: from gloria.sntech.de ([185.11.138.130]:38240 "EHLO gloria.sntech.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S230269AbhFQQav (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Thu, 17 Jun 2021 12:30:51 -0400
Received: from ip5f5aa64a.dynamic.kabel-deutschland.de ([95.90.166.74] helo=phil.lan)
        by gloria.sntech.de with esmtpsa (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.92)
        (envelope-from <heiko@sntech.de>)
        id 1ltus1-00057p-0S; Thu, 17 Jun 2021 18:27:57 +0200
From:   Heiko Stuebner <heiko@sntech.de>
To:     mchehab@kernel.org, hverkuil-cisco@xs4all.nl
Cc:     ezequiel@collabora.com, dafna.hirschfeld@collabora.com,
        helen.koike@collabora.com, Laurent.pinchart@ideasonboard.com,
        linux-rockchip@lists.infradead.org, linux-media@vger.kernel.org,
        heiko@sntech.de, robh+dt@kernel.org, devicetree@vger.kernel.org,
        Heiko Stuebner <heiko.stuebner@theobroma-systems.com>
Subject: [PATCH v5 10/10] media: rockchip: rkisp1: add support for px30 isp version
Date:   Thu, 17 Jun 2021 18:27:45 +0200
Message-Id: <20210617162745.4080975-11-heiko@sntech.de>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20210617162745.4080975-1-heiko@sntech.de>
References: <20210617162745.4080975-1-heiko@sntech.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

From: Heiko Stuebner <heiko.stuebner@theobroma-systems.com>

The px30 uses a V12 isp block so add compatible and matchdata
for it.

Signed-off-by: Heiko Stuebner <heiko.stuebner@theobroma-systems.com>
---
 .../platform/rockchip/rkisp1/rkisp1-dev.c     | 25 +++++++++++++++++++
 1 file changed, 25 insertions(+)

diff --git a/drivers/media/platform/rockchip/rkisp1/rkisp1-dev.c b/drivers/media/platform/rockchip/rkisp1/rkisp1-dev.c
index a14a0bc39fb0..8a9bb97d334a 100644
--- a/drivers/media/platform/rockchip/rkisp1/rkisp1-dev.c
+++ b/drivers/media/platform/rockchip/rkisp1/rkisp1-dev.c
@@ -405,6 +405,27 @@ static irqreturn_t rkisp1_isr(int irq, void *ctx)
 	return IRQ_HANDLED;
 }
 
+static const char * const px30_isp_clks[] = {
+	"isp",
+	"aclk",
+	"hclk",
+	"pclk",
+};
+
+static const struct rkisp1_isr_data px30_isp_isrs[] = {
+	{ "isp", rkisp1_isp_isr },
+	{ "mi", rkisp1_capture_isr },
+	{ "mipi", rkisp1_mipi_isr },
+};
+
+static const struct rkisp1_match_data px30_isp_match_data = {
+	.clks = px30_isp_clks,
+	.size = ARRAY_SIZE(px30_isp_clks),
+	.isrs = px30_isp_isrs,
+	.isr_size = ARRAY_SIZE(px30_isp_isrs),
+	.isp_ver = RKISP1_V12,
+};
+
 static const char * const rk3399_isp_clks[] = {
 	"isp",
 	"aclk",
@@ -424,6 +445,10 @@ static const struct rkisp1_match_data rk3399_isp_match_data = {
 };
 
 static const struct of_device_id rkisp1_of_match[] = {
+	{
+		.compatible = "rockchip,px30-cif-isp",
+		.data = &px30_isp_match_data,
+	},
 	{
 		.compatible = "rockchip,rk3399-cif-isp",
 		.data = &rk3399_isp_match_data,
-- 
2.29.2

