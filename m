Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id E460E5626DB
	for <lists+linux-media@lfdr.de>; Fri,  1 Jul 2022 01:19:13 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231417AbiF3XIu (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 30 Jun 2022 19:08:50 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56788 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231433AbiF3XIu (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 30 Jun 2022 19:08:50 -0400
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [IPv6:2001:4b98:dc2:55:216:3eff:fef7:d647])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 22D794D4DB
        for <linux-media@vger.kernel.org>; Thu, 30 Jun 2022 16:08:39 -0700 (PDT)
Received: from pendragon.lan (62-78-145-57.bb.dnainternet.fi [62.78.145.57])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 263392731;
        Fri,  1 Jul 2022 01:07:50 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1656630470;
        bh=u2NRLTl62iHTbwNpezxjHr52pS2jNsL+reWPe5YodXc=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=dPtoOcGA+p6BZtdggCGzDbCa1f5kTONZ5yy/WALexV+9xzc9CdcpdvWSMIaCy4gZW
         720W6UvQMiFBfBehRWtrqu6MgHznldNwRGw5JNQCOHdTqQwLL3gvWQ0pLjRO+7tZc8
         Lz6d0QyIzldJUzMybUSFwVILEr2WDQ8u8eq3O9P4=
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     linux-media@vger.kernel.org
Cc:     linux-rockchip@lists.infradead.org,
        Dafna Hirschfeld <dafna@fastmail.com>,
        Heiko Stuebner <heiko@sntech.de>,
        Helen Koike <helen.koike@collabora.com>,
        Paul Elder <paul.elder@ideasonboard.com>
Subject: [PATCH v2 20/55] media: rkisp1: isp: Start CSI-2 receiver before ISP
Date:   Fri,  1 Jul 2022 02:06:38 +0300
Message-Id: <20220630230713.10580-21-laurent.pinchart@ideasonboard.com>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220630230713.10580-1-laurent.pinchart@ideasonboard.com>
References: <20220630230713.10580-1-laurent.pinchart@ideasonboard.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_PASS,SPF_PASS,
        T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Make sure the ISP is ready to receive data before starting the CSI-2
receiver by starting it first. Similarly, stop the CSI-2 receiver before
the ISP when stopping streaming.

Signed-off-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Reviewed-by: Dafna Hirschfeld <dafna@fastmail.com>
---
 drivers/media/platform/rockchip/rkisp1/rkisp1-isp.c | 13 ++++++++-----
 1 file changed, 8 insertions(+), 5 deletions(-)

diff --git a/drivers/media/platform/rockchip/rkisp1/rkisp1-isp.c b/drivers/media/platform/rockchip/rkisp1/rkisp1-isp.c
index c05148dd32c0..81c4eb48baab 100644
--- a/drivers/media/platform/rockchip/rkisp1/rkisp1-isp.c
+++ b/drivers/media/platform/rockchip/rkisp1/rkisp1-isp.c
@@ -771,8 +771,9 @@ static int rkisp1_isp_s_stream(struct v4l2_subdev *sd, int enable)
 		v4l2_subdev_call(rkisp1->active_sensor->sd, video, s_stream,
 				 false);
 
-		rkisp1_isp_stop(rkisp1);
 		rkisp1_mipi_csi2_stop(&rkisp1->csi);
+		rkisp1_isp_stop(rkisp1);
+
 		return 0;
 	}
 
@@ -794,12 +795,14 @@ static int rkisp1_isp_s_stream(struct v4l2_subdev *sd, int enable)
 	if (ret)
 		goto mutex_unlock;
 
-	ret = rkisp1_mipi_csi2_start(&rkisp1->csi, rkisp1->active_sensor);
-	if (ret)
-		goto mutex_unlock;
-
 	rkisp1_isp_start(rkisp1);
 
+	ret = rkisp1_mipi_csi2_start(&rkisp1->csi, rkisp1->active_sensor);
+	if (ret) {
+		rkisp1_isp_stop(rkisp1);
+		goto mutex_unlock;
+	}
+
 	ret = v4l2_subdev_call(rkisp1->active_sensor->sd, video, s_stream,
 			       true);
 	if (ret) {
-- 
Regards,

Laurent Pinchart

