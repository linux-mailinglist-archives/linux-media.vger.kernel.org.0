Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 07AAC827F2
	for <lists+linux-media@lfdr.de>; Tue,  6 Aug 2019 01:35:28 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731149AbfHEXf0 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 5 Aug 2019 19:35:26 -0400
Received: from mail-pl1-f195.google.com ([209.85.214.195]:36916 "EHLO
        mail-pl1-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1731115AbfHEXfX (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Mon, 5 Aug 2019 19:35:23 -0400
Received: by mail-pl1-f195.google.com with SMTP id b3so37084722plr.4;
        Mon, 05 Aug 2019 16:35:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=6iYP0JvYAFLVtV3J8Qmrytu1XRzVtGshvxdwIhQDdoY=;
        b=scLTDol5C2jg+ClxVnIhjbbp5VE8ZjWIY804LSIf8WVkN9YLR8H1FdXIik1FpaRpky
         4U4mydJhQ8PTw22Ek03c2kmX+JPGhkfUJl+cnpsQraCQQBT/60I03Tu7jJhV+J7UEIw6
         boeinbU/unQsZpaWQRKziufNLBaJtxc2j/6vLvRJVVYkddDfaOGv1e6Zx542QTKUD53b
         ry8OUjsqgYiSV18EHY0g1DNTNhLfN5TCo+f/OqZB5DGEnyHzWwJIaa4A+WgJUQW8Jxqf
         FTGYaFPrapdDmtEjJNdzOqvnb8U9y/Ix/mmPHCNynIiTHNmezvJYOSEHcrwnp8hKdZKy
         y2SA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references;
        bh=6iYP0JvYAFLVtV3J8Qmrytu1XRzVtGshvxdwIhQDdoY=;
        b=DiFKdT3wAY9+8NFw9rFyT8uxCa35fBqG2wezXbO7GGgiYNBcBR5/lcnj2+51CGPjDI
         90Q78ckQ+PouxOfCFkSn8woAiPvyrjLS+XHbH8fsusgKFHaaj3NtWx84quHtt6kzpJc2
         oOZoQAWDRIkxdMlGeu3e/9/K2Nk7Gd7cpzzMuthYMDgByVdFv3OJAyURCkYmRUuJcr/H
         LKX8DkU/nywu0TfFP/ZGXyC0/fn7yY/vM81R5BaeTadm/2pdSrzg0JV/GWp38hx30DSR
         7BOU563aLzQzebvXkEYvx0ObLhopiZYDWe59I2JiTgpx1L3i8O+gWyw4hNUhoRyUVCvc
         spkw==
X-Gm-Message-State: APjAAAXDHd+ud2bnyQR02CiYO5zcEHCxKeE4hh7p7xPwKqaeEyzz5hZj
        1Lva9xlYgsWf9yDsQhUhisu65JGn
X-Google-Smtp-Source: APXvYqxnFV+w2xRTJC/frsYbXUgsKT+u5wgE+5vFHDLK4JO+xBtwCGP51zB3HGy/3zAybgG02MgcnQ==
X-Received: by 2002:a17:902:9a95:: with SMTP id w21mr275038plp.126.1565048121997;
        Mon, 05 Aug 2019 16:35:21 -0700 (PDT)
Received: from majic.sklembedded.com (c-73-202-231-77.hsd1.ca.comcast.net. [73.202.231.77])
        by smtp.googlemail.com with ESMTPSA id 30sm31296349pjk.17.2019.08.05.16.35.21
        (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
        Mon, 05 Aug 2019 16:35:21 -0700 (PDT)
From:   Steve Longerbeam <slongerbeam@gmail.com>
To:     linux-media@vger.kernel.org
Cc:     Steve Longerbeam <slongerbeam@gmail.com>,
        =?UTF-8?q?Niklas=20S=C3=B6derlund?= <niklas.soderlund@ragnatech.se>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        linux-renesas-soc@vger.kernel.org (open list:MEDIA DRIVERS FOR RENESAS
        - VIN), linux-kernel@vger.kernel.org (open list)
Subject: [PATCH 07/22] media: rcar-csi2: Fix fwnode media link creation
Date:   Mon,  5 Aug 2019 16:34:50 -0700
Message-Id: <20190805233505.21167-8-slongerbeam@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20190805233505.21167-1-slongerbeam@gmail.com>
References: <20190805233505.21167-1-slongerbeam@gmail.com>
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

rcsi2_notify_bound() passes the bound subdev's match fwnode to
media_entity_get_fwnode_pad() to determine the subdev's source
pad for creating the media link to it. When the bound subdev is
the adv748x-csi2 transmitter, this is in fact correctly the endpoint
fwnode. For other subdevices this likely will not be the case, the
asd match fwnode is usually not an endpoint fwnode but rather the
port parent fwnode. So rcar-csi2 will fail to get the correct source
pad for bound subdev's other than the adv748x.

To fix and make rcar-csi2 connect more generally to other subdevices,
replace the calls to media_entity_get_fwnode_pad() and
media_create_pad_link() with a call to media_create_fwnode_pad_links().

Fixes: 769afd212b160 ("media: rcar-csi2: add Renesas R-Car MIPI CSI-2 receiver driver")

Signed-off-by: Steve Longerbeam <slongerbeam@gmail.com>
---
 drivers/media/platform/rcar-vin/rcar-csi2.c | 23 +++++++++------------
 1 file changed, 10 insertions(+), 13 deletions(-)

diff --git a/drivers/media/platform/rcar-vin/rcar-csi2.c b/drivers/media/platform/rcar-vin/rcar-csi2.c
index c14af1b929df..13242cbad8d3 100644
--- a/drivers/media/platform/rcar-vin/rcar-csi2.c
+++ b/drivers/media/platform/rcar-vin/rcar-csi2.c
@@ -738,23 +738,20 @@ static int rcsi2_notify_bound(struct v4l2_async_notifier *notifier,
 			      struct v4l2_async_subdev *asd)
 {
 	struct rcar_csi2 *priv = notifier_to_csi2(notifier);
-	int pad;
+	int ret;
 
-	pad = media_entity_get_fwnode_pad(&subdev->entity, asd->match.fwnode,
-					  MEDIA_PAD_FL_SOURCE);
-	if (pad < 0) {
-		dev_err(priv->dev, "Failed to find pad for %s\n", subdev->name);
-		return pad;
-	}
+	ret = media_create_fwnode_pad_links(&priv->subdev.entity.pads[0],
+					    dev_fwnode(priv->dev),
+					    &subdev->entity,
+					    dev_fwnode(subdev->dev),
+					    MEDIA_LNK_FL_ENABLED |
+					    MEDIA_LNK_FL_IMMUTABLE);
+	if (ret)
+		return ret;
 
 	priv->remote = subdev;
 
-	dev_dbg(priv->dev, "Bound %s pad: %d\n", subdev->name, pad);
-
-	return media_create_pad_link(&subdev->entity, pad,
-				     &priv->subdev.entity, 0,
-				     MEDIA_LNK_FL_ENABLED |
-				     MEDIA_LNK_FL_IMMUTABLE);
+	return 0;
 }
 
 static void rcsi2_notify_unbind(struct v4l2_async_notifier *notifier,
-- 
2.17.1

