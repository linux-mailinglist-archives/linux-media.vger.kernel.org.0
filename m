Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 7E17B1C1B59
	for <lists+linux-media@lfdr.de>; Fri,  1 May 2020 19:16:11 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729046AbgEARQG (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 1 May 2020 13:16:06 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58020 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-FAIL-OK-FAIL)
        by vger.kernel.org with ESMTP id S1728495AbgEARQF (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 1 May 2020 13:16:05 -0400
Received: from mail-pj1-x1043.google.com (mail-pj1-x1043.google.com [IPv6:2607:f8b0:4864:20::1043])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5CC61C061A0C
        for <linux-media@vger.kernel.org>; Fri,  1 May 2020 10:16:04 -0700 (PDT)
Received: by mail-pj1-x1043.google.com with SMTP id hi11so143743pjb.3
        for <linux-media@vger.kernel.org>; Fri, 01 May 2020 10:16:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=9mTYcYwO3j5DgB6hEjXQEWO63m/OWQAU74YbBUG9mak=;
        b=cMYNJxm6hkL/YRxGLK7PHDXEtSyeFk/U/hbGZY9MbKvvpVZ4xziBSPFdr0hyMWkAa/
         p4nlEKAxDbdHURFWcGl7Olyf25mSbtDxJwxVTqdGyCFsWJDUK+jtZxQgW77i9Cm5bKtc
         U5OFij8Zt2t8jlqFyQ8joNiwKUPyEYqb5JxvGWdGiVQSQ52a2yPr3aW2v7qpCOg7WiJI
         j4BCV0Q6TZTJcRWJutfa/TabWaviK1Efst6Tmg8BeXCErC8Wg82xRB8BboY/lG920/95
         oxoMA+yfYXbzjh8vaiJuAItMpXKGvE+rblbWyqXygdpyfNIQFbaCbuE6TrYAGqY7VwD5
         L++Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references;
        bh=9mTYcYwO3j5DgB6hEjXQEWO63m/OWQAU74YbBUG9mak=;
        b=qjxj6hQ1rhK2/3XIYrhXDu5iuKM577lnhu4UyF9AWMR2KBkVigy61nb54/KFs4IQth
         v6vpTgvzUft/RZvXcpA9xeX4sUlRVIqGlaXlJriZoR8kWINFSkDnu6p6tcfCHsrK5v6z
         QMmZrUvAjxvmrsnBz12Uj4C6BKt1MaHZyIxfw6KBRKWPEGy/0h3Yl81097CTC5GnpDp2
         1E71+kAHiZH3933NS5nQfmCiRySqDFxTUr4/86uTsolwH9dPEKOnVUq+VrsnaRBTi0oI
         8FZATNHa8U7UasrCyxrJdMwIUwJ4lIkSpeU7+tsjJviIiGRInCR7+1qOdYNb9m7AkSE0
         3Bfg==
X-Gm-Message-State: AGi0PuZjZZh2OvzKBIbdjzPV9wdk+13AK3gulRcQURHmFFPx0N+EbHtv
        FlEvKJnSRmIBccFQsn++EYeCymL8
X-Google-Smtp-Source: APiQypK95o/GFLBWMNScioewRPXJbYTOz4ifDeGbIl3VGcz4Tx8YBYXqliHYOfriwlMbU0wLQ/qR8g==
X-Received: by 2002:a17:902:9682:: with SMTP id n2mr5458335plp.44.1588353363625;
        Fri, 01 May 2020 10:16:03 -0700 (PDT)
Received: from mappy.hsd1.ca.comcast.net (c-107-3-184-99.hsd1.ca.comcast.net. [107.3.184.99])
        by smtp.gmail.com with ESMTPSA id g14sm2733966pfh.49.2020.05.01.10.16.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 01 May 2020 10:16:02 -0700 (PDT)
From:   Steve Longerbeam <slongerbeam@gmail.com>
To:     linux-media@vger.kernel.org
Cc:     Sakari Ailus <sakari.ailus@linux.intel.com>,
        Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
        Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        Rui Miguel Silva <rmfrfs@gmail.com>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        Steve Longerbeam <slongerbeam@gmail.com>
Subject: [PATCH v6 01/22] media: entity: Pass entity to get_fwnode_pad operation
Date:   Fri,  1 May 2020 10:15:35 -0700
Message-Id: <20200501171556.14731-2-slongerbeam@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200501171556.14731-1-slongerbeam@gmail.com>
References: <20200501171556.14731-1-slongerbeam@gmail.com>
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

