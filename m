Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 5F23D4CDA22
	for <lists+linux-media@lfdr.de>; Fri,  4 Mar 2022 18:21:01 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S240072AbiCDRVh (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 4 Mar 2022 12:21:37 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39756 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S241062AbiCDRVg (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Fri, 4 Mar 2022 12:21:36 -0500
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B4A6B1520C2
        for <linux-media@vger.kernel.org>; Fri,  4 Mar 2022 09:20:41 -0800 (PST)
Received: from pendragon.lan (62-78-145-57.bb.dnainternet.fi [62.78.145.57])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 98F4B1839;
        Fri,  4 Mar 2022 18:19:52 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1646414393;
        bh=J3H/YWgcSpzCXhiXmgrcBIpagqsZt7U0Wwt1sQ/XPOU=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=KnPhrn6nCf2BKAJ2fG0gGS29P0gpcYhFqDA9IR0Z9rd0DLx97/n4JR3cEYJ/mCACn
         LNLbt8znAgdwhjFF9OOce/AwofgaD2CzPKHivPzHC18BsVtD4SmcR3KRsyvkIC/P8S
         6jK597BTk4sSXu1PxB5rPsB+zaRpRG0oTemKQr1k=
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     linux-media@vger.kernel.org
Cc:     Dafna Hirschfeld <dafna@fastmail.com>,
        Heiko Stuebner <heiko@sntech.de>,
        Paul Elder <paul.elder@ideasonboard.com>,
        Tomasz Figa <tfiga@google.com>,
        linux-rockchip@lists.infradead.org
Subject: [PATCH v2 17/17] media: rkisp1: capture: Bypass the main device for handling querycap
Date:   Fri,  4 Mar 2022 19:19:25 +0200
Message-Id: <20220304171925.1592-18-laurent.pinchart@ideasonboard.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220304171925.1592-1-laurent.pinchart@ideasonboard.com>
References: <20220304171925.1592-1-laurent.pinchart@ideasonboard.com>
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
index c6f699dbf0b4..25bb0ae17abe 100644
--- a/drivers/media/platform/rockchip/rkisp1/rkisp1-capture.c
+++ b/drivers/media/platform/rockchip/rkisp1/rkisp1-capture.c
@@ -1232,11 +1232,8 @@ static int rkisp1_g_fmt_vid_cap_mplane(struct file *file, void *fh,
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

