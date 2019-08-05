Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 7CB608281F
	for <lists+linux-media@lfdr.de>; Tue,  6 Aug 2019 01:36:36 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731186AbfHEXg1 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 5 Aug 2019 19:36:27 -0400
Received: from mail-pl1-f194.google.com ([209.85.214.194]:41549 "EHLO
        mail-pl1-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1731136AbfHEXf0 (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Mon, 5 Aug 2019 19:35:26 -0400
Received: by mail-pl1-f194.google.com with SMTP id m9so36921728pls.8;
        Mon, 05 Aug 2019 16:35:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=zuSwOrhBwRQRJK3HV6p1JJE9Ot+MWPiWfnDhw3EwSv0=;
        b=FGVT31NIzx7m9SF7Q0Dc1L8TsU4TH+S600fxoJ9YuNKFMCRHwmFra98AB2Ef9nWJf1
         DdO6fY1kLxQN7xXToQ0cagEvPC5e3rIPjMa57igQ7ALrU7KEFwGy8Sf01gJS5nEzYmqW
         CXiENe5g8DuLhFJs3XDaoGNmVm+B/96Z3ZM8E3t29/nhccr0eQMmyZOXdoD8IQjUfYOT
         R7HEfUbnARG0IxRVTO1PQtn6Tr9423SMsfm7HZzZcmC9g6x0TSFhxYTa02JTETEz9BnF
         xuNhZ/BylpxFyArCh30z8hjyE7pd0fgWBzKbByT81KkjA31jhxm2L56kOS/AROSiqlxv
         Wryw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references;
        bh=zuSwOrhBwRQRJK3HV6p1JJE9Ot+MWPiWfnDhw3EwSv0=;
        b=DeTiwHHKNCx645ix/0mi/81J3v4bCJuaE2ijY+Dw5W/9MBcSlIBtIj3K1/c02tN14o
         jOcCGNX0oFqhrNUbB2OClqNQw7qmpLLis1ckj0xDonLcO0pSjUFSHpMGsVgWIQDH2bdh
         WPOpb6TPIzmmuA0QQgASqyKMWwjBY0Ke8GzPIy2VXizpwfXmV6aUHtBwmXCt61XDmiaT
         muFcwWtukuz/NMbM2PvOevWwEhJ/fMxNBOBzz9mkgGLhsEzd17VpjmleyTisHveeYSwK
         75tIO9KdAucmIyWVTPDfXky2+REEn7SDu1pydaz1FQlzSpKJYC+wE/1qsKhdis5RckRC
         Ltmg==
X-Gm-Message-State: APjAAAXqgtAN2/OzIbGEBFgj51IO01MGFLsAFYoGZuJPG+eH3+t0IHs6
        VwuMldxTE0l0JChIK8mRah0PESay
X-Google-Smtp-Source: APXvYqxK4pAauGaw8Udm7cWR+aa6q19pAm0uea65JLPXzYXqBuTFmmBzLFxGNrVU7vSGiVXiEq8cwQ==
X-Received: by 2002:a17:902:8f81:: with SMTP id z1mr254403plo.290.1565048125076;
        Mon, 05 Aug 2019 16:35:25 -0700 (PDT)
Received: from majic.sklembedded.com (c-73-202-231-77.hsd1.ca.comcast.net. [73.202.231.77])
        by smtp.googlemail.com with ESMTPSA id 30sm31296349pjk.17.2019.08.05.16.35.24
        (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
        Mon, 05 Aug 2019 16:35:24 -0700 (PDT)
From:   Steve Longerbeam <slongerbeam@gmail.com>
To:     linux-media@vger.kernel.org
Cc:     Steve Longerbeam <slongerbeam@gmail.com>,
        Mickael Guene <mickael.guene@st.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        linux-kernel@vger.kernel.org (open list)
Subject: [PATCH 10/22] media: st-mipid02: Fix fwnode media link creation
Date:   Mon,  5 Aug 2019 16:34:53 -0700
Message-Id: <20190805233505.21167-11-slongerbeam@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20190805233505.21167-1-slongerbeam@gmail.com>
References: <20190805233505.21167-1-slongerbeam@gmail.com>
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
index 81285b8d5cfb..b26d5550874f 100644
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

