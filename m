Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id E0F605537E9
	for <lists+linux-media@lfdr.de>; Tue, 21 Jun 2022 18:35:13 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1352902AbiFUQfG (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 21 Jun 2022 12:35:06 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50112 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1352486AbiFUQfF (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 21 Jun 2022 12:35:05 -0400
Received: from mail-wm1-x32b.google.com (mail-wm1-x32b.google.com [IPv6:2a00:1450:4864:20::32b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2CF092A729
        for <linux-media@vger.kernel.org>; Tue, 21 Jun 2022 09:35:04 -0700 (PDT)
Received: by mail-wm1-x32b.google.com with SMTP id a10so7803850wmj.5
        for <linux-media@vger.kernel.org>; Tue, 21 Jun 2022 09:35:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=Eg+EwYeQfLen8K8rKVkBgSycceBY/89PL9/DRUnl5b0=;
        b=CDo0Tp5SqLceA6R+yfUF658/Y1p3KZcdoCRqpc4wHVOt+roqX5h6LttaoKlaig7igf
         kuD3POYyOKZvnjbhGwvWX82pMKV5xsiVPQcSSyl5AbBKpHZsNN1ON2Wsa2jdpdFjN0hA
         1BzakBzn8YkGSafJxIOi2SOH3i15j7DheqAlvfQoEO141T9pT1kFHuRt6g5xb5WAsgLX
         GaEs75yvqy1Jp9fvoZr/Vk1sPM2t9OmbFo6vkpaNyLKUxmYJVBErIgamurO2+NDdyePW
         yk6ZWzo6WFgbgq+NxG+CzCeukF2SD6bKNyaATYFpo2X1hB06ZmmVi9wvEqRuMbihCy9w
         i46A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=Eg+EwYeQfLen8K8rKVkBgSycceBY/89PL9/DRUnl5b0=;
        b=FbWR4TQ0twgHHhoG1+pWxKKTkSCuWVYCi3nloKfy2frchRI7S8iph9pOB24HT9OaKt
         AJMHKX9YG0ZmRRM+P1BkL+7rbP4MpE6LYZ+QOt6BPX7UqrrdS6OjS4xI/26VV7KmgT54
         IS5Y/QutSrJA02uU9gdUJtbuC7K616ISDymQbliXs7grB2JQAcPQNLeZPjpFk/jhHAQ4
         /FKhIl55854DiVlO78Ece4Af5kMfi1Cl7T5s3KQkfflfuSiStlSsbSFhjCE1iVu9wwbA
         R9x7/mMJuM8decZvnTiGbW2vd8lfg/qggkQwxjRQBofINtdNLftdVQO7A4aKPapoogbD
         3eeQ==
X-Gm-Message-State: AJIora/nFh0AYCJ61UbieRFUE+VSuL4vsb+PwoUdcd2p3VxDIrJiNsy8
        WYq4H0qZeX22OeqUe1D5IbRwNm9EpIk=
X-Google-Smtp-Source: AGRyM1s0HrwQygnfrs3Qr9xRiB8YupbWgaF2awz9mMy4XrQzHNozoiRJRuKUBxi/zgoAI7RJYbGwxQ==
X-Received: by 2002:a7b:c856:0:b0:39c:3b44:7ab0 with SMTP id c22-20020a7bc856000000b0039c3b447ab0mr31438076wml.117.1655829302744;
        Tue, 21 Jun 2022 09:35:02 -0700 (PDT)
Received: from localhost.localdomain (cpc141996-chfd3-2-0-cust928.12-3.cable.virginm.net. [86.13.91.161])
        by smtp.gmail.com with ESMTPSA id v184-20020a1cacc1000000b0039c454067ddsm18649887wme.15.2022.06.21.09.35.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 21 Jun 2022 09:35:02 -0700 (PDT)
From:   Daniel Scally <djrscally@gmail.com>
To:     linux-media@vger.kernel.org
Cc:     sakari.ailus@linux.intel.com, laurent.pinchart@ideasonboard.com,
        paul.elder@ideasonboard.com
Subject: [PATCH 2/2] media: entity: Use dedicated data link iterator
Date:   Tue, 21 Jun 2022 17:34:57 +0100
Message-Id: <20220621163457.766496-3-djrscally@gmail.com>
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

Where iteration over links for an entity is clearly assuming that
all of those links are data links, use the new iterator to guarantee
that that assumption is met.

Signed-off-by: Daniel Scally <djrscally@gmail.com>
---
 drivers/media/mc/mc-entity.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/media/mc/mc-entity.c b/drivers/media/mc/mc-entity.c
index 11f5207f73aa..f46690fd141d 100644
--- a/drivers/media/mc/mc-entity.c
+++ b/drivers/media/mc/mc-entity.c
@@ -449,7 +449,7 @@ __must_check int __media_pipeline_start(struct media_entity *entity,
 		bitmap_zero(active, entity->num_pads);
 		bitmap_fill(has_no_links, entity->num_pads);
 
-		list_for_each_entry(link, &entity->links, list) {
+		for_each_media_entity_data_link(entity, link) {
 			struct media_pad *pad = link->sink->entity == entity
 						? link->sink : link->source;
 
@@ -888,7 +888,7 @@ media_entity_find_link(struct media_pad *source, struct media_pad *sink)
 {
 	struct media_link *link;
 
-	list_for_each_entry(link, &source->entity->links, list) {
+	for_each_media_entity_data_link(source->entity, link) {
 		if (link->source->entity == source->entity &&
 		    link->source->index == source->index &&
 		    link->sink->entity == sink->entity &&
@@ -904,7 +904,7 @@ struct media_pad *media_entity_remote_pad(const struct media_pad *pad)
 {
 	struct media_link *link;
 
-	list_for_each_entry(link, &pad->entity->links, list) {
+	for_each_media_entity_data_link(pad->entity, link) {
 		if (!(link->flags & MEDIA_LNK_FL_ENABLED))
 			continue;
 
-- 
2.25.1

