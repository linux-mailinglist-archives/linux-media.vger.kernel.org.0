Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 090D87B0A6B
	for <lists+linux-media@lfdr.de>; Wed, 27 Sep 2023 18:35:38 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229963AbjI0Qfg (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 27 Sep 2023 12:35:36 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58624 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229880AbjI0Qff (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 27 Sep 2023 12:35:35 -0400
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.100])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 86750DE
        for <linux-media@vger.kernel.org>; Wed, 27 Sep 2023 09:35:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1695832534; x=1727368534;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=kVOii1f/5s2PJ8KVti6PipXSxyHHcLq5+5oOMw3hR+A=;
  b=iYDw9oTZVqnruZeoyNhsPImXr2rWYNJTISsARolJMp74ouQjMJXlhj//
   FsnkYcxIo+e//fIbuk0EHG/lGML3/7koKXfY7az0TN+QcNvMvpHXmo5us
   QgEKwsBJ/8u//uEZfcyuJSAnqHqf+ftBLP97w1XzhpPO35LybmMy81fte
   2BPM5+G5pWxeJQ6HCtofoOI5BZ5I1rLSSGhKcbkVhuGjEtux2iaRleo4h
   M4eqI2sbYrOCvaDrQuhew1i+9s9uvHrLGNYAZZsw3gJlsf4MNLwaMh348
   VhVeHc9VtdCQajJ7lZlu7tHDr7BFgkGgZujKASCt3RVGpwNaD8u0AfvHp
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10846"; a="448363090"
X-IronPort-AV: E=Sophos;i="6.03,181,1694761200"; 
   d="scan'208";a="448363090"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
  by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Sep 2023 09:33:35 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10846"; a="872955231"
X-IronPort-AV: E=Sophos;i="6.03,181,1694761200"; 
   d="scan'208";a="872955231"
Received: from turnipsi.fi.intel.com (HELO kekkonen.fi.intel.com) ([10.237.72.44])
  by orsmga004-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Sep 2023 09:33:09 -0700
Received: from svinhufvud.ger.corp.intel.com (localhost [IPv6:::1])
        by kekkonen.fi.intel.com (Postfix) with ESMTP id 8E05011F967;
        Wed, 27 Sep 2023 19:33:03 +0300 (EEST)
From:   Sakari Ailus <sakari.ailus@linux.intel.com>
To:     linux-media@vger.kernel.org
Cc:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        tomi.valkeinen@ideasonboard.com, bingbu.cao@intel.com,
        hongju.wang@intel.com, hverkuil@xs4all.nl,
        Andrey Konovalov <andrey.konovalov@linaro.org>,
        Jacopo Mondi <jacopo.mondi@ideasonboard.com>,
        Dmitry Perchanov <dmitry.perchanov@intel.com>,
        "Ng, Khai Wen" <khai.wen.ng@intel.com>
Subject: [PATCH v5 15/26] media: v4l: subdev: Copy argument back to user also for S_ROUTING
Date:   Wed, 27 Sep 2023 19:32:01 +0300
Message-Id: <20230927163212.402025-16-sakari.ailus@linux.intel.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230927163212.402025-1-sakari.ailus@linux.intel.com>
References: <20230927163212.402025-1-sakari.ailus@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.0 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,RCVD_IN_DNSWL_BLOCKED,
        SPF_HELO_NONE,SPF_NONE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

As the user needs to know what went wrong for S_ROUTING, copy array
arguments back to the user.

Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>
---
 drivers/media/v4l2-core/v4l2-ioctl.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/media/v4l2-core/v4l2-ioctl.c b/drivers/media/v4l2-core/v4l2-ioctl.c
index fb453b7d0c91..6921a72566df 100644
--- a/drivers/media/v4l2-core/v4l2-ioctl.c
+++ b/drivers/media/v4l2-core/v4l2-ioctl.c
@@ -3419,7 +3419,8 @@ video_usercopy(struct file *file, unsigned int orig_cmd, unsigned long arg,
 	 * in case of failure, but it is not defined here as part of the
 	 * 'v4l2_ioctls' array, insert an ad-hoc check to address that.
 	 */
-	if (err < 0 && !always_copy && cmd != VIDIOC_SUBDEV_G_ROUTING)
+	if (err < 0 && !always_copy && cmd != VIDIOC_SUBDEV_G_ROUTING &&
+	    cmd != VIDIOC_SUBDEV_S_ROUTING)
 		goto out;
 
 	if (has_array_args) {
-- 
2.39.2

