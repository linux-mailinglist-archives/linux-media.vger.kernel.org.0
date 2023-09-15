Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 345087A1761
	for <lists+linux-media@lfdr.de>; Fri, 15 Sep 2023 09:28:29 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232291AbjIOH2c (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 15 Sep 2023 03:28:32 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51432 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232195AbjIOH2b (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 15 Sep 2023 03:28:31 -0400
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.43])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 295A5E6A
        for <linux-media@vger.kernel.org>; Fri, 15 Sep 2023 00:28:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1694762897; x=1726298897;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=kCmc+DfhVYym6BC/rb5Kj78gKQOVWx6aMjEMVXTHEws=;
  b=PN1Lv1NBRK0qjqM3esJsVDZ1rDrikm6CxzorFCuV95g20sOHoAFGjff3
   sV4OY6fA05LKmkyDi1mmvW2zkQWxUxqP+afLzhJ8tIpuM8BolOwDJeZXq
   YJNg1/+BPNtmaCm5OcGURmh+CDcs3X8HbdIY7UFxLh2xgCO8FRoKErBgR
   /pmWjA5bhQ82gL9zWpR+YXbwHYan6HXC4GrL6txMEyq2+X9BV6q6AXXxT
   +AH8CEvkbSHSSFkHDaejLQDuwyhzTdcaUInpeCEEh2/g7Z+QtB/C/uDi5
   G7ymlZpLZ8gWV5NaPuDQANokIS5od5MsswCXmRAEFCaz7C5P3Vy1AWHTZ
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10833"; a="465548663"
X-IronPort-AV: E=Sophos;i="6.02,148,1688454000"; 
   d="scan'208";a="465548663"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
  by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Sep 2023 00:28:16 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10833"; a="888133071"
X-IronPort-AV: E=Sophos;i="6.02,148,1688454000"; 
   d="scan'208";a="888133071"
Received: from turnipsi.fi.intel.com (HELO kekkonen.fi.intel.com) ([10.237.72.44])
  by fmsmga001-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Sep 2023 00:27:40 -0700
Received: from svinhufvud.ger.corp.intel.com (localhost [IPv6:::1])
        by kekkonen.fi.intel.com (Postfix) with ESMTP id 8E32B11F831;
        Fri, 15 Sep 2023 10:28:10 +0300 (EEST)
From:   Sakari Ailus <sakari.ailus@linux.intel.com>
To:     linux-media@vger.kernel.org
Cc:     laurent.pinchart@ideasonboard.com,
        Tianshu Qiu <tian.shu.qiu@intel.com>,
        Bingbu Cao <bingbu.cao@intel.com>,
        Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>,
        Jacopo Mondi <jacopo+renesas@jmondi.org>
Subject: [PATCH 0/7] Small fixes and cleanups (ov2740 and ccs)
Date:   Fri, 15 Sep 2023 10:28:02 +0300
Message-Id: <20230915072809.37886-1-sakari.ailus@linux.intel.com>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-4.3 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,SPF_HELO_NONE,
        SPF_NONE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi folks,

This small set contains fixes and cleanups, mainly for the ccs and ov2740
drivers. I wrote these while working on the metadata set, but these could
and should be merged earlier.

Sakari Ailus (7):
  media: Documentation: Align numbered list, make it a proper ReST
  media: ccs: Fix driver quirk struct documentation
  media: ccs: Correctly initialise try compose rectangle
  media: ccs: Correct error handling in ccs_register_subdev
  media: ov2740: Enable runtime PM before registering the async subdev
  media: ov2740: Use sub-device active state
  media: ov2740: Return -EPROBE_DEFER if no endpoint is found

 .../userspace-api/media/v4l/dev-subdev.rst    |  49 +++----
 drivers/media/i2c/ccs/ccs-core.c              |  15 +-
 drivers/media/i2c/ccs/ccs-quirk.h             |   4 +-
 drivers/media/i2c/ov2740.c                    | 137 ++++++++----------
 4 files changed, 94 insertions(+), 111 deletions(-)

-- 
2.39.2

