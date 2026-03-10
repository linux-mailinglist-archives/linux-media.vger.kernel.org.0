Return-Path: <linux-media+bounces-55232-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id oFLTFuB5sGnLjgIAu9opvQ
	(envelope-from <linux-media+bounces-55232-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Tue, 10 Mar 2026 21:06:56 +0100
X-Original-To: lists+linux-media@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id C8D842575A1
	for <lists+linux-media@lfdr.de>; Tue, 10 Mar 2026 21:06:55 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 75A20303B17C
	for <lists+linux-media@lfdr.de>; Tue, 10 Mar 2026 20:06:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A63443E9283;
	Tue, 10 Mar 2026 20:06:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="EigOO2GA"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-pf1-f178.google.com (mail-pf1-f178.google.com [209.85.210.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 01E9F3E8C5F
	for <linux-media@vger.kernel.org>; Tue, 10 Mar 2026 20:06:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773173211; cv=none; b=gb1wTQKWGBXgkslZudGwJerc1PDpAFErWJm+RpEj6t2iPH8fKYLYCqHj2MvgLRcUv0YcQ9RHz0OD4nct2ytSQCsb9ngIkTOgzrgyMKg4wdMqaJnjhklPA6apAoMCW5XSoUYrXmKpc04JAH+7LpVVsfdxifbUEteQeET1gokfXDI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773173211; c=relaxed/simple;
	bh=BAEAEao8zGcfEPk3ro9fqvnx7VdR1iceehL4mhJX3gE=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=CfmJHveS5rb4sR3Dcrt9O9QgMmTA9KTVvT+oeWepeamdViPcB9rHOfWh656/r56qA1Vrmi1gBs985iTrwR0+RNDgZd2fU7FbHErrEJCGfswiXBoCXZuyrhtRKG4YVnvZhwUFGzlDd3Cn4bhzM9aFV6WMZ8e+BAzVvXuEjvUR95w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=EigOO2GA; arc=none smtp.client-ip=209.85.210.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pf1-f178.google.com with SMTP id d2e1a72fcca58-82735a41920so4945703b3a.2
        for <linux-media@vger.kernel.org>; Tue, 10 Mar 2026 13:06:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1773173209; x=1773778009; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=maRFdwFBItYsUxmd+9t8qBnRnOAkqFEhAXgbmQcZeFE=;
        b=EigOO2GAx+kVSZimumtEPDu4LKmq2DjuZInKvZEiWrNgyNxGtxYewUQpkhw5N857iF
         kRClGOzhUZJYqu3f0tJINcNxLx9pYBrOBIywdBeslV0fbKsAE2pABBtcN/JVV14IHsk5
         SE0lgBA1e9Ewj8hIzppr77j+AgdyRjkJYcEhRfhpTU3MMaNF11xTUquCaKk4oEWjb8Ik
         AKQ/Et6KMDWVWdM/7qfJA3gYRDCIsiDlg/WsWf3qMhMtrjwqsUKAbQPYfSOEYewfOdeO
         odJ3zuMoRbdENb0NlUBLZIhIngOPnnN/6Yu3tTL0b4CZsa+Iu+AazNCXAtBskxUFbvnj
         3lGA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1773173209; x=1773778009;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=maRFdwFBItYsUxmd+9t8qBnRnOAkqFEhAXgbmQcZeFE=;
        b=gwqOfCjmATTiU3Cbog/+Xxr0ucZe43tvLYHWENA7vnig6KPUoMPKNzhRHyVSKJJShI
         Mu1X4RZWa0eM4+fq4nV5zYU2VDBM+vU50+IcRFfWuunqfwQztptieP7nv78NIweLO/g5
         XRhkP2vDvyPlJUYx1u23otOC9BGTje8OnwRDzqUPbSGe6rfacSnjq5imhkW2VrzFtnI8
         fWqwE0ayhixuDTuIoWDrno+/C2vbIcDVIA23tdOwM23Su9U8OI44jRpzknblTMPtwDOk
         N8n5N3UY+nwbY/w6VGSQa/2lQ1GK6/j1Ejdq7zvs8l3qmHzbnwQeGW1QtV3WijTWKzBd
         46tg==
X-Forwarded-Encrypted: i=1; AJvYcCXWKyqOxiIym+mc5D4TugmUt8qut9SBJuXyQbLFq3xsirROOqNpC7EjqJpn0luOrRgMDagAHT+aFS1z2g==@vger.kernel.org
X-Gm-Message-State: AOJu0YyMrFgKqAEub7CRsSbZp90FyIegAqm0Qp6JiVFsC9RG8WCDNCLZ
	2Uyyj1qjJKlGU/svTfdNyaPJyr8Cry06ntE8DcYGHqXqxvULMDYkayQi
X-Gm-Gg: ATEYQzwM7NFTaOs6jTZ8IfSK1L14szYtTgjZ+rqIv4mvsgoXUe5YuRTMPLGkHCVXTsw
	qbHKNSdGMx5v2U2zRMg28p9peKD4sN98pPaClcHRlbY4QPKW++uCIvvprX+OFNkR+KPwM9G+rjF
	MGbHGIQibYyfjPExnHBKbo5FF+1ziA12AL3D4XIjv6UcHjz2ZS9gXi5/kD44dmhw4qEsDCSjxTU
	06Q5itG8jt3Bhb2G15jyMIPat3mN3Th0/6YqsuLjBezn1uLs8i6M9WHizsbB+mUwP52zWMC4Hbg
	/l1w7/Pr7qUDojMNw6sELSBFZ8T/ujryMa7tx5Ba7w+whB2Ipf7qD6k3BVFYDzHAnZtbrM7DBMy
	i4HlqKFE7GPb5eYkmPwQbvzKvfyB9ZN4Oc46P9XpcrS6bSIN9YdTz93AJiLGs6hliLFrZlqgNs5
	+Aym4hiD/s5slBeyfr5kMr6mIiOkeHlDh0LksdA4OoCS3bQix3
X-Received: by 2002:a05:6a00:ac0f:b0:829:7e6d:cf1f with SMTP id d2e1a72fcca58-829f721be36mr107593b3a.51.1773173209251;
        Tue, 10 Mar 2026 13:06:49 -0700 (PDT)
Received: from hu-ckantibh-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-829f6dc2d0asm101660b3a.13.2026.03.10.13.06.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Mar 2026 13:06:48 -0700 (PDT)
From: Sanjay Chitroda <sanjayembeddedse@gmail.com>
X-Google-Original-From: Sanjay Chitroda <sanjayembedded@gmail.com>
To: jic23@kernel.org,
	m.tretter@pengutronix.de,
	mchehab@kernel.org,
	p.zabel@pengutronix.de,
	tiffany.lin@mediatek.com,
	andrew-ct.chen@mediatek.com,
	yunfei.dong@mediatek.com,
	matthias.bgg@gmail.com,
	angelogioacchino.delregno@collabora.com,
	johan@kernel.org,
	elder@kernel.org,
	gregkh@linuxfoundation.org,
	pure.logic@nexus-software.ie
Cc: dlechner@baylibre.com,
	nuno.sa@analog.com,
	andy@kernel.org,
	kernel@pengutronix.de,
	kees@kernel.org,
	nabijaczleweli@nabijaczleweli.xyz,
	marcelo.schmitt1@gmail.com,
	maudspierings@gocontroll.com,
	hverkuil+cisco@kernel.org,
	ribalda@chromium.org,
	straube.linux@gmail.com,
	dan.carpenter@linaro.org,
	lukagejak5@gmail.com,
	ethantidmore06@gmail.com,
	samasth.norway.ananda@oracle.com,
	karanja99erick@gmail.com,
	s9430939@naver.com,
	tglx@kernel.org,
	mingo@kernel.org,
	sun.jian.kdev@gmail.com,
	weibu@redadmin.org,
	linux-iio@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-media@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	greybus-dev@lists.linaro.org,
	linux-staging@lists.linux.dev,
	sanjayembeddedse@gmail.com,
	skhan@linuxfoundation.org
Subject: [PATCH 7/7] staging: rtl8723bs: simplify cleanup using __free
Date: Wed, 11 Mar 2026 01:35:13 +0530
Message-Id: <20260310200513.2162018-8-sanjayembedded@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260310200513.2162018-1-sanjayembedded@gmail.com>
References: <20260310200513.2162018-1-sanjayembedded@gmail.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Rspamd-Queue-Id: C8D842575A1
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.16 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20230601];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCPT_COUNT_TWELVE(0.00)[43];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_CC(0.00)[baylibre.com,analog.com,kernel.org,pengutronix.de,nabijaczleweli.xyz,gmail.com,gocontroll.com,chromium.org,linaro.org,oracle.com,naver.com,redadmin.org,vger.kernel.org,lists.infradead.org,lists.linaro.org,lists.linux.dev,linuxfoundation.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-55232-lists,linux-media=lfdr.de];
	FREEMAIL_TO(0.00)[kernel.org,pengutronix.de,mediatek.com,gmail.com,collabora.com,linuxfoundation.org,nexus-software.ie];
	DKIM_TRACE(0.00)[gmail.com:+];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	FREEMAIL_FROM(0.00)[gmail.com];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[sanjayembeddedse@gmail.com,linux-media@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_NONE(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-media,cisco];
	FROM_HAS_DN(0.00)[]
X-Rspamd-Action: no action

From: Sanjay Chitroda <sanjayembeddedse@gmail.com>

Replace manual cleanup logic with __free attribute from cleanup.h. This
removes explicit kfree() calls and simplifies the error handling paths.

No functional change intended for kmalloc().

Signed-off-by: Sanjay Chitroda <sanjayembeddedse@gmail.com>
---
 .../staging/rtl8723bs/hal/rtl8723b_hal_init.c | 13 ++-----
 drivers/staging/rtl8723bs/hal/sdio_ops.c      | 37 ++++---------------
 2 files changed, 11 insertions(+), 39 deletions(-)

diff --git a/drivers/staging/rtl8723bs/hal/rtl8723b_hal_init.c b/drivers/staging/rtl8723bs/hal/rtl8723b_hal_init.c
index 8d259820f103..2badf7d1aec4 100644
--- a/drivers/staging/rtl8723bs/hal/rtl8723b_hal_init.c
+++ b/drivers/staging/rtl8723bs/hal/rtl8723b_hal_init.c
@@ -627,7 +627,6 @@ static void hal_ReadEFuse_WiFi(
 	u8 *pbuf
 )
 {
-	u8 *efuseTbl = NULL;
 	u16 eFuse_Addr = 0;
 	u8 offset, wden;
 	u8 efuseHeader, efuseExtHdr, efuseData;
@@ -640,7 +639,7 @@ static void hal_ReadEFuse_WiFi(
 	if ((_offset + _size_byte) > EFUSE_MAX_MAP_LEN)
 		return;
 
-	efuseTbl = kmalloc(EFUSE_MAX_MAP_LEN, GFP_ATOMIC);
+	u8 *efuseTbl __free(kfree) = kmalloc(EFUSE_MAX_MAP_LEN, GFP_ATOMIC);
 	if (!efuseTbl)
 		return;
 
@@ -702,8 +701,6 @@ static void hal_ReadEFuse_WiFi(
 
 	rtw_hal_set_hwreg(padapter, HW_VAR_EFUSE_BYTES, (u8 *)&used);
 	rtw_hal_set_hwreg(padapter, HW_VAR_EFUSE_USAGE, (u8 *)&efuse_usage);
-
-	kfree(efuseTbl);
 }
 
 static void hal_ReadEFuse_BT(
@@ -713,7 +710,6 @@ static void hal_ReadEFuse_BT(
 	u8 *pbuf
 )
 {
-	u8 *efuseTbl;
 	u8 bank;
 	u16 eFuse_Addr;
 	u8 efuseHeader, efuseExtHdr, efuseData;
@@ -728,7 +724,7 @@ static void hal_ReadEFuse_BT(
 	if ((_offset + _size_byte) > EFUSE_BT_MAP_LEN)
 		return;
 
-	efuseTbl = kmalloc(EFUSE_BT_MAP_LEN, GFP_ATOMIC);
+	u8 *efuseTbl __free(kfree) = kmalloc(EFUSE_BT_MAP_LEN, GFP_ATOMIC);
 	if (!efuseTbl)
 		return;
 
@@ -739,7 +735,7 @@ static void hal_ReadEFuse_BT(
 
 	for (bank = 1; bank < 3; bank++) { /*  8723b Max bake 0~2 */
 		if (hal_EfuseSwitchToBank(padapter, bank) == false)
-			goto exit;
+			return;
 
 		eFuse_Addr = 0;
 
@@ -804,9 +800,6 @@ static void hal_ReadEFuse_BT(
 
 	rtw_hal_set_hwreg(padapter, HW_VAR_EFUSE_BT_BYTES, (u8 *)&used);
 	rtw_hal_set_hwreg(padapter, HW_VAR_EFUSE_BT_USAGE, (u8 *)&efuse_usage);
-
-exit:
-	kfree(efuseTbl);
 }
 
 void Hal_ReadEFuse(
diff --git a/drivers/staging/rtl8723bs/hal/sdio_ops.c b/drivers/staging/rtl8723bs/hal/sdio_ops.c
index c9cb20c61a2b..303139a75551 100644
--- a/drivers/staging/rtl8723bs/hal/sdio_ops.c
+++ b/drivers/staging/rtl8723bs/hal/sdio_ops.c
@@ -179,9 +179,7 @@ static u32 sdio_read32(struct intf_hdl *intfhdl, u32 addr)
 	if (shift == 0) {
 		val = sd_read32(intfhdl, ftaddr, NULL);
 	} else {
-		u8 *tmpbuf;
-
-		tmpbuf = kmalloc(8, GFP_ATOMIC);
+		u8 *tmpbuf __free(kfree) = kmalloc(8, GFP_ATOMIC);
 		if (!tmpbuf)
 			return SDIO_ERR_VAL32;
 
@@ -189,8 +187,6 @@ static u32 sdio_read32(struct intf_hdl *intfhdl, u32 addr)
 		sd_read(intfhdl, ftaddr, 8, tmpbuf);
 		memcpy(&le_tmp, tmpbuf + shift, 4);
 		val = le32_to_cpu(le_tmp);
-
-		kfree(tmpbuf);
 	}
 	return val;
 }
@@ -223,19 +219,17 @@ static s32 sdio_readN(struct intf_hdl *intfhdl, u32 addr, u32 cnt, u8 *buf)
 	if (shift == 0) {
 		err = sd_read(intfhdl, ftaddr, cnt, buf);
 	} else {
-		u8 *tmpbuf;
 		u32 n;
 
 		ftaddr &= ~(u16)0x3;
 		n = cnt + shift;
-		tmpbuf = kmalloc(n, GFP_ATOMIC);
+		u8 *tmpbuf __free(kfree) = kmalloc(n, GFP_ATOMIC);
 		if (!tmpbuf)
 			return -ENOMEM;
 
 		err = sd_read(intfhdl, ftaddr, n, tmpbuf);
 		if (!err)
 			memcpy(buf, tmpbuf + shift, cnt);
-		kfree(tmpbuf);
 	}
 	return err;
 }
@@ -326,22 +320,18 @@ static s32 sdio_writeN(struct intf_hdl *intfhdl, u32 addr, u32 cnt, u8 *buf)
 	if (shift == 0) {
 		err = sd_write(intfhdl, ftaddr, cnt, buf);
 	} else {
-		u8 *tmpbuf;
 		u32 n;
 
 		ftaddr &= ~(u16)0x3;
 		n = cnt + shift;
-		tmpbuf = kmalloc(n, GFP_ATOMIC);
+		u8 *tmpbuf __free(kfree) = kmalloc(n, GFP_ATOMIC);
 		if (!tmpbuf)
 			return -ENOMEM;
 		err = sd_read(intfhdl, ftaddr, 4, tmpbuf);
-		if (err) {
-			kfree(tmpbuf);
+		if (err)
 			return err;
-		}
 		memcpy(tmpbuf + shift, buf, cnt);
 		err = sd_write(intfhdl, ftaddr, n, tmpbuf);
-		kfree(tmpbuf);
 	}
 	return err;
 }
@@ -491,7 +481,6 @@ static s32 _sdio_local_read(
 	struct intf_hdl *intfhdl;
 	u8 mac_pwr_ctrl_on;
 	s32 err;
-	u8 *tmpbuf;
 	u32 n;
 
 	intfhdl = &adapter->iopriv.intf;
@@ -503,7 +492,7 @@ static s32 _sdio_local_read(
 		return _sd_cmd52_read(intfhdl, addr, cnt, buf);
 
 	n = round_up(cnt, 4);
-	tmpbuf = kmalloc(n, GFP_ATOMIC);
+	u8 *tmpbuf __free(kfree) = kmalloc(n, GFP_ATOMIC);
 	if (!tmpbuf)
 		return -ENOMEM;
 
@@ -511,8 +500,6 @@ static s32 _sdio_local_read(
 	if (!err)
 		memcpy(buf, tmpbuf, cnt);
 
-	kfree(tmpbuf);
-
 	return err;
 }
 
@@ -529,7 +516,6 @@ s32 sdio_local_read(
 	struct intf_hdl *intfhdl;
 	u8 mac_pwr_ctrl_on;
 	s32 err;
-	u8 *tmpbuf;
 	u32 n;
 
 	intfhdl = &adapter->iopriv.intf;
@@ -544,7 +530,7 @@ s32 sdio_local_read(
 		return sd_cmd52_read(intfhdl, addr, cnt, buf);
 
 	n = round_up(cnt, 4);
-	tmpbuf = kmalloc(n, GFP_ATOMIC);
+	u8 *tmpbuf __free(kfree) = kmalloc(n, GFP_ATOMIC);
 	if (!tmpbuf)
 		return -ENOMEM;
 
@@ -552,8 +538,6 @@ s32 sdio_local_read(
 	if (!err)
 		memcpy(buf, tmpbuf, cnt);
 
-	kfree(tmpbuf);
-
 	return err;
 }
 
@@ -570,7 +554,6 @@ s32 sdio_local_write(
 	struct intf_hdl *intfhdl;
 	u8 mac_pwr_ctrl_on;
 	s32 err;
-	u8 *tmpbuf;
 
 	intfhdl = &adapter->iopriv.intf;
 
@@ -583,7 +566,7 @@ s32 sdio_local_write(
 	)
 		return sd_cmd52_write(intfhdl, addr, cnt, buf);
 
-	tmpbuf = kmalloc(cnt, GFP_ATOMIC);
+	u8 *tmpbuf __free(kfree) = kmalloc(cnt, GFP_ATOMIC);
 	if (!tmpbuf)
 		return -ENOMEM;
 
@@ -591,8 +574,6 @@ s32 sdio_local_write(
 
 	err = sd_write(intfhdl, addr, cnt, tmpbuf);
 
-	kfree(tmpbuf);
-
 	return err;
 }
 
@@ -880,16 +861,14 @@ void sd_int_dpc(struct adapter *adapter)
 	}
 
 	if (hal->sdio_hisr & SDIO_HISR_TXERR) {
-		u8 *status;
 		u32 addr;
 
-		status = kmalloc(4, GFP_ATOMIC);
+		u8 *status  __free(kfree) = kmalloc(4, GFP_ATOMIC);
 		if (status) {
 			addr = REG_TXDMA_STATUS;
 			hal_sdio_get_cmd_addr_8723b(adapter, WLAN_IOREG_DEVICE_ID, addr, &addr);
 			_sd_read(intfhdl, addr, 4, status);
 			_sd_write(intfhdl, addr, 4, status);
-			kfree(status);
 		}
 	}
 
-- 
2.34.1


