Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 8B14071089A
	for <lists+linux-media@lfdr.de>; Thu, 25 May 2023 11:17:37 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S240503AbjEYJRg (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 25 May 2023 05:17:36 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52500 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S240535AbjEYJR0 (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 25 May 2023 05:17:26 -0400
Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E2AEC191
        for <linux-media@vger.kernel.org>; Thu, 25 May 2023 02:17:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1685006245; x=1716542245;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=Gd7HLGVvz+OjG/PZbl0woujGyowsfis9oXa7ZUQbEH8=;
  b=FHRSbjYgMcZOI5m99Upx5LxxeQTModkzPDExoT/kkfa7LwDjEa+HRo+y
   N+X4a8tUOYXoVLIxKoVMfxFmQ0uzBpBLsKYjenL0B19b4aQ03K1rStTii
   iUfbJxdud9wLcwiwC0E6tQ01itUkGecLgkKa2X4ZbS5ZKba0dO/OMrWIy
   /mwwiJ5ugtpfI4UjxJQbh/b05dvcLXLAsQG0g6o6hjj/v3eGqOWbN2a05
   PjO663YEg/zc9UoXPo2oauEKOlRx8ymY7ryuB3lEElT+XK3DoMRU2bqYV
   3tK68ihUWyOY5mD4Mr5F8v0Gkyx9VpiE3V936xCEWdPn8BMHNMOKKhpM3
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10720"; a="333456042"
X-IronPort-AV: E=Sophos;i="6.00,190,1681196400"; 
   d="scan'208";a="333456042"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
  by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 May 2023 02:17:19 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10720"; a="879029153"
X-IronPort-AV: E=Sophos;i="6.00,190,1681196400"; 
   d="scan'208";a="879029153"
Received: from turnipsi.fi.intel.com (HELO kekkonen.fi.intel.com) ([10.237.72.44])
  by orsmga005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 May 2023 02:17:11 -0700
Received: from punajuuri.localdomain (punajuuri.localdomain [192.168.240.130])
        by kekkonen.fi.intel.com (Postfix) with ESMTP id DC420123036;
        Thu, 25 May 2023 12:16:49 +0300 (EEST)
Received: from sailus by punajuuri.localdomain with local (Exim 4.94.2)
        (envelope-from <sakari.ailus@linux.intel.com>)
        id 1q2758-009kqM-O9; Thu, 25 May 2023 12:16:26 +0300
From:   Sakari Ailus <sakari.ailus@linux.intel.com>
To:     linux-media@vger.kernel.org
Cc:     laurent.pinchart@ideasonboard.com,
        Philipp Zabel <p.zabel@pengutronix.de>, hverkuil@xs4all.nl,
        Francesco Dolcini <francesco@dolcini.it>,
        aishwarya.kothari@toradex.com, Robert Foss <rfoss@kernel.org>,
        Todor Tomov <todor.too@gmail.com>,
        Hyun Kwon <hyun.kwon@xilinx.com>, bingbu.cao@intel.com,
        niklas.soderlund@ragnatech.se,
        Kieran Bingham <kieran.bingham@ideasonboard.com>,
        Benjamin Mugnier <benjamin.mugnier@foss.st.com>,
        Sylvain Petinot <sylvain.petinot@foss.st.com>,
        Eugen Hristev <eugen.hristev@collabora.com>,
        Nicolas Ferre <nicolas.ferre@microchip.com>,
        Maxime Ripard <mripard@kernel.org>,
        Rui Miguel Silva <rmfrfs@gmail.com>,
        Fabio Estevam <festevam@gmail.com>,
        "Bryan O'Donoghue" <bryan.odonoghue@linaro.org>,
        Sylwester Nawrocki <s.nawrocki@samsung.com>,
        Dafna Hirschfeld <dafna@fastmail.com>,
        Hugues Fruchet <hugues.fruchet@foss.st.com>,
        Yong Deng <yong.deng@magewell.com>,
        Paul Kocialkowski <paul.kocialkowski@bootlin.com>,
        "Lad, Prabhakar" <prabhakar.csengg@gmail.com>,
        Benoit Parrot <bparrot@ti.com>,
        Steve Longerbeam <slongerbeam@gmail.com>,
        Thierry Reding <thierry.reding@gmail.com>,
        Jonathan Hunter <jonathanh@nvidia.com>,
        Sowjanya Komatineni <skomatineni@nvidia.com>,
        Marco Felsch <m.felsch@pengutronix.de>
Subject: [RESEND PATCH v3 32/32] media: Documentation: v4l: Document sub-device notifiers
Date:   Thu, 25 May 2023 12:16:15 +0300
Message-Id: <20230525091615.2324824-33-sakari.ailus@linux.intel.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20230525091615.2324824-1-sakari.ailus@linux.intel.com>
References: <20230525091615.2324824-1-sakari.ailus@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-4.3 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,SPF_HELO_PASS,
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

