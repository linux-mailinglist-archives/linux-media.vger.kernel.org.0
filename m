Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 8765B6A9960
	for <lists+linux-media@lfdr.de>; Fri,  3 Mar 2023 15:27:34 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230049AbjCCO1d (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 3 Mar 2023 09:27:33 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39112 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230457AbjCCO1c (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Fri, 3 Mar 2023 09:27:32 -0500
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B019861895
        for <linux-media@vger.kernel.org>; Fri,  3 Mar 2023 06:27:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1677853651; x=1709389651;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=wsTtRJmQyMht9/vWlzIuf12gTEKwJvohwADIH8idhSM=;
  b=iTEUvM0y+0HXBfFBB3M4Pt2BwWr145ZorvpM7yEP//ZguVzD34W/yjAK
   vF4M0rGXkP5HjVqQj8ptwEElvhXD/sipG1ZdLzOV0wLGHrSbdDg9jbySg
   Kd40lV0wGuQGqqQo2OW2lbiJ3Bavd+sWRfpV5+IEZx6+/fh8GquL18gqq
   41us0kicvXXgTHirUPlBJztGoC+WiqCHNT9Chct5uWLJ4yITbqLsfnfLb
   nT9whiiz+56Wuy5SJnQSDMrzxQ5jWDmL+v9Yd1ZNk9XHzpMgx3/eU95E7
   mDpH9Wb/WtdYl9ushl9hhEEtXiEWEK2vO4fD0RdNq9P2L6VlMo0TBMH+x
   A==;
X-IronPort-AV: E=McAfee;i="6500,9779,10637"; a="332532466"
X-IronPort-AV: E=Sophos;i="5.98,230,1673942400"; 
   d="scan'208";a="332532466"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
  by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Mar 2023 06:27:31 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10637"; a="652807694"
X-IronPort-AV: E=Sophos;i="5.98,230,1673942400"; 
   d="scan'208";a="652807694"
Received: from icg-kernel3.bj.intel.com ([172.16.126.100])
  by orsmga006.jf.intel.com with ESMTP; 03 Mar 2023 06:27:29 -0800
From:   bingbu.cao@intel.com
To:     linux-media@vger.kernel.org, sakari.ailus@linux.intel.com,
        andriy.shevchenko@linux.intel.com, djrscally@gmail.com
Cc:     bingbu.cao@linux.intel.com, bingbu.cao@intel.com
Subject: [PATCH] media: ipu3-cio2: support more camera sensors in cio2-bridge
Date:   Fri,  3 Mar 2023 22:36:43 +0800
Message-Id: <20230303143643.2095888-1-bingbu.cao@intel.com>
X-Mailer: git-send-email 2.39.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-4.4 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,
        SPF_HELO_NONE,SPF_NONE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

From: Bingbu Cao <bingbu.cao@intel.com>

Add more camera sensors into the supported camera sensors list
to make cio2-bridge to support more camera sensors.

Signed-off-by: Bingbu Cao <bingbu.cao@intel.com>
---
 drivers/media/pci/intel/ipu3/cio2-bridge.c | 19 +++++++++++++++++++
 1 file changed, 19 insertions(+)

diff --git a/drivers/media/pci/intel/ipu3/cio2-bridge.c b/drivers/media/pci/intel/ipu3/cio2-bridge.c
index dfefe0d8aa95..9e6046fa0bd0 100644
--- a/drivers/media/pci/intel/ipu3/cio2-bridge.c
+++ b/drivers/media/pci/intel/ipu3/cio2-bridge.c
@@ -29,6 +29,25 @@ static const struct cio2_sensor_config cio2_supported_sensors[] = {
 	CIO2_SENSOR_CONFIG("INT347E", 1, 319200000),
 	/* Omnivision OV2680 */
 	CIO2_SENSOR_CONFIG("OVTI2680", 0),
+	/* Omnivision ov02c10 */
+	CIO2_SENSOR_CONFIG("OVTI02C1", 0, 0),
+	/* Omnivision ov01a10 */
+	CIO2_SENSOR_CONFIG("OVTI01A0", 0, 0),
+	/* Omnivision ov01a1s */
+	CIO2_SENSOR_CONFIG("OVTI01AS", 0, 0),
+	/* Omnivision ov8856 */
+	CIO2_SENSOR_CONFIG("OVTI8856", 0, 0),
+	/* Omnivision ov2740 */
+	CIO2_SENSOR_CONFIG("INT3474", 0, 0),
+	/* Hynix hi556 */
+	CIO2_SENSOR_CONFIG("INT3537", 0, 0),
+	/* Himax hm2170 */
+	CIO2_SENSOR_CONFIG("HIMX2170", 0, 0),
+	/* Himax hm11b1 */
+	CIO2_SENSOR_CONFIG("HIMX11B1", 0, 0),
+	/* Omnivision ov13b10 */
+	CIO2_SENSOR_CONFIG("OVTIDB10", 0, 0),
+	CIO2_SENSOR_CONFIG("OVTI13B1", 0, 0),
 };
 
 static const struct cio2_property_names prop_names = {
-- 
2.39.1

