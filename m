Return-Path: <linux-media+bounces-13768-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 78DB390FCC0
	for <lists+linux-media@lfdr.de>; Thu, 20 Jun 2024 08:33:51 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 002F2285D96
	for <lists+linux-media@lfdr.de>; Thu, 20 Jun 2024 06:33:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5A0EA40849;
	Thu, 20 Jun 2024 06:33:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=tq-group.com header.i=@tq-group.com header.b="fqO3Djv1";
	dkim=fail reason="key not found in DNS" (0-bit key) header.d=ew.tq-group.com header.i=@ew.tq-group.com header.b="YCnYn+Nb"
X-Original-To: linux-media@vger.kernel.org
Received: from mx1.tq-group.com (mx1.tq-group.com [93.104.207.81])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DD1CFB657;
	Thu, 20 Jun 2024 06:33:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=93.104.207.81
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718865211; cv=none; b=TcM1bto0EkywQkfJ/8ciEYvvjh4y7biv3emrgLvGRNi/xpU6lsLBvxvCc3YBVBsj11/lKQWMpmILU3H1JJ5CH1ScYA0WqLBaN0FZXV+9Xvpv75la6qLwWYgFDshJ8H5uKEOeoXXWAjCbxOsogT6rp+diuDhdONDrqZdTyex+kwA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718865211; c=relaxed/simple;
	bh=BVtUwaFFCxwF3HQC1MxNYooCWzM/7pCtL2gI1+sOr8U=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=YplG3jLezWq1EXamFkrNbe1xYOQQUmDjHiysvYB0YptW77Ae0zhB6vSFsy/6vJ8jYMtuxK1wQkM6srjx7QIt2FfPFpWRgo6RUlGnWwsW48Wq0Vpy3oXpPL5Qc/2Vmv1c2KtgZkkHzLzLObeSTDA2iWE/Gj8e+Z7Jew4YY+l4q/I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ew.tq-group.com; spf=pass smtp.mailfrom=ew.tq-group.com; dkim=pass (2048-bit key) header.d=tq-group.com header.i=@tq-group.com header.b=fqO3Djv1; dkim=fail (0-bit key) header.d=ew.tq-group.com header.i=@ew.tq-group.com header.b=YCnYn+Nb reason="key not found in DNS"; arc=none smtp.client-ip=93.104.207.81
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ew.tq-group.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ew.tq-group.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=tq-group.com; i=@tq-group.com; q=dns/txt; s=key1;
  t=1718865207; x=1750401207;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=l6H8FP2mpqCvryZ//MA7LA1mh1+A8ayGdScvIrjtFiM=;
  b=fqO3Djv11Bxlsi/wQr2EWjeqN3NLJsruU7AJmrpNmnTLCoHVLSq28mK4
   3StlZKqepmhFvx+RnzwiVy9ODXSwacBTwQqY9Zx/2JCJez8Nd2OKWaHoZ
   VECqKFplisPb2pIPsr8Ely6W1wGCx+QaIQFbY7p+IpA07i1hvgPqyoNvM
   ICPOUtxr5OagJdhrwNjx+sFBoNmwzzre5f5C/al16Srq0WsLPUyiojlGW
   OWfni7flNUj8RjYeka9EeupUQv7ldbMVV6caxPzcJlNANdBDBXlDr+ja7
   DBlVf2b0tcj0yVyPvOGs6xKQNQKA1Ks1I+8MS3fRgP/HU1SkKt3PXvrH0
   w==;
X-CSE-ConnectionGUID: dAG106jpTombTYn7mPadyw==
X-CSE-MsgGUID: dcILZs0LSwamU1xqybPwPw==
X-IronPort-AV: E=Sophos;i="6.08,251,1712613600"; 
   d="scan'208";a="37488758"
