Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 0D3CF64A079
	for <lists+linux-media@lfdr.de>; Mon, 12 Dec 2022 14:25:44 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232801AbiLLNZk (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 12 Dec 2022 08:25:40 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54488 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232808AbiLLNZS (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 12 Dec 2022 08:25:18 -0500
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [IPv6:2001:4b98:dc2:55:216:3eff:fef7:d647])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9AD4838BE
        for <linux-media@vger.kernel.org>; Mon, 12 Dec 2022 05:25:11 -0800 (PST)
Received: from pendragon.ideasonboard.com (213-243-189-158.bb.dnainternet.fi [213.243.189.158])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id A967A8A9;
        Mon, 12 Dec 2022 14:25:09 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1670851509;
        bh=9C2PKDuDW2YaRuLhVamAL7wTGY2daQLstbO+iyt4/v4=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=hIHg1gRXUdnMWASMJUS24mlClfki+eHcUpxsiCIeSks2pg3h5PS0Jqci740yW/fA+
         +RyAdJfXWAxjpby5+R2g9EaBB0UKE3d6BxF7cUpn2NPfKjmoMZZHbKDyXzvaH0NK/s
         piyUavs52JX3VvtI0lG2X+3ciAbOFu7K0fmJDS28=
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     linux-media@vger.kernel.org
Cc:     Sakari Ailus <sakari.ailus@iki.fi>,
        Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
Subject: [PATCH v1 1/2] media: mc: Get media_device directly from pad
Date:   Mon, 12 Dec 2022 15:25:04 +0200
Message-Id: <20221212132505.9251-2-laurent.pinchart@ideasonboard.com>
X-Mailer: git-send-email 2.37.4
In-Reply-To: <20221212132505.9251-1-laurent.pinchart@ideasonboard.com>
References: <20221212132505.9251-1-laurent.pinchart@ideasonboard.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_PASS,SPF_PASS
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Various functions access the media_device from a pad by going through
the entity the pad belongs to. Remove the level of indirection and get
the media_device from the pad directly.

Fixes: 9e3576a1ae2b ("media: mc: convert pipeline funcs to take media_pad")
Signed-off-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
---
 drivers/media/mc/mc-entity.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/drivers/media/mc/mc-entity.c b/drivers/media/mc/mc-entity.c
index b8bcbc734eaf..f268cf66053e 100644
--- a/drivers/media/mc/mc-entity.c
+++ b/drivers/media/mc/mc-entity.c
@@ -703,7 +703,7 @@ static int media_pipeline_populate(struct media_pipeline *pipe,
 __must_check int __media_pipeline_start(struct media_pad *pad,
 					struct media_pipeline *pipe)
 {
-	struct media_device *mdev = pad->entity->graph_obj.mdev;
+	struct media_device *mdev = pad->graph_obj.mdev;
 	struct media_pipeline_pad *err_ppad;
 	struct media_pipeline_pad *ppad;
 	int ret;
@@ -851,7 +851,7 @@ EXPORT_SYMBOL_GPL(__media_pipeline_start);
 __must_check int media_pipeline_start(struct media_pad *pad,
 				      struct media_pipeline *pipe)
 {
-	struct media_device *mdev = pad->entity->graph_obj.mdev;
+	struct media_device *mdev = pad->graph_obj.mdev;
 	int ret;
 
 	mutex_lock(&mdev->graph_mutex);
@@ -888,7 +888,7 @@ EXPORT_SYMBOL_GPL(__media_pipeline_stop);
 
 void media_pipeline_stop(struct media_pad *pad)
 {
-	struct media_device *mdev = pad->entity->graph_obj.mdev;
+	struct media_device *mdev = pad->graph_obj.mdev;
 
 	mutex_lock(&mdev->graph_mutex);
 	__media_pipeline_stop(pad);
@@ -898,7 +898,7 @@ EXPORT_SYMBOL_GPL(media_pipeline_stop);
 
 __must_check int media_pipeline_alloc_start(struct media_pad *pad)
 {
-	struct media_device *mdev = pad->entity->graph_obj.mdev;
+	struct media_device *mdev = pad->graph_obj.mdev;
 	struct media_pipeline *new_pipe = NULL;
 	struct media_pipeline *pipe;
 	int ret;
-- 
Regards,

Laurent Pinchart

