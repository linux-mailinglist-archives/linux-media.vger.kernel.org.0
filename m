Return-Path: <linux-media+bounces-47282-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id B06F1C6940E
	for <lists+linux-media@lfdr.de>; Tue, 18 Nov 2025 13:06:43 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by tor.lore.kernel.org (Postfix) with ESMTPS id 888BD2B1E7
	for <lists+linux-media@lfdr.de>; Tue, 18 Nov 2025 12:06:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 504D73587A6;
	Tue, 18 Nov 2025 12:04:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="n7R/pjeP"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3A089357A4D;
	Tue, 18 Nov 2025 12:04:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763467459; cv=none; b=Rc0Yk5VNRT0SBnfIffyvF+dmXGnaUiM2SKbUz6HkFdbgMfCuWJW18a5PSg4BpAKYoiyTa586ucLI5iIT1cKGVo72n8gh39pDGeiAbHzETH7AhnQm4IE6oVvoQEWEU0wu3rKf+/EDaKJmaCjgnqljTw/tWn7qOTgr9xYYmmSlmMQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763467459; c=relaxed/simple;
	bh=VeKkHzWuINFdUnFm2Ht3xugKKa8EVomEmG03TCbjK8I=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=TaRbT5DcqqD5CAPRsX3GkVIqnTwQMr6bP9sjcRUURywsrU2vlT2igyejJbYynvszEUzpjkHihOkBSVVVJBtloCknDsAadx3pGxT6gZcELw0bT6VhOOKdObzcfWhvnSvT0wn6cauCWBOKi+vMYGPqhiYhmry8uUfvbk9pLLSD97I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=n7R/pjeP; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from mail.ideasonboard.com (unknown [IPv6:2401:4900:1c66:4b0d:7040:4d69:4c7c:d231])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id E204C1FE4;
	Tue, 18 Nov 2025 13:02:12 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1763467333;
	bh=VeKkHzWuINFdUnFm2Ht3xugKKa8EVomEmG03TCbjK8I=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=n7R/pjePPI+kCcdFAm5OOC1A7VpyOTZJPOyqv/kpVzYAP0sFNUp4WXmVAG8kRty+y
	 Jsy4jE/80l9yM4JWft1fmxUhFB7BH+qNVmXFhTUB8Njmuz/HuNF27unQl9Udas+LNt
	 CyRMuMGJtsZoQSk8dxgkXp5TzcS4JalOTzcUkVx8=
From: Jai Luthra <jai.luthra@ideasonboard.com>
Date: Tue, 18 Nov 2025 17:33:03 +0530
Subject: [PATCH v2 10/16] media: i2c: ov5647: Use
 v4l2_async_register_subdev_sensor for lens binding
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251118-b4-rpi-ov5647-v2-10-5e78e7cb7f9b@ideasonboard.com>
References: <20251118-b4-rpi-ov5647-v2-0-5e78e7cb7f9b@ideasonboard.com>
In-Reply-To: <20251118-b4-rpi-ov5647-v2-0-5e78e7cb7f9b@ideasonboard.com>
To: Sakari Ailus <sakari.ailus@linux.intel.com>, 
 Dave Stevenson <dave.stevenson@raspberrypi.com>, 
 Jacopo Mondi <jacopo@jmondi.org>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>, 
 Naushir Patuck <naush@raspberrypi.com>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: linux-media@vger.kernel.org, linux-kernel@vger.kernel.org, 
 devicetree@vger.kernel.org, 
 Mauro Carvalho Chehab <mchehab+huawei@kernel.org>, 
 Kieran Bingham <kieran.bingham@ideasonboard.com>, 
 David Plowman <david.plowman@raspberrypi.com>, 
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>, 
 Peter Robinson <pbrobinson@gmail.com>, Stefan Wahren <wahrenst@gmx.net>, 
 "Ivan T. Ivanov" <iivanov@suse.de>, 
 Jacopo Mondi <jacopo.mondi@ideasonboard.com>, 
 Jai Luthra <jai.luthra@ideasonboard.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=928;
 i=jai.luthra@ideasonboard.com; h=from:subject:message-id;
 bh=hTNfD9i+foAwbOBG1v56XbjkCj27bvn8cNIgksw6IEw=;
 b=owEBbQKS/ZANAwAKAUPekfkkmnFFAcsmYgBpHGCDB2Z+L69J2oAMTDA3Hd6CpvPjfITIbm48X
 U+7CPC+5xSJAjMEAAEKAB0WIQRN4NgY5dV16NRar8VD3pH5JJpxRQUCaRxggwAKCRBD3pH5JJpx
 RQLtEACMVOTdI3I/bJ/uwj+vgEMzi/4yAgrdReP5nfTvUUbaDoTo5qS/D6izf2lQPiPvqQZddAo
 zSLsmE4CFnawXw6GrSYGOT+Sj5vurVoM3zphSnwiDKRhUXbKezddPd/HN5MIa2ya8UPdPsHOMFn
 W5X/EbybevM0q/B3zdXo1ydeVh03StHOjKlZs03T/IByg3T+RcgFWEc7zcTNtbOPV7spsjm9NIL
 0D0jaRAKvPmLHxmtoqwAKW9UC3uUM5wC3HrJ/QGCKMxePj6E5a8cOlViSKbd3RlhGTFYlPFmRpF
 taNvAIVLspKXj8TB5TVzzn2BQ7VcXDjRukijJYAqN+U6F8cnapOKmsD2nIo+99U0GbFCyzYlLHA
 I/n7kO3B23BSwYtanfsE3PkC4sdcPOGakg2EPDvFPhSCGJr6zeudpgx8RnL4SJa9rdJSK9tBhSi
 UFokrI0rPtfty3ZJCZDx/SPwzikULmZ6LSUR81anI3z2vxrMl/nGRREoSQo1+FkPy8tQFT8AgWU
 +/lqmkoQ9omt/5/oE8BRxRNrmZkxfXfJDUCs9bstD4VYu2QRwzjUnw/bRlJ+8jT2tzo90Q/rvZt
 wSWDTweckDFQUE5axGd9HCakpTZ+ly72k6q599NdWVxwi6rok9ro8kSjChNHv3G3UD3EyIDMO99
 WQnv50hOZMZRchQ==
X-Developer-Key: i=jai.luthra@ideasonboard.com; a=openpgp;
 fpr=4DE0D818E5D575E8D45AAFC543DE91F9249A7145

From: Dave Stevenson <dave.stevenson@raspberrypi.com>

v4l2_async_register_subdev doesn't bind in lens or flash drivers,
but v4l2_async_register_subdev_sensor does.
Switch to using v4l2_async_register_subdev_sensor.

Signed-off-by: Dave Stevenson <dave.stevenson@raspberrypi.com>
Reviewed-by: Jacopo Mondi <jacopo.mondi@ideasonboard.com>
Signed-off-by: Jai Luthra <jai.luthra@ideasonboard.com>
---
 drivers/media/i2c/ov5647.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/media/i2c/ov5647.c b/drivers/media/i2c/ov5647.c
index 0343583692ab9bcca1a07d874a707ac6093a9035..9b5a1275c29877dff99c74aa8d49605c02fa6ed6 100644
--- a/drivers/media/i2c/ov5647.c
+++ b/drivers/media/i2c/ov5647.c
@@ -1559,7 +1559,7 @@ static int ov5647_probe(struct i2c_client *client)
 	if (ret < 0)
 		goto power_off;
 
-	ret = v4l2_async_register_subdev(sd);
+	ret = v4l2_async_register_subdev_sensor(sd);
 	if (ret < 0)
 		goto power_off;
 

-- 
2.51.1


