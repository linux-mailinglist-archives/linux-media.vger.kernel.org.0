Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 88B746F45E1
	for <lists+linux-media@lfdr.de>; Tue,  2 May 2023 16:16:38 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234440AbjEBOQb (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 2 May 2023 10:16:31 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35946 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234451AbjEBOQW (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Tue, 2 May 2023 10:16:22 -0400
Received: from mx1.tq-group.com (mx1.tq-group.com [93.104.207.81])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B4FE91BE3
        for <linux-media@vger.kernel.org>; Tue,  2 May 2023 07:15:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=tq-group.com; i=@tq-group.com; q=dns/txt; s=key1;
  t=1683036948; x=1714572948;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=nFlpJLEE2pDe7fCb2xTrnPE7iokpXEG/iGf5nyGCwO0=;
  b=DMjuSFhQAk4wNH8MJaBLJe+fneHO4SB4Q2GvWz8fLj/2LBHUOmPQLUqT
   nlxVKVq15bu00Dey1+iehA5vVfIzI/u2Yy1RYdLNf89CfKTTGh1nA45Gj
   5yZV7NsRDJgWEX+MihxbPawfuk6zG0bnDwmu44pflTOlQD1ugJTtfCS8X
   f3SxxJ8O4jOhbe0xWDH0IycID/eyFwybi6/0J+NReoWYIcR/olDjwfz7R
   46wzK3YepAt17VmadnVqMxdGuuxuegI32qSnf1jYNND8mCXDzW8ANsWS/
   avlaziovJIQ3HbXNL0Qnr/MID8P5yJSDH9xOm+yr5q6Cihum6dm28/d1p
   w==;
X-IronPort-AV: E=Sophos;i="5.99,244,1677538800"; 
   d="scan'208";a="30671962"
Received: from unknown (HELO tq-pgp-pr1.tq-net.de) ([192.168.6.15])
  by mx1-pgp.tq-group.com with ESMTP; 02 May 2023 16:15:47 +0200
Received: from mx1.tq-group.com ([192.168.6.7])
  by tq-pgp-pr1.tq-net.de (PGP Universal service);
  Tue, 02 May 2023 16:15:47 +0200
X-PGP-Universal: processed;
        by tq-pgp-pr1.tq-net.de on Tue, 02 May 2023 16:15:47 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=tq-group.com; i=@tq-group.com; q=dns/txt; s=key1;
  t=1683036947; x=1714572947;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=nFlpJLEE2pDe7fCb2xTrnPE7iokpXEG/iGf5nyGCwO0=;
  b=bFMtedvCeNMXXYSLi88ZHy7NjWkdhwhoinUTwseoBtvI++C35cMP0AV/
   mIYA9ZrhnyZZUWTt0Vkg1Qh9oRPqVDcf65OKZgNAJ5x6zBgYuj96IqDiE
   M7AZb4qVydTRKxzWHyvYl4BbFFewmklYlUqXldf1sjg28ZODEUum56Px9
   VmPAASDk8AuVvRk494FlIZRTPt8kgPbrv+KRNVByXVJ6iOEbPmeEfM/Yr
   J9dOzw28s4rWYZpw7QUUsH+PoILEDLSy8l5T6AP9ISDspyFOQI4bFHU+U
   pvC8m75iXEHGtYG7UTTYNXh0X/qYthF0s9UeqwP/Vm6j6tLODMrkTHwpa
   w==;
X-IronPort-AV: E=Sophos;i="5.99,244,1677538800"; 
   d="scan'208";a="30671961"
Received: from vtuxmail01.tq-net.de ([10.115.0.20])
  by mx1.tq-group.com with ESMTP; 02 May 2023 16:15:47 +0200
Received: from steina-w.tq-net.de (unknown [10.123.53.21])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
        (No client certificate requested)
        by vtuxmail01.tq-net.de (Postfix) with ESMTPSA id ED554280056;
        Tue,  2 May 2023 16:15:46 +0200 (CEST)
From:   Alexander Stein <alexander.stein@ew.tq-group.com>
To:     Philipp Zabel <p.zabel@pengutronix.de>,
        Mauro Carvalho Chehab <mchehab@kernel.org>
Cc:     Alexander Stein <alexander.stein@ew.tq-group.com>,
        linux-media@vger.kernel.org
Subject: [PATCH 1/1] media: video-mux: Add missing media_entity_cleanup upon async register fail
Date:   Tue,  2 May 2023 16:15:43 +0200
Message-Id: <20230502141543.2503664-1-alexander.stein@ew.tq-group.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.0 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Although media_entity_pads_init has been called, a call to
media_entity_cleanup in the cleanup code was missing.

Signed-off-by: Alexander Stein <alexander.stein@ew.tq-group.com>
---
 drivers/media/platform/video-mux.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/media/platform/video-mux.c b/drivers/media/platform/video-mux.c
index 1d9f32e5a917..b244873d593a 100644
--- a/drivers/media/platform/video-mux.c
+++ b/drivers/media/platform/video-mux.c
@@ -474,6 +474,7 @@ static int video_mux_probe(struct platform_device *pdev)
 
 	ret = video_mux_async_register(vmux, num_pads - 1);
 	if (ret) {
+		media_entity_cleanup(&vmux->subdev.entity);
 		v4l2_async_nf_unregister(&vmux->notifier);
 		v4l2_async_nf_cleanup(&vmux->notifier);
 	}
-- 
2.34.1

