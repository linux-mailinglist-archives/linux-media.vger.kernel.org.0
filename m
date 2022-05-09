Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id D1B0251F885
	for <lists+linux-media@lfdr.de>; Mon,  9 May 2022 11:59:31 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229981AbiEIJvm (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 9 May 2022 05:51:42 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35818 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S237118AbiEIJUe (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Mon, 9 May 2022 05:20:34 -0400
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D2561149DBE
        for <linux-media@vger.kernel.org>; Mon,  9 May 2022 02:16:21 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ams.source.kernel.org (Postfix) with ESMTPS id 8DD67B810A6
        for <linux-media@vger.kernel.org>; Mon,  9 May 2022 09:15:58 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6C4C3C385A8;
        Mon,  9 May 2022 09:15:56 +0000 (UTC)
From:   Hans Verkuil <hverkuil-cisco@xs4all.nl>
To:     linux-media@vger.kernel.org
Cc:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Sakari Ailus <sakari.ailus@iki.fi>,
        Hans Verkuil <hverkuil-cisco@xs4all.nl>
Subject: [PATCH 1/7] v4l2-subdev.c: kvmalloc_array -> kvcalloc
Date:   Mon,  9 May 2022 11:15:47 +0200
Message-Id: <20220509091553.2637089-2-hverkuil-cisco@xs4all.nl>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220509091553.2637089-1-hverkuil-cisco@xs4all.nl>
References: <20220509091553.2637089-1-hverkuil-cisco@xs4all.nl>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-6.7 required=5.0 tests=BAYES_00,
        HEADER_FROM_DIFFERENT_DOMAINS,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_PASS,
        T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Fixes smatch warning:

drivers/media/v4l2-core/v4l2-subdev.c:978 __v4l2_subdev_state_alloc() warn: Please consider using kvcalloc instead

Signed-off-by: Hans Verkuil <hverkuil-cisco@xs4all.nl>
---
 drivers/media/v4l2-core/v4l2-subdev.c | 5 ++---
 1 file changed, 2 insertions(+), 3 deletions(-)

diff --git a/drivers/media/v4l2-core/v4l2-subdev.c b/drivers/media/v4l2-core/v4l2-subdev.c
index 3da200bb23dd..5c27bac772ea 100644
--- a/drivers/media/v4l2-core/v4l2-subdev.c
+++ b/drivers/media/v4l2-core/v4l2-subdev.c
@@ -975,9 +975,8 @@ __v4l2_subdev_state_alloc(struct v4l2_subdev *sd, const char *lock_name,
 		state->lock = &state->_lock;
 
 	if (sd->entity.num_pads) {
-		state->pads = kvmalloc_array(sd->entity.num_pads,
-					     sizeof(*state->pads),
-					     GFP_KERNEL | __GFP_ZERO);
+		state->pads = kvcalloc(sd->entity.num_pads,
+				       sizeof(*state->pads), GFP_KERNEL);
 		if (!state->pads) {
 			ret = -ENOMEM;
 			goto err;
-- 
2.34.1

