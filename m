Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 814566E2214
	for <lists+linux-media@lfdr.de>; Fri, 14 Apr 2023 13:28:04 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230188AbjDNL2C (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 14 Apr 2023 07:28:02 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58654 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230209AbjDNL2A (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 14 Apr 2023 07:28:00 -0400
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6434593C9
        for <linux-media@vger.kernel.org>; Fri, 14 Apr 2023 04:27:58 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id B7833646E1
        for <linux-media@vger.kernel.org>; Fri, 14 Apr 2023 11:27:57 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 910B0C4339C;
        Fri, 14 Apr 2023 11:27:56 +0000 (UTC)
From:   Hans Verkuil <hverkuil-cisco@xs4all.nl>
To:     linux-media@vger.kernel.org
Cc:     Hans Verkuil <hverkuil-cisco@xs4all.nl>
Subject: [PATCHv3 12/18] media: common: saa7146: check minimum video format size
Date:   Fri, 14 Apr 2023 13:27:36 +0200
Message-Id: <20230414112742.27749-13-hverkuil-cisco@xs4all.nl>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230414112742.27749-1-hverkuil-cisco@xs4all.nl>
References: <20230414112742.27749-1-hverkuil-cisco@xs4all.nl>
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

There was no check for the minimum width and height, so
0 values were just passed on. Fix this.

Signed-off-by: Hans Verkuil <hverkuil-cisco@xs4all.nl>
---
 drivers/media/common/saa7146/saa7146_video.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/drivers/media/common/saa7146/saa7146_video.c b/drivers/media/common/saa7146/saa7146_video.c
index 8306860e9e8a..65045f7aa28d 100644
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

