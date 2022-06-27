Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 8345B55D53F
	for <lists+linux-media@lfdr.de>; Tue, 28 Jun 2022 15:15:08 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235930AbiF0ROg (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 27 Jun 2022 13:14:36 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36072 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235780AbiF0ROg (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 27 Jun 2022 13:14:36 -0400
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [IPv6:2001:4b98:dc2:55:216:3eff:fef7:d647])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CD6DCC0D
        for <linux-media@vger.kernel.org>; Mon, 27 Jun 2022 10:14:34 -0700 (PDT)
Received: from perceval.ideasonboard.com (unknown [IPv6:2401:4900:1f3f:ca21:e286:106b:5da4:9482])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 512CE1C90;
        Mon, 27 Jun 2022 19:14:31 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1656350072;
        bh=lxGCesPrx1tJXiDF11Vc/Xjjt4PDmc/IRZXPx+Ok/Ew=;
        h=From:To:Cc:Subject:Date:From;
        b=lON1/w/qTtyyaLklCNCa2HGx/sc6uL0Gvyr4sz7H3c2ja6XlYdmYmPV4fcTfLRr/w
         LYCM4kKaz+XqhIITiBwKa13T3uY/ag+BnjLL9nUscyVPAnXDYgyLQoW1gR4NXRle0H
         yeXqKojUme9ihGnGBMw6TdyQYjPjSra9dN/sFDWo=
From:   Umang Jain <umang.jain@ideasonboard.com>
To:     linux-media@vger.kernel.org
Cc:     Umang Jain <umang.jain@ideasonboard.com>
Subject: [PATCH] v4l2-ctl: Fix typo in --list-patterns help text
Date:   Mon, 27 Jun 2022 22:44:18 +0530
Message-Id: <20220627171418.43854-1-umang.jain@ideasonboard.com>
X-Mailer: git-send-email 2.31.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_PASS,SPF_PASS,
        T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

s/stream-pattern/stream-out-pattern/

Signed-off-by: Umang Jain <umang.jain@ideasonboard.com>
---
 utils/v4l2-ctl/v4l2-ctl-streaming.cpp | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/utils/v4l2-ctl/v4l2-ctl-streaming.cpp b/utils/v4l2-ctl/v4l2-ctl-streaming.cpp
index 7f6482d6..05de44d7 100644
--- a/utils/v4l2-ctl/v4l2-ctl-streaming.cpp
+++ b/utils/v4l2-ctl/v4l2-ctl-streaming.cpp
@@ -330,7 +330,7 @@ void streaming_usage()
 	       "  --stream-out-dmabuf\n"
 	       "                     output video using dmabuf [VIDIOC_(D)QBUF]\n"
 	       "                     Requires a corresponding --stream-mmap option.\n"
-	       "  --list-patterns    list available patterns for use with --stream-pattern.\n"
+	       "  --list-patterns    list available patterns for use with --stream-out-pattern.\n"
 	       "  --list-buffers     list all video buffers [VIDIOC_QUERYBUF]\n"
 	       "  --list-buffers-out list all video output buffers [VIDIOC_QUERYBUF]\n"
 	       "  --list-buffers-vbi list all VBI buffers [VIDIOC_QUERYBUF]\n"
-- 
2.31.1

