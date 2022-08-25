Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 0D2B65A194A
	for <lists+linux-media@lfdr.de>; Thu, 25 Aug 2022 21:03:44 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S243117AbiHYTDm (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 25 Aug 2022 15:03:42 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41676 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235785AbiHYTDl (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 25 Aug 2022 15:03:41 -0400
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7CAA7B6D2B
        for <linux-media@vger.kernel.org>; Thu, 25 Aug 2022 12:03:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1661454220; x=1692990220;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=fsV2i+eEXulZ09JQ3esf8mjw3GN158DYV5oe+QQYf0M=;
  b=FUZsQWmj0m12ewTMlBypURr/RgHZWWzIJJndQ64D39URg4titjmCTbCm
   A0621kxGt9pixA9TIZnsi2aFfnFuEU/T5FKeRV/JFf9zIyvKiuRQcn7of
   uVqktki11JFgjJxA19ToqxWvgyW+AtljonZn67dE71A+nByZ+pC5xjx9/
   6oVdqiQTscV31yZrxmsaimqJXYPlj0hLj8lA30ljYxcrcwIok2jbBJou5
   BQwjkaNIKEeAi3YhGnEeSGjXvw+S88juA8T6J6Dw7jNeO/FhUXrgeHOSQ
   GcPFE2/oGshr5vdOAidowKtFIk/o4+3miDJSiK7+4XzqnoTbMUOCCUfRs
   w==;
X-IronPort-AV: E=McAfee;i="6500,9779,10450"; a="293076443"
X-IronPort-AV: E=Sophos;i="5.93,264,1654585200"; 
   d="scan'208";a="293076443"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
  by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Aug 2022 12:03:40 -0700
X-IronPort-AV: E=Sophos;i="5.93,264,1654585200"; 
   d="scan'208";a="671127765"
Received: from punajuuri.fi.intel.com (HELO paasikivi.fi.intel.com) ([10.237.72.43])
  by fmsmga008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Aug 2022 12:03:39 -0700
Received: from punajuuri.localdomain (punajuuri.localdomain [192.168.240.130])
        by paasikivi.fi.intel.com (Postfix) with ESMTP id 0443020106;
        Thu, 25 Aug 2022 22:03:37 +0300 (EEST)
Received: from sailus by punajuuri.localdomain with local (Exim 4.94.2)
        (envelope-from <sakari.ailus@linux.intel.com>)
        id 1oRI8t-00DbG9-Dg; Thu, 25 Aug 2022 22:03:51 +0300
From:   Sakari Ailus <sakari.ailus@linux.intel.com>
To:     linux-media@vger.kernel.org
Cc:     Bingbu Cao <bingbu.cao@intel.com>,
        Tianshu Qiu <tian.shu.qiu@intel.com>,
        Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
Subject: [PATCH 1/1] ipu3-imgu: Fix NULL pointer dereference in active selection access
Date:   Thu, 25 Aug 2022 22:03:51 +0300
Message-Id: <20220825190351.3241444-1-sakari.ailus@linux.intel.com>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-4.3 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,SPF_HELO_NONE,
        SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

What the IMGU driver did was that it first acquired the pointers to active
and try V4L2 subdev state, and only then figured out which one to use.

The problem with that approach and a later patch (see Fixes: tag) is that
as sd_state argument to v4l2_subdev_get_try_crop() et al is NULL, there is
now an attempt to dereference that.

Fix this.

Also rewrap lines a little.

Fixes: 0d346d2a6f54 ("media: v4l2-subdev: add subdev-wide state struct")
Cc: stable@vger.kernel.org # for v5.14 and later
Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>
---
 drivers/staging/media/ipu3/ipu3-v4l2.c | 31 ++++++++++++--------------
 1 file changed, 14 insertions(+), 17 deletions(-)

diff --git a/drivers/staging/media/ipu3/ipu3-v4l2.c b/drivers/staging/media/ipu3/ipu3-v4l2.c
index d1c539cefba87..2234bb8d48b34 100644
--- a/drivers/staging/media/ipu3/ipu3-v4l2.c
+++ b/drivers/staging/media/ipu3/ipu3-v4l2.c
@@ -192,33 +192,30 @@ static int imgu_subdev_get_selection(struct v4l2_subdev *sd,
 				     struct v4l2_subdev_state *sd_state,
 				     struct v4l2_subdev_selection *sel)
 {
-	struct v4l2_rect *try_sel, *r;
-	struct imgu_v4l2_subdev *imgu_sd = container_of(sd,
-							struct imgu_v4l2_subdev,
-							subdev);
+	struct imgu_v4l2_subdev *imgu_sd =
+		container_of(sd, struct imgu_v4l2_subdev, subdev);
 
 	if (sel->pad != IMGU_NODE_IN)
 		return -EINVAL;
 
 	switch (sel->target) {
 	case V4L2_SEL_TGT_CROP:
-		try_sel = v4l2_subdev_get_try_crop(sd, sd_state, sel->pad);
-		r = &imgu_sd->rect.eff;
-		break;
+		if (sel->which == V4L2_SUBDEV_FORMAT_TRY)
+			sel->r = *v4l2_subdev_get_try_crop(sd, sd_state,
+							   sel->pad);
+		else
+			sel->r = imgu_sd->rect.eff;
+		return 0;
 	case V4L2_SEL_TGT_COMPOSE:
-		try_sel = v4l2_subdev_get_try_compose(sd, sd_state, sel->pad);
-		r = &imgu_sd->rect.bds;
-		break;
+		if (sel->which == V4L2_SUBDEV_FORMAT_TRY)
+			sel->r = *v4l2_subdev_get_try_compose(sd, sd_state,
+							      sel->pad);
+		else
+			sel->r = imgu_sd->rect.bds;
+		return 0;
 	default:
 		return -EINVAL;
 	}
-
-	if (sel->which == V4L2_SUBDEV_FORMAT_TRY)
-		sel->r = *try_sel;
-	else
-		sel->r = *r;
-
-	return 0;
 }
 
 static int imgu_subdev_set_selection(struct v4l2_subdev *sd,
-- 
2.30.2

