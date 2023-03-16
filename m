Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 03B686BD27C
	for <lists+linux-media@lfdr.de>; Thu, 16 Mar 2023 15:38:44 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229659AbjCPOin (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 16 Mar 2023 10:38:43 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45962 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231208AbjCPOil (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 16 Mar 2023 10:38:41 -0400
Received: from mx1.tq-group.com (mx1.tq-group.com [93.104.207.81])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C028B6773C
        for <linux-media@vger.kernel.org>; Thu, 16 Mar 2023 07:38:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=tq-group.com; i=@tq-group.com; q=dns/txt; s=key1;
  t=1678977520; x=1710513520;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=bLu9zhi97wGXbZiCwmF/Y8gYg8cqIwM7tO7VNBtzc58=;
  b=ffhEtZCtMXK9ErDBCNDA6J2SIFCi5Gtc5LFHzQZ3OdAm212mnoD5LP5B
   nRuNFBGLpYXINoHPqqdKgAvz892YUV1JwjDBL4rfSyP7voDpVXUjyA+6d
   hH0lD1/OuncLm1a/iKybJyjy438E8ZipBOWEWeDKe1wj9s1Qo4vgPh2OT
   m1BslCRJ/Kc51saS/+unNI2pzwp0tTtKTLePKmH460ddd21pups291oNS
   VxGJG4Ag8RSJASiE6Dco9twVYpM4eugPFlkFU3ze1Y4RROW21Dyi2J4EI
   u+OfVrQKeKiuRMbILdWEhvJgMP0ALd6lzR7K6NGVZNQREUx3leEBtZ8p+
   w==;
X-IronPort-AV: E=Sophos;i="5.98,265,1673910000"; 
   d="scan'208";a="29742386"
Received: from unknown (HELO tq-pgp-pr1.tq-net.de) ([192.168.6.15])
  by mx1-pgp.tq-group.com with ESMTP; 16 Mar 2023 15:38:34 +0100
Received: from mx1.tq-group.com ([192.168.6.7])
  by tq-pgp-pr1.tq-net.de (PGP Universal service);
  Thu, 16 Mar 2023 15:38:34 +0100
X-PGP-Universal: processed;
        by tq-pgp-pr1.tq-net.de on Thu, 16 Mar 2023 15:38:34 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=tq-group.com; i=@tq-group.com; q=dns/txt; s=key1;
  t=1678977514; x=1710513514;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=bLu9zhi97wGXbZiCwmF/Y8gYg8cqIwM7tO7VNBtzc58=;
  b=kOK/ayRFK4xMscGxe69eVTU7Ww2dpmFnqGYUruGjRn+NGM1GTX0ltgMY
   2SjYSItgfJ/t9iNX+VqzcMoz24BvJk0ByKVymmWLjfmGF90Pe07/9Bx7v
   wnQ7voSlx5PgA/gWri/XlZp07SoAHqN2ck3Oy/wJnm581Vm76+s9wGOUz
   NfWmj26Lo25Mldd9DUey9bMVZSsFkN2X/osd1dqzRLTVyN/s0wIDEPcqr
   9vL/r/eIkp18p1hqP4JLIGHYGnk8Kr0AAKhCclEk+naUyTjFqlbZjTzsO
   U3VD8z5zCO1rm3ntCjPN3wqk4iu3PWTSyNdLJVOWAA82McHWDJdet+Nh4
   w==;
X-IronPort-AV: E=Sophos;i="5.98,265,1673910000"; 
   d="scan'208";a="29742385"
Received: from vtuxmail01.tq-net.de ([10.115.0.20])
  by mx1.tq-group.com with ESMTP; 16 Mar 2023 15:38:34 +0100
Received: from steina-w.tq-net.de (unknown [10.123.53.21])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
        (No client certificate requested)
        by vtuxmail01.tq-net.de (Postfix) with ESMTPSA id 638E1280056;
        Thu, 16 Mar 2023 15:38:34 +0100 (CET)
From:   Alexander Stein <alexander.stein@ew.tq-group.com>
To:     Rui Miguel Silva <rmfrfs@gmail.com>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Shawn Guo <shawnguo@kernel.org>,
        Sascha Hauer <s.hauer@pengutronix.de>,
        Pengutronix Kernel Team <kernel@pengutronix.de>,
        Fabio Estevam <festevam@gmail.com>,
        NXP Linux Team <linux-imx@nxp.com>
Cc:     Alexander Stein <alexander.stein@ew.tq-group.com>,
        linux-media@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Subject: [PATCH 2/3] media: imx: imx7-media-csi: Fail on invalid type in VIDIOC_G_SELECTION
Date:   Thu, 16 Mar 2023 15:38:28 +0100
Message-Id: <20230316143829.499039-3-alexander.stein@ew.tq-group.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230316143829.499039-1-alexander.stein@ew.tq-group.com>
References: <20230316143829.499039-1-alexander.stein@ew.tq-group.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.0 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

This device only supports video capture, so bail out if invalid
selection type is passed.

Signed-off-by: Alexander Stein <alexander.stein@ew.tq-group.com>
---
 drivers/media/platform/nxp/imx7-media-csi.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/drivers/media/platform/nxp/imx7-media-csi.c b/drivers/media/platform/nxp/imx7-media-csi.c
index 3e97b9f2ff69..389d7d88b341 100644
--- a/drivers/media/platform/nxp/imx7-media-csi.c
+++ b/drivers/media/platform/nxp/imx7-media-csi.c
@@ -1214,6 +1214,9 @@ static int imx7_csi_video_g_selection(struct file *file, void *fh,
 {
 	struct imx7_csi *csi = video_drvdata(file);
 
+	if (s->type != V4L2_BUF_TYPE_VIDEO_CAPTURE)
+		return -EINVAL;
+
 	switch (s->target) {
 	case V4L2_SEL_TGT_COMPOSE:
 	case V4L2_SEL_TGT_COMPOSE_DEFAULT:
-- 
2.34.1

