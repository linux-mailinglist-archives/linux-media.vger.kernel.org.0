Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id E4DD27A107C
	for <lists+linux-media@lfdr.de>; Fri, 15 Sep 2023 00:04:10 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229499AbjINWEN (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 14 Sep 2023 18:04:13 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59528 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229447AbjINWEM (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 14 Sep 2023 18:04:12 -0400
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.24])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 96A692120
        for <linux-media@vger.kernel.org>; Thu, 14 Sep 2023 15:04:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1694729048; x=1726265048;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=+ISs8FFoQrcGJCU/a1t4K92je5rUyP+dF6EhyhkJw7o=;
  b=TEBsoixSUTOnkF4wWzO1gMzkOWCgS9UyYq5oVuYNBgUi4XOayTKCKBnl
   rgEMlSx5oS5CFZ3x4E878oH+CcaUUuzNqb2z7GDLC0Q1uxT+ufJ/3x/9y
   r2UPcC0+frAEn20sYYOdLME1BB/jaYx3cgidTogMCWPqPq4uq7SFpwEOp
   P+WIY0oM/vyUZi2pkIb6iSN7YPeaULFqhzqz9ik4d3diGEaZS/MnKC2bH
   7xB0XvFeDFYlPC12+v8ARN+OUkStEgGPb7m8Ltqi/g//d8KVXGexw8bEb
   I+VRBxajAgqjkz7kLNzLldb2whDglH3mu7h7tYXkVrODUajxOh/ylBJZJ
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10833"; a="381802128"
X-IronPort-AV: E=Sophos;i="6.02,147,1688454000"; 
   d="scan'208";a="381802128"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
  by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Sep 2023 15:04:08 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10833"; a="721441092"
X-IronPort-AV: E=Sophos;i="6.02,147,1688454000"; 
   d="scan'208";a="721441092"
Received: from turnipsi.fi.intel.com (HELO kekkonen.fi.intel.com) ([10.237.72.44])
  by orsmga006-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Sep 2023 15:04:07 -0700
Received: from punajuuri.localdomain (punajuuri.localdomain [192.168.240.130])
        by kekkonen.fi.intel.com (Postfix) with ESMTP id 7558211F886;
        Fri, 15 Sep 2023 01:04:04 +0300 (EEST)
Received: from sailus by punajuuri.localdomain with local (Exim 4.96)
        (envelope-from <sakari.ailus@linux.intel.com>)
        id 1qguQ9-008S0q-1q;
        Fri, 15 Sep 2023 01:02:45 +0300
From:   Sakari Ailus <sakari.ailus@linux.intel.com>
To:     linux-media@vger.kernel.org
Cc:     laurent.pinchart@ideasonboard.com
Subject: [PATCH 1/1] media: Documentation: Mention CCS tools
Date:   Fri, 15 Sep 2023 01:02:35 +0300
Message-Id: <20230914220235.2014296-1-sakari.ailus@linux.intel.com>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

CCS tools is a useful set of programs and libraries for working with CCS
static data. Do mention that in context of the CCS driver.

Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>
---
 Documentation/driver-api/media/drivers/ccs/ccs.rst | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/Documentation/driver-api/media/drivers/ccs/ccs.rst b/Documentation/driver-api/media/drivers/ccs/ccs.rst
index 7389204afcb8..07249f7d7863 100644
--- a/Documentation/driver-api/media/drivers/ccs/ccs.rst
+++ b/Documentation/driver-api/media/drivers/ccs/ccs.rst
@@ -114,4 +114,12 @@ The PLL model implemented by the PLL calculator corresponds to MIPI CCS 1.1.
 
 .. kernel-doc:: drivers/media/i2c/ccs-pll.h
 
+CCS tools
+=========
+
+`CCS tools <https://github.com/MIPI-Alliance/ccs-tools/>`_ is a set of
+tools for working with CCS static data files. CCS tools includes a
+definition of the human-readable CCS static data YAML format and includes a
+program to convert it to a binary.
+
 **Copyright** |copy| 2020 Intel Corporation
-- 
2.39.2

