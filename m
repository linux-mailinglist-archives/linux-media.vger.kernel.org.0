Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id C74D54DE95A
	for <lists+linux-media@lfdr.de>; Sat, 19 Mar 2022 17:32:01 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S243668AbiCSQdM (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sat, 19 Mar 2022 12:33:12 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37654 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S243669AbiCSQdL (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Sat, 19 Mar 2022 12:33:11 -0400
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D096623F9CF
        for <linux-media@vger.kernel.org>; Sat, 19 Mar 2022 09:31:49 -0700 (PDT)
Received: from pendragon.lan (62-78-145-57.bb.dnainternet.fi [62.78.145.57])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id E98122CCF;
        Sat, 19 Mar 2022 17:31:37 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1647707498;
        bh=tcD2ACKWc9gJ6cif+GZMiiTUyuP8WlFFk5ZBdcMQ1h8=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=agq+bsC4iYGQjsAIzpA3IJJ23O9bypPbG7zSYk5qfRvXppCsd3yXczyWTJJG8cTYg
         3wsoNslx1ZBNxnirmBXbk2WI0lR4ZlcXLnfeI25w7YUFHk9QKTnPnCCTvj4k6cF6wE
         H9f5AV3OZvGAMRTbu5E8rMKMhHJqyt2vJTbl+98I=
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     linux-media@vger.kernel.org
Cc:     Dafna Hirschfeld <dafna@fastmail.com>,
        Heiko Stuebner <heiko@sntech.de>,
        Paul Elder <paul.elder@ideasonboard.com>,
        Tomasz Figa <tfiga@google.com>,
        linux-rockchip@lists.infradead.org
Subject: [PATCH v3 17/17] media: rkisp1: capture: Bypass the main device for handling querycap
Date:   Sat, 19 Mar 2022 18:31:00 +0200
Message-Id: <20220319163100.3083-18-laurent.pinchart@ideasonboard.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220319163100.3083-1-laurent.pinchart@ideasonboard.com>
References: <20220319163100.3083-1-laurent.pinchart@ideasonboard.com>
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

From: Paul Elder <paul.elder@ideasonboard.com>

When handling querycap, the capture node would access the main rkisp1
device unnecessarily. Get the information from the most direct source.

Signed-off-by: Paul Elder <paul.elder@ideasonboard.com>
---
 drivers/media/platform/rockchip/rkisp1/rkisp1-capture.c | 7 ++-----
 1 file changed, 2 insertions(+), 5 deletions(-)

diff --git a/drivers/media/platform/rockchip/rkisp1/rkisp1-capture.c b/drivers/media/platform/rockchip/rkisp1/rkisp1-capture.c
index a7cf672457cd..94819e6c23e2 100644
--- a/drivers/media/platform/rockchip/rkisp1/rkisp1-capture.c
+++ b/drivers/media/platform/rockchip/rkisp1/rkisp1-capture.c
@@ -1248,11 +1248,8 @@ static int rkisp1_g_fmt_vid_cap_mplane(struct file *file, void *fh,
 static int
 rkisp1_querycap(struct file *file, void *priv, struct v4l2_capability *cap)
 {
-	struct rkisp1_capture *cap_dev = video_drvdata(file);
-	struct rkisp1_device *rkisp1 = cap_dev->rkisp1;
-
-	strscpy(cap->driver, rkisp1->dev->driver->name, sizeof(cap->driver));
-	strscpy(cap->card, rkisp1->dev->driver->name, sizeof(cap->card));
+	strscpy(cap->driver, RKISP1_DRIVER_NAME, sizeof(cap->driver));
+	strscpy(cap->card, RKISP1_DRIVER_NAME, sizeof(cap->card));
 	strscpy(cap->bus_info, RKISP1_BUS_INFO, sizeof(cap->bus_info));
 
 	return 0;
-- 
Regards,

Laurent Pinchart

