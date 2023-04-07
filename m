Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 1E7A46DB187
	for <lists+linux-media@lfdr.de>; Fri,  7 Apr 2023 19:19:25 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229804AbjDGRTX (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 7 Apr 2023 13:19:23 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53560 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230196AbjDGRTB (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Fri, 7 Apr 2023 13:19:01 -0400
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 89526420E
        for <linux-media@vger.kernel.org>; Fri,  7 Apr 2023 10:18:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1680887939; x=1712423939;
  h=from:to:subject:date:message-id:in-reply-to:references:
   mime-version:content-transfer-encoding;
  bh=zvXshHIa3YjXSGNNCAC9emMeIMc0az5Ire1m5X/tLaI=;
  b=bVC/NTEBaB2dN3iE6NHqL4MC1Dioj+m42e6nHDd9vM7GCXuSFkz9R+Ha
   UYvr/iVpvPr47GaVxfxlZBA3x2bRwjUS44XHvI0Hcw14lR3VwMcIRBo98
   cVyev7ZQpGUrFh/E7F2Y/OsRqXGwd1O/RycDXXg0hE36ZT6rywiSAso2N
   mqVODlzRMJHDycX1594lsjnkaFi8DyFO4VA59fokaYF2iY2boXEySd3KV
   iEwZt9FPG2Ed0LlWKiIVn6WShjG0MvyQIQz1gvzjyVDfiJNAPPZPEbs/1
   ZhuUYiFf40FBbY+fY7tvnuYpLfyMjsPac+7RgdFlO4usCvGOi0esBjEL8
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10673"; a="341782437"
X-IronPort-AV: E=Sophos;i="5.98,327,1673942400"; 
   d="scan'208";a="341782437"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
  by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Apr 2023 10:18:50 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10673"; a="752103583"
X-IronPort-AV: E=Sophos;i="5.98,327,1673942400"; 
   d="scan'208";a="752103583"
Received: from turnipsi.fi.intel.com (HELO kekkonen.fi.intel.com) ([10.237.72.44])
  by fmsmga008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Apr 2023 10:18:48 -0700
Received: from svinhufvud.ger.corp.intel.com (localhost [IPv6:::1])
        by kekkonen.fi.intel.com (Postfix) with ESMTP id 8DDF6120D47
        for <linux-media@vger.kernel.org>; Fri,  7 Apr 2023 20:09:35 +0300 (EEST)
From:   Sakari Ailus <sakari.ailus@linux.intel.com>
To:     linux-media@vger.kernel.org
Subject: [PATCH v2 4/4] media: ccs: Document CCS static data file names
Date:   Fri,  7 Apr 2023 20:09:31 +0300
Message-Id: <20230407170931.30842-5-sakari.ailus@linux.intel.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20230407170931.30842-1-sakari.ailus@linux.intel.com>
References: <20230407170931.30842-1-sakari.ailus@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.4 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,SPF_HELO_NONE,SPF_NONE
        autolearn=unavailable autolearn_force=no version=3.4.6
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

