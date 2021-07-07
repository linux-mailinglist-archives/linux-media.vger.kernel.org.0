Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 9D2A03BEA93
	for <lists+linux-media@lfdr.de>; Wed,  7 Jul 2021 17:19:33 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232263AbhGGPWM (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 7 Jul 2021 11:22:12 -0400
Received: from relay4-d.mail.gandi.net ([217.70.183.196]:45989 "EHLO
        relay4-d.mail.gandi.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232050AbhGGPWL (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Wed, 7 Jul 2021 11:22:11 -0400
Received: (Authenticated sender: jacopo@jmondi.org)
        by relay4-d.mail.gandi.net (Postfix) with ESMTPSA id 0FF3AE0002;
        Wed,  7 Jul 2021 15:19:28 +0000 (UTC)
From:   Jacopo Mondi <jacopo+renesas@jmondi.org>
To:     Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        Mauro Carvalho Chehab <mchehab@kernel.org>
Cc:     Jacopo Mondi <jacopo+renesas@jmondi.org>,
        Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>,
        Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>,
        =?UTF-8?q?Niklas=20S=C3=B6derlund?= 
        <niklas.soderlund+renesas@ragnatech.se>,
        linux-media@vger.kernel.org, linux-renesas-soc@vger.kernel.org
Subject: [PATCH v2 3/4] media: v4l2-async: Call post_register() subdev op
Date:   Wed,  7 Jul 2021 17:20:02 +0200
Message-Id: <20210707152003.136272-4-jacopo+renesas@jmondi.org>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20210707152003.136272-1-jacopo+renesas@jmondi.org>
References: <20210707152003.136272-1-jacopo+renesas@jmondi.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Call the "post_register()" subdev operation on a just registered
subdevice, immediately after having called the 'bound' notifier
operation on the parent.

Signed-off-by: Jacopo Mondi <jacopo+renesas@jmondi.org>
Suggested-by: Hans Verkuil <hverkuil-cisco@xs4all.nl>
---
 drivers/media/v4l2-core/v4l2-async.c | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/drivers/media/v4l2-core/v4l2-async.c b/drivers/media/v4l2-core/v4l2-async.c
index 0836e01e59ca..fcc32ec15832 100644
--- a/drivers/media/v4l2-core/v4l2-async.c
+++ b/drivers/media/v4l2-core/v4l2-async.c
@@ -293,6 +293,16 @@ static int v4l2_async_match_notify(struct v4l2_async_notifier *notifier,
 		return ret;
 	}
 
+	if (!(notifier->flags & V4L2_ASYNC_NOTIFIER_DEFER_POST_REGISTER) &&
+	    sd->ops->core && sd->ops->core->post_register) {
+		ret = sd->ops->core->post_register(sd);
+		if (ret) {
+			v4l2_async_notifier_call_unbind(notifier, sd, sd->asd);
+			v4l2_device_unregister_subdev(sd);
+			return ret;
+		}
+	}
+
 	/* Remove from the waiting list */
 	list_del(&asd->list);
 	sd->asd = asd;
-- 
2.32.0

