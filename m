Return-Path: <linux-media+bounces-29042-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id AB514A762A3
	for <lists+linux-media@lfdr.de>; Mon, 31 Mar 2025 10:44:59 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 4F0271681B4
	for <lists+linux-media@lfdr.de>; Mon, 31 Mar 2025 08:44:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E7CC41DA0E1;
	Mon, 31 Mar 2025 08:44:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="TnwFOV3c"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com [209.85.128.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AAE6A1D90A9;
	Mon, 31 Mar 2025 08:44:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743410685; cv=none; b=fYja0e94QWolP55E2nxOqeIhru3IHCy6qcIog+ic7/i3zWbGdnsHO8gPMxjvZMLTwyRjE8Ax9vqXWLBSS4J7NAUUFfzbu5jdouNRd9dX5oxfDNPybYBhDJTjFQx09fjSbr7kPrxI5s/xbCD0n7oKh1jdmsORORJ06zb1EQ8MXJM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743410685; c=relaxed/simple;
	bh=9Eo5YorzB1znbDgWJg/+008nXJznjveNUK50EHiJXHE=;
	h=From:To:Subject:Date:Message-Id:MIME-Version; b=iGnK8rImtUfqM9cFMSt6C466MLGbeTVvSuyj+s7xUtpbBIKr6cQ9NMtyvk0kcggCy3ubvHcY/Uxyl8JrDqbeC19p2BCh6y6aOCB9e/08Fx/s14Y8yRFqoCJsL7wpSvwgIHQjSiUxCCANQDalcxcZK4Cgd3fnmg6nv26rSD31sIQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=TnwFOV3c; arc=none smtp.client-ip=209.85.128.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wm1-f49.google.com with SMTP id 5b1f17b1804b1-43690d4605dso27324965e9.0;
        Mon, 31 Mar 2025 01:44:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1743410682; x=1744015482; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=7k8QAqyn6gLKSVxlNTUb4WI8Fi44pPrnGBNadeFjOuw=;
        b=TnwFOV3czeyYkaAbmCHzosqb1YAp/+EPKVvN0dHHS+VNO73dKygWRBbS54Lqf3j+Hh
         98PgoNQXnaDavyV6KLg3cJA5T14hptHBDnHFGg5wEBX87Jh8ybeOvvImlRwGlF2B4eDL
         L1rXNvu16mfClxfgk1BfkuyTLG0I2EJiZWWuW9+sX+FRJwE0s2l/lzv3BwDkuGw/DPGH
         9I+TAX94tcwcY0tcrtGNO8RnG5YDmqv3BfqwUIJi9ERUCUMkhTlcrDUNk8q3FN0ZSsuZ
         VXhgfsSpuszbaQG2GdLR38ejD5dY5CHop9tKJSDS27cFWN/P2l9ooSQTLso26vtV4GRl
         0zyg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743410682; x=1744015482;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=7k8QAqyn6gLKSVxlNTUb4WI8Fi44pPrnGBNadeFjOuw=;
        b=OfwwGr0tcr5FN0KxGciH0mx5esDWfFeB4Os6ydeKyDgHn4HVIeLUcf8/uuhxSZ4CUQ
         VEj10RjqPrDGpEPBzTGmmtwJwNNRJ2GnF8kZ+5lm7xmIiWKTFJDRCguYmhjYTtNTQTex
         +h2xA1PGQzObB+ci78FpMW10isRJVrhvjoL/atZf+ekQA/c2f04AbBzp28zAODLTMnil
         4vJYQJWvkfuSNSkSuMaFL/YjVPGg4G8DkVIoVIsH7NYnsVcNjq5rQ4EkW0N1nhSoFclb
         A2Y22G1YhM/bvkbAlk3uUGnaO+SuTlgQ11ggbwBT0P85gfNm7D3pHR2Y2J9BTRt+p9wg
         6d0w==
X-Forwarded-Encrypted: i=1; AJvYcCWX2HZeAgJ9uOp4yPcIcQONVaZY9iJNBwyWVd4ekG27TPO+FM1Vr7Ze1ldFYsMjN5e4pGmnal4aW4larBo=@vger.kernel.org, AJvYcCWmMzOKNnwf1ck9t/WKblIDwY8IVtTJBsFK+aHpJjAeMHaVOZgRGhGNbet823X6qLPoZrxglTxzSBJMQIM=@vger.kernel.org
X-Gm-Message-State: AOJu0YyL8zGcCpPg65B6VKvlspd1ZY9kmQv72btgeEvZR/x0USSQmNns
	JLE+QsLVRIeLzxprmVXauLkwiSJUqqXyQ2p9uROjHz68HjbpuvyneBLPgLXIaEE=
X-Gm-Gg: ASbGncsRk6f0Ale6rjyLU/WBjhYfOFhz+5MwP14sVsyLeT1yzBaW0ozpsyenkE32HAU
	x6zq/An/q40TTNsYhOAlKgkguO7L6tBtkNIRXaNZz1UoGM/QX7moUYXpQv3LQyXRSdulHLCl40Y
	IdkL0/yKmUEYVi13LhBepYoG2+MOwE/IJmcNpCWT4+oWBVIPEuKA1HTeRinTGNQUbgew+DM2fbQ
	LUXvD/StdsPPNWwRh63SkLIO4MwUSqm7Zl2c6AxYEZCX1TkjNla2Y0/iMzqlLJs3QG4d2xgE6gp
	Vh+2WMkueau4ibC2fDaCJgK5ELPqG/K6Pin3yCHexaEJss5tRwPms0+iuv+X
X-Google-Smtp-Source: AGHT+IGqlAOUPlYMNJdvGKhA43+8DFYtcqrURoBfLI0cjmzp73RPTqDXDf90ynGOUdQDFxYR3VTfYw==
X-Received: by 2002:a05:600c:3b9d:b0:43d:7588:6699 with SMTP id 5b1f17b1804b1-43db6221b07mr57375675e9.7.1743410681820;
        Mon, 31 Mar 2025 01:44:41 -0700 (PDT)
Received: from toolbox.. ([87.200.95.144])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-43d8fbc12bbsm114834015e9.13.2025.03.31.01.44.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 31 Mar 2025 01:44:41 -0700 (PDT)
From: Christian Hewitt <christianshewitt@gmail.com>
To: Mauro Carvalho Chehab <mchehab@kernel.org>,
	Peter Rosin <peda@axentia.se>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	=?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>,
	Heiner Kallweit <hkallweit1@gmail.com>,
	Wolfram Sang <wsa+renesas@sang-engineering.com>,
	linux-media@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2] media: si2168: increase cmd execution timeout value
