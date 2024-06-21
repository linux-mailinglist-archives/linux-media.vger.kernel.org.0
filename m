Return-Path: <linux-media+bounces-13923-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 5A94A9122CF
	for <lists+linux-media@lfdr.de>; Fri, 21 Jun 2024 12:50:54 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 044971F229A2
	for <lists+linux-media@lfdr.de>; Fri, 21 Jun 2024 10:50:54 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 87243172BC5;
	Fri, 21 Jun 2024 10:50:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=tq-group.com header.i=@tq-group.com header.b="U63KeK/J";
	dkim=fail reason="key not found in DNS" (0-bit key) header.d=ew.tq-group.com header.i=@ew.tq-group.com header.b="so2t6f3G"
X-Original-To: linux-media@vger.kernel.org
Received: from mx1.tq-group.com (mx1.tq-group.com [93.104.207.81])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CC3643207;
	Fri, 21 Jun 2024 10:50:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=93.104.207.81
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718967036; cv=none; b=WHrfh3qEzM5K8c1fLaEmxeLK5U+ApCcBsNv+w9vob7yO8RyWt4joFZBDkCy2aJra7zDTox3UWcSzAUlzDkvUT4Hlqn8wCjpbrccM3eTZqqsY6Pweapk0UpoUyVUcZVwijORZNub8w4xZv6qRy70GEuFBMMTfy/HYhAoPTnQPIWE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718967036; c=relaxed/simple;
	bh=XsAQh3brdURY8xZEx3wFV/gKsLsVModgCVdpUgEpC6s=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=ZvIDJWOQOrXp3LdSeCYd2lJdWwsK7OfCRp/IqjsyXcAsdlv2CD7EaHAeARUOP0lNa8GXrgiJkUCsHKnh5SmtFb3T8lsDDWhegm1pxWkvcwwzgFPmj9IBy7WT3CZqa6r3pyBHIgd6eQaBiJWfPI0e5QVsGD1livAJDj/4equgqK0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ew.tq-group.com; spf=pass smtp.mailfrom=ew.tq-group.com; dkim=pass (2048-bit key) header.d=tq-group.com header.i=@tq-group.com header.b=U63KeK/J; dkim=fail (0-bit key) header.d=ew.tq-group.com header.i=@ew.tq-group.com header.b=so2t6f3G reason="key not found in DNS"; arc=none smtp.client-ip=93.104.207.81
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ew.tq-group.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ew.tq-group.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=tq-group.com; i=@tq-group.com; q=dns/txt; s=key1;
  t=1718967033; x=1750503033;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=SujQfNUHiwMLd2TT4Jk4V4QhaA+tmqeAHh0v8brNSO8=;
  b=U63KeK/Jz1CB5e5vDsOetkjRrxp3lBPKWDkwluNddzgbGbdLVVjNKB1A
   HU3tbjIckcXR/kRZS4VZYhIS/+60nUCsFHgill9LQ/Pi/NO1zjVI8AUoB
   cEwuqxQziOeZSs3eJj27qIF2XcvCmLekGMkRQ3aMV4E65Yhv2PILKikjA
   Dtt9L8xrts0zKISvObcYmp7bbjFxcDBQvMOJL143OLOpBbuNPCESCElH7
   2mKP0j1tZZXmQnEcdnGWcCLkCd8LaUrkze5f8bG/SZXdB3NsByJte7lzW
   Yr10UlXhJByg3IaHMH3dZzXfObWOKzFxwZB0+F3fwGLwrq1loH8bKi1QG
   g==;
X-CSE-ConnectionGUID: C1o0W+CFRAu5svSr91tgCw==
X-CSE-MsgGUID: Pr9t5FSTSeq7fLY6T52dig==
X-IronPort-AV: E=Sophos;i="6.08,254,1712613600"; 
   d="scan'208";a="37520407"
