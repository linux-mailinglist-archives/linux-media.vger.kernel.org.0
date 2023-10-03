Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id DB6107B6858
	for <lists+linux-media@lfdr.de>; Tue,  3 Oct 2023 13:53:02 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S240659AbjJCLxC (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 3 Oct 2023 07:53:02 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40820 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S240654AbjJCLxB (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Tue, 3 Oct 2023 07:53:01 -0400
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.88])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id AEB8AA6
        for <linux-media@vger.kernel.org>; Tue,  3 Oct 2023 04:52:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1696333977; x=1727869977;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=9HgH2x6KTlGIuYfK9xL0HwkOulI2QMkfpdkpQqRZHhQ=;
  b=hh5gqYAqAi9p1yrLfo8SwAob2m6m1/DcdBykJ3o4t0NqqkA6IF8AW6vT
   NIOsmcYlucywTcwQJhtkmfsJ0nkDYm9o8qQrOt8sjVvs/ZlfxhFDGrhrd
   FThnEdZGJS+T8xHqKyHmZXOwJvssqtmKzJ1M0bWJuSyw+yUnAC/Zstvh8
   KIfQJ1y+cFXpujmqE6orPATQ3JyEHzaSFt90So02CRxYh2e0VxoORg5/n
   EETkBPEwcjf970YihdwJye8fCBsud6E9mt+z33ojCwg8T54OPS79zwkGQ
   GAQmDbCz2OhWWbp+HzhMmAI2soYhyQEVth5adS1syadEyFY/mPXZCU5vp
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10851"; a="413767153"
X-IronPort-AV: E=Sophos;i="6.03,197,1694761200"; 
   d="scan'208";a="413767153"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
  by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Oct 2023 04:52:57 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10851"; a="816650559"
X-IronPort-AV: E=Sophos;i="6.03,197,1694761200"; 
   d="scan'208";a="816650559"
Received: from turnipsi.fi.intel.com (HELO kekkonen.fi.intel.com) ([10.237.72.44])
  by fmsmga008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Oct 2023 04:52:54 -0700
Received: from svinhufvud.ger.corp.intel.com (localhost [IPv6:::1])
        by kekkonen.fi.intel.com (Postfix) with ESMTP id D8F22120A57;
        Tue,  3 Oct 2023 14:52:50 +0300 (EEST)
From:   Sakari Ailus <sakari.ailus@linux.intel.com>
To:     linux-media@vger.kernel.org
Cc:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        tomi.valkeinen@ideasonboard.com, bingbu.cao@intel.com,
        hongju.wang@intel.com, hverkuil@xs4all.nl,
        Andrey Konovalov <andrey.konovalov@linaro.org>,
        Jacopo Mondi <jacopo.mondi@ideasonboard.com>,
        Dmitry Perchanov <dmitry.perchanov@intel.com>,
        "Ng, Khai Wen" <khai.wen.ng@intel.com>
Subject: [PATCH v6 09/28] media: Documentation: Document embedded data guidelines for camera sensors
Date:   Tue,  3 Oct 2023 14:52:37 +0300
Message-Id: <20231003115237.76828-10-sakari.ailus@linux.intel.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20231003115237.76828-1-sakari.ailus@linux.intel.com>
References: <20231003115237.76828-1-sakari.ailus@linux.intel.com>
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

Document how embedded data support should be implemented for camera
sensors, and when and how CCS embedded data format should be referenced.

Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>
---
 .../media/drivers/camera-sensor.rst           | 28 +++++++++++++++++++
 1 file changed, 28 insertions(+)

diff --git a/Documentation/userspace-api/media/drivers/camera-sensor.rst b/Documentation/userspace-api/media/drivers/camera-sensor.rst
index 919a50e8b9d9..308f391c5ca1 100644
--- a/Documentation/userspace-api/media/drivers/camera-sensor.rst
+++ b/Documentation/userspace-api/media/drivers/camera-sensor.rst
@@ -102,3 +102,31 @@ register programming sequences shall initialize the :ref:`V4L2_CID_HFLIP
 values programmed by the register sequences. The default values of these
 controls shall be 0 (disabled). Especially these controls shall not be inverted,
 independently of the sensor's mounting rotation.
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
+In general, changing the embedded data format from the driver-configured values
+is not supported. The height of the metadata is hardware specific and the width
+is that (or less of that) of the image width, as configured on the pixel data
+stream.
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

