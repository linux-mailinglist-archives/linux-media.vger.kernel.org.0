Return-Path: <linux-media+bounces-6696-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id CF5CB876020
	for <lists+linux-media@lfdr.de>; Fri,  8 Mar 2024 09:51:01 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 856251F26CA8
	for <lists+linux-media@lfdr.de>; Fri,  8 Mar 2024 08:51:01 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8033E4DA15;
	Fri,  8 Mar 2024 08:50:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="STn0AhRw"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 85FE023759
	for <linux-media@vger.kernel.org>; Fri,  8 Mar 2024 08:50:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1709887851; cv=none; b=bv1alRetEggnqW01zBvxbvIo/WuM+J+bcXGEPzWMXEHgBRIxPgcU6fCPsvNY1EiOAOd0d9Bq/XQQ1mr8yj0x+EnDljt6Ly5FFXe4+m2WHGauZ92txdVbLbPi9vh9G+VrU76VKWDPDb3OxwrptsYsh/vyXuJIyhQNd3bImSXC8ZA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1709887851; c=relaxed/simple;
	bh=0Y0Raa48Y6rYV+KwjDMUjjfNlg8JoT4Q9kbs8F7o/T8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=qxzfgSnzCovQkIH+5NkzVF0t2Bauh61bSLWyiNY0AA/2meE0wLYhMN4npGuKlJkVjgcMLOAkN8afisJ0hUrfIitJx+fr3U1HYM4fizfxAxlY7xnKnqwXTum3uvv2tMtY33R+dsPZxEpwkSL5v4Gl0z0y9QCfAcK+r8rZANam2so=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=STn0AhRw; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from localhost.localdomain (93-61-96-190.ip145.fastwebnet.it [93.61.96.190])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id E68F2EBA;
	Fri,  8 Mar 2024 09:50:25 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1709887826;
	bh=0Y0Raa48Y6rYV+KwjDMUjjfNlg8JoT4Q9kbs8F7o/T8=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=STn0AhRw0xVuM2GKFUHdR9ci7Qa7JnutEmOkNbilfFCnomvqxpfni14z56FTZmwGX
	 9//feygWNp0qgH+ahlYDvKrcziZvcxGRJI4rwpH0pkNJeKv3akrj/Ou3j1wYiYB/mK
	 AXs+YMnyb/wK2RWTGIZemQtU0XJ5uVZUf66RbyYY=
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
Subject: [PATCH v4 3/9] media: uapi: pixfmt-luma: Document MIPI CSI-2 packing
Date: Fri,  8 Mar 2024 09:50:21 +0100
Message-ID: <20240308085028.44388-4-jacopo.mondi@ideasonboard.com>
X-Mailer: git-send-email 2.43.2
In-Reply-To: <20240308085028.44388-1-jacopo.mondi@ideasonboard.com>
References: <20240308085028.44388-1-jacopo.mondi@ideasonboard.com>
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
2.43.2


