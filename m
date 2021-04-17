Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E7B54363064
	for <lists+linux-media@lfdr.de>; Sat, 17 Apr 2021 15:35:40 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236092AbhDQNgC (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sat, 17 Apr 2021 09:36:02 -0400
Received: from mout01.posteo.de ([185.67.36.65]:60285 "EHLO mout01.posteo.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S230442AbhDQNf7 (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Sat, 17 Apr 2021 09:35:59 -0400
Received: from submission (posteo.de [89.146.220.130]) 
        by mout01.posteo.de (Postfix) with ESMTPS id 4C576240027
        for <linux-media@vger.kernel.org>; Sat, 17 Apr 2021 15:35:31 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=posteo.net; s=2017;
        t=1618666531; bh=vK7BjWABF7GDT+uVFrLnAoUL4aBtd7JLM8wsV6S3lzY=;
        h=From:To:Cc:Subject:Date:From;
        b=Z5Ht2+EFenazeDv8racoIq1SBgbZuqdzC++qte66xmMSxsJ0q3Jzb+1yGsSD5b0Fk
         l4XFhAYwc3aTs6H3WiEkop/pBSHqnanus7mNsbufkTGkI//h8prtt8oESiOmrBAOpc
         Y3axUG67mOEA0Rtx3R8V2eIxDO7g5Dpb736KLCKbvK0wpbEUy+89ENyn7k1LR/URsl
         RtOOo3VwToevKWxxUHQU5hjbSEBdR161dLx1x+pIt6ADDqDB3p3Dsho2Mk+G1NhgOY
         hoYAwIhfFW9PRstd4dOhbEpEFQnuk3nyqWQqkw/9i/49xS9LZcaK55CBkIsBDsEtWy
         ox5dj5jfDdn+A==
Received: from customer (localhost [127.0.0.1])
        by submission (posteo.de) with ESMTPSA id 4FMvGV5tSgz9rxG;
        Sat, 17 Apr 2021 15:35:30 +0200 (CEST)
From:   Sebastian Fricke <sebastian.fricke@posteo.net>
To:     linux-media@vger.kernel.org
Cc:     Sebastian Fricke <sebastian.fricke@posteo.net>
Subject: [PATCH] media: mc: mc-entity.c: Fix typo
Date:   Sat, 17 Apr 2021 13:34:38 +0000
Message-Id: <20210417133437.26652-1-sebastian.fricke@posteo.net>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

s/entity in the other end/entity at the other end/

Signed-off-by: Sebastian Fricke <sebastian.fricke@posteo.net>
---
 drivers/media/mc/mc-entity.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/media/mc/mc-entity.c b/drivers/media/mc/mc-entity.c
index 12b45e669bcc..8a3fc960b564 100644
--- a/drivers/media/mc/mc-entity.c
+++ b/drivers/media/mc/mc-entity.c
@@ -323,7 +323,7 @@ static void media_graph_walk_iter(struct media_graph *graph)
 		return;
 	}
 
-	/* Get the entity in the other end of the link . */
+	/* Get the entity at the other end of the link . */
 	next = media_entity_other(entity, link);
 
 	/* Has the entity already been visited? */
-- 
2.25.1

