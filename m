Return-Path: <linux-media+bounces-38218-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 68FB1B0E508
	for <lists+linux-media@lfdr.de>; Tue, 22 Jul 2025 22:36:17 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 15B863BD5B4
	for <lists+linux-media@lfdr.de>; Tue, 22 Jul 2025 20:35:48 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 711D82853E5;
	Tue, 22 Jul 2025 20:36:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="WjdYQDiB"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-pl1-f175.google.com (mail-pl1-f175.google.com [209.85.214.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 786F027E7DD
	for <linux-media@vger.kernel.org>; Tue, 22 Jul 2025 20:36:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753216569; cv=none; b=jV+a8maksuTFuQJ84tctY1PIrmyoISF72B2iACBAa+CiUxt/Dl84NrT3CYH/HHPPX92dbkglNKz3CPT1SbHFZ+bC3VhiP3RX4ldHJu70k5hTO0oVT6P7V42eSsgXuVLhtcqAi1N8FNYhA8qqKlSSw3/TdszK/LgrZEan8/WZ+VA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753216569; c=relaxed/simple;
	bh=8bxoz11IclHWwjha5/jlpRbpgbpr8raTeUpA7+6w/j0=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=Ix9DHWg7XZcmVHY6cEhPUj15p6sllGmjSjd+WsfKxSHd6v5llaIBRWWU/KZXFcohA9/UnuWoxt8Bv57WdoB/dUb8Tw2ofYM3rd5UG3zty0T23GGIba8wl1at1R3encRflzqRAAa1i8i+ga/fmOmvk2L71pPU3a5abcsiz20Ve9E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=WjdYQDiB; arc=none smtp.client-ip=209.85.214.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Received: by mail-pl1-f175.google.com with SMTP id d9443c01a7336-234d3261631so48761455ad.1
        for <linux-media@vger.kernel.org>; Tue, 22 Jul 2025 13:36:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1753216567; x=1753821367; darn=vger.kernel.org;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:from:to:cc:subject:date:message-id:reply-to;
        bh=7Fwnd8+rlpdsPWzSX90R7aWBxNlk9l7Bj+L/1PupwCc=;
        b=WjdYQDiB92cR9AruDl2lkyk9gryK8tDF7kOGF93H1KdIQYVkO9HqeOFuegd2fkZSvf
         8QkHKYW/foizIqssLnEQns+m+ftqa0ecaHdOiivyCzKxcxd69/LKu26apT2BQrT8uaWv
         NuQR+VHIMkfH27xcemTbEAgjGETDWwDjPjwyI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753216567; x=1753821367;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=7Fwnd8+rlpdsPWzSX90R7aWBxNlk9l7Bj+L/1PupwCc=;
        b=owOIDX9OPUb3M/Yy6K+W/mGRwnfXGswHxaaCD7RRkRkc/EJMPFnaXs0solllBKQszk
         1C6EqDrZcalV3hPZCF3jsOcIz5TnofBie5J15kipPCW3dDu9h8oxSMmXa7NxIljI3iEf
         KhlBJ6PCT/TwNrgrlgri4QZU317Nm7L2akfTNKZCh4MF9oMRTFSk1SIFmurPPaB3RLmK
         n/T/m52i0BmAlaj6lSdOuIPVQ6VCHmtcrEeyAjKsJ58pnh3M2KGlAdba3spcVhMEQ1Ba
         B+DGE/PTP3MuawS2qZ430oIm0kcfy1SDZxeOtNpueO5DcHyKMzI/bs0NiASZmtNhROjI
         1iLA==
X-Gm-Message-State: AOJu0Yzv+3FiqwVmnbiggkpvYjjzLw5aLgIOi0FxL4q8a077O8CmG65c
	KPJzvvmRjzNnuXc1Q08goMSg1ErhTltcJW5ZGoANecWhQpfaVvbgWrgq2oYsAi1g4bUIm807Is5
	S++A=
X-Gm-Gg: ASbGncuPtqNfzlaAl94non9/SQDCttQimvTyd2C0c6wquJN7uYr4vwyQohMktccEBAx
	a79UuRCIhIUL0ANDA6ikSpGhMUTvts/E3WLy5GiECXAnTwbBm5y+eeBKMU4zKvE/5eJ75SzZC0v
	33YmpbErvw5YxwfSqlXLlxfB4vNsC5qk3aWeWZKPKfhDiIi09NBqNcyGgXcux7Lv3l4UynYFvGx
	FBaLDcjybFyR65tUdWGyuykpawr+ZhubKjliE67m7kgioanMlbi1Dd1UeVpts8bZ0dv3wVPqitV
	PXLbgmtKI7YqxW1mzV/QtVxWdsO8oRl81oecZfA+bQ0h3u0HQoGCboSHUaZpau39h2MaxrY1eOt
	L0tB5MO/81Z9XlJmd7GYzFYL1DIEiSC9fgeTd/KZUPu0krpY=
X-Google-Smtp-Source: AGHT+IFsAM+0JFqi5v2GadpRvqr/FUdYl9fpGwYmPAtyAQxHuYzzs2yAOgbD4ESE29lV23bc2w2r2g==
X-Received: by 2002:a17:903:faf:b0:236:15b7:62f6 with SMTP id d9443c01a7336-23f982036a4mr4849565ad.34.1753216567319;
        Tue, 22 Jul 2025 13:36:07 -0700 (PDT)
Received: from ballway23.roam.corp.google.com ([136.27.48.153])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-23e3b5e2cfasm82211765ad.30.2025.07.22.13.36.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 22 Jul 2025 13:36:06 -0700 (PDT)
From: Allen Ballway <ballway@chromium.org>
Date: Tue, 22 Jul 2025 13:35:43 -0700
Subject: [PATCH] media: ov8865: move mode_configure out of state_configure
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250722-mode_configure-v1-1-5ea35052a01f@chromium.org>
X-B4-Tracking: v=1; b=H4sIAB72f2gC/x3MQQqAIBBA0avIrBPUkKSrRETpaLNIQykC6e5Jy
 7f4v0LBTFhgZBUy3lQoxQbZMbD7GgNycs2ghNJiUIofyeFiU/QUrozcCCm035zptYMWnRk9Pf9
 wmt/3A0nt4RlgAAAA
X-Change-ID: 20250722-mode_configure-80105fbd835d
To: Hans de Goede <hansg@kernel.org>, 
 Sakari Ailus <sakari.ailus@linux.intel.com>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: linux-media@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Allen Ballway <ballway@chromium.org>
X-Mailer: b4 0.14.2

ov8865_mode_configure() only needs to be called on sensor init, but it can
be called multiple times from ov8865_state_configure(). Move
ov8865_mode_configure() to ov8865_sensor_init().

Signed-off-by: Allen Ballway <ballway@chromium.org>
---
 drivers/media/i2c/ov8865.c | 15 +++++++--------
 1 file changed, 7 insertions(+), 8 deletions(-)

diff --git a/drivers/media/i2c/ov8865.c b/drivers/media/i2c/ov8865.c
index 95ffe7536aa6aba814f4e5c3d12e7279470b2f07..1d1a1f261bf4ab5c09848402dc057e2f572504e7 100644
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
@@ -2384,6 +2376,13 @@ static int ov8865_sensor_init(struct ov8865_sensor *sensor)
 	}
 
 	/* Configure current mode. */
+	ret = ov8865_mode_configure(sensor, sensor->state.mode,
+				     sensor->state.mbus_code);
+	if (ret) {
+		dev_err(sensor->dev, "failed to configure mode\n");
+		return ret;
+	}
+
 	ret = ov8865_state_configure(sensor, sensor->state.mode,
 				     sensor->state.mbus_code);
 	if (ret) {

---
base-commit: 6832a9317eee280117cd695fa885b2b7a7a38daf
change-id: 20250722-mode_configure-80105fbd835d

Best regards,
-- 
Allen Ballway <ballway@chromium.org>


