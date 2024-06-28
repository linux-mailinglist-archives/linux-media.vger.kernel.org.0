Return-Path: <linux-media+bounces-14344-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id CE8DF91BF89
	for <lists+linux-media@lfdr.de>; Fri, 28 Jun 2024 15:30:32 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 8B2542831D5
	for <lists+linux-media@lfdr.de>; Fri, 28 Jun 2024 13:30:31 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8E0411BE852;
	Fri, 28 Jun 2024 13:30:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="LhXOa8fC"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 536551E89A
	for <linux-media@vger.kernel.org>; Fri, 28 Jun 2024 13:30:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719581419; cv=none; b=L49jfcsqwacKmq9y0LSsKg+R7XlrcVkd1mrKde1bXz1ITeIwO2EKRBA4x0dXj7CiAWn1K1d4gc5CtWjBOw+SF96QlbgCJn95x5Wm69GMuKNUBjhD02Fgb+kbbziVJZVRMliRP7hQZDMKVTXw0fGLdt9Wcxi5XWp9kF2ik4HY20s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719581419; c=relaxed/simple;
	bh=T3jlOrkkT2yn32h8hI7ffvgpnNYPtTcOtU5jiOj6FyQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Q4tnyo6pLyShLBD9dBOY5Ze82ya5gfJR5z0zVXhkm0f2z0vi8kYj2Vabzz2QII1g+kfR56i2SbcMKLxNbL1KVPmVI1PdkeQjl5Me0kkrhNFJrJNV2V/5MFtUUJ+0c3zvGo5kSRmFfqCG/6K6MEk4RuXDSjtsH7tg5UnUtii5srk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=LhXOa8fC; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from localhost.localdomain (93-61-96-190.ip145.fastwebnet.it [93.61.96.190])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id ABC0F1929;
	Fri, 28 Jun 2024 15:29:40 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1719581381;
	bh=T3jlOrkkT2yn32h8hI7ffvgpnNYPtTcOtU5jiOj6FyQ=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=LhXOa8fCPJ7kiF5FQ//0smtavPu3HZPbeD9RfPaEbOKlYES4s6d7jvapNFUW8XME/
	 zHBpqcvpg66QvvdBDvlYpMAJ+KCoWrwQAZd9u2DgN2pUxTe75Ql1jVBbsDqOgKRUbU
	 ovK14WLy531Goe9MV51d/d93V0EO90MSLs+QtIco=
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
Subject: [PATCH v2 4/5] media: uapi: pisp_be_config: Re-sort pisp_be_tiles_config
Date: Fri, 28 Jun 2024 15:29:45 +0200
Message-ID: <20240628132948.871568-5-jacopo.mondi@ideasonboard.com>
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

The order of the members of pisp_be_tiles_config is relevant
as the driver logic assumes 'config' to be at offset 0.

Re-sort the member to match the driver's expectations.

Fixes: c6c49bac8770 ("media: uapi: Add Raspberry Pi PiSP Back End uAPI")
Signed-off-by: Jacopo Mondi <jacopo.mondi@ideasonboard.com>
---
 include/uapi/linux/media/raspberrypi/pisp_be_config.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/include/uapi/linux/media/raspberrypi/pisp_be_config.h b/include/uapi/linux/media/raspberrypi/pisp_be_config.h
index 27d0cc417d6b..f8650ca92bf8 100644
--- a/include/uapi/linux/media/raspberrypi/pisp_be_config.h
+++ b/include/uapi/linux/media/raspberrypi/pisp_be_config.h
@@ -919,9 +919,9 @@ struct pisp_tile {
  * @config:	PiSP Back End configuration
  */
 struct pisp_be_tiles_config {
+	struct pisp_be_config config;
 	struct pisp_tile tiles[PISP_BACK_END_NUM_TILES];
 	__u32 num_tiles;
-	struct pisp_be_config config;
 } __attribute__((packed));

 #endif /* _UAPI_PISP_BE_CONFIG_H_ */
--
2.45.2


