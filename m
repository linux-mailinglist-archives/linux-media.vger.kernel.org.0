Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 7A328764608
	for <lists+linux-media@lfdr.de>; Thu, 27 Jul 2023 07:47:14 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232487AbjG0FrN (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 27 Jul 2023 01:47:13 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35138 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232426AbjG0Fqz (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 27 Jul 2023 01:46:55 -0400
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A4CFD3A80
        for <linux-media@vger.kernel.org>; Wed, 26 Jul 2023 22:46:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1690436773; x=1721972773;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=f3O10ndvoM0+mtHG+s5Xxg2ZieBuLRXfG5r4lUNPRzQ=;
  b=G8ongPUv/joHOgMgrHrFwlPfoV51L3m+Dtg2Cjp6HyPrSApfMJ2LEpqZ
   V/sBIjoeepaS3RPMJU/Fu36fWlJ6EIWPe4idWVCcR8T63GTVdPJBBNuSt
   MqTzQBgfM3yGv+xDPzlrp4kjQQXZwpf6/SM52iB8s6sPCntRKH9gw3nyA
   rJbOqgR4JqZTO6etGKcN39iT7I8zxVAHSVM3gP3mG8ya2FjsZjQjA+eiM
   ISsgzIZElkqB7VPSI63bz3wh9t3NpizKVr+gmzTsQkxBq/w6hfxA8Jycx
   8tlvcvMSasnhh9vDfXMHTw+tWsyewerzcOPfPhXFNqQVCxtdnkfq5hTFp
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10783"; a="399150495"
X-IronPort-AV: E=Sophos;i="6.01,234,1684825200"; 
   d="scan'208";a="399150495"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
  by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Jul 2023 22:44:38 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10783"; a="840584041"
X-IronPort-AV: E=Sophos;i="6.01,234,1684825200"; 
   d="scan'208";a="840584041"
Received: from turnipsi.fi.intel.com (HELO kekkonen.fi.intel.com) ([10.237.72.44])
  by fmsmga002-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Jul 2023 22:44:30 -0700
Received: from punajuuri.localdomain (punajuuri.localdomain [192.168.240.130])
        by kekkonen.fi.intel.com (Postfix) with ESMTP id 95352120B17;
        Thu, 27 Jul 2023 08:44:18 +0300 (EEST)
Received: from sailus by punajuuri.localdomain with local (Exim 4.96)
        (envelope-from <sakari.ailus@linux.intel.com>)
        id 1qOtmD-004xqs-2e;
        Thu, 27 Jul 2023 08:43:05 +0300
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
Subject: [PATCH v6 09/38] media: Documentation: v4l: Document missing async subdev function
Date:   Thu, 27 Jul 2023 08:42:26 +0300
Message-Id: <20230727054255.1183255-10-sakari.ailus@linux.intel.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230727054255.1183255-1-sakari.ailus@linux.intel.com>
References: <20230727054255.1183255-1-sakari.ailus@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-4.3 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,
        RCVD_IN_MSPIKE_H3,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_NONE,
        T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Also v4l2_async_nf_add_fwnode() may be used to add an async sub-device
descriptor to a notifier. Document this. Also remove a redundant sentence.

Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>
Tested-by: Philipp Zabel <p.zabel@pengutronix.de> # imx6qp
Tested-by: Niklas Söderlund <niklas.soderlund@ragnatech.se> # rcar + adv746x
Reviewed-by: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
Tested-by: Aishwarya Kothari <aishwarya.kothari@toradex.com> # Apalis i.MX6Q with TC358743
Tested-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com> # Renesas RZ/G2L SMARC
---
 Documentation/driver-api/media/v4l2-subdev.rst | 14 +++++---------
 1 file changed, 5 insertions(+), 9 deletions(-)

diff --git a/Documentation/driver-api/media/v4l2-subdev.rst b/Documentation/driver-api/media/v4l2-subdev.rst
index 646bd00068be..e463ab4a3413 100644
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

