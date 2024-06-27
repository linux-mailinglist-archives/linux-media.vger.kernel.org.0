Return-Path: <linux-media+bounces-14259-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id CD60691A93B
	for <lists+linux-media@lfdr.de>; Thu, 27 Jun 2024 16:31:22 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 812D51F22277
	for <lists+linux-media@lfdr.de>; Thu, 27 Jun 2024 14:31:22 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E3ED2195FEF;
	Thu, 27 Jun 2024 14:31:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="nCQSbYZd"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E77021E51D
	for <linux-media@vger.kernel.org>; Thu, 27 Jun 2024 14:31:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719498679; cv=none; b=dzY4QBaaTegZtOiJjmTXIVG5yk+XrGmSmGvyn9pi6Ql2P9Sjh0BfPkeeImSn9SGGj+c6XUafZ+9GQGcoPHukn6FngNZEs2XqQcs9StxRdWdtP3LAGpghTcSvQmPTVcv0KtwSTHdXbd0zaiElrvWPBj7e+sW8bdVWYSY6vO7o+io=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719498679; c=relaxed/simple;
	bh=+Bq5sx2IFCPnu1Q92cNh5ybM9SF+LngR0jyOZjYIhu0=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=Lwa9eZm7xknB6a3/ZphnDTrB7ykVYgUbRNzcHCaBd69UHP9yVXNM2YCr36FtoI5BdS6j+M92UzrzC2+8n0oidZZS2wffQswLEkqZ5aRW2KpRHtZaDxnG/C03IgtIWRxbmR1CBG/4F+mtsHBWSOS7ubYYbBWYzH4TOnXwZIr1eHI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=nCQSbYZd; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from localhost.localdomain (93-61-96-190.ip145.fastwebnet.it [93.61.96.190])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 708012C5;
	Thu, 27 Jun 2024 16:30:50 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1719498651;
	bh=+Bq5sx2IFCPnu1Q92cNh5ybM9SF+LngR0jyOZjYIhu0=;
	h=From:To:Cc:Subject:Date:From;
	b=nCQSbYZdszqgWDRRsElWlOeeg/Dii3uE1sMtaDe2YrSdl5xbf6Xzmod0q7A9VEvPj
	 r9IP3WaBeJdSvaZSze4n28h2wUW202/AQU+He1eL7IFjNTdfkHRo4kn3XXrDh8reRz
	 oMHUHRDX9iB/Qrmf3GybmomnTVecOAdOtF4hjVRU=
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
Subject: [PATCH 0/2] media: uapi: pisp_be: Two late fixes
Date: Thu, 27 Jun 2024 16:30:55 +0200
Message-ID: <20240627143059.300796-1-jacopo.mondi@ideasonboard.com>
X-Mailer: git-send-email 2.45.2
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Two late fixes for the PiSP BE driver just merged in media stage.

The first shouldn't be controversial: BIT() should not be in uAPI.

For the second one let's wait for more opinions from RPi as the
define was not in the BSP driver but only in the header version shipped with
the libpisp library that interfaces libcamera with the ISP.

Jacopo Mondi (2):
  media: uapi: pisp_be_config: Drop BIT() from uAPI
  media: uapi: pisp_common: Add 32 bpp format test

 include/uapi/linux/media/raspberrypi/pisp_be_config.h | 2 +-
 include/uapi/linux/media/raspberrypi/pisp_common.h    | 3 +++
 2 files changed, 4 insertions(+), 1 deletion(-)

--
2.45.2


