Return-Path: <linux-media+bounces-55972-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id CDGoGUlsuGn5dgEAu9opvQ
	(envelope-from <linux-media+bounces-55972-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Mon, 16 Mar 2026 21:47:05 +0100
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id BA3D42A05A3
	for <lists+linux-media@lfdr.de>; Mon, 16 Mar 2026 21:47:04 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 56B663086A7E
	for <lists+linux-media@lfdr.de>; Mon, 16 Mar 2026 20:46:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 82132355F42;
	Mon, 16 Mar 2026 20:46:13 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from mail.auroraos.dev (unknown [95.181.193.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DEA66356A23
	for <linux-media@vger.kernel.org>; Mon, 16 Mar 2026 20:46:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=95.181.193.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773693973; cv=none; b=s3oD45skM77DW79zNsWyNZHJ65Qyy2fYCyjjk+0n+3+jSVTO5BXLEcZIKzY2fr+L18fxaFx5NsXcKpPUQIWUOr3QDO1L94zIoOjIXeYKLfaMo58FoGLX+v3W0NPNJeTViX1hh2dhepAsrwdXKUfTmlVUVB/CCjBEHAqxOnWZHo8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773693973; c=relaxed/simple;
	bh=cJKwILeW1mILQEcDMzwxFJSEYFjLcN0iZhpUJ7bTfBY=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type; b=VHiQ90g6S73T6vj298M37v1B7J+ArlgQsIklUJd3WnZ04dQ/tuWmSVN+AMmviIRsR3UmIdSUBBpY+JbknzEFsrsCddKQrq3FJw97EuscxsduMaR298uDiSKwuE6/nO4olvIGkRUMu/BFJje9u2fuw+n6J0OXdjwTeW8Z7Vde/D8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=auroraos.dev; spf=pass smtp.mailfrom=auroraos.dev; arc=none smtp.client-ip=95.181.193.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=auroraos.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=auroraos.dev
Received: from wasted (213.87.160.51) by exch16.corp.auroraos.dev
 (10.189.209.38) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.1847.3; Mon, 16 Mar
 2026 23:45:56 +0300
From: Sergey Shtylyov <s.shtylyov@auroraos.dev>
To: Mauro Carvalho Chehab <mchehab@kernel.org>, <linux-media@vger.kernel.org>
CC: Sergey Shtylyov <s.shtylyov@auroraos.dev>, Michael Ira Krufky
	<mkrufky@linuxtv.org>, Fred Richter <frichter@hauppauge.com>, Brad Love
	<brad@nextdimension.cc>
Subject: [PATCH] media: lgdt3306a: check the register reads for errors
Date: Mon, 16 Mar 2026 23:44:54 +0300
Message-ID: <20260316204455.63426-1-s.shtylyov@auroraos.dev>
X-Mailer: git-send-email 2.53.0
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: exch16.corp.auroraos.dev (10.189.209.38) To
 exch16.corp.auroraos.dev (10.189.209.38)
X-Spamd-Result: default: False [0.14 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	R_MISSING_CHARSET(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	DMARC_POLICY_SOFTFAIL(0.10)[auroraos.dev : SPF not aligned (relaxed), No valid DKIM,quarantine,sampled_out];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_COUNT_THREE(0.00)[4];
	PRECEDENCE_BULK(0.00)[];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	TAGGED_FROM(0.00)[bounces-55972-lists,linux-media=lfdr.de];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[s.shtylyov@auroraos.dev,linux-media@vger.kernel.org];
	R_DKIM_NA(0.00)[];
	NEURAL_HAM(-0.00)[-0.961];
	FROM_HAS_DN(0.00)[];
	TAGGED_RCPT(0.00)[linux-media];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	RCPT_COUNT_FIVE(0.00)[6];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,linuxtv.org:url,linuxtesting.org:url]
X-Rspamd-Queue-Id: BA3D42A05A3
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

When lgdt3306a_read_reg() fails its parameter val will probably point to
a garbage value which we don't really want to write back (modified) with
lgdt3306a_write_reg(). Add lgdt3306a_read_reg() result checks where they
were missing.

Found by Linux Verification Center (linuxtesting.org) with the Svace static
analysis tool.

Fixes: b63b36fa44d0 ("[media] DVB: add support for LG Electronics LGDT3306A ATSC/QAM-B Demodulator")
Fixes: 4c7c3f9b1a85 ("media: lgdt3306a: QAM streaming improvement")
Signed-off-by: Sergey Shtylyov <s.shtylyov@auroraos.dev>

---
The patch is against the fixes branch of the linuxtv.org/media.git repo...

 drivers/media/dvb-frontends/lgdt3306a.c | 56 +++++++++++++++++++++++++
 1 file changed, 56 insertions(+)

diff --git a/drivers/media/dvb-frontends/lgdt3306a.c b/drivers/media/dvb-frontends/lgdt3306a.c
index b6a66e122ed5..03e598d73d9f 100644
--- a/drivers/media/dvb-frontends/lgdt3306a.c
+++ b/drivers/media/dvb-frontends/lgdt3306a.c
@@ -387,6 +387,8 @@ static int lgdt3306a_set_vsb(struct lgdt3306a_state *state)
 
 	/* 0. Spectrum inversion detection manual; spectrum inverted */
 	ret = lgdt3306a_read_reg(state, 0x0002, &val);
+	if (lg_chkerr(ret))
+		goto fail;
 	val &= 0xf7; /* SPECINVAUTO Off */
 	val |= 0x04; /* SPECINV On */
 	ret = lgdt3306a_write_reg(state, 0x0002, val);
@@ -400,6 +402,8 @@ static int lgdt3306a_set_vsb(struct lgdt3306a_state *state)
 
 	/* 2. Bandwidth mode for VSB(6MHz) */
 	ret = lgdt3306a_read_reg(state, 0x0009, &val);
+	if (lg_chkerr(ret))
+		goto fail;
 	val &= 0xe3;
 	val |= 0x0c; /* STDOPDETTMODE[2:0]=3 */
 	ret = lgdt3306a_write_reg(state, 0x0009, val);
@@ -408,6 +412,8 @@ static int lgdt3306a_set_vsb(struct lgdt3306a_state *state)
 
 	/* 3. QAM mode detection mode(None) */
 	ret = lgdt3306a_read_reg(state, 0x0009, &val);
+	if (lg_chkerr(ret))
+		goto fail;
 	val &= 0xfc; /* STDOPDETCMODE[1:0]=0 */
 	ret = lgdt3306a_write_reg(state, 0x0009, val);
 	if (lg_chkerr(ret))
@@ -415,6 +421,8 @@ static int lgdt3306a_set_vsb(struct lgdt3306a_state *state)
 
 	/* 4. ADC sampling frequency rate(2x sampling) */
 	ret = lgdt3306a_read_reg(state, 0x000d, &val);
+	if (lg_chkerr(ret))
+		goto fail;
 	val &= 0xbf; /* SAMPLING4XFEN=0 */
 	ret = lgdt3306a_write_reg(state, 0x000d, val);
 	if (lg_chkerr(ret))
@@ -477,6 +485,8 @@ static int lgdt3306a_set_vsb(struct lgdt3306a_state *state)
 #endif
 
 	ret = lgdt3306a_read_reg(state, 0x001e, &val);
+	if (lg_chkerr(ret))
+		goto fail;
 	val &= 0x0f;
 	val |= 0xa0;
 	ret = lgdt3306a_write_reg(state, 0x001e, val);
@@ -486,45 +496,63 @@ static int lgdt3306a_set_vsb(struct lgdt3306a_state *state)
 	ret = lgdt3306a_write_reg(state, 0x0023, 0xFF);
 
 	ret = lgdt3306a_read_reg(state, 0x211f, &val);
+	if (lg_chkerr(ret))
+		goto fail;
 	val &= 0xef;
 	ret = lgdt3306a_write_reg(state, 0x211f, val);
 
 	ret = lgdt3306a_write_reg(state, 0x2173, 0x01);
 
 	ret = lgdt3306a_read_reg(state, 0x1061, &val);
+	if (lg_chkerr(ret))
+		goto fail;
 	val &= 0xf8;
 	val |= 0x04;
 	ret = lgdt3306a_write_reg(state, 0x1061, val);
 
 	ret = lgdt3306a_read_reg(state, 0x103d, &val);
+	if (lg_chkerr(ret))
+		goto fail;
 	val &= 0xcf;
 	ret = lgdt3306a_write_reg(state, 0x103d, val);
 
 	ret = lgdt3306a_write_reg(state, 0x2122, 0x40);
 
 	ret = lgdt3306a_read_reg(state, 0x2141, &val);
+	if (lg_chkerr(ret))
+		goto fail;
 	val &= 0x3f;
 	ret = lgdt3306a_write_reg(state, 0x2141, val);
 
 	ret = lgdt3306a_read_reg(state, 0x2135, &val);
+	if (lg_chkerr(ret))
+		goto fail;
 	val &= 0x0f;
 	val |= 0x70;
 	ret = lgdt3306a_write_reg(state, 0x2135, val);
 
 	ret = lgdt3306a_read_reg(state, 0x0003, &val);
+	if (lg_chkerr(ret))
+		goto fail;
 	val &= 0xf7;
 	ret = lgdt3306a_write_reg(state, 0x0003, val);
 
 	ret = lgdt3306a_read_reg(state, 0x001c, &val);
+	if (lg_chkerr(ret))
+		goto fail;
 	val &= 0x7f;
 	ret = lgdt3306a_write_reg(state, 0x001c, val);
 
 	/* 6. EQ step size */
 	ret = lgdt3306a_read_reg(state, 0x2179, &val);
+	if (lg_chkerr(ret))
+		goto fail;
 	val &= 0xf8;
 	ret = lgdt3306a_write_reg(state, 0x2179, val);
 
 	ret = lgdt3306a_read_reg(state, 0x217a, &val);
+	if (lg_chkerr(ret))
+		goto fail;
 	val &= 0xf8;
 	ret = lgdt3306a_write_reg(state, 0x217a, val);
 
@@ -552,6 +580,8 @@ static int lgdt3306a_set_qam(struct lgdt3306a_state *state, int modulation)
 
 	/* 1a. Spectrum inversion detection to Auto */
 	ret = lgdt3306a_read_reg(state, 0x0002, &val);
+	if (lg_chkerr(ret))
+		goto fail;
 	val &= 0xfb; /* SPECINV Off */
 	val |= 0x08; /* SPECINVAUTO On */
 	ret = lgdt3306a_write_reg(state, 0x0002, val);
@@ -560,6 +590,8 @@ static int lgdt3306a_set_qam(struct lgdt3306a_state *state, int modulation)
 
 	/* 2. Bandwidth mode for QAM */
 	ret = lgdt3306a_read_reg(state, 0x0009, &val);
+	if (lg_chkerr(ret))
+		goto fail;
 	val &= 0xe3; /* STDOPDETTMODE[2:0]=0 VSB Off */
 	ret = lgdt3306a_write_reg(state, 0x0009, val);
 	if (lg_chkerr(ret))
@@ -567,6 +599,8 @@ static int lgdt3306a_set_qam(struct lgdt3306a_state *state, int modulation)
 
 	/* 3. : 64QAM/256QAM detection(manual, auto) */
 	ret = lgdt3306a_read_reg(state, 0x0009, &val);
+	if (lg_chkerr(ret))
+		goto fail;
 	val &= 0xfc;
 	/* Check for forced Manual modulation modes; otherwise always "auto" */
 	if(forced_manual && (modulation != QAM_AUTO)){
@@ -580,6 +614,8 @@ static int lgdt3306a_set_qam(struct lgdt3306a_state *state, int modulation)
 
 	/* 3a. : 64QAM/256QAM selection for manual */
 	ret = lgdt3306a_read_reg(state, 0x101a, &val);
+	if (lg_chkerr(ret))
+		goto fail;
 	val &= 0xf8;
 	if (modulation == QAM_64)
 		val |= 0x02; /* QMDQMODE[2:0]=2=QAM64 */
@@ -592,6 +628,8 @@ static int lgdt3306a_set_qam(struct lgdt3306a_state *state, int modulation)
 
 	/* 4. ADC sampling frequency rate(4x sampling) */
 	ret = lgdt3306a_read_reg(state, 0x000d, &val);
+	if (lg_chkerr(ret))
+		goto fail;
 	val &= 0xbf;
 	val |= 0x40; /* SAMPLING4XFEN=1 */
 	ret = lgdt3306a_write_reg(state, 0x000d, val);
@@ -600,6 +638,8 @@ static int lgdt3306a_set_qam(struct lgdt3306a_state *state, int modulation)
 
 	/* 5. No AICC operation in QAM mode */
 	ret = lgdt3306a_read_reg(state, 0x0024, &val);
+	if (lg_chkerr(ret))
+		goto fail;
 	val &= 0x00;
 	ret = lgdt3306a_write_reg(state, 0x0024, val);
 	if (lg_chkerr(ret))
@@ -607,6 +647,8 @@ static int lgdt3306a_set_qam(struct lgdt3306a_state *state, int modulation)
 
 	/* 5.1 V0.36 SRDCHKALWAYS : For better QAM detection */
 	ret = lgdt3306a_read_reg(state, 0x000a, &val);
+	if (lg_chkerr(ret))
+		goto fail;
 	val &= 0xfd;
 	val |= 0x02;
 	ret = lgdt3306a_write_reg(state, 0x000a, val);
@@ -615,6 +657,8 @@ static int lgdt3306a_set_qam(struct lgdt3306a_state *state, int modulation)
 
 	/* 5.2 V0.36 Control of "no signal" detector function */
 	ret = lgdt3306a_read_reg(state, 0x2849, &val);
+	if (lg_chkerr(ret))
+		goto fail;
 	val &= 0xdf;
 	ret = lgdt3306a_write_reg(state, 0x2849, val);
 	if (lg_chkerr(ret))
@@ -622,6 +666,8 @@ static int lgdt3306a_set_qam(struct lgdt3306a_state *state, int modulation)
 
 	/* 5.3 Fix for Blonder Tongue HDE-2H-QAM and AQM modulators */
 	ret = lgdt3306a_read_reg(state, 0x302b, &val);
+	if (lg_chkerr(ret))
+		goto fail;
 	val &= 0x7f;  /* SELFSYNCFINDEN_CQS=0; disable auto reset */
 	ret = lgdt3306a_write_reg(state, 0x302b, val);
 	if (lg_chkerr(ret))
@@ -926,29 +972,39 @@ static int lgdt3306a_init(struct dvb_frontend *fe)
 
 	/* 10a. VSB TR BW gear shift initial step */
 	ret = lgdt3306a_read_reg(state, 0x103c, &val);
+	if (lg_chkerr(ret))
+		goto fail;
 	val &= 0x0f;
 	val |= 0x20; /* SAMGSAUTOSTL_V[3:0] = 2 */
 	ret = lgdt3306a_write_reg(state, 0x103c, val);
 
 	/* 10b. Timing offset calibration in low temperature for VSB */
 	ret = lgdt3306a_read_reg(state, 0x103d, &val);
+	if (lg_chkerr(ret))
+		goto fail;
 	val &= 0xfc;
 	val |= 0x03;
 	ret = lgdt3306a_write_reg(state, 0x103d, val);
 
 	/* 10c. Timing offset calibration in low temperature for QAM */
 	ret = lgdt3306a_read_reg(state, 0x1036, &val);
+	if (lg_chkerr(ret))
+		goto fail;
 	val &= 0xf0;
 	val |= 0x0c;
 	ret = lgdt3306a_write_reg(state, 0x1036, val);
 
 	/* 11. Using the imaginary part of CIR in CIR loading */
 	ret = lgdt3306a_read_reg(state, 0x211f, &val);
+	if (lg_chkerr(ret))
+		goto fail;
 	val &= 0xef; /* do not use imaginary of CIR */
 	ret = lgdt3306a_write_reg(state, 0x211f, val);
 
 	/* 12. Control of no signal detector function */
 	ret = lgdt3306a_read_reg(state, 0x2849, &val);
+	if (lg_chkerr(ret))
+		goto fail;
 	val &= 0xef; /* NOUSENOSIGDET=0, enable no signal detector */
 	ret = lgdt3306a_write_reg(state, 0x2849, val);
 
-- 
2.53.0


