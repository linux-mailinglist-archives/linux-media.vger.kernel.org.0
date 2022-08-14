Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id EE8E15925D6
	for <lists+linux-media@lfdr.de>; Sun, 14 Aug 2022 19:43:33 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232072AbiHNRn2 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sun, 14 Aug 2022 13:43:28 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:32810 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229520AbiHNRn1 (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Sun, 14 Aug 2022 13:43:27 -0400
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id DE6EDE0F9
        for <linux-media@vger.kernel.org>; Sun, 14 Aug 2022 10:43:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1660499006; x=1692035006;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=4gMkLSG1PH+UFmMqYYiSSn20AXcMWpLPAGRNCFBlBoc=;
  b=EmHpO5yXYg1d3oNdzlqjt5cuEi4Sr9YM1qqZU3GxDZy2RMMdW9dr50Cu
   bpwpcw2WsMo+7sjcPZJ3RFDfRaL30ens7BIkzsFqu0lqXHqzlARj2Hxay
   N9tvjVbrYKs/kf7VE8ePSeGyuVFu68dw+HljWswy8apfgt4LhVeOLaj/3
   dghNpuWEhtlxxNMqnnmrWJ8ooMwtutHj1QybCDWstLxsHVR3MzwKXtKw4
   MNto5FS/HDuNU8Xoz31rAb4WI4uQHpgJ5+vWK0W3lS/SZwE2b/qdZ9WSc
   RRtPlaJiYraZrfmpac3ZX37ZZrUM+iYgQ1GEQPx2sSp9vAnalApHqbzRS
   g==;
X-IronPort-AV: E=McAfee;i="6400,9594,10439"; a="378130907"
X-IronPort-AV: E=Sophos;i="5.93,236,1654585200"; 
   d="scan'208";a="378130907"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
  by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Aug 2022 10:43:26 -0700
X-IronPort-AV: E=Sophos;i="5.93,236,1654585200"; 
   d="scan'208";a="732719625"
Received: from punajuuri.fi.intel.com (HELO paasikivi.fi.intel.com) ([10.237.72.43])
  by orsmga004-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Aug 2022 10:43:25 -0700
Received: from punajuuri.localdomain (punajuuri.localdomain [192.168.240.130])
        by paasikivi.fi.intel.com (Postfix) with ESMTP id 5C8CD202EA;
        Sun, 14 Aug 2022 20:43:23 +0300 (EEST)
Received: from sailus by punajuuri.localdomain with local (Exim 4.94.2)
        (envelope-from <sakari.ailus@linux.intel.com>)
        id 1oNHeb-00CUfR-C8; Sun, 14 Aug 2022 20:44:01 +0300
From:   Sakari Ailus <sakari.ailus@linux.intel.com>
To:     linux-media@vger.kernel.org
Cc:     Hans Verkuil <hverkuil@xs4all.nl>
Subject: [PATCH 1/1] ar0521: Remove redundant variable ret
Date:   Sun, 14 Aug 2022 20:44:01 +0300
Message-Id: <20220814174401.2977776-1-sakari.ailus@linux.intel.com>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-4.4 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,SPF_HELO_NONE,
        SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

ret in ar0521_set_fmt is never set to values other than 0. Replace it with
plain 0.

Reported-by: kernel test robot <lkp@intel.com>
Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>
---
 drivers/media/i2c/ar0521.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/drivers/media/i2c/ar0521.c b/drivers/media/i2c/ar0521.c
index e850c92d847e4..9e90b02b15e36 100644
--- a/drivers/media/i2c/ar0521.c
+++ b/drivers/media/i2c/ar0521.c
@@ -406,7 +406,6 @@ static int ar0521_set_fmt(struct v4l2_subdev *sd,
 			  struct v4l2_subdev_format *format)
 {
 	struct ar0521_dev *sensor = to_ar0521_dev(sd);
-	int ret = 0;
 
 	ar0521_adj_fmt(&format->format);
 
@@ -423,7 +422,7 @@ static int ar0521_set_fmt(struct v4l2_subdev *sd,
 	}
 
 	mutex_unlock(&sensor->lock);
-	return ret;
+	return 0;
 }
 
 static int ar0521_s_ctrl(struct v4l2_ctrl *ctrl)
-- 
2.30.2

