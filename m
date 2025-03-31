Return-Path: <linux-media+bounces-29027-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 06120A760B4
	for <lists+linux-media@lfdr.de>; Mon, 31 Mar 2025 09:58:54 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 97A37165961
	for <lists+linux-media@lfdr.de>; Mon, 31 Mar 2025 07:58:52 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0E4781CB332;
	Mon, 31 Mar 2025 07:58:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="nSYYpCpQ"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com [209.85.128.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D109A1C84A0;
	Mon, 31 Mar 2025 07:58:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743407926; cv=none; b=YpcUACjDf5RGiVtZjHeZguGNPDT6Bs+8ZTxEIxi2u9evA3stQN+UcRG36RKRovcgwh1O7tHkGwTd6FOiO0iy5DltV19BDWzoWywcqQ8uKNLbWrkg+jYreYH/gSVrviD6KacBH5r9W07v2x4GIIspiKhQUpoxHYBx7TaHpzOOG64=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743407926; c=relaxed/simple;
	bh=XnzAdSRQuHuJwfASkkk3RWQW605lGda6INJNdpYRs8U=;
	h=From:To:Subject:Date:Message-Id:MIME-Version; b=UzayZOr6q+OnQLelMDVd8czv5UbquoiKajpRQtK4EmmTp6Zsg+E2WeeWH9QjUBWU/5wtI2wB/19aIpf1P49Sd1KXNkkumrupjmlhr18RzsZS3TtHUz47UhFNZudHHmF/dR45b4BPF/mPXTAMaNeVJB9O4+6gSraIYxC55QBpdN0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=nSYYpCpQ; arc=none smtp.client-ip=209.85.128.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wm1-f45.google.com with SMTP id 5b1f17b1804b1-43ce71582e9so28718785e9.1;
        Mon, 31 Mar 2025 00:58:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1743407923; x=1744012723; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=uA+2+ftLuYcBz0B2X8qq5rF46ss7ra5qSUVAtXRoW+4=;
        b=nSYYpCpQxS1SvlxWYCUEK2apSEIXbDbIxXTZ793FnuMj12qJk9SraQ5OSUuntUCSQi
         tL/alRrD0bzOE/mZwtx6aTcwPpWd1pU9Bz+hMRbC39HA2S9HBCSSbRwv3O3KBmoV1blL
         x3VKSXqxw1VPzuSqrslyBFrjB9HRnO4yYpPqm0+jBNmM1m506G+rjQxI7MZlzRURh3XR
         H+TvPFezO1/A3bHB8lzcCFofMZCp64IKtydazZHrH33NGcXban0Hx9G4OkufB2QuWn+o
         QR0/Ryh9cvBF9w/a8pAPBywo+lXOTzbpK4T02fI3YkvqGwnyt0Yur7HMwQ37idC+Y9c3
         Qbhw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743407923; x=1744012723;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=uA+2+ftLuYcBz0B2X8qq5rF46ss7ra5qSUVAtXRoW+4=;
        b=uPmrk5YX/cW2MTGTouHQEJo6L1Z0DzSSw3ugwjhoPaUSAVWAGK0ZNgDGZFdDyseseR
         rxMtuxKYaNDKhjYe8TDTz3ujv8ZzXTlbhtMyRNUJN/YA2MznJRyekHGU00YD2Pec8qvh
         hoaW0Vcr6ES0g81+QWKlKJ8TizPes6BqA0MPMOLjCDsxtB6R37iq2GSDHxrzWYRZX2vP
         zHWmoShw1Q8s110WKhOU6FXBuLTuu4hBIBc03sj+//UcWt+6pOkois5wPGYh5lXXn2jT
         OzkDZPo1CLkpyKB+vvtRlUlU/J9ApGjZQ2iIcegMDc8hJHC++C0c7PY820V6GMahGovW
         Wccg==
X-Forwarded-Encrypted: i=1; AJvYcCUH4CsSdVno6J82ERPk2Cy5QNE65t9iHnrUO2hot4RxRgWjpzQuvjdMGgOEPTp/8twpX/J+Fq1BUMCcqCk=@vger.kernel.org, AJvYcCXYGA1/LB54p8v6SnpLbiF8K3+hOgJMizAOs9tO7Uj4mzWkKSNzbASBoqoRt7Lh6+dFkB9pDpbfFFIoSHo=@vger.kernel.org
X-Gm-Message-State: AOJu0YyMjvwGYlDVCBI9chB8oyMzSmGvjctjOIG9VpvbciD2JVJQWRoR
	IEFAZDg6upubQHsPnduRGOjVji/iZYdiZ3JWtggdTWOykaI/jDfP
X-Gm-Gg: ASbGncsJFer95Kl+9AIOp5TsjzDvILKhhCY8eBMU9cevqyM7iZ32rJfmDHnWAVGuB5A
	jsyLgNEMUGNYe8KyQZJRMHn3PdNsj6qOm6xmkc2tl3dvoj3aioUCrEnKjUKu1yyXtWWS7JKE88z
	y/Q/BjBintuxmRbV8B5pGPzUjmdqTOd15C+RuAnq3FPKN/G4A4O+5h5zr0N7Z5Y41Fsgc97Qu7D
	MISENRvJQ8Wm+sCJ9d8A8qPdX8tJVWTuNOrAplQASVesGfvsWyVbZNhGBIt18tn0esg4zF4m4Pr
	ggWfIfYd6ip3U+cSjUDVSO1FOGKfQ2qCyyFtJHUTxS7HkAWgmF8uBybLnl/1
X-Google-Smtp-Source: AGHT+IFCjMnjcquLTbCSRhZuk4WG2LTSaewncOnXMmq2rb/6tFtrEELLWc3AYyd5q77LiashXtMXaQ==
X-Received: by 2002:a05:600c:1d16:b0:43d:82c:2b11 with SMTP id 5b1f17b1804b1-43db628b955mr61979405e9.23.1743407922735;
        Mon, 31 Mar 2025 00:58:42 -0700 (PDT)
Received: from toolbox.. ([87.200.95.144])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-43d8fba3ef1sm117707945e9.2.2025.03.31.00.58.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 31 Mar 2025 00:58:42 -0700 (PDT)
From: Christian Hewitt <christianshewitt@gmail.com>
To: Mauro Carvalho Chehab <mchehab@kernel.org>,
	Peter Rosin <peda@axentia.se>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	=?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>,
	Heiner Kallweit <hkallweit1@gmail.com>,
	Wolfram Sang <wsa+renesas@sang-engineering.com>,
	linux-media@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] media: si2168: increase cmd execution timeout value
Date: Mon, 31 Mar 2025 07:58:38 +0000
Message-Id: <20250331075838.3444332-1-christianshewitt@gmail.com>
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
---
 drivers/media/dvb-frontends/si2168.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/media/dvb-frontends/si2168.c b/drivers/media/dvb-frontends/si2168.c
index d6b6b8bc7d4e..557e6228ffe8 100644
--- a/drivers/media/dvb-frontends/si2168.c
+++ b/drivers/media/dvb-frontends/si2168.c
@@ -40,7 +40,7 @@ static int si2168_cmd_execute(struct i2c_client *client, struct si2168_cmd *cmd)
 
 	if (cmd->rlen) {
 		/* wait cmd execution terminate */
-		#define TIMEOUT 70
+		#define TIMEOUT 200
 		timeout = jiffies + msecs_to_jiffies(TIMEOUT);
 		while (!time_after(jiffies, timeout)) {
 			ret = i2c_master_recv(client, cmd->args, cmd->rlen);
-- 
2.34.1


