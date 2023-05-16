Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 0C0B57049CF
	for <lists+linux-media@lfdr.de>; Tue, 16 May 2023 11:56:26 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232236AbjEPJ4Y (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 16 May 2023 05:56:24 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:32838 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232233AbjEPJ4X (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 16 May 2023 05:56:23 -0400
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 05DC81713
        for <linux-media@vger.kernel.org>; Tue, 16 May 2023 02:56:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1684230973; x=1715766973;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=4I3zokPXYMtBuNWljSDZGl8KSQyvkMU1w4hbNlvo9Dk=;
  b=V2sVSXDuj4qFv5u2oBVD4ZwT8iEM+pIZ6MKlQ2JOYY8NBIJjfCIji8Bc
   uO0Tudt/kru9IEWLKmZbhaJx6OKW+Lay0/Zv7x6Hpa1RrnzOwm6Sl3XQH
   tQaiPid8lK91qlVu8Dz93J5V+Vfd6hba4EwJ0Fi5hpsiL20DGh4EFIktV
   tgs9mUHm3BAGeb2IP/6A1WZ7bF9p3gRivS7NSWvX5iKVYHg2JX1DNd7Wx
   5N1tr/9P8fQjgzk5zkisniHRmCcji6tfl7BCfXPqVO09Rk+YcEiRAAjza
   CqlqAr8qFebHcTbWmtS+Hu7K5nzEbFnucKlltMrtfnR6zlch6ZtzfrgeH
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10711"; a="354601468"
X-IronPort-AV: E=Sophos;i="5.99,278,1677571200"; 
   d="scan'208";a="354601468"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
  by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 May 2023 02:55:50 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10711"; a="731931847"
X-IronPort-AV: E=Sophos;i="5.99,278,1677571200"; 
   d="scan'208";a="731931847"
Received: from turnipsi.fi.intel.com (HELO kekkonen.fi.intel.com) ([10.237.72.44])
  by orsmga008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 May 2023 02:55:48 -0700
Received: from punajuuri.localdomain (punajuuri.localdomain [192.168.240.130])
        by kekkonen.fi.intel.com (Postfix) with ESMTP id 3F32D122EE0;
        Tue, 16 May 2023 12:55:36 +0300 (EEST)
Received: from sailus by punajuuri.localdomain with local (Exim 4.94.2)
        (envelope-from <sakari.ailus@linux.intel.com>)
        id 1pyrOy-002ZAQ-8X; Tue, 16 May 2023 12:55:28 +0300
From:   Sakari Ailus <sakari.ailus@linux.intel.com>
To:     linux-media@vger.kernel.org
Cc:     laurent.pinchart@ideasonboard.com,
        Philipp Zabel <p.zabel@pengutronix.de>, hverkuil@xs4all.nl,
        Francesco Dolcini <francesco@dolcini.it>,
        aishwarya.kothari@toradex.com, Robert Foss <rfoss@kernel.org>,
        Todor Tomov <todor.too@gmail.com>,
        Hyun Kwon <hyun.kwon@xilinx.com>, bingbu.cao@intel.com
Subject: [PATCH v2 15/31] media: v4l: async: Drop duplicate handling when adding connections
Date:   Tue, 16 May 2023 12:55:01 +0300
Message-Id: <20230516095517.611711-16-sakari.ailus@linux.intel.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20230516095517.611711-1-sakari.ailus@linux.intel.com>
References: <20230516095517.611711-1-sakari.ailus@linux.intel.com>
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

The connections are checked for duplicates already when the notifier is
registered. This is effectively a sanity check for driver (and possibly
obscure firmware) bugs. Don't do this when adding the connection.

Retain the int return type for now. It'll be needed very soon again.

Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>
---
 drivers/media/v4l2-core/v4l2-async.c | 23 +++++++----------------
 1 file changed, 7 insertions(+), 16 deletions(-)

diff --git a/drivers/media/v4l2-core/v4l2-async.c b/drivers/media/v4l2-core/v4l2-async.c
index efea2c4ba2974..62c655df9bc50 100644
--- a/drivers/media/v4l2-core/v4l2-async.c
+++ b/drivers/media/v4l2-core/v4l2-async.c
@@ -475,8 +475,7 @@ v4l2_async_nf_has_async_match_entry(struct v4l2_async_notifier *notifier,
  */
 static bool
 v4l2_async_nf_has_async_match(struct v4l2_async_notifier *notifier,
-			      struct v4l2_async_match_desc *match,
-			      bool skip_self)
+			      struct v4l2_async_match_desc *match)
 {
 	struct v4l2_async_connection *asc;
 
@@ -484,7 +483,7 @@ v4l2_async_nf_has_async_match(struct v4l2_async_notifier *notifier,
 
 	/* Check that an asd is not being added more than once. */
 	list_for_each_entry(asc, &notifier->asc_list, asc_entry) {
-		if (skip_self && &asc->match == match)
+		if (&asc->match == match)
 			break;
 		if (v4l2_async_match_equal(&asc->match, match))
 			return true;
@@ -499,16 +498,14 @@ v4l2_async_nf_has_async_match(struct v4l2_async_notifier *notifier,
 }
 
 static int v4l2_async_nf_match_valid(struct v4l2_async_notifier *notifier,
-				     struct v4l2_async_match_desc *match,
-				     bool skip_self)
+				     struct v4l2_async_match_desc *match)
 {
 	struct device *dev = notifier_dev(notifier);
 
 	switch (match->type) {
 	case V4L2_ASYNC_MATCH_TYPE_I2C:
 	case V4L2_ASYNC_MATCH_TYPE_FWNODE:
-		if (v4l2_async_nf_has_async_match(notifier, match,
-						  skip_self)) {
+		if (v4l2_async_nf_has_async_match(notifier, match)) {
 			dev_dbg(dev, "v4l2-async: match descriptor already listed in this or other notifiers\n");
 			return -EEXIST;
 		}
@@ -539,7 +536,7 @@ static int __v4l2_async_nf_register(struct v4l2_async_notifier *notifier)
 	mutex_lock(&list_lock);
 
 	list_for_each_entry(asc, &notifier->asc_list, asc_entry) {
-		ret = v4l2_async_nf_match_valid(notifier, &asc->match, true);
+		ret = v4l2_async_nf_match_valid(notifier, &asc->match);
 		if (ret)
 			goto err_unlock;
 
@@ -668,19 +665,13 @@ EXPORT_SYMBOL_GPL(v4l2_async_nf_cleanup);
 static int __v4l2_async_nf_add_connection(struct v4l2_async_notifier *notifier,
 					  struct v4l2_async_connection *asc)
 {
-	int ret;
-
 	mutex_lock(&list_lock);
 
-	ret = v4l2_async_nf_match_valid(notifier, &asc->match, false);
-	if (ret)
-		goto unlock;
-
 	list_add_tail(&asc->asc_entry, &notifier->asc_list);
 
-unlock:
 	mutex_unlock(&list_lock);
-	return ret;
+
+	return 0;
 }
 
 struct v4l2_async_connection *
-- 
2.30.2

