Return-Path: <linux-media+bounces-55797-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id aB1ONsAStWmywAAAu9opvQ
	(envelope-from <linux-media+bounces-55797-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Sat, 14 Mar 2026 08:48:16 +0100
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 166CF28BF7B
	for <lists+linux-media@lfdr.de>; Sat, 14 Mar 2026 08:48:16 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id D77E03055C9D
	for <lists+linux-media@lfdr.de>; Sat, 14 Mar 2026 07:47:54 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 94C6431355D;
	Sat, 14 Mar 2026 07:47:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=yahoo.pl header.i=@yahoo.pl header.b="pE4mLwjc"
X-Original-To: linux-media@vger.kernel.org
Received: from sonic307-53.consmr.mail.ir2.yahoo.com (sonic307-53.consmr.mail.ir2.yahoo.com [87.248.110.30])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 68CED194AD7
	for <linux-media@vger.kernel.org>; Sat, 14 Mar 2026 07:47:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=87.248.110.30
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773474472; cv=none; b=D5lnL69aSr61gN1QpK7vdm2VedWYq+2IXF0Qxl3I/PrS8R1dWky/POAhfqStSxqj/PzXZDNX0Bc3q9QoOoSB7MwNLZ0QFeIpB9shKSiodSWg5tKxY4dOdHpB/BKoghmUJJZmkWtbO/4FnuWauKEzIhwn+Ce/o7hrYnAeXiurWBc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773474472; c=relaxed/simple;
	bh=92AZcvInMLnvhxsVWSgtP2F6g+p6IVnUmpsG1yF299Y=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc:
	 References; b=F5s1ljMSl608DdaAg9hIZUloqXOYekWJxKY012jXBpa4I1ZDlZg9Q7e7bL6wK6Sf3Oung/CurUqpQgHTPqSONOMI5ywIvgKSjWA3oXBWz7SsLv6KVKpwK570rxhbiFvNmytSjOFiEIx+BdCyJdQmc7jIGLknEQsgxgVLaO1jw1M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=yahoo.pl; spf=pass smtp.mailfrom=yahoo.pl; dkim=pass (2048-bit key) header.d=yahoo.pl header.i=@yahoo.pl header.b=pE4mLwjc; arc=none smtp.client-ip=87.248.110.30
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=yahoo.pl
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=yahoo.pl
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yahoo.pl; s=s2048; t=1773474462; bh=aE0jv2DpQjsZ10UhKl4jN3owfYgD6xrpIsxm3YBClMM=; h=From:Date:Subject:To:Cc:References:From:Subject:Reply-To; b=pE4mLwjc/ZeG5FWS0Q3myPi7xZP8DdyThBIya1BqXKGZETzFjX9hzaXsSblndRobZrQF8RcLIXgWkucRB5wEYBP9qONpLf7wJ5R9faAiTibUUCk/7YvX/aW//fJDXuG/RO1f5Kk71tjBCt/GeWdVAZUnLS1rLV0TOWl8bOGKnNyMUgL/r1N5s3bqu6nXfDHMRA41FC4NTW3pXdIcShfrOSDEJc0x7++vlgK6SL7zeWVENhcT5VlC6hdpHAVTMIq3pwo5vIpNZS1YCQWOIreN/2DJodKgSueraU7whPsDbhjXiPREYyCkuOL8bymCN001eWQYdqssyMxutZXCh4MqEQ==
X-SONIC-DKIM-SIGN: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yahoo.com; s=s2048; t=1773474462; bh=63+vH/39wX6+iIsxvehkry/oipX58GuvfNL4gdzqa+H=; h=X-Sonic-MF:From:Date:Subject:To:From:Subject; b=gZFUXIJ9gBbTmGrQH6QocJ3J4gK715RLPTiALROcFcvJP8M1NjMYYnobKAEuOoBwEcHEI70zRSYJw+1TGPoiL+lVxvzjiPvMRueBoB8lEI22neHS72aDIRSel9HxAjd75ojKLiGUM0MC1Ihd5P0nqC/11W1WgdleDjb+tzFJEfSrppb2VF0kB1HEYLFHyAoeeTHg1dEbQ1hfpsFKtlJNNMZnBMwQe4EfJTUd9RRlhinkqh1nKIsoXTMm+rf08k36GBiMPJU+GGNQBcqSmqCjSN83sLTGKnN3N+i2IVsCetaH2LRo+66kOhFkcMDWY83FT/aYqf0EPqjt0VUoQhsPKA==
X-YMail-OSG: VHtRQzAVM1kxa5idj79PS0Xzc9PfFgoyYqIXGZJWRqs8D778pSGcyUkLqjoEmY3
 n1dckYUppT11zDKheHbv4JOBg2XWmt2q3iPxlyaqu.ktBFQ2PRPYEAurVq.5ORQrO9GgAgysS1Sw
 3X8CiUbLnV0JnES9eHTthHvDf8Aspp46snTykwJMGMorF7RfGb924l6hF_NqAKKjJ26dDyzWffci
 3J5QUr2ZbIHR2vUHaMMM_IrUUOJxs.uJDEO1w1UFO1rkBs9q2SU4aFYLWdmgDTd1LlZwI5cSG5st
 z3XjU8DUkGYM78RTsTH_D.YeVhfVbX.FjBoZEQkA.1UAhSQzqzklBU56q5cS8NupcXRv4sJ9e2Vs
 XCzsDUQw2LZFe1BOwrPIbJdJkAYX3ZYyvmfmTLFmWT_FSfLRIJpfBPqaeAS0X2HWFvGOI57GdyGB
 qL2WCK5UbyWSv79n9mjoQobivow0Cj2esOKnrSpr5Qok2ZTE74mL1svBLh.WR.DtmX2DO13zMtvm
 849x8VRgVlrx3EM0ItKyz.KyDVPu96mOSQHP2cbx7B.se0n2OKXFwUmwN7a7H3pjfOgg5yGV_Jp9
 OHr9asMjj9Nl79Lcey2IwWIKTHld.mrrITbPyHe9xxDaBAVo7oe6lC9iBXPGuwehsVflRqYnAOoJ
 pnttCaFVZi0rcTQXkKfnNnTc1ypjuFBWZs3XNZaeB2obVsCKP.tVsPl_kvHbNoQ_YFf3JSjjdGKc
 xO8vHfTEsDnN.5n5R.mg41S6HCDoRbZWg3YMr8aT2F_eSup1tE1i0kkGxsbIQEogZpMJO1Gk.ZCx
 dvmgLnXVDle._QpZtD4c2UYmjxdLBkwcfcFropva9JtoLNkL.CT8ly3syOqChSGaycsiAXLsP0N7
 J6IImuusMUgXpJssOP.sSIXg0pOM6eq6rsnPKW.zzzu_yFGbu13EJxguA6Nqw.THbwEFBDHxY9ms
 yGqV.5fA52TCNtnO.Lf7qcZ4yfDz_VkPi_lNEmQravBZXJBRaQedMR3JC5erMx6tLsz0cfCUwnIg
 7hdjfv4nCAMxP3Ok9QwOTktiVyuQSWGjQKYYJ_kQaAtOaohGvkvIQSXFmlDh8gUR0HelhTi9O17p
 UMnpXpnZ4JgeGQw2E1stLvjo9VrkrNQtXhusdnAf8dwwPcFYmt6jnNbDgUfJVxcpwT5SBGkq.dtM
 Fn_1F8UKfYe7_fGCaLaU2cZsgcWQA7J9kLXfZHvSaOKWs3mOK3ie4H9nkDDwoVbq15534omhkfhX
 S8b7Q1umPBF1eveDN68PBZuK.mpxhyPuXEq8JA0I4_X34U673Pgr4bGYDiRAMR7VQvmB3YnT0fsB
 4iHGiY9p2uh6PGCiI5m3vevTLV59wnvxEt0pXC5J4BMa.iQGTAI1LLYAO1TvJtL25opjISfvWPTs
 DDv0ukvF6jSHrRG9BPMFV0vP3xC.EU2lPvS91Mi4p07eguUIR7CZiErFP1MYU0M03DzXAysISIpk
 IiTyXJBDQFC.uwIVVkLM3zrs6lD8VKKiODWPGHlxq1Kzo44SW98T70rNxrzmJafeZdED8i.0HDzi
 nYCWeMSGW2zOkc8xcpUuBVZfLlgsgzoQ10xXT53_k5GIDuXpOae2xIH7ZUnRQdVY5VJ8zxyVaw_b
 Q7Q34qJV5CVA7e5S.xpa39LqQzy7OWs6KFyjTt6zngSKZSnVlUQEVuqlQa3rqHA1BgmxZ0q5TvhV
 ql2r01v8MNxETBlSMeHHye.D_.IiDzSsHujNqqlhJgxL8r_oEt3rTqDCsE_rST8C_vYzswoS5y4Z
 WuDDr_7DH9SiDnpSTdzdHblyAmAgRKNI6WWBDT.O_TBGkHoPGEJypV603N6DpbXMQpNGLz_mBTza
 reX88LBvjNPxuRdQ8kzSSpwH9Js5hfeyovG5QJb_hn.vlCH5ifRaPwWAjQ6JLlyR79WIAMBRZzlQ
 rMwiF6uvRmDc6Vu3gfzUYfWI74sx_4QN4EYWO1Um3uc4Zt08wpd.QTBLIFIb1869kqYrTyJhTKGR
 qDHrH92CkWet_HbYhbz2ayfiflfA.qDybeiULDZsVGrafE0RwwBjE2PZCT9wFiWa8foRDCB9gVbl
 TuwGuJ3IHUhgaMwKIFx4CkHJKsKWlhRBGNp9WPSn2Z859P_wbJ8Q9qd0JDHONTVdqmjVmUsxjARw
 52yfbunnnkOujA8.BaEKGwOqIom_y6RrCy0CRoVuwY0bst55tOz9jCmM67dleNkFiqYf.C8C55wr
 R1JGwUhPZ2IgVOPRQI336mnh92Hg6K2A4z1CPs2jNv4EA3gwChS7S9iu84Mr9e7AzBKtzY_BRFK4
 6KpPOhilHERTK_ygOjjU-
X-Sonic-MF: <tomasz.unger@yahoo.pl>
X-Sonic-ID: 3fd50398-37f3-4ba0-bd21-bb0294b0c6d0
Received: from sonic.gate.mail.ne1.yahoo.com by sonic307.consmr.mail.ir2.yahoo.com with HTTP; Sat, 14 Mar 2026 07:47:42 +0000
Received: by hermes--production-ir2-bbcfb4457-29p8w (Yahoo Inc. Hermes SMTP Server) with ESMTPA ID 2cd5b95d816148b0a24191e98e72160f;
          Sat, 14 Mar 2026 07:47:37 +0000 (UTC)
From: Tomasz Unger <tomasz.unger@yahoo.pl>
Date: Sat, 14 Mar 2026 08:47:35 +0100
Subject: [PATCH v3] staging: media: av7110: replace C++ comments with C
 style comments in sp8870.c
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260314-sp8870-cleanup-v3-1-3ec367f13aa9@yahoo.pl>
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/32MQQ7CIBAAv9LsWQzQQsWT/zAecLu1JE0hoMSm6
 d+lPXnR40wys0Ci6CjBuVogUnbJ+alAfagABzs9iLmuMEguNa9FzVI4nVrOcCQ7vQJDrZTkpqE
 GDZQoROrdex9eb4UHl54+zvs/i83+XGXBBJOd4tpgQ4TqMtvB+2MYYTtl+b+WpUarW0Na9ubef
 tXrun4A6J/P8ekAAAA=
X-Change-ID: 20260313-sp8870-cleanup-c6552094e4c9
To: Mauro Carvalho Chehab <mchehab@kernel.org>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: linux-media@vger.kernel.org, linux-staging@lists.linux.dev, 
 linux-kernel@vger.kernel.org, Tomasz Unger <tomasz.unger@yahoo.pl>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1773474456; l=6567;
 i=tomasz.unger@yahoo.pl; s=20260311; h=from:subject:message-id;
 bh=92AZcvInMLnvhxsVWSgtP2F6g+p6IVnUmpsG1yF299Y=;
 b=/W55jvuL5q1QzN/C3auirCJxkWRLwfTrpyhjp4U8Ilv1H3YlSSuuCPiRGXPbL3bOFYtDWpW9+
 sslVK1Wxu2/DjOu0vpSSMy7P0N4ipSwspGF+RX2z1yUHQwPsp+JwrqF
X-Developer-Key: i=tomasz.unger@yahoo.pl; a=ed25519;
 pk=EPPsO91uz/0J2cTQ6ol+dgxYaieEc9dKSXWUb51n46c=
References: <20260314-sp8870-cleanup-v3-1-3ec367f13aa9.ref@yahoo.pl>
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[yahoo.pl,reject];
	R_DKIM_ALLOW(-0.20)[yahoo.pl:s=s2048];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_CC(0.00)[vger.kernel.org,lists.linux.dev,yahoo.pl];
	TAGGED_FROM(0.00)[bounces-55797-lists,linux-media=lfdr.de];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_FROM(0.00)[yahoo.pl];
	TO_DN_SOME(0.00)[];
	DKIM_TRACE(0.00)[yahoo.pl:+];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	RCPT_COUNT_FIVE(0.00)[6];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[tomasz.unger@yahoo.pl,linux-media@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-0.999];
	TAGGED_RCPT(0.00)[linux-media];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,yahoo.pl:dkim,yahoo.pl:email,yahoo.pl:mid]
