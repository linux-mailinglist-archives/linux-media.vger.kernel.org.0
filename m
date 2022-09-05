Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id D7E585AD319
	for <lists+linux-media@lfdr.de>; Mon,  5 Sep 2022 14:51:49 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238329AbiIEMmh (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 5 Sep 2022 08:42:37 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36152 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235897AbiIEMmV (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Mon, 5 Sep 2022 08:42:21 -0400
Received: from mga06.intel.com (mga06b.intel.com [134.134.136.31])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B7B6E2528F
        for <linux-media@vger.kernel.org>; Mon,  5 Sep 2022 05:36:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1662381407; x=1693917407;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=E0BO+Wb8xwYg52qK0qU8HZ5wPJ4QPKQYdAg3ITtSLec=;
  b=BOYSn57npJdxDVPwcX+vWB4Ty0AJFgnpMZ3YXyJFRF96ZMkWfZz+ljjw
   NzlT0Q9ZXXVTD2cnI2/BJsq+dcgZr9o42rYL18YRsNweBBnL/JZ1IzHBV
   LhUYm4yz9acnMBmDaJ4PCSYnDr6vhGUbflF5NJO2fGOzeFEBg3AmhDwNE
   J7SW3fB1vNWPyN4cusKdcFxU3KAIVXq0FUW+06/TMsnf5qMx0nFhKxPtf
   5Rjwm8jy8xqYPBH9WqFLN3y3DywRGq6E0xyN0/BGjmmGz880KMySl77GP
   UmymbjyLEEx2QpNpYSOnePPnKQI04fTkhT9BO0QjqARO1jpuZv/ZmRhua
   w==;
X-IronPort-AV: E=McAfee;i="6500,9779,10460"; a="358096567"
X-IronPort-AV: E=Sophos;i="5.93,291,1654585200"; 
   d="scan'208";a="358096567"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
  by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Sep 2022 05:36:37 -0700
X-IronPort-AV: E=Sophos;i="5.93,291,1654585200"; 
   d="scan'208";a="564754232"
Received: from punajuuri.fi.intel.com (HELO paasikivi.fi.intel.com) ([10.237.72.43])
  by orsmga003-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Sep 2022 05:36:36 -0700
Received: from punajuuri.localdomain (punajuuri.localdomain [192.168.240.130])
        by paasikivi.fi.intel.com (Postfix) with ESMTP id AF149202BE;
        Mon,  5 Sep 2022 15:36:34 +0300 (EEST)
Received: from sailus by punajuuri.localdomain with local (Exim 4.94.2)
        (envelope-from <sakari.ailus@linux.intel.com>)
        id 1oVBLk-00Dfyo-Kl; Mon, 05 Sep 2022 15:37:12 +0300
From:   Sakari Ailus <sakari.ailus@linux.intel.com>
To:     linux-media@vger.kernel.org
Cc:     laurent.pinchart@ideasonboard.com
Subject: [PATCH 1/1] media: Remove incorrect comment from struct v4l2_fwnode_endpoint
Date:   Mon,  5 Sep 2022 15:37:12 +0300
Message-Id: <20220905123712.3259589-1-sakari.ailus@linux.intel.com>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-4.3 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,SPF_HELO_NONE,
        SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

struct v4l2_fwnode_endpoint was zeroed previously apart from the endpoint
information itself when the endpoint properties were parsed. Now this
hasn't been the case for a few years so remove the comment.

Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>
---
 include/media/v4l2-fwnode.h | 4 ----
 1 file changed, 4 deletions(-)

diff --git a/include/media/v4l2-fwnode.h b/include/media/v4l2-fwnode.h
index 15e4ab6722232..394d798f3dfa4 100644
--- a/include/media/v4l2-fwnode.h
+++ b/include/media/v4l2-fwnode.h
@@ -45,10 +45,6 @@ struct v4l2_async_subdev;
  */
 struct v4l2_fwnode_endpoint {
 	struct fwnode_endpoint base;
-	/*
-	 * Fields below this line will be zeroed by
-	 * v4l2_fwnode_endpoint_parse()
-	 */
 	enum v4l2_mbus_type bus_type;
 	struct {
 		struct v4l2_mbus_config_parallel parallel;
-- 
2.30.2

