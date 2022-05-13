Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 0A7535263AE
	for <lists+linux-media@lfdr.de>; Fri, 13 May 2022 16:17:07 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1349969AbiEMOQo (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 13 May 2022 10:16:44 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44918 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1343973AbiEMOQL (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 13 May 2022 10:16:11 -0400
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 80A86DF24
        for <linux-media@vger.kernel.org>; Fri, 13 May 2022 07:16:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1652451369; x=1683987369;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=mLleTCXH64OccRbRyJNVFerZztzE1jZZZE0WXQPD5kA=;
  b=AMb01QmVZgPh5dGiF670tn5kRFn/AIn+51WXYYPVOYhngcwgTIUWOjWF
   GKtiRggNv0VRUiTzBtP/bfyFNmjTgXNffMWlnllpyld8LCCL/dy/Ylssy
   QaunvgrrkQbRBK4fsE04JGR8hYBmNswsRsS4F2EcZWOUeDqRxd0zlupmT
   tlHpMvTvTriXOWBkJ5JK4bMMUJ8rKxIjiqwh8tPOzeUdaa8jmgGfJeY44
   DFisVLxmZdPP7OiHZWL597X4EOSRhZWlbT/xAC+HWuvpNhaHKoOCi+ppf
   Jy8GNMaVJz92tN6hc9Pg6db3fnI3BbGA+YjW7b7IJa/hO1ZhNHT2rtL8m
   Q==;
X-IronPort-AV: E=McAfee;i="6400,9594,10345"; a="356740968"
X-IronPort-AV: E=Sophos;i="5.91,223,1647327600"; 
   d="scan'208";a="356740968"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
  by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 May 2022 07:16:08 -0700
X-IronPort-AV: E=Sophos;i="5.91,223,1647327600"; 
   d="scan'208";a="624879391"
Received: from paasikivi.fi.intel.com ([10.237.72.42])
  by fmsmga008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 May 2022 07:16:04 -0700
Received: from punajuuri.localdomain (punajuuri.localdomain [192.168.240.130])
        by paasikivi.fi.intel.com (Postfix) with ESMTP id C67AE21B29;
        Fri, 13 May 2022 17:15:51 +0300 (EEST)
Received: from sailus by punajuuri.localdomain with local (Exim 4.94.2)
        (envelope-from <sakari.ailus@linux.intel.com>)
        id 1npW59-0001h2-5v; Fri, 13 May 2022 17:15:51 +0300
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
Subject: [PATCH v7 24/28] media: ov5640: Add BGR888 format
Date:   Fri, 13 May 2022 17:15:44 +0300
Message-Id: <20220513141548.6344-25-sakari.ailus@linux.intel.com>
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

Add support for BGR888 image format.

No existing media bus codes describe exactly the way data is transferred
on the CSI-2 bus. This is not a new issue, the CSI-2 YUV422 8-bit format
is described by MEDIA_BUS_FMT_UYVY8_1X16 which is an arbitrary
convention and not an exact match. Use the MEDIA_BUS_FMT_BGR888_1X24 to
follow the same convention, based on the order in which bits are
transmitted over the CSI-2 bus when producing images in RGB24 format.

Signed-off-by: Jacopo Mondi <jacopo@jmondi.org>
Acked-by: Hugues Fruchet <hugues.fruchet@foss.st.com>
Tested-by: Hugues Fruchet <hugues.fruchet@foss.st.com>
Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>
---
 drivers/media/i2c/ov5640.c | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/drivers/media/i2c/ov5640.c b/drivers/media/i2c/ov5640.c
index c4c2afb64811b..4219e19441ae9 100644
--- a/drivers/media/i2c/ov5640.c
+++ b/drivers/media/i2c/ov5640.c
@@ -225,6 +225,10 @@ static const struct ov5640_pixfmt {
 		.code = MEDIA_BUS_FMT_RGB565_1X16,
 		.colorspace = V4L2_COLORSPACE_SRGB,
 		.bpp = 16,
+	}, {
+		.code = MEDIA_BUS_FMT_BGR888_1X24,
+		.colorspace = V4L2_COLORSPACE_SRGB,
+		.bpp = 24,
 	}, {
 		.code = MEDIA_BUS_FMT_SBGGR8_1X8,
 		.colorspace = V4L2_COLORSPACE_SRGB,
@@ -2940,6 +2944,11 @@ static int ov5640_set_framefmt(struct ov5640_dev *sensor,
 		fmt = 0x61;
 		mux = OV5640_FMT_MUX_RGB;
 		break;
+	case MEDIA_BUS_FMT_BGR888_1X24:
+		/* BGR888: RGB */
+		fmt = 0x23;
+		mux = OV5640_FMT_MUX_RGB;
+		break;
 	case MEDIA_BUS_FMT_JPEG_1X8:
 		/* YUV422, YUYV */
 		fmt = 0x30;
-- 
2.30.2

