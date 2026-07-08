Return-Path: <linux-media+bounces-66990-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id o67mDrRPTmpRKgIAu9opvQ
	(envelope-from <linux-media+bounces-66990-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Wed, 08 Jul 2026 15:25:08 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 331AB726C6D
	for <lists+linux-media@lfdr.de>; Wed, 08 Jul 2026 15:25:07 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=gmail.com header.s=20251104 header.b=eeLqQNxX;
	dmarc=pass (policy=none) header.from=gmail.com;
	spf=pass (mail.lfdr.de: domain of "linux-media+bounces-66990-lists+linux-media=lfdr.de@vger.kernel.org" designates 2600:3c15:e001:75::12fc:5321 as permitted sender) smtp.mailfrom="linux-media+bounces-66990-lists+linux-media=lfdr.de@vger.kernel.org";
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 928623037C1A
	for <lists+linux-media@lfdr.de>; Wed,  8 Jul 2026 13:17:36 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E7D9E2F0C79;
	Wed,  8 Jul 2026 13:17:31 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from mail-pg1-f175.google.com (mail-pg1-f175.google.com [209.85.215.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2701628469F
	for <linux-media@vger.kernel.org>; Wed,  8 Jul 2026 13:17:26 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783516650; cv=none; b=pvxv/dQ8na0givHaXYwitGptPjTtd1WRwzf3A33ukU5v/4JErn1PDVBoT4jDfBcmtBROypjR/OZgVinJYzem2WqKuN1UT+BlQ9s9pFIChEjoSyT5Wd65LTGcwwPY47nrzLdRHzKrWwWWQzPW7G4NQtNYoumBGsK5V28y7HKLsV0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783516650; c=relaxed/simple;
	bh=Y9RaMCxOlbRTfzLtqC6sZYWXDlvVbjPZwYFHceR9htM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=XjEKtesaoVBo6ffFtE1x8bDw51/72pG/D5H/s0OHKKL1lg0LwudXA/UbNVwMb1G7NJhJcKgtCXBruNrwAW7VW6NbN9EDBARaUEOX1VU0i61EnCK69hP8SpabJKDmAlXRqLbriN0JAkP4LDOIvojGBKAY4VNZoUGua4EW8xzTToI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=eeLqQNxX; arc=none smtp.client-ip=209.85.215.175
Received: by mail-pg1-f175.google.com with SMTP id 41be03b00d2f7-c9e607d81fcso376601a12.2
        for <linux-media@vger.kernel.org>; Wed, 08 Jul 2026 06:17:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1783516644; x=1784121444; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=uglQpZt7ZOK5/DoDUN/AtUQ4n+Ns7uXtujRqlFPby1A=;
        b=eeLqQNxXVX8WzNu0xV9D60iyQDuFZBaU1TKJ8Q50Nlqi8b2KW2uCDfHwsn6kJed11X
         AI1UovdPT07B1pcZykhfjUK2M/tfoA0u2x+nmIBpDMOCc55POlDDrHDX3VsywiYZW5+X
         x5pMk2/SK9DaaNlCjHg1run5AssrPeE8E/QpUT2ZOCFlPdn68iOb7ymAU+kjFWpY+YKb
         j+r5bbM95CJGvbccOneXBdJQp38K3kkYFwtRx8qJfJP4p9JuviYjKvOTUupTaOOT9rh3
         ZzUShv+bQYyWoCRL5k1+btOMGm638WcYKGJn18rP2n3rRr/rbba4Uy/HbpocCTUMlwtq
         YiJA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783516644; x=1784121444;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=uglQpZt7ZOK5/DoDUN/AtUQ4n+Ns7uXtujRqlFPby1A=;
        b=Qy5Z2Y1hl50pP6jwtCLCQjNBslmH3xacmNB0w9Ctxd7HSG+fyyFxwmb+ncJ1w3z1fW
         tzzppiOjK+ALIueY2jDvRpgpa3XNTeDBrCRefza3FtdgHwejSZ532lh/IzYSZ8scKoY7
         O+K3hAOsJ8OInDUJ7oYLprD4RVxz6S9yT2pgLhTxEWbYvqExCcjswHv58ZQk/ENrRwaG
         HLSQK2NLW4vVDkMv0G2r0ce0/1STOrmawtVz0QZ0fcB+ps6YA4UYigGRbhDN1gVNBbfB
         a0TML1ApD0Qy/Ljnp11aRke+9FimPaJ5tVayBa4HntJhpFKuiLidl/y5385mKwbWLuUJ
         wlTA==
X-Forwarded-Encrypted: i=1; AHgh+RrOos+WhZ4Nwyu50h3vld0594RX/0UxAUBmPy8sj6CoBsr5iADmwA6t3KLhRt9Nm8BLU55VBCKNZsfKYg==@vger.kernel.org
X-Gm-Message-State: AOJu0YxXj0Qx1PmW1ybOZAmgaw8M/FEmff2pleUZ5/PMKElQ2Yiy1acZ
	D2keH6ILNNRlH9PxP5rFVpf5It3hiC7U0A23Qi0+Vg5MNpCAAYUyA+Qn
X-Gm-Gg: AfdE7ckCUU25/HZ0IsjKMEr+AShnIQbhtJQJlZ9PocyGnQZc3KgYij9n89mjPa8k98X
	kfU/1WGrziHcsqD92hSeau5pGahOnPCqU5Dqg1uYreMl2DwRh6ChyaK0QI1TgAFUF3rHrkAkzsi
	FT/bhpBYGdbY5uI6J32TnJdhb8lLhWKmJwfSUqAPPo3sz6YN0TEJv8Cyke7nPZggmA//u/ETwCH
	2dPJw6H/kN1k9u0bNDXEx+hOcWY4eOeWgWgaYfuwqN3wAVoK4qPv/zB+LioW1MLUKbRJjUsECr7
	dEtZun7L/HNiECP90827L/5jT6/10tP0pK+LzBCMsq0rAolmWw8WjF9TEafNFviZL+lroUUmtb/
	om63rMw6FLEoxeiMX9rVkX5elGS9txsgSHK7a6Ym5awa5+HU8T1gR2VzHbXYr/ZN+UVbByqoRNw
	Pfac7fEAXh+JDCMpGd4OHbd7Tb4cCKb68PBuelTaf0Azw=
X-Received: by 2002:a05:6a21:6e8f:b0:3bf:866b:b74a with SMTP id adf61e73a8af0-3c0bcb7d8b6mr3121336637.35.1783516644378;
        Wed, 08 Jul 2026 06:17:24 -0700 (PDT)
Received: from localhost.localdomain ([49.207.223.101])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-31174ac14f2sm21692435eec.27.2026.07.08.06.17.18
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Wed, 08 Jul 2026 06:17:22 -0700 (PDT)
From: Biren Pandya <birenpandya@gmail.com>
To: sakari.ailus@linux.intel.com,
	dave.stevenson@raspberrypi.com,
	mchehab@kernel.org,
	linux-media@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: Biren Pandya <birenpandya@gmail.com>
Subject: [PATCH v3] media: i2c: imx219: Drop manual fwnode_handle_put() via scope-based cleanup
Date: Wed,  8 Jul 2026 18:47:12 +0530
Message-ID: <20260708131712.35436-2-birenpandya@gmail.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20260616081517.44685-4-birenpandya@gmail.com>
References: <20260616081517.44685-4-birenpandya@gmail.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.66 / 15.00];
	MID_CONTAINS_FROM(1.00)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_MISSING_CHARSET(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c15:e001:75::/64:c];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_FROM(0.00)[gmail.com];
	FREEMAIL_CC(0.00)[gmail.com];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-66990-lists,linux-media=lfdr.de];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_RECIPIENTS(0.00)[m:sakari.ailus@linux.intel.com,m:dave.stevenson@raspberrypi.com,m:mchehab@kernel.org,m:linux-media@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:birenpandya@gmail.com,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER(0.00)[birenpandya@gmail.com,linux-media@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCPT_COUNT_FIVE(0.00)[6];
	FORGED_SENDER_FORWARDING(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[birenpandya@gmail.com,linux-media@vger.kernel.org];
	DKIM_TRACE(0.00)[gmail.com:+];
	ALIAS_RESOLVED(0.00)[];
	TAGGED_RCPT(0.00)[linux-media];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c15::/32, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	FROM_HAS_DN(0.00)[]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 331AB726C6D

Utilize the __free(fwnode_handle) scoped guard macro from
<linux/cleanup.h> to automate the lifecycle management of the endpoint
fwnode in imx219_check_hwcfg().

This inherently guarantees that the endpoint node is released when it
goes out of scope. Consequently, the manual fwnode_handle_put() call
in the error_out label is no longer needed and has been removed.

Signed-off-by: Biren Pandya <birenpandya@gmail.com>

 v3: picked up Reviewed-by tag.
Reviewed-by: Dave Stevenson <dave.stevenson@raspberrypi.com>
---
 v3: picked up Reviewed-by tag.
---
 drivers/media/i2c/imx219.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/media/i2c/imx219.c b/drivers/media/i2c/imx219.c
index 7da02ce5da154..d76eae880d730 100644
--- a/drivers/media/i2c/imx219.c
+++ b/drivers/media/i2c/imx219.c
@@ -14,6 +14,7 @@
  *
  */
 
+#include <linux/cleanup.h>
 #include <linux/clk.h>
 #include <linux/delay.h>
 #include <linux/gpio/consumer.h>
@@ -1110,7 +1111,7 @@ static int imx219_identify_module(struct imx219 *imx219)
 
 static int imx219_check_hwcfg(struct device *dev, struct imx219 *imx219)
 {
-	struct fwnode_handle *endpoint;
+	struct fwnode_handle *endpoint __free(fwnode_handle) = NULL;
 	struct v4l2_fwnode_endpoint ep_cfg = {
 		.bus_type = V4L2_MBUS_CSI2_DPHY
 	};
@@ -1172,7 +1173,6 @@ static int imx219_check_hwcfg(struct device *dev, struct imx219 *imx219)
 
 error_out:
 	v4l2_fwnode_endpoint_free(&ep_cfg);
-	fwnode_handle_put(endpoint);
 
 	return ret;
 }
-- 
2.50.1 (Apple Git-155)


