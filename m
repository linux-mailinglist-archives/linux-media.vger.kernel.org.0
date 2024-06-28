Return-Path: <linux-media+bounces-14341-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 1318691BF86
	for <lists+linux-media@lfdr.de>; Fri, 28 Jun 2024 15:30:24 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 8770FB2226C
	for <lists+linux-media@lfdr.de>; Fri, 28 Jun 2024 13:30:21 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E42521E529;
	Fri, 28 Jun 2024 13:30:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="v3ReSlYG"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E5CAF29B0
	for <linux-media@vger.kernel.org>; Fri, 28 Jun 2024 13:30:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719581413; cv=none; b=MCpFRfZ8q7GVVAsz8UtZs1h80e7M4inaD7bB2A3VTyfNiw4BWC51KjZ43IrPkCnEVIWZam2mT4eM6992xkctXf77rZpEgky+IQURuwNplXZuECF4Dg/jsk7nftzx9pLlhRNLlJGLnZNmcxLG1O5s5Zif2FwmW4E+4UffimW3x0I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719581413; c=relaxed/simple;
	bh=TXKtOf0KFuRGi3Et4OUwfPMIir819rzB91xU37nxQR4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=niifmMCF+m4RYyxYnNVpzrKdimlpL61kTkFks+SdgKwbo7ey2ag/seZH5qa79H2SBu9b75kjpFfaFzRzlXUUdD5tsMVt13uYTB2AxkSogBM1jDBGiSdGoU47yeJhb/AvX4ba4fPE9lxQTsOOJm1gIkhPurZVqKKk/3NwA9MNJcw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=v3ReSlYG; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from localhost.localdomain (93-61-96-190.ip145.fastwebnet.it [93.61.96.190])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 32EE814AF;
	Fri, 28 Jun 2024 15:29:38 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1719581378;
	bh=TXKtOf0KFuRGi3Et4OUwfPMIir819rzB91xU37nxQR4=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=v3ReSlYGqWVgCnBkRjfSJ6NOqveRPlURBMQoBy6tIQvz91etbAs4xyYrAJyX8cVZo
	 o626LIPE5NRlc7iw8t7KK0dQCCWWG3Iu8ycavwQ1mQcp8ZMu45/2JLwP7nUGqkghV7
	 /GTjnYXCD8FK4fdMwriOXI03o0PfA+GG1Gk5PC/0=
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
Subject: [PATCH v2 1/5] media: uapi: pisp_be_config: Drop BIT() from uAPI
Date: Fri, 28 Jun 2024 15:29:42 +0200
Message-ID: <20240628132948.871568-2-jacopo.mondi@ideasonboard.com>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20240628132948.871568-1-jacopo.mondi@ideasonboard.com>
References: <20240628132948.871568-1-jacopo.mondi@ideasonboard.com>
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
Reviewed-by: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
---
 include/uapi/linux/media/raspberrypi/pisp_be_config.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/include/uapi/linux/media/raspberrypi/pisp_be_config.h b/include/uapi/linux/media/raspberrypi/pisp_be_config.h
index 1684ae068d4f..27d0cc417d6b 100644
--- a/include/uapi/linux/media/raspberrypi/pisp_be_config.h
+++ b/include/uapi/linux/media/raspberrypi/pisp_be_config.h
@@ -146,7 +146,7 @@ struct pisp_be_dpc_config {
  */
 struct pisp_be_geq_config {
 	__u16 offset;
-#define PISP_BE_GEQ_SHARPER BIT(15)
+#define PISP_BE_GEQ_SHARPER (1U << 15)
 #define PISP_BE_GEQ_SLOPE ((1 << 10) - 1)
 	/* top bit is the "sharper" flag, slope value is bottom 10 bits */
 	__u16 slope_sharper;
--
2.45.2


