Return-Path: <linux-media+bounces-38290-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 9A431B0FB36
	for <lists+linux-media@lfdr.de>; Wed, 23 Jul 2025 21:57:55 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 929031CC1E01
	for <lists+linux-media@lfdr.de>; Wed, 23 Jul 2025 19:58:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C73FD230BFF;
	Wed, 23 Jul 2025 19:57:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="DEG8ct1W"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-pj1-f45.google.com (mail-pj1-f45.google.com [209.85.216.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D5C7C1A23A0
	for <linux-media@vger.kernel.org>; Wed, 23 Jul 2025 19:57:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753300668; cv=none; b=bRhU6DvbZFnABnmbvqM2HMZx/Otf9xlOqN1JKlNADlzXn5ocz2buAPyYZELREmH2qpeea3HtzUh5YeKxt3ibaglusnbAyLH5iQ4mwSH2auEI2qGXy9msDMyZaGctPSo5N/YsE6Nmy50VYvmzIRtLcvLxxLt/UimMVJhU8F6zpqg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753300668; c=relaxed/simple;
	bh=FVSyqqgqEq4MnbN1AK5ppWWETHgof3UqLFecD42QwMI=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=YIj+e+tlCP3IDRIce11SoTY+nzPZFZEOPdIsQOWOvuUDJw9Nc5DQB7g5leIs8Qf96DdVgaYJ8ewJgSN7un3PrH3BQwN3Bp/hob+DZKEo1An8W9BRKyRD/e6LPUbrkEBgwIyqTCweLq+GsmqEhGqrvWnhLBQqrHiEsHVU780IYGo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=DEG8ct1W; arc=none smtp.client-ip=209.85.216.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Received: by mail-pj1-f45.google.com with SMTP id 98e67ed59e1d1-313a188174fso1107812a91.1
        for <linux-media@vger.kernel.org>; Wed, 23 Jul 2025 12:57:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1753300666; x=1753905466; darn=vger.kernel.org;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:from:to:cc:subject:date:message-id:reply-to;
        bh=/DG2m9HOzWXxFr0mPV6O/7kOINoRfxN8n3jHURo/ORo=;
        b=DEG8ct1WATN5BwkWQIXgcWqP6ciIk034NbYWzPusn72yEkYoms4aCtNMDMF3B4AOm6
         2DZP5IlmWNnNX0Zn+QNPC+F1O1ObGov/9wbs9lGLJAp673em5+w3xfik9w6wK8TU49qq
         GAoQAYo4OhYrTzag8rTymSeLXkSNehTPjnWTw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753300666; x=1753905466;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=/DG2m9HOzWXxFr0mPV6O/7kOINoRfxN8n3jHURo/ORo=;
        b=k+ud/50Dgxf14hRmJOGxqEVM8fap3okUMdc8YtN+8vMSvyxmlKug8Wbz0102eaZxLr
         1QzU0Niqehby2CWBMrYlLHDgm8uUvNxGiwBDilAisf89mam0ikg3Gl/7TYQydWSMF08Y
         4d1BzIgrjdotLahLmhxsawkBJM78lNjfkKDFGzuE4eTIKhd5Z1OpxzyWU7qbZrD00tX8
         GOmRJcs/OHt7ryBXDtosFmiQF8xa04xBM4fypURkO7sckDv+YfVcL4VAjUAD/mEtJIxQ
         0qVMS1mneXjaVu1G1wZvW0jcYgJNfVpfH4DcqZjg88H8lokV9nGwZ592aLQ77GzuUfKi
         Qyuw==
X-Gm-Message-State: AOJu0Yx0guu5ZU5zCAAkhBNzO1N6PDuKSexFpyXZU4VU8JyKz3EF1bgC
	Y+x1ycjtSjh4sqlpoQBd51HfM8Brg4qQVkfpeiKM5qn2RNFkvSQc8h1+740iJT+g6g==
X-Gm-Gg: ASbGnctlVgdlr9T7SYBeLDUl66qBRjep3IjofhWGpvifJ5pylcwk4BjqJxwhTaiDaq2
	jT5/S0loAtPLn9TXVzbAgcDJjPqsuw/YJ41m8kN7/rJpnSQFjWDFsmjX4c+xzVCSoJZu0x48fAW
	aV26/FUZG10HBYoIBt7NjbbiBtxT+z4BlIynbx6dxdsT7e3vP2lOsfCdQVPZQbroCRWP9hzoxjm
	s+k+Yja6LHqcy42vBrLwt5JcGmtbi5xWRMHyi6mG61nFa60WWxIXLtIHgWHi5617tZpkQJjsEDq
	Sw3BxGgWFXEN8TtEVGXUtQrd1JKkzbuqtKkwRhorA35WIMvsi/1AGVDZBUk3pRYTPiXGU5mxJcI
	HdPs84pttf5pkfnE4i7QWtDZkh24wuy85aQgHRlB02hUg2T4=
X-Google-Smtp-Source: AGHT+IFkLaseT4J9N1a2WehClVWhl7WlueTj40zlFze3K+qatH6eNoY69q9GmgP0Dhp8ElHdTx56HQ==
X-Received: by 2002:a17:90b:2709:b0:311:a5ab:3d47 with SMTP id 98e67ed59e1d1-31e5130f700mr4952881a91.1.1753300666086;
        Wed, 23 Jul 2025 12:57:46 -0700 (PDT)
Received: from ballway23.roam.corp.google.com ([136.27.48.153])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-31e519b1494sm2297587a91.4.2025.07.23.12.57.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 23 Jul 2025 12:57:44 -0700 (PDT)
From: Allen Ballway <ballway@chromium.org>
Date: Wed, 23 Jul 2025 12:57:35 -0700
Subject: [PATCH v2] media: ov8865: move mode_configure out of
 state_configure
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250723-mode_configure-v2-1-7fb0f6ba1194@chromium.org>
X-B4-Tracking: v=1; b=H4sIAK8+gWgC/3XMQQrCMBCF4auUWRtJUoLFlfeQIjWZtLNoRyZtU
 Erubuze5f/gfTskFMIE12YHwUyJeKlhTw34aVhGVBRqg9XW6Yu1auaAD89LpHETVJ022sVn6Fo
 XoJ5egpHeB3jva0+UVpbP4WfzW/9S2SijHA6t084O2sSbn4Rn2uYzywh9KeULhblnxa8AAAA=
X-Change-ID: 20250722-mode_configure-80105fbd835d
To: Hans de Goede <hansg@kernel.org>, 
 Sakari Ailus <sakari.ailus@linux.intel.com>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>, 
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc: linux-media@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Allen Ballway <ballway@chromium.org>
X-Mailer: b4 0.14.2

ov8865_mode_configure() only needs to be called on sensor init, but it can
be called multiple times from ov8865_state_configure(). Move
ov8865_mode_configure() to ov8865_sensor_init().

Signed-off-by: Allen Ballway <ballway@chromium.org>
---
Changes in v2:
Cleaned up coding style
Removed call to ov8865_state_configure() from ov8865_sensor_init()
---
 drivers/media/i2c/ov8865.c | 14 +++-----------
 1 file changed, 3 insertions(+), 11 deletions(-)

diff --git a/drivers/media/i2c/ov8865.c b/drivers/media/i2c/ov8865.c
index 95ffe7536aa6aba814f4e5c3d12e7279470b2f07..eaa84fe68bdef45961885f435df99d98eb0ac0ca 100644
--- a/drivers/media/i2c/ov8865.c
+++ b/drivers/media/i2c/ov8865.c
@@ -2304,14 +2304,6 @@ static int ov8865_state_configure(struct ov8865_sensor *sensor,
 	if (sensor->state.streaming)
 		return -EBUSY;
 
-	/* State will be configured at first power on otherwise. */
-	if (pm_runtime_enabled(sensor->dev) &&
-	    !pm_runtime_suspended(sensor->dev)) {
-		ret = ov8865_mode_configure(sensor, mode, mbus_code);
-		if (ret)
-			return ret;
-	}
-
 	ret = ov8865_state_mipi_configure(sensor, mode, mbus_code);
 	if (ret)
 		return ret;
@@ -2384,10 +2376,10 @@ static int ov8865_sensor_init(struct ov8865_sensor *sensor)
 	}
 
 	/* Configure current mode. */
-	ret = ov8865_state_configure(sensor, sensor->state.mode,
-				     sensor->state.mbus_code);
+	ret = ov8865_mode_configure(sensor, sensor->state.mode,
+				    sensor->state.mbus_code);
 	if (ret) {
-		dev_err(sensor->dev, "failed to configure state\n");
+		dev_err(sensor->dev, "failed to configure mode\n");
 		return ret;
 	}
 

---
base-commit: 6832a9317eee280117cd695fa885b2b7a7a38daf
change-id: 20250722-mode_configure-80105fbd835d

Best regards,
-- 
Allen Ballway <ballway@chromium.org>


