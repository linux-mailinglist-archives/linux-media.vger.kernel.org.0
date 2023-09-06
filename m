Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id E54A5793A54
	for <lists+linux-media@lfdr.de>; Wed,  6 Sep 2023 12:50:05 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S239389AbjIFKuH (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 6 Sep 2023 06:50:07 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57504 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S239383AbjIFKuF (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Wed, 6 Sep 2023 06:50:05 -0400
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.88])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 389031739
        for <linux-media@vger.kernel.org>; Wed,  6 Sep 2023 03:49:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1693997393; x=1725533393;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=1cf3xhkdj3IiRHkb3axvTXmW446wffDpJMOZuDdnXIg=;
  b=SIevxlEndM7IVbAKAhCRYe6OSSUcJPjoM5qWAZYMXbhF3bi2c0Jz8Hem
   8I7gsPFYo12EDpVaBKETf/xn7JMuSQOBUW+1qCnpxYByca8wGCAkoqhW5
   m6YUXDzQyepbCYtFIPTrtsbAKz0wpqln5VMjgniHlBL8kr/jizMz6t19Z
   8v3gftbVX+c1T2lhLTdwLdn8qgOQxzzocC7DM/Lj08SpDWz7V+cwP8LBN
   FsS8+qFjOjhOB6j/e4BTuy4d1AytPUbhJDVPsUhMg69QfmUruEjxNdxhg
   8mSmhDpCu8S630XmXYaYylisM3863I5kuymF4JN7AKbz7Un4N1ryzHGr7
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10824"; a="408034148"
X-IronPort-AV: E=Sophos;i="6.02,231,1688454000"; 
   d="scan'208";a="408034148"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
  by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Sep 2023 03:49:52 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10824"; a="806960663"
X-IronPort-AV: E=Sophos;i="6.02,231,1688454000"; 
   d="scan'208";a="806960663"
Received: from turnipsi.fi.intel.com (HELO kekkonen.fi.intel.com) ([10.237.72.44])
  by fmsmga008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Sep 2023 03:49:51 -0700
Received: from punajuuri.localdomain (punajuuri.localdomain [192.168.240.130])
        by kekkonen.fi.intel.com (Postfix) with ESMTP id 1AF1111FC2C;
        Wed,  6 Sep 2023 13:49:49 +0300 (EEST)
Received: from sailus by punajuuri.localdomain with local (Exim 4.96)
        (envelope-from <sakari.ailus@linux.intel.com>)
        id 1qdq5V-006Abh-0q;
        Wed, 06 Sep 2023 13:48:45 +0300
From:   Sakari Ailus <sakari.ailus@linux.intel.com>
To:     linux-media@vger.kernel.org
Cc:     tomi.valkeinen@ideasonboard.com
Subject: [v4l-utils PATCH 1/1] utils: libv4l2subdev: Set stream for g_routing
Date:   Wed,  6 Sep 2023 13:48:35 +0300
Message-Id: <20230906104835.1470733-1-sakari.ailus@linux.intel.com>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.0 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,PDS_OTHER_BAD_TLD,
        RCVD_IN_DNSWL_BLOCKED,RCVD_IN_MSPIKE_H3,RCVD_IN_MSPIKE_WL,
        SPF_HELO_NONE,SPF_NONE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Set the stream field for g_routing. This was missed in the original patch
adding support for streams.

Fixes: e300287381c6 ("media-ctl: Add support for routes and streams")
Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>
---
 utils/media-ctl/libv4l2subdev.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/utils/media-ctl/libv4l2subdev.c b/utils/media-ctl/libv4l2subdev.c
index 16e1284cc0a3..c614f4a2e0fd 100644
--- a/utils/media-ctl/libv4l2subdev.c
+++ b/utils/media-ctl/libv4l2subdev.c
@@ -166,6 +166,7 @@ int v4l2_subdev_get_selection(struct media_entity *entity,
 
 	memset(&u.sel, 0, sizeof(u.sel));
 	u.sel.pad = pad;
+	u.sel.stream = stream;
 	u.sel.target = target;
 	u.sel.which = which;
 
-- 
2.39.2

