Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 9ECC15263B2
	for <lists+linux-media@lfdr.de>; Fri, 13 May 2022 16:17:08 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S243789AbiEMOQF (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 13 May 2022 10:16:05 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44670 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1344680AbiEMOQD (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 13 May 2022 10:16:03 -0400
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 20F8F10FC0
        for <linux-media@vger.kernel.org>; Fri, 13 May 2022 07:16:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1652451362; x=1683987362;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=hZWPSlYAUzPXpAO1pvIddDQkLFTDjNfEfU18G+Z03ZQ=;
  b=GtMsGs5qSKEddSrOSECBGEQTIoP8XaFta0t87/CiiBuMSUrqfrXt5dGJ
   Benrbpl1V2EkGDb8J/ddNOV+bMZmyldk6OzDU5CMJATr7TNeK+bSI3UlV
   18AFDviml1z2G+d4XtzEBNrU6nuCsP3xO/pDtVrcOezrY3iM0q1SRJBi9
   ShufNdEanWfBvGdiEpnvHlhBb98UqFUHIMYrdK1Tazq+Py+sVdjRLxmpS
   kqLXnGilxyvvKS/+oEUY3yF/G7J2QkJ0gz7xxXIJl7ukGpQoZVaD7tRPG
   53CdpseDLaUU9q3ksgviff074HlutWjhhbTE2CdRVB15NDE6+nLulhXgi
   A==;
X-IronPort-AV: E=McAfee;i="6400,9594,10345"; a="269984497"
X-IronPort-AV: E=Sophos;i="5.91,223,1647327600"; 
   d="scan'208";a="269984497"
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
  by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 May 2022 07:16:01 -0700
X-IronPort-AV: E=Sophos;i="5.91,223,1647327600"; 
   d="scan'208";a="637301545"
Received: from paasikivi.fi.intel.com ([10.237.72.42])
  by fmsmga004-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 May 2022 07:15:57 -0700
Received: from punajuuri.localdomain (punajuuri.localdomain [192.168.240.130])
        by paasikivi.fi.intel.com (Postfix) with ESMTP id C200F21116;
        Fri, 13 May 2022 17:15:49 +0300 (EEST)
Received: from sailus by punajuuri.localdomain with local (Exim 4.94.2)
        (envelope-from <sakari.ailus@linux.intel.com>)
        id 1npW57-0001fn-2t; Fri, 13 May 2022 17:15:49 +0300
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
Subject: [PATCH v7 05/28] media: ov5640: Add LINK_FREQ control
Date:   Fri, 13 May 2022 17:15:25 +0300
Message-Id: <20220513141548.6344-6-sakari.ailus@linux.intel.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20220513141548.6344-1-sakari.ailus@linux.intel.com>
References: <20220513141548.6344-1-sakari.ailus@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-4.9 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,
        RCVD_IN_MSPIKE_H3,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_NONE,
        T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

From: Jacopo Mondi <jacopo@jmondi.org>

Add the V4L2_CID_LINK_FREQ control to the ov5640 driver.
Make the control read-only for the moment.

Signed-off-by: Jacopo Mondi <jacopo@jmondi.org>
Acked-by: Hugues Fruchet <hugues.fruchet@foss.st.com>
Tested-by: Hugues Fruchet <hugues.fruchet@foss.st.com>
Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>
---
 drivers/media/i2c/ov5640.c | 26 ++++++++++++++++++++++++++
 1 file changed, 26 insertions(+)

diff --git a/drivers/media/i2c/ov5640.c b/drivers/media/i2c/ov5640.c
index 297ed135c4768..aa1d2e7fb8190 100644
--- a/drivers/media/i2c/ov5640.c
+++ b/drivers/media/i2c/ov5640.c
@@ -141,6 +141,24 @@ static const u32 ov5640_pixel_rates[] = {
 	[OV5640_PIXEL_RATE_48M] = 48000000,
 };
 
+/*
+ * MIPI CSI-2 link frequencies.
+ *
+ * Derived from the above defined pixel rate for bpp = (8, 16, 24) and
+ * data_lanes = (1, 2)
+ *
+ * link_freq = (pixel_rate * bpp) / (2 * data_lanes)
+ */
+static const s64 ov5640_csi2_link_freqs[] = {
+	992000000, 888000000, 768000000, 744000000, 672000000, 672000000,
+	592000000, 592000000, 576000000, 576000000, 496000000, 496000000,
+	384000000, 384000000, 384000000, 336000000, 296000000, 288000000,
+	248000000, 192000000, 192000000, 192000000, 96000000,
+};
+
+/* Link freq for default mode: UYVY 16 bpp, 2 data lanes. */
+#define OV5640_DEFAULT_LINK_FREQ	13
+
 enum ov5640_format_mux {
 	OV5640_FMT_MUX_YUV422 = 0,
 	OV5640_FMT_MUX_RGB,
@@ -258,6 +276,7 @@ struct ov5640_mode_info {
 struct ov5640_ctrls {
 	struct v4l2_ctrl_handler handler;
 	struct v4l2_ctrl *pixel_rate;
+	struct v4l2_ctrl *link_freq;
 	struct {
 		struct v4l2_ctrl *auto_exp;
 		struct v4l2_ctrl *exposure;
@@ -2855,6 +2874,12 @@ static int ov5640_init_controls(struct ov5640_dev *sensor)
 			      ov5640_pixel_rates[0], 1,
 			      ov5640_pixel_rates[mode->pixel_rate]);
 
+	ctrls->link_freq = v4l2_ctrl_new_int_menu(hdl, ops,
+					V4L2_CID_LINK_FREQ,
+					ARRAY_SIZE(ov5640_csi2_link_freqs) - 1,
+					OV5640_DEFAULT_LINK_FREQ,
+					ov5640_csi2_link_freqs);
+
 	/* Auto/manual white balance */
 	ctrls->auto_wb = v4l2_ctrl_new_std(hdl, ops,
 					   V4L2_CID_AUTO_WHITE_BALANCE,
@@ -2903,6 +2928,7 @@ static int ov5640_init_controls(struct ov5640_dev *sensor)
 	}
 
 	ctrls->pixel_rate->flags |= V4L2_CTRL_FLAG_READ_ONLY;
+	ctrls->link_freq->flags |= V4L2_CTRL_FLAG_READ_ONLY;
 	ctrls->gain->flags |= V4L2_CTRL_FLAG_VOLATILE;
 	ctrls->exposure->flags |= V4L2_CTRL_FLAG_VOLATILE;
 
-- 
2.30.2

