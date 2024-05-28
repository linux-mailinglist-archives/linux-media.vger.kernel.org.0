Return-Path: <linux-media+bounces-12100-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id B5B068D211E
	for <lists+linux-media@lfdr.de>; Tue, 28 May 2024 18:04:46 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 4E4EEB2330E
	for <lists+linux-media@lfdr.de>; Tue, 28 May 2024 16:04:44 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8A1A8171E6A;
	Tue, 28 May 2024 16:04:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="joYmAUEz"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6B594171657
	for <linux-media@vger.kernel.org>; Tue, 28 May 2024 16:04:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1716912277; cv=none; b=dIY63kNiMUpZ6liPCWp65YMAFSgXe/q2B92jfPJfjv3LDXrtlqp4Blys31txV74J3dd4lJ4KbqrmPg+UYrkyn+Xis5iS1IpF8k9NFNXrpdmGKgsL2wUunLyu/mtX5crtcQW/xas/t0Pbg71Av4BCvr+71KO+dPHXsyF8GKWD54A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1716912277; c=relaxed/simple;
	bh=2dgXvafGvTEPd95LArAWLb+y763AZEuKr1hUv/2T0sg=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=beVV9Tz7BOpbMUoih8/U3brYo4Zr4g2QExxRyWDhp164+dBscQ+HY55QGjC+3UEVTBKugXdwaDtxpmyfBvZGXaTA18xhk6LMUw+jx0F5QZXuVQPitL60V9/hoJdozd5a/u2BWiqfsgIZbSS1puDRxT+tQWT9fPFLdKopXuv7S/U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=joYmAUEz; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from localhost.localdomain (unknown [IPv6:2001:b07:5d2e:52c9:cc1e:e404:491f:e6ea])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id A8C2DB53;
	Tue, 28 May 2024 18:04:29 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1716912270;
	bh=2dgXvafGvTEPd95LArAWLb+y763AZEuKr1hUv/2T0sg=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=joYmAUEz6ijWvtDKuqvLzN1NTCeiSU+l+vm1r5GNHBKVczS3vTsenIXAJguSq1PlA
	 pFzcAaDVS2Ve9sbKKcQ9Rp+Y/yLZryN263DSkqwk3rM3rxm0MemVxwj8yVu/We7QtP
	 OPPkyA06nrFmdWs+Zxh+NVlMA1SQnHAC/BUXZBZg=
From: Jacopo Mondi <jacopo.mondi@ideasonboard.com>
To: Linux Media Mailing List <linux-media@vger.kernel.org>
Cc: Jacopo Mondi <jacopo.mondi@ideasonboard.com>,
	David Plowman <david.plowman@raspberrypi.com>,
	Naushir Patuck <naush@raspberrypi.com>,
	Nick Hollinghurst <nick.hollinghurst@raspberrypi.org>,
	Dave Stevenson <dave.stevenson@raspberrypi.com>,
	Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>,
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
	Kieran Bingham <kieran.bingham@ideasonboard.com>,
	Sakari Ailus <sakari.ailus@iki.fi>,
	Hans Verkuil <hverkuil-cisco@xs4all.nl>,
	Mauro Carvalho Chehab <mchehab@kernel.org>
Subject: [PATCH v8 1/8] media: uapi: pixfmt-luma: Document MIPI CSI-2 packing
Date: Tue, 28 May 2024 18:03:59 +0200
Message-ID: <20240528160407.304178-2-jacopo.mondi@ideasonboard.com>
X-Mailer: git-send-email 2.45.1
In-Reply-To: <20240528160407.304178-1-jacopo.mondi@ideasonboard.com>
References: <20240528160407.304178-1-jacopo.mondi@ideasonboard.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The Y10P, Y12P and Y14P format variants are packed according to
the RAW10, RAW12 and RAW14 formats as defined by the MIPI CSI-2
specification. Document it.

Signed-off-by: Jacopo Mondi <jacopo.mondi@ideasonboard.com>
Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Reviewed-by: Naushir Patuck <naush@raspberrypi.com>
---
 Documentation/userspace-api/media/v4l/pixfmt-yuv-luma.rst | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/Documentation/userspace-api/media/v4l/pixfmt-yuv-luma.rst b/Documentation/userspace-api/media/v4l/pixfmt-yuv-luma.rst
index b3c5779521d8..f02e6cf3516a 100644
--- a/Documentation/userspace-api/media/v4l/pixfmt-yuv-luma.rst
+++ b/Documentation/userspace-api/media/v4l/pixfmt-yuv-luma.rst
@@ -209,3 +209,7 @@ are often referred to as greyscale formats.
     For Y012 and Y12 formats, Y012 places its data in the 12 high bits, with
     padding zeros in the 4 low bits, in contrast to the Y12 format, which has
     its padding located in the most significant bits of the 16 bit word.
+
+    The 'P' variations of the Y10, Y12 and Y14 formats are packed according to
+    the RAW10, RAW12 and RAW14 packing scheme as defined by the MIPI CSI-2
+    specification.
-- 
2.45.1


