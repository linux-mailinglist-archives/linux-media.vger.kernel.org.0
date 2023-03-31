Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id B389B6D1C66
	for <lists+linux-media@lfdr.de>; Fri, 31 Mar 2023 11:32:15 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231309AbjCaJcN (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 31 Mar 2023 05:32:13 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38738 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232163AbjCaJb7 (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 31 Mar 2023 05:31:59 -0400
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id DC81F1D2CA;
        Fri, 31 Mar 2023 02:31:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1680255094; x=1711791094;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=lUSU2N5JqWgjMvUTvzHok36UOnxaJa80/TZjGFg+BT8=;
  b=SLH359g+sQe4jAh0aQgrDweI5807Wh5S6xC8h+0I3tbwLXyRDEsx8/32
   VrsPfROd67FiadLhPBNGRmsgFDP0a6MqA2ouOf6l02Z8gvl3kt2x0IM0P
   MCLc9PckYqUttb7Mw2Wd5OJqx/mVXGZPAeMErren71n4a1PzFh26SgLAR
   xxM0kHVRJ+z02EMEQOx2Ex3nK2B+64ym0nMOERc+aUvoHuwqEUG9fbHBL
   GxFddEofcebtXSermpsBSuh+Nx5r5lWh9Pe4Ohjob7emchalQF6fo449+
   FHAq9xBGGcKRjCZSF/pUUvUmA5K7y7rLxZySxBmqvwqnr2Ccoqcekk8ny
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10665"; a="340132658"
X-IronPort-AV: E=Sophos;i="5.98,307,1673942400"; 
   d="scan'208";a="340132658"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
  by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 31 Mar 2023 02:31:24 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10665"; a="635228627"
X-IronPort-AV: E=Sophos;i="5.98,307,1673942400"; 
   d="scan'208";a="635228627"
Received: from turnipsi.fi.intel.com (HELO kekkonen.fi.intel.com) ([10.237.72.44])
  by orsmga003-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 31 Mar 2023 02:31:23 -0700
Received: from punajuuri.localdomain (punajuuri.localdomain [192.168.240.130])
        by kekkonen.fi.intel.com (Postfix) with ESMTP id B58A81224AF;
        Fri, 31 Mar 2023 12:31:20 +0300 (EEST)
Received: from sailus by punajuuri.localdomain with local (Exim 4.94.2)
        (envelope-from <sakari.ailus@linux.intel.com>)
        id 1piB5D-00DjN4-GE; Fri, 31 Mar 2023 12:30:07 +0300
From:   Sakari Ailus <sakari.ailus@linux.intel.com>
To:     linux-media@vger.kernel.org
Cc:     devicetree@vger.kernel.org
Subject: [PATCH 1/2] MAINTAINERS: Assume ov8856 driver maintainership
Date:   Fri, 31 Mar 2023 12:29:56 +0300
Message-Id: <20230331092957.3272621-2-sakari.ailus@linux.intel.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20230331092957.3272621-1-sakari.ailus@linux.intel.com>
References: <20230331092957.3272621-1-sakari.ailus@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.4 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,SPF_HELO_NONE,SPF_NONE
        autolearn=unavailable autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Dongchun's e-mail address is no longer valid, assign the ov8856 driver to
myself.

Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>
---
 MAINTAINERS | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/MAINTAINERS b/MAINTAINERS
index 7244781354b5a..9a6c5ac4dbe34 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -15481,7 +15481,7 @@ F:	Documentation/devicetree/bindings/media/i2c/ov7740.txt
 F:	drivers/media/i2c/ov7740.c
 
 OMNIVISION OV8856 SENSOR DRIVER
-M:	Dongchun Zhu <dongchun.zhu@mediatek.com>
+M:	Sakari Ailus <sakari.ailus@linux.intel.com>
 L:	linux-media@vger.kernel.org
 S:	Maintained
 T:	git git://linuxtv.org/media_tree.git
-- 
2.30.2

