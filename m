Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id BE3691AFF3C
	for <lists+linux-media@lfdr.de>; Mon, 20 Apr 2020 02:39:40 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725964AbgDTAjj (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sun, 19 Apr 2020 20:39:39 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34280 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-FAIL-OK-FAIL)
        by vger.kernel.org with ESMTP id S1725949AbgDTAjj (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Sun, 19 Apr 2020 20:39:39 -0400
Received: from mail-pl1-x643.google.com (mail-pl1-x643.google.com [IPv6:2607:f8b0:4864:20::643])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 270A2C061A0C
        for <linux-media@vger.kernel.org>; Sun, 19 Apr 2020 17:39:39 -0700 (PDT)
Received: by mail-pl1-x643.google.com with SMTP id f8so3313553plt.2
        for <linux-media@vger.kernel.org>; Sun, 19 Apr 2020 17:39:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=9mTYcYwO3j5DgB6hEjXQEWO63m/OWQAU74YbBUG9mak=;
        b=tsR4oDXgUacwZqH8ce6tJbIyk4fPDr3Iuaob3YZ5Xd7esxfOBrrdpwuOZCKUOwDnYX
         oZTU47IDyNkHpEXL3iiKQCdISERxQGgmByIlT+xZm1bwXJXJbI+zslENFcIl2+vlEoUS
         pA5mRICtNPh4Li3zrW6ib+PkhbI5/XaZe1/Bt73f2bRqLfr5zHC8gqDSwPOar+6HhCUA
         +hTR2AKf24iEngA+q7HEqCQ162jm4PpOG9oQtxgaVC8wXmdYH7fHL4vy4DB0OC0HtCVg
         ZrVm5tMdsg5VNQG2/GrGThNSmFuirBIqFDWZXQHfaz7PP6sDunxtrojlIbwCFZ0PBzQn
         PLDA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references;
        bh=9mTYcYwO3j5DgB6hEjXQEWO63m/OWQAU74YbBUG9mak=;
        b=o6Ywo7wpXUas8p2Vf8Ae98SksJZqKNXpxo49r6C5d6JXVXuELNwz1JcHD+ZFBpqpKC
         VYu34u99oPF3lHMmhRJVvYqYIxo+07LQR1eqY4Z5f8Cxv8p5UbCg4bjj69RimkaENmGC
         iQjpVzkc2sV+ucKiHy3um5QMd6AK7abBYQJxgaVzY4k+gVnmJ8HP/4ax5VYhusDvJ0RV
         pH1obLA4O/v0kfXLN8E4zdyJp15r57PmqDtlL9wg768pLgUqTi6PDH4nTUsOKEkVlN65
         GTD1yA/81yAxu16IvXvJ6EZPoKuuzHeFh/cE3+0UrFuaq6ES/A4HhWrXGAJ15JBCEIvM
         pAsA==
X-Gm-Message-State: AGi0PuYcBuGWYX5Ocj8wtBXiCA/Omlr+4IRboYe1a9OHtux5yNjO8DPs
        uELvhmsdCmwRPpTM0IozGq48UXgzI5o=
X-Google-Smtp-Source: APiQypL2bMKRY7kv+MhFAJqxBKrWQeOKeK/RVkGVn8d1WKgu59WhmbuiejMIz4tQsOXKk9u/5o6M7g==
X-Received: by 2002:a17:90a:f418:: with SMTP id ch24mr18303110pjb.68.1587343178401;
        Sun, 19 Apr 2020 17:39:38 -0700 (PDT)
Received: from mappy.hsd1.ca.comcast.net (c-107-3-184-99.hsd1.ca.comcast.net. [107.3.184.99])
        by smtp.gmail.com with ESMTPSA id f30sm12313701pje.29.2020.04.19.17.39.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 19 Apr 2020 17:39:37 -0700 (PDT)
From:   Steve Longerbeam <slongerbeam@gmail.com>
To:     linux-media@vger.kernel.org
Cc:     Sakari Ailus <sakari.ailus@linux.intel.com>,
        Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
        Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        Rui Miguel Silva <rmfrfs@gmail.com>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        Steve Longerbeam <slongerbeam@gmail.com>
Subject: [PATCH v5 01/23] media: entity: Pass entity to get_fwnode_pad operation
Date:   Sun, 19 Apr 2020 17:39:08 -0700
Message-Id: <20200420003930.11463-2-slongerbeam@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200420003930.11463-1-slongerbeam@gmail.com>
References: <20200420003930.11463-1-slongerbeam@gmail.com>
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Add a missing pointer to the entity in the media_entity operation
get_fwnode_pad. There are no implementers of this op yet, but a future
entity that does so will almost certainly need a reference to itself
to carry out the work.

Fixes: ae45cd5efc120 ("[media] media: entity: Add get_fwnode_pad entity
operation")
Signed-off-by: Steve Longerbeam <slongerbeam@gmail.com>
Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
---
 drivers/media/mc/mc-entity.c | 2 +-
 include/media/media-entity.h | 3 ++-
 2 files changed, 3 insertions(+), 2 deletions(-)

diff --git a/drivers/media/mc/mc-entity.c b/drivers/media/mc/mc-entity.c
index 211279c5fd77..12b45e669bcc 100644
--- a/drivers/media/mc/mc-entity.c
+++ b/drivers/media/mc/mc-entity.c
@@ -386,7 +386,7 @@ int media_entity_get_fwnode_pad(struct media_entity *entity,
 	if (ret)
 		return ret;
 
-	ret = entity->ops->get_fwnode_pad(&endpoint);
+	ret = entity->ops->get_fwnode_pad(entity, &endpoint);
 	if (ret < 0)
 		return ret;
 
diff --git a/include/media/media-entity.h b/include/media/media-entity.h
index 8cb2c504a05c..cde80ad029b7 100644
--- a/include/media/media-entity.h
+++ b/include/media/media-entity.h
@@ -212,7 +212,8 @@ struct media_pad {
  *    mutex held.
  */
 struct media_entity_operations {
-	int (*get_fwnode_pad)(struct fwnode_endpoint *endpoint);
+	int (*get_fwnode_pad)(struct media_entity *entity,
+			      struct fwnode_endpoint *endpoint);
 	int (*link_setup)(struct media_entity *entity,
 			  const struct media_pad *local,
 			  const struct media_pad *remote, u32 flags);
-- 
2.17.1

