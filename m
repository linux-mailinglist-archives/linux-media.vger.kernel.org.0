Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 3A24F6C6C9F
	for <lists+linux-media@lfdr.de>; Thu, 23 Mar 2023 16:54:10 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232196AbjCWPyJ (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 23 Mar 2023 11:54:09 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36708 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232197AbjCWPyC (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 23 Mar 2023 11:54:02 -0400
Received: from dfw.source.kernel.org (dfw.source.kernel.org [IPv6:2604:1380:4641:c500::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3C87920D3B
        for <linux-media@vger.kernel.org>; Thu, 23 Mar 2023 08:53:48 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id 5C8BF627C7
        for <linux-media@vger.kernel.org>; Thu, 23 Mar 2023 15:53:47 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 36EB6C4339B;
        Thu, 23 Mar 2023 15:53:46 +0000 (UTC)
From:   Hans Verkuil <hverkuil-cisco@xs4all.nl>
To:     linux-media@vger.kernel.org
Cc:     Hans Verkuil <hverkuil-cisco@xs4all.nl>
Subject: [PATCHv2 01/19] media: common: saa7146: disable clipping
Date:   Thu, 23 Mar 2023 16:53:25 +0100
Message-Id: <20230323155343.2399473-2-hverkuil-cisco@xs4all.nl>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230323155343.2399473-1-hverkuil-cisco@xs4all.nl>
References: <20230323155343.2399473-1-hverkuil-cisco@xs4all.nl>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.0 required=5.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
        RCVD_IN_DNSWL_MED,SPF_HELO_NONE,SPF_PASS autolearn=unavailable
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

The patch removing overlay support also removed the old
saa7146_disable_clipping() function, but that is needed in order
to capture video. Without this the Hexium cards won't show any
video.

Signed-off-by: Hans Verkuil <hverkuil-cisco@xs4all.nl>
Fixes: 7777694f8066 ("media: saa7146: drop overlay support")
---
 drivers/media/common/saa7146/saa7146_hlp.c | 17 +++++++++++++++++
 1 file changed, 17 insertions(+)

diff --git a/drivers/media/common/saa7146/saa7146_hlp.c b/drivers/media/common/saa7146/saa7146_hlp.c
index 6792a96d0ba3..eab58bfbc8a8 100644
--- a/drivers/media/common/saa7146/saa7146_hlp.c
+++ b/drivers/media/common/saa7146/saa7146_hlp.c
@@ -699,6 +699,22 @@ static void program_capture_engine(struct saa7146_dev *dev, int planar)
 	WRITE_RPS0(CMD_STOP);
 }
 
+/* disable clipping */
+static void saa7146_disable_clipping(struct saa7146_dev *dev)
+{
+	u32 clip_format	= saa7146_read(dev, CLIP_FORMAT_CTRL);
+
+	/* mask out relevant bits (=lower word)*/
+	clip_format &= MASK_W1;
+
+	/* upload clipping-registers*/
+	saa7146_write(dev, CLIP_FORMAT_CTRL,clip_format);
+	saa7146_write(dev, MC2, (MASK_05 | MASK_21));
+
+	/* disable video dma2 */
+	saa7146_write(dev, MC1, MASK_21);
+}
+
 void saa7146_set_capture(struct saa7146_dev *dev, struct saa7146_buf *buf, struct saa7146_buf *next)
 {
 	struct saa7146_format *sfmt = saa7146_format_by_fourcc(dev,buf->fmt->pixelformat);
@@ -716,6 +732,7 @@ void saa7146_set_capture(struct saa7146_dev *dev, struct saa7146_buf *buf, struc
 
 	saa7146_set_window(dev, buf->fmt->width, buf->fmt->height, buf->fmt->field);
 	saa7146_set_output_format(dev, sfmt->trans);
+	saa7146_disable_clipping(dev);
 
 	if ( vv->last_field == V4L2_FIELD_INTERLACED ) {
 	} else if ( vv->last_field == V4L2_FIELD_TOP ) {
-- 
2.39.2

