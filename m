Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 66DF91FD45B
	for <lists+linux-media@lfdr.de>; Wed, 17 Jun 2020 20:23:21 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726977AbgFQSWy (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 17 Jun 2020 14:22:54 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39034 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726835AbgFQSWx (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 17 Jun 2020 14:22:53 -0400
Received: from bhuna.collabora.co.uk (bhuna.collabora.co.uk [IPv6:2a00:1098:0:82:1000:25:2eeb:e3e3])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A4102C06174E;
        Wed, 17 Jun 2020 11:22:53 -0700 (PDT)
Received: from [127.0.0.1] (localhost [127.0.0.1])
        (Authenticated sender: koike)
        with ESMTPSA id 54F0A2A3FD9
From:   Helen Koike <helen.koike@collabora.com>
To:     linux-media@vger.kernel.org
Cc:     mchehab@kernel.org, dafna.hirschfeld@collabora.com,
        linux-kernel@vger.kernel.org, tfiga@google.com,
        hans.verkuil@cisco.com, kernel@collabora.com,
        Helen Koike <helen.koike@collabora.com>,
        Wojciech Zabolotny <wzab01@gmail.com>
Subject: [PATCH] media: staging: rkisp1: isp: check return value from phy_*
Date:   Wed, 17 Jun 2020 15:22:29 -0300
Message-Id: <20200617182229.164675-1-helen.koike@collabora.com>
X-Mailer: git-send-email 2.26.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

When starting streaming, do not ignore return value from phy_set_mode(),
phy_configure() and phy_power_on().
If it fails, return error to the user.

Fixes: d65dd85281fb ("media: staging: rkisp1: add Rockchip ISP1 base driver")

Reported-by: Wojciech Zabolotny <wzab01@gmail.com>
Signed-off-by: Helen Koike <helen.koike@collabora.com>

---

 drivers/staging/media/rkisp1/rkisp1-isp.c | 22 +++++++++++++++++++---
 1 file changed, 19 insertions(+), 3 deletions(-)

diff --git a/drivers/staging/media/rkisp1/rkisp1-isp.c b/drivers/staging/media/rkisp1/rkisp1-isp.c
index dc2b59a0160a8..531047fc34a01 100644
--- a/drivers/staging/media/rkisp1/rkisp1-isp.c
+++ b/drivers/staging/media/rkisp1/rkisp1-isp.c
@@ -892,6 +892,7 @@ static int rkisp1_mipi_csi2_start(struct rkisp1_isp *isp,
 	union phy_configure_opts opts;
 	struct phy_configure_opts_mipi_dphy *cfg = &opts.mipi_dphy;
 	s64 pixel_clock;
+	int ret;
 
 	if (!sensor->pixel_rate_ctrl) {
 		dev_warn(sensor->sd->dev, "No pixel rate control in subdev\n");
@@ -906,9 +907,24 @@ static int rkisp1_mipi_csi2_start(struct rkisp1_isp *isp,
 
 	phy_mipi_dphy_get_default_config(pixel_clock, isp->sink_fmt->bus_width,
 					 sensor->lanes, cfg);
-	phy_set_mode(sensor->dphy, PHY_MODE_MIPI_DPHY);
-	phy_configure(sensor->dphy, &opts);
-	phy_power_on(sensor->dphy);
+
+	ret = phy_set_mode(sensor->dphy, PHY_MODE_MIPI_DPHY);
+	if (ret) {
+		dev_err(sensor->sd->dev, "Fail setting MIPI DPHY mode\n");
+		return -EINVAL;
+	}
+
+	ret = phy_configure(sensor->dphy, &opts);
+	if (ret && ret != -EOPNOTSUPP) {
+		dev_err(sensor->sd->dev, "Fail configuring MIPI DPHY\n");
+		return -EINVAL;
+	}
+
+	ret = phy_power_on(sensor->dphy);
+	if (ret) {
+		dev_err(sensor->sd->dev, "Fail powering on MIPI DPHY\n");
+		return -EINVAL;
+	}
 
 	return 0;
 }
-- 
2.26.0

