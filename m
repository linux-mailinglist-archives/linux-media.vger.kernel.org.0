Return-Path: <linux-media+bounces-55542-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id eH1VFN0xs2ntSwAAu9opvQ
	(envelope-from <linux-media+bounces-55542-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Thu, 12 Mar 2026 22:36:29 +0100
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id AE5D727A156
	for <lists+linux-media@lfdr.de>; Thu, 12 Mar 2026 22:36:28 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id AF16D319DD42
	for <lists+linux-media@lfdr.de>; Thu, 12 Mar 2026 21:35:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8635A3E5EF4;
	Thu, 12 Mar 2026 21:35:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nextdimension.cc header.i=@nextdimension.cc header.b="YOSh6HUG"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-oi1-f169.google.com (mail-oi1-f169.google.com [209.85.167.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B80A93E4C82
	for <linux-media@vger.kernel.org>; Thu, 12 Mar 2026 21:35:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773351340; cv=none; b=JzdDI2ryaBj4PbMmK4Gmwmx+3U7dM1tz/qrr5Ql9pm7BzH0RgCs5+ZMHE4+cLKzjvrpVN/FsKx+Rm2ouU/tGN3yiKSkXZFMnBKhbl0GbZJnD6sbPbHFbOiB5jz1Gv/lmkXtt8WjRO3/9NnB+9MlJrS3+vT9y93vHdYSahuTJ2pk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773351340; c=relaxed/simple;
	bh=g38359LQTxNVhL7uK9VYSNxpxfXejFqt+h4QaNjTDoA=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=UrJoTvtJhAqQ4ycAxI/MFzxVsWCHBjGBcQBL+Td1yIkjZp8XJWR6UOZlch5//0Jxn1+HGkd1nng/5OLWIwUXAFAQCAN0F7Ibv9Jdq/GRXU3+wogJGcM37NvMCWG6SuG+/6ABqdZnKQr/OZqPIGKmWaE9huFl6ISHMuWUOEMQ3a0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=nextdimension.cc; spf=pass smtp.mailfrom=nextdimension.cc; dkim=pass (2048-bit key) header.d=nextdimension.cc header.i=@nextdimension.cc header.b=YOSh6HUG; arc=none smtp.client-ip=209.85.167.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=nextdimension.cc
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nextdimension.cc
Received: by mail-oi1-f169.google.com with SMTP id 5614622812f47-4671cbce626so764503b6e.1
        for <linux-media@vger.kernel.org>; Thu, 12 Mar 2026 14:35:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=nextdimension.cc; s=google; t=1773351337; x=1773956137; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=8hmF65EirktKYuErq83hIpO7XAEMM+AK7pKBTy5Ye+w=;
        b=YOSh6HUGgJY4dTjF4kKjhSN2joB7KWSFzQ2KM3e9TomnTrJGnQW0GYzMbK8Q2IZKU1
         O+QquOIKws+wmqLDxrse+9MYOF/Sz9NlygZULE0liVmakKNPZ3Yv0KqC24yeDuX7DNwS
         DD/Y4lLoKSlnnMQkCXzgyGkaAUPYyJz7ghTVC9E84nS5SA4Rbil6HLcJFtGGPM0BexYo
         HcftWSOUR/BkE2Jcdck2II/VRXLQV1/HiJNkmoB4eeEWOPqhqpBedKe7xbYK0FdAZdpG
         89Cp4+hhQjVxwFkCXiRNPeoArGtzAlEivlxKcXzfPetKP7ZwBHDxX4MveRDwhlQUId3U
         h+tQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773351337; x=1773956137;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=8hmF65EirktKYuErq83hIpO7XAEMM+AK7pKBTy5Ye+w=;
        b=C07xtCKCLucL2OvAPiKciBY3WuIskrAWWWQl6Vb8WBmUdi3DvvxqCGSxAq3xXBgI2H
         hoD05Twv7IJDTi8BjaFcpS19Uxb1tokYDTUXBKQgpDShsNDl3kHSX3LgxCnE2tWtlGxe
         7RFwBh8Xo+6AxIzB8eawWsS9PusJyRxrbBDL35KxqkoesmG1bFcPaGbj2DtCBGpi0MIJ
         x0FAj0XFfy2hvOsWP4zMLvb4/EcNY+ptGLLKLCFnp8TuAH2wCJ40+uA1YehAQ/JuufOg
         Stj2Ex4ULL8hOj4DeULaUp2X7qZOmN54q0w4WHRfRer2tYW+/kXOjA1dZRkcFgBuIuTJ
         NI0g==
X-Gm-Message-State: AOJu0YzTsMORnFNtwFUg5LSSTY76CQ+LSd2G80f3Zjl6X/3iOr1tQqAQ
	1ZyoU0o9tA8B2Pjp0mxee6nzhmGDrOMzH6fiqcTy69+kmRzZgicIFjiRZZbS8a0KTGmqsPNmIIb
	NhC9PFX4=
X-Gm-Gg: ATEYQzxEpAUGy1/yRQ6KOpReP+JexUQcY20/DseXW6iYY6IRSFwG3Cz3FcgtqqxD/Ca
	VMRQciW9Xm0c11nJ8rPcbEYtdRLttALWK8ApYQhC8MRB+FEc7B0ypdB230ZF4QCVSbU1AC1C/2H
	nPxjBtGplcvDjxNiqSHlkyDvgLTn/ItITbkEYPfzlQl933zj37iycmHqjJEDMa5e9d1BiZc4RcK
	tOo4PF/EHSwlUdGYd1WHEDsw5Cs4LDZIv8jvZzKPn59QOrrEn1RjRon14H+f8xaxoxeRbFn3Epw
	aUK/Rrz83YJN2dw90MgfsxaAPXn4TyLJMbVAerCXqXCHEwxMx0Jn7xM1AX5A5/NLYEt0L+DTh9Q
	+BZb8X9HRO5yzRkuWMegG9u6nAbmNgqKjT6g6OtUGP0whfNtLgy5+zfuAQuAsQyBJFtDffJVU0i
	JQtbxoA57RKzC9e0dc3HkbwWNpKROeW/pbpX9y5lGooTRhySPk+FqSp+H+MM3Wi3hIv3HnanYlZ
	eEBQtsQCPduEfBbE6I=
X-Received: by 2002:a05:6808:e84:b0:467:100d:22c4 with SMTP id 5614622812f47-46757592e85mr503935b6e.58.1773351337540;
        Thu, 12 Mar 2026 14:35:37 -0700 (PDT)
Received: from localhost.localdomain (108-207-243-35.lightspeed.austtx.sbcglobal.net. [108.207.243.35])
        by smtp.gmail.com with ESMTPSA id 5614622812f47-4673415c264sm3657572b6e.5.2026.03.12.14.35.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 12 Mar 2026 14:35:37 -0700 (PDT)
From: Bradford Love <brad@nextdimension.cc>
To: linux-media@vger.kernel.org
Cc: Bradford Love <brad@nextdimension.cc>
Subject: [PATCH 02/11] cx25840: Fix NTSC-J, PAL-N, and SECAM standards
Date: Thu, 12 Mar 2026 16:35:23 -0500
Message-Id: <20260312213532.2907276-3-brad@nextdimension.cc>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20260312213532.2907276-1-brad@nextdimension.cc>
References: <20260312213532.2907276-1-brad@nextdimension.cc>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spamd-Result: default: False [-0.16 / 15.00];
	MID_CONTAINS_FROM(1.00)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_MISSING_CHARSET(0.50)[];
	R_DKIM_ALLOW(-0.20)[nextdimension.cc:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-55542-lists,linux-media=lfdr.de];
	RCPT_COUNT_TWO(0.00)[2];
	FORGED_SENDER_MAILLIST(0.00)[];
	DMARC_NA(0.00)[nextdimension.cc];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[nextdimension.cc:+];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[brad@nextdimension.cc,linux-media@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	TAGGED_RCPT(0.00)[linux-media];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	FROM_HAS_DN(0.00)[]
X-Rspamd-Queue-Id: AE5D727A156
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Formats did not correctly decode prior.

Modifications are based off cx25840 datasheet.

Signed-off-by: Bradford Love <brad@nextdimension.cc>
---
 drivers/media/i2c/cx25840/cx25840-core.c | 29 ++++++++++++++++++++++--
 1 file changed, 27 insertions(+), 2 deletions(-)

diff --git a/drivers/media/i2c/cx25840/cx25840-core.c b/drivers/media/i2c/cx25840/cx25840-core.c
index a86306304330..69d5cc648c0f 100644
--- a/drivers/media/i2c/cx25840/cx25840-core.c
+++ b/drivers/media/i2c/cx25840/cx25840-core.c
@@ -1652,10 +1652,14 @@ static int set_v4lstd(struct i2c_client *client)
 	struct cx25840_state *state = to_state(i2c_get_clientdata(client));
 	u8 fmt = 0;	/* zero is autodetect */
 	u8 pal_m = 0;
+	u8 pal_n = 0;
+	u8 ntsc_j = 0;
+	u8 tmp_reg = 0;
 
 	/* First tests should be against specific std */
 	if (state->std == V4L2_STD_NTSC_M_JP) {
 		fmt = 0x2;
+		ntsc_j = 0x80;
 	} else if (state->std == V4L2_STD_NTSC_443) {
 		fmt = 0x3;
 	} else if (state->std == V4L2_STD_PAL_M) {
@@ -1663,6 +1667,7 @@ static int set_v4lstd(struct i2c_client *client)
 		fmt = 0x5;
 	} else if (state->std == V4L2_STD_PAL_N) {
 		fmt = 0x6;
+		pal_n = 0x40;
 	} else if (state->std == V4L2_STD_PAL_Nc) {
 		fmt = 0x7;
 	} else if (state->std == V4L2_STD_PAL_60) {
@@ -1689,10 +1694,30 @@ static int set_v4lstd(struct i2c_client *client)
 		/* Set format to NTSC-M */
 		cx25840_and_or(client, 0x400, ~0xf, 1);
 		/* Turn off LCOMB */
-		cx25840_and_or(client, 0x47b, ~6, 0);
+		cx25840_and_or(client, 0x47b, ~0x6, 0);
+	} else if (fmt == 0xc) { /* SECAM - Step 9c - toggle CKILLEN */
+		tmp_reg = cx25840_read(client, 0x401);
+		cx25840_and_or(client, 0x401, ~0x20, tmp_reg & 0x20 ? 0x00 : 0x20);
+		cx25840_and_or(client, 0x401, ~0x20, tmp_reg & 0x20 ? 0x20 : 0x00);
 	}
+
 	cx25840_and_or(client, 0x400, ~0xf, fmt);
-	cx25840_and_or(client, 0x403, ~0x3, pal_m);
+
+	if (fmt >= 4 && fmt < 8) {
+		tmp_reg = cx25840_read(client, 0x401);
+		cx25840_and_or(client, 0x401, ~0x40, tmp_reg & 0x40 ? 0x00 : 0x40); /* CAGCEN */
+		cx25840_and_or(client, 0x401, ~0x40, tmp_reg & 0x40 ? 0x40 : 0x00);
+		cx25840_and_or(client, 0x401, ~0x20, tmp_reg & 0x20 ? 0x00 : 0x20); /* CKILLEN */
+		cx25840_and_or(client, 0x401, ~0x20, tmp_reg & 0x20 ? 0x20 : 0x00);
+	}
+
+	if (pal_m)
+		cx25840_and_or(client, 0x403, ~0x3, pal_m);
+	else if (pal_n)         /* cx25840 datasheet table 3-19 */
+		cx25840_and_or(client, 0x403, ~0x40, pal_n);
+	else if (ntsc_j)        /* cx25840 datasheet table 3-19 */
+		cx25840_and_or(client, 0x403, ~0x80, ntsc_j);
+
 	if (is_cx23888(state))
 		cx23888_std_setup(client);
 	else
-- 
2.35.1


