Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id C7B6B8282E
	for <lists+linux-media@lfdr.de>; Tue,  6 Aug 2019 01:36:57 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731037AbfHEXfN (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 5 Aug 2019 19:35:13 -0400
Received: from mail-pg1-f195.google.com ([209.85.215.195]:45535 "EHLO
        mail-pg1-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728483AbfHEXfN (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Mon, 5 Aug 2019 19:35:13 -0400
Received: by mail-pg1-f195.google.com with SMTP id o13so40498210pgp.12;
        Mon, 05 Aug 2019 16:35:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=fpjseVSUss2LkAdgKt7/i93QGkQFGmCf+/5YmrX1uIQ=;
        b=UEBoLUE6TOnktq0qwecZhcc58krHIy0NrLnA2JejGKdaPwA71LeRZgFPOgmSxAweHr
         IoXl6dWBSi5zvPf3JJfkosVWfC/RgGOSnwomIBoCms6iyd+A5uBNMH0I9ldaECqQqjez
         /TUqbAWemIc6vm8Or2nD481kCJKxUdGe8+4SQHJoveoJw301QfY19jbrvwDIUsWnS8jK
         ddXOpeAWPMODrQoVhaKlRSCJWMcDRwUj3xKXvv08nOLNA7YT2tGN9K0fI0IgOofqVCO7
         rX9TD79OC3MIc2djYfbPQ2UYYM8ugJU4NveAgNpOP19a04uJEo0F4dRmwYdiQac2qiVD
         TWMg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references;
        bh=fpjseVSUss2LkAdgKt7/i93QGkQFGmCf+/5YmrX1uIQ=;
        b=eCpV0nOBBkG2/xIzB2KtLN/gP3EfbBNtnpJoixYmiBZWDdIRt0OCt9NHgDobdsUH6C
         y7jCqqkTwr8AlkH60oCZ1k/ofpz0OVIg4yP3jbbgvDpVd1+VbpTjOO6L423NjpXlr8ze
         3hpctnqERMogKZgjv/PCOlPksY1R07tgaSj9r3hjtpfVwgdW4OnHHMG1WaesqSZrY8hF
         jvAL4XjcLomms0ol+cXgIYuJc6fUEJUNepVjEAn/Xi67rURhD0T+pwbxtwZWaV3ScjVj
         +2qup5Dwmx4I4Tj9FZbcTRuq0uQ/3q1rs7cnRuhD7tbtLSR+rLv00OOr9FABc51wHYRE
         jsXA==
X-Gm-Message-State: APjAAAXO4Ushk9YJ+xtYrjbyWClylPvPyoLbTHxactgPUoV503I9Lv+h
        p1H32+kPgMT0uoaql1f0B9PVMZAT
X-Google-Smtp-Source: APXvYqzYukYrcOoU9GMSBqOK3gJWry7lChLl+XFcob2BVHpiHpWIpjdxmlmyLQONGs8F/7psO3EqJg==
X-Received: by 2002:aa7:93bb:: with SMTP id x27mr587342pff.10.1565048112341;
        Mon, 05 Aug 2019 16:35:12 -0700 (PDT)
Received: from majic.sklembedded.com (c-73-202-231-77.hsd1.ca.comcast.net. [73.202.231.77])
        by smtp.googlemail.com with ESMTPSA id 30sm31296349pjk.17.2019.08.05.16.35.11
        (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
        Mon, 05 Aug 2019 16:35:11 -0700 (PDT)
From:   Steve Longerbeam <slongerbeam@gmail.com>
To:     linux-media@vger.kernel.org
Cc:     Steve Longerbeam <slongerbeam@gmail.com>,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        linux-kernel@vger.kernel.org (open list)
Subject: [PATCH 01/22] media: entity: Pass entity to get_fwnode_pad operation
Date:   Mon,  5 Aug 2019 16:34:44 -0700
Message-Id: <20190805233505.21167-2-slongerbeam@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20190805233505.21167-1-slongerbeam@gmail.com>
References: <20190805233505.21167-1-slongerbeam@gmail.com>
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Add a missing pointer to the entity in the media_entity operation
get_fwnode_pad.

Fixes: ae45cd5efc120 ("[media] media: entity: Add get_fwnode_pad entity
operation")

Signed-off-by: Steve Longerbeam <slongerbeam@gmail.com>
---
 drivers/media/mc/mc-entity.c | 2 +-
 include/media/media-entity.h | 3 ++-
 2 files changed, 3 insertions(+), 2 deletions(-)

diff --git a/drivers/media/mc/mc-entity.c b/drivers/media/mc/mc-entity.c
index 7c429ce98bae..c333320f790a 100644
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

