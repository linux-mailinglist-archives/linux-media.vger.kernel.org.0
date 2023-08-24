Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 071B1786B7F
	for <lists+linux-media@lfdr.de>; Thu, 24 Aug 2023 11:22:23 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S240641AbjHXJVv (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 24 Aug 2023 05:21:51 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36134 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S240658AbjHXJVX (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 24 Aug 2023 05:21:23 -0400
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.31])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1757419A8
        for <linux-media@vger.kernel.org>; Thu, 24 Aug 2023 02:21:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1692868882; x=1724404882;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=FZbtXylU6y2odnUF/pGe9Z8+2LA5gjecDS84E04EayE=;
  b=Qf0kXa+8PQch359bRUNYtZ8hW3AYc83gXdM4M4MSoh92qH7CRTWhxVh2
   4Ah7NrOK1nOV1pnGVhugmrkZjD+WZB9wnw5qf9Wuig/8jMifpJe6kwHxH
   +OHzUrVFTNRsQUclU2s/hKWbxLUoV3SB/5A3kslHHXaU4yEr1tP1DFaiF
   0tTp8UvDc84BXXaO3yrfrpCnbUjKLUMIKGXAWShQkkbnX7agmjRAjf9pl
   ikNLgN0cOAOKU7zVMQjaELmyVbXkZFYRV5AidXmccCmIgSdramOSeQ2W5
   SLaywyR2b/09hX+JU6LBGoFyenO5/Med2mlT4jcggcF6AkCLWNCLuZyo1
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10811"; a="438325595"
X-IronPort-AV: E=Sophos;i="6.01,195,1684825200"; 
   d="scan'208";a="438325595"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
  by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Aug 2023 02:21:16 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10811"; a="910837467"
X-IronPort-AV: E=Sophos;i="6.01,195,1684825200"; 
   d="scan'208";a="910837467"
Received: from turnipsi.fi.intel.com (HELO kekkonen.fi.intel.com) ([10.237.72.44])
  by orsmga005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Aug 2023 02:21:15 -0700
Received: from punajuuri.localdomain (punajuuri.localdomain [192.168.240.130])
        by kekkonen.fi.intel.com (Postfix) with ESMTP id E4D7B11F9B6;
        Thu, 24 Aug 2023 12:14:57 +0300 (EEST)
Received: from sailus by punajuuri.localdomain with local (Exim 4.96)
        (envelope-from <sakari.ailus@linux.intel.com>)
        id 1qZ6Px-00GIGl-0D;
        Thu, 24 Aug 2023 12:14:17 +0300
From:   Sakari Ailus <sakari.ailus@linux.intel.com>
To:     linux-media@vger.kernel.org
Cc:     laurent.pinchart@ideasonboard.com, tomi.valkeinen@ideasonboard.com,
        jacopo.mondi@ideasonboard.com, hongju.wang@intel.com
Subject: [yavta RFC 0/2] Generic line based metadata support
Date:   Thu, 24 Aug 2023 12:14:05 +0300
Message-Id: <20230824091407.3883461-1-sakari.ailus@linux.intel.com>
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

This set adds the generic line based metadata support for yavta. Untested,
hence posting this as RFC.

Sakari Ailus (2):
  Update kernel headers
  Add support for generic metadata formats

 include/linux/v4l2-common.h   |   39 -
 include/linux/v4l2-controls.h | 1545 ++++++++++++++++++++++++++++++++-
 include/linux/videodev2.h     |  102 ++-
 yavta.c                       |   10 +
 4 files changed, 1611 insertions(+), 85 deletions(-)

-- 
2.39.2

