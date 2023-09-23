Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 7ADBC7AC31A
	for <lists+linux-media@lfdr.de>; Sat, 23 Sep 2023 17:21:17 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231849AbjIWPVV (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sat, 23 Sep 2023 11:21:21 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49238 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231684AbjIWPVU (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Sat, 23 Sep 2023 11:21:20 -0400
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8D8AD192
        for <linux-media@vger.kernel.org>; Sat, 23 Sep 2023 08:21:13 -0700 (PDT)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id F3387C433C9;
        Sat, 23 Sep 2023 15:21:10 +0000 (UTC)
From:   Hans Verkuil <hverkuil-cisco@xs4all.nl>
To:     linux-media@vger.kernel.org
Cc:     Arnd Bergmann <arnd@kernel.org>,
        Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        Michael Tretter <m.tretter@pengutronix.de>,
        Arnd Bergmann <arnd@arndb.de>
Subject: [PATCHv2 01/23] media: allegro-dvt: increase buffer size in msg_type_name()
Date:   Sat, 23 Sep 2023 17:20:45 +0200
Message-Id: <20230923152107.283289-2-hverkuil-cisco@xs4all.nl>
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

Fixes this compile error

drivers/media/platform/allegro-dvt/allegro-mail.c: In function 'msg_type_name':
drivers/media/platform/allegro-dvt/allegro-mail.c:37:48: warning: '%04x' directive output may be truncated writing between 4 and 8 bytes into a region of size 6 [-Wformat-truncation=]
   37 |                 snprintf(buf, sizeof(buf), "(0x%04x)", type);
      |                                                ^~~~
drivers/media/platform/allegro-dvt/allegro-mail.c:37:44: note: directive argument in the range [1, 4294967295]
   37 |                 snprintf(buf, sizeof(buf), "(0x%04x)", type);
      |                                            ^~~~~~~~~~
drivers/media/platform/allegro-dvt/allegro-mail.c:37:17: note: 'snprintf' output between 9 and 13 bytes into a destination of size 9
   37 |                 snprintf(buf, sizeof(buf), "(0x%04x)", type);
      |                 ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

Signed-off-by: Hans Verkuil <hverkuil-cisco@xs4all.nl>
Reviewed-by: Michael Tretter <m.tretter@pengutronix.de>
Acked-by: Arnd Bergmann <arnd@arndb.de>
---
 drivers/media/platform/allegro-dvt/allegro-mail.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/media/platform/allegro-dvt/allegro-mail.c b/drivers/media/platform/allegro-dvt/allegro-mail.c
index 16effad10746..aadc947a77ae 100644
--- a/drivers/media/platform/allegro-dvt/allegro-mail.c
+++ b/drivers/media/platform/allegro-dvt/allegro-mail.c
@@ -16,7 +16,7 @@
 
 const char *msg_type_name(enum mcu_msg_type type)
 {
-	static char buf[9];
+	static char buf[13];
 
 	switch (type) {
 	case MCU_MSG_TYPE_INIT:
-- 
2.40.1

