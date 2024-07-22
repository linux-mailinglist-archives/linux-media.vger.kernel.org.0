Return-Path: <linux-media+bounces-15267-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 054BF9391BD
	for <lists+linux-media@lfdr.de>; Mon, 22 Jul 2024 17:26:23 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id B01EE1F21ACB
	for <lists+linux-media@lfdr.de>; Mon, 22 Jul 2024 15:26:22 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4557416E881;
	Mon, 22 Jul 2024 15:26:03 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from laurent.telenet-ops.be (laurent.telenet-ops.be [195.130.137.89])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D98D716DEC3
	for <linux-media@vger.kernel.org>; Mon, 22 Jul 2024 15:25:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.130.137.89
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1721661962; cv=none; b=Kbzve/lcAV+uDZQi6w6VsgbGNWf7D0rvBYK04GWT79n2RCRj11LTsTEgkjK++EGbrGt0Y8J3bmKX0waQqcaqWYz0wYiNqZ8D5DUt0ZqKeHvwuW8f+yW5r2AYAdIYkoKLT0T7FZh7dp1Hm9j/nHypME3YjCo4vRgL19KbL8CRPPU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1721661962; c=relaxed/simple;
	bh=6xfQa1A21+kGMuwNQAjYe8vvzACsGO5T8hs4EYkFhFc=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=anjALkUKFbY349VxDrX/mVkmBFadIw5TQDTcQ7KrVkJx5B/fNgnDEHZcgvX0X9dg5eSiNnM9x7HUHjNldwRNDeo7pUmERP7bJpWJC97gXImMHSg+i2lJGtv8PrcT9gTM69XMOPtwQqT4fgWvPpu+4b1GClQ8RTKHJNi0WLcyVnk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=glider.be; spf=none smtp.mailfrom=linux-m68k.org; arc=none smtp.client-ip=195.130.137.89
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=glider.be
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux-m68k.org
Received: from ramsan.of.borg ([IPv6:2a02:1810:ac12:ed80:173b:9414:53f5:de4c])
	by laurent.telenet-ops.be with bizsmtp
	id qfRu2C00F1wvoRx01fRufC; Mon, 22 Jul 2024 17:25:57 +0200
Received: from rox.of.borg ([192.168.97.57])
	by ramsan.of.borg with esmtp (Exim 4.95)
	(envelope-from <geert@linux-m68k.org>)
	id 1sVuut-0031Lx-SI;
	Mon, 22 Jul 2024 17:25:54 +0200
Received: from geert by rox.of.borg with local (Exim 4.95)
	(envelope-from <geert@linux-m68k.org>)
	id 1sVuvC-0025cR-AJ;
	Mon, 22 Jul 2024 17:25:54 +0200
From: Geert Uytterhoeven <geert+renesas@glider.be>
To: Mauro Carvalho Chehab <mchehab@kernel.org>,
	Sebastian Fricke <sebastian.fricke@collabora.com>,
	Hans Verkuil <hverkuil-cisco@xs4all.nl>,
	Devarsh Thakkar <devarsht@ti.com>,
	Benjamin Gaignard <benjamin.gaignard@collabora.com>,
	David Huang <d-huang@ti.com>
Cc: Nishanth Menon <nm@ti.com>,
	Vignesh Raghavendra <vigneshr@ti.com>,
	Tero Kristo <kristo@kernel.org>,
	linux-media@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [PATCH] media: imagination: VIDEO_E5010_JPEG_ENC should depend on ARCH_K3
Date: Mon, 22 Jul 2024 17:25:53 +0200
Message-Id: <8c124554f64cf107ac29280580e5e9ab68ea3193.1721661863.git.geert+renesas@glider.be>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Currently, the Imagination E5010 JPEG Encoder is only present on Texas
Instruments K3 SoCs.  Hence add a dependency on ARCH_K3, to prevent
asking the user about this driver when configuring a kernel without TI
K3 SoC support.  The dependency can be relaxed if/when the encoder
appears on other SoC families.

Fixes: a1e2940458853d00 ("media: imagination: Add E5010 JPEG Encoder driver")
Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
---
 drivers/media/platform/imagination/Kconfig | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/media/platform/imagination/Kconfig b/drivers/media/platform/imagination/Kconfig
index 7139ae22219b43c6..a302c955483dca80 100644
--- a/drivers/media/platform/imagination/Kconfig
+++ b/drivers/media/platform/imagination/Kconfig
@@ -2,6 +2,7 @@
 config VIDEO_E5010_JPEG_ENC
 	tristate "Imagination E5010 JPEG Encoder Driver"
 	depends on VIDEO_DEV
+	depends on ARCH_K3 || COMPILE_TEST
 	select VIDEOBUF2_DMA_CONTIG
 	select VIDEOBUF2_VMALLOC
 	select V4L2_MEM2MEM_DEV
-- 
2.34.1


