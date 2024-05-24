Return-Path: <linux-media+bounces-11849-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 32C2A8CE68B
	for <lists+linux-media@lfdr.de>; Fri, 24 May 2024 16:01:00 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 6478D1C21DB1
	for <lists+linux-media@lfdr.de>; Fri, 24 May 2024 14:00:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 02B9612C46D;
	Fri, 24 May 2024 14:00:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="Ud77SxYQ"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 033E7433AF
	for <linux-media@vger.kernel.org>; Fri, 24 May 2024 14:00:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1716559252; cv=none; b=HZwklv2DFGjv+lGDQHMe0BXenLI65KyaH/qAcjB9GPBD2Aryuwr/gmJLP9VmPtwBNZpDtbQSvOQ64ppUJ00gmcXaYj8ZnexkQrenxYkpJ6UnL8vuVon1/BVhK9Yr+fSxibuzo418jE0f07cJltZBk7mmVDyAsZRc2y7R57yLqFQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1716559252; c=relaxed/simple;
	bh=2dgXvafGvTEPd95LArAWLb+y763AZEuKr1hUv/2T0sg=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=evhvVK+zpTvy3Wn7SmFSlyaXWbwGf4Q/NCEasthcB2cmfGXFznQz9CHJOdpj/D9j+ypj9mAG4+S7tKADXzlVsq0s+Q5dLvCYHP+dgBcFq0Iv2jJiBqcBpGk83bFX5/wu9X1AeitMZmr8E6KEv6WaEy4Ma4NnL/HiPxcS8zithrw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=Ud77SxYQ; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from localhost.localdomain (93-61-96-190.ip145.fastwebnet.it [93.61.96.190])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 45BE1150E;
	Fri, 24 May 2024 16:00:32 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1716559232;
	bh=2dgXvafGvTEPd95LArAWLb+y763AZEuKr1hUv/2T0sg=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=Ud77SxYQbk3Bo1LgJYCpLwRqiz3BdYoGRKeq9BofeduvtFudbORHOq+ClVQqbwert
	 2GNeyMBZGuwZxvt/znRBvfsccT9tymPNRCKfx1AdNjGxTrn02O5u42ScsY6TlCoL/F
	 av2EmZtI57kkCiSzlJSUW79dAmaIcrAHTidxybYU=
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
Subject: [PATCH v7 1/8] media: uapi: pixfmt-luma: Document MIPI CSI-2 packing
Date: Fri, 24 May 2024 16:00:16 +0200
Message-ID: <20240524140024.161313-2-jacopo.mondi@ideasonboard.com>
X-Mailer: git-send-email 2.45.1
In-Reply-To: <20240524140024.161313-1-jacopo.mondi@ideasonboard.com>
References: <20240524140024.161313-1-jacopo.mondi@ideasonboard.com>
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


