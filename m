Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 3D0FB6C6CA8
	for <lists+linux-media@lfdr.de>; Thu, 23 Mar 2023 16:54:20 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232222AbjCWPyS (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 23 Mar 2023 11:54:18 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37138 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232206AbjCWPyL (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 23 Mar 2023 11:54:11 -0400
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4B65D1EFD9
        for <linux-media@vger.kernel.org>; Thu, 23 Mar 2023 08:54:00 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ams.source.kernel.org (Postfix) with ESMTPS id E046AB821A2
        for <linux-media@vger.kernel.org>; Thu, 23 Mar 2023 15:53:58 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 20AEFC4339B;
        Thu, 23 Mar 2023 15:53:56 +0000 (UTC)
From:   Hans Verkuil <hverkuil-cisco@xs4all.nl>
To:     linux-media@vger.kernel.org
Cc:     Hans Verkuil <hverkuil-cisco@xs4all.nl>
Subject: [PATCHv2 12/19] media: common: saa7146: check minimum video format size
Date:   Thu, 23 Mar 2023 16:53:36 +0100
Message-Id: <20230323155343.2399473-13-hverkuil-cisco@xs4all.nl>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230323155343.2399473-1-hverkuil-cisco@xs4all.nl>
References: <20230323155343.2399473-1-hverkuil-cisco@xs4all.nl>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-4.8 required=5.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
        RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_PASS autolearn=unavailable
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

There was no check for the minimum width and height, so
0 values were just passed on. Fix this.

Signed-off-by: Hans Verkuil <hverkuil-cisco@xs4all.nl>
---
 drivers/media/common/saa7146/saa7146_video.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/drivers/media/common/saa7146/saa7146_video.c b/drivers/media/common/saa7146/saa7146_video.c
index 5a472eb99368..e698b4470db3 100644
--- a/drivers/media/common/saa7146/saa7146_video.c
+++ b/drivers/media/common/saa7146/saa7146_video.c
@@ -392,6 +392,10 @@ static int vidioc_try_fmt_vid_cap(struct file *file, void *fh, struct v4l2_forma
 
 	f->fmt.pix.field = field;
 	f->fmt.pix.colorspace = V4L2_COLORSPACE_SMPTE170M;
+	if (f->fmt.pix.width < 48)
+		f->fmt.pix.width = 48;
+	if (f->fmt.pix.height < 32)
+		f->fmt.pix.height = 32;
 	if (f->fmt.pix.width > maxw)
 		f->fmt.pix.width = maxw;
 	if (f->fmt.pix.height > maxh)
-- 
2.39.2

