Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 3611A739FD7
	for <lists+linux-media@lfdr.de>; Thu, 22 Jun 2023 13:41:39 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230478AbjFVLlh (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 22 Jun 2023 07:41:37 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42520 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229806AbjFVLl3 (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 22 Jun 2023 07:41:29 -0400
Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id F328919A9
        for <linux-media@vger.kernel.org>; Thu, 22 Jun 2023 04:41:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1687434086; x=1718970086;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=PH/Lt4USvLPg7ZduDLBxRfHE9SEtNE5Iotd2RME68jo=;
  b=YXb9cLLb4uOX4dBnMbMcMNP/KvkXT6Zk1juNpCztlos+hw7HcO240BDq
   LdphxO1RGeenML+MHVTMB+3xIUq6OZJbyvdYnh0nZOQRuN2UcIYMwyRdp
   H4Q7ySwBKdLmmze3Qwxu7V9ZGSR5RYbHKJnh4OZuzEkwJzWhb7ZcLcLhX
   laP1kb9S6dB2FHYmKwmHlmzzeEhA8+oRffVRbMcq5+FUjz1uJqLKcto4z
   o3owYM6rRZn0Kj9lS6jHJc/k8dRe8qVduflU+De0U/uuXrok/F2ui2c5K
   EqfHHFXbX67580mPopZ2LMTckpdjZxKcDP5jrG4GU3UnkbliImaB9/nJD
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10748"; a="340800371"
X-IronPort-AV: E=Sophos;i="6.00,263,1681196400"; 
   d="scan'208";a="340800371"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
  by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Jun 2023 04:41:21 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10748"; a="839013549"
X-IronPort-AV: E=Sophos;i="6.00,263,1681196400"; 
   d="scan'208";a="839013549"
Received: from turnipsi.fi.intel.com (HELO kekkonen.fi.intel.com) ([10.237.72.44])
  by orsmga004-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Jun 2023 04:41:12 -0700
Received: from punajuuri.localdomain (punajuuri.localdomain [192.168.240.130])
        by kekkonen.fi.intel.com (Postfix) with ESMTP id 48327120ECD;
        Thu, 22 Jun 2023 14:40:51 +0300 (EEST)
Received: from sailus by punajuuri.localdomain with local (Exim 4.96)
        (envelope-from <sakari.ailus@linux.intel.com>)
        id 1qCIg3-003oU7-0f;
        Thu, 22 Jun 2023 14:40:39 +0300
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
Subject: [PATCH v4 28/38] media: adv748x: Return to endpoint matching
Date:   Thu, 22 Jun 2023 14:40:18 +0300
Message-Id: <20230622114028.908825-29-sakari.ailus@linux.intel.com>
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

Return the two CSI-2 transmitters of adv748x to endpoint matching. This
should make the driver work again as expected.

Fixes: ("media: v4l: async: Simplify async sub-device fwnode matching")
Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>
Tested-by: Philipp Zabel <p.zabel@pengutronix.de> # imx6qp
Tested_by: Niklas Söderlund <niklas.soderlund@ragnatech.se> # rcar + adv746x
Tested-by: Aishwarya Kothari <aishwarya.kothari@toradex.com> # Apalis i.MX6Q with TC358743
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
2.39.2

