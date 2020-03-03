Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 2EB9C178694
	for <lists+linux-media@lfdr.de>; Wed,  4 Mar 2020 00:43:45 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728367AbgCCXnJ (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 3 Mar 2020 18:43:09 -0500
Received: from mail-pj1-f65.google.com ([209.85.216.65]:34422 "EHLO
        mail-pj1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727429AbgCCXnJ (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Tue, 3 Mar 2020 18:43:09 -0500
Received: by mail-pj1-f65.google.com with SMTP id f2so1741949pjq.1
        for <linux-media@vger.kernel.org>; Tue, 03 Mar 2020 15:43:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=WldNcB0ZUA0C59QCiXBTJolDLh/hIPr21BH76I/kQ7w=;
        b=rK+ilurYTS4QXIMl2Auhh3YRLUyZuHvy2RJp4hDUJ7tFNlr7rVcvnPY2M5VTw3oFlI
         m+glKgc4RNh1xMq+4Au06SSInC7Azs/qparoYonPaqmgnEMzcAiygKkKwcnWCRYtHSH7
         UFu6y3jifftx1IhrsBH0ysmIyf0jUlhe4ii3JWxxwRe1KI+dF5yMecn9QdWLmRK8dVW9
         bT2uv0PyCy61rmlZ96ecnH+xPCruJpXKJI5WC22TqY3LX7r81AEY8nWt7gX5LbPWFRWP
         KPsnpfVQqBsWz5X+zu1hNPpjBcyUrWSC08bQtAIHkcdJHWr98F38BRXN51MJ/8V30W2h
         8dQg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references;
        bh=WldNcB0ZUA0C59QCiXBTJolDLh/hIPr21BH76I/kQ7w=;
        b=cdDpWj4rOb8SIVm1Agq346VXzDxKeknto0hTw/KZIpxVev5IQJtXjCjCchWbyxDP7s
         TrBwpI8ioGmHJC8zmobiFryvN4muhMPwui/Zg/JRoWbr2n777sJh8bB2cHBdlyuX+1I5
         shdbFl2FPz8eQlTCiiL50RexMCAy+Z5OPE3pE2HthACUoZrBhIxG3Y3Il57HG7RxEwHU
         A8BSh0fFD3mjcWRlVYA9h+NTCL4XcHpzqwG9Vrpr4uZeRm0WvwV0R1l9XFDh3PNmR0tl
         ZL4pS5GQALNy7XmXKNkzsXVKz4cWjHHdJjonom8+rMjEt0ImL/F66ba3tM1Hb5RrvXOg
         YPUA==
X-Gm-Message-State: ANhLgQ3wcFXiWYLGq9z1FOLdxjNQeWSfgcLkolevYk5SaVKw7nHeuvI4
        WiyVOf5LrX7W2m34R0oTy3NVWLMtV/A=
X-Google-Smtp-Source: ADFU+vsnhd0rxsOU4JcKZRKdtpxxMNk6q8qNC6NWUKfhvmo8KqSKiQvbs3PpJdaiQRHJn0Kjiw2+hQ==
X-Received: by 2002:a17:90a:d103:: with SMTP id l3mr17666pju.91.1583278988125;
        Tue, 03 Mar 2020 15:43:08 -0800 (PST)
Received: from mappy.sklembedded.com ([2605:e000:d445:6a00:8145:3904:f092:dd35])
        by smtp.gmail.com with ESMTPSA id q66sm23540009pgq.50.2020.03.03.15.43.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 03 Mar 2020 15:43:07 -0800 (PST)
From:   Steve Longerbeam <slongerbeam@gmail.com>
To:     linux-media@vger.kernel.org
Cc:     Sakari Ailus <sakari.ailus@linux.intel.com>,
        Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
        Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        Rui Miguel Silva <rmfrfs@gmail.com>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        Steve Longerbeam <slongerbeam@gmail.com>
Subject: [PATCH v4 01/17] media: entity: Pass entity to get_fwnode_pad operation
Date:   Tue,  3 Mar 2020 15:42:40 -0800
Message-Id: <20200303234256.8928-2-slongerbeam@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200303234256.8928-1-slongerbeam@gmail.com>
References: <20200303234256.8928-1-slongerbeam@gmail.com>
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

