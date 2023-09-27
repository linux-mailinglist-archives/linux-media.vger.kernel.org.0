Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id E66867B0A4B
	for <lists+linux-media@lfdr.de>; Wed, 27 Sep 2023 18:32:57 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231784AbjI0Qcz (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 27 Sep 2023 12:32:55 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42192 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231566AbjI0Qcy (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 27 Sep 2023 12:32:54 -0400
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.115])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 273F1121
        for <linux-media@vger.kernel.org>; Wed, 27 Sep 2023 09:32:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1695832372; x=1727368372;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=9HgH2x6KTlGIuYfK9xL0HwkOulI2QMkfpdkpQqRZHhQ=;
  b=Tvik/chp00J/JPtxAF8SDOorQk8q43+D1fITDgAOnz0FfufVgoUT+IEE
   odY7Vu5f0+7fQXBERPvUDofHE6ZXDOjArGeEBzJP2woQenKgQR+U5/Vog
   lza9RQcpV2h9tNm5BGWfgMbFAklFJiZvz7aOkL9CZQW0d+FuJHGoMQtLX
   c0k9++c0NdhOZ//HhOvGy5k50fYGYa/x2eLd9dJolc5a57UqoM5tGClVf
   igQnE34mxUnLXciGzdW4wGa09RGSry3tCPNOGg69fymcdqxTzLQ8kLkxI
   f4mHG5W5OyqBAuYoAleJPA6Q12NNOjvC2YzqItXSUoAcHva4P9ov0lmwK
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10846"; a="381771218"
X-IronPort-AV: E=Sophos;i="6.03,181,1694761200"; 
   d="scan'208";a="381771218"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
  by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Sep 2023 09:32:51 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10846"; a="892665751"
X-IronPort-AV: E=Sophos;i="6.03,181,1694761200"; 
   d="scan'208";a="892665751"
Received: from turnipsi.fi.intel.com (HELO kekkonen.fi.intel.com) ([10.237.72.44])
  by fmsmga001-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Sep 2023 09:31:41 -0700
Received: from svinhufvud.ger.corp.intel.com (localhost [IPv6:::1])
        by kekkonen.fi.intel.com (Postfix) with ESMTP id 3896511F967;
        Wed, 27 Sep 2023 19:32:45 +0300 (EEST)
From:   Sakari Ailus <sakari.ailus@linux.intel.com>
To:     linux-media@vger.kernel.org
Cc:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        tomi.valkeinen@ideasonboard.com, bingbu.cao@intel.com,
        hongju.wang@intel.com, hverkuil@xs4all.nl,
        Andrey Konovalov <andrey.konovalov@linaro.org>,
        Jacopo Mondi <jacopo.mondi@ideasonboard.com>,
        Dmitry Perchanov <dmitry.perchanov@intel.com>,
        "Ng, Khai Wen" <khai.wen.ng@intel.com>
Subject: [PATCH v5 09/26] media: Documentation: Document embedded data guidelines for camera sensors
Date:   Wed, 27 Sep 2023 19:31:55 +0300
Message-Id: <20230927163212.402025-10-sakari.ailus@linux.intel.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230927163212.402025-1-sakari.ailus@linux.intel.com>
References: <20230927163212.402025-1-sakari.ailus@linux.intel.com>
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

