Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 751C57BEE16
	for <lists+linux-media@lfdr.de>; Tue, 10 Oct 2023 00:09:15 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1378754AbjJIWJO (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 9 Oct 2023 18:09:14 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34424 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233660AbjJIWJM (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Mon, 9 Oct 2023 18:09:12 -0400
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.65])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 97606AF
        for <linux-media@vger.kernel.org>; Mon,  9 Oct 2023 15:09:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1696889351; x=1728425351;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=Js9IM43IMH86U0iBXKZaYjCzhAWh8Ej0qhAEdWNu8c8=;
  b=fpxWZ0+NAuZG6vWXjNUy4glQCFttyuH8TCVGSxcEzXQQibiMrSr04309
   hRzU6DQSiKsyNz39aMZC0nIuzQoWt3dz33HdhtUoFhsBw0n/m57ygiQ+h
   5eiALwR/iffxm6+KjylDcmoeXcVj6TDjkRlTSxkYGPBTrrRvIIykYgZET
   ATRe3AYS6bmgF5UQ9Rh6OUj5yULzIwl1sv8N6JKEHRKf9/yOuWw2f7zbX
   0ML/PXPdywp8zvEdZRrkAdVWZ2SyRYgW+R/AeOsO1HLMyhwA72/oFcPck
   x6HSoJHwBrq64AcSvGlRR8ykjrQejKYbFOcFoF/Inx2Z/IbDP+Ke9KF3D
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10858"; a="388123371"
X-IronPort-AV: E=Sophos;i="6.03,211,1694761200"; 
   d="scan'208";a="388123371"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
  by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Oct 2023 15:09:11 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10858"; a="782647383"
X-IronPort-AV: E=Sophos;i="6.03,211,1694761200"; 
   d="scan'208";a="782647383"
Received: from turnipsi.fi.intel.com (HELO kekkonen.fi.intel.com) ([10.237.72.44])
  by orsmga008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Oct 2023 15:09:10 -0700
Received: from svinhufvud.ger.corp.intel.com (localhost [IPv6:::1])
        by kekkonen.fi.intel.com (Postfix) with ESMTP id E69E01206C3;
        Tue, 10 Oct 2023 01:09:06 +0300 (EEST)
From:   Sakari Ailus <sakari.ailus@linux.intel.com>
To:     linux-media@vger.kernel.org
Cc:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        tomi.valkeinen@ideasonboard.com
Subject: [PATCH v2 0/4] V4L2 sub-device active state helper, CCS fixes
Date:   Tue, 10 Oct 2023 01:09:02 +0300
Message-Id: <20231009220906.221303-1-sakari.ailus@linux.intel.com>
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

This set includes a helper for working with V4L2 sub-device active state as
well as a fix for the CCS driver sub-device state patch.

since v1:

- There were other drivers using __v4l2_subdev_state_alloc(). Ouch. Change
  those users as well. Note that this function should not be used in
  drivers, hence API niceness is not a high priority.

Sakari Ailus (4):
  media: v4l: subdev: Set sub-device active state earlier
  media: v4l: subdev: Add a helper to tell if a sub-device state is
    active
  media: ccs: Rework initialising sub-device state
  media: ccs: Fix a (harmless) lockdep warning

 drivers/media/i2c/ccs/ccs-core.c              | 64 ++++++++++++-------
 .../platform/renesas/rcar-vin/rcar-v4l2.c     |  3 +-
 .../media/platform/renesas/vsp1/vsp1_entity.c |  3 +-
 drivers/media/v4l2-core/v4l2-subdev.c         | 14 ++--
 drivers/staging/media/tegra-video/vi.c        |  2 +-
 include/media/v4l2-subdev.h                   | 11 +++-
 6 files changed, 66 insertions(+), 31 deletions(-)

-- 
2.39.2

