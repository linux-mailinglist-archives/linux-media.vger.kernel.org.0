Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 3B790108492
	for <lists+linux-media@lfdr.de>; Sun, 24 Nov 2019 20:07:23 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726926AbfKXTHP (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sun, 24 Nov 2019 14:07:15 -0500
Received: from mail-pj1-f66.google.com ([209.85.216.66]:35158 "EHLO
        mail-pj1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726945AbfKXTHP (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Sun, 24 Nov 2019 14:07:15 -0500
Received: by mail-pj1-f66.google.com with SMTP id s8so5423734pji.2
        for <linux-media@vger.kernel.org>; Sun, 24 Nov 2019 11:07:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=ySxgjAsGLxeO4I//v6isWP1TjOEEKi4r4maQM3cg6UA=;
        b=UV26zfJ2ALmUcqb0SIl7nsVwQaBVtEKaqEOJ7FOZIU1MXOLTEVrmT0+2Lk3r8X1pBD
         EWTZZzSCZQ3dvK3T3L1IwIT83RVcXqFHQPxA8iz1i1ShEoOZforSk3vNNWKcNPbvjoIe
         jQRwQtKa+m+iO0tZawqOfHRA22lhZrGrR54eQiZSHMeD8dnZvGN/UnXjEVVmw/vjq3X/
         a6vQ/5IA+OEpy4f5VDNwdh71t7yliRqL1gJ2hKlh2zIy8XCdC2gkAk35CHPPqV8bm06Z
         WvAeHEZaUeuO+3phumD8ucXsTxf9sK4y3nofbu6fPWVz9U8FRgnPYYQMDJ+amHbva8R7
         Y7WA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references;
        bh=ySxgjAsGLxeO4I//v6isWP1TjOEEKi4r4maQM3cg6UA=;
        b=ma3PwsWVszTIfjQHItsc6q5avJj/dR1McjoIpdgcgGB6JlzeeLanOUUW3sdTC3qB0Q
         1PwgVjdPxuMDQ1t8MpFcCqzzGyXyL1RYYAtapvwU1P47BYqpcD+MtguGP0ooW7QZvbrj
         vz3bNDkgg7t6WZM+RwQTckx1vxSoL3JIgbEprgO4duxb4r43EKHMLAxbgnaDz3PJg2Gy
         tBDuoMrllTYPDXcXjZbNfQcm29EyjvAbhp2rAwi/ieJLNAk/k73GxJQQyFOXnqovBsVb
         tZnwm+SdMQrYZ05CTiDGCLOKwUQEPfc0h0Vdk8/uKARbNZXaAku05lkBaUm8FQb75mR4
         brtQ==
X-Gm-Message-State: APjAAAWl+8XRhrB89DT5P1WVmb4yvVj+HI80iJ9OGKstw5UQAgin0zNT
        BYGFSoij15ln/HLHf0MPun+ZjWhhg6A=
X-Google-Smtp-Source: APXvYqxqkhEEcD+njj1uevTtVo+XaMzb7QjwQVtabdzRp6Xp0sfx2N2Kfa6V6tyukmj8zIen6uhLaw==
X-Received: by 2002:a17:90a:8a12:: with SMTP id w18mr34447493pjn.51.1574622434690;
        Sun, 24 Nov 2019 11:07:14 -0800 (PST)
Received: from majic.sklembedded.com (c-73-202-231-77.hsd1.ca.comcast.net. [73.202.231.77])
        by smtp.googlemail.com with ESMTPSA id r20sm5367801pgo.74.2019.11.24.11.07.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 24 Nov 2019 11:07:14 -0800 (PST)
From:   Steve Longerbeam <slongerbeam@gmail.com>
To:     linux-media@vger.kernel.org
Cc:     Steve Longerbeam <slongerbeam@gmail.com>
Subject: [PATCH v2 01/23] media: entity: Pass entity to get_fwnode_pad operation
Date:   Sun, 24 Nov 2019 11:06:41 -0800
Message-Id: <20191124190703.12138-2-slongerbeam@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20191124190703.12138-1-slongerbeam@gmail.com>
References: <20191124190703.12138-1-slongerbeam@gmail.com>
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