Date: Mon, 31 Mar 2025 08:44:37 +0000
Message-Id: <20250331084437.3974648-1-christianshewitt@gmail.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Testing with a MyGica T230C v2 USB device (0572:c68a) shows occasional
cmd timeouts that cause Tvheadend services to fail:

Jan 28 12:23:46.788180 LibreELEC kernel: si2168 1-0060: cmd execution took 0 ms
Jan 28 12:23:46.790799 LibreELEC kernel: si2168 1-0060: cmd execution took 0 ms
Jan 28 12:23:46.878158 LibreELEC kernel: si2168 1-0060: cmd execution took 80 ms
Jan 28 12:23:46.879158 LibreELEC kernel: si2168 1-0060: failed=-110
Jan 28 12:23:46.879908 LibreELEC kernel: si2168 1-0060: failed=-110
Jan 28 12:23:46.948234 LibreELEC kernel: si2168 1-0060: cmd execution took 60 ms
Jan 28 12:23:46.949121 LibreELEC kernel: si2168 1-0060: cmd execution took 0 ms
Jan 28 12:23:46.949940 LibreELEC kernel: si2168 1-0060: cmd execution took 10 ms
..
Jan 28 12:23:57.457216 LibreELEC tvheadend[3126]: subscription: 009B: service instance is bad, reason: No input detected
Jan 28 12:23:57.457392 LibreELEC tvheadend[3126]: linuxdvb: Silicon Labs Si2168 #0 : DVB-T #0 - stopping 778MHz in DVB-T Network
..
Jan 28 12:23:57.457584 LibreELEC tvheadend[3126]: subscription: 009B: No input source available for subscription "127.0.0.1 [ | Kodi Media Center ]" to channel "XXXXXXX"

The original timeout of 50ms was extended to 70ms in commit 551c33e729f6
("[media] Si2168: increase timeout to fix firmware loading") but testing
shows there are other demux commands that take longer. The largest value
observed from user reports/logs is 150ms so increase timeout to 200ms.

Signed-off-by: Christian Hewitt <christianshewitt@gmail.com>
Reviewed-by: Wolfram Sang <wsa+renesas@sang-engineering.com>
---
Changes from v1 [0]:
- Rename TIMEOUT to CMD_TIMEOUT and move below #include
- Add Wolfram's review tag

[0] https://patchwork.linuxtv.org/project/linux-media/patch/20250331075838.3444332-1-christianshewitt@gmail.com/

 drivers/media/dvb-frontends/si2168.c | 7 ++++---
 1 file changed, 4 insertions(+), 3 deletions(-)

diff --git a/drivers/media/dvb-frontends/si2168.c b/drivers/media/dvb-frontends/si2168.c
index d6b6b8bc7d4e..843f1e01318e 100644
--- a/drivers/media/dvb-frontends/si2168.c
+++ b/drivers/media/dvb-frontends/si2168.c
@@ -9,6 +9,8 @@
 
 #include "si2168_priv.h"
 
+#define CMD_TIMEOUT 200
+
 static const struct dvb_frontend_ops si2168_ops;
 
 static void cmd_init(struct si2168_cmd *cmd, const u8 *buf, int wlen, int rlen)
@@ -40,8 +42,7 @@ static int si2168_cmd_execute(struct i2c_client *client, struct si2168_cmd *cmd)
 
 	if (cmd->rlen) {
 		/* wait cmd execution terminate */
-		#define TIMEOUT 70
-		timeout = jiffies + msecs_to_jiffies(TIMEOUT);
+		timeout = jiffies + msecs_to_jiffies(CMD_TIMEOUT);
 		while (!time_after(jiffies, timeout)) {
 			ret = i2c_master_recv(client, cmd->args, cmd->rlen);
 			if (ret < 0) {
@@ -58,7 +59,7 @@ static int si2168_cmd_execute(struct i2c_client *client, struct si2168_cmd *cmd)
 
 		dev_dbg(&client->dev, "cmd execution took %d ms\n",
 				jiffies_to_msecs(jiffies) -
-				(jiffies_to_msecs(timeout) - TIMEOUT));
+				(jiffies_to_msecs(timeout) - CMD_TIMEOUT));
 
 		/* error bit set? */
 		if ((cmd->args[0] >> 6) & 0x01) {
-- 
2.34.1


