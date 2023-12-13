Return-Path: <linux-media+bounces-2303-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 5016C810CAE
	for <lists+linux-media@lfdr.de>; Wed, 13 Dec 2023 09:44:13 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 723B71C20A32
	for <lists+linux-media@lfdr.de>; Wed, 13 Dec 2023 08:44:12 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A398D1EB38;
	Wed, 13 Dec 2023 08:44:06 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from www.linuxtv.org (www.linuxtv.org [130.149.80.248])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 45474A5
	for <linux-media@vger.kernel.org>; Wed, 13 Dec 2023 00:44:02 -0800 (PST)
Received: from hverkuil by www.linuxtv.org with local (Exim 4.92)
	(envelope-from <hverkuil@linuxtv.org>)
	id 1rDKqK-005VGl-56; Wed, 13 Dec 2023 08:43:48 +0000
From: Hans Verkuil <hverkuil-cisco@xs4all.nl>
Date: Wed, 13 Dec 2023 08:43:45 +0000
Subject: [git:media_stage/master] media: chips-media: wave5: Requires GENERIC_ALLOCATOR
To: linuxtv-commits@linuxtv.org
Cc: linux-media@vger.kernel.org, Jackson Lee <jackson.lee@chipsnmedia.com>, Mauro Carvalho Chehab <mchehab@kernel.org>, Sebastian Fricke <sebastian.fricke@collabora.com>, Randy Dunlap <rdunlap@infradead.org>, Nas Chung <nas.chung@chipsnmedia.com>
Mail-followup-to: linux-media@vger.kernel.org
Forward-to: linux-media@vger.kernel.org
Reply-to: linux-media@vger.kernel.org
Message-Id: <E1rDKqK-005VGl-56@www.linuxtv.org>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>

This is an automatic generated email to let you know that the following patch were queued:

Subject: media: chips-media: wave5: Requires GENERIC_ALLOCATOR
Author:  Randy Dunlap <rdunlap@infradead.org>
Date:    Wed Dec 6 12:48:36 2023 -0800

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
Signed-off-by: Sebastian Fricke <sebastian.fricke@collabora.com>
Signed-off-by: Hans Verkuil <hverkuil-cisco@xs4all.nl>

 drivers/media/platform/chips-media/wave5/Kconfig | 1 +
 1 file changed, 1 insertion(+)

---

diff --git a/drivers/media/platform/chips-media/wave5/Kconfig b/drivers/media/platform/chips-media/wave5/Kconfig
index 9ccc1f7e32f3..f1bcef5177bd 100644
--- a/drivers/media/platform/chips-media/wave5/Kconfig
+++ b/drivers/media/platform/chips-media/wave5/Kconfig
@@ -7,6 +7,7 @@ config VIDEO_WAVE_VPU
 	select VIDEOBUF2_DMA_CONTIG
 	select VIDEOBUF2_VMALLOC
 	select V4L2_MEM2MEM_DEV
+	select GENERIC_ALLOCATOR
 	help
 	  Chips&Media stateful encoder and decoder driver.
 	  The driver supports HEVC and H264 formats.

