Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 2A2946F2C4A
	for <lists+linux-media@lfdr.de>; Mon,  1 May 2023 04:59:19 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232269AbjEAC7R (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sun, 30 Apr 2023 22:59:17 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49464 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232267AbjEAC6s (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Sun, 30 Apr 2023 22:58:48 -0400
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id DE4561715;
        Sun, 30 Apr 2023 19:58:21 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id 797A360ED1;
        Mon,  1 May 2023 02:57:50 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0A289C433D2;
        Mon,  1 May 2023 02:57:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1682909869;
        bh=F3Wiov1pCS4WKo5KfIAZ+ApsN7GR7v4FG6BtkmgA1Zk=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=ZpMPyCq09vDkYfYG4DI1nHZIRK2sN7BJaBili1iiu0ZVNoKN7+rLM3TDhW0jCAsFQ
         haQotsXVQYpaoKZCxfCUK0TzY9i2+2WG5N/ShXvGkisHG2WzhuwuphcGANLglPHcKe
         NcuSF2Lu4nkpoRwaOklntpzGItEVTgI7CDex1covyKhFMTNUe2dD5HCX+mQYcZDhmJ
         37c/ncmYrPD8Y4eZ1/J/HZXee3TFyzpYw8Lysseytk4RFYZ5AcZ1QUx/OmPerOdfRg
         RH5/NQjgoRrOtzNW8beuOG/LrFWbpGOwmPmghsqP0zDz21dVUvsUZzoHE5/eikumaF
         UHLzuW7qxjKaA==
From:   Sasha Levin <sashal@kernel.org>
To:     linux-kernel@vger.kernel.org, stable@vger.kernel.org
Cc:     harperchen <harperchen1110@gmail.com>,
        Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Sasha Levin <sashal@kernel.org>, daniel.lee.kruse@proton.me,
        linux-media@vger.kernel.org
Subject: [PATCH AUTOSEL 6.3 14/44] media: cx23885: Fix a null-ptr-deref bug in buffer_prepare() and buffer_finish()
Date:   Sun, 30 Apr 2023 22:56:02 -0400
Message-Id: <20230501025632.3253067-14-sashal@kernel.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230501025632.3253067-1-sashal@kernel.org>
References: <20230501025632.3253067-1-sashal@kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-7.3 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

From: harperchen <harperchen1110@gmail.com>

[ Upstream commit 47e8b73bc35d7c54642f78e498697692f6358996 ]

When the driver calls cx23885_risc_buffer() to prepare the buffer, the
function call dma_alloc_coherent may fail, resulting in a empty buffer
risc->cpu. Later when we free the buffer or access the buffer, null ptr
deref is triggered.

This bug is similar to the following one:
https://git.linuxtv.org/media_stage.git/commit/?id=2b064d91440b33fba5b452f2d1b31f13ae911d71.

We believe the bug can be also dynamically triggered from user side.
Similarly, we fix this by checking the return value of cx23885_risc_buffer()
and the value of risc->cpu before buffer free.

Signed-off-by: harperchen <harperchen1110@gmail.com>
Signed-off-by: Hans Verkuil <hverkuil-cisco@xs4all.nl>
Signed-off-by: Mauro Carvalho Chehab <mchehab@kernel.org>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 drivers/media/pci/cx23885/cx23885-core.c  |  4 +++-
 drivers/media/pci/cx23885/cx23885-video.c | 13 +++++++------
 2 files changed, 10 insertions(+), 7 deletions(-)

diff --git a/drivers/media/pci/cx23885/cx23885-core.c b/drivers/media/pci/cx23885/cx23885-core.c
index 9232a966bcabb..2ce2914576cf2 100644
--- a/drivers/media/pci/cx23885/cx23885-core.c
+++ b/drivers/media/pci/cx23885/cx23885-core.c
@@ -1325,7 +1325,9 @@ void cx23885_free_buffer(struct cx23885_dev *dev, struct cx23885_buffer *buf)
 {
 	struct cx23885_riscmem *risc = &buf->risc;
 
-	dma_free_coherent(&dev->pci->dev, risc->size, risc->cpu, risc->dma);
+	if (risc->cpu)
+		dma_free_coherent(&dev->pci->dev, risc->size, risc->cpu, risc->dma);
+	memset(risc, 0, sizeof(*risc));
 }
 
 static void cx23885_tsport_reg_dump(struct cx23885_tsport *port)
diff --git a/drivers/media/pci/cx23885/cx23885-video.c b/drivers/media/pci/cx23885/cx23885-video.c
index 3d03f5e95786a..671fc0588e431 100644
--- a/drivers/media/pci/cx23885/cx23885-video.c
+++ b/drivers/media/pci/cx23885/cx23885-video.c
@@ -342,6 +342,7 @@ static int queue_setup(struct vb2_queue *q,
 
 static int buffer_prepare(struct vb2_buffer *vb)
 {
+	int ret;
 	struct vb2_v4l2_buffer *vbuf = to_vb2_v4l2_buffer(vb);
 	struct cx23885_dev *dev = vb->vb2_queue->drv_priv;
 	struct cx23885_buffer *buf =
@@ -358,12 +359,12 @@ static int buffer_prepare(struct vb2_buffer *vb)
 
 	switch (dev->field) {
 	case V4L2_FIELD_TOP:
-		cx23885_risc_buffer(dev->pci, &buf->risc,
+		ret = cx23885_risc_buffer(dev->pci, &buf->risc,
 				sgt->sgl, 0, UNSET,
 				buf->bpl, 0, dev->height);
 		break;
 	case V4L2_FIELD_BOTTOM:
-		cx23885_risc_buffer(dev->pci, &buf->risc,
+		ret = cx23885_risc_buffer(dev->pci, &buf->risc,
 				sgt->sgl, UNSET, 0,
 				buf->bpl, 0, dev->height);
 		break;
@@ -391,21 +392,21 @@ static int buffer_prepare(struct vb2_buffer *vb)
 			line0_offset = 0;
 			line1_offset = buf->bpl;
 		}
-		cx23885_risc_buffer(dev->pci, &buf->risc,
+		ret = cx23885_risc_buffer(dev->pci, &buf->risc,
 				sgt->sgl, line0_offset,
 				line1_offset,
 				buf->bpl, buf->bpl,
 				dev->height >> 1);
 		break;
 	case V4L2_FIELD_SEQ_TB:
-		cx23885_risc_buffer(dev->pci, &buf->risc,
+		ret = cx23885_risc_buffer(dev->pci, &buf->risc,
 				sgt->sgl,
 				0, buf->bpl * (dev->height >> 1),
 				buf->bpl, 0,
 				dev->height >> 1);
 		break;
 	case V4L2_FIELD_SEQ_BT:
-		cx23885_risc_buffer(dev->pci, &buf->risc,
+		ret = cx23885_risc_buffer(dev->pci, &buf->risc,
 				sgt->sgl,
 				buf->bpl * (dev->height >> 1), 0,
 				buf->bpl, 0,
@@ -418,7 +419,7 @@ static int buffer_prepare(struct vb2_buffer *vb)
 		buf, buf->vb.vb2_buf.index,
 		dev->width, dev->height, dev->fmt->depth, dev->fmt->fourcc,
 		(unsigned long)buf->risc.dma);
-	return 0;
+	return ret;
 }
 
 static void buffer_finish(struct vb2_buffer *vb)
-- 
2.39.2

