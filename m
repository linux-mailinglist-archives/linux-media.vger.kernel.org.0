Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 4D0107564A0
	for <lists+linux-media@lfdr.de>; Mon, 17 Jul 2023 15:22:34 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231808AbjGQNW1 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 17 Jul 2023 09:22:27 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59978 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231447AbjGQNVm (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 17 Jul 2023 09:21:42 -0400
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7846910F0
        for <linux-media@vger.kernel.org>; Mon, 17 Jul 2023 06:21:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1689600068; x=1721136068;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=rlT82juVxiJVXw7MUga4BMjvjtEVh9zD3AAL+gW6Ss0=;
  b=WOiVlWOGcFrhEbY8SbaWELLv3SH6H5CQB+wcVnp2FyTaxb4o+pxzBvVq
   qdNdTC/zkm7P1XGFQOoOqOKMibLhy1BR4nNxAhdJ3ik77LIxgviOuMvnj
   TD8jAOD1z/c5cBgG+AzwE0VT45+oduE4bkwwwVJZpc58vE21lkE/ZNCo7
   G/RQTZRpLsLb/DBtV+is7FLdXFU493ImxSx3fE3vG8AZjaZNDdoggWh7L
   YXtaFX4PhOrjGsJz7j5sVeyvxiu7Hhk62+KZiXirnYrsdW/Wl+1BzSm9z
   WkaXeZrkh5GRWHclVGkBxhlnQsqNEdIM9VngP609BUwSgylLzj5ZXVS7r
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10774"; a="432097948"
X-IronPort-AV: E=Sophos;i="6.01,211,1684825200"; 
   d="scan'208";a="432097948"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
  by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Jul 2023 06:20:52 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10774"; a="726542007"
X-IronPort-AV: E=Sophos;i="6.01,211,1684825200"; 
   d="scan'208";a="726542007"
Received: from turnipsi.fi.intel.com (HELO kekkonen.fi.intel.com) ([10.237.72.44])
  by fmsmga007-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Jul 2023 06:20:36 -0700
Received: from punajuuri.localdomain (punajuuri.localdomain [192.168.240.130])
        by kekkonen.fi.intel.com (Postfix) with ESMTP id 2F817121040;
        Mon, 17 Jul 2023 16:20:16 +0300 (EEST)
Received: from sailus by punajuuri.localdomain with local (Exim 4.96)
        (envelope-from <sakari.ailus@linux.intel.com>)
        id 1qLO8G-004s1N-12;
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
Subject: [PATCH v5 20/38] media: v4l: async: Clean up error handling in v4l2_async_match_notify
Date:   Mon, 17 Jul 2023 16:18:51 +0300
Message-Id: <20230717131909.1160787-21-sakari.ailus@linux.intel.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230717131909.1160787-1-sakari.ailus@linux.intel.com>
References: <20230717131909.1160787-1-sakari.ailus@linux.intel.com>
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

Add labels for error handling instead of doing it all in individual cases.
Prepare for more functionality in this function.

Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>
Tested-by: Philipp Zabel <p.zabel@pengutronix.de> # imx6qp
Tested-by: Niklas Söderlund <niklas.soderlund@ragnatech.se> # rcar + adv746x
Reviewed-by: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
Tested-by: Aishwarya Kothari <aishwarya.kothari@toradex.com> # Apalis i.MX6Q with TC358743
Tested-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com> # Renesas RZ/G2L SMARC
---
 drivers/media/v4l2-core/v4l2-async.c | 21 ++++++++++++---------
 1 file changed, 12 insertions(+), 9 deletions(-)

diff --git a/drivers/media/v4l2-core/v4l2-async.c b/drivers/media/v4l2-core/v4l2-async.c
index 9964d7f38480..0a9c9fb2a42c 100644
--- a/drivers/media/v4l2-core/v4l2-async.c
+++ b/drivers/media/v4l2-core/v4l2-async.c
@@ -320,10 +320,8 @@ static int v4l2_async_match_notify(struct v4l2_async_notifier *notifier,
 		return ret;
 
 	ret = v4l2_async_nf_call_bound(notifier, sd, asc);
-	if (ret < 0) {
-		v4l2_device_unregister_subdev(sd);
-		return ret;
-	}
+	if (ret < 0)
+		goto err_unregister_subdev;
 
 	/*
 	 * Depending of the function of the entities involved, we may want to
@@ -332,11 +330,8 @@ static int v4l2_async_match_notify(struct v4l2_async_notifier *notifier,
 	 * pad).
 	 */
 	ret = v4l2_async_create_ancillary_links(notifier, sd);
-	if (ret) {
-		v4l2_async_nf_call_unbind(notifier, sd, asc);
-		v4l2_device_unregister_subdev(sd);
-		return ret;
-	}
+	if (ret)
+		goto err_call_unbind;
 
 	list_del(&asc->waiting_entry);
 	sd->asd = asc;
@@ -363,6 +358,14 @@ static int v4l2_async_match_notify(struct v4l2_async_notifier *notifier,
 	subdev_notifier->parent = notifier;
 
 	return v4l2_async_nf_try_all_subdevs(subdev_notifier);
+
+err_call_unbind:
+	v4l2_async_nf_call_unbind(notifier, sd, asc);
+
+err_unregister_subdev:
+	v4l2_device_unregister_subdev(sd);
+
+	return ret;
 }
 
 /* Test all async sub-devices in a notifier for a match. */
-- 
2.39.2

