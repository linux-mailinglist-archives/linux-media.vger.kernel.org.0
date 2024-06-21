Return-Path: <linux-media+bounces-13924-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id E08469122D1
	for <lists+linux-media@lfdr.de>; Fri, 21 Jun 2024 12:51:06 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 939A21F2291D
	for <lists+linux-media@lfdr.de>; Fri, 21 Jun 2024 10:51:06 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8F8A617332A;
	Fri, 21 Jun 2024 10:50:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=tq-group.com header.i=@tq-group.com header.b="BgGVOJDN";
	dkim=fail reason="key not found in DNS" (0-bit key) header.d=ew.tq-group.com header.i=@ew.tq-group.com header.b="ouBe46y8"
X-Original-To: linux-media@vger.kernel.org
Received: from mx1.tq-group.com (mx1.tq-group.com [93.104.207.81])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9CF0017279B;
	Fri, 21 Jun 2024 10:50:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=93.104.207.81
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718967038; cv=none; b=KhcZovV0acRko9YjRYIt3kJi3Qrj5vPm/h/tbs0RzSdwwgKkJ31bCtfzLkTJE6XWGtTo9cA2kt3WDZrzegSDUp4fOychXEwwxToGt5P3aYWL7FZFyBtkxrjESF5f6t/U1C62tM9HeX44v/EuGarCIzfG0ATmA/wZvvLoJT9BQ0Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718967038; c=relaxed/simple;
	bh=Xd9ArVt9D6qUHzGjdOk+YL7pyp+kgskTMm7C0YaGULU=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=WrBoPgGxYpJRUPFVSqmi2EOe5CybSiER22gCtF7ZxQnp5j9nyogtyailrwP/R2owxARuKFeCDrsxBtD9tD10CeX+x8rcF8T6NB7HTdnwW+rCgrbTmw2M/+R+alT9t1IKJgSpwI6beahwIGZ9sOuVIUfwshnmRA1P0aIE82YzYus=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ew.tq-group.com; spf=pass smtp.mailfrom=ew.tq-group.com; dkim=pass (2048-bit key) header.d=tq-group.com header.i=@tq-group.com header.b=BgGVOJDN; dkim=fail (0-bit key) header.d=ew.tq-group.com header.i=@ew.tq-group.com header.b=ouBe46y8 reason="key not found in DNS"; arc=none smtp.client-ip=93.104.207.81
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ew.tq-group.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ew.tq-group.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=tq-group.com; i=@tq-group.com; q=dns/txt; s=key1;
  t=1718967036; x=1750503036;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=8dR59ljDyBjltzEYMcuGSSdeG1Qos47ZkJsUxIPmT7c=;
  b=BgGVOJDNm4lc952rcg5PsKz4varGo5FD3GN/OdcM7N5E2Qx86TaZdx2I
   pWxHOKYi065NbHjw+vDQ7p76oH7g1ezNfMPNGPheKmbitDSMcXYOJERcd
   dd1OHe+l/6fTuaX9+xfmD6wyQkQ+ELaHwWD4YNEnuV+txbiacQaXzhxCJ
   e/qwX3JeJ3HwFpmbQrxymohJ0T0k0St8UVm3l9wqyknp1NuMAcv+q0X22
   0VTw9UezL900mHcxB8Jmz1Xxg0jSeBTjGo/hgUbeIYEOcJexyCoeocRy3
   IztL5gVINJiuOXy6Yguo2mOJgEoD6qA4+kV8Q4d+ol6n7ivoySyegn3wI
   g==;
X-CSE-ConnectionGUID: kjvoQ4aoSOWaN0hP2P+BXA==
X-CSE-MsgGUID: psMX0Up/T021BRhyfXlUVw==
X-IronPort-AV: E=Sophos;i="6.08,254,1712613600"; 
   d="scan'208";a="37520408"
