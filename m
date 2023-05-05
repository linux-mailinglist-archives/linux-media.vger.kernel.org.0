Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id E60346F8A67
	for <lists+linux-media@lfdr.de>; Fri,  5 May 2023 22:51:12 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233361AbjEEUvL (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 5 May 2023 16:51:11 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41242 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233353AbjEEUvJ (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Fri, 5 May 2023 16:51:09 -0400
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E9F0A26B8
        for <linux-media@vger.kernel.org>; Fri,  5 May 2023 13:51:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1683319868; x=1714855868;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=8mpFQYl0KqTMrMzyVFyTM0F32U0wvrwOXaXSzU205RM=;
  b=RG9lr4CkJ84rSxc6QGZ9ZFqQjMc9NwmPM74KNiExvZAr2WnPFRvqqOMJ
   PNBx7m6H0vjq+Bh9OHgy66aAtGALWVIkTMyY7/yEyBOdRqXx86lNTGw2w
   ADtPw0nno/SNcBOlnmVtc2FDuoVnVJbXp25n7KpD1s7+/utcWf7vJp1JK
   pRFPl05xFM/HvU0rZNup+sIsSKMEkto327MM4WwAU+Lj8OPAy1fovEBMi
   DhziEYlVkzMwgzmX2mg1djpUl+DBQRF5VaPlNUg2bfWKNF5Uo3g6X/aFS
   b7765Bu5ulttrzV3+BJGLwabVGMd3qPB/I7rl3kgiZrwdWcuk1FgjpYqo
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10701"; a="352346071"
X-IronPort-AV: E=Sophos;i="5.99,253,1677571200"; 
   d="scan'208";a="352346071"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
  by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 May 2023 13:51:07 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10701"; a="762602660"
X-IronPort-AV: E=Sophos;i="5.99,253,1677571200"; 
   d="scan'208";a="762602660"
Received: from turnipsi.fi.intel.com (HELO kekkonen.fi.intel.com) ([10.237.72.44])
  by fmsmga008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 May 2023 13:51:05 -0700
Received: from svinhufvud.ger.corp.intel.com (localhost [IPv6:::1])
        by kekkonen.fi.intel.com (Postfix) with ESMTP id 4E820121435;
        Fri,  5 May 2023 23:51:03 +0300 (EEST)
From:   Sakari Ailus <sakari.ailus@linux.intel.com>
To:     linux-media@vger.kernel.org
Cc:     laurent.pinchart@ideasonboard.com, tomi.valkeinen@ideasonboard.com,
        bingbu.cao@intel.com
Subject: [PATCH 2/3] media: Documentation: Rename meta format files
Date:   Fri,  5 May 2023 23:51:00 +0300
Message-Id: <20230505205101.54569-3-sakari.ailus@linux.intel.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20230505205101.54569-1-sakari.ailus@linux.intel.com>
References: <20230505205101.54569-1-sakari.ailus@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-4.5 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,SPF_HELO_NONE,
        SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Rename meta format files, using "metafmt" prefix instead of "pixfmt-meta".
These are metadata formats, not pixel formats.

Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>
Cc: Bingbu Cao <bingbu.cao@intel.com>
Cc: Dafna Hirschfeld <dafna@fastmail.com>
---
 .../userspace-api/media/v4l/meta-formats.rst       | 14 +++++++-------
 .../v4l/{pixfmt-meta-d4xx.rst => metafmt-d4xx.rst} |  0
 ...-meta-intel-ipu3.rst => metafmt-intel-ipu3.rst} |  0
 .../{pixfmt-meta-rkisp1.rst => metafmt-rkisp1.rst} |  0
 .../v4l/{pixfmt-meta-uvc.rst => metafmt-uvc.rst}   |  0
 .../{pixfmt-meta-vivid.rst => metafmt-vivid.rst}   |  0
 ...xfmt-meta-vsp1-hgo.rst => metafmt-vsp1-hgo.rst} |  0
 ...xfmt-meta-vsp1-hgt.rst => metafmt-vsp1-hgt.rst} |  0
 MAINTAINERS                                        |  4 ++--
 9 files changed, 9 insertions(+), 9 deletions(-)
 rename Documentation/userspace-api/media/v4l/{pixfmt-meta-d4xx.rst => metafmt-d4xx.rst} (100%)
 rename Documentation/userspace-api/media/v4l/{pixfmt-meta-intel-ipu3.rst => metafmt-intel-ipu3.rst} (100%)
 rename Documentation/userspace-api/media/v4l/{pixfmt-meta-rkisp1.rst => metafmt-rkisp1.rst} (100%)
 rename Documentation/userspace-api/media/v4l/{pixfmt-meta-uvc.rst => metafmt-uvc.rst} (100%)
 rename Documentation/userspace-api/media/v4l/{pixfmt-meta-vivid.rst => metafmt-vivid.rst} (100%)
 rename Documentation/userspace-api/media/v4l/{pixfmt-meta-vsp1-hgo.rst => metafmt-vsp1-hgo.rst} (100%)
 rename Documentation/userspace-api/media/v4l/{pixfmt-meta-vsp1-hgt.rst => metafmt-vsp1-hgt.rst} (100%)

