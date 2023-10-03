Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id E30187B6855
	for <lists+linux-media@lfdr.de>; Tue,  3 Oct 2023 13:52:57 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S240638AbjJCLw7 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 3 Oct 2023 07:52:59 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40788 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S240630AbjJCLw6 (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Tue, 3 Oct 2023 07:52:58 -0400
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.88])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id AABD8A3
        for <linux-media@vger.kernel.org>; Tue,  3 Oct 2023 04:52:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1696333975; x=1727869975;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=NCBA2ZWrxrOSJHNzrnnv7zJUFHNyA34Wx+SZLYkoGpY=;
  b=RBWAVXlV9NnLgCFoGRUh3ATCYp8JKFB66SZgJD1woyoNBqd7+/d4ne3G
   NOoWFohg3OYatVVHU6PSx0OhkogOpGWW0QONDR3MRxzCut/Ec4o8DTkLU
   2T7Doyu1pc0gFouXjjU617SUdBNjOpEw8qMajwYEqXeqba37ognvy/ujg
   RMonI2+VV8355FFaAuG4uorBGYXgKFobd8leO/DLFV9SvRydAM3JCswjj
   1dTMjOwqudTt4cPJCZcglSLPe405EXMu2h9CDmhsKr8RiAdA60sOsszDC
   7oefDP0R05feUzTeuEx54BXYFuEoMLu3TES0kqZHWnqOL5QZxjQZe9tT/
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10851"; a="413767149"
X-IronPort-AV: E=Sophos;i="6.03,197,1694761200"; 
   d="scan'208";a="413767149"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
  by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Oct 2023 04:52:55 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10851"; a="816650549"
X-IronPort-AV: E=Sophos;i="6.03,197,1694761200"; 
   d="scan'208";a="816650549"
Received: from turnipsi.fi.intel.com (HELO kekkonen.fi.intel.com) ([10.237.72.44])
  by fmsmga008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Oct 2023 04:52:52 -0700
Received: from svinhufvud.ger.corp.intel.com (localhost [IPv6:::1])
        by kekkonen.fi.intel.com (Postfix) with ESMTP id 86775120A56;
        Tue,  3 Oct 2023 14:52:49 +0300 (EEST)
From:   Sakari Ailus <sakari.ailus@linux.intel.com>
To:     linux-media@vger.kernel.org
Cc:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        tomi.valkeinen@ideasonboard.com, bingbu.cao@intel.com,
        hongju.wang@intel.com, hverkuil@xs4all.nl,
        Andrey Konovalov <andrey.konovalov@linaro.org>,
        Jacopo Mondi <jacopo.mondi@ideasonboard.com>,
        Dmitry Perchanov <dmitry.perchanov@intel.com>,
        "Ng, Khai Wen" <khai.wen.ng@intel.com>
Subject: [PATCH v6 08/28] media: Documentation: Additional streams generally don't harm capture
Date:   Tue,  3 Oct 2023 14:52:36 +0300
Message-Id: <20231003115237.76828-9-sakari.ailus@linux.intel.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20231003115237.76828-1-sakari.ailus@linux.intel.com>
References: <20231003115237.76828-1-sakari.ailus@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.0 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,RCVD_IN_DNSWL_BLOCKED,
        RCVD_IN_MSPIKE_H3,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_NONE
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Having extra streams on the source end of the link that cannot be captured
by the sink sub-device generally are not an issue, at least not on CSI-2
bus. Still document that there may be hardware specific limitations. For
example on parallel bus this might not work on all cases.

Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>
---
 Documentation/userspace-api/media/v4l/dev-subdev.rst | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/Documentation/userspace-api/media/v4l/dev-subdev.rst b/Documentation/userspace-api/media/v4l/dev-subdev.rst
index f375b820ab68..a387e8a15b8d 100644
--- a/Documentation/userspace-api/media/v4l/dev-subdev.rst
+++ b/Documentation/userspace-api/media/v4l/dev-subdev.rst
@@ -529,9 +529,9 @@ the its sink pad and allows to route them individually to one of its source
 pads.
 
 Subdevice drivers that support multiplexed streams are compatible with
-non-multiplexed subdev drivers, but, of course, require a routing configuration
-where the link between those two types of drivers contains only a single
-stream.
+non-multiplexed subdev drivers. However, if the driver at the sink end of a link
+does not support streams, then only the stream 0 on source end may be
+captured. There may be additional hardware specific limitations.
 
 Understanding streams
 ^^^^^^^^^^^^^^^^^^^^^
-- 
2.39.2

