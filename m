Return-Path: <linux-media+bounces-48750-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 38D4ACBCC82
	for <lists+linux-media@lfdr.de>; Mon, 15 Dec 2025 08:36:16 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 0EF3B3012DD1
	for <lists+linux-media@lfdr.de>; Mon, 15 Dec 2025 07:35:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 81FF5329C48;
	Mon, 15 Dec 2025 07:30:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="om6KZSm5"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 460A0329371;
	Mon, 15 Dec 2025 07:30:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765783831; cv=none; b=ZCTgW7Irg4tPVZouyMTK5GYBlXRpAcxuqfak3KxZnaCyHRZURTApZShFU9UtXJ1cB6hisDP4TfGgyKnkqL9Z5dWSEGltepfOIHUrCjmGeTn1pZN+a3E4QWW526CvtXo8tyxxeuqCzTTLd3ah74B5hMizxLHb9mrDMcCajrdNm/8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765783831; c=relaxed/simple;
	bh=PW+/8dl2mQGpTkC+eShCSuNoV+iHnXMHKa+UcCLLYY8=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=coP0/RMVlYCXt9HWCuFOW80RfhJ9aph4cw9Z3OWETqfRiCgoCI0dVikUTdH4BuhgG8zTNEvTHO7q4YOUgO+GYIJ50dk37NmoZM2ZJwj8MSRGRwJrWC/iBrYmBd48qyNpfNhXWfBkfNZ5YKwGiQk3ZXIGAzZlqJENofxjPuEhQUE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=om6KZSm5; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from mail.ideasonboard.com (unknown [223.190.82.135])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 7519D581;
	Mon, 15 Dec 2025 08:30:23 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1765783824;
	bh=PW+/8dl2mQGpTkC+eShCSuNoV+iHnXMHKa+UcCLLYY8=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=om6KZSm5YtIhszYVYrlPCUfuHpCs76uhatLjA3Xdq5c0Qe5JTiQFdWWho1Wkv/Sze
	 XpWgpo8L0PM937ubtqV1A0QCUiv428XVBhK/4qV7wR4wcmNFZmV9HAwgOCel9Ey2SK
	 ZPKafP0Pqds3UR0sj6wNBafjcrRPwBXEATRJzUps=
From: Jai Luthra <jai.luthra@ideasonboard.com>
Date: Mon, 15 Dec 2025 12:57:58 +0530
Subject: [PATCH v3 02/16] media: i2c: ov5647: Correct pixel array offset
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251215-b4-rpi-ov5647-v3-2-4c25e3c883b2@ideasonboard.com>
References: <20251215-b4-rpi-ov5647-v3-0-4c25e3c883b2@ideasonboard.com>
In-Reply-To: <20251215-b4-rpi-ov5647-v3-0-4c25e3c883b2@ideasonboard.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=944;
 i=jai.luthra@ideasonboard.com; h=from:subject:message-id;
 bh=BagRXN6sZL/zObcXhgJy0qmX4s/f+WU1Te2BiQiP7r8=;
 b=owEBbQKS/ZANAwAKAUPekfkkmnFFAcsmYgBpP7jYUoq5RqEi9WuP8hiVRrNnTODc1wIMKRXMT
 Uj6ueZTnBaJAjMEAAEKAB0WIQRN4NgY5dV16NRar8VD3pH5JJpxRQUCaT+42AAKCRBD3pH5JJpx
 RWjED/9Ocafy1CChCYRnROIsN7WXNp5cOuR4u3O4KQwhpVmCt9/N4qM1xekMUhI6kPjpkY03ObX
 0pRMQV6DR48MzMVJSCZT1A2xbkSbo2hSXhCmHsgDIQQwswihSn08k+fMLqvZm1k/Gp/fxGIMPEx
 HHZ1C/BAot6yKlSJillotLeB/CJNqrECmtZfbC5aewXjfiolnTOxaquLZLbUGs1VjZNHYX1nZux
 ouBA3Z8fFKeWIoLqzujxh4ZO+UchlzdOFm2TIADzny4dMVE2TBGSwZQYTAjav33XFn7xha2sdD6
 ZTgBcTo15IPz+X7jzzKsbEFmnmxk2x2OBoXWrDQilfTci2BT66gAMUayCUiAQ8GzSlo8qjiX0OY
 IWRelWb6iPPlFYZsJTLxDgQP5PF8QV/nIuuJOnVIjoJcAADBgqOIKSwnUu4ae675xqCdNnjOLQw
 xShI8Wc0AP+dXFv7WHzmtWSp0IEFO0lubDnQ7ExvBE0fhzylmrF984IjcVZlueSfwrx96/SOSue
 BN7Fiz1JNaEiZuPPPAu5gbIkWKA973W1DIOedTflvqOvIM6Hz5ADJTari875H6btPw2RE98LjK3
 CQ5Wyb8CrBcJybSAKdI3GUxA69WBRdeJkQNTdw4pBnThvPmS8Bn6WjiD7m/jjby7Ufc75xAAOYM
 EM6VoKs0z9ROC/w==
X-Developer-Key: i=jai.luthra@ideasonboard.com; a=openpgp;
 fpr=4DE0D818E5D575E8D45AAFC543DE91F9249A7145

From: David Plowman <david.plowman@raspberrypi.com>

The top offset in the pixel array is actually 6 (see page 3-1 of the
OV5647 data sheet).

Fixes: 14f70a3232aa ("media: ov5647: Add support for get_selection()")
Signed-off-by: David Plowman <david.plowman@raspberrypi.com>
Reviewed-by: Jacopo Mondi <jacopo.mondi@ideasonboard.com>
Signed-off-by: Jai Luthra <jai.luthra@ideasonboard.com>
---
 drivers/media/i2c/ov5647.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/media/i2c/ov5647.c b/drivers/media/i2c/ov5647.c
index f9fac858dc7ba754bdbebe1792f6fb0358781408..d9e300406f58e554de12d9062840353bdf7a226c 100644
--- a/drivers/media/i2c/ov5647.c
+++ b/drivers/media/i2c/ov5647.c
@@ -69,7 +69,7 @@
 #define OV5647_NATIVE_HEIGHT		1956U
 
 #define OV5647_PIXEL_ARRAY_LEFT		16U
-#define OV5647_PIXEL_ARRAY_TOP		16U
+#define OV5647_PIXEL_ARRAY_TOP		6U
 #define OV5647_PIXEL_ARRAY_WIDTH	2592U
 #define OV5647_PIXEL_ARRAY_HEIGHT	1944U
 

-- 
2.52.0


