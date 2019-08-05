Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 15B7982828
	for <lists+linux-media@lfdr.de>; Tue,  6 Aug 2019 01:36:55 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731112AbfHEXfW (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 5 Aug 2019 19:35:22 -0400
Received: from mail-pg1-f193.google.com ([209.85.215.193]:37627 "EHLO
        mail-pg1-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1731097AbfHEXfW (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Mon, 5 Aug 2019 19:35:22 -0400
Received: by mail-pg1-f193.google.com with SMTP id d1so7698927pgp.4;
        Mon, 05 Aug 2019 16:35:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=0YKGrpYeoAEn9gUSXzC9FX/K5C81TuWUa0ZyQnxQgg4=;
        b=NB75LqfP9iOlcrV9L++uSoIZ0A/Gz+fEqpArVizRSYxfGlY4jmd0leWG6WY360/YQi
         bw+tqNPIL1+Ymnl4UWFR4iL0+h3Q8QYBFIl4k9cM/BB2nrKXrLqVkH3qj0TNQueFQTVi
         SEtA4DJEjf/BnHrBUhYR69WMgY8fbjFkoHxmH/MI4PQsz2ZiRbnglV7eQMWiWy/knUDp
         9qPT8XqvL53sXyD9POVVnYBz03r4b35jE1RdMn4T5BWJOp3iQFayFKsbxeDeVRXP5Xa+
         XbqPvR3wbHhOaifv7ezUZB/XjXlHJJPnSLEnrgk9oK408Oz2cOuNj5s+VeudroacMz5L
         suyA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references;
        bh=0YKGrpYeoAEn9gUSXzC9FX/K5C81TuWUa0ZyQnxQgg4=;
        b=n05Tq5SUp8Rag54VAAG0rytCoev9qcDh98DQcE/Jidp5/FCQjxFHZaxXvlz1A864mK
         dRGeboGyZkOdQdCG3LJfQq/rWKrXPDSDeMUy8BqUgMJJEXVaY/NvS3rxoWo+ts/Q9glb
         s2tdLGgEye5uX+XAyyTEUBx70Y2xI9MRrA+/stAMNAypj/ZMQF76weI+QQtQZI8RmUFN
         pQjJDz+ZBsGxwyoLsxU94ng5BlS32QQ6HkhBQiMq3SJnQFnTjdSbwK9TPja2ltOx6tnE
         v7Ymgsb2EvGQIqVrjOAsdrdifXMIzvOTz2hkas62PqzBPplvxbq9XdFp0GuoOoAdN5sw
         1dYw==
X-Gm-Message-State: APjAAAWCu5+wrgKnxAvelC2IXDhvzSYw0bwO4aiLVyayhNjs2azhpU+D
        sXBZrVezk7BQsDX9qUeTco7QMl4W
X-Google-Smtp-Source: APXvYqwVy1vsx6X+g2YUpWBSfEcDbd7CqIq3nB6v1wnUaPlcwVjKtF8JMVayTWFyrgTanYpawdhhuw==
X-Received: by 2002:a63:724b:: with SMTP id c11mr377260pgn.30.1565048120941;
        Mon, 05 Aug 2019 16:35:20 -0700 (PDT)
Received: from majic.sklembedded.com (c-73-202-231-77.hsd1.ca.comcast.net. [73.202.231.77])
        by smtp.googlemail.com with ESMTPSA id 30sm31296349pjk.17.2019.08.05.16.35.20
        (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
        Mon, 05 Aug 2019 16:35:20 -0700 (PDT)
From:   Steve Longerbeam <slongerbeam@gmail.com>
To:     linux-media@vger.kernel.org
Cc:     Steve Longerbeam <slongerbeam@gmail.com>,
        Kieran Bingham <kieran.bingham@ideasonboard.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        linux-kernel@vger.kernel.org (open list)
Subject: [PATCH 06/22] media: adv748x: csi2: Implement get_fwnode_pad
Date:   Mon,  5 Aug 2019 16:34:49 -0700
Message-Id: <20190805233505.21167-7-slongerbeam@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20190805233505.21167-1-slongerbeam@gmail.com>
References: <20190805233505.21167-1-slongerbeam@gmail.com>
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

If the given endpoint fwnode passed to the .get_fwnode_pad() op is
the adv748x-csi2 TXA/TXB source endpoint, return the associated media
pad index ADV748X_CSI2_SOURCE. The adv748x-csi2 has no other media pads
that are associated with fwnode endpoints.

Signed-off-by: Steve Longerbeam <slongerbeam@gmail.com>
---
 drivers/media/i2c/adv748x/adv748x-csi2.c | 21 +++++++++++++++++++++
 1 file changed, 21 insertions(+)

diff --git a/drivers/media/i2c/adv748x/adv748x-csi2.c b/drivers/media/i2c/adv748x/adv748x-csi2.c
index 2091cda50935..810085a1f2f0 100644
--- a/drivers/media/i2c/adv748x/adv748x-csi2.c
+++ b/drivers/media/i2c/adv748x/adv748x-csi2.c
@@ -228,6 +228,24 @@ static const struct v4l2_subdev_ops adv748x_csi2_ops = {
 	.pad = &adv748x_csi2_pad_ops,
 };
 
+/* -----------------------------------------------------------------------------
+ * media_entity_operations
+ */
+
+static int adv748x_csi2_get_fwnode_pad(struct media_entity *entity,
+				       struct fwnode_endpoint *endpoint)
+{
+	struct v4l2_subdev *sd = media_entity_to_v4l2_subdev(entity);
+	struct adv748x_csi2 *tx = adv748x_sd_to_csi2(sd);
+
+	return endpoint->local_fwnode == tx->sd.fwnode ?
+		ADV748X_CSI2_SOURCE : -ENXIO;
+}
+
+static const struct media_entity_operations adv748x_csi2_entity_ops = {
+	.get_fwnode_pad = adv748x_csi2_get_fwnode_pad,
+};
+
 /* -----------------------------------------------------------------------------
  * Subdev module and controls
  */
@@ -295,6 +313,9 @@ int adv748x_csi2_init(struct adv748x_state *state, struct adv748x_csi2 *tx)
 	/* Register internal ops for incremental subdev registration */
 	tx->sd.internal_ops = &adv748x_csi2_internal_ops;
 
+	/* Register media_entity ops */
+	tx->sd.entity.ops = &adv748x_csi2_entity_ops;
+
 	tx->pads[ADV748X_CSI2_SINK].flags = MEDIA_PAD_FL_SINK;
 	tx->pads[ADV748X_CSI2_SOURCE].flags = MEDIA_PAD_FL_SOURCE;
 
-- 
2.17.1

