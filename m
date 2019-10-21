Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 684CADE54D
	for <lists+linux-media@lfdr.de>; Mon, 21 Oct 2019 09:29:09 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727110AbfJUH3I (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 21 Oct 2019 03:29:08 -0400
Received: from mga12.intel.com ([192.55.52.136]:1413 "EHLO mga12.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726480AbfJUH3I (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Mon, 21 Oct 2019 03:29:08 -0400
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga005.jf.intel.com ([10.7.209.41])
  by fmsmga106.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384; 21 Oct 2019 00:29:07 -0700
X-IronPort-AV: E=Sophos;i="5.67,322,1566889200"; 
   d="scan'208";a="372099874"
Received: from paasikivi.fi.intel.com ([10.237.72.42])
  by orsmga005-auth.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384; 21 Oct 2019 00:29:06 -0700
Received: from punajuuri.localdomain (punajuuri.localdomain [192.168.240.130])
        by paasikivi.fi.intel.com (Postfix) with ESMTP id 04DBE20933
        for <linux-media@vger.kernel.org>; Mon, 21 Oct 2019 10:29:04 +0300 (EEST)
Received: from sailus by punajuuri.localdomain with local (Exim 4.92)
        (envelope-from <sakari.ailus@linux.intel.com>)
        id 1iMS86-0005TO-Ml
        for linux-media@vger.kernel.org; Mon, 21 Oct 2019 10:29:26 +0300
From:   Sakari Ailus <sakari.ailus@linux.intel.com>
To:     linux-media@vger.kernel.org
Subject: [PATCH 1/1] v4l2-fwnode: Print the node name while parsing endpoints
Date:   Mon, 21 Oct 2019 10:29:26 +0300
Message-Id: <20191021072926.20997-1-sakari.ailus@linux.intel.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Print the node name during endpoint parsing for better debuggability.

Depends-on: ("lib/vsprintf: Add %pfw conversion specifier for printing fwnode names")
Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>
---
 drivers/media/v4l2-core/v4l2-fwnode.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/media/v4l2-core/v4l2-fwnode.c b/drivers/media/v4l2-core/v4l2-fwnode.c
index 3bd1888787eb3..ac2848d02a7c7 100644
--- a/drivers/media/v4l2-core/v4l2-fwnode.c
+++ b/drivers/media/v4l2-core/v4l2-fwnode.c
@@ -422,7 +422,7 @@ static int __v4l2_fwnode_endpoint_parse(struct fwnode_handle *fwnode,
 		       sizeof(*vep) - offsetof(typeof(*vep), bus));
 	}
 
-	pr_debug("===== begin V4L2 endpoint properties\n");
+	pr_debug("===== begin parsing endpoint %pfw\n", fwnode);
 
 	/*
 	 * Zero the fwnode graph endpoint memory in case we don't end up parsing
@@ -500,7 +500,7 @@ int v4l2_fwnode_endpoint_parse(struct fwnode_handle *fwnode,
 
 	ret = __v4l2_fwnode_endpoint_parse(fwnode, vep);
 
-	pr_debug("===== end V4L2 endpoint properties\n");
+	pr_debug("===== end parsing endpoint %pfw\n", fwnode);
 
 	return ret;
 }
@@ -550,7 +550,7 @@ int v4l2_fwnode_endpoint_alloc_parse(struct fwnode_handle *fwnode,
 				vep->link_frequencies[i]);
 	}
 
-	pr_debug("===== end V4L2 endpoint properties\n");
+	pr_debug("===== end parsing endpoint %pfw\n", fwnode);
 
 	return 0;
 }
-- 
2.20.1

