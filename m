Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 48C6E7D7E26
	for <lists+linux-media@lfdr.de>; Thu, 26 Oct 2023 10:13:57 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231304AbjJZIN5 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 26 Oct 2023 04:13:57 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48204 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1344474AbjJZINy (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 26 Oct 2023 04:13:54 -0400
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.126])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4C274DE
        for <linux-media@vger.kernel.org>; Thu, 26 Oct 2023 01:13:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1698308032; x=1729844032;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=wiGAOR6Naxj0g74qYCIHQYY1Hy0r4UEsiFflS3Q5uAE=;
  b=m9tXtu/Po+csE7uS8SK8QVPsHqb82qJeA0TeoIB9OQqsn8ZSEGMvBTfw
   q6cAKzPeZDWcUxJFUWAYYN62Vv6GYjK15KsQlxnZlIl6bQdrSLkBTBR4y
   Coltw31KmTS6jx/Wkr7gLR5eZ76TvcaHzb8k6V8FAJrSH76F+E4AZPwUo
   aLKcOW3SzGoQGeD3ch1W2bPBqFfZ3Vn63gYInny+2uO0ZlDnlgB4xqV4o
   BgjUPkU0UhPKtjb7aYxET6CAUwO/MbK3E0dVbBOLKlPDMhF92AaQq89KE
   XWUq8JlFpyS6M/O64jy/xsfoqlXLLx92sqZ1mHK5aC/ScaJ419Z/pMzRF
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10874"; a="372530594"
X-IronPort-AV: E=Sophos;i="6.03,253,1694761200"; 
   d="scan'208";a="372530594"
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
  by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Oct 2023 01:13:51 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10874"; a="829539001"
X-IronPort-AV: E=Sophos;i="6.03,253,1694761200"; 
   d="scan'208";a="829539001"
Received: from turnipsi.fi.intel.com (HELO kekkonen.fi.intel.com) ([10.237.72.44])
  by fmsmga004-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Oct 2023 01:13:49 -0700
Received: from svinhufvud.ger.corp.intel.com (localhost [IPv6:::1])
        by kekkonen.fi.intel.com (Postfix) with ESMTP id 7FF1611FAF5;
        Thu, 26 Oct 2023 11:13:46 +0300 (EEST)
From:   Sakari Ailus <sakari.ailus@linux.intel.com>
To:     linux-media@vger.kernel.org
Cc:     wentong.wu@intel.com, bingbu.cao@intel.com
Subject: [PATCH 0/6] IVSC CSI fwnode parsing fixes and cleanups
Date:   Thu, 26 Oct 2023 11:13:40 +0300
Message-Id: <20231026081346.958238-1-sakari.ailus@linux.intel.com>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.0 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,SPF_HELO_NONE,SPF_NONE,
        URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi folks,

This set addresses issues in graph endpoint parsing as well as fixes error
handling and cleans up things in general.

The main issue there was the IVSC CSI driver was parsing the endpoints of
another device while ignoring its own endpoint on port 1.

Sakari Ailus (6):
  media: ivsc: csi: Don't parse remote endpoints
  media: ivsc: csi: Clean up V4L2 async notifier on error
  media: ivsc: csi: Clean up notifier set-up
  media: ivsc: csi: Clean up parsing firmware and setting up async
    notifier
  media: ivsc: csi: Don't mask v4l2_fwnode_endpoint_parse return value
  media: ivsc: csi: Check number of lanes on source, too

 drivers/media/pci/intel/ivsc/mei_csi.c | 65 ++++++++++++++++----------
 1 file changed, 41 insertions(+), 24 deletions(-)

-- 
2.39.2

