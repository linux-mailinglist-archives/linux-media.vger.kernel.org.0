Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 0985A827F3
	for <lists+linux-media@lfdr.de>; Tue,  6 Aug 2019 01:35:28 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731139AbfHEXfZ (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 5 Aug 2019 19:35:25 -0400
Received: from mail-pl1-f194.google.com ([209.85.214.194]:45676 "EHLO
        mail-pl1-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1731128AbfHEXfY (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Mon, 5 Aug 2019 19:35:24 -0400
Received: by mail-pl1-f194.google.com with SMTP id y8so37069587plr.12;
        Mon, 05 Aug 2019 16:35:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=dAKOIEeoGKu9ksf9veB0nLPjInrgxCMs8JCeUaCJVi0=;
        b=e3xC1zSth5xJ9t+xenegQIapzXe7iP2UT8tigtvLc/Gr33QnxqBOEBhtRWyDqeoM0l
         sxbis/aNlfzP9WITSOp8XAymZZ2H/P8zBbWcZs8ofDRSIfunB1PaaczoIv7NfTyGgUbJ
         z+crIVRh2y8O16DDwh+UWmN5hfz0vn+9+I46V0yPR41l22XDBW6ql95YzIb1x4gPlCkg
         UV0cw01giVtIesB8Enr2F9YDVvxHjvbCXYoFc3RCIcKz2a1Fklm78Jue9Fzj/eWTRB2l
         cSBCMjs0nSskqfF1AKmnm9NmtjGz2jcPLnzW/htot7YlQtsDec58kcEI0vYLvW9sGQBk
         TBrw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references;
        bh=dAKOIEeoGKu9ksf9veB0nLPjInrgxCMs8JCeUaCJVi0=;
        b=iKsqTNyyRlQwwcjk0GTHgglMVRnaM22PBKexMvhX1+7KJ+g0Wsh/vNpkKO2j6Nlmpj
         jKcHfvXWOFrTQ+47qaNUrVBijWrZf3gTq/Foeoke6jDuYD+hGWspm/4FSTqFOUpz3rHh
         qs4trMUNw+U3Ai1c2jhMKF321Bspbb77CbGCy898DwJZj/AhvyZrN0Gmj5pdHtDhLEKK
         WjN3lP+7+2MlnCmA2VrmILy5E450B3q+XD62gbP9VSVMGOdoRn5rsueMySbt29zOhB5t
         r18xl1/I2G3QHyAJDQ4HzKfOrBwAK/gRd5NDTjWetn7k97OUuu4S3wjCGSScUzFUmKM+
         L+gg==
X-Gm-Message-State: APjAAAU+lIX3Fhj/UYfZ9mLG3ks0HL5AscyQocGHapvE/RhGlGPTAqhT
        PkfxknnqEIpP0E0X+3zU+Ji2EPqW
X-Google-Smtp-Source: APXvYqzD2xGj9zA7t3v6eQic5J2mNV9AGfP/U50BBVRpjt4OK6trPgi1se6DWSe3zb4fWjPBj3Xm8Q==
X-Received: by 2002:a17:902:4283:: with SMTP id h3mr243406pld.15.1565048123016;
        Mon, 05 Aug 2019 16:35:23 -0700 (PDT)
Received: from majic.sklembedded.com (c-73-202-231-77.hsd1.ca.comcast.net. [73.202.231.77])
        by smtp.googlemail.com with ESMTPSA id 30sm31296349pjk.17.2019.08.05.16.35.22
        (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
        Mon, 05 Aug 2019 16:35:22 -0700 (PDT)
From:   Steve Longerbeam <slongerbeam@gmail.com>
To:     linux-media@vger.kernel.org
Cc:     Steve Longerbeam <slongerbeam@gmail.com>,
        Maxime Ripard <maxime.ripard@bootlin.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        linux-kernel@vger.kernel.org (open list)
Subject: [PATCH 08/22] media: cadence: csi2rx: Fix fwnode media link creation
Date:   Mon,  5 Aug 2019 16:34:51 -0700
Message-Id: <20190805233505.21167-9-slongerbeam@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20190805233505.21167-1-slongerbeam@gmail.com>
References: <20190805233505.21167-1-slongerbeam@gmail.com>
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

csi2rx_async_bound() passes the bound subdev's sd->fwnode to
media_entity_get_fwnode_pad(). This is likely not an endpoint
fwnode as required by media_entity_get_fwnode_pad(), for most
subdevices it is the port parent of endpoint fwnode(s). This has only
worked before because no entities have implemented the .get_fwnode_pad()
op yet, and the default behavior of media_entity_get_fwnode_pad()
was to ignore the passed fwnode and return the first pad that matches
the given direction flags.

Fix this by replacing the calls to media_entity_get_fwnode_pad() and
media_create_pad_link() with a call to media_create_fwnode_pad_links().

Fixes: 1fc3b37f34f69 ("media: v4l: cadence: Add Cadence MIPI-CSI2 RX driver")

Signed-off-by: Steve Longerbeam <slongerbeam@gmail.com>
---
 drivers/media/platform/cadence/cdns-csi2rx.c | 27 ++++++++------------
 1 file changed, 10 insertions(+), 17 deletions(-)

diff --git a/drivers/media/platform/cadence/cdns-csi2rx.c b/drivers/media/platform/cadence/cdns-csi2rx.c
index 31ace114eda1..d478800a3859 100644
--- a/drivers/media/platform/cadence/cdns-csi2rx.c
+++ b/drivers/media/platform/cadence/cdns-csi2rx.c
@@ -83,7 +83,6 @@ struct csi2rx_priv {
 	/* Remote source */
 	struct v4l2_async_subdev	asd;
 	struct v4l2_subdev		*source_subdev;
-	int				source_pad;
 };
 
 static inline
@@ -251,26 +250,20 @@ static int csi2rx_async_bound(struct v4l2_async_notifier *notifier,
 {
 	struct v4l2_subdev *subdev = notifier->sd;
 	struct csi2rx_priv *csi2rx = v4l2_subdev_to_csi2rx(subdev);
+	int ret;
 
-	csi2rx->source_pad = media_entity_get_fwnode_pad(&s_subdev->entity,
-							 s_subdev->fwnode,
-							 MEDIA_PAD_FL_SOURCE);
-	if (csi2rx->source_pad < 0) {
-		dev_err(csi2rx->dev, "Couldn't find output pad for subdev %s\n",
-			s_subdev->name);
-		return csi2rx->source_pad;
-	}
+	ret = media_create_fwnode_pad_links(&csi2rx->subdev.entity.pads[0],
+					    dev_fwnode(csi2rx->dev),
+					    &s_subdev->entity,
+					    dev_fwnode(s_subdev->dev),
+					    MEDIA_LNK_FL_ENABLED |
+					    MEDIA_LNK_FL_IMMUTABLE);
+	if (ret)
+		return ret;
 
 	csi2rx->source_subdev = s_subdev;
 
-	dev_dbg(csi2rx->dev, "Bound %s pad: %d\n", s_subdev->name,
-		csi2rx->source_pad);
-
-	return media_create_pad_link(&csi2rx->source_subdev->entity,
-				     csi2rx->source_pad,
-				     &csi2rx->subdev.entity, 0,
-				     MEDIA_LNK_FL_ENABLED |
-				     MEDIA_LNK_FL_IMMUTABLE);
+	return 0;
 }
 
 static const struct v4l2_async_notifier_operations csi2rx_notifier_ops = {
-- 
2.17.1