Received: from vmailcow01.tq-net.de ([10.150.86.48])
  by mx1.tq-group.com with ESMTP; 20 Jun 2024 08:33:23 +0200
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id CF8CE1668EE;
	Thu, 20 Jun 2024 08:33:17 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ew.tq-group.com;
	s=dkim; t=1718865199; h=from:subject:date:message-id:to:cc:mime-version:
	 content-transfer-encoding; bh=l6H8FP2mpqCvryZ//MA7LA1mh1+A8ayGdScvIrjtFiM=;
	b=YCnYn+NbBgTowwUkiNqIgjt9GDRqWovZyuWTNKRVPlJCienrXqB2B6eD2WGZ9Yma2j4OXz
	ajT7UfgCst7aFoZ7xMo/U4c8vPGf2NO3PTobZs5We2nebFeVbIOHBaGyiUBRYNQ49XhI0N
	3geVpD+Z8qsY2OdFCo76JaQUIon8fC1UK5WD9ODfddKQXDYYKnH587RcZpH9ifLH0mOCBS
	/5gk2anX8cdOwWB58AIxFJIpf2Jw7brFu9SKMCerShCvOLF1SyY7qPCJVQLWVf1MuxX7Dz
	j4jG5TsA9qqQdPJUN9h0gRORhILf074CyBYPpglQPRD941TLkCACKp36f2xaqA==
From: Alexander Stein <alexander.stein@ew.tq-group.com>
To: Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: Alexander Stein <alexander.stein@ew.tq-group.com>,
	linux-media@vger.kernel.org,
	linux-rockchip@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 1/1] media: verisilicon: Move rockchip hardware drivers to the corresponding option
Date: Thu, 20 Jun 2024 08:33:13 +0200
Message-Id: <20240620063313.2309767-1-alexander.stein@ew.tq-group.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Last-TLS-Session-Version: TLSv1.3

There is no need to compile the rockchip specific drivers if
CONFIG_VIDEO_HANTRO_ROCKCHIP is not set.
All driver functions are only referenced by rockchip_vpu_hw.c which is
already under this option.

Signed-off-by: Alexander Stein <alexander.stein@ew.tq-group.com>
---
 drivers/media/platform/verisilicon/Makefile | 14 +++++++-------
 1 file changed, 7 insertions(+), 7 deletions(-)

diff --git a/drivers/media/platform/verisilicon/Makefile b/drivers/media/platform/verisilicon/Makefile
index eb38a1833b02..f6f019d04ff0 100644
--- a/drivers/media/platform/verisilicon/Makefile
+++ b/drivers/media/platform/verisilicon/Makefile
@@ -14,13 +14,6 @@ hantro-vpu-y += \
 		hantro_g2.o \
 		hantro_g2_hevc_dec.o \
 		hantro_g2_vp9_dec.o \
-		rockchip_vpu2_hw_jpeg_enc.o \
-		rockchip_vpu2_hw_h264_dec.o \
-		rockchip_vpu2_hw_mpeg2_dec.o \
-		rockchip_vpu2_hw_vp8_dec.o \
-		rockchip_vpu981_hw_av1_dec.o \
-		rockchip_av1_filmgrain.o \
-		rockchip_av1_entropymode.o \
 		hantro_jpeg.o \
 		hantro_h264.o \
 		hantro_hevc.o \
@@ -35,6 +28,13 @@ hantro-vpu-$(CONFIG_VIDEO_HANTRO_SAMA5D4) += \
 		sama5d4_vdec_hw.o
 
 hantro-vpu-$(CONFIG_VIDEO_HANTRO_ROCKCHIP) += \
+		rockchip_vpu2_hw_jpeg_enc.o \
+		rockchip_vpu2_hw_h264_dec.o \
+		rockchip_vpu2_hw_mpeg2_dec.o \
+		rockchip_vpu2_hw_vp8_dec.o \
+		rockchip_vpu981_hw_av1_dec.o \
+		rockchip_av1_filmgrain.o \
+		rockchip_av1_entropymode.o \
 		rockchip_vpu_hw.o
 
 hantro-vpu-$(CONFIG_VIDEO_HANTRO_SUNXI) += \
-- 
2.34.1


