Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id EBCEE7AC332
	for <lists+linux-media@lfdr.de>; Sat, 23 Sep 2023 17:21:44 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232019AbjIWPVt (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sat, 23 Sep 2023 11:21:49 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33972 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232017AbjIWPVr (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Sat, 23 Sep 2023 11:21:47 -0400
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1801E194
        for <linux-media@vger.kernel.org>; Sat, 23 Sep 2023 08:21:42 -0700 (PDT)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 046B5C433C9;
        Sat, 23 Sep 2023 15:21:40 +0000 (UTC)
From:   Hans Verkuil <hverkuil-cisco@xs4all.nl>
To:     linux-media@vger.kernel.org
Cc:     Arnd Bergmann <arnd@kernel.org>,
        Hans Verkuil <hverkuil-cisco@xs4all.nl>
Subject: [PATCHv2 23/23] media: radio-si476x: don't fill in bus_info
Date:   Sat, 23 Sep 2023 17:21:07 +0200
Message-Id: <20230923152107.283289-24-hverkuil-cisco@xs4all.nl>
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

Let the V4L2 core fill in bus_info.

This fixes this warning:

drivers/media/radio/radio-si476x.c: In function 'si476x_radio_querycap':
drivers/media/radio/radio-si476x.c:333:28: warning: '%s' directive output may be truncated writing up to 35 bytes into a region of size 23 [-Wformat-truncation=]
  333 |                  "platform:%s", radio->v4l2dev.name);
      |                            ^~
drivers/media/radio/radio-si476x.c:332:9: note: 'snprintf' output between 10 and 45 bytes into a destination of size 32
  332 |         snprintf(capability->bus_info, sizeof(capability->bus_info),
      |         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
  333 |                  "platform:%s", radio->v4l2dev.name);
      |                  ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

Signed-off-by: Hans Verkuil <hverkuil-cisco@xs4all.nl>
---
 drivers/media/radio/radio-si476x.c | 4 +---
 1 file changed, 1 insertion(+), 3 deletions(-)

diff --git a/drivers/media/radio/radio-si476x.c b/drivers/media/radio/radio-si476x.c
index 6061506159f1..b2c5809a8bc7 100644
--- a/drivers/media/radio/radio-si476x.c
+++ b/drivers/media/radio/radio-si476x.c
@@ -328,9 +328,7 @@ static int si476x_radio_querycap(struct file *file, void *priv,
 
 	strscpy(capability->driver, radio->v4l2dev.name,
 		sizeof(capability->driver));
-	strscpy(capability->card,   DRIVER_CARD, sizeof(capability->card));
-	snprintf(capability->bus_info, sizeof(capability->bus_info),
-		 "platform:%s", radio->v4l2dev.name);
+	strscpy(capability->card, DRIVER_CARD, sizeof(capability->card));
 	return 0;
 }
 
-- 
2.40.1

