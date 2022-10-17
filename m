Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 444B160117F
	for <lists+linux-media@lfdr.de>; Mon, 17 Oct 2022 16:49:26 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229669AbiJQOtY (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 17 Oct 2022 10:49:24 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46368 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229727AbiJQOtW (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 17 Oct 2022 10:49:22 -0400
Received: from dfw.source.kernel.org (dfw.source.kernel.org [IPv6:2604:1380:4641:c500::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E2797B72
        for <linux-media@vger.kernel.org>; Mon, 17 Oct 2022 07:49:20 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id B658560F8B
        for <linux-media@vger.kernel.org>; Mon, 17 Oct 2022 14:49:19 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8E0A5C433D7;
        Mon, 17 Oct 2022 14:49:18 +0000 (UTC)
From:   Hans Verkuil <hverkuil-cisco@xs4all.nl>
To:     linux-media@vger.kernel.org
Cc:     Hans Verkuil <hverkuil-cisco@xs4all.nl>
Subject: [PATCH 1/3] vivid: drop GFP_DMA32
Date:   Mon, 17 Oct 2022 16:49:14 +0200
Message-Id: <20221017144916.489388-2-hverkuil-cisco@xs4all.nl>
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

From what I can see, this is not needed. And since using it issues a 'deprecated'
warning, just drop it.

Signed-off-by: Hans Verkuil <hverkuil-cisco@xs4all.nl>
---
 drivers/media/test-drivers/vivid/vivid-osd.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/media/test-drivers/vivid/vivid-osd.c b/drivers/media/test-drivers/vivid/vivid-osd.c
index fbaec8acc161..ec25edc679b3 100644
--- a/drivers/media/test-drivers/vivid/vivid-osd.c
+++ b/drivers/media/test-drivers/vivid/vivid-osd.c
@@ -357,7 +357,7 @@ int vivid_fb_init(struct vivid_dev *dev)
 	int ret;
 
 	dev->video_buffer_size = MAX_OSD_HEIGHT * MAX_OSD_WIDTH * 2;
-	dev->video_vbase = kzalloc(dev->video_buffer_size, GFP_KERNEL | GFP_DMA32);
+	dev->video_vbase = kzalloc(dev->video_buffer_size, GFP_KERNEL);
 	if (dev->video_vbase == NULL)
 		return -ENOMEM;
 	dev->video_pbase = virt_to_phys(dev->video_vbase);
-- 
2.35.1