X-Rspamd-Queue-Id: 166CF28BF7B
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Replace C++ style comments (//) with C style comments (/* */) in
sp8870.c to conform to the kernel coding style.

Signed-off-by: Tomasz Unger <tomasz.unger@yahoo.pl>
---
Changes in v3:
- Convert two consecutive single-line comments to a multi-line comment as suggested by Ethan Tidmore
- Link to v2: https://lore.kernel.org/r/20260313-sp8870-cleanup-v2-1-ca679e62f9b7@yahoo.pl

Changes in v2:
- Add changelog text to commit message as requested by Greg Kroah-Hartman
- Link to v1: https://lore.kernel.org/r/20260313-sp8870-cleanup-v1-1-2d5069c4eec5@yahoo.pl
---
 drivers/staging/media/av7110/sp8870.c | 54 ++++++++++++++++++-----------------
 1 file changed, 28 insertions(+), 26 deletions(-)

diff --git a/drivers/staging/media/av7110/sp8870.c b/drivers/staging/media/av7110/sp8870.c
index 29fb4934c039..73500f8702d3 100644
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
 
@@ -158,10 +158,12 @@ static void sp8870_microcontroller_start(struct sp8870_state *state)
 	sp8870_writereg(state, 0x0F08, 0x000);
 	sp8870_writereg(state, 0x0F09, 0x000);
 
-	// microcontroller START
+	/* microcontroller START */
 	sp8870_writereg(state, 0x0F00, 0x001);
-	// not documented but if we don't read 0x0D01 out here
-	// we don't get a correct data valid signal
+	/*
+	 * not documented but if we don't read 0x0D01 out here
+	 * we don't get a correct data valid signal
+	 */
 	sp8870_readreg(state, 0x0D01);
 }
 
