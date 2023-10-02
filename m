Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id EC48B7B50AA
	for <lists+linux-media@lfdr.de>; Mon,  2 Oct 2023 12:56:07 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236522AbjJBK4I (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 2 Oct 2023 06:56:08 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39552 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236192AbjJBK4H (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Mon, 2 Oct 2023 06:56:07 -0400
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.93])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B4217BD
        for <linux-media@vger.kernel.org>; Mon,  2 Oct 2023 03:56:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1696244164; x=1727780164;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=Bn9awa1RhEHIMcD7o2QkN7wenlx0iCRfDqPJXi6Sqbg=;
  b=AWF2noj3c4/sIRQILhGymk3hgn6KA3sEbtOYN9GCcNC9WEpYXM5mAiOD
   aVQxziW3X5BjPHsnONAY/FaOaLpVgi4fE+hUFhgHTQnkvNCU9HomwqvuB
   c072+V7d41+/wITIUQV2Q/bMnXv+fp2pTianxx7B10Bfp1A4hGmxj0PmI
   3UOmdN8fD/XFveW0kAVXjJzXV35QfpGpK+jxM7y9/Oht2zPUXB9zauzfS
   0HaForj0xpHbU8Ux2YUIlgcXgV4UDEO0e2uncFe5RrZyfu4dfw7t6UUhA
   m87QY3XO1vLcqXPc09nJXhGVY3a/B77wqRz9PdaAJ8JxQOMIVM8EcyK6U
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10850"; a="379896288"
X-IronPort-AV: E=Sophos;i="6.03,194,1694761200"; 
   d="scan'208";a="379896288"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
  by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Oct 2023 03:56:04 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10850"; a="816251133"
X-IronPort-AV: E=Sophos;i="6.03,194,1694761200"; 
   d="scan'208";a="816251133"
Received: from turnipsi.fi.intel.com (HELO kekkonen.fi.intel.com) ([10.237.72.44])
  by fmsmga008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Oct 2023 03:56:02 -0700
Received: from svinhufvud.ger.corp.intel.com (localhost [IPv6:::1])
        by kekkonen.fi.intel.com (Postfix) with ESMTP id D6F9B11F94F;
        Mon,  2 Oct 2023 13:55:57 +0300 (EEST)
From:   Sakari Ailus <sakari.ailus@linux.intel.com>
To:     linux-media@vger.kernel.org
Cc:     laurent.pinchart@ideasonboard.com,
        Tianshu Qiu <tian.shu.qiu@intel.com>,
        Bingbu Cao <bingbu.cao@intel.com>,
        Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>,
        Jacopo Mondi <jacopo+renesas@jmondi.org>,
        Rui Miguel Silva <rmfrfs@gmail.com>,
        Martin Kepplinger <martink@posteo.de>
Subject: [PATCH v7 00/19] Small fixes and cleanups (ov2740 and ccs)
Date:   Mon,  2 Oct 2023 13:55:38 +0300
Message-Id: <20231002105557.28972-1-sakari.ailus@linux.intel.com>
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

since v6:

- New patch: In scope of the CCS driver, revert the patch moving CCS to
  use pm_runtime_get_and_resume().

- New patch: Drop s_stream re-entrancy in CCS driver.

- New patch: Rename ccs_create_subdev() as ccs_init_subdev.

- New patch: CCS driver rework: move sub-device initialisation earlier in
  probe to address initialisation ordering issues later on in embedded
  data support. This introduces minor changes to the patch adding
  sub-device state support.

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

Sakari Ailus (19):
  media: Documentation: Align numbered list, make it a proper ReST
  media: ccs: Fix driver quirk struct documentation
  media: ccs: Correctly initialise try compose rectangle
  media: ccs: Correct error handling in ccs_register_subdev
  media: ccs: Switch to init_cfg
  media: ccs: Rename ccs_create_subdev as ccs_init_subdev
  media: ccs: Move media_entity_pads_init to init from register
  media: ccs: Obtain media bus formats before initialising up
    sub-devices
  media: ccs: Use sub-device active state
  media: ccs: Partially revert "media: i2c: Use
    pm_runtime_resume_and_get()"
  media: ccs: Drop re-entrant s_stream support
  media: ov2740: Enable runtime PM before registering the async subdev
  media: ov2740: Use sub-device active state
  media: ov2740: Return -EPROBE_DEFER if no endpoint is found
  media: v4l: subdev: Clear frame descriptor before get_frame_desc
  media: v4l: subdev: Print debug information on frame descriptor
  media: mc: Check pad flag validity
  media: Add MIPI CSI-2 generic long packet type definition
  media: Documentation: Split camera sensor documentation

 .../driver-api/media/camera-sensor.rst        | 131 ++----
 .../media/drivers/camera-sensor.rst           | 104 +++++
 .../userspace-api/media/drivers/index.rst     |   1 +
 .../userspace-api/media/v4l/control.rst       |   4 +
 .../userspace-api/media/v4l/dev-subdev.rst    |  49 ++-
 drivers/media/i2c/ccs/ccs-core.c              | 374 +++++++-----------
 drivers/media/i2c/ccs/ccs-quirk.h             |   4 +-
 drivers/media/i2c/ccs/ccs.h                   |   4 +-
 drivers/media/i2c/ds90ub913.c                 |   2 -
 drivers/media/i2c/ds90ub953.c                 |   2 -
 drivers/media/i2c/ds90ub960.c                 |   2 -
 drivers/media/i2c/ov2740.c                    | 125 +++---
 drivers/media/mc/mc-entity.c                  |  15 +-
 drivers/media/platform/nxp/imx-mipi-csis.c    |   2 -
 drivers/media/v4l2-core/v4l2-subdev.c         |  38 ++
 include/media/mipi-csi2.h                     |   1 +
 16 files changed, 422 insertions(+), 436 deletions(-)
 create mode 100644 Documentation/userspace-api/media/drivers/camera-sensor.rst

-- 
2.39.2

