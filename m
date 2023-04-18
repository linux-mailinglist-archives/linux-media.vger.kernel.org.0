Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id DBC476E5A2F
	for <lists+linux-media@lfdr.de>; Tue, 18 Apr 2023 09:14:58 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231263AbjDRHO4 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 18 Apr 2023 03:14:56 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33590 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231159AbjDRHOy (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 18 Apr 2023 03:14:54 -0400
Received: from mx1.tq-group.com (mx1.tq-group.com [93.104.207.81])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A7ED826AC
        for <linux-media@vger.kernel.org>; Tue, 18 Apr 2023 00:14:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=tq-group.com; i=@tq-group.com; q=dns/txt; s=key1;
  t=1681802092; x=1713338092;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=2EYb/WP0dlj6VHt6K2PVtPnez7y5ZDVOsDqBPCYyofs=;
  b=YLdzbB1+Mo8mz0C+FQBnHRDk9pC47nAOTIOa9vb5rqsGbt1FTE7cu/Pz
   Tr6JifGamO7vPSeIdPA5jayo0ZHEKrfdCwnyrmqJoaZ+wik6vSRjcfzPk
   WZO83CznwLZ12T8h1sCLShtYVwK4VaFZ9rnyeQMUYNDYZnQcBBeQaDdwK
   RzbfkgO189Z3iAMJf4XalvSaLdm27Z5xCEO/NY8a9ltpLtGlDjSD0xGC/
   5hl5o0j2Fl7rcQ/ekH/OomGLkzWq14b7Se4PLfX+oa6EVNNA7G6mabJ+V
   rSDTNMOElGXU3ABRFkbgLWga2sEnBpKkxdR5xBbpKN4Fwaz95o16+zyuU
   Q==;
X-IronPort-AV: E=Sophos;i="5.99,206,1677538800"; 
   d="scan'208";a="30385556"
Received: from unknown (HELO tq-pgp-pr1.tq-net.de) ([192.168.6.15])
  by mx1-pgp.tq-group.com with ESMTP; 18 Apr 2023 09:14:47 +0200
Received: from mx1.tq-group.com ([192.168.6.7])
  by tq-pgp-pr1.tq-net.de (PGP Universal service);
  Tue, 18 Apr 2023 09:14:47 +0200
X-PGP-Universal: processed;
        by tq-pgp-pr1.tq-net.de on Tue, 18 Apr 2023 09:14:47 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=tq-group.com; i=@tq-group.com; q=dns/txt; s=key1;
  t=1681802087; x=1713338087;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=2EYb/WP0dlj6VHt6K2PVtPnez7y5ZDVOsDqBPCYyofs=;
  b=bTA0rAlLgYMqtpqCACot7AYTUVAHnMw0sSFLlA0acHgrIPguaZV1TJeU
   tNVhdKUPDQsJyr4X9Yuc60l9DVluLmZFXNkhZE12aTZu2hy9s0E+T/3AW
   jMNqHkgfAJ2xC+jjyyuYGCQAU7Iw60d3JZX4OP+UGz3FdBtcIzOZD9rcc
   jQ6W34tjSe2nO4QA7iCXVo7rRBccbNWes1hd0uoJ0uABvEFfU3EAB+P9o
   g/5sBUGyb1iKTREcTWwyjTzMMkfJfx/bSYfPz565tu0vKqZhC+YfpNb5V
   SuK9pPjaz2/aDgBakaup2ltFO4po97MyMIn6rx+5+xe99wyk/Op2Mi2Aq
   A==;
X-IronPort-AV: E=Sophos;i="5.99,206,1677538800"; 
   d="scan'208";a="30385555"
Received: from vtuxmail01.tq-net.de ([10.115.0.20])
  by mx1.tq-group.com with ESMTP; 18 Apr 2023 09:14:47 +0200
Received: from steina-w.tq-net.de (unknown [10.123.53.21])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
        (No client certificate requested)
        by vtuxmail01.tq-net.de (Postfix) with ESMTPSA id C809E280073;
        Tue, 18 Apr 2023 09:14:46 +0200 (CEST)
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
Subject: [PATCH v2 2/3] media: imx: imx7-media-csi: Remove interlave fields
Date:   Tue, 18 Apr 2023 09:14:38 +0200
Message-Id: <20230418071439.197735-3-alexander.stein@ew.tq-group.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230418071439.197735-1-alexander.stein@ew.tq-group.com>
References: <20230418071439.197735-1-alexander.stein@ew.tq-group.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.0 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE,
        URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Interlaced mode is currently not supported, so disable fields in try_fmt.

Signed-off-by: Alexander Stein <alexander.stein@ew.tq-group.com>
---
 drivers/media/platform/nxp/imx7-media-csi.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/media/platform/nxp/imx7-media-csi.c b/drivers/media/platform/nxp/imx7-media-csi.c
index bd649fd9166fd..1508f6ba20e91 100644
--- a/drivers/media/platform/nxp/imx7-media-csi.c
+++ b/drivers/media/platform/nxp/imx7-media-csi.c
@@ -1178,6 +1178,7 @@ __imx7_csi_video_try_fmt(struct v4l2_pix_format *pixfmt,
 	stride = round_up((pixfmt->width * cc->bpp) / 8, 8);
 	pixfmt->bytesperline = stride;
 	pixfmt->sizeimage = stride * pixfmt->height;
+	pixfmt->field = V4L2_FIELD_NONE;
 
 	if (compose) {
 		compose->width = pixfmt->width;
-- 
2.34.1

