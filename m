Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 58E1D8282D
	for <lists+linux-media@lfdr.de>; Tue,  6 Aug 2019 01:36:57 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731126AbfHEXgt (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 5 Aug 2019 19:36:49 -0400
Received: from mail-pg1-f193.google.com ([209.85.215.193]:35581 "EHLO
        mail-pg1-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1731057AbfHEXfP (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Mon, 5 Aug 2019 19:35:15 -0400
Received: by mail-pg1-f193.google.com with SMTP id n4so5243000pgv.2;
        Mon, 05 Aug 2019 16:35:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=3hiXeQQV1KrdCEAIpSQAk9Ltt3Glhe3/FQmcNgwcF6I=;
        b=WK97h2Gxi7lfr4FpaCZdEE6yb8tmSN60vE5Ahq7PYXjtBL+BVy/eniGtFtqRVhsrEw
         JeB2t/F2D/kZBGLZlFw9LGtgtRGcAgsSrgYs6GFbxr6jD+AJ5RNSeyki1JGL8qok0aZN
         AqJbeluAc086VbxCIzYAW6PoQOwdxGB5pqkbtNEfryP8R2feACWJaZIEQwivEY0vu0Oy
         FiM84V4Zvsb3hY/+Arn06VLPRv5pEbnFPwAmUdEClTdIf6XoygSZ1AT6uhHmufCnFl4u
         IaA7TldEVoa80dwl5ThE0gLdtwdQtrA2FPZ99dRTQ6ztgrcOPx3DeEt7T4u/xCiiHr+n
         J6Nw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references;
        bh=3hiXeQQV1KrdCEAIpSQAk9Ltt3Glhe3/FQmcNgwcF6I=;
        b=a0iadvFMRQptk7X83wUVTDmSJOpYLby2CG/8NDOGZy2NBjwW3pgVI4jf0y2DhCwClr
         SXe+WlvY+M602+vS/tOXnQZdFB1MYrQ6Mw2y8OXlxsFzSvN1pvnag5yv3f8FJ6JZr9V3
         o0skVlT51hoyJdYz2sKqcVGGVXeKptALlf9tznYhVTE+Sb+GLs/WWENhme9Gpg4DezuH
         r5E/huu9nti/B1QHjcbD7aUgPeQGyYyUOEbptENMKjennC7Sr7FVOXKBe8VfKUH7sXiO
         nHQdO9MMyIe4IT4bLZYLsUm0nWqCSbbYCLsuvx/Qh0PfWxHuEoQEynVF45dWw4bhL2Qi
         d35g==
X-Gm-Message-State: APjAAAW0jG2dV3wPVbr52zeHxDqRo7EGTK0iOOdwnOOI7qhpRuKrcfyA
        B6iQDcAWGua7lF/9+5CAgQdXxQRY
X-Google-Smtp-Source: APXvYqxKVm5fkj8NRo91yo6fTIS54zqYPfOuVt6pelKsqlZ5bMNtwElDmJJ7V6YR95YmOzs/98BxZw==
X-Received: by 2002:aa7:8f2c:: with SMTP id y12mr588868pfr.38.1565048114461;
        Mon, 05 Aug 2019 16:35:14 -0700 (PDT)
Received: from majic.sklembedded.com (c-73-202-231-77.hsd1.ca.comcast.net. [73.202.231.77])
        by smtp.googlemail.com with ESMTPSA id 30sm31296349pjk.17.2019.08.05.16.35.13
        (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
        Mon, 05 Aug 2019 16:35:14 -0700 (PDT)
From:   Steve Longerbeam <slongerbeam@gmail.com>
To:     linux-media@vger.kernel.org
Cc:     Steve Longerbeam <slongerbeam@gmail.com>,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        linux-kernel@vger.kernel.org (open list)
Subject: [PATCH 03/22] media: entity: Convert media_entity_get_fwnode_pad() args to const
Date:   Mon,  5 Aug 2019 16:34:46 -0700
Message-Id: <20190805233505.21167-4-slongerbeam@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20190805233505.21167-1-slongerbeam@gmail.com>
References: <20190805233505.21167-1-slongerbeam@gmail.com>
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

The function media_entity_get_fwnode_pad() can be passed the
const local_fwnode member from a struct fwnode_endpoint, so
the fwnode argument should be a const pointer. Change the
direction_flags argument to const in the process.

Signed-off-by: Steve Longerbeam <slongerbeam@gmail.com>
---
 drivers/media/mc/mc-entity.c | 4 ++--
 include/media/media-entity.h | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/drivers/media/mc/mc-entity.c b/drivers/media/mc/mc-entity.c
index 47a39d9383d8..e9e090244fd4 100644
--- a/drivers/media/mc/mc-entity.c
+++ b/drivers/media/mc/mc-entity.c
@@ -366,8 +366,8 @@ struct media_entity *media_graph_walk_next(struct media_graph *graph)
 EXPORT_SYMBOL_GPL(media_graph_walk_next);
 
 int media_entity_get_fwnode_pad(struct media_entity *entity,
-				struct fwnode_handle *fwnode,
-				unsigned long direction_flags)
+				const struct fwnode_handle *fwnode,
+				const unsigned long direction_flags)
 {
 	struct fwnode_endpoint endpoint;
 	int ret;
diff --git a/include/media/media-entity.h b/include/media/media-entity.h
index ed00adb4313b..de7fc3676b5a 100644
--- a/include/media/media-entity.h
+++ b/include/media/media-entity.h
@@ -886,8 +886,8 @@ struct media_pad *media_entity_remote_pad(const struct media_pad *pad);
  * Return: returns the pad number on success or a negative error code.
  */
 int media_entity_get_fwnode_pad(struct media_entity *entity,
-				struct fwnode_handle *fwnode,
-				unsigned long direction_flags);
+				const struct fwnode_handle *fwnode,
+				const unsigned long direction_flags);
 
 /**
  * media_graph_walk_init - Allocate resources used by graph walk.
-- 
2.17.1

