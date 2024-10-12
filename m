Return-Path: <linux-media+bounces-19506-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id DB96B99B706
	for <lists+linux-media@lfdr.de>; Sat, 12 Oct 2024 22:44:37 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 02EA91C20F39
	for <lists+linux-media@lfdr.de>; Sat, 12 Oct 2024 20:44:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AC2CD19AD93;
	Sat, 12 Oct 2024 20:44:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=treblig.org header.i=@treblig.org header.b="etiKm8nZ"
X-Original-To: linux-media@vger.kernel.org
Received: from mx.treblig.org (mx.treblig.org [46.235.229.95])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EE3A02F870;
	Sat, 12 Oct 2024 20:44:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=46.235.229.95
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728765870; cv=none; b=XRp7FFsgiDGJj4ERshNtWOBN20UqAPeWvnWD3tBhn4VIVIn2gmNJjo+wAor9u//9JTGAX61i7Zq1msHy+KL9eUIatzOQ8G4HYBl1H9/8j6bDWnTSSmzmYu9D5XN5/KuDDQAwIAbq8iH/8IDB8mTMzDF9DTL8DPu2dmuDs5Yljm8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728765870; c=relaxed/simple;
	bh=DqQ8TADR23F9glOA/4/hTrPIBYvOYumGHjcSYQfPLrI=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=SP1pp2spQajUaAGFVXUGkoAb/IqxZmvkKvYRezkEnKz8ZcqjmpM4ztrZk87mM+3qYDZ4I0WvmDzKgP7eGmFQ7oazm5LBkZMiWQjSUqm0SZcikhAWA39j4WQvQe4N3L7nnsC4ua6K6xD68+vsN7rjPHWMnyMK9Za05jSoXAsWylg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=treblig.org; spf=pass smtp.mailfrom=treblig.org; dkim=pass (2048-bit key) header.d=treblig.org header.i=@treblig.org header.b=etiKm8nZ; arc=none smtp.client-ip=46.235.229.95
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=treblig.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=treblig.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=treblig.org
	; s=bytemarkmx; h=MIME-Version:Message-ID:Date:Subject:From:Content-Type:From
	:Subject; bh=0mV/58/gpM9ql/1N+sZb3ArBaKq8wox/CEwB1sr3YoA=; b=etiKm8nZJnB2g4IT
	1nbpe9Z44Ral/tgSqa4yQfOLctRBlNRhKy40Q9qJpHbOlr75/ZQ23K1FvH7jho/8mabO2LbaHRrJ5
	l7zyjSHsTEH7B5lvxb6MIz4a7AYM+P2ImsFgGzYAy1j4GRo2H+2ZBp6Ru3Jz6NEAXPl+0Qj0Xj204
	+sqX0eEwb3/76LBq9a9Vkv+NbFBzdrutqNeO+Udc7326Ifl4c3Y0lSrkSXSzyHR82ggDmMAnR2BsX
	VKWBOekCADPlcd/JJ7kMvuH5wrGHwl5IDaYs9xbodApAtrQiK1pj8hT2SBQGgwMotfhq022iS7QHH
	X91G2oeauMfUcd7fJw==;
Received: from localhost ([127.0.0.1] helo=dalek.home.treblig.org)
	by mx.treblig.org with esmtp (Exim 4.96)
	(envelope-from <linux@treblig.org>)
	id 1sziyP-00Aiwf-2H;
	Sat, 12 Oct 2024 20:44:25 +0000
From: linux@treblig.org
To: mchehab@kernel.org,
	linux-media@vger.kernel.org
Cc: linux-kernel@vger.kernel.org,
	"Dr. David Alan Gilbert" <linux@treblig.org>
Subject: [PATCH] media: cx231xx: Remove some deadcode
Date: Sat, 12 Oct 2024 21:44:24 +0100
Message-ID: <20241012204424.229512-1-linux@treblig.org>
X-Mailer: git-send-email 2.47.0
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: "Dr. David Alan Gilbert" <linux@treblig.org>

cx231xx_bcount and cx231xx_power_suspend() were added by the original
commit e0d3bafd0258 ("V4L/DVB (10954): Add cx231xx USB driver")
but remained unused.

cx231xx_dump_HH_reg() was added by commit
64fbf4445526 ("[media] cx231xx: Added support for Carraera, Shelby, RDx_253S and VIDEO_GRABBER")
but remained unused.

Remove them.

Signed-off-by: Dr. David Alan Gilbert <linux@treblig.org>
---
 drivers/media/usb/cx231xx/cx231xx-avcore.c | 57 ----------------------
 drivers/media/usb/cx231xx/cx231xx-cards.c  |  1 -
 drivers/media/usb/cx231xx/cx231xx.h        |  3 --
 3 files changed, 61 deletions(-)

diff --git a/drivers/media/usb/cx231xx/cx231xx-avcore.c b/drivers/media/usb/cx231xx/cx231xx-avcore.c
index 3d3c881c8e58..75d4b72cd5a2 100644
--- a/drivers/media/usb/cx231xx/cx231xx-avcore.c
+++ b/drivers/media/usb/cx231xx/cx231xx-avcore.c
@@ -1338,39 +1338,6 @@ void update_HH_register_after_set_DIF(struct cx231xx *dev)
 */
 }
 