Received: from vmailcow01.tq-net.de ([10.150.86.48])
  by mx1.tq-group.com with ESMTP; 21 Jun 2024 12:50:33 +0200
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 0CC56160A30;
	Fri, 21 Jun 2024 12:50:29 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ew.tq-group.com;
	s=dkim; t=1718967029; h=from:subject:date:message-id:to:cc:mime-version:
	 content-transfer-encoding:in-reply-to:references;
	bh=8dR59ljDyBjltzEYMcuGSSdeG1Qos47ZkJsUxIPmT7c=;
	b=ouBe46y8XVukpUwYEHafVhqcIm0Y8nZjiHQhv8vTINVxbxy+rAYZi2eo4BdIG7Xk+a6M/V
	eqiiOxDO4Gxpgc2dOTUlMNtt2xtvXP0tTYRhbOndVESyQs3jiA98Vedm/CRZnnayG5Qf78
	hZQ4RxJjxvfrYibQpt2Cph+rRWU5uLwsjrEdFBO3LPg5vQIfIE7eKHF1cARQKcy3IFvP2g
	1M2J2NqF23oxexpVxIPsvMtI+eBXhKKl4//qD86FtSXvbUtSzEPy1AldN++H/3G9OMVZfS
	jvkF4jHQEEmQm5+qSendMMTKAFJVE6vgXAUhTGnv+WfVPvghM0FmNEkCgMdbWw==
From: Alexander Stein <alexander.stein@ew.tq-group.com>
To: Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Benjamin Gaignard <benjamin.gaignard@collabora.com>,
	Hans Verkuil <hverkuil-cisco@xs4all.nl>,
	Nicolas Dufresne <nicolas.dufresne@collabora.com>
Cc: Alexander Stein <alexander.stein@ew.tq-group.com>,
	linux-media@vger.kernel.org,
	linux-rockchip@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2 2/2] media: verisilicon: Move rockchip AV1 hardware drivers to the corresponding option
Date: Fri, 21 Jun 2024 12:50:23 +0200
Message-Id: <20240621105024.4073007-2-alexander.stein@ew.tq-group.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240621105024.4073007-1-alexander.stein@ew.tq-group.com>
References: <20240621105024.4073007-1-alexander.stein@ew.tq-group.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Last-TLS-Session-Version: TLSv1.3

There is no need to compile the rockchip specific AV1 drivers if
CONFIG_VIDEO_HANTRO_ROCKCHIP is not set.
All driver functions are only referenced by rockchip_vpu_hw.c which is
already under this option.

Fixes: 727a400686a2 ("media: verisilicon: Add Rockchip AV1 decoder")
Fixes: d8ebe59e7b36 ("media: verisilicon: Add film grain feature to AV1 driver")
Fixes: c0d0e579db4e ("media: verisilicon: Add AV1 entropy helpers")
Signed-off-by: Alexander Stein <alexander.stein@ew.tq-group.com>
Reviewed-by: Nicolas Dufresne <nicolas.dufresne@collabora.com>
---
Changes in v2:
* Split and just touch AV1 drivers

As suggested by Nicolas split v1 patch into two separate ones
with their corresponding Fixes tags.

 drivers/media/platform/verisilicon/Makefile | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/media/platform/verisilicon/Makefile b/drivers/media/platform/verisilicon/Makefile
index d483530b2feff..f6f019d04ff00 100644
--- a/drivers/media/platform/verisilicon/Makefile
+++ b/drivers/media/platform/verisilicon/Makefile
@@ -14,9 +14,6 @@ hantro-vpu-y += \
 		hantro_g2.o \
 		hantro_g2_hevc_dec.o \
 		hantro_g2_vp9_dec.o \
-		rockchip_vpu981_hw_av1_dec.o \
-		rockchip_av1_filmgrain.o \
-		rockchip_av1_entropymode.o \
 		hantro_jpeg.o \
 		hantro_h264.o \
 		hantro_hevc.o \
@@ -35,6 +32,9 @@ hantro-vpu-$(CONFIG_VIDEO_HANTRO_ROCKCHIP) += \
 		rockchip_vpu2_hw_h264_dec.o \
 		rockchip_vpu2_hw_mpeg2_dec.o \
 		rockchip_vpu2_hw_vp8_dec.o \
+		rockchip_vpu981_hw_av1_dec.o \
+		rockchip_av1_filmgrain.o \
+		rockchip_av1_entropymode.o \
 		rockchip_vpu_hw.o
 
 hantro-vpu-$(CONFIG_VIDEO_HANTRO_SUNXI) += \
-- 
2.34.1