@@ -243,7 +245,7 @@ static int configure_reg0xc05(struct dtv_frontend_properties *p, u16 *reg0xc05)
 
 static int sp8870_wake_up(struct sp8870_state *state)
 {
-	// enable TS output and interface pins
+	/* enable TS output and interface pins */
 	return sp8870_writereg(state, 0xC18, 0x00D);
 }
 
@@ -258,29 +260,29 @@ static int sp8870_set_frontend_parameters(struct dvb_frontend *fe)
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
@@ -288,7 +290,7 @@ static int sp8870_set_frontend_parameters(struct dvb_frontend *fe)
 	else
 		sp8870_writereg(state, 0x0311, 0x0000);
 
-	// scan order: 2k first = 0x0000, 8k first = 0x0001
+	/* scan order: 2k first = 0x0000, 8k first = 0x0001 */
 	if (p->transmission_mode == TRANSMISSION_MODE_2K)
 		sp8870_writereg(state, 0x0338, 0x0000);
 	else
@@ -296,12 +298,12 @@ static int sp8870_set_frontend_parameters(struct dvb_frontend *fe)
 
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
@@ -337,16 +339,16 @@ static int sp8870_init(struct dvb_frontend *fe)
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
@@ -490,7 +492,7 @@ static int sp8870_set_frontend(struct dvb_frontend *fe)
 			return err;
 
 		for (check_count = 0; check_count < MAXCHECKS; check_count++) {
-//			valid = ((sp8870_readreg(i2c, 0x0200) & 4) == 0);
+			/* valid = ((sp8870_readreg(i2c, 0x0200) & 4) == 0); */
 			valid = sp8870_read_data_valid_signal(state);
 			if (valid) {
 				dprintk("delay = %i usec\n", check_count * 10);
@@ -526,7 +528,7 @@ static int sp8870_sleep(struct dvb_frontend *fe)
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


