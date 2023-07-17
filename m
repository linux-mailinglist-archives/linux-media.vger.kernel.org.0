Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 7E15D75646C
	for <lists+linux-media@lfdr.de>; Mon, 17 Jul 2023 15:21:52 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230059AbjGQNVu (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 17 Jul 2023 09:21:50 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59520 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231543AbjGQNVd (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 17 Jul 2023 09:21:33 -0400
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 203F610C0
        for <linux-media@vger.kernel.org>; Mon, 17 Jul 2023 06:20:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1689600051; x=1721136051;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=a1KMuDUOEh6irIreyCoUShbyLMKEk3Dmfck6cxSMTQ0=;
  b=b6vITdl4TebbX8g8EE5gTTYEYtg52En4oS2ClpdQ8Wd2ECYne2F3yocA
   mPMq0c/pBJFrHwAWdmpq5aRngQROVe+17uzEoxYn3ZjjqRa5adzbxttgd
   ybwN/Q4JKr8vVfhKGtAPTmFOGg+3J54qPtiUGPCcCFEaUFUev3p6sLBXP
   EZv9zw1aKj0mYFK/gQsVulBIW63MoMCJ+WFjStEPkZ9CoLoy7D5AUhJnA
   yDO0roaAEeZTijW0IZS0J63B0LIbpfleC94jdpgHiGEVGxS8ZAo9eNUxw
   IFwp0TGQMynkqCJtC4JZILWo0uUNSjmIrLmPrtq8VJ5xLXqkKUkZw3fx6
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10774"; a="432097384"
X-IronPort-AV: E=Sophos;i="6.01,211,1684825200"; 
   d="scan'208";a="432097384"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
  by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Jul 2023 06:20:34 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10774"; a="726541896"
X-IronPort-AV: E=Sophos;i="6.01,211,1684825200"; 
   d="scan'208";a="726541896"
Received: from turnipsi.fi.intel.com (HELO kekkonen.fi.intel.com) ([10.237.72.44])
  by fmsmga007-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Jul 2023 06:20:27 -0700
Received: from punajuuri.localdomain (punajuuri.localdomain [192.168.240.130])
        by kekkonen.fi.intel.com (Postfix) with ESMTP id DBAB8120DCF;
        Mon, 17 Jul 2023 16:20:15 +0300 (EEST)
Received: from sailus by punajuuri.localdomain with local (Exim 4.96)
        (envelope-from <sakari.ailus@linux.intel.com>)
        id 1qLO8G-004s0P-05;
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
Subject: [PATCH v5 08/38] media: Documentation: v4l: Fix async sensor subdev helper documentation
Date:   Mon, 17 Jul 2023 16:18:39 +0300
Message-Id: <20230717131909.1160787-9-sakari.ailus@linux.intel.com>
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

Documentat that the notifier of an async sub-device is, besider
unregistered, also cleaned up using v4l2_async_unregister_subdev().

Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>
Tested-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com> # Renesas RZ/G2L SMARC
---
 Documentation/driver-api/media/v4l2-subdev.rst | 10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)

diff --git a/Documentation/driver-api/media/v4l2-subdev.rst b/Documentation/driver-api/media/v4l2-subdev.rst
index 3cc56ac8d221..646bd00068be 100644
--- a/Documentation/driver-api/media/v4l2-subdev.rst
+++ b/Documentation/driver-api/media/v4l2-subdev.rst
@@ -219,11 +219,11 @@ registering their async sub-devices with the notifier.
 Asynchronous sub-device registration helper for camera sensor drivers
 ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
 
-:c:func:`v4l2_async_register_subdev_sensor` is a helper function for
-sensor drivers registering their own async sub-device, but it also registers a
-notifier and further registers async sub-devices for lens and flash devices
-found in firmware. The notifier for the sub-device is unregistered with the
-async sub-device.
+:c:func:`v4l2_async_register_subdev_sensor` is a helper function for sensor
+drivers registering their own async sub-device, but it also registers a notifier
+and further registers async sub-devices for lens and flash devices found in
+firmware. The notifier for the sub-device is unregistered and cleaned up with
+the async sub-device, using :c:func:`v4l2_async_unregister_subdev`.
 
 Asynchronous sub-device notifier example
 ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
-- 
2.39.2

