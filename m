Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 79DA57AFB7C
	for <lists+linux-media@lfdr.de>; Wed, 27 Sep 2023 08:57:51 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229537AbjI0G5t (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 27 Sep 2023 02:57:49 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55942 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229527AbjI0G5s (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 27 Sep 2023 02:57:48 -0400
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.20])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0BD88E5
        for <linux-media@vger.kernel.org>; Tue, 26 Sep 2023 23:57:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1695797867; x=1727333867;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=amPuXQda1vVqXbclqO8XS1HZOwP5mrrowZQ1oBcSNY4=;
  b=NRkQg9mPvRm5r8xRTOOG9eJJTjq9meksEnMFmvuy3hZviWgZRO/17jYH
   O6vzkyLlF6VZA2Qo1wprCvCKcCKoI1RiiSahW0XquNfF5701TyHRFm7SU
   JS1pBpdPFGzMvGt1boH0/XE3E5pm3vBctXYLwqm7TY4GtvNFjY2VBqKUA
   IQDLYDmT9ZtgMYPOvvphiuEddMdjQhHuOOVzDo1/0l1Z8bIQmd1YHWwIp
   04cjuIXA0ByYnN6w1I1iEic29+A8pZl8irJVX3rJtHo8xE77/bDGEMrcT
   Cy0WCHchX+EqeUcJV3CMkzjTpNDQbOK80fPXGfEwLBYTpvxTX5DiiedqM
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10845"; a="372083273"
X-IronPort-AV: E=Sophos;i="6.03,179,1694761200"; 
   d="scan'208";a="372083273"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
  by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Sep 2023 23:57:46 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10845"; a="892489857"
X-IronPort-AV: E=Sophos;i="6.03,179,1694761200"; 
   d="scan'208";a="892489857"
Received: from turnipsi.fi.intel.com (HELO kekkonen.fi.intel.com) ([10.237.72.44])
  by fmsmga001-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Sep 2023 23:56:37 -0700
Received: from svinhufvud.ger.corp.intel.com (localhost [IPv6:::1])
        by kekkonen.fi.intel.com (Postfix) with ESMTP id 72AEA1209F6;
        Wed, 27 Sep 2023 09:41:25 +0300 (EEST)
From:   Sakari Ailus <sakari.ailus@linux.intel.com>
To:     linux-media@vger.kernel.org
Cc:     laurent.pinchart@ideasonboard.com,
        Tianshu Qiu <tian.shu.qiu@intel.com>,
        Bingbu Cao <bingbu.cao@intel.com>,
        Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>,
        Jacopo Mondi <jacopo+renesas@jmondi.org>,
        Rui Miguel Silva <rmfrfs@gmail.com>,
        Martin Kepplinger <martink@posteo.de>
Subject: [PATCH v6 02/13] media: ccs: Fix driver quirk struct documentation
Date:   Wed, 27 Sep 2023 09:41:09 +0300
Message-Id: <20230927064120.367561-3-sakari.ailus@linux.intel.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230927064120.367561-1-sakari.ailus@linux.intel.com>
References: <20230927064120.367561-1-sakari.ailus@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.0 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,RCVD_IN_DNSWL_BLOCKED,
        RCVD_IN_MSPIKE_H3,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_NONE
        autolearn=ham autolearn_force=no version=3.4.6
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

