Return-Path: <linux-media+bounces-1769-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 022D88079C8
	for <lists+linux-media@lfdr.de>; Wed,  6 Dec 2023 21:48:48 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id B0CC6282485
	for <lists+linux-media@lfdr.de>; Wed,  6 Dec 2023 20:48:46 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7761241857;
	Wed,  6 Dec 2023 20:48:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b="4ed1oWJh"
X-Original-To: linux-media@vger.kernel.org
Received: from bombadil.infradead.org (bombadil.infradead.org [IPv6:2607:7c80:54:3::133])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D0AD7C7;
	Wed,  6 Dec 2023 12:48:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:
	Content-ID:Content-Description:In-Reply-To:References;
	bh=aBy9F9kxxPHfX2iwr4WNWrmiHbFVf5OKMgUWN/MZxMY=; b=4ed1oWJhWhoKn3jb19vkRj5F9+
	5efmRwI3yxoAVQ0Z8U+/WE4hZLU2MEdBaI4R4U+Zmkffa7Pnc/9vUx0ii5SODjr5XlIkaAgtRQvbI
	XT6uRlbB4yENkrokgg8fJkZVKjvxh0684zgOV7jJCCg4OD1gRrrQQTKWYQvuOtvUuef+jcB+LFDT9
	px5ypJl1X3kV2BFc3doN0Po5bcSvGhV0tqySqFcyXb8x4lDwg5BHW8fhtFjDmDe77GcRGSfb/b4Xq
	aF0panlrkikQ/tqWia1/j4dKF27w8Z8bA+fPamWrZpoOxTSYoxXt9ZQJPB4DbjRPUlzyBbuvzOTCO
	h3gjnICg==;
Received: from [50.53.46.231] (helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtpsa (Exim 4.96 #2 (Red Hat Linux))
	id 1rAyov-00BFMR-0d;
	Wed, 06 Dec 2023 20:48:37 +0000
From: Randy Dunlap <rdunlap@infradead.org>
To: linux-kernel@vger.kernel.org
Cc: Randy Dunlap <rdunlap@infradead.org>,
	Nas Chung <nas.chung@chipsnmedia.com>,
	Jackson Lee <jackson.lee@chipsnmedia.com>,
	Hans Verkuil <hverkuil-cisco@xs4all.nl>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	linux-media@vger.kernel.org
Subject: [PATCH] media: chips-media: wave5: requires GENERIC_ALLOCATOR
Date: Wed,  6 Dec 2023 12:48:36 -0800
Message-ID: <20231206204836.27932-1-rdunlap@infradead.org>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This driver uses the API that is provided by GENERIC_ALLOCATOR API, so
select it to prevent build errors:

riscv32-linux-ld: drivers/media/platform/chips-media/wave5/wave5-vpu.o: in function `.L37':
wave5-vpu.c:(.text+0x468): undefined reference to `of_gen_pool_get'
riscv32-linux-ld: drivers/media/platform/chips-media/wave5/wave5-vdi.o: in function `.L116':
wave5-vdi.c:(.text+0xaac): undefined reference to `gen_pool_dma_alloc'
riscv32-linux-ld: drivers/media/platform/chips-media/wave5/wave5-vdi.o: in function `wave5_vdi_free_sram':
wave5-vdi.c:(.text+0xb60): undefined reference to `gen_pool_free_owner'

Fixes: 9707a6254a8a ("media: chips-media: wave5: Add the v4l2 layer")
Signed-off-by: Randy Dunlap <rdunlap@infradead.org>
Cc: Nas Chung <nas.chung@chipsnmedia.com>
Cc: Jackson Lee <jackson.lee@chipsnmedia.com>
Cc: Hans Verkuil <hverkuil-cisco@xs4all.nl>
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: linux-media@vger.kernel.org
---
 drivers/media/platform/chips-media/wave5/Kconfig |    1 +
 1 file changed, 1 insertion(+)

diff -- a/drivers/media/platform/chips-media/wave5/Kconfig b/drivers/media/platform/chips-media/wave5/Kconfig
--- a/drivers/media/platform/chips-media/wave5/Kconfig
+++ b/drivers/media/platform/chips-media/wave5/Kconfig
@@ -6,6 +6,7 @@ config VIDEO_WAVE_VPU
 	select VIDEOBUF2_DMA_CONTIG
 	select VIDEOBUF2_VMALLOC
 	select V4L2_MEM2MEM_DEV
+	select GENERIC_ALLOCATOR
 	help
 	  Chips&Media stateful encoder and decoder driver.
 	  The driver supports HEVC and H264 formats.

