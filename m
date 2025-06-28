Return-Path: <linux-media+bounces-36152-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 2E776AEC9B1
	for <lists+linux-media@lfdr.de>; Sat, 28 Jun 2025 20:16:07 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 3D18C1BC08E2
	for <lists+linux-media@lfdr.de>; Sat, 28 Jun 2025 18:16:15 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2B3BA1E04AC;
	Sat, 28 Jun 2025 18:15:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="UUQgR3HR"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-qt1-f181.google.com (mail-qt1-f181.google.com [209.85.160.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C5B8D1AA1F4
	for <linux-media@vger.kernel.org>; Sat, 28 Jun 2025 18:15:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751134541; cv=none; b=RYYDe1rnv4q+0pcXJaA/sMyG/PPbK8U5jC0Zqh6WWaiGDA500pI5nBIjKQwbqv5qPiB8JCfrbxrg7q6cWJ8fHZnXGlV21m8AE9ZkppMy+lV/Xh7Yp1QhqaBOQYr4OaOtRddqDlrIdiUjBC6olMvboSRKlNaqBbk1k5VfjiSwJWY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751134541; c=relaxed/simple;
	bh=E4plUyCSI3k6l2mc6OVyIDEg2o/aLZqtXrmCeA+EOe8=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=ljrJN8iGGELZGCXVQ5DDyHpe38zTl6yedBEZZ1W4j5TzVjmpwWFKG+fSNLatBTMeSDXmCLAYNrTi4B25SihDm3AnteFw1xYg9xtyZNB3iWJR2N4wWEgaMTwaEUbCepsp4013UXuhigG/DJb9Mtc+9ehmRhqabi7ZZ+VBCqo2vuE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=UUQgR3HR; arc=none smtp.client-ip=209.85.160.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-qt1-f181.google.com with SMTP id d75a77b69052e-4a44b3526e6so41236381cf.0
        for <linux-media@vger.kernel.org>; Sat, 28 Jun 2025 11:15:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1751134536; x=1751739336; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=3iwNAdFnvuqB0Dm2t3yhmssxKeJwx9Ii5rUOi2V7+AQ=;
        b=UUQgR3HR27PoE7aiUNXftt24gLYlrPZSSVSROjSH+3ago6OdMmL2UHO0Pk/2g+ffXb
         5LYFl67CnM+c7VTOswJT8ssO+35f1jkkzb2D/Skem4YWYhA1xhVQsJkQ88RKWySThdZW
         1nz9UtKgAqBKTrVJCjkPsLwHPUy+w79InGIdZObh1e0fWgLBU6W9VSe2TRhGMjf44wAP
         zuL9XjjgUhTF7Im8rlgzsaBxD3emYkK6MGbnvsLal091qRrSxmxjy/cg0hYU3PdwR92H
         qRAC1V2akEKHX4fR9S+nlv8By0KoFA+JygDtnWoks+nRsWTkDaaDf006pZJ06gzDFXP7
         bWpg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751134536; x=1751739336;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=3iwNAdFnvuqB0Dm2t3yhmssxKeJwx9Ii5rUOi2V7+AQ=;
        b=W/Y/I1H+ZLva7C43I6SzeABXChp5sReOIpbfdBgCABEE3RcXIs+AmHV9HVoFRtsfSq
         V1LwElnl8+oCqHqr+QMhQFrxlvLMfvaeZ4lBttptXn/clugc06EgXge+khFBx40ehhAW
         VVk9CMjyxO3f1yvuoenu0/3wC6PZPDneI9ByHkLMgwSzYCmgk1P7NWZF5y/uDZFDDGTm
         pYSv2bcSzkuQsxlt5mETKuhb7CezUIbpHuty0HYBPfJM9ClhmWJKO1dZ5q2P0YsfkPMs
         uX/Rz+vGqEZ+UXUMUQXJMpY+rPiiMBDdrpEVUWqYqIqMMQjMCgAW35PR5hAGpozJ/3h4
         qEbw==
X-Forwarded-Encrypted: i=1; AJvYcCVDI2Vbnvd/DwjmUg4D66I9dy+XrSEQPjv89EsccLByIzR+r6JpCArp7cWim6QX4F3wo4X7608M/tFS5g==@vger.kernel.org
X-Gm-Message-State: AOJu0YybJiWuwqeBiXuYpk8MWIwAlekIjB6mJed6Ai7eSHpnaEuzZP2K
	fuk3MP2T9UlHm0SyBRMgb1y1eKeMFH7iSiT4OS6t0NsHNH4qZNXkeoIAcGcyIA==
X-Gm-Gg: ASbGnctB+pkRtqpwF3rxTZJluT4PZtAt65XKgFJcpggdls9diJyYnaNYhneQZE4l7z7
	gQma+OIbaGEbmI/xZD7kFU1bwiQVnE1mKmMhjfPyZNoEv0+dXTuWNLtV7g3CacorXAVsczC5ZTo
	UzIfBQULEAyfU5GA0WCC7wq8ThueH5PCBtBWER0u0csHwi4SaMCYIRs5/29KES/KCvh7PEmOKhM
	N4cfD8bIutMm7Gv/yGriyQFff01G7/iOC+soVqF0IuZtI2nySru3S0wKFV4dBiI+ism8rE2d/aY
	T/Yf5ZbfQnxHrdm5clCok74DHFWJanMsiKTx+xHeeasy9MndkaQl
X-Google-Smtp-Source: AGHT+IFOL3PhkQVhgQ4MlUdX9oMHRrFBkN+W8v+jXh8P8bvB644GDtb5pN0gmAZhS5tpSWDLYJmYdw==
X-Received: by 2002:ac8:7d95:0:b0:4a7:7f3b:d922 with SMTP id d75a77b69052e-4a7fcaf3b4cmr103426161cf.45.1751134536207;
        Sat, 28 Jun 2025 11:15:36 -0700 (PDT)
Received: from fushigibana ([2601:405:4a00:186f::cc2])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-4a7fc55c644sm32178161cf.44.2025.06.28.11.15.35
        for <linux-media@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 28 Jun 2025 11:15:35 -0700 (PDT)
Received: from pnariyoshi (uid 1000)
	(envelope-from pedro.nariyoshi@gmail.com)
	id c5f94
	by fushigibana (DragonFly Mail Agent v0.14 on fushigibana);
	Sat, 28 Jun 2025 14:15:34 -0400
From: Pedro Nariyoshi <pedro.nariyoshi@gmail.com>
To: Hans Verkuil <hverkuil@xs4all.nl>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Benson Leung <bleung@chromium.org>,
	Guenter Roeck <groeck@chromium.org>,
	linux-media@vger.kernel.org,
	chrome-platform@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Mr Chromebox <mrchromebox@gmail.com>
Cc: Pedro Nariyoshi <pedro.nariyoshi@gmail.com>
Subject: [PATCH] media: cros-ec-cec: Add Fizz board variants, so driver can detect them
Date: Sat, 28 Jun 2025 14:14:35 -0400
Message-ID: <20250628181530.873795-1-pedro.nariyoshi@gmail.com>
X-Mailer: git-send-email 2.49.0
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

I recently reflashed a Chromebox (Wukong variant of the Fizz board) with
coreboot and I noticed that the cec driver refused to load with a bit of
tinkering, I realized that the dmi_match_table was expecting the product
name to be Fizz, but `dmidecode` reports `Wukong` as the product name. I
am not sure if this is the best approach, but adding this patch lets me
load the driver and it works properly.

Alternatively, we could instead match the DMI_PRODUCT_FAMILY, instead of
DMI_SYS_VENDOR and DMI_PRODUCT_NAME. In my board at least, that says
"Google_Fizz".

I am open to suggestions for alternative solutions and I hope I did't
break any rules (this is my first kernel patch). (And sorry for the
previous submissions with errors in the subject line)

Signed-off-by: Pedro Nariyoshi <pedro.nariyoshi@gmail.com>
---
 drivers/media/cec/platform/cros-ec/cros-ec-cec.c | 9 ++++++++-
 1 file changed, 8 insertions(+), 1 deletion(-)

diff --git a/drivers/media/cec/platform/cros-ec/cros-ec-cec.c b/drivers/media/cec/platform/cros-ec/cros-ec-cec.c
index 419b9a7abcce..a26473c3cd84 100644
--- a/drivers/media/cec/platform/cros-ec/cros-ec-cec.c
+++ b/drivers/media/cec/platform/cros-ec/cros-ec-cec.c
@@ -302,8 +302,15 @@ static const char *const port_ab_conns[] = { "Port A", "Port B", NULL };
 static const char *const port_d_conns[] = { "Port D", NULL };
 
 static const struct cec_dmi_match cec_dmi_match_table[] = {
-	/* Google Fizz */
+	/* Google Fizz and variants*/
 	{ "Google", "Fizz", "0000:00:02.0", port_b_conns },
+	{ "Google", "Bleemo", "0000:00:02.0", port_b_conns },
+	{ "Google", "Excelsior", "0000:00:02.0", port_b_conns },
+	{ "Google", "Jax", "0000:00:02.0", port_b_conns },
+	{ "Google", "Kench", "0000:00:02.0", port_b_conns },
+	{ "Google", "Sion", "0000:00:02.0", port_b_conns },
+	{ "Google", "Teemo", "0000:00:02.0", port_b_conns },
+	{ "Google", "Wukong", "0000:00:02.0", port_b_conns },
 	/* Google Brask */
 	{ "Google", "Brask", "0000:00:02.0", port_b_conns },
 	/* Google Moli */
-- 
2.49.0


