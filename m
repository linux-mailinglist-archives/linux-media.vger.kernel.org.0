Return-Path: <linux-media+bounces-6993-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id B0F2D87A72F
	for <lists+linux-media@lfdr.de>; Wed, 13 Mar 2024 12:43:48 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 50CDE1F225D8
	for <lists+linux-media@lfdr.de>; Wed, 13 Mar 2024 11:43:48 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 658D23FB02;
	Wed, 13 Mar 2024 11:43:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="d/64ZgDf"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C228C3EA8F
	for <linux-media@vger.kernel.org>; Wed, 13 Mar 2024 11:43:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1710330218; cv=none; b=hS0YvJglzHHs8ySMriqdlq6sPYgFmFdaAcR33dHkgoEg3EkYAy2+ErmTF/LUt8Oz73JGAl0G1gsKifiitAxkWD06qeCQZ2kuvb2fe8jcjObPGL+UtZjdyk4J6ZmYgqiUkJyDEtSsKsejJBa9Q/S1FyLQqdfflDu7MqefblGGyCY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1710330218; c=relaxed/simple;
	bh=cMIsvgUv/eb+0VWOgWv6LIb2JeW194flzXxLN+v8fwo=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=pnu+J+mbgaTpJkL302VDJZZzZVIJSJkgAesePmkRMWDerHWsmYsJCxb0BZC6S6uDkhp013AohTjlIjI3agT3q4e6v4RnEMqOrNHwO/3IwjlER5WqzKkwNWrQH2TnAHYeYTx2frPLdckHImEl7NfbFn13kIHmaPon3SNktWJK2sQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=d/64ZgDf; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from localhost.localdomain (93-61-96-190.ip145.fastwebnet.it [93.61.96.190])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 5C6042CDB;
	Wed, 13 Mar 2024 12:43:09 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1710330190;
	bh=cMIsvgUv/eb+0VWOgWv6LIb2JeW194flzXxLN+v8fwo=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=d/64ZgDfWzlDfZww4qZYlo4EOFXh4+vzopDUsTQjbqD6nEAkshHT7ajjgC3yPn2eg
	 cuxV3pTdR1R6IqFV2KErXWegnxOy2lQcYlHs9QbO+wIHyYVJdQ8XmxRrMGKxPanS1Q
	 h2LkOYMSQPdtZXubVNvwy2oS3HUVwe/DRg0U9TYg=
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
Subject: [PATCH v5 3/9] media: uapi: pixfmt-luma: Document MIPI CSI-2 packing
Date: Wed, 13 Mar 2024 12:43:01 +0100
Message-ID: <20240313114308.51896-4-jacopo.mondi@ideasonboard.com>
X-Mailer: git-send-email 2.44.0
In-Reply-To: <20240313114308.51896-1-jacopo.mondi@ideasonboard.com>
References: <20240313114308.51896-1-jacopo.mondi@ideasonboard.com>
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
index 3af6e3cb70c4..8e313aaeb693 100644
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
2.44.0


