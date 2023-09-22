Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 90D627AAFF9
	for <lists+linux-media@lfdr.de>; Fri, 22 Sep 2023 12:51:30 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233466AbjIVKvK (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 22 Sep 2023 06:51:10 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50034 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233504AbjIVKvA (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 22 Sep 2023 06:51:00 -0400
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CC4F61B6
        for <linux-media@vger.kernel.org>; Fri, 22 Sep 2023 03:50:48 -0700 (PDT)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 626F7C433C8;
        Fri, 22 Sep 2023 10:50:47 +0000 (UTC)
From:   Hans Verkuil <hverkuil-cisco@xs4all.nl>
To:     linux-media@vger.kernel.org
Cc:     Arnd Bergmann <arnd@kernel.org>,
        Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        Sean Young <sean@mess.org>
Subject: [PATCH 7/7] media: rc: ati_remote: increase mouse_name buffer size
Date:   Fri, 22 Sep 2023 12:50:36 +0200
Message-Id: <20230922105036.3148784-8-hverkuil-cisco@xs4all.nl>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20230922105036.3148784-1-hverkuil-cisco@xs4all.nl>
References: <20230922105036.3148784-1-hverkuil-cisco@xs4all.nl>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-4.0 required=5.0 tests=BAYES_00,
        HEADER_FROM_DIFFERENT_DOMAINS,RCVD_IN_DNSWL_MED,SPF_HELO_NONE,SPF_PASS
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Fixes this compiler warning:

drivers/media/rc/ati_remote.c: In function 'ati_remote_probe':
drivers/media/rc/ati_remote.c:876:21: warning: ' mouse' directive output may be truncated writing 6 bytes into a region of size between 1 and 80 [-Wformat-truncation=]
  876 |                  "%s mouse", ati_remote->rc_name);
      |                     ^~~~~~
drivers/media/rc/ati_remote.c:875:9: note: 'snprintf' output between 7 and 86 bytes into a destination of size 80
  875 |         snprintf(ati_remote->mouse_name, sizeof(ati_remote->mouse_name),
      |         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
  876 |                  "%s mouse", ati_remote->rc_name);
      |                  ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

Signed-off-by: Hans Verkuil <hverkuil-cisco@xs4all.nl>
Cc: Sean Young <sean@mess.org>
---
 drivers/media/rc/ati_remote.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/media/rc/ati_remote.c b/drivers/media/rc/ati_remote.c
index fff4dd48eaca..d7721e60776e 100644
--- a/drivers/media/rc/ati_remote.c
+++ b/drivers/media/rc/ati_remote.c
@@ -251,7 +251,7 @@ struct ati_remote {
 
 	char rc_name[NAME_BUFSIZE];
 	char rc_phys[NAME_BUFSIZE];
-	char mouse_name[NAME_BUFSIZE];
+	char mouse_name[NAME_BUFSIZE + 6];
 	char mouse_phys[NAME_BUFSIZE];
 
 	wait_queue_head_t wait;
-- 
2.40.1

