Return-Path: <linux-media+bounces-22382-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id C2B0B9DF02E
	for <lists+linux-media@lfdr.de>; Sat, 30 Nov 2024 12:37:02 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 48A75B21879
	for <lists+linux-media@lfdr.de>; Sat, 30 Nov 2024 11:37:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 21BC3192598;
	Sat, 30 Nov 2024 11:36:54 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from leonov.paulk.fr (leonov.paulk.fr [185.233.101.22])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E570E70815;
	Sat, 30 Nov 2024 11:36:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.233.101.22
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1732966613; cv=none; b=a4XYzZ6zWTAqHo5v9ozKi80ByreVdn7b6jTK3O/MALjzfvzMM4pCZkmFVDtnxoY3NeQNjH7ZvVpan8xWX6PZ8Q5IGDuaHGXxsWdxeMiyGZ4VfHAL+ovVVXpw6sYpmC0B8kRqeKT7DUIwr8KSnyCv+kalIRfIRSh6HhcsWCGL+TU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1732966613; c=relaxed/simple;
	bh=HZCbGKOwusP883CYdY1gqxJQ4ngWAbaH2Jfxd1KPOTw=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=MYcl8lszXJ/h9xcbPHWvWH2g6qbmfgnwDLvB/A4NUFktB7nkm3KmBYOSElfsBYcGugX3sy98xh1U2U0PsXFE9u5Bq4BoXW1hcCr9BsZ5n7IdcPjB8pD9cJPvCUVuTDgN+OWBXpsdziocRgUdon3DeAweahH4p5QhXKj8flwn7fY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sys-base.io; spf=pass smtp.mailfrom=sys-base.io; arc=none smtp.client-ip=185.233.101.22
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sys-base.io
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sys-base.io
Received: from laika.paulk.fr (12.234.24.109.rev.sfr.net [109.24.234.12])
	by leonov.paulk.fr (Postfix) with ESMTPS id 2D4BC1F00036;
	Sat, 30 Nov 2024 11:36:49 +0000 (UTC)
Received: by laika.paulk.fr (Postfix, from userid 65534)
	id A42C3A66A3A; Sat, 30 Nov 2024 11:36:48 +0000 (UTC)
X-Spam-Level: *
Received: from localhost.localdomain (unknown [192.168.1.64])
	by laika.paulk.fr (Postfix) with ESMTP id C5D45A66A38;
	Sat, 30 Nov 2024 11:36:35 +0000 (UTC)
From: Paul Kocialkowski <paulk@sys-base.io>
To: linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	dri-devel@lists.freedesktop.org,
	linux-media@vger.kernel.org
Cc: Paul Kocialkowski <paulk@sys-base.io>
Subject: [PATCH] MAINTAINERS: Update own email address from Bootlin to sys-base
Date: Sat, 30 Nov 2024 12:36:32 +0100
Message-ID: <20241130113632.3227864-1-paulk@sys-base.io>
X-Mailer: git-send-email 2.47.0
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Update my email address as I am no longer working at Bootlin and have
started my own consulting company: sys-base.

Signed-off-by: Paul Kocialkowski <paulk@sys-base.io>
---
 MAINTAINERS | 10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)

diff --git a/MAINTAINERS b/MAINTAINERS
index c1fcc56bf2fb..ce165fd144ed 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -816,7 +816,7 @@ F:	drivers/media/platform/sunxi/sun4i-csi/
 
 ALLWINNER A31 CSI DRIVER
 M:	Yong Deng <yong.deng@magewell.com>
-M:	Paul Kocialkowski <paul.kocialkowski@bootlin.com>
+M:	Paul Kocialkowski <paulk@sys-base.io>
 L:	linux-media@vger.kernel.org
 S:	Maintained
 T:	git git://linuxtv.org/media.git
@@ -824,7 +824,7 @@ F:	Documentation/devicetree/bindings/media/allwinner,sun6i-a31-csi.yaml
 F:	drivers/media/platform/sunxi/sun6i-csi/
 
 ALLWINNER A31 ISP DRIVER
-M:	Paul Kocialkowski <paul.kocialkowski@bootlin.com>
+M:	Paul Kocialkowski <paulk@sys-base.io>
 L:	linux-media@vger.kernel.org
 S:	Maintained
 T:	git git://linuxtv.org/media.git
@@ -833,7 +833,7 @@ F:	drivers/staging/media/sunxi/sun6i-isp/
 F:	drivers/staging/media/sunxi/sun6i-isp/uapi/sun6i-isp-config.h
 
 ALLWINNER A31 MIPI CSI-2 BRIDGE DRIVER
-M:	Paul Kocialkowski <paul.kocialkowski@bootlin.com>
+M:	Paul Kocialkowski <paulk@sys-base.io>
 L:	linux-media@vger.kernel.org
 S:	Maintained
 T:	git git://linuxtv.org/media.git
@@ -876,7 +876,7 @@ F:	drivers/thermal/sun8i_thermal.c
 
 ALLWINNER VPU DRIVER
 M:	Maxime Ripard <mripard@kernel.org>
-M:	Paul Kocialkowski <paul.kocialkowski@bootlin.com>
+M:	Paul Kocialkowski <paulk@sys-base.io>
 L:	linux-media@vger.kernel.org
 S:	Maintained
 F:	drivers/staging/media/sunxi/cedrus/
@@ -7219,7 +7219,7 @@ F:	Documentation/devicetree/bindings/display/panel/lg,sw43408.yaml
 F:	drivers/gpu/drm/panel/panel-lg-sw43408.c
 
 DRM DRIVER FOR LOGICVC DISPLAY CONTROLLER
-M:	Paul Kocialkowski <paul.kocialkowski@bootlin.com>
+M:	Paul Kocialkowski <paulk@sys-base.io>
 S:	Supported
 T:	git https://gitlab.freedesktop.org/drm/misc/kernel.git
 F:	drivers/gpu/drm/logicvc/
-- 
2.47.0


