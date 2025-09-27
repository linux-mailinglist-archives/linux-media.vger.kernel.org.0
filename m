Return-Path: <linux-media+bounces-43284-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 90AD1BA5EBD
	for <lists+linux-media@lfdr.de>; Sat, 27 Sep 2025 14:17:17 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 3DEF917DCAF
	for <lists+linux-media@lfdr.de>; Sat, 27 Sep 2025 12:17:17 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 38E6A2BE05E;
	Sat, 27 Sep 2025 12:17:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="TEtpz2ng"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com [209.85.128.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E2E0819EEC2
	for <linux-media@vger.kernel.org>; Sat, 27 Sep 2025 12:17:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758975428; cv=none; b=FiaKDHEErmRHErGDCyhIYUG7ULy7n+AZFvTFdhmm3WDgBg591MnmMEpWkGZcD3JOFyWYFFRTrOv+2BV+5xaFuWgnJmqZhd0m4L2L/w5YUq2zfsbKAYpGjB8pfm9f0O8qfp84gV4CmS5eoS8ogNKID47NvwY9fqEJV4KzCEZcBEM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758975428; c=relaxed/simple;
	bh=KUCC2p1XDN1zncgpTvWkeyj2061JKPwHdPb/zZAruJs=;
	h=From:To:Subject:Date:Message-Id:MIME-Version; b=arTJoPPoHqpuYcctg5E/ezGsbad7IV+FvT4K9jFNcXixnFt30jt7zlrHUYY73WNMXxy7vd0uTq4D7dxo3DzMUlsZ/swMaFsLb9//MyyHcpGC9iReCVvVh8Qel7y9sSWNn62jRKZitqtydxEwEgxNhvpAagmv5zEqfX5NFX1MJhg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=TEtpz2ng; arc=none smtp.client-ip=209.85.128.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wm1-f46.google.com with SMTP id 5b1f17b1804b1-46e491a5b96so1865525e9.2
        for <linux-media@vger.kernel.org>; Sat, 27 Sep 2025 05:17:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1758975425; x=1759580225; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=Ag70dVUuM+4MRKMykXD7Nz1Gn1OJGnCoNyvf+OVQVG4=;
        b=TEtpz2ngbL+ZhtFIcULDjr2r+XlitJSgSbuzvR7EHkiFJqTCYz3u/17MB7mPJ3T+MG
         FcbEF0uIfBbBADj7KldS+ltjvRymLdX0e8ELCPjd23uP5GgvmWhvpUXBefACN6USVGQ5
         lfLbEAldiJUBbPub4WGzkfaZkqp6YtFrDf6i3ShmFMvOp4Q6YClajnIg22wTkq6rC32y
         PrXgOYPL2ge1aYDlJMKcSD6qX2Dv/XyDSnNrhLX/PudqZqYfiJzerYFQBQHbCZd+gzcq
         LXuuZE/Frkf23O1XTiEO/ECjkQ5p+An55eavTjJj5nGmJvLNczU46ka6fFJezfgTp/g3
         wfhw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758975425; x=1759580225;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Ag70dVUuM+4MRKMykXD7Nz1Gn1OJGnCoNyvf+OVQVG4=;
        b=AOcloSIkJLTY2lUbiJZuE7e74bSBFoPWZyMykEENFCyiyNafo+AxE3yJ7QWwdm58qn
         TaSo2HTCQfRcCb/Nc1KvYiLNLIibNJQCgehb9OayakfmVvjYfM9n6hl5yD3+PMBYl6gq
         b14EX9zOvnfSx7EnKzEJLvb1Oe3Aldgaft9rWd1CF2dXYGNWnwByBLosRp0VOY3xHM3P
         ha12VMc8zmKPLxkOmXRap6LbpGC9l5f/jZy15R+2pCS0b//0tl2FyWLmOsX7qGTmIORo
         X+l8GfwYcj+Po8xPi8/ifnyev9kf9q4RWkJIR9sFRPZyPjsrqsHt33TrZJD7rIbAK3a2
         jYAw==
X-Forwarded-Encrypted: i=1; AJvYcCVJ726J2E8qcFQbagl0bHQXlxAC3ZVIK0PC3UB7yi+Rr1INzHIcFqdD+0cEHraz6Se+YJ+ywGCZoKaJWQ==@vger.kernel.org
X-Gm-Message-State: AOJu0Yy+xPtE6mFoUVYH+DjyW2gCISc9W6fV32DdytX2XlM2FG2rzryt
	4B2NDLZWy+6smPkaRIMgLgOHVpStLA3U+l49sf3ZrE4vK7A2MQhKgXsT
X-Gm-Gg: ASbGncuw7W0ohtNY9ogU5LChw67hSlGzdWhURR2UBl6eWUYyDimyphaU4P1QnwZauyk
	DdAfpV3u6ni8wYnwqak4ePqgomzfoTbrv7i3dAp+cWJUdTj4DaIJRmF0ltF8teYXYl+AxQ223IV
	VlvkBhG8m4qHnEHAPWrPJkQ9GSb+CnqXEOLMFo/DBFZ7zSBWe9CHxffj7CgKplkboLnFYy9ynLq
	FD8X0EWlmWxXqMWsrCM/lw8GdRT8/rfVYsLvXYnEAIkZ7Ydl/Twb71k5zkjHLhLtwhMk2fmIu0A
	jjDXdvaoQY/wy/m8t/pAvfi2oZD9MMlTXweKs6fsdU2JkLmiYASAlmqqD9qlozanBuLuIInLn1F
	bKvUEtJb3SpGH0s0dNci/uMzcJH8=
X-Google-Smtp-Source: AGHT+IH6lB3PD/SmhSAHcJeYKh0+HMGcpi08kyP8CuF+lmCwJGwyblmxw8T4gNgHLlKgwb9ALTb5Nw==
X-Received: by 2002:a05:600c:8418:b0:46e:39e1:fc27 with SMTP id 5b1f17b1804b1-46e39e1fd05mr62543715e9.5.1758975424931;
        Sat, 27 Sep 2025 05:17:04 -0700 (PDT)
Received: from toolbox.. ([87.200.95.144])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-46e2ab7d4e3sm152435835e9.23.2025.09.27.05.17.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 27 Sep 2025 05:17:04 -0700 (PDT)
From: Christian Hewitt <christianshewitt@gmail.com>
To: Mauro Carvalho Chehab <mchehab@kernel.org>,
	Wolfram Sang <wsa+renesas@sang-engineering.com>,
	linux-media@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v3] media: si2168: increase cmd execution timeout value
