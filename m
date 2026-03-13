Return-Path: <linux-media+bounces-55747-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id qEr/Jls8tGmDjQAAu9opvQ
	(envelope-from <linux-media+bounces-55747-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Fri, 13 Mar 2026 17:33:31 +0100
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 04E8E28712B
	for <lists+linux-media@lfdr.de>; Fri, 13 Mar 2026 17:33:30 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id A02A13164B58
	for <lists+linux-media@lfdr.de>; Fri, 13 Mar 2026 16:29:05 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E4E963AA4FF;
	Fri, 13 Mar 2026 16:29:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=yahoo.pl header.i=@yahoo.pl header.b="iU6tcSeK"
X-Original-To: linux-media@vger.kernel.org
Received: from sonic307-54.consmr.mail.ir2.yahoo.com (sonic307-54.consmr.mail.ir2.yahoo.com [87.248.110.31])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 69080390213
	for <linux-media@vger.kernel.org>; Fri, 13 Mar 2026 16:29:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=87.248.110.31
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773419344; cv=none; b=BqCBGqGv4ynpUqZ5XN0BEfhvQ1UNmand6HP6gSSgRx7rzyvOEXeUXBz40d7LuHXsPFh3YOyO+e96RE+2vKAdjYNQlfR2arRk4MgVEImkLwdVzAuly7q5oIhNs9RXo4xukZ+qRB+dLDlHZKryB7YFzRlzk0Q2c/pcRCNCpSzE9rE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773419344; c=relaxed/simple;
	bh=wOKcUjs9GT4wrZ8FFXd65yYU1arvcYLR/GhEH0xDPmw=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc:
	 References; b=TDnVOIcNkez9WA98T3kWhNfHEAVzGclmWPSTxHnGnlUWevGaXcZx+szUtoV694WmdLGheY11defAHm5fgsOzhsieno89ShVzgzlmpN6UfIWXEHlta96/WcGquFaxenFh96U5V07IOP0Q38OmfFRGFe2hU6+9ahrCkP9D6jIwQiI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=yahoo.pl; spf=pass smtp.mailfrom=yahoo.pl; dkim=pass (2048-bit key) header.d=yahoo.pl header.i=@yahoo.pl header.b=iU6tcSeK; arc=none smtp.client-ip=87.248.110.31
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=yahoo.pl
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=yahoo.pl
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yahoo.pl; s=s2048; t=1773419340; bh=F9koHv+1LUE7hwtVSuPRr8gt/DxfhOCgGIl3jskjLMI=; h=From:Date:Subject:To:Cc:References:From:Subject:Reply-To; b=iU6tcSeKvcqejjO+ngrnQM54X7KzXnNCvl7S5UWEMPvBLmeXtW0r7hy5k1hxDS4K2DUR67XVWd6cOHOyNKUlP8SUcZRyBQ38Qc4PRSoST1gJrTD8CwVqdvYNti577jEWRHD9s+5QWE6t6vSqyOStANRIXCJCjlz/3WTPQnAOy+z636mJ49MYshhtjoHz300BPrUvQ2RlHAvSzQXyC0I+M1iymxrgoPZ7Z4nuHNOfKozvYb1DH9ZSkWxRmgQQPWKBCKc8e6plUpHmCPxaB+DghZwclThYW6WhyuuOvzH+yYZwoa0o7wLSezo1A4VZLwYpHUBBV1W5FWurTx0hkYXsYg==
X-SONIC-DKIM-SIGN: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yahoo.com; s=s2048; t=1773419340; bh=YaSe785QId00jcxyufN2plbify8eTf9X2lxYkT362ge=; h=X-Sonic-MF:From:Date:Subject:To:From:Subject; b=et9sbKZtcnugvbGx1byn09Qv6sNz8gIqfz4mAvu1cHwpHoeAsyaJ6QQhAMtEIn0VlXUxYQCdOkeUFHTEwf4tbdwMpxWHEivU0a6T4EJdxn4A0yadW3xbsQJ+06ayXg2l9seS6HHltlmD2ecXcayjJ/0414IxnInbyR2hhSwZfIDY6CBOmumG0XZaAFTleOrCeUSlI4GsYyY6KKFbmTzlOa1h0IvhfskAl2Ll88m1VXHw2hrSmz/3wG1CXdchI3ZgC5JmDyUmPpBPLJTCw4hBM3H6PSnT6zpempYSnESVUY6G/4v0VrT+hPbi0i1HLOYl9a8n57ngPLQuS2TA28peVw==
X-YMail-OSG: jYRF5yYVM1mJRfwTZ_AHhh49JDxoks3MWe1cZDo15I1OSG.I1R9n1Q54_L4b1R7
 tFDj7uzTnvx.tJRLtNVb0ctFWb8kBTjX6Sb6BdHiCQ_Yn6bGXctC7onXdnyawetRhuxvGPdHm1aT
 uxB0EP6fbjCQjuL9CWpyqpzZ9B4.MoApEuZjZB9qtUKozZN7yYX2hTO_T6APCIt5Rzsc4yRjoCbO
 seoY2abAcNdtNvJj5j8CqJb2wbstjLe7PJumUoq.UNXuySPYGzg0MTXramhw0RT.luASHFQ32sPW
 _p8G1PCGXsXtxqjWly9cenjidTraKvWoyAbl65_OXwOYggmMMxyaBEMD3j2G01UcmMye2Spio_bk
 ORd.P4eACISPM.8zjlHPf7UW4K4CtS.Z9o_MW5f08xYNmnYLeS_FUOtd.gAKj3CgPB8Gtw13OHDa
 N4foGa0XdTebdqUhcdMovA1OLo4uNeKbK5Fi4k8hDv11H9FNLB.D45JqgHfOkvVaTcv_w9nt3Sbo
 1Eog02pvqcUrIC8NQJJboYIZTp1sFqK2CpEkLbes75HEwoSMi4K07XQqATYrEKB30sQ4IU00vs.3
 tSWxSyfefpFY7UiTHi7ZaWHQvPqejBfRGiPaBz_MovlB9LAt7LO0xdIMyJiL5Xc9hsNpxQfKVyRv
 asAr8MlYfuu4AVLfApPM9nW3N7iLNuWez680dtHzM54.tlcQ7.sfWNxDL6EJPflsYqcgFLlEsDPe
 aozV1Lp5w32UdRBVeXmrTOdyMSIXOVkyqRgZDP4IVACiTTWYKLsW357SL2GOIOY_2.ttNxyHfQkr
 LEV4ScGm.mCrQ91MJ8NIVNk0x9A0C9xVYKPOFiCIWCMV9rE2B9efkWT0jRDeLqfQ43LZzpIsjuzc
 b2T3f5ZcZ8f.D6ZIjRyh6djDKYe9SIpYk4JOFNZjYbgZhFHeQsB6sGegNvpUCJqpj.HjaiI7p1e5
 fqd9zgN_50BMfIbNGo1FMMMpMXD.ULX6IO2Npj9kQXp4qlr39RI3l9cjzys2ZjcVtIPw6XQ2beI2
 sXWIIx2xgcqzcOdJu8PN_BHAqk9gB87q6.2d8iQVKKfrW4HalWgjMumu3Gtx8Ku9gmnaCQdT81sy
 9sZZLDLFclN_d6ixJ6LEEWokDeOjZZMzujZxydCswl5Rfa4Y8QbcYc_FC.gEyQqaNgTIWwVkPr96
 6vOY3Zv5ViXlNOVvlmZylzrmFNdj_.R31_qn1lEPrTgPA75DYhuKlZQ7podWRnGOpYknibpNiYB1
 L6vkrAFlfV2svCLIJ2B9A_ftIyV4Dx6v0Og1js6.A3i_NibG9NvkrvdHUpD21sz9AFfi4dJ8_r6u
 a5qoMinjOShe.0ZrGiNg70XoIHP1.G0RJsvj7OdzHzUqNHlojkA6tEBbQ4xnpprRUpT5UTVVr7su
 tidpTiDiSaRhyD9VgjlYcN6CBAotvdiEYhM4NLgwZadPCGBnoVBKaF.zSgyEZfotHZcXgDA7.5_H
 BO5aQajQUZIDilKxa3bpOwsVePMIYUqZf33nGPy4FC2xUo1JdtRAV5tZaNC7MYO7tfvayBjNAh7F
 jGVFpLxc4XQ6sr_aj2ISYTIVx38i7ovaWl4ouJ42BbQiuF_Y2Z83YaJdXdc3lMZBbbKEouVoX6aG
 .XN3E70pL730cCTFG1S3gSJYXcl7vxiVXF9YJbREMgK5lcn34clyfFUCthLzy6rKgI0VNhOBZMzy
 fqJVL_Ddxn9e5L92w96lD5Hfb5EJm92fC4.lay5OJXf0iy3zve2pXsmQvPfKOUpVFFGvrELbwBIr
 i0QMlyukUgNOSA.yklSujYhpcWMYL_DJuwXHwmXuNnadQ.SeqXgZJNqRxx2VloGJdocgl0GIp10Q
 DT1kJzv3_RwkIT99ppIYOC5DZf.ybwO0jve.6aMt0hAXTzDfsyreNw1Z_tTFzCR03LvK4ITgA56T
 KbwS7LxM9Wp4pBce06NvQIj6l69uxceLh5f9b.sp6bBqOTg1jYt3xNSEjB6lVLsuZNuiUfAgD6km
 YFb4ywjkaD2KnD_B24xlk_Sj5ctQMewf9bMc9so.XWo8YCSTUOJmsmmMX.TdAD.kak0InA45Q6XG
 fXpSHk4fIFEK48MhovqKggA.Bk_5i_RFvJ5a3qpXx6Z_oNgBybmf_.HG5gFDbfNiWDXrndBuWLBf
 LXwcxTIuy6.LBp77a99q5ixzqxS8LmryfZz6MzvAL62vC1pGUI9YQ_VDNG_3RMiiGzI85L9HYt55
 IrIZ85.6219HzPLvz91Gi.k4dlTlHNT0PxxnZqiLYmmlThEiLILcF7YcNniQj46saoz9o4ZFvl6G
 w0Pu7LZ8U6G0XU._Jng--
X-Sonic-MF: <tomasz.unger@yahoo.pl>
X-Sonic-ID: df2a25b7-cdbd-46ad-bbc3-6a98d64cb965
Received: from sonic.gate.mail.ne1.yahoo.com by sonic307.consmr.mail.ir2.yahoo.com with HTTP; Fri, 13 Mar 2026 16:29:00 +0000
Received: by hermes--production-ir2-bbcfb4457-v9kq7 (Yahoo Inc. Hermes SMTP Server) with ESMTPA ID ba9dcde7b88ace81387dd64c375fe47f;
          Fri, 13 Mar 2026 16:18:50 +0000 (UTC)
From: Tomasz Unger <tomasz.unger@yahoo.pl>
Date: Fri, 13 Mar 2026 17:18:48 +0100
Subject: [PATCH] staging: media: av7110: replace C++ comments with C style
 comments
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260313-av7110-cpp-comments-v1-1-10c3b3f67fc3@yahoo.pl>
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/x3MTQqAIBBA4avErBvQst+rRAvRqWaRiYYE4d2Tl
 t/ivRciBaYIc/VCoMSRL1cg6wrMod1OyLYYGtH0opUt6jRIKdB4j+Y6T3J3xGFUttO0KW0nKKU
 PtPHzX5c15w+SgvDGZQAAAA==
X-Change-ID: 20260313-av7110-cpp-comments-784d5aef4ad9
To: Mauro Carvalho Chehab <mchehab@kernel.org>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: linux-media@vger.kernel.org, linux-staging@lists.linux.dev, 
 linux-kernel@vger.kernel.org, Tomasz Unger <tomasz.unger@yahoo.pl>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1773418730; l=16186;
 i=tomasz.unger@yahoo.pl; s=20260311; h=from:subject:message-id;
 bh=wOKcUjs9GT4wrZ8FFXd65yYU1arvcYLR/GhEH0xDPmw=;
 b=+UMtqPzvnOElIufWus3Gxrw5Ug+2yMQoTXHuZkqCRPbDPzPGdZyTNeP2m2SFNZx4ZGpLu60ru
 HaEbgI/8+QiCTwoiCbMkhVkPki0jHZ6oy5YT88ZeVjZ1DETmac9JOrS
X-Developer-Key: i=tomasz.unger@yahoo.pl; a=ed25519;
 pk=EPPsO91uz/0J2cTQ6ol+dgxYaieEc9dKSXWUb51n46c=
References: <20260313-av7110-cpp-comments-v1-1-10c3b3f67fc3.ref@yahoo.pl>
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[yahoo.pl,reject];
	R_DKIM_ALLOW(-0.20)[yahoo.pl:s=s2048];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_CC(0.00)[vger.kernel.org,lists.linux.dev,yahoo.pl];
	TAGGED_FROM(0.00)[bounces-55747-lists,linux-media=lfdr.de];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_FROM(0.00)[yahoo.pl];
	TO_DN_SOME(0.00)[];
	DKIM_TRACE(0.00)[yahoo.pl:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	RCPT_COUNT_FIVE(0.00)[6];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[tomasz.unger@yahoo.pl,linux-media@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-media];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,yahoo.pl:dkim,yahoo.pl:email,yahoo.pl:mid]
X-Rspamd-Queue-Id: 04E8E28712B
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Replace C++ style comments (//) with C style comments (/* */) in
av7110.c, av7110_av.c, av7110_ca.c and av7110_hw.c to conform to
the kernel coding style.

Signed-off-by: Tomasz Unger <tomasz.unger@yahoo.pl>
---
 drivers/staging/media/av7110/av7110.c    | 78 ++++++++++++++++----------------
 drivers/staging/media/av7110/av7110_av.c | 18 ++++----
 drivers/staging/media/av7110/av7110_ca.c |  2 +-
 drivers/staging/media/av7110/av7110_hw.c | 14 +++---
 4 files changed, 56 insertions(+), 56 deletions(-)

diff --git a/drivers/staging/media/av7110/av7110.c b/drivers/staging/media/av7110/av7110.c
index 607992100baf..060c6f79d03a 100644
--- a/drivers/staging/media/av7110/av7110.c
+++ b/drivers/staging/media/av7110/av7110.c
@@ -146,7 +146,7 @@ static void init_av7110_av(struct av7110 *av7110)
 	av7110->analog_tuner_flags = 0;
 	av7110->current_input = 0;
 	if (dev->pci->subsystem_vendor == 0x13c2 && dev->pci->subsystem_device == 0x000a)
-		av7110_fw_cmd(av7110, COMTYPE_AUDIODAC, ADSwitch, 1, 0); // SPDIF on
+		av7110_fw_cmd(av7110, COMTYPE_AUDIODAC, ADSwitch, 1, 0); /* SPDIF on */
 	if (i2c_writereg(av7110, 0x20, 0x00, 0x00) == 1) {
 		pr_info("Crystal audio DAC @ card %d detected\n", av7110->dvb_adapter.num);
 		av7110->adac_type = DVB_ADAC_CRYSTAL;
@@ -169,7 +169,7 @@ static void init_av7110_av(struct av7110 *av7110)
 	}
 
 	if (av7110->adac_type == DVB_ADAC_NONE || av7110->adac_type == DVB_ADAC_MSP34x0) {
-		// switch DVB SCART on
+		/* switch DVB SCART on */
 		ret = av7110_fw_cmd(av7110, COMTYPE_AUDIODAC, MainSwitch, 1, 0);
 		if (ret < 0)
 			pr_err("cannot switch on SCART(Main):%d\n", ret);
@@ -180,13 +180,13 @@ static void init_av7110_av(struct av7110 *av7110)
 		    ((av7110->dev->pci->subsystem_vendor == 0x110a) ||
 		     (av7110->dev->pci->subsystem_vendor == 0x13c2)) &&
 		     (av7110->dev->pci->subsystem_device == 0x0000)) {
-			saa7146_setgpio(dev, 1, SAA7146_GPIO_OUTHI); // RGB on, SCART pin 16
-			//saa7146_setgpio(dev, 3, SAA7146_GPIO_OUTLO); // SCARTpin 8
+			saa7146_setgpio(dev, 1, SAA7146_GPIO_OUTHI); /* RGB on, SCART pin 16 */
+			/* saa7146_setgpio(dev, 3, SAA7146_GPIO_OUTLO); SCARTpin 8 */
 		}
 	}
 
 	if (dev->pci->subsystem_vendor == 0x13c2 && dev->pci->subsystem_device == 0x000e)
-		av7110_fw_cmd(av7110, COMTYPE_AUDIODAC, SpdifSwitch, 1, 0); // SPDIF on
+		av7110_fw_cmd(av7110, COMTYPE_AUDIODAC, SpdifSwitch, 1, 0); /* SPDIF on */
 
 	ret = av7110_set_volume(av7110, av7110->mixer.volume_left, av7110->mixer.volume_right);
 	if (ret < 0)
@@ -314,7 +314,7 @@ static int DvbDmxFilterCallback(u8 *buffer1, size_t buffer1_len,
 	}
 }
 
