Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 1831476461E
	for <lists+linux-media@lfdr.de>; Thu, 27 Jul 2023 07:48:49 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231502AbjG0Fsr (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 27 Jul 2023 01:48:47 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35280 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232649AbjG0FsA (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 27 Jul 2023 01:48:00 -0400
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 52E9735BE
        for <linux-media@vger.kernel.org>; Wed, 26 Jul 2023 22:47:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1690436833; x=1721972833;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=/lrPOd/YWfva9exB2/nlotJsaC08PMPjT9ER5qtkYBE=;
  b=OQNA1qxnBSfyBZ9IV5lOJUDY303QYtCwWNy5V3a4iFb2xuhdtyryxhLW
   TJYpD5QsOveZ5IEC0UjVz6GEXwxTyTzhA6rQPHmhx8Llt0sVuAl2rNC1D
   7M2h9CzWOGzeD8xm1b24T4kBWUUQ8YgTg1qLb0Ko/YF8RvL1bXcAwKXzB
   appMFuTzaIOQJl9yJDDvti8ExQ2RyZLkdUIAoKcy3uuclMoPo8+vpJiYS
   tbvAG6yofBqy0r4ycwv8Y8GLfBaq2m9UUZuI6HqPAtpPeAYdyAaV7tfVI
   9c631Oxzt1Qc950kQsMGoUSt+GVsOo5J/R4aU2HpNdZnrDFJAsUvjc81A
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10783"; a="399150876"
X-IronPort-AV: E=Sophos;i="6.01,234,1684825200"; 
   d="scan'208";a="399150876"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
  by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Jul 2023 22:44:47 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10783"; a="840584113"
X-IronPort-AV: E=Sophos;i="6.01,234,1684825200"; 
   d="scan'208";a="840584113"
Received: from turnipsi.fi.intel.com (HELO kekkonen.fi.intel.com) ([10.237.72.44])
  by fmsmga002-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Jul 2023 22:44:39 -0700
Received: from punajuuri.localdomain (punajuuri.localdomain [192.168.240.130])
        by kekkonen.fi.intel.com (Postfix) with ESMTP id 0FC5512218C;
        Thu, 27 Jul 2023 08:44:19 +0300 (EEST)
Received: from sailus by punajuuri.localdomain with local (Exim 4.96)
        (envelope-from <sakari.ailus@linux.intel.com>)
        id 1qOtmE-004xsP-0s;
        Thu, 27 Jul 2023 08:43:06 +0300
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
Subject: [PATCH v6 28/38] media: adv748x: Return to endpoint matching
Date:   Thu, 27 Jul 2023 08:42:45 +0300
Message-Id: <20230727054255.1183255-29-sakari.ailus@linux.intel.com>
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

Return the two CSI-2 transmitters of adv748x to endpoint matching. This
should make the driver work again as expected.

Fixes: ("media: v4l: async: Simplify async sub-device fwnode matching")
Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>
Tested-by: Philipp Zabel <p.zabel@pengutronix.de> # imx6qp
Tested-by: Niklas Söderlund <niklas.soderlund@ragnatech.se> # rcar + adv746x
Tested-by: Aishwarya Kothari <aishwarya.kothari@toradex.com> # Apalis i.MX6Q with TC358743
Tested-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com> # Renesas RZ/G2L SMARC
---
 drivers/media/i2c/adv748x/adv748x-csi2.c | 12 +++++++++---
 1 file changed, 9 insertions(+), 3 deletions(-)

diff --git a/drivers/media/i2c/adv748x/adv748x-csi2.c b/drivers/media/i2c/adv748x/adv748x-csi2.c
index b6f93c1db3d2..a5a7cb228896 100644
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

