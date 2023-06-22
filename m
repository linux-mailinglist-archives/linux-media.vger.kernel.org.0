Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id DC29B739FCA
	for <lists+linux-media@lfdr.de>; Thu, 22 Jun 2023 13:41:18 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230452AbjFVLlR (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 22 Jun 2023 07:41:17 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42230 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230348AbjFVLlO (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 22 Jun 2023 07:41:14 -0400
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 659611BF9
        for <linux-media@vger.kernel.org>; Thu, 22 Jun 2023 04:41:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1687434073; x=1718970073;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=/mTSxL7PYp2oPVqyLDTgbCsgQArjvs6KJotDNsCK3C0=;
  b=k6CUGhFH+Uloj5yCirrJZQjyNCVYAE3bbob87J5l/rwCx/z/3g0uL2g+
   Y6pggh00sY+D/tAUYgjlqXOfv8bqKOttpwvKSBxiANDs4x9Gt5Z0fzSB1
   fUAuo2tShKK7HwrRPYwhGcCG5uzp3PFd+zdo8V21hIpSIL9iBWj3my1CM
   4lwv6cZ6VWA4/BI6cm5FsqsgtGn6KfkC1Go2Q46OS0EHdembl/rwmun6g
   edbabi18cAHNVn3cL/UzMyXfxkROc/uVo6Yxt3ip/tB8hvoUPUSOmOFW3
   NS0geIyKMbZwW0NXyZsoGjSUvO3v7ng/qOu1SZd2Hohu5oHCi3rRTmVVG
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10748"; a="357957619"
X-IronPort-AV: E=Sophos;i="6.00,263,1681196400"; 
   d="scan'208";a="357957619"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
  by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Jun 2023 04:41:10 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10748"; a="804749891"
X-IronPort-AV: E=Sophos;i="6.00,263,1681196400"; 
   d="scan'208";a="804749891"
Received: from turnipsi.fi.intel.com (HELO kekkonen.fi.intel.com) ([10.237.72.44])
  by fmsmga003-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Jun 2023 04:41:02 -0700
Received: from punajuuri.localdomain (punajuuri.localdomain [192.168.240.130])
        by kekkonen.fi.intel.com (Postfix) with ESMTP id E1C22120B44;
        Thu, 22 Jun 2023 14:40:50 +0300 (EEST)
Received: from sailus by punajuuri.localdomain with local (Exim 4.96)
        (envelope-from <sakari.ailus@linux.intel.com>)
        id 1qCIg2-003oSa-2g;
        Thu, 22 Jun 2023 14:40:38 +0300
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
Subject: [PATCH v4 09/38] media: Documentation: v4l: Document missing async subdev function
Date:   Thu, 22 Jun 2023 14:39:59 +0300
Message-Id: <20230622114028.908825-10-sakari.ailus@linux.intel.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230622114028.908825-1-sakari.ailus@linux.intel.com>
References: <20230622114028.908825-1-sakari.ailus@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
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

Also v4l2_async_nf_add_fwnode() may be used to add an async sub-device
descriptor to a notifier. Document this. Also remove a redundant sentence.

Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>
Tested-by: Philipp Zabel <p.zabel@pengutronix.de> # imx6qp
Tested_by: Niklas Söderlund <niklas.soderlund@ragnatech.se> # rcar + adv746x
Reviewed-by: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
Tested-by: Aishwarya Kothari <aishwarya.kothari@toradex.com> # Apalis i.MX6Q with TC358743
---
 Documentation/driver-api/media/v4l2-subdev.rst | 14 +++++---------
 1 file changed, 5 insertions(+), 9 deletions(-)

diff --git a/Documentation/driver-api/media/v4l2-subdev.rst b/Documentation/driver-api/media/v4l2-subdev.rst
index 646bd00068be2..e463ab4a3413a 100644
--- a/Documentation/driver-api/media/v4l2-subdev.rst
+++ b/Documentation/driver-api/media/v4l2-subdev.rst
@@ -206,15 +206,11 @@ takes two arguments: a pointer to struct :c:type:`v4l2_device` and a
 pointer to struct :c:type:`v4l2_async_notifier`.
 
 Before registering the notifier, bridge drivers must do two things: first, the
-notifier must be initialized using the :c:func:`v4l2_async_nf_init`.
-Second, bridge drivers can then begin to form a list of subdevice descriptors
-that the bridge device needs for its operation. Several functions are available
-to add subdevice descriptors to a notifier, depending on the type of device and
-the needs of the driver.
-
-:c:func:`v4l2_async_nf_add_fwnode_remote` and
-:c:func:`v4l2_async_nf_add_i2c` are for bridge and ISP drivers for
-registering their async sub-devices with the notifier.
+notifier must be initialized using the :c:func:`v4l2_async_nf_init`.  Second,
+bridge drivers can then begin to form a list of subdevice descriptors that the
+bridge device needs for its operation. :c:func:`v4l2_async_nf_add_fwnode`,
+:c:func:`v4l2_async_nf_add_fwnode_remote` and :c:func:`v4l2_async_nf_add_i2c`
+are available for that purpose.
 
 Asynchronous sub-device registration helper for camera sensor drivers
 ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
-- 
2.39.2

