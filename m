Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 2E8887AB385
	for <lists+linux-media@lfdr.de>; Fri, 22 Sep 2023 16:23:37 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234269AbjIVOXK (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 22 Sep 2023 10:23:10 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60946 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234258AbjIVOXJ (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 22 Sep 2023 10:23:09 -0400
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.136])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A7BE7196
        for <linux-media@vger.kernel.org>; Fri, 22 Sep 2023 07:23:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1695392583; x=1726928583;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=JI6DEynazv5SQkL32BxagWDlmsJXU/m58K0DaNBnY9Q=;
  b=ULEAjlH2D3NgzBwVMRIn7YhzTtKPFnAvzM2n2tCiQ167D7CGnkw2CtCS
   ta/KdaOd5BKHCHAWsUtVZswaX2Q0TBfAFTrJkv5S8Fmv0e0ytJcJJFijR
   nRkSNltBsrk1AWSlCXYvIqb4eNllLrTcaoMpbsNmhsjmsWdBM3s/JxzT1
   EhIbQw/k7/nPdBXXIoU0zUjDuih6vDmepeEQ9I9A+IfXKQiQgWyZ6Fum3
   QccWxy4laIn+sJU0t05OsVHVUvccwlkc3wzvyJz6v4YFe1kZfoZgbdxtB
   N00+TRlW4RkfnTPE6O1ceXVwwhFLRTOKfXUR2xWGHcVUP2GvPh05OQF8N
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10841"; a="360218909"
X-IronPort-AV: E=Sophos;i="6.03,167,1694761200"; 
   d="scan'208";a="360218909"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
  by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Sep 2023 07:23:00 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10841"; a="741112412"
X-IronPort-AV: E=Sophos;i="6.03,167,1694761200"; 
   d="scan'208";a="741112412"
Received: from turnipsi.fi.intel.com (HELO kekkonen.fi.intel.com) ([10.237.72.44])
  by orsmga007-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Sep 2023 07:22:57 -0700
Received: from svinhufvud.ger.corp.intel.com (localhost [IPv6:::1])
        by kekkonen.fi.intel.com (Postfix) with ESMTP id A5DC711FC30;
        Fri, 22 Sep 2023 17:22:53 +0300 (EEST)
From:   Sakari Ailus <sakari.ailus@linux.intel.com>
To:     linux-media@vger.kernel.org
Cc:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        tomi.valkeinen@ideasonboard.com, bingbu.cao@intel.com,
        hongju.wang@intel.com, hverkuil@xs4all.nl,
        Andrey Konovalov <andrey.konovalov@linaro.org>,
        Jacopo Mondi <jacopo.mondi@ideasonboard.com>,
        Dmitry Perchanov <dmitry.perchanov@intel.com>,
        "Ng, Khai Wen" <khai.wen.ng@intel.com>
Subject: [PATCH v4 09/23] media: Documentation: Document embedded data guidelines for camera sensors
Date:   Fri, 22 Sep 2023 17:22:25 +0300
Message-Id: <20230922142239.259425-10-sakari.ailus@linux.intel.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230922142239.259425-1-sakari.ailus@linux.intel.com>
References: <20230922142239.259425-1-sakari.ailus@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.0 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,RCVD_IN_DNSWL_BLOCKED,
        SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED autolearn=ham autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Document how embedded data support should be implemented for camera
sensors, and when and how CCS embedded data format should be referenced.

Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>
---
 .../driver-api/media/camera-sensor.rst        | 23 +++++++++++++++++++
 1 file changed, 23 insertions(+)

diff --git a/Documentation/driver-api/media/camera-sensor.rst b/Documentation/driver-api/media/camera-sensor.rst
index 2acc08142a1a..64c74fa51586 100644
--- a/Documentation/driver-api/media/camera-sensor.rst
+++ b/Documentation/driver-api/media/camera-sensor.rst
@@ -200,3 +200,26 @@ V4L2_CID_VFLIP controls with the values programmed by the register sequences.
 The default values of these controls shall be 0 (disabled). Especially these
 controls shall not be inverted, independently of the sensor's mounting
 rotation.
+
+Embedded data
+-------------
+
+Many sensors, mostly raw sensors, support embedded data which is used to convey
+the sensor configuration for the captured frame back to the host. While CSI-2 is
+the most common bus used by such sensors, embedded data is not entirely limited
+to CSI-2 bus due to e.g. bridge devices.
+
+Embedded data support should use an internal source pad and route to the
+external pad. If embedded data output can be disabled in hardware, it should be
+possible to disable the embedded data route via ``VIDIOC_SUBDEV_S_ROUTING``
+IOCTL.
+
+CCS and non-CCS embedded data
+~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
+
+Embedded data which is compliant with CCS definitions shall use ``CCS embedded
+data format <MEDIA-BUS-FMT-CCS-EMBEDDED>``. Device specific embedded data which
+is compliant up to MIPI CCS embedded data levels 1 or 2 only shall refer to CCS
+embedded data formats and document the level of conformance. The rest of the
+device specific embedded data format shall be documented in the context of the
+data format itself.
-- 
2.39.2

