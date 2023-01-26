Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id A4AEF67CF40
	for <lists+linux-media@lfdr.de>; Thu, 26 Jan 2023 16:07:31 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232305AbjAZPH3 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 26 Jan 2023 10:07:29 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41156 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232032AbjAZPHT (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 26 Jan 2023 10:07:19 -0500
Received: from ams.source.kernel.org (ams.source.kernel.org [IPv6:2604:1380:4601:e00::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C871B6BBD7
        for <linux-media@vger.kernel.org>; Thu, 26 Jan 2023 07:07:16 -0800 (PST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ams.source.kernel.org (Postfix) with ESMTPS id 8B082B818D3
        for <linux-media@vger.kernel.org>; Thu, 26 Jan 2023 15:07:15 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 886CAC4339B;
        Thu, 26 Jan 2023 15:07:13 +0000 (UTC)
From:   Hans Verkuil <hverkuil-cisco@xs4all.nl>
To:     linux-media@vger.kernel.org
Cc:     Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        "Lad, Prabhakar" <prabhakar.csengg@gmail.com>
Subject: [PATCH 12/17] media: ti: davinci: vpbe_display.c: return 0 instead of 'ret'.
Date:   Thu, 26 Jan 2023 16:06:52 +0100
Message-Id: <20230126150657.367921-13-hverkuil-cisco@xs4all.nl>
X-Mailer: git-send-email 2.39.0
In-Reply-To: <20230126150657.367921-1-hverkuil-cisco@xs4all.nl>
References: <20230126150657.367921-1-hverkuil-cisco@xs4all.nl>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-6.7 required=5.0 tests=BAYES_00,
        HEADER_FROM_DIFFERENT_DOMAINS,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_PASS
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Since 'ret' is known to be 0, just return '0'. This fixes a smatch warning:

vpbe_display.c:1152 vpbe_display_open() warn: missing error code? 'err'

Signed-off-by: Hans Verkuil <hverkuil-cisco@xs4all.nl>
Cc: "Lad, Prabhakar" <prabhakar.csengg@gmail.com>
---
 drivers/media/platform/ti/davinci/vpbe_display.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/media/platform/ti/davinci/vpbe_display.c b/drivers/media/platform/ti/davinci/vpbe_display.c
index 9ea70817538e..ea2d0795d1e2 100644
--- a/drivers/media/platform/ti/davinci/vpbe_display.c
+++ b/drivers/media/platform/ti/davinci/vpbe_display.c
@@ -1149,7 +1149,7 @@ static int vpbe_display_open(struct file *file)
 
 	/* leaving if layer is already initialized */
 	if (!v4l2_fh_is_singular_file(file))
-		return err;
+		return 0;
 
 	if (!layer->usrs) {
 		if (mutex_lock_interruptible(&layer->opslock))
-- 
2.39.0

