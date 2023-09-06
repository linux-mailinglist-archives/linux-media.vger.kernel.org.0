Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 5242C7938D7
	for <lists+linux-media@lfdr.de>; Wed,  6 Sep 2023 11:50:44 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232268AbjIFJuq (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 6 Sep 2023 05:50:46 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40832 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229661AbjIFJup (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Wed, 6 Sep 2023 05:50:45 -0400
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.20])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4D1F992
        for <linux-media@vger.kernel.org>; Wed,  6 Sep 2023 02:50:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1693993842; x=1725529842;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=1cf3xhkdj3IiRHkb3axvTXmW446wffDpJMOZuDdnXIg=;
  b=fPtbIZpZixyE/LKoFJj7mna4PPW6LdRvJ7kAnUbKK/nuqNAKwVO3fZ7H
   cktzMoDhVWFWV/xOw63GAgIzepnhfv2N85jdN5f3mKsKGLtwIHkTUGNEN
   o87lfFg6vMls6YY7OFwLRB1RBNPtMSdrbfSTBzve17lPlZ124kG/VjIs0
   +5kvXzWtyNwoh2p8hJBen4lx+ftdK6V69FXm+KARTJ3MU/jyOaSP74BaY
   YLV3jqC28Anc1fOnqFHalscZaiGz0YUkPt1jtj52unZ7M1wGIe81pMgkx
   V+y0VLQ/Pj+LSbNANROYiQIDsx2eNd018eMM/NktxUywxTxLyl/gwEWHB
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10824"; a="367242732"
X-IronPort-AV: E=Sophos;i="6.02,231,1688454000"; 
   d="scan'208";a="367242732"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
  by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Sep 2023 02:50:41 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10824"; a="865083701"
X-IronPort-AV: E=Sophos;i="6.02,231,1688454000"; 
   d="scan'208";a="865083701"
Received: from turnipsi.fi.intel.com (HELO kekkonen.fi.intel.com) ([10.237.72.44])
  by orsmga004-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Sep 2023 02:50:40 -0700
Received: from punajuuri.localdomain (punajuuri.localdomain [192.168.240.130])
        by kekkonen.fi.intel.com (Postfix) with ESMTP id 8FAB41203B9;
        Wed,  6 Sep 2023 12:50:37 +0300 (EEST)
Received: from sailus by punajuuri.localdomain with local (Exim 4.96)
        (envelope-from <sakari.ailus@linux.intel.com>)
        id 1qdpAD-0064a6-2k;
        Wed, 06 Sep 2023 12:49:33 +0300
From:   Sakari Ailus <sakari.ailus@linux.intel.com>
To:     linux-media@vger.kernel.org
Cc:     tomi.valkeinen@ideasonboard.com
Subject: [v4l-utils PATCH 1/1] utils: libv4l2subdev: Set stream for g_routing
Date:   Wed,  6 Sep 2023 12:49:23 +0300
Message-Id: <20230906094923.1447570-1-sakari.ailus@linux.intel.com>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-4.3 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,PDS_OTHER_BAD_TLD,
        RCVD_IN_DNSWL_MED,RCVD_IN_MSPIKE_H3,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,
        SPF_NONE autolearn=ham autolearn_force=no version=3.4.6
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

