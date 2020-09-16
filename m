Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 8772B26C62D
	for <lists+linux-media@lfdr.de>; Wed, 16 Sep 2020 19:36:37 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727230AbgIPRga (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 16 Sep 2020 13:36:30 -0400
Received: from mslow2.mail.gandi.net ([217.70.178.242]:41956 "EHLO
        mslow2.mail.gandi.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727210AbgIPRfm (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 16 Sep 2020 13:35:42 -0400
Received: from relay5-d.mail.gandi.net (unknown [217.70.183.197])
        by mslow2.mail.gandi.net (Postfix) with ESMTP id 8F2C53AFBDF;
        Wed, 16 Sep 2020 14:29:02 +0000 (UTC)
X-Originating-IP: 93.34.118.233
Received: from uno.lan (93-34-118-233.ip49.fastwebnet.it [93.34.118.233])
        (Authenticated sender: jacopo@jmondi.org)
        by relay5-d.mail.gandi.net (Postfix) with ESMTPSA id 388571C0015;
        Wed, 16 Sep 2020 14:23:39 +0000 (UTC)
From:   Jacopo Mondi <jacopo+renesas@jmondi.org>
To:     Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>,
        Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>,
        =?UTF-8?q?Niklas=20S=C3=B6derlund?= 
        <niklas.soderlund+renesas@ragnatech.se>,
        Mauro Carvalho Chehab <mchehab@kernel.org>
Cc:     Jacopo Mondi <jacopo+renesas@jmondi.org>,
        linux-renesas-soc@vger.kernel.org, linux-media@vger.kernel.org,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Subject: [PATCH v3] media: i2c: max9286: Fix async subdev size
Date:   Wed, 16 Sep 2020 16:27:19 +0200
Message-Id: <20200916142719.151206-1-jacopo+renesas@jmondi.org>
X-Mailer: git-send-email 2.28.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Since commit 86d37bf31af6 ("media: i2c: max9286: Allocate
v4l2_async_subdev dynamically") the async subdevice registered to the
max9286 notifier is dynamically allocated by the v4l2 framework by using
the v4l2_async_notifier_add_fwnode_subdev() function, but provides an
incorrect size, potentially leading to incorrect memory accesses.

Allocate enough space for the driver specific max9286_asd structure
(which contains the async subdevice) by passing the size of the correct
structure.

Fixes: 86d37bf31af6 ("media: i2c: max9286: Allocate v4l2_async_subdev dynamically")
Reviewed-by: Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>
Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Signed-off-by: Jacopo Mondi <jacopo+renesas@jmondi.org>

---
v2->v3:
- Reword commit message as suggested by Kieran.
---

 drivers/media/i2c/max9286.c | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/drivers/media/i2c/max9286.c b/drivers/media/i2c/max9286.c
index c82c1493e099..6852448284ea 100644
--- a/drivers/media/i2c/max9286.c
+++ b/drivers/media/i2c/max9286.c
@@ -577,10 +577,11 @@ static int max9286_v4l2_notifier_register(struct max9286_priv *priv)
 	for_each_source(priv, source) {
 		unsigned int i = to_index(priv, source);
 		struct v4l2_async_subdev *asd;
+		struct max9286_asd *masd;

 		asd = v4l2_async_notifier_add_fwnode_subdev(&priv->notifier,
 							    source->fwnode,
-							    sizeof(*asd));
+							    sizeof(*masd));
 		if (IS_ERR(asd)) {
 			dev_err(dev, "Failed to add subdev for source %u: %ld",
 				i, PTR_ERR(asd));
@@ -588,7 +589,8 @@ static int max9286_v4l2_notifier_register(struct max9286_priv *priv)
 			return PTR_ERR(asd);
 		}

-		to_max9286_asd(asd)->source = source;
+		masd = to_max9286_asd(asd);
+		masd->source = source;
 	}

 	priv->notifier.ops = &max9286_notify_ops;
--
2.28.0

