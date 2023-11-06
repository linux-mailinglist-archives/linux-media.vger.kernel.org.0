Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 034F57E215B
	for <lists+linux-media@lfdr.de>; Mon,  6 Nov 2023 13:26:04 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231670AbjKFM0E (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 6 Nov 2023 07:26:04 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50810 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231590AbjKFM0B (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Mon, 6 Nov 2023 07:26:01 -0500
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.100])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 82642184
        for <linux-media@vger.kernel.org>; Mon,  6 Nov 2023 04:25:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1699273558; x=1730809558;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=e5xHgCz203dWzQ6k/QXmaPwbpI3wWpeOsKmtVPvTpNs=;
  b=d+f42+GYM8RzftfT1Ggx7fyaibtWoUVvRcL2FWFSbggs0nXuHjPGBZGB
   L5FARAozqRLfDGr5jeHy7IlOy3KY3L6d6nVRt0ZbBLKMBEZ2MgvtVVQYY
   i9kuzh0eDoVa0p+jKB5ikPz9S05qGY1GxwZtHIBOZKFgizRAsEY8/HqZY
   y76ZSuafCreIp55iUkesgTuChCLAYG84a6J/SZYeN6SmKphAp8YBOqKge
   x2re5llGfhpH+7yBMwkEPkrtGi7ChmfZ4NcEXBChORkU1gGNc7PkUbUwT
   gyF/ApsdqabRk6e7B1FrSPPsDF3OVrOgtCr0eXiW3YqdqwJG4GUrF/ccR
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10885"; a="455747245"
X-IronPort-AV: E=Sophos;i="6.03,281,1694761200"; 
   d="scan'208";a="455747245"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
  by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Nov 2023 04:25:58 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10885"; a="797291592"
X-IronPort-AV: E=Sophos;i="6.03,281,1694761200"; 
   d="scan'208";a="797291592"
Received: from turnipsi.fi.intel.com (HELO kekkonen.fi.intel.com) ([10.237.72.44])
  by orsmga001-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Nov 2023 04:25:55 -0800
Received: from svinhufvud.ger.corp.intel.com (localhost [IPv6:::1])
        by kekkonen.fi.intel.com (Postfix) with ESMTP id D2C381202BB;
        Mon,  6 Nov 2023 14:25:51 +0200 (EET)
From:   Sakari Ailus <sakari.ailus@linux.intel.com>
To:     linux-media@vger.kernel.org
Cc:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        tomi.valkeinen@ideasonboard.com, bingbu.cao@intel.com,
        hongju.wang@intel.com, hverkuil@xs4all.nl,
        Andrey Konovalov <andrey.konovalov@linaro.org>,
        Jacopo Mondi <jacopo.mondi@ideasonboard.com>,
        Dmitry Perchanov <dmitry.perchanov@intel.com>,
        "Ng, Khai Wen" <khai.wen.ng@intel.com>,
        Alain Volmat <alain.volmat@foss.st.com>
Subject: [PATCH v7 08/31] media: Documentation: Document embedded data guidelines for camera sensors
Date:   Mon,  6 Nov 2023 14:25:16 +0200
Message-Id: <20231106122539.1268265-9-sakari.ailus@linux.intel.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20231106122539.1268265-1-sakari.ailus@linux.intel.com>
References: <20231106122539.1268265-1-sakari.ailus@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.0 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,RCVD_IN_DNSWL_BLOCKED,
        SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Document how embedded data support should be implemented for camera
sensors, and when and how CCS embedded data format should be referenced.

Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>
---
 .../media/drivers/camera-sensor.rst           | 29 +++++++++++++++++++
 1 file changed, 29 insertions(+)

diff --git a/Documentation/userspace-api/media/drivers/camera-sensor.rst b/Documentation/userspace-api/media/drivers/camera-sensor.rst
index 919a50e8b9d9..92545538b855 100644
--- a/Documentation/userspace-api/media/drivers/camera-sensor.rst
+++ b/Documentation/userspace-api/media/drivers/camera-sensor.rst
@@ -102,3 +102,32 @@ register programming sequences shall initialize the :ref:`V4L2_CID_HFLIP
 values programmed by the register sequences. The default values of these
 controls shall be 0 (disabled). Especially these controls shall not be inverted,
 independently of the sensor's mounting rotation.
+
+Embedded data
+-------------
+
+Many sensors, mostly raw sensors, support embedded data which is used to convey
+the sensor configuration for the captured frame back to the host. While CSI-2 is
+the most common bus used by such sensors, embedded data can be available on
+other bus types as well.
+
+Embedded data support shall use an internal source pad (a pad that has
+``MEDIA_PAD_FL_SINK <MEDIA-PAD-FL-SINK>`` and ``MEDIA_PAD_FL_INTERNAL
+<MEDIA-PAD-FL-INTERNAL>`` flags set) and route to the external pad. If embedded
+data output can be disabled in hardware, it should be possible to disable the
+embedded data route via ``VIDIOC_SUBDEV_S_ROUTING`` IOCTL.
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

