Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id BAB874E2B4C
	for <lists+linux-media@lfdr.de>; Mon, 21 Mar 2022 15:52:12 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1349777AbiCUOxc (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 21 Mar 2022 10:53:32 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58778 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1349714AbiCUOxX (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 21 Mar 2022 10:53:23 -0400
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7D77858835
        for <linux-media@vger.kernel.org>; Mon, 21 Mar 2022 07:51:57 -0700 (PDT)
Received: from pendragon.lan (62-78-145-57.bb.dnainternet.fi [62.78.145.57])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 78537D6E;
        Mon, 21 Mar 2022 15:51:55 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1647874316;
        bh=iVyj9/SbENWcOjklY5pi9vb1ZPaIrYQlmDyRqt7KL2E=;
        h=From:To:Cc:Subject:Date:From;
        b=d/HTK/VFut40OUIz2SQeRkYvtAud6RASreIlF/G8Vy717Cp+dNHc5ixSVfD10Y+I5
         1KB9MdOkuxokEVnvhOXFpQF6sYKTLWjeaQ6KYSGJ5qm4tXNrBziQAFPPRp3PFnfRim
         Rl7yAOMeTYDs38wBkIjSy1WMMXoUJZZEKkvU6i60=
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     linux-media@vger.kernel.org
Cc:     Sakari Ailus <sakari.ailus@iki.fi>,
        Jacopo Mondi <jacopo@jmondi.org>,
        Kieran Bingham <kieran.bingham@ideasonboard.com>,
        =?UTF-8?q?Niklas=20S=C3=B6derlund?= <niklas.soderlund@ragnatech.se>,
        Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
Subject: [PATCH] media: v4l2-async: Use endpoints in __v4l2_async_nf_add_fwnode_remote()
Date:   Mon, 21 Mar 2022 16:51:34 +0200
Message-Id: <20220321145134.29820-1-laurent.pinchart@ideasonboard.com>
X-Mailer: git-send-email 2.34.1
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

From: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>

Matching on device fwnode handles is deprecated in favour of endpoint
fwnode handles. Switch the __v4l2_async_nf_add_fwnode_remote() function
to use the latter. The match code handles backward compatibility by
falling by to the device fwnode handle, so this shouldn't introduce any
regression.

Signed-off-by: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
---
 drivers/media/v4l2-core/v4l2-async.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/media/v4l2-core/v4l2-async.c b/drivers/media/v4l2-core/v4l2-async.c
index 0404267f1ae4..67d7f445d429 100644
--- a/drivers/media/v4l2-core/v4l2-async.c
+++ b/drivers/media/v4l2-core/v4l2-async.c
@@ -662,7 +662,7 @@ __v4l2_async_nf_add_fwnode_remote(struct v4l2_async_notifier *notif,
 	struct v4l2_async_subdev *asd;
 	struct fwnode_handle *remote;
 
-	remote = fwnode_graph_get_remote_port_parent(endpoint);
+	remote = fwnode_graph_get_remote_endpoint(endpoint);
 	if (!remote)
 		return ERR_PTR(-ENOTCONN);
 
-- 
Regards,

Laurent Pinchart

