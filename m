Return-Path: <linux-media+bounces-14260-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id E085491A93C
	for <lists+linux-media@lfdr.de>; Thu, 27 Jun 2024 16:31:25 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 7DE05281772
	for <lists+linux-media@lfdr.de>; Thu, 27 Jun 2024 14:31:24 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 038C4196455;
	Thu, 27 Jun 2024 14:31:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="m/ygZwAu"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0C1311442FE
	for <linux-media@vger.kernel.org>; Thu, 27 Jun 2024 14:31:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719498680; cv=none; b=h8/dLIynx2OZ9QETlQOB4W9qMZUbb7tBD/nuK7UHZcc0yQ4Pl9w8d2cq3DUuoDMN7OZ22PQl+WcWJVfSbhNKduo50xupwGxMG7hDsQY6ZoC8ME6p5KFH24EDfZVpJ8ls6fryhxNmaPgCcAqBFYzke8CN4eDx68/p53tYdKFD57g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719498680; c=relaxed/simple;
	bh=zDHxKGJZzrUvK6kDlwsJG+U7Jn8Va5BH06P5gn9ivEY=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=L2Qq4uFqghQyCMcpYUNd+dsHTYhQ1rycfRipSP01dwWUNuytDAaLwQ2GFyhEn2Ky6O+AyO7rsgNT5qxWjaD57qSYLfRTidOyNByDG3qo4CLW380gsXorbMsOmR9CMKN7js78ufs6Blmvmyn7y529kiOQ5oDyf1u9kwtIgWstuq4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=m/ygZwAu; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from localhost.localdomain (93-61-96-190.ip145.fastwebnet.it [93.61.96.190])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 5293C7E0;
	Thu, 27 Jun 2024 16:30:51 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1719498651;
	bh=zDHxKGJZzrUvK6kDlwsJG+U7Jn8Va5BH06P5gn9ivEY=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=m/ygZwAuI2ShqESUuAKosBebCYkYg0Hs3SFcRrMhZ0XLUWsaai+kC+RHwU6UEr94e
	 FZ+glxDe2JNzUPaKE9ZtjDVApHmbXlXJwWiCaqzmjMmtbTbm9Yzlv7kcIqWm5om6kr
	 Cz3omCQ1KDBVD1pji9R/KU1mdsSZ+3TLt92kgHX0=
From: Jacopo Mondi <jacopo.mondi@ideasonboard.com>
To: Linux Media Mailing List <linux-media@vger.kernel.org>,
	Hans Verkuil <hverkuil-cisco@xs4all.nl>,
	Sakari Ailus <sakari.ailus@iki.fi>,
	Naushir Patuck <naush@raspberrypi.com>,
	David Plowman <david.plowman@raspberrypi.com>,
	Nick Hollinghurst <nick.hollinghurst@raspberrypi.org>
Cc: Jacopo Mondi <jacopo.mondi@ideasonboard.com>,
	Dave Stevenson <dave.stevenson@raspberrypi.com>,
	Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>,
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
	Kieran Bingham <kieran.bingham@ideasonboard.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>
Subject: [PATCH 1/2] media: uapi: pisp_be_config: Drop BIT() from uAPI
Date: Thu, 27 Jun 2024 16:30:56 +0200
Message-ID: <20240627143059.300796-2-jacopo.mondi@ideasonboard.com>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20240627143059.300796-1-jacopo.mondi@ideasonboard.com>
References: <20240627143059.300796-1-jacopo.mondi@ideasonboard.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The pisp_be_config.h uAPI header file contains a bit-field definition
that uses the BIT() helper macro.

As the BIT() identifier is not defined in userspace, drop it from the
uAPI header.

Fixes: c6c49bac8770 ("media: uapi: Add Raspberry Pi PiSP Back End uAPI")
Signed-off-by: Jacopo Mondi <jacopo.mondi@ideasonboard.com>
---
 include/uapi/linux/media/raspberrypi/pisp_be_config.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/include/uapi/linux/media/raspberrypi/pisp_be_config.h b/include/uapi/linux/media/raspberrypi/pisp_be_config.h
index 1684ae068d4f..18e313613a50 100644
--- a/include/uapi/linux/media/raspberrypi/pisp_be_config.h
+++ b/include/uapi/linux/media/raspberrypi/pisp_be_config.h
@@ -146,7 +146,7 @@ struct pisp_be_dpc_config {
  */
 struct pisp_be_geq_config {
 	__u16 offset;
-#define PISP_BE_GEQ_SHARPER BIT(15)
+#define PISP_BE_GEQ_SHARPER (1 << 15)
 #define PISP_BE_GEQ_SLOPE ((1 << 10) - 1)
 	/* top bit is the "sharper" flag, slope value is bottom 10 bits */
 	__u16 slope_sharper;
-- 
2.45.2


