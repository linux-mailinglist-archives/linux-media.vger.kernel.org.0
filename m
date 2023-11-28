Return-Path: <linux-media+bounces-1287-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id DEFC27FC311
	for <lists+linux-media@lfdr.de>; Tue, 28 Nov 2023 19:26:56 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 9885D282B47
	for <lists+linux-media@lfdr.de>; Tue, 28 Nov 2023 18:26:55 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 889173D0AB;
	Tue, 28 Nov 2023 18:26:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dkim=none
X-Original-To: linux-media@vger.kernel.org
Received: from andre.telenet-ops.be (andre.telenet-ops.be [IPv6:2a02:1800:120:4::f00:15])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BC434137
	for <linux-media@vger.kernel.org>; Tue, 28 Nov 2023 10:26:46 -0800 (PST)
Received: from ramsan.of.borg ([IPv6:2a02:1810:ac12:ed40:f4d4:eef9:4487:4eb1])
	by andre.telenet-ops.be with bizsmtp
	id FuSe2B00E2jytoH01uSec1; Tue, 28 Nov 2023 19:26:44 +0100
Received: from rox.of.borg ([192.168.97.57])
	by ramsan.of.borg with esmtp (Exim 4.95)
	(envelope-from <geert@linux-m68k.org>)
	id 1r82ms-00AHWm-F7;
	Tue, 28 Nov 2023 19:26:38 +0100
Received: from geert by rox.of.borg with local (Exim 4.95)
	(envelope-from <geert@linux-m68k.org>)
	id 1r82n8-00B9me-GS;
	Tue, 28 Nov 2023 19:26:38 +0100
From: Geert Uytterhoeven <geert+renesas@glider.be>
To: Nas Chung <nas.chung@chipsnmedia.com>,
	Jackson Lee <jackson.lee@chipsnmedia.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Dafna Hirschfeld <dafna.hirschfeld@collabora.com>,
	Sebastian Fricke <sebastian.fricke@collabora.com>,
	Robert Beckett <bob.beckett@collabora.com>,
	Hans Verkuil <hverkuil-cisco@xs4all.nl>,
	Nicolas Dufresne <nicolas.dufresne@collabora.com>
Cc: Nishanth Menon <nm@ti.com>,
	Vignesh Raghavendra <vigneshr@ti.com>,
	Tero Kristo <kristo@kernel.org>,
	linux-media@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [PATCH -next] media: chips-media: VIDEO_WAVE_VPU should depend on ARCH_K3
Date: Tue, 28 Nov 2023 19:26:36 +0100
Message-Id: <eb27184d182811520de31e59f449ea49e7cc6963.1701195705.git.geert+renesas@glider.be>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The Chips&Media Wave 5 Series multi-standard codec IP is currently only
supported on Texas Instruments K3 J721S2 SoC.  Hence add a dependency on
ARCH_K3, to prevent asking the user about this driver when configuring a
kernel without Texas Instruments K3 Multicore SoC support.

Fixes: 9707a6254a8a6b97 ("media: chips-media: wave5: Add the v4l2 layer")
Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
---
 drivers/media/platform/chips-media/wave5/Kconfig | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/media/platform/chips-media/wave5/Kconfig b/drivers/media/platform/chips-media/wave5/Kconfig
index 77e7ae5c8f35f454..9ccc1f7e32f3874f 100644
--- a/drivers/media/platform/chips-media/wave5/Kconfig
+++ b/drivers/media/platform/chips-media/wave5/Kconfig
@@ -3,6 +3,7 @@ config VIDEO_WAVE_VPU
 	tristate "Chips&Media Wave Codec Driver"
 	depends on V4L_MEM2MEM_DRIVERS
 	depends on VIDEO_DEV && OF
+	depends on ARCH_K3 || COMPILE_TEST
 	select VIDEOBUF2_DMA_CONTIG
 	select VIDEOBUF2_VMALLOC
 	select V4L2_MEM2MEM_DEV