-void cx231xx_dump_HH_reg(struct cx231xx *dev)
-{
-	u32 value = 0;
-	u16  i = 0;
-
-	value = 0x45005390;
-	vid_blk_write_word(dev, 0x104, value);
-
-	for (i = 0x100; i < 0x140; i++) {
-		vid_blk_read_word(dev, i, &value);
-		dev_dbg(dev->dev, "reg0x%x=0x%x\n", i, value);
-		i = i+3;
-	}
-
-	for (i = 0x300; i < 0x400; i++) {
-		vid_blk_read_word(dev, i, &value);
-		dev_dbg(dev->dev, "reg0x%x=0x%x\n", i, value);
-		i = i+3;
-	}
-
-	for (i = 0x400; i < 0x440; i++) {
-		vid_blk_read_word(dev, i,  &value);
-		dev_dbg(dev->dev, "reg0x%x=0x%x\n", i, value);
-		i = i+3;
-	}
-
-	vid_blk_read_word(dev, AFE_CTRL_C2HH_SRC_CTRL, &value);
-	dev_dbg(dev->dev, "AFE_CTRL_C2HH_SRC_CTRL=0x%x\n", value);
-	vid_blk_write_word(dev, AFE_CTRL_C2HH_SRC_CTRL, 0x4485D390);
-	vid_blk_read_word(dev, AFE_CTRL_C2HH_SRC_CTRL, &value);
-	dev_dbg(dev->dev, "AFE_CTRL_C2HH_SRC_CTRL=0x%x\n", value);
-}
-
 #if 0
 static void cx231xx_dump_SC_reg(struct cx231xx *dev)
 {
@@ -2460,30 +2427,6 @@ int cx231xx_set_power_mode(struct cx231xx *dev, enum AV_MODE mode)
 	return status;
 }
 
-int cx231xx_power_suspend(struct cx231xx *dev)
-{
-	u8 value[4] = { 0, 0, 0, 0 };
-	u32 tmp = 0;
-	int status = 0;
-
-	status = cx231xx_read_ctrl_reg(dev, VRT_GET_REGISTER, PWR_CTL_EN,
-				       value, 4);
-	if (status > 0)
-		return status;
-
-	tmp = le32_to_cpu(*((__le32 *) value));
-	tmp &= (~PWR_MODE_MASK);
-
-	value[0] = (u8) tmp;
-	value[1] = (u8) (tmp >> 8);
-	value[2] = (u8) (tmp >> 16);
-	value[3] = (u8) (tmp >> 24);
-	status = cx231xx_write_ctrl_reg(dev, VRT_SET_REGISTER, PWR_CTL_EN,
-					value, 4);
-
-	return status;
-}
-
 /******************************************************************************
  *                  S T R E A M    C O N T R O L   functions                  *
  ******************************************************************************/
diff --git a/drivers/media/usb/cx231xx/cx231xx-cards.c b/drivers/media/usb/cx231xx/cx231xx-cards.c
index 92efe6c1f47b..1e7096781ad2 100644
--- a/drivers/media/usb/cx231xx/cx231xx-cards.c
+++ b/drivers/media/usb/cx231xx/cx231xx-cards.c
@@ -990,7 +990,6 @@ struct cx231xx_board cx231xx_boards[] = {
 		} },
 	},
 };
-const unsigned int cx231xx_bcount = ARRAY_SIZE(cx231xx_boards);
 
 /* table of devices that work with this driver */
 struct usb_device_id cx231xx_id_table[] = {
diff --git a/drivers/media/usb/cx231xx/cx231xx.h b/drivers/media/usb/cx231xx/cx231xx.h
index 74339a6a2f71..6b491d175060 100644
--- a/drivers/media/usb/cx231xx/cx231xx.h
+++ b/drivers/media/usb/cx231xx/cx231xx.h
@@ -790,7 +790,6 @@ void cx231xx_set_DIF_bandpass(struct cx231xx *dev, u32 if_freq,
 					 u8 spectral_invert, u32 mode);
 void cx231xx_Setup_AFE_for_LowIF(struct cx231xx *dev);
 void reset_s5h1432_demod(struct cx231xx *dev);
-void cx231xx_dump_HH_reg(struct cx231xx *dev);
 void update_HH_register_after_set_DIF(struct cx231xx *dev);
 
 
@@ -905,7 +904,6 @@ int cx231xx_initialize_stream_xfer(struct cx231xx *dev, u32 media_type);
 
 /* Power control functions */
 int cx231xx_set_power_mode(struct cx231xx *dev, enum AV_MODE mode);
-int cx231xx_power_suspend(struct cx231xx *dev);
 
 /* chip specific control functions */
 int cx231xx_init_ctrl_pin_status(struct cx231xx *dev);
@@ -949,7 +947,6 @@ extern void cx231xx_pre_card_setup(struct cx231xx *dev);
 extern void cx231xx_card_setup(struct cx231xx *dev);
 extern struct cx231xx_board cx231xx_boards[];
 extern struct usb_device_id cx231xx_id_table[];
-extern const unsigned int cx231xx_bcount;
 int cx231xx_tuner_callback(void *ptr, int component, int command, int arg);
 
 /* cx23885-417.c                                               */
-- 
2.47.0


