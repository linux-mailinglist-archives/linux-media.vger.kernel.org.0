Return-Path: <linux-media+bounces-24253-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 0EA5EA01BFD
	for <lists+linux-media@lfdr.de>; Sun,  5 Jan 2025 22:21:55 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 93D703A3BF0
	for <lists+linux-media@lfdr.de>; Sun,  5 Jan 2025 21:21:49 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 898351CF5C6;
	Sun,  5 Jan 2025 21:21:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=wanadoo.fr header.i=@wanadoo.fr header.b="RfPQrm1z"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.smtpout.orange.fr (smtp-76.smtpout.orange.fr [80.12.242.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AA36E1CDFAE;
	Sun,  5 Jan 2025 21:21:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=80.12.242.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736112106; cv=none; b=PQHO2FNH58pt6NUc/muRIUEcyMxG4UrAzmzrKnUond3Mv2fyKsD0xAr0UyLFwbyuHBl8d20YO6qFn4Je1fwORhjW+bYnqiIRag5ofRgapgcSMJXFzVh42dB7bkXGDdA4Y4f9ht/7JI0bPtO+8kmmp21Ep8TAQ8B5OOHOSt9+6ZA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736112106; c=relaxed/simple;
	bh=MlP2XmGJg+8WVYH3oGv2zg/c2VabvDri+lRR7Cv1AYw=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=UvC5bKa4dDf6PwZ/kKycsZ517tpRW7wV97qMaP0iyIL2L5uBLce1zSHqDfHfYJBZ8wz1IwJShtn8+C1JkiorV3DlfK4KJqg1eVaCDTh1D80bMcyPA5xEFMTsIP6cI+4nqXAl9whuPUczv4mOGBMCo9RkX6hTXqmP0/D9L3vQ4UE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=wanadoo.fr; spf=pass smtp.mailfrom=wanadoo.fr; dkim=pass (2048-bit key) header.d=wanadoo.fr header.i=@wanadoo.fr header.b=RfPQrm1z; arc=none smtp.client-ip=80.12.242.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=wanadoo.fr
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=wanadoo.fr
Received: from localhost.localdomain ([90.11.132.44])
	by smtp.orange.fr with ESMTPA
	id UY2stuD7dTqASUY2vtHLmQ; Sun, 05 Jan 2025 22:20:30 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=wanadoo.fr;
	s=t20230301; t=1736112030;
	bh=gRKNCnum+DQEKQXTCOtGo0xKUTCevZcMPIx3NtkQdkc=;
	h=From:To:Subject:Date:Message-ID:MIME-Version;
	b=RfPQrm1zr2ZJB60jDWTJKgkVSbz6C/RylxjW6PO3ZKhCam84v8tLj8nZVbzJ/6SKO
	 QEhnq0zUV4F13BoLJVNwNmWvZTKn575+zzU15wq5ohbXpW9NkpCvpwpx9yWzwiQUHU
	 61V/uA/Mal7rBfQVP0KkyIha1QtTjPeQup6dAr+hn1+4CvwQfouxJtYyUKWCWOaoRs
	 +dh9zyN4lr1EH3lnYfOT4dv4Gn2gHelOvJo1AoiFBz2niCfM0h3+SspNnVUPe0ksuq
	 SxtaWB8AXY7YfXLlfUXtR8FUX9jUyAYh6oqnrzlJ9/5OORfVijT53hGx56STn+D33i
	 hVp9dbQ4lvIuw==
X-ME-Helo: localhost.localdomain
X-ME-Auth: Y2hyaXN0b3BoZS5qYWlsbGV0QHdhbmFkb28uZnI=
X-ME-Date: Sun, 05 Jan 2025 22:20:30 +0100
X-ME-IP: 90.11.132.44
From: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
To: Mauro Carvalho Chehab <mchehab@kernel.org>,
	Michael Krufky <mkrufky@linuxtv.org>
Cc: linux-kernel@vger.kernel.org,
	kernel-janitors@vger.kernel.org,
	Christophe JAILLET <christophe.jaillet@wanadoo.fr>,
	linux-media@vger.kernel.org
Subject: [PATCH] media: dvb-usb: Constify struct usb_device_id
Date: Sun,  5 Jan 2025 22:19:57 +0100
Message-ID: <16076ec55f0fb4737b017775dbc09e91e4b31726.1736111972.git.christophe.jaillet@wanadoo.fr>
X-Mailer: git-send-email 2.47.1
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

'struct usb_device_id' is not modified in these drivers.

Constifying this structure moves some data to a read-only section, so
increase overall security.

In order to do that, struct dvb_usb_device_description (in dvb-usb.h) also
needs to be updated.

On a x86_64, with allmodconfig, as an example:
Before:
======
   text	   data	    bss	    dec	    hex	filename
   1983	   4240	      4	   6227	   1853	drivers/media/usb/dvb-usb/a800.o

After:
=====
   text	   data	    bss	    dec	    hex	filename
   2079	   4144	      4	   6227	   1853	drivers/media/usb/dvb-usb/a800.o

Signed-off-by: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
---
Compile tested-only.
---
 drivers/media/usb/dvb-usb/a800.c           | 2 +-
 drivers/media/usb/dvb-usb/af9005.c         | 2 +-
 drivers/media/usb/dvb-usb/az6027.c         | 2 +-
 drivers/media/usb/dvb-usb/cinergyT2-core.c | 2 +-
 drivers/media/usb/dvb-usb/cxusb.c          | 4 ++--
 drivers/media/usb/dvb-usb/dibusb-mb.c      | 2 +-
 drivers/media/usb/dvb-usb/dibusb-mc.c      | 2 +-
 drivers/media/usb/dvb-usb/digitv.c         | 2 +-
 drivers/media/usb/dvb-usb/dtt200u.c        | 2 +-
 drivers/media/usb/dvb-usb/dtv5100.c        | 2 +-
 drivers/media/usb/dvb-usb/dvb-usb.h        | 4 ++--
 drivers/media/usb/dvb-usb/dw2102.c         | 2 +-
 drivers/media/usb/dvb-usb/gp8psk.c         | 2 +-
 drivers/media/usb/dvb-usb/m920x.c          | 2 +-
 drivers/media/usb/dvb-usb/nova-t-usb2.c    | 2 +-
 drivers/media/usb/dvb-usb/opera1.c         | 2 +-
 drivers/media/usb/dvb-usb/pctv452e.c       | 4 ++--
 drivers/media/usb/dvb-usb/technisat-usb2.c | 2 +-
 drivers/media/usb/dvb-usb/ttusb2.c         | 2 +-
 drivers/media/usb/dvb-usb/umt-010.c        | 2 +-
 drivers/media/usb/dvb-usb/vp702x.c         | 2 +-
 drivers/media/usb/dvb-usb/vp7045.c         | 2 +-
 22 files changed, 25 insertions(+), 25 deletions(-)

diff --git a/drivers/media/usb/dvb-usb/a800.c b/drivers/media/usb/dvb-usb/a800.c
index 5f294784923c..c5f95e48f1d5 100644
--- a/drivers/media/usb/dvb-usb/a800.c
+++ b/drivers/media/usb/dvb-usb/a800.c
@@ -77,7 +77,7 @@ enum {
 	AVERMEDIA_DVBT_USB2_WARM,
 };
 
-static struct usb_device_id a800_table[] = {
+static const struct usb_device_id a800_table[] = {
 	DVB_USB_DEV(AVERMEDIA, AVERMEDIA_DVBT_USB2_COLD),
 	DVB_USB_DEV(AVERMEDIA, AVERMEDIA_DVBT_USB2_WARM),
 	{ }
diff --git a/drivers/media/usb/dvb-usb/af9005.c b/drivers/media/usb/dvb-usb/af9005.c
index 13604e6acdb8..7ddda6fb0fbd 100644
--- a/drivers/media/usb/dvb-usb/af9005.c
+++ b/drivers/media/usb/dvb-usb/af9005.c
@@ -1005,7 +1005,7 @@ enum {
 	ANSONIC_DVBT_USB,
 };
 
-static struct usb_device_id af9005_usb_table[] = {
+static const struct usb_device_id af9005_usb_table[] = {
 	DVB_USB_DEV(AFATECH, AFATECH_AF9005),
 	DVB_USB_DEV(TERRATEC, TERRATEC_CINERGY_T_USB_XE),
 	DVB_USB_DEV(ANSONIC, ANSONIC_DVBT_USB),
diff --git a/drivers/media/usb/dvb-usb/az6027.c b/drivers/media/usb/dvb-usb/az6027.c
index 2bc27710427d..156a299d4a2b 100644
--- a/drivers/media/usb/dvb-usb/az6027.c
+++ b/drivers/media/usb/dvb-usb/az6027.c
@@ -1107,7 +1107,7 @@ enum {
 	ELGATO_EYETV_SAT_V3,
 };
 
-static struct usb_device_id az6027_usb_table[] = {
+static const struct usb_device_id az6027_usb_table[] = {
 	DVB_USB_DEV(AZUREWAVE, AZUREWAVE_AZ6027),
 	DVB_USB_DEV(TERRATEC, TERRATEC_DVBS2CI_V1),
 	DVB_USB_DEV(TERRATEC, TERRATEC_DVBS2CI_V2),
diff --git a/drivers/media/usb/dvb-usb/cinergyT2-core.c b/drivers/media/usb/dvb-usb/cinergyT2-core.c
index 4926c954e29a..d86c279e2dce 100644
--- a/drivers/media/usb/dvb-usb/cinergyT2-core.c
+++ b/drivers/media/usb/dvb-usb/cinergyT2-core.c
@@ -197,7 +197,7 @@ enum {
 	TERRATEC_CINERGY_T2,
 };
 
-static struct usb_device_id cinergyt2_usb_table[] = {
+static const struct usb_device_id cinergyt2_usb_table[] = {
 	DVB_USB_DEV(TERRATEC, TERRATEC_CINERGY_T2),
 	{ }
 };
diff --git a/drivers/media/usb/dvb-usb/cxusb.c b/drivers/media/usb/dvb-usb/cxusb.c
index 1d98d3465e28..9b4d4b86d5f4 100644
--- a/drivers/media/usb/dvb-usb/cxusb.c
+++ b/drivers/media/usb/dvb-usb/cxusb.c
@@ -78,7 +78,7 @@ enum cxusb_table_index {
 	NR__cxusb_table_index
 };
 
-static struct usb_device_id cxusb_table[];
+static const struct usb_device_id cxusb_table[];
 
 int cxusb_ctrl_msg(struct dvb_usb_device *d,
 		   u8 cmd, const u8 *wbuf, int wlen, u8 *rbuf, int rlen)
@@ -1692,7 +1692,7 @@ static void cxusb_disconnect(struct usb_interface *intf)
 	dvb_usb_device_exit(intf);
 }
 
-static struct usb_device_id cxusb_table[] = {
+static const struct usb_device_id cxusb_table[] = {
 	DVB_USB_DEV(MEDION, MEDION_MD95700),
 	DVB_USB_DEV(DVICO, DVICO_BLUEBIRD_LG064F_COLD),
 	DVB_USB_DEV(DVICO, DVICO_BLUEBIRD_LG064F_WARM),
diff --git a/drivers/media/usb/dvb-usb/dibusb-mb.c b/drivers/media/usb/dvb-usb/dibusb-mb.c
index 2cd88cab4c98..431766f19931 100644
--- a/drivers/media/usb/dvb-usb/dibusb-mb.c
+++ b/drivers/media/usb/dvb-usb/dibusb-mb.c
@@ -155,7 +155,7 @@ enum {
 	ULTIMA_TVBOX_ANCHOR_COLD,
 };
 
-static struct usb_device_id dibusb_dib3000mb_table[] = {
+static const struct usb_device_id dibusb_dib3000mb_table[] = {
 	DVB_USB_DEV(WIDEVIEW, WIDEVIEW_DVBT_USB_COLD),
 	DVB_USB_DEV(WIDEVIEW, WIDEVIEW_DVBT_USB_WARM),
 	DVB_USB_DEV(COMPRO, COMPRO_DVBU2000_COLD),
diff --git a/drivers/media/usb/dvb-usb/dibusb-mc.c b/drivers/media/usb/dvb-usb/dibusb-mc.c
index 00cb016f6266..01eece2687d6 100644
--- a/drivers/media/usb/dvb-usb/dibusb-mc.c
+++ b/drivers/media/usb/dvb-usb/dibusb-mc.c
@@ -43,7 +43,7 @@ enum {
 	HUMAX_DVB_T_STICK_HIGH_SPEED_WARM,
 };
 
-static struct usb_device_id dibusb_dib3000mc_table[] = {
+static const struct usb_device_id dibusb_dib3000mc_table[] = {
 	DVB_USB_DEV(DIBCOM, DIBCOM_MOD3001_COLD),
 	DVB_USB_DEV(DIBCOM, DIBCOM_MOD3001_WARM),
 	DVB_USB_DEV(ULTIMA_ELECTRONIC, ULTIMA_TVBOX_USB2_COLD),
diff --git a/drivers/media/usb/dvb-usb/digitv.c b/drivers/media/usb/dvb-usb/digitv.c
index 32134be16914..5a9bc630ba77 100644
--- a/drivers/media/usb/dvb-usb/digitv.c
+++ b/drivers/media/usb/dvb-usb/digitv.c
@@ -299,7 +299,7 @@ enum {
 	ANCHOR_NEBULA_DIGITV,
 };
 
-static struct usb_device_id digitv_table[] = {
+static const struct usb_device_id digitv_table[] = {
 	DVB_USB_DEV(ANCHOR, ANCHOR_NEBULA_DIGITV),
 	{ }
 };
diff --git a/drivers/media/usb/dvb-usb/dtt200u.c b/drivers/media/usb/dvb-usb/dtt200u.c
index e6ee56b3a9dd..83a69df384f2 100644
--- a/drivers/media/usb/dvb-usb/dtt200u.c
+++ b/drivers/media/usb/dvb-usb/dtt200u.c
@@ -171,7 +171,7 @@ enum {
 	MIGLIA_WT220U_ZAP250_COLD,
 };
 
-static struct usb_device_id dtt200u_usb_table[] = {
+static const struct usb_device_id dtt200u_usb_table[] = {
 	DVB_USB_DEV(WIDEVIEW, WIDEVIEW_DTT200U_COLD),
 	DVB_USB_DEV(WIDEVIEW, WIDEVIEW_DTT200U_WARM),
 	DVB_USB_DEV(WIDEVIEW, WIDEVIEW_WT220U_COLD),
diff --git a/drivers/media/usb/dvb-usb/dtv5100.c b/drivers/media/usb/dvb-usb/dtv5100.c
index 56c9d521a34a..5eb4c995c758 100644
--- a/drivers/media/usb/dvb-usb/dtv5100.c
+++ b/drivers/media/usb/dvb-usb/dtv5100.c
@@ -166,7 +166,7 @@ enum {
 	AME_DTV5100,
 };
 
-static struct usb_device_id dtv5100_table[] = {
+static const struct usb_device_id dtv5100_table[] = {
 	DVB_USB_DEV(AME, AME_DTV5100),
 	{ }
 };
diff --git a/drivers/media/usb/dvb-usb/dvb-usb.h b/drivers/media/usb/dvb-usb/dvb-usb.h
index cbb0541d4dc1..a06f08f9915b 100644
--- a/drivers/media/usb/dvb-usb/dvb-usb.h
+++ b/drivers/media/usb/dvb-usb/dvb-usb.h
@@ -73,8 +73,8 @@ struct dvb_usb_device_description {
 	const char *name;
 
 #define DVB_USB_ID_MAX_NUM 15
-	struct usb_device_id *cold_ids[DVB_USB_ID_MAX_NUM];
-	struct usb_device_id *warm_ids[DVB_USB_ID_MAX_NUM];
+	const struct usb_device_id *cold_ids[DVB_USB_ID_MAX_NUM];
+	const struct usb_device_id *warm_ids[DVB_USB_ID_MAX_NUM];
 };
 
 static inline u8 rc5_custom(struct rc_map_table *key)
diff --git a/drivers/media/usb/dvb-usb/dw2102.c b/drivers/media/usb/dvb-usb/dw2102.c
index 79e2ccf974c9..a21ba81163ba 100644
--- a/drivers/media/usb/dvb-usb/dw2102.c
+++ b/drivers/media/usb/dvb-usb/dw2102.c
@@ -1836,7 +1836,7 @@ enum dw2102_table_entry {
 	TEVII_S662
 };
 
-static struct usb_device_id dw2102_table[] = {
+static const struct usb_device_id dw2102_table[] = {
 	DVB_USB_DEV(CYPRESS, CYPRESS_DW2102),
 	DVB_USB_DEV(CYPRESS, CYPRESS_DW2101),
 	DVB_USB_DEV(CYPRESS, CYPRESS_DW2104),
diff --git a/drivers/media/usb/dvb-usb/gp8psk.c b/drivers/media/usb/dvb-usb/gp8psk.c
index 4cd21bb8805e..96a255500b38 100644
--- a/drivers/media/usb/dvb-usb/gp8psk.c
+++ b/drivers/media/usb/dvb-usb/gp8psk.c
@@ -319,7 +319,7 @@ enum {
 	GENPIX_SKYWALKER_CW3K,
 };
 
-static struct usb_device_id gp8psk_usb_table[] = {
+static const struct usb_device_id gp8psk_usb_table[] = {
 	DVB_USB_DEV(GENPIX, GENPIX_8PSK_REV_1_COLD),
 	DVB_USB_DEV(GENPIX, GENPIX_8PSK_REV_1_WARM),
 	DVB_USB_DEV(GENPIX, GENPIX_8PSK_REV_2),
diff --git a/drivers/media/usb/dvb-usb/m920x.c b/drivers/media/usb/dvb-usb/m920x.c
index a2054b1b100f..9ef0cd944286 100644
--- a/drivers/media/usb/dvb-usb/m920x.c
+++ b/drivers/media/usb/dvb-usb/m920x.c
@@ -909,7 +909,7 @@ enum {
 	AZUREWAVE_TWINHAN_VP7049,
 };
 
-static struct usb_device_id m920x_table[] = {
+static const struct usb_device_id m920x_table[] = {
 	DVB_USB_DEV(MSI, MSI_MEGASKY580),
 	DVB_USB_DEV(ANUBIS_ELECTRONIC, ANUBIS_MSI_DIGI_VOX_MINI_II),
 	DVB_USB_DEV(ANUBIS_ELECTRONIC, ANUBIS_LIFEVIEW_TV_WALKER_TWIN_COLD),
diff --git a/drivers/media/usb/dvb-usb/nova-t-usb2.c b/drivers/media/usb/dvb-usb/nova-t-usb2.c
index 4782d0780913..2e5cbfacbeed 100644
--- a/drivers/media/usb/dvb-usb/nova-t-usb2.c
+++ b/drivers/media/usb/dvb-usb/nova-t-usb2.c
@@ -165,7 +165,7 @@ enum {
 	HAUPPAUGE_WINTV_NOVA_T_USB2_WARM,
 };
 
-static struct usb_device_id nova_t_table[] = {
+static const struct usb_device_id nova_t_table[] = {
 	DVB_USB_DEV(HAUPPAUGE, HAUPPAUGE_WINTV_NOVA_T_USB2_COLD),
 	DVB_USB_DEV(HAUPPAUGE, HAUPPAUGE_WINTV_NOVA_T_USB2_WARM),
 	{ }
diff --git a/drivers/media/usb/dvb-usb/opera1.c b/drivers/media/usb/dvb-usb/opera1.c
index 268f05fc8691..86bfcc641cf3 100644
--- a/drivers/media/usb/dvb-usb/opera1.c
+++ b/drivers/media/usb/dvb-usb/opera1.c
@@ -425,7 +425,7 @@ enum {
 	OPERA1_WARM,
 };
 
-static struct usb_device_id opera1_table[] = {
+static const struct usb_device_id opera1_table[] = {
 	DVB_USB_DEV(CYPRESS, CYPRESS_OPERA1_COLD),
 	DVB_USB_DEV(OPERA1, OPERA1_WARM),
 	{ }
diff --git a/drivers/media/usb/dvb-usb/pctv452e.c b/drivers/media/usb/dvb-usb/pctv452e.c
index 2aab49003493..cbaa300264f8 100644
--- a/drivers/media/usb/dvb-usb/pctv452e.c
+++ b/drivers/media/usb/dvb-usb/pctv452e.c
@@ -913,7 +913,7 @@ static struct i2c_algorithm pctv452e_i2c_algo = {
 
 static int pctv452e_frontend_attach(struct dvb_usb_adapter *a)
 {
-	struct usb_device_id *id;
+	const struct usb_device_id *id;
 
 	a->fe_adap[0].fe = dvb_attach(stb0899_attach, &stb0899_config,
 						&a->dev->i2c_adap);
@@ -959,7 +959,7 @@ enum {
 	TECHNOTREND_CONNECT_S2_3650_CI,
 };
 
-static struct usb_device_id pctv452e_usb_table[] = {
+static const struct usb_device_id pctv452e_usb_table[] = {
 	DVB_USB_DEV(PINNACLE, PINNACLE_PCTV_452E),
 	DVB_USB_DEV(TECHNOTREND, TECHNOTREND_CONNECT_S2_3600),
 	DVB_USB_DEV(TECHNOTREND, TECHNOTREND_CONNECT_S2_3650_CI),
diff --git a/drivers/media/usb/dvb-usb/technisat-usb2.c b/drivers/media/usb/dvb-usb/technisat-usb2.c
index df90c6c5f3b9..8d49baa3b7ad 100644
--- a/drivers/media/usb/dvb-usb/technisat-usb2.c
+++ b/drivers/media/usb/dvb-usb/technisat-usb2.c
@@ -693,7 +693,7 @@ enum {
 	TECHNISAT_USB2_DVB_S2,
 };
 
-static struct usb_device_id technisat_usb2_id_table[] = {
+static const struct usb_device_id technisat_usb2_id_table[] = {
 	DVB_USB_DEV(TECHNISAT, TECHNISAT_USB2_DVB_S2),
 	{ }
 };
diff --git a/drivers/media/usb/dvb-usb/ttusb2.c b/drivers/media/usb/dvb-usb/ttusb2.c
index 373ffa7f641e..0f2eccae46ce 100644
--- a/drivers/media/usb/dvb-usb/ttusb2.c
+++ b/drivers/media/usb/dvb-usb/ttusb2.c
@@ -638,7 +638,7 @@ enum {
 	TECHNOTREND_CONNECT_S2400_8KEEPROM,
 };
 
-static struct usb_device_id ttusb2_table[] = {
+static const struct usb_device_id ttusb2_table[] = {
 	DVB_USB_DEV(PINNACLE, PINNACLE_PCTV_400E),
 	DVB_USB_DEV(PINNACLE, PINNACLE_PCTV_450E),
 	DVB_USB_DEV(TECHNOTREND, TECHNOTREND_CONNECT_S2400),
diff --git a/drivers/media/usb/dvb-usb/umt-010.c b/drivers/media/usb/dvb-usb/umt-010.c
index 464699b0b75b..8f23f92946d4 100644
--- a/drivers/media/usb/dvb-usb/umt-010.c
+++ b/drivers/media/usb/dvb-usb/umt-010.c
@@ -86,7 +86,7 @@ enum {
 	HANFTEK_UMT_010_WARM,
 };
 
-static struct usb_device_id umt_table[] = {
+static const struct usb_device_id umt_table[] = {
 	DVB_USB_DEV(HANFTEK, HANFTEK_UMT_010_COLD),
 	DVB_USB_DEV(HANFTEK, HANFTEK_UMT_010_WARM),
 	{ }
diff --git a/drivers/media/usb/dvb-usb/vp702x.c b/drivers/media/usb/dvb-usb/vp702x.c
index 5b6740cbd1d1..034b0652b9a1 100644
--- a/drivers/media/usb/dvb-usb/vp702x.c
+++ b/drivers/media/usb/dvb-usb/vp702x.c
@@ -375,7 +375,7 @@ enum {
 	VISIONPLUS_VP7020_WARM,
 };
 
-static struct usb_device_id vp702x_usb_table[] = {
+static const struct usb_device_id vp702x_usb_table[] = {
 	DVB_USB_DEV(VISIONPLUS, VISIONPLUS_VP7021_COLD),
 //	DVB_USB_DEV(VISIONPLUS, VISIONPLUS_VP7020_COLD),
 //	DVB_USB_DEV(VISIONPLUS, VISIONPLUS_VP7020_WARM),
diff --git a/drivers/media/usb/dvb-usb/vp7045.c b/drivers/media/usb/dvb-usb/vp7045.c
index 1dc2b18d44d8..5224c3233f8c 100644
--- a/drivers/media/usb/dvb-usb/vp7045.c
+++ b/drivers/media/usb/dvb-usb/vp7045.c
@@ -179,7 +179,7 @@ enum {
 	VISIONPLUS_TINYUSB2_WARM,
 };
 
-static struct usb_device_id vp7045_usb_table[] = {
+static const struct usb_device_id vp7045_usb_table[] = {
 	DVB_USB_DEV(VISIONPLUS, VISIONPLUS_VP7045_COLD),
 	DVB_USB_DEV(VISIONPLUS, VISIONPLUS_VP7045_WARM),
 	DVB_USB_DEV(VISIONPLUS, VISIONPLUS_TINYUSB2_COLD),
-- 
2.47.1


