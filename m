Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 8FA944FCF6C
	for <lists+linux-media@lfdr.de>; Tue, 12 Apr 2022 08:23:27 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233916AbiDLGZj (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 12 Apr 2022 02:25:39 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34826 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229607AbiDLGZg (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 12 Apr 2022 02:25:36 -0400
Received: from mail-yb1-xb49.google.com (mail-yb1-xb49.google.com [IPv6:2607:f8b0:4864:20::b49])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4534C35840
        for <linux-media@vger.kernel.org>; Mon, 11 Apr 2022 23:23:20 -0700 (PDT)
Received: by mail-yb1-xb49.google.com with SMTP id h16-20020a056902009000b00628a70584b2so13910844ybs.6
        for <linux-media@vger.kernel.org>; Mon, 11 Apr 2022 23:23:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112;
        h=date:message-id:mime-version:subject:from:to:cc;
        bh=s4m1xk5Bht67wVvW1hCCtUmVFFAMLAOpFVnaG3v3Vww=;
        b=SZwg/HtD0m3TMwO/hz3TwQF1O2PSpscDxpT2ibvzQyR2AWwbmLXcxzUek6FKpDD0MZ
         Rp9QQVV96taKaMeE1iFDj2MTYntepyB1m/fms82p908NTUn7OKkEv2XiVweEwLKwxCTn
         XouyWWihTgZeaiuv/cLCUAXF6Gf+ryGbllPMISAzHyf+Q2IzWdr09wGrpRvb5qhMTojT
         s2iuWolXQAAGzTEGiX+NTr3Aez/MyrsXPwQguA5I2URwQYt8AQP3LC+OclwyKqooY/LV
         Dc7mRv/qb904COmE5GakHyE2zMcu1OEw8yrI6CH5ieZ+fhEGdIUwMpR7kBeRkWNFbzh2
         M82g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:message-id:mime-version:subject:from:to:cc;
        bh=s4m1xk5Bht67wVvW1hCCtUmVFFAMLAOpFVnaG3v3Vww=;
        b=rp2HDfPvVhnXMPPGxuBpnvRV3Pt5S/YOKhqbvX6QvnsKGTYZnHzeY2USzd/MDdl7VX
         oy3Ni9ds82z90EyuJ/5jxcuVBHSoXg1ATm2o0ry38E4u3GMgtAwas3Ml6cHoDtDyUgPW
         OpKCW20gMRNA3IwLOIYFofagMXVhf128Nf+eIpHldOEJSdjzk1UqkEkTCN48Gyuwi+pW
         V56xTrthk1FdkNxCKWkdzSEAD2q/Vhz6knShwGEGjvb5gENRtk+KSyfEbPLOKBB4RnVZ
         2vMZI5X+pFc9vh5nZkfhryQ0oPr8k3Zv593v+eAw82tHf1eSzCnI2Zerw7d/7xzs5N8G
         UDuQ==
X-Gm-Message-State: AOAM532C4caP3Y8eAnERCO0EAqFRHHoVYZcjvnpqEaQq80F4orIxbOq1
        V3KsaiOCRM2XNEQ6NXM6sFoXJCuZDvU=
X-Google-Smtp-Source: ABdhPJyp/w62jkPdpm/517VxQ8Zc1zZa0l7c7hPiY2ZPsbMtc6Mx8C7/UzPcgjioJhsOEbGH7v5620krrq4=
X-Received: from yunkec1.tok.corp.google.com ([2401:fa00:8f:203:fd37:717b:edcd:5c02])
 (user=yunkec job=sendgmr) by 2002:a81:4e15:0:b0:2ec:2d70:35c with SMTP id
 c21-20020a814e15000000b002ec2d70035cmr6750584ywb.246.1649744599474; Mon, 11
 Apr 2022 23:23:19 -0700 (PDT)
Date:   Tue, 12 Apr 2022 15:23:13 +0900
Message-Id: <20220412062313.1645762-1-yunkec@google.com>
Mime-Version: 1.0
X-Mailer: git-send-email 2.35.1.1178.g4f1659d476-goog
Subject: [PATCH] media: entity: skip non-data link when removing reverse links
From:   Yunke Cao <yunkec@google.com>
To:     Sakari Ailus <sakari.ailus@linux.intel.com>
Cc:     Tomasz Figa <tfiga@chromium.org>,
        Daniel Scally <djrscally@gmail.com>,
        linux-media@vger.kernel.org, Yunke Cao <yunkec@google.com>
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-9.6 required=5.0 tests=BAYES_00,DKIMWL_WL_MED,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE,USER_IN_DEF_DKIM_WL
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

The original implementation removes reverse links for any input link and
assumes the presense of sink/source.
It fails when the link is a not a data link.
media_entity_remove_links when there's an ancillary link can also fail.

We only need to remove reverse links for a data link.

Signed-off-by: Yunke Cao <yunkec@google.com>
---
 drivers/media/mc/mc-entity.c | 34 +++++++++++++++++++---------------
 1 file changed, 19 insertions(+), 15 deletions(-)

diff --git a/drivers/media/mc/mc-entity.c b/drivers/media/mc/mc-entity.c
index 1ff60d411ea9..11f5207f73aa 100644
--- a/drivers/media/mc/mc-entity.c
+++ b/drivers/media/mc/mc-entity.c
@@ -597,26 +597,30 @@ static void __media_entity_remove_link(struct media_entity *entity,
 	struct media_link *rlink, *tmp;
 	struct media_entity *remote;
 
-	if (link->source->entity == entity)
-		remote = link->sink->entity;
-	else
-		remote = link->source->entity;
+	/* Remove the reverse links for a data link. */
+	if ((link->flags & MEDIA_LNK_FL_LINK_TYPE) == MEDIA_LNK_FL_DATA_LINK) {
+		if (link->source->entity == entity)
+			remote = link->sink->entity;
+		else
+			remote = link->source->entity;
 
-	list_for_each_entry_safe(rlink, tmp, &remote->links, list) {
-		if (rlink != link->reverse)
-			continue;
+		list_for_each_entry_safe(rlink, tmp, &remote->links, list) {
+			if (rlink != link->reverse)
+				continue;
 
-		if (link->source->entity == entity)
-			remote->num_backlinks--;
+			if (link->source->entity == entity)
+				remote->num_backlinks--;
 
-		/* Remove the remote link */
-		list_del(&rlink->list);
-		media_gobj_destroy(&rlink->graph_obj);
-		kfree(rlink);
+			/* Remove the remote link */
+			list_del(&rlink->list);
+			media_gobj_destroy(&rlink->graph_obj);
+			kfree(rlink);
 
-		if (--remote->num_links == 0)
-			break;
+			if (--remote->num_links == 0)
+				break;
+		}
 	}
+
 	list_del(&link->list);
 	media_gobj_destroy(&link->graph_obj);
 	kfree(link);
-- 
2.35.1.1178.g4f1659d476-goog

