Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 4D55C6A8322
	for <lists+linux-media@lfdr.de>; Thu,  2 Mar 2023 14:03:46 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229936AbjCBNDp (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 2 Mar 2023 08:03:45 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34754 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229923AbjCBNDo (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Thu, 2 Mar 2023 08:03:44 -0500
Received: from dfw.source.kernel.org (dfw.source.kernel.org [IPv6:2604:1380:4641:c500::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3A4F81DBAB
        for <linux-media@vger.kernel.org>; Thu,  2 Mar 2023 05:03:43 -0800 (PST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id C6E32615D1
        for <linux-media@vger.kernel.org>; Thu,  2 Mar 2023 13:03:42 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8BE9FC433D2;
        Thu,  2 Mar 2023 13:03:41 +0000 (UTC)
From:   Hans Verkuil <hverkuil-cisco@xs4all.nl>
To:     linux-media@vger.kernel.org
Cc:     Hans Verkuil <hverkuil-cisco@xs4all.nl>
Subject: [PATCH 09/17] media: common: saa7146: check minimum video format size
Date:   Thu,  2 Mar 2023 14:03:22 +0100
Message-Id: <20230302130330.1125172-10-hverkuil-cisco@xs4all.nl>
X-Mailer: git-send-email 2.39.1
In-Reply-To: <20230302130330.1125172-1-hverkuil-cisco@xs4all.nl>
References: <20230302130330.1125172-1-hverkuil-cisco@xs4all.nl>
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

There was no check for the minimum width and height, so
0 values were just passed on. Fix this.

Signed-off-by: Hans Verkuil <hverkuil-cisco@xs4all.nl>
---
 drivers/media/common/saa7146/saa7146_video.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/drivers/media/common/saa7146/saa7146_video.c b/drivers/media/common/saa7146/saa7146_video.c
index 592a4c6da103..6d8da22dd321 100644
--- a/drivers/media/common/saa7146/saa7146_video.c
+++ b/drivers/media/common/saa7146/saa7146_video.c
@@ -397,6 +397,10 @@ static int vidioc_try_fmt_vid_cap(struct file *file, void *fh, struct v4l2_forma
 
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
2.39.1

