Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 862D27AC321
	for <lists+linux-media@lfdr.de>; Sat, 23 Sep 2023 17:21:23 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231908AbjIWPV2 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sat, 23 Sep 2023 11:21:28 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52444 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231939AbjIWPV0 (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Sat, 23 Sep 2023 11:21:26 -0400
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id DECA2192
        for <linux-media@vger.kernel.org>; Sat, 23 Sep 2023 08:21:20 -0700 (PDT)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 78F9FC433CB;
        Sat, 23 Sep 2023 15:21:19 +0000 (UTC)
From:   Hans Verkuil <hverkuil-cisco@xs4all.nl>
To:     linux-media@vger.kernel.org
Cc:     Arnd Bergmann <arnd@kernel.org>,
        Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        Sean Young <sean@mess.org>, Arnd Bergmann <arnd@arndb.de>
Subject: [PATCHv2 07/23] media: rc: ati_remote: increase mouse_name buffer size
Date:   Sat, 23 Sep 2023 17:20:51 +0200
Message-Id: <20230923152107.283289-8-hverkuil-cisco@xs4all.nl>
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
Reviewed-by: Sean Young <sean@mess.org>
Acked-by: Arnd Bergmann <arnd@arndb.de>
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

