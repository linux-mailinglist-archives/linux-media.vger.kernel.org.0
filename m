Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id E8B716C2B55
	for <lists+linux-media@lfdr.de>; Tue, 21 Mar 2023 08:27:21 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229902AbjCUH1V (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 21 Mar 2023 03:27:21 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54492 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229527AbjCUH1S (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 21 Mar 2023 03:27:18 -0400
Received: from mx1.tq-group.com (mx1.tq-group.com [93.104.207.81])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 716E33253B
        for <linux-media@vger.kernel.org>; Tue, 21 Mar 2023 00:27:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=tq-group.com; i=@tq-group.com; q=dns/txt; s=key1;
  t=1679383637; x=1710919637;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=EfdX/9qiFzppnd+Vz21frBaqbACvZB7/0EYonfhtuWo=;
  b=oPdx9peDPOdTDWTX7ycPGCjUMF14xH7YzOZYEkfGUEZIkZ52EdSuZoOq
   EP6Q98jNrcAC475/cp9J9sv9OSsZ0XNYr2X2LTmr4QEgLXB8OzlwRU8zw
   fgT2hLC03XdLA1psc99/55bl6RuJCJejjfjMFpFogehJJyn5m/qTL0/J+
   GgYrdacdIFclZhBJp9wAPP0uUnP8fjq96Rv09Q0KPOcU0SRJycMPKVFnR
   FVGvhLF4csYhdAUDika1sv/LaihHOeFyE9R+JK+EMAxxzgDAQah+W37+m
   KgPJyJgcXpkUXHYOUfd2pHm1L9T5jKaL+yxCPKZxvC4cITFNzbVoRuEpf
   A==;
X-IronPort-AV: E=Sophos;i="5.98,278,1673910000"; 
   d="scan'208";a="29819257"
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
  bh=EfdX/9qiFzppnd+Vz21frBaqbACvZB7/0EYonfhtuWo=;
  b=BTxlMn+trD/QahqJMJoa5xP32caFTcbbU+gSC29tNVTvVm//Q8lMgzrd
   fCMyMNh0Fn8MH7PtwtRMIPq/FOZdE3IS8/PtSRrNBoCFjTtVfsSSQB+Se
   n/Wqa779hZOH88/jXEYXPrsxjRAYptikvXHGnwSrFI1XXocXgDl0BLnnS
   NrOQBzrv0JfRSGolIFJpBD8cNJN4E0tdLra/Lx2xENTGIYUcJ68/KmJYL
   5al5RCojchucj21VvkVmnQVFuRkVgVlMa6i6jYHvb5GIUaSFnjBJf5UbQ
   42cRmR7N1O+jm4qkmpuuDURxvOic33kctWmg8SUz88/MPvK05TS2ZG7Rm
   g==;
X-IronPort-AV: E=Sophos;i="5.98,278,1673910000"; 
   d="scan'208";a="29819256"
Received: from vtuxmail01.tq-net.de ([10.115.0.20])
  by mx1.tq-group.com with ESMTP; 21 Mar 2023 08:27:11 +0100
Received: from steina-w.tq-net.de (unknown [10.123.53.21])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
        (No client certificate requested)
        by vtuxmail01.tq-net.de (Postfix) with ESMTPSA id 64F76280056;
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
Subject: [PATCH v2 2/2] media: imx: imx7-media-csi: Fail on invalid type in VIDIOC_G_SELECTION
Date:   Tue, 21 Mar 2023 08:27:07 +0100
Message-Id: <20230321072707.678039-3-alexander.stein@ew.tq-group.com>
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

This device only supports video capture, so bail out if invalid
selection type is passed.

Signed-off-by: Alexander Stein <alexander.stein@ew.tq-group.com>
Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Reviewed-by: Rui Miguel Silva <rmfrfs@gmail.com>
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

