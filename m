Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 645C876A9CB
	for <lists+linux-media@lfdr.de>; Tue,  1 Aug 2023 09:15:59 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230102AbjHAHP5 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 1 Aug 2023 03:15:57 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38526 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229505AbjHAHP4 (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Tue, 1 Aug 2023 03:15:56 -0400
Received: from mgamail.intel.com (unknown [134.134.136.126])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 08B351736
        for <linux-media@vger.kernel.org>; Tue,  1 Aug 2023 00:15:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1690874156; x=1722410156;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=SKPtHcEBZTf0a6V51xOufbOCsz5YuQpOc7asU1Mwg18=;
  b=YtfU5xN0aEphx8JeyiJ2weltI426xVhxcAMlT+0d1Xf/TZOxqCRz8ywx
   /cXR6QScplLo/D4V51hUO35wdJ/GKRzvYC5+Ba5ntnua/CUooJo4/rfgG
   W08V6mpHtQJYjHDW1W2X3j14PSZ0TJCkyS3Am4wYhU4WVt+ASCSQvR7iF
   VxnUmVPQ8zfP8bKfcbw6kNBI6zFTdXkk1n7kf4SFdachqHtDfVz6aJRhQ
   1xzcOEuTTl1IuCJ9pnjbqz513DzG3bX44lbFOZc6XfEG1W8aGSu/BzPOB
   Ld3h+IJFN6oGg+0q8+Lo/en3y0a2oa6RlsrZMOCvnhAXeYSWxJLjI/i3k
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10788"; a="354150377"
X-IronPort-AV: E=Sophos;i="6.01,246,1684825200"; 
   d="scan'208";a="354150377"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
  by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Aug 2023 00:15:55 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10788"; a="763647414"
X-IronPort-AV: E=Sophos;i="6.01,246,1684825200"; 
   d="scan'208";a="763647414"
Received: from turnipsi.fi.intel.com (HELO kekkonen.fi.intel.com) ([10.237.72.44])
  by orsmga001-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Aug 2023 00:15:54 -0700
Received: from punajuuri.localdomain (punajuuri.localdomain [192.168.240.130])
        by kekkonen.fi.intel.com (Postfix) with ESMTP id ABE9811F81F;
        Tue,  1 Aug 2023 10:15:51 +0300 (EEST)
Received: from sailus by punajuuri.localdomain with local (Exim 4.96)
        (envelope-from <sakari.ailus@linux.intel.com>)
        id 1qQjaQ-00DrAU-05;
        Tue, 01 Aug 2023 10:14:30 +0300
From:   Sakari Ailus <sakari.ailus@linux.intel.com>
To:     linux-media@vger.kernel.org
Cc:     hverkuil@xs4all.nl
Subject: [PATCH 0/2] Compiler warning fixes
Date:   Tue,  1 Aug 2023 10:14:28 +0300
Message-Id: <20230801071430.3302630-1-sakari.ailus@linux.intel.com>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.0 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,RCVD_IN_DNSWL_BLOCKED,
        SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi folks,

These two little patches address a couple of compiler and smatch warnings.

Sakari Ailus (2):
  media: ccs-pll: Initialise best_div to avoid a compiler warning
  media: pci: ipu3-cio2: Initialise timing struct to avoid a compiler
    warning

 drivers/media/i2c/ccs-pll.c              | 2 +-
 drivers/media/pci/intel/ipu3/ipu3-cio2.c | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

-- 
2.39.2

