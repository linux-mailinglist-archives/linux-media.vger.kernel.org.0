Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 5432C160012
	for <lists+linux-media@lfdr.de>; Sat, 15 Feb 2020 20:41:57 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726640AbgBOTls (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sat, 15 Feb 2020 14:41:48 -0500
Received: from mail-pl1-f194.google.com ([209.85.214.194]:43012 "EHLO
        mail-pl1-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726340AbgBOTlr (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Sat, 15 Feb 2020 14:41:47 -0500
Received: by mail-pl1-f194.google.com with SMTP id p11so5129011plq.10;
        Sat, 15 Feb 2020 11:41:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=qD7p9omT3ZqLHQdscsqkNZErSP6L23JqC4boqGiD0ds=;
        b=p5KiWRSowO/6u32QdyYfJ5yyQFaKgUISB2YGGY7oCcluRXj+MNEUd4h9e9b3JsCGll
         NS6XKq9O7lWsE7CECeQLIfHWJt0qYt1AB4+SeDBk9qYX35VfsteWw12J3tUXpCyvujdv
         QIXSZltmC6ana0ehKkrKWrwkL8/VYp115YluWHwHKWjnIHEJAwc7UZlLFRZZBruDuVAg
         1Q0lDNbZvEC4Q3wqTa6qDEDRHi7YnL9ZqgsWfEquUqoOF0lCnP4W8j4QO2QSwx5JNwlY
         4gbfDfc8jjifYlC+wT/na2tnV5kdIe5xDUaYV+1vKWUmd6haYCLVJhMe8c4k4+Dsbx2H
         rsSA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references;
        bh=qD7p9omT3ZqLHQdscsqkNZErSP6L23JqC4boqGiD0ds=;
        b=efohZYsrP3K28qfmHjKsCZXpXrFBhDBAhH64pANKZotfc7fN79TtbPFsUxqUMFY7Qt
         X55Zq0l5Mf+vq+j1umYJ9fqWQpvB8wDQFwNbrkotOvexL2JQVaZkcWY/mBpMcrx0rQQy
         8dyiFG1rQwpdE+W2oEN79wy+5srudcpju7h8HqrY4OKrctiETLlWxiOo/ESxiqwVgHPk
         4dbrCo0jtEU/Et5DQCk8Hc9Cl837XdJUN6xQcGUuJJsrPVVsHMru8UcjMhcyf8kGaYZw
         BHQD7jIZInOXrnXLqEqOe2Iwm+54TDdr7HveY5DwqWl2BpLf76eWq28EtX4QLkYvQwmg
         ga1g==
X-Gm-Message-State: APjAAAXq+Td2P1LcWkbEFdcMJ+hjcSF2uOdFWUBrQLnKWZVnXLP3IdRw
        OQFWFBvIguLHcJmmVjmJAcQVL4xWDk8=
X-Google-Smtp-Source: APXvYqx1UNOFEF981/5DjEL2KCCokmkGTRXof8tt88zvZJE6QH8INHw+Aur0m8x1jRinDEn2qTQLrg==
X-Received: by 2002:a17:90a:b311:: with SMTP id d17mr11239396pjr.17.1581795706570;
        Sat, 15 Feb 2020 11:41:46 -0800 (PST)
Received: from majic.sklembedded.com (c-73-202-231-77.hsd1.ca.comcast.net. [73.202.231.77])
        by smtp.googlemail.com with ESMTPSA id q4sm11802751pfl.175.2020.02.15.11.41.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 15 Feb 2020 11:41:46 -0800 (PST)
From:   Steve Longerbeam <slongerbeam@gmail.com>
To:     linux-media@vger.kernel.org
Cc:     Steve Longerbeam <slongerbeam@gmail.com>,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        =?UTF-8?q?Niklas=20S=C3=B6derlund?= 
        <niklas.soderlund+renesas@ragnatech.se>,
        Hans Verkuil <hans.verkuil@cisco.com>,
        linux-kernel@vger.kernel.org (open list)
Subject: [RESEND PATCH v3 01/17] media: entity: Pass entity to get_fwnode_pad operation
Date:   Sat, 15 Feb 2020 11:41:20 -0800
Message-Id: <20200215194136.10131-2-slongerbeam@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200215194136.10131-1-slongerbeam@gmail.com>
References: <20200215194136.10131-1-slongerbeam@gmail.com>
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

