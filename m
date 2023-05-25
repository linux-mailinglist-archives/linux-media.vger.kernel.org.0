Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 029F1710895
	for <lists+linux-media@lfdr.de>; Thu, 25 May 2023 11:17:34 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S240595AbjEYJR3 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 25 May 2023 05:17:29 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52436 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S240453AbjEYJRW (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 25 May 2023 05:17:22 -0400
Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0530AA9
        for <linux-media@vger.kernel.org>; Thu, 25 May 2023 02:17:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1685006241; x=1716542241;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=X9CXNIfu7g52kWQW8CC+7Mtud54D6sd05ABI8z/1AIg=;
  b=R8qkBrvzGPSCqlZyb0sW7kKmuhdt+l/X2RQ4b5mtteYw2OGjBCS0NHKc
   gmHXQs4Ua7NUl5YSsxJkZTOrRWVA8nRfWRFz2b/CX0hEL8orL6R1SQMY1
   894Mr0IPWomFc9piE6ZHveQfGTNCP04esZVmCq2BhL9wu6FIe5zwY3sKX
   +zrw4oRShkjc7RuWnNbYSu5qGCC68vS5RiIRuZ8n2gqn7w23+Vu/9UZUh
   WtlIIlXwLZ6O60pA8/YkHURo1TE7mANjyJS+CIVnk8oSOY597YBfoRMXT
   Qttfjr9pYjdFgGMBr8J5Va4qgd0l0b2zUqc2X0OD4xuIsL4XCBUpgQmpb
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10720"; a="333455932"
X-IronPort-AV: E=Sophos;i="6.00,190,1681196400"; 
   d="scan'208";a="333455932"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
  by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 May 2023 02:17:18 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10720"; a="879029141"
X-IronPort-AV: E=Sophos;i="6.00,190,1681196400"; 
   d="scan'208";a="879029141"
Received: from turnipsi.fi.intel.com (HELO kekkonen.fi.intel.com) ([10.237.72.44])
  by orsmga005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 May 2023 02:17:10 -0700
Received: from punajuuri.localdomain (punajuuri.localdomain [192.168.240.130])
        by kekkonen.fi.intel.com (Postfix) with ESMTP id 985C3122FF9;
        Thu, 25 May 2023 12:16:49 +0300 (EEST)
Received: from sailus by punajuuri.localdomain with local (Exim 4.94.2)
        (envelope-from <sakari.ailus@linux.intel.com>)
        id 1q2758-009kpk-FH; Thu, 25 May 2023 12:16:26 +0300
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
Subject: [RESEND PATCH v3 22/32] media: adv748x: Return to endpoint matching
Date:   Thu, 25 May 2023 12:16:05 +0300
Message-Id: <20230525091615.2324824-23-sakari.ailus@linux.intel.com>
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

Return the two CSI-2 transmitters of adv748x to endpoint matching. This
should make the driver work again as expected.

Fixes: ("media: v4l: async: Simplify async sub-device fwnode matching")
Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>
---
 drivers/media/i2c/adv748x/adv748x-csi2.c | 12 +++++++++---
 1 file changed, 9 insertions(+), 3 deletions(-)

diff --git a/drivers/media/i2c/adv748x/adv748x-csi2.c b/drivers/media/i2c/adv748x/adv748x-csi2.c
index b6f93c1db3d2a..a5a7cb228896b 100644
--- a/drivers/media/i2c/adv748x/adv748x-csi2.c
+++ b/drivers/media/i2c/adv748x/adv748x-csi2.c
@@ -296,8 +296,6 @@ int adv748x_csi2_init(struct adv748x_state *state, struct adv748x_csi2 *tx)
 	if (!is_tx_enabled(tx))
 		return 0;
 
-	/* FIXME: Do endpoint matching again! */
-
 	adv748x_subdev_init(&tx->sd, state, &adv748x_csi2_ops,
 			    MEDIA_ENT_F_VID_IF_BRIDGE,
 			    is_txa(tx) ? "txa" : "txb");
@@ -313,10 +311,15 @@ int adv748x_csi2_init(struct adv748x_state *state, struct adv748x_csi2 *tx)
 	if (ret)
 		return ret;
 
-	ret = adv748x_csi2_init_controls(tx);
+	ret = v4l2_async_subdev_endpoint_add(&tx->sd,
+					     of_fwnode_handle(state->endpoints[tx->port]));
 	if (ret)
 		goto err_free_media;
 
+	ret = adv748x_csi2_init_controls(tx);
+	if (ret)
+		goto err_cleanup_subdev;
+
 	ret = v4l2_async_register_subdev(&tx->sd);
 	if (ret)
 		goto err_free_ctrl;
@@ -325,6 +328,8 @@ int adv748x_csi2_init(struct adv748x_state *state, struct adv748x_csi2 *tx)
 
 err_free_ctrl:
 	v4l2_ctrl_handler_free(&tx->ctrl_hdl);
+err_cleanup_subdev:
+	v4l2_subdev_cleanup(&tx->sd);
 err_free_media:
 	media_entity_cleanup(&tx->sd.entity);
 
@@ -339,4 +344,5 @@ void adv748x_csi2_cleanup(struct adv748x_csi2 *tx)
 	v4l2_async_unregister_subdev(&tx->sd);
 	media_entity_cleanup(&tx->sd.entity);
 	v4l2_ctrl_handler_free(&tx->ctrl_hdl);
+	v4l2_subdev_cleanup(&tx->sd);
 }
-- 
2.30.2

