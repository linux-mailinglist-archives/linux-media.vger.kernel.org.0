Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 748D9739FEA
	for <lists+linux-media@lfdr.de>; Thu, 22 Jun 2023 13:43:23 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230456AbjFVLnW (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 22 Jun 2023 07:43:22 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43964 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230494AbjFVLnQ (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 22 Jun 2023 07:43:16 -0400
Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9863B1A1
        for <linux-media@vger.kernel.org>; Thu, 22 Jun 2023 04:43:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1687434190; x=1718970190;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=mv3/Q5Paf4anZobnHN6el0/WVffgVJe8R8rvzOxKTCk=;
  b=cyca99rEN3SGy4Y81rEcFLFKgKVOO+QAPnhIxlQpWFJ2t+kSsjqw81hQ
   0XkPwXPhkPPi3Mt7xmGkWDMvgnT/NZ3JmiBXMzPZMVvKNtVDY1+QwizO7
   14C7A4YQruFKCsNRK3/hzEWLX1hUU6owxaL5SbjHaVVzyeLmR10u9K1Zl
   WSS3YzTudpNRxlg9Xe+Kd4c4CNS9QyNzT/d5afMAB4GmJCyGUdKM+KvYa
   96/uZOUrFshYaCSIT4tWYqRs23Vnh/V6U3RSGz9IxkQMvAnGzb21E/0zh
   oVsAYw/fFkEK8kHTqVVKpsTUlRuFzgHta0wTQOhiaMyNUhMfONCeOn9xf
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10748"; a="340800746"
X-IronPort-AV: E=Sophos;i="6.00,263,1681196400"; 
   d="scan'208";a="340800746"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
  by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Jun 2023 04:41:30 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10748"; a="839013590"
X-IronPort-AV: E=Sophos;i="6.00,263,1681196400"; 
   d="scan'208";a="839013590"
Received: from turnipsi.fi.intel.com (HELO kekkonen.fi.intel.com) ([10.237.72.44])
  by orsmga004-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Jun 2023 04:41:22 -0700
Received: from punajuuri.localdomain (punajuuri.localdomain [192.168.240.130])
        by kekkonen.fi.intel.com (Postfix) with ESMTP id 7177F120EFE;
        Thu, 22 Jun 2023 14:40:51 +0300 (EEST)
Received: from sailus by punajuuri.localdomain with local (Exim 4.96)
        (envelope-from <sakari.ailus@linux.intel.com>)
        id 1qCIg3-003oUl-1D;
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
Subject: [PATCH v4 36/38] media: qcom: Initialise V4L2 async notifier later
Date:   Thu, 22 Jun 2023 14:40:26 +0300
Message-Id: <20230622114028.908825-37-sakari.ailus@linux.intel.com>
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

Initialise V4L2 async notifier and parse DT for async sub-devices later,
just before registering the notifier. This way the device can be made
available to the V4L2 async framework from the notifier init time onwards.
A subsequent patch will add struct v4l2_device as an argument to
v4l2_async_nf_init().

Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>
Tested-by: Philipp Zabel <p.zabel@pengutronix.de> # imx6qp
Tested_by: Niklas Söderlund <niklas.soderlund@ragnatech.se> # rcar + adv746x
Tested-by: Aishwarya Kothari <aishwarya.kothari@toradex.com> # Apalis i.MX6Q with TC358743
---
 drivers/media/platform/qcom/camss/camss.c | 21 ++++++++++-----------
 1 file changed, 10 insertions(+), 11 deletions(-)

diff --git a/drivers/media/platform/qcom/camss/camss.c b/drivers/media/platform/qcom/camss/camss.c
index 006855bf076b7..b89e2bb5b505e 100644
--- a/drivers/media/platform/qcom/camss/camss.c
+++ b/drivers/media/platform/qcom/camss/camss.c
@@ -1615,14 +1615,6 @@ static int camss_probe(struct platform_device *pdev)
 	if (!camss->vfe)
 		return -ENOMEM;
 
-	v4l2_async_nf_init(&camss->notifier);
-
-	num_subdevs = camss_of_parse_ports(camss);
-	if (num_subdevs < 0) {
-		ret = num_subdevs;
-		goto err_cleanup;
-	}
-
 	ret = camss_icc_get(camss);
 	if (ret < 0)
 		goto err_cleanup;
@@ -1648,9 +1640,17 @@ static int camss_probe(struct platform_device *pdev)
 		goto err_cleanup;
 	}
 
+	v4l2_async_nf_init(&camss->notifier);
+
+	num_subdevs = camss_of_parse_ports(camss);
+	if (num_subdevs < 0) {
+		ret = num_subdevs;
+		goto err_cleanup;
+	}
+
 	ret = camss_register_entities(camss);
 	if (ret < 0)
-		goto err_register_entities;
+		goto err_cleanup;
 
 	if (num_subdevs) {
 		camss->notifier.ops = &camss_subdev_notifier_ops;
@@ -1691,9 +1691,8 @@ static int camss_probe(struct platform_device *pdev)
 
 err_register_subdevs:
 	camss_unregister_entities(camss);
-err_register_entities:
-	v4l2_device_unregister(&camss->v4l2_dev);
 err_cleanup:
+	v4l2_device_unregister(&camss->v4l2_dev);
 	v4l2_async_nf_cleanup(&camss->notifier);
 
 	return ret;
-- 
2.39.2

