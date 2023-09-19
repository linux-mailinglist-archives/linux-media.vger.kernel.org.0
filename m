Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 7D08E7A6294
	for <lists+linux-media@lfdr.de>; Tue, 19 Sep 2023 14:19:15 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231778AbjISMTR (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 19 Sep 2023 08:19:17 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37668 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231868AbjISMTG (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 19 Sep 2023 08:19:06 -0400
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.43])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1C24D2D53
        for <linux-media@vger.kernel.org>; Tue, 19 Sep 2023 05:17:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1695125868; x=1726661868;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=Um6kMrHOKiR9rkZWnhZFjFzdhNbYVH2RsIHiaNtNm10=;
  b=H0XgEqTeGSRWIxEsa+YuTK5S7X9lXtOJ+o1iHupQ45gtdhM1r3DtBzor
   a7BC0PvM2kt555kwXg1vGpfDmGiUb9TVRt33WTuQE2uf9Fj7//bCD+YCJ
   kCNaoBqD4suom7m1hvQNtm0qf7rTFxYPTDabrqOhAT67eeM+eIDn69BEj
   /qHPWohQvjTBOgiVsvRrs4o2rt+LhMFIqDKm+KFp4n/SYo0NsxItFWUxW
   lXkqAsz4UMb/Cy0qSUY08KtSOl/qEOCIPNYMpovRG3PCSD1VC5AAumg1E
   XibRpkeOIRnXmW5aV0zdegDyoGN1WMwMjvurKATkPHILoCmqsve9WrPWi
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10837"; a="466250939"
X-IronPort-AV: E=Sophos;i="6.02,159,1688454000"; 
   d="scan'208";a="466250939"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
  by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Sep 2023 05:17:35 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10837"; a="811701449"
X-IronPort-AV: E=Sophos;i="6.02,159,1688454000"; 
   d="scan'208";a="811701449"
Received: from turnipsi.fi.intel.com (HELO kekkonen.fi.intel.com) ([10.237.72.44])
  by fmsmga008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Sep 2023 05:17:33 -0700
Received: from svinhufvud.ger.corp.intel.com (localhost [IPv6:::1])
        by kekkonen.fi.intel.com (Postfix) with ESMTP id DBF95120BE5;
        Tue, 19 Sep 2023 15:17:28 +0300 (EEST)
From:   Sakari Ailus <sakari.ailus@linux.intel.com>
To:     linux-media@vger.kernel.org
Cc:     laurent.pinchart@ideasonboard.com,
        Tianshu Qiu <tian.shu.qiu@intel.com>,
        Bingbu Cao <bingbu.cao@intel.com>,
        Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>,
        Jacopo Mondi <jacopo+renesas@jmondi.org>,
        Rui Miguel Silva <rmfrfs@gmail.com>,
        Martin Kepplinger <martink@posteo.de>
Subject: [PATCH v3 00/12] Small fixes and cleanups (ov2740 and ccs)
Date:   Tue, 19 Sep 2023 15:17:16 +0300
Message-Id: <20230919121728.126781-1-sakari.ailus@linux.intel.com>
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
 drivers/media/i2c/ccs/ccs-core.c              | 302 +++++++-----------
 drivers/media/i2c/ccs/ccs-quirk.h             |   4 +-
 drivers/media/i2c/ccs/ccs.h                   |   4 +-
 drivers/media/i2c/ds90ub913.c                 |   2 -
 drivers/media/i2c/ds90ub953.c                 |   2 -
 drivers/media/i2c/ds90ub960.c                 |   2 -
 drivers/media/i2c/ov2740.c                    | 138 ++++----
 drivers/media/mc/mc-entity.c                  |  14 +-
 drivers/media/platform/nxp/imx-mipi-csis.c    |   2 -
 drivers/media/v4l2-core/v4l2-subdev.c         |  39 +++
 11 files changed, 252 insertions(+), 306 deletions(-)

-- 
2.39.2

