Return-Path: <linux-media+bounces-55022-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id KElkEcZUr2mYUQIAu9opvQ
	(envelope-from <linux-media+bounces-55022-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Tue, 10 Mar 2026 00:16:22 +0100
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 9634B2429DD
	for <lists+linux-media@lfdr.de>; Tue, 10 Mar 2026 00:16:21 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 6255930E5750
	for <lists+linux-media@lfdr.de>; Mon,  9 Mar 2026 23:15:25 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3BA133939C4;
	Mon,  9 Mar 2026 23:15:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="V4ag5O/4"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-lf1-f47.google.com (mail-lf1-f47.google.com [209.85.167.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5F9EC37A490
	for <linux-media@vger.kernel.org>; Mon,  9 Mar 2026 23:15:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773098123; cv=none; b=LCZfGe21sTAwiQ3WYqm29h/Gauf4Xl08696vwN4B777FzbR9HD7g6768JH6p8BSpl2dQ1S8oQQGa6cNSAzyEGuJqjTLXAKXyJ7H+x3csj0HiQogwYDSmKAjCuHAy1VZHWhXeN4hzXyELxFEIpPYDC6bIk/eNScLnlizI/zoyDus=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773098123; c=relaxed/simple;
	bh=WGnaZpd1lHZ0g1/hQlXt3QsP4TP5blxc+JSP/+XOwAI=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=Wer2gqULNbh+TnaYZWsEx+XLSBd7qGyNt5wqvGDSDqgjoF8xpo1aoD6besElKLfqjCiSztOjEHwHtV1KqnF5p5cUCZO+zYNhKL9SeRFstIjaKls8Jz1Ri1dDRdkhVKrO5eCNV7raIHuFNyllXuSPVxRO1QriCjZFsyjITYx9GRM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=V4ag5O/4; arc=none smtp.client-ip=209.85.167.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-lf1-f47.google.com with SMTP id 2adb3069b0e04-59dea72099eso6875096e87.0
        for <linux-media@vger.kernel.org>; Mon, 09 Mar 2026 16:15:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1773098121; x=1773702921; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=fRNtITcVqp4VjMNgr6LnbUQMaO8JD5CEfsNUgSM2t3A=;
        b=V4ag5O/4JR7wUQs+ZK4C/qvrFUhl0FKNU/L2z9E59qHGgy36Rwl8XR+I8HN182TgPX
         ec3iZLhS5AjdmBlNd/D4tTSlN4YtHXlYlkpl37aBGq3LnopiQYSH54dCaug5PMjXSQaK
         fWQMwh2nvCoIpLEkn0WF82XmiMcM6/qf9SE0Eqwto63joWAwyQqChUgNpm1IWK7keUnD
         wCo6vIped8LpbFxdmUaUy3aIsdEjU0mNdQ/rJiW2sV/UerNzoUBuhfsbqWA2LZ3Ms3wJ
         BW3Io48xTtiTkRA1PcAQC4t9vWgCX8vbFYSQ+pet4HchupyyrLZqHDV7LS3nAraD02De
         g/CA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1773098121; x=1773702921;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=fRNtITcVqp4VjMNgr6LnbUQMaO8JD5CEfsNUgSM2t3A=;
        b=GsinNOG+NFNcTg1jfxWpa6rgr5NWmxFMKyzvyxKBIPD/VivPZUZH4NJ2lhUAk7fqlX
         VBjf7kqi/A6e4rJXtYyzxyZ72MWJRHZdebA89nFMC/oB3TWf7AHz2/cX79iQXId0/nQN
         MKDMFSsuJYdyB4vBsiJg38ki5YOy5anJuo0adPzkYeiuVIRbjw+STtuMr0UrZIDRxj78
         hxlmtum3ah7p9Nl0lQYjqEv/ham5KzBEFdpl4I+fka1xlxLVFRaSmBIpcPptyYogtuGs
         ESNK236DFheYSrg09BW6CTGdVaEuDcKP3NHPrzcd/VZMJFWjljdkrrtBDcihMRyvuhYh
         xtHg==
X-Forwarded-Encrypted: i=1; AJvYcCVTP2cTBb6ZkKAIOseeNGnhFb4d4mRgaKs+MBRW7mGbgadLcEenD67+uNBya5egRQfNa9QAw/X+Puxa6Q==@vger.kernel.org
X-Gm-Message-State: AOJu0Yzdvl5UXZUo/LiGn0u8vvgrPJR60DCd1oAEMBNT40QsXVOW413T
	FnfXMBcrqMj4Ba2NCTnpeP1oe4tWb8nMYz0rpSlPawmGVm2Fmyt5UtFE
X-Gm-Gg: ATEYQzwSELDoMJk+USRpj/K1nGTo0xxPJi9Ps+5qtKYIY7v1Jf831M+10ayXMaDYLmg
	yyUNXaUBdS/gwSRA1tSS4d1q/cvgM7h+3Ab8Q3XwZ6W1HdDvOI1nbK2E4mPtJh9h8edNiwtXah5
	2IhA6G0JfXwii3g8BtwgSdQ6bIrBT8c1JZ0ou1m3Hzdyn9oNhrZLxpQJgWYro4/O3EeBOJaBPg8
	ooAkMtKMPU4ce3qsfAsbUZJ+Jg9owtwp6JOk8NIb/XOEWKwzOble+tI/4diqLMziwKKaU8Pekl3
	Z3NillYYXIFbJd5fzJ1Ta5+KHmGe/szN1TBUENs8Nb97T4EmCGwuJm0Ir6MWq4A4WLkcF/olV/6
	agwKQqzP3B2ey7r2vmjHuVCELgQq8rSsHBaTReFoUt3VWSSLkmpc+HQq8l6/f8TbCV0YuvvIz4B
	lBe05xxfWnNr1KmMENPfKMbFBiSTqfi/KkeU8Wnuoa9WvniwMkGk+8sfNxjP9A0t/vvqZdeUjjV
	w==
X-Received: by 2002:ac2:5990:0:b0:5a1:3bd8:a068 with SMTP id 2adb3069b0e04-5a13cceecf1mr3252492e87.30.1773098120314;
        Mon, 09 Mar 2026 16:15:20 -0700 (PDT)
Received: from T6NXCV08J99224A.lan (81-237-238-191-no600.tbcn.telia.com. [81.237.238.191])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5a13d01cbedsm2456415e87.12.2026.03.09.16.15.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Mar 2026 16:15:19 -0700 (PDT)
From: Oskar Ray-Frayssinet <rayfraytech@gmail.com>
To: hansg@kernel.org,
	mchehab@kernel.org
Cc: sakari.ailus@linux.intel.com,
	andy@kernel.org,
	gregkh@linuxfoundation.org,
	linux-media@vger.kernel.org,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Oskar Ray-Frayssinet <rayfraytech@gmail.com>
Subject: [PATCH] staging: atomisp: replace msleep with usleep_range in atomisp-gc2235.c
Date: Tue, 10 Mar 2026 00:14:45 +0100
Message-ID: <20260309231445.7000-1-rayfraytech@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Rspamd-Queue-Id: 9634B2429DD
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_MISSING_CHARSET(0.50)[];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20230601];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_CC(0.00)[linux.intel.com,kernel.org,linuxfoundation.org,vger.kernel.org,lists.linux.dev,gmail.com];
	TAGGED_FROM(0.00)[bounces-55022-lists,linux-media=lfdr.de];
	RCVD_COUNT_FIVE(0.00)[5];
	FORGED_SENDER_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[rayfraytech@gmail.com,linux-media@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[9];
	NEURAL_HAM(-0.00)[-1.000];
	DKIM_TRACE(0.00)[gmail.com:+];
	TAGGED_RCPT(0.00)[linux-media];
	FREEMAIL_FROM(0.00)[gmail.com];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo]
X-Rspamd-Action: no action

Replace msleep(5) with usleep_range(5000, 6000) to avoid sleeping
longer than necessary. msleep() with values less than 20ms may sleep
for up to 20ms due to timer granularity.

Signed-off-by: Oskar Ray-Frayssinet <rayfraytech@gmail.com>
---
 drivers/staging/media/atomisp/i2c/atomisp-gc2235.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/staging/media/atomisp/i2c/atomisp-gc2235.c b/drivers/staging/media/atomisp/i2c/atomisp-gc2235.c
index d3414312e1de..db5e007efc56 100644
--- a/drivers/staging/media/atomisp/i2c/atomisp-gc2235.c
+++ b/drivers/staging/media/atomisp/i2c/atomisp-gc2235.c
@@ -433,7 +433,7 @@ static int power_up(struct v4l2_subdev *sd)
 			goto fail_power;
 	}
 
-	msleep(5);
+	usleep_range(5000, 6000);
 	return 0;
 
 fail_clk:
-- 
2.43.0


