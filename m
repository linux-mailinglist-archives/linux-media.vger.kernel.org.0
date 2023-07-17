Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id ED4AA756472
	for <lists+linux-media@lfdr.de>; Mon, 17 Jul 2023 15:21:59 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231591AbjGQNV6 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 17 Jul 2023 09:21:58 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60064 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230266AbjGQNVi (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 17 Jul 2023 09:21:38 -0400
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5F3D12117
        for <linux-media@vger.kernel.org>; Mon, 17 Jul 2023 06:20:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1689600056; x=1721136056;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=dvXeObm01cacBHkSeEi8+dxxH50yIwH4oxysJ+x7xn0=;
  b=VKPAir1wPgC2mxiog/9yWlnnsl0yKFa4+EOB84hoKmSyVC/eD8QS8Ncw
   5C1CDkZaJtolen+m++EBqQU39FGVLvvker8GVKDhS5peqXNYmCPcmJcYZ
   ualYwwimgTmjU3O4Uh9g6saGZ/gVzYtf1z2YHmcbVJQu9hBF/5olQTcRc
   wyJhv+i66SLyrvpTLBrZKj357luwTW1bTTV37+gfMmaxw1hymrpuUSI+C
   lutiQtJvmVAmj/QZx2KD5alRSRI0z1wr7FSRsYWbw6i1NZ3KT/vRRnMIG
   4MIQfnJ71OHemAGB3X05WCO5OVFmEum15iN/jtZslx/bD4Fuz7q2AJsHE
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10774"; a="432097447"
X-IronPort-AV: E=Sophos;i="6.01,211,1684825200"; 
   d="scan'208";a="432097447"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
  by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Jul 2023 06:20:35 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10774"; a="726541905"
X-IronPort-AV: E=Sophos;i="6.01,211,1684825200"; 
   d="scan'208";a="726541905"
Received: from turnipsi.fi.intel.com (HELO kekkonen.fi.intel.com) ([10.237.72.44])
  by fmsmga007-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Jul 2023 06:20:27 -0700
Received: from punajuuri.localdomain (punajuuri.localdomain [192.168.240.130])
        by kekkonen.fi.intel.com (Postfix) with ESMTP id D5A96120D7C;
        Mon, 17 Jul 2023 16:20:15 +0300 (EEST)
Received: from sailus by punajuuri.localdomain with local (Exim 4.96)
        (envelope-from <sakari.ailus@linux.intel.com>)
        id 1qLO8G-004s0K-01;
        Mon, 17 Jul 2023 16:19:20 +0300
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
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
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
Subject: [PATCH v5 07/38] media: Documentation: v4l: Add section titles for async
Date:   Mon, 17 Jul 2023 16:18:38 +0300
Message-Id: <20230717131909.1160787-8-sakari.ailus@linux.intel.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230717131909.1160787-1-sakari.ailus@linux.intel.com>
References: <20230717131909.1160787-1-sakari.ailus@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-4.3 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,SPF_HELO_NONE,
        SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Add section titles for async documentation. While the documentation is
mostly fine as-is, it has grown from its original state but remains
without internal structure. Add it now.

Also remove an extra newline.

Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>
Tested-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com> # Renesas RZ/G2L SMARC
---
 .../driver-api/media/v4l2-subdev.rst          | 19 ++++++++++++++++++-
 1 file changed, 18 insertions(+), 1 deletion(-)

diff --git a/Documentation/driver-api/media/v4l2-subdev.rst b/Documentation/driver-api/media/v4l2-subdev.rst
index c46511c9b6c8..3cc56ac8d221 100644
--- a/Documentation/driver-api/media/v4l2-subdev.rst
+++ b/Documentation/driver-api/media/v4l2-subdev.rst
@@ -157,6 +157,9 @@ below.
 Using one or the other registration method only affects the probing process, the
 run-time bridge-subdevice interaction is in both cases the same.
 
+Registering synchronous sub-devices
+^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
+
 In the **synchronous** case a device (bridge) driver needs to register the
 :c:type:`v4l2_subdev` with the v4l2_device:
 
@@ -175,10 +178,12 @@ You can unregister a sub-device using:
 	:c:func:`v4l2_device_unregister_subdev <v4l2_device_unregister_subdev>`
 	(:c:type:`sd <v4l2_subdev>`).
 
-
 Afterwards the subdev module can be unloaded and
 :c:type:`sd <v4l2_subdev>`->dev == ``NULL``.
 
+Registering asynchronous sub-devices
+^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
+
 In the **asynchronous** case subdevice probing can be invoked independently of
 the bridge driver availability. The subdevice driver then has to verify whether
 all the requirements for a successful probing are satisfied. This can include a
@@ -190,6 +195,9 @@ performed using the :c:func:`v4l2_async_unregister_subdev` call. Subdevices
 registered this way are stored in a global list of subdevices, ready to be
 picked up by bridge drivers.
 
+Asynchronous sub-device notifiers
+^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
+
 Bridge drivers in turn have to register a notifier object. This is
 performed using the :c:func:`v4l2_async_nf_register` call. To
 unregister the notifier the driver has to call
@@ -208,12 +216,18 @@ the needs of the driver.
 :c:func:`v4l2_async_nf_add_i2c` are for bridge and ISP drivers for
 registering their async sub-devices with the notifier.
 
+Asynchronous sub-device registration helper for camera sensor drivers
+^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
+
 :c:func:`v4l2_async_register_subdev_sensor` is a helper function for
 sensor drivers registering their own async sub-device, but it also registers a
 notifier and further registers async sub-devices for lens and flash devices
 found in firmware. The notifier for the sub-device is unregistered with the
 async sub-device.
 
+Asynchronous sub-device notifier example
+^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
+
 These functions allocate an async sub-device descriptor which is of type struct
 :c:type:`v4l2_async_subdev` embedded in a driver-specific struct. The &struct
 :c:type:`v4l2_async_subdev` shall be the first member of this struct:
@@ -237,6 +251,9 @@ These functions allocate an async sub-device descriptor which is of type struct
 	if (IS_ERR(my_asd))
 		return PTR_ERR(my_asd);
 
+Asynchronous sub-device notifier callbacks
+^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
+
 The V4L2 core will then use these descriptors to match asynchronously
 registered subdevices to them. If a match is detected the ``.bound()``
 notifier callback is called. After all subdevices have been located the
-- 
2.39.2

