Return-Path: <linux-media+bounces-26483-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 98910A3DDBB
	for <lists+linux-media@lfdr.de>; Thu, 20 Feb 2025 16:06:39 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 8AA2317489E
	for <lists+linux-media@lfdr.de>; Thu, 20 Feb 2025 15:03:36 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 843A81F4739;
	Thu, 20 Feb 2025 15:02:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=treblig.org header.i=@treblig.org header.b="FSQNxDpI"
X-Original-To: linux-media@vger.kernel.org
Received: from mx.treblig.org (mx.treblig.org [46.235.229.95])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CD7991D63FC;
	Thu, 20 Feb 2025 15:02:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=46.235.229.95
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740063764; cv=none; b=l4vAmgE0yFQ/2ye9oCdqDku46QLe7c3TiFr33IjQQ5RuBQlgS13zqyDjDdq1UNCsU9SAVKSHJvuRTx2nBckUzEvQALsD9juow5bQ4VR0oY9hmj1Vc5ZNP+h0ltf+bYBBI/4Gpr4n9FCpg2JwLfhKwMjN45GhT0gGBJT76SymvtU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740063764; c=relaxed/simple;
	bh=mfM1u1quiUiyOMcUZ92oEGwr5kt92RscXTp/MbNlBto=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=UCtaMoaEZVhOQ6GygStvaep1Sl6AMVupUHg078kSMC0nyIk+asy2CzlFdxs8VjJr5K0Us8WClYBI9LmtwSbgl+Z0+XB3emMQnLhfm8WURmYv34RUwr6np9xLmzi3IiX8PeXCFU8ObJnb4yVmTSJAs/jyTWtY5KC5Uui3ITovznw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=treblig.org; spf=pass smtp.mailfrom=treblig.org; dkim=pass (2048-bit key) header.d=treblig.org header.i=@treblig.org header.b=FSQNxDpI; arc=none smtp.client-ip=46.235.229.95
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=treblig.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=treblig.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=treblig.org
	; s=bytemarkmx; h=MIME-Version:Message-ID:Date:Subject:From:Content-Type:From
	:Subject; bh=ukUey4M6jiTv3UP6HWap1r9obm5qLu4T/awObGIx2Tw=; b=FSQNxDpI1iJF0Qpl
	TvDvDa+gS+JAuywuq54OOT7/kW4FC29l/9LT4vTllCcQ2eVLUFt5poN04Z0petohALMHftIIzIsY/
	RIoq+buM4g8EZiJLRcsqKEVbax9xKW0M+jRV5YdUztdOhlX3KoIRnBcDIAn/14fxyDgrQflBYY6xv
	JQXpXd4JseJitQ1r7w+78iBOZtjpYX74FQJJeCVtZZwgA9ues7bngBak/ULBADgzEpZecxkTcEGUR
	trQ6B3X2Myb0NQ6fsSKVRYP7GLimDvBKONqAabrILGcH/fp6bXh8yRhHUD7XEwdTIyNDqNoihos0d
	pbWAsZxH8HaS1gtdFQ==;
Received: from localhost ([127.0.0.1] helo=dalek.home.treblig.org)
	by mx.treblig.org with esmtp (Exim 4.96)
	(envelope-from <linux@treblig.org>)
	id 1tl84V-00HCmY-1V;
	Thu, 20 Feb 2025 15:02:39 +0000
From: linux@treblig.org
To: mchehab@kernel.org,
	linux-media@vger.kernel.org
Cc: linux-kernel@vger.kernel.org,
	"Dr. David Alan Gilbert" <linux@treblig.org>
Subject: [PATCH] [media] cx23885: Remove unused netup_eeprom_write
Date: Thu, 20 Feb 2025 15:02:38 +0000
Message-ID: <20250220150238.77737-1-linux@treblig.org>
X-Mailer: git-send-email 2.48.1
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: "Dr. David Alan Gilbert" <linux@treblig.org>

netup_eeprom_write() was added in 2009 by
commit b45c0551f94d ("V4L/DVB (10797): Add EEPROM code for NetUP Dual
DVB-S2 CI card.")
but has remained unused.

Remove it.

Signed-off-by: Dr. David Alan Gilbert <linux@treblig.org>
---
 drivers/media/pci/cx23885/netup-eeprom.c | 29 ------------------------
 drivers/media/pci/cx23885/netup-eeprom.h |  1 -
 2 files changed, 30 deletions(-)

diff --git a/drivers/media/pci/cx23885/netup-eeprom.c b/drivers/media/pci/cx23885/netup-eeprom.c
index 26dd5b3884e6..335d150d81de 100644
--- a/drivers/media/pci/cx23885/netup-eeprom.c
+++ b/drivers/media/pci/cx23885/netup-eeprom.c
@@ -49,35 +49,6 @@ int netup_eeprom_read(struct i2c_adapter *i2c_adap, u8 addr)
 	return buf[1];
 };
 
-int netup_eeprom_write(struct i2c_adapter *i2c_adap, u8 addr, u8 data)
-{
-	int ret;
-	unsigned char bufw[2];
-
-	/* Write into EEPROM */
-	struct i2c_msg msg[] = {
-		{
-			.addr	= EEPROM_I2C_ADDR,
-			.flags	= 0,
-			.buf	= &bufw[0],
-			.len	= 2
-		}
-	};
-
-	bufw[0] = addr;
-	bufw[1] = data;
-
-	ret = i2c_transfer(i2c_adap, msg, 1);
-
-	if (ret != 1) {
-		pr_err("eeprom i2c write error, status=%d\n", ret);
-		return -1;
-	}
-
-	mdelay(10); /* prophylactic delay, datasheet write cycle time = 5 ms */
-	return 0;
-};
-
 void netup_get_card_info(struct i2c_adapter *i2c_adap,
 				struct netup_card_info *cinfo)
 {
diff --git a/drivers/media/pci/cx23885/netup-eeprom.h b/drivers/media/pci/cx23885/netup-eeprom.h
index 549a033679f7..fb8217eb455c 100644
--- a/drivers/media/pci/cx23885/netup-eeprom.h
+++ b/drivers/media/pci/cx23885/netup-eeprom.h
@@ -21,7 +21,6 @@ struct netup_card_info {
 };
 
 extern int netup_eeprom_read(struct i2c_adapter *i2c_adap, u8 addr);
-extern int netup_eeprom_write(struct i2c_adapter *i2c_adap, u8 addr, u8 data);
 extern void netup_get_card_info(struct i2c_adapter *i2c_adap,
 				struct netup_card_info *cinfo);
 
-- 
2.48.1


