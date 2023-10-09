Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id D7DCD7BDAA3
	for <lists+linux-media@lfdr.de>; Mon,  9 Oct 2023 14:05:37 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1346440AbjJIMFg (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 9 Oct 2023 08:05:36 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58542 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1346444AbjJIMFf (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Mon, 9 Oct 2023 08:05:35 -0400
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 03123DF
        for <linux-media@vger.kernel.org>; Mon,  9 Oct 2023 05:05:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1696853135; x=1728389135;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=3OQFNuWLtfOFKUtNFmDLECfI4WsnhFyhE9Din3UW2gw=;
  b=TqknPuzn4htF+o0rT+P4ob/A70CRy/c8XpO6yAy/VL66LCOiYWN5KWBW
   42nydT1C4H0lASSOKdvtPDqScl5UyqF9SXUjNej9uuctmZbqiRTZYyli2
   ZWFrFvvgUrIAvhJYu+fOmn7DV2guHz81rHjHnD4nXSZQdyS2BD2mQsdZm
   LyvbLSgzEcr03wLEphFP4k+HsqV0QvQz/bNng+JKgDNTZIrtg/fcyfHt5
   sJyWE9emppks98NI1Vzr0dSkzM68iOojM2yztfxR22Q55csBICNmHBlMg
   h0hlO8/p9kdWmxoeWUIUdeJz8n3dZ8f3sbwLtnrLy62MJ2YJ2yEWSV3dR
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10858"; a="2725497"
X-IronPort-AV: E=Sophos;i="6.03,210,1694761200"; 
   d="scan'208";a="2725497"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
  by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Oct 2023 05:05:33 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10858"; a="869216193"
X-IronPort-AV: E=Sophos;i="6.03,210,1694761200"; 
   d="scan'208";a="869216193"
Received: from turnipsi.fi.intel.com (HELO kekkonen.fi.intel.com) ([10.237.72.44])
  by fmsmga002-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Oct 2023 05:05:29 -0700
Received: from svinhufvud.ger.corp.intel.com (localhost [IPv6:::1])
        by kekkonen.fi.intel.com (Postfix) with ESMTP id 79DBC11F835;
        Mon,  9 Oct 2023 15:05:26 +0300 (EEST)
From:   Sakari Ailus <sakari.ailus@linux.intel.com>
To:     linux-media@vger.kernel.org
Cc:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        tomi.valkeinen@ideasonboard.com
Subject: [PATCH 0/4] V4L2 sub-device active state helper, CCS fixes
Date:   Mon,  9 Oct 2023 15:05:21 +0300
Message-Id: <20231009120525.202957-1-sakari.ailus@linux.intel.com>
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

Sakari Ailus (4):
  media: v4l: subdev: Set sub-device active state earlier
  media: v4l: subdev: Add a helper to tell if a sub-device state is
    active
  media: ccs: Rework initialising sub-device state
  media: ccs: Fix a (harmless) lockdep warning

 drivers/media/i2c/ccs/ccs-core.c      | 64 ++++++++++++++++++---------
 drivers/media/v4l2-core/v4l2-subdev.c | 14 +++---
 include/media/v4l2-subdev.h           | 11 ++++-
 3 files changed, 61 insertions(+), 28 deletions(-)

-- 
2.39.2

