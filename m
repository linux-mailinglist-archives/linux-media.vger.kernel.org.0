Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id E1B1A58EB90
	for <lists+linux-media@lfdr.de>; Wed, 10 Aug 2022 13:55:05 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232067AbiHJLy4 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 10 Aug 2022 07:54:56 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51558 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231788AbiHJLyz (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 10 Aug 2022 07:54:55 -0400
Received: from ams.source.kernel.org (ams.source.kernel.org [IPv6:2604:1380:4601:e00::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 92BE57FE73
        for <linux-media@vger.kernel.org>; Wed, 10 Aug 2022 04:54:53 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ams.source.kernel.org (Postfix) with ESMTPS id 49724B81C0E
        for <linux-media@vger.kernel.org>; Wed, 10 Aug 2022 11:54:52 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3509DC433C1;
        Wed, 10 Aug 2022 11:54:50 +0000 (UTC)
From:   Hans Verkuil <hverkuil-cisco@xs4all.nl>
To:     linux-media@vger.kernel.org
Cc:     Corentin Labbe <clabbe@baylibre.com>,
        Hans Verkuil <hverkuil-cisco@xs4all.nl>
Subject: [PATCH 2/4] zoran: the video device is video capture only, not M2M
Date:   Wed, 10 Aug 2022 13:54:43 +0200
Message-Id: <20220810115445.2302477-3-hverkuil-cisco@xs4all.nl>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220810115445.2302477-1-hverkuil-cisco@xs4all.nl>
References: <20220810115445.2302477-1-hverkuil-cisco@xs4all.nl>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-6.7 required=5.0 tests=BAYES_00,
        HEADER_FROM_DIFFERENT_DOMAINS,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_PASS,
        T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Set vfl_dir correctly as a capture device instead of as
a M2M device.

Signed-off-by: Hans Verkuil <hverkuil-cisco@xs4all.nl>
---
 drivers/staging/media/zoran/zoran_card.c | 7 +------
 1 file changed, 1 insertion(+), 6 deletions(-)

diff --git a/drivers/staging/media/zoran/zoran_card.c b/drivers/staging/media/zoran/zoran_card.c
index 869aabde3bef..3975fc1b2ee3 100644
--- a/drivers/staging/media/zoran/zoran_card.c
+++ b/drivers/staging/media/zoran/zoran_card.c
@@ -876,12 +876,7 @@ static int zoran_init_video_device(struct zoran *zr, struct video_device *video_
 	video_dev->device_caps = V4L2_CAP_STREAMING | dir;
 
 	strscpy(video_dev->name, ZR_DEVNAME(zr), sizeof(video_dev->name));
-	/*
-	 * It's not a mem2mem device, but you can both capture and output from one and the same
-	 * device. This should really be split up into two device nodes, but that's a job for
-	 * another day.
-	 */
-	video_dev->vfl_dir = VFL_DIR_M2M;
+	video_dev->vfl_dir = VFL_DIR_RX;
 	zoran_queue_init(zr, &zr->vq, V4L2_BUF_TYPE_VIDEO_CAPTURE);
 
 	err = video_register_device(video_dev, VFL_TYPE_VIDEO, video_nr[zr->id]);
-- 
2.35.1

