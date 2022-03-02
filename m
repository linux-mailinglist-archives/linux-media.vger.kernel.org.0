Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 676BD4CB1AF
	for <lists+linux-media@lfdr.de>; Wed,  2 Mar 2022 23:03:28 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S242311AbiCBWED (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 2 Mar 2022 17:04:03 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48074 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S242067AbiCBWEC (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Wed, 2 Mar 2022 17:04:02 -0500
Received: from mail-wr1-x42a.google.com (mail-wr1-x42a.google.com [IPv6:2a00:1450:4864:20::42a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 33B84C992C
        for <linux-media@vger.kernel.org>; Wed,  2 Mar 2022 14:03:18 -0800 (PST)
Received: by mail-wr1-x42a.google.com with SMTP id j17so4969904wrc.0
        for <linux-media@vger.kernel.org>; Wed, 02 Mar 2022 14:03:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=ZZuRb6vJ4xL/T85VnKjF8jjubHhc9DkEkfgVG9uggJ4=;
        b=WR0utUqOYB7ZuyINcK/dNLS0PEbpJCuBuL4jurQW5+C1ApyrN3YJklICb+1aASRiIL
         khiDGY62G/cE+1kZBySmNmwLxCey30zqxuLrX2LpqkQaSYQTE544eFatwTJcBlH1gWWF
         wG8DbfB34kXC+N/y0gYF/4IHjonxbOUTC0uXR+1cgnWM9jhK+uzUb6gHBvTMgWXMGVK1
         393a8bkurpawowYeDTMbRUk9sffEty3wF7WamsIMEg6PGNBDTB5DqrQuUfkyfFm5loZf
         evTQ/uJ+w7mu3MIqAIleu87IURx9z1WpCUy1VHUS3uyy035XNnclUUnoOewulryWoC5w
         SEgw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=ZZuRb6vJ4xL/T85VnKjF8jjubHhc9DkEkfgVG9uggJ4=;
        b=MzGXNjW76AjJ0Qs8QQGl0bPpYVvGyBi+Y/j3ozxO7MI0UfcSPPG7n/f+waDsqEySBJ
         +GvpKpxa9pQYjw1yVfrS2UhQTHjdw8UrwbQeW0MZOJQPETil/lDPiMgOTqmwBxbb6Jlg
         bFKv17jMnX7mmRe2GBLxhTgBMedoHdOmH8/zfZIFCKr4Tk5V4OYuKvdxUnQ/c/kRFH9S
         1ZiCqU2jFCefjJqGm4mvn1OkMIfmIPUgjB7BzLW3KIxymtvx4GLk/PeshwtXGEutFEXc
         8/G2q/RvRdvhxd00d84Z2ShUwcUYvCMBiNg1BJ+qdUKBsvKVenRgkrTmQ1E7P16GrchW
         yipw==
X-Gm-Message-State: AOAM533Dz8t/zyE1odacGv+deJd1GV+8X2O+xvPHS2KsSrqBKkMr8kOj
        h/QK4kVmgZvb0HkWP+ulbq2eNVM5w7AC2g==
X-Google-Smtp-Source: ABdhPJwyIst7piDstEx9M7MU7dqS8Jcpe10l0k3knw9tQODBYPx5ugkivtEZE6GyRL7cJlO1TgQYRQ==
X-Received: by 2002:a05:6000:15c7:b0:1f0:45e0:e40d with SMTP id y7-20020a05600015c700b001f045e0e40dmr2921118wry.343.1646258596840;
        Wed, 02 Mar 2022 14:03:16 -0800 (PST)
Received: from localhost.localdomain (cpc141996-chfd3-2-0-cust928.12-3.cable.virginm.net. [86.13.91.161])
        by smtp.gmail.com with ESMTPSA id l16-20020a05600c4f1000b0033383cdeea1sm229258wmq.10.2022.03.02.14.03.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 02 Mar 2022 14:03:16 -0800 (PST)
From:   Daniel Scally <djrscally@gmail.com>
To:     linux-media@vger.kernel.org, libcamera-devel@lists.libcamera.org
Cc:     sakari.ailus@linux.intel.com, laurent.pinchart@ideasonboard.com,
        hanlinchen@chromium.org, tfiga@chromium.org, hdegoede@redhat.com,
        kieran.bingham@ideasonboard.com, hpa@redhat.com
Subject: [PATCH v3 3/5] media: entity: Add link_type_name() helper
Date:   Wed,  2 Mar 2022 22:03:02 +0000
Message-Id: <20220302220304.1327896-4-djrscally@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220302220304.1327896-1-djrscally@gmail.com>
References: <20220302220304.1327896-1-djrscally@gmail.com>
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

Now we have three types of media link, printing the right name during
debug output is slightly more complicated. Add a helper function to
make it easier.

Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Signed-off-by: Daniel Scally <djrscally@gmail.com>
---

Changes since v2:

	- None

Changes since v1:

	- renamed function to link_type_name() (Laurent)

Changes since the rfc:

	- new patch

 drivers/media/mc/mc-entity.c | 18 +++++++++++++++---
 1 file changed, 15 insertions(+), 3 deletions(-)

diff --git a/drivers/media/mc/mc-entity.c b/drivers/media/mc/mc-entity.c
index d0563ee4b28b..1a7d0a4fb9e8 100644
--- a/drivers/media/mc/mc-entity.c
+++ b/drivers/media/mc/mc-entity.c
@@ -44,6 +44,20 @@ static inline const char *intf_type(struct media_interface *intf)
 	}
 };
 
+static inline const char *link_type_name(struct media_link *link)
+{
+	switch (link->flags & MEDIA_LNK_FL_LINK_TYPE) {
+	case MEDIA_LNK_FL_DATA_LINK:
+		return "data";
+	case MEDIA_LNK_FL_INTERFACE_LINK:
+		return "interface";
+	case MEDIA_LNK_FL_ANCILLARY_LINK:
+		return "ancillary";
+	default:
+		return "unknown";
+	}
+}
+
 __must_check int __media_entity_enum_init(struct media_entity_enum *ent_enum,
 					  int idx_max)
 {
@@ -89,9 +103,7 @@ static void dev_dbg_obj(const char *event_name,  struct media_gobj *gobj)
 
 		dev_dbg(gobj->mdev->dev,
 			"%s id %u: %s link id %u ==> id %u\n",
-			event_name, media_id(gobj),
-			media_type(link->gobj0) == MEDIA_GRAPH_PAD ?
-				"data" : "interface",
+			event_name, media_id(gobj), link_type_name(link),
 			media_id(link->gobj0),
 			media_id(link->gobj1));
 		break;
-- 
2.25.1

