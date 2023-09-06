Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id B65CA793A72
	for <lists+linux-media@lfdr.de>; Wed,  6 Sep 2023 12:58:13 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233309AbjIFK6P (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 6 Sep 2023 06:58:15 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58900 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229891AbjIFK6P (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Wed, 6 Sep 2023 06:58:15 -0400
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.136])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 51A0810D0
        for <linux-media@vger.kernel.org>; Wed,  6 Sep 2023 03:58:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1693997891; x=1725533891;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=XY5JQCYSJq3Rw7CP0GVYKzO2NXCK53NFFv9AYQypvU4=;
  b=C7U9dVAyC9yLlgmJjyu6EXu6AXKzAt65gb8KK3zApnYs4MYijk0iFFIE
   FdSyIim/1r7dxCT1zpmWkz2RPfN2ObsKpDHxoD8MAwlKG9lOtSy+6nm4p
   yop3EgA8h08scMKyTgFrzN33t0YKFGy2Dr9UJ8EgBXg5o4vDXCK+yGXcB
   5ibHO+0WdXjs461KNpHV940TuaQrrWK46p0u0nr2LweCpdeKIY14IxYaC
   vj9GXKLuoo129R+KuKlo0JDHjnfZzC/bhLUVqrGN8DZI3BTmUHKLA3IW0
   S6RvKQUZyxjB3u0GtJGcm+38Vq//0eR14PlQLfzeI+LLUIEh0xzx2MrHD
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10824"; a="356521942"
X-IronPort-AV: E=Sophos;i="6.02,231,1688454000"; 
   d="scan'208";a="356521942"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
  by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Sep 2023 03:57:38 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10824"; a="718222987"
X-IronPort-AV: E=Sophos;i="6.02,231,1688454000"; 
   d="scan'208";a="718222987"
Received: from turnipsi.fi.intel.com (HELO kekkonen.fi.intel.com) ([10.237.72.44])
  by orsmga006-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Sep 2023 03:57:37 -0700
Received: from punajuuri.localdomain (punajuuri.localdomain [192.168.240.130])
        by kekkonen.fi.intel.com (Postfix) with ESMTP id 876D111FC2C;
        Wed,  6 Sep 2023 13:57:34 +0300 (EEST)
Received: from sailus by punajuuri.localdomain with local (Exim 4.96)
        (envelope-from <sakari.ailus@linux.intel.com>)
        id 1qdqD0-006JVj-2I;
        Wed, 06 Sep 2023 13:56:30 +0300
From:   Sakari Ailus <sakari.ailus@linux.intel.com>
To:     linux-media@vger.kernel.org
Cc:     tomi.valkeinen@ideasonboard.com
Subject: [v4l-utils PATCH v2 1/1] utils: libv4l2subdev: Set stream for g_selection
Date:   Wed,  6 Sep 2023 13:56:20 +0300
Message-Id: <20230906105620.1504959-1-sakari.ailus@linux.intel.com>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-4.3 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,PDS_OTHER_BAD_TLD,
        RCVD_IN_DNSWL_MED,SPF_HELO_NONE,SPF_NONE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Set the stream field for g_selection. This was missed in the original
patch adding support for streams.

Fixes: e300287381c6 ("media-ctl: Add support for routes and streams")
Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>
Reviewed-by: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
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

