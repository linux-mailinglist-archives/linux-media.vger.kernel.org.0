Return-Path: <linux-media+bounces-19505-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 5C6BF99B701
	for <lists+linux-media@lfdr.de>; Sat, 12 Oct 2024 22:41:53 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 127101F21B35
	for <lists+linux-media@lfdr.de>; Sat, 12 Oct 2024 20:41:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AF45219AD5C;
	Sat, 12 Oct 2024 20:41:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=treblig.org header.i=@treblig.org header.b="Gi7cBFC/"
X-Original-To: linux-media@vger.kernel.org
Received: from mx.treblig.org (mx.treblig.org [46.235.229.95])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 38E0113D893;
	Sat, 12 Oct 2024 20:41:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=46.235.229.95
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728765705; cv=none; b=tcFcyj07eCw+tSWWXnds3psiO7C1kiasPLa5uKXn0b92RJT0bWYrtT2U95/HM6XP+aDR9bsipR40DVp85+/VuIFRfKHp/cSH/Q4xHOL6h8u8eEIWukhQAQt5hZJ8vrEM7lpdyMZa6GFfZjiA1ZevxY4/xk78uXStqzB2/kNczTM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728765705; c=relaxed/simple;
	bh=LUAb/bnCuXPOamJNLWrcAmFhiWgp72QPq3+3/6SO4Uo=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=MLkIs6hjWYAX3DIUs0515v1LvJzosCyVA0g9ivRvl0ThIPyJf0LALpVqviyroaG0HdXkNvJbMeN7pqBkrWHcC6nS5bu2Us5gKPU+w+WPYGE4yNjTQlHnmbCu0LwHuNrBHDB7fncVHL4Cy0yfr0bhLkMeNrwFktmPjjowBzPn+ew=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=treblig.org; spf=pass smtp.mailfrom=treblig.org; dkim=pass (2048-bit key) header.d=treblig.org header.i=@treblig.org header.b=Gi7cBFC/; arc=none smtp.client-ip=46.235.229.95
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=treblig.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=treblig.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=treblig.org
	; s=bytemarkmx; h=MIME-Version:Message-ID:Date:Subject:From:Content-Type:From
	:Subject; bh=9nQnvUNqLj5H+Y0nFu2kyl8MicBMFcVe8wMOjKJMWsU=; b=Gi7cBFC/QRxdIL7i
	9MhupQ1JWsxKhbRRccBsxEsjVgtwJp0vId3YVwtDPdL4FIH0t9k5/BUsUapYh0jqxSulZtuFJm0Cw
	mqEeoqBaJETveswsoDviZ4JxiEGl3MPDrfnrM0YyuM7E9Zgy8qERwobLoDno7W7likwNNA7mAdQii
	lFcYp3XHKnD5UoAmJhy2aifysbF41yZORPChH2MCHOnqkEy7i+/uYYVVJPvdoOoIS7C2uwab1rGHr
	Vrwgpmr94JOIu2ygtJ5XvR4W9pxUQ/WKtAYinOy7JK1haw4My66g5oi1vu75j/46g9GvvN/uiiVUm
	M4utqNq5C7KtjsMsgQ==;
Received: from localhost ([127.0.0.1] helo=dalek.home.treblig.org)
	by mx.treblig.org with esmtp (Exim 4.96)
	(envelope-from <linux@treblig.org>)
	id 1szivg-00Aivd-2Q;
	Sat, 12 Oct 2024 20:41:36 +0000
From: linux@treblig.org
To: awalls@md.metrocast.net,
	mchehab@kernel.org,
	linux-media@vger.kernel.org
Cc: linux-kernel@vger.kernel.org,
	"Dr. David Alan Gilbert" <linux@treblig.org>
Subject: [PATCH] media: cx18: Remove unused cx18_reset_ir_gpio
Date: Sat, 12 Oct 2024 21:41:36 +0100
Message-ID: <20241012204136.229335-1-linux@treblig.org>
X-Mailer: git-send-email 2.47.0
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: "Dr. David Alan Gilbert" <linux@treblig.org>

cx18_reset_ir_gpio() has been unused in tree since 2009 commit
eefe1010a465 ("V4L/DVB (10759): cx18: Convert GPIO connected functions to act as v4l2_subdevices")

It has a comment saying it's exported for use by 'lirc_pvr150' but I don't
see any sign of it in the lirc git, and I see it removed support
for lirc_i2c.c 'Flavors of the Hauppage PVR-150...' in 2014.

Remove it.

Signed-off-by: Dr. David Alan Gilbert <linux@treblig.org>
---
 drivers/media/pci/cx18/cx18-gpio.c | 15 ---------------
 drivers/media/pci/cx18/cx18-gpio.h |  1 -
 2 files changed, 16 deletions(-)

diff --git a/drivers/media/pci/cx18/cx18-gpio.c b/drivers/media/pci/cx18/cx18-gpio.c
index c85eb8d25837..485a6cbeb15a 100644
--- a/drivers/media/pci/cx18/cx18-gpio.c
+++ b/drivers/media/pci/cx18/cx18-gpio.c
@@ -305,21 +305,6 @@ int cx18_gpio_register(struct cx18 *cx, u32 hw)
 	return v4l2_device_register_subdev(&cx->v4l2_dev, sd);
 }
 
-void cx18_reset_ir_gpio(void *data)
-{
-	struct cx18 *cx = to_cx18(data);
-
-	if (cx->card->gpio_i2c_slave_reset.ir_reset_mask == 0)
-		return;
-
-	CX18_DEBUG_INFO("Resetting IR microcontroller\n");
-
-	v4l2_subdev_call(&cx->sd_resetctrl,
-			 core, reset, CX18_GPIO_RESET_Z8F0811);
-}
-EXPORT_SYMBOL(cx18_reset_ir_gpio);
-/* This symbol is exported for use by lirc_pvr150 for the IR-blaster */
-
 /* Xceive tuner reset function */
 int cx18_reset_tuner_gpio(void *dev, int component, int cmd, int value)
 {
diff --git a/drivers/media/pci/cx18/cx18-gpio.h b/drivers/media/pci/cx18/cx18-gpio.h
index 0fa4c7ad2286..8d5797dea7f5 100644
--- a/drivers/media/pci/cx18/cx18-gpio.h
+++ b/drivers/media/pci/cx18/cx18-gpio.h
@@ -17,5 +17,4 @@ enum cx18_gpio_reset_type {
 	CX18_GPIO_RESET_XC2028  = 2,
 };
 
-void cx18_reset_ir_gpio(void *data);
 int cx18_reset_tuner_gpio(void *dev, int component, int cmd, int value);
-- 
2.47.0


