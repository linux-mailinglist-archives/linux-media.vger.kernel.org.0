Return-Path: <linux-media+bounces-19509-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id B6DF199B7BA
	for <lists+linux-media@lfdr.de>; Sun, 13 Oct 2024 01:40:08 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 1F4E9B21E8D
	for <lists+linux-media@lfdr.de>; Sat, 12 Oct 2024 23:40:06 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C907C19C557;
	Sat, 12 Oct 2024 23:39:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=treblig.org header.i=@treblig.org header.b="QbkpzLuI"
X-Original-To: linux-media@vger.kernel.org
Received: from mx.treblig.org (mx.treblig.org [46.235.229.95])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6125E146599;
	Sat, 12 Oct 2024 23:39:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=46.235.229.95
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728776393; cv=none; b=aDoyxqmRYb9Hz1224Mv2vt5plQlrvE3oYZE31WAr/ezvcqSFHmgVF06wJmPKq36iKCr61h+nUtzBYTrCh/FOtwRcYifTMyd3UkNh6DrLXjvuD024Jw/ljMno36JofwFsc1joTYgb63aOxyjTr85wmyCJBUc5coMTpjCJ2h3jSOQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728776393; c=relaxed/simple;
	bh=QuspS7Z1yoxSEHvpBlqkFEt4IWtxICNmgfeyjmc0H8w=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=EApU4G8Z7KcFzuUUinonmCEUyLN2axcERu+1Ov0sKt06KE8Gw95fKa5ZIBgoN341hNeAYxOei6dhskK1/Y/OXqH9nhht1NbZHe4V1zSs7IVR/WqKqPK/b+YEuCJPeAOEX71RhdVB1R8zmL5/dcCuGhdxDHjH7l8C4tZ1UVXKFgs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=treblig.org; spf=pass smtp.mailfrom=treblig.org; dkim=pass (2048-bit key) header.d=treblig.org header.i=@treblig.org header.b=QbkpzLuI; arc=none smtp.client-ip=46.235.229.95
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=treblig.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=treblig.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=treblig.org
	; s=bytemarkmx; h=MIME-Version:Message-ID:Date:Subject:From:Content-Type:From
	:Subject; bh=GUJpFIpSrR8SR/3CNhEGf1j9MMgokexURCyoh/+6FfY=; b=QbkpzLuIiwnid6vl
	hRcSd8PVyj//FuwjG0odPTvzmweGlzz1qxNyFiMaHeIulMOsJPOWq818ulCZPDiVTF2nyWmnUUNVp
	xg9SfrrsjnNEcmwHOkUZgwEL9SCMQGNvjhxP2nMfbHJTVFGbiTXUF35s0b1rLgaAmMfE0vqD1+fFH
	jMgyJycZFQglk3RhR90YUOXrsk6dtnWKkWmHfqoH4FzziJw0HOfV/hQsNgPYbv0u+Ff3TtC1Dr/O6
	/oyclz2NLkIpAbAckw0Fvy7ETE2rFcpp60c6m2aIKHKDdYbD6qzDsEQEI+wRxcGeb87c1FLzOKgLf
	s523msdYQmMuu7o2hA==;
Received: from localhost ([127.0.0.1] helo=dalek.home.treblig.org)
	by mx.treblig.org with esmtp (Exim 4.96)
	(envelope-from <linux@treblig.org>)
	id 1szli9-00AjOi-0c;
	Sat, 12 Oct 2024 23:39:49 +0000
From: linux@treblig.org
To: mchehab@kernel.org,
	linux-media@vger.kernel.org
Cc: linux-kernel@vger.kernel.org,
	"Dr. David Alan Gilbert" <linux@treblig.org>
Subject: [PATCH v2] media: cx231xx: Remove some deadcode
Date: Sun, 13 Oct 2024 00:39:48 +0100
Message-ID: <20241012233948.255235-1-linux@treblig.org>
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

cx231xx_dump_HH_reg() was added by
commit 64fbf4445526 ("[media] cx231xx: Added support for Carraera, Shelby,
RDx_253S and VIDEO_GRABBER")
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


