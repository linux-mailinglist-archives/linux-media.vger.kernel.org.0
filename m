Return-Path: <linux-media+bounces-66166-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id TWpJBB7QRGod1QoAu9opvQ
	(envelope-from <linux-media+bounces-66166-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Wed, 01 Jul 2026 10:30:22 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 4E12B6EB1AC
	for <lists+linux-media@lfdr.de>; Wed, 01 Jul 2026 10:30:21 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=gmail.com header.s=20251104 header.b=KhLbo8qX;
	spf=pass (mail.lfdr.de: domain of "linux-media+bounces-66166-lists+linux-media=lfdr.de@vger.kernel.org" designates 172.234.253.10 as permitted sender) smtp.mailfrom="linux-media+bounces-66166-lists+linux-media=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=none) header.from=gmail.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id E40EB3015478
	for <lists+linux-media@lfdr.de>; Wed,  1 Jul 2026 08:28:10 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3D5863C81B5;
	Wed,  1 Jul 2026 08:28:10 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from mail-pg1-f176.google.com (mail-pg1-f176.google.com [209.85.215.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 883833009F6
	for <linux-media@vger.kernel.org>; Wed,  1 Jul 2026 08:28:08 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782894489; cv=none; b=D/6/rZ5OSs3W+QTtg4iE7EvclaM9caSde7bDSoZm9Y7TogIg++3coE/VAfZHc38dyI0OrUKKd+ryj9hHZSePNTGumjkkFu85sH4vxZT6lY65zEcjOkrxs+yOEBkdPC+RqxMXIVYIbxZ/Jxd1oogSQZdj013XyH3UawtI9BAaNPg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782894489; c=relaxed/simple;
	bh=m+sTkuPmUG+TP6asPhvScokp8Gu1v7O8erYhXoNOoMQ=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=SA8ci9u7uWGzWhfOPWXj4Wc/6AGF8FVu8WsN6Mp8CMHsYt/8V7RpjSpIzAfgPUf7LRPCPLBPWblRb02EVOaufdzggJjoiIstAY4wg4mDDLw4euFUPDq9CxiSoLRVWLUbtq75WzhTQ4irAp9wDQMmWzb8Un1psxoyG1UM0fa/JWY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=KhLbo8qX; arc=none smtp.client-ip=209.85.215.176
Received: by mail-pg1-f176.google.com with SMTP id 41be03b00d2f7-c89636920a3so120587a12.1
        for <linux-media@vger.kernel.org>; Wed, 01 Jul 2026 01:28:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1782894488; x=1783499288; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=/wBohDXh07XgRRT+XS4X5myskhVzkgH20x/mfcI9Fsk=;
        b=KhLbo8qXCDwashS+bZjhEZR83EEXUQ4AdO08mHRPg5XgFCm4jU1pjFkALgm/L0Vs/7
         VeNItjys2QvCOy1ti+evQFX1JecJydxYmQ1ilZOp4i0JqKgRodyrCHkQnLLx9d+tkzyx
         nsNJ14vcI7s06TXEEN1i9x/XF6UOaqRRYFBCBxCvq8GN1Gc+xBpFFiuwkxSzR7fZKb46
         F/Vn4V/AOO++kr/tvncOMGk+X88/F2OPDImXkiJgcM8NtsiDn/7cb7SGjfsmZ4e1SLc/
         e+JDrjv4FsEcixwJYm4SRfUdyS87agvCoWt5mdHhAHtIHCDn9Jvq4WMnddn9iaOgFZan
         4oww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782894488; x=1783499288;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=/wBohDXh07XgRRT+XS4X5myskhVzkgH20x/mfcI9Fsk=;
        b=BPNQ3CpAu/s9A7OURn+AgYW9duLTKlao+Ns9TYUkAt9i5H0LNCclL4ENBSl40MIOxu
         4RPql3fIjhmsOl+qzYT7kI6d+6/ht1JersHVwQrAdliB8FymA3N5qcp9EJ4cMsBweWjl
         ljorKKHvWROdaqNH9iRTN1d5EoJELJ2l3k3v8uh8AukZwrKHCrnJ/HboTE9SukQ4bk66
         qXP/5Ff+JA+SXMZZKWar9Uc8JONY6axxbboXTa8jgykDCy8Ppd4Cb2UbjkntbnR1RtRv
         ztxQwDOKHsKD0Hz3h7xA5bddnm1fEXny79tdjPU9kxsx0TUrnehbxHnnE4nGlWmzP2/Q
         yIQg==
X-Gm-Message-State: AOJu0Yw37SU91eZeFIMp789LkuVbWdvrCnBeswqARuCqko78upkaLB0v
	zveRRg/zDIU+qnKcMYeXmKaZzeC7yRg2APx6/J0Y8reYl4gviGwj3blZ
X-Gm-Gg: AfdE7clKTARrfLweFpQFVrBRztAG26Y+j7y1GIHCTiBbeeDYF0/iGGH/IFYvwoTapZ3
	mPDCUBeHr5qH+xbK391VQEk9IpbdGFBNPmA9y1h4kmSzGRi7zCPaSN4br7zGpfBn1xa3ikBJ1Ub
	ml1bLEBq3UxFIeJPunuEFiWI0PTr3O+8QK0p1CXwssnwutvgWd75lCT4+DyY2bRXKukvQh1MBWH
	FUbsWBBa12G003sql+0AfvgHEDd+riiyDOgAmQ7xnlHfmrGyW9NdwRVVmoSvxL2pk8axHGsQ5QV
	/LsIRgHPqRUVq0XSsEZ1TkKJ5dcWBegFJQTIVo7ZecVZ2QBPB2wH35ER3pnaFSMNfyNcEE0YQOf
	0LO4v0rojSgFqktNDqd6BenAJ2RcvgqGdj+7yhtlY66amHMHfwBo69PlVm2pbYF9VNGDdoXj1UF
	9QmD5wsVyBuGbhqbgjy5mB7qXNcL4cRPyDDU9+yQ==
X-Received: by 2002:a05:6a21:330f:b0:3bf:b755:ce6a with SMTP id adf61e73a8af0-3bfed104ffdmr794797637.12.1782894487661;
        Wed, 01 Jul 2026 01:28:07 -0700 (PDT)
Received: from csl-conti-dell7858.ntu.edu.sg ([155.69.195.57])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-847a0337121sm3510477b3a.44.2026.07.01.01.28.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 01 Jul 2026 01:28:06 -0700 (PDT)
From: Maoyi Xie <maoyixie.tju@gmail.com>
To: Stefan Richter <stefanr@s5r6.in-berlin.de>,
	Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: linux-media@vger.kernel.org,
	linux1394-devel@lists.sourceforge.net,
	linux-kernel@vger.kernel.org
Subject: [PATCH] media: firedtv: bound the CA reply length in avc_ca_app_info
Date: Wed,  1 Jul 2026 16:28:02 +0800
Message-Id: <20260701082802.1589509-1-maoyixie.tju@gmail.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-1.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_MISSING_CHARSET(0.50)[];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS(0.00)[m:stefanr@s5r6.in-berlin.de,m:mchehab@kernel.org,m:linux-media@vger.kernel.org,m:linux1394-devel@lists.sourceforge.net,m:linux-kernel@vger.kernel.org,s:lists@lfdr.de];
	PRECEDENCE_BULK(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER(0.00)[maoyixietju@gmail.com,linux-media@vger.kernel.org];
	FORWARDED(0.00)[lists@lfdr.de];
	TAGGED_FROM(0.00)[bounces-66166-lists,linux-media=lfdr.de];
	FREEMAIL_FROM(0.00)[gmail.com];
	FORGED_SENDER_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[maoyixietju@gmail.com,linux-media@vger.kernel.org];
	ALIAS_RESOLVED(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	FORGED_SENDER_FORWARDING(0.00)[];
	DKIM_TRACE(0.00)[gmail.com:+];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-media];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	RCPT_COUNT_FIVE(0.00)[5];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 4E12B6EB1AC

avc_ca_app_info() copies a device length from the CI-CAM response with no
bound check:

	memcpy(&app_info[5], &r->operand[pos], 5 + r->operand[pos + 4]);

r->operand[pos + 4] is a byte the CAM controls, up to 255. app_info is the
256 byte msg[] of struct ca_msg, reached from userspace through the
CA_GET_MSG ioctl. The copy starts at offset 5 and runs 5 + that byte, so a
value above 246 overruns the buffer. A byte of 0xff writes about 9 bytes
past it.

The same idiom in avc_ca_pmt() was bounded for CVE-2021-42739 in
commit 35d2969ea3c7 ("media: firewire: firedtv-avc: fix a buffer overflow
in avc_ca_pmt()"). This reply path was left unbounded. It now returns
-EINVAL when the reported length would run past the 256 byte reply.

Fixes: 154907957f939 ("firedtv: massive refactoring")
Cc: stable@vger.kernel.org
Signed-off-by: Maoyi Xie <maoyixie.tju@gmail.com>
---
 drivers/media/firewire/firedtv-avc.c | 12 +++++++++---
 1 file changed, 9 insertions(+), 3 deletions(-)

diff --git a/drivers/media/firewire/firedtv-avc.c b/drivers/media/firewire/firedtv-avc.c
index a36c284121702..d77b9b802eddb 100644
--- a/drivers/media/firewire/firedtv-avc.c
+++ b/drivers/media/firewire/firedtv-avc.c
@@ -971,7 +971,7 @@ int avc_ca_app_info(struct firedtv *fdtv, unsigned char *app_info,
 {
 	struct avc_command_frame *c = (void *)fdtv->avc_data;
 	struct avc_response_frame *r = (void *)fdtv->avc_data;
-	int pos, ret;
+	int pos, length, ret;
 
 	mutex_lock(&fdtv->avc_mutex);
 
@@ -995,12 +995,18 @@ int avc_ca_app_info(struct firedtv *fdtv, unsigned char *app_info,
 	/* FIXME: check response code and validate response data */
 
 	pos = get_ca_object_pos(r);
+	length = r->operand[pos + 4];
+	/* 5 header bytes then 5 + length bytes are written to app_info */
+	if (5 + 5 + length > 256) {
+		ret = -EINVAL;
+		goto out;
+	}
 	app_info[0] = (EN50221_TAG_APP_INFO >> 16) & 0xff;
 	app_info[1] = (EN50221_TAG_APP_INFO >>  8) & 0xff;
 	app_info[2] = (EN50221_TAG_APP_INFO >>  0) & 0xff;
-	app_info[3] = 6 + r->operand[pos + 4];
+	app_info[3] = 6 + length;
 	app_info[4] = 0x01;
-	memcpy(&app_info[5], &r->operand[pos], 5 + r->operand[pos + 4]);
+	memcpy(&app_info[5], &r->operand[pos], 5 + length);
 	*len = app_info[3] + 4;
 out:
 	mutex_unlock(&fdtv->avc_mutex);
-- 
2.34.1


