Return-Path: <linux-media+bounces-56903-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id KGRzLX7XwmllmgQAu9opvQ
	(envelope-from <linux-media+bounces-56903-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Tue, 24 Mar 2026 19:27:10 +0100
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 3883831ACD1
	for <lists+linux-media@lfdr.de>; Tue, 24 Mar 2026 19:27:10 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 15EF0301D049
	for <lists+linux-media@lfdr.de>; Tue, 24 Mar 2026 18:24:38 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C78F239656C;
	Tue, 24 Mar 2026 18:24:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nextdimension.cc header.i=@nextdimension.cc header.b="GMbcIE2l"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-yw1-f174.google.com (mail-yw1-f174.google.com [209.85.128.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BCC9A390C9E
	for <linux-media@vger.kernel.org>; Tue, 24 Mar 2026 18:24:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774376676; cv=none; b=fVda0lu0rGHW/fRvZGWuVzZ4Fx2qJ/CnmFJBc/n5EhJCAUzmlML5k/I++bQwLirObZWLgizq8YT3meSnW+KcRSwPVJgfp2X469OteGWKHHOHjEsJ8pp6JAYrQpFW+y57WJKliZJw0GMwbiOmaBN71un+NmcGz4jJcK6KMkmwi/o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774376676; c=relaxed/simple;
	bh=MFqzXe0Bt/18GqcYgRQu35o8oMuEbP83c5NH2hCVCxs=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=iu1DGFNlZz31VSaOSG9b1rfxh5khmbsqJZmGfzfxDzevUlkxiOcJ8lAGIJkMmOo5RBxp29zWR/Pf/w7+R8iV4ZjzBVRHldrv1j57+eRzYgEyIU2aJHZvUmDpHxCvefgTgSvTnWFj+4RT8g7lZm8h+8L7A/RsWK8qAxfI4mIbshE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=nextdimension.cc; spf=pass smtp.mailfrom=nextdimension.cc; dkim=pass (2048-bit key) header.d=nextdimension.cc header.i=@nextdimension.cc header.b=GMbcIE2l; arc=none smtp.client-ip=209.85.128.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=nextdimension.cc
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nextdimension.cc
Received: by mail-yw1-f174.google.com with SMTP id 00721157ae682-79628fb5c05so45911317b3.2
        for <linux-media@vger.kernel.org>; Tue, 24 Mar 2026 11:24:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=nextdimension.cc; s=google; t=1774376674; x=1774981474; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=kbp2usKsMBKlZI9Cg6h+4KR3jECA1L71hbplc2udr3I=;
        b=GMbcIE2lut1BvFEB1jQyRNL9TIM076Tssn59nrjFnwK8m682o0qx1m/ZsmxR1iIEcq
         T5DarbHEmye8dxuBPHgXTXKe2VzXtxO1uULCKRpp4r6QE7hb2EwlMwIxpeK7rvFIdghx
         cCInstdFjmOEqlyvFucYEh0AnZJ5bwKGsE9pF/p76UJvZKwiQLSeIuSft4zUNY8NkfRs
         yqiSHETyXGvwy2YaWQCG0GBZ2/ZIqj8QJpWvM5+E0j2WlP8aUa7kMqv98r1JsEPQc+6b
         hm9Pf0Lu9UURAPgK0hS7GYF5n3cyuTwRpch0EgBDHVqV94G/y69jJqBpuETzf4vLYFN+
         J5MQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774376674; x=1774981474;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=kbp2usKsMBKlZI9Cg6h+4KR3jECA1L71hbplc2udr3I=;
        b=YOKo5DzsIqRd+YKf1L7ERN7bOKCj9Oy125649UZNLPe3bHo5enGbfBzcq/YHicu6pW
         QyNAzhsio7xc4cnHpYxKSaCHkE9mlV2W2nUhJQJsueLSqqSbRmncRZDsMGWg/8nNDqZy
         qmddXTska1gfp7S1K8HMfw8OcrEDNG4pQZmTgukxukgxJ4xbZYdf3uAGb3e3HAvWBUJT
         m9/PSkLmO/S+XX9SrhS/8z8kJT1gjHOFQQPBnM53qZeMq8O1UWZKD5p0nKsIB2KQL4KF
         K+0helvTF1c3/Qf/oyLPMVzHBGFzdyitiNcdWLt3evzrZ8dUlMIsfcZtO1HcO8FRJ7Ta
         39vQ==
X-Gm-Message-State: AOJu0YyenWH8kn1HV+DXZNqG4d/DwqYjxlpGA6wAAQoBqrRX0wn+zv/Y
	Ct9fIfLG/PzVg+bsb9KRplhOiyOwUvKush6B28ANr4SzOniR71Qetz7nXXN/1EQLNIAEfJFgveZ
	0aWCfoJ8=
X-Gm-Gg: ATEYQzw5X+WfrJB35nbSfY0DPpqJhFeuSemognVYsgwAmO7UBgtRKyeoMdcgbTPQUYQ
	isCyRmcT54n4trKX/+0RcF5wCb7A20foTUYsizV60uC6FlV0/Z/iyWAzkMM2chApUxxgHLDWDuR
	G8Ww2GWDfr7ndgeFRMawHJew/OHJbh2uQzddAcYtzwT4ym/Iou66d/KLF52lfi4mZWXRkZgjuS5
	aMo6t3DLnvJOANxcDIs6RSJQ5MKBGWaPiCYNECSDAyGm58gbf/ANj7AWixhMsizdvXTiVQY5GBh
	0FZw6ot4i7kDaeVT7r98A4uRsmCmkmF2KUq28C691muYrnpXF+BHACdvS949lcHcKHQclGjf+NQ
	Lwy4DcsbtjWKjwBIOwem1qBBlVPKm3CiuBo9upL8gtk73BdKpTLGi4GieeNG7D8s8WopDQu+f9w
	UyOlh2uzhyYtKRV1PnPRoSkSujReVQagaqXJ8+APvcw8rO2tjMqMf1pNCKHXCYpnhK4oXCZpDpj
	U6OhlZUir7olbS05f0=
X-Received: by 2002:a05:690c:c511:b0:79a:b983:b464 with SMTP id 00721157ae682-79acf38c739mr8658557b3.16.1774376673404;
        Tue, 24 Mar 2026 11:24:33 -0700 (PDT)
Received: from localhost.localdomain (108-207-243-35.lightspeed.austtx.sbcglobal.net. [108.207.243.35])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-79a905ba0a9sm76587497b3.46.2026.03.24.11.24.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 Mar 2026 11:24:32 -0700 (PDT)
From: Bradford Love <brad@nextdimension.cc>
To: linux-media@vger.kernel.org,
	hverkuil+cisco@kernel.org
Cc: Bradford Love <brad@nextdimension.cc>
Subject: [PATCH v2 1/3] media: em28xx: driver supports two frontends, but not i2c clients
Date: Tue, 24 Mar 2026 13:24:25 -0500
Message-Id: <20260324182425.3396893-1-brad@nextdimension.cc>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20260317205042.3365469-2-brad@nextdimension.cc>
References: <20260317205042.3365469-2-brad@nextdimension.cc>
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
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[nextdimension.cc:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-56903-lists,linux-media=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	DMARC_NA(0.00)[nextdimension.cc];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	RCPT_COUNT_THREE(0.00)[3];
	FROM_NEQ_ENVFROM(0.00)[brad@nextdimension.cc,linux-media@vger.kernel.org];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_COUNT_FIVE(0.00)[5];
	DKIM_TRACE(0.00)[nextdimension.cc:+];
	TAGGED_RCPT(0.00)[linux-media,cisco];
	TO_DN_SOME(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,nextdimension.cc:dkim,nextdimension.cc:email,nextdimension.cc:mid]
X-Rspamd-Queue-Id: 3883831ACD1
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Fix em28xx driver to accommodate a device with two i2c client demods.

The em28xx driver already had a multi frontend aware device struct,
with two fe, just not two i2c client demods. Since Hauppauge HVR975
has transitioned from cx231xx to em2828X, this is required for full
functionality of the devices.

Signed-off-by: Bradford Love <brad@nextdimension.cc>
---
Changes since v1:
- patches refreshed

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


