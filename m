Return-Path: <linux-media+bounces-946-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 8A4367F68D0
	for <lists+linux-media@lfdr.de>; Thu, 23 Nov 2023 23:09:07 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 458D22818CF
	for <lists+linux-media@lfdr.de>; Thu, 23 Nov 2023 22:09:06 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EC8E32FC21;
	Thu, 23 Nov 2023 22:09:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b="TwedlhiT"
X-Original-To: linux-media@vger.kernel.org
Received: from madras.collabora.co.uk (madras.collabora.co.uk [46.235.227.172])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 37DDDD68
	for <linux-media@vger.kernel.org>; Thu, 23 Nov 2023 14:08:58 -0800 (PST)
Received: from mz550.lan (ec2-34-240-57-77.eu-west-1.compute.amazonaws.com [34.240.57.77])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: dbrouwer)
	by madras.collabora.co.uk (Postfix) with ESMTPSA id A9ECC6607394;
	Thu, 23 Nov 2023 22:08:55 +0000 (GMT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1700777336;
	bh=ba5AbRQ+wJbIyJeTvCskAw6MOV1nEGnesZS+yhSR7JM=;
	h=From:To:Cc:Subject:Date:From;
	b=TwedlhiTPmJPpXibph7O6Cw8fkxBAAiPALLxlQWhrDXhZ4Wh/TsvjnGo1levKuRJm
	 KnSL3QJHtrWtgL/j6WmYt3cf8FuzQphFLCwZ3luhFRkBNaJqsEOPGiDlLcb2rnARBe
	 Fm8VoFd8Qst1nlKDpunDcPQUP7GaUuxi3i3XNCPNU245zfy2cQJSfIZMbLkE8aaRge
	 xFbnRlOIpJxfnjU3s1PCYSmRRB1ODBEKPfmqoUBjTc8NhsXngyhFUYyXT67x+JCevG
	 Aeqorbob/HmnGSLmNLSmANRSV0OR9WkK6WlcLMAKm2xqE6Y9SjenNMvwGY5dDv5pfM
	 DjNw5UCyyTdNQ==
From: Deborah Brouwer <deborah.brouwer@collabora.com>
To: hverkuil-cisco@xs4all.nl
Cc: sebastian.fricke@collabora.com,
	nicolas.dufresne@collabora.com,
	linux-media@vger.kernel.org,
	Deborah Brouwer <deborah.brouwer@collabora.com>
Subject: [PATCH] media: wave5: add OF and V4L_MEM2MEM_DRIVERS dependencies
Date: Thu, 23 Nov 2023 14:08:41 -0800
Message-ID: <20231123220841.909656-1-deborah.brouwer@collabora.com>
X-Mailer: git-send-email 2.41.0
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Signed-off-by: Deborah Brouwer <deborah.brouwer@collabora.com>
---
Hi Hans,
Sorry about that - can you please squash this into the series?

Thanks,
Deborah

 drivers/media/platform/chips-media/wave5/Kconfig | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/media/platform/chips-media/wave5/Kconfig b/drivers/media/platform/chips-media/wave5/Kconfig
index a3b949356cd5..77e7ae5c8f35 100644
--- a/drivers/media/platform/chips-media/wave5/Kconfig
+++ b/drivers/media/platform/chips-media/wave5/Kconfig
@@ -1,7 +1,8 @@
 # SPDX-License-Identifier: GPL-2.0
 config VIDEO_WAVE_VPU
 	tristate "Chips&Media Wave Codec Driver"
-	depends on VIDEO_DEV
+	depends on V4L_MEM2MEM_DRIVERS
+	depends on VIDEO_DEV && OF
 	select VIDEOBUF2_DMA_CONTIG
 	select VIDEOBUF2_VMALLOC
 	select V4L2_MEM2MEM_DEV

base-commit: b17289d8fcd5c5fe59118586256682ffc5d2fbaf
-- 
2.41.0


