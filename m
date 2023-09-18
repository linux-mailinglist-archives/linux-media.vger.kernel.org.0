Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id DEF137A4A1D
	for <lists+linux-media@lfdr.de>; Mon, 18 Sep 2023 14:52:33 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S240485AbjIRMwF (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 18 Sep 2023 08:52:05 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57334 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S241966AbjIRMwB (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 18 Sep 2023 08:52:01 -0400
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.136])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8B2CDD1
        for <linux-media@vger.kernel.org>; Mon, 18 Sep 2023 05:51:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1695041505; x=1726577505;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=ltVupa4yBGfNSj6Vyll6GyPmLFg9VOaieET5jl+OkV8=;
  b=bVp+72Rp9QX97D5HY1jBrbhvpsZznlyImC/LJxizQQyPzUxPP0A7ITqn
   A+pEXTORTsKl3moc/JZAFj2vhhnH2mnfBwiLSXGyd0qOECBboZ2vReoh3
   CKakluEEkhnKJbMJm6pss8IMirEC6oookqnEal3a6RMexqSvjNY5cf3kc
   uZTkKSCv6408TpG3yTPRJAT1/sWl0nRWTjkeXisoxhDqd6Grt+qn2/Fra
   gcY0nlnuXxRr9ubYIiAgz9I+Ze/gzElsLu+IZR0XcDnU6NlPWovwfRqqk
   baxliH7vu93vjwSHPuW/Ivczl5jP9USx9kVGGaqqVcJ6d9cSxqbknXYe/
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10837"; a="359062374"
X-IronPort-AV: E=Sophos;i="6.02,156,1688454000"; 
   d="scan'208";a="359062374"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
  by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Sep 2023 05:51:45 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10837"; a="861057577"
X-IronPort-AV: E=Sophos;i="6.02,156,1688454000"; 
   d="scan'208";a="861057577"
Received: from turnipsi.fi.intel.com (HELO kekkonen.fi.intel.com) ([10.237.72.44])
  by fmsmga002-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Sep 2023 05:51:42 -0700
Received: from svinhufvud.ger.corp.intel.com (localhost [IPv6:::1])
        by kekkonen.fi.intel.com (Postfix) with ESMTP id 08DF711F854;
        Mon, 18 Sep 2023 15:51:38 +0300 (EEST)
From:   Sakari Ailus <sakari.ailus@linux.intel.com>
To:     linux-media@vger.kernel.org
Cc:     laurent.pinchart@ideasonboard.com,
        Tianshu Qiu <tian.shu.qiu@intel.com>,
        Bingbu Cao <bingbu.cao@intel.com>,
        Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>,
        Jacopo Mondi <jacopo+renesas@jmondi.org>,
        Rui Miguel Silva <rmfrfs@gmail.com>,
        Martin Kepplinger <martink@posteo.de>
Subject: [PATCH v2 00/12] Small fixes and cleanups (ov2740 and ccs)
Date:   Mon, 18 Sep 2023 15:51:26 +0300
Message-Id: <20230918125138.90002-1-sakari.ailus@linux.intel.com>
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

since v1:

- Add a comment on ov2740 active state patch on serialising sensor access.

- Improved commit message of ov2740 patch enabling runtime PM earlier.

- Added patches for printing and zeroing frame descriptor, (debug)
  printing of frame descriptor, switching ccs to init_cfg and sub-device
  state and checking pad flag validity.

Sakari Ailus (12):
  media: Documentation: Align numbered list, make it a proper ReST
  media: ccs: Fix driver quirk struct documentation
  media: ccs: Correctly initialise try compose rectangle
  media: ccs: Correct error handling in ccs_register_subdev
  media: ccs: Switch to init_cfg
  media: ccs: Use sub-device active state
  media: ov2740: Enable runtime PM before registering the async subdev
  media: ov2740: Use sub-device active state
  media: ov2740: Return -EPROBE_DEFER if no endpoint is found
  media: v4l: subdev: Clear frame descriptor before get_frame_desc
  media: v4l: subdev: Print debug information on frame descriptor
  media: mc: Check pad flag validity

 .../userspace-api/media/v4l/dev-subdev.rst    |  49 ++-
 drivers/media/i2c/ccs/ccs-core.c              | 301 +++++++-----------
 drivers/media/i2c/ccs/ccs-quirk.h             |   4 +-
 drivers/media/i2c/ccs/ccs.h                   |   4 +-
 drivers/media/i2c/ds90ub913.c                 |   2 -
 drivers/media/i2c/ds90ub953.c                 |   2 -
 drivers/media/i2c/ds90ub960.c                 |   2 -
 drivers/media/i2c/ov2740.c                    | 138 ++++----
 drivers/media/mc/mc-entity.c                  |  20 +-
 drivers/media/platform/nxp/imx-mipi-csis.c    |   2 -
 drivers/media/v4l2-core/v4l2-subdev.c         |  42 +++
 11 files changed, 259 insertions(+), 307 deletions(-)

-- 
2.39.2