Received: from vmailcow01.tq-net.de ([10.150.86.48])
  by mx1.tq-group.com with ESMTP; 21 Jun 2024 12:50:28 +0200
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 67099160A30;
	Fri, 21 Jun 2024 12:50:23 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ew.tq-group.com;
	s=dkim; t=1718967024; h=from:subject:date:message-id:to:cc:mime-version:
	 content-transfer-encoding; bh=SujQfNUHiwMLd2TT4Jk4V4QhaA+tmqeAHh0v8brNSO8=;
	b=so2t6f3GnI3475zAEnwbtMFPMIUFQSVs1JhyNws4s9L/GtbhjRy1sBCX0Ltb4WATXIMG2U
	PARHYa1e1EquHGhCXc1FGe53mh0HZpGF/f7os4JoBHWN7p7X9OxqnZ0fxqbEVj6XUt1OGW
	dohamr1gh4nLzwZHap5yrlig3p/BBP6euFZ0pe2aC8CRJjRBVI2QtFeD21QazROBGZjUL3
	KJe7At0u7OVtY5b2Ha1Eg8zRO1Yt9Fo5T4v3mfn3eviEGhauDi1O/gtbK48SQ5zyWFQSyg
	PDcvi7C/Gq4RimLUzls0nOGj97+Y0lgLkTAuZTnKEdks5vfZnksg8AXj32rvsQ==
From: Alexander Stein <alexander.stein@ew.tq-group.com>
To: Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Hans Verkuil <hverkuil-cisco@xs4all.nl>,
	Alex Bee <knaerzche@gmail.com>,
	Jonas Karlman <jonas@kwiboo.se>
Cc: Alexander Stein <alexander.stein@ew.tq-group.com>,
	Nicolas Dufresne <nicolas.dufresne@collabora.com>,
	Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
	linux-media@vger.kernel.org,
	linux-rockchip@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2 1/2] media: verisilicon: Move rockchip hardware drivers to the corresponding option
Date: Fri, 21 Jun 2024 12:50:22 +0200
Message-Id: <20240621105024.4073007-1-alexander.stein@ew.tq-group.com>
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

Fixes: c9caebd57b3a ("media: hantro: merge Rockchip platform drivers")
Fixes: c07665f99386 ("media: hantro: Add H.264 support for Rockchip VDPU2")
Signed-off-by: Alexander Stein <alexander.stein@ew.tq-group.com>
Reviewed-by: Nicolas Dufresne <nicolas.dufresne@collabora.com>
---
Changes in v2:
* Split and just touch non-AV1 drivers

As suggested by Nicolas split v1 patch into two separate ones
with their corresponding Fixes tags.

 drivers/media/platform/verisilicon/Makefile | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/drivers/media/platform/verisilicon/Makefile b/drivers/media/platform/verisilicon/Makefile
index eb38a1833b02f..d483530b2feff 100644
--- a/drivers/media/platform/verisilicon/Makefile
+++ b/drivers/media/platform/verisilicon/Makefile
@@ -14,10 +14,6 @@ hantro-vpu-y += \
 		hantro_g2.o \
 		hantro_g2_hevc_dec.o \
 		hantro_g2_vp9_dec.o \
-		rockchip_vpu2_hw_jpeg_enc.o \
-		rockchip_vpu2_hw_h264_dec.o \
-		rockchip_vpu2_hw_mpeg2_dec.o \
-		rockchip_vpu2_hw_vp8_dec.o \
 		rockchip_vpu981_hw_av1_dec.o \
 		rockchip_av1_filmgrain.o \
 		rockchip_av1_entropymode.o \
@@ -35,6 +31,10 @@ hantro-vpu-$(CONFIG_VIDEO_HANTRO_SAMA5D4) += \
 		sama5d4_vdec_hw.o
 
 hantro-vpu-$(CONFIG_VIDEO_HANTRO_ROCKCHIP) += \
+		rockchip_vpu2_hw_jpeg_enc.o \
+		rockchip_vpu2_hw_h264_dec.o \
+		rockchip_vpu2_hw_mpeg2_dec.o \
+		rockchip_vpu2_hw_vp8_dec.o \
 		rockchip_vpu_hw.o
 
 hantro-vpu-$(CONFIG_VIDEO_HANTRO_SUNXI) += \
-- 
2.34.1


