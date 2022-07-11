Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 8B67A570332
	for <lists+linux-media@lfdr.de>; Mon, 11 Jul 2022 14:45:52 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232153AbiGKMpv (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 11 Jul 2022 08:45:51 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45084 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231918AbiGKMpV (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 11 Jul 2022 08:45:21 -0400
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [IPv6:2001:4b98:dc2:55:216:3eff:fef7:d647])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9EED465D50
        for <linux-media@vger.kernel.org>; Mon, 11 Jul 2022 05:44:52 -0700 (PDT)
Received: from pendragon.lan (62-78-145-57.bb.dnainternet.fi [62.78.145.57])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 3B6BD87F;
        Mon, 11 Jul 2022 14:43:46 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1657543426;
        bh=EjHItJgv5DGeGyWq4grxYgyRRZLKQVkSpISeDYuuCzY=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=uxUhBxbnq/ypgN0CldBGP3+YhXhGyYSw3kbCTchGIq0h8uv9Cu7lZphZ4VvyRDxJp
         rwqI2RyzHtoAqBR7bvMCUkBb28q4jq2a71U7WK7TyVMjaZl9wKF3bkBLSJJUkN8vbV
         0/C1mLOCG71pWu/cu7j00JJDdHYgaYgj6Aoqua2U=
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     linux-media@vger.kernel.org
Cc:     linux-rockchip@lists.infradead.org,
        Dafna Hirschfeld <dafna@fastmail.com>,
        Heiko Stuebner <heiko@sntech.de>,
        Helen Koike <helen.koike@collabora.com>,
        Paul Elder <paul.elder@ideasonboard.com>
Subject: [PATCH v3 44/46] media: rkisp1: Add infrastructure to support ISP features
Date:   Mon, 11 Jul 2022 15:42:46 +0300
Message-Id: <20220711124248.2683-45-laurent.pinchart@ideasonboard.com>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220711124248.2683-1-laurent.pinchart@ideasonboard.com>
References: <20220711124248.2683-1-laurent.pinchart@ideasonboard.com>
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

Different ISP versions implement different sets of features. The driver
already takes the version into account in several places, but this
approach won't scale well for features that are found in different
versions. Introduce a new mechanism using a features bitmask in the
rkisp1_info structure to indicate which features the ISP support.

The first feature bit tells if the ISP has an internal CSI-2 receiver,
which is not available in all ISP versions.

Signed-off-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Reviewed-by: Dafna Hirschfeld <dafna@fastmail.com>
---
 .../platform/rockchip/rkisp1/rkisp1-common.h      | 15 +++++++++++++++
 .../media/platform/rockchip/rkisp1/rkisp1-dev.c   |  2 ++
 2 files changed, 17 insertions(+)

diff --git a/drivers/media/platform/rockchip/rkisp1/rkisp1-common.h b/drivers/media/platform/rockchip/rkisp1/rkisp1-common.h
index 6e5db7f7b647..b4c9573295c7 100644
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
  * @isr_size: number of entries in the @isrs array
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
index 1dcade2fd2a7..bc278b49fefc 100644
--- a/drivers/media/platform/rockchip/rkisp1/rkisp1-dev.c
+++ b/drivers/media/platform/rockchip/rkisp1/rkisp1-dev.c
@@ -460,6 +460,7 @@ static const struct rkisp1_info px30_isp_info = {
 	.isrs = px30_isp_isrs,
 	.isr_size = ARRAY_SIZE(px30_isp_isrs),
 	.isp_ver = RKISP1_V12,
+	.features = RKISP1_FEATURE_MIPI_CSI2,
 };
 
 static const char * const rk3399_isp_clks[] = {
@@ -478,6 +479,7 @@ static const struct rkisp1_info rk3399_isp_info = {
 	.isrs = rk3399_isp_isrs,
 	.isr_size = ARRAY_SIZE(rk3399_isp_isrs),
 	.isp_ver = RKISP1_V10,
+	.features = RKISP1_FEATURE_MIPI_CSI2,
 };
 
 static const struct of_device_id rkisp1_of_match[] = {
-- 
Regards,

Laurent Pinchart

