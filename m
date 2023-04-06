Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 37AD96D9EE9
	for <lists+linux-media@lfdr.de>; Thu,  6 Apr 2023 19:36:08 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238761AbjDFRgF (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 6 Apr 2023 13:36:05 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55914 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S238941AbjDFRgA (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Thu, 6 Apr 2023 13:36:00 -0400
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A52A6AF34
        for <linux-media@vger.kernel.org>; Thu,  6 Apr 2023 10:35:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1680802539; x=1712338539;
  h=from:to:subject:date:message-id:in-reply-to:references:
   mime-version:content-transfer-encoding;
  bh=zvXshHIa3YjXSGNNCAC9emMeIMc0az5Ire1m5X/tLaI=;
  b=XjrV6dn5eBPe5DXT3sbJCZPlAwY1gDmjlbdbmdX57CSDVHB4oZx3GeDJ
   bdo+r8JGpfnETsEqzODhzcDX3Ys/6OBFUoEjDXbZlFTGAUdAU5t0IfJcg
   xpEiAXAlzGTGr8SOYABXY43IkyEqbU0+6V7ebMa10tXnKPmR6dVzdaNgI
   xK5q2yGOG/RPgQKeqoijaX/5Mr6F5k5V83eAKH3FjHbqtCMBVjA2yHkvN
   tHUVyi59IeVgOIDBuipeH5jgEM+7pBKrfSPN16032aSpoU94y7lNZ0dl5
   BjpBzmkTyoBSbXLRmsMuuVpCxDnFqOT0B5Dhn4s3Evw/UHghAPTd2zcm8
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10672"; a="370629625"
X-IronPort-AV: E=Sophos;i="5.98,323,1673942400"; 
   d="scan'208";a="370629625"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
  by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Apr 2023 10:34:37 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10672"; a="664558678"
X-IronPort-AV: E=Sophos;i="5.98,323,1673942400"; 
   d="scan'208";a="664558678"
Received: from turnipsi.fi.intel.com (HELO kekkonen.fi.intel.com) ([10.237.72.44])
  by orsmga006-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Apr 2023 10:34:35 -0700
Received: from svinhufvud.ger.corp.intel.com (localhost [IPv6:::1])
        by kekkonen.fi.intel.com (Postfix) with ESMTP id D6C56122DD4
        for <linux-media@vger.kernel.org>; Thu,  6 Apr 2023 20:34:33 +0300 (EEST)
From:   Sakari Ailus <sakari.ailus@linux.intel.com>
To:     linux-media@vger.kernel.org
Subject: [PATCH 4/4] media: ccs: Document CCS static data file names
Date:   Thu,  6 Apr 2023 20:34:28 +0300
Message-Id: <20230406173428.19855-5-sakari.ailus@linux.intel.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20230406173428.19855-1-sakari.ailus@linux.intel.com>
References: <20230406173428.19855-1-sakari.ailus@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.4 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,RCVD_IN_MSPIKE_H3,
        RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_NONE autolearn=unavailable
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Document the firmware file names for CCS static data for CCS, SMIA++ and
SMIA devices.

Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>
---
 .../driver-api/media/drivers/ccs/ccs.rst      | 22 +++++++++++++++++++
 1 file changed, 22 insertions(+)

diff --git a/Documentation/driver-api/media/drivers/ccs/ccs.rst b/Documentation/driver-api/media/drivers/ccs/ccs.rst
index b461c8aa2a16..7389204afcb8 100644
--- a/Documentation/driver-api/media/drivers/ccs/ccs.rst
+++ b/Documentation/driver-api/media/drivers/ccs/ccs.rst
@@ -56,6 +56,28 @@ analogue data is never read from the pixel matrix that are outside the
 configured selection rectangle that designates crop. The difference has an
 effect in device timing and likely also in power consumption.
 
+CCS static data
+---------------
+
+The MIPI CCS driver supports CCS static data for all compliant devices,
+including not just those compliant with CCS 1.1 but also CCS 1.0 and SMIA(++).
+For CCS the file names are formed as
+
+	ccs/ccs-sensor-vvvv-mmmm-rrrr.fw (sensor) and
+	ccs/ccs-module-vvvv-mmmm-rrrr.fw (module).
+
+For SMIA++ compliant devices the corresponding file names are
+
+	ccs/smiapp-sensor-vv-mmmm-rr.fw (sensor) and
+	ccs/smiapp-module-vv-mmmm-rrrr.fw (module).
+
+For SMIA (non-++) compliant devices the static data file name is
+
+	ccs/smia-sensor-vv-mmmm-rr.fw (sensor).
+
+vvvv or vv denotes MIPI and SMIA manufacturer IDs respectively, mmmm model ID
+and rrrr or rr revision number.
+
 Register definition generator
 -----------------------------
 
-- 
2.30.2