-//#define DEBUG_TIMING
+/* #define DEBUG_TIMING */
 static inline void print_time(char *s)
 {
 #ifdef DEBUG_TIMING
@@ -762,7 +762,7 @@ static int StartHWFilter(struct dvb_demux_filter *dvbdmxfilter)
 	u16 buf[20];
 	int ret, i;
 	u16 handle;
-//	u16 mode = 0x0320;
+	/* u16 mode = 0x0320; */
 	u16 mode = 0xb96a;
 
 	dprintk(4, "%p\n", av7110);
@@ -914,7 +914,7 @@ static int dvb_feed_stop_pid(struct dvb_demux_feed *dvbdmxfeed)
 	npids[4] = 0xffff;
 	i = dvbdmxfeed->pes_type;
 	switch (i) {
-	case 2: //teletext
+	case 2: /* teletext */
 		if (dvbdmxfeed->ts_type & TS_PACKET)
 			ret = StopHWFilter(dvbdmxfeed->filter);
 		npids[2] = 0;
@@ -1550,8 +1550,8 @@ static int alps_bsrv2_tuner_set_params(struct dvb_frontend *fe)
 	buf[2] = ((div & 0x18000) >> 10) | 0x95;
 	buf[3] = (pwr << 6) | 0x30;
 
-	// NOTE: since we're using a prescaler of 2, we set the
-	// divisor frequency to 62.5kHz and divide by 125 above
+	/* NOTE: since we're using a prescaler of 2, we set the */
+	/* divisor frequency to 62.5kHz and divide by 125 above */
 
 	if (fe->ops.i2c_gate_ctrl)
 		fe->ops.i2c_gate_ctrl(fe, 1);
@@ -1820,7 +1820,7 @@ static int nexusca_stv0297_tuner_set_params(struct dvb_frontend *fe)
 		return -EIO;
 	}
 
-	// wait for PLL lock
+	/* wait for PLL lock */
 	for (i = 0; i < 20; i++) {
 		if (fe->ops.i2c_gate_ctrl)
 			fe->ops.i2c_gate_ctrl(fe, 1);
@@ -2079,7 +2079,7 @@ static int frontend_init(struct av7110 *av7110)
 
 	if (av7110->dev->pci->subsystem_vendor == 0x110a) {
 		switch (av7110->dev->pci->subsystem_device) {
-		case 0x0000: // Fujitsu/Siemens DVB-Cable (ves1820/Philips CD1516(??))
+		case 0x0000: /* Fujitsu/Siemens DVB-Cable (ves1820/Philips CD1516(??)) */
 			av7110->fe = dvb_attach(ves1820_attach, &philips_cd1516_config,
 						&av7110->i2c_adap, read_pwm(av7110));
 			if (av7110->fe)
@@ -2089,11 +2089,11 @@ static int frontend_init(struct av7110 *av7110)
 
 	} else if (av7110->dev->pci->subsystem_vendor == 0x13c2) {
 		switch (av7110->dev->pci->subsystem_device) {
-		case 0x0000: // Hauppauge/TT WinTV DVB-S rev1.X
-		case 0x0003: // Hauppauge/TT WinTV Nexus-S Rev 2.X
-		case 0x1002: // Hauppauge/TT WinTV DVB-S rev1.3SE
+		case 0x0000: /* Hauppauge/TT WinTV DVB-S rev1.X */
+		case 0x0003: /* Hauppauge/TT WinTV Nexus-S Rev 2.X */
+		case 0x1002: /* Hauppauge/TT WinTV DVB-S rev1.3SE */
 
-			// try the ALPS BSRV2 first of all
+			/* try the ALPS BSRV2 first of all */
 			av7110->fe = dvb_attach(ves1x93_attach, &alps_bsrv2_config, &av7110->i2c_adap);
 			if (av7110->fe) {
 				av7110->fe->ops.tuner_ops.set_params = alps_bsrv2_tuner_set_params;
@@ -2104,7 +2104,7 @@ static int frontend_init(struct av7110 *av7110)
 				break;
 			}
 
-			// try the ALPS BSRU6 now
+			/* try the ALPS BSRU6 now */
 			av7110->fe = dvb_attach(stv0299_attach, &alps_bsru6_config, &av7110->i2c_adap);
 			if (av7110->fe) {
 				av7110->fe->ops.tuner_ops.set_params = alps_bsru6_tuner_set_params;
@@ -2117,7 +2117,7 @@ static int frontend_init(struct av7110 *av7110)
 				break;
 			}
 
-			// Try the grundig 29504-451
+			/* Try the grundig 29504-451 */
 			av7110->fe = dvb_attach(tda8083_attach, &grundig_29504_451_config, &av7110->i2c_adap);
 			if (av7110->fe) {
 				av7110->fe->ops.tuner_ops.set_params = grundig_29504_451_tuner_set_params;
@@ -2147,11 +2147,11 @@ static int frontend_init(struct av7110 *av7110)
 			}
 			break;
 
-		case 0x0001: // Hauppauge/TT Nexus-T premium rev1.X
+		case 0x0001: /* Hauppauge/TT Nexus-T premium rev1.X */
 		{
 			struct dvb_frontend *fe;
 
-			// try ALPS TDLB7 first, then Grundig 29504-401
+			/* try ALPS TDLB7 first, then Grundig 29504-401 */
 			fe = dvb_attach(sp8870_attach, &alps_tdlb7_config, &av7110->i2c_adap);
 			if (fe) {
 				fe->ops.tuner_ops.set_params = alps_tdlb7_tuner_set_params;
@@ -2161,21 +2161,21 @@ static int frontend_init(struct av7110 *av7110)
 		}
 			fallthrough;
 
-		case 0x0008: // Hauppauge/TT DVB-T
-			// Grundig 29504-401
+		case 0x0008: /* Hauppauge/TT DVB-T */
+			/* Grundig 29504-401 */
 			av7110->fe = dvb_attach(l64781_attach, &grundig_29504_401_config, &av7110->i2c_adap);
 			if (av7110->fe)
 				av7110->fe->ops.tuner_ops.set_params = grundig_29504_401_tuner_set_params;
 			break;
 
-		case 0x0002: // Hauppauge/TT DVB-C premium rev2.X
+		case 0x0002: /* Hauppauge/TT DVB-C premium rev2.X */
 
 			av7110->fe = dvb_attach(ves1820_attach, &alps_tdbe2_config, &av7110->i2c_adap, read_pwm(av7110));
 			if (av7110->fe)
 				av7110->fe->ops.tuner_ops.set_params = alps_tdbe2_tuner_set_params;
 			break;
 
-		case 0x0004: // Galaxis DVB-S rev1.3
+		case 0x0004: /* Galaxis DVB-S rev1.3 */
 			/* ALPS BSRV2 */
 			av7110->fe = dvb_attach(ves1x93_attach, &alps_bsrv2_config, &av7110->i2c_adap);
 			if (av7110->fe) {
@@ -2199,15 +2199,15 @@ static int frontend_init(struct av7110 *av7110)
 			}
 			break;
 
-		case 0x000A: // Hauppauge/TT Nexus-CA rev1.X
+		case 0x000A: /* Hauppauge/TT Nexus-CA rev1.X */
 
 			av7110->fe = dvb_attach(stv0297_attach, &nexusca_stv0297_config, &av7110->i2c_adap);
 			if (av7110->fe) {
 				av7110->fe->ops.tuner_ops.set_params = nexusca_stv0297_tuner_set_params;
 
 				/* set TDA9819 into DVB mode */
-				saa7146_setgpio(av7110->dev, 1, SAA7146_GPIO_OUTLO); // TDA9819 pin9(STD)
-				saa7146_setgpio(av7110->dev, 3, SAA7146_GPIO_OUTLO); // TDA9819 pin30(VIF)
+				saa7146_setgpio(av7110->dev, 1, SAA7146_GPIO_OUTLO); /* TDA9819 pin9(STD) */
+				saa7146_setgpio(av7110->dev, 3, SAA7146_GPIO_OUTLO); /* TDA9819 pin30(VIF) */
 
 				/* tuner on this needs a slower i2c bus speed */
 				av7110->dev->i2c_bitrate = SAA7146_I2C_BUS_BIT_RATE_240;
@@ -2362,14 +2362,14 @@ static int av7110_attach(struct saa7146_dev *dev,
 		saa7146_write(dev, DD1_STREAM_B, 0);
 		/* port B VSYNC at rising edge */
 		saa7146_write(dev, DD1_INIT, 0x00000200);
-		saa7146_write(dev, BRS_CTRL, 0x00000000);  // VBI
+		saa7146_write(dev, BRS_CTRL, 0x00000000);  /* VBI */
 		saa7146_write(dev, MC2,
-			      1 * (MASK_08 | MASK_24)  |   // BRS control
-			      0 * (MASK_09 | MASK_25)  |   // a
-			      1 * (MASK_10 | MASK_26)  |   // b
-			      0 * (MASK_06 | MASK_22)  |   // HPS_CTRL1
-			      0 * (MASK_05 | MASK_21)  |   // HPS_CTRL2
-			      0 * (MASK_01 | MASK_15)      // DEBI
+			      1 * (MASK_08 | MASK_24)  |   /* BRS control */
+			      0 * (MASK_09 | MASK_25)  |   /* a */
+			      1 * (MASK_10 | MASK_26)  |   /* b */
+			      0 * (MASK_06 | MASK_22)  |   /* HPS_CTRL1 */
+			      0 * (MASK_05 | MASK_21)  |   /* HPS_CTRL2 */
+			      0 * (MASK_01 | MASK_15)      /* DEBI */
 		);
 
 		/* start writing RPS1 code from beginning */
@@ -2785,14 +2785,14 @@ static void av7110_irq(struct saa7146_dev *dev, u32 *isr)
 {
 	struct av7110 *av7110 = dev->ext_priv;
 
-	//print_time("av7110_irq");
+	/* print_time("av7110_irq"); */
 
 	/* Note: Don't try to handle the DEBI error irq (MASK_18), in
 	 * intel mode the timeout is asserted all the time...
 	 */
 
 	if (*isr & MASK_19) {
-		//printk("av7110_irq: DEBI\n");
+		/* printk("av7110_irq: DEBI\n"); */
 		/* Note 1: The DEBI irq is level triggered: We must enable it
 		 * only after we started a DMA xfer, and disable it here
 		 * immediately, or it will be signalled all the time while
@@ -2814,7 +2814,7 @@ static void av7110_irq(struct saa7146_dev *dev, u32 *isr)
 	}
 
 	if (*isr & MASK_03) {
-		//printk("av7110_irq: GPIO\n");
+		/* printk("av7110_irq: GPIO\n"); */
 		tasklet_schedule(&av7110->gpio_tasklet);
 	}
 
@@ -2854,8 +2854,8 @@ static const struct pci_device_id pci_tbl[] = {
 	MAKE_EXTENSION_PCI(tts_2_3,     0x13c2, 0x000e),
 	MAKE_EXTENSION_PCI(tts_1_3se,   0x13c2, 0x1002),
 
-//	MAKE_EXTENSION_PCI(???, 0x13c2, 0x0005), UNDEFINED CARD  // Technisat SkyStar1
-//	MAKE_EXTENSION_PCI(???, 0x13c2, 0x0009), UNDEFINED CARD  // TT/Hauppauge WinTV Nexus-CA v???
+	/* MAKE_EXTENSION_PCI(???, 0x13c2, 0x0005), UNDEFINED CARD - Technisat SkyStar1 */
+	/* MAKE_EXTENSION_PCI(???, 0x13c2, 0x0009), UNDEFINED CARD - TT/Hauppauge WinTV Nexus-CA v??? */
 
 	{
 		.vendor    = 0,
diff --git a/drivers/staging/media/av7110/av7110_av.c b/drivers/staging/media/av7110/av7110_av.c
index 2993ac43c49c..8b266a2706ee 100644
--- a/drivers/staging/media/av7110/av7110_av.c
+++ b/drivers/staging/media/av7110/av7110_av.c
@@ -41,7 +41,7 @@
 
 #define PTS_DTS_FLAGS	 0xC0
 
-//pts_dts flags
+/* pts_dts flags */
 #define PTS_ONLY	 0x80
 #define PTS_DTS		 0xC0
 #define TS_SIZE		 188
@@ -49,14 +49,14 @@
 #define PAY_START	 0x40
 #define TRANS_PRIO	 0x20
 #define PID_MASK_HI	 0x1F
-//flags
+/* flags */
 #define TRANS_SCRMBL1	 0x80
 #define TRANS_SCRMBL2	 0x40
 #define ADAPT_FIELD	 0x20
 #define PAYLOAD		 0x10
 #define COUNT_MASK	 0x0F
 
-// adaptation flags
+/* adaptation flags */
 #define DISCON_IND	 0x80
 #define RAND_ACC_IND	 0x40
 #define ES_PRI_IND	 0x20
@@ -66,7 +66,7 @@
 #define TRANS_PRIV	 0x02
 #define ADAP_EXT_FLAG	 0x01
 
-// adaptation extension flags
+/* adaptation extension flags */
 #define LTW_FLAG	 0x80
 #define PIECE_RATE	 0x40
 #define SEAM_SPLICE	 0x20
@@ -81,7 +81,7 @@ int av7110_record_cb(struct dvb_filter_pes2ts *p2t, u8 *buf, size_t len)
 
 	if (!(dvbdmxfeed->ts_type & TS_PACKET))
 		return 0;
-	if (buf[3] == 0xe0) {	 // video PES do not have a length in TS
+	if (buf[3] == 0xe0) {	 /* video PES do not have a length in TS */
 		buf[4] = 0;
 		buf[5] = 0;
 	}
@@ -252,7 +252,7 @@ int av7110_pes_play(void *dest, struct dvb_ringbuffer *buf, int dlen)
 	blen |= DVB_RINGBUFFER_PEEK(buf, 5);
 	blen += 6;
 	if (len < blen || blen > dlen) {
-		//pr_info("buffer empty - avail %d blen %u dlen %d\n", len, blen, dlen);
+		/* pr_info("buffer empty - avail %d blen %u dlen %d\n", len, blen, dlen); */
 		wake_up(&buf->queue);
 		return -1;
 	}
@@ -580,7 +580,7 @@ void av7110_p2t_init(struct av7110_p2t *p, struct dvb_demux_feed *feed)
 static void clear_p2t(struct av7110_p2t *p)
 {
 	memset(p->pes, 0, TS_SIZE);
-//	p->counter = 0;
+	/* p->counter = 0; */
 	p->pos = 0;
 	p->frags = 0;
 }
@@ -878,7 +878,7 @@ void dvb_video_add_event(struct av7110 *av7110, struct video_event *event)
 		events->eventr = (events->eventr + 1) % MAX_VIDEO_EVENT;
 	}
 
-	//FIXME: timestamp?
+	/* FIXME: timestamp? */
 	memcpy(&events->events[events->eventw], event, sizeof(struct video_event));
 	events->eventw = wp;
 
@@ -1288,7 +1288,7 @@ static int dvb_video_ioctl(struct file *file,
 	}
 
 	case VIDEO_FAST_FORWARD:
-		//note: arg is ignored by firmware
+		/* note: arg is ignored by firmware */
 		if (av7110->playing & RP_VIDEO)
 			ret = av7110_fw_cmd(av7110, COMTYPE_REC_PLAY,
 					    __Scan_I, 2, AV_PES, 0);
diff --git a/drivers/staging/media/av7110/av7110_ca.c b/drivers/staging/media/av7110/av7110_ca.c
index 63d9c97a5190..4c77d57862a5 100644
--- a/drivers/staging/media/av7110/av7110_ca.c
+++ b/drivers/staging/media/av7110/av7110_ca.c
@@ -52,7 +52,7 @@ void CI_handle(struct av7110 *av7110, u8 *data, u16 len)
 		}
 		break;
 	case CI_SWITCH_PRG_REPLY:
-		//av7110->ci_stat=data[1];
+		/* av7110->ci_stat=data[1]; */
 		break;
 	default:
 		break;
diff --git a/drivers/staging/media/av7110/av7110_hw.c b/drivers/staging/media/av7110/av7110_hw.c
index 49ce295771e4..f8ef7994e746 100644
--- a/drivers/staging/media/av7110/av7110_hw.c
+++ b/drivers/staging/media/av7110/av7110_hw.c
@@ -13,7 +13,7 @@
  */
 
 /* for debugging ARM communication: */
-//#define COM_DEBUG
+/* #define COM_DEBUG */
 
 #include <linux/types.h>
 #include <linux/kernel.h>
@@ -232,8 +232,8 @@ int av7110_bootarm(struct av7110 *av7110)
 	/* boot */
 	dprintk(1, "load boot code\n");
 	saa7146_setgpio(dev, ARM_IRQ_LINE, SAA7146_GPIO_IRQLO);
-	//saa7146_setgpio(dev, DEBI_DONE_LINE, SAA7146_GPIO_INPUT);
-	//saa7146_setgpio(dev, 3, SAA7146_GPIO_INPUT);
+	/* saa7146_setgpio(dev, DEBI_DONE_LINE, SAA7146_GPIO_INPUT); */
+	/* saa7146_setgpio(dev, 3, SAA7146_GPIO_INPUT); */
 
 	ret = request_firmware(&fw, fw_name, &dev->pci->dev);
 	if (ret) {
@@ -271,7 +271,7 @@ int av7110_bootarm(struct av7110 *av7110)
 	saa7146_setgpio(dev, RESET_LINE, SAA7146_GPIO_OUTHI);
 	msleep(30);	/* the firmware needs some time to initialize */
 
-	//ARM_ClearIrq(av7110);
+	/* ARM_ClearIrq(av7110); */
 	ARM_ResetMailBox(av7110);
 	SAA7146_ISR_CLEAR(av7110->dev, MASK_19 | MASK_03);
 	SAA7146_IER_ENABLE(av7110->dev, MASK_03);
@@ -326,7 +326,7 @@ static int __av7110_send_fw_cmd(struct av7110 *av7110, u16 *buf, int length)
 	u32 stat;
 	int err;
 
-//	dprintk(4, "%p\n", av7110);
+	/* dprintk(4, "%p\n", av7110); */
 
 	if (!av7110->arm_ready) {
 		dprintk(1, "arm not ready.\n");
@@ -453,7 +453,7 @@ static int av7110_send_fw_cmd(struct av7110 *av7110, u16 *buf, int length)
 {
 	int ret;
 
-//	dprintk(4, "%p\n", av7110);
+	/* dprintk(4, "%p\n", av7110); */
 
 	if (!av7110->arm_ready) {
 		dprintk(1, "arm not ready.\n");
@@ -475,7 +475,7 @@ int av7110_fw_cmd(struct av7110 *av7110, int type, int com, int num, ...)
 	u16 buf[MAX_XFER_SIZE];
 	int i, ret;
 
-//	dprintk(4, "%p\n", av7110);
+	/* dprintk(4, "%p\n", av7110); */
 
 	if (2 + num > ARRAY_SIZE(buf)) {
 		pr_warn("%s(): len=%d is too big!\n", __func__, num);

---
base-commit: 0257f64bdac7fdca30fa3cae0df8b9ecbec7733a
change-id: 20260313-av7110-cpp-comments-784d5aef4ad9

Best regards,
-- 
Tomasz Unger <tomasz.unger@yahoo.pl>


