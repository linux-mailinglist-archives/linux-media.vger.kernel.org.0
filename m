Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id A84DA827EF
	for <lists+linux-media@lfdr.de>; Tue,  6 Aug 2019 01:35:17 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731058AbfHEXfQ (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 5 Aug 2019 19:35:16 -0400
Received: from mail-pf1-f195.google.com ([209.85.210.195]:34406 "EHLO
        mail-pf1-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728483AbfHEXfO (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Mon, 5 Aug 2019 19:35:14 -0400
Received: by mail-pf1-f195.google.com with SMTP id b13so40420175pfo.1;
        Mon, 05 Aug 2019 16:35:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=u/PbVO0GF+3G1LmQDJT1XFH8AmJHxoqEkGwCBY/zSdU=;
        b=Rmd3ZzYTRxOqchGIwYWUUpvkDRr5s2EsB6qEHX67RjuuYAkgUxfHqcpfewJ5S5O4eQ
         k8DQmrLg75em+CJxBjHeBnEeALQ5SigD8WnXOQLEPs//SPHJw5zl76YW7Fl4K7L51ozW
         3l4On5GCQL+29WIbp9xAsazY3623XLv/FjDk+dCHNz1vDewNvawXYzg2cZptdCMhJqwd
         yeOec5NwL44JOspgc8abBqdBwLYIFd+xlv86dmjRUv4eUOzCQfiBzI5jPsKkPbbNRG+W
         o1DPw3xYd9+iPnyLnHhJmlOa01gNx2Vs4CoeFGyNlf36x8qz0EbATkdgj+B28034OWJ8
         wyCA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references;
        bh=u/PbVO0GF+3G1LmQDJT1XFH8AmJHxoqEkGwCBY/zSdU=;
        b=ENI+HzFyvCJArc9TJw3EMspfNdbLiLf6uObnMnYxOGskSODjEjy3VYaDE25VRPauMp
         Nw/h2OgFWmdBXwh/ukQ9nKqHUZ4aC8Af9TDxS1s5Kpc6wi5GbAk+ODvYcszcMwFmDaOr
         lP5ZpGPYQbBCURucdSr0TgJpaJxjT6g0h3ehaUJQZvSSuRmTJUTUenujvI1l9iJ+wYWe
         K/KzMZoi3UBue4ipihjWMZL3SFhXY+Xag+JMBPntEhv3L1R5hfX7A2/+Lnq7MWBvr+Oo
         5kGj2+IPRTq7VygHk/j0YmjlQtz/Krd90Ue+eF0UyIrVd+OihbZnK+OLEX7KMwU0XNm0
         hOWg==
X-Gm-Message-State: APjAAAXzBAhn5GD5XVkhmREY3EEGiGcu0q20STKMNgzfE8Cvt2ipO4TY
        /SH0VNSBnPdCnoW6uvK67dU+pkER
X-Google-Smtp-Source: APXvYqx+LrojXALlauo335nICJL2fXUDtyIcilbnqjR4ImFHiwROCHxErqT525lwBXqgrgQe0UWy6g==
X-Received: by 2002:a62:7a8a:: with SMTP id v132mr509377pfc.103.1565048113505;
        Mon, 05 Aug 2019 16:35:13 -0700 (PDT)
Received: from majic.sklembedded.com (c-73-202-231-77.hsd1.ca.comcast.net. [73.202.231.77])
        by smtp.googlemail.com with ESMTPSA id 30sm31296349pjk.17.2019.08.05.16.35.12
        (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
        Mon, 05 Aug 2019 16:35:12 -0700 (PDT)
From:   Steve Longerbeam <slongerbeam@gmail.com>
To:     linux-media@vger.kernel.org
Cc:     Steve Longerbeam <slongerbeam@gmail.com>,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        linux-kernel@vger.kernel.org (open list)
Subject: [PATCH 02/22] media: entity: Modify default behavior of media_entity_get_fwnode_pad
Date:   Mon,  5 Aug 2019 16:34:45 -0700
Message-Id: <20190805233505.21167-3-slongerbeam@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20190805233505.21167-1-slongerbeam@gmail.com>
References: <20190805233505.21167-1-slongerbeam@gmail.com>
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

Add some comments to the @get_fwnode_pad operation to make it more clear
under what conditions entities must implement the operation.

Signed-off-by: Steve Longerbeam <slongerbeam@gmail.com>
---
 drivers/media/mc/mc-entity.c | 25 ++++++++++++++++++++-----
 include/media/media-entity.h | 21 +++++++++++++++------
 2 files changed, 35 insertions(+), 11 deletions(-)

diff --git a/drivers/media/mc/mc-entity.c b/drivers/media/mc/mc-entity.c
index c333320f790a..47a39d9383d8 100644
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
index cde80ad029b7..ed00adb4313b 100644
--- a/include/media/media-entity.h
+++ b/include/media/media-entity.h
@@ -199,6 +199,12 @@ struct media_pad {
  * @get_fwnode_pad:	Return the pad number based on a fwnode endpoint or
  *			a negative value on error. This operation can be used
  *			to map a fwnode to a media pad number. Optional.
+ *			Entities do not need to implement this operation
+ *			unless two conditions are met:
+ *			- the entity has more than one sink and/or source
+ *			  pad, _and_
+ *			- the entity does not implement a 1:1 mapping of
+ *			  fwnode port numbers to pad indexes.
  * @link_setup:		Notify the entity of link changes. The operation can
  *			return an error, in which case link setup will be
  *			cancelled. Optional.
@@ -858,21 +864,24 @@ struct media_link *media_entity_find_link(struct media_pad *source,
 struct media_pad *media_entity_remote_pad(const struct media_pad *pad);
 
 /**
- * media_entity_get_fwnode_pad - Get pad number from fwnode
+ * media_entity_get_fwnode_pad - Get pad number from an endpoint fwnode
  *
  * @entity: The entity
- * @fwnode: Pointer to the fwnode_handle which should be used to find the pad
+ * @fwnode: Pointer to the endpoint fwnode_handle which should be used to
+ *          find the pad
  * @direction_flags: Expected direction of the pad, as defined in
  *		     :ref:`include/uapi/linux/media.h <media_header>`
  *		     (seek for ``MEDIA_PAD_FL_*``)
  *
  * This function can be used to resolve the media pad number from
- * a fwnode. This is useful for devices which use more complex
- * mappings of media pads.
+ * an endpoint fwnode. This is useful for devices which use more
+ * complex mappings of media pads.
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

