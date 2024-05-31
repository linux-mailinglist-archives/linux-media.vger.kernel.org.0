Return-Path: <linux-media+bounces-12321-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 804148D5C43
	for <lists+linux-media@lfdr.de>; Fri, 31 May 2024 10:07:41 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 34ECE1F26179
	for <lists+linux-media@lfdr.de>; Fri, 31 May 2024 08:07:41 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A1469770E8;
	Fri, 31 May 2024 08:07:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="f7WYmeQO"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A9D6C76408
	for <linux-media@vger.kernel.org>; Fri, 31 May 2024 08:07:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717142855; cv=none; b=TPQvja9dJw8/EdFZFCgl50lFzICajjVIjMoKMCZDT9l/YJxrd2kksKXPaVVFDfRlhOrxhYwyVu5lCBkk/KfR80Zt9uqTXFT3Vz1CNK8yvvCTnBWODN+y4/c5FG23Joj8XFUYf6OxOfxOUZ/Tq9tebNqRshy97gcsyaaIpsRplsc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717142855; c=relaxed/simple;
	bh=2dgXvafGvTEPd95LArAWLb+y763AZEuKr1hUv/2T0sg=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Nv/YI7fSR6340Uuvbwvd/ukhdtpHAXoZVhD7YbuV2AsDLJBAnHIcF2FoQYyEqU6HKnNEoK+MyPwcrZ7QXhk6lE9U6kTN03RCB9GGBGy54zBesd6wsdbJ4FJhP0W3fHwUDGGgnQZkRsHw6Ij06FAjIT067yTaIaWTISOoP8OhlGE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=f7WYmeQO; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from localhost.localdomain (93-61-96-190.ip145.fastwebnet.it [93.61.96.190])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 5E917B53;
	Fri, 31 May 2024 10:07:26 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1717142847;
	bh=2dgXvafGvTEPd95LArAWLb+y763AZEuKr1hUv/2T0sg=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=f7WYmeQOMak8BKhfErcnDFnCZXmAcllTK7dAHjoHYzqyLb5UsUDqO35K5HGryA/8u
	 lqXGYmbXVwjdlkjz547s60NcyEvOa6ekcVAGcosAWPzAn++oKdiCMkuM5Z32RwFYAg
	 RNGtTJ7ayYxOQRhxkC33f3tMMdnVp3fo27Wz2Vkc=
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
Subject: [PATCH v9 1/8] media: uapi: pixfmt-luma: Document MIPI CSI-2 packing
Date: Fri, 31 May 2024 10:07:00 +0200
Message-ID: <20240531080707.34568-2-jacopo.mondi@ideasonboard.com>
X-Mailer: git-send-email 2.45.1
In-Reply-To: <20240531080707.34568-1-jacopo.mondi@ideasonboard.com>
References: <20240531080707.34568-1-jacopo.mondi@ideasonboard.com>
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


