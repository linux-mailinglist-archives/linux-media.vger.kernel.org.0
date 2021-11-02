Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 225C04431EB
	for <lists+linux-media@lfdr.de>; Tue,  2 Nov 2021 16:41:00 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232036AbhKBPnd (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 2 Nov 2021 11:43:33 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58426 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232003AbhKBPnc (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Tue, 2 Nov 2021 11:43:32 -0400
Received: from bombadil.infradead.org (bombadil.infradead.org [IPv6:2607:7c80:54:e::133])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1B592C061714;
        Tue,  2 Nov 2021 08:40:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
        MIME-Version:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:
        Content-ID:Content-Description:In-Reply-To:References;
        bh=r/i/KXCV63u35JO0/BNDE+hkZKtvbs8LAbgs3kVqOMg=; b=htJyD8AjqXx0jnW0nNAoUoopTQ
        B2tGGLL0UrZ0KgBmpxZjieLJYWFk35jfBa3x27voK5KDqwbLXeHZdGr/9yakBcKp+jvufuPuDczFN
        og+FOm4vDUX9FndFDpRdsPoVZx+0tTWI7C2eHL0E8LBbZOcIuJApHgFGjNKVke4gOUFCDcGpvhho/
        E4WHbiCvB9F/msQt3Gqc8Sxq0NTpS1gcFr9tvoMzz8tMhoxLqdtmzT3d3zqJbHM1paPnch4YvKVFV
        5KnTwpveXCZcdklcalO+A/mLlhAx4GuxNZT8uvE75onsvmQCATKOvnlrXW2IrqU+Vfg6aTgtfRXc5
        M38TTf+A==;
Received: from [2601:1c0:6280:3f0::aa0b] (helo=bombadil.infradead.org)
        by bombadil.infradead.org with esmtpsa (Exim 4.94.2 #2 (Red Hat Linux))
        id 1mhvuD-002AQy-6a; Tue, 02 Nov 2021 15:40:57 +0000
From:   Randy Dunlap <rdunlap@infradead.org>
To:     linux-kernel@vger.kernel.org
Cc:     Randy Dunlap <rdunlap@infradead.org>,
        Hugues Fruchet <hugues.fruchet@foss.st.com>,
        linux-media@vger.kernel.org, Dillon Min <dillon.minfei@gmail.com>,
        Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
Subject: [PATCH -next] media: stm32-dma2d: fix Kconfig dependencies grouping
Date:   Tue,  2 Nov 2021 08:40:56 -0700
Message-Id: <20211102154056.1282-1-rdunlap@infradead.org>
X-Mailer: git-send-email 2.31.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On x86_64, when
CONFIG_COMPILE_TEST=y
CONFIG_VIDEO_DEV=m
CONFIG_VIDEO_V4L2=m
CONFIG_VIDEO_STM32_DMA2D=y

there are many build errors (this is only a sampling of them):

ld: drivers/media/common/videobuf2/videobuf2-core.o: in function `vb2_core_streamon':
videobuf2-core.c:(.text+0x1f4e): undefined reference to `v4l_vb2q_enable_media_source'
ld: drivers/media/platform/stm32/dma2d/dma2d.o: in function `dma2d_remove':
dma2d.c:(.text+0x4d9): undefined reference to `v4l2_m2m_release'
ld: dma2d.c:(.text+0x4e5): undefined reference to `video_unregister_device'
ld: dma2d.c:(.text+0x4ed): undefined reference to `v4l2_device_unregister'
ld: drivers/media/platform/stm32/dma2d/dma2d.o: in function `device_run':
dma2d.c:(.text+0x588): undefined reference to `v4l2_m2m_next_buf'
ld: dma2d.c:(.text+0x59b): undefined reference to `v4l2_m2m_next_buf'
ld: dma2d.c:(.text+0x61f): undefined reference to `v4l2_m2m_buf_copy_metadata'
ld: drivers/media/platform/stm32/dma2d/dma2d.o: in function `vidioc_g_fmt':
dma2d.c:(.text+0x71c): undefined reference to `v4l2_m2m_get_vq'
ld: drivers/media/platform/stm32/dma2d/dma2d.o: in function `dma2d_release':
dma2d.c:(.text+0x850): undefined reference to `video_devdata'
ld: dma2d.c:(.text+0x87b): undefined reference to `v4l2_m2m_ctx_release'
ld: dma2d.c:(.text+0x88f): undefined reference to `v4l2_ctrl_handler_free'
ld: dma2d.c:(.text+0x897): undefined reference to `v4l2_fh_del'
ld: dma2d.c:(.text+0x89f): undefined reference to `v4l2_fh_exit'
ld: drivers/media/platform/stm32/dma2d/dma2d.o: in function `dma2d_buf_queue':
dma2d.c:(.text+0x8db): undefined reference to `v4l2_m2m_buf_queue'
ld: drivers/media/platform/stm32/dma2d/dma2d.o: in function `dma2d_stop_streaming':
dma2d.c:(.text+0x922): undefined reference to `v4l2_m2m_buf_remove'
ld: dma2d.c:(.text+0x956): undefined reference to `v4l2_m2m_buf_remove'
ld: drivers/media/platform/stm32/dma2d/dma2d.o: in function `dma2d_open':
dma2d.c:(.text+0x996): undefined reference to `video_devdata'

Regrouping the depend items limits the STM32_DMA2D symbol to =m,
so that the build errors are eliminated.

Fixes: bdbbd511ef0c ("media: stm32-dma2d: STM32 DMA2D driver")
Signed-off-by: Randy Dunlap <rdunlap@infradead.org>
Cc: Hugues Fruchet <hugues.fruchet@foss.st.com>
Cc: linux-media@vger.kernel.org
Cc: Dillon Min <dillon.minfei@gmail.com>
Cc: Hans Verkuil <hverkuil-cisco@xs4all.nl>
Cc: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
---
 drivers/media/platform/Kconfig |    2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

--- linux-next-20211102.orig/drivers/media/platform/Kconfig
+++ linux-next-20211102/drivers/media/platform/Kconfig
@@ -494,7 +494,7 @@ endif # VIDEO_STI_DELTA
 
 config VIDEO_STM32_DMA2D
 	tristate "STM32 Chrom-Art Accelerator (DMA2D)"
-	depends on (VIDEO_DEV && VIDEO_V4L2 && ARCH_STM32) || COMPILE_TEST
+	depends on (VIDEO_DEV && VIDEO_V4L2) && (ARCH_STM32 || COMPILE_TEST)
 	select VIDEOBUF2_DMA_CONTIG
 	select V4L2_MEM2MEM_DEV
 	help
