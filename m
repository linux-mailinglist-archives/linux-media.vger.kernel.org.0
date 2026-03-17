Return-Path: <linux-media+bounces-56127-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id mCegE7W+uWnJMQIAu9opvQ
	(envelope-from <linux-media+bounces-56127-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Tue, 17 Mar 2026 21:51:01 +0100
X-Original-To: lists+linux-media@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 997FC2B269B
	for <lists+linux-media@lfdr.de>; Tue, 17 Mar 2026 21:51:00 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 008C03073199
	for <lists+linux-media@lfdr.de>; Tue, 17 Mar 2026 20:50:58 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BE96538BF61;
	Tue, 17 Mar 2026 20:50:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nextdimension.cc header.i=@nextdimension.cc header.b="AeLbuTKd"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-yw1-f169.google.com (mail-yw1-f169.google.com [209.85.128.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B305A348477
	for <linux-media@vger.kernel.org>; Tue, 17 Mar 2026 20:50:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773780657; cv=none; b=Aar4mXJgscH47WlVafHKX5Lzh0wt2i1tuDsgQL9r16phumlSjhSe8SYpyPEgn9rKGz0xB36SOyWHcuW9XYH0EOFt7BE0kirjwnR7Mmu7+G1j5NS5sZtDRe7MWHft2aGej2lfDBOxfxLixlecc7TCpGelQLMDL8oLclOy0OvhyIM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773780657; c=relaxed/simple;
	bh=ZyjMYLKBo7s2KWKLBVJX4aUWbNslhhZy1C0ALnrEdwA=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=VCsrRO7DRUTzoKMitdEnNcvpFQPQMWUFuMDl2xAmQ6ILcmowOwVVPWCeMLEvPN+P3bsgqYD7CiOUDrIk9wrzpEWXshvpra0TJmTkkVxRBIBl8Ywv2giskooiRfjwXkoQCYLSTA2VHsUb8ee6Oa8XPhoGmWKWlQ1Ryl+7B1NJcH8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=nextdimension.cc; spf=pass smtp.mailfrom=nextdimension.cc; dkim=pass (2048-bit key) header.d=nextdimension.cc header.i=@nextdimension.cc header.b=AeLbuTKd; arc=none smtp.client-ip=209.85.128.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=nextdimension.cc
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nextdimension.cc
Received: by mail-yw1-f169.google.com with SMTP id 00721157ae682-7986fb839f5so489827b3.0
        for <linux-media@vger.kernel.org>; Tue, 17 Mar 2026 13:50:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=nextdimension.cc; s=google; t=1773780654; x=1774385454; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=H+fHEPAOU3ArHWhbKFN+wkMKnVA+eM6U/YMQDwfEqtg=;
        b=AeLbuTKdOdphSFbGQOrdxVb99Q1bPJPVbwXG1RyF1xEckxVfeGUokJdhYriTzNjM4Y
         gDGrY61V+a5qNF2AneQW9gQvqG+Mc9gp6nBXhSPB9CTLKOO7DMNL/I3TMzMs3MKdPS6n
         BSmin8/D5q2u7spLpm9DMKcW1xm+p6HzuU1Hfe8YTtAr+AqJNkdv+Cd5cXDp93sfBiPf
         BUMAXQecJbiak32wI/B2uSRwN2IXXajakLdVNa17aBG58oj1vP+gl+/CubEqML2n8aPZ
         Pnixz4lsPHaC42WCU+duDTTKK3St9J/5DoQ8WNY3J9o/C1VkRV1sQ/p/ibATB4LqIRSF
         CX/Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773780654; x=1774385454;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=H+fHEPAOU3ArHWhbKFN+wkMKnVA+eM6U/YMQDwfEqtg=;
        b=VDCChFXr193gacdSP5dkSaAAuWG5j+yrSGOG0hd9Ag+BR+OI2OxorRBWeQsCN1QPTs
         kIYapAq1LU+NVDBhp0Fj6Bmmqyx0Dn2PHF3xV6ZoU1ov54r5+YLENhAcrd3RJZrpYjrX
         Y6jJKjEK4rJs3MuFyDyhL/DEIZLWzyG9LG/QEAs/zVM/TsDL4uF9y4gjH1D+qZlM24aU
         R/uW+3YlxJhg5qEnipuaQkBIyT4b8KyIdaotyj0niLIbJghgC4eBPbTXHVHDQsBOaPPA
         kJj4eUqSoEFpkM8dH4DxUUHEdt9l8FEVeFBvZZoIcIeN5AY9GpKl0R310tpvhCIKq3rh
         obhQ==
X-Gm-Message-State: AOJu0YzcMQualh4AlaaOp3PU6eU8gxDedqBk3v9hycEpTSd5YoN9IU2/
	l14d+XabW+QVuJz0ZtIeGp7fZC//DFV1MttyX3TEKXV9TYBYNogSKWdoaltk1w+d4JG7l+7B7JO
	UvWG5kXk=
X-Gm-Gg: ATEYQzxo0lGTX5odDIQHIPxJ0jq+MGGWhncPObQgcWPgzNprdmMYlm22OP6FAgladY8
	FbvSAQfg2HyV3eDWHoCboaIzcRaHcn/8cM87s+xYdpYnFAzJd5O3AvR+t8pIqBk9SLKLkbFJYAW
	XOkvvtiG4Kmfc6atwDy5rCgHztM2gnezHTzVs9SuA5V4O8OS729WPMjyTnq7emYpruDESi0ADNq
	RlxsGUw2FPmozWXaoO1VEmo1VH6t2KdjfYs3OISg9URNkmTYn7xKN3gt76888uRkbFeWBL2goDg
	YFRc8J9OkLqySK4+2H+N9vssPQFKoCggtz/w4QaZCUSF/0nQwiQf9vMxBJYljT8EoL1IvmOvPQB
	HpMRebb/7pYajWjvACYPYxSG+Pb56ZNEc9ZvpWj/u9igqDZZEz5LSVyVG+Yz5hLZdXRnFcV4zc6
	x9AMCQGFBtgnii/tPqmitsZNoHjoSlloNpz2zh/7qSmamVvJf6UAIjT7gTnXj2QFTaQ5It5vekb
	HVKSTeu5Vsx7aIA2b8gx2ihyDRkmQ==
X-Received: by 2002:a05:690c:660c:b0:795:15e8:8a08 with SMTP id 00721157ae682-79a718a43c0mr10134607b3.16.1773780654421;
        Tue, 17 Mar 2026 13:50:54 -0700 (PDT)
Received: from localhost.localdomain (108-207-243-35.lightspeed.austtx.sbcglobal.net. [108.207.243.35])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-79a713df100sm5031267b3.11.2026.03.17.13.50.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Mar 2026 13:50:53 -0700 (PDT)
From: Bradford Love <brad@nextdimension.cc>
To: linux-media@vger.kernel.org
Cc: Bradford Love <brad@nextdimension.cc>
Subject: [PATCH 1/3] media: em28xx: driver supports two frontends, but not i2c clients
Date: Tue, 17 Mar 2026 15:50:40 -0500
Message-Id: <20260317205042.3365469-2-brad@nextdimension.cc>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20260317205042.3365469-1-brad@nextdimension.cc>
References: <20260317205042.3365469-1-brad@nextdimension.cc>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spamd-Result: default: False [-0.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	R_MISSING_CHARSET(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	R_DKIM_ALLOW(-0.20)[nextdimension.cc:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCPT_COUNT_TWO(0.00)[2];
	RCVD_TLS_LAST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	DMARC_NA(0.00)[nextdimension.cc];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-56127-lists,linux-media=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[brad@nextdimension.cc,linux-media@vger.kernel.org];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_COUNT_FIVE(0.00)[5];
	DKIM_TRACE(0.00)[nextdimension.cc:+];
	TAGGED_RCPT(0.00)[linux-media];
	TO_DN_SOME(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,nextdimension.cc:dkim,nextdimension.cc:email,nextdimension.cc:mid]
X-Rspamd-Queue-Id: 997FC2B269B
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Fix em28xx driver to accommodate a device with two i2c client demods.

The em28xx driver already had a multi frontend aware device struct,
with two fe, just not two i2c client demods. Since Hauppauge HVR975
has transitioned from cx231xx to em2828X, this is required for full
functionality of the devices.

Signed-off-by: Bradford Love <brad@nextdimension.cc>
---
 drivers/media/usb/em28xx/em28xx-dvb.c | 81 ++++++++++++++-------------
 1 file changed, 42 insertions(+), 39 deletions(-)

diff --git a/drivers/media/usb/em28xx/em28xx-dvb.c b/drivers/media/usb/em28xx/em28xx-dvb.c
index 4d632ca91e30..389c40a1ecdb 100644
--- a/drivers/media/usb/em28xx/em28xx-dvb.c
+++ b/drivers/media/usb/em28xx/em28xx-dvb.c
@@ -97,7 +97,7 @@ struct em28xx_dvb {
 	struct semaphore      pll_mutex;
 	bool			dont_attach_fe1;
 	int			lna_gpio;
-	struct i2c_client	*i2c_client_demod;
+	struct i2c_client	*i2c_client_demod[2];
 	struct i2c_client	*i2c_client_tuner;
 	struct i2c_client	*i2c_client_sec;
 };
@@ -854,14 +854,14 @@ static void px_bcud_init(struct em28xx *dev)
 	};
 	em28xx_write_reg(dev, EM28XX_R06_I2C_CLK, 0x46);
 	/* sleeping ISDB-T */
-	dev->dvb->i2c_client_demod->addr = 0x14;
+	dev->dvb->i2c_client_demod[0]->addr = 0x14;
 	for (i = 0; i < ARRAY_SIZE(regs1); i++)
-		i2c_master_send(dev->dvb->i2c_client_demod,
+		i2c_master_send(dev->dvb->i2c_client_demod[0],
 				regs1[i].r, regs1[i].len);
 	/* sleeping ISDB-S */
-	dev->dvb->i2c_client_demod->addr = 0x15;
+	dev->dvb->i2c_client_demod[0]->addr = 0x15;
 	for (i = 0; i < ARRAY_SIZE(regs2); i++)
-		i2c_master_send(dev->dvb->i2c_client_demod, regs2[i].r,
+		i2c_master_send(dev->dvb->i2c_client_demod[0], regs2[i].r,
 				regs2[i].len);
 	for (i = 0; i < ARRAY_SIZE(gpio); i++) {
 		em28xx_write_reg_bits(dev, gpio[i].reg, gpio[i].val,
@@ -1155,13 +1155,13 @@ static int em28174_dvb_init_pctv_460e(struct em28xx *dev)
 	tda10071_pdata.pll_multiplier = 20;
 	tda10071_pdata.tuner_i2c_addr = 0x14;
 
-	dvb->i2c_client_demod = dvb_module_probe("tda10071", "tda10071_cx24118",
+	dvb->i2c_client_demod[0] = dvb_module_probe("tda10071", "tda10071_cx24118",
 						 &dev->i2c_adap[dev->def_i2c_bus],
 						 0x55, &tda10071_pdata);
-	if (!dvb->i2c_client_demod)
+	if (!dvb->i2c_client_demod[0])
 		return -ENODEV;
 
-	dvb->fe[0] = tda10071_pdata.get_dvb_frontend(dvb->i2c_client_demod);
+	dvb->fe[0] = tda10071_pdata.get_dvb_frontend(dvb->i2c_client_demod[0]);
 
 	/* attach SEC */
 	a8293_pdata.dvb_frontend = dvb->fe[0];
@@ -1170,7 +1170,7 @@ static int em28174_dvb_init_pctv_460e(struct em28xx *dev)
 					       &dev->i2c_adap[dev->def_i2c_bus],
 					       0x08, &a8293_pdata);
 	if (!dvb->i2c_client_sec) {
-		dvb_module_release(dvb->i2c_client_demod);
+		dvb_module_release(dvb->i2c_client_demod[0]);
 		return -ENODEV;
 	}
 
@@ -1193,14 +1193,14 @@ static int em28178_dvb_init_pctv_461e(struct em28xx *dev)
 	m88ds3103_pdata.ts_clk_pol = 1;
 	m88ds3103_pdata.agc = 0x99;
 
-	dvb->i2c_client_demod = dvb_module_probe("m88ds3103", NULL,
+	dvb->i2c_client_demod[0] = dvb_module_probe("m88ds3103", NULL,
 						 &dev->i2c_adap[dev->def_i2c_bus],
 						 0x68, &m88ds3103_pdata);
-	if (!dvb->i2c_client_demod)
+	if (!dvb->i2c_client_demod[0])
 		return -ENODEV;
 
-	dvb->fe[0] = m88ds3103_pdata.get_dvb_frontend(dvb->i2c_client_demod);
-	i2c_adapter = m88ds3103_pdata.get_i2c_adapter(dvb->i2c_client_demod);
+	dvb->fe[0] = m88ds3103_pdata.get_dvb_frontend(dvb->i2c_client_demod[0]);
+	i2c_adapter = m88ds3103_pdata.get_i2c_adapter(dvb->i2c_client_demod[0]);
 
 	/* attach tuner */
 	ts2020_config.fe = dvb->fe[0];
@@ -1209,7 +1209,7 @@ static int em28178_dvb_init_pctv_461e(struct em28xx *dev)
 						 i2c_adapter,
 						 0x60, &ts2020_config);
 	if (!dvb->i2c_client_tuner) {
-		dvb_module_release(dvb->i2c_client_demod);
+		dvb_module_release(dvb->i2c_client_demod[0]);
 		return -ENODEV;
 	}
 
@@ -1230,7 +1230,7 @@ static int em28178_dvb_init_pctv_461e(struct em28xx *dev)
 					       0x08, &a8293_pdata);
 	if (!dvb->i2c_client_sec) {
 		dvb_module_release(dvb->i2c_client_tuner);
-		dvb_module_release(dvb->i2c_client_demod);
+		dvb_module_release(dvb->i2c_client_demod[0]);
 		return -ENODEV;
 	}
 
@@ -1254,15 +1254,15 @@ static int em28178_dvb_init_pctv_461e_v2(struct em28xx *dev)
 	m88ds3103_pdata.agc = 0x99;
 	m88ds3103_pdata.agc_inv = 0;
 	m88ds3103_pdata.spec_inv = 0;
-	dvb->i2c_client_demod = dvb_module_probe("m88ds3103", "m88ds3103b",
+	dvb->i2c_client_demod[0] = dvb_module_probe("m88ds3103", "m88ds3103b",
 						 &dev->i2c_adap[dev->def_i2c_bus],
 						 0x6a, &m88ds3103_pdata);
 
-	if (!dvb->i2c_client_demod)
+	if (!dvb->i2c_client_demod[0])
 		return -ENODEV;
 
-	dvb->fe[0] = m88ds3103_pdata.get_dvb_frontend(dvb->i2c_client_demod);
-	i2c_adapter = m88ds3103_pdata.get_i2c_adapter(dvb->i2c_client_demod);
+	dvb->fe[0] = m88ds3103_pdata.get_dvb_frontend(dvb->i2c_client_demod[0]);
+	i2c_adapter = m88ds3103_pdata.get_i2c_adapter(dvb->i2c_client_demod[0]);
 
 	/* attach tuner */
 	ts2020_config.fe = dvb->fe[0];
@@ -1270,7 +1270,7 @@ static int em28178_dvb_init_pctv_461e_v2(struct em28xx *dev)
 						 i2c_adapter,
 						 0x60, &ts2020_config);
 	if (!dvb->i2c_client_tuner) {
-		dvb_module_release(dvb->i2c_client_demod);
+		dvb_module_release(dvb->i2c_client_demod[0]);
 		return -ENODEV;
 	}
 
@@ -1285,7 +1285,7 @@ static int em28178_dvb_init_pctv_461e_v2(struct em28xx *dev)
 					       0x08, &a8293_pdata);
 	if (!dvb->i2c_client_sec) {
 		dvb_module_release(dvb->i2c_client_tuner);
-		dvb_module_release(dvb->i2c_client_demod);
+		dvb_module_release(dvb->i2c_client_demod[0]);
 		return -ENODEV;
 	}
 
@@ -1305,10 +1305,10 @@ static int em28178_dvb_init_pctv_292e(struct em28xx *dev)
 	si2168_config.ts_mode = SI2168_TS_PARALLEL;
 	si2168_config.spectral_inversion = true;
 
-	dvb->i2c_client_demod = dvb_module_probe("si2168", NULL,
+	dvb->i2c_client_demod[0] = dvb_module_probe("si2168", NULL,
 						 &dev->i2c_adap[dev->def_i2c_bus],
 						 0x64, &si2168_config);
-	if (!dvb->i2c_client_demod)
+	if (!dvb->i2c_client_demod[0])
 		return -ENODEV;
 
 	/* attach tuner */
@@ -1321,7 +1321,7 @@ static int em28178_dvb_init_pctv_292e(struct em28xx *dev)
 						 adapter,
 						 0x60, &si2157_config);
 	if (!dvb->i2c_client_tuner) {
-		dvb_module_release(dvb->i2c_client_demod);
+		dvb_module_release(dvb->i2c_client_demod[0]);
 		return -ENODEV;
 	}
 	dvb->fe[0]->ops.set_lna = em28xx_pctv_292e_set_lna;
@@ -1341,10 +1341,10 @@ static int em28178_dvb_init_terratec_t2_stick_hd(struct em28xx *dev)
 	si2168_config.fe = &dvb->fe[0];
 	si2168_config.ts_mode = SI2168_TS_PARALLEL;
 
-	dvb->i2c_client_demod = dvb_module_probe("si2168", NULL,
+	dvb->i2c_client_demod[0] = dvb_module_probe("si2168", NULL,
 						 &dev->i2c_adap[dev->def_i2c_bus],
 						 0x64, &si2168_config);
-	if (!dvb->i2c_client_demod)
+	if (!dvb->i2c_client_demod[0])
 		return -ENODEV;
 
 	/* attach tuner */
@@ -1358,7 +1358,7 @@ static int em28178_dvb_init_terratec_t2_stick_hd(struct em28xx *dev)
 						 adapter,
 						 0x60, &si2157_config);
 	if (!dvb->i2c_client_tuner) {
-		dvb_module_release(dvb->i2c_client_demod);
+		dvb_module_release(dvb->i2c_client_demod[0]);
 		return -ENODEV;
 	}
 
@@ -1372,10 +1372,10 @@ static int em28178_dvb_init_plex_px_bcud(struct em28xx *dev)
 	struct qm1d1c0042_config qm1d1c0042_config = {};
 
 	/* attach demod */
-	dvb->i2c_client_demod = dvb_module_probe("tc90522", "tc90522sat",
+	dvb->i2c_client_demod[0] = dvb_module_probe("tc90522", "tc90522sat",
 						 &dev->i2c_adap[dev->def_i2c_bus],
 						 0x15, &tc90522_config);
-	if (!dvb->i2c_client_demod)
+	if (!dvb->i2c_client_demod[0])
 		return -ENODEV;
 
 	/* attach tuner */
@@ -1386,7 +1386,7 @@ static int em28178_dvb_init_plex_px_bcud(struct em28xx *dev)
 						 tc90522_config.tuner_i2c,
 						 0x61, &qm1d1c0042_config);
 	if (!dvb->i2c_client_tuner) {
-		dvb_module_release(dvb->i2c_client_demod);
+		dvb_module_release(dvb->i2c_client_demod[0]);
 		return -ENODEV;
 	}
 
@@ -1411,10 +1411,10 @@ static int em28174_dvb_init_hauppauge_wintv_dualhd_dvb(struct em28xx *dev)
 	si2168_config.spectral_inversion = true;
 	addr = (dev->ts == PRIMARY_TS) ? 0x64 : 0x67;
 
-	dvb->i2c_client_demod = dvb_module_probe("si2168", NULL,
+	dvb->i2c_client_demod[0] = dvb_module_probe("si2168", NULL,
 						 &dev->i2c_adap[dev->def_i2c_bus],
 						 addr, &si2168_config);
-	if (!dvb->i2c_client_demod)
+	if (!dvb->i2c_client_demod[0])
 		return -ENODEV;
 
 	/* attach tuner */
@@ -1430,7 +1430,7 @@ static int em28174_dvb_init_hauppauge_wintv_dualhd_dvb(struct em28xx *dev)
 						 adapter,
 						 addr, &si2157_config);
 	if (!dvb->i2c_client_tuner) {
-		dvb_module_release(dvb->i2c_client_demod);
+		dvb_module_release(dvb->i2c_client_demod[0]);
 		return -ENODEV;
 	}
 
@@ -1451,10 +1451,10 @@ static int em28174_dvb_init_hauppauge_wintv_dualhd_01595(struct em28xx *dev)
 	lgdt3306a_config.i2c_adapter = &adapter;
 	addr = (dev->ts == PRIMARY_TS) ? 0x59 : 0x0e;
 
-	dvb->i2c_client_demod = dvb_module_probe("lgdt3306a", NULL,
+	dvb->i2c_client_demod[0] = dvb_module_probe("lgdt3306a", NULL,
 						 &dev->i2c_adap[dev->def_i2c_bus],
 						 addr, &lgdt3306a_config);
-	if (!dvb->i2c_client_demod)
+	if (!dvb->i2c_client_demod[0])
 		return -ENODEV;
 
 	/* attach tuner */
@@ -1470,7 +1470,7 @@ static int em28174_dvb_init_hauppauge_wintv_dualhd_01595(struct em28xx *dev)
 						 adapter,
 						 addr, &si2157_config);
 	if (!dvb->i2c_client_tuner) {
-		dvb_module_release(dvb->i2c_client_demod);
+		dvb_module_release(dvb->i2c_client_demod[0]);
 		return -ENODEV;
 	}
 
@@ -1488,10 +1488,10 @@ static int em2874_dvb_init_hauppauge_usb_quadhd(struct em28xx *dev)
 	mxl692_config.fe = &dvb->fe[0];
 	addr = (dev->ts == PRIMARY_TS) ? 0x60 : 0x63;
 
-	dvb->i2c_client_demod = dvb_module_probe("mxl692", NULL,
+	dvb->i2c_client_demod[0] = dvb_module_probe("mxl692", NULL,
 						 &dev->i2c_adap[dev->def_i2c_bus],
 						 addr, &mxl692_config);
-	if (!dvb->i2c_client_demod)
+	if (!dvb->i2c_client_demod[0])
 		return -ENODEV;
 
 	return 0;
@@ -1522,6 +1522,8 @@ static int em28xx_dvb_init(struct em28xx *dev)
 	dev->dvb = dvb;
 	dvb->fe[0] = NULL;
 	dvb->fe[1] = NULL;
+	dvb->i2c_client_demod[0] = NULL;
+	dvb->i2c_client_demod[1] = NULL;
 
 	/* pre-allocate DVB usb transfer buffers */
 	if (dev->dvb_xfer_bulk) {
@@ -2083,7 +2085,8 @@ static int em28xx_dvb_fini(struct em28xx *dev)
 	/* release I2C module bindings */
 	dvb_module_release(dvb->i2c_client_sec);
 	dvb_module_release(dvb->i2c_client_tuner);
-	dvb_module_release(dvb->i2c_client_demod);
+	dvb_module_release(dvb->i2c_client_demod[1]);
+	dvb_module_release(dvb->i2c_client_demod[0]);
 
 	kfree(dvb);
 	dev->dvb = NULL;
-- 
2.35.1


