Return-Path: <linux-media+bounces-31825-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 29C17AABD95
	for <lists+linux-media@lfdr.de>; Tue,  6 May 2025 10:44:08 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 3AC081C22D65
	for <lists+linux-media@lfdr.de>; Tue,  6 May 2025 08:44:20 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8DBB324A04A;
	Tue,  6 May 2025 08:44:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quanta-corp-partner-google-com.20230601.gappssmtp.com header.i=@quanta-corp-partner-google-com.20230601.gappssmtp.com header.b="DoYJ0LMp"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-pl1-f169.google.com (mail-pl1-f169.google.com [209.85.214.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2F44A21770C
	for <linux-media@vger.kernel.org>; Tue,  6 May 2025 08:43:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746521040; cv=none; b=Tr4L6sI4p0fTOKnQRxWAqFyYLmgo/8n3wSnFEfTVBL/Pt9pNuU6N0VXsAilUY7UlXHlNsmg+UaX3pF68GpUHz03AkE5jW729prJf8MwE04XHEJbpiEgNh4RIVG4wRj4SfDixPkTEznkp0hwESSR+8n6yLSfYGEYa/izU/0h+GCY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746521040; c=relaxed/simple;
	bh=GDqdWLvUxQ5sZaZpzIINaEq6cjYVuEXEjYzDVGeYBXQ=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=RA6OdiYonvaTXkPnFK6rYJ6OTKqrZperRQKEfetqBMUUsJCV1gFTE1BuhpmISz+2ZPr0kNRvtQyWaf0xMvxyaL5SBSyadPAlF8bkJmLVRWmRAteZ48bvOY+z6rao2dAhwLxaWP9yLidEZwu54vTH9+3QHcNqfLuXfIaIcftfcEs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=quanta.corp-partner.google.com; spf=pass smtp.mailfrom=quanta.corp-partner.google.com; dkim=pass (2048-bit key) header.d=quanta-corp-partner-google-com.20230601.gappssmtp.com header.i=@quanta-corp-partner-google-com.20230601.gappssmtp.com header.b=DoYJ0LMp; arc=none smtp.client-ip=209.85.214.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=quanta.corp-partner.google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quanta.corp-partner.google.com
Received: by mail-pl1-f169.google.com with SMTP id d9443c01a7336-22e033a3a07so55652705ad.0
        for <linux-media@vger.kernel.org>; Tue, 06 May 2025 01:43:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=quanta-corp-partner-google-com.20230601.gappssmtp.com; s=20230601; t=1746521038; x=1747125838; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=GW2TmlIZufkROHQCZxMHYL6iXxykJ3m3xvGeglUqwWM=;
        b=DoYJ0LMph9MMkSy37BTvoBvuhTNDoZPZMWCWFj0B/8yLgye0BnWbpDWhLHLYh9KsKh
         D6XbhpVXm/Mmzrx4eUETKROJXR2F9PCiPmnQnR6FwWogLTws68l+Q36i9hs9+cCByffF
         sb4nFMzrMK0xDSUxLkY2hWHVVaHVYLBoaaZhJkR6cX7T3o+9R19E0G4IL2E+O8gjOPEp
         R85f8wo66ozgROtwN/8ycvJbVnrm4uR7qpiaFezGWojzFaIPDo3Zt2HaDQSnDKuzSiQP
         sPjotTUAJhPuCIKxrgZ16qbdGdM7N7k2w9VHuOOPQGlT4sNG2vmqyYS6Rs6Q+TzB+CIz
         PCBA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746521038; x=1747125838;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=GW2TmlIZufkROHQCZxMHYL6iXxykJ3m3xvGeglUqwWM=;
        b=QelHKbxPUNXHZm12iDh1y0Jk3l+QoNrH7wHB9SO0IwQbaOVqV+FDdH9SozrJEAmVex
         r/0iXIDUEH6XXEO+f7NEeTj18r+1E4d0HNiKLiVlhAZo7mVigSaAad1LHwlaW9tCYhDg
         smGL6KQLs3fSdhimpjdYleyuD16sOZGCymwJ0hWJ8I64XpIz56BWn9YRsKtQ4WLZIppm
         wT+OJhPBQBSHzt1+SWoam+nbCsO0x7U7M8bs5fmcfOZ5+4EBk0aXKu4IGMkXn60ZO1Cz
         WrnHCS4GLHzUONsWzldBMZWWb0bdyOxEGN1Nc8r1ue6WCEUGquqrsRZE7l34wLd3BEDS
         NQEg==
X-Forwarded-Encrypted: i=1; AJvYcCXTbC7N9x1BO+2CJPGmEH4v3WuDs3d+/MHjaxx4T4h+u1hbNlb8Q+uGrdQviYgdKH7b8AOsveWtLHDimw==@vger.kernel.org
X-Gm-Message-State: AOJu0Yz4qPuZgQkVcY+aHHhXxShVM0zLaSt7wYYxhPYZ4hQuyDKbVH3O
	qYY1TqyWM8H0iL7qAd1Bcx4kI84EnD2QXk4N9dYsA0MMnxS5Q2sNkVzIAUhDTJuD5QNC2JlLHtf
	QPpg=
X-Gm-Gg: ASbGncuGxBU1mTuL9K4BELDKZRc8DP1clwCMK8n2asK6rGz7/etpvx4/92m7LktQHcv
	qgIWbAP+xQy1jNxuty9mT7D809q5bt6I1WvNJIB6kK0SUqXMtcLOBJG59acKnYwoLMoCyHT/zku
	AMIPfzmTLW0EftkAlTITidPF8e0/sIvaWOfgCliWG7PrYQNYzgrauP7oACLs2h2FATmWnB93Tpi
	duz2QHONI0YoW2w6HTZqw/q9T4buov6L0zDK0c7Lo/Wom8OzHMWc6P8lujt4IkSX4Ztl4eUekLx
	3DsoQ5573ZUBfBpWRr7zqceZ8zPfxR0Hej0RfNDumWsNSPiLXY8E087hmHf6pFsTLwZ3rVZ0EHB
	w4ONFJIb0PCzFjUyGwfmQfW3DPgOx6ZM+39kpjoZ+JGqBPlpR
X-Google-Smtp-Source: AGHT+IFk3mHr2xZ6xTjxZ/wIRc618+Ar69pkMBFg8cgeJ5yWmwYmGkUh27jGm4sfdv0XmyOg5nKHEg==
X-Received: by 2002:a17:902:dacc:b0:22e:17ac:9dd8 with SMTP id d9443c01a7336-22e3633a6b8mr29134445ad.29.1746521038464;
        Tue, 06 May 2025 01:43:58 -0700 (PDT)
Received: from kells-Predator-PTX17-71.lan (211-75-10-161.hinet-ip.hinet.net. [211.75.10.161])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-22e1522f1d7sm68406215ad.222.2025.05.06.01.43.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 06 May 2025 01:43:58 -0700 (PDT)
From: Kells Ping <kells.ping@quanta.corp-partner.google.com>
To: LKML <linux-kernel@vger.kernel.org>
Cc: groeck@chromium.org,
	Kells Ping <kells.ping@quanta.corp-partner.google.com>,
	Benson Leung <bleung@chromium.org>,
	Hans Verkuil <hverkuil@xs4all.nl>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	=?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <u.kleine-koenig@baylibre.com>,
	chrome-platform@lists.linux.dev,
	linux-media@vger.kernel.org
Subject: [PATCH] [v2] media: platform: cros-ec: Add Dirks to the match table
Date: Tue,  6 May 2025 16:43:02 +0800
Message-Id: <20250506164224.1.Ica91496a34ad5c3f9330c1a7992f10eea10e471d@changeid>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The Google Dirks device uses the same approach as the Google Brask
which enables the HDMI CEC via the cros-ec-cec driver.

---

Changes in v2: update ports
native driver cec is port 0.
bitbang driver cec is port 1.

Signed-off-by: Kells Ping <kells.ping@quanta.corp-partner.google.com>
---
 drivers/media/cec/platform/cros-ec/cros-ec-cec.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/drivers/media/cec/platform/cros-ec/cros-ec-cec.c b/drivers/media/cec/platform/cros-ec/cros-ec-cec.c
index 12b73ea0f31d..81b4524c69f4 100644
--- a/drivers/media/cec/platform/cros-ec/cros-ec-cec.c
+++ b/drivers/media/cec/platform/cros-ec/cros-ec-cec.c
@@ -298,6 +298,7 @@ struct cec_dmi_match {
 static const char *const port_b_conns[] = { "Port B", NULL };
 static const char *const port_db_conns[] = { "Port D", "Port B", NULL };
 static const char *const port_ba_conns[] = { "Port B", "Port A", NULL };
+static const char *const port_ab_conns[] = { "Port A", "Port B", NULL };
 static const char *const port_d_conns[] = { "Port D", NULL };
 
 static const struct cec_dmi_match cec_dmi_match_table[] = {
@@ -329,6 +330,8 @@ static const struct cec_dmi_match cec_dmi_match_table[] = {
 	{ "Google", "Dexi", "0000:00:02.0", port_db_conns },
 	/* Google Dita */
 	{ "Google", "Dita", "0000:00:02.0", port_db_conns },
+	/* Google Dirks */
+	{ "Google", "Dirks", "0000:00:02.0", port_ab_conns },
 };
 
 static struct device *cros_ec_cec_find_hdmi_dev(struct device *dev,
-- 
2.34.1


