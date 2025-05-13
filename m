Return-Path: <linux-media+bounces-32391-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id A3CBFAB56C2
	for <lists+linux-media@lfdr.de>; Tue, 13 May 2025 16:10:56 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 4CB101B4482C
	for <lists+linux-media@lfdr.de>; Tue, 13 May 2025 14:11:09 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 16A5C2BCF53;
	Tue, 13 May 2025 14:10:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=googlemail.com header.i=@googlemail.com header.b="GyodLOxG"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-ej1-f53.google.com (mail-ej1-f53.google.com [209.85.218.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CA13B38DD1
	for <linux-media@vger.kernel.org>; Tue, 13 May 2025 14:10:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747145452; cv=none; b=i9cXopKlaoG3TOgQWOaVoe263C2QDfEA8fzMA6wAUe8yIBatHBcNfF/qz9mIypzlDRVnK2s6ohv006g3oNfAShM0h74E0wKk1f2/UWNiqLb8itdbq5spW1YQn5fnpAAGXOs/CQu4sTYTwYryq7oOvkLhAMH86ByKinazwhoj7cA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747145452; c=relaxed/simple;
	bh=p3vGfaPDYIXcSPJ5wVPpBY6lDvCpUaHlAguBbfMTAgo=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=Ic2p7YumREtXyd+pLiCxzbBHDkTVhe+c8dACqdKbrFrPVh/3peuESyTdH5mP5nxGDby4iO8KCAq9UVt/vRyYkmFkKaz6nAZFlIJyARZCZK7uxOTp5RAhrL1AGnbvfViblopTaC32K46PnHv7FqnM1mXnrZcLmk7PgFy3SwVlcnU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=googlemail.com; spf=pass smtp.mailfrom=googlemail.com; dkim=pass (2048-bit key) header.d=googlemail.com header.i=@googlemail.com header.b=GyodLOxG; arc=none smtp.client-ip=209.85.218.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=googlemail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=googlemail.com
Received: by mail-ej1-f53.google.com with SMTP id a640c23a62f3a-ad1f6aa2f84so1192162366b.0
        for <linux-media@vger.kernel.org>; Tue, 13 May 2025 07:10:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlemail.com; s=20230601; t=1747145449; x=1747750249; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=DIImEs7KtaUI6DBlTQOZcUEPCDNjkX0zWHbAHnNWpCo=;
        b=GyodLOxG1XDBFOzJL9NskxKZ8i+5SAsG/2J/JsXMbkkrrocWvzFCCuRsJagwd59yxl
         RNerDsRY+hxlP72MVBFFlLBHucHi9+uwP2H0qvm2DkzVb09tWasrxVsg/ya0iGIA0UQq
         jLla0PPCRoPmRZXRmI1p0hHzSoaOyRZcOkUXOL+3hnhWfFgJl8eq3Xw3AplDy1ekUlUK
         mdeLWIqvRnJzS4z8ImdEMCiiPtgKpKdYbwcwPXwMEjHHNh08XCAfqcSPstjEMGyaP3Ez
         qABYjJ2TPe5M8e2AIcILR5Nmn8yR/PTPWfjTpUCG+fCVl/k6b6I94eYuKe7X0twiaLMb
         3Yfg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747145449; x=1747750249;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=DIImEs7KtaUI6DBlTQOZcUEPCDNjkX0zWHbAHnNWpCo=;
        b=O5z5WM59XVnKZqzp7JfTU6T4Ve/INAHhaHYlQN2/8Uee+B9K00+hcquFa+wdPUv35t
         lGc5pomSrOXRmJovIhMgbuFdJrBEBHBtjs5oyEDvIBZjWdM7wZgl4jdLxrwsqiW9vbbL
         gOwSeK0rNaV4GSMM2XzvWJXIBy27Fz3GQxB2nLY57CTT9No2GWqeF4sIoXoX1ZiVLtXL
         GIFLj4Qfq0tU4LYNahBkckMb8jRd8TMOodq2DveL08DVtsqrsCLD/Jnqtw+dfRZISzJm
         s7Z9Hf24yuWym7OHvTet8yCw/uKzuJX0CVHdHp/sx+0Z9a+lw9gzL8wiah7ajxliBg/g
         ybgQ==
X-Gm-Message-State: AOJu0YzZOBpI2yLxu3Mm3TVy55r0pq19AbliNvSj4oJD8ybDuCHw/hQO
	1vZ73gILpRQVTUrwWy+47KpDdLP2Hb1FsvT+wrCZ6VSFQtXD+4ooDaHwogC6DrlJFA==
X-Gm-Gg: ASbGnctBmeL0BjwBW3uE3Dh5haCOIVekCt3Dhzeg5Zve8s7emhQsurZ8A92cbVXlG6g
	vMTL2s/ODSYnwQqHzydJfTpHWsyQsgcxxRs5eTzSsg0V0tsR9jPaO9ZL4/vWXppH2LOIhYijN6H
	FMEiaaktyiw9QxKvEun1KYIZDpatSzhxUrphY34vo9pr9kHeD/X8jxY5vHv+un+aCSsOdFYt9bS
	bmNN30yZXAjRwF3QxVvMRS6qsLxQc9o45vWMo9LyvN1ODSksg/WUNqHyWzlzp3d4Nqn3GNCPceT
	NXwgRH9qdnc3DbgBvSQpPNukCrFOCOLTfbHgWY46r+xXPBOaBDJzkWA+f7zPyw==
X-Google-Smtp-Source: AGHT+IGZ+quGobqZ5py43C6o6X+7T322qJCm+nurqvRcmISSQwrH6kHBo0ksGE0YdFGHg9W1PZ8ZjQ==
X-Received: by 2002:a17:907:1ca8:b0:acf:dca5:80f7 with SMTP id a640c23a62f3a-ad4d52be77dmr358947366b.26.1747145448809;
        Tue, 13 May 2025 07:10:48 -0700 (PDT)
Received: from avt74j0.fritz.box ([2a02:8109:8617:d700:5ee9:d8ef:8f7d:d924])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ad2192c8f98sm800022466b.10.2025.05.13.07.10.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 13 May 2025 07:10:48 -0700 (PDT)
From: mhecht73@googlemail.com
X-Google-Original-From: mhecht73@gmail.com
To: linux-media@vger.kernel.org
Cc: sakari.ailus@linux.intel.com,
	tomm.merciai@gmail.com,
	martin.hecht@avnet.com,
	Martin Hecht <mhecht73@gmail.com>
Subject: [PATCH] media: i2c: alvium: Accelerated alvium_set_power
Date: Tue, 13 May 2025 16:10:20 +0200
Message-ID: <20250513141019.3871882-2-mhecht73@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Martin Hecht <mhecht73@gmail.com>

Now alvium_set_power tests if Alvium is up and running already instead
of waiting for the period of a full reboot. This safes about 7 seconds
delay for each connected and already booted camera especially when
using multiple Alvium cameras.

Signed-off-by: Martin Hecht <mhecht73@gmail.com>
---
 drivers/media/i2c/alvium-csi2.c | 21 +++++++++++++++++++--
 1 file changed, 19 insertions(+), 2 deletions(-)

diff --git a/drivers/media/i2c/alvium-csi2.c b/drivers/media/i2c/alvium-csi2.c
index 05b708bd0a64..c7d39b10d1a2 100644
--- a/drivers/media/i2c/alvium-csi2.c
+++ b/drivers/media/i2c/alvium-csi2.c
@@ -2367,6 +2367,9 @@ static int alvium_get_dt_data(struct alvium_dev *alvium)
 static int alvium_set_power(struct alvium_dev *alvium, bool on)
 {
 	int ret;
+	int alvium_boot_time_timout = 7000;
+	const int alvium_poll_interval = 500;
+	u64 val = 0;
 
 	if (!on)
 		return regulator_disable(alvium->reg_vcc);
@@ -2375,8 +2378,22 @@ static int alvium_set_power(struct alvium_dev *alvium, bool on)
 	if (ret)
 		return ret;
 
-	/* alvium boot time 7s */
-	msleep(7000);
+	/* alvium boot time is less than 7s, but eventually it's already on */
+	do {
+		alvium_read(alvium, REG_BCRM_HEARTBEAT_RW, &val, &ret);
+		if (ret >= 0)
+			break;
+
+		msleep(alvium_poll_interval);
+		alvium_boot_time_timout -= alvium_poll_interval;
+	} while (alvium_boot_time_timout > 0);
+
+	if (ret < 0)
+		return ret;
+
+	if (alvium_boot_time_timout <= 0)
+		return -ETIMEDOUT;
+
 	return 0;
 }
 
-- 
2.43.0


