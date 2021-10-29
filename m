Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 77BE743FBCC
	for <lists+linux-media@lfdr.de>; Fri, 29 Oct 2021 13:50:42 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231434AbhJ2LxJ (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 29 Oct 2021 07:53:09 -0400
Received: from mail.kernel.org ([198.145.29.99]:54744 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S229692AbhJ2LxI (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Fri, 29 Oct 2021 07:53:08 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id A75FD60FC4;
        Fri, 29 Oct 2021 11:50:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1635508240;
        bh=H3P4wOd7EOrUAcxLCwk43Gf0aEDnKez0F55HW897lXI=;
        h=From:To:Cc:Subject:Date:From;
        b=Wxd9pUS0IQviAEdGYwyc9aW4xkHe56mVs0em7PiqDs3RxGxD4CqbLVEVi7j4rEiEW
         mM0EgEVsiMzBlN2fIBBh3E9vQe8tdZlV4uBeH/MbKu4HtebZEWhdVdi9W3w3BOypG9
         EJsBCUz/WoZ/HZbnmEkQ0T6As3VOdugCGX1l9iO+XdpTRd0sanagS2l+L4Shrt3MK4
         Vwg64TV+zD8knPA6TiKAP27RtzRWDeh9x1V66weQUK9BU98BthkgphJJ4ppDvVGR62
         TYdEahIota5RijYQj10H8M0wjfWBHSs3eGBsFQTtX6qix/me9KU5RZoSA4qdhbaZSv
         dP9qFlw8k5NrQ==
From:   Arnd Bergmann <arnd@kernel.org>
To:     Mauro Carvalho Chehab <mchehab@kernel.org>,
        Dillon Min <dillon.minfei@gmail.com>,
        Hans Verkuil <hverkuil-cisco@xs4all.nl>
Cc:     Arnd Bergmann <arnd@arndb.de>,
        Alexandre Courbot <acourbot@chromium.org>,
        Stanimir Varbanov <stanimir.varbanov@linaro.org>,
        Yunfei Dong <yunfei.dong@mediatek.com>,
        linux-media@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH] media: stm32-dma2d: fix Kconfig dependencies
Date:   Fri, 29 Oct 2021 13:50:22 +0200
Message-Id: <20211029115036.1365378-1-arnd@kernel.org>
X-Mailer: git-send-email 2.29.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

From: Arnd Bergmann <arnd@arndb.de>

The new DMA2D accidentally allowed compile-testing configurations
that clearly cannot link:

ld.lld: error: undefined symbol: v4l_vb2q_enable_media_source
>>> referenced by videobuf2-core.c
>>>               media/common/videobuf2/videobuf2-core.o:(vb2_core_streamon) in archive drivers/built-in.a

ld.lld: error: undefined symbol: v4l2_device_register
>>> referenced by dma2d.c
>>>               media/platform/stm32/dma2d/dma2d.o:(dma2d_probe) in archive drivers/built-in.a

ld.lld: error: undefined symbol: video_device_alloc
>>> referenced by dma2d.c
>>>               media/platform/stm32/dma2d/dma2d.o:(dma2d_probe) in archive drivers/built-in.a

ld.lld: error: undefined symbol: v4l2_m2m_init
>>> referenced by dma2d.c
>>>               media/platform/stm32/dma2d/dma2d.o:(dma2d_probe) in archive drivers/built-in.a

Tighten the dependencies to only allow test builds when VIDEO_V4L2
is available, but keep it possible for non-stm32 targets.

Fixes: bdbbd511ef0c ("media: stm32-dma2d: STM32 DMA2D driver")
Signed-off-by: Arnd Bergmann <arnd@arndb.de>
---
 drivers/media/platform/Kconfig | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/media/platform/Kconfig b/drivers/media/platform/Kconfig
index 68f16aef8754..9fbdba0fd1e7 100644
--- a/drivers/media/platform/Kconfig
+++ b/drivers/media/platform/Kconfig
@@ -494,7 +494,8 @@ endif # VIDEO_STI_DELTA
 
 config VIDEO_STM32_DMA2D
 	tristate "STM32 Chrom-Art Accelerator (DMA2D)"
-	depends on (VIDEO_DEV && VIDEO_V4L2 && ARCH_STM32) || COMPILE_TEST
+	depends on VIDEO_DEV && VIDEO_V4L2
+	depends on ARCH_STM32 || COMPILE_TEST
 	select VIDEOBUF2_DMA_CONTIG
 	select V4L2_MEM2MEM_DEV
 	help
-- 
2.29.2

