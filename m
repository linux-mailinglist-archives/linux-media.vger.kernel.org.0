Return-Path: <linux-media+bounces-26509-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id BD75FA3E192
	for <lists+linux-media@lfdr.de>; Thu, 20 Feb 2025 17:58:02 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 7DAD34223D8
	for <lists+linux-media@lfdr.de>; Thu, 20 Feb 2025 16:56:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A5CD8213E76;
	Thu, 20 Feb 2025 16:55:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=treblig.org header.i=@treblig.org header.b="qrzPGkln"
X-Original-To: linux-media@vger.kernel.org
Received: from mx.treblig.org (mx.treblig.org [46.235.229.95])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 431EA213E60;
	Thu, 20 Feb 2025 16:55:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=46.235.229.95
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740070523; cv=none; b=rCKs+5NrM1duE6e0zRIwkHeJmT4PlAvQZvJJyxG1eFfyNycnP8rVXS1UaB52AuanvxT6scXJB0/etRSYX21CVZbbpBPuOYGeJw4hdjNMM5rZghXQFJIgblAYAiRiAXvCYVQthFJuzFqVdqMuo9URA3eCOTrEvrZ1a12GSWf4Im8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740070523; c=relaxed/simple;
	bh=W3xf8oNcxeIPi8KHx6pAbhvHklqHBpNMVJmf36uea+Q=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=FMQZrwbuKSPFP8deSwgVJgvcyahtL3sLxPDce+iXXMrKt/g+8jjRcFryNVo4KqslPdxncyl5ia6HDuEfIDcnLvJMrCSpNYZ0sU34CgWztWIjxlK7MnXzLmrNMQZm5AGVggApbs2WlA87B4CIpvsknm5EWNkNdcSZ2sYqeJj6QOE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=treblig.org; spf=pass smtp.mailfrom=treblig.org; dkim=pass (2048-bit key) header.d=treblig.org header.i=@treblig.org header.b=qrzPGkln; arc=none smtp.client-ip=46.235.229.95
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=treblig.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=treblig.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=treblig.org
	; s=bytemarkmx; h=MIME-Version:Message-ID:Date:Subject:From:Content-Type:From
	:Subject; bh=j1t4UukDcNPEvN/EfiBjj5zFGzaIb7XD/Y11v157nf0=; b=qrzPGklnThiYuDGR
	hVFfOllqqy3VVwhIHF9aqL1+tco+/+zSbMaqR5elfJULWzTDQSRnX+KJIddUqxRuIaLy1vKpmDnlZ
	pM4cywS59+kFJQOCmi7QyWCLN+Dm9ySbxA5gs8ROpg8epUJiJ1/kd3u2IeiXkFXs48LPGGGonN3gV
	f19pK72gRatZiOpEuetHfQVVe7W+rrlKGGANBo05dfDrF62xvfktVPNIorsUPO2Q4mc29hI3Bz2BB
	bFOH48UezMU01YbRr68J/zcmfsAB0hehMH2KVhambWlVzi7A40fN39r8+czoItlF1ba7ktEwS0R6B
	nNG4s+8ovo3gV8uUOA==;
Received: from localhost ([127.0.0.1] helo=dalek.home.treblig.org)
	by mx.treblig.org with esmtp (Exim 4.96)
	(envelope-from <linux@treblig.org>)
	id 1tl9pV-00HFH9-2o;
	Thu, 20 Feb 2025 16:55:17 +0000
From: linux@treblig.org
To: mchehab@kernel.org,
	linux-media@vger.kernel.org
Cc: linux-kernel@vger.kernel.org,
	"Dr. David Alan Gilbert" <linux@treblig.org>
Subject: [PATCH v2] media: cx23885: Remove unused netup_eeprom_write
Date: Thu, 20 Feb 2025 16:55:16 +0000
Message-ID: <20250220165516.81909-1-linux@treblig.org>
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
v2: Just fix the prefix

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


