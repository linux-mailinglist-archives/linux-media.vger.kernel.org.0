Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 769407AFADD
	for <lists+linux-media@lfdr.de>; Wed, 27 Sep 2023 08:18:53 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229875AbjI0GSv (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 27 Sep 2023 02:18:51 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59810 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229712AbjI0GSj (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 27 Sep 2023 02:18:39 -0400
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.115])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 59FD4121
        for <linux-media@vger.kernel.org>; Tue, 26 Sep 2023 23:18:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1695795518; x=1727331518;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=wevRX/bYUSaVoQO8/LxHun/pL180ucUORwfhJ+HNxLc=;
  b=gqh9h6SdxfDCdPkxYxe26x8OyPb8rbdL64WFwpWxgQlwAGU9L8HMVhmf
   PHcliBVBUVl+9bzK3FIjKdb5toT+b2Wm0t7572y+yOldabaM0X1DOhhVB
   icRSAsQ2YEsmcx+wH2sHo8xYKAoTRDP9fRtDXoyAeK8uRh3WDREhty15U
   LZ3ts14v0nLXnvqHZ0qBGenvskFVMHIQFKkg1RFSrWFTAU1mqIgseo5uC
   gDOjAo16DBHI+A5nGTCpvP+mnbf/u/jtClfao/ipRjQQrP0scXtMcneBE
   RTMEIpvp61Keeqh0rwNmNOCCUrhfggKi7zMwxLSj5xahMMDLr1eZ3UdTP
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10845"; a="381641096"
X-IronPort-AV: E=Sophos;i="6.03,179,1694761200"; 
   d="scan'208";a="381641096"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
  by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Sep 2023 23:18:37 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10845"; a="742598576"
X-IronPort-AV: E=Sophos;i="6.03,179,1694761200"; 
   d="scan'208";a="742598576"
Received: from turnipsi.fi.intel.com (HELO kekkonen.fi.intel.com) ([10.237.72.44])
  by orsmga007-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Sep 2023 23:18:35 -0700
Received: from svinhufvud.ger.corp.intel.com (localhost [IPv6:::1])
        by kekkonen.fi.intel.com (Postfix) with ESMTP id A106F1202BB;
        Wed, 27 Sep 2023 09:18:31 +0300 (EEST)
From:   Sakari Ailus <sakari.ailus@linux.intel.com>
To:     linux-media@vger.kernel.org
Cc:     laurent.pinchart@ideasonboard.com,
        Tianshu Qiu <tian.shu.qiu@intel.com>,
        Bingbu Cao <bingbu.cao@intel.com>,
        Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>,
        Jacopo Mondi <jacopo+renesas@jmondi.org>,
        Rui Miguel Silva <rmfrfs@gmail.com>,
        Martin Kepplinger <martink@posteo.de>
Subject: [PATCH v5 00/13] Small fixes and cleanups (ov2740 and ccs)
Date:   Wed, 27 Sep 2023 09:18:16 +0300
Message-Id: <20230927061829.366107-1-sakari.ailus@linux.intel.com>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.0 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,RCVD_IN_DNSWL_BLOCKED,
        SPF_HELO_NONE,SPF_NONE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi folks,

This small set contains fixes and cleanups, mainly for the ccs and ov2740
drivers. I wrote these while working on the metadata set, but these could
and should be merged earlier.

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
 drivers/media/i2c/ccs/ccs-core.c              | 302 +++++++-----------
 drivers/media/i2c/ccs/ccs-quirk.h             |   4 +-
 drivers/media/i2c/ccs/ccs.h                   |   4 +-
 drivers/media/i2c/ds90ub913.c                 |   2 -
 drivers/media/i2c/ds90ub953.c                 |   2 -
 drivers/media/i2c/ds90ub960.c                 |   2 -
 drivers/media/i2c/ov2740.c                    | 125 +++-----
 drivers/media/mc/mc-entity.c                  |  15 +-
 drivers/media/platform/nxp/imx-mipi-csis.c    |   2 -
 drivers/media/v4l2-core/v4l2-subdev.c         |  38 +++
 include/media/mipi-csi2.h                     |   1 +
 12 files changed, 245 insertions(+), 301 deletions(-)

-- 
2.39.2

