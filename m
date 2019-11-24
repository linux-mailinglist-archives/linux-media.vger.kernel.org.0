Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id EA6651084A9
	for <lists+linux-media@lfdr.de>; Sun, 24 Nov 2019 20:07:40 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727121AbfKXTHi (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sun, 24 Nov 2019 14:07:38 -0500
Received: from mail-pg1-f196.google.com ([209.85.215.196]:40943 "EHLO
        mail-pg1-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727111AbfKXTHg (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Sun, 24 Nov 2019 14:07:36 -0500
Received: by mail-pg1-f196.google.com with SMTP id e17so5929346pgd.7
        for <linux-media@vger.kernel.org>; Sun, 24 Nov 2019 11:07:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=2TmLGvTN3FaWVeRsZPV3e4KNsmV2AReP7cWUVSqpqFQ=;
        b=tktmlwzJ0mriS6Fthqk2MprPTXldRFIfdl97oh1ZiZtDZTz0+pR3d7y6AVWt+4WN91
         r1PrkKL8CqAVqbya/+e0CQAiypndn60iMCyhOeV77Bj3PI6sWT2p1aLD13+ZMq48tZsb
         b5Xm9ksK9eR/p0K9GrFkS7oj20MS0uSt2AdcOab3vcdJc1GwQ6VX63YytmVN832+NPhc
         tN0HAOJlEPQiaEfeArtL8lFPKtsOrqNXyhB4SNu0N2NfsXRtBCIM5OVMk/zZUngnteHE
         hcvrCr8rm2VY68pPBqJ9Vt3nypqno7XsiPCmKcnL2DHMrOOD36eOkKT7w1hTCM8Oqy0j
         vE4Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references;
        bh=2TmLGvTN3FaWVeRsZPV3e4KNsmV2AReP7cWUVSqpqFQ=;
        b=qbdw7hZvxzW8d+/TlsDNrq13VJuZwLt5b/pZ3oKGFdakRj0+QX/Vr10bh0n2YSTEWW
         4dGDFZrkYCgj+CE4c+v1ozYwwKQ8l4xiEmQN+L30Zta+arZWCA9Z0DIluUBvK5eSEHt9
         HfvPZM2YCQ5ndUh0sXWXWbrnN5/vjtxrm3t42j6vWcstQ54Y7kiJ/YOX9/LzLUX8Zmxn
         3uTgqpAy2V38UVldGZo38gDy+4bfGXW7gqDqrklMPuZWp2nSfkM/lgvdlFO81LTURwUk
         cj2CrbLMf7lN1WJ/3jtZc4RTheKbGSXlJiSoVbhtSQ2Z4rNjJ8/E3EaRYb2O6ayKkguA
         IYOw==
X-Gm-Message-State: APjAAAXLEIMpRVuMWKZF7r9WrllJFIo8g2pRNoUi/EgHfOnd++AHSB7H
        RiYIw9EqGixsa/lB6c9fGfKXOKTic1k=
X-Google-Smtp-Source: APXvYqzHWXvlukGyVa9OsAemjiAdrkEBX3SPUU79avByGJme8RFnzve+PdOb/4EnGSwWKudLvGPF2g==
X-Received: by 2002:a63:1013:: with SMTP id f19mr13200361pgl.289.1574622455623;
        Sun, 24 Nov 2019 11:07:35 -0800 (PST)
Received: from majic.sklembedded.com (c-73-202-231-77.hsd1.ca.comcast.net. [73.202.231.77])
        by smtp.googlemail.com with ESMTPSA id r20sm5367801pgo.74.2019.11.24.11.07.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 24 Nov 2019 11:07:35 -0800 (PST)
From:   Steve Longerbeam <slongerbeam@gmail.com>
To:     linux-media@vger.kernel.org
Cc:     Steve Longerbeam <slongerbeam@gmail.com>
Subject: [PATCH v2 23/23] media: imx: TODO: Remove media link creation todos
Date:   Sun, 24 Nov 2019 11:07:03 -0800
Message-Id: <20191124190703.12138-24-slongerbeam@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20191124190703.12138-1-slongerbeam@gmail.com>
References: <20191124190703.12138-1-slongerbeam@gmail.com>
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Remove the TODO items regarding media link creation, these issues are
resolved after exporting media link creation to individual entity bound
callbacks and the use of media_create_fwnode_links(),
media_create_fwnode_pad_links(), and media_entity_get_fwnode_pad().

Signed-off-by: Steve Longerbeam <slongerbeam@gmail.com>
---
 drivers/staging/media/imx/TODO | 29 -----------------------------
 1 file changed, 29 deletions(-)

diff --git a/drivers/staging/media/imx/TODO b/drivers/staging/media/imx/TODO
index 6f29b5ca5324..a371cdedcdb0 100644
--- a/drivers/staging/media/imx/TODO
+++ b/drivers/staging/media/imx/TODO
@@ -17,35 +17,6 @@
   decided whether this feature is useful enough to make it generally
   available by exporting to v4l2-core.
 
-- After all async subdevices have been bound, v4l2_fwnode_parse_link()
-  is used to form the media links between the devices discovered in
-  the OF graph.
-
-  While this approach allows support for arbitrary OF graphs, there
-  are some assumptions for this to work:
-
-  1. If a port owned by a device in the graph has endpoint nodes, the
-     port is treated as a media pad.
-
-     This presents problems for devices that don't make this port = pad
-     assumption. Examples are SMIAPP compatible cameras which define only
-     a single output port node, but which define multiple pads owned
-     by multiple subdevices (pixel-array, binner, scaler). Or video
-     decoders (entity function MEDIA_ENT_F_ATV_DECODER), which also define
-     only a single output port node, but define multiple pads for video,
-     VBI, and audio out.
-
-     A workaround at present is to set the port reg properties to
-     correspond to the media pad index that the port represents. A
-     possible long-term solution is to implement a subdev API that
-     maps a port id to a media pad index.
-
-  2. Every endpoint of a port owned by a device in the graph is treated
-     as a media link.
-
-     Which means a port must not contain mixed-use endpoints, they
-     must all refer to media links between V4L2 subdevices.
-
 - i.MX7: all of the above, since it uses the imx media core
 
 - i.MX7: use Frame Interval Monitor
-- 
2.17.1

