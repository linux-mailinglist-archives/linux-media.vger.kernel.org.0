Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id EC7377AC32A
	for <lists+linux-media@lfdr.de>; Sat, 23 Sep 2023 17:21:33 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231990AbjIWPVh (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sat, 23 Sep 2023 11:21:37 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41286 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231989AbjIWPVh (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Sat, 23 Sep 2023 11:21:37 -0400
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 726CA197
        for <linux-media@vger.kernel.org>; Sat, 23 Sep 2023 08:21:31 -0700 (PDT)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 57CEBC433C8;
        Sat, 23 Sep 2023 15:21:30 +0000 (UTC)
From:   Hans Verkuil <hverkuil-cisco@xs4all.nl>
To:     linux-media@vger.kernel.org
Cc:     Arnd Bergmann <arnd@kernel.org>,
        Hans Verkuil <hverkuil-cisco@xs4all.nl>
Subject: [PATCHv2 15/23] media: vivid: use VIVID_MODULE_NAME to fill bus_info
Date:   Sat, 23 Sep 2023 17:20:59 +0200
Message-Id: <20230923152107.283289-16-hverkuil-cisco@xs4all.nl>
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

Fixes this compiler warning:

drivers/media/test-drivers/vivid/vivid-core.c: In function 'vidioc_querycap':
drivers/media/test-drivers/vivid/vivid-core.c:243:35: warning: '%s' directive output may be truncated writing up to 35 bytes into a region of size 23 [-Wformat-truncation=]
  243 |                         "platform:%s", dev->v4l2_dev.name);
      |                                   ^~
drivers/media/test-drivers/vivid/vivid-core.c:242:9: note: 'snprintf' output between 10 and 45 bytes into a destination of size 32
  242 |         snprintf(cap->bus_info, sizeof(cap->bus_info),
      |         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
  243 |                         "platform:%s", dev->v4l2_dev.name);
      |                         ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

Signed-off-by: Hans Verkuil <hverkuil-cisco@xs4all.nl>
---
 drivers/media/test-drivers/vivid/vivid-core.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/media/test-drivers/vivid/vivid-core.c b/drivers/media/test-drivers/vivid/vivid-core.c
index e95bdccfc18e..394c9f81ea72 100644
--- a/drivers/media/test-drivers/vivid/vivid-core.c
+++ b/drivers/media/test-drivers/vivid/vivid-core.c
@@ -240,7 +240,7 @@ static int vidioc_querycap(struct file *file, void  *priv,
 	strscpy(cap->driver, "vivid", sizeof(cap->driver));
 	strscpy(cap->card, "vivid", sizeof(cap->card));
 	snprintf(cap->bus_info, sizeof(cap->bus_info),
-			"platform:%s", dev->v4l2_dev.name);
+		 "platform:%s-%03d", VIVID_MODULE_NAME, dev->inst);
 
 	cap->capabilities = dev->vid_cap_caps | dev->vid_out_caps |
 		dev->vbi_cap_caps | dev->vbi_out_caps |
-- 
2.40.1

