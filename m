Return-Path: <linux-media+bounces-38219-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id B8C9EB0E612
	for <lists+linux-media@lfdr.de>; Wed, 23 Jul 2025 00:06:11 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id A51671C27CDA
	for <lists+linux-media@lfdr.de>; Tue, 22 Jul 2025 22:06:29 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C544A28641C;
	Tue, 22 Jul 2025 22:06:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b="JnN3kkXK"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-oa1-f43.google.com (mail-oa1-f43.google.com [209.85.160.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0EB07280A5C
	for <linux-media@vger.kernel.org>; Tue, 22 Jul 2025 22:06:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753221964; cv=none; b=rhc7WeHdRWYf2Fm0zCNhNe/4igvZk02YrNwQqA1wNc4Tzi72fIatygJKZO1N+iNNukEE6USJiFw2nDIsk/hWr3Q1CXwzffYi60MrObmKVrV3PNXB1rQZXMET0BMdZc20nPY2hTsDiFQkYNgAKlf/5PHIJu4xLdtMr6WJi2zI+GM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753221964; c=relaxed/simple;
	bh=lpFJnljj6qw5DPDCllOk3KLfDdS3/fflg4syde/pRRw=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=qW1In9FQIRV0p09QD9Nnzp9UwOxJDjgr2bjon+3XpoRfcVXZtO7gktzX5Zlop5TS6iLkHgmMPaxQrEoOsziECquMevABYGyFMVGDC/CCty7FDqCKOrzu86qlttUqvdRR+XGadfxdCVfzyzH75X9mEshcUjtloP18AwI0DviJDdU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b=JnN3kkXK; arc=none smtp.client-ip=209.85.160.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Received: by mail-oa1-f43.google.com with SMTP id 586e51a60fabf-301a83477e5so2915517fac.1
        for <linux-media@vger.kernel.org>; Tue, 22 Jul 2025 15:06:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1753221961; x=1753826761; darn=vger.kernel.org;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:from:to:cc:subject:date:message-id:reply-to;
        bh=UHWF2/V5NpEgDswj8L/zqvJZDHIBpGOIkvyGm+1bSdo=;
        b=JnN3kkXK5wJik/0Dqf2HteE8s9BxXdkY5CI6uRQAotFF4mdwjs9H4EIAX6BI0R4DRl
         nC6li6sTJbr2O3JhgIMkY9N3Wm/da38/ddbFpy1jDZDcXFsYUdBy+zgr8BH/JeEpaLQv
         3FUWGQri0SL9dj1HA8dyvcNdQyXEVSAKJ5XJz0od4YD86UVrdViPf3A1UIbOgIB9CEQm
         buGOr3XZKMJjy8/nIx7vrUk60oZeB3zZu68SSX3FgoggmeRhTOulgW9P9gPE8zHCetPo
         VuyqeuxFlwpLg5Zo4zDTzsFuo9//sLck6i9Xh1Szzoo9aHKs4u2K94Iy5Lx3sQfj9waz
         c5+Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753221961; x=1753826761;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=UHWF2/V5NpEgDswj8L/zqvJZDHIBpGOIkvyGm+1bSdo=;
        b=Yg2Lp9nRCG80FmN5l3EdBrviQLfXWx3FtygNmpiC+MAfevgknwAmy/oGus5vaz3dRs
         g61Jk+FidIpZBdLhQz4HLSv1Rlfaigi8/5W86hz90YZ0Gu23MrW4ag9Is98S4M+Zgb8Q
         a+uAuAj9dLqV5MUuhiGu33TMKjzBaDGvY2KuqghPgLAOYBbJnK2491Ij+lPYzQcT5xsh
         fx/FeZ4C3jUeBTUxrMIH2lagcw8pbm/1Qr22eJh3KLBthDx+g+vQ0h1Wp3qW4B0iFgi4
         jvM9i+GTZ4pfRTSqTS8+bvbWSuZit3qrRQBJ7pPzqqJEB2VudCFz420bJK8me2CbFM03
         PRVA==
X-Gm-Message-State: AOJu0YwaQgLZzDpuwqLWl7aM7N58GPg7RSeFPMvQVzlGBE4mTUmiAkOx
	CoxVbjrPBAHpAxQtpyJ5ahw1nHMjIngSrSwlvw6HoNxl25xjT26KFhLesMHPwswgG58=
X-Gm-Gg: ASbGncvJhpQsChKPds4FO6KJi/yCOyMx/ZRXOle+f2CmY5mmwqq/i9jM3HpG5NAU6Lt
	3wi4zDvVi37RL0qbivA1U7PLOQSAQcafLiSM8bXun4yVEKRQ/Z6d9sFYr5U6RFfFqkp4ElCAMTF
	iUCOAXQ3uAeBuk+7JHPBi3Y7vsn4TsOqvxLwNjFZ4QPAwsVPJ8KkUZ1x1/VmwzJMVagROf17c1t
	eZD2yApQDalfejd3JeY2fjNtTQaLd24gjTS62jR3yMyiEsn7oM+fsjlyx9dfn5zTXlVFMBB4JqQ
	45yBsPwIO6sRAWIgqe5dgAjwadEQ3U+9jMUvUlDkaC9Y2mAWgH4/pbDcJM7PUbnNirmm4e3kCs9
	cR9tBszUGQE1ECWNcsIkwbEiREGMa/Wl4Vx7ciQ==
X-Google-Smtp-Source: AGHT+IG8AZUaOOthsN+h4ZByvI4M5G8r0CxEn7gVrJrhlLHm1ZIS6+SECI89whk6IPjJs2cOzTYtUg==
X-Received: by 2002:a05:6870:d24b:b0:2ff:a802:6885 with SMTP id 586e51a60fabf-306c6fb8174mr511708fac.11.1753221960919;
        Tue, 22 Jul 2025 15:06:00 -0700 (PDT)
Received: from [127.0.1.1] ([2600:8803:e7e4:1d00:11dd:c0f5:968d:e96])
        by smtp.gmail.com with ESMTPSA id 006d021491bc7-615bcda2865sm2191120eaf.26.2025.07.22.15.05.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 22 Jul 2025 15:06:00 -0700 (PDT)
From: David Lechner <dlechner@baylibre.com>
Date: Tue, 22 Jul 2025 17:05:46 -0500
Subject: [PATCH] media: pci: mg4b: fix uninitialized iio scan data
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250722-media-pci-mg4b-fix-uninitialized-iio-scan-data-v1-1-5b236115264a@baylibre.com>
X-B4-Tracking: v=1; b=H4sIADkLgGgC/x2NwQrCQAwFf6XkbKAbWor+iniIm1gf2G3ZbUUs/
 XcXj3OYmZ2KZ3ihS7NT9jcK5lQhnBqKT02jM6wySSt9O4jw5AblJYKnsbvzAx/eEhJW6AtfNwZ
 mLlETm67KYtFDP3QW/Ew1umSvyn94vR3HDxp/4C2AAAAA
X-Change-ID: 20250722-media-pci-mg4b-fix-uninitialized-iio-scan-data-2dce1574d1e9
To: Martin Tuma <martin.tuma@digiteqautomotive.com>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>, 
 Hans Verkuil <hverkuil@xs4all.nl>
Cc: linux-media@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Jonathan Cameron <jic23@kernel.org>, 
 =?utf-8?q?Nuno_S=C3=A1?= <nuno.sa@analog.com>, 
 Andy Shevchenko <andy@kernel.org>, linux-iio@vger.kernel.org, 
 linux-kernel@vger.kernel.org, David Lechner <dlechner@baylibre.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1109; i=dlechner@baylibre.com;
 h=from:subject:message-id; bh=lpFJnljj6qw5DPDCllOk3KLfDdS3/fflg4syde/pRRw=;
 b=owEBbQGS/pANAwAKAcLMIAH/AY/AAcsmYgBogAtAZJN3Fu2i8eNt5P0L9WthmCBSa/IDvl7pN
 7pgwzYaa/aJATMEAAEKAB0WIQTsGNmeYg6D1pzYaJjCzCAB/wGPwAUCaIALQAAKCRDCzCAB/wGP
 wMNOB/9jWyieuoXD5wmD38r6ar6s1K0cEqX9t/aCwGb+i/jdZqwTzjKHaI9vTuKHG5nXCk2G1DM
 OL3OIES+c0pNaZ+RdYR47Q9XE4YxaKXJCm1epGD8idJQAZzYSOVJF/znQdUwXaO673j9A88c3R8
 XhxT+9E5Q88BacHK65JYD+7HsICElpMrWV+g9CHqa0omWlbHg8qQG/GUe9hviScICLqCi5kcUmT
 4FVdDK5iX0eVZmuQbrfn68LEe/HOWcR93OyyKMCpUD8j3tPxMz0USutdawDigZEqwC1oBnEt4kJ
 ENMY6IhLrJOrLpW5c+yqhY9nFNwkq9XEvdNNySK36BjGWjLY
X-Developer-Key: i=dlechner@baylibre.com; a=openpgp;
 fpr=8A73D82A6A1F509907F373881F8AF88C82F77C03

Fix potential leak of uninitialized stack data to userspace by ensuring
that the `scan` structure is zeroed before use.

Fixes: 0ab13674a9bd ("media: pci: mgb4: Added Digiteq Automotive MGB4 driver")
Signed-off-by: David Lechner <dlechner@baylibre.com>
---
 drivers/media/pci/mgb4/mgb4_trigger.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/media/pci/mgb4/mgb4_trigger.c b/drivers/media/pci/mgb4/mgb4_trigger.c
index 923650d53d4c82e87b542f87c3a0fbf6170dadc8..d7dddc5c8728e81c6249b03a4cbf692da15a4ced 100644
--- a/drivers/media/pci/mgb4/mgb4_trigger.c
+++ b/drivers/media/pci/mgb4/mgb4_trigger.c
@@ -91,7 +91,7 @@ static irqreturn_t trigger_handler(int irq, void *p)
 	struct {
 		u32 data;
 		s64 ts __aligned(8);
-	} scan;
+	} scan = { };
 
 	scan.data = mgb4_read_reg(&st->mgbdev->video, 0xA0);
 	mgb4_write_reg(&st->mgbdev->video, 0xA0, scan.data);

---
base-commit: cd2731444ee4e35db76f4fb587f12d327eec5446
change-id: 20250722-media-pci-mg4b-fix-uninitialized-iio-scan-data-2dce1574d1e9

Best regards,
-- 
David Lechner <dlechner@baylibre.com>


