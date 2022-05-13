Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id BFF1D5263A1
	for <lists+linux-media@lfdr.de>; Fri, 13 May 2022 16:17:02 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1348958AbiEMOQe (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 13 May 2022 10:16:34 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45060 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1346735AbiEMOQP (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 13 May 2022 10:16:15 -0400
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7160060D86
        for <linux-media@vger.kernel.org>; Fri, 13 May 2022 07:16:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1652451370; x=1683987370;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=qGB4VisawTwrC25fVLyYRGKwJ40kg1jm13optah+IX4=;
  b=PhmPdeiDY3F0yUwtMa0Gvsin32oujW0LgjDw15A4CPljHlfVpwIlH6J7
   fomy3wmcF+LyBhQ/gADp8254/gufhcGc5y9PJtljT/v2RvNQZSNjOeLKq
   mYnZ5BO3iVaHNTAAbDcVtal8oJ9+VuiOpmdZ8jUHSc4z/ITivLtIrJzrQ
   092kkjV+6VGLNAu1gaeieRVkeAjClZXp5bMd8B5d3V3hpdt29vjx19Aiv
   jIgs1x/toyGABRVA05SzI4d6isESLjmlr6OeR5E49fDF1nMvV7ZumgpP1
   50ZfpYNDWjAlZHHrByaTmsULK+fvvFkHfotm3J/kwq76mpng8U1N2nwku
   Q==;
X-IronPort-AV: E=McAfee;i="6400,9594,10345"; a="269147677"
X-IronPort-AV: E=Sophos;i="5.91,223,1647327600"; 
   d="scan'208";a="269147677"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
  by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 May 2022 07:16:10 -0700
X-IronPort-AV: E=Sophos;i="5.91,223,1647327600"; 
   d="scan'208";a="595240560"
Received: from paasikivi.fi.intel.com ([10.237.72.42])
  by orsmga008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 May 2022 07:16:04 -0700
Received: from punajuuri.localdomain (punajuuri.localdomain [192.168.240.130])
        by paasikivi.fi.intel.com (Postfix) with ESMTP id D9E3721B56;
        Fri, 13 May 2022 17:15:51 +0300 (EEST)
Received: from sailus by punajuuri.localdomain with local (Exim 4.94.2)
        (envelope-from <sakari.ailus@linux.intel.com>)
        id 1npW59-0001h7-8F; Fri, 13 May 2022 17:15:51 +0300
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
Subject: [PATCH v7 25/28] media: ov5640: Restrict sizes to mbus code
Date:   Fri, 13 May 2022 17:15:45 +0300
Message-Id: <20220513141548.6344-26-sakari.ailus@linux.intel.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20220513141548.6344-1-sakari.ailus@linux.intel.com>
References: <20220513141548.6344-1-sakari.ailus@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-4.9 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,SPF_HELO_NONE,
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

Restrict the frame sizes enumerations to the above constraints.

While at it, make sure the fse->mbus_code parameter is valid, and return
-EINVAL if it's not.

Signed-off-by: Jacopo Mondi <jacopo@jmondi.org>
Acked-by: Hugues Fruchet <hugues.fruchet@foss.st.com>
Tested-by: Hugues Fruchet <hugues.fruchet@foss.st.com>
Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>
---
 drivers/media/i2c/ov5640.c | 20 +++++++++++++++++---
 1 file changed, 17 insertions(+), 3 deletions(-)

diff --git a/drivers/media/i2c/ov5640.c b/drivers/media/i2c/ov5640.c
index 4219e19441ae9..240976a6cb972 100644
--- a/drivers/media/i2c/ov5640.c
+++ b/drivers/media/i2c/ov5640.c
@@ -3474,14 +3474,28 @@ static int ov5640_enum_frame_size(struct v4l2_subdev *sd,
 				  struct v4l2_subdev_state *sd_state,
 				  struct v4l2_subdev_frame_size_enum *fse)
 {
+	u32 bpp = ov5640_code_to_bpp(fse->code);
+	unsigned int index = fse->index;
+
 	if (fse->pad != 0)
 		return -EINVAL;
-	if (fse->index >= OV5640_NUM_MODES)
+	if (!bpp)
+		return -EINVAL;
+
+	/* Only low-resolution modes are supported for 24bpp formats. */
+	if (bpp == 24 && index >= OV5640_MODE_720P_1280_720)
+		return -EINVAL;
+
+	/* FIXME: Low resolution modes don't work in 8bpp formats. */
+	if (bpp == 8)
+		index += OV5640_MODE_720P_1280_720;
+
+	if (index >= OV5640_NUM_MODES)
 		return -EINVAL;
 
-	fse->min_width = ov5640_mode_data[fse->index].width;
+	fse->min_width = ov5640_mode_data[index].width;
 	fse->max_width = fse->min_width;
-	fse->min_height = ov5640_mode_data[fse->index].height;
+	fse->min_height = ov5640_mode_data[index].height;
 	fse->max_height = fse->min_height;
 
 	return 0;
-- 
2.30.2

