Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 472617AAFF8
	for <lists+linux-media@lfdr.de>; Fri, 22 Sep 2023 12:51:30 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233569AbjIVKvB (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 22 Sep 2023 06:51:01 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48990 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233467AbjIVKut (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 22 Sep 2023 06:50:49 -0400
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 84728C2
        for <linux-media@vger.kernel.org>; Fri, 22 Sep 2023 03:50:43 -0700 (PDT)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 35EDBC433C9;
        Fri, 22 Sep 2023 10:50:42 +0000 (UTC)
From:   Hans Verkuil <hverkuil-cisco@xs4all.nl>
To:     linux-media@vger.kernel.org
Cc:     Arnd Bergmann <arnd@kernel.org>,
        Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        Hans de Goede <hdegoede@redhat.com>
Subject: [PATCH 3/7] media: atomisp: ia_ccs_debug.c: increase enable_info buffer
Date:   Fri, 22 Sep 2023 12:50:32 +0200
Message-Id: <20230922105036.3148784-4-hverkuil-cisco@xs4all.nl>
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

Fixes these compiler warnings:

drivers/staging/media/atomisp/pci/runtime/debug/src/ia_css_debug.c: In function 'ia_css_debug_pipe_graph_dump_stage':
drivers/staging/media/atomisp/pci/runtime/debug/src/ia_css_debug.c:2786:66: warning: '\n' directive output may be truncated writing 2 bytes into a region of size between 0 and 198 [-Wformat-truncation=]
 2786 |                                                          "%s\\n%s\\n%s",
      |                                                                  ^~~
drivers/staging/media/atomisp/pci/runtime/debug/src/ia_css_debug.c:2785:49: note: 'snprintf' output between 5 and 302 bytes into a destination of size 200
 2785 |                                                 snprintf(enable_info, sizeof(enable_info),
      |                                                 ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
 2786 |                                                          "%s\\n%s\\n%s",
      |                                                          ~~~~~~~~~~~~~~~
 2787 |                                                          enable_info1, enable_info2,
      |                                                          ~~~~~~~~~~~~~~~~~~~~~~~~~~~
 2788 |                                                          enable_info3);
      |                                                          ~~~~~~~~~~~~~
drivers/staging/media/atomisp/pci/runtime/debug/src/ia_css_debug.c:2772:66: warning: '\n' directive output may be truncated writing 2 bytes into a region of size between 0 and 198 [-Wformat-truncation=]
 2772 |                                                          "%s\\n%s\\n%s",
      |                                                                  ^~~
drivers/staging/media/atomisp/pci/runtime/debug/src/ia_css_debug.c:2771:49: note: 'snprintf' output between 5 and 302 bytes into a destination of size 200
 2771 |                                                 snprintf(enable_info, sizeof(enable_info),
      |                                                 ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
 2772 |                                                          "%s\\n%s\\n%s",
      |                                                          ~~~~~~~~~~~~~~~
 2773 |                                                          enable_info1, enable_info2,
      |                                                          ~~~~~~~~~~~~~~~~~~~~~~~~~~~
 2774 |                                                          enable_info3);
      |                                                          ~~~~~~~~~~~~~
drivers/staging/media/atomisp/pci/runtime/debug/src/ia_css_debug.c:2749:92: warning: 'snprintf' output may be truncated before the last format character [-Wformat-truncation=]
 2749 |                                         snprintf(enable_info, sizeof(enable_info), "%s\\n%s",
      |                                                                                            ^
drivers/staging/media/atomisp/pci/runtime/debug/src/ia_css_debug.c:2749:41: note: 'snprintf' output between 3 and 201 bytes into a destination of size 200
 2749 |                                         snprintf(enable_info, sizeof(enable_info), "%s\\n%s",
      |                                         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
 2750 |                                                  enable_info1, enable_info2);
      |                                                  ~~~~~~~~~~~~~~~~~~~~~~~~~~~

Signed-off-by: Hans Verkuil <hverkuil-cisco@xs4all.nl>
Cc: Hans de Goede <hdegoede@redhat.com>
---
 .../staging/media/atomisp/pci/runtime/debug/src/ia_css_debug.c  | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/staging/media/atomisp/pci/runtime/debug/src/ia_css_debug.c b/drivers/staging/media/atomisp/pci/runtime/debug/src/ia_css_debug.c
index bb6204cb42c5..8b0251073f93 100644
--- a/drivers/staging/media/atomisp/pci/runtime/debug/src/ia_css_debug.c
+++ b/drivers/staging/media/atomisp/pci/runtime/debug/src/ia_css_debug.c
@@ -2673,7 +2673,7 @@ ia_css_debug_pipe_graph_dump_stage(
 		char enable_info1[100];
 		char enable_info2[100];
 		char enable_info3[100];
-		char enable_info[200];
+		char enable_info[302];
 		struct ia_css_binary_info *bi = stage->binary_info;
 
 		/* Split it in 2 function-calls to keep the amount of
-- 
2.40.1

