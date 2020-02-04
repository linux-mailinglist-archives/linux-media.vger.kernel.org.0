Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id EBEAE15235C
	for <lists+linux-media@lfdr.de>; Wed,  5 Feb 2020 00:49:41 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727563AbgBDXth (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 4 Feb 2020 18:49:37 -0500
Received: from mail-pl1-f195.google.com ([209.85.214.195]:41382 "EHLO
        mail-pl1-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727412AbgBDXth (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Tue, 4 Feb 2020 18:49:37 -0500
Received: by mail-pl1-f195.google.com with SMTP id t14so64439plr.8;
        Tue, 04 Feb 2020 15:49:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=qD7p9omT3ZqLHQdscsqkNZErSP6L23JqC4boqGiD0ds=;
        b=EtqHVulXx99URS3Qe05lW8Lufh6T7pcjz/KReLzLTuFZSbtVzZaf2lrMZI4wFiApPl
         bD+ggX05doVz354UPhFih4X+p4n34bjwn6de8Z+BcQm8zWJdRmNnAHRuONj/FUI1tjyL
         iUfNcGHJqDaclN9NFsMaKYb0eyF0vglFqcZmIQYZKSKeO765QpmIAsGkGffo3f+MVPkw
         fWPcI0cUWUGwgu16ALmpk6C0kyYdHaMVZi5Rk/UcqEnlm/XiSDfVskhmaq0Y5tuWEtxM
         w0N9BZodkCGw0bo3dFPXdRk7qnxnnHhU3KPxLZK0/3886wX/eYn+Rx6p2MdkH2bbzQ/c
         hICw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references;
        bh=qD7p9omT3ZqLHQdscsqkNZErSP6L23JqC4boqGiD0ds=;
        b=hhvQfjBUVEQMIAy7aKbroqVktgA0l7GJcQT9DIRoqBkZyEHZ7j8aCR6v4oug6APF7S
         3FqOJOKRwMc3gxL483DtcEzkAPguBM6eoIzF8OOiqMwfbsIkQo4mAqQSpbnr8Qutf5Xz
         JVoviO++BJ8vDMRvFYqr0Uw+sfGtyMssP1oCNFsnUML8mLDba1L9V3Y0QTbDnm9fP7GF
         KRZjDHuJq61TOtKDWFVUe0Ie3lGOrKvlF/sCLoSkpNIlgZjE/+q+5LKtP8SS2/1Qy8/N
         NUY0mSrWM6i3pOlBFL/OZ8VW9sDOpS3Wzxuq69rCKM2GQG4typJEtr0ChiiyJ71K1gAa
         8BRg==
X-Gm-Message-State: APjAAAWZKDQbMHkyg8xpNULVV0CTHwa9yBI5zb9lB6YheCBU7dMCwX/w
        tzm3knx3pD5nXRfZXQNNIXAgw47Q
X-Google-Smtp-Source: APXvYqyBLewVzoOQa5qiRdOx7sM6iJnyGsUH+B0sJ4Kxn/9oyCmHZ7AwNaBh982pcio1KFv+l18nHg==
X-Received: by 2002:a17:902:8688:: with SMTP id g8mr32079519plo.277.1580860176419;
        Tue, 04 Feb 2020 15:49:36 -0800 (PST)
Received: from majic.sklembedded.com (c-73-202-231-77.hsd1.ca.comcast.net. [73.202.231.77])
        by smtp.googlemail.com with ESMTPSA id u2sm24607929pgj.7.2020.02.04.15.49.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 04 Feb 2020 15:49:35 -0800 (PST)
From:   Steve Longerbeam <slongerbeam@gmail.com>
To:     linux-media@vger.kernel.org, Rui Miguel Silva <rmfrfs@gmail.com>,
        Philipp Zabel <p.zabel@pengutronix.de>
Cc:     Steve Longerbeam <slongerbeam@gmail.com>,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        =?UTF-8?q?Niklas=20S=C3=B6derlund?= 
        <niklas.soderlund+renesas@ragnatech.se>,
        Hans Verkuil <hans.verkuil@cisco.com>,
        linux-kernel@vger.kernel.org (open list)
Subject: [PATCH v3 01/17] media: entity: Pass entity to get_fwnode_pad operation
Date:   Tue,  4 Feb 2020 15:49:02 -0800
Message-Id: <20200204234918.20425-2-slongerbeam@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200204234918.20425-1-slongerbeam@gmail.com>
References: <20200204234918.20425-1-slongerbeam@gmail.com>
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

