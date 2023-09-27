Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 2EE577AFB7E
	for <lists+linux-media@lfdr.de>; Wed, 27 Sep 2023 08:57:52 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229906AbjI0G5v (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 27 Sep 2023 02:57:51 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55964 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229616AbjI0G5u (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 27 Sep 2023 02:57:50 -0400
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.20])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3A9F9D6
        for <linux-media@vger.kernel.org>; Tue, 26 Sep 2023 23:57:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1695797868; x=1727333868;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=iWg7aD3m+VLtkq7aocKk8jfRUoDlW0/hhZWCrc6j0lc=;
  b=UxmPzg7CaXGnxu/GNP1AA5JC3n97TwThXTD6yk1eajUg2XE9BnkabYmm
   vygooQi+XEd6YWAPGWrmS0NmuXFv0LlYRU2VzPs9+zf8FugNdLL+cLiZS
   EK5OWdhF9sWCMeIATuLeMVdg1bpWRagIlOvxjwz0LfmPazHK8fxsxEzwR
   dqcAmIdU8M7bbJj6hLE5mrHnzqM6UjHBkOCVOPAuPsq8BiVCw3yjKFgV3
   ef/8TNEAILDvW1amJTMVQ5YJogS6qstrRWPVBlvHloEyTXvtVcfSxhdW+
   1LX58XafzH24S1B5+4oaVwZtYkjDzhMYJNBd+VYcP+gqMNwAXeXjdWan4
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10845"; a="372083289"
X-IronPort-AV: E=Sophos;i="6.03,179,1694761200"; 
   d="scan'208";a="372083289"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
  by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Sep 2023 23:57:46 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10845"; a="892489850"
X-IronPort-AV: E=Sophos;i="6.03,179,1694761200"; 
   d="scan'208";a="892489850"
Received: from turnipsi.fi.intel.com (HELO kekkonen.fi.intel.com) ([10.237.72.44])
  by fmsmga001-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Sep 2023 23:56:37 -0700
Received: from svinhufvud.ger.corp.intel.com (localhost [IPv6:::1])
        by kekkonen.fi.intel.com (Postfix) with ESMTP id 626381202BB;
        Wed, 27 Sep 2023 09:41:22 +0300 (EEST)
From:   Sakari Ailus <sakari.ailus@linux.intel.com>
To:     linux-media@vger.kernel.org
Cc:     laurent.pinchart@ideasonboard.com,
        Tianshu Qiu <tian.shu.qiu@intel.com>,
        Bingbu Cao <bingbu.cao@intel.com>,
        Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>,
        Jacopo Mondi <jacopo+renesas@jmondi.org>,
        Rui Miguel Silva <rmfrfs@gmail.com>,
        Martin Kepplinger <martink@posteo.de>
Subject: [PATCH v6 00/13] Small fixes and cleanups (ov2740 and ccs)
Date:   Wed, 27 Sep 2023 09:41:07 +0300
Message-Id: <20230927064120.367561-1-sakari.ailus@linux.intel.com>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.0 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,RCVD_IN_DNSWL_BLOCKED,
        RCVD_IN_MSPIKE_H3,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_NONE
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi folks,

This small set contains fixes and cleanups, mainly for the ccs and ov2740
drivers. I wrote these while working on the metadata set, but these could
and should be merged earlier.

since v5:

- Send right patches (was v3 + an additional patch)!

since v4:

- Fix CCS driver active state patch --- media entity was initialised too
  late.

- Rebase on Laurent's ov2740 cleanups.

- Add a new patch for MIPI CSI-2 long packet types.

since v3:

- Don't print frame descriptor entry flags as strings but in a numeric
  form.

- Add a WARN_ON() for string truncation in printing the frame descriptor.

- Use 0 flag in printing hexadecimal values in frame descriptor instead of
  specifying precision.

- Add curly braces around a loop (11th patch).

since v2:

- Wrap init_cfg callback long line.

- Remove "pad_" from variable names in ccs_init_cfg.

- Fix media_entity_pads_init() error handling bug (was introduced in the
  last patch).

- Print frame descriptor in less verbose way.

since v1:

- Add a comment on ov2740 active state patch on serialising sensor access.

- Improved commit message of ov2740 patch enabling runtime PM earlier.

- Added patches for printing and zeroing frame descriptor, (debug)
  printing of frame descriptor, switching ccs to init_cfg and sub-device
  state and checking pad flag validity.

Sakari Ailus (13):
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
  media: Add MIPI CSI-2 generic long packet type definition

 .../userspace-api/media/v4l/dev-subdev.rst    |  49 ++-
 drivers/media/i2c/ccs/ccs-core.c              | 320 +++++++-----------
 drivers/media/i2c/ccs/ccs-quirk.h             |   4 +-
 drivers/media/i2c/ccs/ccs.h                   |   4 +-
 drivers/media/i2c/ds90ub913.c                 |   2 -
 drivers/media/i2c/ds90ub953.c                 |   2 -
 drivers/media/i2c/ds90ub960.c                 |   2 -
 drivers/media/i2c/ov2740.c                    | 125 +++----
 drivers/media/mc/mc-entity.c                  |  15 +-
 drivers/media/platform/nxp/imx-mipi-csis.c    |   2 -
 drivers/media/v4l2-core/v4l2-subdev.c         |  38 +++
 include/media/mipi-csi2.h                     |   1 +
 12 files changed, 256 insertions(+), 308 deletions(-)

-- 
2.39.2

