Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 23D18108494
	for <lists+linux-media@lfdr.de>; Sun, 24 Nov 2019 20:07:24 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726984AbfKXTHT (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sun, 24 Nov 2019 14:07:19 -0500
Received: from mail-pj1-f67.google.com ([209.85.216.67]:33951 "EHLO
        mail-pj1-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726945AbfKXTHT (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Sun, 24 Nov 2019 14:07:19 -0500
Received: by mail-pj1-f67.google.com with SMTP id bo14so5424006pjb.1
        for <linux-media@vger.kernel.org>; Sun, 24 Nov 2019 11:07:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=3hiXeQQV1KrdCEAIpSQAk9Ltt3Glhe3/FQmcNgwcF6I=;
        b=b5Pv35uAPA3KWbjOJyJPjDWKR9bCSOcdEcu2LUdyg2kY4DTkCcmx8VBTrL25IzUAt1
         lrYFW1kdaDqXv9oMz9aFVrkxTLKMVtik7d9Hk3ZevGMbqUipzz1r2B0tsyh7E7Hb5tFX
         6ut/OcdxHO+XNbNniulHGCmkBbuyq7GsS196UoI+vvxejBQUdh3UtPGdyD2TE/4HGOnM
         H57BxYhYg7VhY2lmLMl+0+KW4cl08Mw2hV3E/oZUag57M4E4FAqJIF1Ush78sxSc62ye
         j0At9msN+Ce1/tEmkws0xM2RWdxLzxi8sj8txw9+zedEMqsD+Gxs3J2eoGFLdV9/Xsti
         au5A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references;
        bh=3hiXeQQV1KrdCEAIpSQAk9Ltt3Glhe3/FQmcNgwcF6I=;
        b=L3mpJ/iNX94Dmu44LKY8JNKmdy7cU6lts34cLbINYCr/8AmIekrofex/z4YSUSs0q6
         B60He2YZSGdcZgKwp1kewdE+cqlcNIMcwh3b9Vtm0KJKeXytVP4Fpbt5hMZlCgThczKG
         Xv0fgkIyUqvlSNTxMLYZ4i6z7tlndiza/4wkzpRp3LW1VRTsnQqcO/AsXRPjw/buVEP9
         fB78ZNtTZEvLRAJiGVUOs0n5SOx9FyXtlWY7ey7VBzOfJAnmllCVJlK1afMOyK1qs9Jm
         5kp0WMevDeqaVQsYLe67gtVO6iruCc9uHaBK1laAfvE4d6G3D4sLKcQC7cIpaUatt44m
         HyXw==
X-Gm-Message-State: APjAAAVFOvUpzcGTyJvt+S7iB1MYR2vezyRSBSSohGaRkdafybPOJdgG
        sm4ued6qQXibGTwO15OeoggmKvOMCW8=
X-Google-Smtp-Source: APXvYqz98JkzqeHSwwF7zLx18tGdqolFzfnfEhMr1hwNU9QwNu9TODkOVaVlFWUUimUPB8eY6jMN/g==
X-Received: by 2002:a17:90b:281:: with SMTP id az1mr34594176pjb.27.1574622436764;
        Sun, 24 Nov 2019 11:07:16 -0800 (PST)
Received: from majic.sklembedded.com (c-73-202-231-77.hsd1.ca.comcast.net. [73.202.231.77])
        by smtp.googlemail.com with ESMTPSA id r20sm5367801pgo.74.2019.11.24.11.07.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 24 Nov 2019 11:07:15 -0800 (PST)
From:   Steve Longerbeam <slongerbeam@gmail.com>
To:     linux-media@vger.kernel.org
Cc:     Steve Longerbeam <slongerbeam@gmail.com>
Subject: [PATCH v2 03/23] media: entity: Convert media_entity_get_fwnode_pad() args to const
Date:   Sun, 24 Nov 2019 11:06:43 -0800
Message-Id: <20191124190703.12138-4-slongerbeam@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20191124190703.12138-1-slongerbeam@gmail.com>
References: <20191124190703.12138-1-slongerbeam@gmail.com>
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

