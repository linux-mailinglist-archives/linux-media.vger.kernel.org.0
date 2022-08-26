Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 46ABC5A273F
	for <lists+linux-media@lfdr.de>; Fri, 26 Aug 2022 13:56:29 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1343578AbiHZL4Z (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 26 Aug 2022 07:56:25 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41422 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S245494AbiHZL4W (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 26 Aug 2022 07:56:22 -0400
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5093977EAB
        for <linux-media@vger.kernel.org>; Fri, 26 Aug 2022 04:56:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1661514980; x=1693050980;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=59vB5IColw5gmDLCc6Lsy2Zv9ya/sBms883JM3uMFnU=;
  b=NRI09BJGVEPyHAEJHbHq/gBp21D5zhndRH0eDYcTqDrB1LTxsXnXQpXW
   edSSwO6GFqYLD6A9eVKqYX4EnrmkYsCxUza2Glg/2FUy4K7vFTHVaaEoi
   T4k7nB/jizh4WQwujpj4CFuwnr2iZWz6TjhIXQJPSX63wD8/Cl0fpprsZ
   1cOZAP8AITidk1WKKileiP19hXZtjwZo45LH4Xyyr9UUqYy0dn86g7L+1
   57x47nZDcymF2o+cC5pgD24nuEITc7P8ranSFz/Rzsmus3t+4zd2NloWY
   KxMJiNNnTtVV6ymuRBZMfN3yU3Q23MlAG9utHKWaPdwTtJWyGSDXJCh+i
   A==;
X-IronPort-AV: E=McAfee;i="6500,9779,10450"; a="294493907"
X-IronPort-AV: E=Sophos;i="5.93,265,1654585200"; 
   d="scan'208";a="294493907"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
  by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Aug 2022 04:56:18 -0700
X-IronPort-AV: E=Sophos;i="5.93,265,1654585200"; 
   d="scan'208";a="671433858"
Received: from punajuuri.fi.intel.com (HELO paasikivi.fi.intel.com) ([10.237.72.43])
  by fmsmga008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Aug 2022 04:56:17 -0700
Received: from punajuuri.localdomain (punajuuri.localdomain [192.168.240.130])
        by paasikivi.fi.intel.com (Postfix) with ESMTP id 4A8A02045C;
        Fri, 26 Aug 2022 14:56:15 +0300 (EEST)
Received: from sailus by punajuuri.localdomain with local (Exim 4.94.2)
        (envelope-from <sakari.ailus@linux.intel.com>)
        id 1oRXwt-00Dbtb-7W; Fri, 26 Aug 2022 14:56:31 +0300
From:   Sakari Ailus <sakari.ailus@linux.intel.com>
To:     linux-media@vger.kernel.org
Cc:     Bingbu Cao <bingbu.cao@intel.com>,
        Tianshu Qiu <tian.shu.qiu@intel.com>,
        Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
Subject: [PATCH 1/1] v4l: subdev: Fail graciously when getting try data for NULL state
Date:   Fri, 26 Aug 2022 14:56:31 +0300
Message-Id: <20220826115631.3243890-1-sakari.ailus@linux.intel.com>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-7.0 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,
        SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

The state argument for the functions for obtaining various parts of the
state is NULL if it is called by drivers for active state. Fail graciously
in that case instead of dereferencing a NULL pointer.

Suggested-by: Bingbu Cao <bingbu.cao@intel.com>
Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>
---
 include/media/v4l2-subdev.h | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/include/media/v4l2-subdev.h b/include/media/v4l2-subdev.h
index 9689f38a0af1f..ec1896886dbd6 100644
--- a/include/media/v4l2-subdev.h
+++ b/include/media/v4l2-subdev.h
@@ -1046,6 +1046,8 @@ v4l2_subdev_get_pad_format(struct v4l2_subdev *sd,
 			   struct v4l2_subdev_state *state,
 			   unsigned int pad)
 {
+	if (WARN_ON(!state))
+		return NULL;
 	if (WARN_ON(pad >= sd->entity.num_pads))
 		pad = 0;
 	return &state->pads[pad].try_fmt;
@@ -1064,6 +1066,8 @@ v4l2_subdev_get_pad_crop(struct v4l2_subdev *sd,
 			 struct v4l2_subdev_state *state,
 			 unsigned int pad)
 {
+	if (WARN_ON(!state))
+		return NULL;
 	if (WARN_ON(pad >= sd->entity.num_pads))
 		pad = 0;
 	return &state->pads[pad].try_crop;
@@ -1082,6 +1086,8 @@ v4l2_subdev_get_pad_compose(struct v4l2_subdev *sd,
 			    struct v4l2_subdev_state *state,
 			    unsigned int pad)
 {
+	if (WARN_ON(!state))
+		return NULL;
 	if (WARN_ON(pad >= sd->entity.num_pads))
 		pad = 0;
 	return &state->pads[pad].try_compose;
-- 
2.30.2

