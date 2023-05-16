Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 0F03F7049DE
	for <lists+linux-media@lfdr.de>; Tue, 16 May 2023 11:57:01 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232297AbjEPJ47 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 16 May 2023 05:56:59 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33184 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232261AbjEPJ4d (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 16 May 2023 05:56:33 -0400
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 567C63588
        for <linux-media@vger.kernel.org>; Tue, 16 May 2023 02:56:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1684230990; x=1715766990;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=Gd7HLGVvz+OjG/PZbl0woujGyowsfis9oXa7ZUQbEH8=;
  b=YdlC5yeH8ht/HeauDQGqCNsbBv+ap8dqjaTSSwFgfOqyKTu51Jy72yDS
   Wvvf7Dx2mENSUiSdCgJMirpDC3KZUHL9UxFQ2/K4MWwXFARr+/UD2KTSI
   t70vjD7gDUIhfPm46ntpLIuBaraeesEP/ZyvkbytxdyRjd4wH8yDg8gAu
   KD1d3F9IxNF2lZjLUczoY00pcnySOdqafE16ofzmoXOW7BQickPQAPzx6
   oBgwC/vTIs8YhixHGDP5i1m3p8A2vFytB8WslMwAQrTkvkwBNjtP9KsVu
   Rnovx1BOEvlrfRglDoOv2CjzaEC95mDCcI86xdAKdgV1NxXXn1IbrQigR
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10711"; a="354601608"
X-IronPort-AV: E=Sophos;i="5.99,278,1677571200"; 
   d="scan'208";a="354601608"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
  by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 May 2023 02:55:52 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10711"; a="731931883"
X-IronPort-AV: E=Sophos;i="5.99,278,1677571200"; 
   d="scan'208";a="731931883"
Received: from turnipsi.fi.intel.com (HELO kekkonen.fi.intel.com) ([10.237.72.44])
  by orsmga008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 May 2023 02:55:48 -0700
Received: from punajuuri.localdomain (punajuuri.localdomain [192.168.240.130])
        by kekkonen.fi.intel.com (Postfix) with ESMTP id 96716122FC0;
        Tue, 16 May 2023 12:55:36 +0300 (EEST)
Received: from sailus by punajuuri.localdomain with local (Exim 4.94.2)
        (envelope-from <sakari.ailus@linux.intel.com>)
        id 1pyrOy-002ZBQ-K4; Tue, 16 May 2023 12:55:28 +0300
From:   Sakari Ailus <sakari.ailus@linux.intel.com>
To:     linux-media@vger.kernel.org
Cc:     laurent.pinchart@ideasonboard.com,
        Philipp Zabel <p.zabel@pengutronix.de>, hverkuil@xs4all.nl,
        Francesco Dolcini <francesco@dolcini.it>,
        aishwarya.kothari@toradex.com, Robert Foss <rfoss@kernel.org>,
        Todor Tomov <todor.too@gmail.com>,
        Hyun Kwon <hyun.kwon@xilinx.com>, bingbu.cao@intel.com
Subject: [PATCH v2 31/31] media: Documentation: v4l: Document sub-device notifiers
Date:   Tue, 16 May 2023 12:55:17 +0300
Message-Id: <20230516095517.611711-32-sakari.ailus@linux.intel.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20230516095517.611711-1-sakari.ailus@linux.intel.com>
References: <20230516095517.611711-1-sakari.ailus@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-4.3 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,SPF_HELO_NONE,
        SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Document that sub-device notifiers are now registered using
v4l2_async_subdev_nf_init(). No documentation is changed as it seems that
sub-device notifiers were not documented apart from kernel-doc comments.

Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>
---
 Documentation/driver-api/media/v4l2-subdev.rst | 10 +++++++---
 1 file changed, 7 insertions(+), 3 deletions(-)

diff --git a/Documentation/driver-api/media/v4l2-subdev.rst b/Documentation/driver-api/media/v4l2-subdev.rst
index 83d3d29608136..d62b341642c96 100644
--- a/Documentation/driver-api/media/v4l2-subdev.rst
+++ b/Documentation/driver-api/media/v4l2-subdev.rst
@@ -193,9 +193,7 @@ picked up by bridge drivers.
 Bridge drivers in turn have to register a notifier object. This is
 performed using the :c:func:`v4l2_async_nf_register` call. To
 unregister the notifier the driver has to call
-:c:func:`v4l2_async_nf_unregister`. The former of the two functions
-takes two arguments: a pointer to struct :c:type:`v4l2_device` and a
-pointer to struct :c:type:`v4l2_async_notifier`.
+:c:func:`v4l2_async_nf_unregister`.
 
 Before registering the notifier, bridge drivers must do two things: first, the
 notifier must be initialized using the :c:func:`v4l2_async_nf_init`.
@@ -204,6 +202,12 @@ that the bridge device needs for its operation. Several functions are available
 to add subdevice descriptors to a notifier, depending on the type of device and
 the needs of the driver.
 
+For a sub-device driver to register a notifier, the process is otherwise similar
+to that of a bridge driver, apart from that the notifier is initialised using
+:c:func:`v4l2_async_subdev_nf_init` instead. A sub-device notifier may complete
+only after the V4L2 device becomes available, i.e. there's a path via async
+sub-devices and notifiers to that root notifier.
+
 :c:func:`v4l2_async_nf_add_fwnode`, :c:func:`v4l2_async_nf_add_fwnode_remote`
 :c:and func:`v4l2_async_nf_add_i2c` are for registering their async sub-devices
 :c:with the notifier.
-- 
2.30.2

