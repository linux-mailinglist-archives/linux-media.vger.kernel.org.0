Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 0568D1ABCA5
	for <lists+linux-media@lfdr.de>; Thu, 16 Apr 2020 11:18:31 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2392137AbgDPJSM (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 16 Apr 2020 05:18:12 -0400
Received: from mga06.intel.com ([134.134.136.31]:54587 "EHLO mga06.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S2392112AbgDPJSJ (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Thu, 16 Apr 2020 05:18:09 -0400
IronPort-SDR: kcvfFWwTQ9UOmSsQk2Nub1jQbcBk0OWEKYEWW3rESKcMNQSfkptJ+gD2ewGaBwxbfkBy/y44f3
 KUPAJiZgEx1Q==
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga002.jf.intel.com ([10.7.209.21])
  by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Apr 2020 02:18:07 -0700
IronPort-SDR: y4zKV+0E0kLmU3sO4lrgSl27UTMOvNsMqdxlnxDAsoAYC7RwxRM03s96IlduBqF1ue3Q09fE7f
 3W8DTYiCy3zw==
X-IronPort-AV: E=Sophos;i="5.72,390,1580803200"; 
   d="scan'208";a="272012232"
Received: from paasikivi.fi.intel.com ([10.237.72.42])
  by orsmga002-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Apr 2020 02:18:05 -0700
Received: from punajuuri.localdomain (punajuuri.localdomain [192.168.240.130])
        by paasikivi.fi.intel.com (Postfix) with ESMTP id B0A5D20ABC;
        Thu, 16 Apr 2020 12:18:03 +0300 (EEST)
Received: from sailus by punajuuri.localdomain with local (Exim 4.92)
        (envelope-from <sakari.ailus@linux.intel.com>)
        id 1jP0fa-00087k-DD; Thu, 16 Apr 2020 12:18:50 +0300
From:   Sakari Ailus <sakari.ailus@linux.intel.com>
To:     linux-media@vger.kernel.org
Cc:     rajmohan.mani@intel.com, bingbu.cao@intel.com, tfiga@chromium.org
Subject: [PATCH 3/3] staging: ipu3-imgu: Add a sanity check for the parameter struct size
Date:   Thu, 16 Apr 2020 12:18:50 +0300
Message-Id: <20200416091850.31177-4-sakari.ailus@linux.intel.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20200416091850.31177-1-sakari.ailus@linux.intel.com>
References: <20200416091850.31177-1-sakari.ailus@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

There have been cases where seemingly innocuous patches have broken the
uAPI by changing the memory layout of the parameter struct. Generally such
changes also introduce a change in the size of the entire struct. This
patch adds a sanity check to avoid such cases happening in the future.

Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>
---
 drivers/staging/media/ipu3/ipu3-css.c | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/drivers/staging/media/ipu3/ipu3-css.c b/drivers/staging/media/ipu3/ipu3-css.c
index 4f04fe838b0c0..3c700ae9c94e9 100644
--- a/drivers/staging/media/ipu3/ipu3-css.c
+++ b/drivers/staging/media/ipu3/ipu3-css.c
@@ -1911,6 +1911,13 @@ int imgu_css_meta_fmt_set(struct v4l2_meta_format *fmt)
 	switch (fmt->dataformat) {
 	case V4L2_META_FMT_IPU3_PARAMS:
 		fmt->buffersize = sizeof(struct ipu3_uapi_params);
+
+		/*
+		 * Sanity check for the parameter struct size. This must
+		 * not change!
+		 */
+		BUILD_BUG_ON(sizeof(struct ipu3_uapi_params) != 39328);
+
 		break;
 	case V4L2_META_FMT_IPU3_STAT_3A:
 		fmt->buffersize = sizeof(struct ipu3_uapi_stats_3a);
-- 
2.20.1

