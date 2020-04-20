Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 2F6F21AFF3D
	for <lists+linux-media@lfdr.de>; Mon, 20 Apr 2020 02:39:42 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726048AbgDTAjl (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sun, 19 Apr 2020 20:39:41 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34282 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-FAIL-OK-FAIL)
        by vger.kernel.org with ESMTP id S1725949AbgDTAjk (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Sun, 19 Apr 2020 20:39:40 -0400
Received: from mail-pj1-x1043.google.com (mail-pj1-x1043.google.com [IPv6:2607:f8b0:4864:20::1043])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 93B34C061A0C
        for <linux-media@vger.kernel.org>; Sun, 19 Apr 2020 17:39:40 -0700 (PDT)
Received: by mail-pj1-x1043.google.com with SMTP id ng8so3798918pjb.2
        for <linux-media@vger.kernel.org>; Sun, 19 Apr 2020 17:39:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=YiTS0YtZ80oRzEOF+lWi0r9Wu5t+ZyNnNhcpDAc5pFw=;
        b=bpGJkdmcBCBJiiy9FlPPKhXMot1yhoX0Y6jqP7sk7bjoXEu6xWlBy3G/wVU2QRQPVD
         2NbxSeea1p8KsvjsNxVN9pfn9j82IzxVgXIaQJ2gGmNnmyW4CCT9G12xmA08VXgqgIX7
         5w10H2nY3/59MP476xJ3hvu9mNCQr3P6ZUy/F66vs+zsew4YtvPHSIIYJH1yubn2AgR3
         O9neKPAY529+W2XC7YpYTuYpCWqPv2b6h6XVsy2MGwyljg74w0EBjb6d7dF38qICaMWH
         2Fxf681BdSvQAy41xvIfUptJSjdhmTowrEhMSpCtNAfY8OIGDxA8cBpfLB8rAjl3aI+m
         ZdeA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references;
        bh=YiTS0YtZ80oRzEOF+lWi0r9Wu5t+ZyNnNhcpDAc5pFw=;
        b=gpayGqNk0J/inFTAszQ9Bxdq+1tK8fJbQV8kheZvZstnyXJwxbJpPFcIRH1+YuS3/i
         iMtBwXDWx5oX+8AlSBLGmqz1OpQXV64jnXt0m/T5C7+kSbDwUM905mm1UM7n5tOYESQD
         2eLX328miSY2EHoBmkNUoYRSvEngWgQV6Akt6Heaubas+Z82lsttNwNbltXEYWiqA1UH
         0IjJDyaNWwShCaZTf+Z+su7ofIEsP/cLoQM/KNHrHELbd8lM3wOYYsGqEWKgdwnxdU36
         XU9ngcVLhEHjfzNYqffmpUz6o5U/NL1l3YfVmZiSup1yBw4/blPZOw8Yz/ZcUViUZtDb
         5Jiw==
X-Gm-Message-State: AGi0PuZcS7TvNEA7nGSWnmot4FoxZUbreBykxdYdxCbHWvlPwVv5X1/w
        /0rVbfR+YSqMkW4omc69KhglI2QhRAk=
X-Google-Smtp-Source: APiQypLNB9NPOvWdBD7f96HfmHff4sgE4fdp+ww0UX0AZ18dBtBMXw0M1wefu4NcGZr64x0oARqmzw==
X-Received: by 2002:a17:90a:710a:: with SMTP id h10mr18280713pjk.101.1587343179799;
        Sun, 19 Apr 2020 17:39:39 -0700 (PDT)
Received: from mappy.hsd1.ca.comcast.net (c-107-3-184-99.hsd1.ca.comcast.net. [107.3.184.99])
        by smtp.gmail.com with ESMTPSA id f30sm12313701pje.29.2020.04.19.17.39.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 19 Apr 2020 17:39:39 -0700 (PDT)
From:   Steve Longerbeam <slongerbeam@gmail.com>
To:     linux-media@vger.kernel.org
Cc:     Sakari Ailus <sakari.ailus@linux.intel.com>,
        Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
        Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        Rui Miguel Silva <rmfrfs@gmail.com>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        Steve Longerbeam <slongerbeam@gmail.com>
Subject: [PATCH v5 02/23] media: entity: Modify default behavior of media_entity_get_fwnode_pad
Date:   Sun, 19 Apr 2020 17:39:09 -0700
Message-Id: <20200420003930.11463-3-slongerbeam@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200420003930.11463-1-slongerbeam@gmail.com>
References: <20200420003930.11463-1-slongerbeam@gmail.com>
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Modify the default behavior of media_entity_get_fwnode_pad() (when the
entity does not provide the get_fwnode_pad op) to first assume the entity
implements a 1:1 mapping between fwnode port number and media pad index.

If the 1:1 mapping is not valid, e.g. the port number falls outside the
entity's pad index range, or the pad at that port number doesn't match the
given direction_flags, fall-back to the previous behavior that searches
the entity for the first pad that matches the given direction_flags.

The previous default behavior can choose the wrong pad for entities with
multiple sink or source pads. With this change the function will choose
the correct pad index if the entity implements a 1:1 port to pad mapping
at that port.

Signed-off-by: Steve Longerbeam <slongerbeam@gmail.com>
---
 drivers/media/mc/mc-entity.c | 25 ++++++++++++++++++++-----
 include/media/media-entity.h |  6 ++++--
 2 files changed, 24 insertions(+), 7 deletions(-)

diff --git a/drivers/media/mc/mc-entity.c b/drivers/media/mc/mc-entity.c
index 12b45e669bcc..b1e0259a58c5 100644
--- a/drivers/media/mc/mc-entity.c
+++ b/drivers/media/mc/mc-entity.c
@@ -370,22 +370,37 @@ int media_entity_get_fwnode_pad(struct media_entity *entity,
 				unsigned long direction_flags)
 {
 	struct fwnode_endpoint endpoint;
-	unsigned int i;
 	int ret;
 
+	ret = fwnode_graph_parse_endpoint(fwnode, &endpoint);
+	if (ret)
+		return ret;
+
 	if (!entity->ops || !entity->ops->get_fwnode_pad) {
+		unsigned int i;
+
+		/*
+		 * for the default case, first try a 1:1 mapping between
+		 * fwnode port number and pad index.
+		 */
+		ret = endpoint.port;
+		if (ret < entity->num_pads &&
+		    (entity->pads[ret].flags & direction_flags))
+			return ret;
+
+		/*
+		 * if that didn't work search the entity for the first
+		 * pad that matches the @direction_flags.
+		 */
 		for (i = 0; i < entity->num_pads; i++) {
 			if (entity->pads[i].flags & direction_flags)
 				return i;
 		}
 
+		/* else fail */
 		return -ENXIO;
 	}
 
-	ret = fwnode_graph_parse_endpoint(fwnode, &endpoint);
-	if (ret)
-		return ret;
-
 	ret = entity->ops->get_fwnode_pad(entity, &endpoint);
 	if (ret < 0)
 		return ret;
diff --git a/include/media/media-entity.h b/include/media/media-entity.h
index cde80ad029b7..9316eb9f8486 100644
--- a/include/media/media-entity.h
+++ b/include/media/media-entity.h
@@ -871,8 +871,10 @@ struct media_pad *media_entity_remote_pad(const struct media_pad *pad);
  * mappings of media pads.
  *
  * If the entity does not implement the get_fwnode_pad() operation
- * then this function searches the entity for the first pad that
- * matches the @direction_flags.
+ * then this function first assumes the entity implements a 1:1 mapping
+ * between fwnode port number and media pad index. If the 1:1 mapping
+ * is not valid, then the function searches the entity for the first pad
+ * that matches the @direction_flags.
  *
  * Return: returns the pad number on success or a negative error code.
  */
-- 
2.17.1

