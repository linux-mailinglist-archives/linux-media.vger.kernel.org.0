Return-Path: <linux-media+bounces-32557-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id BD22DAB7FCE
	for <lists+linux-media@lfdr.de>; Thu, 15 May 2025 10:08:11 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 694271BA453D
	for <lists+linux-media@lfdr.de>; Thu, 15 May 2025 08:08:24 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DA80B283FD7;
	Thu, 15 May 2025 08:08:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="VaheN2Ne"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-pg1-f180.google.com (mail-pg1-f180.google.com [209.85.215.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E6F601B6556;
	Thu, 15 May 2025 08:08:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747296484; cv=none; b=E3bWeH60Z2HSqzkYIZRrUPdcC45ymz7j1URmS195yqN92btrvwKldwRkR3lmWy5RrpAMwoWf3hExF0rrUi/c74BGSnwnj7iU6sWoX+n26Ex4IY/DBLzaQ5kbwpC+nFXVgrRjICkC30HDfmXrmIxSMVLYu+sccRK9mIEpySwthh8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747296484; c=relaxed/simple;
	bh=R/KVGnMKDcK+gtjDynfYQGjqodGkAUxKmdPll144EUU=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=rj3aP7hz4jAlhh2p9Euun6BiwZ0zFYIgvEEYQNMeXERjFovrgrlx1t5OM9pGz8Tx6/SQQGhrboVkn+ntOmlkGeibQj6YdpBtcUHOxHNOP/zKQBff/FCHbejjqTn7y1fuCJ969FMRhpiC+8z3hEQXiQoLiyDm9UgdL8RWguNYKkQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=VaheN2Ne; arc=none smtp.client-ip=209.85.215.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pg1-f180.google.com with SMTP id 41be03b00d2f7-af523f4511fso426357a12.0;
        Thu, 15 May 2025 01:08:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1747296482; x=1747901282; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=keu+4VchSued9/+AG24PWCoK8sehO/lsLQyAbCgUtRI=;
        b=VaheN2Ne4Gy+h7DSC16HPFctaSgJtU0teQK+wH1BY/DRK2Xeh0H+nodJ7B2HghJMcE
         u6S/NCohwoE+93mLRfBmaUL9ycpn2AX7lZEjf77Kz0SYuJnxUk2Ov3n0X55QaZ/kbQMm
         bnhEGwSUT/GWJwgaYu3sLp677dkiUG2ugOH5InYc1tGSqPEM2Fdi0aubae5dQ6sY/K8h
         fLj/A6ZijN6yg913zsSXHkDDgWufYe7rRrltSmjk5O30BxpvCkRVuznU/0XlcLxkYCSN
         Mvg9b4Q9AeZrb55n0dR38O755jzZQY+P/F7D+W4aldlk/40wbvKmztLSVDix6qy+DEKh
         vQEg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747296482; x=1747901282;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=keu+4VchSued9/+AG24PWCoK8sehO/lsLQyAbCgUtRI=;
        b=bi2yFn3GczE+9M9LUxNzS4fahSJkcWwHjhJQjQlq/14TYoUCFktPkOjoO+OVf9pTfq
         zd5gKLmxHFubY5j+Ov6gyPyE1eGKyGfGRs2wLWv5JQlNG5bYSV98lxTgzVAZ8ZvEfwfc
         R0yBDQcc52whcrsZHENmX+Oggq5larfDMYef3cDES0Vk8LXBpjKmjdu7eg0s6YGBQH4y
         LxBtftVNC0SVaVBDlICpkyX6eDeZbAYEotlsoC03GS6LckSSoLXbWX42nhp4ovDOWu21
         YTOfRezNe5YII3qtxFvfbIHnihOgMoHkOyOWX8RWw5ZR4D9glbRP3LiaN6e5qDfYSn0M
         IpLQ==
X-Forwarded-Encrypted: i=1; AJvYcCVCK+ycpFtQ7Ec+FZrjComiy+nAGTihtHR22H2bPzv35CpD29hM0DcfzWR7CafiD2petAgGBdcuh+y1RJs=@vger.kernel.org
X-Gm-Message-State: AOJu0YySBH8cZv8fldEbADZC00SEvHYNQtCmJmMS1oZODRgKvEs+kQpq
	LrXTeyZO/roCqBkHlg9NUdgKNrB2LNknPOFi5k+02YIq0IBkO8d+
X-Gm-Gg: ASbGncs6+ErJLwSZr18hcNUzv5RRz2gwfWp3a0272JOgcX7am6mqLn8t3CHQSjIfOej
	3t6Ql361pteVZXszIA4nXc/IK94Hc8Azov23lhetyOmiSnYioxiNoUeRo4LM9xMb9fQ0+MIXEtN
	5G9ikeZM3Qi0NEnC5Zl06ZzFHz6TrrQL5/gNDH8tWBjYEyforJLIi48rVCYM4L6RZSBw9PKJISe
	HL7YKCL1FBq9yEV6lIt21z1Eg7g1hkGc8N1GMghVJ1FE8LT3MwwvWJWAZUUT4Ans4beE+ZoID9Y
	Yy04rFpBmM49qyWBIKJWF1vEV7KCSdICE+N64CajemjaHvZpZsdXJ4kkP++ofHfOWfthtDk+BMP
	X4flqBw==
X-Google-Smtp-Source: AGHT+IEp+JVT5YKRjiEOHzb0jowwk5wu2b0QDrjaFNZU0Knjg+oMEY4CqU1Jff7joPuek0FgYMj1ZA==
X-Received: by 2002:a17:902:d492:b0:223:619e:71da with SMTP id d9443c01a7336-231982c8c7dmr93315905ad.49.1747296482079;
        Thu, 15 May 2025 01:08:02 -0700 (PDT)
Received: from visitorckw-System-Product-Name.. ([140.113.216.168])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-22fc7544f5esm111565255ad.36.2025.05.15.01.08.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 15 May 2025 01:08:01 -0700 (PDT)
From: Kuan-Wei Chiu <visitorckw@gmail.com>
To: hverkuil@xs4all.nl,
	mchehab@kernel.org
Cc: linux-media@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	jserv@ccns.ncku.edu.tw,
	Kuan-Wei Chiu <visitorckw@gmail.com>,
	Yu-Chun Lin <eleanor15x@gmail.com>
Subject: [PATCH v5] media: media/test_drivers: Replace open-coded parity calculation with parity8()
Date: Thu, 15 May 2025 16:07:48 +0800
Message-Id: <20250515080748.774526-1-visitorckw@gmail.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Refactor parity calculations to use the standard parity8() helper.
This change eliminates redundant implementations.

Co-developed-by: Yu-Chun Lin <eleanor15x@gmail.com>
Signed-off-by: Yu-Chun Lin <eleanor15x@gmail.com>
Signed-off-by: Kuan-Wei Chiu <visitorckw@gmail.com>
Reviewed-by: Hans Verkuil <hverkuil@xs4all.nl>
---
Changes in v5:
- Dropped changes to bitops.h
- Switched to using existing parity8()
- Split parity8() conversion patch out of the series

 drivers/media/test-drivers/vivid/vivid-vbi-gen.c | 8 ++------
 1 file changed, 2 insertions(+), 6 deletions(-)

diff --git a/drivers/media/test-drivers/vivid/vivid-vbi-gen.c b/drivers/media/test-drivers/vivid/vivid-vbi-gen.c
index 70a4024d461e..e0f4151bda18 100644
--- a/drivers/media/test-drivers/vivid/vivid-vbi-gen.c
+++ b/drivers/media/test-drivers/vivid/vivid-vbi-gen.c
@@ -5,6 +5,7 @@
  * Copyright 2014 Cisco Systems, Inc. and/or its affiliates. All rights reserved.
  */
 
+#include <linux/bitops.h>
 #include <linux/errno.h>
 #include <linux/kernel.h>
 #include <linux/ktime.h>
@@ -165,12 +166,7 @@ static const u8 vivid_cc_sequence2[30] = {
 
 static u8 calc_parity(u8 val)
 {
-	unsigned i;
-	unsigned tot = 0;
-
-	for (i = 0; i < 7; i++)
-		tot += (val & (1 << i)) ? 1 : 0;
-	return val | ((tot & 1) ? 0 : 0x80);
+	return val | (parity8(val) ? 0 : 0x80);
 }
 
 static void vivid_vbi_gen_set_time_of_day(u8 *packet)
-- 
2.34.1


