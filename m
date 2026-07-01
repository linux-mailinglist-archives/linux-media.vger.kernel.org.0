Return-Path: <linux-media+bounces-66223-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id bRqsEjQTRWoU6goAu9opvQ
	(envelope-from <linux-media+bounces-66223-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Wed, 01 Jul 2026 15:16:36 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 9F1C96EDF49
	for <lists+linux-media@lfdr.de>; Wed, 01 Jul 2026 15:16:35 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=gmail.com header.s=20251104 header.b="BC/9e4nY";
	spf=pass (mail.lfdr.de: domain of "linux-media+bounces-66223-lists+linux-media=lfdr.de@vger.kernel.org" designates 172.105.105.114 as permitted sender) smtp.mailfrom="linux-media+bounces-66223-lists+linux-media=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=none) header.from=gmail.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id A263D323E7BA
	for <lists+linux-media@lfdr.de>; Wed,  1 Jul 2026 13:00:31 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0F902481FD2;
	Wed,  1 Jul 2026 12:57:51 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from mail-pj1-f52.google.com (mail-pj1-f52.google.com [209.85.216.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5950F48B36D
	for <linux-media@vger.kernel.org>; Wed,  1 Jul 2026 12:57:49 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782910670; cv=none; b=jReDe8rIL6FOzpJ08du7d741Uv2CNU79nc29xmfCXdp4fMJg1Myr3oCqgigdenvN7sS3agacuYHJO5hOf3+3pgaXb58C/9xj3+9qT0zJyoaq8wnmWeMLQ4uC6AI2TlZmT/WO41L+rsDGSzgeGjNpz8e1JrzHgKLYveEf5/ZGY7k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782910670; c=relaxed/simple;
	bh=H7mKrhs3dR62pLwn9IOckqVu033msifC1M1GZ/jJKMY=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=omMBLhPQ0BE7VcuqJzhWCy/ssFc6LzmjSSAnLa+EmAR9D3GXVUogjTIfys8e9RD8RNrBPm5mYnhpcDSOrcQ8AZkByipMbXeoOb03lme77EN9YhNK4CDOPHKo/+6Awyca/sR6BIDyQOmfS2gLDY21ARq8mTyBAwxX0RGx03pmoyA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=BC/9e4nY; arc=none smtp.client-ip=209.85.216.52
Received: by mail-pj1-f52.google.com with SMTP id 98e67ed59e1d1-3804e42ad5fso497221a91.2
        for <linux-media@vger.kernel.org>; Wed, 01 Jul 2026 05:57:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1782910668; x=1783515468; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=WJy96jzCfjKqCU6bDuPUUrm0AXO+B20B1H6OT1/qUxY=;
        b=BC/9e4nY0kos9ejBtyh3Om0yPz72dnmiyGBhA6sBO5G2XK7JbxgyflwpZzGavxMgUb
         MMzEzjfqxniVu2agOOi5sREXx10tMSsNJGG+hOpcQSMseWRHruBkpedvPTqntGwrKg/S
         MLVXVKLjXgJ+o6xgmz/DS+eCwSuYFuDql4WAg7nos3o4JRuRW2wzZRZ+FgamUUbCeZRS
         XgmQ+zKQapvhAmYol1k9eV8oBoUfokLNGOKGzYxC/xdLDLtJxJ1TJ3kHnCWKOUvefwtB
         ggI4uICwe+UMikeEKLY5HtD48JjHJexIcOQUegw+YAmku5WbSDDtTZbkroTGAhXEGG9+
         rrwA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782910668; x=1783515468;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=WJy96jzCfjKqCU6bDuPUUrm0AXO+B20B1H6OT1/qUxY=;
        b=cH+qRLqWXQNsU9NfnAvADDAz21RaYSxDMRbJW5IZ5qU6lJVJjNO+VRUyCNFwjiDWpn
         4loOIqIFWiAGNWvwSLlx4EN4LKg4xzEqccPhS8wGD3KALouEESP1S73BiafHkhNlBUNd
         lPSgwWtjSAFdc+lny0q0DhgxDZJE+kwYR7DMt4tI+Zib6WQZh/xpM15tbHJNj4+je9hd
         4hjb564C0BYfYZ0WVFWdkzuzJ+VPOs8kkNgrtMCKDuAMB4G39Q3vAG2WWXQWSSnZyHHF
         abvEhgHno5hDTal+x+OxATqWcdDmLtRWfLkR/vRG9/pTd4FT0pdVaXBd1GDlbTLXlNcO
         SFaw==
X-Gm-Message-State: AOJu0YwP/sNNlK+HZg3XnO/DyRi2010N1NlOFrllN3R+XTxz0Nx2KaB9
	+dNnRrC16igehiTljiHqznLekgmrGeOA1x/c1E3oRmb6Ca7Kj4ZuTMJr
X-Gm-Gg: AfdE7ckMbFaPjyBqmxISuR5BSNqaVq43y+9UxaLE3xhH65ca9+FHtThiEUAvkclNh8u
	l0gtPuhFKRtocwyBVTYGvJYM/GalvatAywg9RtBVJobz+Ii8yyTI0bv8UWp2bNSM86bO17iUGTF
	q1ggkyxaT/ADyIMlVsD4J+jSW4NyhNHKqCzqXjBK1PvCzsjxDm2BtZwY9GRSaN6YxTiEY38TioN
	lFgvIexjbmLOAH3tTi7OLZL38PkG+6+RByDXKVxJjSAYU2MB/OjukoDHCDINc/qi5CiMYY2xku4
	Y5SSXJlBK7FklEwPvdERTzRh9LEyk5K4NmB07Wh5OK8myE8iquHkkXYpACu4HBTB6ZQy89B5bDi
	qOEk1uFRsIXYekRsI/VglD8uNOZXleAzmFOhuf+HGhGw6bdgeoY4VnefRObTIU5peaiTX7Vs0NJ
	Bjqt+M9Xd9jHEC8ajI2pSNZEWezgADWquQTmsGIg==
X-Received: by 2002:a17:90b:4c84:b0:37f:9ce1:cda4 with SMTP id 98e67ed59e1d1-380baa74659mr638284a91.26.1782910668536;
        Wed, 01 Jul 2026 05:57:48 -0700 (PDT)
Received: from x1c ([2405:9800:b670:b64b:adee:3e1d:849b:494a])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2ca6853f616sm14197275ad.37.2026.07.01.05.57.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 01 Jul 2026 05:57:48 -0700 (PDT)
From: Tharit Tangkijwanichakul <tharitt97@gmail.com>
To: Sakari Ailus <sakari.ailus@linux.intel.com>,
	Dave Stevenson <dave.stevenson@raspberrypi.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: linux-media@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	skhan@linuxfoundation.org,
	linux-kernel-mentees@lists.linux.dev,
	jai.luthra@ideasonboard.com,
	Tharit Tangkijwanichakul <tharitt97@gmail.com>
Subject: [PATCH v3] media: imx219: add test patterns
Date: Wed,  1 Jul 2026 19:57:38 +0700
Message-ID: <20260701125738.6384-1-tharitt97@gmail.com>
X-Mailer: git-send-email 2.53.0
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORWARDED(0.00)[lists@lfdr.de];
	TO_DN_SOME(0.00)[];
	FREEMAIL_CC(0.00)[vger.kernel.org,linuxfoundation.org,lists.linux.dev,ideasonboard.com,gmail.com];
	MIME_TRACE(0.00)[0:+];
	TAGGED_FROM(0.00)[bounces-66223-lists,linux-media=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:sakari.ailus@linux.intel.com,m:dave.stevenson@raspberrypi.com,m:mchehab@kernel.org,m:linux-media@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:skhan@linuxfoundation.org,m:linux-kernel-mentees@lists.linux.dev,m:jai.luthra@ideasonboard.com,m:tharitt97@gmail.com,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[tharitt97@gmail.com,linux-media@vger.kernel.org];
	DKIM_TRACE(0.00)[gmail.com:+];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	FREEMAIL_FROM(0.00)[gmail.com];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[tharitt97@gmail.com,linux-media@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	RCPT_COUNT_SEVEN(0.00)[9];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	TAGGED_RCPT(0.00)[linux-media];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,tor.lore.kernel.org:rdns,tor.lore.kernel.org:helo]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 9F1C96EDF49

Add 5 missing test patterns to complete the available
hardware test patterns.

The original mapping for color bars and solid color in the menu
is preserved to prevent existing userspace application and automated
vendor capture tests.

The changes were validated on a raspberry pi 5 with an imx219 sensor
using v4l2-ctl and rpicam-still.

Signed-off-by: Tharit Tangkijwanichakul <tharitt97@gmail.com>
---
Changes in v3:
	- Revert the change to the original test pattern mapping
	to avoid breaking userspace applications
Changes in v2:
	- Fix typo in commit message: correct the color bars index
	to 1 and solid color to 2
	- No code changes from v1
 drivers/media/i2c/imx219.c | 27 +++++++++++++++++++++------
 1 file changed, 21 insertions(+), 6 deletions(-)

diff --git a/drivers/media/i2c/imx219.c b/drivers/media/i2c/imx219.c
index 223d3753c..9571f3622 100644
--- a/drivers/media/i2c/imx219.c
+++ b/drivers/media/i2c/imx219.c
@@ -110,11 +110,16 @@
 
 /* Test Pattern Control */
 #define IMX219_REG_TEST_PATTERN		CCI_REG16(0x0600)
-#define IMX219_TEST_PATTERN_DISABLE	0
-#define IMX219_TEST_PATTERN_SOLID_COLOR	1
-#define IMX219_TEST_PATTERN_COLOR_BARS	2
-#define IMX219_TEST_PATTERN_GREY_COLOR	3
-#define IMX219_TEST_PATTERN_PN9		4
+#define IMX219_TEST_PATTERN_DISABLE			0
+#define IMX219_TEST_PATTERN_SOLID_COLOR			1
+#define IMX219_TEST_PATTERN_COLOR_BARS			2
+#define IMX219_TEST_PATTERN_GREY_COLOR			3
+#define IMX219_TEST_PATTERN_PN9				4
+#define IMX219_TEST_PATTERN_16SPLIT_COLOR_BARS		5
+#define IMX219_TEST_PATTERN_16SPLIT_INV_COLOR_BARS	6
+#define IMX219_TEST_PATTERN_COLUMN_COUNTER		7
+#define IMX219_TEST_PATTERN_INV_COLUMN_COUNTER		8
+#define IMX219_TEST_PATTERN_PN31			9
 
 /* Test pattern colour components */
 #define IMX219_REG_TESTP_RED		CCI_REG16(0x0602)
@@ -238,7 +243,12 @@ static const char * const imx219_test_pattern_menu[] = {
 	"Color Bars",
 	"Solid Color",
 	"Grey Color Bars",
-	"PN9"
+	"PN9",
+	"16 Split Color Bars",
+	"16 Split Inverted Color Bars",
+	"Column Counter",
+	"Inverted Column Counter",
+	"PN31"
 };
 
 static const int imx219_test_pattern_val[] = {
@@ -247,6 +257,11 @@ static const int imx219_test_pattern_val[] = {
 	IMX219_TEST_PATTERN_SOLID_COLOR,
 	IMX219_TEST_PATTERN_GREY_COLOR,
 	IMX219_TEST_PATTERN_PN9,
+	IMX219_TEST_PATTERN_16SPLIT_COLOR_BARS,
+	IMX219_TEST_PATTERN_16SPLIT_INV_COLOR_BARS,
+	IMX219_TEST_PATTERN_COLUMN_COUNTER,
+	IMX219_TEST_PATTERN_INV_COLUMN_COUNTER,
+	IMX219_TEST_PATTERN_PN31
 };
 
 /* regulator supplies */
-- 
2.53.0


