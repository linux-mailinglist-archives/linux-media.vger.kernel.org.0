Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id ED1235537E6
	for <lists+linux-media@lfdr.de>; Tue, 21 Jun 2022 18:35:12 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1352857AbiFUQfG (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 21 Jun 2022 12:35:06 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50094 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1351517AbiFUQfE (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 21 Jun 2022 12:35:04 -0400
Received: from mail-wm1-x332.google.com (mail-wm1-x332.google.com [IPv6:2a00:1450:4864:20::332])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 42EC22A255
        for <linux-media@vger.kernel.org>; Tue, 21 Jun 2022 09:35:03 -0700 (PDT)
Received: by mail-wm1-x332.google.com with SMTP id h14-20020a1ccc0e000000b0039eff745c53so3420396wmb.5
        for <linux-media@vger.kernel.org>; Tue, 21 Jun 2022 09:35:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=ikPqVfIj+7XxQ7IV8Dt/cvK1XPLZfzxNSdqUyqBY9Fk=;
        b=ABMIFd19+fr+xk5NR+jK6boP7cRv+yIxt2XFrr3yJrDCl2wRWeA2LbLSgQgCsu4TMr
         tJshStCPRR+56713bcVZvdJ3H+uWma+Ohr0CELBgRuW9fk+roLy+Rsy5x1GnFbplYLAC
         7F03Xd4vufSBsa8trgp9ZJUcpzJAIny+pfLkzszrmWQMuIc1Qn/MbQyKgS7Xhar4G2hz
         AvIL3z6tUZexYtjZooq+QqAvbxi9JnH1HnozFuG7elshyJ9VNAHw6ZjDujOYs9hqrbuD
         hARNK2VbnrQcXN2F3UKIiqTtEVCxk9D5w6FcQG9jNaJypJ/q8jHW4DVv7mc1/+liChLb
         ONPw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=ikPqVfIj+7XxQ7IV8Dt/cvK1XPLZfzxNSdqUyqBY9Fk=;
        b=5WetpysG3BDySG1WP2e0l+4XKSk832hXd7t5vTawvVAWnupMlueCJ482/SS7cuZ8pu
         XSTTyeAYXeekHvcwqXqWz1cqUsHVVygfrF2LsKJ9RHzER7jR9YJF+Ael2XEIn10018R+
         VB50MFTwRKFNRr2Ow/bqMObyzNXGVYZ+fzTOqXtLz4ePB1F4X4Kevlc0bVXYFesvo12G
         C2kScOpP0I/Mkbh/yPfGu8B+DxBMd2MU9nt00DGCveQURFZ0aM6GxcR6Zg6dNiAU6vqR
         AnuE9wM7Hh4lGPBJC4wOf23xwh04kCkyBVkRqz54vbZ6euTdJ8iNr0/Cvv64YInGyX/F
         S+qw==
X-Gm-Message-State: AOAM531XVt4KJLweWDI/Uf8SRrTlUQ20y2BbULGOWyus5CvVjqdFg68X
        k4j6nl5HgDO0JHEj5jvF8SHUOfJfnFE=
X-Google-Smtp-Source: ABdhPJzPKuTJjt/5g+USZb/25f/igzUgBs3+d6RsPBUHKqZPk6cXkUtw9a2LeAenQI+sRGYFPo9B8w==
X-Received: by 2002:a05:600c:1ca5:b0:39b:a66b:7805 with SMTP id k37-20020a05600c1ca500b0039ba66b7805mr40298975wms.87.1655829301792;
        Tue, 21 Jun 2022 09:35:01 -0700 (PDT)
Received: from localhost.localdomain (cpc141996-chfd3-2-0-cust928.12-3.cable.virginm.net. [86.13.91.161])
        by smtp.gmail.com with ESMTPSA id v184-20020a1cacc1000000b0039c454067ddsm18649887wme.15.2022.06.21.09.35.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 21 Jun 2022 09:35:01 -0700 (PDT)
From:   Daniel Scally <djrscally@gmail.com>
To:     linux-media@vger.kernel.org
Cc:     sakari.ailus@linux.intel.com, laurent.pinchart@ideasonboard.com,
        paul.elder@ideasonboard.com
Subject: [PATCH 1/2] media: media-entity.h: Add iterator for entity data links
Date:   Tue, 21 Jun 2022 17:34:56 +0100
Message-Id: <20220621163457.766496-2-djrscally@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220621163457.766496-1-djrscally@gmail.com>
References: <20220621163457.766496-1-djrscally@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,
        RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Iterating over the links for an entity is a somewhat common need
through the media subsystem, but generally the assumption is that
they will all be data links. To meet that assumption add a new macro
that iterates through an entity's links and skips non-data links.

Signed-off-by: Daniel Scally <djrscally@gmail.com>
---
 include/media/media-entity.h | 26 ++++++++++++++++++++++++++
 1 file changed, 26 insertions(+)

diff --git a/include/media/media-entity.h b/include/media/media-entity.h
index a9a1c0ec5d1c..b13f67f33508 100644
--- a/include/media/media-entity.h
+++ b/include/media/media-entity.h
@@ -550,6 +550,32 @@ static inline bool media_entity_enum_intersects(
 				 min(ent_enum1->idx_max, ent_enum2->idx_max));
 }
 
+static inline struct media_link *
+__media_entity_next_data_link(struct media_entity *entity,
+			      struct media_link *pos)
+{
+	if (!pos) {
+		list_for_each_entry(pos, &entity->links, list)
+			if ((pos->flags & MEDIA_LNK_FL_LINK_TYPE) ==
+			    MEDIA_LNK_FL_DATA_LINK)
+				return pos;
+
+		return NULL;
+	}
+
+	list_for_each_entry_continue(pos, &entity->links, list)
+		if ((pos->flags & MEDIA_LNK_FL_LINK_TYPE) ==
+		    MEDIA_LNK_FL_DATA_LINK)
+			return pos;
+
+	return NULL;
+}
+
+#define for_each_media_entity_data_link(entity, pos)		\
+	for (pos = __media_entity_next_data_link(entity, NULL);	\
+	     pos;						\
+	     pos = __media_entity_next_data_link(entity, pos))
+
 /**
  * gobj_to_entity - returns the struct &media_entity pointer from the
  *	@gobj contained on it.
-- 
2.25.1

