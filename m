Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 431BD1ED479
	for <lists+linux-media@lfdr.de>; Wed,  3 Jun 2020 18:41:38 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726141AbgFCQle (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 3 Jun 2020 12:41:34 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48744 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725904AbgFCQld (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Wed, 3 Jun 2020 12:41:33 -0400
Received: from mail-pg1-x542.google.com (mail-pg1-x542.google.com [IPv6:2607:f8b0:4864:20::542])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A0870C08C5C0;
        Wed,  3 Jun 2020 09:41:33 -0700 (PDT)
Received: by mail-pg1-x542.google.com with SMTP id w20so2113242pga.6;
        Wed, 03 Jun 2020 09:41:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=5qeeq/WvCOy3veY0hIZ3+eUbvUg0kAdam89g1JjiNiE=;
        b=k85aiqJiYPd7Cx+MNgqMbxThzBdvBTiMjoFk9GXkKdgeqbaV5uPFbConATEMhGw44l
         mJ/8zWabTNDORpj1RcH0ggt2v2s7gYNOpZt1SKIPZMI7gO20m7hXivdJ5x+aFO1seLjC
         zzhs7I7OD9AF6WZya0X++48hhWwsgN0kr2zKOha6JDNwrFF8+VcX102yilOzxo+jvA2G
         P4LP1aW4BBV9hh+/b/RnDkFcCSSLHTkaw7g/vyKsBHAd/4+74FEQe5NzPOltvjXjNrwu
         I3qZsFDhef21hs1OARPg/aWHLKsl9BG7j213oy6NutW6vegcA3hS9M/BHBzxURuowtCl
         FWmA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=5qeeq/WvCOy3veY0hIZ3+eUbvUg0kAdam89g1JjiNiE=;
        b=AO0UsFSfyP+7B6nQv8L5M9yuBxebqkcm0BnTbc2tt9fuOBVtvNbkWeZse5qQ240TI/
         lMZBds8HLMxaqlgJVm2OrF0EO3oJ3lSbr7C4p/FRUhhG3TcQ4kiWK3AVZ1K64c7hG0AU
         /cbS0avt+glCXYzbsM4cO4K4fxDlPzum9hjoO+9Hz3q3Q46MG+eR9FjDvTkjyRQk25Kz
         pD+DVSHKuuYwhabzLRphJLlwH5CmJDx+rXqr7ew3CljlzTQGe8vuzipHW/XwpMeYn1QO
         Mwl9x0MIADZkv8Hz6gsbC65JbFySjIEfbVPnFr7WlTMvzcXD1kwtF9/ViuRB1eRjJ9mI
         Abaw==
X-Gm-Message-State: AOAM53396fvXhWEyaks3yC7tcW8RfXsPedMfW4fWcx2VT13cZkf3uvKV
        ApNgE5zMpmn3aOe2PpO8/Kq8v8zBq5Y=
X-Google-Smtp-Source: ABdhPJzfSoqndDAyAHLQK1Ufi2v2JA5ZBVCCbm8ikgGn64Rks3VKRkQdlNQypVNeAcMikeRHZUYkaQ==
X-Received: by 2002:a63:d547:: with SMTP id v7mr225049pgi.413.1591202493095;
        Wed, 03 Jun 2020 09:41:33 -0700 (PDT)
Received: from suzukaze.ipads-lab.se.sjtu.edu.cn ([202.120.40.82])
        by smtp.gmail.com with ESMTPSA id v9sm2364969pfe.198.2020.06.03.09.41.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 03 Jun 2020 09:41:32 -0700 (PDT)
From:   Chuhong Yuan <hslester96@gmail.com>
Cc:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Ilkka Myllyperkio <ilkka.myllyperkio@sofica.fi>,
        "Ivan T . Ivanov" <iivanov@mm-sol.com>,
        Vimarsh Zutshi <vimarsh.zutshi@gmail.com>,
        Stanimir Varbanov <svarbanov@mm-sol.com>,
        linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
        Chuhong Yuan <hslester96@gmail.com>
Subject: [PATCH v2] media: omap3isp: Add missed v4l2_ctrl_handler_free() for preview_init_entities()
Date:   Thu,  4 Jun 2020 00:41:22 +0800
Message-Id: <20200603164122.2101162-1-hslester96@gmail.com>
X-Mailer: git-send-email 2.26.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
To:     unlisted-recipients:; (no To-header on input)
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

preview_init_entities() does not call v4l2_ctrl_handler_free() when
it fails.
Add the missed function to fix it.

Fixes: de1135d44f4f ("[media] omap3isp: CCDC, preview engine and resizer]")
Signed-off-by: Chuhong Yuan <hslester96@gmail.com>
---
Changes in v2:
  - Fix the typo.

 drivers/media/platform/omap3isp/isppreview.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/drivers/media/platform/omap3isp/isppreview.c b/drivers/media/platform/omap3isp/isppreview.c
index 4dbdf3180d10..607b7685c982 100644
--- a/drivers/media/platform/omap3isp/isppreview.c
+++ b/drivers/media/platform/omap3isp/isppreview.c
@@ -2287,7 +2287,7 @@ static int preview_init_entities(struct isp_prev_device *prev)
 	me->ops = &preview_media_ops;
 	ret = media_entity_pads_init(me, PREV_PADS_NUM, pads);
 	if (ret < 0)
-		return ret;
+		goto error_handler_free;
 
 	preview_init_formats(sd, NULL);
 
@@ -2320,6 +2320,8 @@ static int preview_init_entities(struct isp_prev_device *prev)
 	omap3isp_video_cleanup(&prev->video_in);
 error_video_in:
 	media_entity_cleanup(&prev->subdev.entity);
+error_handler_free:
+	v4l2_ctrl_handler_free(&prev->ctrls);
 	return ret;
 }
 
-- 
2.26.2

