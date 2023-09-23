Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 5B0E77AC320
	for <lists+linux-media@lfdr.de>; Sat, 23 Sep 2023 17:21:22 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231934AbjIWPV0 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sat, 23 Sep 2023 11:21:26 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52412 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231908AbjIWPVZ (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Sat, 23 Sep 2023 11:21:25 -0400
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7D8A3192
        for <linux-media@vger.kernel.org>; Sat, 23 Sep 2023 08:21:19 -0700 (PDT)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 27A5CC433D9;
        Sat, 23 Sep 2023 15:21:17 +0000 (UTC)
From:   Hans Verkuil <hverkuil-cisco@xs4all.nl>
To:     linux-media@vger.kernel.org
Cc:     Arnd Bergmann <arnd@kernel.org>,
        Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        Arnd Bergmann <arnd@arndb.de>
Subject: [PATCHv2 06/23] media: cx18: increase in_workq_name size
Date:   Sat, 23 Sep 2023 17:20:50 +0200
Message-Id: <20230923152107.283289-7-hverkuil-cisco@xs4all.nl>
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

drivers/media/pci/cx18/cx18-driver.c: In function 'cx18_init_struct1':
drivers/media/pci/cx18/cx18-driver.c:688:65: warning: '%s' directive output may be truncated writing up to 35 bytes into a region of size 11 [-Wformat-truncation=]
  688 |         snprintf(cx->in_workq_name, sizeof(cx->in_workq_name), "%s-in",
      |                                                                 ^~
In function 'cx18_create_in_workq',
    inlined from 'cx18_init_struct1' at drivers/media/pci/cx18/cx18-driver.c:724:8:
drivers/media/pci/cx18/cx18-driver.c:688:9: note: 'snprintf' output between 4 and 39 bytes into a destination of size 11
  688 |         snprintf(cx->in_workq_name, sizeof(cx->in_workq_name), "%s-in",
      |         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
  689 |                  cx->v4l2_dev.name);
      |                  ~~~~~~~~~~~~~~~~~~

Signed-off-by: Hans Verkuil <hverkuil-cisco@xs4all.nl>
Acked-by: Arnd Bergmann <arnd@arndb.de>
---
 drivers/media/pci/cx18/cx18-driver.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/media/pci/cx18/cx18-driver.h b/drivers/media/pci/cx18/cx18-driver.h
index 887d2aa36447..af05bde75816 100644
--- a/drivers/media/pci/cx18/cx18-driver.h
+++ b/drivers/media/pci/cx18/cx18-driver.h
@@ -631,7 +631,7 @@ struct cx18 {
 	u32 hw2_irq_mask;
 
 	struct workqueue_struct *in_work_queue;
-	char in_workq_name[11]; /* "cx18-NN-in" */
+	char in_workq_name[39]; /* "cx18-NN-in" */
 	struct cx18_in_work_order in_work_order[CX18_MAX_IN_WORK_ORDERS];
 	char epu_debug_str[256]; /* CX18_EPU_DEBUG is rare: use shared space */
 
-- 
2.40.1

