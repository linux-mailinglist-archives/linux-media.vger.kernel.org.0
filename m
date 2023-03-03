Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id D24256A9E25
	for <lists+linux-media@lfdr.de>; Fri,  3 Mar 2023 19:07:39 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231276AbjCCSHh (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 3 Mar 2023 13:07:37 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53044 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230512AbjCCSHe (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Fri, 3 Mar 2023 13:07:34 -0500
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8CEE85CC3E
        for <linux-media@vger.kernel.org>; Fri,  3 Mar 2023 10:07:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1677866853; x=1709402853;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=GZyMaXHbFflI1g1OKv8E9Ip+mABa8xB+mE52QM4gOLE=;
  b=jyLaBMPO93L/kk8lxKlWgZBnJWeV+DRnXg4c0ubzCz19oAdgD7EC3sTG
   l8OPtX0fGhUO9rrqwAxyNBeqVI5d2TQGFlH5VY+2ca8OZNqcAALT6uIsj
   z4Ooa9gxT1zq3ReizK8ml0cG8VMs/c2FcQPtirKbPK3eVDB7d+Ex0pYZi
   npQm3qHCicT/WdEHoS+LK1XUnsFntZ/DO16DD2f3rICJN/bcXhrPjK89z
   Q1e9/q5A6zqeQAuUHnaWDPLmg5cYc0+C4XS39VMmgyeLmYoJeX/7eYXgJ
   VcqsYvTRkfTjM2uRlKrJNM1wlr6uq3yYFtgEWsoS+ffhawddlyfN8OVkx
   Q==;
X-IronPort-AV: E=McAfee;i="6500,9779,10638"; a="421382500"
X-IronPort-AV: E=Sophos;i="5.98,231,1673942400"; 
   d="scan'208";a="421382500"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
  by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Mar 2023 10:05:52 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10638"; a="652876985"
X-IronPort-AV: E=Sophos;i="5.98,231,1673942400"; 
   d="scan'208";a="652876985"
Received: from icg-kernel3.bj.intel.com ([172.16.126.100])
  by orsmga006.jf.intel.com with ESMTP; 03 Mar 2023 10:05:50 -0800
From:   bingbu.cao@intel.com
To:     linux-media@vger.kernel.org, sakari.ailus@linux.intel.com,
        andriy.shevchenko@linux.intel.com, djrscally@gmail.com
Cc:     bingbu.cao@linux.intel.com, bingbu.cao@intel.com
Subject: [PATCH v2] media: ipu3-cio2: support more camera sensors in cio2-bridge
Date:   Sat,  4 Mar 2023 02:15:03 +0800
Message-Id: <20230303181504.1813469-1-bingbu.cao@intel.com>
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
Changes from v1:
 - remove some sensors without available drivers
 - add .link_frequencies for each sensor

---
 drivers/media/pci/intel/ipu3/cio2-bridge.c | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/drivers/media/pci/intel/ipu3/cio2-bridge.c b/drivers/media/pci/intel/ipu3/cio2-bridge.c
index dfefe0d8aa95..d59bec8a94e2 100644
--- a/drivers/media/pci/intel/ipu3/cio2-bridge.c
+++ b/drivers/media/pci/intel/ipu3/cio2-bridge.c
@@ -29,6 +29,14 @@ static const struct cio2_sensor_config cio2_supported_sensors[] = {
 	CIO2_SENSOR_CONFIG("INT347E", 1, 319200000),
 	/* Omnivision OV2680 */
 	CIO2_SENSOR_CONFIG("OVTI2680", 0),
+	/* Omnivision ov8856 */
+	CIO2_SENSOR_CONFIG("OVTI8856", 3, 180000000, 360000000, 720000000),
+	/* Omnivision ov2740 */
+	CIO2_SENSOR_CONFIG("INT3474", 1, 360000000),
+	/* Hynix hi556 */
+	CIO2_SENSOR_CONFIG("INT3537", 1, 437000000),
+	/* Omnivision ov13b10 */
+	CIO2_SENSOR_CONFIG("OVTIDB10", 1, 560000000),
 };
 
 static const struct cio2_property_names prop_names = {
-- 
2.39.1

