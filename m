Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 083CB756477
	for <lists+linux-media@lfdr.de>; Mon, 17 Jul 2023 15:22:05 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231491AbjGQNWD (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 17 Jul 2023 09:22:03 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60070 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231611AbjGQNVj (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 17 Jul 2023 09:21:39 -0400
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id F041110CF
        for <linux-media@vger.kernel.org>; Mon, 17 Jul 2023 06:20:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1689600060; x=1721136060;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=Xzt893+X4Wu5dzLVX6QizHjEZJLuTS5bNsCjyNTAMLY=;
  b=eLmOvl/XQ4XgqgoD/Yicw+yDKg5jwhDqqDSAv59ls0II8z/3OfPgh4Wq
   h1+98zYiIckJPN8o5wnFBMN6j3P28tMcJd+LG0esJhGyN5YdSDNUgPmsg
   nBwRFyTlS5fi/1yRC5iu1YGoIADUyVmgEUdIB/rcC+RjZ83o4Y+xQRN42
   ehf5isG66tmRr5pejHeQ+0Kb+FuKc+VhXI1XU9CMS9vOXlMiWcnnedtax
   nOe9y/Ob1tP6fku0h8xoiEz+KMrtSHKMduBQw9oosTRzct2zGe2JjtDph
   puasV5Rk/e9HbL3Q0xb+3FNqlQlO4QDTl2iOqE/VaumU3P9X9tX9uLBBq
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10774"; a="432097558"
X-IronPort-AV: E=Sophos;i="6.01,211,1684825200"; 
   d="scan'208";a="432097558"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
  by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Jul 2023 06:20:36 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10774"; a="726541914"
X-IronPort-AV: E=Sophos;i="6.01,211,1684825200"; 
   d="scan'208";a="726541914"
Received: from turnipsi.fi.intel.com (HELO kekkonen.fi.intel.com) ([10.237.72.44])
  by fmsmga007-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Jul 2023 06:20:27 -0700
Received: from punajuuri.localdomain (punajuuri.localdomain [192.168.240.130])
        by kekkonen.fi.intel.com (Postfix) with ESMTP id E80D1120DF4;
        Mon, 17 Jul 2023 16:20:15 +0300 (EEST)
Received: from sailus by punajuuri.localdomain with local (Exim 4.96)
        (envelope-from <sakari.ailus@linux.intel.com>)
        id 1qLO8G-004s0Z-0F;
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
Subject: [PATCH v5 10/38] media: Documentation: v4l: Document v4l2_async_nf_cleanup
Date:   Mon, 17 Jul 2023 16:18:41 +0300
Message-Id: <20230717131909.1160787-11-sakari.ailus@linux.intel.com>
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

Document v4l2_async_nf_cleanup() which must be called before releasing an
unregistered notifier's memory. Also remove the sentence regarding
v4l2_async_nf_init() arguments --- those are documented in kerneldoc which
is referred here.

Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>
Tested-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com> # Renesas RZ/G2L SMARC
---
 Documentation/driver-api/media/v4l2-subdev.rst | 11 +++++------
 1 file changed, 5 insertions(+), 6 deletions(-)

diff --git a/Documentation/driver-api/media/v4l2-subdev.rst b/Documentation/driver-api/media/v4l2-subdev.rst
index e463ab4a3413..327d444f34dc 100644
--- a/Documentation/driver-api/media/v4l2-subdev.rst
+++ b/Documentation/driver-api/media/v4l2-subdev.rst
@@ -198,12 +198,11 @@ picked up by bridge drivers.
 Asynchronous sub-device notifiers
 ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
 
-Bridge drivers in turn have to register a notifier object. This is
-performed using the :c:func:`v4l2_async_nf_register` call. To
-unregister the notifier the driver has to call
-:c:func:`v4l2_async_nf_unregister`. The former of the two functions
-takes two arguments: a pointer to struct :c:type:`v4l2_device` and a
-pointer to struct :c:type:`v4l2_async_notifier`.
+Bridge drivers in turn have to register a notifier object. This is performed
+using the :c:func:`v4l2_async_nf_register` call. To unregister the notifier the
+driver has to call :c:func:`v4l2_async_nf_unregister`. Before releasing memory
+of an unregister notifier, it must be cleaned up by calling
+:c:func:`v4l2_async_nf_cleanup`.
 
 Before registering the notifier, bridge drivers must do two things: first, the
 notifier must be initialized using the :c:func:`v4l2_async_nf_init`.  Second,
-- 
2.39.2

