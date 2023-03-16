Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id BAC0A6BD27B
	for <lists+linux-media@lfdr.de>; Thu, 16 Mar 2023 15:38:42 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231237AbjCPOil (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 16 Mar 2023 10:38:41 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45888 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230271AbjCPOik (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 16 Mar 2023 10:38:40 -0400
Received: from mx1.tq-group.com (mx1.tq-group.com [93.104.207.81])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 44CDD12870
        for <linux-media@vger.kernel.org>; Thu, 16 Mar 2023 07:38:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=tq-group.com; i=@tq-group.com; q=dns/txt; s=key1;
  t=1678977518; x=1710513518;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=mhnoEpspCtJRJReAh29qeaQUkE4Nu/+7CyEHyKvOT98=;
  b=dQVrXFLP3f1z8H6as14/McKPlNr1Namq9HW4xgIEIPuEk0EsS7dzgmm3
   UQlALaA0y5G7Mdb77zmzUWwTHB9BIYKmYEpU/UFbI7WPeza8WEZ2JXEUP
   /AIr7Ke11dqZSRMwBAdQuknfnEqOR4WMGFG8JVXvbYsEq2ExtO7XnVDrE
   koKgxj/M3aXjIaM58UsyWluUh/GlGDtuWOrgM8g9pke69IOZwn6pnEea6
   EjhqkvGMhiRbGzEGh4LXobCklRUBFHmisDxPyrXC/VZEQ/lDC6DLkXy+k
   +tuezVKBSzmfsXDz1A01krbPkfayPkLr5QbtV8l4bQSzyJCmA8tT/N1Qm
   w==;
X-IronPort-AV: E=Sophos;i="5.98,265,1673910000"; 
   d="scan'208";a="29742384"
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
  bh=mhnoEpspCtJRJReAh29qeaQUkE4Nu/+7CyEHyKvOT98=;
  b=Cfhz6xRaNwACAPhxdW3XImGE23HUC8sW3L4ry24QxMHB8dyMVTeG3mwc
   o5cq3FtLJuvm8VaogbhqsJrlgZj4WeOOpoNvYHF/b17POJKSmoByPop/m
   gMGmUtzkwM40PAG/Nj/CBGtoIqC/OTWGXGXqeeSKJLnqdyn/bmGfMIOqY
   d+cpeuqNWc3qlqCBBI2HsAgZ1C95oZEsJdD4MxrR1ztQb8gaPDC+VTTUF
   mSkAb7AnuFRVU+nqeMCJ/qOXdBynVDsnB2dcGIzSJErUVabpOBs0sQXLw
   lQ+3jTO4qeI8hQldYBCYY+yl+Xn/XYFrLNQdUtpte5ycRSj3enMPOhv04
   g==;
X-IronPort-AV: E=Sophos;i="5.98,265,1673910000"; 
   d="scan'208";a="29742383"
Received: from vtuxmail01.tq-net.de ([10.115.0.20])
  by mx1.tq-group.com with ESMTP; 16 Mar 2023 15:38:34 +0100
Received: from steina-w.tq-net.de (unknown [10.123.53.21])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
        (No client certificate requested)
        by vtuxmail01.tq-net.de (Postfix) with ESMTPSA id 2B21A280072;
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
Subject: [PATCH 1/3] media: imx: imx7-media-csi: Fix mbus framefmt field init
Date:   Thu, 16 Mar 2023 15:38:27 +0100
Message-Id: <20230316143829.499039-2-alexander.stein@ew.tq-group.com>
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

Default to non-interleaving.

Fixes: bc0d3df31ffe ("media: imx: imx7-media-csi: Simplify imx7_csi_video_init_format()")
Signed-off-by: Alexander Stein <alexander.stein@ew.tq-group.com>
---
 drivers/media/platform/nxp/imx7-media-csi.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/media/platform/nxp/imx7-media-csi.c b/drivers/media/platform/nxp/imx7-media-csi.c
index c22bf5c827e7..3e97b9f2ff69 100644
--- a/drivers/media/platform/nxp/imx7-media-csi.c
+++ b/drivers/media/platform/nxp/imx7-media-csi.c
@@ -1610,6 +1610,7 @@ static int imx7_csi_video_init_format(struct imx7_csi *csi)
 	format.code = IMX7_CSI_DEF_MBUS_CODE;
 	format.width = IMX7_CSI_DEF_PIX_WIDTH;
 	format.height = IMX7_CSI_DEF_PIX_HEIGHT;
+	format.field = V4L2_FIELD_NONE;
 
 	imx7_csi_mbus_fmt_to_pix_fmt(&csi->vdev_fmt, &format, NULL);
 	csi->vdev_compose.width = format.width;
-- 
2.34.1