Date: Sat, 27 Sep 2025 12:17:01 +0000
Message-Id: <20250927121701.591576-1-christianshewitt@gmail.com>
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

Jan 28 12:23:46.788180 kernel: si2168 1-0060: cmd execution took 0 ms
Jan 28 12:23:46.790799 kernel: si2168 1-0060: cmd execution took 0 ms
Jan 28 12:23:46.878158 kernel: si2168 1-0060: cmd execution took 80 ms
Jan 28 12:23:46.879158 kernel: si2168 1-0060: failed=-110
Jan 28 12:23:46.879908 kernel: si2168 1-0060: failed=-110
Jan 28 12:23:46.948234 kernel: si2168 1-0060: cmd execution took 60 ms
Jan 28 12:23:46.949121 kernel: si2168 1-0060: cmd execution took 0 ms
Jan 28 12:23:46.949940 kernel: si2168 1-0060: cmd execution took 10 ms
..
Jan 28 12:23:57.457216 tvheadend[3126]: subscription: 009B: service
instance is bad, reason: No input detected
Jan 28 12:23:57.457392 tvheadend[3126]: linuxdvb: Silicon Labs Si2168 #0
DVB-T #0 - stopping 778MHz in DVB-T Network
..
Jan 28 12:23:57.457584 tvheadend[3126]: subscription: 009B: No input
source available for subscription "127.0.0.1 [ | Kodi Media Centre]"
to channel "XXXXXXX"

The original timeout of 50ms was extended to 70ms in commit 551c33e729f6
("[media] Si2168: increase timeout to fix firmware loading") but testing
shows there are other demux commands that take longer. The largest value
observed from user reports/logs is 150ms so increase timeout to 200ms.

Signed-off-by: Christian Hewitt <christianshewitt@gmail.com>
Reviewed-by: Wolfram Sang <wsa+renesas@sang-engineering.com>
---
Changes from v2 [1]:
- Wrap lines in the patch description to 80 chars
Changes from v1 [0]:
- Rename TIMEOUT to CMD_TIMEOUT and move below #include
- Add Wolfram's review tag

[0] https://patchwork.linuxtv.org/project/linux-media/patch/20250331075838.3444332-1-christianshewitt@gmail.com/
[1] https://patchwork.linuxtv.org/project/linux-media/patch/20250331084437.3974648-1-christianshewitt@gmail.com/

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


