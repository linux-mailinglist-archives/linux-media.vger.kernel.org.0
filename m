Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id D54F97A4A20
	for <lists+linux-media@lfdr.de>; Mon, 18 Sep 2023 14:52:34 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S241316AbjIRMwG (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 18 Sep 2023 08:52:06 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57350 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S241996AbjIRMwD (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 18 Sep 2023 08:52:03 -0400
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.126])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E1040107
        for <linux-media@vger.kernel.org>; Mon, 18 Sep 2023 05:51:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1695041507; x=1726577507;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=amPuXQda1vVqXbclqO8XS1HZOwP5mrrowZQ1oBcSNY4=;
  b=hzG7/rq+lhw8ATCq1C//CVDvhT952KaGBVpr7Aom+msGvqeveYp1z3F4
   RTPiRWqcVyBMFmlu1iL6UQUrIzqXUkHs9xDKxhn9sXCaK7MIiVEMYhVjR
   2cvkvgLdw/47nZQNy56Ork7vHx4Ha++2zXZ3vMuT2cRzdnpKINzgyImjU
   Fq2ZcNsTg1x5IMFbMCTvsJr/DXZI8XSKK/toe9KU0DzzW8XWhTXcxihcE
   QMCCj9J2rO7nBw2/LqEDcFYUZ8wE5ryBaSniSXuBqwcGGx3J5FaJmtmpc
   jWCoc9KNv8XuvofRgIfTgiOlj3hQrrFntiqYGhcNW43kziYdSHJjFNoic
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10837"; a="364688932"
X-IronPort-AV: E=Sophos;i="6.02,156,1688454000"; 
   d="scan'208";a="364688932"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
  by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Sep 2023 05:51:47 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10837"; a="836005431"
X-IronPort-AV: E=Sophos;i="6.02,156,1688454000"; 
   d="scan'208";a="836005431"
Received: from turnipsi.fi.intel.com (HELO kekkonen.fi.intel.com) ([10.237.72.44])
  by fmsmga003-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Sep 2023 05:51:44 -0700
Received: from svinhufvud.ger.corp.intel.com (localhost [IPv6:::1])
        by kekkonen.fi.intel.com (Postfix) with ESMTP id 7090D11FBCE;
        Mon, 18 Sep 2023 15:51:41 +0300 (EEST)
From:   Sakari Ailus <sakari.ailus@linux.intel.com>
To:     linux-media@vger.kernel.org
Cc:     laurent.pinchart@ideasonboard.com,
        Tianshu Qiu <tian.shu.qiu@intel.com>,
        Bingbu Cao <bingbu.cao@intel.com>,
        Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>,
        Jacopo Mondi <jacopo+renesas@jmondi.org>,
        Rui Miguel Silva <rmfrfs@gmail.com>,
        Martin Kepplinger <martink@posteo.de>
Subject: [PATCH v2 02/12] media: ccs: Fix driver quirk struct documentation
Date:   Mon, 18 Sep 2023 15:51:28 +0300
Message-Id: <20230918125138.90002-3-sakari.ailus@linux.intel.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230918125138.90002-1-sakari.ailus@linux.intel.com>
References: <20230918125138.90002-1-sakari.ailus@linux.intel.com>
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

Fix documentation for struct ccs_quirk, a device specific struct for
managing deviations from the standard. The flags field was drifted away
from where it should have been.

Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>
Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
---
 drivers/media/i2c/ccs/ccs-quirk.h | 4 +---
 1 file changed, 1 insertion(+), 3 deletions(-)

diff --git a/drivers/media/i2c/ccs/ccs-quirk.h b/drivers/media/i2c/ccs/ccs-quirk.h
index 5838fcda92fd..0b1a64958d71 100644
--- a/drivers/media/i2c/ccs/ccs-quirk.h
+++ b/drivers/media/i2c/ccs/ccs-quirk.h
@@ -32,12 +32,10 @@ struct ccs_sensor;
  *		@reg: Pointer to the register to access
  *		@value: Register value, set by the caller on write, or
  *			by the quirk on read
- *
- * @flags: Quirk flags
- *
  *		@return: 0 on success, -ENOIOCTLCMD if no register
  *			 access may be done by the caller (default read
  *			 value is zero), else negative error code on error
+ * @flags: Quirk flags
  */
 struct ccs_quirk {
 	int (*limits)(struct ccs_sensor *sensor);
-- 
2.39.2

