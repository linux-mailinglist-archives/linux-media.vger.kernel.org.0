Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 822D3601182
	for <lists+linux-media@lfdr.de>; Mon, 17 Oct 2022 16:49:31 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229956AbiJQOt3 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 17 Oct 2022 10:49:29 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46610 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229942AbiJQOtZ (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 17 Oct 2022 10:49:25 -0400
Received: from ams.source.kernel.org (ams.source.kernel.org [IPv6:2604:1380:4601:e00::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 127571093
        for <linux-media@vger.kernel.org>; Mon, 17 Oct 2022 07:49:24 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ams.source.kernel.org (Postfix) with ESMTPS id 598ADB818FC
        for <linux-media@vger.kernel.org>; Mon, 17 Oct 2022 14:49:22 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8C089C433B5;
        Mon, 17 Oct 2022 14:49:20 +0000 (UTC)
From:   Hans Verkuil <hverkuil-cisco@xs4all.nl>
To:     linux-media@vger.kernel.org
Cc:     Hans Verkuil <hverkuil-cisco@xs4all.nl>
Subject: [PATCH 3/3] vivid.rst: loop_video is set on the capture devnode
Date:   Mon, 17 Oct 2022 16:49:16 +0200
Message-Id: <20221017144916.489388-4-hverkuil-cisco@xs4all.nl>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20221017144916.489388-1-hverkuil-cisco@xs4all.nl>
References: <20221017144916.489388-1-hverkuil-cisco@xs4all.nl>
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

The example on how to use and test Capture Overlay specified
the wrong video device node. Back in 2015 the loop_video control
moved from the output device to the capture device, but this
example code is still referring to the output video device.

Signed-off-by: Hans Verkuil <hverkuil-cisco@xs4all.nl>
---
 Documentation/admin-guide/media/vivid.rst | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/Documentation/admin-guide/media/vivid.rst b/Documentation/admin-guide/media/vivid.rst
index 4f680dc9661c..abd90ed31090 100644
--- a/Documentation/admin-guide/media/vivid.rst
+++ b/Documentation/admin-guide/media/vivid.rst
@@ -1318,7 +1318,7 @@ instance. This setup would require the following commands:
 	$ v4l2-ctl -d2 -i2
 	$ v4l2-ctl -d2 -c horizontal_movement=4
 	$ v4l2-ctl -d1 --overlay=1
-	$ v4l2-ctl -d1 -c loop_video=1
+	$ v4l2-ctl -d0 -c loop_video=1
 	$ v4l2-ctl -d2 --stream-mmap --overlay=1
 
 And from another console:
-- 
2.35.1

