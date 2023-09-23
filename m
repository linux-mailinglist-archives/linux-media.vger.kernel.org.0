Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 3E5327AC32D
	for <lists+linux-media@lfdr.de>; Sat, 23 Sep 2023 17:21:39 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231997AbjIWPVn (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sat, 23 Sep 2023 11:21:43 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33804 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232000AbjIWPVl (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Sat, 23 Sep 2023 11:21:41 -0400
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 97F6E1A6
        for <linux-media@vger.kernel.org>; Sat, 23 Sep 2023 08:21:35 -0700 (PDT)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 57B89C433C7;
        Sat, 23 Sep 2023 15:21:34 +0000 (UTC)
From:   Hans Verkuil <hverkuil-cisco@xs4all.nl>
To:     linux-media@vger.kernel.org
Cc:     Arnd Bergmann <arnd@kernel.org>,
        Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        "Lad, Prabhakar" <prabhakar.csengg@gmail.com>
Subject: [PATCHv2 18/23] media: am437x: don't fill in bus_info
Date:   Sat, 23 Sep 2023 17:21:02 +0200
Message-Id: <20230923152107.283289-19-hverkuil-cisco@xs4all.nl>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20230923152107.283289-1-hverkuil-cisco@xs4all.nl>
References: <20230923152107.283289-1-hverkuil-cisco@xs4all.nl>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-1.6 required=5.0 tests=BAYES_00,
        HEADER_FROM_DIFFERENT_DOMAINS,RCVD_IN_DNSWL_BLOCKED,SPF_HELO_NONE,
        SPF_PASS autolearn=no autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Let the V4L2 core fill this in.

This fixes this warning:

drivers/media/platform/ti/am437x/am437x-vpfe.c: In function 'vpfe_querycap':
drivers/media/platform/ti/am437x/am437x-vpfe.c:1279:35: warning: '%s' directive output may be truncated writing up to 35 bytes into a region of size 23 [-Wformat-truncation=]
 1279 |                         "platform:%s", vpfe->v4l2_dev.name);
      |                                   ^~
drivers/media/platform/ti/am437x/am437x-vpfe.c:1278:9: note: 'snprintf' output between 10 and 45 bytes into a destination of size 32
 1278 |         snprintf(cap->bus_info, sizeof(cap->bus_info),
      |         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
 1279 |                         "platform:%s", vpfe->v4l2_dev.name);
      |                         ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

Signed-off-by: Hans Verkuil <hverkuil-cisco@xs4all.nl>
Cc: "Lad, Prabhakar" <prabhakar.csengg@gmail.com>
---
 drivers/media/platform/ti/am437x/am437x-vpfe.c | 4 ----
 1 file changed, 4 deletions(-)

diff --git a/drivers/media/platform/ti/am437x/am437x-vpfe.c b/drivers/media/platform/ti/am437x/am437x-vpfe.c
index 63092013d476..5fa2ea9025d9 100644
--- a/drivers/media/platform/ti/am437x/am437x-vpfe.c
+++ b/drivers/media/platform/ti/am437x/am437x-vpfe.c
@@ -1271,12 +1271,8 @@ static inline void vpfe_attach_irq(struct vpfe_device *vpfe)
 static int vpfe_querycap(struct file *file, void  *priv,
 			 struct v4l2_capability *cap)
 {
-	struct vpfe_device *vpfe = video_drvdata(file);
-
 	strscpy(cap->driver, VPFE_MODULE_NAME, sizeof(cap->driver));
 	strscpy(cap->card, "TI AM437x VPFE", sizeof(cap->card));
-	snprintf(cap->bus_info, sizeof(cap->bus_info),
-			"platform:%s", vpfe->v4l2_dev.name);
 	return 0;
 }
 
-- 
2.40.1

