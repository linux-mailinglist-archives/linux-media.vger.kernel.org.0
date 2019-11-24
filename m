Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 95A51108499
	for <lists+linux-media@lfdr.de>; Sun, 24 Nov 2019 20:07:26 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727008AbfKXTHW (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sun, 24 Nov 2019 14:07:22 -0500
Received: from mail-pf1-f195.google.com ([209.85.210.195]:43622 "EHLO
        mail-pf1-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727007AbfKXTHW (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Sun, 24 Nov 2019 14:07:22 -0500
Received: by mail-pf1-f195.google.com with SMTP id 3so6134596pfb.10
        for <linux-media@vger.kernel.org>; Sun, 24 Nov 2019 11:07:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=cuZoH/JLmsjVG1Yg//mGp6FIvC3w8f1MmhjZrWshNBg=;
        b=IX4Y9Bz/oaP/VAPUGFUyK43T18l1VPj60JTc6pL0zbdvaybJfeifheGeXq4OUAX8ad
         U4Po6D9ilLnP+P0dbpbJaY4PSyVgzYF6Q2OYIALjVuM6/fVroictl+aJdyq5r2emykwj
         4pHyEQIOaqUrinTyNvQdHCjdgKCKCBfza7cq4mYf3UNilIzaIzBXFjvwRjg+Lv3HfjpD
         hNbnzTclxFHzv9EDOXpN4368pwi/ct4be3Hw4vX78Ineji6i7KmuOAErKsvvcSThesX2
         Wx2MTwthNIqm6G76MehseNrO8VvlN0fAAkiML1cExwYdHBVq/lPD0d20hJXS+IFZh5Ay
         az6A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references;
        bh=cuZoH/JLmsjVG1Yg//mGp6FIvC3w8f1MmhjZrWshNBg=;
        b=W04vlpyfn70k58XC5aKerbuRtgwrmKi5T3uS8KKLoCpU4Iu1s/qzfEeSFBNdAflafl
         kWrR2e7H1nHlOM+0nEM5Zpyb49zZi22Bnx8EZP9662rS5Lg71gsfu8768CTsiVyb27hr
         kWHPSOY6cH3b8ZvOB/ymWMBhWwUgAUZXhTbB3qu9KyLBwqNWobWjqtONjSofEoIM2vJQ
         PlWrt5tcjxnDRzFztS9/8ILpin2rFe4E5gAjn/Y8x0w0ZPCTdRRKlbtw2sMtDo2kzkTC
         TWKI0syqXdcPMr7f0RqT0BeSkp1M2PQ6LfjJLoj9nnqm/Ap74HXtFKfIl0fs80a2cnKk
         hITw==
X-Gm-Message-State: APjAAAUzeLzipDG7XjWMwTuLFWWvslBOGpRnZHQLBI4fmAJyPOLkN7Tb
        jTbl/xwlSq2eLiDa7gWcy87air8CMSw=
X-Google-Smtp-Source: APXvYqx4H4sE/y5iGINvFwtgb+M0aoC+Ej9aY8Eos8fYhLzhc7CLSmjyZtwqAN5RxKdhhdT/3tHTPQ==
X-Received: by 2002:a62:7f93:: with SMTP id a141mr30562612pfd.82.1574622441016;
        Sun, 24 Nov 2019 11:07:21 -0800 (PST)
Received: from majic.sklembedded.com (c-73-202-231-77.hsd1.ca.comcast.net. [73.202.231.77])
        by smtp.googlemail.com with ESMTPSA id r20sm5367801pgo.74.2019.11.24.11.07.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 24 Nov 2019 11:07:20 -0800 (PST)
From:   Steve Longerbeam <slongerbeam@gmail.com>
To:     linux-media@vger.kernel.org
Cc:     Steve Longerbeam <slongerbeam@gmail.com>
Subject: [PATCH v2 08/23] media: cadence: csi2rx: Fix fwnode media link creation
Date:   Sun, 24 Nov 2019 11:06:48 -0800
Message-Id: <20191124190703.12138-9-slongerbeam@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20191124190703.12138-1-slongerbeam@gmail.com>
References: <20191124190703.12138-1-slongerbeam@gmail.com>
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
index be9ec59774d6..d79345820225 100644
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

