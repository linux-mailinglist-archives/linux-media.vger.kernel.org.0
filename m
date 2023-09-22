Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id BCFDA7AB376
	for <lists+linux-media@lfdr.de>; Fri, 22 Sep 2023 16:22:54 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234257AbjIVOW6 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 22 Sep 2023 10:22:58 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57468 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233368AbjIVOW4 (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 22 Sep 2023 10:22:56 -0400
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.136])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 81879100
        for <linux-media@vger.kernel.org>; Fri, 22 Sep 2023 07:22:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1695392570; x=1726928570;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=mtd2OlaD2uF9uQfv/VWnnRlsGNgouPl7W3/VQMYJfmg=;
  b=Kl8C/EqIhy0c7lIUHJGKdnG8AIDDSc5r1C4Bk0wmgDtMuDLUT7ORQepj
   /4TnRTcc71QKAdXx95GSQNLhP5DDwxf/UzLYRL3cO3+/8EnYyMJYkgfIZ
   QriVFA/9yP4nx4eFkZXBDobEeRzV2bnScB811BNqfxHXYmRisZM9IiFek
   wGI+7jYpQAWSumUQKNkCVCGf9a2Ek/D8BQN48ny9dc+vTdW6pwJoCXDN7
   j6/D6+s2pKJOXhrMwsU9tXAXNkrwUyLhnQn2ke5krNRhmDKouN4T+dNLJ
   5dcES9+nRBEbqcoNW7vdYPFL+Q9qCnQ7Uk0w/fITb1+w43c90/YT52aRW
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10841"; a="360218849"
X-IronPort-AV: E=Sophos;i="6.03,167,1694761200"; 
   d="scan'208";a="360218849"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
  by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Sep 2023 07:22:50 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10841"; a="741112350"
X-IronPort-AV: E=Sophos;i="6.03,167,1694761200"; 
   d="scan'208";a="741112350"
Received: from turnipsi.fi.intel.com (HELO kekkonen.fi.intel.com) ([10.237.72.44])
  by orsmga007-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Sep 2023 07:22:47 -0700
Received: from svinhufvud.ger.corp.intel.com (localhost [IPv6:::1])
        by kekkonen.fi.intel.com (Postfix) with ESMTP id E0B171209A1;
        Fri, 22 Sep 2023 17:22:43 +0300 (EEST)
From:   Sakari Ailus <sakari.ailus@linux.intel.com>
To:     linux-media@vger.kernel.org
Cc:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        tomi.valkeinen@ideasonboard.com, bingbu.cao@intel.com,
        hongju.wang@intel.com, hverkuil@xs4all.nl,
        Andrey Konovalov <andrey.konovalov@linaro.org>,
        Jacopo Mondi <jacopo.mondi@ideasonboard.com>,
        Dmitry Perchanov <dmitry.perchanov@intel.com>,
        "Ng, Khai Wen" <khai.wen.ng@intel.com>
Subject: [PATCH v4 03/23] media: uapi: Document which mbus format fields are valid for metadata
Date:   Fri, 22 Sep 2023 17:22:19 +0300
Message-Id: <20230922142239.259425-4-sakari.ailus@linux.intel.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230922142239.259425-1-sakari.ailus@linux.intel.com>
References: <20230922142239.259425-1-sakari.ailus@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.0 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,RCVD_IN_DNSWL_BLOCKED,
        SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED autolearn=ham autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Now that metadata mbus formats have been added, it is necessary to define
which fields in struct v4l2_mbus_format are applicable to them (not many).

Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>
---
 include/uapi/linux/v4l2-mediabus.h | 18 ++++++++++++------
 1 file changed, 12 insertions(+), 6 deletions(-)

diff --git a/include/uapi/linux/v4l2-mediabus.h b/include/uapi/linux/v4l2-mediabus.h
index 6b07b73473b5..3cadb3b58b85 100644
--- a/include/uapi/linux/v4l2-mediabus.h
+++ b/include/uapi/linux/v4l2-mediabus.h
@@ -19,12 +19,18 @@
  * @width:	image width
  * @height:	image height
  * @code:	data format code (from enum v4l2_mbus_pixelcode)
- * @field:	used interlacing type (from enum v4l2_field)
- * @colorspace:	colorspace of the data (from enum v4l2_colorspace)
- * @ycbcr_enc:	YCbCr encoding of the data (from enum v4l2_ycbcr_encoding)
- * @hsv_enc:	HSV encoding of the data (from enum v4l2_hsv_encoding)
- * @quantization: quantization of the data (from enum v4l2_quantization)
- * @xfer_func:  transfer function of the data (from enum v4l2_xfer_func)
+ * @field:	used interlacing type (from enum v4l2_field), not applicable
+ *		to metadata mbus codes
+ * @colorspace:	colorspace of the data (from enum v4l2_colorspace), zero on
+ *		metadata mbus codes
+ * @ycbcr_enc:	YCbCr encoding of the data (from enum v4l2_ycbcr_encoding), zero
+ *		on metadata mbus codes
+ * @hsv_enc:	HSV encoding of the data (from enum v4l2_hsv_encoding), zero on
+ *		metadata mbus codes
+ * @quantization: quantization of the data (from enum v4l2_quantization), zero
+ *		on metadata mbus codes
+ * @xfer_func:  transfer function of the data (from enum v4l2_xfer_func), zero
+ *		on metadata mbus codes
  * @flags:	flags (V4L2_MBUS_FRAMEFMT_*)
  * @reserved:  reserved bytes that can be later used
  */
-- 
2.39.2

