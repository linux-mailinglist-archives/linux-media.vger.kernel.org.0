Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id E9CE87A114E
	for <lists+linux-media@lfdr.de>; Fri, 15 Sep 2023 00:55:50 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230084AbjINWzt (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 14 Sep 2023 18:55:49 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35272 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229499AbjINWzs (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 14 Sep 2023 18:55:48 -0400
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.100])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7B40A26BC
        for <linux-media@vger.kernel.org>; Thu, 14 Sep 2023 15:55:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1694732144; x=1726268144;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=D6MDyMxvRp6e1i8ey6TTlbfV4O8/ArkTcKFDGnnyUBE=;
  b=g7MX44omeWCqHNF0wTAFmNqYzWLeHR7Q4X0FHBTRZ4OvyYd+iGN2PjeV
   Slt0RbqSXmQv+f2c9aJFTLeDUF56mrhH/hacszH/fPbp5IixEG23SlEC1
   srkpbWF/YkIEE6J7CRsG37WyP/Ous/WvEW6Imwx7KNtEbr9eTlNsUtYlU
   iUADbPQJl6kiyr4LbmiqeIZMnAuIj1z8nNTM4t9lGiHhx4rUK3nfAF801
   Avpo2AOKUvNw46eCqZFZf8M1Ucw4SCPOC6J9A/rGkU1kVA84v+4QrtKZM
   rC5IA7vq5VIkvcruSUFZnO22Xjmgwv7QY31nESNlQUlO9GxjZ5cpYx1UU
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10833"; a="445550408"
X-IronPort-AV: E=Sophos;i="6.02,147,1688454000"; 
   d="scan'208";a="445550408"
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
  by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Sep 2023 15:44:47 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10833"; a="991559329"
X-IronPort-AV: E=Sophos;i="6.02,147,1688454000"; 
   d="scan'208";a="991559329"
Received: from turnipsi.fi.intel.com (HELO kekkonen.fi.intel.com) ([10.237.72.44])
  by fmsmga006-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Sep 2023 15:44:30 -0700
Received: from punajuuri.localdomain (punajuuri.localdomain [192.168.240.130])
        by kekkonen.fi.intel.com (Postfix) with ESMTP id 26E4011F886;
        Fri, 15 Sep 2023 01:44:27 +0300 (EEST)
Received: from sailus by punajuuri.localdomain with local (Exim 4.96)
        (envelope-from <sakari.ailus@linux.intel.com>)
        id 1qgv3E-008SaD-0f;
        Fri, 15 Sep 2023 01:43:08 +0300
From:   Sakari Ailus <sakari.ailus@linux.intel.com>
To:     linux-media@vger.kernel.org
Cc:     laurent.pinchart@ideasonboard.com
Subject: [PATCH v2 1/1] media: Documentation: Mention CCS tools
Date:   Fri, 15 Sep 2023 01:42:58 +0300
Message-Id: <20230914224258.2016489-1-sakari.ailus@linux.intel.com>
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
since v1:

- Move the CCS tools section up, under CCS static data.

 Documentation/driver-api/media/drivers/ccs/ccs.rst | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/Documentation/driver-api/media/drivers/ccs/ccs.rst b/Documentation/driver-api/media/drivers/ccs/ccs.rst
index 7389204afcb8..0468b9413a31 100644
--- a/Documentation/driver-api/media/drivers/ccs/ccs.rst
+++ b/Documentation/driver-api/media/drivers/ccs/ccs.rst
@@ -78,6 +78,14 @@ For SMIA (non-++) compliant devices the static data file name is
 vvvv or vv denotes MIPI and SMIA manufacturer IDs respectively, mmmm model ID
 and rrrr or rr revision number.
 
+CCS tools
+~~~~~~~~~
+
+`CCS tools <https://github.com/MIPI-Alliance/ccs-tools/>`_ is a set of
+tools for working with CCS static data files. CCS tools includes a
+definition of the human-readable CCS static data YAML format and includes a
+program to convert it to a binary.
+
 Register definition generator
 -----------------------------
 
-- 
2.39.2

