Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id C0D375263AA
	for <lists+linux-media@lfdr.de>; Fri, 13 May 2022 16:17:05 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1351546AbiEMOQk (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 13 May 2022 10:16:40 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44862 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S244046AbiEMOQO (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 13 May 2022 10:16:14 -0400
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CE7D35AEC1
        for <linux-media@vger.kernel.org>; Fri, 13 May 2022 07:16:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1652451369; x=1683987369;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=a1RqfDzCk31jTTocMVEtA+hosRoNogSksdk2ZvgGwrg=;
  b=kNANk3B2/7LZpj/2rMFd0MUK5aQ9zjD/1Ji9zFcyVH9NsmUwP8hz8hCG
   xVIuHa1qvrc04UrCxGhXlahFlW+GU4gcvOZ2coL9ECRdjjXb5ExgEybwc
   /ePj40F7l1lcTT2nnGGktfeq2PfVgxhIdH8jeAAY9pDozhvIGrOd7ZE07
   kZOfr2a3j3kaL8AHhfQtTIh3yq4JPGOofvqMvUi2Fswi7Ame3HPOezzsq
   UBlUK+ZgMk1acX0HtxIxPAI3v+k6ssG92JzkPfEBQJfQ+jfgZmajY1iaX
   fR/d/SioVJZAFwNvwdGTz8pEyqWR4pmbdY3ximax41U2kDg+YRzX6pUR7
   g==;
X-IronPort-AV: E=McAfee;i="6400,9594,10345"; a="267907055"
X-IronPort-AV: E=Sophos;i="5.91,223,1647327600"; 
   d="scan'208";a="267907055"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
  by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 May 2022 07:16:09 -0700
X-IronPort-AV: E=Sophos;i="5.91,223,1647327600"; 
   d="scan'208";a="572984937"
Received: from paasikivi.fi.intel.com ([10.237.72.42])
  by fmsmga007-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 May 2022 07:16:04 -0700
Received: from punajuuri.localdomain (punajuuri.localdomain [192.168.240.130])
        by paasikivi.fi.intel.com (Postfix) with ESMTP id E568A21B96;
        Fri, 13 May 2022 17:15:51 +0300 (EEST)
Received: from sailus by punajuuri.localdomain with local (Exim 4.94.2)
        (envelope-from <sakari.ailus@linux.intel.com>)
        id 1npW59-0001hB-9s; Fri, 13 May 2022 17:15:51 +0300
From:   Sakari Ailus <sakari.ailus@linux.intel.com>
To:     linux-media@vger.kernel.org
Cc:     Jacopo Mondi <jacopo@jmondi.org>,
        Steve Longerbeam <slongerbeam@gmail.com>,
        laurent.pinchart@ideasonboard.com, hverkuil-cisco@xs4all.nl,
        mirela.rabulea@nxp.com, xavier.roumegue@oss.nxp.com,
        tomi.valkeinen@ideasonboard.com, hugues.fruchet@st.com,
        prabhakar.mahadev-lad.rj@bp.renesas.com, aford173@gmail.com,
        festevam@gmail.com, Eugen.Hristev@microchip.com,
        jbrunet@baylibre.com, paul.elder@ideasonboard.com,
        eddy.khan@vergesense.com,
        Mauro Carvalho Chehab <mchehab@kernel.org>
Subject: [PATCH v7 26/28] media: ov5640: Adjust format to bpp in s_fmt
Date:   Fri, 13 May 2022 17:15:46 +0300
Message-Id: <20220513141548.6344-27-sakari.ailus@linux.intel.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20220513141548.6344-1-sakari.ailus@linux.intel.com>
References: <20220513141548.6344-1-sakari.ailus@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-7.6 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,
        SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

From: Jacopo Mondi <jacopo@jmondi.org>

The ov5640 driver supports different sizes for different mbus_codes.
In particular:

- 8bpp modes: high resolution sizes (>= 1280x720)
- 16bpp modes: all sizes
- 24bpp modes: low resolutions sizes (< 1280x720)

Adjust the image sizes according to the above constraints.

Signed-off-by: Jacopo Mondi <jacopo@jmondi.org>
Acked-by: Hugues Fruchet <hugues.fruchet@foss.st.com>
Tested-by: Hugues Fruchet <hugues.fruchet@foss.st.com>
Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>
---
 drivers/media/i2c/ov5640.c | 12 ++++++++++++
 1 file changed, 12 insertions(+)

diff --git a/drivers/media/i2c/ov5640.c b/drivers/media/i2c/ov5640.c
index 240976a6cb972..3186727457bde 100644
--- a/drivers/media/i2c/ov5640.c
+++ b/drivers/media/i2c/ov5640.c
@@ -2698,6 +2698,7 @@ static int ov5640_try_fmt_internal(struct v4l2_subdev *sd,
 				   enum ov5640_frame_rate fr,
 				   const struct ov5640_mode_info **new_mode)
 {
+	unsigned int bpp = ov5640_code_to_bpp(fmt->code);
 	struct ov5640_dev *sensor = to_ov5640_dev(sd);
 	const struct ov5640_mode_info *mode;
 	int i;
@@ -2705,6 +2706,17 @@ static int ov5640_try_fmt_internal(struct v4l2_subdev *sd,
 	mode = ov5640_find_mode(sensor, fmt->width, fmt->height, true);
 	if (!mode)
 		return -EINVAL;
+
+	/*
+	 * Adjust mode according to bpp:
+	 * - 8bpp modes work for resolution >= 1280x720
+	 * - 24bpp modes work resolution < 1280x720
+	 */
+	if (bpp == 8 && mode->width < 1280)
+		mode = &ov5640_mode_data[OV5640_MODE_720P_1280_720];
+	else if (bpp == 24 && mode->width > 1024)
+		mode = &ov5640_mode_data[OV5640_MODE_XGA_1024_768];
+
 	fmt->width = mode->width;
 	fmt->height = mode->height;
 
-- 
2.30.2

