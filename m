Return-Path: <linux-media+bounces-56492-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id WPZzBnAJvWkO5gIAu9opvQ
	(envelope-from <linux-media+bounces-56492-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Fri, 20 Mar 2026 09:46:40 +0100
X-Original-To: lists+linux-media@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 59C3A2D76BC
	for <lists+linux-media@lfdr.de>; Fri, 20 Mar 2026 09:46:39 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 44119300699F
	for <lists+linux-media@lfdr.de>; Fri, 20 Mar 2026 08:46:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 94035375ABA;
	Fri, 20 Mar 2026 08:46:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=yahoo.pl header.i=@yahoo.pl header.b="D9guehR0"
X-Original-To: linux-media@vger.kernel.org
Received: from sonic308-17.consmr.mail.ir2.yahoo.com (sonic308-17.consmr.mail.ir2.yahoo.com [77.238.178.145])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AF155366067
	for <linux-media@vger.kernel.org>; Fri, 20 Mar 2026 08:46:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=77.238.178.145
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773996386; cv=none; b=R5cUsJPx0AEb5WuR2Sn/NEo9Dy4YekD/aIkthIN9j3Yhd2jUcvo1GfSoQO57O7aobsHSKjU5/BUxT0wNM/6xYlHN8syQvCpg6FnAN5s3Nfw2Hi81xseHnj2SEqndfAoZXk0fZHCHzoNRMfVyObtrUwl9EcjiXKkjeUyv23MuZSA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773996386; c=relaxed/simple;
	bh=AEDr6x8wS6elYp/8e5HcGKCCkTNoWKNeqaOU19CE9Qw=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc:
	 References; b=iYfbg2BrhOaO7LQeRmJcMTqNfWsn2A8/2I8w+dWcpJJpAo/XAS+o0HgbMdMnEl/BqHc5AL1gG+/8ut2rcHlK8FF/MfRfl2NyVakcrl40HvF8m6lL9S+2UmEoAJEnF4ZpBH6q4NJCs2Qgmpv9/JANIP4z+IIzJLRls9R9uCQypN0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=yahoo.pl; spf=pass smtp.mailfrom=yahoo.pl; dkim=pass (2048-bit key) header.d=yahoo.pl header.i=@yahoo.pl header.b=D9guehR0; arc=none smtp.client-ip=77.238.178.145
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=yahoo.pl
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=yahoo.pl
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yahoo.pl; s=s2048; t=1773996382; bh=KDQBv1OgJnwRXGofX4SlUwxc7v9l7Aa5GLL94fSlqCI=; h=From:Date:Subject:To:Cc:References:From:Subject:Reply-To; b=D9guehR0lVatwg4NTfkqCwi/uMdUfj58FZ1nH1wQxqfmoXqoSnZl85hP2mfp6WoD+4KWd6qKnFGhPPRoRp9D8YK+O7fKEtM44DQRQ3EqpQtkSHnmm9cTcifCF9hyLo4niUmCE3oUGfvp2PLUCE0Fgr2hIo4q+85KcnFv2FWaQcpYDJWCU/chjCrzlM31QVTYq4TNYBmsqrJPcvZCW4hqn3pLBvTYXKijzVL3aw5sbL6gn5O3+UtdRaDUM1D3cjebNS1YFImOqLuWunLxwWJOpHCETSyj+TidBwp07LGkHcef4Wtz7U4IR8fgKTEm/kWTmGvZqiyJaV7zeMOm0gi85A==
X-SONIC-DKIM-SIGN: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yahoo.com; s=s2048; t=1773996382; bh=DUZGO8/Wpzi8dygheLxSefqKwZv49IqyVuRnKsfmnkP=; h=X-Sonic-MF:From:Date:Subject:To:From:Subject; b=mM7wWlHx2GU2h52KvxTaQIY8IKPhNb7gU6DUKLlKK5p396CMXaWFguBYIFQFhC/HKEx8zRHY/uBovQATeMTtdhmvfPi3Jiu/hsbWtHy1FwyZf0UMfhGShoD+zdd/MBldKk7ffESdsQO6BrHLAlifn3BCPsl9v/9uVbJXMerka9gPYQsjGDDbs3eq7rgFGUmBFEvt90yQ+pw4wE7NPTDT26iwByGJrCOECjGOknKOZb8Jcy/Yd9f0rDpqgE3WXyAlKbXPJRDVEiQW7irVBRr59Q94XeJ0Fk3Pd5esGkfNEEmndQMIafKCklk5OJ+fDigbXnvG+S1WLYEvIxLLhQevlg==
X-YMail-OSG: SrCgK18VM1mNc34eibXfQ1xaAba2SbNKQxY1JsYKfYBHJZMl9abCyNDOb9OT8LG
 OmJ.MkbIpgKJ2k0t1rzjeL7UxoahUv.pEat9jsLB6RXbLQVSVCPt21bm3BDY.MiAwsN4l6GLLAwM
 Sry3T65kNCMWdvf.2LckfYoEAW8NYjkvNtW.Gzv1CHXpEktoInHV21w6qk4bdNd57d8jYmpXQ3Lz
 2p8nH1AWCOSAgPRDxLStlIMWOVvMiAUMvB6LihBSCPuC1B5shZdO28wtrivXVcxTwnKJGVli5QIh
 al_ELorqTWTguXsFXx7v8Fuwl_lK4Q6cjG2PiuOh36Ht4Ed.y9MBZmj6R9YGwXzq8KIngTSu4li7
 mqhYW2N9vY55CZqhJ2U2OdGpm1Ii_BwU..MMGhHOfHG9kqb9Rhpa37a2fusckhTvtGK9kpsUErOn
 2TtQhfmahOMlz9a0Y5KHOVJjgkRFcQw_HjsLcyUt6Sv7Z_AHgRIKOUUcSZoNfD3a1VhELWlyLAEp
 TH5WRJ8v5oxz0JTQ9cEqRpvd..e6XazZ0ffAepl488ZW49sh_naTM3Dj692XWggcPWtFvAQo06q1
 0NEAr9bjXHOomVWY.nHpaqB3oZAencsoKHoFwVVOCw4tyxTLkgq5GQgVwJp34AG9NMpSb0Phy92H
 f0GP3ySLIXNXOVUm_H59QZ1IM_XOjBFaHIo_SJWr4j144cLaZvGmO6XSueisTomIwxYXMjqKjc.o
 dI29FWw_GXZ1yc84dF0fS_zn44g25svc_zrSL1.6DAdY4sc_nwjIutrxTySp7rO5FxmP9chT31KU
 CkH5kMA5bS44FCjGI8efdEEWBIHuV8YKN24_tm5we.adU8DQsMumW0vOPCt7Nj3ZWTOK7xF.Wv.t
 YEYRIG.uPRX7_QP8dHjW6H5LRi8mOKiEHkTO5sTlxWIv9IPt954dB7K9OXuhzpPezTCfQFClLKQs
 jrotBPKSppPlrXBoueqPGTd0mAhHrtnQI1iAzgJZwCGBLFKpMikOt4xk06cwhRkSaNa868pqqNW7
 wJa5zcgRAOoi_SE87brYEFSAhlYZ4tQeY6jUBMX9Wz9.PuUFizsl6qQMCr9.PKNtU6N4Mc7wb5Z.
 Vm.TO.6tyQGKXKYTAP1SAFE.QOXf6nYv3dIIZvgGvgCJAiEA1VPdK4QfOkhZ9p.6cfUbCeUbSceJ
 dR5UjCdqUD_VkzuIUgsjYhATnzdGn9vd2tzc1FOdrUVMZJ3twKM0DGd.T70jljCwp.LiR9IMWlr4
 vUDMXyZm_eyu10JgY.ylAlMxEMNJzjO71OC0BPP5lB9Zsdhkie5JtiBw1JPb91Ubxij1Iz1vsXid
 T5crqEB0SiJu7tquBz3Fl2eTe..tDffZTST1PBz2RWqGVoTGz6dsDRG.r.ktriJ0uUsSj45Dm5sf
 t2L2kxnRHxXM4JGpXgoLyhrEYGEZuW3AYxGq_5DxAwjW3cjhW5ulZzcdvO9pxWhw.6dW9c2IfidP
 t1O0THZhAjknO2i7nMNWEyBWuXh44EgnQ50ylcXcudRMJChyttyZt7zmyYeg8ncvKXjZeYZX12Ff
 ZbDSVoMnEU0dnNjSTiwt8U5HrAx7v6U6S7inT7_.1IgAaQ7vRcDXi7hY_4sjiWLfWXkoZ2kPt7kd
 4cQAINxK4gKGxyGAjzz.1hxdbSuzkr6o3VKwvBiycHwp26pE0I01rqHilGL.w.lgGqeF46EuRqee
 GMDM9WOnmCWVAsOgQA6naOuublXt7ooQh_l3TkLMYohm_0t.g2gvqdM7zUpIsLo6ZXI3FS7X7kVu
 5YapIGEHglygAIiCONbi_Li9F5cSCPCoPOGKy7.RG2ev3Ze1yQ6E6eelH5NNTtk5IhJQneXqh84t
 yw6hu1yNhsZWXIsx8WTuUcsNy_mcS55E11j7BHWdXZ8wSFUAL0.Oxu1hJP82XcOagN.B.uzhOc1A
 LDRpEo9BjvnksDNBChicLHLhY3aJASGk1DqOnTzuZ42oNMOpvYI9mofePMkFl54DotytiSHMeHvB
 45T2HSJupgiM.Zecx1fmAvioP8EZcNo55k0c7W4DDlPpwKMEYxVubCq8QQ09y8iMm7F86UpRIRRK
 s0Kh46pXfK1OHHYg86_8EyR7XdFU7Xx8tiQkyTciJfI7jbb_KECUbcTIVK7eJpZuXb_aSk18WIOn
 P4kAAuwxQBL250HE1e6PoxyNF3R4bz1_Af_GtFPRWS71jQ9RngewHvmfsRbfYdsc67chL7aoizkR
 EGFc3iJAViendyIXDLomfRuGNPl_KHm01WhgbFNSo5vkZIIR8B8UWiwFDeNy7pVkcFzShW.F5i4c
 0jGlcowstsmACvLaEsmLoy5TYQIWdnrc1
X-Sonic-MF: <tomasz.unger@yahoo.pl>
X-Sonic-ID: 7b452fcd-60f2-4a9d-b898-92516046ed2f
Received: from sonic.gate.mail.ne1.yahoo.com by sonic308.consmr.mail.ir2.yahoo.com with HTTP; Fri, 20 Mar 2026 08:46:22 +0000
Received: by hermes--production-ir2-bbcfb4457-jfg7j (Yahoo Inc. Hermes SMTP Server) with ESMTPA ID 2275d1e3f7f33fd0beb088b70e87ed8a;
          Fri, 20 Mar 2026 08:46:17 +0000 (UTC)
From: Tomasz Unger <tomasz.unger@yahoo.pl>
Date: Fri, 20 Mar 2026 09:46:15 +0100
Subject: [PATCH] staging: media: av7110: remove print_time() dead code
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260320-av7110-remove-print-time-v1-1-05402287078a@yahoo.pl>
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/x3MQQqDMBBG4avIrB3IJBDFq5QuJP1tZ2GUiQRBv
 Luhy2/x3kUFpig0dRcZqhbdcoP0HaXfnL9g/TSTdz664B3PdRBxbFi3Ct5N88GHruBxCEGQkiw
 xUst3w6Lnf/163/cDOhKKD2oAAAA=
X-Change-ID: 20260320-av7110-remove-print-time-87331ecc1f66
To: Mauro Carvalho Chehab <mchehab@kernel.org>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: linux-media@vger.kernel.org, linux-staging@lists.linux.dev, 
 linux-kernel@vger.kernel.org, Tomasz Unger <tomasz.unger@yahoo.pl>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1773996376; l=2132;
 i=tomasz.unger@yahoo.pl; s=20260311; h=from:subject:message-id;
 bh=AEDr6x8wS6elYp/8e5HcGKCCkTNoWKNeqaOU19CE9Qw=;
 b=y/+Ikz0nk01OK7mYDosKDE2o4xHxPwahk9pj2wy71zzh6Yg2IXKLGmqrEEpA3YaFQjBrKs/C8
 BsmBJtIAQFdA2A4T3eJSVRN7VQyc/MByoYeK3rQqxBLN3iOhevI6G0T
X-Developer-Key: i=tomasz.unger@yahoo.pl; a=ed25519;
 pk=EPPsO91uz/0J2cTQ6ol+dgxYaieEc9dKSXWUb51n46c=
References: <20260320-av7110-remove-print-time-v1-1-05402287078a.ref@yahoo.pl>
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[yahoo.pl,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c15:e001:75::/64:c];
	R_DKIM_ALLOW(-0.20)[yahoo.pl:s=s2048];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TO_DN_SOME(0.00)[];
	FREEMAIL_CC(0.00)[vger.kernel.org,lists.linux.dev,yahoo.pl];
	MIME_TRACE(0.00)[0:+];
	TAGGED_FROM(0.00)[bounces-56492-lists,linux-media=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[yahoo.pl:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	FREEMAIL_FROM(0.00)[yahoo.pl];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[tomasz.unger@yahoo.pl,linux-media@vger.kernel.org];
	ASN(0.00)[asn:63949, ipnet:2600:3c15::/32, country:SG];
	NEURAL_HAM(-0.00)[-0.992];
	TAGGED_RCPT(0.00)[linux-media];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCPT_COUNT_FIVE(0.00)[6]
X-Rspamd-Queue-Id: 59C3A2D76BC
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

The DEBUG_TIMING macro is commented out and can never be defined,
making the print_time() function body always empty. Remove the
commented-out macro, the unused function definition and all its
call sites as they serve no purpose.

Signed-off-by: Tomasz Unger <tomasz.unger@yahoo.pl>
---
Checked with scripts/checkpatch.pl - no errors, no warnings.
Compiled and verified by loading the module in QEMU.
---
 drivers/staging/media/av7110/av7110.c | 14 --------------
 1 file changed, 14 deletions(-)

diff --git a/drivers/staging/media/av7110/av7110.c b/drivers/staging/media/av7110/av7110.c
index 607992100baf..9f4ed1e24b17 100644
--- a/drivers/staging/media/av7110/av7110.c
+++ b/drivers/staging/media/av7110/av7110.c
@@ -314,17 +314,6 @@ static int DvbDmxFilterCallback(u8 *buffer1, size_t buffer1_len,
 	}
 }
 
-//#define DEBUG_TIMING
-static inline void print_time(char *s)
-{
-#ifdef DEBUG_TIMING
-	struct timespec64 ts;
-
-	ktime_get_real_ts64(&ts);
-	pr_info("%s(): %ptSp\n", s, &ts);
-#endif
-}
-
 #define DEBI_READ 0
 #define DEBI_WRITE 1
 static inline void start_debi_dma(struct av7110 *av7110, int dir,
@@ -353,7 +342,6 @@ static void debiirq(struct tasklet_struct *t)
 	int handle = (type >> 8) & 0x1f;
 	unsigned int xfer = 0;
 
-	print_time("debi");
 	dprintk(4, "type 0x%04x\n", type);
 
 	if (type == -1) {
@@ -473,7 +461,6 @@ static void gpioirq(struct tasklet_struct *t)
 	txbuf = irdebi(av7110, DEBINOSWAP, TX_BUFF, 0, 2);
 	len = (av7110->debilen + 3) & ~3;
 
-	print_time("gpio");
 	dprintk(8, "GPIO0 irq 0x%04x %d\n", av7110->debitype, av7110->debilen);
 
 	switch (av7110->debitype & 0xff) {
@@ -2785,7 +2772,6 @@ static void av7110_irq(struct saa7146_dev *dev, u32 *isr)
 {
 	struct av7110 *av7110 = dev->ext_priv;
 
-	//print_time("av7110_irq");
 
 	/* Note: Don't try to handle the DEBI error irq (MASK_18), in
 	 * intel mode the timeout is asserted all the time...

---
base-commit: 82e1c68ac206efe42854296c462aa83f541ea22c
change-id: 20260320-av7110-remove-print-time-87331ecc1f66

Best regards,
-- 
Tomasz Unger <tomasz.unger@yahoo.pl>


