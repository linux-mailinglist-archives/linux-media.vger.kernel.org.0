Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id F153B6C2B54
	for <lists+linux-media@lfdr.de>; Tue, 21 Mar 2023 08:27:20 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229843AbjCUH1U (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 21 Mar 2023 03:27:20 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54490 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229684AbjCUH1S (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 21 Mar 2023 03:27:18 -0400
Received: from mx1.tq-group.com (mx1.tq-group.com [93.104.207.81])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3A84C33CD0
        for <linux-media@vger.kernel.org>; Tue, 21 Mar 2023 00:27:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=tq-group.com; i=@tq-group.com; q=dns/txt; s=key1;
  t=1679383636; x=1710919636;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=o91knlkLKj3jVc/NrGbR0CpGKWa9jyYUipzes/AkaMw=;
  b=FrjnHQ3bkYRcG4FuyJcstuaI3Rc64GXpILItycfC0H9QveI3XN4393ZC
   SoqUo9Xj/SKnG6dFQZuLMb/eT8fv/NkQJttiBsg6CpyfSoJ/uEp6F4iUk
   YHr+bjBPCyAlDDB9UPfx0JmaPSy6GD0GdeXOi9g9vSu2qKun6Zg7ahblk
   4UzV9gAq1vMeIrq3NHj4udELE2yLq4tYXW5p4AvYfUXZfFDidDSKBvtPf
   eKC/5cqNB26PhWsoFyPOjkkBLS7dcOFMNuombDEe07fgX1OrLR6QX+pEn
   W0SbnJKgL29Ly0xgLiAw1HC4rZu7wYB2M747OVxM2/QuTa/B2h9uCBEm+
   Q==;
X-IronPort-AV: E=Sophos;i="5.98,278,1673910000"; 
   d="scan'208";a="29819255"
Received: from unknown (HELO tq-pgp-pr1.tq-net.de) ([192.168.6.15])
  by mx1-pgp.tq-group.com with ESMTP; 21 Mar 2023 08:27:11 +0100
Received: from mx1.tq-group.com ([192.168.6.7])
  by tq-pgp-pr1.tq-net.de (PGP Universal service);
  Tue, 21 Mar 2023 08:27:11 +0100
X-PGP-Universal: processed;
        by tq-pgp-pr1.tq-net.de on Tue, 21 Mar 2023 08:27:11 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=tq-group.com; i=@tq-group.com; q=dns/txt; s=key1;
  t=1679383631; x=1710919631;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=o91knlkLKj3jVc/NrGbR0CpGKWa9jyYUipzes/AkaMw=;
  b=ekKk470CNBQXkzO6EW0Nydqwb4YgYglRqb63K6aaXQGzybvlG4aXbm7K
   iSfuh8gy1f9gPzFvWZLbMUdh2755nI01x2RK6Ydu9mQkOaRLsepeu4cNA
   A/MHZqgqeBfX1TsKhyp60Q5/dtfj04YW3wunkbcf4Kl9qfzWo8+kRmNs6
   WTTAHb0WOIJPE+BLJRAn8tLrZZ2LeQ/qgWgvTL+DAx2fKT7BVUyy2cQFK
   lBkkU/uSrJKnA3PYrSbqHEmqDdwBvCo0zfgpkAl6r+Y7QEEgOcws3K3Ml
   qjaWKqpHYfpp9YUK3vQ2OmtGC9sWKMxWgq8mvcXmlGCS0zQSxS5mbTEcp
   A==;
X-IronPort-AV: E=Sophos;i="5.98,278,1673910000"; 
   d="scan'208";a="29819254"
Received: from vtuxmail01.tq-net.de ([10.115.0.20])
  by mx1.tq-group.com with ESMTP; 21 Mar 2023 08:27:11 +0100
Received: from steina-w.tq-net.de (unknown [10.123.53.21])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
        (No client certificate requested)
        by vtuxmail01.tq-net.de (Postfix) with ESMTPSA id 25D2F280072;
        Tue, 21 Mar 2023 08:27:11 +0100 (CET)
From:   Alexander Stein <alexander.stein@ew.tq-group.com>
To:     Rui Miguel Silva <rmfrfs@gmail.com>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Shawn Guo <shawnguo@kernel.org>,
        Sascha Hauer <s.hauer@pengutronix.de>,
        Fabio Estevam <festevam@gmail.com>
Cc:     Alexander Stein <alexander.stein@ew.tq-group.com>,
        Pengutronix Kernel Team <kernel@pengutronix.de>,
        NXP Linux Team <linux-imx@nxp.com>,
        linux-media@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Subject: [PATCH v2 1/2] media: imx: imx7-media-csi: Fix mbus framefmt field init
Date:   Tue, 21 Mar 2023 08:27:06 +0100
Message-Id: <20230321072707.678039-2-alexander.stein@ew.tq-group.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230321072707.678039-1-alexander.stein@ew.tq-group.com>
References: <20230321072707.678039-1-alexander.stein@ew.tq-group.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.0 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

'field' is zero-initialized to V4L2_FIELD_ANY, which is an invalid value
to return to userspace. Instead fefault to non-interleaving.

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

