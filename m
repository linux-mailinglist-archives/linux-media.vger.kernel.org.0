Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 61A167BFB78
	for <lists+linux-media@lfdr.de>; Tue, 10 Oct 2023 14:32:25 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231246AbjJJMcY (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 10 Oct 2023 08:32:24 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52086 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230014AbjJJMcX (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 10 Oct 2023 08:32:23 -0400
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B735599
        for <linux-media@vger.kernel.org>; Tue, 10 Oct 2023 05:32:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1696941142; x=1728477142;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=c5t4Ci2rCjqOxONUlttxTE3bZlUa2OENRbhQoQqvpRw=;
  b=FgZw1leiDx7kMw4+ZiZ0X5sv4+PnGJJ+akoMsqWI4A9R1KkEYj9C2Aio
   DXBuSOo0sx+DQ39x9ExDA65sjI78U/CbZ0Q0p1HYboIDWtafeVbH7owGd
   wQ95FKc5S3pN5QCIBb/TAYk9mnOT65JQsERmTutf6oQrLkGRcG7gL7SGo
   xUTCKrmCzDr8T5fZpzS+s/EmquoLY7R7FG2SyqqW6daZ2lgf3RgnR71P0
   jJ6tD8kAt54IR2SckHAaUxH2BPLfsQbvkqo81VDaPzAKtuhnIlSe/feKA
   g6Vs/ZqGDQTmn4/TE1oNe8k4arNDFn+9PGCoULvpFjsjSWwXm7sCMAWGX
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10859"; a="2971088"
X-IronPort-AV: E=Sophos;i="6.03,212,1694761200"; 
   d="scan'208";a="2971088"
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
  by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Oct 2023 05:32:22 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10859"; a="823761681"
X-IronPort-AV: E=Sophos;i="6.03,212,1694761200"; 
   d="scan'208";a="823761681"
Received: from turnipsi.fi.intel.com (HELO kekkonen.fi.intel.com) ([10.237.72.44])
  by fmsmga004-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Oct 2023 05:32:20 -0700
Received: from svinhufvud.ger.corp.intel.com (localhost [IPv6:::1])
        by kekkonen.fi.intel.com (Postfix) with ESMTP id C830311F835;
        Tue, 10 Oct 2023 15:32:16 +0300 (EEST)
From:   Sakari Ailus <sakari.ailus@linux.intel.com>
To:     linux-media@vger.kernel.org
Cc:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        tomi.valkeinen@ideasonboard.com
Subject: [PATCH v3 0/2] CCS active state fixes
Date:   Tue, 10 Oct 2023 15:32:03 +0300
Message-Id: <20231010123205.250860-1-sakari.ailus@linux.intel.com>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.0 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,RCVD_IN_DNSWL_BLOCKED,
        SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED autolearn=ham autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi folks,

This set new includes fixes for the the CCS driver sub-device state patch.

since v2:

- Avoid framework changes. As this is a fix, merging this soon is
  important. Let's discuss framework improvements later on. 

since v1:

- There were other drivers using __v4l2_subdev_state_alloc(). Ouch. Change
  those users as well. Note that this function should not be used in
  drivers, hence API niceness is not a high priority.

Sakari Ailus (2):
  media: ccs: Rework initialising sub-device state
  media: ccs: Fix a (harmless) lockdep warning

 drivers/media/i2c/ccs/ccs-core.c | 62 ++++++++++++++++++++------------
 1 file changed, 40 insertions(+), 22 deletions(-)

-- 
2.39.2

