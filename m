Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id E564454BA53
	for <lists+linux-media@lfdr.de>; Tue, 14 Jun 2022 21:15:02 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1357815AbiFNTOx (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 14 Jun 2022 15:14:53 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55940 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1357853AbiFNTOw (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 14 Jun 2022 15:14:52 -0400
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [IPv6:2001:4b98:dc2:55:216:3eff:fef7:d647])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E1624167E1
        for <linux-media@vger.kernel.org>; Tue, 14 Jun 2022 12:14:51 -0700 (PDT)
Received: from pyrite.rasen.tech (softbank036240126034.bbtec.net [36.240.126.34])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 8E019D96;
        Tue, 14 Jun 2022 21:14:47 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1655234090;
        bh=Bhft2ql1CSfmPHJxfGOvZIq7jzGcGv9JEwoGwE8igyI=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=uVkpy072o89BR0n10QWcZ6dBCRoenK46mXj1Oq0Ygzbh3P/R25wl+OFtY4CdwWR61
         M3/eExIQs+fhmTFMzBQq1DgcLY5g/+AxU+zf06A98G5fIF1t/5+RLlLqijQWL63qE9
         BHCyaLzlRxLWODdX4YL5wE4MoURGZ7le6ekI2TuQ=
From:   Paul Elder <paul.elder@ideasonboard.com>
To:     linux-media@vger.kernel.org
Cc:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        dafna@fastmail.com, heiko@sntech.de,
        jeanmichel.hautbois@ideasonboard.com, jacopo@jmondi.org,
        djrscally@gmail.com, helen.koike@collabora.com,
        linux-rockchip@lists.infradead.org
Subject: [PATCH 45/55] media: rkisp1: Add infrastructure to support ISP features
Date:   Wed, 15 Jun 2022 04:11:17 +0900
Message-Id: <20220614191127.3420492-46-paul.elder@ideasonboard.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20220614191127.3420492-1-paul.elder@ideasonboard.com>
References: <20220614191127.3420492-1-paul.elder@ideasonboard.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_PASS,SPF_PASS,
        T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>

Different ISP versions implement different sets of features. The driver
already takes the version into account in several places, but this
approach won't scale well for features that are found in different
versions. Introduce a new mechanism using a features bitmask in the
rkisp1_info structure to indicate which features the ISP support.

The first feature bit tells if the ISP has an internal CSI-2 receiver,
which is not available in all ISP versions.

Signed-off-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
---
 .../platform/rockchip/rkisp1/rkisp1-common.h      | 15 +++++++++++++++
 .../media/platform/rockchip/rkisp1/rkisp1-dev.c   |  2 ++
 2 files changed, 17 insertions(+)

diff --git a/drivers/media/platform/rockchip/rkisp1/rkisp1-common.h b/drivers/media/platform/rockchip/rkisp1/rkisp1-common.h
index f926ca8248f8..eccdd3f9bc89 100644
--- a/drivers/media/platform/rockchip/rkisp1/rkisp1-common.h
+++ b/drivers/media/platform/rockchip/rkisp1/rkisp1-common.h
@@ -98,6 +98,19 @@ enum rkisp1_isp_pad {
 	RKISP1_ISP_PAD_MAX
 };
 
+/*
+ * enum rkisp1_feature - ISP features
+ *
+ * @RKISP1_FEATURE_MIPI_CSI2: The ISP has an internal MIPI CSI-2 receiver
+ *
+ * The ISP features are stored in a bitmask in &rkisp1_info.features and allow
+ * the driver to implement support for features present in some ISP versions
+ * only.
+ */
+enum rkisp1_feature {
+	RKISP1_FEATURE_MIPI_CSI2 = BIT(0),
+};
+
 /*
  * struct rkisp1_info - Model-specific ISP Information
  *
@@ -106,6 +119,7 @@ enum rkisp1_isp_pad {
  * @isrs: array of ISP interrupt descriptors
  * @isr_size: number of entires in the @isrs array
  * @isp_ver: ISP version
+ * @features: bitmatk of rkisp1_feature features implemented by the ISP
  *
  * This structure contains information about the ISP specific to a particular
  * ISP model, version, or integration in a particular SoC.
@@ -116,6 +130,7 @@ struct rkisp1_info {
 	const struct rkisp1_isr_data *isrs;
 	unsigned int isr_size;
 	enum rkisp1_cif_isp_version isp_ver;
+	unsigned int features;
 };
 
 /*
diff --git a/drivers/media/platform/rockchip/rkisp1/rkisp1-dev.c b/drivers/media/platform/rockchip/rkisp1/rkisp1-dev.c
index e85cf0d79af9..8ccd4042f3f3 100644
--- a/drivers/media/platform/rockchip/rkisp1/rkisp1-dev.c
+++ b/drivers/media/platform/rockchip/rkisp1/rkisp1-dev.c
@@ -450,6 +450,7 @@ static const struct rkisp1_info px30_isp_info = {
 	.isrs = px30_isp_isrs,
 	.isr_size = ARRAY_SIZE(px30_isp_isrs),
 	.isp_ver = RKISP1_V12,
+	.features = RKISP1_FEATURE_MIPI_CSI2,
 };
 
 static const char * const rk3399_isp_clks[] = {
@@ -468,6 +469,7 @@ static const struct rkisp1_info rk3399_isp_info = {
 	.isrs = rk3399_isp_isrs,
 	.isr_size = ARRAY_SIZE(rk3399_isp_isrs),
 	.isp_ver = RKISP1_V10,
+	.features = RKISP1_FEATURE_MIPI_CSI2,
 };
 
 static const struct of_device_id rkisp1_of_match[] = {
-- 
2.30.2