diff --git a/Documentation/userspace-api/media/v4l/meta-formats.rst b/Documentation/userspace-api/media/v4l/meta-formats.rst
index fff25357fe86..0bb61fc5bc00 100644
--- a/Documentation/userspace-api/media/v4l/meta-formats.rst
+++ b/Documentation/userspace-api/media/v4l/meta-formats.rst
@@ -12,10 +12,10 @@ These formats are used for the :ref:`metadata` interface only.
 .. toctree::
     :maxdepth: 1
 
-    pixfmt-meta-d4xx
-    pixfmt-meta-intel-ipu3
-    pixfmt-meta-rkisp1
-    pixfmt-meta-uvc
-    pixfmt-meta-vsp1-hgo
-    pixfmt-meta-vsp1-hgt
-    pixfmt-meta-vivid
+    metafmt-d4xx
+    metafmt-intel-ipu3
+    metafmt-rkisp1
+    metafmt-uvc
+    metafmt-vsp1-hgo
+    metafmt-vsp1-hgt
+    metafmt-vivid
diff --git a/Documentation/userspace-api/media/v4l/pixfmt-meta-d4xx.rst b/Documentation/userspace-api/media/v4l/metafmt-d4xx.rst
similarity index 100%
rename from Documentation/userspace-api/media/v4l/pixfmt-meta-d4xx.rst
rename to Documentation/userspace-api/media/v4l/metafmt-d4xx.rst
diff --git a/Documentation/userspace-api/media/v4l/pixfmt-meta-intel-ipu3.rst b/Documentation/userspace-api/media/v4l/metafmt-intel-ipu3.rst
similarity index 100%
rename from Documentation/userspace-api/media/v4l/pixfmt-meta-intel-ipu3.rst
rename to Documentation/userspace-api/media/v4l/metafmt-intel-ipu3.rst
diff --git a/Documentation/userspace-api/media/v4l/pixfmt-meta-rkisp1.rst b/Documentation/userspace-api/media/v4l/metafmt-rkisp1.rst
similarity index 100%
rename from Documentation/userspace-api/media/v4l/pixfmt-meta-rkisp1.rst
rename to Documentation/userspace-api/media/v4l/metafmt-rkisp1.rst
diff --git a/Documentation/userspace-api/media/v4l/pixfmt-meta-uvc.rst b/Documentation/userspace-api/media/v4l/metafmt-uvc.rst
similarity index 100%
rename from Documentation/userspace-api/media/v4l/pixfmt-meta-uvc.rst
rename to Documentation/userspace-api/media/v4l/metafmt-uvc.rst
diff --git a/Documentation/userspace-api/media/v4l/pixfmt-meta-vivid.rst b/Documentation/userspace-api/media/v4l/metafmt-vivid.rst
similarity index 100%
rename from Documentation/userspace-api/media/v4l/pixfmt-meta-vivid.rst
rename to Documentation/userspace-api/media/v4l/metafmt-vivid.rst
diff --git a/Documentation/userspace-api/media/v4l/pixfmt-meta-vsp1-hgo.rst b/Documentation/userspace-api/media/v4l/metafmt-vsp1-hgo.rst
similarity index 100%
rename from Documentation/userspace-api/media/v4l/pixfmt-meta-vsp1-hgo.rst
rename to Documentation/userspace-api/media/v4l/metafmt-vsp1-hgo.rst
diff --git a/Documentation/userspace-api/media/v4l/pixfmt-meta-vsp1-hgt.rst b/Documentation/userspace-api/media/v4l/metafmt-vsp1-hgt.rst
similarity index 100%
rename from Documentation/userspace-api/media/v4l/pixfmt-meta-vsp1-hgt.rst
rename to Documentation/userspace-api/media/v4l/metafmt-vsp1-hgt.rst
diff --git a/MAINTAINERS b/MAINTAINERS
index e25ebb7c781b..546826109900 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -10359,7 +10359,7 @@ L:	linux-media@vger.kernel.org
 S:	Maintained
 F:	Documentation/admin-guide/media/ipu3.rst
 F:	Documentation/admin-guide/media/ipu3_rcb.svg
-F:	Documentation/userspace-api/media/v4l/pixfmt-meta-intel-ipu3.rst
+F:	Documentation/userspace-api/media/v4l/metafmt-intel-ipu3.rst
 F:	drivers/staging/media/ipu3/
 
 INTEL IXP4XX CRYPTO SUPPORT
@@ -18026,7 +18026,7 @@ L:	linux-rockchip@lists.infradead.org
 S:	Maintained
 F:	Documentation/admin-guide/media/rkisp1.rst
 F:	Documentation/devicetree/bindings/media/rockchip-isp1.yaml
-F:	Documentation/userspace-api/media/v4l/pixfmt-meta-rkisp1.rst
+F:	Documentation/userspace-api/media/v4l/metafmt-rkisp1.rst
 F:	drivers/media/platform/rockchip/rkisp1
 F:	include/uapi/linux/rkisp1-config.h
 
-- 
2.30.2

