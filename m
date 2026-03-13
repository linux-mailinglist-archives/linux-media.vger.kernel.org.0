Return-Path: <linux-media+bounces-55748-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 6Kz3IvQ8tGmDjQAAu9opvQ
	(envelope-from <linux-media+bounces-55748-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Fri, 13 Mar 2026 17:36:04 +0100
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 11586287203
	for <lists+linux-media@lfdr.de>; Fri, 13 Mar 2026 17:36:04 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 5F5CD329EC28
	for <lists+linux-media@lfdr.de>; Fri, 13 Mar 2026 16:32:29 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5BDBC3B27D3;
	Fri, 13 Mar 2026 16:32:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=yahoo.pl header.i=@yahoo.pl header.b="TJLEnntc"
X-Original-To: linux-media@vger.kernel.org
Received: from sonic312-26.consmr.mail.ir2.yahoo.com (sonic312-26.consmr.mail.ir2.yahoo.com [77.238.178.97])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 23C603C13F4
	for <linux-media@vger.kernel.org>; Fri, 13 Mar 2026 16:32:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=77.238.178.97
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773419547; cv=none; b=IhE09VibMOlhOzgImNXO69BaT5bdQxcSLsWCvPtzEPrRy/4tqIhnkFshkFeBqzQYAwpzpo7u5ZOt68kUjDYGS3jGNPaDRIUghUkjp45x/HDBe8vDZ8F8jbsMfd53JdLCoxuIkCDnvZHXAfxsiu6IW6diU/4MYXnk1WXtwmGNbeM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773419547; c=relaxed/simple;
	bh=rlewnPyT4dkele4c5ugodYCgNhsow7gtaU0JfPJxRrA=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc:
	 References; b=iDGeV+sMJLcilg1O2PX4nSg43ZEP/QvdAo/UFTBu2xRize5jjQT4HfsyQ5SnlA9G9Q2MxEa71FKavbA2Nm5lneBVti+b5uYUluMIIWfrWDB9H+OVxJOZdg1lOBY52YdYJtV+wdvexHalN+t6uvUu74UQ4GWEc9L6GurZdXZpsBE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=yahoo.pl; spf=pass smtp.mailfrom=yahoo.pl; dkim=pass (2048-bit key) header.d=yahoo.pl header.i=@yahoo.pl header.b=TJLEnntc; arc=none smtp.client-ip=77.238.178.97
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=yahoo.pl
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=yahoo.pl
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yahoo.pl; s=s2048; t=1773419544; bh=2gVLdKdVjf2z6Ab6eBpSJtAPpIKv5pQBRewMihkvHGg=; h=From:Date:Subject:To:Cc:References:From:Subject:Reply-To; b=TJLEnntcbnM5EYF5nbAvawJen28+2xkKtVb1HI0xBDHE1OFtO81IJTxbxvlTuoTY1GJiar4MlguDKJKqC6dv5ryquaGxjgXRGAD/seE0xlColws2F87nmMtTnkv+8zkyrDBK2epo86YGpn1fvvMwYaUc6zNNfkR6dWWXkHY/iBe2AZ6yDTK0xIy5mu0LBh5CIT5H5nedZH3v9AleVPs/Ig5uzSu1CkBY43cRIP5KBYowTv19KayWac+yemSHR8S4ozuWladSwtc24uXbepHd2YtNI268vcB8+QTL/UPaRsiKzRDEhV1fADmyMbYjzqL3UaiZodnviH8/i+c+bkkBIw==
X-SONIC-DKIM-SIGN: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yahoo.com; s=s2048; t=1773419544; bh=S3jZOfulUdnrWW9xYHSQ5TTZLgc7Mi712gfROSRtH/2=; h=X-Sonic-MF:From:Date:Subject:To:From:Subject; b=MwUr1b0Rv3nuA2Ij8NUzPL3cV/msaYAvKPp13dcksrMhITJjxx9phGyd7pD7azIaAyJG/jSa6INs7gHyGykJKACs7CZA1j347JS1DniQGwZ7TNOLQUERRpEc9LOr9cT+5TO9ZBRKXDgNj7/kdcz0UsuWFdu9z9QrusdoTqC7ApcJm+tkbQU9Ew9bgK1zaP6++xDgKwdwrFO6tqw09qmCJVebpC06JvvSxHXKm7/+wQ7KtnzklRAEIdLTZcYn3I8xhEXxkHqwH6sBWTy52L06QhnMDQfzYS4eB3jaJthuEWdJdUuw5jWLIVSRkAYpwdFx8pR1n18L4W8W1N5d8SjDCA==
X-YMail-OSG: B_Mnsg0VM1nZGxfnBEBDz8K9clNnb_qjgxvkLmpTYPUGyWIlUi8f8sNeGYP.33Q
 dTNn0w4WrdurJHt98PiPVlJiF8Z7J79sL43bgAGMP1DBFjZVNlYipx2qi7XyDNvkpxijUmVW_0fQ
 _bcCp50BcYHNfIUnWl1PTQJiPZJAwPLyyATmEIE.CsNr.KZwH6eula6iI09T7o7XNpA4ztOMNROc
 BFgX3U6C1KtBUCGVQ6Ud7HQy0Iwhj4hvAsb25ylqAhhnVLWdwL4xiDODW7riTRTAXL3Bm6ifbdxp
 C5O_02uqNabsZ4OH68gP_vDQXE6Iq.qy41r6ni5IGzA9jrXMiqAB0otLKMZz9eDt7Pywc4Impehz
 iTm6UWyAve8N9OfCJ2YpNxuvue_P.SuIVzY5cwoAw9MlH7McBZYSOC5rsZ8.6N3Zd3rQJ9SDpGH9
 4Xr38Q1xuC04K.xjAK8d4ZAnLx_EaCWVCkNuI8QQ7oKTOpRleplc6Blea3PW6cjQKNb0xkJrsSlA
 EAj83R06i4winlE3o19CoSaDBwUgdjeDG_bTbD30Y.fVkSMh45DVHF1ugS6IkbPq6plxde51qNSb
 qTyvez2aSDMgNXwGtpiIu2ZosGskiym_O8C_SjfEmCj6Lfk0jBLC0O2G_IytYBCmLkmNEVh264nL
 C.p2QpNUpbU6DR42Zwu9TBEbrzmDrTsWsc4XNIowDtTOOqe.O7llwVxwZEstoGF39wSx7fh17hvM
 9A7yyEtqcf4XDbOk55c7y7LUuu3lRdPWo_Q9_vgmuCa.2qS76pgr_0YPsdjNIcbaWnZ4Df9diLxF
 mgyJTxhYEI5imPyhBpAPhQYU4FZTZrDWmBs_SSuFOjVKZbQYoRftProx7iNtpmdnRJ6t_PljwyoA
 caDCIt2.UyehqasPFANeAh3NpHdUKNXhfaZzY5yk91uoxleEY8.ohWfoHSzW5BCdbNAkKuFqXnMC
 RYQr8PDTJ_J9uQUgx_uNdJN7oSY4clb4u2A4KSLRM5PjJFu2x6mbCa4takc9M8KVj0cFvpony7KU
 kSt9uSJOm5XMZFKtPGQkPL0kcp1k_awreLQto4_jJgbQNRHvLvQPKQdYMOnVW9Trku.PQTe2y3A8
 BXSekd1QUGjAvdNiMOE5pwuBEEJE4S07n2T0ChBsNxuhdUPG9wTy.fDutmxrG.8e0GyEc58kiN1_
 uGOHr0O.RC1wuA_hdOxs2GFZ2zGfdb5bGzClFtIniQSa_z8zuAbXcuD8.4CDPQaoUecR4QNSZrfV
 J7UTDRy26ZkfTpR5FZRMfS9Ge10g1cI0Ipv77GvpBVHeev6z9F6ny1JlCWG9ftJHh78Ucz4IzY2k
 O7DYjBWNjv3roigLGIb66du6ttWodAO1O8JYS5YVG6UbnZxpNcuWo2zco1mVYAshsoOdj3CkXeAo
 yd.O1jrxMr5Vrc4Js3S.JuKTw9_rGuMKMnuR.83aN16xDy.a53dPc3SoSkNYmum_hdeX1i129HMM
 RVYmNIBBZ9n8Hv3BMj7gTpFPvv15tLB.FsVf7jik8wR9EbiVn1Ag4FGWJP0cP1G8yKHR_7hSfsMz
 OIa1zTcJ6dUNci5cl555kQwxM.BzzKNXOw3REMEz8vRZ_LUEQGrHVkcl5mnnigMU3sLfu5Rcalg2
 yWbVbXO7SDWyyMEEHqoEUY15d_4CGzsBgBItw2JI_EVF5FXu8FnBvuKJkRGxgr696n78EdZel_Ax
 GgSisINxBg.0JNfbEvqWCsWPBnfPwsCIlf45KaJk9jjB0DRlfHgXnphXHStqdgwdzKWcTMU.llz9
 vjofabNnra2WjRqBbU9pWT1pHiA540fw9Z4TtNzPg8tv_DAYVbPsavpcdb5VJoVoP0XJ2RnKoiKk
 Wc0W4fwamN8YAd5adKdqkc1OSQtiRWsQqgXFUUkxv755iLx.DnCxAuguYBNTKyjO61e5Gix60Vz6
 VVldmpvh03jAT3L4u67dkvuQzEdFn04XlXB8iyX093dVLACyc_htY0QBTG3Kl8mxxPHk6hdagZ94
 G5wtQ87TJjO8lw1KwWhHSwbmi7s3Rzl4qB5geDZyt2LEFymg93xK2u6yYQ2ts52Yu6FBB0Rx57ON
 limm8FRn1NjYq30.2ArWBvD4KBxHnKDIq9w35tdv5zB59zRVEoZiAGN8Rf5GCVaWiq5KVQN.SxuZ
 Jbe_IfU2gBT03FCU_ogLw.j1CDdHVPhCECcwTvIUMsKOv9QuUo48Q7HMAuQff1LxLPj_GO_oWcvi
 SvVHXgScEBTRYqgMjmbX6GzcgGiDkEgtmO5Y6XdDYi2JKfRJEPUrtmeWkxSkrpWHUzbVdptMGYrA
 Z4XfbxLVe1JXxaxuIe6.zbA--
X-Sonic-MF: <tomasz.unger@yahoo.pl>
X-Sonic-ID: 8a816a8c-c346-4f0c-a78e-f7655eb2850b
Received: from sonic.gate.mail.ne1.yahoo.com by sonic312.consmr.mail.ir2.yahoo.com with HTTP; Fri, 13 Mar 2026 16:32:24 +0000
Received: by hermes--production-ir2-bbcfb4457-g6b6v (Yahoo Inc. Hermes SMTP Server) with ESMTPA ID 36a5fe6291271b6b212833a13071f037;
          Fri, 13 Mar 2026 16:32:21 +0000 (UTC)
From: Tomasz Unger <tomasz.unger@yahoo.pl>
Date: Fri, 13 Mar 2026 17:32:18 +0100
Subject: [PATCH v2] staging: media: av7110: replace C++ comments with C
 style comments in sp8870.c
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260313-sp8870-cleanup-v2-1-ca679e62f9b7@yahoo.pl>
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/3XMQQ7CIBRF0a00fywGKGBx5D5MB4R+haQBAkpsG
 vYudu7wvuSdHQpmjwWuww4Zqy8+hh78NIB1JjyR+KU3cMoVHdlISpqmCyV2RRPeiVglJadaoLA
 a+illfPjPAd7n3s6XV8zb4Vf2W/9SlRFG+CKp0lYgWnnbjIvxnFaYW2tf1PBw7KsAAAA=
X-Change-ID: 20260313-sp8870-cleanup-c6552094e4c9
To: Mauro Carvalho Chehab <mchehab@kernel.org>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: linux-media@vger.kernel.org, linux-staging@lists.linux.dev, 
 linux-kernel@vger.kernel.org, Tomasz Unger <tomasz.unger@yahoo.pl>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1773419540; l=6348;
 i=tomasz.unger@yahoo.pl; s=20260311; h=from:subject:message-id;
 bh=rlewnPyT4dkele4c5ugodYCgNhsow7gtaU0JfPJxRrA=;
 b=ZvOR25kRdXhHfaIE+bPJV87NEXeZs1mp2DzF/t2reXI5UF/l9goPZPPJyDBtWl4xpllTF9p1e
 Ixc4/DAGQXICjtJbtI31OETbxt+nDOn5oRU7ebS83KIypvKaiF90McR
X-Developer-Key: i=tomasz.unger@yahoo.pl; a=ed25519;
 pk=EPPsO91uz/0J2cTQ6ol+dgxYaieEc9dKSXWUb51n46c=
References: <20260313-sp8870-cleanup-v2-1-ca679e62f9b7.ref@yahoo.pl>
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[yahoo.pl,reject];
	R_DKIM_ALLOW(-0.20)[yahoo.pl:s=s2048];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_CC(0.00)[vger.kernel.org,lists.linux.dev,yahoo.pl];
	TAGGED_FROM(0.00)[bounces-55748-lists,linux-media=lfdr.de];
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
	NEURAL_HAM(-0.00)[-0.999];
	TAGGED_RCPT(0.00)[linux-media];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[yahoo.pl:dkim,yahoo.pl:email,yahoo.pl:mid,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 11586287203
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Replace C++ style comments (//) with C style comments (/* */) in
sp8870.c to conform to the kernel coding style.

Signed-off-by: Tomasz Unger <tomasz.unger@yahoo.pl>
---
Changes in v2:
- Add changelog text to commit message as requested by Greg Kroah-Hartman
- Link to v1: https://lore.kernel.org/r/20260313-sp8870-cleanup-v1-1-2d5069c4eec5@yahoo.pl
---
 drivers/staging/media/av7110/sp8870.c | 52 +++++++++++++++++------------------
 1 file changed, 26 insertions(+), 26 deletions(-)

diff --git a/drivers/staging/media/av7110/sp8870.c b/drivers/staging/media/av7110/sp8870.c
index 29fb4934c039..47a1eb22ef49 100644
--- a/drivers/staging/media/av7110/sp8870.c
+++ b/drivers/staging/media/av7110/sp8870.c
@@ -109,21 +109,21 @@ static int sp8870_firmware_upload(struct sp8870_state *state, const struct firmw
 	if (fw->size < SP8870_FIRMWARE_SIZE + SP8870_FIRMWARE_OFFSET)
 		return -EINVAL;
 
-	// system controller stop
+	/* system controller stop */
 	sp8870_writereg(state, 0x0F00, 0x0000);
 
-	// instruction RAM register hiword
+	/* instruction RAM register hiword */
 	sp8870_writereg(state, 0x8F08, ((SP8870_FIRMWARE_SIZE / 2) & 0xFFFF));
 
-	// instruction RAM MWR
+	/* instruction RAM MWR */
 	sp8870_writereg(state, 0x8F0A, ((SP8870_FIRMWARE_SIZE / 2) >> 16));
 
-	// do firmware upload
+	/* do firmware upload */
 	fw_pos = SP8870_FIRMWARE_OFFSET;
 	while (fw_pos < SP8870_FIRMWARE_SIZE + SP8870_FIRMWARE_OFFSET) {
 		tx_len = (fw_pos <= SP8870_FIRMWARE_SIZE + SP8870_FIRMWARE_OFFSET - 252) ? 252 :
 			 SP8870_FIRMWARE_SIZE + SP8870_FIRMWARE_OFFSET - fw_pos;
-		// write register 0xCF0A
+		/* write register 0xCF0A */
 		tx_buf[0] = 0xCF;
 		tx_buf[1] = 0x0A;
 		memcpy(&tx_buf[2], fw_buf + fw_pos, tx_len);
@@ -149,7 +149,7 @@ static void sp8870_microcontroller_stop(struct sp8870_state *state)
 	sp8870_writereg(state, 0x0F08, 0x000);
 	sp8870_writereg(state, 0x0F09, 0x000);
 
-	// microcontroller STOP
+	/* microcontroller STOP */
 	sp8870_writereg(state, 0x0F00, 0x000);
 }
 
@@ -158,10 +158,10 @@ static void sp8870_microcontroller_start(struct sp8870_state *state)
 	sp8870_writereg(state, 0x0F08, 0x000);
 	sp8870_writereg(state, 0x0F09, 0x000);
 
-	// microcontroller START
+	/* microcontroller START */
 	sp8870_writereg(state, 0x0F00, 0x001);
-	// not documented but if we don't read 0x0D01 out here
-	// we don't get a correct data valid signal
+	/* not documented but if we don't read 0x0D01 out here */
+	/* we don't get a correct data valid signal */
 	sp8870_readreg(state, 0x0D01);
 }
 
@@ -243,7 +243,7 @@ static int configure_reg0xc05(struct dtv_frontend_properties *p, u16 *reg0xc05)
 
 static int sp8870_wake_up(struct sp8870_state *state)
 {
-	// enable TS output and interface pins
+	/* enable TS output and interface pins */
 	return sp8870_writereg(state, 0xC18, 0x00D);
 }
 
@@ -258,29 +258,29 @@ static int sp8870_set_frontend_parameters(struct dvb_frontend *fe)
 	if (err)
 		return err;
 
-	// system controller stop
+	/* system controller stop */
 	sp8870_microcontroller_stop(state);
 
-	// set tuner parameters
+	/* set tuner parameters */
 	if (fe->ops.tuner_ops.set_params) {
 		fe->ops.tuner_ops.set_params(fe);
 		if (fe->ops.i2c_gate_ctrl)
 			fe->ops.i2c_gate_ctrl(fe, 0);
 	}
 
-	// sample rate correction bit [23..17]
+	/* sample rate correction bit [23..17] */
 	sp8870_writereg(state, 0x0319, 0x000A);
 
-	// sample rate correction bit [16..0]
+	/* sample rate correction bit [16..0] */
 	sp8870_writereg(state, 0x031A, 0x0AAB);
 
-	// integer carrier offset
+	/* integer carrier offset */
 	sp8870_writereg(state, 0x0309, 0x0400);
 
-	// fractional carrier offset
+	/* fractional carrier offset */
 	sp8870_writereg(state, 0x030A, 0x0000);
 
-	// filter for 6/7/8 Mhz channel
+	/* filter for 6/7/8 Mhz channel */
 	if (p->bandwidth_hz == 6000000)
 		sp8870_writereg(state, 0x0311, 0x0002);
 	else if (p->bandwidth_hz == 7000000)
@@ -288,7 +288,7 @@ static int sp8870_set_frontend_parameters(struct dvb_frontend *fe)
 	else
 		sp8870_writereg(state, 0x0311, 0x0000);
 
-	// scan order: 2k first = 0x0000, 8k first = 0x0001
+	/* scan order: 2k first = 0x0000, 8k first = 0x0001 */
 	if (p->transmission_mode == TRANSMISSION_MODE_2K)
 		sp8870_writereg(state, 0x0338, 0x0000);
 	else
@@ -296,12 +296,12 @@ static int sp8870_set_frontend_parameters(struct dvb_frontend *fe)
 
 	sp8870_writereg(state, 0xc05, reg0xc05);
 
-	// read status reg in order to clear pending irqs
+	/* read status reg in order to clear pending irqs */
 	err = sp8870_readreg(state, 0x200);
 	if (err < 0)
 		return err;
 
-	// system controller start
+	/* system controller start */
 	sp8870_microcontroller_start(state);
 
 	return 0;
@@ -337,16 +337,16 @@ static int sp8870_init(struct dvb_frontend *fe)
 	/* enable TS output and interface pins */
 	sp8870_writereg(state, 0xc18, 0x00d);
 
-	// system controller stop
+	/* system controller stop */
 	sp8870_microcontroller_stop(state);
 
-	// ADC mode
+	/* ADC mode */
 	sp8870_writereg(state, 0x0301, 0x0003);
 
-	// Reed Solomon parity bytes passed to output
+	/* Reed Solomon parity bytes passed to output */
 	sp8870_writereg(state, 0x0C13, 0x0001);
 
-	// MPEG clock is suppressed if no valid data
+	/* MPEG clock is suppressed if no valid data */
 	sp8870_writereg(state, 0x0C14, 0x0001);
 
 	/* bit 0x010: enable data valid signal */
@@ -490,7 +490,7 @@ static int sp8870_set_frontend(struct dvb_frontend *fe)
 			return err;
 
 		for (check_count = 0; check_count < MAXCHECKS; check_count++) {
-//			valid = ((sp8870_readreg(i2c, 0x0200) & 4) == 0);
+			/* valid = ((sp8870_readreg(i2c, 0x0200) & 4) == 0); */
 			valid = sp8870_read_data_valid_signal(state);
 			if (valid) {
 				dprintk("delay = %i usec\n", check_count * 10);
@@ -526,7 +526,7 @@ static int sp8870_sleep(struct dvb_frontend *fe)
 {
 	struct sp8870_state *state = fe->demodulator_priv;
 
-	// tristate TS output and disable interface pins
+	/* tristate TS output and disable interface pins */
 	return sp8870_writereg(state, 0xC18, 0x000);
 }
 

---
base-commit: 0257f64bdac7fdca30fa3cae0df8b9ecbec7733a
change-id: 20260313-sp8870-cleanup-c6552094e4c9

Best regards,
-- 
Tomasz Unger <tomasz.unger@yahoo.pl>


