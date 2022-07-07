Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 6551756AEB8
	for <lists+linux-media@lfdr.de>; Fri,  8 Jul 2022 00:48:04 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236155AbiGGWrv (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 7 Jul 2022 18:47:51 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42792 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236843AbiGGWru (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Thu, 7 Jul 2022 18:47:50 -0400
Received: from mail-wm1-x329.google.com (mail-wm1-x329.google.com [IPv6:2a00:1450:4864:20::329])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B58ED61D60
        for <linux-media@vger.kernel.org>; Thu,  7 Jul 2022 15:47:49 -0700 (PDT)
Received: by mail-wm1-x329.google.com with SMTP id ay25so1820847wmb.1
        for <linux-media@vger.kernel.org>; Thu, 07 Jul 2022 15:47:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=82R/3qdmhrdFpqaMvdtyb8vBQDUGY1kfr47RRdbZrBs=;
        b=c6rS2NWWW8Rzct7v5X/6rlH2X0rzJ+Md4fs3f+5ggCa6lUp4TqdTV2KCL6wERKvieT
         Tyl8ZqDZ9DnfAGkH81vU/UE8Urfsa9EMnv543lqV/Z0LP4DfNI0QxBcPomklkmlmE7Y4
         dWRlLjL8SClz1yOJZ+oAymBguLLPUVVZGylYSTey0L4vDAWD0LfJTBugng0ZHnPlh7Fm
         s4jCSnHcYGfCDqWCiTMHxqaIoRr+I88Sh7VPjE/ErEdnsTlNMomiN9OwfzxTmPko2lCj
         D4uX1jxET9NphQ2MFszH0Ke5eyjOuXhKMsGJuknOlvj5mLGSHaNQYaP+n7JhP7A9MxPk
         7yOw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=82R/3qdmhrdFpqaMvdtyb8vBQDUGY1kfr47RRdbZrBs=;
        b=veVIO2/e+8nI8Qq503rn14IeEH/Nk1CJRnj3+p1TI7NoogsZPabrXBaGp8PnOiGJSJ
         WM0+NEx7zWn0mxhMq1QFvVSqSJiCiPsBLKOKkiefg0pSzG7o8MKeWUD7RTIW00OTFwGG
         owmXr0YQdjadlu0juNBAA8fQQ48malu17oz1LMuXb0Zci1bb/BjOLHzLkBJOPE51FsuF
         Q5aGh2MpjSWifR5eNZYNuiCwtVqR6Ad98OIJb+o/fkfflEwvtChATDvs9gfLfSBgvvsh
         flSeQ4O5NtgHK3+6agkkBeKgWGdc9hzCg1Ri7RUIWmpX5t6s7yx4EHo4rHeGJLhxBEOD
         T/rw==
X-Gm-Message-State: AJIora9vkabpdvD0IRy+qD/EK7hPGPpwPfETyZVqRT4Ba81ptnkaCmyG
        cUw3YYjY1/mS1VLGi/AmBdO4OlcnjAc=
X-Google-Smtp-Source: AGRyM1tLUGpT0mNNGO2vu9H1APeF5kZiuYFmi6pGcpQFoGLqnI3R7sJ1JsbvWMScm5a/1ixpPP9SBw==
X-Received: by 2002:a05:600c:240c:b0:3a2:c47f:2b49 with SMTP id 12-20020a05600c240c00b003a2c47f2b49mr7057870wmp.54.1657234067818;
        Thu, 07 Jul 2022 15:47:47 -0700 (PDT)
Received: from localhost.localdomain (cpc141996-chfd3-2-0-cust928.12-3.cable.virginm.net. [86.13.91.161])
        by smtp.gmail.com with ESMTPSA id be12-20020a05600c1e8c00b0039c4d022a44sm241694wmb.1.2022.07.07.15.47.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 07 Jul 2022 15:47:47 -0700 (PDT)
From:   Daniel Scally <djrscally@gmail.com>
To:     linux-media@vger.kernel.org
Cc:     sakari.ailus@linux.intel.com, laurent.pinchart@ideasonboard.com,
        paul.elder@ideasonboard.com, jacopo@jmondi.org
Subject: [PATCH v2 2/2] media: entity: Use dedicated data link iterator
Date:   Thu,  7 Jul 2022 23:47:33 +0100
Message-Id: <20220707224733.347899-3-djrscally@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220707224733.347899-1-djrscally@gmail.com>
References: <20220707224733.347899-1-djrscally@gmail.com>
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

Where iteration over links for an entity is clearly assuming that
all of those links are data links, use the new iterator to guarantee
that that assumption is met.

Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Signed-off-by: Daniel Scally <djrscally@gmail.com>
---
 drivers/media/mc/mc-entity.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/media/mc/mc-entity.c b/drivers/media/mc/mc-entity.c
index a247d5679930..cebb905260d3 100644
--- a/drivers/media/mc/mc-entity.c
+++ b/drivers/media/mc/mc-entity.c
@@ -450,7 +450,7 @@ __must_check int __media_pipeline_start(struct media_entity *entity,
 		bitmap_zero(active, entity->num_pads);
 		bitmap_fill(has_no_links, entity->num_pads);
 
-		list_for_each_entry(link, &entity->links, list) {
+		for_each_media_entity_data_link(entity, link) {
 			struct media_pad *pad = link->sink->entity == entity
 						? link->sink : link->source;
 
@@ -889,7 +889,7 @@ media_entity_find_link(struct media_pad *source, struct media_pad *sink)
 {
 	struct media_link *link;
 
-	list_for_each_entry(link, &source->entity->links, list) {
+	for_each_media_entity_data_link(source->entity, link) {
 		if (link->source->entity == source->entity &&
 		    link->source->index == source->index &&
 		    link->sink->entity == sink->entity &&
@@ -905,7 +905,7 @@ struct media_pad *media_entity_remote_pad(const struct media_pad *pad)
 {
 	struct media_link *link;
 
-	list_for_each_entry(link, &pad->entity->links, list) {
+	for_each_media_entity_data_link(pad->entity, link) {
 		if (!(link->flags & MEDIA_LNK_FL_ENABLED))
 			continue;
 
-- 
2.25.1

