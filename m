Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id F048710849C
	for <lists+linux-media@lfdr.de>; Sun, 24 Nov 2019 20:07:27 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727046AbfKXTHZ (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sun, 24 Nov 2019 14:07:25 -0500
Received: from mail-pf1-f171.google.com ([209.85.210.171]:33329 "EHLO
        mail-pf1-f171.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727016AbfKXTHY (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Sun, 24 Nov 2019 14:07:24 -0500
Received: by mail-pf1-f171.google.com with SMTP id c184so6167580pfb.0
        for <linux-media@vger.kernel.org>; Sun, 24 Nov 2019 11:07:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=d6CoAtic4/E6VgKaXDd72737mg84I8iU+YKVh93R/0c=;
        b=QxeagG8eIBcsO5X+bbY/WaHen60GSSR3CjODAGw2V2ZSy7cPHYDwX3eQkVmtYCcU9g
         KTVPJptMLp57koow6dTUYgytTn66OCJ/bHTyWcVIgNT89lEOoYbHJ3judulrZ8kCPeI6
         kh3hzEA5zn9irT8V0mr54aL1Z66E+g8NYg6HrjoBKlF/+Ignm+1qVJmItr2PPTiS+oh8
         UkDs/CAwATl9NgFiKuWwMvvwuuzcPeoMG0zubgshUZyUuyYL4NhrcxO6xcGEKfO9C1Bp
         hMStHjnaAo82JxlGdcrPVCN+3pv+Qc7y2q6LfUZviMxlqC1w0drhtBE5gp+RwM6sHVxc
         m/tA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references;
        bh=d6CoAtic4/E6VgKaXDd72737mg84I8iU+YKVh93R/0c=;
        b=Lo/LkST9hfnmBD+zJPk84taMUbZrNVOBQN9bCllvCrFHyMw5QZ9VmoBsIjSMMtb9rx
         D/ov0EsFNjMBXcIdSpbv59XxU02zcwr00hHBEn4x7GGfWkACirVBRL8YmR8nOZrnqVoT
         Z0TiISM0tkFFNE3m0HTul7nGVLhwoLYAJjcFjPfJH4MgrAZAx0QUf5pPrGMnhDmAcQ5d
         JhpiXR++DPBC/v6Vgu2C4gNLbQ8yKHFTV8omz9KLHnrHHkyxx81g4G3Lf+G8gNX4rJBa
         My6P8UON0d8nBoZK1Sd8eDVJqRR3ZH8IXdrjhx6VKV0kl16jiyhpXpkaNlY0ULeTaRqA
         YT4w==
X-Gm-Message-State: APjAAAV1T2uoS9f6yyPeiQ1gzUW3uAmK7uT95/bIP/VT1nF9sHLFRmfa
        lk4tOmFnsj4dHhc67pru6b6VFiXeMzo=
X-Google-Smtp-Source: APXvYqxuAh73gMzDA5ve+GjMlHwoUUFt2aWSZVsgjPaCCrheyN4lvZVsiFhn1qUlK/OCXSloXVOQNg==
X-Received: by 2002:a62:ce41:: with SMTP id y62mr30350806pfg.34.1574622443847;
        Sun, 24 Nov 2019 11:07:23 -0800 (PST)
Received: from majic.sklembedded.com (c-73-202-231-77.hsd1.ca.comcast.net. [73.202.231.77])
        by smtp.googlemail.com with ESMTPSA id r20sm5367801pgo.74.2019.11.24.11.07.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 24 Nov 2019 11:07:23 -0800 (PST)
From:   Steve Longerbeam <slongerbeam@gmail.com>
To:     linux-media@vger.kernel.org
Cc:     Steve Longerbeam <slongerbeam@gmail.com>
Subject: [PATCH v2 11/23] media: stm32-dcmi: Fix fwnode media link creation
Date:   Sun, 24 Nov 2019 11:06:51 -0800
Message-Id: <20191124190703.12138-12-slongerbeam@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20191124190703.12138-1-slongerbeam@gmail.com>
References: <20191124190703.12138-1-slongerbeam@gmail.com>
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

dcmi_graph_notify_bound() passes the bound subdev's sd->fwnode to
media_entity_get_fwnode_pad(). This is likely not an endpoint
fwnode as required by media_entity_get_fwnode_pad(), for most
subdevices it is the port parent of endpoint fwnode(s). This has only
worked before because no entities have implemented the .get_fwnode_pad()
op yet, and the default behavior of media_entity_get_fwnode_pad()
was to ignore the passed fwnode and return the first pad that matches
the given direction flags.

Fix this by replacing the calls to media_entity_get_fwnode_pad() and
media_create_pad_link() with a call to media_create_fwnode_pad_links().

Fixes: f4378baf07a2 ("media: stm32-dcmi: add support of several sub-devices")
Signed-off-by: Steve Longerbeam <slongerbeam@gmail.com>
---
 drivers/media/platform/stm32/stm32-dcmi.c | 15 ++++++---------
 1 file changed, 6 insertions(+), 9 deletions(-)

diff --git a/drivers/media/platform/stm32/stm32-dcmi.c b/drivers/media/platform/stm32/stm32-dcmi.c
index 9392e3409fba..bfb7794c43a1 100644
--- a/drivers/media/platform/stm32/stm32-dcmi.c
+++ b/drivers/media/platform/stm32/stm32-dcmi.c
@@ -1743,7 +1743,6 @@ static int dcmi_graph_notify_bound(struct v4l2_async_notifier *notifier,
 {
 	struct stm32_dcmi *dcmi = notifier_to_dcmi(notifier);
 	unsigned int ret;
-	int src_pad;
 
 	dev_dbg(dcmi->dev, "Subdev \"%s\" bound\n", subdev->name);
 
@@ -1751,14 +1750,12 @@ static int dcmi_graph_notify_bound(struct v4l2_async_notifier *notifier,
 	 * Link this sub-device to DCMI, it could be
 	 * a parallel camera sensor or a bridge
 	 */
-	src_pad = media_entity_get_fwnode_pad(&subdev->entity,
-					      subdev->fwnode,
-					      MEDIA_PAD_FL_SOURCE);
-
-	ret = media_create_pad_link(&subdev->entity, src_pad,
-				    &dcmi->vdev->entity, 0,
-				    MEDIA_LNK_FL_IMMUTABLE |
-				    MEDIA_LNK_FL_ENABLED);
+	ret = media_create_fwnode_pad_links(&dcmi->vdev->entity.pads[0],
+					    dev_fwnode(dcmi->dev),
+					    &subdev->entity,
+					    dev_fwnode(subdev->dev),
+					    MEDIA_LNK_FL_IMMUTABLE |
+					    MEDIA_LNK_FL_ENABLED);
 	if (ret)
 		dev_err(dcmi->dev, "Failed to create media pad link with subdev \"%s\"\n",
 			subdev->name);
-- 
2.17.1

