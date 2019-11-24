Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 80D8710849B
	for <lists+linux-media@lfdr.de>; Sun, 24 Nov 2019 20:07:27 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727029AbfKXTHY (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sun, 24 Nov 2019 14:07:24 -0500
Received: from mail-pg1-f196.google.com ([209.85.215.196]:37200 "EHLO
        mail-pg1-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727020AbfKXTHY (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Sun, 24 Nov 2019 14:07:24 -0500
Received: by mail-pg1-f196.google.com with SMTP id b10so5941337pgd.4
        for <linux-media@vger.kernel.org>; Sun, 24 Nov 2019 11:07:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=5ZpPo4clcR+upeFZkPjixFe7+7EzxZsDajulwhkI/xc=;
        b=XQ3l0hYba8b79t+2nLw6jXYVGFbCYC2hNugvlMy20V7SJ5QnDrSx4LXsjgsIFYrhTP
         1n1Fvh2Cn37rL/fG6GC4PVOmk0mg4yTn6x8p8ahoPSzd+jLpaDDiYy8bH07eh3lsNgIB
         7XZRq/LL9SSVtG2mskPmuVBoEUPAUXid/eH2oar+I/47vO/Nc4BrQg5dun11ZT1ITVR6
         2XQczWHlE4G3B69p3qSUBOgEf6nFbBxTdZN/Y6VwAAeX5f+9RWnglOiBYCBddNB/r/fh
         1kGhgDZybL5kGBsRQjimpjMuGtGNs6xSrhukmX7F5HSK3ExnX5edRYQiHHG6XISHVj65
         e4RQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references;
        bh=5ZpPo4clcR+upeFZkPjixFe7+7EzxZsDajulwhkI/xc=;
        b=oHFMIfd2kjmxl5ga/m3v8j+AQM3z7AHZ51gm261mlfa9h46gAmizurr901tvfnmpOL
         HlDH0NKcW7BnvYjSo0ekvJCRiaoE1DRUV8ebn/sojUdBjfjr7rdyoIGODpc+9Txh2cow
         MX3/I3/rE8/KTcB01iYgO5q7aT3Oub8gPV9CKHIVlmSh+obd7JKl6VqJaeinFAC8RhW1
         wVBsLR55gpi12rEwfN5R4iuT8V40GYmtDTyoFtRFw9Mf0MBoc67wymbpcvqzklBHvbai
         Hoz2qnP+rkhasbMdHfpUWSF4LtsUIwBB5I85/R0bRoabiiBGC+bBpvrdDBVHX2NVI49G
         Dnsw==
X-Gm-Message-State: APjAAAVnKAE4fomrqYUpD5NUYmDGAH6WVcbsSGVNdHj56Jezo1Bqz6g+
        7zpy+xBRwSzunCq/uxOrowKsyYnxX4s=
X-Google-Smtp-Source: APXvYqxxW8m5mIxRqvf/SQOTUWAM8Pf7R+3mfxN+2ZgVfXFY9usW+e3ozt8k9gJDmrfYoRM1cHrqwg==
X-Received: by 2002:a63:e4a:: with SMTP id 10mr25910143pgo.121.1574622442910;
        Sun, 24 Nov 2019 11:07:22 -0800 (PST)
Received: from majic.sklembedded.com (c-73-202-231-77.hsd1.ca.comcast.net. [73.202.231.77])
        by smtp.googlemail.com with ESMTPSA id r20sm5367801pgo.74.2019.11.24.11.07.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 24 Nov 2019 11:07:22 -0800 (PST)
From:   Steve Longerbeam <slongerbeam@gmail.com>
To:     linux-media@vger.kernel.org
Cc:     Steve Longerbeam <slongerbeam@gmail.com>
Subject: [PATCH v2 10/23] media: st-mipid02: Fix fwnode media link creation
Date:   Sun, 24 Nov 2019 11:06:50 -0800
Message-Id: <20191124190703.12138-11-slongerbeam@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20191124190703.12138-1-slongerbeam@gmail.com>
References: <20191124190703.12138-1-slongerbeam@gmail.com>
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

mipid02_async_bound() passes the bound subdev's sd->fwnode to
media_entity_get_fwnode_pad(). This is likely not an endpoint
fwnode as required by media_entity_get_fwnode_pad(), for most
subdevices it is the port parent of endpoint fwnode(s). This has only
worked before because no entities have implemented the .get_fwnode_pad()
op yet, and the default behavior of media_entity_get_fwnode_pad()
was to ignore the passed fwnode and return the first pad that matches
the given direction flags.

Fix this by replacing the calls to media_entity_get_fwnode_pad() and
media_create_pad_link() with a call to media_create_fwnode_pad_links().

Fixes: 642bb5e88fed8 ("media: st-mipid02: MIPID02 CSI-2 to PARALLEL
bridge driver")
Signed-off-by: Steve Longerbeam <slongerbeam@gmail.com>
---
 drivers/media/i2c/st-mipid02.c | 20 ++++++--------------
 1 file changed, 6 insertions(+), 14 deletions(-)

diff --git a/drivers/media/i2c/st-mipid02.c b/drivers/media/i2c/st-mipid02.c
index 003ba22334cd..bd487082d677 100644
--- a/drivers/media/i2c/st-mipid02.c
+++ b/drivers/media/i2c/st-mipid02.c
@@ -798,24 +798,16 @@ static int mipid02_async_bound(struct v4l2_async_notifier *notifier,
 {
 	struct mipid02_dev *bridge = to_mipid02_dev(notifier->sd);
 	struct i2c_client *client = bridge->i2c_client;
-	int source_pad;
 	int ret;
 
 	dev_dbg(&client->dev, "sensor_async_bound call %p", s_subdev);
 
-	source_pad = media_entity_get_fwnode_pad(&s_subdev->entity,
-						 s_subdev->fwnode,
-						 MEDIA_PAD_FL_SOURCE);
-	if (source_pad < 0) {
-		dev_err(&client->dev, "Couldn't find output pad for subdev %s\n",
-			s_subdev->name);
-		return source_pad;
-	}
-
-	ret = media_create_pad_link(&s_subdev->entity, source_pad,
-				    &bridge->sd.entity, 0,
-				    MEDIA_LNK_FL_ENABLED |
-				    MEDIA_LNK_FL_IMMUTABLE);
+	ret = media_create_fwnode_pad_links(&bridge->sd.entity.pads[0],
+					    dev_fwnode(&client->dev),
+					    &s_subdev->entity,
+					    dev_fwnode(s_subdev->dev),
+					    MEDIA_LNK_FL_ENABLED |
+					    MEDIA_LNK_FL_IMMUTABLE);
 	if (ret) {
 		dev_err(&client->dev, "Couldn't create media link %d", ret);
 		return ret;
-- 
2.17.1

