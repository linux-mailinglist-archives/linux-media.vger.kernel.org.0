Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 844A87AC322
	for <lists+linux-media@lfdr.de>; Sat, 23 Sep 2023 17:21:25 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231948AbjIWPV3 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sat, 23 Sep 2023 11:21:29 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52492 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231949AbjIWPV2 (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Sat, 23 Sep 2023 11:21:28 -0400
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 139D819A
        for <linux-media@vger.kernel.org>; Sat, 23 Sep 2023 08:21:22 -0700 (PDT)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id F28F6C433C8;
        Sat, 23 Sep 2023 15:21:20 +0000 (UTC)
From:   Hans Verkuil <hverkuil-cisco@xs4all.nl>
To:     linux-media@vger.kernel.org
Cc:     Arnd Bergmann <arnd@kernel.org>,
        Hans Verkuil <hverkuil-cisco@xs4all.nl>
Subject: [PATCHv2 08/23] media: cec.h: increase input_phys buffer
Date:   Sat, 23 Sep 2023 17:20:52 +0200
Message-Id: <20230923152107.283289-9-hverkuil-cisco@xs4all.nl>
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

drivers/media/cec/core/cec-core.c: In function 'cec_allocate_adapter':
drivers/media/cec/core/cec-core.c:317:21: warning: '/input0' directive output may be truncated writing 7 bytes into a region of size between 1 and 32 [-Wformat-truncation=]
  317 |                  "%s/input0", adap->name);
      |                     ^~~~~~~
drivers/media/cec/core/cec-core.c:316:9: note: 'snprintf' output between 8 and 39 bytes into a destination of size 32
  316 |         snprintf(adap->input_phys, sizeof(adap->input_phys),
      |         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
  317 |                  "%s/input0", adap->name);
      |                  ~~~~~~~~~~~~~~~~~~~~~~~~

Signed-off-by: Hans Verkuil <hverkuil-cisco@xs4all.nl>
---
 include/media/cec.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/include/media/cec.h b/include/media/cec.h
index 9c007f83569a..53e4b2eb2b26 100644
--- a/include/media/cec.h
+++ b/include/media/cec.h
@@ -275,7 +275,7 @@ struct cec_adapter {
 
 	u32 sequence;
 
-	char input_phys[32];
+	char input_phys[40];
 };
 
 static inline void *cec_get_drvdata(const struct cec_adapter *adap)
-- 
2.40.1

