Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 9B33A2EF877
	for <lists+linux-media@lfdr.de>; Fri,  8 Jan 2021 21:00:11 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728724AbhAHT7T (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 8 Jan 2021 14:59:19 -0500
Received: from gloria.sntech.de ([185.11.138.130]:59696 "EHLO gloria.sntech.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727180AbhAHT7T (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Fri, 8 Jan 2021 14:59:19 -0500
Received: from ip5f5aa64a.dynamic.kabel-deutschland.de ([95.90.166.74] helo=phil.lan)
        by gloria.sntech.de with esmtpsa (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.92)
        (envelope-from <heiko@sntech.de>)
        id 1kxxVy-0004Zr-TC; Fri, 08 Jan 2021 20:33:38 +0100
From:   Heiko Stuebner <heiko@sntech.de>
To:     ezequiel@collabora.com, dafna.hirschfeld@collabora.com,
        helen.koike@collabora.com, Laurent.pinchart@ideasonboard.com
Cc:     linux-rockchip@lists.infradead.org,
        christoph.muellner@theobroma-systems.com,
        linux-media@vger.kernel.org, mchehab@kernel.org, heiko@sntech.de,
        Heiko Stuebner <heiko.stuebner@theobroma-systems.com>
Subject: [PATCH RFC 11/11] media: rockchip: rkisp1: add support for px30 isp version
Date:   Fri,  8 Jan 2021 20:33:11 +0100
Message-Id: <20210108193311.3423236-12-heiko@sntech.de>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20210108193311.3423236-1-heiko@sntech.de>
References: <20210108193311.3423236-1-heiko@sntech.de>
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
 .../media/platform/rockchip/rkisp1/rkisp1-dev.c | 17 +++++++++++++++++
 1 file changed, 17 insertions(+)

diff --git a/drivers/media/platform/rockchip/rkisp1/rkisp1-dev.c b/drivers/media/platform/rockchip/rkisp1/rkisp1-dev.c
index 0a01ffbc2cae..b617be5f2bd5 100644
--- a/drivers/media/platform/rockchip/rkisp1/rkisp1-dev.c
+++ b/drivers/media/platform/rockchip/rkisp1/rkisp1-dev.c
@@ -403,6 +403,19 @@ static irqreturn_t rkisp1_isr(int irq, void *ctx)
 	return IRQ_HANDLED;
 }
 
+static const char * const px30_isp_clks[] = {
+	"isp",
+	"aclk",
+	"hclk",
+	"pclk",
+};
+
+static const struct rkisp1_match_data px30_isp_match_data = {
+	.clks = px30_isp_clks,
+	.size = ARRAY_SIZE(px30_isp_clks),
+	.isp_ver = RKISP1_V12,
+};
+
 static const char * const rk3399_isp_clks[] = {
 	"isp",
 	"aclk",
@@ -416,6 +429,10 @@ static const struct rkisp1_match_data rk3399_isp_match_data = {
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

