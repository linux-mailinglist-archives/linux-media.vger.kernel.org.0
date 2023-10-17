Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 754977CC75F
	for <lists+linux-media@lfdr.de>; Tue, 17 Oct 2023 17:24:14 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1344302AbjJQPYN (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 17 Oct 2023 11:24:13 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40224 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1344297AbjJQPYN (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 17 Oct 2023 11:24:13 -0400
X-Greylist: delayed 901 seconds by postgrey-1.37 at lindbergh.monkeyblade.net; Tue, 17 Oct 2023 08:24:11 PDT
Received: from mickerik.phytec.de (mickerik.phytec.de [91.26.50.163])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0545E9F
        for <linux-media@vger.kernel.org>; Tue, 17 Oct 2023 08:24:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; d=phytec.de; s=a4; c=relaxed/simple;
        q=dns/txt; i=@phytec.de; t=1697555346; x=1700147346;
        h=From:Sender:Reply-To:Subject:Date:Message-ID:To:CC:MIME-Version:Content-Type:
        Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:Resent-From:
        Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Id:
        List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
        bh=1Gf/M/iGtEmEG3F62v05ZfJnAgvQarfAIuf/TMC9xC8=;
        b=bl+FmcIM+PnLwV4iiYe4qObjfu+iHGsAQVCXad05nxlsLv/ame4azPTqJGwtUNPu
        CPLFmbN/5HC2yQBe7DMr01oW68VkAxN2oB/n2Y2hSarPVIi0Qlza8WJ/jBn5hHnH
        yJ4icdWVHUrv+TXKj8Xpypn23E8PIi/P0/xZhgPeFBI=;
X-AuditID: ac14000a-6e25770000001e37-9f-652ea392c463
Received: from berlix.phytec.de (Unknown_Domain [172.25.0.12])
        (using TLS with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (Client did not present a certificate)
        by mickerik.phytec.de (PHYTEC Mail Gateway) with SMTP id D0.53.07735.293AE256; Tue, 17 Oct 2023 17:09:06 +0200 (CEST)
Received: from augenblix2.phytec.de (172.25.0.11) by Berlix.phytec.de
 (172.25.0.12) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.6; Tue, 17 Oct
 2023 17:09:05 +0200
From:   =?UTF-8?q?Stefan=20Riedm=C3=BCller?= <s.riedmueller@phytec.de>
To:     Rui Miguel Silva <rmfrfs@gmail.com>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Martin Kepplinger <martink@posteo.de>
CC:     Mauro Carvalho Chehab <mchehab@kernel.org>,
        Shawn Guo <shawnguo@kernel.org>,
        Sascha Hauer <s.hauer@pengutronix.de>,
        Fabio Estevam <festevam@gmail.com>,
        Purism Kernel Team <kernel@puri.sm>,
        "Pengutronix Kernel Team" <kernel@pengutronix.de>,
        NXP Linux Team <linux-imx@nxp.com>,
        <linux-media@vger.kernel.org>, <upstream@phytec.de>
Subject: [PATCH] media: imx: imx7-media-csi: Sync frames to start of frame for MIPI
Date:   Tue, 17 Oct 2023 17:08:54 +0200
Message-ID: <20231017150854.270003-1-s.riedmueller@phytec.de>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-Originating-IP: [172.25.0.11]
X-ClientProxiedBy: Florix.phytec.de (172.25.0.13) To Berlix.phytec.de
 (172.25.0.12)
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFnrNLMWRmVeSWpSXmKPExsWyRpKBR3fSYr1Ug7UreSweXvW3WDV1J4vF
        /LYZLBadE5ewW3T9Wsls0bNhK6vFtRUTWS2WbfrDZNG44D2Lxd/tm1gsXmwRd+D22DnrLrvH
        7I6ZrB6bVnWyeWx8t4PJo/+vgcevw6Iej3bcYvT4vEkugCOKyyYlNSezLLVI3y6BK6N51yrm
        gvU8Fb+XbGFrYJzN1cXIySEhYCLx7stk9i5GLg4hgSVMEmc3r2WDcB4zSsztb2MCqWITcJE4
        9/cOM0hCRKCNUaLhwHoWEIdZ4DKTxOZpq4FaODiEBYIlmnfagjSwCKhKLHn0iBHE5hWwleg8
        cJ8RYp28xMxL39kh4oISJ2c+YQGxmQU0JVq3/2aHsOUlmrfOZgaxhQRUJBpObmSG6Z127jWU
        HSpxZNNqpgmMArOQjJqFZNQsJKMWMDKvYhTKzUzOTi3KzNYryKgsSU3WS0ndxAiKEBEGrh2M
        fXM8DjEycTAeYpTgYFYS4U0P1kkV4k1JrKxKLcqPLyrNSS0+xCjNwaIkznu/hylRSCA9sSQ1
        OzW1ILUIJsvEwSnVwGi1y+gx691jwrdOfFdZHMQjelT1w9+T4U/4jtTZ8Jv6JK1R1pvMt0zm
        r+arirpHfkqe7yckfbpQNbWu5ZKvncV7oV/3ohKZ1ETCKpdzfqrLK3p8fccJwc709rPyIh5W
        kooeG7hcTQ8oMd311Wq4e2TfMmExJ96Qtv/fue73FM5dm254ts7KTYmlOCPRUIu5qDgRAJxd
        4HN+AgAA
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_BLOCKED,
        SPF_HELO_PASS,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

The default behavior for a base address change is to do it automatically
after a DMA completion. This can lead to the situation, were one
corrupted frame, with less lines than configured, results in all
following frames being corrupted as well, due to a missing
re-synchronization to the beginning of the next frame.

Fix this by configuring the base address switch to be synced with the
start of frame event.

Currently this is already implemented for the parallel interface. To
have it with MIPI as well, simply configure it unconditionally.

Tested on i.MX 8MM.

Signed-off-by: Stefan Riedmüller <s.riedmueller@phytec.de>
---
 drivers/media/platform/nxp/imx7-media-csi.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/media/platform/nxp/imx7-media-csi.c b/drivers/media/platform/nxp/imx7-media-csi.c
index 15049c6aab37..0c9e3f01e96d 100644
--- a/drivers/media/platform/nxp/imx7-media-csi.c
+++ b/drivers/media/platform/nxp/imx7-media-csi.c
@@ -529,13 +529,13 @@ static void imx7_csi_configure(struct imx7_csi *csi,
 		stride = out_pix->width;
 	}
 
+	cr18 |= BIT_BASEADDR_SWITCH_EN | BIT_BASEADDR_SWITCH_SEL |
+		BIT_BASEADDR_CHG_ERR_EN;
+
 	if (!csi->is_csi2) {
 		cr1 = BIT_SOF_POL | BIT_REDGE | BIT_GCLK_MODE | BIT_HSYNC_POL
 		    | BIT_FCC | BIT_MCLKDIV(1) | BIT_MCLKEN;
 
-		cr18 |= BIT_BASEADDR_SWITCH_EN | BIT_BASEADDR_SWITCH_SEL |
-			BIT_BASEADDR_CHG_ERR_EN;
-
 		if (out_pix->pixelformat == V4L2_PIX_FMT_UYVY ||
 		    out_pix->pixelformat == V4L2_PIX_FMT_YUYV)
 			width *= 2;
-- 
2.25.1

